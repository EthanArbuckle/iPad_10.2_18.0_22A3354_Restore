@implementation RepairStartViewController

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  objc_super v13;

  v3 = a3;
  if (dword_1001A8968 <= 30 && (dword_1001A8968 != -1 || _LogCategory_Initialize(&dword_1001A8968, 30)))
    LogPrintF(&dword_1001A8968, "-[RepairStartViewController viewWillAppear:]", 30, "Start ViewWillAppear\n");
  v13.receiver = self;
  v13.super_class = (Class)RepairStartViewController;
  -[SVSBaseViewController viewWillAppear:](&v13, "viewWillAppear:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(self->super._mainController, "_remoteViewControllerProxy"));
  objc_msgSend(v5, "setStatusBarHidden:withDuration:", 1, 0.0);

  v6 = objc_msgSend(objc_alloc((Class)UITapGestureRecognizer), "initWithTarget:action:", self, "handleTapOutsideView:");
  objc_msgSend(v6, "setDelegate:", self);
  objc_msgSend(v6, "setNumberOfTapsRequired:", 1);
  objc_msgSend(v6, "setCancelsTouchesInView:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[RepairStartViewController view](self, "view"));
  objc_msgSend(v7, "addGestureRecognizer:", v6);

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(self->super._mainController, "productImage"));
  objc_msgSend(*(id *)((char *)&self->_infoLabel + 1), "setImage:", v8);

  v9 = sub_1001171A8(CFSTR("Localizable"), CFSTR("REPAIR_INFO_HOMEPOD"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  objc_msgSend(*(id *)((char *)&self->_dismissButton + 1), "setText:", v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[SVSBaseViewController containerView](self, "containerView"));
  objc_msgSend(v11, "setSwipeDismissible:", 1);

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDistributedNotificationCenter defaultCenter](NSDistributedNotificationCenter, "defaultCenter"));
  objc_msgSend(v12, "addObserver:selector:name:object:suspensionBehavior:", self, "handleDeviceSetupNotification:", CFSTR("com.apple.sharing.DeviceSetup"), 0, 4);

}

- (void)viewDidDisappear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  objc_super v6;

  v3 = a3;
  if (dword_1001A8968 <= 30 && (dword_1001A8968 != -1 || _LogCategory_Initialize(&dword_1001A8968, 30)))
    LogPrintF(&dword_1001A8968, "-[RepairStartViewController viewDidDisappear:]", 30, "Start ViewDidDisappear\n");
  v6.receiver = self;
  v6.super_class = (Class)RepairStartViewController;
  -[RepairStartViewController viewDidDisappear:](&v6, "viewDidDisappear:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDistributedNotificationCenter defaultCenter](NSDistributedNotificationCenter, "defaultCenter"));
  objc_msgSend(v5, "removeObserver:name:object:", self, CFSTR("com.apple.sharing.DeviceSetup"), 0);

}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  BOOL v4;
  id v6;
  void *v7;
  void *v8;

  if (BYTE1(self->_startButton))
    return 0;
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "view"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "view"));

  v4 = v7 == v8;
  return v4;
}

