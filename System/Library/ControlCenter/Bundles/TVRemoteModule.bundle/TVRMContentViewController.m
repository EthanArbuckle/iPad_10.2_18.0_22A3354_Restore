@implementation TVRMContentViewController

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)TVRMContentViewController;
  -[TVRMContentViewController viewWillAppear:](&v4, sel_viewWillAppear_, a3);
  -[TVRMContentViewController _prewarm](self, "_prewarm");
}

- (void)viewWillLayoutSubviews
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  objc_super v23;

  v23.receiver = self;
  v23.super_class = (Class)TVRMContentViewController;
  -[CCUIButtonModuleViewController viewWillLayoutSubviews](&v23, sel_viewWillLayoutSubviews);
  if (-[CCUIButtonModuleViewController isExpanded](self, "isExpanded"))
  {
    -[CCUIButtonModuleViewController buttonView](self, "buttonView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setAlpha:", 0.0);

    -[TVRMContentViewController remoteControlViewController](self, "remoteControlViewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setAlpha:", 1.0);

    +[TVRMDeviceInfo expandedRoundedCornerRadius](TVRMDeviceInfo, "expandedRoundedCornerRadius");
  }
  else
  {
    -[TVRMContentViewController remoteControlViewController](self, "remoteControlViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "view");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setAlpha:", 0.0);

    -[CCUIButtonModuleViewController buttonView](self, "buttonView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setAlpha:", 1.0);

    -[CCUIButtonModuleViewController compactContinuousCornerRadius](self, "compactContinuousCornerRadius");
  }
  v10 = v6;
  -[TVRMContentViewController remoteControlViewController](self, "remoteControlViewController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setBackgroundCornerRadius:", v10);

  -[TVRMContentViewController view](self, "view");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "bounds");
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v20 = v19;
  -[TVRMContentViewController remoteControlViewController](self, "remoteControlViewController");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "view");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setFrame:", v14, v16, v18, v20);

}

- (id)title
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("APP_NAME"), &stru_24FFE4B90, CFSTR("Localizable"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)valueText
{
  return 0;
}

- (unint64_t)supportedInterfaceOrientations
{
  void *v2;
  unint64_t v3;

  -[TVRMContentViewController traitCollection](self, "traitCollection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "userInterfaceIdiom") == 1)
    v3 = 30;
  else
    v3 = 2;

  return v3;
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  id v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  _QWORD v15[5];
  _OWORD v16[3];
  __int128 v17;
  __int128 v18;
  __int128 v19;
  objc_super v20;
  __int128 buf;
  __int128 v22;
  __int128 v23;
  uint64_t v24;
  CGSize v25;

  height = a3.height;
  width = a3.width;
  v24 = *MEMORY[0x24BDAC8D0];
  v7 = a4;
  v20.receiver = self;
  v20.super_class = (Class)TVRMContentViewController;
  -[TVRMContentViewController viewWillTransitionToSize:withTransitionCoordinator:](&v20, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  -[TVRMContentViewController setTransitionSize:](self, "setTransitionSize:", width, height);
  v8 = -[CCUIButtonModuleViewController isExpanded](self, "isExpanded") ^ 1;
  -[CCUIButtonModuleViewController buttonView](self, "buttonView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setEnabled:", v8);

  if (_AXSReduceMotionEnabled())
  {
    v22 = 0u;
    v23 = 0u;
    buf = 0u;
    if (-[CCUIButtonModuleViewController isExpanded](self, "isExpanded"))
    {
      v10 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
      buf = *MEMORY[0x24BDBD8B8];
      v22 = v10;
      v23 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 32);
    }
    else
    {
      -[TVRMContentViewController transitionSize](self, "transitionSize");
      -[TVRMContentViewController _defaultScaledTransformForSize:](self, "_defaultScaledTransformForSize:");
    }
    v17 = buf;
    v18 = v22;
    v19 = v23;
    -[TVRMContentViewController remoteControlViewController](self, "remoteControlViewController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "view");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = v17;
    v16[1] = v18;
    v16[2] = v19;
    objc_msgSend(v12, "setTransform:", v16);

  }
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __80__TVRMContentViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v15[3] = &unk_24FFE4AA0;
  v15[4] = self;
  objc_msgSend(v7, "animateAlongsideTransition:completion:", v15, 0);
  _TVRMControlCenterLog();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v25.width = width;
    v25.height = height;
    NSStringFromCGSize(v25);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v14;
    _os_log_impl(&dword_231026000, v13, OS_LOG_TYPE_DEFAULT, "View will transition to size %@ requested", (uint8_t *)&buf, 0xCu);

  }
}

void __80__TVRMContentViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "view");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "layoutIfNeeded");

}

