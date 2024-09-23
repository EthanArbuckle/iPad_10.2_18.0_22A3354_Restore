@implementation TVLatencyColorimeterSetupMainController

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
  NSDictionary *v14;
  CFTypeID v15;
  uint64_t v16;
  void *v17;
  void (**v18)(void);

  v18 = (void (**)(void))a4;
  v6 = (NSDictionary *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "userInfo"));
  userInfo = self->super._userInfo;
  self->super._userInfo = v6;

  if (dword_1001A8668 <= 30 && (dword_1001A8668 != -1 || _LogCategory_Initialize(&dword_1001A8668, 30)))
    LogPrintF(&dword_1001A8668, "-[TVLatencyColorimeterSetupMainController configureWithContext:completion:]", 30, "Main configuration: %@\n", self->super._userInfo);
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
  v14 = self->super._userInfo;
  v15 = CFStringGetTypeID();
  v16 = CFDictionaryGetTypedValue(v14, CFSTR("testParams"), v15, 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue(v16);

  if (v17)
    self->_testFlags = SFTestFlagsFromString(v17);
  if (v18)
    v18[2]();

}

- (unint64_t)supportedInterfaceOrientations
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TVLatencyColorimeterSetupMainController view](self, "view"));
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
  unsigned int v7;
  __objc2_class **v8;
  id v9;
  UINavigationController *v10;
  UINavigationController *vcNav;
  objc_super v12;

  v3 = a3;
  if (dword_1001A8668 <= 30 && (dword_1001A8668 != -1 || _LogCategory_Initialize(&dword_1001A8668, 30)))
    LogPrintF(&dword_1001A8668, "-[TVLatencyColorimeterSetupMainController viewDidAppear:]", 30, "Main ViewDidAppear\n");
  v12.receiver = self;
  v12.super_class = (Class)TVLatencyColorimeterSetupMainController;
  -[TVLatencyColorimeterSetupMainController viewDidAppear:](&v12, "viewDidAppear:", v3);
  v5 = (UIStoryboard *)objc_claimAutoreleasedReturnValue(+[UIStoryboard storyboardWithName:bundle:](UIStoryboard, "storyboardWithName:bundle:", CFSTR("TVColorCalibrationSetup"), 0));
  storyboard = self->_storyboard;
  self->_storyboard = v5;

  v7 = -[TVLatencyColorimeterSetupMainController _deviceSupported](self, "_deviceSupported");
  v8 = off_100175920;
  if (!v7)
    v8 = &off_100175928;
  v9 = objc_alloc_init(*v8);
  objc_msgSend(v9, "setMainController:", self);
  v10 = (UINavigationController *)objc_claimAutoreleasedReturnValue(-[TVLatencyColorimeterSetupMainController presentProxCardFlowWithDelegate:initialViewController:](self, "presentProxCardFlowWithDelegate:initialViewController:", self, v9));
  vcNav = self->_vcNav;
  self->_vcNav = v10;

}

