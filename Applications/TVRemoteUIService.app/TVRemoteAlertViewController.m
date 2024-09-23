@implementation TVRemoteAlertViewController

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
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
  id v22;
  NSObject *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  void *v38;
  void *v39;
  void *v40;
  double v41;
  double v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  objc_super v48;
  uint8_t buf[4];
  void *v50;

  v48.receiver = self;
  v48.super_class = (Class)TVRemoteAlertViewController;
  -[TVRemoteAlertViewController viewDidLoad](&v48, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVRemoteAlertViewController traitCollection](self, "traitCollection"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[TVRemoteAlertVisualStyleProviding visualStyleForIdiom:](TVRemoteAlertVisualStyleProviding, "visualStyleForIdiom:", objc_msgSend(v3, "userInterfaceIdiom")));
  -[TVRemoteAlertViewController setVisualStyle:](self, "setVisualStyle:", v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVRemoteAlertViewController visualStyle](self, "visualStyle"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "backgroundMaterialView"));
  -[TVRemoteAlertViewController setBackgroundMaterialView:](self, "setBackgroundMaterialView:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVRemoteAlertViewController visualStyle](self, "visualStyle"));
  LODWORD(v6) = objc_msgSend(v7, "allowsTapToDismiss");

  if ((_DWORD)v6)
  {
    v8 = objc_msgSend(objc_alloc((Class)UITapGestureRecognizer), "initWithTarget:action:", self, "_dismiss");
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[TVRemoteAlertViewController backgroundMaterialView](self, "backgroundMaterialView"));
    objc_msgSend(v9, "addGestureRecognizer:", v8);

  }
  v10 = objc_alloc_init((Class)TVRUIHintsViewController);
  -[TVRemoteAlertViewController setHintsViewController:](self, "setHintsViewController:", v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[TVRemoteAlertViewController view](self, "view"));
  objc_msgSend(v11, "bounds");
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v19 = v18;
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[TVRemoteAlertViewController hintsViewController](self, "hintsViewController"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "view"));
  objc_msgSend(v21, "setFrame:", v13, v15, v17, v19);

  v22 = _TVRUIServiceLog();
  v23 = objc_claimAutoreleasedReturnValue(v22);
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[TVRemoteAlertViewController remoteControlViewController](self, "remoteControlViewController"));
    *(_DWORD *)buf = 138412290;
    v50 = v24;
    _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Creating new RemoteViewController. Existing %@", buf, 0xCu);

  }
  v25 = objc_alloc_init((Class)TVRUIRemoteViewController);
  -[TVRemoteAlertViewController setRemoteControlViewController:](self, "setRemoteControlViewController:", v25);

  v26 = (void *)objc_claimAutoreleasedReturnValue(-[TVRemoteAlertViewController hintsViewController](self, "hintsViewController"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[TVRemoteAlertViewController remoteControlViewController](self, "remoteControlViewController"));
  objc_msgSend(v27, "setDelegate:", v26);

  v28 = (void *)objc_claimAutoreleasedReturnValue(-[TVRemoteAlertViewController visualStyle](self, "visualStyle"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(-[TVRemoteAlertViewController view](self, "view"));
  objc_msgSend(v28, "frameForParentView:", v29);
  v31 = v30;
  v33 = v32;
  v35 = v34;
  v37 = v36;
  v38 = (void *)objc_claimAutoreleasedReturnValue(-[TVRemoteAlertViewController remoteControlViewController](self, "remoteControlViewController"));
  v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "view"));
  objc_msgSend(v39, "setFrame:", v31, v33, v35, v37);

  v40 = (void *)objc_claimAutoreleasedReturnValue(-[TVRemoteAlertViewController visualStyle](self, "visualStyle"));
  objc_msgSend(v40, "maximizedCornerRadius");
  v42 = v41;
  v43 = (void *)objc_claimAutoreleasedReturnValue(-[TVRemoteAlertViewController remoteControlViewController](self, "remoteControlViewController"));
  objc_msgSend(v43, "setBackgroundCornerRadius:", v42);

  v44 = (void *)objc_claimAutoreleasedReturnValue(-[TVRemoteAlertViewController remoteControlViewController](self, "remoteControlViewController"));
  v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "view"));
  objc_msgSend(v45, "setClipsToBounds:", 1);

  v46 = (void *)objc_claimAutoreleasedReturnValue(-[TVRemoteAlertViewController remoteControlViewController](self, "remoteControlViewController"));
  -[TVRemoteAlertViewController bs_addChildViewController:](self, "bs_addChildViewController:", v46);

  v47 = (void *)objc_claimAutoreleasedReturnValue(-[TVRemoteAlertViewController hintsViewController](self, "hintsViewController"));
  -[TVRemoteAlertViewController bs_addChildViewController:](self, "bs_addChildViewController:", v47);

}

