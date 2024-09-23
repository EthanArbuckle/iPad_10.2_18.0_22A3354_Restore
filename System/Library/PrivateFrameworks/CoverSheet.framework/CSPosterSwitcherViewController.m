@implementation CSPosterSwitcherViewController

- (CSPosterSwitcherViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  CSPosterSwitcherViewController *v4;
  CSPosterSwitcherViewController *v5;
  uint64_t v6;
  PRUISSwitcherSceneClientSettingsDiffInspector *sceneClientSettingsDiffInspector;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CSPosterSwitcherViewController;
  v4 = -[CSCoverSheetViewControllerBase initWithNibName:bundle:](&v9, sel_initWithNibName_bundle_, a3, a4);
  v5 = v4;
  if (v4)
  {
    v4->_clientSwitcherLayoutMode = 0;
    objc_msgSend(MEMORY[0x1E0D7F868], "diffInspectorForObservingDiffContext");
    v6 = objc_claimAutoreleasedReturnValue();
    sceneClientSettingsDiffInspector = v5->_sceneClientSettingsDiffInspector;
    v5->_sceneClientSettingsDiffInspector = (PRUISSwitcherSceneClientSettingsDiffInspector *)v6;

  }
  return v5;
}

- (void)loadView
{
  id v3;
  void *v4;
  UIView *v5;
  UIView *scaleView;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CSPosterSwitcherViewController;
  -[CSCoverSheetViewControllerBase loadView](&v8, sel_loadView);
  v3 = objc_alloc(MEMORY[0x1E0CEABB0]);
  -[CSPosterSwitcherViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  v5 = (UIView *)objc_msgSend(v3, "initWithFrame:");
  scaleView = self->_scaleView;
  self->_scaleView = v5;

  -[UIView setAutoresizingMask:](self->_scaleView, "setAutoresizingMask:", 18);
  -[CSPosterSwitcherViewController view](self, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addSubview:", self->_scaleView);

}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CSPosterSwitcherViewController;
  -[CSCoverSheetViewControllerBase viewWillAppear:](&v4, sel_viewWillAppear_, a3);
  -[CSPosterSwitcherViewController setHasEverAppeared:](self, "setHasEverAppeared:", 1);
}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CSPosterSwitcherViewController;
  -[CSCoverSheetViewControllerBase viewDidAppear:](&v6, sel_viewDidAppear_, a3);
  -[SBApplicationHosting hostedAppSceneHandle](self->_applicationHoster, "hostedAppSceneHandle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObserver:", self);
  objc_msgSend(v4, "addActionConsumer:", self);
  if (__sb__runningInSpringBoard())
  {
    objc_msgSend(v4, "setContentPrefersToDisableClipping:", SBFEffectiveDeviceClass() == 2);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setContentPrefersToDisableClipping:", objc_msgSend(v5, "userInterfaceIdiom") == 1);

  }
  -[CSPosterSwitcherViewController _evaluateInitialTransitionActivation](self, "_evaluateInitialTransitionActivation");

}

- (void)viewDidDisappear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CSPosterSwitcherViewController;
  -[CSCoverSheetViewControllerBase viewDidDisappear:](&v5, sel_viewDidDisappear_, a3);
  -[SBApplicationHosting hostedAppSceneHandle](self->_applicationHoster, "hostedAppSceneHandle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:", self);
  objc_msgSend(v4, "removeActionConsumer:", self);
  objc_msgSend(v4, "setContentPrefersToDisableClipping:", 0);

}

- (BOOL)_canShowWhileLocked
{
  return 0;
}

- (void)setAppHostConfiguring:(id)a3
{
  CSTraitAwareAppHostConfiguring *v6;
  CSTraitAwareAppHostConfiguring **p_appHostConfiguring;
  CSTraitAwareAppHostConfiguring *appHostConfiguring;
  SBApplicationHosting *v9;
  SBApplicationHosting *applicationHoster;
  uint64_t v11;
  SBApplicationHosting *v12;
  CSTraitAwareAppHostConfiguring *v13;
  SBApplicationHosting *v14;
  void *v15;
  UIWindow *v16;
  UIWindow *targetWindow;
  CSTraitsAwareOrientedAppHosting *v18;
  CSTraitsAwareOrientedAppHosting *traitsAwareViewController;
  CSTraitsAwareOrientedAppHosting *v20;
  void *v21;
  _QWORD v22[5];
  _QWORD v23[4];
  id v24;
  id location;

  v6 = (CSTraitAwareAppHostConfiguring *)a3;
  p_appHostConfiguring = &self->_appHostConfiguring;
  appHostConfiguring = self->_appHostConfiguring;
  if (appHostConfiguring == v6)
  {
LABEL_10:

    return;
  }
  if (appHostConfiguring)
    -[CSPosterSwitcherViewController bs_removeChildViewController:](self, "bs_removeChildViewController:", self->_applicationHoster);
  objc_storeStrong((id *)&self->_appHostConfiguring, a3);
  -[SBApplicationHosting setInvalidationHandler:](self->_applicationHoster, "setInvalidationHandler:", 0);
  -[CSTraitAwareAppHostConfiguring applicationHosterForTraitsHostContextProvider:](*p_appHostConfiguring, "applicationHosterForTraitsHostContextProvider:", self);
  v9 = (SBApplicationHosting *)objc_claimAutoreleasedReturnValue();
  applicationHoster = self->_applicationHoster;
  self->_applicationHoster = v9;

  v11 = MEMORY[0x1E0C809B0];
  if (!self->_applicationHoster)
  {
LABEL_7:
    -[CSPosterSwitcherViewController loadViewIfNeeded](self, "loadViewIfNeeded");
    v13 = *p_appHostConfiguring;
    v14 = self->_applicationHoster;
    -[CSPosterSwitcherViewController view](self, "view");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "window");
    v16 = (UIWindow *)objc_claimAutoreleasedReturnValue();
    targetWindow = v16;
    if (!v16)
      targetWindow = self->_targetWindow;
    -[CSTraitAwareAppHostConfiguring traitsAwareViewControllerForApplicationHoster:targetWindow:](v13, "traitsAwareViewControllerForApplicationHoster:targetWindow:", v14, targetWindow);
    v18 = (CSTraitsAwareOrientedAppHosting *)objc_claimAutoreleasedReturnValue();
    traitsAwareViewController = self->_traitsAwareViewController;
    self->_traitsAwareViewController = v18;

    v20 = self->_traitsAwareViewController;
    v22[0] = v11;
    v22[1] = 3221225472;
    v22[2] = __56__CSPosterSwitcherViewController_setAppHostConfiguring___block_invoke_2;
    v22[3] = &unk_1E8E2DB60;
    v22[4] = self;
    -[CSPosterSwitcherViewController bs_addChildViewController:animated:transitionBlock:](self, "bs_addChildViewController:animated:transitionBlock:", v20, 0, v22);
    goto LABEL_10;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_initWeak(&location, self);
    v12 = self->_applicationHoster;
    v23[0] = v11;
    v23[1] = 3221225472;
    v23[2] = __56__CSPosterSwitcherViewController_setAppHostConfiguring___block_invoke;
    v23[3] = &unk_1E8E2E868;
    objc_copyWeak(&v24, &location);
    -[SBApplicationHosting setInvalidationHandler:](v12, "setInvalidationHandler:", v23);
    objc_destroyWeak(&v24);
    objc_destroyWeak(&location);
    goto LABEL_7;
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("We need an application hoster that supports an invalidation handler"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    -[CSPosterSwitcherViewController setAppHostConfiguring:].cold.1(a2);
  objc_msgSend(objc_retainAutorelease(v21), "UTF8String");
  _bs_set_crash_log_message();
  __break(0);
}

void __56__CSPosterSwitcherViewController_setAppHostConfiguring___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_applicationHosterDidInvalidate");

}

