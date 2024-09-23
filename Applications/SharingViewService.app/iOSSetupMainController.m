@implementation iOSSetupMainController

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)_willAppearInRemoteViewController
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)iOSSetupMainController;
  -[SVSBaseMainController _willAppearInRemoteViewController](&v4, "_willAppearInRemoteViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[iOSSetupMainController _remoteViewControllerProxy](self, "_remoteViewControllerProxy"));
  objc_msgSend(v3, "setAllowsAlertStacking:", 1);

}

- (void)configureWithContext:(id)a3 completion:(id)a4
{
  NSDictionary *v6;
  NSDictionary *userInfo;
  NSDictionary *v8;
  CFTypeID TypeID;
  uint64_t TypedValue;
  void *v11;
  int v12;
  NSUUID *v13;
  NSUUID *deviceIdentifier;
  const __CFString *v15;
  uint64_t v16;
  NSString *v17;
  NSString *otherDeviceClassName;
  void (**v19)(void);

  v19 = (void (**)(void))a4;
  v6 = (NSDictionary *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "userInfo"));
  userInfo = self->super._userInfo;
  self->super._userInfo = v6;

  if (dword_1001A82C8 <= 30 && (dword_1001A82C8 != -1 || _LogCategory_Initialize(&dword_1001A82C8, 30)))
    LogPrintF(&dword_1001A82C8, "-[iOSSetupMainController configureWithContext:completion:]", 30, "Main configuration: %@\n", self->super._userInfo);
  v8 = self->super._userInfo;
  TypeID = CFStringGetTypeID();
  TypedValue = CFDictionaryGetTypedValue(v8, CFSTR("deviceIdentifier"), TypeID, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue(TypedValue);
  if ((objc_msgSend(v11, "isEqual:", CFSTR("00000000-0000-0000-0000-000000000001")) & 1) != 0)
  {
    v12 = 1;
  }
  else
  {
    if (!objc_msgSend(v11, "isEqual:", CFSTR("00000000-0000-0000-0000-000000000002")))
      goto LABEL_10;
    v12 = 2;
  }
  self->_testMode = v12;
LABEL_10:
  if (v11)
  {
    v13 = (NSUUID *)objc_msgSend(objc_alloc((Class)NSUUID), "initWithUUIDString:", v11);
    deviceIdentifier = self->_deviceIdentifier;
    self->_deviceIdentifier = v13;

  }
  self->_otherDeviceClassCode = CFDictionaryGetInt64Ranged(self->super._userInfo, CFSTR("deviceClassCode"), 0, 255, 0);
  self->_otherDeviceModelCode = CFDictionaryGetInt64Ranged(self->super._userInfo, CFSTR("deviceModelCode"), 0, 255, 0);
  self->_otherDeviceColorCode = CFDictionaryGetInt64Ranged(self->super._userInfo, CFSTR("colorCode"), 0, 255, 0);
  if ((self->_otherDeviceClassCode - 2) > 3u)
    v15 = CFSTR("iPhone");
  else
    v15 = off_10017DFE0[(self->_otherDeviceClassCode - 2)];
  v16 = SFLocalizedStringForKey(v15);
  v17 = (NSString *)objc_claimAutoreleasedReturnValue(v16);
  otherDeviceClassName = self->_otherDeviceClassName;
  self->_otherDeviceClassName = v17;

  if (v19)
    v19[2]();

}

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

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[iOSSetupMainController view](self, "view"));
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
  UIStoryboard *v5;
  UIStoryboard *storyboard;
  SVSCommonNavController *v7;
  SVSCommonNavController *vcNav;
  void *v9;
  unint64_t v10;
  void *v11;
  iOSSetupStartViewController *v12;
  iOSSetupStartViewController *vcStart;
  objc_super v14;

  v3 = a3;
  if (dword_1001A82C8 <= 30 && (dword_1001A82C8 != -1 || _LogCategory_Initialize(&dword_1001A82C8, 30)))
    LogPrintF(&dword_1001A82C8, "-[iOSSetupMainController viewDidAppear:]", 30, "Main ViewDidAppear\n");
  v14.receiver = self;
  v14.super_class = (Class)iOSSetupMainController;
  -[iOSSetupMainController viewDidAppear:](&v14, "viewDidAppear:", v3);
  self->_viewAppearedTicks = mach_absolute_time();
  v5 = (UIStoryboard *)objc_claimAutoreleasedReturnValue(+[UIStoryboard storyboardWithName:bundle:](UIStoryboard, "storyboardWithName:bundle:", CFSTR("iOSSetup"), 0));
  storyboard = self->_storyboard;
  self->_storyboard = v5;

  v7 = (SVSCommonNavController *)objc_claimAutoreleasedReturnValue(-[UIStoryboard instantiateInitialViewController](self->_storyboard, "instantiateInitialViewController"));
  vcNav = self->_vcNav;
  self->_vcNav = v7;

  -[SVSCommonNavController setDelegate:](self->_vcNav, "setDelegate:", self);
  -[SVSCommonNavController setModalPresentationStyle:](self->_vcNav, "setModalPresentationStyle:", 4);
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
  v10 = (unint64_t)objc_msgSend(v9, "userInterfaceIdiom");

  if ((v10 & 0xFFFFFFFFFFFFFFFBLL) == 1)
    -[SVSCommonNavController setModalTransitionStyle:](self->_vcNav, "setModalTransitionStyle:", 2);
  -[SVSCommonNavController setTransitioningDelegate:](self->_vcNav, "setTransitioningDelegate:", self->_vcNav);
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[SVSCommonNavController viewControllers](self->_vcNav, "viewControllers"));
  v12 = (iOSSetupStartViewController *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "firstObject"));
  vcStart = self->_vcStart;
  self->_vcStart = v12;

  -[SVSBaseViewController setMainController:](self->_vcStart, "setMainController:", self);
  -[iOSSetupMainController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", self->_vcNav, 1, 0);
}

