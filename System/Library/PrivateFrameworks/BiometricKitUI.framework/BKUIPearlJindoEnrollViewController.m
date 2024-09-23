@implementation BKUIPearlJindoEnrollViewController

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t);
  void *v10;
  id v11;
  id location;
  objc_super v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v13.receiver = self;
  v13.super_class = (Class)BKUIPearlJindoEnrollViewController;
  -[BKUIPearlEnrollViewController viewDidLoad](&v13, sel_viewDidLoad);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__sceneWillDeactivate_, *MEMORY[0x1E0CEBB68], 0);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObserver:selector:name:object:", self, sel__sceneDidActivate_, *MEMORY[0x1E0CEBB40], 0);

  objc_initWeak(&location, self);
  v14[0] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x1E0C809B0];
  v8 = 3221225472;
  v9 = __49__BKUIPearlJindoEnrollViewController_viewDidLoad__block_invoke;
  v10 = &unk_1EA27FB48;
  objc_copyWeak(&v11, &location);
  -[BKUIPearlJindoEnrollViewController registerForTraitChanges:withHandler:](self, "registerForTraitChanges:withHandler:", v5, &v7);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[BKUIPearlJindoEnrollViewController setTraitChangeRegistration:](self, "setTraitChangeRegistration:", v6, v7, v8, v9, v10);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

void __49__BKUIPearlJindoEnrollViewController_viewDidLoad__block_invoke(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "instructionView");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setDarkMode:", objc_msgSend(WeakRetained, "_isDarkMode"));

}

- (void)viewWillDisappear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)BKUIPearlJindoEnrollViewController;
  -[BKUIPearlJindoEnrollViewController viewWillDisappear:](&v5, sel_viewWillDisappear_, a3);
  -[BKUIPearlJindoEnrollViewController presentable](self, "presentable");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "revoke");

}

- (void)navigateToMidFlowPeriocularSplashScreenWithPrepareAction:(id)a3 completionAction:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  objc_super v9;
  _QWORD v10[4];
  id v11;
  _QWORD v12[4];
  id v13;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  v8 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __112__BKUIPearlJindoEnrollViewController_navigateToMidFlowPeriocularSplashScreenWithPrepareAction_completionAction___block_invoke;
  v12[3] = &unk_1EA27FB70;
  objc_copyWeak(&v13, &location);
  v10[0] = v8;
  v10[1] = 3221225472;
  v10[2] = __112__BKUIPearlJindoEnrollViewController_navigateToMidFlowPeriocularSplashScreenWithPrepareAction_completionAction___block_invoke_2;
  v10[3] = &unk_1EA27FB70;
  objc_copyWeak(&v11, &location);
  v9.receiver = self;
  v9.super_class = (Class)BKUIPearlJindoEnrollViewController;
  -[BKUIPearlEnrollViewController navigateToMidFlowPeriocularSplashScreenWithPrepareAction:completionAction:](&v9, sel_navigateToMidFlowPeriocularSplashScreenWithPrepareAction_completionAction_, v12, v10);
  objc_destroyWeak(&v11);
  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);

}

void __112__BKUIPearlJindoEnrollViewController_navigateToMidFlowPeriocularSplashScreenWithPrepareAction_completionAction___block_invoke(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "presentable");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "revoke");

}

void __112__BKUIPearlJindoEnrollViewController_navigateToMidFlowPeriocularSplashScreenWithPrepareAction_completionAction___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_postBannerToDestinationWithInitialStateCollapsed:", 0);

}

- (void)transitionToSuccessFromPeriocularSplash
{
  void *v3;
  dispatch_time_t v4;
  _QWORD block[5];

  -[BKUIPearlEnrollViewController enrollView](self, "enrollView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setHidden:", 1);

  v4 = dispatch_time(0, 650000000);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __77__BKUIPearlJindoEnrollViewController_transitionToSuccessFromPeriocularSplash__block_invoke;
  block[3] = &unk_1EA27FB98;
  block[4] = self;
  dispatch_after(v4, MEMORY[0x1E0C80D38], block);
}

void __77__BKUIPearlJindoEnrollViewController_transitionToSuccessFromPeriocularSplash__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t);
  void *v14;
  uint64_t v15;

  objc_msgSend(*(id *)(a1 + 32), "midFlowPeriocularSplashController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "layer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeAllAnimations");

  objc_msgSend(MEMORY[0x1E0CD28B0], "flush");
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "containerView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bringSubviewToFront:", v7);

  objc_msgSend(*(id *)(a1 + 32), "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setOrigin:", *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8));

  +[BKUIPearlEnrollAnimationManager sharedManager](BKUIPearlEnrollAnimationManager, "sharedManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = *(_QWORD *)(a1 + 32);
  v11 = MEMORY[0x1E0C809B0];
  v12 = 3221225472;
  v13 = __77__BKUIPearlJindoEnrollViewController_transitionToSuccessFromPeriocularSplash__block_invoke_2;
  v14 = &unk_1EA27FB98;
  v15 = v10;
  objc_msgSend(v9, "transitionTo:completion:");

}

void __77__BKUIPearlJindoEnrollViewController_transitionToSuccessFromPeriocularSplash__block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  dispatch_time_t v7;
  _QWORD block[5];

  objc_msgSend(*(id *)(a1 + 32), "midFlowPeriocularSplashController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeFromSuperview");

  objc_msgSend(*(id *)(a1 + 32), "parentViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "midFlowPeriocularSplashController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeChildViewController:", v5);

  objc_msgSend(*(id *)(a1 + 32), "setNeedsStatusBarAppearanceUpdate");
  objc_msgSend(*(id *)(a1 + 32), "_postBannerToDestinationWithInitialStateCollapsed:", 1);
  objc_msgSend(*(id *)(a1 + 32), "presentable");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "collapse");

  v7 = dispatch_time(0, 150000000);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __77__BKUIPearlJindoEnrollViewController_transitionToSuccessFromPeriocularSplash__block_invoke_3;
  block[3] = &unk_1EA27FB98;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_after(v7, MEMORY[0x1E0C80D38], block);
}

void __77__BKUIPearlJindoEnrollViewController_transitionToSuccessFromPeriocularSplash__block_invoke_3(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "setState:animated:", 10, 1);
  objc_msgSend(*(id *)(a1 + 32), "enrollView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setHidden:", 0);

}

