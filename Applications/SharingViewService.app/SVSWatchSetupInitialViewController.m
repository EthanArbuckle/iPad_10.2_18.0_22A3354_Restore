@implementation SVSWatchSetupInitialViewController

- (SVSWatchSetupInitialViewController)initWithUserInfo:(id)a3
{
  id v3;
  SVSWatchSetupInitialViewController *v4;
  NSDictionary *v5;
  NSDictionary *userInfo;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SVSWatchSetupInitialViewController;
  v3 = a3;
  v4 = -[SVSWatchSetupInitialViewController initWithContentView:](&v8, "initWithContentView:", 0);
  v5 = (NSDictionary *)objc_msgSend(v3, "copy", v8.receiver, v8.super_class);

  userInfo = v4->_userInfo;
  v4->_userInfo = v5;

  return v4;
}

- (void)viewDidLoad
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  NSDictionary *userInfo;
  CFTypeID TypeID;
  uint64_t TypedValue;
  void *v14;
  void *v15;
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
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  _QWORD v40[4];
  id v41;
  id location;
  objc_super v43;
  _QWORD v44[5];

  v43.receiver = self;
  v43.super_class = (Class)SVSWatchSetupInitialViewController;
  -[SVSWatchSetupInitialViewController viewDidLoad](&v43, "viewDidLoad");
  -[SVSWatchSetupInitialViewController setDismissalType:](self, "setDismissalType:", 3);
  v3 = sub_1001171A8(CFSTR("Localizable"), CFSTR("APPLE_WATCH_SETUP_TITLE"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  -[SVSWatchSetupInitialViewController setTitle:](self, "setTitle:", v4);

  v5 = sub_1001171A8(CFSTR("Localizable"), CFSTR("APPLE_WATCH_SETUP_SUBTITLE"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  -[SVSWatchSetupInitialViewController setSubtitle:](self, "setSubtitle:", v6);

  location = 0;
  objc_initWeak(&location, self);
  v7 = sub_1001171A8(CFSTR("Localizable"), CFSTR("CONTINUE"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v40[0] = _NSConcreteStackBlock;
  v40[1] = 3221225472;
  v40[2] = sub_10011CB04;
  v40[3] = &unk_10017E008;
  objc_copyWeak(&v41, &location);
  v38 = (void *)objc_claimAutoreleasedReturnValue(+[PRXAction actionWithTitle:style:handler:](PRXAction, "actionWithTitle:style:handler:", v8, 0, v40));

  v9 = -[SVSWatchSetupInitialViewController addAction:](self, "addAction:", v38);
  v10 = objc_msgSend(objc_alloc((Class)BPSRemoteWatchView), "initWithSize:", CGSizeZero.width, CGSizeZero.height);
  objc_msgSend(v10, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  userInfo = self->_userInfo;
  TypeID = CFStringGetTypeID();
  TypedValue = CFDictionaryGetTypedValue(userInfo, CFSTR("advertisingName"), TypeID, 0);
  v39 = (void *)objc_claimAutoreleasedReturnValue(TypedValue);
  if (dword_1001A8F28 <= 30 && (dword_1001A8F28 != -1 || _LogCategory_Initialize(&dword_1001A8F28, 30)))
    LogPrintF(&dword_1001A8F28, "-[SVSWatchSetupInitialViewController viewDidLoad]", 30, "Configuring view for advertising name '%@'\n", v39);
  if (v39)
    objc_msgSend(v10, "setAdvertisingName:", v39);
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[SVSWatchSetupInitialViewController contentView](self, "contentView"));
  objc_msgSend(v14, "addSubview:", v10);

  v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "topAnchor"));
  v37 = (void *)objc_claimAutoreleasedReturnValue(-[SVSWatchSetupInitialViewController contentView](self, "contentView"));
  v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "mainContentGuide"));
  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "topAnchor"));
  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "constraintEqualToAnchor:", v34));
  v44[0] = v33;
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "bottomAnchor"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(-[SVSWatchSetupInitialViewController contentView](self, "contentView"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "mainContentGuide"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "bottomAnchor"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "constraintLessThanOrEqualToAnchor:", v29));
  v44[1] = v28;
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "leadingAnchor"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[SVSWatchSetupInitialViewController contentView](self, "contentView"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "mainContentGuide"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "leadingAnchor"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "constraintEqualToAnchor:", v24));
  v44[2] = v15;
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "trailingAnchor"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[SVSWatchSetupInitialViewController contentView](self, "contentView"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "mainContentGuide"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "trailingAnchor"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "constraintEqualToAnchor:", v19));
  v44[3] = v20;
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "heightAnchor"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "constraintEqualToConstant:", 175.0));
  v44[4] = v22;
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v44, 5));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v23);

  objc_destroyWeak(&v41);
  objc_destroyWeak(&location);
}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SVSWatchSetupInitialViewController;
  -[SVSWatchSetupInitialViewController viewWillAppear:](&v7, "viewWillAppear:", a3);
  if (dword_1001A8F28 <= 30 && (dword_1001A8F28 != -1 || _LogCategory_Initialize(&dword_1001A8F28, 30)))
    LogPrintF(&dword_1001A8F28, "-[SVSWatchSetupInitialViewController viewWillAppear:]", 30, "Start ViewWillAppear\n");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SVSWatchSetupInitialViewController mainController](self, "mainController"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "_remoteViewControllerProxy"));
  objc_msgSend(v5, "setStatusBarHidden:withDuration:", 1, 0.0);

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDistributedNotificationCenter defaultCenter](NSDistributedNotificationCenter, "defaultCenter"));
  objc_msgSend(v6, "addObserver:selector:name:object:suspensionBehavior:", self, "handleDeviceSetupNotification:", CFSTR("com.apple.sharing.DeviceSetup"), 0, 4);

}

