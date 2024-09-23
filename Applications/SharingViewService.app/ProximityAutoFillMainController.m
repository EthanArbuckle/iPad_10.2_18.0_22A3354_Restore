@implementation ProximityAutoFillMainController

- (BOOL)_shouldRemoveViewFromHierarchyOnDisappear
{
  return 0;
}

- (unint64_t)supportedInterfaceOrientations
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ProximityAutoFillMainController view](self, "view"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "window"));

  if (!v3)
    return 30;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
  v5 = objc_msgSend(v4, "userInterfaceIdiom");

  if (v5 == (id)1)
    return (1 << (char)objc_msgSend(UIApp, "activeInterfaceOrientation"));
  else
    return 2;
}

- (void)configureWithContext:(id)a3 completion:(id)a4
{
  void (**v6)(_QWORD);
  NSDictionary *v7;
  NSDictionary *userInfo;
  OS_dispatch_queue *v9;
  OS_dispatch_queue *workQueue;
  void *v11;
  NSDictionary *v12;
  CFTypeID TypeID;
  uint64_t TypedValue;
  void *v15;
  NSDictionary *v16;
  CFTypeID v17;
  uint64_t v18;
  void *v19;
  int64_t v20;
  NSUUID *v21;
  NSUUID *deviceIdentifier;
  NSDictionary *v23;
  CFTypeID v24;
  uint64_t v25;
  void *v26;
  NSDictionary *v27;
  CFTypeID v28;
  uint64_t v29;
  void *v30;
  uint64_t Int64;
  _BOOL4 v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  BOOL v36;
  _BOOL4 v37;
  const char *v38;
  uint64_t v39;
  BOOL v40;
  _BOOL4 v41;
  const char *v42;
  int v43;

  v6 = (void (**)(_QWORD))a4;
  v7 = (NSDictionary *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "userInfo"));
  userInfo = self->super._userInfo;
  self->super._userInfo = v7;

  if (dword_1001A8830 <= 30 && (dword_1001A8830 != -1 || _LogCategory_Initialize(&dword_1001A8830, 30)))
    LogPrintF(&dword_1001A8830, "-[ProximityAutoFillMainController configureWithContext:completion:]", 30, "Main configuration: %@\n", self->super._userInfo);
  v9 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.SharingViewService.ProximityAutoFill", 0);
  workQueue = self->_workQueue;
  self->_workQueue = v9;

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[ProximityAutoFillMainController _remoteViewControllerProxy](self, "_remoteViewControllerProxy"));
  objc_msgSend(v11, "setAllowsAlertStacking:", 1);

  v12 = self->super._userInfo;
  TypeID = CFStringGetTypeID();
  TypedValue = CFDictionaryGetTypedValue(v12, CFSTR("deviceAddress"), TypeID, 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue(TypedValue);
  if (v15)
    objc_storeStrong((id *)&self->_deviceAddress, v15);
  v16 = self->super._userInfo;
  v17 = CFStringGetTypeID();
  v18 = CFDictionaryGetTypedValue(v16, CFSTR("deviceIdentifier"), v17, 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue(v18);

  if ((objc_msgSend(v19, "isEqual:", CFSTR("00000000-0000-0000-0000-000000000001")) & 1) != 0)
  {
    v20 = 1;
  }
  else if ((objc_msgSend(v19, "isEqual:", CFSTR("00000000-0000-0000-0000-000000000002")) & 1) != 0)
  {
    v20 = 2;
  }
  else
  {
    if (!objc_msgSend(v19, "isEqual:", CFSTR("00000000-0000-0000-0000-000000000003")))
      goto LABEL_14;
    v20 = 3;
  }
  self->_testMode = v20;
LABEL_14:
  if (v19)
  {
    v21 = (NSUUID *)objc_msgSend(objc_alloc((Class)NSUUID), "initWithUUIDString:", v19);
    deviceIdentifier = self->_deviceIdentifier;
    self->_deviceIdentifier = v21;

  }
  v23 = self->super._userInfo;
  v24 = CFStringGetTypeID();
  v25 = CFDictionaryGetTypedValue(v23, CFSTR("peerContactID"), v24, 0);
  v26 = (void *)objc_claimAutoreleasedReturnValue(v25);

  if (v26)
    objc_storeStrong((id *)&self->_peerContactID, v26);
  v27 = self->super._userInfo;
  v28 = CFStringGetTypeID();
  v29 = CFDictionaryGetTypedValue(v27, CFSTR("pin"), v28, 0);
  v30 = (void *)objc_claimAutoreleasedReturnValue(v29);

  if (v30)
    objc_storeStrong((id *)&self->_pin, v30);
  v43 = 0;
  Int64 = CFPrefs_GetInt64(CFSTR("com.apple.Sharing"), CFSTR("rafAutoPayload"), &v43);
  if (!v43 && (v33 = Int64, IsAppleInternalBuild(Int64)) && v33)
  {
    v32 = 1;
  }
  else
  {
    if (!self->_prefAutoPayload)
      goto LABEL_33;
    v32 = 0;
  }
  if (dword_1001A8830 <= 30 && (dword_1001A8830 != -1 || _LogCategory_Initialize(&dword_1001A8830, 30)))
  {
    v34 = "no";
    if (v32)
      v34 = "yes";
    LogPrintF(&dword_1001A8830, "-[ProximityAutoFillMainController configureWithContext:completion:]", 30, "autoPayload enabled: %s\n", v34);
  }
  self->_prefAutoPayload = v32;
LABEL_33:
  v35 = CFPrefs_GetInt64(CFSTR("com.apple.Sharing"), CFSTR("rafHideTTR"), &v43);
  if (v43)
    v36 = 1;
  else
    v36 = v35 == 0;
  v37 = !v36;
  if (self->_prefHideTTR != v37)
  {
    if (dword_1001A8830 <= 30
      && (dword_1001A8830 != -1 || _LogCategory_Initialize(&dword_1001A8830, 30)))
    {
      v38 = "no";
      if (v37)
        v38 = "yes";
      LogPrintF(&dword_1001A8830, "-[ProximityAutoFillMainController configureWithContext:completion:]", 30, "hideTTR: %s\n", v38);
    }
    self->_prefHideTTR = v37;
  }
  v39 = CFPrefs_GetInt64(CFSTR("com.apple.Sharing"), CFSTR("rafSkipAuth"), &v43);
  if (v43)
    v40 = 1;
  else
    v40 = v39 == 0;
  v41 = !v40;
  if (self->_prefSkipAuth != v41)
  {
    if (dword_1001A8830 <= 30
      && (dword_1001A8830 != -1 || _LogCategory_Initialize(&dword_1001A8830, 30)))
    {
      v42 = "no";
      if (v41)
        v42 = "yes";
      LogPrintF(&dword_1001A8830, "-[ProximityAutoFillMainController configureWithContext:completion:]", 30, "skipAuth: %s\n", v42);
    }
    self->_prefSkipAuth = v41;
  }
  if (v6)
    v6[2](v6);

}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)ProximityAutoFillMainController;
  -[ProximityAutoFillMainController viewWillAppear:](&v4, "viewWillAppear:", a3);
  -[ProximityAutoFillMainController deviceDiscoveryStart](self, "deviceDiscoveryStart");
}