- (UIViewPropertyAnimator)customAnimator
{
  NSObject *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  _QWORD v9[5];
  _QWORD v10[5];
  uint8_t buf[4];
  _BOOL4 v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  _TVRMControlCenterLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    v12 = -[CCUIButtonModuleViewController isExpanded](self, "isExpanded");
    _os_log_impl(&dword_231026000, v3, OS_LOG_TYPE_DEFAULT, "Custom animator requested. expanded = %{BOOL}d", buf, 8u);
  }

  if (-[CCUIButtonModuleViewController isExpanded](self, "isExpanded"))
  {
    objc_msgSend(MEMORY[0x24BEB4160], "standardSpringAnimator");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __43__TVRMContentViewController_customAnimator__block_invoke;
    v10[3] = &unk_24FFE4AC8;
    v10[4] = self;
    objc_msgSend(v4, "addAnimations:", v10);
    _TVRMControlCenterLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_231026000, v5, OS_LOG_TYPE_DEFAULT, "Show animator created", buf, 2u);
    }

  }
  else
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6DC8]), "initWithMass:stiffness:damping:initialVelocity:", 3.0, 300.0, 55.0, 10.0, 10.0);
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6FA8]), "initWithDuration:timingParameters:", v6, 0.0);
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __43__TVRMContentViewController_customAnimator__block_invoke_15;
    v9[3] = &unk_24FFE4AC8;
    v9[4] = self;
    objc_msgSend(v4, "addAnimations:", v9);
    _TVRMControlCenterLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_231026000, v7, OS_LOG_TYPE_DEFAULT, "Dismiss animator created", buf, 2u);
    }

  }
  return (UIViewPropertyAnimator *)v4;
}

void __43__TVRMContentViewController_customAnimator__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  __int128 v10;
  _OWORD v11[3];

  objc_msgSend(*(id *)(a1 + 32), "remoteControlViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAlpha:", 1.0);

  objc_msgSend(*(id *)(a1 + 32), "buttonView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAlpha:", 0.0);

  +[TVRMDeviceInfo expandedRoundedCornerRadius](TVRMDeviceInfo, "expandedRoundedCornerRadius");
  v6 = v5;
  objc_msgSend(*(id *)(a1 + 32), "remoteControlViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setBackgroundCornerRadius:", v6);

  objc_msgSend(*(id *)(a1 + 32), "remoteControlViewController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
  v11[0] = *MEMORY[0x24BDBD8B8];
  v11[1] = v10;
  v11[2] = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 32);
  objc_msgSend(v9, "setTransform:", v11);

}

