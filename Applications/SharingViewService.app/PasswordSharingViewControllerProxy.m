@implementation PasswordSharingViewControllerProxy

- (void)configureWithContext:(id)a3 completion:(id)a4
{
  void (**v6)(_QWORD);
  NSDictionary *v7;
  NSDictionary *userInfo;
  int v9;
  NSDictionary *v10;
  CFTypeID TypeID;
  uint64_t TypedValue;
  void *v13;
  NSDictionary *v14;
  CFTypeID v15;
  uint64_t v16;
  NSString *v17;
  int v18;
  uint64_t v19;
  NSString *v20;
  uint64_t v21;
  void *v22;
  const __CFString *v23;
  void *v24;
  void *v25;
  NSString *requestSSID;
  NSString *v27;
  uint64_t Int64;
  uint64_t v29;
  _BOOL4 v30;
  const char *v31;
  const char *v32;
  int v33;
  NSErrorUserInfoKey v34;
  const __CFString *v35;

  v6 = (void (**)(_QWORD))a4;
  v7 = (NSDictionary *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "userInfo"));
  userInfo = self->super._userInfo;
  self->super._userInfo = v7;

  if (dword_1001A8538 <= 30 && (dword_1001A8538 != -1 || _LogCategory_Initialize(&dword_1001A8538, 30)))
    LogPrintF(&dword_1001A8538, "-[PasswordSharingViewControllerProxy configureWithContext:completion:]", 30, "Main configuration: %@\n", self->super._userInfo);
  v9 = 1;
  self->_touchDelayActive = 1;
  v10 = self->super._userInfo;
  TypeID = CFStringGetTypeID();
  TypedValue = CFDictionaryGetTypedValue(v10, CFSTR("deviceIdentifier"), TypeID, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue(TypedValue);
  if ((objc_msgSend(v13, "isEqual:", CFSTR("00000000-0000-0000-0000-000000000001")) & 1) == 0)
  {
    if ((objc_msgSend(v13, "isEqual:", CFSTR("00000000-0000-0000-0000-000000000002")) & 1) != 0)
    {
      v9 = 2;
    }
    else if ((objc_msgSend(v13, "isEqual:", CFSTR("00000000-0000-0000-0000-000000000003")) & 1) != 0)
    {
      v9 = 3;
    }
    else if ((objc_msgSend(v13, "isEqual:", CFSTR("00000000-0000-0000-0000-000000000004")) & 1) != 0)
    {
      v9 = 4;
    }
    else if ((objc_msgSend(v13, "isEqual:", CFSTR("00000000-0000-0000-0000-000000000005")) & 1) != 0)
    {
      v9 = 5;
    }
    else if ((objc_msgSend(v13, "isEqual:", CFSTR("00000000-0000-0000-0000-000000000006")) & 1) != 0)
    {
      v9 = 6;
    }
    else
    {
      if (!objc_msgSend(v13, "isEqual:", CFSTR("00000000-0000-0000-0000-000000000007")))
        goto LABEL_19;
      v9 = 7;
    }
  }
  self->_testMode = v9;
LABEL_19:
  v33 = 0;
  v14 = self->super._userInfo;
  v15 = CFStringGetTypeID();
  v16 = CFDictionaryGetTypedValue(v14, CFSTR("nw"), v15, &v33);
  v17 = (NSString *)objc_claimAutoreleasedReturnValue(v16);

  v18 = v33;
  if (!v33 && v17 || dword_1001A8538 > 60)
    goto LABEL_30;
  if (dword_1001A8538 == -1)
  {
    if (!_LogCategory_Initialize(&dword_1001A8538, 60))
      goto LABEL_30;
    v18 = v33;
    if (v33)
      goto LABEL_24;
LABEL_29:
    LogPrintF(&dword_1001A8538, "-[PasswordSharingViewControllerProxy configureWithContext:completion:]", 60, "### No request SSID: %@\n", 0);
    goto LABEL_30;
  }
  if (!v33)
    goto LABEL_29;
LABEL_24:
  v19 = v18;
  v34 = NSLocalizedDescriptionKey;
  v20 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", DebugGetErrorString());
  v21 = objc_claimAutoreleasedReturnValue(v20);
  v22 = (void *)v21;
  v23 = CFSTR("?");
  if (v21)
    v23 = (const __CFString *)v21;
  v35 = v23;
  v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v35, &v34, 1));
  v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSOSStatusErrorDomain, v19, v24));
  LogPrintF(&dword_1001A8538, "-[PasswordSharingViewControllerProxy configureWithContext:completion:]", 60, "### No request SSID: %@\n", v25);

LABEL_30:
  requestSSID = self->_requestSSID;
  self->_requestSSID = v17;
  v27 = v17;

  Int64 = CFDictionaryGetInt64(self->super._userInfo, CFSTR("hs"), &v33);
  if (!v33 && Int64)
    self->_hotspot = 1;
  if ((self->_testMode & 0xFFFFFFFE) == 4)
    self->_hotspot = 1;
  v29 = CFPrefs_GetInt64(CFSTR("com.apple.Sharing"), CFSTR("pwsAutoGrant"), &v33);
  if (v33 || (v30 = v29 != 0, !IsAppleInternalBuild(v29)))
    v30 = 0;
  if (self->_autoGrant != v30)
  {
    if (dword_1001A8538 <= 40
      && (dword_1001A8538 != -1 || _LogCategory_Initialize(&dword_1001A8538, 40)))
    {
      v31 = "yes";
      if (v30)
        v32 = "no";
      else
        v32 = "yes";
      if (!v30)
        v31 = "no";
      LogPrintF(&dword_1001A8538, "-[PasswordSharingViewControllerProxy configureWithContext:completion:]", 40, "autoGrant enabled: %s -> %s\n", v32, v31);
    }
    self->_autoGrant = v30;
  }
  if (v6)
    v6[2](v6);

}

- (unint64_t)supportedInterfaceOrientations
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PasswordSharingViewControllerProxy view](self, "view"));
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