- (void)viewDidAppear:(BOOL)a3
{
  _BOOL8 v3;
  UIStoryboard *v5;
  UIStoryboard *mainStoryboard;
  SVSCommonNavController *v7;
  SVSCommonNavController *vcNav;
  void *v9;
  unint64_t v10;
  void *v11;
  ProximityAutoFillStartViewController *v12;
  ProximityAutoFillStartViewController *vcStart;
  objc_super v14;

  v3 = a3;
  if (dword_1001A8830 <= 30 && (dword_1001A8830 != -1 || _LogCategory_Initialize(&dword_1001A8830, 30)))
    LogPrintF(&dword_1001A8830, "-[ProximityAutoFillMainController viewDidAppear:]", 30, "Main ViewDidAppear\n");
  v14.receiver = self;
  v14.super_class = (Class)ProximityAutoFillMainController;
  -[ProximityAutoFillMainController viewDidAppear:](&v14, "viewDidAppear:", v3);
  v5 = (UIStoryboard *)objc_claimAutoreleasedReturnValue(+[UIStoryboard storyboardWithName:bundle:](UIStoryboard, "storyboardWithName:bundle:", CFSTR("ProximityAutoFill"), 0));
  mainStoryboard = self->_mainStoryboard;
  self->_mainStoryboard = v5;

  v7 = (SVSCommonNavController *)objc_claimAutoreleasedReturnValue(-[UIStoryboard instantiateInitialViewController](self->_mainStoryboard, "instantiateInitialViewController"));
  vcNav = self->_vcNav;
  self->_vcNav = v7;

  -[SVSCommonNavController setDelegate:](self->_vcNav, "setDelegate:", self);
  -[SVSCommonNavController setModalPresentationStyle:](self->_vcNav, "setModalPresentationStyle:", 4);
  -[SVSCommonNavController setTransitioningDelegate:](self->_vcNav, "setTransitioningDelegate:", self->_vcNav);
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
  v10 = (unint64_t)objc_msgSend(v9, "userInterfaceIdiom");

  if ((v10 & 0xFFFFFFFFFFFFFFFBLL) == 1)
    -[SVSCommonNavController setModalTransitionStyle:](self->_vcNav, "setModalTransitionStyle:", 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[SVSCommonNavController viewControllers](self->_vcNav, "viewControllers"));
  v12 = (ProximityAutoFillStartViewController *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "firstObject"));
  vcStart = self->_vcStart;
  self->_vcStart = v12;

  -[SVSBaseViewController setMainController:](self->_vcStart, "setMainController:", self);
  -[ProximityAutoFillMainController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", self->_vcNav, 1, 0);
}

- (void)viewDidDisappear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  ProximityAutoFillMainController **v6;
  ProximityAutoFillMainController *v7;
  ProximityAutoFillMainController *v8;

  v3 = a3;
  if (dword_1001A8830 <= 30 && (dword_1001A8830 != -1 || _LogCategory_Initialize(&dword_1001A8830, 30)))
    LogPrintF(&dword_1001A8830, "-[ProximityAutoFillMainController viewDidDisappear:]", 30, "Main ViewDidDisappear\n");
  if (self->_authState == 1)
  {
    if (dword_1001A8830 <= 30
      && (dword_1001A8830 != -1 || _LogCategory_Initialize(&dword_1001A8830, 30)))
    {
      LogPrintF(&dword_1001A8830, "-[ProximityAutoFillMainController viewDidDisappear:]", 30, "Dismissed while auth'ing?");
    }
    v8 = self;
    v6 = &v8;
  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[ProximityAutoFillMainController _remoteViewControllerProxy](self, "_remoteViewControllerProxy"));
    objc_msgSend(v5, "setIdleTimerDisabled:forReason:", 0, CFSTR("com.apple.SharingViewService.ProximityAutoFill"));

    if (self->_dismissed)
    {
      -[ProximityAutoFillMainController ensureStoppedWithDismiss:](self, "ensureStoppedWithDismiss:", 0);
    }
    else
    {
      if (dword_1001A8830 <= 30
        && (dword_1001A8830 != -1 || _LogCategory_Initialize(&dword_1001A8830, 30)))
      {
        LogPrintF(&dword_1001A8830, "-[ProximityAutoFillMainController viewDidDisappear:]", 30, "Main disappeared without dismiss (device locked?)...dismissing UI\n");
      }
      -[ProximityAutoFillMainController ensureStoppedWithDismiss:reason:](self, "ensureStoppedWithDismiss:reason:", 1, 21);
    }
    v7 = self;
    v6 = &v7;
  }
  v6[1] = (ProximityAutoFillMainController *)ProximityAutoFillMainController;
  objc_msgSendSuper2((objc_super *)v6, "viewDidDisappear:", v3, v7);
}

- (void)dismiss:(int)a3
{
  -[ProximityAutoFillMainController dismiss:completion:](self, "dismiss:completion:", *(_QWORD *)&a3, 0);
}

- (void)dismiss:(int)a3 completion:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;

  v6 = a4;
  if (!self->_dismissed)
  {
    self->_dismissed = 1;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100102E44;
    v8[3] = &unk_10017E100;
    v9 = (id)objc_claimAutoreleasedReturnValue(-[ProximityAutoFillMainController _remoteViewControllerProxy](self, "_remoteViewControllerProxy"));
    v10 = v6;
    v7 = v9;
    -[ProximityAutoFillMainController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", a3 != 19, v8);

  }
}

- (void)ensureStoppedWithDismiss:(BOOL)a3
{
  -[ProximityAutoFillMainController ensureStoppedWithDismiss:reason:](self, "ensureStoppedWithDismiss:reason:", a3, 8);
}