- (void)animateToSuccessCompletionLayout:(int64_t)a3
{
  void *v4;
  dispatch_time_t v5;
  _QWORD block[5];
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)BKUIPearlJindoEnrollViewController;
  -[BKUIPearlEnrollViewController animateToSuccessCompletionLayout:](&v7, sel_animateToSuccessCompletionLayout_, a3);
  -[BKUIPearlJindoEnrollViewController presentable](self, "presentable");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "collapse");

  v5 = dispatch_time(0, 4000000000);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __71__BKUIPearlJindoEnrollViewController_animateToSuccessCompletionLayout___block_invoke;
  block[3] = &unk_1EA27FB98;
  block[4] = self;
  dispatch_after(v5, MEMORY[0x1E0C80D38], block);
}

void __71__BKUIPearlJindoEnrollViewController_animateToSuccessCompletionLayout___block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "presentable");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "revoke");

}

- (void)presentableDidAppearAsBanner:(id)a3
{
  id v4;

  if (-[BKUIPearlEnrollViewController isGlassesEnrollmentOnly](self, "isGlassesEnrollmentOnly", a3))
  {
    -[BKUIPearlEnrollViewController currentOperationHandler](self, "currentOperationHandler");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "matchUserForSecondPhaseEnrollmentWithCompletionAction:", 0);

  }
}

- (void)_postBannerToDestinationWithInitialStateCollapsed:(BOOL)a3
{
  -[BKUIPearlJindoEnrollViewController _postBannerToDestinationWithInitialStateCollapsed:enrollViewStateConfiguration:](self, "_postBannerToDestinationWithInitialStateCollapsed:enrollViewStateConfiguration:", a3, 0);
}

- (void)_postBannerToDestinationWithInitialStateCollapsed:(BOOL)a3 enrollViewStateConfiguration:(id)a4
{
  void (**v5)(_QWORD);
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  BKUIHostedJindoPresentable *v17;
  void *v18;
  BKUIHostedJindoPresentable *v19;
  void *v20;
  id v21;
  objc_class *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  BKUIHostedJindoPresentable *presentable;
  id v27;
  NSObject *v28;
  id v29;
  uint8_t buf[4];
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v5 = (void (**)(_QWORD))a4;
  -[BKUIPearlJindoEnrollViewController presentable](self, "presentable");
  v6 = objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = (void *)v6;
    -[BKUIPearlJindoEnrollViewController presentable](self, "presentable");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "activeLayoutMode");

    if (v9 != -1)
    {
      -[BKUIPearlJindoEnrollViewController presentable](self, "presentable");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "revoke");

    }
  }
  -[BKUIPearlEnrollViewController enrollView](self, "enrollView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "removeFromSuperview");

  -[BKUIPearlEnrollViewController enrollView](self, "enrollView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setAlpha:", 1.0);

  if (v5)
    v5[2](v5);
  v13 = (void *)MEMORY[0x1E0D01070];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "bundleIdentifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "bannerSourceForDestination:forRequesterIdentifier:", 0, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = [BKUIHostedJindoPresentable alloc];
  -[BKUIPearlEnrollViewController enrollView](self, "enrollView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = -[BKUIHostedJindoPresentable initWithCustomLayout:enrollView:destination:](v17, "initWithCustomLayout:enrollView:destination:", 2, v18, 0);
  -[BKUIPearlJindoEnrollViewController setPresentable:](self, "setPresentable:", v19);

  -[BKUIPearlJindoEnrollViewController presentable](self, "presentable");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setObservingDelegate:", self);

  v21 = objc_alloc(MEMORY[0x1E0C99E08]);
  v22 = (objc_class *)objc_opt_class();
  NSStringFromClass(v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = (void *)objc_msgSend(v21, "initWithObjectsAndKeys:", v23, CFSTR("Key"), 0);

  -[BKUIHostedJindoPresentable userInfoForPosting](self->_presentable, "userInfoForPosting");
  v25 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "addEntriesFromDictionary:", v25);

  presentable = self->_presentable;
  v29 = 0;
  LOBYTE(v25) = objc_msgSend(v16, "postPresentable:options:userInfo:error:", presentable, 1, v24, &v29);
  v27 = v29;
  if ((v25 & 1) == 0)
  {
    _BKUILoggingFacility();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v31 = v27;
      _os_log_impl(&dword_1DB281000, v28, OS_LOG_TYPE_DEFAULT, "Error attempting to post: %{public}@", buf, 0xCu);
    }

  }
}

- (void)_sceneWillDeactivate:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  int v13;
  int v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  _BKUILoggingFacility();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "description");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138412290;
    v15 = v6;
    _os_log_impl(&dword_1DB281000, v5, OS_LOG_TYPE_DEFAULT, "Scene will deactivate %@", (uint8_t *)&v14, 0xCu);

  }
  objc_msgSend(v4, "object");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[BKUIPearlJindoEnrollViewController view](self, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "window");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "windowScene");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7 != v10)
  {
    _BKUILoggingFacility();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v14) = 0;
      _os_log_impl(&dword_1DB281000, v11, OS_LOG_TYPE_DEFAULT, "Scene will deactivate early exit due to non matching windowScene", (uint8_t *)&v14, 2u);
    }
    goto LABEL_9;
  }
  -[BKUIPearlEnrollViewController enrollView](self, "enrollView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "isTransitioningToState");

  if (!v13)
  {
    -[BKUIPearlJindoEnrollViewController presentable](self, "presentable");
    v11 = objc_claimAutoreleasedReturnValue();
    -[NSObject revoke](v11, "revoke");
LABEL_9:

    goto LABEL_10;
  }
  -[BKUIPearlJindoEnrollViewController setJindoNeedsResignActiveRevoke:](self, "setJindoNeedsResignActiveRevoke:", 1);
LABEL_10:

}

- (void)_sceneDidActivate:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  int v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  _BKUILoggingFacility();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "description");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138412290;
    v13 = v6;
    _os_log_impl(&dword_1DB281000, v5, OS_LOG_TYPE_DEFAULT, "Scene did activate %@", (uint8_t *)&v12, 0xCu);

  }
  objc_msgSend(v4, "object");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[BKUIPearlJindoEnrollViewController view](self, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "window");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "windowScene");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7 == v10)
  {
    -[BKUIPearlJindoEnrollViewController didBecomeActive:](self, "didBecomeActive:", v4);
  }
  else
  {
    _BKUILoggingFacility();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v12) = 0;
      _os_log_impl(&dword_1DB281000, v11, OS_LOG_TYPE_DEFAULT, "Scene did activate, early exit due to non matching windowScene", (uint8_t *)&v12, 2u);
    }

  }
}