void __43__TVRMContentViewController_customAnimator__block_invoke_15(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _OWORD v11[3];
  __int128 v12;
  __int128 v13;
  __int128 v14;

  objc_msgSend(*(id *)(a1 + 32), "remoteControlViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAlpha:", 0.0);

  objc_msgSend(*(id *)(a1 + 32), "buttonView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAlpha:", 1.0);

  objc_msgSend(*(id *)(a1 + 32), "compactContinuousCornerRadius");
  v6 = v5;
  objc_msgSend(*(id *)(a1 + 32), "remoteControlViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setBackgroundCornerRadius:", v6);

  v8 = *(void **)(a1 + 32);
  objc_msgSend(v8, "transitionSize");
  if (v8)
  {
    objc_msgSend(v8, "_defaultScaledTransformForSize:");
  }
  else
  {
    v13 = 0u;
    v14 = 0u;
    v12 = 0u;
  }
  objc_msgSend(*(id *)(a1 + 32), "remoteControlViewController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v12;
  v11[1] = v13;
  v11[2] = v14;
  objc_msgSend(v10, "setTransform:", v11);

}

- (void)_createRemoteControlViewControllerIfNeeded
{
  void *v3;
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  _BOOL8 v17;
  void *v18;
  void *v19;
  void *v20;
  TVRUIRemoteViewController *v21;
  TVRUIRemoteViewController *remoteControlViewController;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  double v30;
  double v31;
  void *v32;
  void *v33;
  void *v34;
  _OWORD v35[6];

  -[TVRMContentViewController remoteControlViewController](self, "remoteControlViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v4 = objc_alloc_init(MEMORY[0x24BEB4168]);
    -[TVRMContentViewController setHintsViewController:](self, "setHintsViewController:", v4);

    -[TVRMContentViewController view](self, "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bounds");
    v7 = v6;
    v9 = v8;
    v11 = v10;
    v13 = v12;
    -[TVRMContentViewController hintsViewController](self, "hintsViewController");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "view");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setFrame:", v7, v9, v11, v13);

    objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "userInterfaceIdiom") != 1;

    -[TVRMContentViewController hintsViewController](self, "hintsViewController");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setAllowSiriHint:", v17);

    -[TVRMContentViewController hintsViewController](self, "hintsViewController");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setAllowVolumeHint:", v17);

    -[TVRMContentViewController hintsViewController](self, "hintsViewController");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setAllowTips:", v17);

    v21 = (TVRUIRemoteViewController *)objc_alloc_init(MEMORY[0x24BEB4170]);
    remoteControlViewController = self->_remoteControlViewController;
    self->_remoteControlViewController = v21;

    -[TVRMContentViewController hintsViewController](self, "hintsViewController");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[TVRUIRemoteViewController setDelegate:](self->_remoteControlViewController, "setDelegate:", v23);

    -[TVRUIRemoteViewController view](self->_remoteControlViewController, "view");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setAlpha:", 0.0);

    -[TVRMContentViewController bs_addChildViewController:](self, "bs_addChildViewController:", self->_remoteControlViewController);
    -[TVRMContentViewController hintsViewController](self, "hintsViewController");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[TVRMContentViewController bs_addChildViewController:](self, "bs_addChildViewController:", v25);

    -[TVRMContentViewController view](self, "view");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[TVRMContentViewController hintsViewController](self, "hintsViewController");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "view");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "bringSubviewToFront:", v28);

    if (!-[CCUIButtonModuleViewController isExpanded](self, "isExpanded"))
    {
      -[TVRMContentViewController view](self, "view");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "bounds");
      -[TVRMContentViewController _defaultScaledTransformForSize:](self, "_defaultScaledTransformForSize:", v30, v31);
      -[TVRMContentViewController remoteControlViewController](self, "remoteControlViewController");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "view");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v35[0] = v35[3];
      v35[1] = v35[4];
      v35[2] = v35[5];
      objc_msgSend(v33, "setTransform:", v35);

      -[TVRMContentViewController view](self, "view");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "layoutIfNeeded");

    }
  }
}

- (void)_startRemoteControlViewController
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  uint8_t v7[16];

  _TVRMControlCenterLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_231026000, v3, OS_LOG_TYPE_DEFAULT, "Module requesting connections to start", v7, 2u);
  }

  -[TVRMContentViewController remoteControlViewController](self, "remoteControlViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVRMContentViewController lastActiveEndpointIdentifier](self, "lastActiveEndpointIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "configureWithDeviceIdentifier:identifierType:deviceType:launchContext:", v5, *MEMORY[0x24BEB4188], 0, 1);

  -[TVRMContentViewController remoteControlViewController](self, "remoteControlViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "startConnections");

  -[TVRMContentViewController setSystemInitiatedDismissal:](self, "setSystemInitiatedDismissal:", 0);
}

