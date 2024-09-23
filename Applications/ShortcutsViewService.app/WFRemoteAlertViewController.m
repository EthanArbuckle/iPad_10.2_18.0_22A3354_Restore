@implementation WFRemoteAlertViewController

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (WFRemoteAlertViewController)init
{
  WFRemoteAlertViewController *v2;
  WFCompactHostingViewController *v3;
  WFCompactHostingViewController *compactViewController;
  WFRemoteAlertViewController *v5;
  char v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)WFRemoteAlertViewController;
  v2 = -[WFRemoteAlertViewController init](&v8, "init");
  if (v2)
  {
    v7 = 0;
    v3 = (WFCompactHostingViewController *)objc_msgSend(objc_alloc((Class)WFCompactHostingViewController), "initWithScreenLocked:delegate:", SBSGetScreenLockStatus(&v7) != 0, v2);
    compactViewController = v2->_compactViewController;
    v2->_compactViewController = v3;

    v5 = v2;
  }

  return v2;
}

- (void)configureWithContext:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(_QWORD);
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  void *v28;
  id v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  id v35;
  NSObject *v36;
  id v37;
  int v38;
  const char *v39;

  v6 = a3;
  v7 = (void (**)(_QWORD))a4;
  v8 = sub_1000076E8();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v38 = 136315138;
    v39 = "-[WFRemoteAlertViewController configureWithContext:completion:]";
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%s Configuring", (uint8_t *)&v38, 0xCu);
  }

  +[WFInitialization initializeProcessWithDatabase:](WFInitialization, "initializeProcessWithDatabase:", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[WFRemoteAlertViewController _remoteViewControllerProxy](self, "_remoteViewControllerProxy"));
  objc_msgSend(v10, "setWallpaperStyle:withDuration:", 6, 0.0);
  objc_msgSend(v10, "setDesiredHardwareButtonEvents:", 16);
  objc_msgSend(v10, "setSwipeDismissalStyle:", 1);
  objc_msgSend(v10, "setAllowsAlertStacking:", 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[WFRemoteAlertViewController compactViewController](self, "compactViewController"));
  -[WFRemoteAlertViewController addChildViewController:](self, "addChildViewController:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "view"));
  objc_msgSend(v12, "setAutoresizingMask:", 18);

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[WFRemoteAlertViewController view](self, "view"));
  objc_msgSend(v13, "bounds");
  v15 = v14;
  v17 = v16;
  v19 = v18;
  v21 = v20;
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "view"));
  objc_msgSend(v22, "setFrame:", v15, v17, v19, v21);

  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "view"));
  objc_msgSend(v23, "setTranslatesAutoresizingMaskIntoConstraints:", 1);

  v24 = (void *)objc_claimAutoreleasedReturnValue(-[WFRemoteAlertViewController view](self, "view"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "view"));
  objc_msgSend(v24, "addSubview:", v25);

  objc_msgSend(v11, "didMoveToParentViewController:", self);
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "xpcEndpoint"));

  if (v26)
  {
    v27 = objc_alloc_init((Class)NSXPCListenerEndpoint);
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "xpcEndpoint"));
    -[NSObject _setEndpoint:](v27, "_setEndpoint:", v28);

    v29 = objc_msgSend(objc_alloc((Class)NSXPCConnection), "initWithListenerEndpoint:", v27);
    v30 = WFDialogXPCInterface(objc_msgSend(v29, "setExportedObject:", self));
    v31 = (void *)objc_claimAutoreleasedReturnValue(v30);
    objc_msgSend(v29, "setExportedInterface:", v31);

    objc_msgSend(v29, "setInterruptionHandler:", &stru_100010478);
    objc_msgSend(v29, "setInvalidationHandler:", &stru_100010498);
    objc_msgSend(v29, "resume");
    v32 = WFDialogXPCHostInterface(-[WFRemoteAlertViewController setXpcConnection:](self, "setXpcConnection:", v29));
    v33 = (void *)objc_claimAutoreleasedReturnValue(v32);
    objc_msgSend(v29, "setRemoteObjectInterface:", v33);

    v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "remoteObjectProxy"));
    objc_msgSend(v34, "beginConnection");

    v35 = sub_1000076E8();
    v36 = objc_claimAutoreleasedReturnValue(v35);
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
    {
      v38 = 136315138;
      v39 = "-[WFRemoteAlertViewController configureWithContext:completion:]";
      _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "%s Opened XPC connection to specified endpoint", (uint8_t *)&v38, 0xCu);
    }

  }
  else
  {
    v37 = sub_1000076E8();
    v27 = objc_claimAutoreleasedReturnValue(v37);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      v38 = 136315138;
      v39 = "-[WFRemoteAlertViewController configureWithContext:completion:]";
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "%s No XPC endpoint to connect to", (uint8_t *)&v38, 0xCu);
    }
  }

  if (v7)
    v7[2](v7);

}

- (unint64_t)supportedInterfaceOrientations
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[WFRemoteAlertViewController compactViewController](self, "compactViewController"));
  v3 = objc_msgSend(v2, "supportedInterfaceOrientations");

  return (unint64_t)v3;
}

- (void)prepareForActivationWithContext:(id)a3 completion:(id)a4
{
  void (**v4)(_QWORD);
  id v5;
  NSObject *v6;
  int v7;
  const char *v8;

  v4 = (void (**)(_QWORD))a4;
  v5 = sub_1000076E8();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 136315138;
    v8 = "-[WFRemoteAlertViewController prepareForActivationWithContext:completion:]";
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s Preparing for activation", (uint8_t *)&v7, 0xCu);
  }

  if (v4)
    v4[2](v4);

}