- (void)viewDidDisappear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  SFDeviceSetupSessioniOS *setupSession;
  UIStoryboard *storyboard;
  iOSSetupAuthViewController *vcAuth;
  iOSSetupBackupSyncViewController *vcBackupSync;
  iOSSetupDoneViewController *vcDone;
  iOSSetupFinishViewController *vcFinish;
  SVSCommonNavController *vcNav;
  iOSSetupStartViewController *vcStart;
  objc_super v14;

  v3 = a3;
  if (dword_1001A82C8 <= 30 && (dword_1001A82C8 != -1 || _LogCategory_Initialize(&dword_1001A82C8, 30)))
    LogPrintF(&dword_1001A82C8, "-[iOSSetupMainController viewDidDisappear:]", 30, "Main ViewDidDisappear\n");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[iOSSetupMainController _remoteViewControllerProxy](self, "_remoteViewControllerProxy"));
  objc_msgSend(v5, "setIdleTimerDisabled:forReason:", 0, CFSTR("com.apple.SharingViewService.iOSSetup"));

  if (!self->_dismissed)
  {
    if (dword_1001A82C8 <= 30
      && (dword_1001A82C8 != -1 || _LogCategory_Initialize(&dword_1001A82C8, 30)))
    {
      LogPrintF(&dword_1001A82C8, "-[iOSSetupMainController viewDidDisappear:]", 30, "Main disappeared without dismiss (device locked?)...dismissing UI\n");
    }
    -[iOSSetupMainController dismiss:](self, "dismiss:", 21);
  }
  -[SFDeviceSetupSessioniOS invalidate](self->_setupSession, "invalidate");
  setupSession = self->_setupSession;
  self->_setupSession = 0;

  storyboard = self->_storyboard;
  self->_storyboard = 0;

  -[SVSBaseViewController setMainController:](self->_vcAuth, "setMainController:", 0);
  vcAuth = self->_vcAuth;
  self->_vcAuth = 0;

  -[SVSBaseViewController setMainController:](self->_vcBackupSync, "setMainController:", 0);
  vcBackupSync = self->_vcBackupSync;
  self->_vcBackupSync = 0;

  -[SVSBaseViewController setMainController:](self->_vcDone, "setMainController:", 0);
  vcDone = self->_vcDone;
  self->_vcDone = 0;

  -[SVSBaseViewController setMainController:](self->_vcFinish, "setMainController:", 0);
  vcFinish = self->_vcFinish;
  self->_vcFinish = 0;

  vcNav = self->_vcNav;
  self->_vcNav = 0;

  -[SVSBaseViewController setMainController:](self->_vcStart, "setMainController:", 0);
  vcStart = self->_vcStart;
  self->_vcStart = 0;

  v14.receiver = self;
  v14.super_class = (Class)iOSSetupMainController;
  -[SVSBaseMainController viewDidDisappear:](&v14, "viewDidDisappear:", v3);
}

- (void)dismiss:(int)a3
{
  -[iOSSetupMainController dismiss:animated:](self, "dismiss:animated:", *(_QWORD *)&a3, a3 != 19);
}

- (void)dismiss:(int)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  _QWORD v7[4];
  id v8;

  if (!self->_dismissed)
  {
    v4 = a4;
    self->_dismissed = 1;
    -[iOSSetupMainController logUsageStart:](self, "logUsageStart:", *(_QWORD *)&a3);
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_1000E6510;
    v7[3] = &unk_10017E1F0;
    v8 = (id)objc_claimAutoreleasedReturnValue(-[iOSSetupMainController _remoteViewControllerProxy](self, "_remoteViewControllerProxy"));
    v6 = v8;
    -[iOSSetupMainController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", v4, v7);

  }
}

- (void)handleButtonActions:(id)a3
{
  id v4;
  const char *v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  v4 = a3;
  if (dword_1001A82C8 <= 30 && (dword_1001A82C8 != -1 || _LogCategory_Initialize(&dword_1001A82C8, 30)))
  {
    if (self->_blockHardwareButtons)
      v5 = "yes";
    else
      v5 = "no";
    LogPrintF(&dword_1001A82C8, "-[iOSSetupMainController handleButtonActions:]", 30, "Button actions: %##@, blocked %s\n", v4, v5);
  }
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)i);
        if (!self->_blockHardwareButtons
          && (objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)i), "events") & 0x10) != 0)
        {
          -[iOSSetupMainController _handleHomeButtonPressed](self, "_handleHomeButtonPressed");
        }
        objc_msgSend(v11, "sendResponseWithUnHandledEvents:", 0);
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v8);
  }

}