void __56__CSPosterSwitcherViewController_setAppHostConfiguring___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void (**v4)(_QWORD);
  void *v5;
  id v6;

  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 1152);
  v4 = a2;
  objc_msgSend(v3, "view");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bounds");
  objc_msgSend(v6, "setFrame:");

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1128), "addSubview:", v6);
  v4[2](v4);

}

- (void)setCoverSheetBackgroundView:(id)a3
{
  id WeakRetained;
  void *v5;
  void *v6;
  id obj;
  _QWORD v8[5];

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_coverSheetBackgroundView);

  v5 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_coverSheetBackgroundView, obj);
    -[CSPosterSwitcherViewController _sceneIfExists](self, "_sceneIfExists");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __62__CSPosterSwitcherViewController_setCoverSheetBackgroundView___block_invoke;
    v8[3] = &unk_1E8E2F888;
    v8[4] = self;
    objc_msgSend(v6, "updateSettingsWithBlock:", v8);

    v5 = obj;
  }

}

uint64_t __62__CSPosterSwitcherViewController_setCoverSheetBackgroundView___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateOverlayViewSpecificationForSceneSettings:", a2);
}

- (void)setCoverSheetWallpaperView:(id)a3
{
  id WeakRetained;
  void *v5;
  void *v6;
  id obj;
  _QWORD v8[5];

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_coverSheetWallpaperView);

  v5 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_coverSheetWallpaperView, obj);
    -[CSPosterSwitcherViewController _sceneIfExists](self, "_sceneIfExists");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __61__CSPosterSwitcherViewController_setCoverSheetWallpaperView___block_invoke;
    v8[3] = &unk_1E8E2F888;
    v8[4] = self;
    objc_msgSend(v6, "updateSettingsWithBlock:", v8);

    v5 = obj;
  }

}

uint64_t __61__CSPosterSwitcherViewController_setCoverSheetWallpaperView___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateLiveContentViewSpecificationForSceneSettings:", a2);
}

- (void)setCoverSheetFloatingView:(id)a3
{
  id WeakRetained;
  void *v5;
  void *v6;
  id obj;
  _QWORD v8[5];

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_coverSheetFloatingView);

  v5 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_coverSheetFloatingView, obj);
    -[CSPosterSwitcherViewController _sceneIfExists](self, "_sceneIfExists");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __60__CSPosterSwitcherViewController_setCoverSheetFloatingView___block_invoke;
    v8[3] = &unk_1E8E2F888;
    v8[4] = self;
    objc_msgSend(v6, "updateSettingsWithBlock:", v8);

    v5 = obj;
  }

}

uint64_t __60__CSPosterSwitcherViewController_setCoverSheetFloatingView___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateLiveFloatingViewSpecificationForSceneSettings:", a2);
}

- (void)setCoverSheetWallpaperFloatingLayerInlined:(BOOL)a3
{
  id v4;
  _QWORD v5[5];

  if (self->_coverSheetWallpaperFloatingLayerInlined != a3)
  {
    self->_coverSheetWallpaperFloatingLayerInlined = a3;
    -[CSPosterSwitcherViewController _sceneIfExists](self, "_sceneIfExists");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __77__CSPosterSwitcherViewController_setCoverSheetWallpaperFloatingLayerInlined___block_invoke;
    v5[3] = &unk_1E8E2F888;
    v5[4] = self;
    objc_msgSend(v4, "updateSettingsWithBlock:", v5);

  }
}

uint64_t __77__CSPosterSwitcherViewController_setCoverSheetWallpaperFloatingLayerInlined___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateFloatingLayerInlinedForSceneSettings:", a2);
}

- (void)setCoverSheetComplicationRowHidden:(BOOL)a3
{
  id v4;
  _QWORD v5[5];

  if (self->_coverSheetComplicationRowHidden != a3)
  {
    self->_coverSheetComplicationRowHidden = a3;
    -[CSPosterSwitcherViewController _sceneIfExists](self, "_sceneIfExists");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __69__CSPosterSwitcherViewController_setCoverSheetComplicationRowHidden___block_invoke;
    v5[3] = &unk_1E8E2F888;
    v5[4] = self;
    objc_msgSend(v4, "updateSettingsWithBlock:", v5);

  }
}

uint64_t __69__CSPosterSwitcherViewController_setCoverSheetComplicationRowHidden___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateComplicationRowHiddenForSceneSettings:", a2);
}

- (void)setVibrancyConfiguration:(id)a3
{
  BSUIVibrancyConfiguration *v4;
  BSUIVibrancyConfiguration *vibrancyConfiguration;
  void *v6;
  id v7;
  _QWORD v8[5];

  v7 = a3;
  if ((BSEqualObjects() & 1) == 0)
  {
    v4 = (BSUIVibrancyConfiguration *)objc_msgSend(v7, "copy");
    vibrancyConfiguration = self->_vibrancyConfiguration;
    self->_vibrancyConfiguration = v4;

    -[CSPosterSwitcherViewController _sceneIfExists](self, "_sceneIfExists");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __59__CSPosterSwitcherViewController_setVibrancyConfiguration___block_invoke;
    v8[3] = &unk_1E8E2F888;
    v8[4] = self;
    objc_msgSend(v6, "updateSettingsWithBlock:", v8);

  }
}