- (void)ensureStoppedWithDismiss:(BOOL)a3 reason:(int)a4
{
  uint64_t v4;
  _BOOL4 v5;
  const char *v7;
  UIStoryboard *mainStoryboard;
  ProximityAutoFillAuthViewController *vcAuth;
  ProximityAutoFillDoneViewController *vcDone;
  SVSCommonNavController *vcNav;
  _SFAppAutoFillPasswordViewController *vcPicker;
  ProximityAutoFillStartViewController *vcStart;
  VPScannerViewController *vcVisualAuth;
  UIViewController *vcVisualAuthParent;

  v4 = *(_QWORD *)&a4;
  v5 = a3;
  if (dword_1001A8830 <= 50 && (dword_1001A8830 != -1 || _LogCategory_Initialize(&dword_1001A8830, 50)))
  {
    v7 = "no";
    if (v5)
      v7 = "yes";
    LogPrintF(&dword_1001A8830, "-[ProximityAutoFillMainController ensureStoppedWithDismiss:reason:]", 50, "Ensuring stopped with dismiss: %s reason: %d", v7, v4);
  }
  -[ProximityAutoFillMainController deviceDiscoveryStop](self, "deviceDiscoveryStop");
  -[ProximityAutoFillMainController sessionStop](self, "sessionStop");
  mainStoryboard = self->_mainStoryboard;
  self->_mainStoryboard = 0;

  -[SVSBaseViewController setMainController:](self->_vcAuth, "setMainController:", 0);
  vcAuth = self->_vcAuth;
  self->_vcAuth = 0;

  -[SVSBaseViewController setMainController:](self->_vcDone, "setMainController:", 0);
  vcDone = self->_vcDone;
  self->_vcDone = 0;

  vcNav = self->_vcNav;
  self->_vcNav = 0;

  vcPicker = self->_vcPicker;
  self->_vcPicker = 0;

  -[SVSBaseViewController setMainController:](self->_vcStart, "setMainController:", 0);
  vcStart = self->_vcStart;
  self->_vcStart = 0;

  vcVisualAuth = self->_vcVisualAuth;
  self->_vcVisualAuth = 0;

  vcVisualAuthParent = self->_vcVisualAuthParent;
  self->_vcVisualAuthParent = 0;

  if (v5)
    -[ProximityAutoFillMainController dismiss:](self, "dismiss:", v4);
}

- (void)fileRadar:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *i;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  _QWORD v26[7];
  _QWORD v27[7];

  v3 = a3;
  if (dword_1001A8830 <= 60 && (dword_1001A8830 != -1 || _LogCategory_Initialize(&dword_1001A8830, 60)))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedDescription"));
    LogPrintF(&dword_1001A8830, "-[ProximityAutoFillMainController fileRadar:]", 60, "### Filing radar with error: %@", v4);

  }
  if (v3)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedDescription"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString stringWithFormat:](NSMutableString, "stringWithFormat:", CFSTR("AutoFill: %@"), v5, v3));

  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString stringWithFormat:](NSMutableString, "stringWithFormat:", CFSTR("AutoFill: %@"), CFSTR("Share Failed"), 0));
  }
  v26[0] = CFSTR("Classification");
  v26[1] = CFSTR("ComponentID");
  v27[0] = CFSTR("Serious Bug");
  v27[1] = CFSTR("939440");
  v26[2] = CFSTR("ComponentName");
  v26[3] = CFSTR("ComponentVersion");
  v27[2] = CFSTR("Proximity AutoFill");
  v27[3] = CFSTR("all");
  v26[4] = CFSTR("ExtensionIdentifiers");
  v26[5] = CFSTR("Reproducibility");
  v27[4] = CFSTR("com.apple.DiagnosticExtensions.Bluetooth");
  v27[5] = CFSTR("I Didn't Try");
  v26[6] = CFSTR("Title");
  v27[6] = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v27, v26, 7));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v9 = v7;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(_QWORD *)v22 != v12)
          objc_enumerationMutation(v9);
        v14 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)i);
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", v14));
        v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSURLQueryItem queryItemWithName:value:](NSURLQueryItem, "queryItemWithName:value:", v14, v15));
        objc_msgSend(v8, "addObject:", v16);

      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v11);
  }

  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSURLComponents componentsWithString:](NSURLComponents, "componentsWithString:", CFSTR("tap-to-radar://new")));
  objc_msgSend(v17, "setQueryItems:", v8);
  v18 = (void *)UIApp;
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "URL"));
  objc_msgSend(v18, "openURL:withCompletionHandler:", v19, 0);

}

- (void)handleButtonActions:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];

  v4 = a3;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)i), "events") & 0x10) != 0)
        {
          if (dword_1001A8830 <= 30
            && (dword_1001A8830 != -1 || _LogCategory_Initialize(&dword_1001A8830, 30)))
          {
            LogPrintF(&dword_1001A8830, "-[ProximityAutoFillMainController handleButtonActions:]", 30, "Home button\n");
          }
          -[ProximityAutoFillMainController ensureStoppedWithDismiss:reason:](self, "ensureStoppedWithDismiss:reason:", 1, 4);
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (void)handlePasswordPicked:(id)a3
{
  id v4;
  int v5;
  NSString *v6;
  NSString *pickedUsername;
  NSString *v8;
  NSString *pickedPassword;
  uint64_t v10;
  void *v11;
  void (**credentialsHandler)(id, NSString *, NSString *, _QWORD);
  id v13;

  v4 = a3;
  v13 = v4;
  if (dword_1001A8830 <= 30)
  {
    if (dword_1001A8830 != -1 || (v5 = _LogCategory_Initialize(&dword_1001A8830, 30), v4 = v13, v5))
    {
      LogPrintF(&dword_1001A8830, "-[ProximityAutoFillMainController handlePasswordPicked:]", 30, "Handle password picked: %@\n", v4);
      v4 = v13;
    }
  }
  if (v4)
  {
    self->_pickerState = 4;
    v6 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "user"));
    pickedUsername = self->_pickedUsername;
    self->_pickedUsername = v6;

    v8 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "password"));
    pickedPassword = self->_pickedPassword;
    self->_pickedPassword = v8;

    if (dword_1001A8830 <= 30
      && (dword_1001A8830 != -1 || _LogCategory_Initialize(&dword_1001A8830, 30)))
    {
      LogPrintF(&dword_1001A8830, "-[ProximityAutoFillMainController handlePasswordPicked:]", 30, "Passing selected credentials to session\n");
    }
    credentialsHandler = (void (**)(id, NSString *, NSString *, _QWORD))self->_credentialsHandler;
    if (credentialsHandler)
    {
      credentialsHandler[2](credentialsHandler, self->_pickedUsername, self->_pickedPassword, 0);
    }
    else if (dword_1001A8830 <= 60
           && (dword_1001A8830 != -1 || _LogCategory_Initialize(&dword_1001A8830, 60)))
    {
      LogPrintF(&dword_1001A8830, "-[ProximityAutoFillMainController handlePasswordPicked:]", 60, "### No handler for credentials?");
    }
    v11 = 0;
  }
  else
  {
    self->_pickerState = 7;
    v10 = NSErrorWithOSStatusF(4294960573, "User canceled from password picker");
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  }
  -[ProximityAutoFillMainController showDoneUI:](self, "showDoneUI:", v11);

}

