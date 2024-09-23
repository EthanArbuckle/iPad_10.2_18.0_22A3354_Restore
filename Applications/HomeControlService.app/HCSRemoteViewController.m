@implementation HCSRemoteViewController

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HCSRemoteViewController;
  -[HCSRemoteViewController viewDidLoad](&v6, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[HCSRemoteViewController view](self, "view"));
  objc_msgSend(v4, "setBackgroundColor:", v3);

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[HFExecutionEnvironment sharedInstance](HFExecutionEnvironment, "sharedInstance"));
  objc_msgSend(v5, "executionEnvironmentDidEnterBackground");

}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)HCSRemoteViewController;
  -[HCSRemoteViewController viewWillAppear:](&v7, "viewWillAppear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor hf_keyColor](UIColor, "hf_keyColor"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[HCSRemoteViewController view](self, "view"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "window"));
  objc_msgSend(v6, "setTintColor:", v4);

}

- (void)viewWillLayoutSubviews
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)HCSRemoteViewController;
  -[HCSRemoteViewController viewWillLayoutSubviews](&v14, "viewWillLayoutSubviews");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[HCSRemoteViewController dashboardViewController](self, "dashboardViewController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "view"));
  objc_msgSend(v4, "bounds");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[HCSRemoteViewController gradientLayer](self, "gradientLayer"));
  objc_msgSend(v13, "setFrame:", v6, v8, v10, v12);

}

- (void)dismissViewControllerAnimated:(BOOL)a3 completion:(id)a4
{
  _BOOL8 v4;
  void (**v6)(_QWORD);
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  NSObject *v11;
  objc_super v12;
  uint8_t buf[4];
  HCSRemoteViewController *v14;

  v4 = a3;
  v6 = (void (**)(_QWORD))a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[HCSRemoteViewController _remoteViewControllerProxy](self, "_remoteViewControllerProxy"));
  if (objc_msgSend(v7, "conformsToProtocol:", &OBJC_PROTOCOL___HUHomeControlInterface))
    v8 = v7;
  else
    v8 = 0;
  v9 = v8;

  if (v9)
  {
    v10 = HFLogForCategory(34);
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v14 = self;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%@ Remote view controller requesting dismissal", buf, 0xCu);
    }

    objc_msgSend(v9, "requestDismissal");
    if (v6)
      v6[2](v6);
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)HCSRemoteViewController;
    -[HCSRemoteViewController dismissViewControllerAnimated:completion:](&v12, "dismissViewControllerAnimated:completion:", v4, v6);
  }

}

- (void)_updateRunningState:(BOOL)a3
{
  _BOOL4 v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[HFExecutionEnvironment sharedInstance](HFExecutionEnvironment, "sharedInstance"));
  v5 = objc_msgSend(v4, "runningState");

  if (v5 != (id)!v3)
  {
    if (v3)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[HFCharacteristicNotificationManager sharedManager](HFCharacteristicNotificationManager, "sharedManager"));
      objc_msgSend(v6, "enableNotificationsForSelectedHomeWithReason:", HCSNotificationsEnabledReasonForeground);

      v8 = (id)objc_claimAutoreleasedReturnValue(+[HFExecutionEnvironment sharedInstance](HFExecutionEnvironment, "sharedInstance"));
      objc_msgSend(v8, "executionEnvironmentWillEnterForeground");
    }
    else
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[HFExecutionEnvironment sharedInstance](HFExecutionEnvironment, "sharedInstance"));
      objc_msgSend(v7, "executionEnvironmentDidEnterBackground");

      v8 = (id)objc_claimAutoreleasedReturnValue(+[HFCharacteristicNotificationManager sharedManager](HFCharacteristicNotificationManager, "sharedManager"));
      objc_msgSend(v8, "disableNotificationsForSelectedHomeWithReason:", HCSNotificationsEnabledReasonBackground);
    }

  }
}

- (unint64_t)supportedInterfaceOrientations
{
  return 30;
}

- (void)configureHomeControlServiceWithHomeUUID:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = objc_msgSend(objc_alloc((Class)HUHomeControlServiceContext), "initWithServiceType:homeIdentifier:roomIdentifier:", 0, v4, 0);

  -[HCSRemoteViewController configureHomeControlServiceWithContext:](self, "configureHomeControlServiceWithContext:", v5);
}