- (void)_setupUI
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  BKUIPearlMovieLoopView *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  BKUIPearlMovieLoopView *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
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
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  double v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  BKUIButtonTray *v51;
  void *v52;
  BKUIButtonTray *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  double v61;
  double v62;
  void *v63;
  double v64;
  double v65;
  BKUIButtonTray *v66;
  BKUIButtonTray *v67;
  BKUIJindoBottomContainer *v68;
  _BOOL8 v69;
  BKUIJindoContainerScrollview *v70;
  BKUIJindoContainerScrollview *v71;
  BKUIJindoBottomContainer *v72;
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
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  double v109;
  double v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  void *v127;
  void *v128;
  void *v129;
  BKUIButtonTray *v130;
  void *v131;
  void *v132;
  BKUIButtonTray *v133;
  BKUIPearlMovieLoopView *v134;
  void *v135;
  void *v136;
  void *v137;
  void *v138;
  _QWORD v139[5];
  _QWORD v140[4];
  _QWORD v141[3];
  _QWORD v142[6];

  v142[4] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "URLForResource:withExtension:", CFSTR("Enrollment-rings-alpha~iphone"), CFSTR("mov"));
  v4 = objc_claimAutoreleasedReturnValue();

  v138 = (void *)v4;
  objc_msgSend(MEMORY[0x1E0C8B3C0], "assetWithURL:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "loadValuesAsynchronouslyForKeys:completionHandler:", &unk_1EA298950, 0);
  objc_msgSend(MEMORY[0x1E0C89AE8], "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setCategory:withOptions:error:", *MEMORY[0x1E0C89660], 1, 0);

  objc_msgSend(MEMORY[0x1E0C8B300], "playerItemWithAsset:", v5);
  v136 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C8B2E8]), "initWithPlayerItem:", v136);
  objc_msgSend(v7, "setMuted:", 1);
  objc_msgSend(v7, "setAllowsExternalPlayback:", 0);
  -[BKUIPearlJindoEnrollViewController view](self, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "bounds");
  v10 = v9;
  -[BKUIPearlJindoEnrollViewController view](self, "view");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "bounds");
  v13 = v12;

  v14 = [BKUIPearlMovieLoopView alloc];
  v15 = *MEMORY[0x1E0C9D648];
  v16 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v17 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v18 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  v137 = v5;
  v19 = -[BKUIPearlMovieLoopView initWithFrame:player:asset:](v14, "initWithFrame:player:asset:", v7, v5, *MEMORY[0x1E0C9D648], v16, v17, v18);
  -[BKUIPearlMovieLoopView setTranslatesAutoresizingMaskIntoConstraints:](v19, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v135 = v7;
  objc_msgSend(v7, "play");
  v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEABB0]), "initWithFrame:", v15, v16, v17, v18);
  -[BKUIPearlJindoEnrollViewController setHostedTutorialMicaView:](self, "setHostedTutorialMicaView:", v20);

  -[BKUIPearlJindoEnrollViewController hostedTutorialMicaView](self, "hostedTutorialMicaView");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "addSubview:", v19);

  v119 = (void *)MEMORY[0x1E0CB3718];
  -[BKUIPearlMovieLoopView widthAnchor](v19, "widthAnchor");
  v131 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v131, "constraintEqualToConstant:", v10 + -52.0);
  v128 = (void *)objc_claimAutoreleasedReturnValue();
  v142[0] = v128;
  -[BKUIPearlMovieLoopView heightAnchor](v19, "heightAnchor");
  v125 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v125, "constraintEqualToConstant:", v13 + -52.0);
  v122 = (void *)objc_claimAutoreleasedReturnValue();
  v142[1] = v122;
  -[BKUIPearlMovieLoopView bottomAnchor](v19, "bottomAnchor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[BKUIPearlJindoEnrollViewController hostedTutorialMicaView](self, "hostedTutorialMicaView");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "bottomAnchor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "constraintEqualToAnchor:", v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v142[2] = v25;
  v134 = v19;
  -[BKUIPearlMovieLoopView centerXAnchor](v19, "centerXAnchor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[BKUIPearlJindoEnrollViewController hostedTutorialMicaView](self, "hostedTutorialMicaView");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "centerXAnchor");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "constraintEqualToAnchor:", v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v142[3] = v29;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v142, 4);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v119, "activateConstraints:", v30);

  -[BKUIPearlJindoEnrollViewController hostedTutorialMicaView](self, "hostedTutorialMicaView");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[BKUIPearlJindoEnrollViewController view](self, "view");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[BKUIPearlJindoEnrollViewController hostedTutorialMicaView](self, "hostedTutorialMicaView");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "addSubview:", v33);

  v117 = (void *)MEMORY[0x1E0CB3718];
  -[BKUIPearlJindoEnrollViewController hostedTutorialMicaView](self, "hostedTutorialMicaView");
  v132 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v132, "topAnchor");
  v126 = (void *)objc_claimAutoreleasedReturnValue();
  -[BKUIPearlJindoEnrollViewController view](self, "view");
  v129 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v129, "topAnchor");
  v123 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v126, "constraintEqualToAnchor:", v123);
  v120 = (void *)objc_claimAutoreleasedReturnValue();
  v141[0] = v120;
  -[BKUIPearlJindoEnrollViewController hostedTutorialMicaView](self, "hostedTutorialMicaView");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "heightAnchor");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  -[BKUIPearlJindoEnrollViewController view](self, "view");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "bounds");
  objc_msgSend(v35, "constraintEqualToConstant:", v37 + 26.0);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v141[1] = v38;
  -[BKUIPearlJindoEnrollViewController hostedTutorialMicaView](self, "hostedTutorialMicaView");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "widthAnchor");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  -[BKUIPearlJindoEnrollViewController view](self, "view");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "bounds");
  objc_msgSend(v40, "constraintEqualToConstant:", v42);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v141[2] = v43;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v141, 3);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v117, "activateConstraints:", v44);

  -[BKUIPearlJindoEnrollViewController hostedTutorialMicaView](self, "hostedTutorialMicaView");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "centerXAnchor");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  -[BKUIPearlJindoEnrollViewController view](self, "view");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "centerXAnchor");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "constraintEqualToAnchor:", v48);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  -[BKUIPearlJindoEnrollViewController setHostedTutorialMicaViewCenterConstraint:](self, "setHostedTutorialMicaViewCenterConstraint:", v49);

  -[BKUIPearlJindoEnrollViewController hostedTutorialMicaViewCenterConstraint](self, "hostedTutorialMicaViewCenterConstraint");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "setActive:", 1);

  -[BKUIPearlJindoEnrollViewController _prepEnrollViewAndEnrollTutorialMica](self, "_prepEnrollViewAndEnrollTutorialMica");
  v51 = [BKUIButtonTray alloc];
  -[BKUIPearlJindoEnrollViewController view](self, "view");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "bounds");
  v53 = -[BKUIButtonTray initWithFrame:](v51, "initWithFrame:");
  -[BKUIPearlEnrollViewController setButtonTray:](self, "setButtonTray:", v53);

  -[BKUIPearlJindoEnrollViewController buttonTray](self, "buttonTray");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "bottomLinkButton");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  -[BKUIPearlEnrollViewController setEscapeHatchButton:](self, "setEscapeHatchButton:", v55);

  -[BKUIPearlJindoEnrollViewController buttonTray](self, "buttonTray");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "nextStateButton");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  -[BKUIPearlEnrollViewController setNextStateButton:](self, "setNextStateButton:", v57);

  -[BKUIPearlJindoEnrollViewController buttonTray](self, "buttonTray");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "nextStateButtonContainer");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  -[BKUIPearlEnrollViewController setNextStateButtonContainer:](self, "setNextStateButtonContainer:", v59);

  -[BKUIPearlJindoEnrollViewController view](self, "view");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "frame");
  v62 = v61;
  -[BKUIPearlJindoEnrollViewController view](self, "view");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "bounds");
  v65 = v64;

  v66 = -[BKUIButtonTray initWithFrame:willUseActionDelegate:]([BKUIButtonTray alloc], "initWithFrame:willUseActionDelegate:", 1, 0.0, 0.0, v62, v65);
  v67 = -[BKUIButtonTray initWithFrame:willUseActionDelegate:]([BKUIButtonTray alloc], "initWithFrame:willUseActionDelegate:", 1, 0.0, 0.0, v62, v65);
  v68 = [BKUIJindoBottomContainer alloc];
  v69 = -[BKUIPearlEnrollViewController inBuddy](self, "inBuddy");
  v133 = v66;
  v70 = -[BKUIJindoContainerScrollview initWithFrame:buttonTray:]([BKUIJindoContainerScrollview alloc], "initWithFrame:buttonTray:", v66, 0.0, 0.0, v62, v65);
  v130 = v67;
  v71 = -[BKUIJindoContainerScrollview initWithFrame:buttonTray:]([BKUIJindoContainerScrollview alloc], "initWithFrame:buttonTray:", v67, 0.0, 0.0, v62, v65);
  v72 = -[BKUIPearlEnrollViewBottomContainer initWithFrame:inBuddy:scrollView:overlapScrollView:delegate:squareNeedsPositionLayout:](v68, "initWithFrame:inBuddy:scrollView:overlapScrollView:delegate:squareNeedsPositionLayout:", v69, v70, v71, self, 1, 0.0, 0.0, v62, v65);
  -[BKUIPearlEnrollViewController setBottomContainer:](self, "setBottomContainer:", v72);

  -[BKUIPearlJindoEnrollViewController buttonTray](self, "buttonTray");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v73, "topLinkButton");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  -[BKUIPearlEnrollViewController setRetryMatchOperationButton:](self, "setRetryMatchOperationButton:", v74);

  -[BKUIPearlJindoEnrollViewController retryMatchOperationButton](self, "retryMatchOperationButton");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v75, "titleLabel");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v76, "setAdjustsFontSizeToFitWidth:", 1);

  -[BKUIPearlJindoEnrollViewController retryMatchOperationButton](self, "retryMatchOperationButton");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v77, "addTarget:action:forControlEvents:", self, sel_retryPressed, 64);

  -[BKUIPearlJindoEnrollViewController nextStateButton](self, "nextStateButton");
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v78, "addTarget:action:forControlEvents:", self, sel_nextStateButtonPressed_, 0x2000);

  -[BKUIPearlJindoEnrollViewController escapeHatchButton](self, "escapeHatchButton");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v79, "addTarget:action:forControlEvents:", self, sel_escapeHatchButtonPressed, 0x2000);

  -[BKUIPearlJindoEnrollViewController buttonTray](self, "buttonTray");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v80, "bottomLinkButton");
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  -[BKUIPearlEnrollViewController setEscapeHatchButton:](self, "setEscapeHatchButton:", v81);

  -[BKUIPearlEnrollViewController bottomContainer](self, "bottomContainer");
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v82, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[BKUIPearlJindoEnrollViewController view](self, "view");
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  -[BKUIPearlEnrollViewController bottomContainer](self, "bottomContainer");
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v83, "addSubview:", v84);

  -[BKUIPearlEnrollViewController bottomContainer](self, "bottomContainer");
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v85, "topAnchor");
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  -[BKUIPearlJindoEnrollViewController view](self, "view");
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v87, "topAnchor");
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v86, "constraintEqualToAnchor:", v88);
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  -[BKUIPearlJindoEnrollViewController setBottomContainerTopConstraint:](self, "setBottomContainerTopConstraint:", v89);

  v113 = (void *)MEMORY[0x1E0CB3718];
  -[BKUIPearlJindoEnrollViewController bottomContainerTopConstraint](self, "bottomContainerTopConstraint");
  v127 = (void *)objc_claimAutoreleasedReturnValue();
  v140[0] = v127;
  -[BKUIPearlEnrollViewController bottomContainer](self, "bottomContainer");
  v124 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v124, "bottomAnchor");
  v118 = (void *)objc_claimAutoreleasedReturnValue();
  -[BKUIPearlJindoEnrollViewController view](self, "view");
  v121 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v121, "bottomAnchor");
  v116 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v118, "constraintEqualToAnchor:", v116);
  v115 = (void *)objc_claimAutoreleasedReturnValue();
  v140[1] = v115;
  -[BKUIPearlEnrollViewController bottomContainer](self, "bottomContainer");
  v114 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v114, "leadingAnchor");
  v112 = (void *)objc_claimAutoreleasedReturnValue();
  -[BKUIPearlJindoEnrollViewController view](self, "view");
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v90, "leadingAnchor");
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v112, "constraintEqualToAnchor:", v91);
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  v140[2] = v92;
  -[BKUIPearlEnrollViewController bottomContainer](self, "bottomContainer");
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v93, "trailingAnchor");
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  -[BKUIPearlJindoEnrollViewController view](self, "view");
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v95, "trailingAnchor");
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v94, "constraintEqualToAnchor:", v96);
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  v140[3] = v97;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v140, 4);
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v113, "activateConstraints:", v98);

  -[BKUIPearlEnrollViewController bottomContainer](self, "bottomContainer");
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v99, "setupInitialUI");

  -[BKUIPearlEnrollViewController _updateLeftBarButtonItem](self, "_updateLeftBarButtonItem");
  -[BKUIPearlJindoEnrollViewController view](self, "view");
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA478], "systemBackgroundColor");
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v100, "setBackgroundColor:", v101);

  -[BKUIPearlJindoEnrollViewController view](self, "view");
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v102, "superview");
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA478], "systemBackgroundColor");
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v103, "setBackgroundColor:", v104);

  -[BKUIPearlEnrollViewController instructionView](self, "instructionView");
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v105, "setDarkMode:", -[BKUIPearlJindoEnrollViewController _isDarkMode](self, "_isDarkMode"));

  -[BKUIPearlJindoEnrollViewController setNeedsStatusBarAppearanceUpdate](self, "setNeedsStatusBarAppearanceUpdate");
  -[BKUIPearlJindoEnrollViewController buttonTray](self, "buttonTray");
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v106, "updateButtonLayout");

  -[BKUIPearlEnrollViewController enrollView](self, "enrollView");
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v107, "setTransitionDelegate:", self);

  if (-[BKUIPearlEnrollViewController isGlassesEnrollmentOnly](self, "isGlassesEnrollmentOnly"))
  {
    v139[0] = MEMORY[0x1E0C809B0];
    v139[1] = 3221225472;
    v139[2] = __46__BKUIPearlJindoEnrollViewController__setupUI__block_invoke;
    v139[3] = &unk_1EA27FB98;
    v139[4] = self;
    -[BKUIPearlJindoEnrollViewController _postBannerToDestinationWithInitialStateCollapsed:enrollViewStateConfiguration:](self, "_postBannerToDestinationWithInitialStateCollapsed:enrollViewStateConfiguration:", 0, v139);
  }
  -[BKUIPearlJindoEnrollViewController view](self, "view");
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v108, "bounds");
  v110 = v109 + 26.0 + 40.0;
  -[BKUIPearlJindoEnrollViewController bottomContainerTopConstraint](self, "bottomContainerTopConstraint");
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v111, "setConstant:", v110);

}