- (void)handleDeviceSetupNotification:(id)a3
{
  id v4;
  void *v5;
  __CFString *v6;
  const __CFString *v7;
  void *v8;
  unsigned int v9;
  void *v10;
  CFTypeID TypeID;
  uint64_t TypedValue;
  void *v13;
  CFTypeID v14;
  uint64_t v15;
  void *v16;
  id v17;

  v4 = a3;
  if (!BYTE1(self->_startButton))
  {
    v17 = v4;
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "name"));
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "userInfo"));
    if (dword_1001A8968 <= 30
      && (dword_1001A8968 != -1 || _LogCategory_Initialize(&dword_1001A8968, 30)))
    {
      v7 = &stru_10017E3D8;
      if (v6)
        v7 = v6;
      LogPrintF(&dword_1001A8968, "-[RepairStartViewController handleDeviceSetupNotification:]", 30, "DeviceSetup notification '%@', %##@\n", v5, v7);
    }
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "name"));
    v9 = objc_msgSend(v8, "isEqual:", CFSTR("com.apple.sharing.DeviceSetup"));

    if (v9 && !CFDictionaryGetInt64(v6, CFSTR("needsSetup"), 0))
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(self->super._mainController, "userInfo"));
      TypeID = CFStringGetTypeID();
      TypedValue = CFDictionaryGetTypedValue(v10, CFSTR("deviceIdentifier"), TypeID, 0);
      v13 = (void *)objc_claimAutoreleasedReturnValue(TypedValue);

      v14 = CFStringGetTypeID();
      v15 = CFDictionaryGetTypedValue(v6, CFSTR("deviceID"), v14, 0);
      v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
      if (objc_msgSend(v16, "isEqual:", v13))
      {
        if (dword_1001A8968 <= 30
          && (dword_1001A8968 != -1 || _LogCategory_Initialize(&dword_1001A8968, 30)))
        {
          LogPrintF(&dword_1001A8968, "-[RepairStartViewController handleDeviceSetupNotification:]", 30, "Auto-dismissing on setup started\n");
        }
        objc_msgSend(self->super._mainController, "dismiss:", 16);
      }

    }
    v4 = v17;
  }

}

- (void)handleDismissButton:(id)a3
{
  id v4;

  v4 = a3;
  if (dword_1001A8968 <= 30 && (dword_1001A8968 != -1 || _LogCategory_Initialize(&dword_1001A8968, 30)))
    LogPrintF(&dword_1001A8968, "-[RepairStartViewController handleDismissButton:]", 30, "Dismiss button\n");
  objc_msgSend(self->super._mainController, "dismiss:", 5);

}

- (void)handleStartButton:(id)a3
{
  id v4;
  void *v5;
  unsigned int v6;
  id mainController;
  uint64_t v8;
  id v9;
  void *v10;
  id v11;

  v4 = a3;
  if (!BYTE1(self->_startButton))
  {
    v11 = v4;
    BYTE1(self->_startButton) = 1;
    if (dword_1001A8968 <= 30
      && (dword_1001A8968 != -1 || _LogCategory_Initialize(&dword_1001A8968, 30)))
    {
      LogPrintF(&dword_1001A8968, "-[RepairStartViewController handleStartButton:]", 30, "Start button\n");
    }
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[SVSBaseViewController containerView](self, "containerView"));
    objc_msgSend(v5, "setSwipeDismissible:", 0);

    v6 = objc_msgSend(self->super._mainController, "testMode");
    mainController = self->super._mainController;
    if (v6 == 3)
    {
      v8 = 301000;
    }
    else
    {
      if (objc_msgSend(mainController, "testMode") != 4)
      {
        v9 = objc_alloc_init((Class)SFDevice);
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(self->super._mainController, "deviceIdentifier"));
        objc_msgSend(v9, "setIdentifier:", v10);

        objc_msgSend(self->super._mainController, "_sessionStart:", v9);
        goto LABEL_12;
      }
      mainController = self->super._mainController;
      v8 = 301004;
    }
    objc_msgSend(mainController, "showDoneUI:", v8);
LABEL_12:
    v4 = v11;
  }

}

- (void)handleTapOutsideView:(id)a3
{
  id v4;

  v4 = a3;
  if (dword_1001A8968 <= 30 && (dword_1001A8968 != -1 || _LogCategory_Initialize(&dword_1001A8968, 30)))
    LogPrintF(&dword_1001A8968, "-[RepairStartViewController handleTapOutsideView:]", 30, "Dismissing on tap outside view\n");
  objc_msgSend(self->super._mainController, "dismiss:", 1);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)((char *)&self->_imageView + 1), 0);
  objc_storeStrong((id *)((char *)&self->_infoLabel + 1), 0);
  objc_storeStrong((id *)((char *)&self->_dismissButton + 1), 0);
  objc_storeStrong((id *)(&self->super._didReactivateContainerViewAfterLayingOut + 1), 0);
}

@end
