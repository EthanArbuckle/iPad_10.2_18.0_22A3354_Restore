@implementation SubCredentialActivationMainController

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)configureWithContext:(id)a3 completion:(id)a4
{
  void (**v6)(_QWORD);
  NSDictionary *v7;
  NSDictionary *userInfo;
  uint64_t *v9;
  NSDictionary *v10;
  CFTypeID TypeID;
  uint64_t TypedValue;
  void *v13;
  id v14;
  uint64_t v15;
  BOOL v16;
  uint64_t v17;
  NSString *v18;
  uint64_t v19;
  void *v20;
  const __CFString *v21;
  void *v22;
  void *v23;
  NSDictionary *v24;
  CFTypeID v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  BOOL v29;
  uint64_t v30;
  NSString *v31;
  uint64_t v32;
  void *v33;
  const __CFString *v34;
  void *v35;
  void *v36;
  NSDictionary *v37;
  CFTypeID v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  int v42;
  uint64_t v43;
  NSString *v44;
  uint64_t v45;
  void *v46;
  const __CFString *v47;
  void (**v48)(_QWORD);
  void *v49;
  void *v50;
  NSDictionary *v51;
  CFTypeID v52;
  uint64_t v53;
  void *v54;
  uint64_t v55;
  int v56;
  uint64_t v57;
  NSString *v58;
  uint64_t v59;
  void *v60;
  const __CFString *v61;
  void *v62;
  uint64_t v63;
  void *v64;
  NSDictionary *v65;
  CFTypeID v66;
  uint64_t v67;
  void *v68;
  uint64_t v69;
  int v70;
  uint64_t v71;
  NSString *v72;
  uint64_t v73;
  void *v74;
  const __CFString *v75;
  void *v76;
  void *v77;
  NSDictionary *v78;
  CFTypeID v79;
  uint64_t v80;
  NSString *v81;
  uint64_t v82;
  int v83;
  NSString *v84;
  uint64_t v85;
  void *v86;
  const __CFString *v87;
  void *v88;
  void *v89;
  NSString *issuerID;
  uint64_t v91;
  void (**v92)(_QWORD);
  void (**v93)(_QWORD);
  void (**v94)(_QWORD);
  unsigned int v95;
  NSErrorUserInfoKey v96;
  const __CFString *v97;
  NSErrorUserInfoKey v98;
  const __CFString *v99;
  NSErrorUserInfoKey v100;
  const __CFString *v101;
  NSErrorUserInfoKey v102;
  const __CFString *v103;
  NSErrorUserInfoKey v104;
  const __CFString *v105;
  NSErrorUserInfoKey v106;
  const __CFString *v107;

  v6 = (void (**)(_QWORD))a4;
  v7 = (NSDictionary *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "userInfo"));
  userInfo = self->super._userInfo;
  self->super._userInfo = v7;

  v9 = &OBJC_IVAR____TtC18SharingViewService25AirTagErrorViewController_mainController;
  if (dword_1001A8AA8 <= 30 && (dword_1001A8AA8 != -1 || _LogCategory_Initialize(&dword_1001A8AA8, 30)))
    LogPrintF(&dword_1001A8AA8, "-[SubCredentialActivationMainController configureWithContext:completion:]", 30, "Main configuration: %@", self->super._userInfo);
  v95 = 0;
  v10 = self->super._userInfo;
  TypeID = CFArrayGetTypeID();
  TypedValue = CFDictionaryGetTypedValue(v10, CFSTR("adamIDs"), TypeID, &v95);
  v13 = (void *)objc_claimAutoreleasedReturnValue(TypedValue);
  v14 = objc_msgSend(v13, "count");
  v15 = v95;
  if (v14)
    v16 = v95 == 0;
  else
    v16 = 0;
  if (!v16 && dword_1001A8AA8 <= 90)
  {
    if (dword_1001A8AA8 == -1)
    {
      if (!_LogCategory_Initialize(&dword_1001A8AA8, 90))
        goto LABEL_18;
      v15 = v95;
      if (v95)
        goto LABEL_12;
    }
    else if (v95)
    {
LABEL_12:
      v17 = (int)v15;
      v106 = NSLocalizedDescriptionKey;
      v18 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", DebugGetErrorString(v15, 0, 0));
      v19 = objc_claimAutoreleasedReturnValue(v18);
      v20 = (void *)v19;
      v21 = CFSTR("?");
      if (v19)
        v21 = (const __CFString *)v19;
      v107 = v21;
      v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v107, &v106, 1));
      v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSOSStatusErrorDomain, v17, v22));
      LogPrintF(&dword_1001A8AA8, "-[SubCredentialActivationMainController configureWithContext:completion:]", 90, "### No adam IDs: %@", v23);

      goto LABEL_18;
    }
    LogPrintF(&dword_1001A8AA8, "-[SubCredentialActivationMainController configureWithContext:completion:]", 90, "### No adam IDs: %@", 0);
  }
