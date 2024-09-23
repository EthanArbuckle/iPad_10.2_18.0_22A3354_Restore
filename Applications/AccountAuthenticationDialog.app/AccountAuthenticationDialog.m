void sub_10000386C(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

void sub_10000387C(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0xCu);
}

void sub_100003A28(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  id v16;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100003AF8;
  v13[3] = &unk_100008208;
  v13[4] = *(_QWORD *)(a1 + 32);
  v14 = v9;
  v15 = v8;
  v16 = v7;
  v10 = v7;
  v11 = v8;
  v12 = v9;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v13);

}

id sub_100003AF8(_QWORD *a1)
{
  objc_msgSend(*(id *)(a1[4] + 16), "setUsername:", a1[5]);
  objc_msgSend(*(id *)(a1[4] + 16), "setNavBarTitle:", a1[6]);
  return objc_msgSend(*(id *)(a1[4] + 16), "setAuthURL:", a1[7]);
}

id sub_100003B44(uint64_t a1)
{
  uint64_t v2;

  LOBYTE(v2) = 1;
  return objc_msgSend(*(id *)(a1 + 32), "beginRemoteSheetController:delegate:didEndSelector:contextInfo:requireTopApplication:opaque:presentAnimated:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 24), *(_QWORD *)(a1 + 40), "_remoteSheetDidEnd", 0, 0, 0, v2);
}

void sub_100003E00(id a1)
{
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v2 = _ACLogSystem(a1, v1);
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    sub_100004220(v3, v4, v5, v6, v7, v8, v9, v10);

}

void sub_100003E40(id a1)
{
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v2 = _ACLogSystem(a1, v1);
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    sub_100004250(v3, v4, v5, v6, v7, v8, v9, v10);

}

uint64_t start(int a1, char **a2)
{
  void *v4;
  objc_class *v5;
  NSString *v6;
  NSString *v7;
  uint64_t v8;

  v4 = objc_autoreleasePoolPush();
  v5 = (objc_class *)objc_opt_class(OOPADAppDelegate);
  v6 = NSStringFromClass(v5);
  v7 = (NSString *)objc_claimAutoreleasedReturnValue(v6);
  v8 = UIApplicationMain(a1, a2, 0, v7);

  objc_autoreleasePoolPop(v4);
  return v8;
}

void sub_100003FC4(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;

  v3 = 138412290;
  v4 = a1;
  sub_10000387C((void *)&_mh_execute_header, a2, a3, "\"Modified the URL: %@\"", (uint8_t *)&v3);
}

void sub_100004030(void *a1, NSObject *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  int v6;
  void *v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "URL"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "host"));
  v6 = 138412290;
  v7 = v4;
  sub_10000387C((void *)&_mh_execute_header, a2, v5, "\"willSendRequest called for host: %@\"", (uint8_t *)&v6);

}

void sub_1000040D4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100003890();
  sub_10000386C((void *)&_mh_execute_header, v0, v1, "\"Failed to identify Apple's EV certificate. Cancelling.\"", v2, v3, v4, v5, v6);
  sub_100003888();
}

void sub_100004100()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100003890();
  sub_10000386C((void *)&_mh_execute_header, v0, v1, "\"Verified this challenge is Apple's EV SSL certificate\"", v2, v3, v4, v5, v6);
  sub_100003888();
}

void sub_10000412C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100003890();
  sub_10000386C((void *)&_mh_execute_header, v0, v1, "\"Received authentication challenge\"", v2, v3, v4, v5, v6);
  sub_100003888();
}

void sub_100004158(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;

  v3 = 138412290;
  v4 = a1;
  sub_10000387C((void *)&_mh_execute_header, a2, a3, "\"OOPAWebViewController: failed with error - %@\"", (uint8_t *)&v3);
}

void sub_1000041C4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100003890();
  sub_10000386C((void *)&_mh_execute_header, v0, v1, "\"OOPAWebViewController: user tapped Cancel.\"", v2, v3, v4, v5, v6);
  sub_100003888();
}

void sub_1000041F0(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10000386C((void *)&_mh_execute_header, a1, a3, "\"Configuring client connection.\"", a5, a6, a7, a8, 0);
  sub_100003888();
}

void sub_100004220(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10000386C((void *)&_mh_execute_header, a1, a3, "\"Connection to ACDAuthenticationDialogManager interrupted!\"", a5, a6, a7, a8, 0);
  sub_100003888();
}

void sub_100004250(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10000386C((void *)&_mh_execute_header, a1, a3, "\"Connection to ACDAuthenticationDialogManager invalidated!\"", a5, a6, a7, a8, 0);
  sub_100003888();
}

id objc_msgSend_URL(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "URL");
}

id objc_msgSend_URLWithString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "URLWithString:");
}

id objc_msgSend__connectToAuthenticationDialogManager(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_connectToAuthenticationDialogManager");
}

id objc_msgSend__dialogManager(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_dialogManager");
}

id objc_msgSend__disconnectFromAuthenticationDialogManager(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_disconnectFromAuthenticationDialogManager");
}

id objc_msgSend__getSpringBoardOrientation(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_getSpringBoardOrientation");
}

id objc_msgSend__loadWebViewIfReady(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_loadWebViewIfReady");
}

id objc_msgSend__updateNavigationButtons(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_updateNavigationButtons");
}

id objc_msgSend__updateNavigationPromptWithActiveURL_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_updateNavigationPromptWithActiveURL:");
}

id objc_msgSend_absoluteString(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "absoluteString");
}