void __46__BKUIPearlJindoEnrollViewController__setupUI__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v5[4];
  id v6;
  id location;

  objc_msgSend(*(id *)(a1 + 32), "hostedTutorialMicaView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAlpha:", 0.0);

  objc_msgSend(*(id *)(a1 + 32), "enrollView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setPillsHidden:", 1);

  objc_msgSend(*(id *)(a1 + 32), "setState:animated:", 2, 0);
  objc_initWeak(&location, *(id *)(a1 + 32));
  v4 = *(void **)(a1 + 32);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __46__BKUIPearlJindoEnrollViewController__setupUI__block_invoke_2;
  v5[3] = &unk_1EA27FB70;
  objc_copyWeak(&v6, &location);
  objc_msgSend(v4, "_setState:animated:completion:", 3, 0, v5);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __46__BKUIPearlJindoEnrollViewController__setupUI__block_invoke_2(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "enrollView");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setNeedsLayout");

}

- (void)prepareBottomContainerForAnimationToState:(int)a3 fromState:(int)a4 subState:(int)a5 advancing:(BOOL)a6
{
  _BOOL8 v6;
  uint64_t v7;
  uint64_t v8;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  objc_super v14;

  v6 = a6;
  v7 = *(_QWORD *)&a5;
  v8 = *(_QWORD *)&a3;
  if (a4 == 2)
  {
    -[BKUIPearlJindoEnrollViewController hostedTutorialMicaViewCenterConstraint](self, "hostedTutorialMicaViewCenterConstraint");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setActive:", 0);

    -[BKUIPearlEnrollViewController bottomContainer](self, "bottomContainer");
    v13 = (id)objc_claimAutoreleasedReturnValue();
    -[BKUIPearlJindoEnrollViewController hostedTutorialMicaView](self, "hostedTutorialMicaView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[BKUIPearlJindoEnrollViewController view](self, "view");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "prepareForAnimationToState:fromState:subState:advancing:tagAlong:parentView:", v8, 2, v7, v6, v11, v12);

  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)BKUIPearlJindoEnrollViewController;
    -[BKUIPearlEnrollViewController prepareBottomContainerForAnimationToState:fromState:subState:advancing:](&v14, sel_prepareBottomContainerForAnimationToState_fromState_subState_advancing_, *(_QWORD *)&a3, *(_QWORD *)&a4, *(_QWORD *)&a5, a6);
  }
}

