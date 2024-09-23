@implementation iOSSetupStartViewController

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  id v6;
  void *v7;
  unsigned int v8;
  const __CFString *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  unsigned __int8 v14;
  unsigned int v15;
  __CFString **v16;
  const __CFString *v17;
  void *v18;
  unsigned int v19;
  void *v20;
  void *v21;
  void *v22;
  const __CFString *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  uint64_t v28;
  id v29;
  unsigned int v30;
  const __CFString *v31;
  id v32;
  uint64_t v33;
  unsigned int v34;
  const __CFString *v35;
  void *v36;
  id v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  id v46;
  __CFString *v47;
  id v48;
  id v49;
  void *v50;
  void *v51;
  id v52;
  id v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  id v60;
  void *v61;
  void *v62;
  void *v63;
  id v64;
  objc_super v65;
  NSAttributedStringKey v66;
  void *v67;
  NSAttributedStringKey v68;
  void *v69;

  v3 = a3;
  if (dword_1001A82C8 <= 30 && (dword_1001A82C8 != -1 || _LogCategory_Initialize(&dword_1001A82C8, 30)))
    LogPrintF(&dword_1001A82C8, "-[iOSSetupStartViewController viewWillAppear:]", 30, "Start ViewWillAppear\n");
  v65.receiver = self;
  v65.super_class = (Class)iOSSetupStartViewController;
  -[SVSBaseViewController viewWillAppear:](&v65, "viewWillAppear:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(self->super.super._mainController, "_remoteViewControllerProxy"));
  objc_msgSend(v5, "setStatusBarHidden:withDuration:", 1, 0.0);

  v6 = objc_msgSend(objc_alloc((Class)UITapGestureRecognizer), "initWithTarget:action:", self, "handleTapOutsideView:");
  objc_msgSend(v6, "setDelegate:", self);
  objc_msgSend(v6, "setNumberOfTapsRequired:", 1);
  objc_msgSend(v6, "setCancelsTouchesInView:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[iOSSetupStartViewController view](self, "view"));
  objc_msgSend(v7, "addGestureRecognizer:", v6);

  v8 = objc_msgSend(self->super.super._mainController, "otherDeviceClassCode") - 1;
  if (v8 > 6)
    v9 = CFSTR("_IPHONE");
  else
    v9 = off_10017DF70[v8];
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("IOS_SETUP_START_TITLE"), "stringByAppendingString:", v9));
  v11 = sub_1001171A8(CFSTR("Localizable"), v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  objc_msgSend(*(id *)((char *)&self->_dismissButton + 1), "setText:", v12);

  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)((char *)&self->_progressLabel + 1), "titleLabel"));
  objc_msgSend(v13, "setAdjustsFontSizeToFitWidth:", 1);

  v14 = objc_msgSend(self->super.super._mainController, "otherDeviceClassCode");
  v15 = objc_msgSend(self->super.super._mainController, "otherDeviceModelCode") - 1;
  if (v15 < 3)
  {
    v16 = off_10017DFA8;
LABEL_12:
    v17 = v16[v15];
    goto LABEL_14;
  }
  LOBYTE(v15) = v14 - 2;
  if ((v14 - 2) < 4u)
  {
    v16 = off_10017DFC0;
    goto LABEL_12;
  }
  v17 = CFSTR("ProxiPhoneGeneric.png");