- (void)viewDidDisappear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  SFDeviceSetupTVColorCalibratorSession *colorCalibratorSetupSession;
  UIStoryboard *storyboard;
  TVLatencyColorimeterSetupAuthViewController *vcAuth;
  TVLatencyColorimeterSetupDoneViewController *vcDone;
  UINavigationController *vcNav;
  TVLatencyColorimeterSetupProgressViewController *vcProgress;
  TVLatencyColorimeterSetupPreparingViewController *vcPreparing;
  TVLatencyColorimeterSetupStartViewController *vcStart;
  TVLatencyColorimeterSetupTryAgainViewController *vcTryAgain;
  objc_super v15;

  v3 = a3;
  if (dword_1001A8668 <= 30 && (dword_1001A8668 != -1 || _LogCategory_Initialize(&dword_1001A8668, 30)))
    LogPrintF(&dword_1001A8668, "-[TVLatencyColorimeterSetupMainController viewDidDisappear:]", 30, "Main ViewDidDisappear\n");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVLatencyColorimeterSetupMainController _remoteViewControllerProxy](self, "_remoteViewControllerProxy"));
  objc_msgSend(v5, "setIdleTimerDisabled:forReason:", 0, CFSTR("com.apple.SharingViewService.TVLatencySetup"));

  if (!self->_dismissed)
  {
    if (dword_1001A8668 <= 30
      && (dword_1001A8668 != -1 || _LogCategory_Initialize(&dword_1001A8668, 30)))
    {
      LogPrintF(&dword_1001A8668, "-[TVLatencyColorimeterSetupMainController viewDidDisappear:]", 30, "Main disappeared without dismiss (device locked?)...dismissing UI\n");
    }
    -[TVLatencyColorimeterSetupMainController dismiss:](self, "dismiss:", 21);
  }
  -[SFDeviceSetupTVColorCalibratorSession invalidate](self->_colorCalibratorSetupSession, "invalidate");
  colorCalibratorSetupSession = self->_colorCalibratorSetupSession;
  self->_colorCalibratorSetupSession = 0;

  storyboard = self->_storyboard;
  self->_storyboard = 0;

  -[SVSBaseViewController setMainController:](self->_vcAuth, "setMainController:", 0);
  vcAuth = self->_vcAuth;
  self->_vcAuth = 0;

  -[TVLatencyColorimeterSetupBaseViewController setMainController:](self->_vcDone, "setMainController:", 0);
  vcDone = self->_vcDone;
  self->_vcDone = 0;

  vcNav = self->_vcNav;
  self->_vcNav = 0;

  -[TVLatencyColorimeterSetupBaseViewController setMainController:](self->_vcProgress, "setMainController:", 0);
  vcProgress = self->_vcProgress;
  self->_vcProgress = 0;

  -[TVLatencyColorimeterSetupBaseViewController setMainController:](self->_vcPreparing, "setMainController:", 0);
  vcPreparing = self->_vcPreparing;
  self->_vcPreparing = 0;

  -[TVLatencyColorimeterSetupBaseViewController setMainController:](self->_vcStart, "setMainController:", 0);
  vcStart = self->_vcStart;
  self->_vcStart = 0;

  -[TVLatencyColorimeterSetupBaseViewController setMainController:](self->_vcTryAgain, "setMainController:", 0);
  vcTryAgain = self->_vcTryAgain;
  self->_vcTryAgain = 0;

  v15.receiver = self;
  v15.super_class = (Class)TVLatencyColorimeterSetupMainController;
  -[SVSBaseMainController viewDidDisappear:](&v15, "viewDidDisappear:", v3);
}

- (void)dismiss:(int)a3
{
  -[TVLatencyColorimeterSetupMainController dismissAnimated:reenableProxCard:completion:](self, "dismissAnimated:reenableProxCard:completion:", a3 != 19, a3 != 5, 0);
}

- (void)dismissAnimated:(BOOL)a3 reenableProxCard:(BOOL)a4 completion:(id)a5
{
  _BOOL4 v5;
  _BOOL8 v6;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  UINavigationController *vcNav;
  _QWORD v14[4];
  id v15;
  id v16;
  _QWORD v17[5];

  v5 = a4;
  v6 = a3;
  v8 = a5;
  if (!self->_dismissed)
  {
    self->_dismissed = 1;
    if (self->_started)
    {
      v9 = objc_alloc_init((Class)SFClient);
      v10 = v9;
      if (v5)
      {
        v17[0] = _NSConcreteStackBlock;
        v17[1] = 3221225472;
        v17[2] = sub_1000F7E04;
        v17[3] = &unk_10017E070;
        v17[4] = v9;
        objc_msgSend(v9, "reenableProxCardType:completion:", 30, v17);
      }
      else
      {
        objc_msgSend(v9, "invalidate");
      }

    }
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[TVLatencyColorimeterSetupMainController _remoteViewControllerProxy](self, "_remoteViewControllerProxy"));
    v12 = v11;
    vcNav = self->_vcNav;
    if (vcNav)
    {
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = sub_1000F7E94;
      v14[3] = &unk_10017E100;
      v16 = v8;
      v15 = v12;
      -[UINavigationController dismissViewControllerAnimated:completion:](vcNav, "dismissViewControllerAnimated:completion:", v6, v14);

    }
    else
    {
      objc_msgSend(v11, "dismiss");
    }

  }
}