LABEL_18:
  objc_storeStrong((id *)&self->_adamIDs, v13);
  v24 = self->super._userInfo;
  v25 = CFStringGetTypeID();
  v26 = CFDictionaryGetTypedValue(v24, CFSTR("appStoreURL"), v25, &v95);
  v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
  v28 = v95;
  if (v27)
    v29 = v95 == 0;
  else
    v29 = 0;
  if (v29 || dword_1001A8AA8 > 10)
    goto LABEL_31;
  if (dword_1001A8AA8 == -1)
  {
    if (!_LogCategory_Initialize(&dword_1001A8AA8, 10))
      goto LABEL_31;
    v28 = v95;
    if (v95)
      goto LABEL_25;
LABEL_30:
    LogPrintF(&dword_1001A8AA8, "-[SubCredentialActivationMainController configureWithContext:completion:]", 10, "No app store URL override: %@", 0);
    goto LABEL_31;
  }
  if (!v95)
    goto LABEL_30;
LABEL_25:
  v30 = (int)v28;
  v104 = NSLocalizedDescriptionKey;
  v31 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", DebugGetErrorString(v28, 0, 0));
  v32 = objc_claimAutoreleasedReturnValue(v31);
  v33 = (void *)v32;
  v34 = CFSTR("?");
  if (v32)
    v34 = (const __CFString *)v32;
  v105 = v34;
  v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v105, &v104, 1));
  v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSOSStatusErrorDomain, v30, v35));
  LogPrintF(&dword_1001A8AA8, "-[SubCredentialActivationMainController configureWithContext:completion:]", 10, "No app store URL override: %@", v36);

  v9 = &OBJC_IVAR____TtC18SharingViewService25AirTagErrorViewController_mainController;
LABEL_31:
  objc_storeStrong((id *)&self->_appStoreURL, v27);
  v37 = self->super._userInfo;
  v38 = CFStringGetTypeID();
  v39 = CFDictionaryGetTypedValue(v37, CFSTR("launchURL"), v38, &v95);
  v40 = (void *)objc_claimAutoreleasedReturnValue(v39);
  v41 = v95;
  if (v40 && !v95)
    goto LABEL_42;
  v42 = *((_DWORD *)v9 + 682);
  if (v42 > 10)
    goto LABEL_42;
  if (v42 == -1)
  {
    if (!_LogCategory_Initialize(&dword_1001A8AA8, 10))
      goto LABEL_42;
    v41 = v95;
    if (v95)
      goto LABEL_36;
LABEL_41:
    LogPrintF(&dword_1001A8AA8, "-[SubCredentialActivationMainController configureWithContext:completion:]", 10, "No launch URL override: %@", 0);
    goto LABEL_42;
  }
  if (!v95)
    goto LABEL_41;