LABEL_14:
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageNamed:](UIImage, "imageNamed:", v17));
  if (v18)
    objc_msgSend(*(id *)((char *)&self->_infoLabel + 1), "setImage:", v18);
  v19 = MKBGetDeviceLockState(0) - 1;
  v20 = *(UILabel **)((char *)&self->_progressLabel + 1);
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v22 = v21;
  if (v19 >= 2)
    v23 = CFSTR("IOS_SETUP_CONTINUE");
  else
    v23 = CFSTR("IOS_SETUP_UNLOCK_TO_CONTINUE");
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "localizedStringForKey:value:table:", v23, &stru_10017E3D8, CFSTR("Localizable")));
  objc_msgSend(v20, "setTitle:forState:", v24, 0);

  objc_msgSend(*(id *)((char *)&self->_progressLabel + 1), "setHidden:", BYTE1(self->_startButton));
  if (v19 < 2)
    goto LABEL_24;
  v25 = objc_alloc_init((Class)ACAccountStore);
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "aa_primaryAppleAccount"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "username"));
  if (!objc_msgSend(v27, "length"))
  {

LABEL_24:
    v30 = objc_msgSend(self->super.super._mainController, "otherDeviceClassCode") - 1;
    if (v30 > 6)
      v31 = CFSTR("_IPHONE");
    else
      v31 = off_10017DF70[v30];
    v25 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("IOS_SETUP_START_INFO"), "stringByAppendingString:", v31));
    v32 = sub_1001171A8(CFSTR("Localizable"), v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue(v32);
    objc_msgSend(*(id *)((char *)&self->_titleLabel + 1), "setText:", v26);
    goto LABEL_35;
  }
  if (objc_msgSend(v27, "rangeOfString:", CFSTR("@")) == (id)0x7FFFFFFFFFFFFFFFLL)
  {
    v28 = SFLocalizePhoneNumber(v27);
    v29 = (id)objc_claimAutoreleasedReturnValue(v28);
  }
  else
  {
    v29 = v27;
  }
  v33 = (uint64_t)v29;
  v34 = objc_msgSend(self->super.super._mainController, "otherDeviceClassCode") - 1;
  v63 = v18;
  v62 = v27;
  if (v34 > 6)
    v35 = CFSTR("_IPHONE");
  else
    v35 = off_10017DF70[v34];
  v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("IOS_SETUP_START_INFO_APPLE_ID"), "stringByAppendingString:", v35));
  v37 = sub_1001171A8(CFSTR("Localizable"), v36);
  v38 = (void *)objc_claimAutoreleasedReturnValue(v37);

  v61 = (void *)v33;
  v46 = sub_1001173A4(CFSTR("QUOTED_STRING"), v39, v40, v41, v42, v43, v44, v45, v33);
  v64 = (id)objc_claimAutoreleasedReturnValue(v46);
  v47 = CFSTR("<BOLD_APPLE_ID>");
  v48 = v38;
  v49 = objc_alloc((Class)NSMutableAttributedString);
  v68 = NSFontAttributeName;
  v50 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:](UIFont, "systemFontOfSize:", 15.0));
  v69 = v50;
  v51 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v69, &v68, 1));
  v52 = objc_msgSend(v49, "initWithString:attributes:", v48, v51);

  v53 = objc_msgSend(v48, "rangeOfString:", CFSTR("<BOLD_APPLE_ID>"));
  v55 = v54;

  if (v53 != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(v52, "replaceCharactersInRange:withString:", v53, v55, v64);
    v60 = objc_msgSend(v64, "length");
    v66 = NSFontAttributeName;
    v56 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:weight:](UIFont, "systemFontOfSize:weight:", 15.0, UIFontWeightSemibold));
    v67 = v56;
    v57 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v67, &v66, 1));
    objc_msgSend(v52, "setAttributes:range:", v57, v53, v60);

  }
  objc_msgSend(*(id *)((char *)&self->_titleLabel + 1), "setAttributedText:", v52);

  objc_msgSend(self->super.super._mainController, "setMyAppleID:", v62);
  v18 = v63;
LABEL_35:

  if (!BYTE1(self->_startButton))
  {
    v58 = (void *)objc_claimAutoreleasedReturnValue(+[NSDistributedNotificationCenter defaultCenter](NSDistributedNotificationCenter, "defaultCenter"));
    objc_msgSend(v58, "addObserver:selector:name:object:suspensionBehavior:", self, "handleDeviceSetupNotification:", CFSTR("com.apple.sharing.DeviceSetup"), 0, 4);

  }
  v59 = (void *)objc_claimAutoreleasedReturnValue(-[SVSBaseViewController containerView](self, "containerView"));
  objc_msgSend(v59, "setSwipeDismissible:", 1);

  if (BYTE2(self->_startButton))
  {
    -[iOSSetupStartViewController handleStartButton:](self, "handleStartButton:", self);
    BYTE2(self->_startButton) = 0;
  }

}

