@implementation PasswordPickerMainController

- (BOOL)_shouldRemoveViewFromHierarchyOnDisappear
{
  return 0;
}

- (unint64_t)supportedInterfaceOrientations
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PasswordPickerMainController view](self, "view"));
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

- (void)_willAppearInRemoteViewController
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PasswordPickerMainController;
  -[SVSBaseMainController _willAppearInRemoteViewController](&v4, "_willAppearInRemoteViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PasswordPickerMainController _remoteViewControllerProxy](self, "_remoteViewControllerProxy"));
  objc_msgSend(v3, "setAllowsAlertItems:", 1);
  objc_msgSend(v3, "setAllowsAlertStacking:", 1);
  objc_msgSend(v3, "setStatusBarHidden:withDuration:", 0, 0.0);

}

- (void)configureWithContext:(id)a3 completion:(id)a4
{
  NSDictionary *v6;
  NSDictionary *userInfo;
  NSDictionary *v8;
  CFTypeID TypeID;
  uint64_t TypedValue;
  void *v11;
  NSDictionary *v12;
  CFTypeID v13;
  uint64_t v14;
  void *v15;
  NSDictionary *v16;
  CFTypeID v17;
  uint64_t v18;
  void *v19;
  NSDictionary *v20;
  CFTypeID v21;
  uint64_t v22;
  void *v23;
  NSDictionary *v24;
  CFTypeID v25;
  uint64_t v26;
  void *v27;
  void *v28;
  NSArray *v29;
  NSArray *contextAssociatedDomains;
  SFRemoteAutoFillSessionHelper *v31;
  SFRemoteAutoFillSessionHelper *helper;
  void (**v33)(void);

  v33 = (void (**)(void))a4;
  v6 = (NSDictionary *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "userInfo"));
  userInfo = self->super._userInfo;
  self->super._userInfo = v6;

  if (dword_1001A8748 <= 30 && (dword_1001A8748 != -1 || _LogCategory_Initialize(&dword_1001A8748, 30)))
    LogPrintF(&dword_1001A8748, "-[PasswordPickerMainController configureWithContext:completion:]", 30, "Main configuration: %@\n", self->super._userInfo);
  v8 = self->super._userInfo;
  TypeID = CFStringGetTypeID();
  TypedValue = CFDictionaryGetTypedValue(v8, CFSTR("bundleID"), TypeID, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue(TypedValue);
  if (v11)
    objc_storeStrong((id *)&self->_contextBundleID, v11);
  v12 = self->super._userInfo;
  v13 = CFStringGetTypeID();
  v14 = CFDictionaryGetTypedValue(v12, CFSTR("localizedAppName"), v13, 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue(v14);

  if (v15)
    objc_storeStrong((id *)&self->_contextLocalizedAppName, v15);
  v16 = self->super._userInfo;
  v17 = CFStringGetTypeID();
  v18 = CFDictionaryGetTypedValue(v16, CFSTR("unlocalizedAppName"), v17, 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue(v18);

  if (v19)
    objc_storeStrong((id *)&self->_contextUnlocalizedAppName, v19);
  v20 = self->super._userInfo;
  v21 = CFStringGetTypeID();
  v22 = CFDictionaryGetTypedValue(v20, CFSTR("urlStr"), v21, 0);
  v23 = (void *)objc_claimAutoreleasedReturnValue(v22);

  if (v23)
    objc_storeStrong((id *)&self->_contextURL, v23);
  v24 = self->super._userInfo;
  v25 = CFArrayGetTypeID();
  v26 = CFDictionaryGetTypedValue(v24, CFSTR("associatedDomains"), v25, 0);
  v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
  v28 = v27;
  if (v27)
  {
    v29 = (NSArray *)objc_msgSend(v27, "copy");
    contextAssociatedDomains = self->_contextAssociatedDomains;
    self->_contextAssociatedDomains = v29;

  }
  v31 = (SFRemoteAutoFillSessionHelper *)objc_alloc_init((Class)SFRemoteAutoFillSessionHelper);
  helper = self->_helper;
  self->_helper = v31;

  -[SFRemoteAutoFillSessionHelper activateWithCompletion:](self->_helper, "activateWithCompletion:", &stru_10017D718);
  if (v33)
    v33[2]();

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
          -[PasswordPickerMainController _handleHomeButtonPressed](self, "_handleHomeButtonPressed");
        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (void)_handleHomeButtonPressed
{
  if (dword_1001A8748 <= 30 && (dword_1001A8748 != -1 || _LogCategory_Initialize(&dword_1001A8748, 30)))
    LogPrintF(&dword_1001A8748, "-[PasswordPickerMainController _handleHomeButtonPressed]", 30, "Home button");
  -[PasswordPickerMainController dismiss:](self, "dismiss:", 4);
}

- (void)viewDidAppear:(BOOL)a3
{
  _BOOL8 v3;
  _SFAppAutoFillPasswordViewController *v5;
  _SFAppAutoFillPasswordViewController *vcPicker;
  void *v7;
  char v8;
  _SFAppAutoFillPasswordViewController *v9;
  _QWORD v10[5];
  objc_super v11;

  v3 = a3;
  if (dword_1001A8748 <= 30 && (dword_1001A8748 != -1 || _LogCategory_Initialize(&dword_1001A8748, 30)))
    LogPrintF(&dword_1001A8748, "-[PasswordPickerMainController viewDidAppear:]", 30, "Main ViewDidAppear");
  v11.receiver = self;
  v11.super_class = (Class)PasswordPickerMainController;
  -[PasswordPickerMainController viewDidAppear:](&v11, "viewDidAppear:", v3);
  v5 = (_SFAppAutoFillPasswordViewController *)objc_alloc_init(off_1001A87B8());
  vcPicker = self->_vcPicker;
  self->_vcPicker = v5;

  -[_SFAppAutoFillPasswordViewController setDelegate:](self->_vcPicker, "setDelegate:", self);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", self->_contextURL));
  if (v7)
    -[_SFAppAutoFillPasswordViewController setWebViewURL:](self->_vcPicker, "setWebViewURL:", v7);
  if (self->_contextBundleID)
    -[_SFAppAutoFillPasswordViewController setRemoteAppID:](self->_vcPicker, "setRemoteAppID:");
  if (self->_contextLocalizedAppName)
    -[_SFAppAutoFillPasswordViewController setRemoteLocalizedAppName:](self->_vcPicker, "setRemoteLocalizedAppName:");
  if (self->_contextUnlocalizedAppName)
    -[_SFAppAutoFillPasswordViewController setRemoteUnlocalizedAppName:](self->_vcPicker, "setRemoteUnlocalizedAppName:");
  v8 = objc_opt_respondsToSelector(self->_vcPicker, "setExternallyVerifiedAndApprovedSharedWebCredentialsDomains:");
  if (self->_contextAssociatedDomains && (v8 & 1) != 0)
    -[_SFAppAutoFillPasswordViewController setExternallyVerifiedAndApprovedSharedWebCredentialsDomains:](self->_vcPicker, "setExternallyVerifiedAndApprovedSharedWebCredentialsDomains:");
  -[_SFAppAutoFillPasswordViewController setAuthenticationGracePeriod:](self->_vcPicker, "setAuthenticationGracePeriod:", 45.0);
  v9 = self->_vcPicker;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1000FDDF0;
  v10[3] = &unk_10017DF28;
  v10[4] = self;
  -[_SFAppAutoFillPasswordViewController authenticateToPresentInPopover:completion:](v9, "authenticateToPresentInPopover:completion:", 1, v10);

}

- (void)viewDidDisappear:(BOOL)a3
{
  _BOOL8 v3;
  SFRemoteAutoFillSessionHelper *helper;
  NSString *contextBundleID;
  NSString *contextLocalizedAppName;
  NSString *contextUnlocalizedAppName;
  NSString *contextURL;
  _SFAppAutoFillPasswordViewController *vcPicker;
  void *v11;
  objc_super v12;

  v3 = a3;
  if (dword_1001A8748 <= 30 && (dword_1001A8748 != -1 || _LogCategory_Initialize(&dword_1001A8748, 30)))
    LogPrintF(&dword_1001A8748, "-[PasswordPickerMainController viewDidDisappear:]", 30, "Main ViewDidDisappear");
  if (!self->_dismissed)
  {
    if (dword_1001A8748 <= 30
      && (dword_1001A8748 != -1 || _LogCategory_Initialize(&dword_1001A8748, 30)))
    {
      LogPrintF(&dword_1001A8748, "-[PasswordPickerMainController viewDidDisappear:]", 30, "Main disappeared without dismiss (device locked?)\n");
    }
    -[PasswordPickerMainController dismiss:](self, "dismiss:", 21);
  }
  -[SFRemoteAutoFillSessionHelper invalidate](self->_helper, "invalidate");
  helper = self->_helper;
  self->_helper = 0;

  contextBundleID = self->_contextBundleID;
  self->_contextBundleID = 0;

  contextLocalizedAppName = self->_contextLocalizedAppName;
  self->_contextLocalizedAppName = 0;

  contextUnlocalizedAppName = self->_contextUnlocalizedAppName;
  self->_contextUnlocalizedAppName = 0;

  contextURL = self->_contextURL;
  self->_contextURL = 0;

  vcPicker = self->_vcPicker;
  self->_vcPicker = 0;

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[PasswordPickerMainController _remoteViewControllerProxy](self, "_remoteViewControllerProxy"));
  objc_msgSend(v11, "setStatusBarHidden:withDuration:", 0, 0.0);

  v12.receiver = self;
  v12.super_class = (Class)PasswordPickerMainController;
  -[SVSBaseMainController viewDidDisappear:](&v12, "viewDidDisappear:", v3);
}

- (void)dismiss:(int)a3
{
  -[PasswordPickerMainController dismiss:completion:](self, "dismiss:completion:", *(_QWORD *)&a3, 0);
}

- (void)dismiss:(int)a3 completion:(id)a4
{
  id v6;
  void *v7;
  SFRemoteAutoFillSessionHelper *helper;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;

  v6 = a4;
  v7 = v6;
  if (!self->_dismissed)
  {
    self->_dismissed = 1;
    v12 = v6;
    if (dword_1001A8748 <= 30
      && (dword_1001A8748 != -1 || _LogCategory_Initialize(&dword_1001A8748, 30)))
    {
      LogPrintF(&dword_1001A8748, "-[PasswordPickerMainController dismiss:completion:]", 30, "Dismiss: %d", a3);
    }
    if (!self->_passwordPicked)
    {
      helper = self->_helper;
      v9 = NSErrorWithOSStatusF(4294960573, "User did not select a credential");
      v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
      -[SFRemoteAutoFillSessionHelper serverDidPickUsername:password:error:](helper, "serverDidPickUsername:password:error:", 0, 0, v10);

    }
    -[PasswordPickerMainController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, v12);
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[PasswordPickerMainController _remoteViewControllerProxy](self, "_remoteViewControllerProxy"));
    objc_msgSend(v11, "dismiss");

    v7 = v12;
  }

}

- (void)handlePasswordPicked:(id)a3
{
  SFRemoteAutoFillSessionHelper *helper;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  if (dword_1001A8748 <= 30 && (dword_1001A8748 != -1 || _LogCategory_Initialize(&dword_1001A8748, 30)))
    LogPrintF(&dword_1001A8748, "-[PasswordPickerMainController handlePasswordPicked:]", 30, "Password picked\n");
  self->_passwordPicked = 1;
  helper = self->_helper;
  if (helper)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "user"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "password"));
    -[SFRemoteAutoFillSessionHelper serverDidPickUsername:password:error:](helper, "serverDidPickUsername:password:error:", v5, v6, 0);

  }
  else if (dword_1001A8748 <= 60
         && (dword_1001A8748 != -1 || _LogCategory_Initialize(&dword_1001A8748, 60)))
  {
    LogPrintF(&dword_1001A8748, "-[PasswordPickerMainController handlePasswordPicked:]", 60, "### User selected credential, but no helper?");
  }

}