- (void)viewWillAppear:(BOOL)a3
{
  void *v3;
  _BOOL8 v4;
  dispatch_queue_t v6;
  dispatch_semaphore_t v7;
  uint64_t deviceIdentifier;
  NSDictionary *userInfo;
  CFTypeID TypeID;
  uint64_t TypedValue;
  NSString *v12;
  NSString *peerContactID;
  NSDictionary *v14;
  CFTypeID v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  NSString *v19;
  uint64_t v20;
  const __CFString *v21;
  void *v22;
  char v23;
  NSUUID *v24;
  id v25;
  NSString *v26;
  NSUUID *v27;
  NSObject *v28;
  dispatch_time_t v29;
  char v30;
  _QWORD v31[4];
  NSObject *v32;
  uint64_t *v33;
  uint64_t *v34;
  objc_super v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  char v39;
  unsigned int v40;
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  uint64_t (*v44)(uint64_t, uint64_t);
  void (*v45)(uint64_t);
  id v46;
  NSErrorUserInfoKey v47;
  const __CFString *v48;

  v4 = a3;
  v6 = dispatch_queue_create("clientQueue", 0);
  v7 = dispatch_semaphore_create(0);
  v41 = 0;
  v42 = &v41;
  v43 = 0x3032000000;
  v44 = sub_1000F0EA8;
  v45 = sub_1000F0EB8;
  v46 = 0;
  v40 = 0;
  v36 = 0;
  v37 = &v36;
  v38 = 0x2020000000;
  v39 = 0;
  v35.receiver = self;
  v35.super_class = (Class)PasswordSharingViewControllerProxy;
  -[PasswordSharingViewControllerProxy viewWillAppear:](&v35, "viewWillAppear:", v4);
  if (dword_1001A8538 <= 30 && (dword_1001A8538 != -1 || _LogCategory_Initialize(&dword_1001A8538, 30)))
    LogPrintF(&dword_1001A8538, "-[PasswordSharingViewControllerProxy viewWillAppear:]", 30, "View will appear");
  deviceIdentifier = 16;
  userInfo = self->super._userInfo;
  TypeID = CFStringGetTypeID();
  TypedValue = CFDictionaryGetTypedValue(userInfo, CFSTR("cid"), TypeID, &v40);
  v12 = (NSString *)objc_claimAutoreleasedReturnValue(TypedValue);
  peerContactID = self->_peerContactID;
  self->_peerContactID = v12;

  v14 = self->super._userInfo;
  v15 = CFStringGetTypeID();
  v16 = CFDictionaryGetTypedValue(v14, CFSTR("deviceIdentifier"), v15, &v40);
  v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
  v18 = v40;
  if (!v40)
  {
    v24 = (NSUUID *)objc_msgSend(objc_alloc((Class)NSUUID), "initWithUUIDString:", v17);
    deviceIdentifier = (uint64_t)self->_deviceIdentifier;
    self->_deviceIdentifier = v24;
    goto LABEL_14;
  }
  if (dword_1001A8538 <= 60)
  {
    if (dword_1001A8538 != -1)
      goto LABEL_8;
    if (!_LogCategory_Initialize(&dword_1001A8538, 60))
      goto LABEL_15;
    v18 = v40;
    if (v40)
    {
LABEL_8:
      v47 = NSLocalizedDescriptionKey;
      v19 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", DebugGetErrorString(v18, 0, 0));
      v20 = objc_claimAutoreleasedReturnValue(v19);
      deviceIdentifier = v20;
      v21 = CFSTR("?");
      if (v20)
        v21 = (const __CFString *)v20;
      v48 = v21;
      v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v48, &v47, 1));
      v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSOSStatusErrorDomain, (int)v18, v3));
      v23 = 0;
    }
    else
    {
      v22 = 0;
      v23 = 1;
    }
    LogPrintF(&dword_1001A8538, "-[PasswordSharingViewControllerProxy viewWillAppear:]", 60, "### Error acquiring device identifier: %@", v22);
    if ((v23 & 1) == 0)
    {

LABEL_14:
    }
  }
LABEL_15:
  v25 = objc_alloc_init((Class)SFClient);
  objc_msgSend(v25, "setDispatchQueue:", v6);
  v26 = self->_peerContactID;
  v27 = self->_deviceIdentifier;
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472;
  v31[2] = sub_1000F0EC0;
  v31[3] = &unk_10017D690;
  v33 = &v41;
  v34 = &v36;
  v28 = v7;
  v32 = v28;
  objc_msgSend(v25, "displayStringForContactIdentifier:deviceIdentifier:completion:", v26, v27, v31);

  v29 = dispatch_time(0, 10000000000);
  dispatch_semaphore_wait(v28, v29);
  objc_msgSend(v25, "invalidate");
  if (!v42[5]
    && dword_1001A8538 <= 60
    && (dword_1001A8538 != -1 || _LogCategory_Initialize(&dword_1001A8538, 60)))
  {
    LogPrintF(&dword_1001A8538, "-[PasswordSharingViewControllerProxy viewWillAppear:]", 60, "### No display name?\n");
  }
  objc_storeStrong((id *)&self->_peerDisplayName, (id)v42[5]);
  v30 = *((_BYTE *)v37 + 24);
  if (self->_testMode == 6)
    v30 = 1;
  self->_displayNameIsDevice = v30;
  -[PasswordSharingViewControllerProxy _deviceDiscoveryEnsureStarted](self, "_deviceDiscoveryEnsureStarted");
  _Block_object_dispose(&v36, 8);
  _Block_object_dispose(&v41, 8);

}

