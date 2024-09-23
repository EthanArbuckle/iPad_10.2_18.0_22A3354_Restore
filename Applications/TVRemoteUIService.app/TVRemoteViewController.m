@implementation TVRemoteViewController

- (void)viewDidLoad
{
  id v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  objc_super v35;

  v35.receiver = self;
  v35.super_class = (Class)TVRemoteViewController;
  -[TVRemoteViewController viewDidLoad](&v35, "viewDidLoad");
  v3 = objc_alloc_init((Class)TVRUIHintsViewController);
  -[TVRemoteViewController setHintsViewController:](self, "setHintsViewController:", v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVRemoteViewController view](self, "view"));
  objc_msgSend(v4, "bounds");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[TVRemoteViewController hintsViewController](self, "hintsViewController"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "view"));
  objc_msgSend(v14, "setFrame:", v6, v8, v10, v12);

  v15 = objc_alloc_init((Class)TVRUIRemoteViewController);
  -[TVRemoteViewController setRemoteViewController:](self, "setRemoteViewController:", v15);

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[TVRemoteViewController view](self, "view"));
  objc_msgSend(v16, "bounds");
  v18 = v17;
  v20 = v19;
  v22 = v21;
  v24 = v23;
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[TVRemoteViewController remoteViewController](self, "remoteViewController"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "view"));
  objc_msgSend(v26, "setFrame:", v18, v20, v22, v24);

  v27 = (void *)objc_claimAutoreleasedReturnValue(-[TVRemoteViewController remoteViewController](self, "remoteViewController"));
  objc_msgSend(v27, "setDelegate:", self);

  v28 = (void *)objc_claimAutoreleasedReturnValue(-[TVRemoteViewController remoteViewController](self, "remoteViewController"));
  objc_msgSend(v28, "setDeviceConnectionStatusDelegate:", self);

  v29 = (void *)objc_claimAutoreleasedReturnValue(-[TVRemoteViewController remoteViewController](self, "remoteViewController"));
  -[TVRemoteViewController bs_addChildViewController:](self, "bs_addChildViewController:", v29);

  v30 = (void *)objc_claimAutoreleasedReturnValue(-[TVRemoteViewController hintsViewController](self, "hintsViewController"));
  -[TVRemoteViewController bs_addChildViewController:](self, "bs_addChildViewController:", v30);

  v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v31, "addObserver:selector:name:object:", self, "_appWillTerminate:", UIApplicationWillTerminateNotification, 0);

  v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v32, "addObserver:selector:name:object:", self, "sceneDidActivate:", UISceneDidActivateNotification, 0);

  v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v33, "addObserver:selector:name:object:", self, "sceneWillDeactivate:", UISceneWillDeactivateNotification, 0);

  v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v34, "addObserver:selector:name:object:", self, "sceneDidEnterBackground:", UISceneDidEnterBackgroundNotification, 0);

}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (int64_t)overrideUserInterfaceStyle
{
  return 2;
}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  id v5;
  NSObject *v6;
  void *v7;
  unsigned __int8 v8;
  void *v9;
  objc_super v10;
  uint8_t buf[4];
  const char *v12;

  v3 = a3;
  v5 = _TVRUIServiceAppLog();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v12 = "-[TVRemoteViewController viewWillAppear:]";
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  v10.receiver = self;
  v10.super_class = (Class)TVRemoteViewController;
  -[TVRemoteViewController viewWillAppear:](&v10, "viewWillAppear:", v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVRemoteViewController remoteViewController](self, "remoteViewController"));
  v8 = objc_msgSend(v7, "isConfigured");

  if ((v8 & 1) == 0)
    -[TVRemoteViewController _configureWithDefaultContext](self, "_configureWithDefaultContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[TVRemoteViewController remoteViewController](self, "remoteViewController"));
  objc_msgSend(v9, "startConnections");

}

- (void)viewWillDisappear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TVRemoteViewController;
  -[TVRemoteViewController viewWillDisappear:](&v5, "viewWillDisappear:", a3);
  -[TVRemoteViewController _dismissHintsAnimated:](self, "_dismissHintsAnimated:", 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[TipsManager shared](_TtC17TVRemoteUIService11TipsManager, "shared"));
  objc_msgSend(v4, "invalidate");

}

