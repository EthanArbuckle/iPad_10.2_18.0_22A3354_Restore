@implementation WHASetupMainController

- (void)configureWithContext:(id)a3 completion:(id)a4
{
  NSDictionary *v6;
  NSDictionary *userInfo;
  NSDictionary *v8;
  CFTypeID TypeID;
  uint64_t TypedValue;
  void *v11;
  int v12;
  void (**v13)(void);
  unsigned int v14;
  void (**v15)(void);

  v15 = (void (**)(void))a4;
  self->_dismissNotifyToken = -1;
  v6 = (NSDictionary *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "userInfo"));
  userInfo = self->super._userInfo;
  self->super._userInfo = v6;

  if (dword_1001A9008 <= 30 && (dword_1001A9008 != -1 || _LogCategory_Initialize(&dword_1001A9008, 30)))
    LogPrintF(&dword_1001A9008, "-[WHASetupMainController configureWithContext:completion:]", 30, "Main configuration: %@\n", self->super._userInfo);
  v8 = self->super._userInfo;
  TypeID = CFStringGetTypeID();
  TypedValue = CFDictionaryGetTypedValue(v8, CFSTR("deviceIdentifier"), TypeID, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue(TypedValue);
  if ((objc_msgSend(v11, "isEqual:", CFSTR("00000000-0000-0000-0000-000000000001")) & 1) != 0)
  {
    v12 = 1;
LABEL_25:
    v13 = v15;
LABEL_26:
    self->_testMode = v12;
    goto LABEL_27;
  }
  if ((objc_msgSend(v11, "isEqual:", CFSTR("00000000-0000-0000-0000-000000000002")) & 1) != 0)
  {
    v12 = 2;
    goto LABEL_25;
  }
  if ((objc_msgSend(v11, "isEqual:", CFSTR("00000000-0000-0000-0000-000000000003")) & 1) != 0)
  {
    v12 = 3;
    goto LABEL_25;
  }
  if ((objc_msgSend(v11, "isEqual:", CFSTR("00000000-0000-0000-0000-000000000004")) & 1) != 0)
  {
    v12 = 4;
    goto LABEL_25;
  }
  if ((objc_msgSend(v11, "isEqual:", CFSTR("00000000-0000-0000-0000-000000000005")) & 1) != 0)
  {
    v12 = 5;
    goto LABEL_25;
  }
  if ((objc_msgSend(v11, "isEqual:", CFSTR("00000000-0000-0000-0000-000000000006")) & 1) != 0)
  {
    v12 = 6;
    goto LABEL_25;
  }
  if ((objc_msgSend(v11, "isEqual:", CFSTR("00000000-0000-0000-0000-000000000007")) & 1) != 0)
  {
    v12 = 7;
    goto LABEL_25;
  }
  if ((objc_msgSend(v11, "isEqual:", CFSTR("00000000-0000-0000-0000-000000000008")) & 1) != 0)
  {
    v12 = 8;
    goto LABEL_25;
  }
  if ((objc_msgSend(v11, "isEqual:", CFSTR("00000000-0000-0000-0000-000000000009")) & 1) != 0)
  {
    v12 = 9;
    goto LABEL_25;
  }
  if ((objc_msgSend(v11, "isEqual:", CFSTR("00000000-0000-0000-0000-00000000000A")) & 1) != 0)
  {
    v12 = 10;
    goto LABEL_25;
  }
  v14 = objc_msgSend(v11, "isEqual:", CFSTR("00000000-0000-0000-0000-00000000000B"));
  v13 = v15;
  if (v14)
  {
    v12 = 11;
    goto LABEL_26;
  }
LABEL_27:
  if (v13)
    v15[2]();

}

- (unint64_t)supportedInterfaceOrientations
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[WHASetupMainController view](self, "view"));
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

- (void)viewDidAppear:(BOOL)a3
{
  _BOOL8 v3;
  uint64_t Int64;
  BOOL v6;
  BOOL v7;
  UIStoryboard *v8;
  UIStoryboard *storyboard;
  SVSCommonNavController *v10;
  SVSCommonNavController *vcNav;
  void *v12;
  unint64_t v13;
  void *v14;
  WHASetupStartViewController *v15;
  WHASetupStartViewController *vcStart;
  _QWORD v17[5];
  objc_super v18;
  int v19;

  v3 = a3;
  if (dword_1001A9008 <= 30 && (dword_1001A9008 != -1 || _LogCategory_Initialize(&dword_1001A9008, 30)))
    LogPrintF(&dword_1001A9008, "-[WHASetupMainController viewDidAppear:]", 30, "Main ViewDidAppear\n");
  v19 = 0;
  v18.receiver = self;
  v18.super_class = (Class)WHASetupMainController;
  -[WHASetupMainController viewDidAppear:](&v18, "viewDidAppear:", v3);
  self->_viewAppearedTicks = mach_absolute_time();
  Int64 = CFPrefs_GetInt64(CFSTR("com.apple.Sharing"), CFSTR("ppPlaceholderImages"), &v19);
  if (v19)
    v6 = 1;
  else
    v6 = Int64 == 0;
  v7 = !v6;
  self->_placeholderUI = v7;
  v8 = (UIStoryboard *)objc_claimAutoreleasedReturnValue(+[UIStoryboard storyboardWithName:bundle:](UIStoryboard, "storyboardWithName:bundle:", CFSTR("WHASetup"), 0));
  storyboard = self->_storyboard;
  self->_storyboard = v8;

  v10 = (SVSCommonNavController *)objc_claimAutoreleasedReturnValue(-[UIStoryboard instantiateInitialViewController](self->_storyboard, "instantiateInitialViewController"));
  vcNav = self->_vcNav;
  self->_vcNav = v10;

  -[SVSCommonNavController setDelegate:](self->_vcNav, "setDelegate:", self);
  -[SVSCommonNavController setModalPresentationStyle:](self->_vcNav, "setModalPresentationStyle:", 4);
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
  v13 = (unint64_t)objc_msgSend(v12, "userInterfaceIdiom");

  if ((v13 & 0xFFFFFFFFFFFFFFFBLL) == 1)
    -[SVSCommonNavController setModalTransitionStyle:](self->_vcNav, "setModalTransitionStyle:", 2);
  -[SVSCommonNavController setTransitioningDelegate:](self->_vcNav, "setTransitioningDelegate:", self->_vcNav);
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[SVSCommonNavController viewControllers](self->_vcNav, "viewControllers"));
  v15 = (WHASetupStartViewController *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "firstObject"));
  vcStart = self->_vcStart;
  self->_vcStart = v15;

  -[SVSBaseViewController setMainController:](self->_vcStart, "setMainController:", self);
  -[WHASetupMainController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", self->_vcNav, 1, 0);
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10011F004;
  v17[3] = &unk_10017E0D8;
  v17[4] = self;
  notify_register_dispatch("com.apple.sharing.ProxCard.dismiss", &self->_dismissNotifyToken, (dispatch_queue_t)&_dispatch_main_q, v17);
}

