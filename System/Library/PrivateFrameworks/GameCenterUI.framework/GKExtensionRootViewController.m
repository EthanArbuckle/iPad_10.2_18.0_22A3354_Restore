@implementation GKExtensionRootViewController

- (GKExtensionRootViewController)initWithCoder:(id)a3
{
  GKExtensionRootViewController *v3;
  GKExtensionRootViewController *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GKExtensionRootViewController;
  v3 = -[GKExtensionRootViewController initWithCoder:](&v6, sel_initWithCoder_, a3);
  v4 = v3;
  if (v3)
    -[GKExtensionRootViewController setup](v3, "setup");
  return v4;
}

- (GKExtensionRootViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  GKExtensionRootViewController *v4;
  GKExtensionRootViewController *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GKExtensionRootViewController;
  v4 = -[GKExtensionRootViewController initWithNibName:bundle:](&v7, sel_initWithNibName_bundle_, a3, a4);
  v5 = v4;
  if (v4)
    -[GKExtensionRootViewController setup](v4, "setup");
  return v5;
}

- (void)setup
{
  void *v3;
  uint64_t v4;
  void *v5;

  GKUISetRemote();
  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "userInterfaceIdiom");

  if (v4 == 1)
  {
    -[GKExtensionRootViewController setModalPresentationStyle:](self, "setModalPresentationStyle:", 16);
    objc_msgSend(MEMORY[0x1E0D25B40], "sharedTheme");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "formSheetSize");
    -[GKExtensionRootViewController setPreferredContentSize:](self, "setPreferredContentSize:");

    *MEMORY[0x1E0D25B68] = 0;
  }
  else
  {
    -[GKExtensionRootViewController setModalPresentationStyle:](self, "setModalPresentationStyle:", 17);
  }
  self->_alwaysShowDoneButton = 1;
  self->_adjustTopConstraint = 1;
}

- (void)viewDidLoad
{
  id v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)GKExtensionRootViewController;
  -[GKExtensionRootViewController viewDidLoad](&v4, sel_viewDidLoad);
  -[GKExtensionRootViewController setOverrideUserInterfaceStyle:](self, "setOverrideUserInterfaceStyle:", 2);
  if (-[GKExtensionRootViewController _useBackdropViewForWindowBackground](self, "_useBackdropViewForWindowBackground"))
  {
    v3 = objc_alloc_init(MEMORY[0x1E0DC3F58]);
    -[GKExtensionRootViewController setEffectView:](self, "setEffectView:", v3);

    -[GKExtensionRootViewController setupVisualEffects](self, "setupVisualEffects");
  }
}

- (int64_t)preferredStatusBarStyle
{
  return 1;
}

- (void)setupVisualEffects
{
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0DC3F50], "_gkGameLayerBackgroundVisualEffect");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKExtensionRootViewController effectView](self, "effectView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBackgroundEffects:", v3);

  -[GKExtensionRootViewController effectView](self, "effectView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_setGroupName:", CFSTR("gameLayerGroup"));

}

- (id)daemonProxy
{
  return (id)objc_msgSend(MEMORY[0x1E0D25298], "daemonProxy");
}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  objc_super v28;

  v3 = a3;
  -[GKExtensionRootViewController daemonProxy](self, "daemonProxy");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDataUpdateDelegate:", self);

  v28.receiver = self;
  v28.super_class = (Class)GKExtensionRootViewController;
  -[GKExtensionRootViewController viewWillAppear:](&v28, sel_viewWillAppear_, v3);
  if (-[GKExtensionRootViewController hasInitialData](self, "hasInitialData"))
  {
    -[GKExtensionRootViewController contentViewController](self, "contentViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
      -[GKExtensionRootViewController constructContentViewController](self, "constructContentViewController");
  }
  if (-[GKExtensionRootViewController _useBackdropViewForWindowBackground](self, "_useBackdropViewForWindowBackground"))
  {
    -[GKExtensionRootViewController setupVisualEffects](self, "setupVisualEffects");
    -[GKExtensionRootViewController view](self, "view");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "bounds");
    v9 = v8;
    v11 = v10;
    v13 = v12;
    v15 = v14;
    -[GKExtensionRootViewController effectView](self, "effectView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setFrame:", v9, v11, v13, v15);

    -[GKExtensionRootViewController effectView](self, "effectView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    -[GKExtensionRootViewController parentViewController](self, "parentViewController");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "view");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "window");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "rootViewController");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "view");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = v22;
    if (v22)
    {
      v24 = v22;
    }
    else
    {
      -[GKExtensionRootViewController parentViewController](self, "parentViewController");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "view");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "window");
      v24 = (id)objc_claimAutoreleasedReturnValue();

    }
    -[GKExtensionRootViewController addVisualEffectViewForView:](self, "addVisualEffectViewForView:", v24);

  }
  if (-[GKExtensionRootViewController hasInitialData](self, "hasInitialData"))
  {
    -[GKExtensionRootViewController contentViewController](self, "contentViewController");
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v27)
      -[GKExtensionRootViewController constructContentViewController](self, "constructContentViewController");
  }
}

