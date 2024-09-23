@implementation AKAuthorizationRemoteViewController

- (AKAuthorizationRemoteViewController)initWithPresentationContext:(id)a3
{
  id v5;
  AKAuthorizationRemoteViewController *v6;
  AKAuthorizationRemoteViewController *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AKAuthorizationRemoteViewController;
  v6 = -[AKAuthorizationRemoteViewController init](&v9, "init");
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_presentationContext, a3);

  return v7;
}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)AKAuthorizationRemoteViewController;
  -[AKAuthorizationRemoteViewController viewWillAppear:](&v4, "viewWillAppear:", a3);
  -[AKRemoteViewController setupRemoteProxy](self, "setupRemoteProxy");
  -[AKAuthorizationRemoteViewController _showTiburonFlow](self, "_showTiburonFlow");
}

- (void)_showTiburonFlow
{
  uint64_t v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v12;
  void *v13;
  AKAuthorizationViewController *v14;
  AKAuthorizationViewController *authorizationViewController;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  _QWORD v34[4];

  if (self->_authorizationViewController)
  {
    v2 = _AKLogSystem();
    v3 = objc_claimAutoreleasedReturnValue(v2);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      sub_1000063F0(v3, v4, v5, v6, v7, v8, v9, v10);
  }
  else
  {
    v12 = objc_alloc((Class)AKAuthorizationViewController);
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[AKAuthorizationRemoteViewController presentationContext](self, "presentationContext"));
    v14 = (AKAuthorizationViewController *)objc_msgSend(v12, "initWithAuthorizationContext:", v13);
    authorizationViewController = self->_authorizationViewController;
    self->_authorizationViewController = v14;

    -[AKAuthorizationViewController setDelegate:](self->_authorizationViewController, "setDelegate:", self);
    -[AKAuthorizationViewController willMoveToParentViewController:](self->_authorizationViewController, "willMoveToParentViewController:", self);
    -[AKAuthorizationRemoteViewController addChildViewController:](self, "addChildViewController:", self->_authorizationViewController);
    v3 = objc_claimAutoreleasedReturnValue(-[AKAuthorizationViewController view](self->_authorizationViewController, "view"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[AKAuthorizationRemoteViewController view](self, "view"));
    objc_msgSend(v16, "addSubview:", v3);

    -[NSObject setTranslatesAutoresizingMaskIntoConstraints:](v3, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v32 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject leadingAnchor](v3, "leadingAnchor"));
    v33 = (void *)objc_claimAutoreleasedReturnValue(-[AKAuthorizationRemoteViewController view](self, "view"));
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "leadingAnchor"));
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "constraintEqualToAnchor:", v31));
    v34[0] = v30;
    v28 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject trailingAnchor](v3, "trailingAnchor"));
    v29 = (void *)objc_claimAutoreleasedReturnValue(-[AKAuthorizationRemoteViewController view](self, "view"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "trailingAnchor"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "constraintEqualToAnchor:", v27));
    v34[1] = v26;
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject topAnchor](v3, "topAnchor"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[AKAuthorizationRemoteViewController view](self, "view"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "topAnchor"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "constraintEqualToAnchor:", v17));
    v34[2] = v18;
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject bottomAnchor](v3, "bottomAnchor"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[AKAuthorizationRemoteViewController view](self, "view"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "bottomAnchor"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "constraintEqualToAnchor:", v21));
    v34[3] = v22;
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v34, 4));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v23);

    -[AKAuthorizationViewController didMoveToParentViewController:](self->_authorizationViewController, "didMoveToParentViewController:", self);
  }

}

- (void)setUpHostProxy
{
  uint64_t v3;
  NSObject *v4;
  void *v5;
  AKAuthorizationPresenterHostProtocol *v6;
  AKAuthorizationPresenterHostProtocol *hostProxy;
  _QWORD v8[4];
  id v9;
  id location;

  v3 = _AKLogSystem(self, a2);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    sub_100006420(v4);

  objc_initWeak(&location, self);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[AKRemoteViewController lookupConnection](self, "lookupConnection"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100002B5C;
  v8[3] = &unk_10000C320;
  objc_copyWeak(&v9, &location);
  v6 = (AKAuthorizationPresenterHostProtocol *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "remoteObjectProxyWithErrorHandler:", v8));
  hostProxy = self->_hostProxy;
  self->_hostProxy = v6;

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (id)remoteObjectInterface
{
  return +[AKAuthorizationPresenterHostInterface XPCInterface](AKAuthorizationPresenterHostInterface, "XPCInterface");
}

- (void)configureWithContext:(id)a3 completion:(id)a4
{
  void (**v6)(_QWORD);
  id v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  void *v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  id v36;
  uint8_t buf[16];

  v6 = (void (**)(_QWORD))a4;
  v7 = a3;
  v9 = _AKLogSystem(v7, v8);
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Configuring remote view service", buf, 2u);
  }

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "userInfo"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("context")));

  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "xpcEndpoint"));
  -[AKRemoteViewController setUpLookupConnection:](self, "setUpLookupConnection:", v13);

  if (objc_msgSend(v12, "length"))
  {
    v36 = 0;
    v15 = +[NSKeyedUnarchiver unarchivedObjectOfClass:fromData:error:](NSKeyedUnarchiver, "unarchivedObjectOfClass:fromData:error:", objc_opt_class(AKAuthorizationPresentationContext), v12, &v36);
    v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
    v17 = v36;
    -[AKAuthorizationRemoteViewController setPresentationContext:](self, "setPresentationContext:", v16);

    if (v17)
    {
      v20 = _AKLogSystem(v18, v19);
      v21 = objc_claimAutoreleasedReturnValue(v20);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        sub_1000064F4((uint64_t)v17, v21, v22, v23, v24, v25, v26, v27);

    }
  }
  else
  {
    v28 = _AKLogSystem(0, v14);
    v17 = objc_claimAutoreleasedReturnValue(v28);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      sub_1000064C4(v17, v29, v30, v31, v32, v33, v34, v35);
  }

  v6[2](v6);
}

