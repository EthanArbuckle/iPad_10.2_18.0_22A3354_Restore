@implementation RepairMainController

- (void)configureWithContext:(id)a3 completion:(id)a4
{
  NSDictionary *v6;
  NSDictionary *userInfo;
  NSDictionary *v8;
  CFTypeID TypeID;
  uint64_t TypedValue;
  void *v11;
  NSUUID *v12;
  NSUUID *deviceIdentifier;
  int v14;
  void (**v15)(void);
  unsigned int v16;
  void (**v17)(void);

  v17 = (void (**)(void))a4;
  v6 = (NSDictionary *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "userInfo"));
  userInfo = self->super._userInfo;
  self->super._userInfo = v6;

  if (dword_1001A8968 <= 30 && (dword_1001A8968 != -1 || _LogCategory_Initialize(&dword_1001A8968, 30)))
    LogPrintF(&dword_1001A8968, "-[RepairMainController configureWithContext:completion:]", 30, "Main configuration: %@\n", self->super._userInfo);
  self->_deviceColorCode = CFDictionaryGetInt64Ranged(self->super._userInfo, CFSTR("colorCode"), 0, 255, 0);
  v8 = self->super._userInfo;
  TypeID = CFStringGetTypeID();
  TypedValue = CFDictionaryGetTypedValue(v8, CFSTR("deviceIdentifier"), TypeID, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue(TypedValue);
  if (v11)
  {
    v12 = (NSUUID *)objc_msgSend(objc_alloc((Class)NSUUID), "initWithUUIDString:", v11);
    deviceIdentifier = self->_deviceIdentifier;
    self->_deviceIdentifier = v12;

  }
  if ((objc_msgSend(v11, "isEqual:", CFSTR("00000000-0000-0000-0000-000000000001")) & 1) != 0)
  {
    v14 = 1;
LABEL_13:
    v15 = v17;
LABEL_14:
    self->_testMode = v14;
    goto LABEL_15;
  }
  if ((objc_msgSend(v11, "isEqual:", CFSTR("00000000-0000-0000-0000-000000000002")) & 1) != 0)
  {
    v14 = 2;
    goto LABEL_13;
  }
  if ((objc_msgSend(v11, "isEqual:", CFSTR("00000000-0000-0000-0000-000000000003")) & 1) != 0)
  {
    v14 = 3;
    goto LABEL_13;
  }
  v16 = objc_msgSend(v11, "isEqual:", CFSTR("00000000-0000-0000-0000-000000000004"));
  v15 = v17;
  if (v16)
  {
    v14 = 4;
    goto LABEL_14;
  }
LABEL_15:
  if (v15)
    v17[2]();

}

- (unint64_t)supportedInterfaceOrientations
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RepairMainController view](self, "view"));
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
  RepairStartViewController *v12;
  RepairStartViewController *vcStart;
  objc_super v14;

  v3 = a3;
  if (dword_1001A8968 <= 30 && (dword_1001A8968 != -1 || _LogCategory_Initialize(&dword_1001A8968, 30)))
    LogPrintF(&dword_1001A8968, "-[RepairMainController viewDidAppear:]", 30, "Main ViewDidAppear\n");
  v14.receiver = self;
  v14.super_class = (Class)RepairMainController;
  -[RepairMainController viewDidAppear:](&v14, "viewDidAppear:", v3);
  self->_viewAppearedTicks = mach_absolute_time();
  v5 = (UIStoryboard *)objc_claimAutoreleasedReturnValue(+[UIStoryboard storyboardWithName:bundle:](UIStoryboard, "storyboardWithName:bundle:", CFSTR("Repair"), 0));
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
  v12 = (RepairStartViewController *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "firstObject"));
  vcStart = self->_vcStart;
  self->_vcStart = v12;

  -[SVSBaseViewController setMainController:](self->_vcStart, "setMainController:", self);
  -[RepairMainController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", self->_vcNav, 1, 0);
}