- (void)configureHomeControlServiceWithContext:(id)a3
{
  id v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  HUHomeControlServiceContext *serviceContext;
  id v9;
  id v10;
  int v11;
  HCSRemoteViewController *v12;
  __int16 v13;
  void *v14;

  v4 = a3;
  v5 = HFLogForCategory(34);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "userInfo"));
    v11 = 138412546;
    v12 = self;
    v13 = 2112;
    v14 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%@ Configure Home Control Service with userInfo: %@", (uint8_t *)&v11, 0x16u);

  }
  serviceContext = self->_serviceContext;
  self->_serviceContext = (HUHomeControlServiceContext *)v4;
  v9 = v4;

  v10 = objc_msgSend(v9, "serviceType");
  if (v10 == (id)2)
  {
    -[HCSRemoteViewController _layoutDropInViewController](self, "_layoutDropInViewController");
  }
  else if (v10 == (id)1)
  {
    -[HCSRemoteViewController _layoutAnnounceViewController](self, "_layoutAnnounceViewController");
  }
  else if (!v10)
  {
    -[HCSRemoteViewController _layoutDashboardViewController](self, "_layoutDashboardViewController");
  }
}

+ (id)_remoteViewControllerInterface
{
  return +[NSXPCInterface hu_homeControlXPCInterface](NSXPCInterface, "hu_homeControlXPCInterface");
}

+ (id)_exportedInterface
{
  return +[NSXPCInterface hu_homeControlServiceXPCInterface](NSXPCInterface, "hu_homeControlServiceXPCInterface");
}

+ (BOOL)_isSecureForRemoteViewService
{
  return 1;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (id)authorizeIfLockedForViewController:(id)a3
{
  id v4;
  void *v5;

  v4 = objc_alloc_init((Class)NAFuture);
  -[HCSRemoteViewController setLockAuthFuture:](self, "setLockAuthFuture:", v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[HCSRemoteViewController _remoteViewControllerProxy](self, "_remoteViewControllerProxy"));
  objc_msgSend(v5, "authorizeIfLocked");

  return -[HCSRemoteViewController lockAuthFuture](self, "lockAuthFuture");
}

- (void)quickControlsPresentationDidUpdate:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  v4 = (id)objc_claimAutoreleasedReturnValue(-[HCSRemoteViewController _remoteViewControllerProxy](self, "_remoteViewControllerProxy"));
  objc_msgSend(v4, "quickControlsPresentationDidUpdate:", v3);

}

- (void)lockAuthenticationCompleted:(BOOL)a3
{
  _BOOL4 v3;
  uint64_t v4;
  void *v5;
  id v6;

  v3 = a3;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[HCSRemoteViewController lockAuthFuture](self, "lockAuthFuture"));
  if (v3)
  {
    v4 = NAEmptyResult();
    v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
    objc_msgSend(v6, "finishWithResult:", v5);

  }
  else
  {
    objc_msgSend(v6, "cancel");
  }

}

- (void)willBeginTransition:(BOOL)a3 forCompactModule:(BOOL)a4
{
  -[HCSRemoteViewController _updateRunningState:](self, "_updateRunningState:", a3, a4);
}

- (void)dashboardNavigationView:(id)a3 didTapHomeAppButton:(id)a4
{
  uint64_t v5;
  NSObject *v6;
  void *v7;
  void *v8;
  id v9;
  int v10;
  HCSRemoteViewController *v11;

  v5 = HFLogForCategory(34);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 138412290;
    v11 = self;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Launching Home app for Home Control Service %@", (uint8_t *)&v10, 0xCu);
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", CFSTR("com.apple.home://")));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[HFOpenURLRouter sharedInstance](HFOpenURLRouter, "sharedInstance"));
  v9 = objc_msgSend(v8, "openSensitiveURL:", v7);

}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  unsigned int v14;
  objc_super v15;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[HCSRemoteViewController dashboardViewController](self, "dashboardViewController"));
  if (!objc_msgSend(v11, "isEqual:", v13))
  {

    goto LABEL_5;
  }
  v14 = objc_msgSend(v10, "isEqual:", CFSTR("navigationItem.title"));

  if (!v14)
  {
LABEL_5:
    v15.receiver = self;
    v15.super_class = (Class)HCSRemoteViewController;
    -[HCSRemoteViewController observeValueForKeyPath:ofObject:change:context:](&v15, "observeValueForKeyPath:ofObject:change:context:", v10, v11, v12, a6);
    goto LABEL_6;
  }
  -[HCSRemoteViewController _updateNavigationView](self, "_updateNavigationView");