- (void)viewWillAppear:(BOOL)a3
{
  void *v3;
  uint64_t v4;
  id v5;
  NSObject *v6;
  objc_super v7;
  uint8_t buf[4];
  uint64_t v9;

  v7.receiver = self;
  v7.super_class = (Class)TVRemoteAlertViewController;
  -[TVRemoteAlertViewController viewWillAppear:](&v7, "viewWillAppear:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDistributedNotificationCenter defaultCenter](NSDistributedNotificationCenter, "defaultCenter"));
  v4 = TVRViewServiceWillAppearNotificationName;
  objc_msgSend(v3, "postNotificationName:object:", TVRViewServiceWillAppearNotificationName, 0);

  v5 = _TVRUIServiceLog();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v9 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Remote Alert posted NSDistributedNotifiction: %{public}@", buf, 0xCu);
  }

}

- (void)viewWillLayoutSubviews
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  CGFloat v12;
  void *v13;
  CGFloat v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  void *v27;
  objc_super v28;
  CGRect v29;
  CGRect v30;

  v28.receiver = self;
  v28.super_class = (Class)TVRemoteAlertViewController;
  -[TVRemoteAlertViewController viewWillLayoutSubviews](&v28, "viewWillLayoutSubviews");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVRemoteAlertViewController visualStyle](self, "visualStyle"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVRemoteAlertViewController view](self, "view"));
  objc_msgSend(v3, "frameForParentView:", v4);
  v6 = v5;
  v8 = v7;

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[TVRemoteAlertViewController remoteControlViewController](self, "remoteControlViewController"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "view"));
  objc_msgSend(v10, "setBounds:", 0.0, 0.0, v6, v8);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[TVRemoteAlertViewController view](self, "view"));
  objc_msgSend(v11, "bounds");
  v12 = CGRectGetWidth(v29) * 0.5;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[TVRemoteAlertViewController view](self, "view"));
  objc_msgSend(v13, "bounds");
  v14 = CGRectGetHeight(v30) * 0.5;
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[TVRemoteAlertViewController remoteControlViewController](self, "remoteControlViewController"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "view"));
  objc_msgSend(v16, "setCenter:", v12, v14);

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[TVRemoteAlertViewController view](self, "view"));
  objc_msgSend(v17, "bounds");
  v19 = v18;
  v21 = v20;
  v23 = v22;
  v25 = v24;
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[TVRemoteAlertViewController hintsViewController](self, "hintsViewController"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "view"));
  objc_msgSend(v27, "setFrame:", v19, v21, v23, v25);

}