- (void)viewDidDisappear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SVSWatchSetupInitialViewController;
  -[SVSWatchSetupInitialViewController viewDidDisappear:](&v5, "viewDidDisappear:", a3);
  if (dword_1001A8F28 <= 30 && (dword_1001A8F28 != -1 || _LogCategory_Initialize(&dword_1001A8F28, 30)))
    LogPrintF(&dword_1001A8F28, "-[SVSWatchSetupInitialViewController viewDidDisappear:]", 30, "Start ViewDidDisappear\n");
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDistributedNotificationCenter defaultCenter](NSDistributedNotificationCenter, "defaultCenter"));
  objc_msgSend(v4, "removeObserver:name:object:", self, CFSTR("com.apple.sharing.DeviceSetup"), 0);

}

- (void)handleDeviceSetupNotification:(id)a3
{
  unsigned __int8 v4;
  void *v5;
  void *v6;
  __CFString *v7;
  const __CFString *v8;
  void *v9;
  unsigned int v10;
  void *v11;
  CFTypeID TypeID;
  uint64_t TypedValue;
  void *v14;
  CFTypeID v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;

  v19 = a3;
  v4 = -[SVSWatchSetupInitialViewController isPairing](self, "isPairing");
  v5 = v19;
  if ((v4 & 1) == 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "name"));
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "userInfo"));
    if (dword_1001A8F28 <= 30
      && (dword_1001A8F28 != -1 || _LogCategory_Initialize(&dword_1001A8F28, 30)))
    {
      v8 = &stru_10017E3D8;
      if (v7)
        v8 = v7;
      LogPrintF(&dword_1001A8F28, "-[SVSWatchSetupInitialViewController handleDeviceSetupNotification:]", 30, "DeviceSetup notification '%@', %##@\n", v6, v8);
    }
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "name"));
    v10 = objc_msgSend(v9, "isEqual:", CFSTR("com.apple.sharing.DeviceSetup"));

    if (v10 && !CFDictionaryGetInt64(v7, CFSTR("needsSetup"), 0))
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[SVSWatchSetupInitialViewController userInfo](self, "userInfo"));
      TypeID = CFStringGetTypeID();
      TypedValue = CFDictionaryGetTypedValue(v11, CFSTR("deviceIdentifier"), TypeID, 0);
      v14 = (void *)objc_claimAutoreleasedReturnValue(TypedValue);

      v15 = CFStringGetTypeID();
      v16 = CFDictionaryGetTypedValue(v7, CFSTR("deviceID"), v15, 0);
      v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
      if (objc_msgSend(v17, "isEqual:", v14))
      {
        if (dword_1001A8F28 <= 30
          && (dword_1001A8F28 != -1 || _LogCategory_Initialize(&dword_1001A8F28, 30)))
        {
          LogPrintF(&dword_1001A8F28, "-[SVSWatchSetupInitialViewController handleDeviceSetupNotification:]", 30, "Auto-dismissing on setup started\n");
        }
        v18 = (void *)objc_claimAutoreleasedReturnValue(-[SVSWatchSetupInitialViewController mainController](self, "mainController"));
        objc_msgSend(v18, "dismiss:", 0);

      }
    }

    v5 = v19;
  }

}