LABEL_6:

}

- (void)_setupBackgroundViewWithBlurEffectStyle:(int64_t)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v7 = (id)objc_claimAutoreleasedReturnValue(+[UIBlurEffect effectWithStyle:](UIBlurEffect, "effectWithStyle:", a3));
  v4 = objc_msgSend(objc_alloc((Class)UIVisualEffectView), "initWithEffect:", v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[HCSRemoteViewController view](self, "view"));
  objc_msgSend(v5, "bounds");
  objc_msgSend(v4, "setFrame:");

  objc_msgSend(v4, "setAutoresizingMask:", 18);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[HCSRemoteViewController view](self, "view"));
  objc_msgSend(v6, "addSubview:", v4);

}

- (void)_layoutDashboardViewController
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
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
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  void *v45;
  void *v46;
  id v47;
  id v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  _QWORD v99[7];
  _QWORD v100[2];

  v3 = (void *)objc_opt_new(HUDashboardViewController, a2);
  -[HCSRemoteViewController setDashboardViewController:](self, "setDashboardViewController:", v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[HCSRemoteViewController dashboardViewController](self, "dashboardViewController"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "view"));
  objc_msgSend(v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[HCSRemoteViewController dashboardViewController](self, "dashboardViewController"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "view"));
  objc_msgSend(v7, "setClipsToBounds:", 1);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[HCSRemoteViewController dashboardViewController](self, "dashboardViewController"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "collectionView"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "layer"));
  objc_msgSend(v10, "setHitTestsAsOpaque:", 1);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[HCSRemoteViewController dashboardViewController](self, "dashboardViewController"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "collectionView"));
  objc_msgSend(v12, "setContentInset:", 16.0, 0.0, 0.0, 0.0);

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[HCSRemoteViewController dashboardViewController](self, "dashboardViewController"));
  objc_msgSend(v13, "setLockAuthorizationDelegate:", self);

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[HCSRemoteViewController dashboardViewController](self, "dashboardViewController"));
  objc_msgSend(v14, "setQuickControlPresentationDelegate:", self);

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[HCSRemoteViewController dashboardViewController](self, "dashboardViewController"));
  objc_msgSend(v15, "beginAppearanceTransition:animated:", 1, 0);

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[HCSRemoteViewController dashboardViewController](self, "dashboardViewController"));
  -[HCSRemoteViewController addChildViewController:](self, "addChildViewController:", v16);

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[HCSRemoteViewController view](self, "view"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[HCSRemoteViewController dashboardViewController](self, "dashboardViewController"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "view"));
  objc_msgSend(v17, "addSubview:", v19);

  v20 = (void *)objc_claimAutoreleasedReturnValue(-[HCSRemoteViewController dashboardViewController](self, "dashboardViewController"));
  objc_msgSend(v20, "didMoveToParentViewController:", self);

  v21 = (void *)objc_claimAutoreleasedReturnValue(-[HCSRemoteViewController dashboardViewController](self, "dashboardViewController"));
  objc_msgSend(v21, "endAppearanceTransition");

  v23 = (void *)objc_opt_new(HUDashboardNavigationView, v22);
  -[HCSRemoteViewController setDashboardNavigationView:](self, "setDashboardNavigationView:", v23);

  v24 = (void *)objc_claimAutoreleasedReturnValue(-[HCSRemoteViewController dashboardNavigationView](self, "dashboardNavigationView"));
  objc_msgSend(v24, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v25 = (void *)objc_claimAutoreleasedReturnValue(-[HCSRemoteViewController dashboardNavigationView](self, "dashboardNavigationView"));
  objc_msgSend(v25, "setDelegate:", self);

  v26 = HULocalizedString(CFSTR("HCSNavigationViewHomeTitle"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
  v28 = (void *)objc_claimAutoreleasedReturnValue(-[HCSRemoteViewController dashboardNavigationView](self, "dashboardNavigationView"));
  objc_msgSend(v28, "setHeaderTitle:", v27);

  v29 = (void *)objc_claimAutoreleasedReturnValue(-[HCSRemoteViewController dashboardNavigationView](self, "dashboardNavigationView"));
  objc_msgSend(v29, "setHasTitleAction:", 0);

  v30 = (void *)objc_claimAutoreleasedReturnValue(-[HCSRemoteViewController view](self, "view"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(-[HCSRemoteViewController dashboardNavigationView](self, "dashboardNavigationView"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(-[HCSRemoteViewController dashboardViewController](self, "dashboardViewController"));
  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "view"));
  objc_msgSend(v30, "insertSubview:aboveSubview:", v31, v33);

  if (+[HFUtilities isAnIPad](HFUtilities, "isAnIPad"))
  {
    v34 = (void *)objc_claimAutoreleasedReturnValue(+[CAGradientLayer layer](CAGradientLayer, "layer"));
    -[HCSRemoteViewController setGradientLayer:](self, "setGradientLayer:", v34);

    v35 = (void *)objc_claimAutoreleasedReturnValue(-[HCSRemoteViewController dashboardViewController](self, "dashboardViewController"));
    v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "view"));
    objc_msgSend(v36, "bounds");
    v38 = v37;
    v40 = v39;
    v42 = v41;
    v44 = v43;
    v45 = (void *)objc_claimAutoreleasedReturnValue(-[HCSRemoteViewController gradientLayer](self, "gradientLayer"));
    objc_msgSend(v45, "setFrame:", v38, v40, v42, v44);

    v46 = (void *)objc_claimAutoreleasedReturnValue(-[HCSRemoteViewController gradientLayer](self, "gradientLayer"));
    objc_msgSend(v46, "setLocations:", &off_100008448);

    v47 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](UIColor, "blackColor")));
    v100[0] = objc_msgSend(v47, "CGColor");
    v48 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor")));
    v100[1] = objc_msgSend(v48, "CGColor");
    v49 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v100, 2));
    v50 = (void *)objc_claimAutoreleasedReturnValue(-[HCSRemoteViewController gradientLayer](self, "gradientLayer"));
    objc_msgSend(v50, "setColors:", v49);

    v51 = (void *)objc_claimAutoreleasedReturnValue(-[HCSRemoteViewController gradientLayer](self, "gradientLayer"));
    v52 = (void *)objc_claimAutoreleasedReturnValue(-[HCSRemoteViewController dashboardViewController](self, "dashboardViewController"));
    v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "view"));
    v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "layer"));
    objc_msgSend(v54, "setMask:", v51);

  }
  v98 = (void *)objc_claimAutoreleasedReturnValue(-[HCSRemoteViewController dashboardNavigationView](self, "dashboardNavigationView"));
  v96 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v98, "leadingAnchor"));
  v97 = (void *)objc_claimAutoreleasedReturnValue(-[HCSRemoteViewController view](self, "view"));
  v95 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v97, "layoutMarginsGuide"));
  v94 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v95, "leadingAnchor"));
  v93 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v96, "constraintEqualToAnchor:", v94));
  v99[0] = v93;
  v92 = (void *)objc_claimAutoreleasedReturnValue(-[HCSRemoteViewController dashboardNavigationView](self, "dashboardNavigationView"));
  v90 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v92, "trailingAnchor"));
  v91 = (void *)objc_claimAutoreleasedReturnValue(-[HCSRemoteViewController view](self, "view"));
  v89 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v91, "layoutMarginsGuide"));
  v88 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v89, "trailingAnchor"));
  v87 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v90, "constraintEqualToAnchor:", v88));
  v99[1] = v87;
  v86 = (void *)objc_claimAutoreleasedReturnValue(-[HCSRemoteViewController dashboardNavigationView](self, "dashboardNavigationView"));
  v84 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v86, "topAnchor"));
  v85 = (void *)objc_claimAutoreleasedReturnValue(-[HCSRemoteViewController view](self, "view"));
  v83 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v85, "layoutMarginsGuide"));
  v82 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v83, "topAnchor"));
  v81 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v84, "constraintEqualToAnchor:constant:", v82, 45.0));
  v99[2] = v81;
  v80 = (void *)objc_claimAutoreleasedReturnValue(-[HCSRemoteViewController dashboardViewController](self, "dashboardViewController"));
  v79 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v80, "view"));
  v77 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v79, "topAnchor"));
  v78 = (void *)objc_claimAutoreleasedReturnValue(-[HCSRemoteViewController dashboardNavigationView](self, "dashboardNavigationView"));
  v76 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v78, "bottomAnchor"));
  v75 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v77, "constraintEqualToAnchor:", v76));
  v99[3] = v75;
  v74 = (void *)objc_claimAutoreleasedReturnValue(-[HCSRemoteViewController dashboardViewController](self, "dashboardViewController"));
  v73 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v74, "view"));
  v71 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v73, "bottomAnchor"));
  v72 = (void *)objc_claimAutoreleasedReturnValue(-[HCSRemoteViewController view](self, "view"));
  v70 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v72, "bottomAnchor"));
  v69 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v71, "constraintEqualToAnchor:", v70));
  v99[4] = v69;
  v68 = (void *)objc_claimAutoreleasedReturnValue(-[HCSRemoteViewController dashboardViewController](self, "dashboardViewController"));
  v67 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v68, "view"));
  v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v67, "leadingAnchor"));
  v66 = (void *)objc_claimAutoreleasedReturnValue(-[HCSRemoteViewController view](self, "view"));
  v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v66, "leadingAnchor"));
  v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v65, "constraintEqualToAnchor:", v55));
  v99[5] = v56;
  v57 = (void *)objc_claimAutoreleasedReturnValue(-[HCSRemoteViewController dashboardViewController](self, "dashboardViewController"));
  v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "view"));
  v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v58, "trailingAnchor"));
  v60 = (void *)objc_claimAutoreleasedReturnValue(-[HCSRemoteViewController view](self, "view"));
  v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v60, "trailingAnchor"));
  v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v59, "constraintEqualToAnchor:", v61));
  v99[6] = v62;
  v63 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v99, 7));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v63);

  -[HCSRemoteViewController _updateNavigationView](self, "_updateNavigationView");
  v64 = (void *)objc_claimAutoreleasedReturnValue(-[HCSRemoteViewController dashboardViewController](self, "dashboardViewController"));
  objc_msgSend(v64, "addObserver:forKeyPath:options:context:", self, CFSTR("navigationItem.title"), 0, 0);

}