- (void)_stopRemoteControlViewController
{
  NSObject *v3;
  void *v4;
  _BOOL4 v5;
  void *v6;
  void *v7;
  void *v8;
  _DWORD v9[2];
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  _TVRMControlCenterLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v9[0] = 67109120;
    v9[1] = -[TVRMContentViewController systemInitiatedDismissal](self, "systemInitiatedDismissal");
    _os_log_impl(&dword_231026000, v3, OS_LOG_TYPE_DEFAULT, "Module requesting connections to stop. systemInitiated %{BOOL}d", (uint8_t *)v9, 8u);
  }

  -[TVRMContentViewController hintsViewController](self, "hintsViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dismissHints");

  -[TVRMContentViewController _dismissChildViewControllersPresentedContentAnimated:completion:](self, "_dismissChildViewControllersPresentedContentAnimated:completion:", 0, 0);
  v5 = -[TVRMContentViewController systemInitiatedDismissal](self, "systemInitiatedDismissal");
  -[TVRMContentViewController remoteControlViewController](self, "remoteControlViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v5)
    objc_msgSend(v6, "_disconnectSystemInitiated");
  else
    objc_msgSend(v6, "_disconnectUserInitiated");

  -[TVRMContentViewController remoteControlViewController](self, "remoteControlViewController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stopConnections");

}

- (void)buttonTapped:(id)a3 forEvent:(id)a4
{
  NSObject *v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  _BOOL4 v9;
  void *v10;
  uint8_t v11[16];
  uint8_t v12[16];
  uint8_t buf[16];

  if (-[TVRMContentViewController shouldLaunchAsViewService](self, "shouldLaunchAsViewService", a3, a4))
  {
    _TVRMControlCenterLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_231026000, v5, OS_LOG_TYPE_DEFAULT, "Module button tapped so launching module as a view service", buf, 2u);
    }

    -[TVRMContentViewController _requestLaunchAsViewService](self, "_requestLaunchAsViewService");
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "userInterfaceIdiom");

    _TVRMControlCenterLog();
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
    if (v7 == 1)
    {
      if (v9)
      {
        *(_WORD *)v11 = 0;
        _os_log_impl(&dword_231026000, v8, OS_LOG_TYPE_DEFAULT, "Module button tapped so requesting module expansion", v11, 2u);
      }

      -[TVRMContentViewController contentModuleContext](self, "contentModuleContext");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "requestExpandModule");
    }
    else
    {
      if (v9)
      {
        *(_WORD *)v12 = 0;
        _os_log_impl(&dword_231026000, v8, OS_LOG_TYPE_DEFAULT, "Module button tapped so requesting app launch", v12, 2u);
      }

      -[TVRMContentViewController contentModuleContext](self, "contentModuleContext");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "openApplication:completionHandler:", CFSTR("com.apple.TVRemoteUIService"), 0);
    }

  }
}

- (double)preferredExpandedContentHeight
{
  void *v2;
  uint64_t v3;
  double Height;
  double v5;
  double v6;
  CGRect v8;

  objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "userInterfaceIdiom");

  CCUIScreenBounds();
  Height = CGRectGetHeight(v8);
  if (v3 == 1)
  {
    +[TVRMDeviceInfo contentEdgeInsets](TVRMDeviceInfo, "contentEdgeInsets");
    v6 = Height + v5 * -2.0;
    if (v6 <= 812.0)
      return v6;
    else
      return 812.0;
  }
  return Height;
}

- (double)preferredExpandedContentWidth
{
  void *v2;
  uint64_t v3;
  CGRect v5;

  objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "userInterfaceIdiom");

  if (v3 == 1)
    return 375.0;
  CCUIScreenBounds();
  return CGRectGetWidth(v5);
}

- (double)preferredExpandedContinuousCornerRadius
{
  double result;

  +[TVRMDeviceInfo expandedRoundedCornerRadius](TVRMDeviceInfo, "expandedRoundedCornerRadius");
  return result;
}

