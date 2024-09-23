@implementation AKPrivateEmailRemoteViewController

- (AKPrivateEmailRemoteViewController)initWithPrivateEmailContext:(id)a3 altDSID:(id)a4
{
  id v7;
  id v8;
  AKPrivateEmailRemoteViewController *v9;
  AKPrivateEmailRemoteViewController *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)AKPrivateEmailRemoteViewController;
  v9 = -[AKPrivateEmailRemoteViewController init](&v12, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_privateEmailContext, a3);
    objc_storeStrong((id *)&v10->_altDSID, a4);
  }

  return v10;
}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)AKPrivateEmailRemoteViewController;
  -[AKPrivateEmailRemoteViewController viewWillAppear:](&v5, "viewWillAppear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[AKPrivateEmailRemoteViewController view](self, "view"));
  objc_msgSend(v4, "setHidden:", 1);

  -[AKRemoteViewController setupRemoteProxy](self, "setupRemoteProxy");
  -[AKPrivateEmailRemoteViewController _prepareToPresentPrivateEmailFlow](self, "_prepareToPresentPrivateEmailFlow");
}

- (void)setUpHostProxy
{
  void *v3;
  AKPrivateEmailPresenterHostProtocol *v4;
  AKPrivateEmailPresenterHostProtocol *hostProxy;
  _QWORD v6[4];
  id v7;
  id location;

  objc_initWeak(&location, self);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[AKRemoteViewController lookupConnection](self, "lookupConnection"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100005678;
  v6[3] = &unk_10000C320;
  objc_copyWeak(&v7, &location);
  v4 = (AKPrivateEmailPresenterHostProtocol *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "remoteObjectProxyWithErrorHandler:", v6));
  hostProxy = self->_hostProxy;
  self->_hostProxy = v4;

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

- (id)remoteObjectInterface
{
  return +[AKPrivateEmailPresenterHostInterface XPCInterface](AKPrivateEmailPresenterHostInterface, "XPCInterface");
}

- (void)configureWithContext:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(_QWORD);
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSString *v17;
  NSString *altDSID;
  AKPrivateEmailContext *v19;
  AKPrivateEmailContext *privateEmailContext;
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  uint64_t v24;
  int v25;
  void *v26;

  v6 = a3;
  v7 = (void (**)(_QWORD))a4;
  v9 = _AKLogSystem(v7, v8);
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "userInfo"));
    v25 = 138412290;
    v26 = v11;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Configuring remote private email view service\n%@", (uint8_t *)&v25, 0xCu);

  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "userInfo"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", AKPrivateEmailIdentifierKey));

  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "userInfo"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("X-Apple-I-Private-Email-Client-Bundle")));

  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "userInfo"));
  v17 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "objectForKeyedSubscript:", AKAltDSID));
  altDSID = self->_altDSID;
  self->_altDSID = v17;

  v19 = (AKPrivateEmailContext *)objc_msgSend(objc_alloc((Class)AKPrivateEmailContext), "initWithKey:altDSID:clientAppBundleId:", v13, self->_altDSID, v15);
  privateEmailContext = self->_privateEmailContext;
  self->_privateEmailContext = v19;

  if (self->_altDSID)
  {
    v23 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "xpcEndpoint"));
    -[AKRemoteViewController setUpLookupConnection:](self, "setUpLookupConnection:", v23);
  }
  else
  {
    v24 = _AKLogSystem(v21, v22);
    v23 = objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      sub_100006858(v23);
  }

  v7[2](v7);
}

- (void)handleCancellation:(id)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(+[NSError ak_errorWithCode:](NSError, "ak_errorWithCode:", -7003));
  -[AKPrivateEmailRemoteViewController _callFlowEndedCompletionWithPrivateEmail:error:](self, "_callFlowEndedCompletionWithPrivateEmail:error:", 0, v4);

}