- (void)viewDidAppear:(BOOL)a3
{
  NSDate *v4;
  NSDate *visibleClock;
  UIStoryboard *v6;
  UIStoryboard *storyboard;
  SVSCommonNavController *v8;
  SVSCommonNavController *vcNav;
  void *v10;
  unint64_t v11;
  void *v12;
  PasswordSharingStartViewController *v13;
  PasswordSharingStartViewController *vcStart;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)PasswordSharingViewControllerProxy;
  -[PasswordSharingViewControllerProxy viewDidAppear:](&v15, "viewDidAppear:", a3);
  v4 = (NSDate *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  visibleClock = self->_visibleClock;
  self->_visibleClock = v4;

  if (dword_1001A8538 <= 30 && (dword_1001A8538 != -1 || _LogCategory_Initialize(&dword_1001A8538, 30)))
    LogPrintF(&dword_1001A8538, "-[PasswordSharingViewControllerProxy viewDidAppear:]", 30, "View did appear");
  v6 = (UIStoryboard *)objc_claimAutoreleasedReturnValue(+[UIStoryboard storyboardWithName:bundle:](UIStoryboard, "storyboardWithName:bundle:", CFSTR("PasswordSharing"), 0));
  storyboard = self->_storyboard;
  self->_storyboard = v6;

  v8 = (SVSCommonNavController *)objc_claimAutoreleasedReturnValue(-[UIStoryboard instantiateInitialViewController](self->_storyboard, "instantiateInitialViewController"));
  vcNav = self->_vcNav;
  self->_vcNav = v8;

  -[SVSCommonNavController setDelegate:](self->_vcNav, "setDelegate:", self);
  -[SVSCommonNavController setModalPresentationStyle:](self->_vcNav, "setModalPresentationStyle:", 4);
  -[SVSCommonNavController setTransitioningDelegate:](self->_vcNav, "setTransitioningDelegate:", self->_vcNav);
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
  v11 = (unint64_t)objc_msgSend(v10, "userInterfaceIdiom");

  if ((v11 & 0xFFFFFFFFFFFFFFFBLL) == 1)
    -[SVSCommonNavController setModalTransitionStyle:](self->_vcNav, "setModalTransitionStyle:", 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[SVSCommonNavController viewControllers](self->_vcNav, "viewControllers"));
  v13 = (PasswordSharingStartViewController *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "firstObject"));
  vcStart = self->_vcStart;
  self->_vcStart = v13;

  -[PasswordSharingStartViewController setDisplayNameIsDevice:](self->_vcStart, "setDisplayNameIsDevice:", self->_displayNameIsDevice);
  -[PasswordSharingStartViewController setPeerDisplayName:](self->_vcStart, "setPeerDisplayName:", self->_peerDisplayName);
  -[SVSBaseViewController setMainController:](self->_vcStart, "setMainController:", self);
  -[PasswordSharingStartViewController setUserInfo:](self->_vcStart, "setUserInfo:", self->super._userInfo);
  -[PasswordSharingViewControllerProxy presentViewController:animated:completion:](self, "presentViewController:animated:completion:", self->_vcNav, 1, 0);
  -[PasswordSharingViewControllerProxy activateTouchDelayTimer](self, "activateTouchDelayTimer");
}

- (void)viewDidDisappear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  objc_super v6;

  v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PasswordSharingViewControllerProxy _remoteViewControllerProxy](self, "_remoteViewControllerProxy"));
  objc_msgSend(v5, "setIdleTimerDisabled:forReason:", 0, CFSTR("com.apple.SharingViewService.WiFiPasswordSharing"));

  if (!self->_dismissed)
  {
    if (dword_1001A8538 <= 50
      && (dword_1001A8538 != -1 || _LogCategory_Initialize(&dword_1001A8538, 50)))
    {
      LogPrintF(&dword_1001A8538, "-[PasswordSharingViewControllerProxy viewDidDisappear:]", 50, "### Dismising from view did disappear.");
    }
    -[PasswordSharingViewControllerProxy dismiss:](self, "dismiss:", 21);
  }
  -[PasswordSharingViewControllerProxy ensureStoppedWithDismiss:](self, "ensureStoppedWithDismiss:", 0);
  v6.receiver = self;
  v6.super_class = (Class)PasswordSharingViewControllerProxy;
  -[SVSBaseMainController viewDidDisappear:](&v6, "viewDidDisappear:", v3);
}

- (void)activateTouchDelayTimer
{
  OS_dispatch_source *v3;
  OS_dispatch_source *touchDelayTimer;
  NSObject *v5;
  dispatch_time_t v6;
  NSObject *v7;
  const char *v8;
  _QWORD handler[5];

  if (dword_1001A8538 <= 30 && (dword_1001A8538 != -1 || _LogCategory_Initialize(&dword_1001A8538, 30)))
    LogPrintF(&dword_1001A8538, "-[PasswordSharingViewControllerProxy activateTouchDelayTimer]", 30, "Touch delay timer activate");
  if (self->_touchDelayActive)
  {
    if (self->_touchDelayTimer)
    {
      if (dword_1001A8538 <= 60
        && (dword_1001A8538 != -1 || _LogCategory_Initialize(&dword_1001A8538, 60)))
      {
        v8 = "Touch delay timer already active\n";
LABEL_19:
        LogPrintF(&dword_1001A8538, "-[PasswordSharingViewControllerProxy activateTouchDelayTimer]", 60, v8);
      }
    }
    else
    {
      v3 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)&_dispatch_main_q);
      touchDelayTimer = self->_touchDelayTimer;
      self->_touchDelayTimer = v3;

      v5 = self->_touchDelayTimer;
      if (v5)
      {
        v6 = dispatch_time(0, 1000000000);
        dispatch_source_set_timer(v5, v6, 0xFFFFFFFFFFFFFFFFLL, 0xEE6B280uLL);
        v7 = self->_touchDelayTimer;
        handler[0] = _NSConcreteStackBlock;
        handler[1] = 3221225472;
        handler[2] = sub_1000F0E28;
        handler[3] = &unk_10017E1F0;
        handler[4] = self;
        dispatch_source_set_event_handler(v7, handler);
        dispatch_resume((dispatch_object_t)self->_touchDelayTimer);
        return;
      }
      if (dword_1001A8538 <= 60
        && (dword_1001A8538 != -1 || _LogCategory_Initialize(&dword_1001A8538, 60)))
      {
        v8 = "Failed to create touch delay timer\n";
        goto LABEL_19;
      }
    }
  }
  else if (dword_1001A8538 <= 30
         && (dword_1001A8538 != -1 || _LogCategory_Initialize(&dword_1001A8538, 30)))
  {
    LogPrintF(&dword_1001A8538, "-[PasswordSharingViewControllerProxy activateTouchDelayTimer]", 30, "Touch delay already active\n");
  }
}

