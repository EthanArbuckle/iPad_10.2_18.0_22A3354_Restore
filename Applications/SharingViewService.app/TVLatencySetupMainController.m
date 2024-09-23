@implementation TVLatencySetupMainController

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

  if (dword_1001A8EB8 <= 30 && (dword_1001A8EB8 != -1 || _LogCategory_Initialize(&dword_1001A8EB8, 30)))
    LogPrintF(&dword_1001A8EB8, "-[TVLatencySetupMainController configureWithContext:completion:]", 30, "Main configuration: %@\n", self->super._userInfo);
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

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TVLatencySetupMainController view](self, "view"));
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
  TVLatencySetupStartViewController *v12;
  TVLatencySetupStartViewController *vcStart;
  objc_super v14;

  v3 = a3;
  if (dword_1001A8EB8 <= 30 && (dword_1001A8EB8 != -1 || _LogCategory_Initialize(&dword_1001A8EB8, 30)))
    LogPrintF(&dword_1001A8EB8, "-[TVLatencySetupMainController viewDidAppear:]", 30, "Main ViewDidAppear\n");
  v14.receiver = self;
  v14.super_class = (Class)TVLatencySetupMainController;
  -[TVLatencySetupMainController viewDidAppear:](&v14, "viewDidAppear:", v3);
  v5 = (UIStoryboard *)objc_claimAutoreleasedReturnValue(+[UIStoryboard storyboardWithName:bundle:](UIStoryboard, "storyboardWithName:bundle:", CFSTR("TVLatencySetup"), 0));
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
  v12 = (TVLatencySetupStartViewController *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "firstObject"));
  vcStart = self->_vcStart;
  self->_vcStart = v12;

  -[SVSBaseViewController setMainController:](self->_vcStart, "setMainController:", self);
  -[TVLatencySetupMainController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", self->_vcNav, 1, 0);
}

- (void)viewDidDisappear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  SFDeviceSetupTVLatencySession *latencySetupSession;
  UIStoryboard *storyboard;
  TVLatencySetupAuthViewController *vcAuth;
  TVLatencySetupDoneViewController *vcDone;
  SVSCommonNavController *vcNav;
  TVLatencySetupProgressViewController *vcProgress;
  TVLatencySetupStartViewController *vcStart;
  TVLatencySetupTryAgainViewController *vcTryAgain;
  objc_super v14;

  v3 = a3;
  if (dword_1001A8EB8 <= 30 && (dword_1001A8EB8 != -1 || _LogCategory_Initialize(&dword_1001A8EB8, 30)))
    LogPrintF(&dword_1001A8EB8, "-[TVLatencySetupMainController viewDidDisappear:]", 30, "Main ViewDidDisappear\n");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVLatencySetupMainController _remoteViewControllerProxy](self, "_remoteViewControllerProxy"));
  objc_msgSend(v5, "setIdleTimerDisabled:forReason:", 0, CFSTR("com.apple.SharingViewService.TVLatencySetup"));

  if (!self->_dismissed)
  {
    if (dword_1001A8EB8 <= 30
      && (dword_1001A8EB8 != -1 || _LogCategory_Initialize(&dword_1001A8EB8, 30)))
    {
      LogPrintF(&dword_1001A8EB8, "-[TVLatencySetupMainController viewDidDisappear:]", 30, "Main disappeared without dismiss (device locked?)...dismissing UI\n");
    }
    -[TVLatencySetupMainController dismiss:](self, "dismiss:", 21);
  }
  -[SFDeviceSetupTVLatencySession invalidate](self->_latencySetupSession, "invalidate");
  latencySetupSession = self->_latencySetupSession;
  self->_latencySetupSession = 0;

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

  -[SVSBaseViewController setMainController:](self->_vcStart, "setMainController:", 0);
  vcStart = self->_vcStart;
  self->_vcStart = 0;

  -[SVSBaseViewController setMainController:](self->_vcTryAgain, "setMainController:", 0);
  vcTryAgain = self->_vcTryAgain;
  self->_vcTryAgain = 0;

  v14.receiver = self;
  v14.super_class = (Class)TVLatencySetupMainController;
  -[SVSBaseMainController viewDidDisappear:](&v14, "viewDidDisappear:", v3);
}

- (void)dismiss:(int)a3
{
  -[TVLatencySetupMainController dismiss:completion:](self, "dismiss:completion:", *(_QWORD *)&a3, 0);
}

