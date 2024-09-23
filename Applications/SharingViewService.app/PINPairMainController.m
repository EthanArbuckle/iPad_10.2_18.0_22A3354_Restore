@implementation PINPairMainController

- (void)configureWithContext:(id)a3 completion:(id)a4
{
  NSDictionary *v6;
  NSDictionary *userInfo;
  NSDictionary *v8;
  CFTypeID TypeID;
  uint64_t TypedValue;
  uint64_t v11;
  void *v12;
  void (**v13)(void);

  v13 = (void (**)(void))a4;
  v6 = (NSDictionary *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "userInfo"));
  userInfo = self->super._userInfo;
  self->super._userInfo = v6;

  if (dword_1001A86D8 <= 30 && (dword_1001A86D8 != -1 || _LogCategory_Initialize(&dword_1001A86D8, 30)))
    LogPrintF(&dword_1001A86D8, "-[PINPairMainController configureWithContext:completion:]", 30, "Proxy configuration: %@\n", self->super._userInfo);
  v8 = self->super._userInfo;
  TypeID = CFStringGetTypeID();
  TypedValue = CFDictionaryGetTypedValue(v8, CFSTR("testParams"), TypeID, 0);
  v11 = objc_claimAutoreleasedReturnValue(TypedValue);
  v12 = (void *)v11;
  if (v11)
    self->_testFlags = SFTestFlagsFromString(v11);
  if (v13)
    v13[2]();

}

- (unint64_t)supportedInterfaceOrientations
{
  void *v2;
  void *v3;
  unint64_t v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PINPairMainController view](self, "view"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "window"));

  if (v3)
    v4 = (1 << (char)objc_msgSend(UIApp, "activeInterfaceOrientation"));
  else
    v4 = 30;

  return v4;
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
  PINPairStartViewController *v12;
  PINPairStartViewController *vcStart;
  objc_super v14;

  v3 = a3;
  if (dword_1001A86D8 <= 30 && (dword_1001A86D8 != -1 || _LogCategory_Initialize(&dword_1001A86D8, 30)))
    LogPrintF(&dword_1001A86D8, "-[PINPairMainController viewDidAppear:]", 30, "Proxy ViewDidAppear\n");
  v14.receiver = self;
  v14.super_class = (Class)PINPairMainController;
  -[PINPairMainController viewDidAppear:](&v14, "viewDidAppear:", v3);
  v5 = (UIStoryboard *)objc_claimAutoreleasedReturnValue(+[UIStoryboard storyboardWithName:bundle:](UIStoryboard, "storyboardWithName:bundle:", CFSTR("PINPair"), 0));
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
  v12 = (PINPairStartViewController *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "firstObject"));
  vcStart = self->_vcStart;
  self->_vcStart = v12;

  -[SVSBaseViewController setMainController:](self->_vcStart, "setMainController:", self);
  -[PINPairMainController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", self->_vcNav, 1, 0);
}

- (void)viewDidDisappear:(BOOL)a3
{
  _BOOL8 v3;
  SFPINPairSession *pairingSession;
  UIStoryboard *storyboard;
  PINPairAuthViewController *vcAuth;
  PINPairDoneViewController *vcDone;
  SVSCommonNavController *vcNav;
  PINPairStartViewController *vcStart;
  objc_super v11;

  v3 = a3;
  if (dword_1001A86D8 <= 30 && (dword_1001A86D8 != -1 || _LogCategory_Initialize(&dword_1001A86D8, 30)))
    LogPrintF(&dword_1001A86D8, "-[PINPairMainController viewDidDisappear:]", 30, "Proxy ViewDidDisappear\n");
  if (!self->_dismissed)
  {
    if (dword_1001A86D8 <= 30
      && (dword_1001A86D8 != -1 || _LogCategory_Initialize(&dword_1001A86D8, 30)))
    {
      LogPrintF(&dword_1001A86D8, "-[PINPairMainController viewDidDisappear:]", 30, "Proxy disappeared without dismiss (device locked?)...dismissing UI\n");
    }
    -[PINPairMainController dismiss:](self, "dismiss:", 21);
  }
  -[SFPINPairSession invalidate](self->_pairingSession, "invalidate");
  pairingSession = self->_pairingSession;
  self->_pairingSession = 0;

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

  -[SVSBaseViewController setMainController:](self->_vcStart, "setMainController:", 0);
  vcStart = self->_vcStart;
  self->_vcStart = 0;

  v11.receiver = self;
  v11.super_class = (Class)PINPairMainController;
  -[SVSBaseMainController viewDidDisappear:](&v11, "viewDidDisappear:", v3);
}

- (void)dismiss:(int)a3
{
  -[PINPairMainController dismissAnimated:](self, "dismissAnimated:", a3 != 19);
}

