@implementation STRemoteServiceViewController

- (void)viewWillAppear:(BOOL)a3
{
  uint8_t v4[16];
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)STRemoteServiceViewController;
  -[STRemoteServiceViewController viewWillAppear:](&v5, "viewWillAppear:", a3);
  -[STRemoteServiceViewController showRestrictionsPINControllerWithMode:](self, "showRestrictionsPINControllerWithMode:", -[STRemoteServiceViewController passcodeMode](self, "passcodeMode"));
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "STUI:: STRemoteServiceViewController.viewWillAppear", v4, 2u);
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint8_t v7[16];
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)STRemoteServiceViewController;
  -[STRemoteServiceViewController viewDidAppear:](&v8, "viewDidAppear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[STRemoteServiceViewController view](self, "view"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "window"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "_rootSheetPresentationController"));
  objc_msgSend(v6, "_setShouldScaleDownBehindDescendantSheets:", 0);

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "STUI:: STRemoteServiceViewController.viewDidAppear", v7, 2u);
  }
}

- (void)viewDidDisappear:(BOOL)a3
{
  uint8_t v4[16];
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)STRemoteServiceViewController;
  -[STRemoteServiceViewController viewDidDisappear:](&v5, "viewDidDisappear:", a3);
  -[STRemoteServiceViewController _providePINToClient:](self, "_providePINToClient:", 0);
  -[STRemoteServiceViewController _provideAuthenticationResultToClient:](self, "_provideAuthenticationResultToClient:", 0);
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "STUI:: STRemoteServiceViewController.viewDidDisappear", v4, 2u);
  }
}

- (void)viewDidLoad
{
  uint8_t v2[16];
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)STRemoteServiceViewController;
  -[STRemoteServiceViewController viewDidLoad](&v3, "viewDidLoad");
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v2 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "STUI:: STRemoteServiceViewController.viewDidLoad", v2, 2u);
  }
}

+ (void)dismissPinController
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_10000D330, "_remoteViewControllerProxy"));
  objc_msgSend(v2, "dismiss");

  v3 = (void *)qword_10000D330;
  qword_10000D330 = 0;

}

- (STRemoteServiceViewController)init
{
  STRemoteServiceViewController *v2;
  STRemoteServiceViewController *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)STRemoteServiceViewController;
  v2 = -[STRemoteServiceViewController init](&v5, "init");
  v3 = v2;
  if (v2)
  {
    objc_msgSend((id)objc_opt_class(v2), "dismissPinController");
    objc_storeStrong((id *)&qword_10000D330, v3);
  }
  return v3;
}

- (void)_willAppearInRemoteViewController
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)STRemoteServiceViewController;
  -[STRemoteServiceViewController _willAppearInRemoteViewController](&v4, "_willAppearInRemoteViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[STRemoteServiceViewController _remoteViewControllerProxy](self, "_remoteViewControllerProxy"));
  objc_msgSend(v3, "setStyleOverridesToCancel:animationSettings:", -1048577, 0);

}