- (void)dismiss:(int)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  SVSCommonNavController *vcNav;
  _QWORD v12[4];
  id v13;
  id v14;
  _QWORD v15[5];

  v6 = a4;
  if (!self->_dismissed)
  {
    self->_dismissed = 1;
    if (self->_started)
    {
      v7 = objc_alloc_init((Class)SFClient);
      v8 = v7;
      if (a3 == 5)
      {
        objc_msgSend(v7, "invalidate");
      }
      else
      {
        v15[0] = _NSConcreteStackBlock;
        v15[1] = 3221225472;
        v15[2] = sub_100118F18;
        v15[3] = &unk_10017E070;
        v15[4] = v7;
        objc_msgSend(v7, "reenableProxCardType:completion:", 25, v15);
      }

    }
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[TVLatencySetupMainController _remoteViewControllerProxy](self, "_remoteViewControllerProxy"));
    v10 = v9;
    vcNav = self->_vcNav;
    if (vcNav)
    {
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_100118FA8;
      v12[3] = &unk_10017E100;
      v14 = v6;
      v13 = v10;
      -[SVSCommonNavController dismissViewControllerAnimated:completion:](vcNav, "dismissViewControllerAnimated:completion:", a3 != 19, v12);

    }
    else
    {
      objc_msgSend(v9, "dismiss");
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
          if (dword_1001A8EB8 <= 30
            && (dword_1001A8EB8 != -1 || _LogCategory_Initialize(&dword_1001A8EB8, 30)))
          {
            LogPrintF(&dword_1001A8EB8, "-[TVLatencySetupMainController handleButtonActions:]", 30, "Home button\n");
          }
          -[TVLatencySetupMainController dismiss:](self, "dismiss:", 4);
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
  SFDeviceSetupTVLatencySession *v5;
  SFDeviceSetupTVLatencySession *latencySetupSession;
  void *v7;
  _QWORD v8[5];
  _QWORD v9[5];

  self->_started = 1;
  v4 = a3;
  v5 = (SFDeviceSetupTVLatencySession *)objc_alloc_init((Class)SFDeviceSetupTVLatencySession);
  latencySetupSession = self->_latencySetupSession;
  self->_latencySetupSession = v5;

  -[SFDeviceSetupTVLatencySession setPeerDevice:](self->_latencySetupSession, "setPeerDevice:", v4);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100118E74;
  v9[3] = &unk_10017E128;
  v9[4] = self;
  -[SFDeviceSetupTVLatencySession setProgressHandler:](self->_latencySetupSession, "setProgressHandler:", v9);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100118E84;
  v8[3] = &unk_10017E178;
  v8[4] = self;
  -[SFDeviceSetupTVLatencySession setPromptForPINHandler:](self->_latencySetupSession, "setPromptForPINHandler:", v8);
  -[SFDeviceSetupTVLatencySession activate](self->_latencySetupSession, "activate");
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVLatencySetupMainController _remoteViewControllerProxy](self, "_remoteViewControllerProxy"));
  objc_msgSend(v7, "setIdleTimerDisabled:forReason:", 1, CFSTR("com.apple.SharingViewService.TVLatencySetup"));

}

