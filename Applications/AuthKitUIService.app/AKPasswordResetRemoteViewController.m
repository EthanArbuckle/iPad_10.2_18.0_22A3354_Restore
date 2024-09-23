@implementation AKPasswordResetRemoteViewController

- (BOOL)needsOptionsView
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  BOOL v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[AKPasswordResetRemoteViewController context](self, "context"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "username"));
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[AKPasswordResetRemoteViewController context](self, "context"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "username"));
    v7 = objc_msgSend(v6, "length") != 0;

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (AKPasswordResetRemoteViewController)initWithContext:(id)a3
{
  id v5;
  AKPasswordResetRemoteViewController *v6;
  AKPasswordResetRemoteViewController *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AKPasswordResetRemoteViewController;
  v6 = -[AKPasswordResetRemoteViewController initWithNibName:bundle:](&v9, "initWithNibName:bundle:", 0, 0);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_context, a3);

  return v7;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)AKPasswordResetRemoteViewController;
  -[AKPasswordResetRemoteViewController viewDidLoad](&v7, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[AKPasswordResetRemoteViewController view](self, "view"));
  objc_msgSend(v4, "setBackgroundColor:", v3);

  v5 = objc_alloc_init((Class)UIViewController);
  -[AKPasswordResetRemoteViewController setFullscreenBackDropViewController:](self, "setFullscreenBackDropViewController:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[AKPasswordResetRemoteViewController fullscreenBackDropViewController](self, "fullscreenBackDropViewController"));
  objc_msgSend(v6, "setModalPresentationStyle:", 0);

}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[5];
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)AKPasswordResetRemoteViewController;
  -[AKPasswordResetRemoteViewController viewWillAppear:](&v8, "viewWillAppear:", a3);
  -[AKRemoteViewController setupRemoteProxy](self, "setupRemoteProxy");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[AKPasswordResetRemoteViewController fullscreenBackDropViewController](self, "fullscreenBackDropViewController"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "presentingViewController"));

  if (!v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[AKPasswordResetRemoteViewController fullscreenBackDropViewController](self, "fullscreenBackDropViewController"));
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_100004018;
    v7[3] = &unk_10000C398;
    v7[4] = self;
    -[AKPasswordResetRemoteViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v6, 0, v7);

  }
}

- (int64_t)modalPresentationStyle
{
  return 0;
}

- (void)setUpHostProxy
{
  uint64_t v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void **v7;
  uint64_t v8;
  void (*v9)(uint64_t, void *);
  void *v10;
  id v11;
  id location;

  v3 = _AKLogSystem(self, a2);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    sub_100006420(v4);

  objc_initWeak(&location, self);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[AKRemoteViewController lookupConnection](self, "lookupConnection"));
  v7 = _NSConcreteStackBlock;
  v8 = 3221225472;
  v9 = sub_1000042D4;
  v10 = &unk_10000C320;
  objc_copyWeak(&v11, &location);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "remoteObjectProxyWithErrorHandler:", &v7));
  -[AKPasswordResetRemoteViewController setHostProxy:](self, "setHostProxy:", v6, v7, v8, v9, v10);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

- (id)remoteObjectInterface
{
  return +[AKPasswordResetPresenterHostInterface XPCInterface](AKPasswordResetPresenterHostInterface, "XPCInterface");
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
    v15 = +[NSKeyedUnarchiver unarchivedObjectOfClass:fromData:error:](NSKeyedUnarchiver, "unarchivedObjectOfClass:fromData:error:", objc_opt_class(AKAppleIDAuthenticationContext), v12, &v36);
    v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
    v17 = v36;
    -[AKPasswordResetRemoteViewController setContext:](self, "setContext:", v16);

    if (v17)
    {
      v20 = _AKLogSystem(v18, v19);
      v21 = objc_claimAutoreleasedReturnValue(v20);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        sub_100006694((uint64_t)v17, v21, v22, v23, v24, v25, v26, v27);

    }
  }
  else
  {
    v28 = _AKLogSystem(0, v14);
    v17 = objc_claimAutoreleasedReturnValue(v28);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      sub_100006664(v17, v29, v30, v31, v32, v33, v34, v35);
  }

  if (v6)
    v6[2](v6);

}

- (void)handleCancellation:(id)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(+[NSError ak_errorWithCode:](NSError, "ak_errorWithCode:", -7003));
  -[AKPasswordResetRemoteViewController _passwordResetDidFinishWithResult:error:](self, "_passwordResetDidFinishWithResult:error:", 0, v4);

}

- (void)passwordResetControllerDidSelectPrimaryUser:(id)a3
{
  uint64_t v4;
  NSObject *v5;
  void *v6;
  void *v7;
  uint8_t v8[16];

  v4 = _AKLogSystem(self, a2);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Primary user password reset option selected", v8, 2u);
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[AKPasswordResetRemoteViewController context](self, "context"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "username"));
  -[AKPasswordResetRemoteViewController _presentPasswordResetFlowForUsername:](self, "_presentPasswordResetFlowForUsername:", v7);

}

- (void)passwordResetControllerDidSelectOtherUser:(id)a3
{
  uint64_t v4;
  NSObject *v5;
  uint8_t v6[16];

  v4 = _AKLogSystem(self, a2);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Different user password reset option selected", v6, 2u);
  }

  -[AKPasswordResetRemoteViewController _presentPasswordResetFlowForUsername:](self, "_presentPasswordResetFlowForUsername:", 0);
}

- (void)passwordResetControllerDidSelectClose:(id)a3
{
  uint64_t v4;
  NSObject *v5;
  void *v6;
  uint8_t v7[16];

  v4 = _AKLogSystem(self, a2);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Closing password reset options screen", v7, 2u);
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSError ak_errorWithCode:](NSError, "ak_errorWithCode:", -7003));
  -[AKPasswordResetRemoteViewController _passwordResetDidFinishWithResult:error:](self, "_passwordResetDidFinishWithResult:error:", 0, v6);

}