- (void)showAuthenticateUI
{
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  LAContext *v6;
  LAContext *authContext;
  LAContext *v8;
  unsigned int v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  LAContext *v15;
  uint64_t v16;
  void *v17;
  id v18;
  _QWORD v19[6];
  id v20;

  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  if (self->_prefSkipAuth)
  {
    if (dword_1001A8830 <= 30
      && (dword_1001A8830 != -1 || _LogCategory_Initialize(&dword_1001A8830, 30)))
    {
      LogPrintF(&dword_1001A8830, "-[ProximityAutoFillMainController showAuthenticateUI]", 30, "Skipping local authentication via default\n");
    }
    self->_authState = 2;
LABEL_11:
    -[ProximityAutoFillMainController showPasswordPickerUI](self, "showPasswordPickerUI");
  }
  else
  {
    switch(self->_authState)
    {
      case 0:
        if (dword_1001A8830 <= 30
          && (dword_1001A8830 != -1 || _LogCategory_Initialize(&dword_1001A8830, 30)))
        {
          LogPrintF(&dword_1001A8830, "-[ProximityAutoFillMainController showAuthenticateUI]", 30, "Show authenticate UI");
        }
        self->_authState = 1;
        v6 = (LAContext *)objc_alloc_init((Class)LAContext);
        authContext = self->_authContext;
        self->_authContext = v6;

        -[LAContext setTouchIDAuthenticationAllowableReuseDuration:](self->_authContext, "setTouchIDAuthenticationAllowableReuseDuration:", 45.0);
        v8 = self->_authContext;
        v20 = 0;
        v9 = -[LAContext canEvaluatePolicy:error:](v8, "canEvaluatePolicy:error:", 1, &v20);
        v10 = v20;
        v11 = v10;
        if (v9)
        {
          v12 = objc_msgSend(UIApp, "beginBackgroundTaskWithExpirationHandler:", &stru_10017D878);
          v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("PROX_AUTOFILL_AUTH_REASON"), &stru_10017E3D8, CFSTR("Localizable")));

          v15 = self->_authContext;
          v19[0] = _NSConcreteStackBlock;
          v19[1] = 3221225472;
          v19[2] = sub_100102C80;
          v19[3] = &unk_10017D8A0;
          v19[4] = self;
          v19[5] = v12;
          -[LAContext evaluatePolicy:localizedReason:reply:](v15, "evaluatePolicy:localizedReason:reply:", 1, v14, v19);

        }
        else
        {
          self->_authState = 3;
          if (v10)
          {
            -[ProximityAutoFillMainController showDoneUI:](self, "showDoneUI:", v10);
          }
          else
          {
            v16 = NSErrorWithOSStatusF(4294960542, "Cannot authenticate with biometrics");
            v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
            -[ProximityAutoFillMainController showDoneUI:](self, "showDoneUI:", v17);

          }
        }

        return;
      case 2:
      case 4:
        goto LABEL_11;
      case 3:
        v3 = "Failed to authenticate with biometrics";
        v4 = 4294960542;
        goto LABEL_14;
      default:
        v3 = "Invalid local authentication state\n";
        v4 = 4294960587;
LABEL_14:
        v5 = NSErrorWithOSStatusF(v4, v3);
        v18 = (id)objc_claimAutoreleasedReturnValue(v5);
        -[ProximityAutoFillMainController showDoneUI:](self, "showDoneUI:", v18);

        break;
    }
  }
}

- (void)showDoneUI:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  ProximityAutoFillDoneViewController *vcDone;
  ProximityAutoFillDoneViewController *v9;
  ProximityAutoFillDoneViewController *v10;
  id v11;

  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  if (dword_1001A8830 <= 30 && (dword_1001A8830 != -1 || _LogCategory_Initialize(&dword_1001A8830, 30)))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedDescription"));
    LogPrintF(&dword_1001A8830, "-[ProximityAutoFillMainController showDoneUI:]", 30, "Show Done UI with error: %@\n", v5);

  }
  v6 = v4;
  v11 = v6;
  if (!v6)
  {
    if (self->_testMode == 2)
    {
      v7 = NSErrorWithOSStatusF(4294960596, "Test error case");
      v6 = (id)objc_claimAutoreleasedReturnValue(v7);
    }
    else
    {
      v6 = 0;
    }
  }
  vcDone = self->_vcDone;
  if (!vcDone)
  {
    v9 = (ProximityAutoFillDoneViewController *)objc_claimAutoreleasedReturnValue(-[UIStoryboard instantiateViewControllerWithIdentifier:](self->_mainStoryboard, "instantiateViewControllerWithIdentifier:", CFSTR("Done")));
    v10 = self->_vcDone;
    self->_vcDone = v9;

    -[SVSBaseViewController setMainController:](self->_vcDone, "setMainController:", self);
    vcDone = self->_vcDone;
  }
  -[ProximityAutoFillDoneViewController setError:](vcDone, "setError:", v6);
  sub_100117584(self->_vcNav, self->_vcDone, 0);

}