- (void)configureWithContext:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(_QWORD);
  void *v8;
  void *v9;
  STLockoutAppContext *v10;
  STLockoutAppContext *appContext;
  void *v12;
  void *v13;
  id v14;
  STRemoteServiceViewController *v15;
  NSObject *v16;
  void *v17;
  NSXPCListenerEndpoint *v18;
  void *v19;
  id v20;
  int64_t v21;
  int v22;
  __objc2_prot **v23;
  __objc2_prot **v24;
  void *v25;
  void *v26;
  uint8_t v27[16];

  v6 = a3;
  v7 = (void (**)(_QWORD))a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "userInfo"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("STRemoteServiceUserInfoContextData")));

  if (v9)
  {
    v10 = (STLockoutAppContext *)objc_claimAutoreleasedReturnValue(+[STLockoutAppContext contextWithData:](STLockoutAppContext, "contextWithData:", v9));
    appContext = self->_appContext;
    self->_appContext = v10;
  }
  else
  {
    appContext = self->_appContext;
    self->_appContext = 0;
  }

  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "userInfo"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", STRemoteAlertConfigurationContextKeyPasscodeMode));

  if (v13)
  {
    v14 = objc_msgSend(v13, "integerValue");
    v15 = self;
  }
  else
  {
    v16 = objc_claimAutoreleasedReturnValue(+[STLog remoteViewService](STLog, "remoteViewService"));
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v27 = 0;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Defaulting remote view service to auth mode.", v27, 2u);
    }

    v15 = self;
    v14 = 0;
  }
  -[STRemoteServiceViewController setPasscodeMode:](v15, "setPasscodeMode:", v14);
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "xpcEndpoint"));

  if (v17)
  {
    v18 = objc_opt_new(NSXPCListenerEndpoint);
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "xpcEndpoint"));
    -[NSXPCListenerEndpoint _setEndpoint:](v18, "_setEndpoint:", v19);

    v20 = objc_msgSend(objc_alloc((Class)NSXPCConnection), "initWithListenerEndpoint:", v18);
    v21 = -[STRemoteServiceViewController passcodeMode](self, "passcodeMode");
    if (v21 == 1)
    {
      v22 = _os_feature_enabled_impl("ScreenTime", "simplified_agent");
      v23 = &protocolRef_STPasscodeReceiverInterface;
      v24 = &protocolRef_STPasscodeReceiverProtocol;
    }
    else
    {
      if (v21)
      {
LABEL_17:
        objc_msgSend(v20, "resume");
        -[STRemoteServiceViewController setClientConnection:](self, "setClientConnection:", v20);

        goto LABEL_18;
      }
      v22 = _os_feature_enabled_impl("ScreenTime", "simplified_agent");
      v23 = &protocolRef_STPasscodeAuthenticationResultReceiverInterface;
      v24 = &protocolRef_STPasscodeAuthenticationResultReceiverProtocol;
    }
    if (v22)
      v23 = v24;
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCInterface interfaceWithProtocol:](NSXPCInterface, "interfaceWithProtocol:", *v23));
    objc_msgSend(v20, "setRemoteObjectInterface:", v25);

    goto LABEL_17;
  }
LABEL_18:
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[STRemoteServiceViewController _remoteViewControllerProxy](self, "_remoteViewControllerProxy"));
  objc_msgSend(v26, "setDesiredHardwareButtonEvents:", 16);

  if (v7)
    v7[2](v7);

}

- (void)handleButtonActions:(id)a3
{
  -[STRemoteServiceViewController _dismissPINControllerWithCompletionHandler:](self, "_dismissPINControllerWithCompletionHandler:", &stru_100008270);
}

- (void)showRestrictionsPINControllerWithMode:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  STRestrictionsPINNavigationController *v10;
  uint8_t v11[16];
  uint8_t buf[16];

  if ((byte_10000D338 & 1) == 0)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[PSListController appearance](PSListController, "appearance"));
    objc_msgSend(v6, "setTextColor:", v5);

    byte_10000D338 = 1;
  }
  v7 = (void *)objc_opt_new(STRestrictionsPINController);
  objc_msgSend(v7, "setPinDelegate:", self);
  if (a3 == 1)
  {
    v8 = objc_claimAutoreleasedReturnValue(+[STLog remoteViewService](STLog, "remoteViewService"));
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Showing restrictions controller in Set mode", v11, 2u);
    }
    v9 = 0;
    goto LABEL_11;
  }
  if (!a3)
  {
    v8 = objc_claimAutoreleasedReturnValue(+[STLog remoteViewService](STLog, "remoteViewService"));
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Showing restrictions controller in Auth mode", buf, 2u);
    }
    v9 = 3;
LABEL_11:

    objc_msgSend(v7, "setMode:", v9);
  }
  v10 = -[STRestrictionsPINNavigationController initWithRootViewController:]([STRestrictionsPINNavigationController alloc], "initWithRootViewController:", v7);
  NSLog(CFSTR("presenting restrictions PIN controller"));
  -[STRemoteServiceViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v10, +[STRestrictionsPINNavigationController st_shouldAnimate](STRestrictionsPINNavigationController, "st_shouldAnimate"), &stru_1000082D0);

}