- (void)willShowViewController:(id)a3
{
  uint64_t v3;
  id v4;

  v4 = a3;
  v3 = objc_opt_class(AKPasswordResetViewController);
  if ((objc_opt_isKindOfClass(v4, v3) & 1) != 0)
    objc_msgSend(v4, "stopLoading");

}

- (void)_presentPasswordResetFlowForUsername:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;
  id buf[2];

  v4 = a3;
  v6 = _AKLogSystem(v4, v5);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Initiating password reset flow from view service", (uint8_t *)buf, 2u);
  }

  v8 = objc_alloc_init((Class)AKAppleIDAuthenticationInAppContext);
  objc_msgSend(v8, "setUsername:", v4);
  objc_msgSend(v8, "setIsEphemeral:", 1);
  objc_msgSend(v8, "setAuthenticationType:", 2);
  objc_msgSend(v8, "setNeedsCredentialRecovery:", 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[AKPasswordResetRemoteViewController context](self, "context"));
  objc_msgSend(v8, "setIsNativeTakeover:", objc_msgSend(v9, "isNativeTakeover"));

  objc_msgSend(v8, "setIsRequestedFromOOPViewService:", 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[AKPasswordResetRemoteViewController context](self, "context"));
  objc_msgSend(v8, "setServiceType:", objc_msgSend(v10, "serviceType"));

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[AKPasswordResetRemoteViewController context](self, "context"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "serviceIdentifier"));
  objc_msgSend(v8, "setServiceIdentifier:", v12);

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[AKPasswordResetRemoteViewController context](self, "context"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "httpHeadersForRemoteUI"));
  objc_msgSend(v8, "setHttpHeadersForRemoteUI:", v14);

  objc_msgSend(v8, "setShouldPromptForPasswordOnly:", 0);
  objc_msgSend(v8, "setIsUsernameEditable:", 0);
  objc_msgSend(v8, "setForceInlinePresentation:", -[AKPasswordResetRemoteViewController needsOptionsView](self, "needsOptionsView"));
  if (-[AKPasswordResetRemoteViewController needsOptionsView](self, "needsOptionsView"))
    v15 = objc_claimAutoreleasedReturnValue(-[AKPasswordResetRemoteViewController rootNavigationController](self, "rootNavigationController"));
  else
    v15 = objc_claimAutoreleasedReturnValue(-[AKPasswordResetRemoteViewController fullscreenBackDropViewController](self, "fullscreenBackDropViewController"));
  v16 = (void *)v15;
  objc_msgSend(v8, "setPresentingViewController:", v15);

  objc_msgSend(v8, "setDelegate:", self);
  objc_initWeak(buf, self);
  v17 = objc_alloc_init((Class)AKAppleIDAuthenticationController);
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_1000049D8;
  v19[3] = &unk_10000C480;
  objc_copyWeak(&v21, buf);
  v18 = v17;
  v20 = v18;
  objc_msgSend(v18, "authenticateWithContext:completion:", v8, v19);

  objc_destroyWeak(&v21);
  objc_destroyWeak(buf);

}

- (void)_passwordResetDidFinishWithResult:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  _QWORD *v15;
  void *v16;
  _QWORD *v17;
  _QWORD v18[4];
  id v19;
  id v20;
  _QWORD v21[4];
  id v22;
  id buf[2];

  v6 = a3;
  v7 = a4;
  v9 = _AKLogSystem(v7, v8);
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Password reset flow finished", (uint8_t *)buf, 2u);
  }

  v13 = _AKLogSystem(v11, v12);
  v14 = objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    sub_100006760((uint64_t)v6, (uint64_t)v7, v14);

  objc_initWeak(buf, self);
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_100004E00;
  v21[3] = &unk_10000C4A8;
  objc_copyWeak(&v22, buf);
  v15 = objc_retainBlock(v21);
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[AKPasswordResetRemoteViewController hostProxy](self, "hostProxy"));
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_100004EDC;
  v18[3] = &unk_10000C4F8;
  objc_copyWeak(&v20, buf);
  v17 = v15;
  v19 = v17;
  objc_msgSend(v16, "passwordResetFinishedWithResult:error:completion:", v6, v7, v18);

  objc_destroyWeak(&v20);
  objc_destroyWeak(&v22);
  objc_destroyWeak(buf);

}

- (AKAppleIDAuthenticationContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
  objc_storeStrong((id *)&self->_context, a3);
}

- (UIViewController)fullscreenBackDropViewController
{
  return self->_fullscreenBackDropViewController;
}

- (void)setFullscreenBackDropViewController:(id)a3
{
  objc_storeStrong((id *)&self->_fullscreenBackDropViewController, a3);
}

- (UINavigationController)rootNavigationController
{
  return self->_rootNavigationController;
}

- (void)setRootNavigationController:(id)a3
{
  objc_storeStrong((id *)&self->_rootNavigationController, a3);
}

- (UIViewController)passwordResetController
{
  return self->_passwordResetController;
}

- (void)setPasswordResetController:(id)a3
{
  objc_storeStrong((id *)&self->_passwordResetController, a3);
}

- (AKPasswordResetPresenterHostProtocol)hostProxy
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
  objc_storeStrong((id *)&self->_passwordResetController, 0);
  objc_storeStrong((id *)&self->_rootNavigationController, 0);
  objc_storeStrong((id *)&self->_fullscreenBackDropViewController, 0);
  objc_storeStrong((id *)&self->_context, 0);
}

@end