- (void)viewDidDisappear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  SFDeviceRepairSession *sfSession;
  UIStoryboard *storyboard;
  RepairDoneViewController *vcDone;
  SVSCommonNavController *vcNav;
  RepairProgressViewController *vcProgress;
  RepairStartViewController *vcStart;
  objc_super v12;

  v3 = a3;
  if (dword_1001A8968 <= 30 && (dword_1001A8968 != -1 || _LogCategory_Initialize(&dword_1001A8968, 30)))
    LogPrintF(&dword_1001A8968, "-[RepairMainController viewDidDisappear:]", 30, "Main ViewDidDisappear\n");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RepairMainController _remoteViewControllerProxy](self, "_remoteViewControllerProxy"));
  objc_msgSend(v5, "setIdleTimerDisabled:forReason:", 0, CFSTR("com.apple.SharingViewService.Repair"));

  if (!self->_dismissed)
  {
    if (dword_1001A8968 <= 30
      && (dword_1001A8968 != -1 || _LogCategory_Initialize(&dword_1001A8968, 30)))
    {
      LogPrintF(&dword_1001A8968, "-[RepairMainController viewDidDisappear:]", 30, "Main disappeared without dismiss (device locked?)...dismissing UI\n");
    }
    -[RepairMainController dismiss:](self, "dismiss:", 21);
  }
  -[SFDeviceRepairSession invalidate](self->_sfSession, "invalidate");
  sfSession = self->_sfSession;
  self->_sfSession = 0;

  storyboard = self->_storyboard;
  self->_storyboard = 0;

  -[SVSBaseViewController setMainController:](self->_vcDone, "setMainController:", 0);
  vcDone = self->_vcDone;
  self->_vcDone = 0;

  vcNav = self->_vcNav;
  self->_vcNav = 0;

  -[SVSBaseViewController setMainController:](self->_vcProgress, "setMainController:", 0);
  vcProgress = self->_vcProgress;
  self->_vcProgress = 0;

  -[SVSBaseViewController setMainController:](self->_vcStart, "setMainController:", 0);
  vcStart = self->_vcStart;
  self->_vcStart = 0;

  v12.receiver = self;
  v12.super_class = (Class)RepairMainController;
  -[SVSBaseMainController viewDidDisappear:](&v12, "viewDidDisappear:", v3);
}

- (void)dismiss:(int)a3
{
  -[RepairMainController dismiss:completion:](self, "dismiss:completion:", *(_QWORD *)&a3, 0);
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
    -[RepairMainController logUsageStart:](self, "logUsageStart:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[RepairMainController _remoteViewControllerProxy](self, "_remoteViewControllerProxy"));
    v8 = v7;
    vcNav = self->_vcNav;
    if (vcNav)
    {
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_100106AF4;
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
          if (dword_1001A8968 <= 30
            && (dword_1001A8968 != -1 || _LogCategory_Initialize(&dword_1001A8968, 30)))
          {
            LogPrintF(&dword_1001A8968, "-[RepairMainController handleButtonActions:]", 30, "Home button\n");
          }
          -[RepairMainController dismiss:](self, "dismiss:", 4);
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
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
    v18[0] = CFSTR("Repair");
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

    if (dword_1001A8968 <= 50
      && (dword_1001A8968 != -1 || _LogCategory_Initialize(&dword_1001A8968, 50)))
    {
      LogPrintF(&dword_1001A8968, "-[RepairMainController logUsageStart:]", 50, "Repair: Start, ID %@, RSSI %ld, action %d, userMs %llu", v9, Int64Ranged, v3, v12);
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
  _QWORD v17[6];
  _QWORD v18[6];

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
    v17[0] = CFSTR("_cat");
    v17[1] = CFSTR("_op");
    v18[0] = CFSTR("Repair");
    v18[1] = CFSTR("Done");
    v18[2] = v9;
    v17[2] = CFSTR("sid");
    v17[3] = CFSTR("rssi");
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", Int64Ranged));
    v18[3] = v13;
    v17[4] = CFSTR("error");
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v3));
    v18[4] = v14;
    v17[5] = CFSTR("ms");
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", v12));
    v18[5] = v15;
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v18, v17, 6));
    SFDashboardLogJSON(v16);

    if (dword_1001A8968 <= 50
      && (dword_1001A8968 != -1 || _LogCategory_Initialize(&dword_1001A8968, 50)))
    {
      LogPrintF(&dword_1001A8968, "-[RepairMainController logUsageDone:]", 50, "Repair: Done, ID %@, RSSI %ld, error %d, totalMs %llu", v9, Int64Ranged, v3, v12);
    }

  }
}

