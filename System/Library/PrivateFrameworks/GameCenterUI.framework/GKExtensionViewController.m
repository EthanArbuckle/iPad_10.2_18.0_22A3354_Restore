@implementation GKExtensionViewController

- (GKExtensionViewController)initWithCoder:(id)a3
{
  GKExtensionViewController *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)GKExtensionViewController;
  v3 = -[GKExtensionViewController initWithCoder:](&v8, sel_initWithCoder_, a3);
  if (v3)
  {
    GKUISetRemote();
    objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "userInterfaceIdiom");

    if (v5 == 1)
    {
      -[GKExtensionViewController setModalPresentationStyle:](v3, "setModalPresentationStyle:", 16);
      objc_msgSend(MEMORY[0x1E0D25B40], "sharedTheme");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "formSheetSize");
      -[GKExtensionViewController setPreferredContentSize:](v3, "setPreferredContentSize:");

      *MEMORY[0x1E0D25B68] = 0;
    }
    else
    {
      -[GKExtensionViewController setModalPresentationStyle:](v3, "setModalPresentationStyle:", 17);
    }
    v3->_alwaysShowDoneButton = 1;
    v3->_adjustTopConstraint = 1;
    -[GKExtensionViewController _setClipUnderlapWhileTransitioning:](v3, "_setClipUnderlapWhileTransitioning:", 1);
    -[GKExtensionViewController _setPositionBarsExclusivelyWithSafeArea:](v3, "_setPositionBarsExclusivelyWithSafeArea:", 1);
  }
  return v3;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  id v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GKExtensionViewController;
  -[GKExtensionViewController viewDidLoad](&v6, sel_viewDidLoad);
  -[GKExtensionViewController navigationBar](self, "navigationBar");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBarStyle:", 0);

  -[GKExtensionViewController navigationBar](self, "navigationBar");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTranslucent:", 1);

  -[GKExtensionViewController setOverrideUserInterfaceStyle:](self, "setOverrideUserInterfaceStyle:", 2);
  if (-[GKExtensionViewController _useBackdropViewForWindowBackground](self, "_useBackdropViewForWindowBackground"))
  {
    v5 = objc_alloc_init(MEMORY[0x1E0DC3F58]);
    -[GKExtensionViewController setEffectView:](self, "setEffectView:", v5);

    -[GKExtensionViewController setupVisualEffects](self, "setupVisualEffects");
  }
}