- (void)_updateNavigationView
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v6 = (id)objc_claimAutoreleasedReturnValue(-[HCSRemoteViewController dashboardViewController](self, "dashboardViewController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "navigationItem"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "title"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[HCSRemoteViewController dashboardNavigationView](self, "dashboardNavigationView"));
  objc_msgSend(v5, "setTitle:", v4);

}

- (void)_layoutAnnounceViewController
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;

  -[HCSRemoteViewController _setupBackgroundViewWithBlurEffectStyle:](self, "_setupBackgroundViewWithBlurEffectStyle:", 6);
  v3 = objc_alloc((Class)HUAnnounceRecordingViewController);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[HCSRemoteViewController serviceContext](self, "serviceContext"));
  v5 = objc_msgSend(v3, "initWithServiceContext:blurEffectStyle:", v4, 6);
  -[HCSRemoteViewController setAnnounceRecordingViewController:](self, "setAnnounceRecordingViewController:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[HCSRemoteViewController announceRecordingViewController](self, "announceRecordingViewController"));
  objc_msgSend(v6, "beginAppearanceTransition:animated:", 1, 0);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[HCSRemoteViewController announceRecordingViewController](self, "announceRecordingViewController"));
  -[HCSRemoteViewController addChildViewController:](self, "addChildViewController:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[HCSRemoteViewController view](self, "view"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[HCSRemoteViewController announceRecordingViewController](self, "announceRecordingViewController"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "view"));
  objc_msgSend(v8, "addSubview:", v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[HCSRemoteViewController view](self, "view"));
  objc_msgSend(v11, "bounds");
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v19 = v18;
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[HCSRemoteViewController announceRecordingViewController](self, "announceRecordingViewController"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "view"));
  objc_msgSend(v21, "setFrame:", v13, v15, v17, v19);

  v22 = (void *)objc_claimAutoreleasedReturnValue(-[HCSRemoteViewController announceRecordingViewController](self, "announceRecordingViewController"));
  objc_msgSend(v22, "didMoveToParentViewController:", self);

  v23 = (id)objc_claimAutoreleasedReturnValue(-[HCSRemoteViewController announceRecordingViewController](self, "announceRecordingViewController"));
  objc_msgSend(v23, "endAppearanceTransition");

}