- (void)dismissAnimated:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  SVSCommonNavController *vcNav;
  _QWORD v8[4];
  id v9;

  if (!self->_dismissed)
  {
    v3 = a3;
    self->_dismissed = 1;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[PINPairMainController _remoteViewControllerProxy](self, "_remoteViewControllerProxy"));
    v6 = v5;
    vcNav = self->_vcNav;
    if (vcNav)
    {
      v8[0] = _NSConcreteStackBlock;
      v8[1] = 3221225472;
      v8[2] = sub_1000FA6DC;
      v8[3] = &unk_10017E1F0;
      v9 = v5;
      -[SVSCommonNavController dismissViewControllerAnimated:completion:](vcNav, "dismissViewControllerAnimated:completion:", v3, v8);

    }
    else
    {
      objc_msgSend(v5, "dismiss");
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
          if (dword_1001A86D8 <= 30
            && (dword_1001A86D8 != -1 || _LogCategory_Initialize(&dword_1001A86D8, 30)))
          {
            LogPrintF(&dword_1001A86D8, "-[PINPairMainController handleButtonActions:]", 30, "Home button\n");
          }
          -[PINPairMainController dismiss:](self, "dismiss:", 4);
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (void)showAuthUIWithFlags:(unsigned int)a3 throttleSeconds:(int)a4
{
  PINPairAuthViewController *vcAuth;
  PINPairAuthViewController *v6;
  PINPairAuthViewController *v7;

  vcAuth = self->_vcAuth;
  if (vcAuth)
  {
    -[PINPairAuthViewController showWithFlags:throttleSeconds:](vcAuth, "showWithFlags:throttleSeconds:", *(_QWORD *)&a3, *(_QWORD *)&a4);
  }
  else
  {
    v6 = (PINPairAuthViewController *)objc_claimAutoreleasedReturnValue(-[UIStoryboard instantiateViewControllerWithIdentifier:](self->_storyboard, "instantiateViewControllerWithIdentifier:", CFSTR("Auth"), *(_QWORD *)&a4));
    v7 = self->_vcAuth;
    self->_vcAuth = v6;

    -[SVSBaseViewController setMainController:](self->_vcAuth, "setMainController:", self);
    sub_100117584(self->_vcNav, self->_vcAuth, 0);
  }
}

- (void)showDoneUI:(int)a3
{
  uint64_t v3;
  PINPairDoneViewController *vcDone;
  PINPairDoneViewController *v6;
  PINPairDoneViewController *v7;

  v3 = *(_QWORD *)&a3;
  if (dword_1001A86D8 <= 30 && (dword_1001A86D8 != -1 || _LogCategory_Initialize(&dword_1001A86D8, 30)))
    LogPrintF(&dword_1001A86D8, "-[PINPairMainController showDoneUI:]", 30, "Show done UI: %#m\n", v3);
  vcDone = self->_vcDone;
  if (!vcDone)
  {
    v6 = (PINPairDoneViewController *)objc_claimAutoreleasedReturnValue(-[UIStoryboard instantiateViewControllerWithIdentifier:](self->_storyboard, "instantiateViewControllerWithIdentifier:", CFSTR("Done")));
    v7 = self->_vcDone;
    self->_vcDone = v6;

    -[SVSBaseViewController setMainController:](self->_vcDone, "setMainController:", self);
    vcDone = self->_vcDone;
  }
  -[PINPairDoneViewController setStatus:](vcDone, "setStatus:", v3);
  sub_100117584(self->_vcNav, self->_vcDone, 0);
}

- (void)_startPairing:(id)a3
{
  id v4;
  SFPINPairSession *v5;
  SFPINPairSession *pairingSession;
  _QWORD v7[5];
  _QWORD v8[5];

  v4 = a3;
  if (dword_1001A86D8 <= 30 && (dword_1001A86D8 != -1 || _LogCategory_Initialize(&dword_1001A86D8, 30)))
    LogPrintF(&dword_1001A86D8, "-[PINPairMainController _startPairing:]", 30, "Start pairing with %@\n", v4);
  -[SFPINPairSession invalidate](self->_pairingSession, "invalidate");
  v5 = (SFPINPairSession *)objc_alloc_init((Class)SFPINPairSession);
  pairingSession = self->_pairingSession;
  self->_pairingSession = v5;

  -[SFPINPairSession setPeerDevice:](self->_pairingSession, "setPeerDevice:", v4);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000FA584;
  v8[3] = &unk_10017E070;
  v8[4] = self;
  -[SFPINPairSession setCompletionHandler:](self->_pairingSession, "setCompletionHandler:", v8);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000FA648;
  v7[3] = &unk_10017E178;
  v7[4] = self;
  -[SFPINPairSession setPromptForPINHandler:](self->_pairingSession, "setPromptForPINHandler:", v7);
  -[SFPINPairSession activate](self->_pairingSession, "activate");

}

- (SFPINPairSession)pairingSession
{
  return self->_pairingSession;
}

- (void)setPairingSession:(id)a3
{
  objc_storeStrong((id *)&self->_pairingSession, a3);
}

- (unint64_t)testFlags
{
  return self->_testFlags;
}

- (void)setTestFlags:(unint64_t)a3
{
  self->_testFlags = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pairingSession, 0);
  objc_storeStrong((id *)&self->_vcStart, 0);
  objc_storeStrong((id *)&self->_vcNav, 0);
  objc_storeStrong((id *)&self->_vcAuth, 0);
  objc_storeStrong((id *)&self->_vcDone, 0);
  objc_storeStrong((id *)&self->_storyboard, 0);
}

@end