- (void)setupVisualEffects
{
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0DC3F50], "_gkGameLayerBackgroundVisualEffect");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKExtensionViewController effectView](self, "effectView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBackgroundEffects:", v3);

  -[GKExtensionViewController effectView](self, "effectView");
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
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  objc_super v27;

  v3 = a3;
  -[GKExtensionViewController daemonProxy](self, "daemonProxy");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDataUpdateDelegate:", self);

  v27.receiver = self;
  v27.super_class = (Class)GKExtensionViewController;
  -[GKExtensionViewController viewWillAppear:](&v27, sel_viewWillAppear_, v3);
  if (-[GKExtensionViewController _useBackdropViewForWindowBackground](self, "_useBackdropViewForWindowBackground"))
  {
    -[GKExtensionViewController setupVisualEffects](self, "setupVisualEffects");
    -[GKExtensionViewController view](self, "view");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "bounds");
    v8 = v7;
    v10 = v9;
    v12 = v11;
    v14 = v13;
    -[GKExtensionViewController effectView](self, "effectView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setFrame:", v8, v10, v12, v14);

    -[GKExtensionViewController effectView](self, "effectView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    -[GKExtensionViewController parentViewController](self, "parentViewController");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "view");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "window");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "rootViewController");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "view");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v21;
    if (v21)
    {
      v23 = v21;
    }
    else
    {
      -[GKExtensionViewController parentViewController](self, "parentViewController");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "view");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "window");
      v23 = (id)objc_claimAutoreleasedReturnValue();

    }
    -[GKExtensionViewController addVisualEffectViewForView:](self, "addVisualEffectViewForView:", v23);

  }
  if (-[GKExtensionViewController hasInitialData](self, "hasInitialData"))
  {
    -[GKExtensionViewController contentViewController](self, "contentViewController");
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v26)
      -[GKExtensionViewController constructContentViewController](self, "constructContentViewController");
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
  v11.super_class = (Class)GKExtensionViewController;
  -[GKExtensionViewController viewDidAppear:](&v11, sel_viewDidAppear_, a3);
  v4 = (_QWORD *)MEMORY[0x1E0D25460];
  if (!*MEMORY[0x1E0D25460])
    v5 = (id)GKOSLoggers();
  v6 = (os_log_t *)MEMORY[0x1E0D25480];
  v7 = *MEMORY[0x1E0D25480];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D25480], OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v10 = 0;
    _os_log_impl(&dword_1AB361000, v7, OS_LOG_TYPE_INFO, "GKExtensionViewController viewDidAppear called", v10, 2u);
  }
  -[GKExtensionViewController becomeFirstResponder](self, "becomeFirstResponder");
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

  -[GKExtensionViewController effectView](self, "effectView");
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
  GKExtensionViewController *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GKExtensionViewController;
  -[GKExtensionViewController viewDidDisappear:](&v7, sel_viewDidDisappear_, a3);
  -[GKExtensionViewController setViewControllers:animated:](self, "setViewControllers:animated:", MEMORY[0x1E0C9AA60], 0);
  -[GKExtensionViewController setContentViewController:](self, "setContentViewController:", 0);
  -[GKExtensionViewController daemonProxy](self, "daemonProxy");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dataUpdateDelegate");
  v5 = (GKExtensionViewController *)objc_claimAutoreleasedReturnValue();

  if (v5 == self)
  {
    -[GKExtensionViewController daemonProxy](self, "daemonProxy");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setDataUpdateDelegate:", 0);

  }
}

- (void)willTransitionToTraitCollection:(id)a3 withTransitionCoordinator:(id)a4
{
  id v6;
  _QWORD v7[5];
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)GKExtensionViewController;
  v6 = a4;
  -[GKExtensionViewController willTransitionToTraitCollection:withTransitionCoordinator:](&v8, sel_willTransitionToTraitCollection_withTransitionCoordinator_, a3, v6);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __87__GKExtensionViewController_willTransitionToTraitCollection_withTransitionCoordinator___block_invoke;
  v7[3] = &unk_1E59C4FB0;
  v7[4] = self;
  objc_msgSend(v6, "animateAlongsideTransition:completion:", v7, &__block_literal_global_55);

}

void __87__GKExtensionViewController_willTransitionToTraitCollection_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  double Height;
  void *v3;
  id v4;
  CGRect v5;

  Height = 0.0;
  if (objc_msgSend(*(id *)(a1 + 32), "adjustTopConstraint"))
  {
    objc_msgSend(*(id *)(a1 + 32), "navigationBar");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "bounds");
    Height = CGRectGetHeight(v5);

  }
  objc_msgSend(*(id *)(a1 + 32), "effectTopConstraint");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setConstant:", Height);

}

- (BOOL)_useBackdropViewForWindowBackground
{
  return 1;
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
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("StatusBarHeightKey"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "floatValue");
  -[GKExtensionViewController setStatusBarHeight:](self, "setStatusBarHeight:", v9);

  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("HostPIDKey"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKExtensionViewController setHostPID:](self, "setHostPID:", objc_msgSend(v10, "integerValue"));

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

  -[GKExtensionViewController setHostUserInterfaceIdiom:](self, "setHostUserInterfaceIdiom:", objc_msgSend(v18, "integerValue"));
  -[GKExtensionViewController hostUserInterfaceIdiom](self, "hostUserInterfaceIdiom");
  GKSetHostUserInterfaceIdiom();
  -[GKExtensionViewController daemonProxy](self, "daemonProxy");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setHostPID:", -[GKExtensionViewController hostPID](self, "hostPID"));

  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __55__GKExtensionViewController_setInitialState_withReply___block_invoke;
  v21[3] = &unk_1E59C53C8;
  v21[4] = self;
  v22 = v6;
  v20 = v6;
  dispatch_async(MEMORY[0x1E0C80D38], v21);

}