- (void)viewDidAppear:(BOOL)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
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
  void *v23;
  int v24;
  id v25;
  NSObject *v26;
  _BOOL4 v27;
  id v28;
  void *v29;
  id v30;
  id v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  unsigned int v36;
  id v37;
  NSObject *v38;
  id v39;
  id v40;
  void *v41;
  uint8_t v42[8];
  _QWORD v43[5];
  objc_super v44;

  v44.receiver = self;
  v44.super_class = (Class)TVRemoteAlertViewController;
  -[TVRemoteAlertViewController viewDidAppear:](&v44, "viewDidAppear:", a3);
  v4 = objc_alloc_init((Class)_UIViewControllerOneToOneTransitionContext);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVRemoteAlertViewController view](self, "view"));
  objc_msgSend(v4, "_setFromView:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVRemoteAlertViewController remoteControlViewController](self, "remoteControlViewController"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "view"));
  objc_msgSend(v4, "_setToView:", v7);

  v43[0] = _NSConcreteStackBlock;
  v43[1] = 3221225472;
  v43[2] = __45__TVRemoteAlertViewController_viewDidAppear___block_invoke;
  v43[3] = &unk_1000147C8;
  v43[4] = self;
  objc_msgSend(v4, "_setCompletionHandler:", v43);
  if (-[TVRemoteAlertViewController isWakingToLockScreen](self, "isWakingToLockScreen"))
  {
    v8 = _TVRUIServiceLog();
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v42 = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Waking to lock screen, no animator being run", v42, 2u);
    }

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[TVRemoteAlertViewController backgroundMaterialView](self, "backgroundMaterialView"));
    objc_msgSend(v10, "setWeighting:", 1.0);

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[TVRemoteAlertViewController view](self, "view"));
    objc_msgSend(v11, "bounds");
    v13 = v12;
    v15 = v14;
    v17 = v16;
    v19 = v18;
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[TVRemoteAlertViewController backgroundMaterialView](self, "backgroundMaterialView"));
    objc_msgSend(v20, "setFrame:", v13, v15, v17, v19);

    v21 = (void *)objc_claimAutoreleasedReturnValue(-[TVRemoteAlertViewController backgroundMaterialView](self, "backgroundMaterialView"));
    objc_msgSend(v21, "setAutoresizingMask:", 18);

    v22 = (void *)objc_claimAutoreleasedReturnValue(-[TVRemoteAlertViewController view](self, "view"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[TVRemoteAlertViewController backgroundMaterialView](self, "backgroundMaterialView"));
    objc_msgSend(v22, "insertSubview:atIndex:", v23, 0);

    -[TVRemoteAlertViewController alertDidFinishPresentation:](self, "alertDidFinishPresentation:", 0);
  }
  else
  {
    v24 = _AXSReduceMotionEnabled();
    v25 = _TVRUIServiceLog();
    v26 = objc_claimAutoreleasedReturnValue(v25);
    v27 = os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT);
    if (v24)
    {
      if (v27)
      {
        *(_WORD *)v42 = 0;
        _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "Using TVRemoteAlertFadeAnimationController", v42, 2u);
      }

      v28 = objc_alloc((Class)TVRUIAlertFadeAnimationController);
      v29 = (void *)objc_claimAutoreleasedReturnValue(-[TVRemoteAlertViewController visualStyle](self, "visualStyle"));
      v30 = objc_msgSend(v28, "initWithAnimationType:visualStyle:", 0, v29);
    }
    else
    {
      if (v27)
      {
        *(_WORD *)v42 = 0;
        _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "Using TVRemoteAlertAnimationController", v42, 2u);
      }

      v31 = objc_alloc((Class)TVRUIAlertAnimationController);
      v32 = (void *)objc_claimAutoreleasedReturnValue(-[TVRemoteAlertViewController visualStyle](self, "visualStyle"));
      v30 = objc_msgSend(v31, "initWithAnimationType:visualStyle:", 0, v32);

      v29 = (void *)objc_claimAutoreleasedReturnValue(-[TVRemoteAlertViewController backgroundMaterialView](self, "backgroundMaterialView"));
      objc_msgSend(v30, "setBackgroundMaterialView:", v29);
    }

    objc_msgSend(v30, "animateTransition:", v4);
  }
  v33 = objc_claimAutoreleasedReturnValue(-[TVRemoteAlertViewController presentationAction](self, "presentationAction"));
  if (v33)
  {
    v34 = (void *)v33;
    v35 = (void *)objc_claimAutoreleasedReturnValue(-[TVRemoteAlertViewController presentationAction](self, "presentationAction"));
    v36 = objc_msgSend(v35, "canSendResponse");

    if (v36)
    {
      v37 = _TVRUIServiceLog();
      v38 = objc_claimAutoreleasedReturnValue(v37);
      if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v42 = 0;
        _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEFAULT, "Remote Alert presentation action provided, sending back animation response", v42, 2u);
      }

      v39 = objc_alloc_init((Class)BSMutableSettings);
      objc_msgSend(v39, "setObject:forSetting:", &off_100015160, 1);
      v40 = objc_msgSend(objc_alloc((Class)BSActionResponse), "initWithInfo:error:", v39, 0);
      v41 = (void *)objc_claimAutoreleasedReturnValue(-[TVRemoteAlertViewController presentationAction](self, "presentationAction"));
      objc_msgSend(v41, "sendResponse:", v40);

      -[TVRemoteAlertViewController setPresentationAction:](self, "setPresentationAction:", 0);
    }
  }

}

id __45__TVRemoteAlertViewController_viewDidAppear___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "alertDidFinishPresentation:", 1);
}

- (void)viewWillDisappear:(BOOL)a3
{
  void *v3;
  uint64_t v4;
  id v5;
  NSObject *v6;
  objc_super v7;
  uint8_t buf[4];
  uint64_t v9;

  v7.receiver = self;
  v7.super_class = (Class)TVRemoteAlertViewController;
  -[TVRemoteAlertViewController viewWillDisappear:](&v7, "viewWillDisappear:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDistributedNotificationCenter defaultCenter](NSDistributedNotificationCenter, "defaultCenter"));
  v4 = TVRViewServiceWillDisappearNotificationName;
  objc_msgSend(v3, "postNotificationName:object:", TVRViewServiceWillDisappearNotificationName, 0);

  v5 = _TVRUIServiceLog();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v9 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Remote Alert posted NSDistributedNotifiction: %{public}@", buf, 0xCu);
  }

}

- (BOOL)prefersStatusBarHidden
{
  return 1;
}

- (unint64_t)supportedInterfaceOrientations
{
  void *v2;
  unint64_t v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TVRemoteAlertViewController traitCollection](self, "traitCollection"));
  if (objc_msgSend(v2, "userInterfaceIdiom") == (id)1)
    v3 = 30;
  else
    v3 = 2;

  return v3;
}

- (void)alertDidFinishPresentation:(BOOL)a3
{
  void *v3;
  uint64_t v4;
  id v5;
  NSObject *v6;
  int v7;
  uint64_t v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDistributedNotificationCenter defaultCenter](NSDistributedNotificationCenter, "defaultCenter", a3));
  v4 = TVRViewServiceDidAppearNotificationName;
  objc_msgSend(v3, "postNotificationName:object:", TVRViewServiceDidAppearNotificationName, 0);

  v5 = _TVRUIServiceLog();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138543362;
    v8 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Remote Alert posted NSDistributedNotifiction: %{public}@", (uint8_t *)&v7, 0xCu);
  }

}