- (void)viewDidDisappear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  int dismissNotifyToken;
  SFDeviceSetupWHASession *setupSession;
  UIStoryboard *storyboard;
  WHASetupAuthViewController *vcAuth;
  WHASetupDoneViewController *vcDone;
  SVSCommonNavController *vcNav;
  WHASetupProgressViewController *vcProgress;
  WHASetupHomePickerViewController *vcHomePicker;
  WHASetupRoomPickerViewController *vcRoomPicker;
  WHASetupStartViewController *vcStart;
  objc_super v16;

  v3 = a3;
  if (dword_1001A9008 <= 30 && (dword_1001A9008 != -1 || _LogCategory_Initialize(&dword_1001A9008, 30)))
    LogPrintF(&dword_1001A9008, "-[WHASetupMainController viewDidDisappear:]", 30, "Main ViewDidDisappear\n");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[WHASetupMainController _remoteViewControllerProxy](self, "_remoteViewControllerProxy"));
  objc_msgSend(v5, "setIdleTimerDisabled:forReason:", 0, CFSTR("com.apple.SharingViewService.WHASetup"));

  if (!self->_dismissed)
  {
    if (dword_1001A9008 <= 30
      && (dword_1001A9008 != -1 || _LogCategory_Initialize(&dword_1001A9008, 30)))
    {
      LogPrintF(&dword_1001A9008, "-[WHASetupMainController viewDidDisappear:]", 30, "Main disappeared without dismiss (device locked?)...dismissing UI\n");
    }
    -[WHASetupMainController dismiss:](self, "dismiss:", 21);
  }
  dismissNotifyToken = self->_dismissNotifyToken;
  if (dismissNotifyToken != -1)
  {
    notify_cancel(dismissNotifyToken);
    self->_dismissNotifyToken = -1;
  }
  -[SFDeviceSetupWHASession invalidate](self->_setupSession, "invalidate");
  setupSession = self->_setupSession;
  self->_setupSession = 0;

  storyboard = self->_storyboard;
  self->_storyboard = 0;

  -[SVSBaseViewController setMainController:](self->_vcAuth, "setMainController:", 0);
  vcAuth = self->_vcAuth;
  self->_vcAuth = 0;

  -[SVSBaseViewController setMainController:](self->_vcDone, "setMainController:", 0);
  vcDone = self->_vcDone;
  self->_vcDone = 0;

  vcNav = self->_vcNav;
  self->_vcNav = 0;

  -[SVSBaseViewController setMainController:](self->_vcProgress, "setMainController:", 0);
  vcProgress = self->_vcProgress;
  self->_vcProgress = 0;

  -[SVSBaseViewController setMainController:](self->_vcHomePicker, "setMainController:", 0);
  vcHomePicker = self->_vcHomePicker;
  self->_vcHomePicker = 0;

  -[SVSBaseViewController setMainController:](self->_vcRoomPicker, "setMainController:", 0);
  vcRoomPicker = self->_vcRoomPicker;
  self->_vcRoomPicker = 0;

  -[SVSBaseViewController setMainController:](self->_vcStart, "setMainController:", 0);
  vcStart = self->_vcStart;
  self->_vcStart = 0;

  v16.receiver = self;
  v16.super_class = (Class)WHASetupMainController;
  -[SVSBaseMainController viewDidDisappear:](&v16, "viewDidDisappear:", v3);
}

- (void)dismiss:(int)a3
{
  -[WHASetupMainController dismiss:completion:](self, "dismiss:completion:", *(_QWORD *)&a3, 0);
}