LABEL_36:
  v43 = (int)v41;
  v102 = NSLocalizedDescriptionKey;
  v44 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", DebugGetErrorString(v41, 0, 0));
  v45 = objc_claimAutoreleasedReturnValue(v44);
  v46 = (void *)v45;
  v47 = CFSTR("?");
  if (v45)
    v47 = (const __CFString *)v45;
  v103 = v47;
  v48 = v6;
  v49 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v103, &v102, 1));
  v50 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSOSStatusErrorDomain, v43, v49));
  LogPrintF(&dword_1001A8AA8, "-[SubCredentialActivationMainController configureWithContext:completion:]", 10, "No launch URL override: %@", v50);

  v6 = v48;
  v9 = &OBJC_IVAR____TtC18SharingViewService25AirTagErrorViewController_mainController;
LABEL_42:
  objc_storeStrong((id *)&self->_launchURL, v40);
  v51 = self->super._userInfo;
  v52 = CFStringGetTypeID();
  v53 = CFDictionaryGetTypedValue(v51, CFSTR("title"), v52, &v95);
  v54 = (void *)objc_claimAutoreleasedReturnValue(v53);
  v55 = v95;
  if (v54 && !v95)
    goto LABEL_53;
  v56 = *((_DWORD *)v9 + 682);
  if (v56 > 60)
    goto LABEL_53;
  if (v56 == -1)
  {
    if (!_LogCategory_Initialize(&dword_1001A8AA8, 60))
      goto LABEL_53;
    v55 = v95;
    if (v95)
      goto LABEL_47;
LABEL_52:
    LogPrintF(&dword_1001A8AA8, "-[SubCredentialActivationMainController configureWithContext:completion:]", 60, "No title: %@", 0);
    goto LABEL_53;
  }
  if (!v95)
    goto LABEL_52;
LABEL_47:
  v57 = (int)v55;
  v100 = NSLocalizedDescriptionKey;
  v92 = v6;
  v58 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", DebugGetErrorString(v55, 0, 0));
  v59 = objc_claimAutoreleasedReturnValue(v58);
  v60 = (void *)v59;
  v61 = CFSTR("?");
  if (v59)
    v61 = (const __CFString *)v59;
  v101 = v61;
  v62 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v101, &v100, 1));
  v63 = v57;
  v9 = &OBJC_IVAR____TtC18SharingViewService25AirTagErrorViewController_mainController;
  v64 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSOSStatusErrorDomain, v63, v62));
  LogPrintF(&dword_1001A8AA8, "-[SubCredentialActivationMainController configureWithContext:completion:]", 60, "No title: %@", v64);

  v6 = v92;
LABEL_53:
  objc_storeStrong((id *)&self->_cardTitle, v54);
  v65 = self->super._userInfo;
  v66 = CFStringGetTypeID();
  v67 = CFDictionaryGetTypedValue(v65, CFSTR("subtitle"), v66, &v95);
  v68 = (void *)objc_claimAutoreleasedReturnValue(v67);
  v69 = v95;
  if (v68 && !v95)
    goto LABEL_64;
  v70 = *((_DWORD *)v9 + 682);
  if (v70 > 60)
    goto LABEL_64;
  if (v70 == -1)
  {
    if (!_LogCategory_Initialize(&dword_1001A8AA8, 60))
      goto LABEL_64;
    v69 = v95;
    if (v95)
      goto LABEL_58;
LABEL_63:
    LogPrintF(&dword_1001A8AA8, "-[SubCredentialActivationMainController configureWithContext:completion:]", 60, "No subtitle: %@", 0);
    goto LABEL_64;
  }
  if (!v95)
    goto LABEL_63;
LABEL_58:
  v93 = v6;
  v71 = (int)v69;
  v98 = NSLocalizedDescriptionKey;
  v72 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", DebugGetErrorString(v69, 0, 0));
  v73 = objc_claimAutoreleasedReturnValue(v72);
  v74 = (void *)v73;
  v75 = CFSTR("?");
  if (v73)
    v75 = (const __CFString *)v73;
  v99 = v75;
  v76 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v99, &v98, 1));
  v77 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSOSStatusErrorDomain, v71, v76));
  LogPrintF(&dword_1001A8AA8, "-[SubCredentialActivationMainController configureWithContext:completion:]", 60, "No subtitle: %@", v77);

  v6 = v93;
  v9 = &OBJC_IVAR____TtC18SharingViewService25AirTagErrorViewController_mainController;

