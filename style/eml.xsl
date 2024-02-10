<?xml version="1.0" encoding="utf-8"?>
<!--
  *  '$RCSfile: eml.xsl,v $'
  *      Authors: Matt Jones
  *    Copyright: 2000 Regents of the University of California and the
  *               National Center for Ecological Analysis and Synthesis
  *  For Details: http://www.nceas.ucsb.edu/
  *
  *   '$Author: obrien $'
  *     '$Date: 2008-08-28 22:59:33 $'
  * '$Revision: 1.8 $'
  *
  * This program is free software; you can redistribute it and/or modify
  * it under the terms of the GNU General Public License as published by
  * the Free Software Foundation; either version 2 of the License, or
  * (at your option) any later version.
  *
  * This program is distributed in the hope that it will be useful,
  * but WITHOUT ANY WARRANTY; without even the implied warranty of
  * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
  * GNU General Public License for more details.
  *
  * You should have received a copy of the GNU General Public License
  * along with this program; if not, write to the Free Software
  * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
  *
  * This is an XSLT (http://www.w3.org/TR/xslt) stylesheet designed to
  * convert an XML file that is valid with respect to the eml-dataset.dtd
  * module of the Ecological Metadata Language (EML) into an HTML format
  * suitable for rendering with modern web browsers.
-->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fn="http://www.w3.org/2005/02/xpath-function" xmlns:eml="https://eml.ecoinformatics.org/eml-2.2.0" version="1.0">
  <xsl:import href="emlroot.xsl"/>

  <xsl:output method="html" encoding="UTF-8"
              doctype-public="-//W3C//DTD HTML 4.01 Transitional//EN"
              doctype-system="http://www.w3.org/TR/html4/loose.dtd"
              indent="yes" />

  <xsl:template match="/">
    <html>
      <head>
        <title><xsl:value-of select="./eml:eml/dataset/title"/></title>
        <style>
        #header,html>body #header{height:60px;min-width:800px}#banner,#header,body{background-color:#fff}#banner,#left_logo{background-position:top left}#banner,#left_logo,#right_logo{background-repeat:no-repeat;voice-family:"\"}\""}#banner,#header,#left_logo,#left_sidebar,#right_logo{voice-family:"\"}\""}#content,#header,.onehundred_percent{width:100%}#left_sidebar,#right_sidebar{top:0;margin:0;padding:0;border:0;background-color:#036}#footer,#right_logo{position:absolute;right:10px}#debug,#footer{bottom:0;left:167px;margin:0 10px 10px 177px}body,dl,dt,li,ol,ol ul,p,p dl,p ol,p ul,ul{font-style:normal;font-weight:400;text-decoration:none}body,pre{text-decoration:none}h3,h4{margin-bottom:0}body,td{max-width:900px}.fortyfive_percent,.group_border,tbody{display:block}#search-box_right,label{text-align:right}@page{size:8.5in 11in;margin:5%}body{margin:0;padding:0;border:0;font-size:14px;font-family:Arial,sans-serif;color:#444}.group_border,table,tbody,tr{max-width:100%}body>div img{padding:0}#content_wrapper{margin:0 10px 10px}#header{padding:0;border:0;voice-family:inherit}html>body #header{width:auto}#left_logo,html>body #left_logo{width:99px;height:100px}#left_logo{position:absolute;top:5px;z-index:2;left:10px;margin:0;padding:0;border:0;background-image:url('images/sbclter-logo.gif');voice-family:inherit}#right_logo,html>body #right_logo{width:223px;height:60px}#right_logo{top:0;margin:0;padding:0;border:0;background-image:url('images/sbclter-coastal-header.jpg');background-position:top right;voice-family:inherit}#banner{margin:0 0 0 110px;padding:0;border:0;voice-family:inherit}div.header-title{position:absolute;top:5px;left:110px;color:#036;font-size:26px;font-family:serif;font-style:normal;font-weight:800}div.header-subtitle{position:absolute;top:40px;left:115px;color:#066;font-size:12px}div.header-menu{position:absolute;top:60px;width:100%;z-index:1;border-top:1px solid #066;border-bottom:1px solid #066;color:#660;background-color:#cc9;padding:2px 2px 2px 110px;font-size:14px}div.header-submenu{color:#036;background-color:#fff;padding:2px 10px 2px 110px;font-size:14px}#left_sidebar{position:absolute;left:0;voice-family:inherit;width:10px}html>body #left_sidebar,html>body #right_sidebar{width:10px}#right_sidebar{position:absolute;right:0;voice-family:"\"}\"";voice-family:inherit;width:10px}.group .citation{background-color:#f1f5f8;padding:1%;border-radius:5px;border:1px solid #d8dce0;font-size:1.2em}div.r-box,div.skipto-box{background-color:#cc9;padding:6px;border:.1px solid #066;font-size:12px;color:#036;text-align:center;vertical-align:middle}div.skipto-box{margin:8px;width:300px}div.r-box{float:right;margin:0;width:50%}a img,img.vtop,td{vertical-align:top}.footer,.tblfooter,div.content-area,div.title,h1,h2,h6{background-color:#fff}div.content-area{color:#036;text-align:left;padding:30px 40px 15px}div.content-area-dense{background-color:#fff;color:#036;text-align:left;padding:0}.indent1,div.left-padding{padding-left:10px}div.hanging-paragraph{margin-left:20px;text-indent:-20px}div.smaller-font,small{font-size:smaller}div.bottom-padding{padding-bottom:10px}#search-box{position:relative;margin-left:50%}#loginbox{border:0;position:absolute;top:55px;right:65px}#debug,div.right{right:20px;position:absolute}dl,dt,li,ol,ol ul,p,p dl,p ol,p ul,ul{color:#555}ol,ul{padding:0;margin-left:20px;list-style:circle}.ol-lower-alpha{list-style-type:lower-alpha;margin-top:2px}.ul-bulleted-list{list-style-type:disc;margin-top:2px;margin-bottom:10px;margin-left:15px}b,strong{font-weight:800}blockquote,pre{font-style:normal;font-weight:400}big{font-size:larger}pre{padding:10px;overflow-wrap:break-word}pre.inline{padding:0 10px}blockquote{color:#036;padding:0;text-decoration:none}div.title,h1,h2,h3{font-weight:700;padding:0;text-decoration:none;font-style:normal}h1{color:#036;font-size:18pt}div.title,h2{color:#036;font-size:16pt}h3{font-size:1.3em;line-height:1.5em}h4{padding:0;font-size:12pt;font-style:normal;font-weight:600;text-decoration:none;margin-top:0}.footer,.tblfooter,h5,h6{font-weight:400}h5{color:#666;padding:0;font-size:1em;font-style:normal;text-decoration:none;margin:0;line-height:1em}h6{padding:0;font-size:10pt;font-style:normal;text-decoration:none}hr{border-top:0 solid #036;width:450px;height:2px;background-color:#036}.rule{border-top-width:2px;border-top-style:solid;border-color:#036;margin:4px}a img,img,td{border:0;padding:0;text-decoration:none}a:link{color:#06c;background:0 0;text-decoration:none}a:hover{color:#00a8cc}a:active{color:#cc9600}a.menu:active,a.menu:link,a.menu:visited,a.submenu:active,a.submenu:link,a.submenu:visited{color:#036;background:0 0;text-decoration:none}div.book a:link,input.view.data-button{text-decoration:underline}a.menu:hover,a.submenu:hover{color:#036;background:0 0;text-decoration:underline}img.border{border:solid #036;padding:0}img.headshot{margin-right:20px;margin-bottom:40px}img.headshot_long{margin-right:20px;margin-bottom:80px}img.inlineleft,img.inlineright{border:solid #036;margin-top:8px;margin-bottom:8px}img.inlineleft{margin-right:8px}img.inlineright{margin-left:8px}.footer{color:#036;margin:20px 0 20px 5px;font-size:75%;font-style:normal;text-decoration:none;text-align:center}.tblfooter{color:#036;font-size:75%;font-style:normal;text-decoration:none}.coleven,.rowodd{background-color:#f1f5f8}.indent1{white-space:nowrap}.indent2{padding-left:15px}.indent3{padding-left:50px}.group *,.group th{padding:2px}.innercoleven,.innercolodd{font-size:.75em;padding-left:2px;padding-right:2px;text-align:left}.italic,.italics{font-style:italic;font-weight:400}.bold{font-style:normal;font-weight:700}.waybold{font-style:italic;font-weight:bolder}.group th,.sectionheader,.tablehead{font-weight:700}.group,.subGroup{voice-family:"\"}\"";voice-family:inherit;-moz-border-radius:10px}.subGroup_border{border:1px solid #ddd;border-radius:5px}div>table.subGroup{padding-left:15px;padding-right:15px}div.left{position:absolute;left:20px;clear:right}div.right{clear:left}table.left{position:absolute;left:20px}table.right{float:right;margin-right:10px;clear:left}.group th{text-align:left;font-size:.9em}th.rowheader{background:#f1f8f8;border-right:1px solid #94c1d4}.coleven{border-right:1px solid #bac4cf}.highlight,.innercoleven,input.submit{background-color:#f1f8f8}.eighty_percent{width:80%}.seventyfive_percent{width:75%}.seventy_percent{width:70%}.fifty_percent{width:50%}.forty_percent{width:40%}.twentyfive_percent{width:25%}.twenty_percent{width:20%}.fifteen_percent{width:15%}input,select,textarea{color:#036;border:1px solid #94c1d4;margin:5px}input.submit{margin-left:5px;border:1px dotted #94c1d4;font-size:85%}label{vertical-align:middle;color:#94c1d4}.login{font-size:85%;width:6em}input.view.data-button{font-size:1.25em;background:#fff}.iframeheaderclass{height:85px;width:100%;border:0;margin:10px}.iframesearchboxclass{height:450px;width:100%;border:0;margin:0}.iframeadvancedsearchboxclass{height:1250px;width:100%;border:0;margin:0}.iframemapclass{height:570px;width:100%;border:0;margin:0}.iframeloginboxclass{height:305px;width:100%;border:0;margin:0}.templatetableclass{width:100%;border:0;padding:0;margin:0}.templatecontentareaclass{border:0;padding:0;margin:0}.templateheaderrowclass{height:80px;border:0;padding:0;margin:0}.templateleftcolclass,.templaterightcolclass{height:100%;width:0;border:0;padding:0;margin:0}.templatefooterrowclass{height:0;border:0;padding:0;margin:0}.banner{background-image:url("./images/banner_background.jpg");background-repeat:repeat-x}.searchresultsdivider{height:10px}.highlight{border-bottom:1px dotted #94c1d4;border-top:1px dotted #94c1d4;padding:0;margin:0}.tablehead{text-align:left;font-style:normal;font-size:1em;padding-top:.2em;padding-bottom:.2em}div.book{margin:20px}div.sectiontitle{color:#036;background-color:#fff;padding:0;font-size:14pt;font-style:normal;font-weight:700;text-decoration:none}tr.attributes{font-size:.9em}@page{size:11in 11in}
        </style>
      </head>
      <body>

        <div id="{$mainTableAligmentStyle}">
		<xsl:if test="$insertTemplate='1'">			
		</xsl:if>

          <table xsl:use-attribute-sets="cellspacing" width="100%"
                                        class="{$mainContainerTableStyle}">
			<tr>
				<td>
					<xsl:apply-templates select="*[local-name()='eml']"/>
				</td>
			</tr>		
          </table>

		<xsl:if test="$insertTemplate='1'">			
		</xsl:if>
        </div>
      </body>
    </html>
   </xsl:template>

</xsl:stylesheet>