- (void)viewDidDisappear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  objc_super v6;

  v3 = a3;
  if (dword_1001A82C8 <= 30 && (dword_1001A82C8 != -1 || _LogCategory_Initialize(&dword_1001A82C8, 30)))
    LogPrintF(&dword_1001A82C8, "-[iOSSetupStartViewController viewDidDisappear:]", 30, "Start ViewDidDisappear\n");
  v6.receiver = self;
  v6.super_class = (Class)iOSSetupStartViewController;
  -[iOSSetupStartViewController viewDidDisappear:](&v6, "viewDidDisappear:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDistributedNotificationCenter defaultCenter](NSDistributedNotificationCenter, "defaultCenter"));
  objc_msgSend(v5, "removeObserver:name:object:", self, CFSTR("com.apple.sharing.DeviceSetup"), 0);

}

- (BOOL)_canShowWhileLocked
{
  return 1;
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

- (void)handleDismissButton:(id)a3
{
  id v4;

  v4 = a3;
  if (dword_1001A82C8 <= 30 && (dword_1001A82C8 != -1 || _LogCategory_Initialize(&dword_1001A82C8, 30)))
    LogPrintF(&dword_1001A82C8, "-[iOSSetupStartViewController handleDismissButton:]", 30, "Dismiss button\n");
  objc_msgSend(self->super.super._mainController, "dismiss:", 5);

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
    if (dword_1001A82C8 <= 30
      && (dword_1001A82C8 != -1 || _LogCategory_Initialize(&dword_1001A82C8, 30)))
    {
      v7 = &stru_10017E3D8;
      if (v6)
        v7 = v6;
      LogPrintF(&dword_1001A82C8, "-[iOSSetupStartViewController handleDeviceSetupNotification:]", 30, "DeviceSetup notification '%@', %##@\n", v5, v7);
    }
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "name"));
    v9 = objc_msgSend(v8, "isEqual:", CFSTR("com.apple.sharing.DeviceSetup"));

    if (v9 && !CFDictionaryGetInt64(v6, CFSTR("needsSetup"), 0))
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(self->super.super._mainController, "userInfo"));
      TypeID = CFStringGetTypeID();
      TypedValue = CFDictionaryGetTypedValue(v10, CFSTR("deviceIdentifier"), TypeID, 0);
      v13 = (void *)objc_claimAutoreleasedReturnValue(TypedValue);

      v14 = CFStringGetTypeID();
      v15 = CFDictionaryGetTypedValue(v6, CFSTR("deviceID"), v14, 0);
      v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
      if (objc_msgSend(v16, "isEqual:", v13))
      {
        if (dword_1001A82C8 <= 30
          && (dword_1001A82C8 != -1 || _LogCategory_Initialize(&dword_1001A82C8, 30)))
        {
          LogPrintF(&dword_1001A82C8, "-[iOSSetupStartViewController handleDeviceSetupNotification:]", 30, "Auto-dismissing on setup started\n");
        }
        objc_msgSend(self->super.super._mainController, "dismiss:", 16);
      }

    }
    v4 = v17;
  }

}