- (void)sceneDidActivate:(id)a3
{
  void *v4;
  id v5;
  NSObject *v6;
  id v7;
  NSObject *v8;
  void *v9;
  int v10;
  const char *v11;
  __int16 v12;
  void *v13;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "object"));
  v5 = _TVRUIServiceAppLog();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 136315394;
    v11 = "-[TVRemoteViewController sceneDidActivate:]";
    v12 = 2112;
    v13 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s - %@", (uint8_t *)&v10, 0x16u);
  }

  if (-[TVRemoteViewController isConnectedToDevice](self, "isConnectedToDevice")
    && -[TVRemoteViewController shouldReplayHints](self, "shouldReplayHints"))
  {
    v7 = _TVRUIServiceAppLog();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v10) = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Replaying hints", (uint8_t *)&v10, 2u);
    }

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[TVRemoteViewController hintsViewController](self, "hintsViewController"));
    objc_msgSend(v9, "replayHints");

    -[TVRemoteViewController setShouldReplayHints:](self, "setShouldReplayHints:", 0);
  }

}

- (void)sceneWillDeactivate:(id)a3
{
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  int v8;
  const char *v9;
  __int16 v10;
  void *v11;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "object"));
  v5 = _TVRUIServiceAppLog();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 136315394;
    v9 = "-[TVRemoteViewController sceneWillDeactivate:]";
    v10 = 2112;
    v11 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s - %@", (uint8_t *)&v8, 0x16u);
  }

  -[TVRemoteViewController _dismissHintsAnimated:](self, "_dismissHintsAnimated:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[TipsManager shared](_TtC17TVRemoteUIService11TipsManager, "shared"));
  objc_msgSend(v7, "invalidate");

}

- (void)_dismissHintsAnimated:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  unsigned int v6;
  id v7;

  v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVRemoteViewController hintsViewController](self, "hintsViewController"));
  v6 = objc_msgSend(v5, "hasPresentedContent");

  if (v6)
  {
    v7 = (id)objc_claimAutoreleasedReturnValue(-[TVRemoteViewController hintsViewController](self, "hintsViewController"));
    objc_msgSend(v7, "dismissPresentedContentAnimated:completion:", v3, 0);

  }
}

- (void)sceneDidEnterBackground:(id)a3
{
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  int v9;
  const char *v10;
  __int16 v11;
  void *v12;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "object"));
  v5 = _TVRUIServiceAppLog();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 136315394;
    v10 = "-[TVRemoteViewController sceneDidEnterBackground:]";
    v11 = 2112;
    v12 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s - %@", (uint8_t *)&v9, 0x16u);
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVRemoteViewController hintsViewController](self, "hintsViewController"));
  objc_msgSend(v7, "remoteWillBeDismissed");

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[TipsManager shared](_TtC17TVRemoteUIService11TipsManager, "shared"));
  objc_msgSend(v8, "invalidate");

}

- (BOOL)isConfigured
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TVRemoteViewController remoteViewController](self, "remoteViewController"));
  v3 = objc_msgSend(v2, "isConfigured");

  return v3;
}

- (void)willEnterLockScreenScene
{
  id v3;
  NSObject *v4;
  void *v5;
  uint8_t v6[16];

  v3 = _TVRUIServiceAppLog();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "willEnterLockScreenScene", v6, 2u);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVRemoteViewController remoteViewController](self, "remoteViewController"));
  objc_msgSend(v5, "setIsInSecureWindow:", 1);

}

- (void)willExitLockScreenScene
{
  id v3;
  NSObject *v4;
  void *v5;
  uint8_t v6[16];

  v3 = _TVRUIServiceAppLog();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "willExitLockScreenScene", v6, 2u);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVRemoteViewController remoteViewController](self, "remoteViewController"));
  objc_msgSend(v5, "setIsInSecureWindow:", 0);

}

- (void)_acquireAppSwitcherAssertion
{
  id v3;
  NSObject *v4;
  _QWORD v5[4];
  id v6;
  id buf[2];

  if (!self->_appSwitcherAssertion)
  {
    v3 = _TVRUIServiceAppLog();
    v4 = objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Acquiring AppSwitcher Assertion", (uint8_t *)buf, 2u);
    }

    objc_initWeak(buf, self);
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = __54__TVRemoteViewController__acquireAppSwitcherAssertion__block_invoke;
    v5[3] = &unk_1000148E0;
    objc_copyWeak(&v6, buf);
    SBSRequestAppSwitcherAppearanceForHiddenApplication(CFSTR("com.apple.TVRemoteUIService"), v5);
    objc_destroyWeak(&v6);
    objc_destroyWeak(buf);
  }
}

void __54__TVRemoteViewController__acquireAppSwitcherAssertion__block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "setAppSwitcherAssertion:", v3);

}

- (void)_releaseAppSwitcherAssertion
{
  id v3;
  NSObject *v4;
  SBSAssertion *appSwitcherAssertion;
  uint8_t v6[16];

  v3 = _TVRUIServiceAppLog();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Releasing AppSwitcher Assertion", v6, 2u);
  }

  -[SBSAssertion invalidate](self->_appSwitcherAssertion, "invalidate");
  appSwitcherAssertion = self->_appSwitcherAssertion;
  self->_appSwitcherAssertion = 0;

}