- (BOOL)shouldFinishTransitionToExpandedContentModule
{
  NSObject *v3;
  NSObject *v4;
  const char *v5;
  void *v6;
  uint64_t v7;
  _BOOL4 v8;
  BOOL v9;
  int v11;
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  _TVRMControlCenterLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 136315138;
    v12 = "-[TVRMContentViewController shouldFinishTransitionToExpandedContentModule]";
    _os_log_impl(&dword_231026000, v3, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v11, 0xCu);
  }

  if (-[TVRMContentViewController shouldLaunchAsViewService](self, "shouldLaunchAsViewService"))
  {
    _TVRMControlCenterLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v11) = 0;
      v5 = "Will launch module as a view service";
LABEL_12:
      _os_log_impl(&dword_231026000, v4, OS_LOG_TYPE_DEFAULT, v5, (uint8_t *)&v11, 2u);
      goto LABEL_13;
    }
    goto LABEL_13;
  }
  objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "userInterfaceIdiom");

  _TVRMControlCenterLog();
  v4 = objc_claimAutoreleasedReturnValue();
  v8 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v7 != 1)
  {
    if (v8)
    {
      LOWORD(v11) = 0;
      v5 = "Will launch app";
      goto LABEL_12;
    }
LABEL_13:
    v9 = 0;
    goto LABEL_14;
  }
  if (v8)
  {
    LOWORD(v11) = 0;
    _os_log_impl(&dword_231026000, v4, OS_LOG_TYPE_DEFAULT, "Launching module within cc and not a view service", (uint8_t *)&v11, 2u);
  }
  v9 = 1;
LABEL_14:

  return v9;
}

- (void)willTransitionToExpandedContentMode:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  void *v6;
  objc_super v7;
  uint8_t buf[4];
  const char *v9;
  __int16 v10;
  _BOOL4 v11;
  uint64_t v12;

  v3 = a3;
  v12 = *MEMORY[0x24BDAC8D0];
  _TVRMControlCenterLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v9 = "-[TVRMContentViewController willTransitionToExpandedContentMode:]";
    v10 = 1024;
    v11 = v3;
    _os_log_impl(&dword_231026000, v5, OS_LOG_TYPE_DEFAULT, "%s, expanded=%{BOOL}d", buf, 0x12u);
  }

  if (v3)
  {
    -[TVRMContentViewController _createRemoteControlViewControllerIfNeeded](self, "_createRemoteControlViewControllerIfNeeded");
    -[CCUIContentModuleContext setHomeGestureDismissalAllowed:](self->_contentModuleContext, "setHomeGestureDismissalAllowed:", 1);
    -[TVRMContentViewController _startRemoteControlViewController](self, "_startRemoteControlViewController");
  }
  else
  {
    -[TVRMContentViewController _stopRemoteControlViewController](self, "_stopRemoteControlViewController");
    -[TVRMContentViewController hintsViewController](self, "hintsViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "remoteWillBeDismissed");

  }
  v7.receiver = self;
  v7.super_class = (Class)TVRMContentViewController;
  -[CCUIButtonModuleViewController willTransitionToExpandedContentMode:](&v7, sel_willTransitionToExpandedContentMode_, v3);
}

- (void)displayWillTurnOff
{
  NSObject *v3;
  _DWORD v4[2];
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  -[TVRMContentViewController setSystemInitiatedDismissal:](self, "setSystemInitiatedDismissal:", 1);
  -[TVRMContentViewController _dismissChildViewControllersPresentedContentAnimated:completion:](self, "_dismissChildViewControllersPresentedContentAnimated:completion:", 0, 0);
  _TVRMControlCenterLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4[0] = 67109120;
    v4[1] = -[CCUIButtonModuleViewController isExpanded](self, "isExpanded");
    _os_log_impl(&dword_231026000, v3, OS_LOG_TYPE_DEFAULT, "display will turn off. expanded state %{BOOL}d", (uint8_t *)v4, 8u);
  }

}