- (void)viewWillLayoutSubviews
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  objc_super v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v23.receiver = self;
  v23.super_class = (Class)GKExtensionRootViewController;
  -[GKExtensionRootViewController viewWillLayoutSubviews](&v23, sel_viewWillLayoutSubviews);
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  -[GKExtensionRootViewController childViewControllers](self, "childViewControllers", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v20;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v20 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * v7);
        -[GKExtensionRootViewController view](self, "view");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "bounds");
        v11 = v10;
        v13 = v12;
        v15 = v14;
        v17 = v16;
        objc_msgSend(v8, "view");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "setFrame:", v11, v13, v15, v17);

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
    }
    while (v5);
  }

}

- (void)viewDidAppear:(BOOL)a3
{
  _QWORD *v4;
  id v5;
  os_log_t *v6;
  NSObject *v7;
  id v8;
  NSObject *v9;
  uint8_t v10[16];
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)GKExtensionRootViewController;
  -[GKExtensionRootViewController viewDidAppear:](&v11, sel_viewDidAppear_, a3);
  v4 = (_QWORD *)MEMORY[0x1E0D25460];
  if (!*MEMORY[0x1E0D25460])
    v5 = (id)GKOSLoggers();
  v6 = (os_log_t *)MEMORY[0x1E0D25480];
  v7 = *MEMORY[0x1E0D25480];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D25480], OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v10 = 0;
    _os_log_impl(&dword_1AB361000, v7, OS_LOG_TYPE_INFO, "GKExtensionRootViewController viewDidAppear called", v10, 2u);
  }
  -[GKExtensionRootViewController becomeFirstResponder](self, "becomeFirstResponder");
  if (!*v4)
    v8 = (id)GKOSLoggers();
  v9 = *v6;
  if (os_log_type_enabled(*v6, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v10 = 0;
    _os_log_impl(&dword_1AB361000, v9, OS_LOG_TYPE_INFO, "ControllerSupport: Focus system activated by calling becomeFirstResponder", v10, 2u);
  }
}

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (void)addVisualEffectViewForView:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  objc_msgSend(v4, "viewWithTag:", 678);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeFromSuperview");

  v8 = objc_alloc_init(MEMORY[0x1E0DC3F58]);
  objc_msgSend(MEMORY[0x1E0DC3F50], "_gkGameLayerBackgroundVisualEffect");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setBackgroundEffects:", v6);

  -[GKExtensionRootViewController effectView](self, "effectView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_setGroupName:", CFSTR("gameLayerGroup"));

  objc_msgSend(v8, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v8, "setTag:", 678);
  objc_msgSend(v4, "insertSubview:atIndex:", v8, 0);
  objc_msgSend(MEMORY[0x1E0CB3718], "_gkInstallEdgeConstraintsForView:containedWithinParentView:", v8, v4);

}