- (void)_sessionStart:(id)a3
{
  id v4;
  dispatch_time_t v5;
  SFDeviceRepairSession *v6;
  SFDeviceRepairSession *sfSession;
  void *v8;
  _QWORD v9[5];
  _QWORD block[5];

  v4 = a3;
  if (dword_1001A8968 <= 30 && (dword_1001A8968 != -1 || _LogCategory_Initialize(&dword_1001A8968, 30)))
    LogPrintF(&dword_1001A8968, "-[RepairMainController _sessionStart:]", 30, "Start setup with %@\n", v4);
  -[RepairMainController logUsageStart:](self, "logUsageStart:", 9);
  -[RepairMainController showProgressUI](self, "showProgressUI");
  if (self->_testMode)
  {
    v5 = dispatch_time(0, 3000000000);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100106AB0;
    block[3] = &unk_10017E1F0;
    block[4] = self;
    dispatch_after(v5, (dispatch_queue_t)&_dispatch_main_q, block);
  }
  else
  {
    -[SFDeviceRepairSession invalidate](self->_sfSession, "invalidate");
    v6 = (SFDeviceRepairSession *)objc_alloc_init((Class)SFDeviceRepairSession);
    sfSession = self->_sfSession;
    self->_sfSession = v6;

    -[SFDeviceRepairSession setPeerDevice:](self->_sfSession, "setPeerDevice:", v4);
    -[SFDeviceRepairSession setPresentingViewController:](self->_sfSession, "setPresentingViewController:", self->_vcStart);
    -[SFDeviceRepairSession setRepairFlags:](self->_sfSession, "setRepairFlags:", CFDictionaryGetInt64Ranged(self->super._userInfo, CFSTR("repairFlags"), 0, 0xFFFFFFFFLL, 0));
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100106AE4;
    v9[3] = &unk_10017E128;
    v9[4] = self;
    -[SFDeviceRepairSession setProgressHandler:](self->_sfSession, "setProgressHandler:", v9);
    -[SFDeviceRepairSession activate](self->_sfSession, "activate");
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[RepairMainController _remoteViewControllerProxy](self, "_remoteViewControllerProxy"));
    objc_msgSend(v8, "setIdleTimerDisabled:forReason:", 1, CFSTR("com.apple.SharingViewService.Repair"));

  }
}

- (void)_sessionHandleProgress:(unsigned int)a3 info:(id)a4
{
  uint64_t v4;
  id v6;
  CFTypeID TypeID;
  uint64_t TypedValue;
  void *v9;
  id v10;

  v4 = *(_QWORD *)&a3;
  v6 = a4;
  if ((int)v4 > 199)
  {
    if ((v4 - 200) <= 0x1E && ((1 << (v4 + 56)) & 0x40100001) != 0)
    {
      v10 = v6;
      -[RepairProgressViewController handleProgressEvent:](self->_vcProgress, "handleProgressEvent:", v4);
LABEL_23:
      v6 = v10;
    }
  }
  else
  {
    switch((_DWORD)v4)
    {
      case 0x14:
        v10 = v6;
        if (dword_1001A8968 <= 30
          && (dword_1001A8968 != -1 || _LogCategory_Initialize(&dword_1001A8968, 30)))
        {
          LogPrintF(&dword_1001A8968, "-[RepairMainController _sessionHandleProgress:info:]", 30, "Repair Finalized\n");
        }
        -[RepairMainController showDoneUI:error:final:](self, "showDoneUI:error:final:", 0, 0, 1);
        goto LABEL_23;
      case 0x1E:
        v10 = v6;
        TypeID = CFErrorGetTypeID();
        TypedValue = CFDictionaryGetTypedValue(v10, CFSTR("eo"), TypeID, 0);
        v9 = (void *)objc_claimAutoreleasedReturnValue(TypedValue);
        if (dword_1001A8968 <= 60
          && (dword_1001A8968 != -1 || _LogCategory_Initialize(&dword_1001A8968, 60)))
        {
          LogPrintF(&dword_1001A8968, "-[RepairMainController _sessionHandleProgress:info:]", 60, "### Setup failed: %{error}\n", v9);
        }
        -[RepairMainController showDoneUI:error:final:](self, "showDoneUI:error:final:", NSErrorToOSStatus(v9), v9, 1);

        goto LABEL_23;
      case 0x60:
        v10 = v6;
        if (dword_1001A8968 <= 30
          && (dword_1001A8968 != -1 || _LogCategory_Initialize(&dword_1001A8968, 30)))
        {
          LogPrintF(&dword_1001A8968, "-[RepairMainController _sessionHandleProgress:info:]", 30, "Repair completed\n");
        }
        -[RepairMainController showDoneUI:](self, "showDoneUI:", 0);
        goto LABEL_23;
    }
  }

}

- (void)showDoneUI:(int)a3
{
  -[RepairMainController showDoneUI:error:final:](self, "showDoneUI:error:final:", *(_QWORD *)&a3, 0, 0);
}