- (void)showPairingUIWithFlags:(unsigned int)a3 throttleSeconds:(int)a4
{
  uint64_t v4;
  uint64_t v5;
  ProximityAutoFillAuthViewController *vcAuth;
  uint64_t v8;
  UIViewController *v9;
  UIViewController *vcVisualAuthParent;
  VPScannerViewController *v11;
  VPScannerViewController *vcVisualAuth;
  void *v13;
  void *v14;
  SVSCommonNavController *vcNav;
  VPScannerViewController *v16;
  ProximityAutoFillAuthViewController *v17;
  ProximityAutoFillAuthViewController *v18;
  _QWORD v19[5];
  _QWORD v20[5];
  _QWORD v21[5];

  v4 = *(_QWORD *)&a4;
  v5 = *(_QWORD *)&a3;
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  if (dword_1001A8830 <= 30 && (dword_1001A8830 != -1 || _LogCategory_Initialize(&dword_1001A8830, 30)))
    LogPrintF(&dword_1001A8830, "-[ProximityAutoFillMainController showPairingUIWithFlags:throttleSeconds:]", 30, "Prompt for PIN: 0x%X, %d throttle seconds\n", v5, v4);
  self->_visualAuthTryingCode = 0;
  vcAuth = self->_vcAuth;
  if ((v5 & 0x100) == 0 || vcAuth)
  {
    if (vcAuth)
    {
      -[ProximityAutoFillAuthViewController showWithFlags:throttleSeconds:](vcAuth, "showWithFlags:throttleSeconds:", v5, v4);
    }
    else
    {
      v17 = (ProximityAutoFillAuthViewController *)objc_claimAutoreleasedReturnValue(-[UIStoryboard instantiateViewControllerWithIdentifier:](self->_mainStoryboard, "instantiateViewControllerWithIdentifier:", CFSTR("PINAuth")));
      v18 = self->_vcAuth;
      self->_vcAuth = v17;

      -[SVSBaseViewController setMainController:](self->_vcAuth, "setMainController:", self);
      sub_100117584(self->_vcNav, self->_vcAuth, 0);
    }
  }
  else
  {
    if ((int)v4 >= 1)
    {
      v8 = mach_absolute_time();
      self->_visualAuthNextTicks = SecondsToUpTicks(v4) + v8;
    }
    if (!self->_vcVisualAuth)
    {
      v9 = (UIViewController *)objc_claimAutoreleasedReturnValue(-[SVSCommonNavController visibleViewController](self->_vcNav, "visibleViewController"));
      vcVisualAuthParent = self->_vcVisualAuthParent;
      self->_vcVisualAuthParent = v9;

      v11 = (VPScannerViewController *)objc_claimAutoreleasedReturnValue(+[VPScannerViewController instantiateViewController](VPScannerViewController, "instantiateViewController"));
      vcVisualAuth = self->_vcVisualAuth;
      self->_vcVisualAuth = v11;

      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("PROX_AUTOFILL_VISUAL_PAIRING_TITLE_IPHONE"), &stru_10017E3D8, CFSTR("Localizable")));
      -[VPScannerViewController setTitleMessage:](self->_vcVisualAuth, "setTitleMessage:", v14);

      v21[0] = _NSConcreteStackBlock;
      v21[1] = 3221225472;
      v21[2] = sub_100102C28;
      v21[3] = &unk_10017DD68;
      v21[4] = self;
      -[VPScannerViewController setEventHandler:](self->_vcVisualAuth, "setEventHandler:", v21);
      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472;
      v20[2] = sub_100102C34;
      v20[3] = &unk_10017E1C8;
      v20[4] = self;
      -[VPScannerViewController setScannedCodeHandler:](self->_vcVisualAuth, "setScannedCodeHandler:", v20);
      vcNav = self->_vcNav;
      v16 = self->_vcVisualAuth;
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472;
      v19[2] = sub_100102C40;
      v19[3] = &unk_10017E1F0;
      v19[4] = self;
      -[SVSCommonNavController presentViewController:animated:completion:](vcNav, "presentViewController:animated:completion:", v16, 0, v19);
    }
  }
}

- (void)_handleVisualAuthEvent:(int64_t)a3
{
  VPScannerViewController *v5;
  VPScannerViewController *vcVisualAuth;
  void *v7;
  UIViewController *vcVisualAuthParent;

  if (a3 == 2)
  {
    if (dword_1001A8830 <= 30
      && (dword_1001A8830 != -1 || _LogCategory_Initialize(&dword_1001A8830, 30)))
    {
      LogPrintF(&dword_1001A8830, "-[ProximityAutoFillMainController _handleVisualAuthEvent:]", 30, "Visual Auth Event: pair manually\n");
    }
    -[VPScannerViewController dismissViewControllerAnimated:completion:](self->_vcVisualAuth, "dismissViewControllerAnimated:completion:", 1, 0);
    vcVisualAuth = self->_vcVisualAuth;
    self->_vcVisualAuth = 0;

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[UIViewController view](self->_vcVisualAuthParent, "view"));
    objc_msgSend(v7, "setHidden:", 0);

    vcVisualAuthParent = self->_vcVisualAuthParent;
    self->_vcVisualAuthParent = 0;

    -[ProximityAutoFillMainController showPairingUIWithFlags:throttleSeconds:](self, "showPairingUIWithFlags:throttleSeconds:", 0, 0xFFFFFFFFLL);
  }
  else if (a3 == 1)
  {
    if (dword_1001A8830 <= 30
      && (dword_1001A8830 != -1 || _LogCategory_Initialize(&dword_1001A8830, 30)))
    {
      LogPrintF(&dword_1001A8830, "-[ProximityAutoFillMainController _handleVisualAuthEvent:]", 30, "Visual Auth Event: cancel\n");
    }
    -[VPScannerViewController dismissViewControllerAnimated:completion:](self->_vcVisualAuth, "dismissViewControllerAnimated:completion:", 1, 0);
    v5 = self->_vcVisualAuth;
    self->_vcVisualAuth = 0;

    -[ProximityAutoFillMainController ensureStoppedWithDismiss:reason:](self, "ensureStoppedWithDismiss:reason:", 1, 5);
    return;
  }
  if (dword_1001A8830 <= 30 && (dword_1001A8830 != -1 || _LogCategory_Initialize(&dword_1001A8830, 30)))
    LogPrintF(&dword_1001A8830, "-[ProximityAutoFillMainController _handleVisualAuthEvent:]", 30, "Visual Auth Event: %ld\n", a3);
}