- (void)handleCancellation:(id)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(+[NSError ak_errorWithCode:](NSError, "ak_errorWithCode:", -7003));
  -[AKAuthorizationRemoteViewController _callCompletionWithAuthorization:error:](self, "_callCompletionWithAuthorization:error:", 0, v4);

}

- (void)authorizationViewController:(id)a3 didCompleteWithAuthorization:(id)a4 error:(id)a5
{
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  int v12;
  id v13;
  __int16 v14;
  id v15;

  v7 = a4;
  v8 = a5;
  v10 = _AKLogSystem(v8, v9);
  v11 = objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = 138412546;
    v13 = v7;
    v14 = 2112;
    v15 = v8;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "AKRemoteViewController did complete with authorization %@ (error: %@)", (uint8_t *)&v12, 0x16u);
  }

  if (v8 && (objc_msgSend(v8, "ak_isUserInitiatedError") & 1) == 0)
    -[AKAuthorizationRemoteViewController _didCompleteWithError:](self, "_didCompleteWithError:", v8);
  else
    -[AKAuthorizationRemoteViewController _callCompletionWithAuthorization:error:](self, "_callCompletionWithAuthorization:error:", v7, v8);

}

- (void)authorizationViewController:(id)a3 didRequestAuthorizationWithUserProvidedInformation:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  int v12;
  id v13;

  v7 = a4;
  v8 = a5;
  v10 = _AKLogSystem(v8, v9);
  v11 = objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = 138412290;
    v13 = v7;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "UI service initiating authorization request with userSelection: %@", (uint8_t *)&v12, 0xCu);
  }

  -[AKAuthorizationPresenterHostProtocol authorizationRequestInitiatedWithUserProvidedInformation:completion:](self->_hostProxy, "authorizationRequestInitiatedWithUserProvidedInformation:completion:", v7, v8);
}

- (void)authorizationViewController:(id)a3 didRequestIconForRequestContext:(id)a4 completion:(id)a5
{
  -[AKAuthorizationPresenterHostProtocol continueFetchingIconWithCompletion:](self->_hostProxy, "continueFetchingIconWithCompletion:", a5, a4);
}

- (void)_callCompletionWithAuthorization:(id)a3 error:(id)a4
{
  AKAuthorizationPresenterHostProtocol *hostProxy;
  _QWORD v5[5];

  hostProxy = self->_hostProxy;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10000301C;
  v5[3] = &unk_10000C348;
  v5[4] = self;
  -[AKAuthorizationPresenterHostProtocol authorizationRequestFinishedWithAuthorization:error:completion:](hostProxy, "authorizationRequestFinishedWithAuthorization:error:completion:", a3, a4, v5);
}

- (void)_didCompleteWithError:(id)a3
{
  id v4;
  dispatch_time_t v5;
  id v6;
  _QWORD v7[4];
  id v8;
  AKAuthorizationRemoteViewController *v9;

  v4 = a3;
  v5 = dispatch_time(0, 1100000000);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000030C4;
  v7[3] = &unk_10000C370;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_after(v5, (dispatch_queue_t)&_dispatch_main_q, v7);

}

- (void)_main_dismissAndExit
{
  _QWORD *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD v17[5];
  _QWORD *v18;
  _QWORD v19[9];
  _QWORD v20[5];

  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_1000033B4;
  v20[3] = &unk_10000C398;
  v20[4] = self;
  v3 = objc_retainBlock(v20);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[AKAuthorizationRemoteViewController authorizationViewController](self, "authorizationViewController"));

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[AKAuthorizationRemoteViewController authorizationViewController](self, "authorizationViewController"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "navigationController"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "view"));
    objc_msgSend(v7, "frame");
    v9 = v8;
    v11 = v10;
    v13 = v12;

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[AKAuthorizationRemoteViewController view](self, "view"));
    objc_msgSend(v14, "frame");
    v16 = v15;

    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_1000033F0;
    v19[3] = &unk_10000C3C0;
    v19[4] = self;
    v19[5] = v9;
    v19[6] = v16;
    v19[7] = v11;
    v19[8] = v13;
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_100003470;
    v17[3] = &unk_10000C3E8;
    v17[4] = self;
    v18 = v3;
    +[UIView _animateUsingDefaultTimingWithOptions:animations:completion:](UIView, "_animateUsingDefaultTimingWithOptions:animations:completion:", 134, v19, v17);

  }
  else
  {
    ((void (*)(_QWORD *))v3[2])(v3);
  }

}

- (AKAuthorizationPresentationContext)presentationContext
{
  return self->_presentationContext;
}

- (void)setPresentationContext:(id)a3
{
  objc_storeStrong((id *)&self->_presentationContext, a3);
}

- (AKAuthorizationViewController)authorizationViewController
{
  return self->_authorizationViewController;
}

- (void)setAuthorizationViewController:(id)a3
{
  objc_storeStrong((id *)&self->_authorizationViewController, a3);
}

- (AKAuthorizationPresenterHostProtocol)hostProxy
{
  return self->_hostProxy;
}

- (void)setHostProxy:(id)a3
{
  objc_storeStrong((id *)&self->_hostProxy, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hostProxy, 0);
  objc_storeStrong((id *)&self->_authorizationViewController, 0);
  objc_storeStrong((id *)&self->_presentationContext, 0);
}

@end