uint64_t __59__CSPosterSwitcherViewController_setVibrancyConfiguration___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateLockVibrancyConfigurationForSceneSettings:", a2);
}

- (void)setLeadingTopButtonFrame:(CGRect)a3 trailingTopButtonFrame:(CGRect)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  CGRect *p_leadingTopButtonFrame;
  id v14;
  _QWORD v15[5];
  CGRect v16;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v8 = a3.size.height;
  v9 = a3.size.width;
  v10 = a3.origin.y;
  v11 = a3.origin.x;
  p_leadingTopButtonFrame = &self->_leadingTopButtonFrame;
  if (!CGRectEqualToRect(a3, self->_leadingTopButtonFrame)
    || (v16.origin.x = x,
        v16.origin.y = y,
        v16.size.width = width,
        v16.size.height = height,
        !CGRectEqualToRect(v16, self->_trailingTopButtonFrame)))
  {
    p_leadingTopButtonFrame->origin.x = v11;
    p_leadingTopButtonFrame->origin.y = v10;
    p_leadingTopButtonFrame->size.width = v9;
    p_leadingTopButtonFrame->size.height = v8;
    self->_trailingTopButtonFrame.origin.x = x;
    self->_trailingTopButtonFrame.origin.y = y;
    self->_trailingTopButtonFrame.size.width = width;
    self->_trailingTopButtonFrame.size.height = height;
    -[CSPosterSwitcherViewController _sceneIfExists](self, "_sceneIfExists");
    v14 = (id)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __82__CSPosterSwitcherViewController_setLeadingTopButtonFrame_trailingTopButtonFrame___block_invoke;
    v15[3] = &unk_1E8E2F888;
    v15[4] = self;
    objc_msgSend(v14, "updateSettingsWithBlock:", v15);

  }
}

uint64_t __82__CSPosterSwitcherViewController_setLeadingTopButtonFrame_trailingTopButtonFrame___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateTopButtonLayoutForSceneSettings:", a2);
}

- (void)aggregateBehavior:(id)a3
{
  id v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CSPosterSwitcherViewController;
  v3 = a3;
  -[CSCoverSheetViewControllerBase aggregateBehavior:](&v4, sel_aggregateBehavior_, v3);
  objc_msgSend(v3, "setIdleTimerDuration:", 12, v4.receiver, v4.super_class);
  objc_msgSend(v3, "setIdleTimerMode:", 1);
  objc_msgSend(v3, "setIdleWarnMode:", 2);
  objc_msgSend(v3, "setNotificationBehavior:", 2);
  objc_msgSend(v3, "addRestrictedCapabilities:", 4096);

}

- (void)aggregateAppearance:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  unint64_t v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  id v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t i;
  void *v52;
  int v53;
  void *v54;
  uint64_t v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  unint64_t fullscreenTransitionAnimationCount;
  BOOL v63;
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
  CSPosterSwitcherViewController *v78;
  void *v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  _QWORD v90[5];
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  objc_super v97;
  _BYTE v98[128];
  _QWORD v99[5];
  _QWORD v100[8];

  v100[5] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v97.receiver = self;
  v97.super_class = (Class)CSPosterSwitcherViewController;
  -[CSCoverSheetViewControllerBase aggregateAppearance:](&v97, sel_aggregateAppearance_, v4);
  +[CSComponent proudLock](CSComponent, "proudLock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v100[0] = v5;
  +[CSComponent quickActions](CSComponent, "quickActions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v100[1] = v6;
  +[CSComponent footerStatusLabel](CSComponent, "footerStatusLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v100[2] = v7;
  +[CSComponent pageContent](CSComponent, "pageContent");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v100[3] = v8;
  +[CSComponent content](CSComponent, "content");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v100[4] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v100, 5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = -[CSPosterSwitcherViewController clientSwitcherLayoutMode](self, "clientSwitcherLayoutMode");
  SBLogDashBoard();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    -[CSPosterSwitcherViewController aggregateAppearance:].cold.1(v11 != 0, v12, v13, v14, v15, v16, v17, v18);

  v78 = self;
  -[CSPosterSwitcherViewController _sceneIfExists](self, "_sceneIfExists");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "clientSettings");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v20, "prui_primaryPosterScale");
  v22 = v21;
  v79 = v20;
  objc_msgSend(v20, "prui_primaryPosterOffset");
  if (v22 <= 0.0 || v11 == 0)
    v26 = 1.0;
  else
    v26 = v22;
  v27 = *MEMORY[0x1E0C9D538];
  v28 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  if (v11)
    v29 = v23;
  else
    v29 = *MEMORY[0x1E0C9D538];
  v95 = 0u;
  v96 = 0u;
  if (v11)
    v30 = v24;
  else
    v30 = v28;
  v94 = 0uLL;
  CSComponentTransitionInputsMake(0, (uint64_t)&v94, 0.001, v29, v30, v26, 0.0);
  v90[1] = 3221225472;
  v91 = v94;
  v90[0] = MEMORY[0x1E0C809B0];
  v90[2] = __54__CSPosterSwitcherViewController_aggregateAppearance___block_invoke;
  v90[3] = &__block_descriptor_88_e21__16__0__CSComponent_8l;
  v90[4] = 24;
  v92 = v95;
  v93 = v96;
  objc_msgSend(v10, "bs_map:", v90);
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  +[CSComponent statusBar](CSComponent, "statusBar");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v99[0] = v32;
  +[CSComponent controlCenterGrabber](CSComponent, "controlCenterGrabber");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v99[1] = v33;
  +[CSComponent footerCallToActionLabel](CSComponent, "footerCallToActionLabel");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v99[2] = v34;
  +[CSComponent pageControl](CSComponent, "pageControl");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v99[3] = v35;
  +[CSComponent whitePoint](CSComponent, "whitePoint");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v99[4] = v36;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v99, 5);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "arrayByAddingObjectsFromArray:", v37);
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_msgSend(v38, "bs_map:", &__block_literal_global_13);
    v39 = objc_claimAutoreleasedReturnValue();

    v38 = (void *)v39;
  }
  v40 = (void *)objc_opt_new();
  objc_msgSend(v40, "suppressTeachableMomentsAnimation:", 1);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "priority:", 40);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "hidden:", v11 != 0);
  v43 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v43, "transitionModifiers:", 24);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v87 = v94;
  v88 = v95;
  v89 = v96;
  objc_msgSend(v44, "transitionInputs:", &v87);
  v45 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v38, "arrayByAddingObject:", v45);
  v46 = (void *)objc_claimAutoreleasedReturnValue();

  v85 = 0u;
  v86 = 0u;
  v83 = 0u;
  v84 = 0u;
  v47 = v46;
  v48 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v83, v98, 16);
  if (v48)
  {
    v49 = v48;
    v50 = *(_QWORD *)v84;
    do
    {
      for (i = 0; i != v49; ++i)
      {
        if (*(_QWORD *)v84 != v50)
          objc_enumerationMutation(v47);
        objc_msgSend(v4, "addComponent:", *(_QWORD *)(*((_QWORD *)&v83 + 1) + 8 * i));
      }
      v49 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v83, v98, 16);
    }
    while (v49);
  }

  -[CSPosterSwitcherViewController hostedAppSceneHandle](v78, "hostedAppSceneHandle");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v53 = objc_msgSend(v52, "isContentReady");

  if (v53)
  {
    if (__sb__runningInSpringBoard())
    {
      if (SBFEffectiveDeviceClass() != 2)
        goto LABEL_30;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      v55 = objc_msgSend(v54, "userInterfaceIdiom");

      if (v55 != 1)
        goto LABEL_30;
    }
    +[CSComponent complicationSidebar](CSComponent, "complicationSidebar");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "priority:", 40);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "hidden:", 1);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addComponent:", v58);

    +[CSComponent fullBleedContent](CSComponent, "fullBleedContent");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "priority:", 40);
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "flag:", 1);
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addComponent:", v61);

  }