LABEL_64:
  objc_storeStrong((id *)&self->_cardSubtitle, v68);
  v78 = self->super._userInfo;
  v79 = CFStringGetTypeID();
  v80 = CFDictionaryGetTypedValue(v78, CFSTR("issuerID"), v79, &v95);
  v81 = (NSString *)objc_claimAutoreleasedReturnValue(v80);
  v82 = v95;
  if (v81 && !v95)
    goto LABEL_75;
  v83 = *((_DWORD *)v9 + 682);
  if (v83 > 60)
    goto LABEL_75;
  if (v83 == -1)
  {
    if (!_LogCategory_Initialize(&dword_1001A8AA8, 60))
      goto LABEL_75;
    v82 = v95;
    if (v95)
      goto LABEL_69;
LABEL_74:
    LogPrintF(&dword_1001A8AA8, "-[SubCredentialActivationMainController configureWithContext:completion:]", 60, "No issuer ID: %@", 0);
    goto LABEL_75;
  }
  if (!v95)
    goto LABEL_74;
LABEL_69:
  v91 = (int)v82;
  v96 = NSLocalizedDescriptionKey;
  v94 = v6;
  v84 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", DebugGetErrorString(v82, 0, 0));
  v85 = objc_claimAutoreleasedReturnValue(v84);
  v86 = (void *)v85;
  v87 = CFSTR("?");
  if (v85)
    v87 = (const __CFString *)v85;
  v97 = v87;
  v88 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v97, &v96, 1));
  v89 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSOSStatusErrorDomain, v91, v88));
  LogPrintF(&dword_1001A8AA8, "-[SubCredentialActivationMainController configureWithContext:completion:]", 60, "No issuer ID: %@", v89);

  v6 = v94;
LABEL_75:
  issuerID = self->_issuerID;
  self->_issuerID = v81;

  if (v6)
    v6[2](v6);
  -[SubCredentialActivationMainController viewFetchContent](self, "viewFetchContent");

}

- (unint64_t)supportedInterfaceOrientations
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SubCredentialActivationMainController view](self, "view"));
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

- (void)viewFetchContent
{
  SFAppContent *v3;
  SFAppContent *appContent;
  void *v5;
  SFAppContent *v6;
  _QWORD v7[5];

  v3 = (SFAppContent *)objc_msgSend(objc_alloc((Class)SFAppContent), "initWithAdamIDs:", self->_adamIDs);
  appContent = self->_appContent;
  self->_appContent = v3;

  if (self->_appStoreURL)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:"));
    -[SFAppContent setAmsURLOverride:](self->_appContent, "setAmsURLOverride:", v5);

  }
  else
  {
    -[SFAppContent setAmsURLOverride:](self->_appContent, "setAmsURLOverride:");
  }
  if (dword_1001A8AA8 <= 50 && (dword_1001A8AA8 != -1 || _LogCategory_Initialize(&dword_1001A8AA8, 50)))
    LogPrintF(&dword_1001A8AA8, "-[SubCredentialActivationMainController viewFetchContent]", 50, "Fetching image for adamID %@", self->_adamIDs);
  v6 = self->_appContent;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10010EFE8;
  v7[3] = &unk_10017DC88;
  v7[4] = self;
  -[SFAppContent fetchNameAndIconWithSize:completion:](v6, "fetchNameAndIconWithSize:completion:", v7, 98.0, 98.0);
  if ((-[SFAppContent installed](self->_appContent, "installed") & 1) == 0)
    -[SubCredentialActivationMainController viewPresentStartViewControllerIfReady](self, "viewPresentStartViewControllerIfReady");
}