uint64_t __55__GKExtensionViewController_setInitialState_withReply___block_invoke(uint64_t a1)
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

- (void)constructContentViewController
{
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0D25298], "proxyForLocalPlayer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "profileServicePrivate");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "startContactsIntegrationSyncWithOptions:completionHandler:", 2, &__block_literal_global_19_0);
  -[GKExtensionViewController configureContentViewController](self, "configureContentViewController");

}

void __59__GKExtensionViewController_constructContentViewController__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  id v3;

  v2 = a2;
  if (!*MEMORY[0x1E0D25460])
    v3 = (id)GKOSLoggers();
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D25440], OS_LOG_TYPE_DEBUG))
    __59__GKExtensionViewController_constructContentViewController__block_invoke_cold_1();

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
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  -[GKExtensionViewController contentViewController](self, "contentViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "userInterfaceIdiom");

    if (v5 == 1)
    {
      -[GKExtensionViewController setModalPresentationStyle:](self, "setModalPresentationStyle:", 16);
      objc_msgSend(MEMORY[0x1E0D25B40], "sharedTheme");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "formSheetSize");
      -[GKExtensionViewController setPreferredContentSize:](self, "setPreferredContentSize:");

    }
    else
    {
      -[GKExtensionViewController setModalPresentationStyle:](self, "setModalPresentationStyle:", 17);
    }
    -[GKExtensionViewController view](self, "view");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setClipsToBounds:", 0);
    objc_msgSend(MEMORY[0x1E0D25AE0], "sharedPalette");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "systemInteractionColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setTintColor:", v9);

    if (-[GKExtensionViewController alwaysShowDoneButton](self, "alwaysShowDoneButton"))
    {
      -[GKExtensionViewController contentViewController](self, "contentViewController");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[GKExtensionViewController addDoneButtonToViewController:](self, "addDoneButtonToViewController:", v10);

    }
    -[GKExtensionViewController contentViewController](self, "contentViewController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = v11;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKExtensionViewController setViewControllers:animated:](self, "setViewControllers:animated:", v12, 0);

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

- (void)pushViewController:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  objc_super v7;

  v4 = a4;
  v6 = a3;
  if (-[GKExtensionViewController alwaysShowDoneButton](self, "alwaysShowDoneButton"))
    -[GKExtensionViewController addDoneButtonToViewController:](self, "addDoneButtonToViewController:", v6);
  v7.receiver = self;
  v7.super_class = (Class)GKExtensionViewController;
  -[GKExtensionViewController pushViewController:animated:](&v7, sel_pushViewController_animated_, v6, v4);

}

- (void)setViewControllers:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  objc_super v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v4 = a4;
  v18 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v10);
        if (-[GKExtensionViewController alwaysShowDoneButton](self, "alwaysShowDoneButton"))
          -[GKExtensionViewController addDoneButtonToViewController:](self, "addDoneButtonToViewController:", v11);
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }
  v12.receiver = self;
  v12.super_class = (Class)GKExtensionViewController;
  -[GKExtensionViewController setViewControllers:animated:](&v12, sel_setViewControllers_animated_, v6, v4);

}

- (double)_statusBarHeightForCurrentInterfaceOrientation
{
  return self->_statusBarHeight;
}

- (void)refreshContentsForDataType:(unsigned int)a3 userInfo:(id)a4
{
  uint64_t v4;
  void *v6;
  id v7;

  v4 = *(_QWORD *)&a3;
  v7 = a4;
  if (-[GKExtensionViewController _gkShouldRefreshContentsForDataType:userInfo:](self, "_gkShouldRefreshContentsForDataType:userInfo:", v4))-[GKExtensionViewController _gkRefreshContentsForDataType:userInfo:](self, "_gkRefreshContentsForDataType:userInfo:", v4, v7);
  if ((_DWORD)v4 == 16)
  {
    objc_msgSend(MEMORY[0x1E0D25330], "local");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "clearInMemoryCachedAvatars");

  }
}