LABEL_30:
  fullscreenTransitionAnimationCount = v78->_fullscreenTransitionAnimationCount;
  if (fullscreenTransitionAnimationCount)
    v63 = 1;
  else
    v63 = v11 == 0;
  if (v63)
  {
    v88 = 0u;
    v89 = 0u;
    v87 = 0u;
    CSComponentTransitionInputsMake(1, (uint64_t)&v87, 0.0, v27, v28, 0.0, 0.0);
    +[CSComponent modalContent](CSComponent, "modalContent");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "priority:", 40);
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "transitionModifiers:", 64);
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    v80 = v87;
    v81 = v88;
    v82 = v89;
    objc_msgSend(v66, "transitionInputs:", &v80);
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addComponent:", v67);

    +[CSComponent backgroundContent](CSComponent, "backgroundContent");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v68, "priority:", 40);
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v69, "transitionModifiers:", 64);
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    v80 = v87;
    v81 = v88;
    v82 = v89;
    objc_msgSend(v70, "transitionInputs:", &v80);
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addComponent:", v71);

  }
  v72 = (void *)objc_opt_new();
  objc_msgSend(v72, "priority:", 40);
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v73, "hidden:", 0);
  v74 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v74, "setLevel:", 1);
  if (fullscreenTransitionAnimationCount | v11)
  {
    v75 = (void *)objc_opt_new();
    objc_msgSend(v75, "shouldMatchMove:", 0);
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v76, "priority:", 40);
    v77 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v77, "setLevel:", 1);
    if (v11)
    {
      objc_msgSend(v77, "setShouldRenderForPosterSwitcher:", 1);
      objc_msgSend(v74, "setShouldMatchBackgroundStyle:", 0);
    }
    objc_msgSend(v4, "addComponent:", v77);

  }
  objc_msgSend(v4, "addComponent:", v74);

}

id __54__CSPosterSwitcherViewController_aggregateAppearance___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  __int128 v4;
  void *v5;
  _OWORD v7[3];

  objc_msgSend(a2, "transitionModifiers:", *(_QWORD *)(a1 + 32));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_OWORD *)(a1 + 56);
  v7[0] = *(_OWORD *)(a1 + 40);
  v7[1] = v4;
  v7[2] = *(_OWORD *)(a1 + 72);
  objc_msgSend(v3, "transitionInputs:", v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __54__CSPosterSwitcherViewController_aggregateAppearance___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "priority:", 40);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "hidden:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)handleEvent:(id)a3
{
  id v4;
  char v5;
  uint64_t v6;
  NSObject *v7;
  const char *v8;
  void *v9;
  char v10;
  uint8_t v12[16];
  objc_super v13;

  v4 = a3;
  if (objc_msgSend(v4, "type") == 9)
    -[CSPosterSwitcherViewController _sendDismissEntirelyActionToScene](self, "_sendDismissEntirelyActionToScene");
  v13.receiver = self;
  v13.super_class = (Class)CSPosterSwitcherViewController;
  if (!-[CSCoverSheetViewControllerBase handleEvent:](&v13, sel_handleEvent_, v4)
    || (objc_msgSend(v4, "isConsumable") & 1) == 0)
  {
    v6 = objc_msgSend(v4, "type");
    if (v6 == 13)
    {
      objc_msgSend(v4, "value");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "BOOLValue");

      if ((v10 & 1) == 0)
      {
        SBLogDashBoard();
        v7 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v12 = 0;
          v8 = "Dismissing Poster Switcher due to authentication change.";
          goto LABEL_13;
        }
LABEL_14:

        -[CSPosterSwitcherViewController _dismissEntirely](self, "_dismissEntirely");
      }
    }
    else if (v6 == 25)
    {
      SBLogDashBoard();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v12 = 0;
        v8 = "Dismissing Poster Switcher due to screen-off.";
LABEL_13:
        _os_log_impl(&dword_1D0337000, v7, OS_LOG_TYPE_DEFAULT, v8, v12, 2u);
        goto LABEL_14;
      }
      goto LABEL_14;
    }
    v5 = 0;
    goto LABEL_16;
  }
  v5 = objc_msgSend(v4, "isConsumable");
LABEL_16:

  return v5;
}

- (void)addGrabberView:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    -[CSPosterSwitcherViewController view](self, "view");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "bounds");
    objc_msgSend(v5, "setFrame:");

    objc_msgSend(v5, "setAutoresizingMask:", 18);
    objc_msgSend(v5, "setAlpha:", 0.0);
    -[UIView addSubview:](self->_scaleView, "addSubview:", v5);
  }

}