- (void)viewDidDisappear:(BOOL)a3
{
  void *v4;
  GKExtensionRootViewController *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GKExtensionRootViewController;
  -[GKExtensionRootViewController viewDidDisappear:](&v7, sel_viewDidDisappear_, a3);
  -[GKExtensionRootViewController setViewControllers:animated:](self, "setViewControllers:animated:", MEMORY[0x1E0C9AA60], 0);
  -[GKExtensionRootViewController setContentViewController:](self, "setContentViewController:", 0);
  -[GKExtensionRootViewController daemonProxy](self, "daemonProxy");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dataUpdateDelegate");
  v5 = (GKExtensionRootViewController *)objc_claimAutoreleasedReturnValue();

  if (v5 == self)
  {
    -[GKExtensionRootViewController daemonProxy](self, "daemonProxy");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setDataUpdateDelegate:", 0);

  }
}

- (void)willTransitionToTraitCollection:(id)a3 withTransitionCoordinator:(id)a4
{
  id v6;
  _QWORD v7[5];
  objc_super v8;

  v6 = a4;
  v8.receiver = self;
  v8.super_class = (Class)GKExtensionRootViewController;
  -[GKExtensionRootViewController willTransitionToTraitCollection:withTransitionCoordinator:](&v8, sel_willTransitionToTraitCollection_withTransitionCoordinator_, a3, v6);
  if (-[GKExtensionRootViewController requiresNavigationController](self, "requiresNavigationController"))
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __91__GKExtensionRootViewController_willTransitionToTraitCollection_withTransitionCoordinator___block_invoke;
    v7[3] = &unk_1E59C4FB0;
    v7[4] = self;
    objc_msgSend(v6, "animateAlongsideTransition:completion:", v7, &__block_literal_global_9);
  }

}

void __91__GKExtensionRootViewController_willTransitionToTraitCollection_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  double Height;
  void *v3;
  void *v4;
  id v5;
  CGRect v6;

  Height = 0.0;
  if (objc_msgSend(*(id *)(a1 + 32), "adjustTopConstraint"))
  {
    objc_msgSend(*(id *)(a1 + 32), "navigationController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "navigationBar");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "bounds");
    Height = CGRectGetHeight(v6);

  }
  objc_msgSend(*(id *)(a1 + 32), "effectTopConstraint");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setConstant:", Height);

}

- (BOOL)_useBackdropViewForWindowBackground
{
  return 1;
}

- (void)constructContentViewController
{
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0D25298], "proxyForLocalPlayer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "profileServicePrivate");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "startContactsIntegrationSyncWithOptions:completionHandler:", 2, &__block_literal_global_20);
  -[GKExtensionRootViewController configureContentViewController](self, "configureContentViewController");

}

void __63__GKExtensionRootViewController_constructContentViewController__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  NSObject *v4;
  uint64_t v5;

  v2 = a2;
  if (!*MEMORY[0x1E0D25460])
    v3 = (id)GKOSLoggers();
  v4 = *MEMORY[0x1E0D25440];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D25440], OS_LOG_TYPE_DEBUG))
    __63__GKExtensionRootViewController_constructContentViewController__block_invoke_cold_1((uint64_t)v2, v4, v5);

}