- (void)viewPresentStartViewControllerIfReady
{
  SVSSubCredentialActivationStartViewController *v3;
  SVSSubCredentialActivationStartViewController *vcStart;
  SVSSubCredentialActivationStartViewController *v5;
  id v6;

  if (self->_appeared
    && (!-[SFAppContent installed](self->_appContent, "installed") || self->_appIconImage))
  {
    v3 = objc_alloc_init(SVSSubCredentialActivationStartViewController);
    -[SVSSubCredentialActivationStartViewController setMainController:](v3, "setMainController:", self);
    -[SVSSubCredentialActivationStartViewController setAppName:](v3, "setAppName:", self->_appName);
    -[SVSSubCredentialActivationStartViewController setAppIconImage:](v3, "setAppIconImage:", self->_appIconImage);
    vcStart = self->_vcStart;
    self->_vcStart = v3;
    v5 = v3;

    v6 = (id)objc_claimAutoreleasedReturnValue(-[SubCredentialActivationMainController presentProxCardFlowWithDelegate:initialViewController:](self, "presentProxCardFlowWithDelegate:initialViewController:", self, v5));
    -[SubCredentialActivationMainController setProxCardNavigationController:](self, "setProxCardNavigationController:", v6);

  }
}

- (void)viewUpdateAppInfo
{
  if (self->_appIconImage)
  {
    if (self->_vcStart)
      -[SVSSubCredentialActivationStartViewController updateAppName:image:](self->_vcStart, "updateAppName:image:", self->_appName);
    else
      -[SubCredentialActivationMainController viewPresentStartViewControllerIfReady](self, "viewPresentStartViewControllerIfReady");
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SubCredentialActivationMainController;
  -[SubCredentialActivationMainController viewWillAppear:](&v3, "viewWillAppear:", a3);
  if (dword_1001A8AA8 <= 30 && (dword_1001A8AA8 != -1 || _LogCategory_Initialize(&dword_1001A8AA8, 30)))
    LogPrintF(&dword_1001A8AA8, "-[SubCredentialActivationMainController viewWillAppear:]", 30, "View will appear");
}

- (void)viewDidAppear:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  self->_appeared = 1;
  if (dword_1001A8AA8 <= 30 && (dword_1001A8AA8 != -1 || _LogCategory_Initialize(&dword_1001A8AA8, 30)))
    LogPrintF(&dword_1001A8AA8, "-[SubCredentialActivationMainController viewDidAppear:]", 30, "View did appear");
  v5.receiver = self;
  v5.super_class = (Class)SubCredentialActivationMainController;
  -[SubCredentialActivationMainController viewDidAppear:](&v5, "viewDidAppear:", v3);
  -[SubCredentialActivationMainController viewPresentStartViewControllerIfReady](self, "viewPresentStartViewControllerIfReady");
}

- (void)viewDidDisappear:(BOOL)a3
{
  _BOOL8 v3;
  UIStoryboard *storyboard;
  SVSSubCredentialActivationStartViewController *vcStart;
  objc_super v7;

  v3 = a3;
  if (!self->_dismissed)
  {
    if (dword_1001A8AA8 <= 50
      && (dword_1001A8AA8 != -1 || _LogCategory_Initialize(&dword_1001A8AA8, 50)))
    {
      LogPrintF(&dword_1001A8AA8, "-[SubCredentialActivationMainController viewDidDisappear:]", 50, "Dismising from view did disappear.");
    }
    -[SubCredentialActivationMainController dismiss:](self, "dismiss:", 21);
  }
  storyboard = self->_storyboard;
  self->_storyboard = 0;

  -[SVSSubCredentialActivationStartViewController setMainController:](self->_vcStart, "setMainController:", 0);
  vcStart = self->_vcStart;
  self->_vcStart = 0;

  self->_appeared = 0;
  v7.receiver = self;
  v7.super_class = (Class)SubCredentialActivationMainController;
  -[SVSBaseMainController viewDidDisappear:](&v7, "viewDidDisappear:", v3);
}