- (void)proxCardFlowDidDismiss
{
  -[TVLatencyColorimeterSetupMainController dismissAnimated:reenableProxCard:completion:](self, "dismissAnimated:reenableProxCard:completion:", 0, 0, 0);
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
          if (dword_1001A8668 <= 30
            && (dword_1001A8668 != -1 || _LogCategory_Initialize(&dword_1001A8668, 30)))
          {
            LogPrintF(&dword_1001A8668, "-[TVLatencyColorimeterSetupMainController handleButtonActions:]", 30, "Home button\n");
          }
          -[TVLatencyColorimeterSetupMainController dismiss:](self, "dismiss:", 4);
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (void)_sessionStart:(id)a3
{
  id v4;
  SFDeviceSetupTVColorCalibratorSession *v5;
  SFDeviceSetupTVColorCalibratorSession *colorCalibratorSetupSession;
  void *v7;
  _QWORD v8[5];
  _QWORD v9[5];

  self->_started = 1;
  v4 = a3;
  v5 = (SFDeviceSetupTVColorCalibratorSession *)objc_alloc_init((Class)SFDeviceSetupTVColorCalibratorSession);
  colorCalibratorSetupSession = self->_colorCalibratorSetupSession;
  self->_colorCalibratorSetupSession = v5;

  -[SFDeviceSetupTVColorCalibratorSession setPeerDevice:](self->_colorCalibratorSetupSession, "setPeerDevice:", v4);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000F7D60;
  v9[3] = &unk_10017E128;
  v9[4] = self;
  -[SFDeviceSetupTVColorCalibratorSession setProgressHandler:](self->_colorCalibratorSetupSession, "setProgressHandler:", v9);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000F7D70;
  v8[3] = &unk_10017E178;
  v8[4] = self;
  -[SFDeviceSetupTVColorCalibratorSession setPromptForPINHandler:](self->_colorCalibratorSetupSession, "setPromptForPINHandler:", v8);
  -[SFDeviceSetupTVColorCalibratorSession activate](self->_colorCalibratorSetupSession, "activate");
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVLatencyColorimeterSetupMainController _remoteViewControllerProxy](self, "_remoteViewControllerProxy"));
  objc_msgSend(v7, "setIdleTimerDisabled:forReason:", 1, CFSTR("com.apple.SharingViewService.TVLatencySetup"));

}