- (void)_handleVisualAuthScannedCode:(id)a3
{
  uint64_t v4;
  unint64_t visualAuthNextTicks;
  uint64_t v6;
  id v7;

  v7 = a3;
  if (dword_1001A8830 <= 30 && (dword_1001A8830 != -1 || _LogCategory_Initialize(&dword_1001A8830, 30)))
    LogPrintF(&dword_1001A8830, "-[ProximityAutoFillMainController _handleVisualAuthScannedCode:]", 30, "Visual Auth scanned code: '%@'\n", v7);
  v4 = mach_absolute_time();
  visualAuthNextTicks = self->_visualAuthNextTicks;
  if (v4 >= visualAuthNextTicks)
  {
    if (self->_visualAuthTryingCode)
    {
      if (dword_1001A8830 <= 30
        && (dword_1001A8830 != -1 || _LogCategory_Initialize(&dword_1001A8830, 30)))
      {
        LogPrintF(&dword_1001A8830, "-[ProximityAutoFillMainController _handleVisualAuthScannedCode:]", 30, "Visual Auth ignore scanned code while trying previous code\n");
      }
    }
    else
    {
      self->_visualAuthTryingCode = 1;
      -[ProximityAutoFillMainController _tryPIN:](self, "_tryPIN:", v7);
    }
  }
  else if (dword_1001A8830 <= 30)
  {
    v6 = v4;
    if (dword_1001A8830 == -1)
    {
      if (!_LogCategory_Initialize(&dword_1001A8830, 30))
        goto LABEL_18;
      visualAuthNextTicks = self->_visualAuthNextTicks;
    }
    UpTicksToSecondsF(visualAuthNextTicks - v6);
    LogPrintF(&dword_1001A8830, "-[ProximityAutoFillMainController _handleVisualAuthScannedCode:]", 30, "Visual Auth wait for next allowed time (%.2f seconds)\n");
  }
LABEL_18:

}

- (void)showPasswordPickerUI
{
  int pickerState;
  const char *v4;
  void *v5;
  _SFAppAutoFillPasswordViewController *v6;
  _SFAppAutoFillPasswordViewController *vcPicker;
  _SFAppAutoFillPasswordViewController *v8;
  uint64_t v9;
  id v10;
  _QWORD v11[5];

  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  pickerState = self->_pickerState;
  if (pickerState)
  {
    if (dword_1001A8830 <= 60)
    {
      if (dword_1001A8830 != -1)
      {
LABEL_4:
        if (pickerState >= 8)
        {
          if (pickerState <= 9)
            v4 = "?";
          else
            v4 = "User";
        }
        else
        {
          v4 = off_10017D9C0[pickerState];
        }
        LogPrintF(&dword_1001A8830, "-[ProximityAutoFillMainController showPasswordPickerUI]", 60, "### Show picker UI with pickerState: %s", v4);
        goto LABEL_24;
      }
      if (_LogCategory_Initialize(&dword_1001A8830, 60))
      {
        pickerState = self->_pickerState;
        goto LABEL_4;
      }
    }
LABEL_24:
    v9 = NSErrorWithOSStatusF(4294960587, "Password Picker state");
    v10 = (id)objc_claimAutoreleasedReturnValue(v9);
    -[ProximityAutoFillMainController showDoneUI:](self, "showDoneUI:", v10);

    return;
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", self->_url));
  self->_pickerState = 1;
  v6 = (_SFAppAutoFillPasswordViewController *)objc_alloc_init(off_1001A88A0());
  vcPicker = self->_vcPicker;
  self->_vcPicker = v6;

  -[_SFAppAutoFillPasswordViewController setDelegate:](self->_vcPicker, "setDelegate:", self);
  if (v5)
    -[_SFAppAutoFillPasswordViewController setWebViewURL:](self->_vcPicker, "setWebViewURL:", v5);
  if (self->_bundleID)
    -[_SFAppAutoFillPasswordViewController setRemoteAppID:](self->_vcPicker, "setRemoteAppID:");
  if (self->_localizedAppName)
    -[_SFAppAutoFillPasswordViewController setRemoteLocalizedAppName:](self->_vcPicker, "setRemoteLocalizedAppName:");
  if (self->_unlocalizedAppName)
    -[_SFAppAutoFillPasswordViewController setRemoteUnlocalizedAppName:](self->_vcPicker, "setRemoteUnlocalizedAppName:");
  if (self->_associatedDomains
    && (objc_opt_respondsToSelector(self->_vcPicker, "setExternallyVerifiedAndApprovedSharedWebCredentialsDomains:") & 1) != 0)
  {
    -[_SFAppAutoFillPasswordViewController setExternallyVerifiedAndApprovedSharedWebCredentialsDomains:](self->_vcPicker, "setExternallyVerifiedAndApprovedSharedWebCredentialsDomains:", self->_associatedDomains);
  }
  -[_SFAppAutoFillPasswordViewController setAuthenticationGracePeriod:](self->_vcPicker, "setAuthenticationGracePeriod:", 45.0);
  v8 = self->_vcPicker;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100102AD0;
  v11[3] = &unk_10017DF28;
  v11[4] = self;
  -[_SFAppAutoFillPasswordViewController authenticateToPresentInPopover:completion:](v8, "authenticateToPresentInPopover:completion:", 0, v11);

}

- (void)deviceDiscoveryStart
{
  SFDeviceDiscovery *v3;
  SFDeviceDiscovery *deviceDiscovery;
  _QWORD v5[5];
  _QWORD v6[5];
  _QWORD v7[5];

  if (!self->_deviceDiscovery)
  {
    if (dword_1001A8830 <= 30
      && (dword_1001A8830 != -1 || _LogCategory_Initialize(&dword_1001A8830, 30)))
    {
      LogPrintF(&dword_1001A8830, "-[ProximityAutoFillMainController deviceDiscoveryStart]", 30, "Discovery start\n");
    }
    v3 = (SFDeviceDiscovery *)objc_alloc_init((Class)SFDeviceDiscovery);
    deviceDiscovery = self->_deviceDiscovery;
    self->_deviceDiscovery = v3;

    -[SFDeviceDiscovery setChangeFlags:](self->_deviceDiscovery, "setChangeFlags:", 13);
    -[SFDeviceDiscovery setDiscoveryFlags:](self->_deviceDiscovery, "setDiscoveryFlags:", 8208);
    -[SFDeviceDiscovery setDispatchQueue:](self->_deviceDiscovery, "setDispatchQueue:", self->_workQueue);
    -[SFDeviceDiscovery setRssiThreshold:](self->_deviceDiscovery, "setRssiThreshold:", -60);
    -[SFDeviceDiscovery setScanRate:](self->_deviceDiscovery, "setScanRate:", 20);
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_100102970;
    v7[3] = &unk_10017D8E8;
    v7[4] = self;
    -[SFDeviceDiscovery setDeviceFoundHandler:](self->_deviceDiscovery, "setDeviceFoundHandler:", v7);
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_10010297C;
    v6[3] = &unk_10017D8E8;
    v6[4] = self;
    -[SFDeviceDiscovery setDeviceLostHandler:](self->_deviceDiscovery, "setDeviceLostHandler:", v6);
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_100102988;
    v5[3] = &unk_10017D910;
    v5[4] = self;
    -[SFDeviceDiscovery setDeviceChangedHandler:](self->_deviceDiscovery, "setDeviceChangedHandler:", v5);
    -[SFDeviceDiscovery activateWithCompletion:](self->_deviceDiscovery, "activateWithCompletion:", &stru_10017D930);
  }
}

- (void)deviceDiscoveryStop
{
  SFDeviceDiscovery *deviceDiscovery;

  -[SFDeviceDiscovery invalidate](self->_deviceDiscovery, "invalidate");
  deviceDiscovery = self->_deviceDiscovery;
  self->_deviceDiscovery = 0;

}

- (void)_deviceFound:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  NSString *deviceAddress;
  NSString *v12;
  NSString *v13;
  NSString *v14;
  unsigned int v15;
  SFDevice *device;
  SFDevice *v17;
  id v18;

  v18 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "bleDevice"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "advertisementFields"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("bdAddr")));

  if (v6)
  {
    v7 = SFHexStringForData(v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet symbolCharacterSet](NSCharacterSet, "symbolCharacterSet"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "stringByTrimmingCharactersInSet:", v9));

    deviceAddress = self->_deviceAddress;
    v12 = v10;
    v13 = deviceAddress;
    if (v12 == v13)
    {

    }
    else
    {
      v14 = v13;
      if ((v12 == 0) == (v13 != 0))
      {

        device = (SFDevice *)v12;
LABEL_13:

LABEL_14:
        goto LABEL_15;
      }
      v15 = -[NSString isEqual:](v12, "isEqual:", v13);

      if (!v15)
        goto LABEL_14;
    }
    if (dword_1001A8830 <= 50
      && (dword_1001A8830 != -1 || _LogCategory_Initialize(&dword_1001A8830, 50)))
    {
      LogPrintF(&dword_1001A8830, "-[ProximityAutoFillMainController _deviceFound:]", 50, "Found the device we were looking for! %@", v18);
    }
    v17 = (SFDevice *)v18;
    device = self->_device;
    self->_device = v17;
    goto LABEL_13;
  }