- (void)dismiss:(int)a3 completion:(id)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  void *v8;
  SVSCommonNavController *vcNav;
  _QWORD v10[4];
  id v11;
  id v12;

  v4 = *(_QWORD *)&a3;
  v6 = a4;
  if (!self->_dismissed)
  {
    self->_dismissed = 1;
    -[WHASetupMainController logUsageStart:](self, "logUsageStart:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[WHASetupMainController _remoteViewControllerProxy](self, "_remoteViewControllerProxy"));
    v8 = v7;
    vcNav = self->_vcNav;
    if (vcNav)
    {
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_10011EFD4;
      v10[3] = &unk_10017E100;
      v12 = v6;
      v11 = v8;
      -[SVSCommonNavController dismissViewControllerAnimated:completion:](vcNav, "dismissViewControllerAnimated:completion:", 1, v10);

    }
    else
    {
      objc_msgSend(v7, "dismiss");
    }

  }
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
          if (dword_1001A9008 <= 30
            && (dword_1001A9008 != -1 || _LogCategory_Initialize(&dword_1001A9008, 30)))
          {
            LogPrintF(&dword_1001A9008, "-[WHASetupMainController handleButtonActions:]", 30, "Home button\n");
          }
          -[WHASetupMainController _handleHomeButtonPressed](self, "_handleHomeButtonPressed");
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (void)_handleHomeButtonPressed
{
  if (dword_1001A9008 <= 30 && (dword_1001A9008 != -1 || _LogCategory_Initialize(&dword_1001A9008, 30)))
    LogPrintF(&dword_1001A9008, "-[WHASetupMainController _handleHomeButtonPressed]", 30, "Home button\n");
  if (self->_homePressed || MKBGetDeviceLockState(0) - 1 > 1)
  {
    -[WHASetupMainController dismiss:](self, "dismiss:", 4);
  }
  else
  {
    if (dword_1001A9008 <= 30
      && (dword_1001A9008 != -1 || _LogCategory_Initialize(&dword_1001A9008, 30)))
    {
      LogPrintF(&dword_1001A9008, "-[WHASetupMainController _handleHomeButtonPressed]", 30, "Ignoring first home button press to unlock\n");
    }
    self->_homePressed = 1;
  }
}

- (void)logUsageStart:(int)a3
{
  uint64_t v3;
  NSDictionary *userInfo;
  CFTypeID TypeID;
  uint64_t TypedValue;
  uint64_t v8;
  __CFString *v9;
  uint64_t Int64Ranged;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[6];
  _QWORD v18[6];

  if (!self->_loggedUsageStart)
  {
    v3 = *(_QWORD *)&a3;
    self->_loggedUsageStart = 1;
    userInfo = self->super._userInfo;
    TypeID = CFStringGetTypeID();
    TypedValue = CFDictionaryGetTypedValue(userInfo, CFSTR("sessionUUID"), TypeID, 0);
    v8 = objc_claimAutoreleasedReturnValue(TypedValue);
    if (v8)
      v9 = (__CFString *)v8;
    else
      v9 = &stru_10017E3D8;
    Int64Ranged = CFDictionaryGetInt64Ranged(self->super._userInfo, CFSTR("rssi"), 0xFFFFFFFF80000000, 0x7FFFFFFFLL, 0);
    v11 = mach_absolute_time();
    v12 = UpTicksToMilliseconds(v11 - self->_viewAppearedTicks);
    v17[0] = CFSTR("_cat");
    v17[1] = CFSTR("_op");
    v18[0] = CFSTR("WHASetup");
    v18[1] = CFSTR("Start");
    v18[2] = v9;
    v17[2] = CFSTR("sid");
    v17[3] = CFSTR("rssi");
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", Int64Ranged));
    v18[3] = v13;
    v17[4] = CFSTR("action");
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v3));
    v18[4] = v14;
    v17[5] = CFSTR("ms");
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", v12));
    v18[5] = v15;
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v18, v17, 6));
    SFDashboardLogJSON(v16);

    if (dword_1001A9008 <= 50
      && (dword_1001A9008 != -1 || _LogCategory_Initialize(&dword_1001A9008, 50)))
    {
      LogPrintF(&dword_1001A9008, "-[WHASetupMainController logUsageStart:]", 50, "WHASetup: Start, ID %@, RSSI %ld, action %d, userMs %llu, badPIN %u", v9, Int64Ranged, v3, v12, self->_badPINCount);
    }

  }
}

- (void)logUsageDone:(int)a3
{
  uint64_t v3;
  NSDictionary *userInfo;
  CFTypeID TypeID;
  uint64_t TypedValue;
  uint64_t v8;
  __CFString *v9;
  uint64_t Int64Ranged;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  _QWORD v19[7];
  _QWORD v20[7];

  if (!self->_loggedUsageDone)
  {
    v3 = *(_QWORD *)&a3;
    self->_loggedUsageDone = 1;
    userInfo = self->super._userInfo;
    TypeID = CFStringGetTypeID();
    TypedValue = CFDictionaryGetTypedValue(userInfo, CFSTR("sessionUUID"), TypeID, 0);
    v8 = objc_claimAutoreleasedReturnValue(TypedValue);
    if (v8)
      v9 = (__CFString *)v8;
    else
      v9 = &stru_10017E3D8;
    Int64Ranged = CFDictionaryGetInt64Ranged(self->super._userInfo, CFSTR("rssi"), 0xFFFFFFFF80000000, 0x7FFFFFFFLL, 0);
    v11 = mach_absolute_time();
    v12 = UpTicksToMilliseconds(v11 - self->_viewAppearedTicks);
    v19[0] = CFSTR("_cat");
    v19[1] = CFSTR("_op");
    v20[0] = CFSTR("WHASetup");
    v20[1] = CFSTR("Done");
    v20[2] = v9;
    v19[2] = CFSTR("sid");
    v19[3] = CFSTR("rssi");
    v18 = Int64Ranged;
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", Int64Ranged));
    v20[3] = v13;
    v19[4] = CFSTR("error");
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v3));
    v20[4] = v14;
    v19[5] = CFSTR("ms");
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", v12));
    v20[5] = v15;
    v19[6] = CFSTR("badPIN");
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_badPINCount));
    v20[6] = v16;
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v20, v19, 7));
    SFDashboardLogJSON(v17);

    if (dword_1001A9008 <= 50
      && (dword_1001A9008 != -1 || _LogCategory_Initialize(&dword_1001A9008, 50)))
    {
      LogPrintF(&dword_1001A9008, "-[WHASetupMainController logUsageDone:]", 50, "WHASetup: Done, ID %@, RSSI %ld, error %d, totalMs %llu, badPIN %u", v9, v18, v3, v12, self->_badPINCount);
    }

  }
}