- (void)willResignActive:(id)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)BKUIPearlJindoEnrollViewController;
  -[BKUIPearlEnrollViewController willResignActive:](&v5, sel_willResignActive_, a3);
  -[BKUIPearlJindoEnrollViewController presentable](self, "presentable");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "revoke");

}

- (void)didBecomeActive:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)BKUIPearlJindoEnrollViewController;
  -[BKUIPearlEnrollViewController didBecomeActive:](&v11, sel_didBecomeActive_, a3);
  -[BKUIPearlJindoEnrollViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "window");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[BKUIPearlJindoEnrollViewController parentViewController](self, "parentViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "childViewControllers");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "filteredArrayUsingPredicate:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "count");

    if (!v10
      && -[BKUIPearlEnrollViewController state](self, "state") != 10
      && -[BKUIPearlEnrollViewController state](self, "state") != 2)
    {
      -[BKUIPearlJindoEnrollViewController _postBannerToDestinationWithInitialStateCollapsed:](self, "_postBannerToDestinationWithInitialStateCollapsed:", 0);
    }
  }
}

uint64_t __54__BKUIPearlJindoEnrollViewController_didBecomeActive___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (void)nextStateButtonPressed:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  dispatch_time_t v12;
  objc_super v13;
  _QWORD block[5];
  uint8_t buf[16];

  v4 = a3;
  -[BKUIPearlJindoEnrollViewController nextStateButton](self, "nextStateButton");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setEnabled:", 0);

  if (!-[BKUIPearlEnrollViewController isGlassesEnrollmentOnly](self, "isGlassesEnrollmentOnly")
    && -[BKUIPearlEnrollViewController state](self, "state") == 2)
  {
    if (-[BKUIPearlEnrollViewController state](self, "state") == 2)
    {
      _BKUILoggingFacility();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1DB281000, v6, OS_LOG_TYPE_DEFAULT, "Next state button pressed, startEnroll...", buf, 2u);
      }

      -[BKUIPearlEnrollViewController currentOperationHandler](self, "currentOperationHandler");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v7, "supportsPeriocularEnrollment") & 1) != 0)
      {
        -[BKUIPearlEnrollViewController currentOperationHandler](self, "currentOperationHandler");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v8, "isEnrollmentAugmentationOnly");

        if ((v9 & 1) != 0)
        {
          -[BKUIPearlEnrollViewController currentOperationHandler](self, "currentOperationHandler");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "matchUserForSecondPhaseEnrollmentWithCompletionAction:", 0);

          goto LABEL_12;
        }
      }
      else
      {

      }
      -[BKUIPearlEnrollViewController startEnroll](self, "startEnroll");
    }