- (void)alertDidFinishDismissal:(BOOL)a3
{
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  id v16;
  NSObject *v17;
  int v18;
  uint64_t v19;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVRemoteAlertViewController _remoteViewControllerProxy](self, "_remoteViewControllerProxy", a3));
  v5 = _TVRUIServiceLog();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v18) = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Remote Alert deactivating", (uint8_t *)&v18, 2u);
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVRemoteAlertViewController remoteControlViewController](self, "remoteControlViewController"));
  objc_msgSend(v7, "willMoveToParentViewController:", 0);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVRemoteAlertViewController remoteControlViewController](self, "remoteControlViewController"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "view"));
  objc_msgSend(v9, "removeFromSuperview");

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[TVRemoteAlertViewController remoteControlViewController](self, "remoteControlViewController"));
  objc_msgSend(v10, "removeFromParentViewController");

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[TVRemoteAlertViewController remoteControlViewController](self, "remoteControlViewController"));
  objc_msgSend(v11, "setView:", 0);

  v12 = _TVRUIServiceLog();
  v13 = objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v18) = 0;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Removed child RemoteViewController from remote alert", (uint8_t *)&v18, 2u);
  }

  objc_msgSend(v4, "deactivate");
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSDistributedNotificationCenter defaultCenter](NSDistributedNotificationCenter, "defaultCenter"));
  v15 = TVRViewServiceDidDisappearNotificationName;
  objc_msgSend(v14, "postNotificationName:object:", TVRViewServiceDidDisappearNotificationName, 0);

  v16 = _TVRUIServiceLog();
  v17 = objc_claimAutoreleasedReturnValue(v16);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    v18 = 138543362;
    v19 = v15;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Remote Alert posted NSDistributedNotifiction: %{public}@", (uint8_t *)&v18, 0xCu);
  }

}

- (void)prepareForActivationWithContext:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(_QWORD);
  id v8;
  NSObject *v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  NSObject *v17;
  void *v18;
  int64_t v19;
  void *v20;
  void *v21;
  id v22;
  NSObject *v23;
  const char *v24;
  id v25;
  id v26;
  NSObject *v27;
  int64_t v28;
  int64_t v29;
  int64_t v30;
  void *v31;
  void *v32;
  id v33;
  NSObject *v34;
  void *v35;
  id v36;
  _QWORD v37[5];
  uint8_t buf[4];
  id v39;
  __int16 v40;
  int64_t v41;
  __int16 v42;
  int64_t v43;
  __int16 v44;
  int64_t v45;

  v6 = a3;
  v7 = (void (**)(_QWORD))a4;
  v8 = _TVRUIServiceLog();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v39 = v6;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Remote Alert -prepareForActivationWithContext: %{public}@", buf, 0xCu);
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "reason"));
  -[TVRemoteAlertViewController setActivationReason:](self, "setActivationReason:", v10);

  v11 = _TVRUIServiceLog();
  v12 = objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[TVRemoteAlertViewController activationReason](self, "activationReason"));
    *(_DWORD *)buf = 138543362;
    v39 = v13;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Remote Alert activation reason: %{public}@", buf, 0xCu);

  }
  -[TVRemoteAlertViewController setDeviceIdentifierType:](self, "setDeviceIdentifierType:", 0);
  if (-[TVRemoteAlertViewController isWakingToLockScreen](self, "isWakingToLockScreen"))
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[TVRCPreferredDeviceManager sharedInstance](TVRCPreferredDeviceManager, "sharedInstance"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "preferredDeviceIdentifier"));
    -[TVRemoteAlertViewController setDeviceIdentifier:](self, "setDeviceIdentifier:", v15);

    -[TVRemoteAlertViewController setLaunchContext:](self, "setLaunchContext:", 2);
    v16 = _TVRUIServiceLog();
    v17 = objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[TVRemoteAlertViewController deviceIdentifier](self, "deviceIdentifier"));
      v19 = -[TVRemoteAlertViewController deviceIdentifierType](self, "deviceIdentifierType");
      *(_DWORD *)buf = 138412546;
      v39 = v18;
      v40 = 2048;
      v41 = v19;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Remote Alert is waking to lock screen, overriding with: device=%@, type=%ld", buf, 0x16u);

    }
  }
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[TVRemoteAlertViewController deviceIdentifier](self, "deviceIdentifier"));

  if (v20)
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[TVRemoteAlertViewController deviceIdentifier](self, "deviceIdentifier"));
    v22 = _TVRUIServiceLog();
    v23 = objc_claimAutoreleasedReturnValue(v22);
    if (!os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
LABEL_17:

      goto LABEL_18;
    }
    *(_DWORD *)buf = 138412290;
    v39 = v21;
    v24 = "Specific device identifier specified to connect %@";