- (void)configureContentViewController
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char isKindOfClass;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  void *v37;
  void *v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  void *v47;
  void *v48;
  void *v49;
  _QWORD v50[2];

  v50[1] = *MEMORY[0x1E0C80C00];
  -[GKExtensionRootViewController contentViewController](self, "contentViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "userInterfaceIdiom");

    if (v5 == 1)
    {
      -[GKExtensionRootViewController setModalPresentationStyle:](self, "setModalPresentationStyle:", 16);
      objc_msgSend(MEMORY[0x1E0D25B40], "sharedTheme");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "formSheetSize");
      -[GKExtensionRootViewController setPreferredContentSize:](self, "setPreferredContentSize:");

    }
    else
    {
      -[GKExtensionRootViewController setModalPresentationStyle:](self, "setModalPresentationStyle:", 17);
    }
    -[GKExtensionRootViewController view](self, "view");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setClipsToBounds:", 0);
    objc_msgSend(MEMORY[0x1E0D25AE0], "sharedPalette");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "systemInteractionColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setTintColor:", v9);

    if (-[GKExtensionRootViewController alwaysShowDoneButton](self, "alwaysShowDoneButton"))
    {
      -[GKExtensionRootViewController contentViewController](self, "contentViewController");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[GKExtensionRootViewController addDoneButtonToViewController:](self, "addDoneButtonToViewController:", v10);

    }
    if (-[GKExtensionRootViewController requiresNavigationController](self, "requiresNavigationController"))
    {
      -[GKExtensionRootViewController navigationController](self, "navigationController");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v11)
      {
        -[GKExtensionRootViewController contentViewController](self, "contentViewController");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        isKindOfClass = objc_opt_isKindOfClass();

        if ((isKindOfClass & 1) != 0)
        {
          -[GKExtensionRootViewController contentViewController](self, "contentViewController");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          -[GKExtensionRootViewController setNavigationController:](self, "setNavigationController:", v14);
        }
        else
        {
          v15 = objc_alloc_init(MEMORY[0x1E0DC3A40]);
          -[GKExtensionRootViewController setNavigationController:](self, "setNavigationController:", v15);

          -[GKExtensionRootViewController navigationController](self, "navigationController");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "setDelegate:", self);

          -[GKExtensionRootViewController navigationController](self, "navigationController");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "_setClipUnderlapWhileTransitioning:", 1);

          -[GKExtensionRootViewController navigationController](self, "navigationController");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "_setPositionBarsExclusivelyWithSafeArea:", 1);

          -[GKExtensionRootViewController navigationController](self, "navigationController");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "navigationBar");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "setBarStyle:", 0);

          -[GKExtensionRootViewController navigationController](self, "navigationController");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "navigationBar");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "setTranslucent:", 1);

          -[GKExtensionRootViewController navigationController](self, "navigationController");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "beginAppearanceTransition:animated:", 1, 0);

          -[GKExtensionRootViewController navigationController](self, "navigationController");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          -[GKExtensionRootViewController addChildViewController:](self, "addChildViewController:", v24);

          -[GKExtensionRootViewController view](self, "view");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          -[GKExtensionRootViewController navigationController](self, "navigationController");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "view");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "addSubview:", v27);

          -[GKExtensionRootViewController view](self, "view");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "bounds");
          v30 = v29;
          v32 = v31;
          v34 = v33;
          v36 = v35;
          -[GKExtensionRootViewController navigationController](self, "navigationController");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "view");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "setFrame:", v30, v32, v34, v36);

          -[GKExtensionRootViewController navigationController](self, "navigationController");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "endAppearanceTransition");
        }

        if (-[GKExtensionRootViewController shouldAddScrollToTopView](self, "shouldAddScrollToTopView"))
        {
          -[GKExtensionRootViewController _gkAdditionalSafeAreaInset](self, "_gkAdditionalSafeAreaInset");
          v40 = v39;
          v42 = v41;
          v44 = v43;
          v46 = v45;
          -[GKExtensionRootViewController navigationController](self, "navigationController");
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v47, "setAdditionalSafeAreaInsets:", v40, v42, v44, v46);

        }
      }
    }
    -[GKExtensionRootViewController contentViewController](self, "contentViewController");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v50[0] = v48;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v50, 1);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKExtensionRootViewController setViewControllers:animated:](self, "setViewControllers:animated:", v49, 0);

  }
}

- (void)addDoneButtonToViewController:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  if ((objc_msgSend(v9, "_gkExtensionWantsCustomRightBarButtonItemInViewService") & 1) == 0)
  {
    v4 = objc_alloc(MEMORY[0x1E0DC34F0]);
    GKGameCenterUIFrameworkBundle();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    GKGetLocalizedStringFromTableInBundle();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v4, "initWithTitle:style:target:action:", v6, 2, self, sel_donePressed_);
    objc_msgSend(v9, "navigationItem");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setRightBarButtonItem:", v7);

  }
}

- (BOOL)shouldAddScrollToTopView
{
  double v2;

  -[GKExtensionRootViewController statusBarHeight](self, "statusBarHeight");
  return v2 == 0.0;
}