- (void)handleBottomEdgeGestureEnded:(id)a3
{
  -[CSPosterSwitcherViewController _dismissTier:](self, "_dismissTier:", 1);
}

- (void)dismissForHomeButton
{
  NSObject *v3;
  uint8_t v4[16];

  SBLogDashBoard();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1D0337000, v3, OS_LOG_TYPE_DEFAULT, "Dismissing Poster Switcher due to home button press.", v4, 2u);
  }

  -[CSPosterSwitcherViewController _dismissTier:](self, "_dismissTier:", 1);
}

- (BOOL)handlesRotationIndependentOfCoverSheet
{
  return 0;
}

- (BOOL)canHostAnApp
{
  return -[SBApplicationHosting canHostAnApp](self->_applicationHoster, "canHostAnApp");
}

- (BOOL)isHostingAnApp
{
  return -[SBApplicationHosting isHostingAnApp](self->_applicationHoster, "isHostingAnApp");
}

- (id)hostedAppSceneHandle
{
  return (id)-[SBApplicationHosting hostedAppSceneHandle](self->_applicationHoster, "hostedAppSceneHandle");
}

- (id)hostedAppSceneHandles
{
  return (id)-[SBApplicationHosting hostedAppSceneHandles](self->_applicationHoster, "hostedAppSceneHandles");
}

- (void)hostedAppWillRotateToInterfaceOrientation:(int64_t)a3
{
  -[SBApplicationHosting hostedAppWillRotateToInterfaceOrientation:](self->_applicationHoster, "hostedAppWillRotateToInterfaceOrientation:", a3);
}

- (void)_applicationHosterDidInvalidate
{
  void (**v2)(void);
  void (**v3)(void);

  -[CSPosterSwitcherViewController invalidationHandler](self, "invalidationHandler");
  v2 = (void (**)(void))objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = v2;
    v2[2]();
    v2 = v3;
  }

}

- (NSString)hostedAppBundleIdentifier
{
  return (NSString *)CFSTR("com.apple.PosterBoard");
}

- (BOOL)hostedAppShouldHideHomeGrabberView
{
  return 1;
}

- (void)appendToHostedAppSceneSettings:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "prui_setPreferredSwitcherLayoutMode:", 0);
  -[CSPosterSwitcherViewController _updateOverlayViewSpecificationForSceneSettings:](self, "_updateOverlayViewSpecificationForSceneSettings:", v4);
  -[CSPosterSwitcherViewController _updateLiveContentViewSpecificationForSceneSettings:](self, "_updateLiveContentViewSpecificationForSceneSettings:", v4);
  -[CSPosterSwitcherViewController _updateLiveFloatingViewSpecificationForSceneSettings:](self, "_updateLiveFloatingViewSpecificationForSceneSettings:", v4);
  -[CSPosterSwitcherViewController _updateFloatingLayerInlinedForSceneSettings:](self, "_updateFloatingLayerInlinedForSceneSettings:", v4);
  -[CSPosterSwitcherViewController _updateComplicationRowHiddenForSceneSettings:](self, "_updateComplicationRowHiddenForSceneSettings:", v4);
  -[CSPosterSwitcherViewController _updateTopButtonLayoutForSceneSettings:](self, "_updateTopButtonLayoutForSceneSettings:", v4);
  -[CSPosterSwitcherViewController _updateLockVibrancyConfigurationForSceneSettings:](self, "_updateLockVibrancyConfigurationForSceneSettings:", v4);

}

- (BOOL)hostedAppShouldDeactivateAfterDisappearance
{
  return 1;
}

- (BOOL)hostedAppShouldInvalidateUponDeactivation
{
  return 1;
}

- (BOOL)hostedAppShouldReactivateUponDestruction
{
  return 0;
}

- (void)sceneHandle:(id)a3 didCreateScene:(id)a4
{
  CSTraitsAwareOrientedAppHosting *traitsAwareViewController;
  id v7;
  id v8;

  traitsAwareViewController = self->_traitsAwareViewController;
  v7 = a3;
  -[CSTraitsAwareOrientedAppHosting hostedSceneHandle](traitsAwareViewController, "hostedSceneHandle");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (a4 && v8 == v7)
  {
    if (-[CSPosterSwitcherViewController bs_isAppearingOrAppeared](self, "bs_isAppearingOrAppeared"))
      -[CSTraitsAwareOrientedAppHosting sceneDidAttach](self->_traitsAwareViewController, "sceneDidAttach");
  }
}

- (void)sceneHandle:(id)a3 didDestroyScene:(id)a4
{
  id v6;
  id v7;

  v6 = a3;
  -[CSPosterSwitcherViewController _dismissEntirely](self, "_dismissEntirely");
  -[CSTraitsAwareOrientedAppHosting hostedSceneHandle](self->_traitsAwareViewController, "hostedSceneHandle");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (a4)
  {
    if (v7 == v6)
      -[CSTraitsAwareOrientedAppHosting sceneWasDestroyed](self->_traitsAwareViewController, "sceneWasDestroyed");
  }
}

- (void)sceneHandle:(id)a3 didUpdateContentState:(int64_t)a4
{
  id v5;
  void *v6;
  _QWORD v7[5];
  id v8;

  v5 = a3;
  -[CSPosterSwitcherViewController _evaluateInitialTransitionActivation](self, "_evaluateInitialTransitionActivation");
  if ((objc_msgSend(v5, "isContentReady") & 1) != 0)
  {
    v6 = (void *)MEMORY[0x1E0CD28B0];
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __68__CSPosterSwitcherViewController_sceneHandle_didUpdateContentState___block_invoke;
    v7[3] = &unk_1E8E2DC00;
    v7[4] = self;
    v8 = v5;
    objc_msgSend(v6, "bs_performAfterSynchronizedCommit:", v7);

  }
  else
  {
    -[CSPosterSwitcherViewController setHasCommittedInContentReadyState:](self, "setHasCommittedInContentReadyState:", 0);
  }

}

uint64_t __68__CSPosterSwitcherViewController_sceneHandle_didUpdateContentState___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setHasCommittedInContentReadyState:", objc_msgSend(*(id *)(a1 + 40), "isContentReady"));
  return objc_msgSend(*(id *)(a1 + 32), "_evaluateInitialTouchTransferActuation");
}