LABEL_12:
    _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, v24, buf, 0xCu);
    goto LABEL_17;
  }
  if ((id)-[TVRemoteAlertViewController launchContext](self, "launchContext") == (id)11)
  {
    v25 = _TVRUIServiceLog();
    v23 = objc_claimAutoreleasedReturnValue(v25);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
      -[TVRemoteAlertViewController prepareForActivationWithContext:completion:].cold.1(v23);
    v21 = 0;
    goto LABEL_17;
  }
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[TVRemoteAlertViewController lastActiveEndpointIdentifier](self, "lastActiveEndpointIdentifier"));
  v33 = _TVRUIServiceLog();
  v34 = objc_claimAutoreleasedReturnValue(v33);
  if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v39 = v21;
    _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "No specific device identifier specified checking last active endpoint %@", buf, 0xCu);
  }

  if (!v21)
  {
    v35 = (void *)objc_claimAutoreleasedReturnValue(+[TVRCPreferredDeviceManager sharedInstance](TVRCPreferredDeviceManager, "sharedInstance"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "preferredDeviceIdentifier"));

    v36 = _TVRUIServiceLog();
    v23 = objc_claimAutoreleasedReturnValue(v36);
    if (!os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      goto LABEL_17;
    *(_DWORD *)buf = 138412290;
    v39 = v21;
    v24 = "No last active endpoint specified checking last connected identifier %@";
    goto LABEL_12;
  }
LABEL_18:
  v26 = _TVRUIServiceLog();
  v27 = objc_claimAutoreleasedReturnValue(v26);
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    v28 = -[TVRemoteAlertViewController deviceIdentifierType](self, "deviceIdentifierType");
    v29 = -[TVRemoteAlertViewController deviceType](self, "deviceType");
    v30 = -[TVRemoteAlertViewController launchContext](self, "launchContext");
    *(_DWORD *)buf = 138413058;
    v39 = v21;
    v40 = 2048;
    v41 = v28;
    v42 = 2048;
    v43 = v29;
    v44 = 2048;
    v45 = v30;
    _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "Configuring RemoteControlViewController (deviceID=%@, deviceIdentifierType=%ld, deviceType=%ld, launchContext=%ld", buf, 0x2Au);
  }

  v31 = (void *)objc_claimAutoreleasedReturnValue(-[TVRemoteAlertViewController remoteControlViewController](self, "remoteControlViewController"));
  objc_msgSend(v31, "configureWithDeviceIdentifier:identifierType:deviceType:launchContext:", v21, -[TVRemoteAlertViewController deviceIdentifierType](self, "deviceIdentifierType"), -[TVRemoteAlertViewController deviceType](self, "deviceType"), -[TVRemoteAlertViewController launchContext](self, "launchContext"));

  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "actions"));
  v37[0] = _NSConcreteStackBlock;
  v37[1] = 3221225472;
  v37[2] = __74__TVRemoteAlertViewController_prepareForActivationWithContext_completion___block_invoke;
  v37[3] = &unk_1000147F0;
  v37[4] = self;
  objc_msgSend(v32, "enumerateObjectsUsingBlock:", v37);

  v7[2](v7);
}

void __74__TVRemoteAlertViewController_prepareForActivationWithContext_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  uint8_t v12[16];
  uint8_t buf[16];

  v3 = a2;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "info"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForSetting:", 1));

  if (v5)
  {
    v6 = _TVRUIServiceLog();
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Remote Alert received presentation animation action", buf, 2u);
    }

    objc_msgSend(*(id *)(a1 + 32), "setPresentationAction:", v3);
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "info"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForSetting:", 2));

  if (v9)
  {
    v10 = _TVRUIServiceLog();
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v12 = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Remote Alert received dismissal animation action", v12, 2u);
    }

    objc_msgSend(*(id *)(a1 + 32), "setDismissalAction:", v3);
  }

}