- (UIEdgeInsets)_gkAdditionalSafeAreaInset
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  v2 = 5.0;
  v3 = 0.0;
  v4 = 0.0;
  v5 = 0.0;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (void)setViewControllers:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  _BYTE v44[128];
  uint64_t v45;

  v4 = a4;
  v45 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v40;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v40 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * i);
        if (-[GKExtensionRootViewController alwaysShowDoneButton](self, "alwaysShowDoneButton"))
          -[GKExtensionRootViewController addDoneButtonToViewController:](self, "addDoneButtonToViewController:", v11);
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
    }
    while (v8);
  }
  if (-[GKExtensionRootViewController requiresNavigationController](self, "requiresNavigationController"))
  {
    -[GKExtensionRootViewController navigationController](self, "navigationController");
    v12 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setViewControllers:animated:", v6, v4);
  }
  else
  {
    v37 = 0u;
    v38 = 0u;
    v35 = 0u;
    v36 = 0u;
    v12 = v6;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v36;
      do
      {
        for (j = 0; j != v14; ++j)
        {
          if (*(_QWORD *)v36 != v15)
            objc_enumerationMutation(v12);
          v17 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * j);
          objc_msgSend(v17, "beginAppearanceTransition:animated:", 1, v4, (_QWORD)v35);
          if (-[GKExtensionRootViewController shouldAddScrollToTopView](self, "shouldAddScrollToTopView"))
          {
            -[GKExtensionRootViewController _gkAdditionalSafeAreaInset](self, "_gkAdditionalSafeAreaInset");
            objc_msgSend(v17, "setAdditionalSafeAreaInsets:");
          }
          -[GKExtensionRootViewController addChildViewController:](self, "addChildViewController:", v17);
          -[GKExtensionRootViewController view](self, "view");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "view");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "addSubview:", v19);

          -[GKExtensionRootViewController view](self, "view");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "bounds");
          v22 = v21;
          v24 = v23;
          v26 = v25;
          v28 = v27;
          objc_msgSend(v17, "view");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "setFrame:", v22, v24, v26, v28);

          objc_msgSend(v17, "endAppearanceTransition");
        }
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
      }
      while (v14);
    }
  }

  if (-[GKExtensionRootViewController shouldAddScrollToTopView](self, "shouldAddScrollToTopView"))
  {
    -[GKExtensionRootViewController view](self, "view");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "viewWithTag:", 8400);
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v31)
    {
      v32 = (void *)objc_opt_new();
      objc_msgSend(v32, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      objc_msgSend(v32, "setTag:", 8400);
      v33 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D80]), "initWithTarget:action:", self, sel_scrollToTopPressed_);
      objc_msgSend(v33, "setNumberOfTapsRequired:", 1);
      objc_msgSend(v32, "addGestureRecognizer:", v33);
      -[GKExtensionRootViewController view](self, "view");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "addSubview:", v32);

      -[GKExtensionRootViewController updateScrollToTopViewConstraints](self, "updateScrollToTopViewConstraints");
    }
  }

}

- (void)scrollToTopPressed:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  double v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if (-[GKExtensionRootViewController requiresNavigationController](self, "requiresNavigationController", a3))
  {
    -[GKExtensionRootViewController navigationController](self, "navigationController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "topViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    objc_msgSend(v5, "view", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "subviews");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v16;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v16 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * v11);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v13 = v12;
            if (objc_msgSend(v13, "scrollsToTop"))
            {
              objc_msgSend(v13, "adjustedContentInset");
              objc_msgSend(v13, "setContentOffset:animated:", 1, 0.0, -v14);
            }

          }
          ++v11;
        }
        while (v9 != v11);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v9);
    }

  }
}

