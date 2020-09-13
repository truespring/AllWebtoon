<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Profile</title>
<style type="text/css">
	section{
	width:100%;
	background-color: #F8F8F8; margin: 0 auto; background-color: #F8F8F8;
 			border-top: 1px solid #EAEAEA; text-align: center;}
 	section .frmContainer{margin: 15px auto; text-align: center;}
 	section .profileImg{width: 240px; height:220px; border-radius: 50%; object-fit: cover; overflow: hidden;}
 	section .name{color: gray; font-weight: gray; font-weight: bold;}
 	section .updName{width: 280px; height: 41px;background: #FFFFFF; padding-left: 30px; 
	padding-right:20px; border: 1px solid #4FA2C7; box-sizing: border-box; border-radius: 10px;
	margin: 15px auto;}
	section .updName[type="search"]{font-family: 'GmarketSansMedium', serif ;
	line-height: normal;padding-top: 6px;}
	section .updName:hover{cursor: pointer;}
	section .imgFile[type="file"]{font-family: 'GmarketSansMedium', serif ; width:200px;  text-align: center; margin: 5px auto;}
	section input[type="submit"]{font-family: 'GmarketSansMedium', serif ;}
	section .box-file-input label{
	font-family: 'GmarketSansMedium', serif ;
    display:inline-block;
    background: #4FA2C7
	}
</style>
</head>
<body>
<div id	="container">
	<jsp:include page="../template/header.jsp"/>
	<section>
		<h1>프로필 변경</h1>
		<div class="printImage">
			<c:choose>
				<c:when test="${loginUser.u_profile eq ''}">
					<img class="profileImg" src="/images/u_profile/default_image.jpg" alt="프로필 설정 가기">
				</c:when>
				<c:when test="${loginUser.chkProfile eq 'http'}">
					<img class="profileImg" src="${loginUser.u_profile}" alt="프로필 설정 가기">
				</c:when>
				<c:otherwise>
					<img class="profileImg" src="/images/u_profile/user/${loginUser.u_no}/${loginUser.u_profile}" alt="프로필 설정 가기">
				</c:otherwise>
			</c:choose>
		</div>
		<div class="frmContainer">
			<form action="/profile" method="post" enctype="multipart/form-data">
				<div>
					<span class="name">이름</span>&nbsp;&nbsp;
					<div><input type="search" name="updName" value="${profileData.u_name}" class="updName"></div>
					<input type="file" name="profile_img" accept="image/*" value="이미지 선택" class="imgFile">
					<input type="submit" value="업로드">
				</div>
			</form>
		</div>
	</section>
	<jsp:include page="../template/footer.jsp"/>
</div>
</body>
<script type="text/javascript">
function moveToDetail(w_no) {
	location.href = '/webtoon/detail?w_no='+w_no
}
function moveToLogin() {
	location.href = '/login'
}
function moveToJoin() {
	location.href = '/join'
}
function moveToResult() {
	if(event.keyCode == 13){
		var result = search.value
		location.href = '/searchResult?result='+result
	}
}
function goHome() {
	location.href = '/home'
  }
function moveToMyPage() {
	location.href = '/myPage?i_user=${loginUser.u_no}'
}
function moveToProfile() {
	location.href = '/profile?i_user=${loginUser.u_no}'
}
function moveToLogOut() {
	if(confirm('로그아웃 하시겠습니까?')){
		location.href = '/logout'
	}
}
</script>
</html>