- (void)invalidateTouchDelayTimer
{
  OS_dispatch_source *touchDelayTimer;
  NSObject *v4;
  OS_dispatch_source *v5;
  const char *v6;
  uint64_t v7;

  if (dword_1001A8538 <= 30 && (dword_1001A8538 != -1 || _LogCategory_Initialize(&dword_1001A8538, 30)))
    LogPrintF(&dword_1001A8538, "-[PasswordSharingViewControllerProxy invalidateTouchDelayTimer]", 30, "Touch delay timer invalidate");
  touchDelayTimer = self->_touchDelayTimer;
  if (touchDelayTimer)
  {
    v4 = touchDelayTimer;
    dispatch_source_cancel(v4);
    v5 = self->_touchDelayTimer;
    self->_touchDelayTimer = 0;

    if (self->_touchDelayTimer
      && dword_1001A8538 <= 60
      && (dword_1001A8538 != -1 || _LogCategory_Initialize(&dword_1001A8538, 60)))
    {
      v6 = "Touch delay timer didn't invalidate?\n";
      v7 = 60;
      goto LABEL_14;
    }
  }
  else if (dword_1001A8538 <= 30
         && (dword_1001A8538 != -1 || _LogCategory_Initialize(&dword_1001A8538, 30)))
  {
    v6 = "No touch delay timer to invalidate\n";
    v7 = 30;
LABEL_14:
    LogPrintF(&dword_1001A8538, "-[PasswordSharingViewControllerProxy invalidateTouchDelayTimer]", v7, v6);
  }
}

- (void)dismiss:(int)a3
{
  uint64_t v3;
  id v5;
  double v6;
  double v7;
  double v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  _QWORD v16[3];
  _QWORD v17[3];

  if (!self->_dismissed)
  {
    v3 = *(_QWORD *)&a3;
    self->_dismissed = 1;
    if (dword_1001A8538 <= 30
      && (dword_1001A8538 != -1 || _LogCategory_Initialize(&dword_1001A8538, 30)))
    {
      LogPrintF(&dword_1001A8538, "-[PasswordSharingViewControllerProxy dismiss:]", 30, "Dismissing UI. Reason: %d", v3);
    }
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_1000F0E20;
    v14[3] = &unk_10017E1F0;
    v5 = (id)objc_claimAutoreleasedReturnValue(-[PasswordSharingViewControllerProxy _remoteViewControllerProxy](self, "_remoteViewControllerProxy"));
    v15 = v5;
    -[PasswordSharingViewControllerProxy dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", (_DWORD)v3 != 19, v14);
    -[NSDate timeIntervalSinceNow](self->_visibleClock, "timeIntervalSinceNow");
    v7 = v6;
    -[NSDate timeIntervalSinceNow](self->_visibleClock, "timeIntervalSinceNow");
    if (v7 < 0.0)
      v8 = -v8;
    v9 = (uint64_t)(v8 * 1000.0);
    v16[0] = CFSTR("actionType");
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v3));
    v17[0] = v10;
    v16[1] = CFSTR("shareState");
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_shareState));
    v17[1] = v11;
    v16[2] = CFSTR("durationMS");
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v9));
    v17[2] = v12;
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v17, v16, 3));
    SFMetricsLog(CFSTR("com.apple.sharing.PasswordSharingDismiss"), v13);

  }
}

- (void)ensureStoppedWithDismiss:(BOOL)a3
{
  -[PasswordSharingViewControllerProxy ensureStoppedWithDismiss:reason:](self, "ensureStoppedWithDismiss:reason:", a3, 8);
}

- (void)ensureStoppedWithDismiss:(BOOL)a3 reason:(int)a4
{
  uint64_t v4;
  _BOOL4 v5;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  SFDeviceDiscovery *deviceDiscovery;
  SFPasswordSharingSession *passwordSession;
  SVSCommonNavController *vcNav;
  PasswordSharingStartViewController *vcStart;
  PasswordSharingDoneViewController *vcDone;
  UIStoryboard *storyboard;
  _QWORD v19[2];
  _QWORD v20[2];

  v4 = *(_QWORD *)&a4;
  v5 = a3;
  if (dword_1001A8538 <= 50 && (dword_1001A8538 != -1 || _LogCategory_Initialize(&dword_1001A8538, 50)))
    LogPrintF(&dword_1001A8538, "-[PasswordSharingViewControllerProxy ensureStoppedWithDismiss:reason:]", 50, "Ensuring stopped.");
  v19[0] = CFSTR("scanRate");
  v7 = (uint64_t)-[SFDeviceDiscovery scanRate](self->_deviceDiscovery, "scanRate");
  if (v7 > 19)
  {
    if (v7 > 39)
    {
      if (v7 == 40)
      {
        v8 = "High";
        goto LABEL_22;
      }
      if (v7 == 50)
      {
        v8 = "Aggressive";
        goto LABEL_22;
      }
    }
    else
    {
      if (v7 == 20)
      {
        v8 = "Normal";
        goto LABEL_22;
      }
      if (v7 == 30)
      {
        v8 = "HighNormal";
        goto LABEL_22;
      }
    }
LABEL_21:
    v8 = "?";
  }
  else
  {
    v8 = "Invalid";
    switch(v7)
    {
      case 0:
        break;
      case 1:
        v8 = "BackgroundOld";
        break;
      case 2:
        v8 = "NormalOld";
        break;
      case 3:
        v8 = "HighOld";
        break;
      case 4:
        v8 = "AggressiveOld";
        break;
      case 10:
        v8 = "Background";
        break;
      default:
        goto LABEL_21;
    }
  }
LABEL_22:
  v9 = objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v8));
  v10 = (void *)v9;
  v11 = CFSTR("?");
  if (v9)
    v11 = (const __CFString *)v9;
  v19[1] = CFSTR("state");
  v20[0] = v11;
  v20[1] = CFSTR("Stop");
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v20, v19, 2));
  SFPowerLogEvent(CFSTR("WiFiPasswordSharing"), v12);

  -[SFDeviceDiscovery invalidate](self->_deviceDiscovery, "invalidate");
  deviceDiscovery = self->_deviceDiscovery;
  self->_deviceDiscovery = 0;

  -[SFPasswordSharingSession invalidate](self->_passwordSession, "invalidate");
  passwordSession = self->_passwordSession;
  self->_passwordSession = 0;

  -[PasswordSharingViewControllerProxy invalidateTouchDelayTimer](self, "invalidateTouchDelayTimer");
  vcNav = self->_vcNav;
  self->_vcNav = 0;

  -[SVSBaseViewController setMainController:](self->_vcStart, "setMainController:", 0);
  vcStart = self->_vcStart;
  self->_vcStart = 0;

  -[SVSBaseViewController setMainController:](self->_vcDone, "setMainController:", 0);
  vcDone = self->_vcDone;
  self->_vcDone = 0;

  storyboard = self->_storyboard;
  self->_storyboard = 0;

  if (v5)
    -[PasswordSharingViewControllerProxy dismiss:](self, "dismiss:", v4);
}