- (void)_prepareToPresentPrivateEmailFlow
{
  UINavigationController *navController;
  _QWORD v4[5];

  -[AKPrivateEmailRemoteViewController _createNavigationController](self, "_createNavigationController");
  navController = self->_navController;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000059C4;
  v4[3] = &unk_10000C398;
  v4[4] = self;
  -[AKPrivateEmailRemoteViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", navController, 1, v4);
}

- (void)_showPrivateEmailFlow
{
  AKAppleIDAuthenticationInAppContext *v3;
  AKAppleIDAuthenticationInAppContext *context;
  id v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  NSString *altDSID;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[5];
  id v17;
  __int128 *p_buf;
  __int128 buf;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;

  v3 = (AKAppleIDAuthenticationInAppContext *)objc_alloc_init((Class)AKAppleIDAuthenticationInAppContext);
  context = self->_context;
  self->_context = v3;

  -[AKAppleIDAuthenticationInAppContext setAltDSID:](self->_context, "setAltDSID:", self->_altDSID);
  -[AKAppleIDAuthenticationInAppContext setForceInlinePresentation:](self->_context, "setForceInlinePresentation:", 1);
  -[AKAppleIDAuthenticationInAppContext setDelegate:](self->_context, "setDelegate:", self);
  v5 = -[AKAppleIDAuthenticationInAppContext setPresentingViewController:](self->_context, "setPresentingViewController:", self->_navController);
  v7 = _AKLogSystem(v5, v6);
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    altDSID = self->_altDSID;
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = altDSID;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Showing flow for %@", (uint8_t *)&buf, 0xCu);
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[AKURLBag bagForAltDSID:](AKURLBag, "bagForAltDSID:", self->_altDSID));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "urlAtKey:", AKURLBagKeyPrivateEmailUseAddress));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSURLRequest requestWithURL:](NSURLRequest, "requestWithURL:", v11));
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v20 = 0x3032000000;
  v21 = sub_100005C48;
  v22 = sub_100005C58;
  v23 = objc_msgSend(objc_alloc((Class)AKServerRequestConfiguration), "initWithRequest:requestType:", v12, 0);
  v13 = objc_alloc_init((Class)AKAppleIDAuthenticationController);
  v14 = objc_alloc_init((Class)AKAppleIDAuthenticationContext);
  objc_msgSend(v14, "_updateWithValuesFromContext:", self->_context);
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100005C60;
  v16[3] = &unk_10000C568;
  p_buf = &buf;
  v16[4] = self;
  v15 = v11;
  v17 = v15;
  objc_msgSend(v13, "getServerUILoadDelegateWithContext:completion:", v14, v16);

  _Block_object_dispose(&buf, 8);
}

- (void)_callFlowEndedCompletionWithPrivateEmail:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  NSObject *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  NSObject *v19;
  AKPrivateEmailPresenterHostProtocol *hostProxy;
  _QWORD v21[5];
  uint8_t buf[4];
  void *v23;

  v6 = a3;
  v7 = a4;
  v8 = _AKLogHme();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  v10 = v9;
  if (v7)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      sub_100006914((uint64_t)v7, v10, v11, v12, v13, v14, v15, v16);
  }
  else if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "privateEmailAddress"));
    *(_DWORD *)buf = 138412290;
    v23 = v17;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Sending successful private email selection back to daemon: %@", buf, 0xCu);

  }
  v18 = _AKLogHme();
  v19 = objc_claimAutoreleasedReturnValue(v18);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    sub_100006898((uint64_t)self, v19);

  hostProxy = self->_hostProxy;
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_1000061C0;
  v21[3] = &unk_10000C348;
  v21[4] = self;
  -[AKPrivateEmailPresenterHostProtocol privateEmailFetchCompletedWith:error:completion:](hostProxy, "privateEmailFetchCompletedWith:error:completion:", v6, v7, v21);

}

- (void)_createNavigationController
{
  UINavigationController *v3;
  UINavigationController *navController;
  void *v5;
  void *v6;
  void *v7;

  if (!self->_navController)
  {
    v3 = (UINavigationController *)objc_alloc_init((Class)UINavigationController);
    navController = self->_navController;
    self->_navController = v3;

    v5 = (void *)objc_claimAutoreleasedReturnValue(-[UINavigationController navigationItem](self->_navController, "navigationItem"));
    objc_msgSend(v5, "setHidesBackButton:", 1);

    v6 = (void *)objc_claimAutoreleasedReturnValue(-[UINavigationController navigationController](self->_navController, "navigationController"));
    objc_msgSend(v6, "setNavigationBarHidden:", 1);

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[UINavigationController view](self->_navController, "view"));
    objc_msgSend(v7, "setHidden:", 1);

    -[UINavigationController setModalPresentationStyle:](self->_navController, "setModalPresentationStyle:", 0);
  }
}

- (id)remoteUIStyle
{
  void *v2;

  v2 = (void *)sub_10000514C(0);
  if (v2)
    v2 = sub_10000526C();
  return objc_msgSend(v2, "osloStyle");
}

- (AKPrivateEmailPresenterHostProtocol)hostProxy
{
  return self->_hostProxy;
}

- (void)setHostProxy:(id)a3
{
  objc_storeStrong((id *)&self->_hostProxy, a3);
}

- (UINavigationController)navController
{
  return self->_navController;
}

- (void)setNavController:(id)a3
{
  objc_storeStrong((id *)&self->_navController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_navController, 0);
  objc_storeStrong((id *)&self->_hostProxy, 0);
  objc_storeStrong((id *)&self->_privateEmailContext, 0);
  objc_storeStrong((id *)&self->_altDSID, 0);
  objc_storeStrong((id *)&self->_context, 0);
}

@end