- (void)_sessionHandleProgress:(unsigned int)a3 info:(id)a4
{
  id v6;
  void *v7;
  CFTypeID TypeID;
  uint64_t TypedValue;
  void *v10;
  int v11;
  id v12;

  v6 = a4;
  v7 = v6;
  if ((int)a3 > 277)
  {
    switch(a3)
    {
      case 0x116u:
        v12 = v6;
        -[TVLatencyColorimeterSetupMainController showProgressUI](self, "showProgressUI");
        -[TVLatencyColorimeterSetupProgressViewController handleProgressEvent:](self->_vcProgress, "handleProgressEvent:", 278);
        goto LABEL_23;
      case 0x117u:
        goto LABEL_24;
      case 0x118u:
        goto LABEL_9;
      case 0x119u:
        v12 = v6;
        -[TVLatencyColorimeterSetupMainController showTryAgainUI](self, "showTryAgainUI");
        goto LABEL_23;
      case 0x11Au:
        goto LABEL_6;
      default:
        if (a3 != 400)
          goto LABEL_24;
        v12 = v6;
        if (dword_1001A8668 <= 30
          && (dword_1001A8668 != -1 || _LogCategory_Initialize(&dword_1001A8668, 30)))
        {
          LogPrintF(&dword_1001A8668, "-[TVLatencyColorimeterSetupMainController _sessionHandleProgress:info:]", 30, "Remote user stop setup\n");
        }
        -[TVLatencyColorimeterSetupMainController dismiss:](self, "dismiss:", 17);
        break;
    }
    goto LABEL_23;
  }
  if (a3 == 30)
  {
LABEL_9:
    v12 = v6;
    TypeID = CFErrorGetTypeID();
    TypedValue = CFDictionaryGetTypedValue(v12, CFSTR("eo"), TypeID, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue(TypedValue);
    if (dword_1001A8668 <= 60
      && (dword_1001A8668 != -1 || _LogCategory_Initialize(&dword_1001A8668, 60)))
    {
      LogPrintF(&dword_1001A8668, "-[TVLatencyColorimeterSetupMainController _sessionHandleProgress:info:]", 60, "### Setup failed: %{error}\n", v10);
    }
    -[TVLatencyColorimeterSetupMainController showTryAgainUI](self, "showTryAgainUI");

LABEL_23:
    v7 = v12;
    goto LABEL_24;
  }
  if (a3 == 96)
  {
LABEL_6:
    v12 = v6;
    if (dword_1001A8668 <= 30)
    {
      if (dword_1001A8668 != -1 || (v11 = _LogCategory_Initialize(&dword_1001A8668, 30), v7 = v12, v11))
      {
        LogPrintF(&dword_1001A8668, "-[TVLatencyColorimeterSetupMainController _sessionHandleProgress:info:]", 30, "Setup completed\n");
        v7 = v12;
      }
    }
    -[TVLatencyColorimeterSetupMainController showDoneUI:completed:](self, "showDoneUI:completed:", 0, v7 != 0);
    goto LABEL_23;
  }
LABEL_24:

}

- (void)showAuthUIWithFlags:(unsigned int)a3 throttleSeconds:(int)a4
{
  TVLatencyColorimeterSetupAuthViewController *vcAuth;
  TVLatencyColorimeterSetupAuthViewController *v6;
  TVLatencyColorimeterSetupAuthViewController *v7;

  vcAuth = self->_vcAuth;
  if (vcAuth)
  {
    -[TVLatencyColorimeterSetupAuthViewController showWithFlags:throttleSeconds:](vcAuth, "showWithFlags:throttleSeconds:", *(_QWORD *)&a3, *(_QWORD *)&a4);
  }
  else
  {
    if (dword_1001A8668 <= 30
      && (dword_1001A8668 != -1 || _LogCategory_Initialize(&dword_1001A8668, 30)))
    {
      LogPrintF(&dword_1001A8668, "-[TVLatencyColorimeterSetupMainController showAuthUIWithFlags:throttleSeconds:]", 30, "Show auth UI\n");
    }
    v6 = (TVLatencyColorimeterSetupAuthViewController *)objc_claimAutoreleasedReturnValue(-[UIStoryboard instantiateViewControllerWithIdentifier:](self->_storyboard, "instantiateViewControllerWithIdentifier:", CFSTR("AuthUI")));
    v7 = self->_vcAuth;
    self->_vcAuth = v6;

    -[SVSBaseViewController setMainController:](self->_vcAuth, "setMainController:", self);
    sub_1000F56B8(self->_vcNav, self->_vcAuth);
  }
}

- (void)showDoneUI:(id)a3 completed:(BOOL)a4
{
  -[TVLatencyColorimeterSetupMainController showDoneUI:final:completed:](self, "showDoneUI:final:completed:", a3, 0, a4);
}

- (void)showDoneUI:(id)a3 final:(BOOL)a4 completed:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL4 v6;
  TVLatencyColorimeterSetupDoneViewController *v8;
  TVLatencyColorimeterSetupDoneViewController *vcDone;
  SFDeviceSetupTVColorCalibratorSession *colorCalibratorSetupSession;
  void *v11;
  id v12;

  v5 = a5;
  v6 = a4;
  v12 = a3;
  if (dword_1001A8668 <= 30 && (dword_1001A8668 != -1 || _LogCategory_Initialize(&dword_1001A8668, 30)))
    LogPrintF(&dword_1001A8668, "-[TVLatencyColorimeterSetupMainController showDoneUI:final:completed:]", 30, "Show done UI: %{error}\n", v12);
  if (self->_vcDone)
  {
    if (!v6)
      goto LABEL_14;
  }
  else
  {
    v8 = objc_alloc_init(TVLatencyColorimeterSetupDoneViewController);
    vcDone = self->_vcDone;
    self->_vcDone = v8;

    -[TVLatencyColorimeterSetupBaseViewController setMainController:](self->_vcDone, "setMainController:", self);
    -[TVLatencyColorimeterSetupDoneViewController setError:](self->_vcDone, "setError:", v12);
    -[TVLatencyColorimeterSetupDoneViewController setCompleted:](self->_vcDone, "setCompleted:", v5);
    sub_1000F56B8(self->_vcNav, self->_vcDone);
    if (!v6)
      goto LABEL_14;
  }
  if (dword_1001A8668 <= 30 && (dword_1001A8668 != -1 || _LogCategory_Initialize(&dword_1001A8668, 30)))
    LogPrintF(&dword_1001A8668, "-[TVLatencyColorimeterSetupMainController showDoneUI:final:completed:]", 30, "Invalidating session\n");
  -[SFDeviceSetupTVColorCalibratorSession invalidate](self->_colorCalibratorSetupSession, "invalidate");
  colorCalibratorSetupSession = self->_colorCalibratorSetupSession;
  self->_colorCalibratorSetupSession = 0;

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[TVLatencyColorimeterSetupMainController _remoteViewControllerProxy](self, "_remoteViewControllerProxy"));
  objc_msgSend(v11, "setIdleTimerDisabled:forReason:", 0, CFSTR("com.apple.SharingViewService.TVLatencySetup"));

LABEL_14:
}