- (void)_sessionStart
{
  NSDictionary *userInfo;
  CFTypeID TypeID;
  uint64_t TypedValue;
  void *v6;
  id v7;
  id v8;
  SFDeviceSetupWHASession *v9;
  SFDeviceSetupWHASession *setupSession;
  void *v11;
  _QWORD v12[5];
  _QWORD v13[5];
  _QWORD v14[5];
  _QWORD v15[5];

  userInfo = self->super._userInfo;
  TypeID = CFStringGetTypeID();
  TypedValue = CFDictionaryGetTypedValue(userInfo, CFSTR("deviceIdentifier"), TypeID, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue(TypedValue);
  if (v6)
  {
    v7 = objc_msgSend(objc_alloc((Class)NSUUID), "initWithUUIDString:", v6);
    if (v7)
    {
      v8 = objc_alloc_init((Class)SFDevice);
      objc_msgSend(v8, "setIdentifier:", v7);
      -[SFDeviceSetupWHASession invalidate](self->_setupSession, "invalidate");
      v9 = (SFDeviceSetupWHASession *)objc_alloc_init((Class)SFDeviceSetupWHASession);
      setupSession = self->_setupSession;
      self->_setupSession = v9;

      -[SFDeviceSetupWHASession setPeerDevice:](self->_setupSession, "setPeerDevice:", v8);
      -[SFDeviceSetupWHASession setPresentingViewController:](self->_setupSession, "setPresentingViewController:", self->_vcStart);
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472;
      v15[2] = sub_10011EDE0;
      v15[3] = &unk_10017E128;
      v15[4] = self;
      -[SFDeviceSetupWHASession setProgressHandler:](self->_setupSession, "setProgressHandler:", v15);
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = sub_10011EDF0;
      v14[3] = &unk_10017E150;
      v14[4] = self;
      -[SFDeviceSetupWHASession setPromptForHomeHandler:](self->_setupSession, "setPromptForHomeHandler:", v14);
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_10011EE98;
      v13[3] = &unk_10017E178;
      v13[4] = self;
      -[SFDeviceSetupWHASession setPromptForPINHandler:](self->_setupSession, "setPromptForPINHandler:", v13);
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_10011EF2C;
      v12[3] = &unk_10017E150;
      v12[4] = self;
      -[SFDeviceSetupWHASession setPromptForRoomHandler:](self->_setupSession, "setPromptForRoomHandler:", v12);
      -[SFDeviceSetupWHASession activate](self->_setupSession, "activate");
      -[WHASetupMainController logUsageStart:](self, "logUsageStart:", 9);
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[WHASetupMainController _remoteViewControllerProxy](self, "_remoteViewControllerProxy"));
      objc_msgSend(v11, "setIdleTimerDisabled:forReason:", 1, CFSTR("com.apple.SharingViewService.WHASetup"));

    }
    else if (dword_1001A9008 <= 90
           && (dword_1001A9008 != -1 || _LogCategory_Initialize(&dword_1001A9008, 90)))
    {
      LogPrintF(&dword_1001A9008, "-[WHASetupMainController _sessionStart]", 90, "### Bad device identifier: '%@'\n", v6);
    }

  }
  else if (dword_1001A9008 <= 90
         && (dword_1001A9008 != -1 || _LogCategory_Initialize(&dword_1001A9008, 90)))
  {
    LogPrintF(&dword_1001A9008, "-[WHASetupMainController _sessionStart]", 90, "### No device identifier\n");
  }

}