- (void)showDoneUI:(int)a3
{
  uint64_t v3;
  SFPasswordSharingSession *passwordSession;
  SFDeviceDiscovery *deviceDiscovery;
  PasswordSharingDoneViewController *v7;
  PasswordSharingDoneViewController *vcDone;
  double v9;
  double v10;
  double v11;
  double v12;
  BOOL v13;
  double v14;
  void *v15;
  uint64_t v16;
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
  int v27;
  _QWORD v28[4];
  _QWORD v29[4];
  _QWORD v30[6];
  _QWORD v31[6];

  v3 = *(_QWORD *)&a3;
  if (dword_1001A8538 <= 30 && (dword_1001A8538 != -1 || _LogCategory_Initialize(&dword_1001A8538, 30)))
    LogPrintF(&dword_1001A8538, "-[PasswordSharingViewControllerProxy showDoneUI:]", 30, "Show done UI: %#m\n", v3);
  -[SFPasswordSharingSession invalidate](self->_passwordSession, "invalidate");
  passwordSession = self->_passwordSession;
  self->_passwordSession = 0;

  -[SFDeviceDiscovery invalidate](self->_deviceDiscovery, "invalidate");
  deviceDiscovery = self->_deviceDiscovery;
  self->_deviceDiscovery = 0;

  if (!self->_vcDone)
  {
    v7 = (PasswordSharingDoneViewController *)objc_claimAutoreleasedReturnValue(-[UIStoryboard instantiateViewControllerWithIdentifier:](self->_storyboard, "instantiateViewControllerWithIdentifier:", CFSTR("doneUI")));
    vcDone = self->_vcDone;
    self->_vcDone = v7;

    -[SVSBaseViewController setMainController:](self->_vcDone, "setMainController:", self);
    -[PasswordSharingDoneViewController setUserInfo:](self->_vcDone, "setUserInfo:", self->super._userInfo);
  }
  -[NSDate timeIntervalSinceNow](self->_clock, "timeIntervalSinceNow");
  v10 = v9;
  -[NSDate timeIntervalSinceNow](self->_clock, "timeIntervalSinceNow");
  if (v10 >= 0.0)
    v12 = v11;
  else
    v12 = -v11;
  v27 = 0;
  if (CFPrefs_GetInt64(CFSTR("com.apple.Sharing"), CFSTR("pwsShowDuration"), &v27))
    v13 = v27 == 0;
  else
    v13 = 0;
  v14 = -1.0;
  if (v13)
    v14 = v12;
  -[PasswordSharingDoneViewController setDuration:](self->_vcDone, "setDuration:", v14);
  -[PasswordSharingDoneViewController setStatus:](self->_vcDone, "setStatus:", v3);
  sub_100117584(self->_vcNav, self->_vcDone, 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[PasswordSharingViewControllerProxy _remoteViewControllerProxy](self, "_remoteViewControllerProxy"));
  objc_msgSend(v15, "setIdleTimerDisabled:forReason:", 0, CFSTR("com.apple.SharingViewService.WiFiPasswordSharing"));

  v30[0] = CFSTR("_cat");
  v30[1] = CFSTR("_op");
  v31[0] = CFSTR("PasswordSharing");
  v31[1] = CFSTR("Done");
  v30[2] = CFSTR("durationMS");
  v16 = v3;
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (uint64_t)(v12 * 1000.0)));
  v31[2] = v17;
  v30[3] = CFSTR("errorCode");
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v16));
  v31[3] = v18;
  v30[4] = CFSTR("isHotspot");
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_hotspot));
  v31[4] = v19;
  v30[5] = CFSTR("missingAck");
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_missingAck));
  v31[5] = v20;
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v31, v30, 6));
  SFDashboardLogJSON(v21);

  v28[0] = CFSTR("durationMS");
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (uint64_t)(v12 * 1000.0)));
  v29[0] = v22;
  v28[1] = CFSTR("errorCode");
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v16));
  v29[1] = v23;
  v28[2] = CFSTR("isHotspot");
  v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_hotspot));
  v29[2] = v24;
  v28[3] = CFSTR("missingAck");
  v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_missingAck));
  v29[3] = v25;
  v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v29, v28, 4));
  SFMetricsLog(CFSTR("com.apple.sharing.PasswordSharingDone"), v26);

}