- (void)_layoutDropInViewController
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id location;

  -[HCSRemoteViewController _setupBackgroundViewWithBlurEffectStyle:](self, "_setupBackgroundViewWithBlurEffectStyle:", 6);
  v3 = objc_alloc((Class)HUDropInViewController);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[HCSRemoteViewController serviceContext](self, "serviceContext"));
  v5 = objc_msgSend(v3, "initWithServiceContext:blurEffectStyle:", v4, 6);
  -[HCSRemoteViewController setDropInViewController:](self, "setDropInViewController:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[HCSRemoteViewController dropInViewController](self, "dropInViewController"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "hu_preloadContent"));

  objc_initWeak(&location, self);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100002D34;
  v9[3] = &unk_100008270;
  objc_copyWeak(&v10, &location);
  v8 = objc_msgSend(v7, "addSuccessBlock:", v9);
  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);

}

- (HUHomeControlServiceContext)serviceContext
{
  return self->_serviceContext;
}

- (void)setServiceContext:(id)a3
{
  objc_storeStrong((id *)&self->_serviceContext, a3);
}

- (HUDashboardNavigationController)dashboardNavigationController
{
  return self->_dashboardNavigationController;
}

- (void)setDashboardNavigationController:(id)a3
{
  objc_storeStrong((id *)&self->_dashboardNavigationController, a3);
}