- (void)_dismissChildViewControllersPresentedContentAnimated:(BOOL)a3 completion:(id)a4
{
  _BOOL8 v4;
  id v6;
  NSObject *v7;
  void *v8;
  id v9;
  _QWORD v10[5];
  id v11;
  BOOL v12;
  uint8_t buf[4];
  const char *v14;
  uint64_t v15;

  v4 = a3;
  v15 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  _TVRMControlCenterLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v14 = "-[TVRMContentViewController _dismissChildViewControllersPresentedContentAnimated:completion:]";
    _os_log_impl(&dword_231026000, v7, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  -[TVRMContentViewController hintsViewController](self, "hintsViewController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __93__TVRMContentViewController__dismissChildViewControllersPresentedContentAnimated_completion___block_invoke;
  v10[3] = &unk_24FFE4AF0;
  v12 = v4;
  v10[4] = self;
  v11 = v6;
  v9 = v6;
  objc_msgSend(v8, "dismissPresentedContentAnimated:completion:", v4, v10);

}

void __93__TVRMContentViewController__dismissChildViewControllersPresentedContentAnimated_completion___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "remoteControlViewController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dismissPresentedContentAnimated:completion:", *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 40));

}

- (BOOL)canDismissPresentedContent
{
  void *v3;
  int v4;
  void *v5;
  int v6;
  NSObject *v7;
  _DWORD v9[2];
  __int16 v10;
  int v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  -[TVRMContentViewController remoteControlViewController](self, "remoteControlViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hasPresentedContent");

  -[TVRMContentViewController hintsViewController](self, "hintsViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hasPresentedContent");

  _TVRMControlCenterLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v9[0] = 67109376;
    v9[1] = v4;
    v10 = 1024;
    v11 = v6;
    _os_log_impl(&dword_231026000, v7, OS_LOG_TYPE_DEFAULT, "Can dismiss presented content, remoteHasPresentedContent=%{BOOL}d, hintsHasPresentedContent=%{BOOL}d", (uint8_t *)v9, 0xEu);
  }

  return v4 | v6;
}

- (void)dismissPresentedContentAnimated:(BOOL)a3 completion:(id)a4
{
  _BOOL8 v4;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[5];
  id v12;
  BOOL v13;
  uint8_t buf[4];
  void *v15;
  uint64_t v16;

  v4 = a3;
  v16 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  _TVRMControlCenterLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = (void *)MEMORY[0x2348CE520](v6);
    *(_DWORD *)buf = 138412290;
    v15 = v8;
    _os_log_impl(&dword_231026000, v7, OS_LOG_TYPE_DEFAULT, "Dismiss presented content completion %@", buf, 0xCu);

  }
  -[TVRMContentViewController hintsViewController](self, "hintsViewController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __72__TVRMContentViewController_dismissPresentedContentAnimated_completion___block_invoke;
  v11[3] = &unk_24FFE4AF0;
  v13 = v4;
  v11[4] = self;
  v12 = v6;
  v10 = v6;
  objc_msgSend(v9, "dismissPresentedContentAnimated:completion:", v4, v11);

}

void __72__TVRMContentViewController_dismissPresentedContentAnimated_completion___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "remoteControlViewController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dismissPresentedContentAnimated:completion:", *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 40));

}

- (BOOL)shouldLaunchAsViewService
{
  void *v3;
  int v4;
  void *v5;

  objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "userInterfaceIdiom"))
  {
    LOBYTE(v4) = 0;
  }
  else
  {
    -[CCUIButtonModuleViewController buttonView](self, "buttonView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = CCUILayoutShouldBePortrait() ^ 1;

  }
  return v4;
}

- (void)_requestLaunchAsViewService
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  uint8_t v7[16];

  _TVRMControlCenterLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_231026000, v3, OS_LOG_TYPE_DEFAULT, "Requesting launch of TVRemoteUI as view service", v7, 2u);
  }

  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEB4178]), "_initWithLaunchContext:", 1);
  objc_msgSend(v4, "setDismissalType:", 1);
  objc_msgSend(MEMORY[0x24BDD1530], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObserver:selector:name:object:", self, sel__remoteLaunchedAsViewService_, *MEMORY[0x24BEB4190], 0);

  objc_msgSend(MEMORY[0x24BEB4180], "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "presentWithContext:", v4);

}

- (void)_remoteLaunchedAsViewService:(id)a3
{
  void *v4;
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __58__TVRMContentViewController__remoteLaunchedAsViewService___block_invoke;
  block[3] = &unk_24FFE4AC8;
  block[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
  objc_msgSend(MEMORY[0x24BDD1530], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:name:object:", self, *MEMORY[0x24BEB4190], 0);

}

void __58__TVRMContentViewController__remoteLaunchedAsViewService___block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "contentModuleContext");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "dismissControlCenter");

}