- (void)configureWithContext:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  id v11;
  void *v12;
  NSObject *v13;
  void *v14;
  id v15;
  NSObject *v16;
  void *v17;
  void *v18;
  id v19;
  NSObject *v20;
  void *v21;
  void *v22;
  unsigned int v23;
  id v24;
  NSObject *v25;
  const char *v26;
  id v27;
  id v28;
  NSObject *v29;
  id v30;
  objc_super v31;
  uint8_t buf[4];
  id v33;

  v6 = a3;
  v7 = a4;
  v8 = _TVRUIServiceLog();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v33 = v6;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Remote Alert -configureWithContext: %{public}@", buf, 0xCu);
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[TVRemoteAlertViewController _remoteViewControllerProxyWithErrorHandler:](self, "_remoteViewControllerProxyWithErrorHandler:", &__block_literal_global));
  if (v10)
  {
    v11 = objc_alloc((Class)TVRViewServiceConfigContext);
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "userInfo"));
    v13 = objc_msgSend(v11, "_initWithUserInfo:", v12);

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject deviceIdentifier](v13, "deviceIdentifier"));
    -[TVRemoteAlertViewController setDeviceIdentifier:](self, "setDeviceIdentifier:", v14);

    v15 = _TVRUIServiceLog();
    v16 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[TVRemoteAlertViewController deviceIdentifier](self, "deviceIdentifier"));
      *(_DWORD *)buf = 138412290;
      v33 = v17;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Remote Alert received device id %@", buf, 0xCu);

    }
    -[TVRemoteAlertViewController setDeviceIdentifierType:](self, "setDeviceIdentifierType:", -[NSObject deviceIdentifierType](v13, "deviceIdentifierType"));
    -[TVRemoteAlertViewController setDeviceType:](self, "setDeviceType:", -[NSObject deviceType](v13, "deviceType"));
    -[TVRemoteAlertViewController setLaunchContext:](self, "setLaunchContext:", -[NSObject launchContext](v13, "launchContext"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject lastActiveEndpointIdentifier](v13, "lastActiveEndpointIdentifier"));
    -[TVRemoteAlertViewController setLastActiveEndpointIdentifier:](self, "setLastActiveEndpointIdentifier:", v18);

    v19 = _TVRUIServiceLog();
    v20 = objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject lastActiveEndpointIdentifier](v13, "lastActiveEndpointIdentifier"));
      *(_DWORD *)buf = 138412290;
      v33 = v21;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Remote Alert received last active identifier %@", buf, 0xCu);

    }
    if (-[NSObject dismissalType](v13, "dismissalType")
      || (v22 = (void *)objc_claimAutoreleasedReturnValue(-[TVRemoteAlertViewController visualStyle](self, "visualStyle")),
          v23 = objc_msgSend(v22, "allowsSwipeToDismiss"),
          v22,
          !v23))
    {
      objc_msgSend(v10, "setSwipeDismissalStyle:", 0);
      v27 = _TVRUIServiceLog();
      v25 = objc_claimAutoreleasedReturnValue(v27);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        v26 = "Remote alert proxy configured with swipe dismissal style SBUIRemoteAlertSwipeDismissalStyleNone";
        goto LABEL_14;
      }
    }
    else
    {
      objc_msgSend(v10, "setSwipeDismissalStyle:", 1);
      v24 = _TVRUIServiceLog();
      v25 = objc_claimAutoreleasedReturnValue(v24);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        v26 = "Remote alert proxy configured with swipe dismissal style SBUIRemoteAlertSwipeDismissalStyleDismissToCurrentApps";
LABEL_14:
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, v26, buf, 2u);
      }
    }

    objc_msgSend(v10, "setAllowsAlertStacking:", 1);
    objc_msgSend(v10, "setDismissalAnimationStyle:", 0);
    objc_msgSend(v10, "setAllowsMenuButtonDismissal:", 1);
    objc_msgSend(v10, "setDesiredHardwareButtonEvents:", 22);
    v28 = _TVRUIServiceLog();
    v29 = objc_claimAutoreleasedReturnValue(v28);
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v33 = v6;
      _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "Remote alert proxy configured with context: %{public}@", buf, 0xCu);
    }

    v31.receiver = self;
    v31.super_class = (Class)TVRemoteAlertViewController;
    -[TVRemoteAlertViewController configureWithContext:completion:](&v31, "configureWithContext:completion:", v6, v7);
    goto LABEL_20;
  }
  v30 = _TVRUIServiceLog();
  v13 = objc_claimAutoreleasedReturnValue(v30);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    -[TVRemoteAlertViewController configureWithContext:completion:].cold.1(v13);
LABEL_20:

}

void __63__TVRemoteAlertViewController_configureWithContext_completion___block_invoke(id a1, NSError *a2)
{
  NSError *v2;
  id v3;
  NSObject *v4;

  v2 = a2;
  v3 = _TVRUIServiceLog();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __63__TVRemoteAlertViewController_configureWithContext_completion___block_invoke_cold_1(v2, v4);

}

- (void)handleButtonActions:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  _QWORD v7[5];
  uint8_t buf[4];
  id v9;

  v4 = a3;
  v5 = _TVRUIServiceLog();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v9 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Remote Alert -handleButtonActions: %{public}@", buf, 0xCu);
  }

  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = __51__TVRemoteAlertViewController_handleButtonActions___block_invoke;
  v7[3] = &unk_100014858;
  v7[4] = self;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v7);

}