- (void)dismiss:(int)a3
{
  if (dword_1001A8AA8 <= 30 && (dword_1001A8AA8 != -1 || _LogCategory_Initialize(&dword_1001A8AA8, 30)))
    LogPrintF(&dword_1001A8AA8, "-[SubCredentialActivationMainController dismiss:]", 30, "Dismissing UI. Reason: %d", a3);
  -[SubCredentialActivationMainController dismissAnimated:completion:](self, "dismissAnimated:completion:", a3 != 19, 0);
}

- (void)dismissAnimated:(BOOL)a3 completion:(id)a4
{
  _BOOL8 v4;
  void (**v6)(_QWORD);
  const char *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  void (**v13)(_QWORD);

  v4 = a3;
  v6 = (void (**)(_QWORD))a4;
  if (!self->_dismissed)
  {
    self->_dismissed = 1;
    if (dword_1001A8AA8 <= 30
      && (dword_1001A8AA8 != -1 || _LogCategory_Initialize(&dword_1001A8AA8, 30)))
    {
      v7 = "no";
      if (v4)
        v7 = "yes";
      LogPrintF(&dword_1001A8AA8, "-[SubCredentialActivationMainController dismissAnimated:completion:]", 30, "Dismissing animated: %s", v7);
    }
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[SubCredentialActivationMainController _remoteViewControllerProxy](self, "_remoteViewControllerProxy"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[SubCredentialActivationMainController proxCardNavigationController](self, "proxCardNavigationController"));

    if (v9)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[SubCredentialActivationMainController proxCardNavigationController](self, "proxCardNavigationController"));
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = sub_10010EFAC;
      v11[3] = &unk_10017E100;
      v12 = v8;
      v13 = v6;
      objc_msgSend(v10, "dismissViewControllerAnimated:completion:", v4, v11);

    }
    else
    {
      objc_msgSend(v8, "dismiss");
      if (v6)
        v6[2](v6);
    }

  }
}

- (void)proxCardFlowDidDismiss
{
  -[SubCredentialActivationMainController dismiss:](self, "dismiss:", 5);
}

- (SFAppContent)appContent
{
  return self->_appContent;
}

- (void)setAppContent:(id)a3
{
  objc_storeStrong((id *)&self->_appContent, a3);
}

- (NSArray)adamIDs
{
  return self->_adamIDs;
}

- (void)setAdamIDs:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (BOOL)appInfoDownloadEnabled
{
  return self->_appInfoDownloadEnabled;
}

- (void)setAppInfoDownloadEnabled:(BOOL)a3
{
  self->_appInfoDownloadEnabled = a3;
}

- (NSString)appStoreURL
{
  return self->_appStoreURL;
}

- (void)setAppStoreURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (NSString)cardSubtitle
{
  return self->_cardSubtitle;
}

- (void)setCardSubtitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (NSString)cardTitle
{
  return self->_cardTitle;
}

- (void)setCardTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (NSString)issuerID
{
  return self->_issuerID;
}

- (void)setIssuerID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (NSString)launchURL
{
  return self->_launchURL;
}

- (void)setLaunchURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (UINavigationController)proxCardNavigationController
{
  return self->_proxCardNavigationController;
}

- (void)setProxCardNavigationController:(id)a3
{
  objc_storeStrong((id *)&self->_proxCardNavigationController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_proxCardNavigationController, 0);
  objc_storeStrong((id *)&self->_launchURL, 0);
  objc_storeStrong((id *)&self->_issuerID, 0);
  objc_storeStrong((id *)&self->_cardTitle, 0);
  objc_storeStrong((id *)&self->_cardSubtitle, 0);
  objc_storeStrong((id *)&self->_appStoreURL, 0);
  objc_storeStrong((id *)&self->_adamIDs, 0);
  objc_storeStrong((id *)&self->_appContent, 0);
  objc_storeStrong((id *)&self->_vcStart, 0);
  objc_storeStrong((id *)&self->_storyboard, 0);
  objc_storeStrong((id *)&self->_appIconImage, 0);
  objc_storeStrong((id *)&self->_appName, 0);
}

+ (BOOL)_isSecureForRemoteViewService
{
  return 1;
}

@end