- (CGAffineTransform)_defaultScaledTransformForSize:(SEL)a3
{
  double height;
  double width;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;

  height = a4.height;
  width = a4.width;
  -[TVRMContentViewController preferredExpandedContentWidth](self, "preferredExpandedContentWidth");
  v8 = 1.0;
  v9 = 1.0;
  if (v10 > 0.0)
  {
    -[TVRMContentViewController preferredExpandedContentWidth](self, "preferredExpandedContentWidth");
    v9 = width / v11;
  }
  -[TVRMContentViewController preferredExpandedContentHeight](self, "preferredExpandedContentHeight");
  if (v12 > 0.0)
  {
    -[TVRMContentViewController preferredExpandedContentHeight](self, "preferredExpandedContentHeight");
    v8 = height / v13;
  }
  return CGAffineTransformMakeScale(retstr, v9, v8);
}

- (void)_prewarm
{
  _BOOL8 v2;
  void *v3;
  NSObject *v4;
  _DWORD v5[2];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v2 = -[TVRMContentViewController shouldLaunchAsViewService](self, "shouldLaunchAsViewService");
  objc_msgSend(MEMORY[0x24BEB4180], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_prewarmWithLaunchViewService:fetchActiveEndpoint:", v2, 1);

  _TVRMControlCenterLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5[0] = 67109120;
    v5[1] = v2;
    _os_log_impl(&dword_231026000, v4, OS_LOG_TYPE_DEFAULT, "Module prewarm called launchAsViewService %{BOOL}d", (uint8_t *)v5, 8u);
  }

}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (CCUIContentModuleContext)contentModuleContext
{
  return self->_contentModuleContext;
}

- (void)setContentModuleContext:(id)a3
{
  objc_storeStrong((id *)&self->_contentModuleContext, a3);
}

- (UIViewController)backgroundViewController
{
  return self->_backgroundViewController;
}

- (void)setBackgroundViewController:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundViewController, a3);
}

- (BOOL)isShowingButtonGlyph
{
  return self->_showButtonGlyph;
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

- (NSString)lastActiveEndpointIdentifier
{
  return self->_lastActiveEndpointIdentifier;
}

- (void)setLastActiveEndpointIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_lastActiveEndpointIdentifier, a3);
}

- (CGSize)transitionSize
{
  double width;
  double height;
  CGSize result;

  width = self->_transitionSize.width;
  height = self->_transitionSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setTransitionSize:(CGSize)a3
{
  self->_transitionSize = a3;
}

- (TVRUICubicSpringAnimator)remoteShowAnimator
{
  return self->_remoteShowAnimator;
}

- (void)setRemoteShowAnimator:(id)a3
{
  objc_storeStrong((id *)&self->_remoteShowAnimator, a3);
}

- (UIViewPropertyAnimator)remoteDismissAnimator
{
  return self->_remoteDismissAnimator;
}

- (void)setRemoteDismissAnimator:(id)a3
{
  objc_storeStrong((id *)&self->_remoteDismissAnimator, a3);
}

- (BOOL)systemInitiatedDismissal
{
  return self->_systemInitiatedDismissal;
}

- (void)setSystemInitiatedDismissal:(BOOL)a3
{
  self->_systemInitiatedDismissal = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteDismissAnimator, 0);
  objc_storeStrong((id *)&self->_remoteShowAnimator, 0);
  objc_storeStrong((id *)&self->_lastActiveEndpointIdentifier, 0);
  objc_storeStrong((id *)&self->_hintsViewController, 0);
  objc_storeStrong((id *)&self->_remoteControlViewController, 0);
  objc_storeStrong((id *)&self->_backgroundViewController, 0);
  objc_storeStrong((id *)&self->_contentModuleContext, 0);
}

@end