void __51__TVRemoteAlertViewController_handleButtonActions___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  NSObject *v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  unsigned int v10;
  void *v11;
  id v12;
  NSObject *v13;
  void *v14;
  uint8_t v15[16];
  uint8_t v16[16];
  uint8_t buf[16];

  v3 = a2;
  if ((objc_msgSend(v3, "events") & 0x10) != 0)
  {
    v7 = _TVRUIServiceLog();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "SBUIRemoteAlertServiceButtonEventHomeButton button action, dismissing", buf, 2u);
    }

    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "hintsViewController"));
    v10 = objc_msgSend(v9, "hasPresentedContent");

    v11 = *(void **)(a1 + 32);
    if (!v10)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "remoteControlViewController"));
      objc_msgSend(v14, "_disconnectUserInitiated");

      objc_msgSend(*(id *)(a1 + 32), "_dismiss");
      goto LABEL_16;
    }
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "hintsViewController"));
    objc_msgSend(v6, "dismissPresentedContentAnimated:completion:", 1, 0);
    goto LABEL_14;
  }
  if ((objc_msgSend(v3, "events") & 2) != 0)
  {
    v12 = _TVRUIServiceLog();
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v16 = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "SBUIRemoteAlertServiceButtonEventVolumeUpButton button action", v16, 2u);
    }

    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "remoteControlViewController"));
    objc_msgSend(v6, "volumeUpEventGenerated");
    goto LABEL_14;
  }
  if ((objc_msgSend(v3, "events") & 4) != 0)
  {
    v4 = _TVRUIServiceLog();
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v15 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "SBUIRemoteAlertServiceButtonEventVolumeDownButton button action", v15, 2u);
    }

    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "remoteControlViewController"));
    objc_msgSend(v6, "volumeDownEventGenerated");
LABEL_14:

  }
LABEL_16:

}

- (void)_dismiss
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  _BOOL4 v14;
  id v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  id v21;
  NSObject *v22;
  id v23;
  id v24;
  void *v25;
  _QWORD v26[5];
  uint8_t buf[16];

  v3 = _TVRUIServiceLog();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Dismissing alert", buf, 2u);
  }

  -[TVRemoteAlertViewController _dismissPresentedContentAnimated:](self, "_dismissPresentedContentAnimated:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVRemoteAlertViewController hintsViewController](self, "hintsViewController"));
  objc_msgSend(v5, "remoteWillBeDismissed");

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVRemoteAlertViewController hintsViewController](self, "hintsViewController"));
  objc_msgSend(v6, "dismissHints");

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVRemoteAlertViewController remoteControlViewController](self, "remoteControlViewController"));
  objc_msgSend(v7, "_disconnectUserInitiated");

  v8 = objc_alloc_init((Class)_UIViewControllerOneToOneTransitionContext);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[TVRemoteAlertViewController remoteControlViewController](self, "remoteControlViewController"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "view"));
  objc_msgSend(v8, "_setFromView:", v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[TVRemoteAlertViewController view](self, "view"));
  objc_msgSend(v8, "_setToView:", v11);

  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = __39__TVRemoteAlertViewController__dismiss__block_invoke;
  v26[3] = &unk_1000147C8;
  v26[4] = self;
  LODWORD(v10) = _AXSReduceMotionEnabled(objc_msgSend(v8, "_setCompletionHandler:", v26));
  v12 = _TVRUIServiceLog();
  v13 = objc_claimAutoreleasedReturnValue(v12);
  v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
  if ((_DWORD)v10)
  {
    if (v14)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Dismissing with TVRemoteAlertFadeAnimationController", buf, 2u);
    }

    v15 = objc_alloc((Class)TVRUIAlertFadeAnimationController);
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[TVRemoteAlertViewController visualStyle](self, "visualStyle"));
    v17 = objc_msgSend(v15, "initWithAnimationType:visualStyle:", 1, v16);
  }
  else
  {
    if (v14)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Dismissing with TVRUIAlertAnimationController", buf, 2u);
    }

    v18 = objc_alloc((Class)TVRUIAlertAnimationController);
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[TVRemoteAlertViewController visualStyle](self, "visualStyle"));
    v17 = objc_msgSend(v18, "initWithAnimationType:visualStyle:", 1, v19);

    v16 = (void *)objc_claimAutoreleasedReturnValue(-[TVRemoteAlertViewController backgroundMaterialView](self, "backgroundMaterialView"));
    objc_msgSend(v17, "setBackgroundMaterialView:", v16);
  }

  objc_msgSend(v17, "animateTransition:", v8);
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[TVRemoteAlertViewController dismissalAction](self, "dismissalAction"));

  if (v20)
  {
    v21 = _TVRUIServiceLog();
    v22 = objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Remote Alert dismissal action provided, sending back animation response", buf, 2u);
    }

    v23 = objc_alloc_init((Class)BSMutableSettings);
    objc_msgSend(v23, "setObject:forSetting:", &off_100015160, 2);
    v24 = objc_msgSend(objc_alloc((Class)BSActionResponse), "initWithInfo:error:", v23, 0);
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[TVRemoteAlertViewController dismissalAction](self, "dismissalAction"));
    objc_msgSend(v25, "sendResponse:", v24);

    -[TVRemoteAlertViewController setDismissalAction:](self, "setDismissalAction:", 0);
  }

}

id __39__TVRemoteAlertViewController__dismiss__block_invoke(uint64_t a1)
{
  void *v2;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "backgroundMaterialView"));
  objc_msgSend(v2, "removeFromSuperview");

  return objc_msgSend(*(id *)(a1 + 32), "alertDidFinishDismissal:", 1);
}

