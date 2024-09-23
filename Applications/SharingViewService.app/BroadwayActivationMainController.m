@implementation BroadwayActivationMainController

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)configureWithContext:(id)a3 completion:(id)a4
{
  void (**v6)(_QWORD);
  NSDictionary *v7;
  NSDictionary *userInfo;
  NSDictionary *v9;
  CFTypeID TypeID;
  uint64_t TypedValue;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  NSDictionary *v17;
  CFTypeID v18;
  uint64_t v19;
  void *v20;
  objc_class *v21;
  void *v22;
  _QWORD v23[5];

  v6 = (void (**)(_QWORD))a4;
  v7 = (NSDictionary *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "userInfo"));
  userInfo = self->super._userInfo;
  self->super._userInfo = v7;

  if (dword_1001A8BE8 <= 30 && (dword_1001A8BE8 != -1 || _LogCategory_Initialize(&dword_1001A8BE8, 30)))
    LogPrintF(&dword_1001A8BE8, "-[BroadwayActivationMainController configureWithContext:completion:]", 30, "Proxy configuration: %@", self->super._userInfo);
  v9 = self->super._userInfo;
  TypeID = CFStringGetTypeID();
  TypedValue = CFDictionaryGetTypedValue(v9, CFSTR("testParams"), TypeID, 0);
  v12 = objc_claimAutoreleasedReturnValue(TypedValue);
  v13 = (void *)v12;
  if (!v12)
  {
    self->_test = 0;
LABEL_10:
    if (!v6)
      goto LABEL_12;
LABEL_11:
    v6[2](v6);
    goto LABEL_12;
  }
  v14 = SFTestFlagsFromString(v12);
  self->_test = v14 & 1;
  if ((v14 & 1) == 0)
    goto LABEL_10;
  self->_noCardTest = BYTE4(v14) & 1;
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](self->super._userInfo, "objectForKeyedSubscript:", CFSTR("activationResult")));
  if (v15)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](self->super._userInfo, "objectForKeyedSubscript:", CFSTR("activationResult")));
    self->_forcedActivationResult = (int64_t)objc_msgSend(v16, "integerValue");

  }
  else
  {
    self->_forcedActivationResult = 999;
  }

  if (v6)
    goto LABEL_11;
LABEL_12:
  v17 = self->super._userInfo;
  v18 = CFStringGetTypeID();
  v19 = CFDictionaryGetTypedValue(v17, CFSTR("activationCode"), v18, 0);
  v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
  v21 = -[objc_class sharedInstance](off_1001A8C58(), "sharedInstance");
  v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_100110CCC;
  v23[3] = &unk_10017DD18;
  v23[4] = self;
  objc_msgSend(v22, "physicalCardForFeatureIdentifier:activationCode:completion:", 2, v20, v23);

}

- (unint64_t)supportedInterfaceOrientations
{
  void *v2;
  void *v3;
  unint64_t v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BroadwayActivationMainController view](self, "view"));
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
  objc_super v5;

  v3 = a3;
  self->_appeared = 1;
  if (dword_1001A8BE8 <= 30 && (dword_1001A8BE8 != -1 || _LogCategory_Initialize(&dword_1001A8BE8, 30)))
    LogPrintF(&dword_1001A8BE8, "-[BroadwayActivationMainController viewDidAppear:]", 30, "Proxy ViewDidAppear");
  v5.receiver = self;
  v5.super_class = (Class)BroadwayActivationMainController;
  -[BroadwayActivationMainController viewDidAppear:](&v5, "viewDidAppear:", v3);
  -[BroadwayActivationMainController presentAppropriateViewControllerIfReady](self, "presentAppropriateViewControllerIfReady");
}