- (void)handleStartButton:(id)a3
{
  id v4;
  uint64_t v5;
  const void *v6;
  int Power;
  const char *v8;
  void *v9;
  NSObject *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  __n128 v15;
  _QWORD handler[4];
  dispatch_source_t v17;
  iOSSetupStartViewController *v18;
  _QWORD v19[6];

  v4 = a3;
  if (BYTE2(self->_startButton))
    goto LABEL_31;
  v5 = WiFiManagerClientCreate(0, 0);
  if (v5)
  {
    v6 = (const void *)v5;
    Power = WiFiManagerClientGetPower();
    CFRelease(v6);
  }
  else
  {
    Power = 0;
  }
  if (dword_1001A82C8 <= 30 && (dword_1001A82C8 != -1 || _LogCategory_Initialize(&dword_1001A82C8, 30)))
  {
    v8 = "on";
    if (!Power)
      v8 = "off";
    LogPrintF(&dword_1001A82C8, "-[iOSSetupStartViewController handleStartButton:]", 30, "Start: WiFi %s\n", v8);
  }
  if (Power)
  {
LABEL_31:
    if (!BYTE1(self->_startButton))
    {
      BYTE1(self->_startButton) = 1;
      if (dword_1001A82C8 <= 30
        && (dword_1001A82C8 != -1 || _LogCategory_Initialize(&dword_1001A82C8, 30)))
      {
        LogPrintF(&dword_1001A82C8, "-[iOSSetupStartViewController handleStartButton:]", 30, "Start button\n");
      }
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[SVSBaseViewController containerView](self, "containerView"));
      objc_msgSend(v9, "setSwipeDismissible:", 0);

      if (v4 && MKBGetDeviceLockState(0) - 1 <= 1)
      {
        if (dword_1001A82C8 <= 30
          && (dword_1001A82C8 != -1 || _LogCategory_Initialize(&dword_1001A82C8, 30)))
        {
          LogPrintF(&dword_1001A82C8, "-[iOSSetupStartViewController handleStartButton:]", 30, "Start button requesting unlock\n");
        }
        v14 = objc_msgSend(UIApp, "beginBackgroundTaskWithExpirationHandler:", &stru_10017D548);
        v19[0] = _NSConcreteStackBlock;
        v15.n128_u64[0] = 3221225472;
        v19[1] = 3221225472;
        v19[2] = sub_1000E7784;
        v19[3] = &unk_10017D598;
        v19[4] = self;
        v19[5] = v14;
        SBSRequestPasscodeUnlockUI(v19, v15);
      }
      else
      {
        objc_msgSend(*(id *)((char *)&self->_progressView + 1), "setHidden:", 0);
        objc_msgSend(*(id *)((char *)&self->_progressView + 1), "startAnimating");
        objc_msgSend(*(id *)((char *)&self->_imageView + 1), "setHidden:", 0);
        objc_msgSend(*(id *)((char *)&self->_progressLabel + 1), "setHidden:", 1);
        if (objc_msgSend(self->super.super._mainController, "testMode"))
        {
          handler[0] = _NSConcreteStackBlock;
          handler[1] = 3221225472;
          handler[2] = sub_1000E78F4;
          handler[3] = &unk_10017E1A0;
          v17 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)&_dispatch_main_q);
          v18 = self;
          v10 = v17;
          dispatch_source_set_event_handler(v10, handler);
          SFDispatchTimerSet(v10, 1.0, -1.0, -4.0);
          dispatch_resume(v10);

        }
        else
        {
          v11 = objc_alloc_init((Class)SFDevice);
          v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(self->super.super._mainController, "userInfo"));
          objc_msgSend(v11, "setOsVersion:", CFDictionaryGetInt64Ranged(v12, CFSTR("osVersion"), 0, 255, 0));

          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(self->super.super._mainController, "deviceIdentifier"));
          objc_msgSend(v11, "setIdentifier:", v13);

          objc_msgSend(self->super.super._mainController, "_sessionStart:", v11);
        }
      }
    }
  }
  else
  {
    objc_msgSend(self->super.super._mainController, "showWiFi");
  }

}

- (void)handleTapOutsideView:(id)a3
{
  id v4;

  v4 = a3;
  if (dword_1001A82C8 <= 30 && (dword_1001A82C8 != -1 || _LogCategory_Initialize(&dword_1001A82C8, 30)))
    LogPrintF(&dword_1001A82C8, "-[iOSSetupStartViewController handleTapOutsideView:]", 30, "Dismissing on tap outside view\n");
  objc_msgSend(self->super.super._mainController, "dismiss:", 1);

}

- (BOOL)autoStart
{
  return BYTE2(self->_startButton);
}

- (void)setAutoStart:(BOOL)a3
{
  BYTE2(self->_startButton) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)((char *)&self->_progressLabel + 1), 0);
  objc_storeStrong((id *)((char *)&self->_progressSpinner + 1), 0);
  objc_storeStrong((id *)((char *)&self->_progressView + 1), 0);
  objc_storeStrong((id *)((char *)&self->_imageView + 1), 0);
  objc_storeStrong((id *)((char *)&self->_infoLabel + 1), 0);
  objc_storeStrong((id *)((char *)&self->_titleLabel + 1), 0);
  objc_storeStrong((id *)((char *)&self->_dismissButton + 1), 0);
  objc_storeStrong((id *)(&self->super.super._didReactivateContainerViewAfterLayingOut + 1), 0);
}

@end