id objc_msgSend_addSubview_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addSubview:");
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "arrayWithObjects:count:");
}

id objc_msgSend_authURL(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "authURL");
}

id objc_msgSend_authenticationDialogDidFinishWithSuccess_response_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "authenticationDialogDidFinishWithSuccess:response:");
}

id objc_msgSend_authenticationMethod(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "authenticationMethod");
}

id objc_msgSend_beginRemoteSheetController_delegate_didEndSelector_contextInfo_requireTopApplication_opaque_presentAnimated_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "beginRemoteSheetController:delegate:didEndSelector:contextInfo:requireTopApplication:opaque:presentAnimated:");
}

id objc_msgSend_boldSystemFontOfSize_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "boldSystemFontOfSize:");
}

id objc_msgSend_bounds(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bounds");
}

id objc_msgSend_canGoBack(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "canGoBack");
}

id objc_msgSend_canGoForward(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "canGoForward");
}

id objc_msgSend_cancel(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cancel");
}

id objc_msgSend_cancelAuthenticationChallenge_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cancelAuthenticationChallenge:");
}

id objc_msgSend_connectionWithRequest_delegate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "connectionWithRequest:delegate:");
}

id objc_msgSend_contextForAuthenticationDialog_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "contextForAuthenticationDialog:");
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "copy");
}

id objc_msgSend_credentialForTrust_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "credentialForTrust:");
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "delegate");
}

id objc_msgSend_endRemoteSheet_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "endRemoteSheet:");
}

id objc_msgSend_frame(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "frame");
}

id objc_msgSend_goBack(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "goBack");
}

id objc_msgSend_goForward(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "goForward");
}

id objc_msgSend_hasPrefix_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hasPrefix:");
}

id objc_msgSend_host(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "host");
}

id objc_msgSend_initWithActivityIndicatorStyle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithActivityIndicatorStyle:");
}

id objc_msgSend_initWithBarButtonSystemItem_target_action_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithBarButtonSystemItem:target:action:");
}

id objc_msgSend_initWithFrame_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithFrame:");
}

id objc_msgSend_initWithFrame_configuration_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithFrame:configuration:");
}

id objc_msgSend_initWithMachServiceName_options_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithMachServiceName:options:");
}

id objc_msgSend_initWithRootViewController_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithRootViewController:");
}

id objc_msgSend_initWithTitle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithTitle:");
}

id objc_msgSend_interfaceWithProtocol_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "interfaceWithProtocol:");
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "invalidate");
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqualToString:");
}

id objc_msgSend_loadRequest_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "loadRequest:");
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mutableCopy");
}

id objc_msgSend_navBarTitle(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "navBarTitle");
}

id objc_msgSend_navigationItem(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "navigationItem");
}

id objc_msgSend_nonPersistentDataStore(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "nonPersistentDataStore");
}

id objc_msgSend_numberWithBool_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithBool:");
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectForKeyedSubscript:");
}

id objc_msgSend_protectionSpace(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "protectionSpace");
}

id objc_msgSend_request(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "request");
}

id objc_msgSend_requestWithURL_cachePolicy_timeoutInterval_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "requestWithURL:cachePolicy:timeoutInterval:");
}

id objc_msgSend_resourceSpecifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "resourceSpecifier");
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "resume");
}

id objc_msgSend_sender(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sender");
}

id objc_msgSend_serverTrust(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "serverTrust");
}

id objc_msgSend_setDelegate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDelegate:");
}

id objc_msgSend_setEnabled_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setEnabled:");
}

id objc_msgSend_setFont_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFont:");
}

id objc_msgSend_setFrame_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFrame:");
}

id objc_msgSend_setHidesBackButton_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setHidesBackButton:");
}

id objc_msgSend_setInterruptionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setInterruptionHandler:");
}

id objc_msgSend_setInvalidationHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setInvalidationHandler:");
}

id objc_msgSend_setLeftBarButtonItems_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLeftBarButtonItems:");
}

id objc_msgSend_setNavBarTitle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setNavBarTitle:");
}

id objc_msgSend_setNavigationDelegate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setNavigationDelegate:");
}

id objc_msgSend_setPrompt_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPrompt:");
}

id objc_msgSend_setRemoteObjectInterface_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRemoteObjectInterface:");
}

id objc_msgSend_setRightBarButtonItem_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRightBarButtonItem:");
}

id objc_msgSend_setStatusBarOrientation_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setStatusBarOrientation:");
}

id objc_msgSend_setText_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setText:");
}

id objc_msgSend_setTitleView_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTitleView:");
}

id objc_msgSend_setUsername_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setUsername:");
}

id objc_msgSend_setView_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setView:");
}

id objc_msgSend_setWebsiteDataStore_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setWebsiteDataStore:");
}

id objc_msgSend_sizeToFit(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sizeToFit");
}

id objc_msgSend_startAnimating(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startAnimating");
}

id objc_msgSend_stopAnimating(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stopAnimating");
}

id objc_msgSend_stringByAppendingString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringByAppendingString:");
}

id objc_msgSend_substringFromIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "substringFromIndex:");
}

id objc_msgSend_titleView(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "titleView");
}

id objc_msgSend_useCredential_forAuthenticationChallenge_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "useCredential:forAuthenticationChallenge:");
}

id objc_msgSend_view(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "view");
}

id objc_msgSend_webViewController_didFinishWithSuccess_response_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "webViewController:didFinishWithSuccess:response:");
}