- (void)_handleHomeButtonPressed
{
  if (dword_1001A82C8 <= 30 && (dword_1001A82C8 != -1 || _LogCategory_Initialize(&dword_1001A82C8, 30)))
    LogPrintF(&dword_1001A82C8, "-[iOSSetupMainController _handleHomeButtonPressed]", 30, "Home button\n");
  if (self->_homePressed || MKBGetDeviceLockState(0) - 1 > 1)
  {
    -[iOSSetupMainController dismiss:](self, "dismiss:", 4);
  }
  else
  {
    if (dword_1001A82C8 <= 30
      && (dword_1001A82C8 != -1 || _LogCategory_Initialize(&dword_1001A82C8, 30)))
    {
      LogPrintF(&dword_1001A82C8, "-[iOSSetupMainController _handleHomeButtonPressed]", 30, "Ignoring first home button press to unlock\n");
    }
    self->_homePressed = 1;
  }
}

- (void)_handleMigrateStart
{
  if (CFPrefs_GetInt64(CFSTR("com.apple.Sharing"), CFSTR("d2dmFTDemo"), 0))
    -[iOSSetupMainController _handleMigrateStartDemo](self, "_handleMigrateStartDemo");
  else
    -[iOSSetupMainController _handleMigrateStartUI](self, "_handleMigrateStartUI");
}

- (void)_handleMigrateStartDemo
{
  RPFileTransferSession *v3;
  RPFileTransferSession *fileTransferSession;
  RPFileTransferSession *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  _QWORD v15[5];
  _QWORD v16[5];

  if (!self->_fileTransferSession)
  {
    if (dword_1001A82C8 <= 50
      && (dword_1001A82C8 != -1 || _LogCategory_Initialize(&dword_1001A82C8, 50)))
    {
      LogPrintF(&dword_1001A82C8, "-[iOSSetupMainController _handleMigrateStartDemo]", 50, "FileTransfer start\n");
    }
    v3 = (RPFileTransferSession *)objc_claimAutoreleasedReturnValue(-[SFDeviceSetupSessioniOS fileTransferSessionTemplate](self->_setupSession, "fileTransferSessionTemplate"));
    fileTransferSession = self->_fileTransferSession;
    self->_fileTransferSession = v3;
    v5 = v3;

    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_1000E629C;
    v16[3] = &unk_10017E070;
    v16[4] = self;
    -[RPFileTransferSession setCompletionHandler:](v5, "setCompletionHandler:", v16);
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_1000E6340;
    v15[3] = &unk_10017D480;
    v15[4] = v5;
    -[RPFileTransferSession setProgressHandler:](v5, "setProgressHandler:", v15);
    -[RPFileTransferSession setReceivedItemHandler:](v5, "setReceivedItemHandler:", &stru_10017D4C0);
    -[RPFileTransferSession activate](v5, "activate");
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:relativeToURL:](NSURL, "fileURLWithPath:relativeToURL:", CFSTR("/tmp/Test1.txt"), 0));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", "Test1", 5));
    objc_msgSend(v7, "writeToURL:options:error:", v6, 0, 0);

    v8 = objc_alloc_init((Class)RPFileTransferItem);
    objc_msgSend(v8, "setItemURL:", v6);
    -[RPFileTransferSession addItem:](v5, "addItem:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:relativeToURL:](NSURL, "fileURLWithPath:relativeToURL:", CFSTR("/tmp/Test2.txt"), 0));

    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", "Test2", 5));
    objc_msgSend(v10, "writeToURL:options:error:", v9, 0, 0);

    v11 = objc_alloc_init((Class)RPFileTransferItem);
    objc_msgSend(v11, "setItemURL:", v9);
    -[RPFileTransferSession addItem:](v5, "addItem:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:relativeToURL:](NSURL, "fileURLWithPath:relativeToURL:", CFSTR("/tmp/Test3.txt"), 0));

    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", "Test3", 5));
    objc_msgSend(v13, "writeToURL:options:error:", v12, 0, 0);

    v14 = objc_alloc_init((Class)RPFileTransferItem);
    objc_msgSend(v14, "setItemURL:", v12);
    -[RPFileTransferSession addItem:](v5, "addItem:", v14);
    -[RPFileTransferSession finish](v5, "finish");

  }
}