- (void)passwordViewControllerDidFinish:(id)a3
{
  id v4;

  v4 = a3;
  if (dword_1001A8748 <= 30 && (dword_1001A8748 != -1 || _LogCategory_Initialize(&dword_1001A8748, 30)))
    LogPrintF(&dword_1001A8748, "-[PasswordPickerMainController passwordViewControllerDidFinish:]", 30, "Password picker VC finished\n");
  -[PasswordPickerMainController dismiss:](self, "dismiss:", 0);

}

- (void)passwordViewController:(id)a3 selectedCredential:(id)a4
{
  id v6;
  id v7;
  _SFAppAutoFillPasswordViewController *vcPicker;
  _SFAppAutoFillPasswordViewController *v9;
  _SFAppAutoFillPasswordViewController *v10;
  _SFAppAutoFillPasswordViewController *v11;
  unsigned __int8 v12;
  id v13;
  _QWORD v14[5];
  id v15;

  v6 = a3;
  v7 = a4;
  vcPicker = self->_vcPicker;
  v9 = (_SFAppAutoFillPasswordViewController *)v6;
  v10 = vcPicker;
  if (v10 == v9)
  {

  }
  else
  {
    v11 = v10;
    if ((v9 == 0) != (v10 != 0))
    {
      v12 = -[_SFAppAutoFillPasswordViewController isEqual:](v9, "isEqual:", v10);

      if ((v12 & 1) != 0)
        goto LABEL_11;
    }
    else
    {

    }
    if (dword_1001A8748 <= 60
      && (dword_1001A8748 != -1 || _LogCategory_Initialize(&dword_1001A8748, 60)))
    {
      LogPrintF(&dword_1001A8748, "-[PasswordPickerMainController passwordViewController:selectedCredential:]", 60, "Received credential from unknown VC?");
    }
  }
LABEL_11:
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1000FDD7C;
  v14[3] = &unk_10017E1A0;
  v14[4] = self;
  v15 = v7;
  v13 = v7;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v14);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vcPicker, 0);
  objc_storeStrong((id *)&self->_helper, 0);
  objc_storeStrong((id *)&self->_contextURL, 0);
  objc_storeStrong((id *)&self->_contextAssociatedDomains, 0);
  objc_storeStrong((id *)&self->_contextUnlocalizedAppName, 0);
  objc_storeStrong((id *)&self->_contextLocalizedAppName, 0);
  objc_storeStrong((id *)&self->_contextBundleID, 0);
}

+ (BOOL)_isSecureForRemoteViewService
{
  return 1;
}

@end