- (void)_sessionHandleProgress:(unsigned int)a3 info:(id)a4
{
  id v6;
  TVLatencySetupProgressViewController *vcProgress;
  uint64_t v8;
  CFTypeID TypeID;
  uint64_t TypedValue;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;

  v6 = a4;
  if ((int)a3 > 271)
  {
    switch(a3)
    {
      case 0x110u:
        goto LABEL_11;
      case 0x111u:
      case 0x113u:
        goto LABEL_30;
      case 0x112u:
        goto LABEL_8;
      case 0x114u:
        v14 = v6;
        -[TVLatencySetupMainController showTryAgainUI](self, "showTryAgainUI");
        goto LABEL_29;
      case 0x115u:
        v14 = v6;
        -[TVLatencySetupMainController showProgressUI](self, "showProgressUI");
        vcProgress = self->_vcProgress;
        v8 = 277;
        goto LABEL_19;
      default:
        if (a3 != 400)
          goto LABEL_30;
        v14 = v6;
        if (dword_1001A8EB8 <= 30
          && (dword_1001A8EB8 != -1 || _LogCategory_Initialize(&dword_1001A8EB8, 30)))
        {
          LogPrintF(&dword_1001A8EB8, "-[TVLatencySetupMainController _sessionHandleProgress:info:]", 30, "Remote user stop setup\n");
        }
        -[TVLatencySetupMainController dismiss:](self, "dismiss:", 17);
        break;
    }
    goto LABEL_29;
  }
  switch(a3)
  {
    case 0x1Eu:
LABEL_8:
      v14 = v6;
      TypeID = CFErrorGetTypeID();
      TypedValue = CFDictionaryGetTypedValue(v14, CFSTR("eo"), TypeID, 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue(TypedValue);
      if (dword_1001A8EB8 <= 60
        && (dword_1001A8EB8 != -1 || _LogCategory_Initialize(&dword_1001A8EB8, 60)))
      {
        LogPrintF(&dword_1001A8EB8, "-[TVLatencySetupMainController _sessionHandleProgress:info:]", 60, "### Setup failed: %{error}\n", v11);
      }
      if (v11)
      {
        -[TVLatencySetupMainController showDoneUI:](self, "showDoneUI:", v11);
      }
      else
      {
        v12 = NSErrorF(NSOSStatusErrorDomain, 4294960596, "Failed without error");
        v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
        -[TVLatencySetupMainController showDoneUI:](self, "showDoneUI:", v13);

      }
      goto LABEL_29;
    case 0x60u:
LABEL_11:
      v14 = v6;
      if (dword_1001A8EB8 <= 30
        && (dword_1001A8EB8 != -1 || _LogCategory_Initialize(&dword_1001A8EB8, 30)))
      {
        LogPrintF(&dword_1001A8EB8, "-[TVLatencySetupMainController _sessionHandleProgress:info:]", 30, "Setup completed\n");
      }
      -[TVLatencySetupMainController showDoneUI:](self, "showDoneUI:", 0);
LABEL_29:
      v6 = v14;
      break;
    case 0x104u:
      v14 = v6;
      -[TVLatencySetupMainController showProgressUI](self, "showProgressUI");
      vcProgress = self->_vcProgress;
      v8 = 260;
LABEL_19:
      -[TVLatencySetupProgressViewController handleProgressEvent:](vcProgress, "handleProgressEvent:", v8);
      goto LABEL_29;
  }
LABEL_30:

}

- (void)showAuthUIWithFlags:(unsigned int)a3 throttleSeconds:(int)a4
{
  TVLatencySetupAuthViewController *vcAuth;
  TVLatencySetupAuthViewController *v6;
  TVLatencySetupAuthViewController *v7;

  vcAuth = self->_vcAuth;
  if (vcAuth)
  {
    -[TVLatencySetupAuthViewController showWithFlags:throttleSeconds:](vcAuth, "showWithFlags:throttleSeconds:", *(_QWORD *)&a3, *(_QWORD *)&a4);
  }
  else
  {
    if (dword_1001A8EB8 <= 30
      && (dword_1001A8EB8 != -1 || _LogCategory_Initialize(&dword_1001A8EB8, 30)))
    {
      LogPrintF(&dword_1001A8EB8, "-[TVLatencySetupMainController showAuthUIWithFlags:throttleSeconds:]", 30, "Show auth UI\n");
    }
    v6 = (TVLatencySetupAuthViewController *)objc_claimAutoreleasedReturnValue(-[UIStoryboard instantiateViewControllerWithIdentifier:](self->_storyboard, "instantiateViewControllerWithIdentifier:", CFSTR("AuthUI")));
    v7 = self->_vcAuth;
    self->_vcAuth = v6;

    -[SVSBaseViewController setMainController:](self->_vcAuth, "setMainController:", self);
    sub_100117584(self->_vcNav, self->_vcAuth, 0);
  }
}

- (void)showDoneUI:(id)a3
{
  -[TVLatencySetupMainController showDoneUI:final:](self, "showDoneUI:final:", a3, 0);
}

- (void)showDoneUI:(id)a3 final:(BOOL)a4
{
  _BOOL4 v4;
  TVLatencySetupDoneViewController *v6;
  TVLatencySetupDoneViewController *vcDone;
  SFDeviceSetupTVLatencySession *latencySetupSession;
  void *v9;
  id v10;

  v4 = a4;
  v10 = a3;
  if (dword_1001A8EB8 <= 30 && (dword_1001A8EB8 != -1 || _LogCategory_Initialize(&dword_1001A8EB8, 30)))
    LogPrintF(&dword_1001A8EB8, "-[TVLatencySetupMainController showDoneUI:final:]", 30, "Show done UI: %{error}\n", v10);
  if (self->_vcDone)
  {
    if (!v4)
      goto LABEL_14;
  }
  else
  {
    v6 = (TVLatencySetupDoneViewController *)objc_claimAutoreleasedReturnValue(-[UIStoryboard instantiateViewControllerWithIdentifier:](self->_storyboard, "instantiateViewControllerWithIdentifier:", CFSTR("Done")));
    vcDone = self->_vcDone;
    self->_vcDone = v6;

    -[SVSBaseViewController setMainController:](self->_vcDone, "setMainController:", self);
    -[TVLatencySetupDoneViewController setError:](self->_vcDone, "setError:", v10);
    sub_100117584(self->_vcNav, self->_vcDone, 0);
    if (!v4)
      goto LABEL_14;
  }
  if (dword_1001A8EB8 <= 30 && (dword_1001A8EB8 != -1 || _LogCategory_Initialize(&dword_1001A8EB8, 30)))
    LogPrintF(&dword_1001A8EB8, "-[TVLatencySetupMainController showDoneUI:final:]", 30, "Invalidating session\n");
  -[SFDeviceSetupTVLatencySession invalidate](self->_latencySetupSession, "invalidate");
  latencySetupSession = self->_latencySetupSession;
  self->_latencySetupSession = 0;

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[TVLatencySetupMainController _remoteViewControllerProxy](self, "_remoteViewControllerProxy"));
  objc_msgSend(v9, "setIdleTimerDisabled:forReason:", 0, CFSTR("com.apple.SharingViewService.TVLatencySetup"));

LABEL_14:
}