- (void)_handleMigrateStartUI
{
  BYMigrationSourceController *v3;
  BYMigrationSourceController *migrationController;
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(-[SFDeviceSetupSessioniOS fileTransferSessionTemplate](self->_setupSession, "fileTransferSessionTemplate"));
  if (v5)
  {
    v3 = (BYMigrationSourceController *)objc_alloc_init((Class)BYMigrationSourceController);
    migrationController = self->_migrationController;
    self->_migrationController = v3;

    if (self->_migrationController)
    {
      if (dword_1001A82C8 <= 30
        && (dword_1001A82C8 != -1 || _LogCategory_Initialize(&dword_1001A82C8, 30)))
      {
        LogPrintF(&dword_1001A82C8, "-[iOSSetupMainController _handleMigrateStartUI]", 30, "Migration start UI: %@\n", v5);
      }
      -[BYMigrationSourceController launchSetupForMigration:](self->_migrationController, "launchSetupForMigration:", v5);
    }
    else if (dword_1001A82C8 <= 90
           && (dword_1001A82C8 != -1 || _LogCategory_Initialize(&dword_1001A82C8, 90)))
    {
      LogPrintF(&dword_1001A82C8, "-[iOSSetupMainController _handleMigrateStartUI]", 90, "### Migration start UI failed: create controller failed\n");
    }
  }
  else if (dword_1001A82C8 <= 90
         && (dword_1001A82C8 != -1 || _LogCategory_Initialize(&dword_1001A82C8, 90)))
  {
    LogPrintF(&dword_1001A82C8, "-[iOSSetupMainController _handleMigrateStartUI]", 90, "### Migration start UI failed: no file transfer session\n");
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
  _QWORD v17[4];
  _QWORD v18[4];

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
    v18[0] = v9;
    v17[0] = CFSTR("sid");
    v17[1] = CFSTR("smoothedRSSI");
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", Int64Ranged));
    v18[1] = v13;
    v17[2] = CFSTR("action");
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v3));
    v18[2] = v14;
    v17[3] = CFSTR("userMs");
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", v12));
    v18[3] = v15;
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v18, v17, 4));
    SFMetricsLog(CFSTR("com.apple.sharing.Proximity.iOSSetupTriggered"), v16);

    if (dword_1001A82C8 <= 50
      && (dword_1001A82C8 != -1 || _LogCategory_Initialize(&dword_1001A82C8, 50)))
    {
      LogPrintF(&dword_1001A82C8, "-[iOSSetupMainController logUsageStart:]", 50, "iOSSetup: Start, ID %@, RSSI %ld, action %d, userMs %llu, badPIN %u", v9, Int64Ranged, v3, v12, self->_badPINCount);
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
  _QWORD v19[5];
  _QWORD v20[5];

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
    v20[0] = v9;
    v19[0] = CFSTR("sid");
    v19[1] = CFSTR("smoothedRSSI");
    v18 = Int64Ranged;
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", Int64Ranged));
    v20[1] = v13;
    v19[2] = CFSTR("errorCode");
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v3));
    v20[2] = v14;
    v19[3] = CFSTR("durationMs");
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", v12));
    v20[3] = v15;
    v19[4] = CFSTR("badPINCount");
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_badPINCount));
    v20[4] = v16;
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v20, v19, 5));
    SFMetricsLog(CFSTR("com.apple.sharing.Proximity.iOSSetupResult"), v17);

    if (dword_1001A82C8 <= 50
      && (dword_1001A82C8 != -1 || _LogCategory_Initialize(&dword_1001A82C8, 50)))
    {
      LogPrintF(&dword_1001A82C8, "-[iOSSetupMainController logUsageDone:]", 50, "iOSSetup: Done, ID %@, RSSI %ld, error %d, totalMs %llu, badPIN %u", v9, v18, v3, v12, self->_badPINCount);
    }

  }
}

- (void)_sessionStart:(id)a3
{
  id v4;
  SFDeviceSetupSessioniOS *v5;
  SFDeviceSetupSessioniOS *setupSession;
  void *v7;
  _QWORD v8[5];
  _QWORD v9[5];

  v4 = a3;
  if (dword_1001A82C8 <= 30 && (dword_1001A82C8 != -1 || _LogCategory_Initialize(&dword_1001A82C8, 30)))
    LogPrintF(&dword_1001A82C8, "-[iOSSetupMainController _sessionStart:]", 30, "Start setup with %@\n", v4);
  -[SFDeviceSetupSessioniOS invalidate](self->_setupSession, "invalidate");
  v5 = (SFDeviceSetupSessioniOS *)objc_alloc_init((Class)SFDeviceSetupSessioniOS);
  setupSession = self->_setupSession;
  self->_setupSession = v5;

  -[SFDeviceSetupSessioniOS setPeerDevice:](self->_setupSession, "setPeerDevice:", v4);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000E61F4;
  v9[3] = &unk_10017E128;
  v9[4] = self;
  -[SFDeviceSetupSessioniOS setProgressHandler:](self->_setupSession, "setProgressHandler:", v9);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000E6204;
  v8[3] = &unk_10017E178;
  v8[4] = self;
  -[SFDeviceSetupSessioniOS setPromptForPINHandler:](self->_setupSession, "setPromptForPINHandler:", v8);
  -[SFDeviceSetupSessioniOS activate](self->_setupSession, "activate");
  -[iOSSetupMainController logUsageStart:](self, "logUsageStart:", 9);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[iOSSetupMainController _remoteViewControllerProxy](self, "_remoteViewControllerProxy"));
  objc_msgSend(v7, "setIdleTimerDisabled:forReason:", 1, CFSTR("com.apple.SharingViewService.iOSSetup"));

}