- (void)presentAppropriateViewControllerIfReady
{
  UIStoryboard *v3;
  UIStoryboard *storyboard;
  SVSCommonNavController *v5;
  SVSCommonNavController *vcNav;
  void *v7;
  unint64_t v8;
  PKPhysicalCard *physicalCard;
  void *v10;
  void *v11;
  char *v12;
  UIStoryboard *v13;
  const __CFString *v14;
  BroadwayActivationStartViewController *v15;
  BroadwayActivationStartViewController *v16;
  SVSCommonNavController *v17;
  void *v18;
  void *v19;
  BroadwayActivationStartViewController *v20;
  BroadwayActivationStartViewController *vcStart;
  BroadwayActivationStartViewController *v22;

  if (!self->_appeared || !self->_physicalCard)
    return;
  v3 = (UIStoryboard *)objc_claimAutoreleasedReturnValue(+[UIStoryboard storyboardWithName:bundle:](UIStoryboard, "storyboardWithName:bundle:", CFSTR("BroadwayActivation"), 0));
  storyboard = self->_storyboard;
  self->_storyboard = v3;

  v5 = (SVSCommonNavController *)objc_claimAutoreleasedReturnValue(-[UIStoryboard instantiateInitialViewController](self->_storyboard, "instantiateInitialViewController"));
  vcNav = self->_vcNav;
  self->_vcNav = v5;

  -[SVSCommonNavController setDelegate:](self->_vcNav, "setDelegate:", self);
  -[SVSCommonNavController setModalPresentationStyle:](self->_vcNav, "setModalPresentationStyle:", 4);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
  v8 = (unint64_t)objc_msgSend(v7, "userInterfaceIdiom");

  if ((v8 & 0xFFFFFFFFFFFFFFFBLL) == 1)
    -[SVSCommonNavController setModalTransitionStyle:](self->_vcNav, "setModalTransitionStyle:", 2);
  -[SVSCommonNavController setTransitioningDelegate:](self->_vcNav, "setTransitioningDelegate:", self->_vcNav);
  if (self->_noCardTest)
  {
    physicalCard = self->_physicalCard;
    self->_physicalCard = 0;

  }
  if (!self->_physicalCard)
  {
    v13 = self->_storyboard;
    v14 = CFSTR("NoCard");
LABEL_14:
    v15 = (BroadwayActivationStartViewController *)objc_claimAutoreleasedReturnValue(-[UIStoryboard instantiateViewControllerWithIdentifier:](v13, "instantiateViewControllerWithIdentifier:", v14));
    goto LABEL_15;
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](self->super._userInfo, "objectForKeyedSubscript:", CFSTR("physicalCard")));
  if (v10)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](self->super._userInfo, "objectForKeyedSubscript:", CFSTR("physicalCard")));
    v12 = (char *)objc_msgSend(v11, "unsignedIntegerValue");

  }
  else
  {
    v12 = (char *)-[PKPhysicalCard state](self->_physicalCard, "state");
  }

  if ((unint64_t)(v12 - 2) < 3)
  {
    v13 = self->_storyboard;
    v14 = CFSTR("AlreadyActivated");
    goto LABEL_14;
  }
  if (v12 == (char *)1)
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[SVSCommonNavController viewControllers](self->_vcNav, "viewControllers"));
    v20 = (BroadwayActivationStartViewController *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "firstObject"));
    vcStart = self->_vcStart;
    self->_vcStart = v20;

    v15 = self->_vcStart;
LABEL_15:
    v16 = v15;
    if (v15)
    {
      -[SVSBaseViewController setMainController:](v15, "setMainController:", self);
      v17 = self->_vcNav;
      v22 = v16;
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v22, 1));
      -[SVSCommonNavController setViewControllers:animated:](v17, "setViewControllers:animated:", v18, 0);

      -[BroadwayActivationMainController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", self->_vcNav, 1, 0);
      return;
    }
  }
  if (dword_1001A8BE8 <= 60 && (dword_1001A8BE8 != -1 || _LogCategory_Initialize(&dword_1001A8BE8, 60)))
    LogPrintF(&dword_1001A8BE8, "-[BroadwayActivationMainController presentAppropriateViewControllerIfReady]", 60, "Failed to load initial view controller");
  -[BroadwayActivationMainController dismissAnimated:completion:](self, "dismissAnimated:completion:", 0, 0);
}

