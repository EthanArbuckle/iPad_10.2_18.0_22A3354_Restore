@implementation HomeKitDeviceDetectedStartViewController

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  objc_super v9;

  v3 = a3;
  if (dword_1001A81E0 <= 30 && (dword_1001A81E0 != -1 || _LogCategory_Initialize(&dword_1001A81E0, 30)))
    LogPrintF(&dword_1001A81E0, "-[HomeKitDeviceDetectedStartViewController viewWillAppear:]", 30, "Start ViewWillAppear\n");
  v9.receiver = self;
  v9.super_class = (Class)HomeKitDeviceDetectedStartViewController;
  -[SVSBaseViewController viewWillAppear:](&v9, "viewWillAppear:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(self->super._mainController, "_remoteViewControllerProxy"));
  objc_msgSend(v5, "setStatusBarHidden:withDuration:", 1, 0.0);

  v6 = objc_msgSend(objc_alloc((Class)UITapGestureRecognizer), "initWithTarget:action:", self, "handleTapOutsideView:");
  objc_msgSend(v6, "setDelegate:", self);
  objc_msgSend(v6, "setNumberOfTapsRequired:", 1);
  objc_msgSend(v6, "setCancelsTouchesInView:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[HomeKitDeviceDetectedStartViewController view](self, "view"));
  objc_msgSend(v7, "addGestureRecognizer:", v6);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[SVSBaseViewController containerView](self, "containerView"));
  objc_msgSend(v8, "setSwipeDismissible:", 1);

}

- (void)viewDidDisappear:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  if (dword_1001A81E0 <= 30 && (dword_1001A81E0 != -1 || _LogCategory_Initialize(&dword_1001A81E0, 30)))
    LogPrintF(&dword_1001A81E0, "-[HomeKitDeviceDetectedStartViewController viewDidDisappear:]", 30, "Start ViewDidDisappear\n");
  v5.receiver = self;
  v5.super_class = (Class)HomeKitDeviceDetectedStartViewController;
  -[HomeKitDeviceDetectedStartViewController viewDidDisappear:](&v5, "viewDidDisappear:", v3);
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  id v5;
  void *v6;
  void *v7;

  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "view"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "view"));

  return v6 == v7;
}

- (void)handleDismissButton:(id)a3
{
  id v4;

  v4 = a3;
  if (dword_1001A81E0 <= 30 && (dword_1001A81E0 != -1 || _LogCategory_Initialize(&dword_1001A81E0, 30)))
    LogPrintF(&dword_1001A81E0, "-[HomeKitDeviceDetectedStartViewController handleDismissButton:]", 30, "Dismiss button\n");
  objc_msgSend(self->super._mainController, "dismiss:", 5);

}

- (void)handleSetupButton:(id)a3
{
  void *v4;
  void *v5;
  unsigned int v6;

  if (!BYTE1(self->_setupButton))
  {
    BYTE1(self->_setupButton) = 1;
    objc_msgSend(*(id *)((char *)&self->_dismissButton + 1), "setEnabled:", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[LSApplicationProxy applicationProxyForIdentifier:](LSApplicationProxy, "applicationProxyForIdentifier:", CFSTR("com.apple.Home")));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "appState"));
    v6 = objc_msgSend(v5, "isInstalled");

    if (v6)
      -[HomeKitDeviceDetectedStartViewController _launchHomeApp](self, "_launchHomeApp");
    else
      -[HomeKitDeviceDetectedStartViewController _restoreHomeApp](self, "_restoreHomeApp");
  }
}