- (void)_sessionHandleProgress:(unsigned int)a3 info:(id)a4
{
  uint64_t v4;
  __CFString *v6;
  const char *v7;
  int v8;
  const __CFString *v9;
  CFTypeID TypeID;
  uint64_t TypedValue;
  void *v12;
  void *v13;
  __CFString *v14;

  v4 = *(_QWORD *)&a3;
  v6 = (__CFString *)a4;
  v14 = v6;
  if (dword_1001A9008 > 30)
    goto LABEL_178;
  if (dword_1001A9008 == -1)
  {
    v8 = _LogCategory_Initialize(&dword_1001A9008, 30);
    v6 = v14;
    if (!v8)
      goto LABEL_178;
  }
  if ((int)v4 > 299)
  {
    if ((int)v4 > 799)
    {
      if ((int)v4 <= 999)
      {
        switch((int)v4)
        {
          case 900:
            v7 = "SU-No-SetupScanAttempt";
            break;
          case 901:
            v7 = "SU-No-SetupStatusUpdate";
            break;
          case 902:
            v7 = "SU-No-SetupWipeWifi";
            break;
          case 903:
            v7 = "SU-No-SetupCancelled";
            break;
          case 904:
            v7 = "SU-No-SetupObliterate";
            break;
          case 905:
            v7 = "SU-No-SetupCannotCancel";
            break;
          case 906:
            v7 = "SysDrop AirDrop Event";
            break;
          case 907:
            v7 = "SysDrop Sysdiagnose Event";
            break;
          case 908:
            v7 = "SysDrop Cancel Event";
            break;
          case 909:
            v7 = "File Transfer Progress Event";
            break;
          case 910:
            v7 = "File Transfer Completed Event";
            break;
          case 911:
            v7 = "iOSWiFiSetup";
            break;
          case 912:
            v7 = "HKPrimaryResidentSSIDFetchStart";
            break;
          default:
            switch((int)v4)
            {
              case 800:
                v7 = "AuthAccountsStart";
                break;
              case 803:
                v7 = "AuthAccountsiCloudProgress";
                break;
              case 804:
                v7 = "AuthAccountsStoreProgress";
                break;
              case 805:
                v7 = "AuthAccountsGameCenterProgress";
                break;
              default:
                goto LABEL_168;
            }
            break;
        }
        goto LABEL_175;
      }
      if ((int)v4 <= 1099)
      {
        if ((_DWORD)v4 == 1000)
        {
          v7 = "SecureIntentStart";
          goto LABEL_175;
        }
        if ((_DWORD)v4 == 1001)
        {
          v7 = "SecureIntentFinish";
          goto LABEL_175;
        }
        goto LABEL_168;
      }
      if ((_DWORD)v4 == 1100)
      {
        v7 = "OneTimeCodeDetected";
        goto LABEL_175;
      }
      if ((_DWORD)v4 == 2000)
      {
        v7 = "DependentStart";
        goto LABEL_175;
      }
      if ((_DWORD)v4 != 2001)
        goto LABEL_168;
      v7 = "DependentEnd";
    }
    else if ((int)v4 <= 519)
    {
      if ((int)v4 <= 410)
      {
        if ((int)v4 <= 399)
        {
          if ((_DWORD)v4 == 300)
          {
            v7 = "BackupProgress";
            goto LABEL_175;
          }
          if ((_DWORD)v4 == 310)
          {
            v7 = "SyncProgress";
            goto LABEL_175;
          }
          goto LABEL_168;
        }
        if ((_DWORD)v4 == 400)
        {
          v7 = "StopSetup";
          goto LABEL_175;
        }
        if ((_DWORD)v4 == 401)
        {
          v7 = "PINPair";
          goto LABEL_175;
        }
        if ((_DWORD)v4 != 410)
          goto LABEL_168;
        v7 = "MigrateStart";
      }
      else
      {
        if ((int)v4 > 430)
        {
          switch((_DWORD)v4)
          {
            case 0x1AF:
              v7 = "eSimExternal2FAStop";
              goto LABEL_175;
            case 0x1F4:
              v7 = "SiriWelcome";
              goto LABEL_175;
            case 0x1FE:
              v7 = "SiriDialogA";
              goto LABEL_175;
          }
          goto LABEL_168;
        }
        if ((_DWORD)v4 == 411)
        {
          v7 = "MigrateStop";
          goto LABEL_175;
        }
        if ((_DWORD)v4 == 420)
        {
          v7 = "FileTransferReady";
          goto LABEL_175;
        }
        if ((_DWORD)v4 != 430)
          goto LABEL_168;
        v7 = "eSimExternal2FAStart";
      }
    }
    else if ((int)v4 > 559)
    {
      if ((int)v4 > 599)
      {
        switch((_DWORD)v4)
        {
          case 0x258:
            v7 = "SiriSkipDemo";
            goto LABEL_175;
          case 0x2BC:
            v7 = "StopSetupLEDs";
            goto LABEL_175;
          case 0x2C6:
            v7 = "AudioPasscodeEnded";
            goto LABEL_175;
        }
        goto LABEL_168;
      }
      if ((_DWORD)v4 == 560)
      {
        v7 = "SiriDialogCMusic";
        goto LABEL_175;
      }
      if ((_DWORD)v4 == 570)
      {
        v7 = "SiriDialogCNews";
        goto LABEL_175;
      }
      if ((_DWORD)v4 != 580)
        goto LABEL_168;
      v7 = "SiriDialogCWeather";
    }
    else
    {
      if ((int)v4 > 549)
      {
        switch((_DWORD)v4)
        {
          case 0x226:
            v7 = "SiriDialogBWeather";
            goto LABEL_175;
          case 0x22B:
            v7 = "SiriDialogBClock";
            goto LABEL_175;
          case 0x22E:
            v7 = "SiriDialogBMusic";
            goto LABEL_175;
        }
        goto LABEL_168;
      }
      if ((_DWORD)v4 == 520)
      {
        v7 = "SiriDialogBStart";
        goto LABEL_175;
      }
      if ((_DWORD)v4 == 530)
      {
        v7 = "SiriDialogBHome";
        goto LABEL_175;
      }
      if ((_DWORD)v4 != 540)
        goto LABEL_168;
      v7 = "SiriDialogBNews";
    }
  }
  else if ((int)v4 > 129)
  {
    if ((int)v4 > 249)
    {
      switch((int)v4)
      {
        case 260:
          v7 = "TVLSStart";
          break;
        case 261:
        case 262:
        case 263:
        case 265:
        case 266:
        case 267:
        case 268:
        case 269:
        case 271:
        case 273:
        case 275:
          goto LABEL_168;
        case 264:
          v7 = "TVLSFinish";
          break;
        case 270:
          v7 = "TVLSEstimateStart";
          break;
        case 272:
          v7 = "TVLSEstimateFinal";
          break;
        case 274:
          v7 = "TVLSEstimateFailed";
          break;
        case 276:
          v7 = "TVLSTryAgain";
          break;
        case 277:
          v7 = "TVLSToneBegan";
          break;
        case 278:
          v7 = "TVLCalStart";
          break;
        case 279:
          v7 = "TVLCalStep";
          break;
        case 280:
          v7 = "TVLCalFailed";
          break;
        case 281:
          v7 = "TVLCalTryAgain";
          break;
        case 282:
          v7 = "TVLCalFinal";
          break;
        default:
          if ((_DWORD)v4 != 250)
            goto LABEL_168;
          v7 = "ReportSuccess";
          break;
      }
      goto LABEL_175;
    }
    if ((int)v4 > 219)
    {
      switch((int)v4)
      {
        case 230:
          v7 = "HomeKitStart";
          goto LABEL_175;
        case 231:
        case 232:
        case 233:
        case 235:
        case 237:
        case 238:
        case 239:
          goto LABEL_168;
        case 234:
          v7 = "HomeKitSetupStart";
          goto LABEL_175;
        case 236:
          v7 = "CDPSetupStart";
          goto LABEL_175;
        case 240:
          v7 = "BuddyStarting";
          goto LABEL_175;
        case 241:
          v7 = "BuddyProgress";
          goto LABEL_175;
        case 242:
          v7 = "BuddyFinished";
          goto LABEL_175;
        default:
          if ((_DWORD)v4 == 220)
          {
            v7 = "iCloudStart";
          }
          else
          {
            if ((_DWORD)v4 != 224)
              goto LABEL_168;
            v7 = "AppleIDSetupStart";
          }
          break;
      }
      goto LABEL_175;
    }
    if ((int)v4 <= 149)
    {
      if ((_DWORD)v4 == 130)
      {
        v7 = "WiFiPoweredOff";
        goto LABEL_175;
      }
      if ((_DWORD)v4 == 140)
      {
        v7 = "RecognizeVoice";
        goto LABEL_175;
      }
      goto LABEL_168;
    }
    if ((_DWORD)v4 == 150)
    {
      v7 = "SiriForEveryone";
      goto LABEL_175;
    }
    if ((_DWORD)v4 == 200)
    {
      v7 = "WiFiStart";
      goto LABEL_175;
    }
    if ((_DWORD)v4 != 210)
      goto LABEL_168;
    v7 = "ActivationStart";
  }
  else if ((int)v4 > 79)
  {
    if ((int)v4 <= 119)
    {
      switch((int)v4)
      {
        case 'P':
          v7 = "BasicConfigStart";
          break;
        case 'Z':
          v7 = "BasicConfigFinish";
          break;
        case '\\':
          v7 = "StepStart";
          break;
        case '^':
          v7 = "StepFinish";
          break;
        case '_':
          v7 = "PreFinish";
          break;
          v7 = "SetupFinished";
          break;
        case 'a':
          v7 = "SetupResumed";
          break;
        case 'b':
          v7 = "SetupSuspend";
          break;
        case 'c':
          v7 = "SetupPeerSWUpdate";
          break;
        case 'd':
          v7 = "Finished";
          break;
        default:
          goto LABEL_168;
      }
      goto LABEL_175;
    }
    if ((_DWORD)v4 == 120)
    {
      v7 = "CheckingiCloud";
      goto LABEL_175;
    }
    if ((_DWORD)v4 == 122)
    {
      v7 = "CheckingAppleMusic";
      goto LABEL_175;
    }
    if ((_DWORD)v4 != 124)
      goto LABEL_168;
    v7 = "CheckingAccount";
  }
  else
  {
    if ((int)v4 <= 49)
    {
      if ((int)v4 > 29)
      {
        switch((int)v4)
        {
          case 30:
            v7 = "Error";
            break;
          case 31:
            v7 = "SessionStarted";
            break;
          case 32:
            v7 = "SessionEnded";
            break;
          case 33:
            v7 = "SessionSecured";
            break;
          case 35:
            v7 = "ConnectStart";
            break;
          case 40:
            v7 = "PreAuthStart";
            break;
          default:
            goto LABEL_168;
        }
        goto LABEL_175;
      }
      switch((_DWORD)v4)
      {
        case 0:
          v7 = "Invalid";
          goto LABEL_175;
        case 0xA:
          v7 = "Start";
          goto LABEL_175;
        case 0x14:
          v7 = "Final";
          goto LABEL_175;
      }
LABEL_168:
      v7 = "?";
      goto LABEL_175;
    }
    if ((int)v4 > 64)
    {
      if ((_DWORD)v4 == 65)
      {
        v7 = "SecurityAPCLoopStart";
        goto LABEL_175;
      }
      if ((_DWORD)v4 == 70)
      {
        v7 = "SecurityFinish";
        goto LABEL_175;
      }
      goto LABEL_168;
    }
    if ((_DWORD)v4 == 50)
    {
      v7 = "PreAuthFinish";
      goto LABEL_175;
    }
    if ((_DWORD)v4 != 60)
      goto LABEL_168;
    v7 = "SecurityStart";
  }
LABEL_175:
  v9 = &stru_10017E3D8;
  if (v6)
    v9 = v6;
  LogPrintF(&dword_1001A9008, "-[WHASetupMainController _sessionHandleProgress:info:]", 30, "Progress: %s %@\n", v7, v9);
  v6 = v14;
LABEL_178:
  if (self->_setupSession)
  {
    if ((int)v4 <= 199)
    {
      switch((_DWORD)v4)
      {
        case 0x14:
          if (dword_1001A9008 <= 30
            && (dword_1001A9008 != -1 || _LogCategory_Initialize(&dword_1001A9008, 30)))
          {
            LogPrintF(&dword_1001A9008, "-[WHASetupMainController _sessionHandleProgress:info:]", 30, "Setup completed\n");
          }
          -[WHASetupMainController showDoneUI:](self, "showDoneUI:", 0);
          v13 = (void *)objc_claimAutoreleasedReturnValue(-[WHASetupMainController _remoteViewControllerProxy](self, "_remoteViewControllerProxy"));
          objc_msgSend(v13, "setIdleTimerDisabled:forReason:", 0, CFSTR("com.apple.SharingViewService.WHASetup"));

          goto LABEL_197;
        case 0x1E:
          TypeID = CFErrorGetTypeID();
          TypedValue = CFDictionaryGetTypedValue(v14, CFSTR("eo"), TypeID, 0);
          v12 = (void *)objc_claimAutoreleasedReturnValue(TypedValue);
          if (dword_1001A9008 <= 60
            && (dword_1001A9008 != -1 || _LogCategory_Initialize(&dword_1001A9008, 60)))
          {
            LogPrintF(&dword_1001A9008, "-[WHASetupMainController _sessionHandleProgress:info:]", 60, "### Setup failed: %{error}\n", v12);
          }
          -[WHASetupMainController showDoneUI:error:](self, "showDoneUI:error:", NSErrorToOSStatus(v12), v12);

          goto LABEL_197;
        case 0x46:
          -[WHASetupMainController showProgressUI](self, "showProgressUI");
          goto LABEL_197;
      }
    }
    else if ((v4 - 200) <= 0x1E && ((1 << (v4 + 56)) & 0x40100401) != 0)
    {
      -[WHASetupProgressViewController handleProgressEvent:](self->_vcProgress, "handleProgressEvent:", v4);
LABEL_197:
      v6 = v14;
    }
  }

}