- (void)_appWillTerminate:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  const char *v7;

  v4 = _TVRUIServiceAppLog();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 136315138;
    v7 = "-[TVRemoteViewController _appWillTerminate:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v6, 0xCu);
  }

  -[TVRemoteViewController dismiss](self, "dismiss");
}

- (void)_dismissPresentedContentAnimated:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  unsigned int v6;
  void *v7;
  void *v8;
  unsigned int v9;
  void *v10;
  id v11;

  v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVRemoteViewController remoteViewController](self, "remoteViewController"));
  v6 = objc_msgSend(v5, "hasPresentedContent");

  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVRemoteViewController remoteViewController](self, "remoteViewController"));
    objc_msgSend(v7, "dismissPresentedContentAnimated:completion:", v3, 0);

  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVRemoteViewController hintsViewController](self, "hintsViewController"));
  v9 = objc_msgSend(v8, "hasPresentedContent");

  if (v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[TVRemoteViewController hintsViewController](self, "hintsViewController"));
    objc_msgSend(v10, "dismissPresentedContentAnimated:completion:", v3, 0);

  }
  v11 = (id)objc_claimAutoreleasedReturnValue(+[TipsManager shared](_TtC17TVRemoteUIService11TipsManager, "shared"));
  objc_msgSend(v11, "invalidate");

}

- (void)_configureWithDefaultContext
{
  id v3;
  NSObject *v4;
  void *v5;
  uint8_t v6[16];

  v3 = _TVRUIServiceAppLog();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Configuring RemoteViewController with default context", v6, 2u);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVRemoteViewController remoteViewController](self, "remoteViewController"));
  objc_msgSend(v5, "configureWithDeviceIdentifier:identifierType:deviceType:launchContext:", 0, TVRViewServiceDeviceIdentifierTypeNone, 0, 1);

}

- (void)configureWithContext:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  void *v7;
  int v8;
  id v9;

  v4 = a3;
  v5 = _TVRUIServiceAppLog();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138543362;
    v9 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Configuring RemoteViewController with context: %{public}@", (uint8_t *)&v8, 0xCu);
  }

  if ((-[TVRemoteViewController isViewLoaded](self, "isViewLoaded") & 1) == 0)
    -[TVRemoteViewController loadViewIfNeeded](self, "loadViewIfNeeded");
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVRemoteViewController remoteViewController](self, "remoteViewController"));
  objc_msgSend(v7, "configureWithContext:", v4);

}

- (void)dismiss
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint8_t v9[16];

  v3 = _TVRUIServiceAppLog();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Dismissing HintsViewController and RemoteViewController", v9, 2u);
  }

  -[TVRemoteViewController _dismissPresentedContentAnimated:](self, "_dismissPresentedContentAnimated:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVRemoteViewController hintsViewController](self, "hintsViewController"));
  objc_msgSend(v5, "remoteWillBeDismissed");

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVRemoteViewController hintsViewController](self, "hintsViewController"));
  objc_msgSend(v6, "dismissHints");

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVRemoteViewController remoteViewController](self, "remoteViewController"));
  objc_msgSend(v7, "_disconnectUserInitiated");

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVRemoteViewController remoteViewController](self, "remoteViewController"));
  objc_msgSend(v8, "stopConnections");

}

- (unint64_t)supportedInterfaceOrientations
{
  void *v2;
  unint64_t v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TVRemoteViewController traitCollection](self, "traitCollection"));
  if (objc_msgSend(v2, "userInterfaceIdiom") == (id)1)
    v3 = 30;
  else
    v3 = 2;

  return v3;
}

- (BOOL)prefersStatusBarHidden
{
  return 1;
}

- (void)deviceDidConnect
{
  id v3;
  NSObject *v4;
  dispatch_time_t v5;
  _QWORD block[5];
  uint8_t buf[16];

  v3 = _TVRUIServiceAppLog();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Device did connect. Acquiring AppSwitcher assertion", buf, 2u);
  }

  -[TVRemoteViewController setIsConnectedToDevice:](self, "setIsConnectedToDevice:", 1);
  -[TVRemoteViewController _acquireAppSwitcherAssertion](self, "_acquireAppSwitcherAssertion");
  v5 = dispatch_time(0, 1000000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __42__TVRemoteViewController_deviceDidConnect__block_invoke;
  block[3] = &unk_100014908;
  block[4] = self;
  dispatch_after(v5, (dispatch_queue_t)&_dispatch_main_q, block);
}

