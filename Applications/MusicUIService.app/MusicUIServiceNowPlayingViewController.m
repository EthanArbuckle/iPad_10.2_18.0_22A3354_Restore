@implementation MusicUIServiceNowPlayingViewController

- (void)viewDidLayoutSubviews
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)MusicUIServiceNowPlayingViewController;
  -[MusicUIServiceNowPlayingViewController viewDidLayoutSubviews](&v13, "viewDidLayoutSubviews");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MusicUIServiceNowPlayingViewController view](self, "view"));
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[MRUViewServiceViewController view](self->_remoteViewController, "view"));
  objc_msgSend(v12, "setFrame:", v5, v7, v9, v11);

}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MusicUIServiceNowPlayingViewController;
  -[MusicUIServiceNowPlayingViewController viewWillAppear:](&v4, "viewWillAppear:", a3);
  -[MRUViewServiceViewController transitionToVisible:animated:](self->_remoteViewController, "transitionToVisible:animated:", 1, 1);
}

- (void)viewDidDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MusicUIServiceNowPlayingViewController;
  -[MusicUIServiceNowPlayingViewController viewDidDisappear:](&v4, "viewDidDisappear:", a3);
  -[MusicUIServiceNowPlayingViewController cleanup](self, "cleanup");
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (id)childViewControllerForStatusBarHidden
{
  return self->_remoteViewController;
}

+ (BOOL)_isSecureForRemoteViewService
{
  return 1;
}

- (BOOL)_shouldRemoveViewFromHierarchyOnDisappear
{
  return 0;
}

- (void)configureWithContext:(id)a3 completion:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  MRUViewServiceViewController *v12;
  MRUViewServiceViewController *remoteViewController;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  MPMediaControlsProtocol *hostProxy;
  id v22;
  objc_super v23;
  _QWORD v24[4];
  id v25;
  _QWORD v26[4];
  id v27;
  id buf[2];

  v6 = a3;
  v22 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MusicUIServiceNowPlayingViewController _remoteViewControllerProxy](self, "_remoteViewControllerProxy"));
  objc_msgSend(v7, "setSwipeDismissalStyle:", 1);
  objc_msgSend(v7, "setDismissalAnimationStyle:", 0);
  objc_msgSend(v7, "setDesiredHardwareButtonEvents:", 16);
  objc_msgSend(v7, "setAllowsMenuButtonDismissal:", 1);
  objc_msgSend(v7, "setAllowsAlertStacking:", 1);
  objc_msgSend(v7, "setSceneDeactivationReason:", 0);
  objc_msgSend(v7, "setOrientationChangedEventsEnabled:", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "userInfo"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", kMRMediaRemoteMediaControlsConfigurationKey));

  if (v9)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "Successfully deserialized the initial media controls configuration.", (uint8_t *)buf, 2u);
    }
    v10 = +[NSKeyedUnarchiver unarchivedObjectOfClass:fromData:error:](NSKeyedUnarchiver, "unarchivedObjectOfClass:fromData:error:", objc_opt_class(MPMediaControlsConfiguration), v9, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    v12 = (MRUViewServiceViewController *)objc_claimAutoreleasedReturnValue(+[MRUViewServiceProvider viewControllerForConfiguration:](MRUViewServiceProvider, "viewControllerForConfiguration:", v11));
    remoteViewController = self->_remoteViewController;
    self->_remoteViewController = v12;

    -[MRUViewServiceViewController setConfiguration:](self->_remoteViewController, "setConfiguration:", v11);
    objc_initWeak(buf, self);
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = sub_1000054AC;
    v26[3] = &unk_10000C2C0;
    objc_copyWeak(&v27, buf);
    -[MRUViewServiceViewController setDismissalBlock:](self->_remoteViewController, "setDismissalBlock:", v26);
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_1000054D8;
    v24[3] = &unk_10000C2E8;
    objc_copyWeak(&v25, buf);
    -[MRUViewServiceViewController setCustomRowTappedBlock:](self->_remoteViewController, "setCustomRowTappedBlock:", v24);
    -[MusicUIServiceNowPlayingViewController addChildViewController:](self, "addChildViewController:", self->_remoteViewController);
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[MusicUIServiceNowPlayingViewController view](self, "view"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[MRUViewServiceViewController view](self->_remoteViewController, "view"));
    objc_msgSend(v14, "addSubview:", v15);

    -[MRUViewServiceViewController didMoveToParentViewController:](self->_remoteViewController, "didMoveToParentViewController:", self);
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[MusicUIServiceNowPlayingViewController view](self, "view"));
    objc_msgSend(v16, "setNeedsLayout");

    -[MusicUIServiceNowPlayingViewController setNeedsStatusBarAppearanceUpdate](self, "setNeedsStatusBarAppearanceUpdate");
    objc_destroyWeak(&v25);
    objc_destroyWeak(&v27);
    objc_destroyWeak(buf);

  }
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "xpcEndpoint"));

  if (v17)
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "xpcEndpoint"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[MusicUIServiceNowPlayingViewController connectionWithEndpoint:](self, "connectionWithEndpoint:", v18));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "remoteObjectProxyWithErrorHandler:", &stru_10000C328));

    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "Attempting to open connection to host app.", (uint8_t *)buf, 2u);
    }
    objc_msgSend(v20, "openConnection");
    hostProxy = self->_hostProxy;
    self->_hostProxy = (MPMediaControlsProtocol *)v20;

  }
  v23.receiver = self;
  v23.super_class = (Class)MusicUIServiceNowPlayingViewController;
  -[MusicUIServiceNowPlayingViewController configureWithContext:completion:](&v23, "configureWithContext:completion:", v6, v22);

}