- (void)updateScrollToTopViewConstraints
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
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
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  _QWORD v27[5];

  v27[4] = *MEMORY[0x1E0C80C00];
  -[GKExtensionRootViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "viewWithTag:", 8400);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v4, "_gkRemoveAllConstraints");
    -[GKExtensionRootViewController view](self, "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "traitCollection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "userInterfaceIdiom");

    if (v7)
    {
      v8 = 100;
    }
    else
    {
      -[GKExtensionRootViewController view](self, "view");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "traitCollection");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v10, "verticalSizeClass") == 1)
        v8 = 150;
      else
        v8 = 50;

    }
    objc_msgSend(v4, "leadingAnchor", MEMORY[0x1E0CB3718]);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKExtensionRootViewController view](self, "view");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "leadingAnchor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "constraintEqualToAnchor:constant:", v24, (double)v8);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v27[0] = v23;
    objc_msgSend(v4, "trailingAnchor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKExtensionRootViewController view](self, "view");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "trailingAnchor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "constraintEqualToAnchor:constant:", v11, (double)-v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v27[1] = v12;
    objc_msgSend(v4, "topAnchor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKExtensionRootViewController view](self, "view");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "topAnchor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "constraintEqualToAnchor:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v27[2] = v16;
    objc_msgSend(v4, "heightAnchor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "constraintEqualToConstant:", 20.0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v27[3] = v18;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 4);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "activateConstraints:", v19);

    objc_msgSend(v4, "setNeedsLayout");
  }

}

- (void)traitCollectionDidChange:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)GKExtensionRootViewController;
  -[GKExtensionRootViewController traitCollectionDidChange:](&v4, sel_traitCollectionDidChange_, a3);
  -[GKExtensionRootViewController updateScrollToTopViewConstraints](self, "updateScrollToTopViewConstraints");
}

- (double)_statusBarHeightForCurrentInterfaceOrientation
{
  return self->_statusBarHeight;
}

- (void)navigationController:(id)a3 willShowViewController:(id)a4 animated:(BOOL)a5
{
  id v6;

  v6 = a4;
  if (-[GKExtensionRootViewController alwaysShowDoneButton](self, "alwaysShowDoneButton"))
    -[GKExtensionRootViewController addDoneButtonToViewController:](self, "addDoneButtonToViewController:", v6);

}

- (void)refreshContentsForDataType:(unsigned int)a3 userInfo:(id)a4
{
  uint64_t v4;
  void *v6;
  id v7;

  v4 = *(_QWORD *)&a3;
  v7 = a4;
  if (-[GKExtensionRootViewController _gkShouldRefreshContentsForDataType:userInfo:](self, "_gkShouldRefreshContentsForDataType:userInfo:", v4))-[GKExtensionRootViewController _gkRefreshContentsForDataType:userInfo:](self, "_gkRefreshContentsForDataType:userInfo:", v4, v7);
  if ((_DWORD)v4 == 16)
  {
    objc_msgSend(MEMORY[0x1E0D25330], "local");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "clearInMemoryCachedAvatars");

  }
}

- (void)setInitialState:(id)a3 withReply:(id)a4
{
  id v6;
  id v7;
  void *v8;
  float v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  void *v18;
  void *v19;
  id v20;
  _QWORD v21[5];
  id v22;

  v6 = a4;
  v7 = a3;
  -[GKExtensionRootViewController setRequiresNavigationController:](self, "setRequiresNavigationController:", 1);
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("StatusBarHeightKey"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "floatValue");
  -[GKExtensionRootViewController setStatusBarHeight:](self, "setStatusBarHeight:", v9);

  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("HostPIDKey"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKExtensionRootViewController setHostPID:](self, "setHostPID:", objc_msgSend(v10, "integerValue"));

  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("CurrentGameKey"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)MEMORY[0x1E0D252C0];
  objc_msgSend(v11, "internal");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setCurrentGameFromInternal:serverEnvironment:", v13, objc_msgSend(v11, "environment"));

  objc_msgSend(MEMORY[0x1E0D25330], "localPlayer");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("LocalPlayerKey"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "updateFromLocalPlayer:", v15);

  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("RTLKey"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "BOOLValue");
  *MEMORY[0x1E0D25B60] = v17;

  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("HostUserInterfaceIdiom"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  -[GKExtensionRootViewController setHostUserInterfaceIdiom:](self, "setHostUserInterfaceIdiom:", objc_msgSend(v18, "integerValue"));
  -[GKExtensionRootViewController hostUserInterfaceIdiom](self, "hostUserInterfaceIdiom");
  GKSetHostUserInterfaceIdiom();
  -[GKExtensionRootViewController daemonProxy](self, "daemonProxy");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setHostPID:", -[GKExtensionRootViewController hostPID](self, "hostPID"));

  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __59__GKExtensionRootViewController_setInitialState_withReply___block_invoke;
  v21[3] = &unk_1E59C53C8;
  v21[4] = self;
  v22 = v6;
  v20 = v6;
  dispatch_async(MEMORY[0x1E0C80D38], v21);

}

uint64_t __59__GKExtensionRootViewController_setInitialState_withReply___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "setHasInitialData:", 1);
  objc_msgSend(*(id *)(a1 + 32), "contentViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {

  }
  else if (objc_msgSend(*(id *)(a1 + 32), "isViewLoaded"))
  {
    objc_msgSend(*(id *)(a1 + 32), "constructContentViewController");
  }
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 1);
  return result;
}