- (void)_deviceDiscoveryEnsureStarted
{
  SFDeviceDiscovery *v3;
  SFDeviceDiscovery *deviceDiscovery;
  SFDeviceDiscovery *v5;
  _QWORD v6[5];
  _QWORD v7[5];
  _QWORD v8[5];
  _QWORD v9[5];

  if (!self->_deviceDiscovery)
  {
    v3 = (SFDeviceDiscovery *)objc_alloc_init((Class)SFDeviceDiscovery);
    deviceDiscovery = self->_deviceDiscovery;
    self->_deviceDiscovery = v3;

    -[SFDeviceDiscovery setChangeFlags:](self->_deviceDiscovery, "setChangeFlags:", 0xFFFFFFFFLL);
    -[SFDeviceDiscovery setDiscoveryFlags:](self->_deviceDiscovery, "setDiscoveryFlags:", 16);
    -[SFDeviceDiscovery setScanRate:](self->_deviceDiscovery, "setScanRate:", 40);
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_1000F0B94;
    v9[3] = &unk_10017D8E8;
    v9[4] = self;
    -[SFDeviceDiscovery setDeviceFoundHandler:](self->_deviceDiscovery, "setDeviceFoundHandler:", v9);
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_1000F0BA0;
    v8[3] = &unk_10017D8E8;
    v8[4] = self;
    -[SFDeviceDiscovery setDeviceLostHandler:](self->_deviceDiscovery, "setDeviceLostHandler:", v8);
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_1000F0BAC;
    v7[3] = &unk_10017D910;
    v7[4] = self;
    -[SFDeviceDiscovery setDeviceChangedHandler:](self->_deviceDiscovery, "setDeviceChangedHandler:", v7);
    v5 = self->_deviceDiscovery;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_1000F0BB8;
    v6[3] = &unk_10017E070;
    v6[4] = self;
    -[SFDeviceDiscovery activateWithCompletion:](v5, "activateWithCompletion:", v6);
  }
}

- (void)_deviceFound:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  BOOL v7;
  id v8;
  unsigned int v9;
  id v10;

  v10 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "bleDevice"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "identifier"));
  v6 = v5;
  if (self->_deviceDiscovery)
    v7 = v5 == 0;
  else
    v7 = 1;
  if (!v7 && objc_msgSend(v5, "isEqual:", self->_deviceIdentifier))
  {
    v8 = objc_msgSend(objc_alloc((Class)NSUUID), "initWithUUIDString:", CFSTR("00000000-0000-0000-0000-000000000000"));
    v9 = objc_msgSend(v6, "isEqual:", v8);

    if (v9)
    {
      if (dword_1001A8538 <= 50
        && (dword_1001A8538 != -1 || _LogCategory_Initialize(&dword_1001A8538, 50)))
      {
        LogPrintF(&dword_1001A8538, "-[PasswordSharingViewControllerProxy _deviceFound:]", 50, "Not connecting to mock device.");
      }
    }
    else
    {
      if (dword_1001A8538 <= 10
        && (dword_1001A8538 != -1 || _LogCategory_Initialize(&dword_1001A8538, 10)))
      {
        LogPrintF(&dword_1001A8538, "-[PasswordSharingViewControllerProxy _deviceFound:]", 10, "Found %@\n", v4);
      }
      if (!objc_msgSend(v10, "needsSetup") || objc_msgSend(v10, "deviceActionType") != 8)
      {
        if (dword_1001A8538 <= 10
          && (dword_1001A8538 != -1 || _LogCategory_Initialize(&dword_1001A8538, 10)))
        {
          LogPrintF(&dword_1001A8538, "-[PasswordSharingViewControllerProxy _deviceFound:]", 10, "Device doesn't need WiFi password anymore\n");
        }
        -[PasswordSharingViewControllerProxy _handleDeviceNoLongerNeedsPassword](self, "_handleDeviceNoLongerNeedsPassword");
      }
    }
  }

}

- (void)_deviceLost:(id)a3
{
  id v4;
  void *v5;
  BOOL v6;
  id v7;

  v4 = a3;
  v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "bleDevice"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "identifier"));

  if (self->_deviceDiscovery)
    v6 = v5 == 0;
  else
    v6 = 1;
  if (!v6 && objc_msgSend(v5, "isEqual:", self->_deviceIdentifier))
  {
    if (dword_1001A8538 <= 10
      && (dword_1001A8538 != -1 || _LogCategory_Initialize(&dword_1001A8538, 10)))
    {
      LogPrintF(&dword_1001A8538, "-[PasswordSharingViewControllerProxy _deviceLost:]", 10, "Lost %@\n", v7);
    }
    -[PasswordSharingViewControllerProxy _handleDeviceNoLongerNeedsPassword](self, "_handleDeviceNoLongerNeedsPassword");
  }

}

- (void)_handleDeviceNoLongerNeedsPassword
{
  int shareState;
  uint64_t v4;

  shareState = self->_shareState;
  if (shareState != 1)
  {
    if (!shareState)
      -[PasswordSharingViewControllerProxy ensureStoppedWithDismiss:reason:](self, "ensureStoppedWithDismiss:reason:", 1, 22);
    return;
  }
  if (self->_passwordSent)
  {
    self->_missingAck = 1;
LABEL_8:
    if (dword_1001A8538 <= 30
      && (dword_1001A8538 != -1 || _LogCategory_Initialize(&dword_1001A8538, 30)))
    {
      LogPrintF(&dword_1001A8538, "-[PasswordSharingViewControllerProxy _handleDeviceNoLongerNeedsPassword]", 30, "### Peer no longer needs password before final ack received\n");
    }
    goto LABEL_12;
  }
  if (self->_missingAck)
    goto LABEL_8;
LABEL_12:
  if (self->_missingAck)
    v4 = 0;
  else
    v4 = 4294896130;
  -[PasswordSharingViewControllerProxy showDoneUI:](self, "showDoneUI:", v4);
}