- (void)viewDidDisappear:(BOOL)a3
{
  _BOOL8 v3;
  UIStoryboard *storyboard;
  BroadwayActivationDoneViewController *vcDone;
  BroadwayActivationFailedViewController *vcFailed;
  BroadwayActivationFailedNoConnectivityViewController *vcFailedNoConnectivity;
  BroadwayActivationStartViewController *vcStart;
  SVSCommonNavController *vcNav;
  objc_super v11;

  v3 = a3;
  if (dword_1001A8BE8 <= 30 && (dword_1001A8BE8 != -1 || _LogCategory_Initialize(&dword_1001A8BE8, 30)))
    LogPrintF(&dword_1001A8BE8, "-[BroadwayActivationMainController viewDidDisappear:]", 30, "Main ViewDidDisappear");
  if (!self->_dismissed)
  {
    if (dword_1001A8BE8 <= 30
      && (dword_1001A8BE8 != -1 || _LogCategory_Initialize(&dword_1001A8BE8, 30)))
    {
      LogPrintF(&dword_1001A8BE8, "-[BroadwayActivationMainController viewDidDisappear:]", 30, "Main disappeared without dismiss (device locked?)...dismissing UI");
    }
    -[BroadwayActivationMainController dismiss:](self, "dismiss:", 21);
  }
  storyboard = self->_storyboard;
  self->_storyboard = 0;

  -[SVSBaseViewController setMainController:](self->_vcDone, "setMainController:", 0);
  vcDone = self->_vcDone;
  self->_vcDone = 0;

  -[SVSBaseViewController setMainController:](self->_vcFailed, "setMainController:", 0);
  vcFailed = self->_vcFailed;
  self->_vcFailed = 0;

  -[SVSBaseViewController setMainController:](self->_vcFailedNoConnectivity, "setMainController:", 0);
  vcFailedNoConnectivity = self->_vcFailedNoConnectivity;
  self->_vcFailedNoConnectivity = 0;

  -[SVSBaseViewController setMainController:](self->_vcStart, "setMainController:", 0);
  vcStart = self->_vcStart;
  self->_vcStart = 0;

  vcNav = self->_vcNav;
  self->_vcNav = 0;

  self->_appeared = 0;
  v11.receiver = self;
  v11.super_class = (Class)BroadwayActivationMainController;
  -[SVSBaseMainController viewDidDisappear:](&v11, "viewDidDisappear:", v3);
}

- (void)dismiss:(int)a3
{
  -[BroadwayActivationMainController dismiss:completion:](self, "dismiss:completion:", *(_QWORD *)&a3, 0);
}

- (void)dismiss:(int)a3 completion:(id)a4
{
  -[BroadwayActivationMainController dismissAnimated:completion:](self, "dismissAnimated:completion:", a3 != 19, a4);
}