- (void)messageFromClient:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  id v13;

  v4 = (void *)MEMORY[0x1E0CB3710];
  v5 = a3;
  GKExtensionProtocolSecureCodedClasses();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0;
  objc_msgSend(v4, "unarchivedObjectOfClasses:fromData:error:", v6, v5, &v13);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = v13;
  if (v8)
  {
    if (!*MEMORY[0x1E0D25460])
      v9 = (id)GKOSLoggers();
    v10 = *MEMORY[0x1E0D25450];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D25450], OS_LOG_TYPE_ERROR))
      -[GKExtensionRootViewController messageFromClient:].cold.1((uint64_t)v8, v10);
  }
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("MessageCommandKey"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "integerValue");

  switch(v12)
  {
    case 47:
      -[GKExtensionRootViewController clientWillTerminate](self, "clientWillTerminate");
      break;
    case 4:
      -[GKExtensionRootViewController clientDidCancel](self, "clientDidCancel");
      break;
    case 3:
      -[GKExtensionRootViewController clientDidFinish](self, "clientDidFinish");
      break;
  }

}

- (id)hostObjectProxy
{
  void *v4;
  void *v5;
  void *v6;
  void *v8;

  -[GKExtensionRootViewController extensionContext](self, "extensionContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_auxiliaryConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_39);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("GKExtensionRootViewController.m"), 552, CFSTR("GKExtensionContext remote object proxy is nil!"));

  }
  return v6;
}

void __48__GKExtensionRootViewController_hostObjectProxy__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  void *v4;

  v2 = a2;
  if (!*MEMORY[0x1E0D25460])
    v3 = (id)GKOSLoggers();
  v4 = (void *)*MEMORY[0x1E0D25468];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D25468], OS_LOG_TYPE_DEBUG))
    __48__GKExtensionRootViewController_hostObjectProxy__block_invoke_cold_1(v4, v2);

}

- (void)sendMessageToClient:(id)a3
{
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", a3, 1, 0);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[GKExtensionRootViewController hostObjectProxy](self, "hostObjectProxy");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "messageFromExtension:", v5);

}

- (void)messageFromExtension:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[GKExtensionRootViewController hostObjectProxy](self, "hostObjectProxy");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "messageFromExtension:", v4);

}

- (void)extensionIsCanceling
{
  void *v3;
  const __CFString *v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  v4 = CFSTR("MessageCommandKey");
  v5[0] = &unk_1E5A5DE00;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, &v4, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKExtensionRootViewController sendMessageToClient:](self, "sendMessageToClient:", v3);

}

- (void)extensionIsFinishing
{
  void *v3;
  const __CFString *v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  v4 = CFSTR("MessageCommandKey");
  v5[0] = &unk_1E5A5DE18;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, &v4, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKExtensionRootViewController sendMessageToClient:](self, "sendMessageToClient:", v3);

}

- (void)logOnceGameControllerUsedInGameLayer
{
  if (logOnceGameControllerUsedInGameLayer_onceToken != -1)
    dispatch_once(&logOnceGameControllerUsedInGameLayer_onceToken, &__block_literal_global_49);
}

void __69__GKExtensionRootViewController_logOnceGameControllerUsedInGameLayer__block_invoke()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0D253C0], "reporter");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v0 = *MEMORY[0x1E0D25058];
  v1 = *MEMORY[0x1E0D250C0];
  objc_msgSend(MEMORY[0x1E0D252C0], "currentGame");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "reportEvent:type:bundleID:", v0, v1, v3);

}