LABEL_12:
    v12 = dispatch_time(0, 400000000);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __61__BKUIPearlJindoEnrollViewController_nextStateButtonPressed___block_invoke;
    block[3] = &unk_1EA27FB98;
    block[4] = self;
    dispatch_after(v12, MEMORY[0x1E0C80D38], block);
    goto LABEL_13;
  }
  v13.receiver = self;
  v13.super_class = (Class)BKUIPearlJindoEnrollViewController;
  -[BKUIPearlEnrollViewController nextStateButtonPressed:](&v13, sel_nextStateButtonPressed_, v4);
  -[BKUIPearlJindoEnrollViewController nextStateButton](self, "nextStateButton");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setEnabled:", 1);

LABEL_13:
}

uint64_t __61__BKUIPearlJindoEnrollViewController_nextStateButtonPressed___block_invoke(uint64_t a1)
{
  void *v1;
  _QWORD v3[5];

  v1 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __61__BKUIPearlJindoEnrollViewController_nextStateButtonPressed___block_invoke_2;
  v3[3] = &unk_1EA27FB98;
  v3[4] = v1;
  return objc_msgSend(v1, "_postBannerToDestinationWithInitialStateCollapsed:enrollViewStateConfiguration:", 0, v3);
}

void __61__BKUIPearlJindoEnrollViewController_nextStateButtonPressed___block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "hostedTutorialMicaView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAlpha:", 0.0);

  objc_msgSend(*(id *)(a1 + 32), "nextStateButton");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setEnabled:", 1);

}