id __42__TVRemoteViewController_deviceDidConnect__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "presentFindMyTip");
}

- (void)deviceDidDisconnect
{
  id v3;
  NSObject *v4;
  uint8_t v5[16];

  v3 = _TVRUIServiceAppLog();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Device did disconnect. Releasing AppSwitcher assertion", v5, 2u);
  }

  -[TVRemoteViewController setIsConnectedToDevice:](self, "setIsConnectedToDevice:", 0);
  -[TVRemoteViewController _releaseAppSwitcherAssertion](self, "_releaseAppSwitcherAssertion");
}

- (void)presentFindMyTip
{
  void *v3;
  unsigned __int8 v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  id v9;
  uint8_t buf[16];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVRemoteViewController remoteViewController](self, "remoteViewController"));
  v4 = objc_msgSend(v3, "isInSecureWindow");

  if ((v4 & 1) != 0)
  {
    v5 = _TVRUIServiceAppLog();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Not showing the mini tip since the view controller is in a secure window", buf, 2u);
    }

  }
  else
  {
    v9 = (id)objc_claimAutoreleasedReturnValue(+[TipsManager shared](_TtC17TVRemoteUIService11TipsManager, "shared"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVRemoteViewController remoteViewController](self, "remoteViewController"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "tipSourceViewProvider"));
    objc_msgSend(v9, "updatePresentingViewController:", v8);

    objc_msgSend(v9, "presentTip");
  }
}

- (void)device:(id)a3 supportsSiri:(BOOL)a4 volume:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL8 v6;
  id v8;
  id v9;

  v5 = a5;
  v6 = a4;
  v8 = a3;
  v9 = (id)objc_claimAutoreleasedReturnValue(-[TVRemoteViewController hintsViewController](self, "hintsViewController"));
  objc_msgSend(v9, "device:supportsSiri:volume:", v8, v6, v5);

}

- (void)device:(id)a3 supportsVolume:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  id v7;

  v4 = a4;
  v6 = a3;
  v7 = (id)objc_claimAutoreleasedReturnValue(-[TVRemoteViewController hintsViewController](self, "hintsViewController"));
  objc_msgSend(v7, "device:supportsVolume:", v6, v4);

}

- (void)devicePickerWillExpand
{
  void *v3;
  dispatch_time_t v4;
  _QWORD block[5];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVRemoteViewController hintsViewController](self, "hintsViewController"));
  objc_msgSend(v3, "devicePickerWillExpand");

  v4 = dispatch_time(0, 1000000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __48__TVRemoteViewController_devicePickerWillExpand__block_invoke;
  block[3] = &unk_100014908;
  block[4] = self;
  dispatch_after(v4, (dispatch_queue_t)&_dispatch_main_q, block);
}

id __48__TVRemoteViewController_devicePickerWillExpand__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "presentFindMyTip");
}

- (void)setIsConfigured:(BOOL)a3
{
  self->_isConfigured = a3;
}

- (BOOL)isConnectedToDevice
{
  return self->_isConnectedToDevice;
}

- (void)setIsConnectedToDevice:(BOOL)a3
{
  self->_isConnectedToDevice = a3;
}

- (TVRUIRemoteViewController)remoteViewController
{
  return self->_remoteViewController;
}

- (void)setRemoteViewController:(id)a3
{
  objc_storeStrong((id *)&self->_remoteViewController, a3);
}

- (TVRUIHintsViewController)hintsViewController
{
  return self->_hintsViewController;
}

- (void)setHintsViewController:(id)a3
{
  objc_storeStrong((id *)&self->_hintsViewController, a3);
}

- (SBSAssertion)appSwitcherAssertion
{
  return self->_appSwitcherAssertion;
}

- (void)setAppSwitcherAssertion:(id)a3
{
  objc_storeStrong((id *)&self->_appSwitcherAssertion, a3);
}

- (BOOL)shouldReplayHints
{
  return self->_shouldReplayHints;
}

- (void)setShouldReplayHints:(BOOL)a3
{
  self->_shouldReplayHints = a3;
}

- (TVRUIDevice)device
{
  return self->_device;
}

- (void)setDevice:(id)a3
{
  objc_storeStrong((id *)&self->_device, a3);
}

- (UIViewController)tipViewController
{
  return self->_tipViewController;
}

- (void)setTipViewController:(id)a3
{
  objc_storeStrong((id *)&self->_tipViewController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tipViewController, 0);
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_appSwitcherAssertion, 0);
  objc_storeStrong((id *)&self->_hintsViewController, 0);
  objc_storeStrong((id *)&self->_remoteViewController, 0);
}

@end