- (HUDashboardViewController)dashboardViewController
{
  return self->_dashboardViewController;
}

- (void)setDashboardViewController:(id)a3
{
  objc_storeStrong((id *)&self->_dashboardViewController, a3);
}

- (HUDashboardNavigationView)dashboardNavigationView
{
  return self->_dashboardNavigationView;
}

- (void)setDashboardNavigationView:(id)a3
{
  objc_storeStrong((id *)&self->_dashboardNavigationView, a3);
}

- (CAGradientLayer)gradientLayer
{
  return self->_gradientLayer;
}

- (void)setGradientLayer:(id)a3
{
  objc_storeStrong((id *)&self->_gradientLayer, a3);
}

- (HUAnnounceRecordingViewController)announceRecordingViewController
{
  return self->_announceRecordingViewController;
}

- (void)setAnnounceRecordingViewController:(id)a3
{
  objc_storeStrong((id *)&self->_announceRecordingViewController, a3);
}

- (HUDropInViewController)dropInViewController
{
  return self->_dropInViewController;
}

- (void)setDropInViewController:(id)a3
{
  objc_storeStrong((id *)&self->_dropInViewController, a3);
}

- (NAFuture)lockAuthFuture
{
  return self->_lockAuthFuture;
}

- (void)setLockAuthFuture:(id)a3
{
  objc_storeStrong((id *)&self->_lockAuthFuture, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lockAuthFuture, 0);
  objc_storeStrong((id *)&self->_dropInViewController, 0);
  objc_storeStrong((id *)&self->_announceRecordingViewController, 0);
  objc_storeStrong((id *)&self->_gradientLayer, 0);
  objc_storeStrong((id *)&self->_dashboardNavigationView, 0);
  objc_storeStrong((id *)&self->_dashboardViewController, 0);
  objc_storeStrong((id *)&self->_dashboardNavigationController, 0);
  objc_storeStrong((id *)&self->_serviceContext, 0);
}

@end