- (void)showAuthUIWithFlags:(unsigned int)a3 throttleSeconds:(int)a4
{
  WHASetupAuthViewController *vcAuth;
  WHASetupAuthViewController *v6;
  WHASetupAuthViewController *v7;

  vcAuth = self->_vcAuth;
  if (vcAuth)
  {
    -[WHASetupAuthViewController showWithFlags:throttleSeconds:](vcAuth, "showWithFlags:throttleSeconds:", *(_QWORD *)&a3, *(_QWORD *)&a4);
  }
  else
  {
    if (dword_1001A9008 <= 30
      && (dword_1001A9008 != -1 || _LogCategory_Initialize(&dword_1001A9008, 30)))
    {
      LogPrintF(&dword_1001A9008, "-[WHASetupMainController showAuthUIWithFlags:throttleSeconds:]", 30, "Show auth UI\n");
    }
    v6 = (WHASetupAuthViewController *)objc_claimAutoreleasedReturnValue(-[UIStoryboard instantiateViewControllerWithIdentifier:](self->_storyboard, "instantiateViewControllerWithIdentifier:", CFSTR("AuthUI")));
    v7 = self->_vcAuth;
    self->_vcAuth = v6;

    -[SVSBaseViewController setMainController:](self->_vcAuth, "setMainController:", self);
    sub_100117584(self->_vcNav, self->_vcAuth, 0);
  }
}