- (void)showProgressUI
{
  TVLatencySetupProgressViewController *vcProgress;
  TVLatencySetupProgressViewController *v4;
  TVLatencySetupProgressViewController *v5;

  if (dword_1001A8EB8 <= 30 && (dword_1001A8EB8 != -1 || _LogCategory_Initialize(&dword_1001A8EB8, 30)))
    LogPrintF(&dword_1001A8EB8, "-[TVLatencySetupMainController showProgressUI]", 30, "Show progress UI\n");
  vcProgress = self->_vcProgress;
  if (!vcProgress)
  {
    v4 = (TVLatencySetupProgressViewController *)objc_claimAutoreleasedReturnValue(-[UIStoryboard instantiateViewControllerWithIdentifier:](self->_storyboard, "instantiateViewControllerWithIdentifier:", CFSTR("Progress")));
    v5 = self->_vcProgress;
    self->_vcProgress = v4;

    -[SVSBaseViewController setMainController:](self->_vcProgress, "setMainController:", self);
    vcProgress = self->_vcProgress;
  }
  sub_100117584(self->_vcNav, vcProgress, 0);
}

- (void)showTryAgainUI
{
  TVLatencySetupTryAgainViewController *vcTryAgain;
  TVLatencySetupTryAgainViewController *v4;
  TVLatencySetupTryAgainViewController *v5;

  if (dword_1001A8EB8 <= 30 && (dword_1001A8EB8 != -1 || _LogCategory_Initialize(&dword_1001A8EB8, 30)))
    LogPrintF(&dword_1001A8EB8, "-[TVLatencySetupMainController showTryAgainUI]", 30, "TryAgain UI\n");
  vcTryAgain = self->_vcTryAgain;
  if (!vcTryAgain)
  {
    v4 = (TVLatencySetupTryAgainViewController *)objc_claimAutoreleasedReturnValue(-[UIStoryboard instantiateViewControllerWithIdentifier:](self->_storyboard, "instantiateViewControllerWithIdentifier:", CFSTR("TryAgain")));
    v5 = self->_vcTryAgain;
    self->_vcTryAgain = v4;

    -[SVSBaseViewController setMainController:](self->_vcTryAgain, "setMainController:", self);
    vcTryAgain = self->_vcTryAgain;
  }
  sub_100117584(self->_vcNav, vcTryAgain, 0);
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (NSUUID)deviceIdentifier
{
  return self->_deviceIdentifier;
}

- (void)setDeviceIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (SFDeviceSetupTVLatencySession)latencySetupSession
{
  return self->_latencySetupSession;
}

- (void)setLatencySetupSession:(id)a3
{
  objc_storeStrong((id *)&self->_latencySetupSession, a3);
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

- (unsigned)deviceActionType
{
  return self->_deviceActionType;
}

- (void)setDeviceActionType:(unsigned __int8)a3
{
  self->_deviceActionType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_latencySetupSession, 0);
  objc_storeStrong((id *)&self->_deviceIdentifier, 0);
  objc_storeStrong((id *)&self->_vcTryAgain, 0);
  objc_storeStrong((id *)&self->_vcStart, 0);
  objc_storeStrong((id *)&self->_vcProgress, 0);
  objc_storeStrong((id *)&self->_vcNav, 0);
  objc_storeStrong((id *)&self->_vcDone, 0);
  objc_storeStrong((id *)&self->_vcAuth, 0);
  objc_storeStrong((id *)&self->_storyboard, 0);
}

@end
