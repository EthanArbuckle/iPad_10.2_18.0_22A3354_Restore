@implementation TVLatencyColorimeterSetupStartViewController

- (void)viewDidLoad
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
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
  _QWORD v38[4];
  id v39;
  _QWORD v40[4];
  id v41;
  id location;
  objc_super v43;
  _QWORD v44[5];

  v43.receiver = self;
  v43.super_class = (Class)TVLatencyColorimeterSetupStartViewController;
  -[TVLatencyColorimeterSetupStartViewController viewDidLoad](&v43, "viewDidLoad");
  -[TVLatencyColorimeterSetupStartViewController setDismissalType:](self, "setDismissalType:", 3);
  location = 0;
  objc_initWeak(&location, self);
  v3 = sub_1001171A8(CFSTR("Localizable"), CFSTR("CONTINUE"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v40[0] = _NSConcreteStackBlock;
  v40[1] = 3221225472;
  v40[2] = sub_1000F926C;
  v40[3] = &unk_10017E008;
  objc_copyWeak(&v41, &location);
  v37 = (void *)objc_claimAutoreleasedReturnValue(+[PRXAction actionWithTitle:style:handler:](PRXAction, "actionWithTitle:style:handler:", v4, 0, v40));

  v5 = -[TVLatencyColorimeterSetupStartViewController addAction:](self, "addAction:", v37);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("NOT_NOW"), &stru_10017E3D8, CFSTR("Localizable")));
  v38[0] = _NSConcreteStackBlock;
  v38[1] = 3221225472;
  v38[2] = sub_1000F9298;
  v38[3] = &unk_10017E008;
  objc_copyWeak(&v39, &location);
  v36 = (void *)objc_claimAutoreleasedReturnValue(+[PRXAction actionWithTitle:style:handler:](PRXAction, "actionWithTitle:style:handler:", v7, 1, v38));

  v8 = -[TVLatencyColorimeterSetupStartViewController addAction:](self, "addAction:", v36);
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v10 = sub_100117218(v9, CFSTR("Localizable-TVLatencyColorimeter"), CFSTR("TLV_COLOR_TITLE"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  -[TVLatencyColorimeterSetupStartViewController setTitle:](self, "setTitle:", v11);

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v13 = sub_100117218(v12, CFSTR("Localizable-TVLatencyColorimeter"), CFSTR("TLV_COLOR_SUBTITLE"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  -[TVLatencyColorimeterSetupStartViewController setSubtitle:](self, "setSubtitle:", v14);

  v15 = objc_alloc((Class)UIImageView);
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageNamed:](UIImage, "imageNamed:", CFSTR("TV_Colorimeter")));
  v17 = objc_msgSend(v15, "initWithImage:", v16);

  objc_msgSend(v17, "setContentMode:", 1);
  objc_msgSend(v17, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[TVLatencyColorimeterSetupStartViewController contentView](self, "contentView"));
  objc_msgSend(v18, "addSubview:", v17);

  v19 = (void *)objc_claimAutoreleasedReturnValue(-[TVLatencyColorimeterSetupStartViewController contentView](self, "contentView"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "mainContentGuide"));

  v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "topAnchor"));
  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "topAnchor"));
  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "constraintEqualToAnchor:", v34));
  v44[0] = v33;
  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "bottomAnchor"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "bottomAnchor"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "constraintLessThanOrEqualToAnchor:", v31));
  v44[1] = v30;
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "leadingAnchor"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "leadingAnchor"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "constraintEqualToAnchor:", v21));
  v44[2] = v22;
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "trailingAnchor"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "trailingAnchor"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "constraintEqualToAnchor:", v24));
  v44[3] = v25;
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "heightAnchor"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "constraintEqualToConstant:", 150.0));
  v44[4] = v27;
  v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v44, 5));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v28);

  objc_destroyWeak(&v39);
  objc_destroyWeak(&v41);
  objc_destroyWeak(&location);
}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v3 = a3;
  if (dword_1001A8668 <= 30 && (dword_1001A8668 != -1 || _LogCategory_Initialize(&dword_1001A8668, 30)))
    LogPrintF(&dword_1001A8668, "-[TVLatencyColorimeterSetupStartViewController viewWillAppear:]", 30, "Start ViewWillAppear\n");
  v8.receiver = self;
  v8.super_class = (Class)TVLatencyColorimeterSetupStartViewController;
  -[TVLatencyColorimeterSetupStartViewController viewWillAppear:](&v8, "viewWillAppear:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVLatencyColorimeterSetupBaseViewController mainController](self, "mainController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "_remoteViewControllerProxy"));
  objc_msgSend(v6, "setStatusBarHidden:withDuration:", 1, 0.0);

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDistributedNotificationCenter defaultCenter](NSDistributedNotificationCenter, "defaultCenter"));
  objc_msgSend(v7, "addObserver:selector:name:object:suspensionBehavior:", self, "handleDeviceSetupNotification:", CFSTR("com.apple.sharing.DeviceSetup"), 0, 4);

}