- (void)_dismissPresentedContentAnimated:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  unsigned int v6;
  void *v7;
  void *v8;
  unsigned int v9;
  id v10;

  v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVRemoteAlertViewController remoteControlViewController](self, "remoteControlViewController"));
  v6 = objc_msgSend(v5, "hasPresentedContent");

  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVRemoteAlertViewController remoteControlViewController](self, "remoteControlViewController"));
    objc_msgSend(v7, "dismissPresentedContentAnimated:completion:", v3, 0);

  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVRemoteAlertViewController hintsViewController](self, "hintsViewController"));
  v9 = objc_msgSend(v8, "hasPresentedContent");

  if (v9)
  {
    v10 = (id)objc_claimAutoreleasedReturnValue(-[TVRemoteAlertViewController hintsViewController](self, "hintsViewController"));
    objc_msgSend(v10, "dismissPresentedContentAnimated:completion:", v3, 0);

  }
}

- (BOOL)isWakingToLockScreen
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TVRemoteAlertViewController activationReason](self, "activationReason"));
  v3 = objc_msgSend(v2, "isEqualToString:", SBSRemoteAlertActivationReasonWakeTo);

  return v3;
}

+ (BOOL)_isSecureForRemoteViewService
{
  return 1;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (TVRUIRemoteViewController)remoteControlViewController
{
  return self->_remoteControlViewController;
}

- (void)setRemoteControlViewController:(id)a3
{
  objc_storeStrong((id *)&self->_remoteControlViewController, a3);
}

- (TVRUIHintsViewController)hintsViewController
{
  return self->_hintsViewController;
}

- (void)setHintsViewController:(id)a3
{
  objc_storeStrong((id *)&self->_hintsViewController, a3);
}

- (TVRemoteAlertVisualStyleProviding)visualStyle
{
  return self->_visualStyle;
}

- (void)setVisualStyle:(id)a3
{
  objc_storeStrong((id *)&self->_visualStyle, a3);
}

- (TVRMaterialView)backgroundMaterialView
{
  return self->_backgroundMaterialView;
}

- (void)setBackgroundMaterialView:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundMaterialView, a3);
}

- (NSString)deviceIdentifier
{
  return self->_deviceIdentifier;
}

- (void)setDeviceIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (int64_t)deviceIdentifierType
{
  return self->_deviceIdentifierType;
}

- (void)setDeviceIdentifierType:(int64_t)a3
{
  self->_deviceIdentifierType = a3;
}

- (int64_t)deviceType
{
  return self->_deviceType;
}

- (void)setDeviceType:(int64_t)a3
{
  self->_deviceType = a3;
}

- (int64_t)launchContext
{
  return self->_launchContext;
}

- (void)setLaunchContext:(int64_t)a3
{
  self->_launchContext = a3;
}

- (NSString)lastActiveEndpointIdentifier
{
  return self->_lastActiveEndpointIdentifier;
}

- (void)setLastActiveEndpointIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_lastActiveEndpointIdentifier, a3);
}

- (BSAction)presentationAction
{
  return self->_presentationAction;
}

- (void)setPresentationAction:(id)a3
{
  objc_storeStrong((id *)&self->_presentationAction, a3);
}

- (BSAction)dismissalAction
{
  return self->_dismissalAction;
}

- (void)setDismissalAction:(id)a3
{
  objc_storeStrong((id *)&self->_dismissalAction, a3);
}

- (NSString)activationReason
{
  return self->_activationReason;
}

- (void)setActivationReason:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activationReason, 0);
  objc_storeStrong((id *)&self->_dismissalAction, 0);
  objc_storeStrong((id *)&self->_presentationAction, 0);
  objc_storeStrong((id *)&self->_lastActiveEndpointIdentifier, 0);
  objc_storeStrong((id *)&self->_deviceIdentifier, 0);
  objc_storeStrong((id *)&self->_backgroundMaterialView, 0);
  objc_storeStrong((id *)&self->_visualStyle, 0);
  objc_storeStrong((id *)&self->_hintsViewController, 0);
  objc_storeStrong((id *)&self->_remoteControlViewController, 0);
}

- (void)prepareForActivationWithContext:(os_log_t)log completion:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_fault_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_FAULT, "Sharing provided a nil deviceIdentifier after tap-to-setup", v1, 2u);
}

- (void)configureWithContext:(os_log_t)log completion:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "SBUIRemoteAlertHostInterface proxy is nil", v1, 2u);
}

void __63__TVRemoteAlertViewController_configureWithContext_completion___block_invoke_cold_1(void *a1, NSObject *a2)
{
  void *v3;
  int v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "localizedDescription"));
  v4 = 138543362;
  v5 = v3;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Remote alert failed to obtain proxy %{public}@", (uint8_t *)&v4, 0xCu);

}

@end