LABEL_15:

}

- (id)deviceForSession
{
  SFDevice *v3;
  SFDevice *device;

  if (self->_deviceIdentifier)
  {
    v3 = (SFDevice *)objc_alloc_init((Class)SFDevice);
    -[SFDevice setIdentifier:](v3, "setIdentifier:", self->_deviceIdentifier);
    if (self->_peerContactID)
      -[SFDevice setContactIdentifier:](v3, "setContactIdentifier:");
  }
  else if (self->_deviceAddress && (device = self->_device) != 0)
  {
    v3 = device;
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (void)passwordViewControllerDidFinish:(id)a3
{
  id v3;
  void *v4;
  int v5;
  void *v6;

  v3 = a3;
  v4 = v3;
  if (dword_1001A8830 <= 30
    && ((v6 = v3, dword_1001A8830 != -1) || (v5 = _LogCategory_Initialize(&dword_1001A8830, 30), v4 = v6, v5)))
  {
    LogPrintF(&dword_1001A8830, "-[ProximityAutoFillMainController passwordViewControllerDidFinish:]", 30, "Password picker VC finished\n");

  }
  else
  {

  }
}

- (void)passwordViewController:(id)a3 selectedCredential:(id)a4
{
  id v6;
  id v7;
  const __CFString *v8;
  _SFAppAutoFillPasswordViewController *vcPicker;
  _SFAppAutoFillPasswordViewController *v10;
  _SFAppAutoFillPasswordViewController *v11;
  _SFAppAutoFillPasswordViewController *v12;
  unsigned __int8 v13;
  id v14;
  _QWORD block[5];
  id v16;

  v6 = a3;
  v7 = a4;
  if (dword_1001A8830 <= 30 && (dword_1001A8830 != -1 || _LogCategory_Initialize(&dword_1001A8830, 30)))
  {
    v8 = CFSTR("credential present");
    if (!v7)
      v8 = CFSTR("nil");
    LogPrintF(&dword_1001A8830, "-[ProximityAutoFillMainController passwordViewController:selectedCredential:]", 30, "Selected credential: %@", v8);
  }
  vcPicker = self->_vcPicker;
  v10 = (_SFAppAutoFillPasswordViewController *)v6;
  v11 = vcPicker;
  if (v11 == v10)
  {

  }
  else
  {
    v12 = v11;
    if ((v10 == 0) != (v11 != 0))
    {
      v13 = -[_SFAppAutoFillPasswordViewController isEqual:](v10, "isEqual:", v11);

      if ((v13 & 1) != 0)
        goto LABEL_17;
    }
    else
    {

    }
    if (dword_1001A8830 <= 60
      && (dword_1001A8830 != -1 || _LogCategory_Initialize(&dword_1001A8830, 60)))
    {
      LogPrintF(&dword_1001A8830, "-[ProximityAutoFillMainController passwordViewController:selectedCredential:]", 60, "Received credential from unknown VC?");
    }
  }
LABEL_17:
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100102964;
  block[3] = &unk_10017E1A0;
  block[4] = self;
  v16 = v7;
  v14 = v7;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

}

- (void)sessionStart
{
  void *v3;
  SFRemoteAutoFillSession *autoFillSession;
  SFRemoteAutoFillSession *v5;
  SFRemoteAutoFillSession *v6;
  uint64_t v7;
  void *v8;
  _QWORD v9[5];
  _QWORD v10[5];
  _QWORD v11[5];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ProximityAutoFillMainController deviceForSession](self, "deviceForSession"));
  if (v3)
  {
    if (dword_1001A8830 <= 50
      && (dword_1001A8830 != -1 || _LogCategory_Initialize(&dword_1001A8830, 50)))
    {
      LogPrintF(&dword_1001A8830, "-[ProximityAutoFillMainController sessionStart]", 50, "Session start with %@\n", v3);
    }
    autoFillSession = self->_autoFillSession;
    if (autoFillSession)
    {
      -[SFRemoteAutoFillSession invalidate](autoFillSession, "invalidate");
    }
    else
    {
      v5 = (SFRemoteAutoFillSession *)objc_alloc_init((Class)SFRemoteAutoFillSession);
      v6 = self->_autoFillSession;
      self->_autoFillSession = v5;

    }
    -[SFRemoteAutoFillSession setDispatchQueue:](self->_autoFillSession, "setDispatchQueue:", self->_workQueue);
    -[SFRemoteAutoFillSession setPeerDevice:](self->_autoFillSession, "setPeerDevice:", v3);
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_10010273C;
    v11[3] = &unk_10017E1F0;
    v11[4] = self;
    -[SFRemoteAutoFillSession setPairingFinishedHandler:](self->_autoFillSession, "setPairingFinishedHandler:", v11);
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100102744;
    v10[3] = &unk_10017D980;
    v10[4] = self;
    -[SFRemoteAutoFillSession setPromptForPickerHandler:](self->_autoFillSession, "setPromptForPickerHandler:", v10);
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100102888;
    v9[3] = &unk_10017E178;
    v9[4] = self;
    -[SFRemoteAutoFillSession setPromptForPINHandler:](self->_autoFillSession, "setPromptForPINHandler:", v9);
    -[SFRemoteAutoFillSession activate](self->_autoFillSession, "activate");
  }
  else
  {
    if (dword_1001A8830 <= 60
      && (dword_1001A8830 != -1 || _LogCategory_Initialize(&dword_1001A8830, 60)))
    {
      LogPrintF(&dword_1001A8830, "-[ProximityAutoFillMainController sessionStart]", 60, "### No device found to start session\n");
    }
    v7 = NSErrorWithOSStatusF(4294960569, "No device found to start session");
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    -[ProximityAutoFillMainController showDoneUI:](self, "showDoneUI:", v8);

  }
}