- (void)showDoneUI:(int)a3 error:(id)a4 final:(BOOL)a5
{
  _BOOL4 v5;
  uint64_t v6;
  const __CFString *v8;
  RepairDoneViewController *v9;
  RepairDoneViewController *vcDone;
  SFDeviceRepairSession *sfSession;
  void *v12;
  id v13;

  v5 = a5;
  v6 = *(_QWORD *)&a3;
  v13 = a4;
  if (self->_vcDone)
  {
    if (!v5)
      goto LABEL_17;
    goto LABEL_12;
  }
  if (dword_1001A8968 <= 30 && (dword_1001A8968 != -1 || _LogCategory_Initialize(&dword_1001A8968, 30)))
    LogPrintF(&dword_1001A8968, "-[RepairMainController showDoneUI:error:final:]", 30, "ShowDoneUI: %#m\n", v6);
  if ((v6 & 0xFFFFFFFB) == 0x497C8)
    v8 = CFSTR("WiFiError");
  else
    v8 = CFSTR("Done");
  v9 = (RepairDoneViewController *)objc_claimAutoreleasedReturnValue(-[UIStoryboard instantiateViewControllerWithIdentifier:](self->_storyboard, "instantiateViewControllerWithIdentifier:", v8));
  vcDone = self->_vcDone;
  self->_vcDone = v9;

  -[SVSBaseViewController setMainController:](self->_vcDone, "setMainController:", self);
  -[RepairDoneViewController setStatus:](self->_vcDone, "setStatus:", v6);
  -[RepairDoneViewController setError:](self->_vcDone, "setError:", v13);
  sub_100117584(self->_vcNav, self->_vcDone, 0);
  -[RepairMainController logUsageDone:](self, "logUsageDone:", v6);
  if (v5)
  {
LABEL_12:
    if (dword_1001A8968 <= 30
      && (dword_1001A8968 != -1 || _LogCategory_Initialize(&dword_1001A8968, 30)))
    {
      LogPrintF(&dword_1001A8968, "-[RepairMainController showDoneUI:error:final:]", 30, "Invalidating session\n");
    }
    -[SFDeviceRepairSession invalidate](self->_sfSession, "invalidate");
    sfSession = self->_sfSession;
    self->_sfSession = 0;

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[RepairMainController _remoteViewControllerProxy](self, "_remoteViewControllerProxy"));
    objc_msgSend(v12, "setIdleTimerDisabled:forReason:", 0, CFSTR("com.apple.SharingViewService.Repair"));

  }
LABEL_17:

}

- (void)showProgressUI
{
  RepairProgressViewController *vcProgress;
  RepairProgressViewController *v4;
  RepairProgressViewController *v5;

  if (dword_1001A8968 <= 30 && (dword_1001A8968 != -1 || _LogCategory_Initialize(&dword_1001A8968, 30)))
    LogPrintF(&dword_1001A8968, "-[RepairMainController showProgressUI]", 30, "ShowProgressUI\n");
  vcProgress = self->_vcProgress;
  if (!vcProgress)
  {
    v4 = (RepairProgressViewController *)objc_claimAutoreleasedReturnValue(-[UIStoryboard instantiateViewControllerWithIdentifier:](self->_storyboard, "instantiateViewControllerWithIdentifier:", CFSTR("Progress")));
    v5 = self->_vcProgress;
    self->_vcProgress = v4;

    -[SVSBaseViewController setMainController:](self->_vcProgress, "setMainController:", self);
    vcProgress = self->_vcProgress;
  }
  sub_100117584(self->_vcNav, vcProgress, 0);
}

- (id)productImage
{
  UIImage *productImage;
  UIImage *v4;
  UIImage *v5;
  id v7;
  id v8;
  id v9;

  productImage = self->_productImage;
  if (!productImage)
  {
    v8 = 0;
    v9 = 0;
    v7 = 0;
    sub_100116514(1u, -[RepairMainController deviceColorCode](self, "deviceColorCode"), 13, &v9, 0, &v8, &v7);
    v4 = (UIImage *)objc_claimAutoreleasedReturnValue(+[UIImage imageNamed:inBundle:](UIImage, "imageNamed:inBundle:", v9, v7));
    v5 = self->_productImage;
    self->_productImage = v4;

    productImage = self->_productImage;
  }
  return productImage;
}

- (unsigned)deviceColorCode
{
  return self->_deviceColorCode;
}

- (void)setDeviceColorCode:(unsigned __int8)a3
{
  self->_deviceColorCode = a3;
}

- (NSUUID)deviceIdentifier
{
  return self->_deviceIdentifier;
}

- (void)setDeviceIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
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
  objc_storeStrong((id *)&self->_deviceIdentifier, 0);
  objc_storeStrong((id *)&self->_productImage, 0);
  objc_storeStrong((id *)&self->_vcStart, 0);
  objc_storeStrong((id *)&self->_vcProgress, 0);
  objc_storeStrong((id *)&self->_vcNav, 0);
  objc_storeStrong((id *)&self->_vcDone, 0);
  objc_storeStrong((id *)&self->_storyboard, 0);
  objc_storeStrong((id *)&self->_sfSession, 0);
}

@end