- (void)_sessionHandleProgress:(unsigned int)a3 info:(id)a4
{
  uint64_t v4;
  __CFString *v6;
  const char *v7;
  const __CFString *v8;
  SFDeviceSetupSessioniOS *setupSession;
  id v10;
  VPScannerViewController *vcVisualAuth;
  VPScannerViewController *v12;
  void *v13;
  UIViewController *vcVisualAuthParent;
  void *v15;
  iOSSetupFinishViewController *vcFinish;
  uint64_t v17;
  CFTypeID TypeID;
  uint64_t TypedValue;
  void *v20;
  VPScannerViewController *v21;
  _BOOL8 v22;
  VPScannerViewController *v23;
  _QWORD v24[5];

  v4 = *(_QWORD *)&a3;
  v6 = (__CFString *)a4;
  if (dword_1001A82C8 <= 30 && (dword_1001A82C8 != -1 || _LogCategory_Initialize(&dword_1001A82C8, 30)))
  {
    v7 = sub_1000E5A3C(v4);
    v8 = &stru_10017E3D8;
    if (v6)
      v8 = v6;
    LogPrintF(&dword_1001A82C8, "-[iOSSetupMainController _sessionHandleProgress:info:]", 30, "Progress: %s %##@\n", v7, v8);
  }
  setupSession = self->_setupSession;
  if (setupSession)
  {
    if ((int)v4 <= 299)
    {
      if ((int)v4 <= 96)
      {
        if ((_DWORD)v4 == 20)
        {
          TypeID = CFErrorGetTypeID();
          TypedValue = CFDictionaryGetTypedValue(v6, CFSTR("eo"), TypeID, 0);
          v10 = (id)objc_claimAutoreleasedReturnValue(TypedValue);
          -[iOSSetupMainController showDoneUI:](self, "showDoneUI:", v10);
          v20 = (void *)objc_claimAutoreleasedReturnValue(-[iOSSetupMainController _remoteViewControllerProxy](self, "_remoteViewControllerProxy"));
          objc_msgSend(v20, "setIdleTimerDisabled:forReason:", 0, CFSTR("com.apple.SharingViewService.iOSSetup"));

        }
        else
        {
          if ((_DWORD)v4 != 70 || !self->_vcVisualAuth)
            goto LABEL_43;
          v10 = objc_alloc_init((Class)UINotificationFeedbackGenerator);
          objc_msgSend(v10, "notificationOccurred:", 0);
          vcVisualAuth = self->_vcVisualAuth;
          v24[0] = _NSConcreteStackBlock;
          v24[1] = 3221225472;
          v24[2] = sub_1000E61B8;
          v24[3] = &unk_10017E1F0;
          v24[4] = self;
          -[VPScannerViewController dismissViewControllerAnimated:completion:](vcVisualAuth, "dismissViewControllerAnimated:completion:", 1, v24);
          v12 = self->_vcVisualAuth;
          self->_vcVisualAuth = 0;

          v13 = (void *)objc_claimAutoreleasedReturnValue(-[UIViewController view](self->_vcVisualAuthParent, "view"));
          objc_msgSend(v13, "setHidden:", 0);

          vcVisualAuthParent = self->_vcVisualAuthParent;
          self->_vcVisualAuthParent = 0;

        }
        goto LABEL_43;
      }
      if ((_DWORD)v4 == 97)
      {
        v15 = (void *)objc_claimAutoreleasedReturnValue(-[SFDeviceSetupSessioniOS fileTransferSessionTemplate](setupSession, "fileTransferSessionTemplate"));
        if (v15)
          -[BYMigrationSourceController setFileTransferSession:](self->_migrationController, "setFileTransferSession:", v15);

        vcFinish = self->_vcFinish;
        v17 = 97;
      }
      else
      {
        if ((_DWORD)v4 != 99)
        {
          if ((_DWORD)v4 == 240)
            -[iOSSetupMainController showFinishUI](self, "showFinishUI");
          goto LABEL_43;
        }
        vcFinish = self->_vcFinish;
        v17 = 99;
      }
      -[iOSSetupFinishViewController handleProgressEvent:](vcFinish, "handleProgressEvent:", v17);
      goto LABEL_43;
    }
    if ((int)v4 <= 399)
    {
      if ((_DWORD)v4 == 300 || (_DWORD)v4 == 310)
        -[iOSSetupMainController showBackupSyncUI:info:](self, "showBackupSyncUI:info:", v4, v6);
    }
    else
    {
      switch((_DWORD)v4)
      {
        case 0x190:
          if (dword_1001A82C8 <= 30
            && (dword_1001A82C8 != -1 || _LogCategory_Initialize(&dword_1001A82C8, 30)))
          {
            LogPrintF(&dword_1001A82C8, "-[iOSSetupMainController _sessionHandleProgress:info:]", 30, "Stop setup from target\n");
          }
          v21 = self->_vcVisualAuth;
          v22 = v21 == 0;
          -[VPScannerViewController dismissViewControllerAnimated:completion:](v21, "dismissViewControllerAnimated:completion:", 1, 0);
          v23 = self->_vcVisualAuth;
          self->_vcVisualAuth = 0;

          -[iOSSetupMainController dismiss:animated:](self, "dismiss:animated:", 17, v22);
          break;
        case 0x191:
          if (dword_1001A82C8 <= 30
            && (dword_1001A82C8 != -1 || _LogCategory_Initialize(&dword_1001A82C8, 30)))
          {
            LogPrintF(&dword_1001A82C8, "-[iOSSetupMainController _sessionHandleProgress:info:]", 30, "PIN pair from target\n");
          }
          -[iOSSetupMainController _handleVisualAuthEvent:](self, "_handleVisualAuthEvent:", 2);
          break;
        case 0x19A:
          -[iOSSetupMainController _handleMigrateStart](self, "_handleMigrateStart");
          break;
      }
    }
  }
LABEL_43:

}

