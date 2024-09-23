@implementation TVLatencySetupStartViewController

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v10;

  v3 = a3;
  if (dword_1001A8EB8 <= 30 && (dword_1001A8EB8 != -1 || _LogCategory_Initialize(&dword_1001A8EB8, 30)))
    LogPrintF(&dword_1001A8EB8, "-[TVLatencySetupStartViewController viewWillAppear:]", 30, "Start ViewWillAppear\n");
  v10.receiver = self;
  v10.super_class = (Class)TVLatencySetupStartViewController;
  -[TVLatencySetupBaseViewController viewWillAppear:](&v10, "viewWillAppear:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(self->super.super._mainController, "_remoteViewControllerProxy"));
  objc_msgSend(v5, "setStatusBarHidden:withDuration:", 1, 0.0);

  v6 = objc_msgSend(objc_alloc((Class)UITapGestureRecognizer), "initWithTarget:action:", self, "handleTapOutsideView:");
  objc_msgSend(v6, "setDelegate:", self);
  objc_msgSend(v6, "setNumberOfTapsRequired:", 1);
  objc_msgSend(v6, "setCancelsTouchesInView:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVLatencySetupStartViewController view](self, "view"));
  objc_msgSend(v7, "addGestureRecognizer:", v6);

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDistributedNotificationCenter defaultCenter](NSDistributedNotificationCenter, "defaultCenter"));
  objc_msgSend(v8, "addObserver:selector:name:object:suspensionBehavior:", self, "handleDeviceSetupNotification:", CFSTR("com.apple.sharing.DeviceSetup"), 0, 4);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[SVSBaseViewController containerView](self, "containerView"));
  objc_msgSend(v9, "setSwipeDismissible:", 1);

}

- (void)viewDidDisappear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  objc_super v6;

  v3 = a3;
  if (dword_1001A8EB8 <= 30 && (dword_1001A8EB8 != -1 || _LogCategory_Initialize(&dword_1001A8EB8, 30)))
    LogPrintF(&dword_1001A8EB8, "-[TVLatencySetupStartViewController viewDidDisappear:]", 30, "Start ViewDidDisappear\n");
  v6.receiver = self;
  v6.super_class = (Class)TVLatencySetupStartViewController;
  -[TVLatencySetupStartViewController viewDidDisappear:](&v6, "viewDidDisappear:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDistributedNotificationCenter defaultCenter](NSDistributedNotificationCenter, "defaultCenter"));
  objc_msgSend(v5, "removeObserver:name:object:", self, CFSTR("com.apple.sharing.DeviceSetup"), 0);

}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  BOOL v4;
  id v6;
  void *v7;
  void *v8;

  if (BYTE1(self->super._animationContainerView))
    return 0;
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "view"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "view"));

  v4 = v7 == v8;
  return v4;
}

- (void)handleDeviceSetupNotification:(id)a3
{
  void *v4;
  __CFString *v5;
  const __CFString *v6;
  void *v7;
  unsigned int v8;
  void *v9;
  CFTypeID TypeID;
  uint64_t TypedValue;
  void *v12;
  CFTypeID v13;
  uint64_t v14;
  void *v15;
  id v16;

  v16 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "name"));
  v5 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "userInfo"));
  if (dword_1001A8EB8 <= 30 && (dword_1001A8EB8 != -1 || _LogCategory_Initialize(&dword_1001A8EB8, 30)))
  {
    v6 = &stru_10017E3D8;
    if (v5)
      v6 = v5;
    LogPrintF(&dword_1001A8EB8, "-[TVLatencySetupStartViewController handleDeviceSetupNotification:]", 30, "DeviceSetup notification '%@', %##@\n", v4, v6);
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "name"));
  v8 = objc_msgSend(v7, "isEqual:", CFSTR("com.apple.sharing.DeviceSetup"));

  if (v8 && !CFDictionaryGetInt64(v5, CFSTR("needsSetup"), 0))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(self->super.super._mainController, "userInfo"));
    TypeID = CFStringGetTypeID();
    TypedValue = CFDictionaryGetTypedValue(v9, CFSTR("deviceIdentifier"), TypeID, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue(TypedValue);

    v13 = CFStringGetTypeID();
    v14 = CFDictionaryGetTypedValue(v5, CFSTR("deviceID"), v13, 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    if (objc_msgSend(v15, "isEqual:", v12))
    {
      if (dword_1001A8EB8 <= 30
        && (dword_1001A8EB8 != -1 || _LogCategory_Initialize(&dword_1001A8EB8, 30)))
      {
        LogPrintF(&dword_1001A8EB8, "-[TVLatencySetupStartViewController handleDeviceSetupNotification:]", 30, "Auto-dismissing on setup started\n");
      }
      objc_msgSend(self->super.super._mainController, "dismiss:", 16);
    }

  }
}

- (void)handleStartButton:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  if (dword_1001A8EB8 <= 30 && (dword_1001A8EB8 != -1 || _LogCategory_Initialize(&dword_1001A8EB8, 30)))
    LogPrintF(&dword_1001A8EB8, "-[TVLatencySetupStartViewController handleStartButton:]", 30, "Start button\n");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SVSBaseViewController containerView](self, "containerView"));
  objc_msgSend(v4, "setSwipeDismissible:", 0);

  if (objc_msgSend(self->super.super._mainController, "testFlags"))
  {
    objc_msgSend(self->super.super._mainController, "showProgressUI");
  }
  else
  {
    v5 = objc_alloc_init((Class)SFDevice);
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(self->super.super._mainController, "deviceIdentifier"));
    objc_msgSend(v5, "setIdentifier:", v6);

    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(self->super.super._mainController, "userInfo"));
    objc_msgSend(v5, "setOsVersion:", CFDictionaryGetInt64Ranged(v7, CFSTR("osVersion"), 0, 255, 0));

    objc_msgSend(self->super.super._mainController, "_sessionStart:", v5);
    objc_msgSend(self->super.super._mainController, "showProgressUI");

  }
}

- (void)handleDismissButton:(id)a3
{
  id v4;

  v4 = a3;
  if (dword_1001A8EB8 <= 30 && (dword_1001A8EB8 != -1 || _LogCategory_Initialize(&dword_1001A8EB8, 30)))
    LogPrintF(&dword_1001A8EB8, "-[TVLatencySetupStartViewController handleDismissButton:]", 30, "Dismiss button\n");
  objc_msgSend(self->super.super._mainController, "dismiss:", 5);

}

- (void)handleTapOutsideView:(id)a3
{
  id v4;

  v4 = a3;
  if (dword_1001A8EB8 <= 30 && (dword_1001A8EB8 != -1 || _LogCategory_Initialize(&dword_1001A8EB8, 30)))
    LogPrintF(&dword_1001A8EB8, "-[TVLatencySetupStartViewController handleTapOutsideView:]", 30, "Dismissing on tap outside view\n");
  objc_msgSend(self->super.super._mainController, "dismiss:", 1);

}

@end