- (void)showDoneUI:(int)a3
{
  -[WHASetupMainController showDoneUI:error:](self, "showDoneUI:error:", *(_QWORD *)&a3, 0);
}

- (void)showDoneUI:(int)a3 error:(id)a4
{
  uint64_t v4;
  SFDeviceSetupWHASession *setupSession;
  WHASetupDoneViewController *vcDone;
  const __CFString *v8;
  WHASetupDoneViewController *v9;
  WHASetupDoneViewController *v10;
  id v11;

  v4 = *(_QWORD *)&a3;
  v11 = a4;
  if (dword_1001A9008 <= 30 && (dword_1001A9008 != -1 || _LogCategory_Initialize(&dword_1001A9008, 30)))
    LogPrintF(&dword_1001A9008, "-[WHASetupMainController showDoneUI:error:]", 30, "Show done UI: %#m, %{error}\n", v4, v11);
  -[SFDeviceSetupWHASession invalidate](self->_setupSession, "invalidate");
  setupSession = self->_setupSession;
  self->_setupSession = 0;

  vcDone = self->_vcDone;
  if (!vcDone)
  {
    if ((v4 - 301000) > 0xF)
      v8 = CFSTR("DoneUI");
    else
      v8 = *(&off_10017E238 + (v4 - 301000));
    v9 = (WHASetupDoneViewController *)objc_claimAutoreleasedReturnValue(-[UIStoryboard instantiateViewControllerWithIdentifier:](self->_storyboard, "instantiateViewControllerWithIdentifier:", v8));
    v10 = self->_vcDone;
    self->_vcDone = v9;

    -[SVSBaseViewController setMainController:](self->_vcDone, "setMainController:", self);
    vcDone = self->_vcDone;
  }
  -[WHASetupDoneViewController setStatus:](vcDone, "setStatus:", v4);
  -[WHASetupDoneViewController setError:](self->_vcDone, "setError:", v11);
  sub_100117584(self->_vcNav, self->_vcDone, 0);
  -[WHASetupMainController logUsageDone:](self, "logUsageDone:", v4);

}

- (void)showHomePickerUI:(id)a3 defaultIndex:(int64_t)a4
{
  WHASetupHomePickerViewController *vcHomePicker;
  WHASetupHomePickerViewController *v7;
  WHASetupHomePickerViewController *v8;
  id v9;

  v9 = a3;
  if (dword_1001A9008 <= 30 && (dword_1001A9008 != -1 || _LogCategory_Initialize(&dword_1001A9008, 30)))
    LogPrintF(&dword_1001A9008, "-[WHASetupMainController showHomePickerUI:defaultIndex:]", 30, "Show HomePicker UI\n");
  vcHomePicker = self->_vcHomePicker;
  if (!vcHomePicker)
  {
    v7 = (WHASetupHomePickerViewController *)objc_claimAutoreleasedReturnValue(-[UIStoryboard instantiateViewControllerWithIdentifier:](self->_storyboard, "instantiateViewControllerWithIdentifier:", CFSTR("HomePickerUI")));
    v8 = self->_vcHomePicker;
    self->_vcHomePicker = v7;

    -[SVSBaseViewController setMainController:](self->_vcHomePicker, "setMainController:", self);
    vcHomePicker = self->_vcHomePicker;
  }
  -[WHASetupHomePickerViewController setHomes:](vcHomePicker, "setHomes:", v9);
  -[WHASetupHomePickerViewController setDefaultHomeIndex:](self->_vcHomePicker, "setDefaultHomeIndex:", a4);
  sub_100117584(self->_vcNav, self->_vcHomePicker, 0);

}