- (void)didAcceptEnteredPIN
{
  void *v3;
  _QWORD v4[5];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[STRemoteServiceViewController presentedViewController](self, "presentedViewController"));
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100004064;
  v4[3] = &unk_1000082F8;
  v4[4] = self;
  objc_msgSend(v3, "dismissViewControllerAnimated:completion:", +[STRestrictionsPINNavigationController st_shouldAnimate](STRestrictionsPINNavigationController, "st_shouldAnimate"), v4);

}

- (void)didAcceptSetPIN
{
  -[STRemoteServiceViewController _dismissPINControllerWithCompletionHandler:](self, "_dismissPINControllerWithCompletionHandler:", 0);
}

- (void)didCancelEnteringPIN
{
  -[STRemoteServiceViewController _dismissPINControllerWithCompletionHandler:](self, "_dismissPINControllerWithCompletionHandler:", 0);
  -[STRemoteServiceViewController _providePINToClient:](self, "_providePINToClient:", 0);
  -[STRemoteServiceViewController _provideAuthenticationResultToClient:](self, "_provideAuthenticationResultToClient:", 0);
}

- (void)_dismissPINControllerWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  _BOOL8 v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[STRemoteServiceViewController presentedViewController](self, "presentedViewController"));
  v6 = +[STRestrictionsPINNavigationController st_shouldAnimate](STRestrictionsPINNavigationController, "st_shouldAnimate");
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100004180;
  v8[3] = &unk_100008320;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  objc_msgSend(v5, "dismissViewControllerAnimated:completion:", v6, v8);

}

- (void)devicePINControllerDidDismissPINPane:(id)a3
{
  -[STRemoteServiceViewController _restrictionsPINControllerDidDismiss:](self, "_restrictionsPINControllerDidDismiss:", objc_msgSend(a3, "success"));
  -[STRemoteServiceViewController _providePINToClient:](self, "_providePINToClient:", 0);
  -[STRemoteServiceViewController _provideAuthenticationResultToClient:](self, "_provideAuthenticationResultToClient:", 0);
}

- (void)_restrictionsPINControllerDidDismiss:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;

  v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDistributedNotificationCenter defaultCenter](NSDistributedNotificationCenter, "defaultCenter"));
  v6 = STRestrictionsPINControllerDidFinishNotification;
  v10 = STNotificationKeyPINSuccess;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v3));
  v11 = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v11, &v10, 1));
  objc_msgSend(v5, "postNotificationName:object:userInfo:deliverImmediately:", v6, 0, v8, 1);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[STRemoteServiceViewController _remoteViewControllerProxy](self, "_remoteViewControllerProxy"));
  objc_msgSend(v9, "dismiss");

}