- (void)showPreparingUI
{
  TVLatencyColorimeterSetupPreparingViewController *vcPreparing;
  TVLatencyColorimeterSetupPreparingViewController *v4;
  TVLatencyColorimeterSetupPreparingViewController *v5;

  if (dword_1001A8668 <= 30 && (dword_1001A8668 != -1 || _LogCategory_Initialize(&dword_1001A8668, 30)))
    LogPrintF(&dword_1001A8668, "-[TVLatencyColorimeterSetupMainController showPreparingUI]", 30, "Show preparing UI\n");
  vcPreparing = self->_vcPreparing;
  if (!vcPreparing)
  {
    v4 = objc_alloc_init(TVLatencyColorimeterSetupPreparingViewController);
    v5 = self->_vcPreparing;
    self->_vcPreparing = v4;

    -[TVLatencyColorimeterSetupBaseViewController setMainController:](self->_vcPreparing, "setMainController:", self);
    vcPreparing = self->_vcPreparing;
  }
  sub_1000F56B8(self->_vcNav, vcPreparing);
}

- (void)showProgressUI
{
  TVLatencyColorimeterSetupProgressViewController *vcProgress;
  TVLatencyColorimeterSetupProgressViewController *v4;
  TVLatencyColorimeterSetupProgressViewController *v5;

  if (dword_1001A8668 <= 30 && (dword_1001A8668 != -1 || _LogCategory_Initialize(&dword_1001A8668, 30)))
    LogPrintF(&dword_1001A8668, "-[TVLatencyColorimeterSetupMainController showProgressUI]", 30, "Show progress UI\n");
  vcProgress = self->_vcProgress;
  if (!vcProgress)
  {
    v4 = objc_alloc_init(TVLatencyColorimeterSetupProgressViewController);
    v5 = self->_vcProgress;
    self->_vcProgress = v4;

    -[TVLatencyColorimeterSetupBaseViewController setMainController:](self->_vcProgress, "setMainController:", self);
    vcProgress = self->_vcProgress;
  }
  sub_1000F56B8(self->_vcNav, vcProgress);
}

- (void)showTryAgainUI
{
  TVLatencyColorimeterSetupTryAgainViewController *vcTryAgain;
  TVLatencyColorimeterSetupTryAgainViewController *v4;
  TVLatencyColorimeterSetupTryAgainViewController *v5;

  if (dword_1001A8668 <= 30 && (dword_1001A8668 != -1 || _LogCategory_Initialize(&dword_1001A8668, 30)))
    LogPrintF(&dword_1001A8668, "-[TVLatencyColorimeterSetupMainController showTryAgainUI]", 30, "TryAgain UI\n");
  vcTryAgain = self->_vcTryAgain;
  if (!vcTryAgain)
  {
    v4 = objc_alloc_init(TVLatencyColorimeterSetupTryAgainViewController);
    v5 = self->_vcTryAgain;
    self->_vcTryAgain = v4;

    -[TVLatencyColorimeterSetupBaseViewController setMainController:](self->_vcTryAgain, "setMainController:", self);
    vcTryAgain = self->_vcTryAgain;
  }
  sub_1000F56B8(self->_vcNav, vcTryAgain);
}

- (BOOL)_deviceSupported
{
  int DeviceClass;
  int v3;

  DeviceClass = GestaltGetDeviceClass(self, a2);
  v3 = MGIsQuestionValid(CFSTR("8S7ydMJ4DlCUF38/hI/fJA"));
  if (v3)
  {
    LOBYTE(v3) = MGGetBoolAnswer(CFSTR("8S7ydMJ4DlCUF38/hI/fJA"));
    if (DeviceClass != 1)
      LOBYTE(v3) = 0;
  }
  return v3;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (BOOL)started
{
  return self->_started;
}

- (void)setStarted:(BOOL)a3
{
  self->_started = a3;
}

- (unint64_t)testFlags
{
  return self->_testFlags;
}

- (void)setTestFlags:(unint64_t)a3
{
  self->_testFlags = a3;
}

- (NSUUID)deviceIdentifier
{
  return self->_deviceIdentifier;
}

- (void)setDeviceIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (SFDeviceSetupTVColorCalibratorSession)colorCalibratorSetupSession
{
  return self->_colorCalibratorSetupSession;
}

- (void)setColorCalibratorSetupSession:(id)a3
{
  objc_storeStrong((id *)&self->_colorCalibratorSetupSession, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_colorCalibratorSetupSession, 0);
  objc_storeStrong((id *)&self->_deviceIdentifier, 0);
  objc_storeStrong((id *)&self->_vcTryAgain, 0);
  objc_storeStrong((id *)&self->_vcPreparing, 0);
  objc_storeStrong((id *)&self->_vcStart, 0);
  objc_storeStrong((id *)&self->_vcProgress, 0);
  objc_storeStrong((id *)&self->_vcNav, 0);
  objc_storeStrong((id *)&self->_vcDone, 0);
  objc_storeStrong((id *)&self->_vcAuth, 0);
  objc_storeStrong((id *)&self->_storyboard, 0);
}

@end