- (void)handleButtonActions:(id)a3
{
  _QWORD v3[5];

  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100005614;
  v3[3] = &unk_10000C350;
  v3[4] = self;
  objc_msgSend(a3, "enumerateObjectsUsingBlock:", v3);
}

- (void)updateMediaControlsWithConfiguration:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;
  uint8_t buf[4];
  void *v11;

  v4 = a3;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "presentingAppBundleID"));
    *(_DWORD *)buf = 138412290;
    v11 = v5;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "Received updated media controls configuration from:  %@", buf, 0xCu);

  }
  objc_initWeak((id *)buf, self);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000057E4;
  v7[3] = &unk_10000C378;
  objc_copyWeak(&v9, (id *)buf);
  v8 = v4;
  v6 = v4;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v7);

  objc_destroyWeak(&v9);
  objc_destroyWeak((id *)buf);
}

- (void)customRowDidTap:(id)a3
{
  id v4;
  MPMediaControlsProtocol *hostProxy;
  int v6;
  id v7;

  v4 = a3;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    v6 = 138412290;
    v7 = v4;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "Custom row did tap: %@", (uint8_t *)&v6, 0xCu);
  }
  hostProxy = self->_hostProxy;
  if (hostProxy)
    -[MPMediaControlsProtocol setTappedCustomRowIdentifier:](hostProxy, "setTappedCustomRowIdentifier:", v4);
  -[MusicUIServiceNowPlayingViewController cleanup](self, "cleanup");

}

- (void)cleanup
{
  void *v3;
  MRUViewServiceViewController *remoteViewController;
  id v5;

  -[NSXPCConnection invalidate](self->_connection, "invalidate");
  v5 = (id)objc_claimAutoreleasedReturnValue(-[MusicUIServiceNowPlayingViewController _remoteViewControllerProxy](self, "_remoteViewControllerProxy"));
  objc_msgSend(v5, "deactivate");
  objc_msgSend(v5, "invalidate");
  -[MRUViewServiceViewController willMoveToParentViewController:](self->_remoteViewController, "willMoveToParentViewController:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MRUViewServiceViewController view](self->_remoteViewController, "view"));
  objc_msgSend(v3, "removeFromSuperview");

  -[MRUViewServiceViewController removeFromParentViewController](self->_remoteViewController, "removeFromParentViewController");
  remoteViewController = self->_remoteViewController;
  self->_remoteViewController = 0;

}

- (id)connectionWithEndpoint:(id)a3
{
  id v4;
  NSXPCConnection *connection;
  id v6;
  NSXPCConnection *v7;
  NSXPCConnection *v8;
  void *v9;
  void *v10;
  NSXPCConnection *v11;
  _QWORD v13[4];
  id v14;
  id buf[2];

  v4 = a3;
  connection = self->_connection;
  if (!connection)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "Creating XPC connection to host app.", (uint8_t *)buf, 2u);
    }
    v6 = objc_alloc_init((Class)NSXPCListenerEndpoint);
    objc_msgSend(v6, "_setEndpoint:", v4);
    v7 = (NSXPCConnection *)objc_msgSend(objc_alloc((Class)NSXPCConnection), "initWithListenerEndpoint:", v6);
    v8 = self->_connection;
    self->_connection = v7;

    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCInterface interfaceWithProtocol:](NSXPCInterface, "interfaceWithProtocol:", &OBJC_PROTOCOL___MPMediaControlsProtocol));
    -[NSXPCConnection setRemoteObjectInterface:](self->_connection, "setRemoteObjectInterface:", v9);

    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCInterface interfaceWithProtocol:](NSXPCInterface, "interfaceWithProtocol:", &OBJC_PROTOCOL___MPMediaControlsRemoteViewControllerProtocol));
    -[NSXPCConnection setExportedInterface:](self->_connection, "setExportedInterface:", v10);

    -[NSXPCConnection setExportedObject:](self->_connection, "setExportedObject:", self);
    objc_initWeak(buf, self);
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_100005B60;
    v13[3] = &unk_10000C2C0;
    objc_copyWeak(&v14, buf);
    -[NSXPCConnection setInvalidationHandler:](self->_connection, "setInvalidationHandler:", v13);
    -[NSXPCConnection resume](self->_connection, "resume");
    objc_destroyWeak(&v14);
    objc_destroyWeak(buf);

    connection = self->_connection;
  }
  v11 = connection;

  return v11;
}

- (MRUViewServiceViewController)remoteViewController
{
  return self->_remoteViewController;
}

- (void)setRemoteViewController:(id)a3
{
  objc_storeStrong((id *)&self->_remoteViewController, a3);
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
  objc_storeStrong((id *)&self->_connection, a3);
}

- (MPMediaControlsProtocol)hostProxy
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
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_remoteViewController, 0);
}

@end