- (id)hostObjectProxy
{
  void *v4;
  void *v5;
  void *v6;
  void *v8;

  -[GKExtensionViewController extensionContext](self, "extensionContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_auxiliaryConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_30);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("GKExtensionViewController.m"), 363, CFSTR("GKExtensionContext remote object proxy is nil!"));

  }
  return v6;
}

void __44__GKExtensionViewController_hostObjectProxy__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  void *v4;

  v2 = a2;
  if (!*MEMORY[0x1E0D25460])
    v3 = (id)GKOSLoggers();
  v4 = (void *)*MEMORY[0x1E0D25468];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D25468], OS_LOG_TYPE_DEBUG))
    __44__GKExtensionViewController_hostObjectProxy__block_invoke_cold_1(v4, v2);

}

- (void)sendMessageToClient:(id)a3
{
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", a3, 1, 0);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[GKExtensionViewController hostObjectProxy](self, "hostObjectProxy");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "messageFromExtension:", v5);

}

- (void)messageFromExtension:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[GKExtensionViewController hostObjectProxy](self, "hostObjectProxy");
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
  v5[0] = &unk_1E5A5E670;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, &v4, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKExtensionViewController sendMessageToClient:](self, "sendMessageToClient:", v3);

}

- (void)extensionIsFinishing
{
  void *v3;
  const __CFString *v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  v4 = CFSTR("MessageCommandKey");
  v5[0] = &unk_1E5A5E688;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, &v4, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKExtensionViewController sendMessageToClient:](self, "sendMessageToClient:", v3);

}

- (void)messageFromClient:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  id v12;

  v4 = (void *)MEMORY[0x1E0CB3710];
  v5 = a3;
  GKExtensionProtocolSecureCodedClasses();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0;
  objc_msgSend(v4, "unarchivedObjectOfClasses:fromData:error:", v6, v5, &v12);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = v12;
  if (v8)
  {
    if (!*MEMORY[0x1E0D25460])
      v9 = (id)GKOSLoggers();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D25450], OS_LOG_TYPE_ERROR))
      -[GKExtensionViewController messageFromClient:].cold.1();
  }
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("MessageCommandKey"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "integerValue");

  switch(v11)
  {
    case 47:
      -[GKExtensionViewController clientWillTerminate](self, "clientWillTerminate");
      break;
    case 4:
      -[GKExtensionViewController clientDidCancel](self, "clientDidCancel");
      break;
    case 3:
      -[GKExtensionViewController clientDidFinish](self, "clientDidFinish");
      break;
  }

}

- (void)logOnceGameControllerUsedInGameLayer
{
  if (logOnceGameControllerUsedInGameLayer_onceToken_0 != -1)
    dispatch_once(&logOnceGameControllerUsedInGameLayer_onceToken_0, &__block_literal_global_41_0);
}

void __65__GKExtensionViewController_logOnceGameControllerUsedInGameLayer__block_invoke()
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_effectTopConstraint, 0);
  objc_storeStrong((id *)&self->_effectBottomConstraint, 0);
  objc_storeStrong((id *)&self->_effectView, 0);
  objc_storeStrong((id *)&self->_contentViewController, 0);
}

void __59__GKExtensionViewController_constructContentViewController__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_6(&dword_1AB361000, v0, v1, "Starting cache updates from extension. error: %@", v2);
}

void __44__GKExtensionViewController_hostObjectProxy__block_invoke_cold_1(void *a1, void *a2)
{
  NSObject *v3;
  void *v4;
  uint64_t v5;
  uint8_t v6[24];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  objc_msgSend(a2, "localizedDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_6(&dword_1AB361000, v3, v5, "error calling host - %@", v6);

}

- (void)messageFromClient:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_9(&dword_1AB361000, v0, v1, "error while decoding messageFromClient archive in GKExtensionViewController:%@", v2);
}

@end