- (void)_sessionStart
{
  id v3;
  NSDictionary *userInfo;
  CFTypeID TypeID;
  uint64_t TypedValue;
  void *v7;
  NSDictionary *v8;
  CFTypeID v9;
  uint64_t v10;
  void *v11;
  NSDictionary *v12;
  CFTypeID v13;
  uint64_t v14;
  void *v15;
  NSDate *v16;
  NSDate *clock;
  SFPasswordSharingSession *v18;
  SFPasswordSharingSession *passwordSession;
  NSDictionary *v20;
  CFTypeID v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  _QWORD v26[5];
  _QWORD v27[5];
  int v28;

  v3 = objc_alloc_init((Class)SFDevice);
  objc_msgSend(v3, "setContactIdentifier:", self->_peerContactID);
  objc_msgSend(v3, "setIdentifier:", self->_deviceIdentifier);
  objc_msgSend(v3, "setRequestSSID:", self->_requestSSID);
  if (dword_1001A8538 <= 30 && (dword_1001A8538 != -1 || _LogCategory_Initialize(&dword_1001A8538, 30)))
    LogPrintF(&dword_1001A8538, "-[PasswordSharingViewControllerProxy _sessionStart]", 30, "Start setup with %@\n", v3);
  v28 = 0;
  self->_shareState = 1;
  userInfo = self->super._userInfo;
  TypeID = CFStringGetTypeID();
  TypedValue = CFDictionaryGetTypedValue(userInfo, CFSTR("eh"), TypeID, &v28);
  v7 = (void *)objc_claimAutoreleasedReturnValue(TypedValue);
  if (v28
    && dword_1001A8538 <= 30
    && (dword_1001A8538 != -1 || _LogCategory_Initialize(&dword_1001A8538, 30)))
  {
    LogPrintF(&dword_1001A8538, "-[PasswordSharingViewControllerProxy _sessionStart]", 30, "No email hash?\n");
  }
  v8 = self->super._userInfo;
  v9 = CFStringGetTypeID();
  v10 = CFDictionaryGetTypedValue(v8, CFSTR("ph"), v9, &v28);
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  if (v28
    && dword_1001A8538 <= 30
    && (dword_1001A8538 != -1 || _LogCategory_Initialize(&dword_1001A8538, 30)))
  {
    LogPrintF(&dword_1001A8538, "-[PasswordSharingViewControllerProxy _sessionStart]", 30, "No phone hash?\n");
  }
  v12 = self->super._userInfo;
  v13 = CFStringGetTypeID();
  v14 = CFDictionaryGetTypedValue(v12, CFSTR("dn"), v13, &v28);
  v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  if (v28
    && dword_1001A8538 <= 30
    && (dword_1001A8538 != -1 || _LogCategory_Initialize(&dword_1001A8538, 30)))
  {
    LogPrintF(&dword_1001A8538, "-[PasswordSharingViewControllerProxy _sessionStart]", 30, "No device name?\n");
  }
  v16 = (NSDate *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  clock = self->_clock;
  self->_clock = v16;

  -[SFPasswordSharingSession invalidate](self->_passwordSession, "invalidate");
  v18 = (SFPasswordSharingSession *)objc_alloc_init((Class)SFPasswordSharingSession);
  passwordSession = self->_passwordSession;
  self->_passwordSession = v18;

  -[SFPasswordSharingSession setDeviceName:](self->_passwordSession, "setDeviceName:", v15);
  -[SFPasswordSharingSession setHashedEmail:](self->_passwordSession, "setHashedEmail:", v7);
  -[SFPasswordSharingSession setHashedPhone:](self->_passwordSession, "setHashedPhone:", v11);
  -[SFPasswordSharingSession setPeerDevice:](self->_passwordSession, "setPeerDevice:", v3);
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_1000F0AEC;
  v27[3] = &unk_10017E128;
  v27[4] = self;
  -[SFPasswordSharingSession setProgressHandler:](self->_passwordSession, "setProgressHandler:", v27);
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_1000F0AFC;
  v26[3] = &unk_10017E178;
  v26[4] = self;
  -[SFPasswordSharingSession setPromptForPINHandler:](self->_passwordSession, "setPromptForPINHandler:", v26);
  if (self->_hotspot)
  {
    v20 = self->super._userInfo;
    v21 = CFStringGetTypeID();
    v22 = CFDictionaryGetTypedValue(v20, CFSTR("psk"), v21, &v28);
    v23 = objc_claimAutoreleasedReturnValue(v22);
    v24 = (void *)v23;
    if (v28 || !v23)
    {
      if (dword_1001A8538 <= 60
        && (dword_1001A8538 != -1 || _LogCategory_Initialize(&dword_1001A8538, 60)))
      {
        LogPrintF(&dword_1001A8538, "-[PasswordSharingViewControllerProxy _sessionStart]", 60, "### No PSK for hotspot?");
      }
    }
    else
    {
      -[SFPasswordSharingSession setHotspotPSK:](self->_passwordSession, "setHotspotPSK:", v23);
    }

  }
  -[SFPasswordSharingSession activate](self->_passwordSession, "activate");
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[PasswordSharingViewControllerProxy _remoteViewControllerProxy](self, "_remoteViewControllerProxy"));
  objc_msgSend(v25, "setIdleTimerDisabled:forReason:", 1, CFSTR("com.apple.SharingViewService.WiFiPasswordSharing"));

}

