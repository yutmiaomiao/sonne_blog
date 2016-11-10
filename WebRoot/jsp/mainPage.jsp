<%@page pageEncoding="utf-8" contentType="text/html;charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String imgPath = basePath + "image/";
%>
<!DOCTYPE html>
<html>
      <head>
             <title>日向blog</title>
             <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
             <link type="text/css" rel="stylesheet" href="<%=basePath %>css/sonn.css" media="all" />
      </head>
      <body>
      		  <div id = "title">
              <h4 class = "title">只有刚强的人，才有神圣的意志<br>凡是战斗的人，才能取得胜利
                    <br>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
                 &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp----歌德</h4>

              </div>
              <div id="col_left">
                    <div id="menu">
                          <h2>日   向</h2>
                          <ul>
                              <li><a href ="/RiXiang_blog/login/show.form">登录</a></li>
                              <li><a href ="/RiXiang_blog/register/show.form">注册</a></li>
                              <li><a href ="">主页</a></li>
                              <c:if test="${!empty userName}"><li><a href ="/RiXiang_blog/space/list.form">个人空间 - ${userName}</a></li></c:if>
                          </ul>
                    </div>
              </div>
              <div id = "article_list">
                          <c:forEach items="${page.content}" var="article" >
                              <div id = "article_block">
                                  <span class = "title">${article.title}</span>
                                  <span class = "author">author：${article.authorName}</span><br> 
                                     <p> ${article.content}</p>
                               </div>
                               <p>------------------------------------------------------------------------------------- </p>
                          </c:forEach>     
                                                                    共${page.pageInfo.totalCount}条纪录，当前第${page.pageInfo.currentPage}/${page.pageInfo.totalPage}页，每页${page.pageInfo.everyPage}条纪录
                          <c:choose>
                                    <c:when test = "${page.pageInfo.hasPrePage}">
                                     			<a href="<%=basePath %>article/list.form?currentPage=1">首页</a>
				                                <a href="<%=basePath %>article/list.form?currentPage=${page.pageInfo.currentPage-1}">上一页</a>
                                    </c:when>
                                    <c:otherwise>
                                           		   首页
				                                                                                          上一页
                                    </c:otherwise>
                          </c:choose>
                          <c:choose>
                                     <c:when test = "${page.pageInfo.hasNextPage}">
                                                <a href="<%=basePath %>article/list.form?currentPage=${page.pageInfo.currentPage+1}">下一页</a> 
				                                <a href="<%=basePath %>article/list.form?currentPage=${page.pageInfo.totalPage}">尾页</a>
                                     </c:when>
                                     <c:otherwise>
                                                                                                                                          下一页
                                                                                                                                            尾页
                                     </c:otherwise>
                          </c:choose>
			  </div>

      </body>
</html>