- (void)showAuthUIWithFlags:(unsigned int)a3 throttleSeconds:(int)a4 animated:(BOOL)a5
{
  _BOOL4 v5;
  iOSSetupAuthViewController *vcAuth;
  uint64_t v9;
  UIViewController *v10;
  UIViewController *vcVisualAuthParent;
  VPScannerViewController *v12;
  VPScannerViewController *vcVisualAuth;
  const __CFString *v14;
  iOSSetupAuthViewController *v15;
  iOSSetupAuthViewController *v16;
  SVSCommonNavController *vcNav;
  void *v18;
  id v19;
  void *v20;
  SVSCommonNavController *v21;
  VPScannerViewController *v22;
  _QWORD v23[5];
  _QWORD v24[5];
  _QWORD v25[5];

  v5 = a5;
  self->_visualAuthTryingCode = 0;
  vcAuth = self->_vcAuth;
  if ((a3 & 0x100) == 0 || vcAuth)
  {
    if (vcAuth)
    {
      -[iOSSetupAuthViewController showWithFlags:throttleSeconds:](vcAuth, "showWithFlags:throttleSeconds:");
    }
    else
    {
      v15 = (iOSSetupAuthViewController *)objc_claimAutoreleasedReturnValue(-[UIStoryboard instantiateViewControllerWithIdentifier:](self->_storyboard, "instantiateViewControllerWithIdentifier:", CFSTR("ManualAuth")));
      v16 = self->_vcAuth;
      self->_vcAuth = v15;

      -[SVSBaseViewController setMainController:](self->_vcAuth, "setMainController:", self);
      vcNav = self->_vcNav;
      if (v5)
        sub_100117584(vcNav, self->_vcAuth, 0);
      else
        -[SVSCommonNavController pushViewController:animated:](vcNav, "pushViewController:animated:", self->_vcAuth, 0);
    }
  }
  else
  {
    if (a4 >= 1)
    {
      v9 = mach_absolute_time();
      self->_visualAuthNextTicks = SecondsToUpTicks(a4) + v9;
    }
    if (!self->_vcVisualAuth)
    {
      v10 = (UIViewController *)objc_claimAutoreleasedReturnValue(-[SVSCommonNavController visibleViewController](self->_vcNav, "visibleViewController"));
      vcVisualAuthParent = self->_vcVisualAuthParent;
      self->_vcVisualAuthParent = v10;

      v12 = (VPScannerViewController *)objc_claimAutoreleasedReturnValue(+[VPScannerViewController instantiateViewController](VPScannerViewController, "instantiateViewController"));
      vcVisualAuth = self->_vcVisualAuth;
      self->_vcVisualAuth = v12;

      if (self->_otherDeviceClassCode - 1 > 6)
        v14 = CFSTR("_IPHONE");
      else
        v14 = off_10017DF70[(self->_otherDeviceClassCode - 1)];
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("IOS_SETUP_SCANNER_TITLE"), "stringByAppendingString:", v14));
      v19 = sub_1001171A8(CFSTR("Localizable"), v18);
      v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
      -[VPScannerViewController setTitleMessage:](self->_vcVisualAuth, "setTitleMessage:", v20);

      v25[0] = _NSConcreteStackBlock;
      v25[1] = 3221225472;
      v25[2] = sub_1000E59E4;
      v25[3] = &unk_10017DD68;
      v25[4] = self;
      -[VPScannerViewController setEventHandler:](self->_vcVisualAuth, "setEventHandler:", v25);
      v24[0] = _NSConcreteStackBlock;
      v24[1] = 3221225472;
      v24[2] = sub_1000E59F0;
      v24[3] = &unk_10017E1C8;
      v24[4] = self;
      -[VPScannerViewController setScannedCodeHandler:](self->_vcVisualAuth, "setScannedCodeHandler:", v24);
      v21 = self->_vcNav;
      v22 = self->_vcVisualAuth;
      v23[0] = _NSConcreteStackBlock;
      v23[1] = 3221225472;
      v23[2] = sub_1000E59FC;
      v23[3] = &unk_10017E1F0;
      v23[4] = self;
      -[SVSCommonNavController presentViewController:animated:completion:](v21, "presentViewController:animated:completion:", v22, 0, v23);
    }
  }
}

- (void)_handleVisualAuthEvent:(int64_t)a3
{
  VPScannerViewController *v5;
  _BOOL8 v6;
  VPScannerViewController *v7;
  VPScannerViewController *vcVisualAuth;
  void *v9;
  UIViewController *vcVisualAuthParent;

  if (a3 == 2)
  {
    if (dword_1001A82C8 <= 30
      && (dword_1001A82C8 != -1 || _LogCategory_Initialize(&dword_1001A82C8, 30)))
    {
      LogPrintF(&dword_1001A82C8, "-[iOSSetupMainController _handleVisualAuthEvent:]", 30, "Visual Auth Event: pair manually\n");
    }
    -[VPScannerViewController dismissViewControllerAnimated:completion:](self->_vcVisualAuth, "dismissViewControllerAnimated:completion:", 1, 0);
    vcVisualAuth = self->_vcVisualAuth;
    self->_vcVisualAuth = 0;

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[UIViewController view](self->_vcVisualAuthParent, "view"));
    objc_msgSend(v9, "setHidden:", 0);

    vcVisualAuthParent = self->_vcVisualAuthParent;
    self->_vcVisualAuthParent = 0;

    -[SFDeviceSetupSessioniOS setPairFlags:](self->_setupSession, "setPairFlags:", 0);
    -[iOSSetupMainController showAuthUIWithFlags:throttleSeconds:animated:](self, "showAuthUIWithFlags:throttleSeconds:animated:", 0, 0xFFFFFFFFLL, 0);
  }
  else if (a3 == 1)
  {
    if (dword_1001A82C8 <= 30
      && (dword_1001A82C8 != -1 || _LogCategory_Initialize(&dword_1001A82C8, 30)))
    {
      LogPrintF(&dword_1001A82C8, "-[iOSSetupMainController _handleVisualAuthEvent:]", 30, "Visual Auth Event: cancel\n");
    }
    v5 = self->_vcVisualAuth;
    v6 = v5 == 0;
    -[VPScannerViewController dismissViewControllerAnimated:completion:](v5, "dismissViewControllerAnimated:completion:", 1, 0);
    v7 = self->_vcVisualAuth;
    self->_vcVisualAuth = 0;

    -[iOSSetupMainController dismiss:animated:](self, "dismiss:animated:", 5, v6);
  }
  else if (dword_1001A82C8 <= 30
         && (dword_1001A82C8 != -1 || _LogCategory_Initialize(&dword_1001A82C8, 30)))
  {
    LogPrintF(&dword_1001A82C8, "-[iOSSetupMainController _handleVisualAuthEvent:]", 30, "Visual Auth Event: %ld\n", a3);
  }
}