- (void)sceneHandle:(id)a3 didUpdateClientSettingsWithDiff:(id)a4 transitionContext:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  char v14;
  unint64_t v15;
  unint64_t v16;
  NSObject *v17;
  BOOL v18;
  int v19;
  id v20;
  char v21;

  v8 = a5;
  v9 = a4;
  objc_msgSend(a3, "scene");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "clientSettings");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "prui_switcherLayoutMode");

  v21 = 0;
  -[CSPosterSwitcherViewController sceneClientSettingsDiffInspector](self, "sceneClientSettingsDiffInspector");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "inspectDiff:withContext:", v9, &v21);

  v14 = v21;
  if ((v21 & 2) != 0)
    -[CSPosterSwitcherViewController _evaluateInitialTouchTransferActuation](self, "_evaluateInitialTouchTransferActuation");
  v15 = -[CSPosterSwitcherViewController clientSwitcherLayoutMode](self, "clientSwitcherLayoutMode");
  if ((v14 & 1) != 0)
  {
    v16 = v15;
    if (v12 != v15)
    {
      SBLogDashBoard();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
        -[CSPosterSwitcherViewController sceneHandle:didUpdateClientSettingsWithDiff:transitionContext:].cold.1();

      if (v16)
        v18 = v12 == 0;
      else
        v18 = 1;
      v19 = v18;
      if (v16 && !v12)
        -[CSPosterSwitcherViewController _updateAppearanceWithoutAnimation](self, "_updateAppearanceWithoutAnimation");
      -[CSPosterSwitcherViewController setClientSwitcherLayoutMode:](self, "setClientSwitcherLayoutMode:", v12);
      if (v19)
      {
        v20 = v8;
        _UISceneSettingsDiffActionPerformChangesWithTransitionContext();

      }
    }
  }

}

uint64_t __96__CSPosterSwitcherViewController_sceneHandle_didUpdateClientSettingsWithDiff_transitionContext___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateAppearanceWithClientLayoutMode:previousLayoutMode:transitionContext:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40));
}

- (BOOL)sceneHandle:(id)a3 didReceiveAction:(id)a4
{
  return 0;
}

- (id)_sceneIfExists
{
  void *v2;
  void *v3;

  -[CSPosterSwitcherViewController hostedAppSceneHandle](self, "hostedAppSceneHandle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sceneIfExists");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)_evaluateInitialTransitionActivation
{
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;

  if (!-[CSPosterSwitcherViewController handledInitialTransition](self, "handledInitialTransition")
    && -[CSPosterSwitcherViewController _appearState](self, "_appearState") == 2)
  {
    -[CSPosterSwitcherViewController hostedAppSceneHandle](self, "hostedAppSceneHandle");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "sceneIfExists");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3 && objc_msgSend(v6, "isContentReady"))
    {
      -[CSPosterSwitcherViewController setHandledInitialTransition:](self, "setHandledInitialTransition:", 1);
      objc_msgSend(v3, "clientSettings");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      -[CSPosterSwitcherViewController setClientSwitcherLayoutMode:](self, "setClientSwitcherLayoutMode:", objc_msgSend(v4, "prui_switcherLayoutMode"));

      if (CSFeatureEnabled(1))
        v5 = 2;
      else
        v5 = 1;
      -[CSPosterSwitcherViewController _transitionScene:toLayoutMode:animated:](self, "_transitionScene:toLayoutMode:animated:", v3, v5, 1);
      -[CSPosterSwitcherViewController _updateAppearanceWithoutAnimation](self, "_updateAppearanceWithoutAnimation");
    }

  }
}

- (void)_evaluateInitialTouchTransferActuation
{
  void *v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  NSStringFromSelector(a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)objc_opt_class();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_3(&dword_1D0337000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_5();
}

uint64_t __72__CSPosterSwitcherViewController__evaluateInitialTouchTransferActuation__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(a2, "_touchIdentifier"));
}

- (void)_transitionScene:(id)a3 toLayoutMode:(unint64_t)a4 animated:(BOOL)a5
{
  id v7;
  NSObject *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  unint64_t v12;
  BOOL v13;

  v7 = a3;
  SBLogDashBoard();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    -[CSPosterSwitcherViewController _transitionScene:toLayoutMode:animated:].cold.1();

  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __73__CSPosterSwitcherViewController__transitionScene_toLayoutMode_animated___block_invoke;
  v10[3] = &unk_1E8E2F978;
  v13 = a5;
  v11 = v7;
  v12 = a4;
  v9 = v7;
  objc_msgSend(v9, "updateSettingsWithTransitionBlock:", v10);

}

id __73__CSPosterSwitcherViewController__transitionScene_toLayoutMode_animated___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;

  objc_msgSend(a2, "prui_setPreferredSwitcherLayoutMode:", *(_QWORD *)(a1 + 40));
  if (*(_BYTE *)(a1 + 48) && objc_msgSend(*(id *)(a1 + 32), "isActive"))
  {
    objc_msgSend(MEMORY[0x1E0CEA350], "transitionContext");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    MEMORY[0x1D17E0E94]();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setAnimationSettings:", v4);

  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (void)_updateOverlayViewSpecificationForSceneSettings:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[CSPosterSwitcherViewController coverSheetBackgroundView](self, "coverSheetBackgroundView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "layer");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v4, "prui_setLockPosterOverlayLayerRenderID:", CALayerGetRenderId());
    objc_msgSend(v7, "context");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "prui_setLockPosterOverlayLayerContextID:", objc_msgSend(v6, "contextId"));

    v4 = v6;
  }
  else
  {
    objc_msgSend(v4, "prui_setLockPosterOverlayLayerRenderID:", 0);
    objc_msgSend(v4, "prui_setLockPosterOverlayLayerContextID:", 0);
  }

}

- (void)_updateLiveContentViewSpecificationForSceneSettings:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[CSPosterSwitcherViewController coverSheetWallpaperView](self, "coverSheetWallpaperView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "layer");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v4, "prui_setLockPosterLiveContentLayerRenderID:", CALayerGetRenderId());
    objc_msgSend(v7, "context");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "prui_setLockPosterLiveContentLayerContextID:", objc_msgSend(v6, "contextId"));

    v4 = v6;
  }
  else
  {
    objc_msgSend(v4, "prui_setLockPosterLiveContentLayerRenderID:", 0);
    objc_msgSend(v4, "prui_setLockPosterLiveContentLayerContextID:", 0);
  }

}