- (void)viewDidDisappear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  objc_super v6;

  v3 = a3;
  if (dword_1001A8668 <= 30 && (dword_1001A8668 != -1 || _LogCategory_Initialize(&dword_1001A8668, 30)))
    LogPrintF(&dword_1001A8668, "-[TVLatencyColorimeterSetupStartViewController viewDidDisappear:]", 30, "Start ViewDidDisappear\n");
  v6.receiver = self;
  v6.super_class = (Class)TVLatencyColorimeterSetupStartViewController;
  -[TVLatencyColorimeterSetupStartViewController viewDidDisappear:](&v6, "viewDidDisappear:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDistributedNotificationCenter defaultCenter](NSDistributedNotificationCenter, "defaultCenter"));
  objc_msgSend(v5, "removeObserver:name:object:", self, CFSTR("com.apple.sharing.DeviceSetup"), 0);

}

- (void)handleDeviceSetupNotification:(id)a3
{
  void *v4;
  __CFString *v5;
  const __CFString *v6;
  void *v7;
  unsigned int v8;
  void *v9;
  void *v10;
  CFTypeID TypeID;
  uint64_t TypedValue;
  void *v13;
  CFTypeID v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;

  v18 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "name"));
  v5 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "userInfo"));
  if (dword_1001A8668 <= 30 && (dword_1001A8668 != -1 || _LogCategory_Initialize(&dword_1001A8668, 30)))
  {
    v6 = &stru_10017E3D8;
    if (v5)
      v6 = v5;
    LogPrintF(&dword_1001A8668, "-[TVLatencyColorimeterSetupStartViewController handleDeviceSetupNotification:]", 30, "DeviceSetup notification '%@', %##@\n", v4, v6);
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "name"));
  v8 = objc_msgSend(v7, "isEqual:", CFSTR("com.apple.sharing.DeviceSetup"));

  if (v8 && !CFDictionaryGetInt64(v5, CFSTR("needsSetup"), 0))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[TVLatencyColorimeterSetupBaseViewController mainController](self, "mainController"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "userInfo"));
    TypeID = CFStringGetTypeID();
    TypedValue = CFDictionaryGetTypedValue(v10, CFSTR("deviceIdentifier"), TypeID, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue(TypedValue);

    v14 = CFStringGetTypeID();
    v15 = CFDictionaryGetTypedValue(v5, CFSTR("deviceID"), v14, 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
    if (objc_msgSend(v16, "isEqual:", v13))
    {
      if (dword_1001A8668 <= 30
        && (dword_1001A8668 != -1 || _LogCategory_Initialize(&dword_1001A8668, 30)))
      {
        LogPrintF(&dword_1001A8668, "-[TVLatencyColorimeterSetupStartViewController handleDeviceSetupNotification:]", 30, "Auto-dismissing on setup started\n");
      }
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[TVLatencyColorimeterSetupBaseViewController mainController](self, "mainController"));
      objc_msgSend(v17, "dismiss:", 16);

    }
  }

}

- (void)_handleContinueButton
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  if (dword_1001A8668 <= 30 && (dword_1001A8668 != -1 || _LogCategory_Initialize(&dword_1001A8668, 30)))
    LogPrintF(&dword_1001A8668, "-[TVLatencyColorimeterSetupStartViewController _handleContinueButton]", 30, "Start button\n");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVLatencyColorimeterSetupBaseViewController mainController](self, "mainController"));
  v4 = objc_msgSend(v3, "testFlags");

  if (v4)
  {
    v11 = (id)objc_claimAutoreleasedReturnValue(-[TVLatencyColorimeterSetupBaseViewController mainController](self, "mainController"));
    objc_msgSend(v11, "showPreparingUI");
  }
  else
  {
    v11 = objc_alloc_init((Class)SFDevice);
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVLatencyColorimeterSetupBaseViewController mainController](self, "mainController"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "deviceIdentifier"));
    objc_msgSend(v11, "setIdentifier:", v6);

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVLatencyColorimeterSetupBaseViewController mainController](self, "mainController"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "userInfo"));
    objc_msgSend(v11, "setOsVersion:", CFDictionaryGetInt64Ranged(v8, CFSTR("osVersion"), 0, 255, 0));

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[TVLatencyColorimeterSetupBaseViewController mainController](self, "mainController"));
    objc_msgSend(v9, "_sessionStart:", v11);

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[TVLatencyColorimeterSetupBaseViewController mainController](self, "mainController"));
    objc_msgSend(v10, "showPreparingUI");

  }
}

- (void)_handleDismissButton
{
  id v3;

  if (dword_1001A8668 <= 30 && (dword_1001A8668 != -1 || _LogCategory_Initialize(&dword_1001A8668, 30)))
    LogPrintF(&dword_1001A8668, "-[TVLatencyColorimeterSetupStartViewController _handleDismissButton]", 30, "Dismiss button\n");
  v3 = (id)objc_claimAutoreleasedReturnValue(-[TVLatencyColorimeterSetupBaseViewController mainController](self, "mainController"));
  objc_msgSend(v3, "dismiss:", 5);

}

@end