- (void)handleButtonActions:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  _QWORD *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[5];
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  id v18;

  v4 = a3;
  v5 = sub_1000076E8();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v16 = "-[WFRemoteAlertViewController handleButtonActions:]";
    v17 = 2114;
    v18 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%s Received button actions: %{public}@", buf, 0x16u);
  }

  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100007860;
  v14[3] = &unk_1000105B0;
  v14[4] = self;
  v7 = objc_retainBlock(v14);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[WFRemoteAlertViewController compactViewController](self, "compactViewController"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "actionInterfaceListener"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "actionInterface"));

  if (v10)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[WFRemoteAlertViewController compactViewController](self, "compactViewController"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "actionInterfaceListener"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "actionInterface"));
    objc_msgSend(v13, "cancelPresentationWithCompletionHandler:", v7);

  }
  else
  {
    ((void (*)(_QWORD *))v7[2])(v7);
  }

}

- (BOOL)_shouldRemoveViewFromHierarchyOnDisappear
{
  return 0;
}

- (int64_t)preferredStatusBarStyle
{
  return -1;
}

- (int)_preferredStatusBarVisibility
{
  return 0;
}

- (void)preparePersistentChromeWithContext:(id)a3 attribution:(id)a4
{
  id v6;
  id v7;
  id v8;
  NSObject *v9;
  id v10;
  id v11;
  _QWORD block[5];
  id v13;
  id v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  id v18;
  __int16 v19;
  id v20;

  v6 = a3;
  v7 = a4;
  v8 = sub_1000076E8();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v16 = "-[WFRemoteAlertViewController preparePersistentChromeWithContext:attribution:]";
    v17 = 2112;
    v18 = v6;
    v19 = 2112;
    v20 = v7;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%s Received running context: %@, attribution: %@", buf, 0x20u);
  }

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100007820;
  block[3] = &unk_1000104C0;
  block[4] = self;
  v13 = v6;
  v14 = v7;
  v10 = v7;
  v11 = v6;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

}

- (void)showDialogRequest:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  id v8;
  NSObject *v9;
  id v10;
  id v11;
  _QWORD block[5];
  id v13;
  id v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  id v18;

  v6 = a3;
  v7 = a4;
  v8 = sub_1000076E8();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v16 = "-[WFRemoteAlertViewController showDialogRequest:completionHandler:]";
    v17 = 2114;
    v18 = v6;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%s Showing dialog request: %{public}@", buf, 0x16u);
  }

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000077E0;
  block[3] = &unk_1000104E8;
  block[4] = self;
  v13 = v6;
  v14 = v7;
  v10 = v7;
  v11 = v6;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

}

- (void)dismissPresentedContentWithCompletionHandler:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  id v7;
  _QWORD v8[5];
  id v9;
  uint8_t buf[4];
  const char *v11;

  v4 = a3;
  v5 = sub_1000076E8();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    v11 = "-[WFRemoteAlertViewController dismissPresentedContentWithCompletionHandler:]";
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "%s Dismissing presented content", buf, 0xCu);
  }

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000077A0;
  v8[3] = &unk_100010510;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v8);

}

- (void)dismissPersistentChromeWithSuccess:(BOOL)a3 customAttribution:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;
  BOOL v17;
  uint8_t buf[4];
  const char *v19;

  v8 = a4;
  v9 = a5;
  v10 = sub_1000076E8();
  v11 = objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    v19 = "-[WFRemoteAlertViewController dismissPersistentChromeWithSuccess:customAttribution:completionHandler:]";
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "%s Dismissing chrome", buf, 0xCu);
  }

  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100007728;
  v14[3] = &unk_100010538;
  v17 = a3;
  v14[4] = self;
  v15 = v8;
  v16 = v9;
  v12 = v9;
  v13 = v8;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v14);

}

- (void)hostingViewControllerDidRequestExit:(id)a3
{
  void *v3;
  void *v4;
  uint64_t WFDialogLogObject;
  NSObject *v6;
  int v7;
  const char *v8;
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  void *v12;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[WFRemoteAlertViewController xpcConnection](self, "xpcConnection", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "remoteObjectProxy"));

  WFDialogLogObject = getWFDialogLogObject();
  v6 = objc_claimAutoreleasedReturnValue(WFDialogLogObject);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 136315650;
    v8 = "-[WFRemoteAlertViewController hostingViewControllerDidRequestExit:]";
    v9 = 2114;
    v10 = WFViewServiceDismissalReasonBadState;
    v11 = 2112;
    v12 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s Requesting dismissal with reason: %{public}@. host interface: %@", (uint8_t *)&v7, 0x20u);
  }

  objc_msgSend(v4, "requestDismissalWithReason:", WFViewServiceDismissalReasonBadState);
}

- (NSXPCConnection)xpcConnection
{
  return self->_xpcConnection;
}

- (void)setXpcConnection:(id)a3
{
  objc_storeStrong((id *)&self->_xpcConnection, a3);
}

- (WFCompactHostingViewController)compactViewController
{
  return self->_compactViewController;
}

- (void)setCompactViewController:(id)a3
{
  objc_storeStrong((id *)&self->_compactViewController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_compactViewController, 0);
  objc_storeStrong((id *)&self->_xpcConnection, 0);
}

+ (BOOL)_isSecureForRemoteViewService
{
  return 1;
}

@end