- (BOOL)_isDarkMode
{
  void *v2;
  BOOL v3;

  -[BKUIPearlJindoEnrollViewController traitCollection](self, "traitCollection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "userInterfaceStyle") == 2;

  return v3;
}

- (CGSize)_fullEnrollViewSize
{
  void *v3;
  int v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGSize result;

  +[BKUIDevice sharedInstance](BKUIDevice, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isZoomEnabled");

  -[BKUIPearlJindoEnrollViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bounds");
  v7 = v6;
  -[BKUIPearlJindoEnrollViewController view](self, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "bounds");
  v10 = v9;

  v11 = 30.0;
  if (!v4)
    v11 = -15.0;
  v12 = v7 + v11;
  v13 = v10 + v11;
  result.height = v13;
  result.width = v12;
  return result;
}

- (void)_handleEnrollStateOnAppear
{
  void *v3;
  void *v4;
  _QWORD v5[4];
  id v6;
  id location;
  objc_super v8;

  if (!-[BKUIPearlEnrollViewController isGlassesEnrollmentOnly](self, "isGlassesEnrollmentOnly"))
  {
    v8.receiver = self;
    v8.super_class = (Class)BKUIPearlJindoEnrollViewController;
    -[BKUIPearlEnrollViewController _handleEnrollStateOnAppear](&v8, sel__handleEnrollStateOnAppear);
    -[BKUIPearlEnrollViewController enrollView](self, "enrollView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setAlpha:", 0.0);

    objc_initWeak(&location, self);
    -[BKUIPearlEnrollViewController enrollView](self, "enrollView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __64__BKUIPearlJindoEnrollViewController__handleEnrollStateOnAppear__block_invoke;
    v5[3] = &unk_1EA27FB70;
    objc_copyWeak(&v6, &location);
    objc_msgSend(v4, "setState:completion:", 3, v5);

    objc_destroyWeak(&v6);
    objc_destroyWeak(&location);
  }
}

void __64__BKUIPearlJindoEnrollViewController__handleEnrollStateOnAppear__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "enrollView");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setNeedsLayout");

  objc_msgSend(WeakRetained, "enrollView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "layoutIfNeeded");

}

- (void)_prepEnrollViewAndEnrollTutorialMica
{
  BKUIJindoPositioningGuideView *v3;
  BKUIPearlEnrollView *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  BKUIPearlEnrollView *v11;
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
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  BKUIJindoPositioningGuideView *v28;
  _QWORD v29[4];
  id v30;
  id location;
  _QWORD v32[3];

  v32[2] = *MEMORY[0x1E0C80C00];
  v3 = [BKUIJindoPositioningGuideView alloc];
  v28 = -[BKUIPearlPositioningGuideView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v4 = [BKUIPearlEnrollView alloc];
  -[BKUIPearlJindoEnrollViewController _fullEnrollViewSize](self, "_fullEnrollViewSize");
  v6 = v5;
  -[BKUIPearlJindoEnrollViewController _fullEnrollViewSize](self, "_fullEnrollViewSize");
  v8 = v7;
  -[BKUIPearlEnrollViewController preloadedState](self, "preloadedState");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "acquireCachedVideoCaptureSession");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[BKUIPearlEnrollView initWithFrame:videoCaptureSession:inSheet:positioningGuideView:squareNeedsPositionLayout:](v4, "initWithFrame:videoCaptureSession:inSheet:positioningGuideView:squareNeedsPositionLayout:", v10, -[BKUIPearlEnrollViewController inSheet](self, "inSheet"), v28, 1, 0.0, 0.0, v6, v8);
  -[BKUIPearlEnrollViewController setEnrollView:](self, "setEnrollView:", v11);

  -[BKUIPearlEnrollViewController enrollView](self, "enrollView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v27 = (void *)MEMORY[0x1E0CB3718];
  -[BKUIPearlEnrollViewController enrollView](self, "enrollView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "widthAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[BKUIPearlJindoEnrollViewController _fullEnrollViewSize](self, "_fullEnrollViewSize");
  objc_msgSend(v14, "constraintEqualToConstant:");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v32[0] = v15;
  -[BKUIPearlEnrollViewController enrollView](self, "enrollView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "heightAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[BKUIPearlEnrollViewController enrollView](self, "enrollView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "widthAnchor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "constraintEqualToAnchor:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v32[1] = v20;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v32, 2);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "activateConstraints:", v21);

  -[BKUIPearlEnrollViewController enrollView](self, "enrollView");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "preEnrollActivate");

  if (!-[BKUIPearlEnrollViewController isGlassesEnrollmentOnly](self, "isGlassesEnrollmentOnly"))
  {
    -[BKUIPearlJindoEnrollViewController hostedTutorialMicaView](self, "hostedTutorialMicaView");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[BKUIPearlEnrollViewController enrollView](self, "enrollView");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "addSubview:", v24);

    -[BKUIPearlEnrollViewController enrollView](self, "enrollView");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setAlpha:", 0.0);

    objc_initWeak(&location, self);
    -[BKUIPearlEnrollViewController enrollView](self, "enrollView");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v29[0] = MEMORY[0x1E0C809B0];
    v29[1] = 3221225472;
    v29[2] = __74__BKUIPearlJindoEnrollViewController__prepEnrollViewAndEnrollTutorialMica__block_invoke;
    v29[3] = &unk_1EA27FB70;
    objc_copyWeak(&v30, &location);
    objc_msgSend(v26, "setState:completion:", 2, v29);

    objc_destroyWeak(&v30);
    objc_destroyWeak(&location);
  }

}

void __74__BKUIPearlJindoEnrollViewController__prepEnrollViewAndEnrollTutorialMica__block_invoke(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  void *v3;
  _QWORD v4[4];
  id v5;

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "enrollView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __74__BKUIPearlJindoEnrollViewController__prepEnrollViewAndEnrollTutorialMica__block_invoke_2;
  v4[3] = &unk_1EA27FB70;
  objc_copyWeak(&v5, v1);
  objc_msgSend(v3, "setState:completion:", 3, v4);

  objc_destroyWeak(&v5);
}

void __74__BKUIPearlJindoEnrollViewController__prepEnrollViewAndEnrollTutorialMica__block_invoke_2(uint64_t a1)
{
  void *v1;
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "enrollView");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setNeedsLayout");

  objc_msgSend(WeakRetained, "enrollView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "layoutIfNeeded");

}

- (void)stateTransitionDidComplete
{
  id v3;

  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  if (-[BKUIPearlJindoEnrollViewController jindoNeedsResignActiveRevoke](self, "jindoNeedsResignActiveRevoke"))
  {
    -[BKUIPearlJindoEnrollViewController setJindoNeedsResignActiveRevoke:](self, "setJindoNeedsResignActiveRevoke:", 0);
    -[BKUIPearlJindoEnrollViewController presentable](self, "presentable");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "revoke");

  }
}

- (id)escapeHatchButton:(id)a3 state:(int)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  uint64_t v14;
  void *v15;

  v4 = *(_QWORD *)&a4;
  v6 = a3;
  v7 = (void *)objc_opt_class();
  -[BKUIPearlEnrollViewController currentOperationHandler](self, "currentOperationHandler");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "poseStatus");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v7, "_shouldShowAccessibilityOptionForState:poseStatus:", v4, v9) & 1) == 0)
  {

    goto LABEL_5;
  }
  -[BKUIPearlEnrollViewController currentOperationHandler](self, "currentOperationHandler");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "bioKitCompletionPercentage");
  v12 = v11;

  if (v12 < 1.0)
  {
LABEL_5:
    objc_msgSend(v6, "buttonTray");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "bottomLinkButton");
    v14 = objc_claimAutoreleasedReturnValue();
    goto LABEL_6;
  }
  objc_msgSend(v6, "buttonTray");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "topLinkButton");
  v14 = objc_claimAutoreleasedReturnValue();
LABEL_6:
  v15 = (void *)v14;

  return v15;
}

- (void)prepareForAnimationToState:(int)a3 fromState:(int)a4 subState:(int)a5 advancing:(BOOL)a6
{
  uint64_t v6;
  void *v8;
  void *v9;
  _BOOL4 v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  objc_super v19;

  v6 = *(_QWORD *)&a3;
  v19.receiver = self;
  v19.super_class = (Class)BKUIPearlJindoEnrollViewController;
  -[BKUIPearlEnrollViewController prepareForAnimationToState:fromState:subState:advancing:](&v19, sel_prepareForAnimationToState_fromState_subState_advancing_, *(_QWORD *)&a3, *(_QWORD *)&a4, *(_QWORD *)&a5, a6);
  -[BKUIPearlJindoEnrollViewController startOverButtonForState:](self, "startOverButtonForState:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[BKUIPearlJindoEnrollViewController _startOverTitleForState:](self, "_startOverTitleForState:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTitle:forState:", v9, 0);

  v10 = -[BKUIPearlEnrollViewController inBuddy](self, "inBuddy");
  if ((v6 - 3) <= 1 && v10)
  {
    -[BKUIPearlJindoEnrollViewController buttonTray](self, "buttonTray");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "topLinkButton");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("SET_UP_LATER_IN_SETTINGS"), &stru_1EA281248, CFSTR("Pearl-periocular"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setTitle:forState:", v14, 0);

  }
  -[BKUIPearlEnrollViewController bottomContainer](self, "bottomContainer");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[BKUIPearlEnrollViewController bottomContainer](self, "bottomContainer");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "onScreenScrollview");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "bringSubviewToFront:", v17);

  -[BKUIPearlEnrollViewController bottomContainer](self, "bottomContainer");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "updateButtonVisibility");

}

