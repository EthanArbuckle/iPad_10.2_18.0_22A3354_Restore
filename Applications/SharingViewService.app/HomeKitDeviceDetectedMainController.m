@implementation HomeKitDeviceDetectedMainController

- (void)configureWithContext:(id)a3 completion:(id)a4
{
  NSDictionary *v6;
  NSDictionary *userInfo;
  void *v8;
  id v9;

  v9 = a4;
  v6 = (NSDictionary *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "userInfo"));
  userInfo = self->super._userInfo;
  self->super._userInfo = v6;

  if (dword_1001A81E0 <= 30 && (dword_1001A81E0 != -1 || _LogCategory_Initialize(&dword_1001A81E0, 30)))
    LogPrintF(&dword_1001A81E0, "-[HomeKitDeviceDetectedMainController configureWithContext:completion:]", 30, "Main configuration: %@\n", self->super._userInfo);
  v8 = v9;
  if (v9)
  {
    (*((void (**)(id))v9 + 2))(v9);
    v8 = v9;
  }

}

- (unint64_t)supportedInterfaceOrientations
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[HomeKitDeviceDetectedMainController view](self, "view"));
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
  HomeKitDeviceDetectedStartViewController *v12;
  HomeKitDeviceDetectedStartViewController *vcStart;
  objc_super v14;

  v3 = a3;
  if (dword_1001A81E0 <= 30 && (dword_1001A81E0 != -1 || _LogCategory_Initialize(&dword_1001A81E0, 30)))
    LogPrintF(&dword_1001A81E0, "-[HomeKitDeviceDetectedMainController viewDidAppear:]", 30, "Main ViewDidAppear\n");
  v14.receiver = self;
  v14.super_class = (Class)HomeKitDeviceDetectedMainController;
  -[HomeKitDeviceDetectedMainController viewDidAppear:](&v14, "viewDidAppear:", v3);
  v5 = (UIStoryboard *)objc_claimAutoreleasedReturnValue(+[UIStoryboard storyboardWithName:bundle:](UIStoryboard, "storyboardWithName:bundle:", CFSTR("HomeKitDeviceDetected"), 0));
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
  v12 = (HomeKitDeviceDetectedStartViewController *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "firstObject"));
  vcStart = self->_vcStart;
  self->_vcStart = v12;

  -[SVSBaseViewController setMainController:](self->_vcStart, "setMainController:", self);
  -[HomeKitDeviceDetectedMainController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", self->_vcNav, 1, 0);
}

- (void)viewDidDisappear:(BOOL)a3
{
  _BOOL8 v3;
  UIStoryboard *storyboard;
  SVSCommonNavController *vcNav;
  HomeKitDeviceDetectedStartViewController *vcStart;
  objc_super v8;

  v3 = a3;
  if (dword_1001A81E0 <= 30 && (dword_1001A81E0 != -1 || _LogCategory_Initialize(&dword_1001A81E0, 30)))
    LogPrintF(&dword_1001A81E0, "-[HomeKitDeviceDetectedMainController viewDidDisappear:]", 30, "Main ViewDidDisappear\n");
  if (!self->_dismissed)
  {
    if (dword_1001A81E0 <= 30
      && (dword_1001A81E0 != -1 || _LogCategory_Initialize(&dword_1001A81E0, 30)))
    {
      LogPrintF(&dword_1001A81E0, "-[HomeKitDeviceDetectedMainController viewDidDisappear:]", 30, "Main disappeared without dismiss (device locked?)...dismissing UI\n");
    }
    -[HomeKitDeviceDetectedMainController dismiss:](self, "dismiss:", 21);
  }
  storyboard = self->_storyboard;
  self->_storyboard = 0;

  vcNav = self->_vcNav;
  self->_vcNav = 0;

  -[SVSBaseViewController setMainController:](self->_vcStart, "setMainController:", 0);
  vcStart = self->_vcStart;
  self->_vcStart = 0;

  v8.receiver = self;
  v8.super_class = (Class)HomeKitDeviceDetectedMainController;
  -[SVSBaseMainController viewDidDisappear:](&v8, "viewDidDisappear:", v3);
}

- (void)dismiss:(int)a3
{
  -[HomeKitDeviceDetectedMainController dismissAnimated:](self, "dismissAnimated:", a3 != 19);
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
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[HomeKitDeviceDetectedMainController _remoteViewControllerProxy](self, "_remoteViewControllerProxy"));
    v6 = v5;
    vcNav = self->_vcNav;
    if (vcNav)
    {
      v8[0] = _NSConcreteStackBlock;
      v8[1] = 3221225472;
      v8[2] = sub_1000E04AC;
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
          if (dword_1001A81E0 <= 30
            && (dword_1001A81E0 != -1 || _LogCategory_Initialize(&dword_1001A81E0, 30)))
          {
            LogPrintF(&dword_1001A81E0, "-[HomeKitDeviceDetectedMainController handleButtonActions:]", 30, "Home button\n");
          }
          -[HomeKitDeviceDetectedMainController dismiss:](self, "dismiss:", 4);
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vcStart, 0);
  objc_storeStrong((id *)&self->_vcNav, 0);
  objc_storeStrong((id *)&self->_storyboard, 0);
}

@end