- (void)_updateLiveFloatingViewSpecificationForSceneSettings:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[CSPosterSwitcherViewController coverSheetFloatingView](self, "coverSheetFloatingView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "layer");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v4, "prui_setLockPosterLiveFloatingLayerRenderID:", CALayerGetRenderId());
    objc_msgSend(v7, "context");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "prui_setLockPosterLiveFloatingLayerContextID:", objc_msgSend(v6, "contextId"));

    v4 = v6;
  }
  else
  {
    objc_msgSend(v4, "prui_setLockPosterLiveFloatingLayerRenderID:", 0);
    objc_msgSend(v4, "prui_setLockPosterLiveFloatingLayerContextID:", 0);
  }

}

- (void)_updateFloatingLayerInlinedForSceneSettings:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "prui_setLockPosterFloatingLayerInlined:", -[CSPosterSwitcherViewController isCoverSheetWallpaperFloatingLayerInlined](self, "isCoverSheetWallpaperFloatingLayerInlined"));

}

- (void)_updateComplicationRowHiddenForSceneSettings:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "prui_setLockPosterComplicationRowHidden:", -[CSPosterSwitcherViewController isCoverSheetComplicationRowHidden](self, "isCoverSheetComplicationRowHidden"));

}

- (void)_updateTopButtonLayoutForSceneSettings:(id)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  id v20;

  v20 = a3;
  -[CSPosterSwitcherViewController leadingTopButtonFrame](self, "leadingTopButtonFrame");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  -[CSPosterSwitcherViewController trailingTopButtonFrame](self, "trailingTopButtonFrame");
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v19 = v18;
  objc_msgSend(v20, "prui_setLeadingTopButtonFrame:", v5, v7, v9, v11);
  objc_msgSend(v20, "prui_setTrailingTopButtonFrame:", v13, v15, v17, v19);

}

- (void)_updateLockVibrancyConfigurationForSceneSettings:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CSPosterSwitcherViewController vibrancyConfiguration](self, "vibrancyConfiguration");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "prui_setLockVibrancyConfiguration:", v5);

}

- (void)_updateAppearanceWithClientLayoutMode:(unint64_t)a3 previousLayoutMode:(unint64_t)a4 transitionContext:(id)a5
{
  id v8;
  BOOL v9;
  char v10;
  id v11;
  _QWORD v12[5];
  char v13;
  _QWORD v14[4];
  id v15;

  v8 = a5;
  if (a3)
    v9 = a4 == 0;
  else
    v9 = 1;
  v10 = v9;
  if (v9)
    ++self->_fullscreenTransitionAnimationCount;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __109__CSPosterSwitcherViewController__updateAppearanceWithClientLayoutMode_previousLayoutMode_transitionContext___block_invoke;
  v14[3] = &unk_1E8E2F9A0;
  v15 = v8;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __109__CSPosterSwitcherViewController__updateAppearanceWithClientLayoutMode_previousLayoutMode_transitionContext___block_invoke_2;
  v12[3] = &unk_1E8E2F7D0;
  v13 = v10;
  v12[4] = self;
  v11 = v8;
  -[CSCoverSheetViewControllerBase updateAppearance:completion:](self, "updateAppearance:completion:", v14, v12);

}

id __109__CSPosterSwitcherViewController__updateAppearanceWithClientLayoutMode_previousLayoutMode_transitionContext___block_invoke(uint64_t a1)
{
  void *v1;

  v1 = *(void **)(a1 + 32);
  if (v1)
    objc_msgSend(v1, "animationSettings");
  else
    objc_msgSend(MEMORY[0x1E0D016B0], "settingsWithDuration:", 0.0);
  return (id)objc_claimAutoreleasedReturnValue();
}

uint64_t __109__CSPosterSwitcherViewController__updateAppearanceWithClientLayoutMode_previousLayoutMode_transitionContext___block_invoke_2(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;

  if (*(_BYTE *)(result + 40))
  {
    v1 = result;
    v2 = objc_msgSend(*(id *)(result + 32), "_effectiveSceneClientLayoutMode");
    v3 = *(_QWORD **)(v1 + 32);
    if (v2)
    {
      --v3[138];
      result = *(_QWORD *)(v1 + 32);
      if (!*(_QWORD *)(result + 1104))
        return objc_msgSend((id)result, "updateAppearanceForController:", *(_QWORD *)(v1 + 32));
    }
    else
    {
      return objc_msgSend(v3, "_dismissEntirely");
    }
  }
  return result;
}

- (void)_updateAppearanceWithoutAnimation
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __67__CSPosterSwitcherViewController__updateAppearanceWithoutAnimation__block_invoke;
  v2[3] = &unk_1E8E2DB38;
  v2[4] = self;
  objc_msgSend(MEMORY[0x1E0CEABB0], "performWithoutAnimation:", v2);
}

uint64_t __67__CSPosterSwitcherViewController__updateAppearanceWithoutAnimation__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateAppearance:", &__block_literal_global_44);
}

uint64_t __67__CSPosterSwitcherViewController__updateAppearanceWithoutAnimation__block_invoke_2()
{
  return objc_msgSend(MEMORY[0x1E0D016B0], "settingsWithDuration:", 0.0);
}

- (unint64_t)_effectiveSceneClientLayoutMode
{
  void *v2;
  void *v3;
  void *v4;
  unint64_t v5;

  -[CSPosterSwitcherViewController _sceneIfExists](self, "_sceneIfExists");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "clientSettings");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "prui_switcherLayoutMode");

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)_dismissTier:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = a3;
  -[CSPosterSwitcherViewController _sceneIfExists](self, "_sceneIfExists");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "contentState") == 2)
  {
    v5 = (void *)MEMORY[0x1E0C99E60];
    objc_msgSend(MEMORY[0x1E0D7F858], "actionWithAnimation:", v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setWithObject:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "sendActions:", v7);

  }
  else
  {
    -[CSPosterSwitcherViewController _dismissEntirely](self, "_dismissEntirely");
  }

}

- (void)_sendDismissEntirelyActionToScene
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  -[CSPosterSwitcherViewController _sceneIfExists](self, "_sceneIfExists");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v2 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(MEMORY[0x1E0D7F850], "actionActivatingCurrentPoster:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithObject:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sendActions:", v4);

}