- (void)_providePINToClient:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  void ***v11;
  void *v12;
  void **v13;
  uint64_t v14;
  void (*v15)(uint64_t, void *);
  void *v16;
  STRemoteServiceViewController *v17;
  void **v18;
  uint64_t v19;
  void (*v20)(uint64_t, void *);
  void *v21;
  STRemoteServiceViewController *v22;

  v4 = a3;
  if (-[STRemoteServiceViewController passcodeMode](self, "passcodeMode"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[STRemoteServiceViewController clientConnection](self, "clientConnection"));

    if (v5)
    {
      if (v4)
        v6 = objc_msgSend(objc_alloc((Class)STOpaquePasscode), "initWithPasscode:", v4);
      else
        v6 = 0;
      v7 = _os_feature_enabled_impl("ScreenTime", "simplified_agent");
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[STRemoteServiceViewController clientConnection](self, "clientConnection"));
      v9 = v8;
      if (v7)
      {
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "synchronousRemoteObjectProxyWithErrorHandler:", &stru_100008360));

        v18 = _NSConcreteStackBlock;
        v19 = 3221225472;
        v20 = sub_100004534;
        v21 = &unk_100008388;
        v22 = self;
        v11 = &v18;
      }
      else
      {
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "synchronousRemoteObjectProxyWithErrorHandler:", &stru_1000083A8));

        v13 = _NSConcreteStackBlock;
        v14 = 3221225472;
        v15 = sub_100004670;
        v16 = &unk_100008388;
        v17 = self;
        v11 = &v13;
      }
      objc_msgSend(v10, "receivePasscode:completionHandler:", v6, v11, v13, v14, v15, v16, v17, v18, v19, v20, v21, v22);

      v12 = (void *)objc_claimAutoreleasedReturnValue(-[STRemoteServiceViewController clientConnection](self, "clientConnection"));
      objc_msgSend(v12, "invalidate");

      -[STRemoteServiceViewController setClientConnection:](self, "setClientConnection:", 0);
    }
    else
    {
      v6 = objc_claimAutoreleasedReturnValue(+[STLog remoteViewService](STLog, "remoteViewService"));
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        sub_1000051F8();
    }

  }
}

- (void)_provideAuthenticationResultToClient:(id)a3
{
  BOOL v4;
  void *v5;
  id v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  Block_layout *v11;
  id v12;

  v12 = a3;
  v4 = (id)-[STRemoteServiceViewController passcodeMode](self, "passcodeMode") == (id)1;
  v5 = v12;
  if (!v4)
  {
    if (v12)
      v6 = objc_msgSend(objc_alloc((Class)STAuthenticationResult), "initWithResult:", objc_msgSend(v12, "BOOLValue"));
    else
      v6 = 0;
    v7 = _os_feature_enabled_impl("ScreenTime", "simplified_agent");
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[STRemoteServiceViewController clientConnection](self, "clientConnection"));
    v9 = v8;
    if (v7)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "synchronousRemoteObjectProxyWithErrorHandler:", &stru_1000083C8));

      v11 = &stru_1000083E8;
    }
    else
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "synchronousRemoteObjectProxyWithErrorHandler:", &stru_100008408));

      v11 = &stru_100008428;
    }
    objc_msgSend(v10, "receivePasscodeAuthenticationResult:completionHandler:", v6, v11);

    v5 = v12;
  }

}

- (BOOL)validatePIN:(id)a3 forPINController:(id)a4
{
  unsigned int v5;
  NSObject *v6;
  NSObject *v7;
  uint8_t v9[16];

  v5 = +[SFRestrictionsPasscodeController validatePIN:](SFRestrictionsPasscodeController, "validatePIN:", a3, a4);
  v6 = objc_claimAutoreleasedReturnValue(+[STLog remoteViewService](STLog, "remoteViewService"));
  v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "User did successfully authenticate pin - making call to client", v9, 2u);
    }

    v7 = objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", 1));
    -[STRemoteServiceViewController _provideAuthenticationResultToClient:](self, "_provideAuthenticationResultToClient:", v7);
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    sub_10000537C(v7);
  }

  return v5;
}

- (void)setPIN:(id)a3 forPINController:(id)a4
{
  id v5;
  NSObject *v6;
  uint8_t v7[16];

  v5 = a3;
  v6 = objc_claimAutoreleasedReturnValue(+[STLog remoteViewService](STLog, "remoteViewService"));
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "User did set pin - making call to client", v7, 2u);
  }

  -[STRemoteServiceViewController _providePINToClient:](self, "_providePINToClient:", v5);
}

- (NSXPCConnection)clientConnection
{
  return (NSXPCConnection *)objc_getProperty(self, a2, 16, 1);
}

- (void)setClientConnection:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (int64_t)passcodeMode
{
  return self->_passcodeMode;
}

- (void)setPasscodeMode:(int64_t)a3
{
  self->_passcodeMode = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientConnection, 0);
  objc_storeStrong((id *)&self->_appContext, 0);
}

@end