- (void)chooseHome:(id)a3
{
  -[SFDeviceSetupWHASession homeKitSelectHome:](self->_setupSession, "homeKitSelectHome:", a3);
}

- (void)showRoomPickerUI:(id)a3 firstSuggestedIndex:(int64_t)a4
{
  WHASetupRoomPickerViewController *vcRoomPicker;
  WHASetupRoomPickerViewController *v7;
  WHASetupRoomPickerViewController *v8;
  id v9;

  v9 = a3;
  if (dword_1001A9008 <= 30 && (dword_1001A9008 != -1 || _LogCategory_Initialize(&dword_1001A9008, 30)))
    LogPrintF(&dword_1001A9008, "-[WHASetupMainController showRoomPickerUI:firstSuggestedIndex:]", 30, "Show RoomPicker UI\n");
  vcRoomPicker = self->_vcRoomPicker;
  if (!vcRoomPicker)
  {
    v7 = (WHASetupRoomPickerViewController *)objc_claimAutoreleasedReturnValue(-[UIStoryboard instantiateViewControllerWithIdentifier:](self->_storyboard, "instantiateViewControllerWithIdentifier:", CFSTR("RoomPickerUI")));
    v8 = self->_vcRoomPicker;
    self->_vcRoomPicker = v7;

    -[SVSBaseViewController setMainController:](self->_vcRoomPicker, "setMainController:", self);
    vcRoomPicker = self->_vcRoomPicker;
  }
  -[WHASetupRoomPickerViewController setRooms:](vcRoomPicker, "setRooms:", v9);
  -[WHASetupRoomPickerViewController setFirstSuggestedIndex:](self->_vcRoomPicker, "setFirstSuggestedIndex:", a4);
  sub_100117584(self->_vcNav, self->_vcRoomPicker, 0);

}

- (void)chooseRoom:(id)a3
{
  -[SFDeviceSetupWHASession homeKitSelectRoom:](self->_setupSession, "homeKitSelectRoom:", a3);
}

- (void)showProgressUI
{
  WHASetupProgressViewController *vcProgress;
  WHASetupProgressViewController *v4;
  WHASetupProgressViewController *v5;

  if (dword_1001A9008 <= 30 && (dword_1001A9008 != -1 || _LogCategory_Initialize(&dword_1001A9008, 30)))
    LogPrintF(&dword_1001A9008, "-[WHASetupMainController showProgressUI]", 30, "Show progress UI\n");
  vcProgress = self->_vcProgress;
  if (!vcProgress)
  {
    v4 = (WHASetupProgressViewController *)objc_claimAutoreleasedReturnValue(-[UIStoryboard instantiateViewControllerWithIdentifier:](self->_storyboard, "instantiateViewControllerWithIdentifier:", CFSTR("ProgressUI")));
    v5 = self->_vcProgress;
    self->_vcProgress = v4;

    -[SVSBaseViewController setMainController:](self->_vcProgress, "setMainController:", self);
    vcProgress = self->_vcProgress;
  }
  sub_100117584(self->_vcNav, vcProgress, 0);
}

- (void)_pairSetupTryPIN:(id)a3
{
  __CFString *v4;
  int v5;
  const __CFString *v6;
  __CFString *v7;

  v4 = (__CFString *)a3;
  v7 = v4;
  if (dword_1001A9008 <= 30)
  {
    if (dword_1001A9008 != -1 || (v4 = (__CFString *)_LogCategory_Initialize(&dword_1001A9008, 30), (_DWORD)v4))
    {
      v5 = IsAppleInternalBuild(v4);
      v6 = CFSTR("*");
      if (v5)
        v6 = v7;
      LogPrintF(&dword_1001A9008, "-[WHASetupMainController _pairSetupTryPIN:]", 30, "Try PIN %@\n", v6);
    }
  }
  -[SFDeviceSetupWHASession pairSetupTryPIN:](self->_setupSession, "pairSetupTryPIN:", v7);

}

- (unsigned)badPINCount
{
  return self->_badPINCount;
}

- (void)setBadPINCount:(unsigned int)a3
{
  self->_badPINCount = a3;
}

- (BOOL)placeholderUI
{
  return self->_placeholderUI;
}

- (void)setPlaceholderUI:(BOOL)a3
{
  self->_placeholderUI = a3;
}

- (int)testMode
{
  return self->_testMode;
}

- (void)setTestMode:(int)a3
{
  self->_testMode = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vcStart, 0);
  objc_storeStrong((id *)&self->_vcRoomPicker, 0);
  objc_storeStrong((id *)&self->_vcHomePicker, 0);
  objc_storeStrong((id *)&self->_vcProgress, 0);
  objc_storeStrong((id *)&self->_vcDone, 0);
  objc_storeStrong((id *)&self->_vcNav, 0);
  objc_storeStrong((id *)&self->_vcAuth, 0);
  objc_storeStrong((id *)&self->_storyboard, 0);
  objc_storeStrong((id *)&self->_setupSession, 0);
}

+ (BOOL)_isSecureForRemoteViewService
{
  return 1;
}

@end