- (void)setToLightBackground
{
  id v3;

  objc_msgSend(MEMORY[0x1E0DC3510], "effectWithStyle:", 0);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[UIVisualEffectView setEffect:](self->_effectView, "setEffect:", v3);

}

- (void)setToDarkBackground
{
  id v3;

  objc_msgSend(MEMORY[0x1E0DC3510], "effectWithStyle:", 2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[UIVisualEffectView setEffect:](self->_effectView, "setEffect:", v3);

}

- (BOOL)alwaysShowDoneButton
{
  return self->_alwaysShowDoneButton;
}

- (void)setAlwaysShowDoneButton:(BOOL)a3
{
  self->_alwaysShowDoneButton = a3;
}

- (double)statusBarHeight
{
  return self->_statusBarHeight;
}

- (void)setStatusBarHeight:(double)a3
{
  self->_statusBarHeight = a3;
}

- (BOOL)requiresNavigationController
{
  return self->_requiresNavigationController;
}

- (void)setRequiresNavigationController:(BOOL)a3
{
  self->_requiresNavigationController = a3;
}

- (UIViewController)contentViewController
{
  return self->_contentViewController;
}

- (void)setContentViewController:(id)a3
{
  objc_storeStrong((id *)&self->_contentViewController, a3);
}

- (int)hostPID
{
  return self->_hostPID;
}

- (void)setHostPID:(int)a3
{
  self->_hostPID = a3;
}

- (int64_t)hostUserInterfaceIdiom
{
  return self->_hostUserInterfaceIdiom;
}

- (void)setHostUserInterfaceIdiom:(int64_t)a3
{
  self->_hostUserInterfaceIdiom = a3;
}

- (UIVisualEffectView)effectView
{
  return self->_effectView;
}

- (void)setEffectView:(id)a3
{
  objc_storeStrong((id *)&self->_effectView, a3);
}

- (BOOL)adjustTopConstraint
{
  return self->_adjustTopConstraint;
}

- (void)setAdjustTopConstraint:(BOOL)a3
{
  self->_adjustTopConstraint = a3;
}

- (BOOL)hasInitialData
{
  return self->_hasInitialData;
}

- (void)setHasInitialData:(BOOL)a3
{
  self->_hasInitialData = a3;
}

- (NSLayoutConstraint)effectBottomConstraint
{
  return self->_effectBottomConstraint;
}

- (void)setEffectBottomConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_effectBottomConstraint, a3);
}

- (NSLayoutConstraint)effectTopConstraint
{
  return self->_effectTopConstraint;
}

- (void)setEffectTopConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_effectTopConstraint, a3);
}

- (UINavigationController)navigationController
{
  return self->_navigationController;
}

- (void)setNavigationController:(id)a3
{
  objc_storeStrong((id *)&self->_navigationController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_navigationController, 0);
  objc_storeStrong((id *)&self->_effectTopConstraint, 0);
  objc_storeStrong((id *)&self->_effectBottomConstraint, 0);
  objc_storeStrong((id *)&self->_effectView, 0);
  objc_storeStrong((id *)&self->_contentViewController, 0);
}

void __63__GKExtensionRootViewController_constructContentViewController__block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 138412290;
  v4 = a1;
  OUTLINED_FUNCTION_6(&dword_1AB361000, a2, a3, "Starting cache updates from extension. error: %@", (uint8_t *)&v3);
}

- (void)messageFromClient:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1AB361000, a2, OS_LOG_TYPE_ERROR, "error while decoding messageFromClient archive in GKExtensionRootViewController:%@", (uint8_t *)&v2, 0xCu);
}

void __48__GKExtensionRootViewController_hostObjectProxy__block_invoke_cold_1(void *a1, void *a2)
{
  NSObject *v3;
  void *v4;
  uint64_t v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  objc_msgSend(a2, "localizedDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138412290;
  v7 = v4;
  OUTLINED_FUNCTION_6(&dword_1AB361000, v3, v5, "error calling host - %@", (uint8_t *)&v6);

}

@end