- (void)_handleVisualAuthScannedCode:(id)a3
{
  uint64_t v4;
  unint64_t visualAuthNextTicks;
  uint64_t v6;
  id v7;

  v7 = a3;
  if (dword_1001A82C8 <= 30 && (dword_1001A82C8 != -1 || _LogCategory_Initialize(&dword_1001A82C8, 30)))
    LogPrintF(&dword_1001A82C8, "-[iOSSetupMainController _handleVisualAuthScannedCode:]", 30, "Visual Auth scanned code: '%@'\n", v7);
  v4 = mach_absolute_time();
  visualAuthNextTicks = self->_visualAuthNextTicks;
  if (v4 >= visualAuthNextTicks)
  {
    if (self->_visualAuthTryingCode)
    {
      if (dword_1001A82C8 <= 30
        && (dword_1001A82C8 != -1 || _LogCategory_Initialize(&dword_1001A82C8, 30)))
      {
        LogPrintF(&dword_1001A82C8, "-[iOSSetupMainController _handleVisualAuthScannedCode:]", 30, "Visual Auth ignore scanned code while trying previous code\n");
      }
    }
    else
    {
      self->_visualAuthTryingCode = 1;
      -[iOSSetupMainController _tryPIN:](self, "_tryPIN:", v7);
    }
  }
  else if (dword_1001A82C8 <= 30)
  {
    v6 = v4;
    if (dword_1001A82C8 == -1)
    {
      if (!_LogCategory_Initialize(&dword_1001A82C8, 30))
        goto LABEL_18;
      visualAuthNextTicks = self->_visualAuthNextTicks;
    }
    UpTicksToSecondsF(visualAuthNextTicks - v6);
    LogPrintF(&dword_1001A82C8, "-[iOSSetupMainController _handleVisualAuthScannedCode:]", 30, "Visual Auth wait for next allowed time (%.2f seconds)\n");
  }
LABEL_18:

}

- (void)_tryPIN:(id)a3
{
  __CFString *v4;
  int v5;
  const __CFString *v6;
  __CFString *v7;

  v4 = (__CFString *)a3;
  v7 = v4;
  if (dword_1001A82C8 <= 30)
  {
    if (dword_1001A82C8 != -1 || (v4 = (__CFString *)_LogCategory_Initialize(&dword_1001A82C8, 30), (_DWORD)v4))
    {
      v5 = IsAppleInternalBuild(v4);
      v6 = CFSTR("*");
      if (v5)
        v6 = v7;
      LogPrintF(&dword_1001A82C8, "-[iOSSetupMainController _tryPIN:]", 30, "Try PIN '%@'\n", v6);
    }
  }
  -[SFDeviceSetupSessioniOS tryPIN:](self->_setupSession, "tryPIN:", v7);

}

- (void)showStartUI
{
  -[iOSSetupStartViewController setAutoStart:](self->_vcStart, "setAutoStart:", 1);
  sub_100117584(self->_vcNav, self->_vcStart, 1);
}

- (void)showBackupSyncUI:(unsigned int)a3 info:(id)a4
{
  uint64_t v4;
  iOSSetupBackupSyncViewController *vcBackupSync;
  iOSSetupBackupSyncViewController *v7;
  iOSSetupBackupSyncViewController *v8;
  id v9;

  v4 = *(_QWORD *)&a3;
  v9 = a4;
  if (dword_1001A82C8 <= 30 && (dword_1001A82C8 != -1 || _LogCategory_Initialize(&dword_1001A82C8, 30)))
    LogPrintF(&dword_1001A82C8, "-[iOSSetupMainController showBackupSyncUI:info:]", 30, "Show BackupSync UI\n");
  vcBackupSync = self->_vcBackupSync;
  if (!vcBackupSync)
  {
    v7 = (iOSSetupBackupSyncViewController *)objc_claimAutoreleasedReturnValue(-[UIStoryboard instantiateViewControllerWithIdentifier:](self->_storyboard, "instantiateViewControllerWithIdentifier:", CFSTR("BackupSync")));
    v8 = self->_vcBackupSync;
    self->_vcBackupSync = v7;

    -[SVSBaseViewController setMainController:](self->_vcBackupSync, "setMainController:", self);
    sub_100117584(self->_vcNav, self->_vcBackupSync, 1);
    vcBackupSync = self->_vcBackupSync;
  }
  -[iOSSetupBackupSyncViewController handleProgressEvent:info:](vcBackupSync, "handleProgressEvent:info:", v4, v9);

}