- (void)_dismissEntirely
{
  id v3;

  -[CSPosterSwitcherViewController _sendDismissEntirelyActionToScene](self, "_sendDismissEntirelyActionToScene");
  if (-[CSPosterSwitcherViewController hasEverAppeared](self, "hasEverAppeared"))
  {
    +[CSAction actionWithType:](CSAction, "actionWithType:", 1);
    v3 = (id)objc_claimAutoreleasedReturnValue();
    -[CSCoverSheetViewControllerBase sendAction:](self, "sendAction:", v3);

  }
  else
  {
    -[CSPosterSwitcherViewController _applicationHosterDidInvalidate](self, "_applicationHosterDidInvalidate");
  }
}

- (CSTraitAwareAppHostConfiguring)appHostConfiguring
{
  return self->_appHostConfiguring;
}

- (NSArray)activatingTouches
{
  return self->_activatingTouches;
}

- (void)setActivatingTouches:(id)a3
{
  objc_storeStrong((id *)&self->_activatingTouches, a3);
}

- (UIView)coverSheetBackgroundView
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_coverSheetBackgroundView);
}

- (UIView)coverSheetWallpaperView
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_coverSheetWallpaperView);
}

- (UIView)coverSheetFloatingView
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_coverSheetFloatingView);
}

- (BOOL)isCoverSheetWallpaperFloatingLayerInlined
{
  return self->_coverSheetWallpaperFloatingLayerInlined;
}

- (BOOL)isCoverSheetComplicationRowHidden
{
  return self->_coverSheetComplicationRowHidden;
}

- (UIWindow)targetWindow
{
  return self->_targetWindow;
}

- (void)setTargetWindow:(id)a3
{
  objc_storeStrong((id *)&self->_targetWindow, a3);
}

- (BSUIVibrancyConfiguration)vibrancyConfiguration
{
  return self->_vibrancyConfiguration;
}

- (CGRect)leadingTopButtonFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_leadingTopButtonFrame.origin.x;
  y = self->_leadingTopButtonFrame.origin.y;
  width = self->_leadingTopButtonFrame.size.width;
  height = self->_leadingTopButtonFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (CGRect)trailingTopButtonFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_trailingTopButtonFrame.origin.x;
  y = self->_trailingTopButtonFrame.origin.y;
  width = self->_trailingTopButtonFrame.size.width;
  height = self->_trailingTopButtonFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (BOOL)handledInitialTransition
{
  return self->_handledInitialTransition;
}

- (void)setHandledInitialTransition:(BOOL)a3
{
  self->_handledInitialTransition = a3;
}

- (BOOL)hasTransferredInitialTouches
{
  return self->_hasTransferredInitialTouches;
}

- (void)setHasTransferredInitialTouches:(BOOL)a3
{
  self->_hasTransferredInitialTouches = a3;
}

- (BOOL)hasCommittedInContentReadyState
{
  return self->_hasCommittedInContentReadyState;
}

- (void)setHasCommittedInContentReadyState:(BOOL)a3
{
  self->_hasCommittedInContentReadyState = a3;
}

- (BOOL)hasEverAppeared
{
  return self->_hasEverAppeared;
}

- (void)setHasEverAppeared:(BOOL)a3
{
  self->_hasEverAppeared = a3;
}

- (unint64_t)fullscreenTransitionAnimationCount
{
  return self->_fullscreenTransitionAnimationCount;
}

- (void)setFullscreenTransitionAnimationCount:(unint64_t)a3
{
  self->_fullscreenTransitionAnimationCount = a3;
}

- (unint64_t)clientSwitcherLayoutMode
{
  return self->_clientSwitcherLayoutMode;
}

- (void)setClientSwitcherLayoutMode:(unint64_t)a3
{
  self->_clientSwitcherLayoutMode = a3;
}

- (PRUISSwitcherSceneClientSettingsDiffInspector)sceneClientSettingsDiffInspector
{
  return self->_sceneClientSettingsDiffInspector;
}

- (UIView)scaleView
{
  return self->_scaleView;
}

- (SBApplicationHosting)applicationHoster
{
  return self->_applicationHoster;
}

- (id)invalidationHandler
{
  return self->_invalidationHandler;
}

- (void)setInvalidationHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1144);
}

- (CSTraitsAwareOrientedAppHosting)traitsAwareViewController
{
  return self->_traitsAwareViewController;
}

- (void)setTraitsAwareViewController:(id)a3
{
  objc_storeStrong((id *)&self->_traitsAwareViewController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_traitsAwareViewController, 0);
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong((id *)&self->_applicationHoster, 0);
  objc_storeStrong((id *)&self->_scaleView, 0);
  objc_storeStrong((id *)&self->_sceneClientSettingsDiffInspector, 0);
  objc_storeStrong((id *)&self->_vibrancyConfiguration, 0);
  objc_storeStrong((id *)&self->_targetWindow, 0);
  objc_destroyWeak((id *)&self->_coverSheetFloatingView);
  objc_destroyWeak((id *)&self->_coverSheetWallpaperView);
  objc_destroyWeak((id *)&self->_coverSheetBackgroundView);
  objc_storeStrong((id *)&self->_activatingTouches, 0);
  objc_storeStrong((id *)&self->_appHostConfiguring, 0);
}

- (void)setAppHostConfiguring:(const char *)a1 .cold.1(const char *a1)
{
  void *v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  NSStringFromSelector(a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)objc_opt_class();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_3(&dword_1D0337000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_5();
}

- (void)aggregateAppearance:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_3(&dword_1D0337000, a2, a3, "Updating Poster Switcher appearance with scaled switcher layout: %u", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2();
}

- (void)sceneHandle:didUpdateClientSettingsWithDiff:transitionContext:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  NSStringFromPRUISwitcherLayoutMode();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_1(&dword_1D0337000, v1, v2, "Poster Switcher reflecting client layout mode update to: %@", v3, v4, v5, v6, 2u);

  OUTLINED_FUNCTION_10();
}

- (void)_transitionScene:toLayoutMode:animated:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  NSStringFromPRUISwitcherLayoutMode();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_1(&dword_1D0337000, v1, v2, "Poster Switcher is updating preferred layout mode to: %@", v3, v4, v5, v6, 2u);

  OUTLINED_FUNCTION_10();
}

@end