- (id)_startOverTitleForState:(int)a3
{
  uint64_t v3;
  unsigned int v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;

  v3 = *(_QWORD *)&a3;
  v4 = (a3 > 0xA) | (0x2BFu >> a3);
  -[BKUIPearlJindoEnrollViewController _jindoBottomContainer](self, "_jindoBottomContainer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "showStartOverForState:", v3);

  v7 = 0;
  if ((v4 & 1) != 0 && v6)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("START_OVER"), &stru_1EA281248, CFSTR("Pearl-periocular"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v7;
}

- (id)nextStateButton
{
  void *v2;
  void *v3;

  -[BKUIPearlEnrollViewController bottomContainer](self, "bottomContainer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "nextStateButton");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)escapeHatchButton
{
  unsigned int v3;
  void *v4;
  void *v5;

  v3 = -[BKUIPearlEnrollViewController state](self, "state");
  if (v3 > 0xA)
  {
    v5 = 0;
  }
  else
  {
    if (((1 << v3) & 0x747) != 0)
    {
      -[BKUIPearlJindoEnrollViewController buttonTray](self, "buttonTray");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "bottomLinkButton");
    }
    else
    {
      -[BKUIPearlJindoEnrollViewController buttonTray](self, "buttonTray");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "topLinkButton");
    }
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

- (id)buttonTray
{
  void *v2;
  void *v3;

  -[BKUIPearlEnrollViewController bottomContainer](self, "bottomContainer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "buttonTray");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)nextStateButtonContainer
{
  void *v2;
  void *v3;

  -[BKUIPearlJindoEnrollViewController buttonTray](self, "buttonTray");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "nextStateButtonContainer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)retryMatchOperationButton
{
  void *v2;
  void *v3;

  -[BKUIPearlJindoEnrollViewController buttonTray](self, "buttonTray");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "topLinkButton");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)startOverButtonForState:(int)a3
{
  uint64_t v3;
  void *v5;
  void *v6;
  void *v7;

  v3 = *(_QWORD *)&a3;
  -[BKUIPearlJindoEnrollViewController _jindoBottomContainer](self, "_jindoBottomContainer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v3) = objc_msgSend(v5, "showStartOverForState:", v3);

  if ((_DWORD)v3)
  {
    -[BKUIPearlJindoEnrollViewController buttonTray](self, "buttonTray");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "bottomLinkButton");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (void)presentViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  void *v10;
  objc_super v11;

  v6 = a4;
  v8 = a3;
  v9 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v8, "setAlertListener:", self);
    -[BKUIPearlJindoEnrollViewController presentable](self, "presentable");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "revoke");

  }
  v11.receiver = self;
  v11.super_class = (Class)BKUIPearlJindoEnrollViewController;
  -[BKUIPearlJindoEnrollViewController presentViewController:animated:completion:](&v11, sel_presentViewController_animated_completion_, v8, v6, v9);

}

- (void)alertActionTappedFromAlert
{
  if (-[BKUIPearlEnrollViewController state](self, "state") != 10)
    -[BKUIPearlJindoEnrollViewController _postBannerToDestinationWithInitialStateCollapsed:](self, "_postBannerToDestinationWithInitialStateCollapsed:", 0);
}

- (void)didChangeActiveLayoutMode:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  BOOL v11;
  void *v12;
  NSObject *v13;
  int v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[BKUIPearlJindoEnrollViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "window");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "windowScene");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    -[BKUIPearlJindoEnrollViewController view](self, "view");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "window");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "windowScene");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "activationState") == 0;

  }
  else
  {
    v11 = 0;
  }

  if (objc_msgSend(v4, "activeLayoutMode") >= 2 && !v11)
  {
    -[BKUIPearlJindoEnrollViewController presentable](self, "presentable");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "revoke");

    _BKUILoggingFacility();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v14 = 138412290;
      v15 = v4;
      _os_log_impl(&dword_1DB281000, v13, OS_LOG_TYPE_DEFAULT, "Element did clean up and auto-revoke %@", (uint8_t *)&v14, 0xCu);
    }

  }
}

- (BKUIHostedJindoPresentable)presentable
{
  return self->_presentable;
}

- (void)setPresentable:(id)a3
{
  objc_storeStrong((id *)&self->_presentable, a3);
}

- (NSLayoutConstraint)bottomContainerTopConstraint
{
  return self->_bottomContainerTopConstraint;
}

- (void)setBottomContainerTopConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_bottomContainerTopConstraint, a3);
}

- (UIView)hostedTutorialMicaView
{
  return self->_hostedTutorialMicaView;
}

- (void)setHostedTutorialMicaView:(id)a3
{
  objc_storeStrong((id *)&self->_hostedTutorialMicaView, a3);
}

- (NSLayoutConstraint)hostedTutorialMicaViewCenterConstraint
{
  return self->_hostedTutorialMicaViewCenterConstraint;
}

- (void)setHostedTutorialMicaViewCenterConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_hostedTutorialMicaViewCenterConstraint, a3);
}

- (BOOL)jindoNeedsResignActiveRevoke
{
  return self->_jindoNeedsResignActiveRevoke;
}

- (void)setJindoNeedsResignActiveRevoke:(BOOL)a3
{
  self->_jindoNeedsResignActiveRevoke = a3;
}

- (UITraitChangeRegistration)traitChangeRegistration
{
  return self->_traitChangeRegistration;
}

- (void)setTraitChangeRegistration:(id)a3
{
  objc_storeStrong((id *)&self->_traitChangeRegistration, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_traitChangeRegistration, 0);
  objc_storeStrong((id *)&self->_hostedTutorialMicaViewCenterConstraint, 0);
  objc_storeStrong((id *)&self->_hostedTutorialMicaView, 0);
  objc_storeStrong((id *)&self->_bottomContainerTopConstraint, 0);
  objc_storeStrong((id *)&self->_presentable, 0);
}

@end