- (void)_sessionHandleProgress:(unsigned int)a3 info:(id)a4
{
  __CFString *v6;
  __CFString *v7;
  const char *v8;
  int v9;
  const __CFString *v10;
  CFTypeID TypeID;
  uint64_t TypedValue;
  uint64_t v13;
  void *v14;
  int v15;
  __CFString *v16;
  __CFString *v17;

  v6 = (__CFString *)a4;
  v7 = v6;
  if (dword_1001A8538 > 10)
    goto LABEL_38;
  v16 = v6;
  if (dword_1001A8538 == -1)
  {
    v9 = _LogCategory_Initialize(&dword_1001A8538, 10);
    v7 = v16;
    if (!v9)
      goto LABEL_38;
  }
  if ((int)a3 <= 49)
  {
    if ((int)a3 > 29)
    {
      switch(a3)
      {
        case 0x1Eu:
          v8 = "Error";
          break;
        case 0x1Fu:
          v8 = "SessionStarted";
          break;
        case 0x20u:
          v8 = "SessionEnded";
          break;
        case 0x21u:
          v8 = "SessionSecured";
          break;
        case 0x28u:
          v8 = "PreAuthStart";
          break;
        default:
          goto LABEL_34;
      }
      goto LABEL_35;
    }
    switch(a3)
    {
      case 0u:
        v8 = "Invalid";
        goto LABEL_35;
      case 0xAu:
        v8 = "Start";
        goto LABEL_35;
      case 0x14u:
        v8 = "Final";
        goto LABEL_35;
    }
LABEL_34:
    v8 = "?";
    goto LABEL_35;
  }
  if ((int)a3 > 79)
  {
    switch(a3)
    {
      case 'P':
        v8 = "PasswordSending";
        break;
      case 'Q':
      case 'U':
        goto LABEL_34;
      case 'R':
        v8 = "PasswordSent";
        break;
      case 'S':
        v8 = "PasswordReceived";
        break;
      case 'T':
        v8 = "PasswordAccepted";
        break;
      case 'V':
        v8 = "PasswordDeclined";
        break;
      default:
        if (a3 != 100)
          goto LABEL_34;
        v8 = "Finished";
        break;
    }
    goto LABEL_35;
  }
  if (a3 == 50)
  {
    v8 = "PreAuthFinish";
    goto LABEL_35;
  }
  if (a3 == 60)
  {
    v8 = "SecurityStart";
    goto LABEL_35;
  }
  if (a3 != 70)
    goto LABEL_34;
  v8 = "SecurityFinished";
LABEL_35:
  v10 = &stru_10017E3D8;
  if (v7)
    v10 = v7;
  LogPrintF(&dword_1001A8538, "-[PasswordSharingViewControllerProxy _sessionHandleProgress:info:]", 10, "PasswordSession progress: %s, %@", v8, v10);
  v7 = v16;
LABEL_38:
  if (a3 == 82)
  {
    self->_passwordSent = 1;
  }
  else if (a3 == 20)
  {
    v17 = v7;
    TypeID = CFErrorGetTypeID();
    TypedValue = CFDictionaryGetTypedValue(v17, CFSTR("eo"), TypeID, 0);
    v13 = objc_claimAutoreleasedReturnValue(TypedValue);
    v14 = (void *)v13;
    if (v13)
      v15 = 3;
    else
      v15 = 4;
    self->_shareState = v15;
    -[PasswordSharingViewControllerProxy showDoneUI:](self, "showDoneUI:", NSErrorToOSStatus(v13));

    v7 = v17;
  }

}

- (void)showAuthUIWithFlags:(unsigned int)a3 throttleSeconds:(int)a4 animated:(BOOL)a5
{
  -[SFPasswordSharingSession tryPIN:](self->_passwordSession, "tryPIN:", CFSTR("9zfCcnJgD*sK&h7h7Xa1z*IU^2U%zKTg"), *(_QWORD *)&a4, a5);
}

- (void)handleButtonActions:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
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
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)v8), "events") & 0x10) != 0)
          -[PasswordSharingViewControllerProxy ensureStoppedWithDismiss:reason:](self, "ensureStoppedWithDismiss:reason:", 1, 4);
        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (BOOL)autoGrant
{
  return self->_autoGrant;
}

- (void)setAutoGrant:(BOOL)a3
{
  self->_autoGrant = a3;
}

- (NSDate)clock
{
  return self->_clock;
}

- (void)setClock:(id)a3
{
  objc_storeStrong((id *)&self->_clock, a3);
}

- (BOOL)hotspot
{
  return self->_hotspot;
}

- (void)setHotspot:(BOOL)a3
{
  self->_hotspot = a3;
}

- (NSString)peerDisplayName
{
  return self->_peerDisplayName;
}

- (void)setPeerDisplayName:(id)a3
{
  objc_storeStrong((id *)&self->_peerDisplayName, a3);
}

- (BOOL)displayNameIsDevice
{
  return self->_displayNameIsDevice;
}

- (void)setDisplayNameIsDevice:(BOOL)a3
{
  self->_displayNameIsDevice = a3;
}

- (NSString)requestSSID
{
  return self->_requestSSID;
}

- (void)setRequestSSID:(id)a3
{
  objc_storeStrong((id *)&self->_requestSSID, a3);
}

- (int)shareState
{
  return self->_shareState;
}

- (void)setShareState:(int)a3
{
  self->_shareState = a3;
}

- (int)testMode
{
  return self->_testMode;
}

- (void)setTestMode:(int)a3
{
  self->_testMode = a3;
}

- (BOOL)touchDelayActive
{
  return self->_touchDelayActive;
}

- (void)setTouchDelayActive:(BOOL)a3
{
  self->_touchDelayActive = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestSSID, 0);
  objc_storeStrong((id *)&self->_peerDisplayName, 0);
  objc_storeStrong((id *)&self->_clock, 0);
  objc_storeStrong((id *)&self->_visibleClock, 0);
  objc_storeStrong((id *)&self->_vcStart, 0);
  objc_storeStrong((id *)&self->_vcNav, 0);
  objc_storeStrong((id *)&self->_vcDone, 0);
  objc_storeStrong((id *)&self->_vcAuth, 0);
  objc_storeStrong((id *)&self->_touchDelayTimer, 0);
  objc_storeStrong((id *)&self->_storyboard, 0);
  objc_storeStrong((id *)&self->_peerContactID, 0);
  objc_storeStrong((id *)&self->_passwordSession, 0);
  objc_storeStrong((id *)&self->_deviceIdentifier, 0);
  objc_storeStrong((id *)&self->_deviceDiscovery, 0);
}

+ (BOOL)_isSecureForRemoteViewService
{
  return 1;
}

@end