- (void)_handleContinueButton
{
  void *v3;
  void *v4;
  unsigned int v5;

  if (!-[SVSWatchSetupInitialViewController isPairing](self, "isPairing"))
  {
    -[SVSWatchSetupInitialViewController setPairing:](self, "setPairing:", 1);
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[LSApplicationProxy applicationProxyForIdentifier:](LSApplicationProxy, "applicationProxyForIdentifier:", CFSTR("com.apple.Bridge")));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "appState"));
    v5 = objc_msgSend(v4, "isInstalled");

    if (v5)
      -[SVSWatchSetupInitialViewController _launchWatchAppForPairing](self, "_launchWatchAppForPairing");
    else
      -[SVSWatchSetupInitialViewController _restoreWatchApp](self, "_restoreWatchApp");
  }
}

- (void)_handleUpdateNow
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  unsigned int v6;
  id v7;
  BOOL v8;
  id v9;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", CFSTR("prefs:root=General&path=SOFTWARE_UPDATE_LINK&ShowDefaultAudiencePane=YES")));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[LSApplicationWorkspace defaultWorkspace](LSApplicationWorkspace, "defaultWorkspace"));
  v4 = sub_100117A34();
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v9 = 0;
  v6 = objc_msgSend(v3, "openSensitiveURL:withOptions:error:", v2, v5, &v9);
  v7 = v9;

  if (v6)
    v8 = v7 == 0;
  else
    v8 = 0;
  if (!v8
    && dword_1001A8F28 <= 90
    && (dword_1001A8F28 != -1 || _LogCategory_Initialize(&dword_1001A8F28, 90)))
  {
    LogPrintF(&dword_1001A8F28, "-[SVSWatchSetupInitialViewController _handleUpdateNow]", 90, "Failed to open settings: %@\n", v7);
  }

}

- (void)_launchWatchAppForPairing
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[SVSWatchSetupInitialViewController mainController](self, "mainController"));
  objc_msgSend(v2, "dismissAnimated:completion:", 1, &stru_10017E048);

}

- (void)_restoreWatchApp
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD v7[5];

  v3 = sub_1001171A8(CFSTR("Localizable"), CFSTR("RESTORING"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  -[SVSWatchSetupInitialViewController showActivityIndicatorWithStatus:](self, "showActivityIndicatorWithStatus:", v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[LSApplicationWorkspace defaultWorkspace](LSApplicationWorkspace, "defaultWorkspace"));
  objc_msgSend(v5, "addObserver:", self);
  v6 = objc_msgSend(objc_alloc(off_1001A8FA0()), "initWithBundleID:", CFSTR("com.apple.Bridge"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10011C7A8;
  v7[3] = &unk_10017E070;
  v7[4] = self;
  objc_msgSend(v6, "startWithErrorHandler:", v7);

}

- (void)applicationsDidInstall:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  unsigned int v10;
  _QWORD block[5];
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = a3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)i), "bundleIdentifier"));
        v10 = objc_msgSend(v9, "isEqual:", CFSTR("com.apple.Bridge"));

        if (v10)
        {
          if (dword_1001A8F28 <= 30
            && (dword_1001A8F28 != -1 || _LogCategory_Initialize(&dword_1001A8F28, 30)))
          {
            LogPrintF(&dword_1001A8F28, "-[SVSWatchSetupInitialViewController applicationsDidInstall:]", 30, "Watch app installed\n");
          }
          block[0] = _NSConcreteStackBlock;
          block[1] = 3221225472;
          block[2] = sub_10011C738;
          block[3] = &unk_10017E1F0;
          block[4] = self;
          dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
          goto LABEL_15;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_15:

}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (WatchSetupViewControllerProxy)mainController
{
  return (WatchSetupViewControllerProxy *)objc_loadWeakRetained((id *)&self->_mainController);
}

- (void)setMainController:(id)a3
{
  objc_storeWeak((id *)&self->_mainController, a3);
}

- (NSDictionary)userInfo
{
  return self->_userInfo;
}

- (BOOL)isPairing
{
  return self->_pairing;
}

- (void)setPairing:(BOOL)a3
{
  self->_pairing = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_destroyWeak((id *)&self->_mainController);
}

@end