- (void)dismissAnimated:(BOOL)a3 completion:(id)a4
{
  _BOOL8 v4;
  void (**v6)(_QWORD);
  void *v7;
  void *v8;
  SVSCommonNavController *vcNav;
  _QWORD v10[4];
  id v11;
  void (**v12)(_QWORD);

  v4 = a3;
  v6 = (void (**)(_QWORD))a4;
  if (!self->_dismissed)
  {
    self->_dismissed = 1;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[BroadwayActivationMainController _remoteViewControllerProxy](self, "_remoteViewControllerProxy"));
    v8 = v7;
    vcNav = self->_vcNav;
    if (vcNav)
    {
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_100110C28;
      v10[3] = &unk_10017E100;
      v11 = v7;
      v12 = v6;
      -[SVSCommonNavController dismissViewControllerAnimated:completion:](vcNav, "dismissViewControllerAnimated:completion:", v4, v10);

    }
    else
    {
      objc_msgSend(v7, "dismiss");
      if (v6)
        v6[2](v6);
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
          if (dword_1001A8BE8 <= 30
            && (dword_1001A8BE8 != -1 || _LogCategory_Initialize(&dword_1001A8BE8, 30)))
          {
            LogPrintF(&dword_1001A8BE8, "-[BroadwayActivationMainController handleButtonActions:]", 30, "Home button");
          }
          -[BroadwayActivationMainController dismiss:](self, "dismiss:", 4);
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (void)showCompletedUI:(int64_t)a3
{
  const char *v5;
  uint64_t v6;
  void *vcFailedNoConnectivity;
  UIStoryboard *storyboard;
  const __CFString *v9;
  uint64_t v10;
  void *v11;
  void **p_vcNav;
  BroadwayActivationFailedViewController *vcFailed;
  BroadwayActivationFailedViewController *v14;
  BroadwayActivationFailedViewController *v15;

  if (dword_1001A8BE8 <= 30 && (dword_1001A8BE8 != -1 || _LogCategory_Initialize(&dword_1001A8BE8, 30)))
  {
    switch(a3)
    {
      case 0:
        v5 = "Success";
        break;
      case 1:
        v5 = "UnknownError";
        break;
      case 2:
        v5 = "NoPhysicalCardError";
        break;
      case 3:
        v5 = "ServicesUnavailableError";
        break;
      case 4:
        v5 = "NoInternetConnectionError";
        break;
      case 5:
        v5 = "NotYetShippedError";
        break;
      case 6:
        v5 = "AlreadyActivatedError";
        break;
      case 7:
        v5 = "IncorrectActivationCodeError";
        break;
      default:
        v5 = "Uninitialized";
        if (a3 != 999)
          v5 = "?";
        break;
    }
    LogPrintF(&dword_1001A8BE8, "-[BroadwayActivationMainController showCompletedUI:]", 30, "Show completed UI: %s", v5);
  }
  if (a3 == 4)
  {
    v6 = 64;
    vcFailedNoConnectivity = self->_vcFailedNoConnectivity;
    if (!vcFailedNoConnectivity)
    {
      storyboard = self->_storyboard;
      v9 = CFSTR("NoConnectivity");
      goto LABEL_24;
    }
LABEL_25:
    p_vcNav = (void **)&self->_vcNav;
    goto LABEL_29;
  }
  if (!a3)
  {
    v6 = 48;
    vcFailedNoConnectivity = self->_vcDone;
    if (!vcFailedNoConnectivity)
    {
      storyboard = self->_storyboard;
      v9 = CFSTR("Done");
LABEL_24:
      v10 = objc_claimAutoreleasedReturnValue(-[UIStoryboard instantiateViewControllerWithIdentifier:](storyboard, "instantiateViewControllerWithIdentifier:", v9));
      v11 = *(void **)&self->super.SBUIRemoteAlertServiceViewController_opaque[v6];
      *(_QWORD *)&self->super.SBUIRemoteAlertServiceViewController_opaque[v6] = v10;

      objc_msgSend(*(id *)&self->super.SBUIRemoteAlertServiceViewController_opaque[v6], "setMainController:", self);
      vcFailedNoConnectivity = *(void **)&self->super.SBUIRemoteAlertServiceViewController_opaque[v6];
      goto LABEL_25;
    }
    goto LABEL_25;
  }
  vcFailed = self->_vcFailed;
  if (!vcFailed)
  {
    v14 = (BroadwayActivationFailedViewController *)objc_claimAutoreleasedReturnValue(-[UIStoryboard instantiateViewControllerWithIdentifier:](self->_storyboard, "instantiateViewControllerWithIdentifier:", CFSTR("Failed")));
    v15 = self->_vcFailed;
    self->_vcFailed = v14;

    -[SVSBaseViewController setMainController:](self->_vcFailed, "setMainController:", self);
    vcFailed = self->_vcFailed;
  }
  -[BroadwayActivationFailedViewController setFailureResult:](vcFailed, "setFailureResult:", a3);
  p_vcNav = (void **)&self->_vcNav;
  vcFailedNoConnectivity = self->_vcFailed;
LABEL_29:
  sub_100117584(*p_vcNav, vcFailedNoConnectivity, 0);
}

- (void)retryActivation
{
  if (dword_1001A8BE8 <= 30 && (dword_1001A8BE8 != -1 || _LogCategory_Initialize(&dword_1001A8BE8, 30)))
    LogPrintF(&dword_1001A8BE8, "-[BroadwayActivationMainController retryActivation]", 30, "Show retry UI");
  -[BroadwayActivationStartViewController prepareForRetry](self->_vcStart, "prepareForRetry");
  if (-[BroadwayActivationMainController test](self, "test")
    && (id)-[BroadwayActivationMainController forcedActivationResult](self, "forcedActivationResult") != (id)999)
  {
    -[BroadwayActivationMainController setForcedActivationResult:](self, "setForcedActivationResult:", 0);
  }
  sub_100117584(self->_vcNav, self->_vcStart, 0);
}

- (PKPhysicalCard)physicalCard
{
  return self->_physicalCard;
}

- (void)setPhysicalCard:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (BOOL)test
{
  return self->_test;
}

- (void)setTest:(BOOL)a3
{
  self->_test = a3;
}

- (int64_t)forcedActivationResult
{
  return self->_forcedActivationResult;
}

- (void)setForcedActivationResult:(int64_t)a3
{
  self->_forcedActivationResult = a3;
}

- (BOOL)noCardTest
{
  return self->_noCardTest;
}

- (void)setNoCardTest:(BOOL)a3
{
  self->_noCardTest = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_physicalCard, 0);
  objc_storeStrong((id *)&self->_vcStart, 0);
  objc_storeStrong((id *)&self->_vcFailedNoConnectivity, 0);
  objc_storeStrong((id *)&self->_vcFailed, 0);
  objc_storeStrong((id *)&self->_vcDone, 0);
  objc_storeStrong((id *)&self->_vcNav, 0);
  objc_storeStrong((id *)&self->_storyboard, 0);
}

+ (BOOL)_isSecureForRemoteViewService
{
  return 1;
}

@end