- (void)showDoneUI:(id)a3
{
  iOSSetupDoneViewController *vcDone;
  iOSSetupDoneViewController *v5;
  iOSSetupDoneViewController *v6;
  SFDeviceSetupSessioniOS *setupSession;
  id v8;

  v8 = a3;
  if (dword_1001A82C8 <= 30 && (dword_1001A82C8 != -1 || _LogCategory_Initialize(&dword_1001A82C8, 30)))
    LogPrintF(&dword_1001A82C8, "-[iOSSetupMainController showDoneUI:]", 30, "Show done UI: %{error}\n", v8);
  vcDone = self->_vcDone;
  if (!vcDone)
  {
    v5 = (iOSSetupDoneViewController *)objc_claimAutoreleasedReturnValue(-[UIStoryboard instantiateViewControllerWithIdentifier:](self->_storyboard, "instantiateViewControllerWithIdentifier:", CFSTR("Done")));
    v6 = self->_vcDone;
    self->_vcDone = v5;

    -[SVSBaseViewController setMainController:](self->_vcDone, "setMainController:", self);
    vcDone = self->_vcDone;
  }
  -[iOSSetupDoneViewController setError:](vcDone, "setError:", v8);
  -[SFDeviceSetupSessioniOS invalidate](self->_setupSession, "invalidate");
  setupSession = self->_setupSession;
  self->_setupSession = 0;

  sub_100117584(self->_vcNav, self->_vcDone, 1);
  -[iOSSetupMainController logUsageDone:](self, "logUsageDone:", NSErrorToOSStatus(v8));

}

- (void)showFinishUI
{
  iOSSetupFinishViewController *vcFinish;
  iOSSetupFinishViewController *v4;
  iOSSetupFinishViewController *v5;

  if (dword_1001A82C8 <= 30 && (dword_1001A82C8 != -1 || _LogCategory_Initialize(&dword_1001A82C8, 30)))
    LogPrintF(&dword_1001A82C8, "-[iOSSetupMainController showFinishUI]", 30, "Show finish UI\n");
  vcFinish = self->_vcFinish;
  if (!vcFinish)
  {
    v4 = (iOSSetupFinishViewController *)objc_claimAutoreleasedReturnValue(-[UIStoryboard instantiateViewControllerWithIdentifier:](self->_storyboard, "instantiateViewControllerWithIdentifier:", CFSTR("Finish")));
    v5 = self->_vcFinish;
    self->_vcFinish = v4;

    -[SVSBaseViewController setMainController:](self->_vcFinish, "setMainController:", self);
    vcFinish = self->_vcFinish;
  }
  sub_100117584(self->_vcNav, vcFinish, 1);
}

- (void)showWiFi
{
  id v3;

  if (dword_1001A82C8 <= 30 && (dword_1001A82C8 != -1 || _LogCategory_Initialize(&dword_1001A82C8, 30)))
    LogPrintF(&dword_1001A82C8, "-[iOSSetupMainController showWiFi]", 30, "Show WiFi\n");
  v3 = (id)objc_claimAutoreleasedReturnValue(-[UIStoryboard instantiateViewControllerWithIdentifier:](self->_storyboard, "instantiateViewControllerWithIdentifier:", CFSTR("WiFi")));
  objc_msgSend(v3, "setMainController:", self);
  sub_100117584(self->_vcNav, v3, 1);

}

- (unsigned)badPINCount
{
  return self->_badPINCount;
}

- (void)setBadPINCount:(unsigned int)a3
{
  self->_badPINCount = a3;
}

- (BOOL)blockHardwareButtons
{
  return self->_blockHardwareButtons;
}

- (void)setBlockHardwareButtons:(BOOL)a3
{
  self->_blockHardwareButtons = a3;
}

- (NSUUID)deviceIdentifier
{
  return self->_deviceIdentifier;
}

- (void)setDeviceIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 168);
}

- (NSString)myAppleID
{
  return self->_myAppleID;
}

- (void)setMyAppleID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 176);
}

- (unsigned)otherDeviceClassCode
{
  return self->_otherDeviceClassCode;
}

- (void)setOtherDeviceClassCode:(unsigned __int8)a3
{
  self->_otherDeviceClassCode = a3;
}

- (unsigned)otherDeviceModelCode
{
  return self->_otherDeviceModelCode;
}

- (void)setOtherDeviceModelCode:(unsigned __int8)a3
{
  self->_otherDeviceModelCode = a3;
}

- (unsigned)otherDeviceColorCode
{
  return self->_otherDeviceColorCode;
}

- (void)setOtherDeviceColorCode:(unsigned __int8)a3
{
  self->_otherDeviceColorCode = a3;
}

- (NSString)otherDeviceClassName
{
  return self->_otherDeviceClassName;
}

- (void)setOtherDeviceClassName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 184);
}

- (SFDeviceSetupSessioniOS)setupSession
{
  return self->_setupSession;
}

- (void)setSetupSession:(id)a3
{
  objc_storeStrong((id *)&self->_setupSession, a3);
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
  objc_storeStrong((id *)&self->_setupSession, 0);
  objc_storeStrong((id *)&self->_otherDeviceClassName, 0);
  objc_storeStrong((id *)&self->_myAppleID, 0);
  objc_storeStrong((id *)&self->_deviceIdentifier, 0);
  objc_storeStrong((id *)&self->_vcVisualAuthParent, 0);
  objc_storeStrong((id *)&self->_vcVisualAuth, 0);
  objc_storeStrong((id *)&self->_vcStart, 0);
  objc_storeStrong((id *)&self->_vcNav, 0);
  objc_storeStrong((id *)&self->_vcFinish, 0);
  objc_storeStrong((id *)&self->_vcDone, 0);
  objc_storeStrong((id *)&self->_vcBackupSync, 0);
  objc_storeStrong((id *)&self->_vcAuth, 0);
  objc_storeStrong((id *)&self->_storyboard, 0);
  objc_storeStrong((id *)&self->_migrationController, 0);
  objc_storeStrong((id *)&self->_fileTransferSession, 0);
}

+ (BOOL)_isSecureForRemoteViewService
{
  return 1;
}

@end