- (void)sessionStop
{
  SFRemoteAutoFillSession *autoFillSession;

  if (self->_autoFillSession)
  {
    if (dword_1001A8830 <= 50
      && (dword_1001A8830 != -1 || _LogCategory_Initialize(&dword_1001A8830, 50)))
    {
      LogPrintF(&dword_1001A8830, "-[ProximityAutoFillMainController sessionStop]", 50, "Session stop\n");
    }
    -[SFRemoteAutoFillSession invalidate](self->_autoFillSession, "invalidate");
    autoFillSession = self->_autoFillSession;
    self->_autoFillSession = 0;

  }
}

- (void)_handlePairingFinished
{
  _QWORD block[5];

  if (self->_vcVisualAuth)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100102624;
    block[3] = &unk_10017E1F0;
    block[4] = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
}

- (void)_handlePromptForPINWithFlags:(unsigned int)a3 throttleSeconds:(int)a4
{
  _QWORD v5[5];
  unsigned int v6;
  int v7;

  if (self->_pin)
  {
    if (dword_1001A8830 <= 30
      && (dword_1001A8830 != -1 || _LogCategory_Initialize(&dword_1001A8830, 30)))
    {
      LogPrintF(&dword_1001A8830, "-[ProximityAutoFillMainController _handlePromptForPINWithFlags:throttleSeconds:]", 30, "Trying pre-supplied PIN\n");
    }
    -[ProximityAutoFillMainController _tryPIN:](self, "_tryPIN:", self->_pin);
  }
  else
  {
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_100102614;
    v5[3] = &unk_10017DD40;
    v5[4] = self;
    v6 = a3;
    v7 = a4;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v5);
  }
}

- (void)_tryPIN:(id)a3
{
  __CFString *v4;
  int v5;
  const __CFString *v6;
  __CFString *v7;

  v4 = (__CFString *)a3;
  v7 = v4;
  if (dword_1001A8830 <= 30)
  {
    if (dword_1001A8830 != -1 || (v4 = (__CFString *)_LogCategory_Initialize(&dword_1001A8830, 30), (_DWORD)v4))
    {
      v5 = IsAppleInternalBuild(v4);
      v6 = CFSTR("*");
      if (v5)
        v6 = v7;
      LogPrintF(&dword_1001A8830, "-[ProximityAutoFillMainController _tryPIN:]", 30, "Try PIN '%@'\n", v6);
    }
  }
  -[SFRemoteAutoFillSession tryPIN:](self->_autoFillSession, "tryPIN:", v7);

}

- (unint64_t)badPINCount
{
  return self->_badPINCount;
}

- (void)setBadPINCount:(unint64_t)a3
{
  self->_badPINCount = a3;
}

- (NSString)deviceAddress
{
  return self->_deviceAddress;
}

- (void)setDeviceAddress:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 264);
}

- (NSUUID)deviceIdentifier
{
  return self->_deviceIdentifier;
}

- (void)setDeviceIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 272);
}

- (UIStoryboard)mainStoryboard
{
  return self->_mainStoryboard;
}

- (void)setMainStoryboard:(id)a3
{
  objc_storeStrong((id *)&self->_mainStoryboard, a3);
}

- (BOOL)prefHideTTR
{
  return self->_prefHideTTR;
}

- (BOOL)prefSkipAuth
{
  return self->_prefSkipAuth;
}

- (void)setPrefSkipAuth:(BOOL)a3
{
  self->_prefSkipAuth = a3;
}

- (int64_t)testMode
{
  return self->_testMode;
}

- (void)setTestMode:(int64_t)a3
{
  self->_testMode = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mainStoryboard, 0);
  objc_storeStrong((id *)&self->_deviceIdentifier, 0);
  objc_storeStrong((id *)&self->_deviceAddress, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_associatedDomains, 0);
  objc_storeStrong((id *)&self->_unlocalizedAppName, 0);
  objc_storeStrong((id *)&self->_vcVisualAuthParent, 0);
  objc_storeStrong((id *)&self->_vcVisualAuth, 0);
  objc_storeStrong((id *)&self->_vcStart, 0);
  objc_storeStrong((id *)&self->_vcPicker, 0);
  objc_storeStrong((id *)&self->_vcNav, 0);
  objc_storeStrong((id *)&self->_vcDone, 0);
  objc_storeStrong((id *)&self->_vcAuth, 0);
  objc_storeStrong((id *)&self->_pin, 0);
  objc_storeStrong((id *)&self->_pickedPassword, 0);
  objc_storeStrong((id *)&self->_pickedUsername, 0);
  objc_storeStrong((id *)&self->_peerContactID, 0);
  objc_storeStrong((id *)&self->_localizedAppName, 0);
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_devices, 0);
  objc_storeStrong((id *)&self->_deviceDiscovery, 0);
  objc_storeStrong(&self->_credentialsHandler, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_authContext, 0);
  objc_storeStrong((id *)&self->_autoFillSession, 0);
}

+ (BOOL)_isSecureForRemoteViewService
{
  return 1;
}

@end