- (void)handleTapOutsideView:(id)a3
{
  id v4;

  v4 = a3;
  if (dword_1001A81E0 <= 30 && (dword_1001A81E0 != -1 || _LogCategory_Initialize(&dword_1001A81E0, 30)))
    LogPrintF(&dword_1001A81E0, "-[HomeKitDeviceDetectedStartViewController handleTapOutsideView:]", 30, "Dismissing on tap outside view\n");
  objc_msgSend(self->super._mainController, "dismiss:", 1);

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
        v10 = objc_msgSend(v9, "isEqual:", CFSTR("com.apple.Home"));

        if (v10)
        {
          if (dword_1001A81E0 <= 30
            && (dword_1001A81E0 != -1 || _LogCategory_Initialize(&dword_1001A81E0, 30)))
          {
            LogPrintF(&dword_1001A81E0, "-[HomeKitDeviceDetectedStartViewController applicationsDidInstall:]", 30, "Home app installed\n");
          }
          block[0] = _NSConcreteStackBlock;
          block[1] = 3221225472;
          block[2] = sub_1000E1070;
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

- (void)_launchHomeApp
{
  void *v3;
  CFTypeID TypeID;
  uint64_t TypedValue;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  unsigned __int8 v10;
  id v11;
  id v12;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(self->super._mainController, "userInfo"));
  TypeID = CFStringGetTypeID();
  TypedValue = CFDictionaryGetTypedValue(v3, CFSTR("urlStr"), TypeID, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue(TypedValue);

  if (v6)
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v6));
  else
    v7 = 0;
  if (dword_1001A81E0 <= 30 && (dword_1001A81E0 != -1 || _LogCategory_Initialize(&dword_1001A81E0, 30)))
    LogPrintF(&dword_1001A81E0, "-[HomeKitDeviceDetectedStartViewController _launchHomeApp]", 30, "Launch Home app (%@)\n", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[LSApplicationWorkspace defaultWorkspace](LSApplicationWorkspace, "defaultWorkspace"));
  v9 = v8;
  if (v7)
  {
    v12 = 0;
    v10 = objc_msgSend(v8, "openSensitiveURL:withOptions:error:", v7, 0, &v12);
    v11 = v12;
    if ((v10 & 1) != 0)
    {
LABEL_13:
      if (dword_1001A81E0 <= 30
        && (dword_1001A81E0 != -1 || _LogCategory_Initialize(&dword_1001A81E0, 30)))
      {
        LogPrintF(&dword_1001A81E0, "-[HomeKitDeviceDetectedStartViewController _launchHomeApp]", 30, "Launched Home app (%@)\n", v7);
      }
      objc_msgSend(self->super._mainController, "dismiss:", 8);
      goto LABEL_23;
    }
  }
  else
  {
    v11 = 0;
  }
  if (objc_msgSend(v9, "openApplicationWithBundleID:", CFSTR("com.apple.Home")))
    goto LABEL_13;
  if (dword_1001A81E0 <= 90 && (dword_1001A81E0 != -1 || _LogCategory_Initialize(&dword_1001A81E0, 90)))
    LogPrintF(&dword_1001A81E0, "-[HomeKitDeviceDetectedStartViewController _launchHomeApp]", 90, "### Launch Home app failed (%@), %{error}\n", v7, v11);
  BYTE1(self->_setupButton) = 0;
  objc_msgSend(*(id *)((char *)&self->_dismissButton + 1), "setEnabled:", 1);
LABEL_23:

}

- (void)_restoreHomeApp
{
  void *v3;
  id v4;
  _QWORD v5[5];

  if (dword_1001A81E0 <= 30 && (dword_1001A81E0 != -1 || _LogCategory_Initialize(&dword_1001A81E0, 30)))
    LogPrintF(&dword_1001A81E0, "-[HomeKitDeviceDetectedStartViewController _restoreHomeApp]", 30, "Restoring Home app\n");
  objc_msgSend(*(id *)((char *)&self->_progressView + 1), "setHidden:", 0);
  objc_msgSend(*(id *)((char *)&self->_progressView + 1), "startAnimating");
  objc_msgSend(*(id *)(&self->_settingUp + 1), "setHidden:", 0);
  objc_msgSend(*(id *)((char *)&self->_dismissButton + 1), "setHidden:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[LSApplicationWorkspace defaultWorkspace](LSApplicationWorkspace, "defaultWorkspace"));
  objc_msgSend(v3, "addObserver:", self);
  v4 = objc_msgSend(objc_alloc(off_1001A8250()), "initWithBundleID:", CFSTR("com.apple.Home"));
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000E0ED8;
  v5[3] = &unk_10017E070;
  v5[4] = self;
  objc_msgSend(v4, "startWithErrorHandler:", v5);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)((char *)&self->_progressIndicator + 1), 0);
  objc_storeStrong((id *)((char *)&self->_progressView + 1), 0);
  objc_storeStrong((id *)(&self->_settingUp + 1), 0);
  objc_storeStrong((id *)((char *)&self->_dismissButton + 1), 0);
  objc_storeStrong((id *)(&self->super._didReactivateContainerViewAfterLayingOut + 1), 0);
}

@end
