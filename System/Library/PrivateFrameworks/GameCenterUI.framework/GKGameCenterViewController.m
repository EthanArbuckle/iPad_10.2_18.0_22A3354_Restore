@implementation GKGameCenterViewController

- (GKGameCenterViewController)init
{
  GKGameCenterViewController *v2;
  GKGameCenterViewController *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)GKGameCenterViewController;
  v2 = -[GKGameCenterViewController init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_viewState = -1;
    v2->_leaderboardTimeScope = 2;
    v2->_leaderboardPlayerScope = 1;
    -[GKGameCenterViewController _commonInit](v2, "_commonInit");
  }
  return v3;
}

- (GKGameCenterViewController)initWithState:(GKGameCenterViewControllerState)state
{
  GKGameCenterViewController *v4;
  GKGameCenterViewController *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GKGameCenterViewController;
  v4 = -[GKGameCenterViewController init](&v7, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_viewState = state;
    v4->_leaderboardTimeScope = 2;
    v4->_leaderboardPlayerScope = 1;
    -[GKGameCenterViewController _commonInit](v4, "_commonInit");
  }
  return v5;
}

- (GKGameCenterViewController)initWithLeaderboardID:(NSString *)leaderboardID playerScope:(GKLeaderboardPlayerScope)playerScope timeScope:(GKLeaderboardTimeScope)timeScope
{
  NSString *v9;
  GKGameCenterViewController *v10;
  GKGameCenterViewController *v11;
  objc_super v13;

  v9 = leaderboardID;
  v13.receiver = self;
  v13.super_class = (Class)GKGameCenterViewController;
  v10 = -[GKGameCenterViewController init](&v13, sel_init);
  v11 = v10;
  if (v10)
  {
    v10->_viewState = 0;
    objc_storeStrong((id *)&v10->_leaderboardIdentifier, leaderboardID);
    v11->_leaderboardTimeScope = timeScope;
    v11->_leaderboardPlayerScope = playerScope;
    -[GKGameCenterViewController _commonInit](v11, "_commonInit");
  }

  return v11;
}

- (GKGameCenterViewController)initWithLeaderboard:(GKLeaderboard *)leaderboard playerScope:(GKLeaderboardPlayerScope)playerScope
{
  GKLeaderboard *v7;
  GKGameCenterViewController *v8;
  GKGameCenterViewController *v9;
  objc_super v11;

  v7 = leaderboard;
  v11.receiver = self;
  v11.super_class = (Class)GKGameCenterViewController;
  v8 = -[GKGameCenterViewController init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_viewState = 0;
    v8->_leaderboardTimeScope = 2;
    v8->_leaderboardPlayerScope = playerScope;
    objc_storeStrong((id *)&v8->_leaderboard, leaderboard);
    -[GKGameCenterViewController _commonInit](v9, "_commonInit");
  }

  return v9;
}

- (GKGameCenterViewController)initWithLeaderboardSetID:(id)a3
{
  id v5;
  GKGameCenterViewController *v6;
  GKGameCenterViewController *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)GKGameCenterViewController;
  v6 = -[GKGameCenterViewController init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_viewState = 0;
    objc_storeStrong((id *)&v6->_leaderboardSetIdentifier, a3);
    -[GKGameCenterViewController _commonInit](v7, "_commonInit");
  }

  return v7;
}

- (GKGameCenterViewController)initWithAchievementID:(NSString *)achievementID
{
  NSString *v5;
  GKGameCenterViewController *v6;
  GKGameCenterViewController *v7;
  objc_super v9;

  v5 = achievementID;
  v9.receiver = self;
  v9.super_class = (Class)GKGameCenterViewController;
  v6 = -[GKGameCenterViewController init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_viewState = 1;
    objc_storeStrong((id *)&v6->_achievementIdentifier, achievementID);
    -[GKGameCenterViewController _commonInit](v7, "_commonInit");
  }

  return v7;
}

- (GKGameCenterViewController)initWithPlayer:(id)a3
{
  id v4;
  GKGameCenterViewController *v5;
  GKGameCenterViewController *v6;
  void *v7;
  uint64_t v8;
  NSString *playerIdentifier;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)GKGameCenterViewController;
  v5 = -[GKGameCenterViewController init](&v11, sel_init);
  v6 = v5;
  if (v5)
  {
    v5->_viewState = 3;
    objc_msgSend(v4, "internal");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "playerID");
    v8 = objc_claimAutoreleasedReturnValue();
    playerIdentifier = v6->_playerIdentifier;
    v6->_playerIdentifier = (NSString *)v8;

    -[GKGameCenterViewController _commonInit](v6, "_commonInit");
  }

  return v6;
}

- (void)dealloc
{
  id v3;
  NSObject *v4;
  objc_super v5;
  uint8_t buf[16];

  if (!*MEMORY[0x1E0D25460])
    v3 = (id)GKOSLoggers();
  v4 = *MEMORY[0x1E0D25480];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D25480], OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1AB361000, v4, OS_LOG_TYPE_INFO, "GKGameCenterViewController dealloc", buf, 2u);
  }
  -[GKExtensionRemoteViewController cancelExtension](self->_remoteViewController, "cancelExtension");
  v5.receiver = self;
  v5.super_class = (Class)GKGameCenterViewController;
  -[GKGameCenterViewController dealloc](&v5, sel_dealloc);
}

- (void)_commonInit
{
  self->_restrictionMode = 3;
  -[GKGameCenterViewController _setupChildViewController](self, "_setupChildViewController");
}

+ (BOOL)_preventsAppearanceProxyCustomization
{
  return 1;
}

+ (BOOL)accessInstanceVariablesDirectly
{
  return 0;
}

- (id)animationControllerForPresentedController:(id)a3 presentingController:(id)a4 sourceController:(id)a5
{
  -[GKGameCenterViewController setPresenting:](self, "setPresenting:", 1, a4, a5);
  return self;
}

- (id)animationControllerForDismissedController:(id)a3
{
  -[GKGameCenterViewController setPresenting:](self, "setPresenting:", 0);
  return self;
}

- (void)animationEnded:(BOOL)a3
{
  -[GKGameCenterViewController setPresenting:](self, "setPresenting:", 0);
}

- (double)transitionDuration:(id)a3
{
  return 0.0;
}

- (void)animateTransition:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  _QWORD v26[4];
  id v27;
  id v28;
  id v29;

  v4 = a3;
  objc_msgSend(v4, "viewControllerForKey:", *MEMORY[0x1E0DC55B8]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "viewControllerForKey:", *MEMORY[0x1E0DC55C8]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "containerView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[GKGameCenterViewController isPresenting](self, "isPresenting"))
  {
    objc_msgSend(v5, "view");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "frame");
    v10 = v9;
    v12 = v11;
    v14 = v13;
    v16 = v15;

    objc_msgSend(v6, "view");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setFrame:", v10, v12, v14, v16);

    objc_msgSend(v6, "view");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setAutoresizingMask:", 18);

    objc_msgSend(v6, "view");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addSubview:", v19);

    objc_msgSend(v6, "view");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "layoutIfNeeded");

    objc_msgSend(v5, "view");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "layoutIfNeeded");

    objc_msgSend(v4, "completeTransition:", 1);
  }
  else
  {
    -[GKGameCenterViewController remoteViewController](self, "remoteViewController");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (v22)
    {
      -[GKGameCenterViewController remoteViewController](self, "remoteViewController");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v26[0] = MEMORY[0x1E0C809B0];
      v26[1] = 3221225472;
      v26[2] = __48__GKGameCenterViewController_animateTransition___block_invoke;
      v26[3] = &unk_1E59C5AC8;
      v27 = v4;
      v28 = v5;
      v29 = v6;
      objc_msgSend(v23, "tearDownExtensionWithReply:", v26);

    }
    else
    {
      objc_msgSend(v4, "completeTransition:", 1);
      objc_msgSend(v5, "view");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "removeFromSuperview");

      objc_msgSend(v6, "view");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "layoutIfNeeded");

    }
  }

}

void __48__GKGameCenterViewController_animateTransition___block_invoke(id *a1)
{
  _QWORD block[4];
  id v3;
  id v4;
  id v5;

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __48__GKGameCenterViewController_animateTransition___block_invoke_2;
  block[3] = &unk_1E59C54B8;
  v3 = a1[4];
  v4 = a1[5];
  v5 = a1[6];
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __48__GKGameCenterViewController_animateTransition___block_invoke_2(id *a1)
{
  void *v2;
  id v3;

  objc_msgSend(a1[4], "completeTransition:", 1);
  objc_msgSend(a1[5], "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeFromSuperview");

  objc_msgSend(a1[6], "view");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "layoutIfNeeded");

}

- (void)loadView
{
  void *v3;
  int v4;
  id v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GKGameCenterViewController;
  -[GKGameCenterViewController loadView](&v7, sel_loadView);
  objc_msgSend(MEMORY[0x1E0D253B0], "shared");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isGameCenterDisabled");

  if (v4)
  {
    v5 = objc_alloc(MEMORY[0x1E0DC3F10]);
    v6 = (void *)objc_msgSend(v5, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    objc_msgSend(v6, "setAlpha:", 0.0);
    -[GKGameCenterViewController setView:](self, "setView:", v6);

  }
}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  objc_super v13;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0D25330], "local");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "hideAccessPoint");

  -[GKGameCenterViewController remoteViewController](self, "remoteViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    -[GKGameCenterViewController _setupChildViewController](self, "_setupChildViewController");
    goto LABEL_7;
  }
  -[GKGameCenterViewController alertController](self, "alertController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    -[GKGameCenterViewController viewControllers](self, "viewControllers");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "count");

    if (v9)
      goto LABEL_6;
    -[GKGameCenterViewController remoteViewController](self, "remoteViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UINavigationController _updateViewControllerStackWithViewController:](self, "_updateViewControllerStackWithViewController:", v7);
  }

LABEL_6:
  -[GKGameCenterViewController remoteViewController](self, "remoteViewController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setDelegate:", self);

LABEL_7:
  v13.receiver = self;
  v13.super_class = (Class)GKGameCenterViewController;
  -[GKGameCenterViewController viewWillAppear:](&v13, sel_viewWillAppear_, v3);
  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "userInterfaceIdiom");

  if (v12 == 1)
    -[GKGameCenterViewController _setClipsToBounds:](self, "_setClipsToBounds:", 0);
}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GKGameCenterViewController;
  -[GKGameCenterViewController viewDidAppear:](&v7, sel_viewDidAppear_, a3);
  objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "postNotificationName:object:userInfo:deliverImmediately:", CFSTR("GameControllerNavigation_GKInGameViewAppeared"), 0, 0, 1);

  -[GKGameCenterViewController alertController](self, "alertController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[GKGameCenterViewController alertController](self, "alertController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKGameCenterViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v6, 1, &__block_literal_global_17);

  }
}

- (void)viewDidDisappear:(BOOL)a3
{
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  uint8_t v8[16];
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)GKGameCenterViewController;
  -[GKGameCenterViewController viewDidDisappear:](&v9, sel_viewDidDisappear_, a3);
  -[UINavigationController _updateViewControllerStackWithViewController:](self, "_updateViewControllerStackWithViewController:", 0);
  -[GKGameCenterViewController setRemoteViewController:](self, "setRemoteViewController:", 0);
  objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "postNotificationName:object:userInfo:deliverImmediately:", CFSTR("GameControllerNavigation_GKInGameViewDisappeared"), 0, 0, 1);

  objc_msgSend(MEMORY[0x1E0D25330], "local");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "showAccessPoint");

  if (!*MEMORY[0x1E0D25460])
    v6 = (id)GKOSLoggers();
  v7 = *MEMORY[0x1E0D25480];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D25480], OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_1AB361000, v7, OS_LOG_TYPE_INFO, "GKGameCenterViewController viewDidDisappear: cancelExtension", v8, 2u);
  }
  -[GKExtensionRemoteViewController cancelExtension](self->_remoteViewController, "cancelExtension");
}

- (void)_setupChildViewController
{
  int64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  BOOL v10;
  _QWORD v11[5];
  id v12;
  id location;
  _QWORD v14[5];

  v3 = -[GKGameCenterViewController restrictionMode](self, "restrictionMode");
  v4 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __55__GKGameCenterViewController__setupChildViewController__block_invoke;
  v14[3] = &unk_1E59C4148;
  v14[4] = self;
  -[GKGameCenterViewController _gkInGameUIUnavailableAlertWithRestrictionMode:dismissHandler:](self, "_gkInGameUIUnavailableAlertWithRestrictionMode:dismissHandler:", v3, v14);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKGameCenterViewController setAlertController:](self, "setAlertController:", v5);

  -[GKGameCenterViewController alertController](self, "alertController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    -[GKGameCenterViewController view](self, "view");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setAlpha:", 1.0);

    -[GKGameCenterViewController setNavigationBarHidden:](self, "setNavigationBarHidden:", 1);
    -[GKGameCenterViewController setWantsFullScreenLayout:](self, "setWantsFullScreenLayout:", 1);
    -[GKGameCenterViewController setTransitioningDelegate:](self, "setTransitioningDelegate:", self);
    -[GKGameCenterViewController setModalPresentationStyle:](self, "setModalPresentationStyle:", 4);
    -[GKGameCenterViewController setModalPresentationCapturesStatusBarAppearance:](self, "setModalPresentationCapturesStatusBarAppearance:", 1);
    if (objc_msgSend(MEMORY[0x1E0D25330], "usesGameOverlayUI"))
    {
      -[GKGameCenterViewController presentingViewController](self, "presentingViewController");
      v8 = objc_claimAutoreleasedReturnValue();
      if (v8)
      {
        v9 = (void *)v8;
        v10 = -[GKGameCenterViewController isPresentingOverlay](self, "isPresentingOverlay");

        if (!v10)
        {
          -[GKGameCenterViewController _beginDelayingPresentation:cancellationHandler:](self, "_beginDelayingPresentation:cancellationHandler:", &__block_literal_global_31, 5.0);
          objc_initWeak(&location, self);
          v11[0] = v4;
          v11[1] = 3221225472;
          v11[2] = __55__GKGameCenterViewController__setupChildViewController__block_invoke_32;
          v11[3] = &unk_1E59C5310;
          objc_copyWeak(&v12, &location);
          v11[4] = self;
          -[GKGameCenterViewController checkArcadeStateWithCompletion:](self, "checkArcadeStateWithCompletion:", v11);
          objc_destroyWeak(&v12);
          objc_destroyWeak(&location);
        }
      }
    }
    else if (!self->_remoteViewController)
    {
      -[GKGameCenterViewController _setupRemoteViewController](self, "_setupRemoteViewController");
    }
  }
}

uint64_t __55__GKGameCenterViewController__setupChildViewController__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "notifyDelegateOnWillFinish");
}

uint64_t __55__GKGameCenterViewController__setupChildViewController__block_invoke_2(uint64_t a1, int a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  if (a2)
  {
    if (!*MEMORY[0x1E0D25460])
      v3 = (id)GKOSLoggers();
    v4 = *MEMORY[0x1E0D25450];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D25450], OS_LOG_TYPE_ERROR))
      __55__GKGameCenterViewController__setupChildViewController__block_invoke_2_cold_1(v4, v5, v6, v7, v8, v9, v10, v11);
  }
  return a2 ^ 1u;
}

void __55__GKGameCenterViewController__setupChildViewController__block_invoke_32(uint64_t a1, uint64_t a2)
{
  void *v4;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "setIsArcade:", a2);
  objc_msgSend(*(id *)(a1 + 32), "constructInitialState");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "presentOverlayWithInitialState:", v4);
  objc_msgSend(*(id *)(a1 + 32), "setIsPresentingOverlay:", 1);
  objc_msgSend(WeakRetained, "_endDelayingPresentation");

}

- (void)_setupRemoteViewController
{
  void *v3;
  _QWORD v4[4];
  id v5;
  id v6;
  id location;

  +[GKDashboardHostViewController dashboardExtension](GKDashboardHostViewController, "dashboardExtension");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    +[GKExtensionRemoteViewController setupCallbackBlocksForExtension:withParentViewController:](GKExtensionRemoteViewController, "setupCallbackBlocksForExtension:withParentViewController:", v3, self);
    -[GKGameCenterViewController _beginDelayingPresentation:cancellationHandler:](self, "_beginDelayingPresentation:cancellationHandler:", &__block_literal_global_35, 5.0);
    objc_initWeak(&location, self);
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __56__GKGameCenterViewController__setupRemoteViewController__block_invoke_36;
    v4[3] = &unk_1E59C5B78;
    v5 = v3;
    objc_copyWeak(&v6, &location);
    -[GKGameCenterViewController checkArcadeStateWithCompletion:](self, "checkArcadeStateWithCompletion:", v4);
    objc_destroyWeak(&v6);

    objc_destroyWeak(&location);
  }

}

uint64_t __56__GKGameCenterViewController__setupRemoteViewController__block_invoke(uint64_t a1, int a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  if (a2)
  {
    if (!*MEMORY[0x1E0D25460])
      v3 = (id)GKOSLoggers();
    v4 = *MEMORY[0x1E0D25450];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D25450], OS_LOG_TYPE_ERROR))
      __56__GKGameCenterViewController__setupRemoteViewController__block_invoke_cold_1(v4, v5, v6, v7, v8, v9, v10, v11);
  }
  return a2 ^ 1u;
}

void __56__GKGameCenterViewController__setupRemoteViewController__block_invoke_36(uint64_t a1, char a2)
{
  uint64_t v3;
  _QWORD v4[4];
  id v5;
  char v6;

  v3 = *(_QWORD *)(a1 + 32);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __56__GKGameCenterViewController__setupRemoteViewController__block_invoke_2;
  v4[3] = &unk_1E59C5B50;
  objc_copyWeak(&v5, (id *)(a1 + 40));
  v6 = a2;
  +[GKExtensionRemoteViewController viewControllerForExtension:inputItems:completionHandler:](GKExtensionRemoteViewController, "viewControllerForExtension:inputItems:completionHandler:", v3, 0, v4);
  objc_destroyWeak(&v5);
}

void __56__GKGameCenterViewController__setupRemoteViewController__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id WeakRetained;
  id v7;
  id v8;

  v8 = a2;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setIsArcade:", *(unsigned __int8 *)(a1 + 40));
  if (v8)
  {
    v7 = v8;
    objc_msgSend(WeakRetained, "setRemoteViewController:", v7);
    objc_msgSend(WeakRetained, "_updateViewControllerStackWithViewController:", v7);

  }
  else
  {
    objc_msgSend(WeakRetained, "extensionDidFinishWithError:", v5);
  }

}

- (id)constructInitialState
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
  NSString *leaderboardIdentifier;
  NSString *leaderboardSetIdentifier;
  NSString *gameBundleID;
  GKLeaderboard *leaderboard;
  void *v18;
  NSString *leaderboardTitle;
  NSString *achievementIdentifier;
  NSString *activityIdentifier;
  NSString *playerIdentifier;
  NSString *playerAlias;
  id v24;
  void *v25;
  GKGame *actualGame;
  NSObject *v27;
  void *v28;
  void *v29;
  void *v30;
  int v32;
  void *v33;
  __int16 v34;
  void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0C99E08];
  +[GKExtensionRemoteViewController initialItemsForExtension](GKExtensionRemoteViewController, "initialItemsForExtension");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dictionaryWithDictionary:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_viewState);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v6, CFSTR("DashboardViewState"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_leaderboardTimeScope);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v7, CFSTR("DashboardTimeScope"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_leaderboardPlayerScope);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v8, CFSTR("DashboardPlayerScope"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[GKGameCenterViewController shouldShowPlayForChallenge](self, "shouldShowPlayForChallenge"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v9, CFSTR("DashboardShowPlayForChallenge"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[GKGameCenterViewController shouldShowPlayForTurnBasedMatch](self, "shouldShowPlayForTurnBasedMatch"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v10, CFSTR("MatchesShowPlayForMatch"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[GKGameCenterViewController shouldShowQuitForTurnBasedMatch](self, "shouldShowQuitForTurnBasedMatch"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v11, CFSTR("MatchesShowQuitForMatch"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[GKGameCenterViewController isArcade](self, "isArcade"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v12, CFSTR("DashboardIsArcadeGame"));

  -[GKGameCenterViewController launchContext](self, "launchContext");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v13, CFSTR("DashboardLaunchContext"));

  leaderboardIdentifier = self->_leaderboardIdentifier;
  if (leaderboardIdentifier)
    objc_msgSend(v5, "setObject:forKeyedSubscript:", leaderboardIdentifier, CFSTR("DashboardLeaderboardID"));
  leaderboardSetIdentifier = self->_leaderboardSetIdentifier;
  if (leaderboardSetIdentifier)
    objc_msgSend(v5, "setObject:forKeyedSubscript:", leaderboardSetIdentifier, CFSTR("DashboardLeaderboardSetID"));
  gameBundleID = self->_gameBundleID;
  if (gameBundleID)
    objc_msgSend(v5, "setObject:forKeyedSubscript:", gameBundleID, CFSTR("DashboardGameBundleID"));
  leaderboard = self->_leaderboard;
  if (leaderboard)
  {
    -[GKLeaderboard internal](leaderboard, "internal");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v18, CFSTR("DashboardLeaderboardInternal"));

  }
  leaderboardTitle = self->_leaderboardTitle;
  if (leaderboardTitle)
    objc_msgSend(v5, "setObject:forKeyedSubscript:", leaderboardTitle, CFSTR("DashboardLeaderboardTitle"));
  achievementIdentifier = self->_achievementIdentifier;
  if (achievementIdentifier)
    objc_msgSend(v5, "setObject:forKeyedSubscript:", achievementIdentifier, CFSTR("DashboardAchievementID"));
  activityIdentifier = self->_activityIdentifier;
  if (activityIdentifier)
    objc_msgSend(v5, "setObject:forKeyedSubscript:", activityIdentifier, CFSTR("DashboardActivityID"));
  playerIdentifier = self->_playerIdentifier;
  if (playerIdentifier)
    objc_msgSend(v5, "setObject:forKeyedSubscript:", playerIdentifier, CFSTR("DashboardPlayerID"));
  playerAlias = self->_playerAlias;
  if (playerAlias)
    objc_msgSend(v5, "setObject:forKeyedSubscript:", playerAlias, CFSTR("DashboardPlayerAlias"));
  if (self->_actualGame && self->_actualHostPID >= 1)
  {
    if (!*MEMORY[0x1E0D25460])
      v24 = (id)GKOSLoggers();
    v25 = (void *)*MEMORY[0x1E0D25480];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D25480], OS_LOG_TYPE_INFO))
    {
      actualGame = self->_actualGame;
      v27 = v25;
      -[GKGame bundleIdentifier](actualGame, "bundleIdentifier");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_actualHostPID);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = 138412546;
      v33 = v28;
      v34 = 2112;
      v35 = v29;
      _os_log_impl(&dword_1AB361000, v27, OS_LOG_TYPE_INFO, "GKGameCenterViewController is overriding game.bundleIdentifier=%@ hostPID=%@", (uint8_t *)&v32, 0x16u);

    }
    objc_msgSend(v5, "setObject:forKeyedSubscript:", self->_actualGame, CFSTR("CurrentGameKey"));
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_actualHostPID);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v30, CFSTR("HostPIDKey"));

  }
  return v5;
}

- (void)setRemoteViewController:(id)a3
{
  GKDashboardHostViewController *v5;
  GKDashboardHostViewController **p_remoteViewController;
  void *v7;
  GKDashboardHostViewController *v8;
  _QWORD v9[4];
  id v10;
  id location;

  v5 = (GKDashboardHostViewController *)a3;
  p_remoteViewController = &self->_remoteViewController;
  if (self->_remoteViewController != v5)
  {
    objc_storeStrong((id *)&self->_remoteViewController, a3);
    -[GKDashboardHostViewController setDelegate:](*p_remoteViewController, "setDelegate:", self);
    -[GKGameCenterViewController constructInitialState](self, "constructInitialState");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_initWeak(&location, self);
    v8 = *p_remoteViewController;
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __54__GKGameCenterViewController_setRemoteViewController___block_invoke;
    v9[3] = &unk_1E59C5A30;
    objc_copyWeak(&v10, &location);
    -[GKExtensionRemoteViewController setInitialState:withReply:](v8, "setInitialState:withReply:", v7, v9);
    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);

  }
}

void __54__GKGameCenterViewController_setRemoteViewController___block_invoke(uint64_t a1)
{
  _QWORD block[4];
  id v2;

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __54__GKGameCenterViewController_setRemoteViewController___block_invoke_2;
  block[3] = &unk_1E59C48A0;
  objc_copyWeak(&v2, (id *)(a1 + 32));
  dispatch_async(MEMORY[0x1E0C80D38], block);
  objc_destroyWeak(&v2);
}

void __54__GKGameCenterViewController_setRemoteViewController___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_endDelayingPresentation");

}

- (void)checkArcadeStateWithCompletion:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;

  v3 = a3;
  v4 = (void *)MEMORY[0x1E0D252A8];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterUI/iOS/Framework/API/GKGameCenterViewController_iOS.m", 529, "-[GKGameCenterViewController checkArcadeStateWithCompletion:]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dispatchGroupWithName:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __61__GKGameCenterViewController_checkArcadeStateWithCompletion___block_invoke;
  v14[3] = &unk_1E59C4A28;
  v8 = v6;
  v15 = v8;
  objc_msgSend(v8, "perform:", v14);
  v11[0] = v7;
  v11[1] = 3221225472;
  v11[2] = __61__GKGameCenterViewController_checkArcadeStateWithCompletion___block_invoke_3;
  v11[3] = &unk_1E59C53C8;
  v12 = v8;
  v13 = v3;
  v9 = v3;
  v10 = v8;
  objc_msgSend(v10, "notifyOnMainQueueWithBlock:", v11);

}

void __61__GKGameCenterViewController_checkArcadeStateWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a2;
  objc_msgSend(MEMORY[0x1E0D25298], "proxyForLocalPlayer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "profileService");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __61__GKGameCenterViewController_checkArcadeStateWithCompletion___block_invoke_2;
  v7[3] = &unk_1E59C5BA0;
  v8 = *(id *)(a1 + 32);
  v9 = v3;
  v6 = v3;
  objc_msgSend(v5, "getOcelotStateForCurrentAppWithHandler:", v7);

}

uint64_t __61__GKGameCenterViewController_checkArcadeStateWithCompletion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setResult:", v3);

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

uint64_t __61__GKGameCenterViewController_checkArcadeStateWithCompletion___block_invoke_3(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "result");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "BOOLValue");

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)extensionDidFinishWithError:(id)a3
{
  void *v4;

  -[GKGameCenterViewController notifyDelegateOnWillFinish](self, "notifyDelegateOnWillFinish", a3);
  if (+[GKDashboardHostViewController dismissAutomaticallyAfterExtensionCompletion](GKDashboardHostViewController, "dismissAutomaticallyAfterExtensionCompletion"))
  {
    -[GKGameCenterViewController presentingViewController](self, "presentingViewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dismissViewControllerAnimated:completion:", 1, 0);

  }
  -[UINavigationController _updateViewControllerStackWithViewController:](self, "_updateViewControllerStackWithViewController:", 0);
  -[GKGameCenterViewController setRemoteViewController:](self, "setRemoteViewController:", 0);
}

- (BOOL)shouldShowPlayForChallenge
{
  void *v2;
  void *v3;
  char v4;
  char v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0D25330], "localPlayer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "eventEmitter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "listenerRegisteredForSelector:", sel_player_wantsToPlayChallenge_);

  if ((v4 & 1) != 0)
  {
    v5 = 1;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D25288], "challengeEventHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v5 = objc_opt_respondsToSelector();
  }
  return v5 & 1;
}

- (BOOL)shouldShowPlayForTurnBasedMatch
{
  void *v2;
  void *v3;
  char v4;

  objc_msgSend(MEMORY[0x1E0D25330], "localPlayer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "eventEmitter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "listenerRegisteredForSelector:", sel_player_receivedTurnEventForMatch_didBecomeActive_);

  return v4;
}

- (BOOL)shouldShowQuitForTurnBasedMatch
{
  void *v2;
  void *v3;
  char v4;

  objc_msgSend(MEMORY[0x1E0D25330], "localPlayer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "eventEmitter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "listenerRegisteredForSelector:", sel_player_wantsToQuitMatch_);

  return v4;
}

- (GKGameCenterViewControllerState)viewState
{
  return self->_viewState;
}

- (void)setViewState:(GKGameCenterViewControllerState)viewState
{
  int64_t *p_viewState;
  id v6;
  GKDashboardHostViewController *remoteViewController;
  void *v8;
  void *v9;
  NSString *leaderboardIdentifier;

  p_viewState = &self->_viewState;
  if (self->_viewState != viewState)
  {
    if (!*MEMORY[0x1E0D25460])
      v6 = (id)GKOSLoggers();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D25468], OS_LOG_TYPE_DEBUG))
      -[GKGameCenterViewController setViewState:].cold.1();
    *p_viewState = viewState;
    remoteViewController = self->_remoteViewController;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", viewState);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKDashboardHostViewController hostDidChangeViewState:](remoteViewController, "hostDidChangeViewState:", v8);

    if (*p_viewState)
    {
      -[GKGameCenterViewController leaderboardIdentifier](self, "leaderboardIdentifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9)
      {
        leaderboardIdentifier = self->_leaderboardIdentifier;
        self->_leaderboardIdentifier = 0;

      }
    }
  }
}

- (NSString)leaderboardIdentifier
{
  return self->_leaderboardIdentifier;
}

- (void)setLeaderboardIdentifier:(NSString *)leaderboardIdentifier
{
  NSString *v5;
  id v6;
  NSObject *v7;

  v5 = leaderboardIdentifier;
  if (!-[NSString isEqualToString:](self->_leaderboardIdentifier, "isEqualToString:", v5))
  {
    if (!*MEMORY[0x1E0D25460])
      v6 = (id)GKOSLoggers();
    v7 = *MEMORY[0x1E0D25468];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D25468], OS_LOG_TYPE_DEBUG))
      -[GKGameCenterViewController setLeaderboardIdentifier:].cold.1((uint64_t)v5, &self->_leaderboardIdentifier, v7);
    objc_storeStrong((id *)&self->_leaderboardIdentifier, leaderboardIdentifier);
    if (self->_leaderboardIdentifier)
    {
      -[GKDashboardHostViewController hostDidChangeLeaderboardIdentifier:](self->_remoteViewController, "hostDidChangeLeaderboardIdentifier:");
      self->_viewState = 0;
    }
  }

}

- (GKLeaderboardTimeScope)leaderboardTimeScope
{
  return self->_leaderboardTimeScope;
}

- (void)setLeaderboardTimeScope:(GKLeaderboardTimeScope)leaderboardTimeScope
{
  int64_t *p_leaderboardTimeScope;
  id v6;
  GKDashboardHostViewController *remoteViewController;
  void *v8;

  p_leaderboardTimeScope = &self->_leaderboardTimeScope;
  if (self->_leaderboardTimeScope != leaderboardTimeScope)
  {
    if (!*MEMORY[0x1E0D25460])
      v6 = (id)GKOSLoggers();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D25468], OS_LOG_TYPE_DEBUG))
      -[GKGameCenterViewController setLeaderboardTimeScope:].cold.1();
    *p_leaderboardTimeScope = leaderboardTimeScope;
    remoteViewController = self->_remoteViewController;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", leaderboardTimeScope);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKDashboardHostViewController hostDidChangeLeaderboardTimeScope:](remoteViewController, "hostDidChangeLeaderboardTimeScope:", v8);

  }
}

- (int64_t)leaderboardPlayerScope
{
  return self->_leaderboardPlayerScope;
}

- (void)setLeaderboardPlayerScope:(int64_t)a3
{
  int64_t *p_leaderboardPlayerScope;
  id v6;
  GKDashboardHostViewController *remoteViewController;
  void *v8;

  p_leaderboardPlayerScope = &self->_leaderboardPlayerScope;
  if (self->_leaderboardPlayerScope != a3)
  {
    if (!*MEMORY[0x1E0D25460])
      v6 = (id)GKOSLoggers();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D25468], OS_LOG_TYPE_DEBUG))
      -[GKGameCenterViewController setLeaderboardPlayerScope:].cold.1();
    *p_leaderboardPlayerScope = a3;
    remoteViewController = self->_remoteViewController;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKDashboardHostViewController hostDidChangeLeaderboardPlayerScope:](remoteViewController, "hostDidChangeLeaderboardPlayerScope:", v8);

  }
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(int64_t)a3
{
  return 1;
}

- (unint64_t)supportedInterfaceOrientations
{
  return 30;
}

- (BOOL)automaticallyForwardAppearanceAndRotationMethodsToChildViewControllers
{
  return 1;
}

- (BOOL)shouldAutomaticallyForwardRotationMethods
{
  return 1;
}

- (BOOL)shouldAutomaticallyForwardAppearanceMethods
{
  return 1;
}

- (id)gameCenterDelegate
{
  return objc_loadWeakRetained((id *)&self->_gameCenterDelegate);
}

- (void)setGameCenterDelegate:(id)gameCenterDelegate
{
  objc_storeWeak((id *)&self->_gameCenterDelegate, gameCenterDelegate);
}

- (NSString)leaderboardSetIdentifier
{
  return self->_leaderboardSetIdentifier;
}

- (void)setLeaderboardSetIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_leaderboardSetIdentifier, a3);
}

- (GKDashboardHostViewController)remoteViewController
{
  return self->_remoteViewController;
}

- (NSString)leaderboardTitle
{
  return self->_leaderboardTitle;
}

- (void)setLeaderboardTitle:(id)a3
{
  objc_storeStrong((id *)&self->_leaderboardTitle, a3);
}

- (GKLeaderboard)leaderboard
{
  return self->_leaderboard;
}

- (void)setLeaderboard:(id)a3
{
  objc_storeStrong((id *)&self->_leaderboard, a3);
}

- (NSString)activityIdentifier
{
  return self->_activityIdentifier;
}

- (void)setActivityIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_activityIdentifier, a3);
}

- (NSString)playerIdentifier
{
  return self->_playerIdentifier;
}

- (void)setPlayerIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_playerIdentifier, a3);
}

- (NSString)playerAlias
{
  return self->_playerAlias;
}

- (void)setPlayerAlias:(id)a3
{
  objc_storeStrong((id *)&self->_playerAlias, a3);
}

- (NSString)gameBundleID
{
  return self->_gameBundleID;
}

- (void)setGameBundleID:(id)a3
{
  objc_storeStrong((id *)&self->_gameBundleID, a3);
}

- (UIAlertController)alertController
{
  return self->_alertController;
}

- (void)setAlertController:(id)a3
{
  objc_storeStrong((id *)&self->_alertController, a3);
}

- (BOOL)isArcade
{
  return self->_isArcade;
}

- (void)setIsArcade:(BOOL)a3
{
  self->_isArcade = a3;
}

- (int64_t)restrictionMode
{
  return self->_restrictionMode;
}

- (void)setRestrictionMode:(int64_t)a3
{
  self->_restrictionMode = a3;
}

- (BOOL)isPresenting
{
  return self->_presenting;
}

- (void)setPresenting:(BOOL)a3
{
  self->_presenting = a3;
}

- (GKGame)actualGame
{
  return self->_actualGame;
}

- (void)setActualGame:(id)a3
{
  objc_storeStrong((id *)&self->_actualGame, a3);
}

- (int)actualHostPID
{
  return self->_actualHostPID;
}

- (void)setActualHostPID:(int)a3
{
  self->_actualHostPID = a3;
}

- (BOOL)isPresentingOverlay
{
  return self->_isPresentingOverlay;
}

- (void)setIsPresentingOverlay:(BOOL)a3
{
  self->_isPresentingOverlay = a3;
}

- (NSString)launchContext
{
  return self->_launchContext;
}

- (void)setLaunchContext:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1544);
}

- (NSString)achievementIdentifier
{
  return self->_achievementIdentifier;
}

- (void)setAchievementIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_achievementIdentifier, a3);
}

- (NSObject)overlay
{
  return self->_overlay;
}

- (void)setOverlay:(id)a3
{
  objc_storeStrong((id *)&self->_overlay, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overlay, 0);
  objc_storeStrong((id *)&self->_achievementIdentifier, 0);
  objc_storeStrong((id *)&self->_launchContext, 0);
  objc_storeStrong((id *)&self->_actualGame, 0);
  objc_storeStrong((id *)&self->_alertController, 0);
  objc_storeStrong((id *)&self->_gameBundleID, 0);
  objc_storeStrong((id *)&self->_playerAlias, 0);
  objc_storeStrong((id *)&self->_playerIdentifier, 0);
  objc_storeStrong((id *)&self->_activityIdentifier, 0);
  objc_storeStrong((id *)&self->_leaderboard, 0);
  objc_storeStrong((id *)&self->_leaderboardTitle, 0);
  objc_storeStrong((id *)&self->_remoteViewController, 0);
  objc_storeStrong((id *)&self->_leaderboardSetIdentifier, 0);
  objc_storeStrong((id *)&self->_leaderboardIdentifier, 0);
  objc_destroyWeak((id *)&self->_gameCenterDelegate);
}

- (GKGameCenterViewController)initWithGame:(id)a3 hostPID:(int)a4 restrictionMode:(int64_t)a5 deeplink:(id)a6 launchContext:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  int64_t v19;
  id v20;
  GKGame *actualGame;
  void *v22;
  uint64_t actualHostPID;
  NSObject *v24;
  void *v25;
  GKGameCenterViewController *v26;
  void *v27;
  uint64_t v28;
  NSString *leaderboardIdentifier;
  uint64_t v30;
  NSString *leaderboardTitle;
  uint64_t v32;
  NSString *playerIdentifier;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  NSString *achievementIdentifier;
  uint64_t v38;
  NSString *gameBundleID;
  uint64_t v40;
  NSString *v41;
  void *v42;
  id v44;
  int v45;
  objc_super v46;
  uint8_t buf[4];
  GKGame *v48;
  __int16 v49;
  void *v50;
  __int16 v51;
  int64_t v52;
  __int16 v53;
  id v54;
  __int16 v55;
  id v56;
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = a6;
  v15 = a7;
  if (!*MEMORY[0x1E0D25460])
    v16 = (id)GKOSLoggers();
  v17 = (void *)*MEMORY[0x1E0D25480];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D25480], OS_LOG_TYPE_INFO))
  {
    v44 = a7;
    v18 = v15;
    v19 = a5;
    v20 = v13;
    actualGame = self->_actualGame;
    v22 = (void *)MEMORY[0x1E0CB37E8];
    v45 = a4;
    actualHostPID = self->_actualHostPID;
    v24 = v17;
    objc_msgSend(v22, "numberWithInt:", actualHostPID);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413314;
    v48 = actualGame;
    v13 = v20;
    a5 = v19;
    v15 = v18;
    a7 = v44;
    v49 = 2112;
    v50 = v25;
    v51 = 2048;
    v52 = a5;
    v53 = 2112;
    v54 = v14;
    v55 = 2112;
    v56 = v15;
    _os_log_impl(&dword_1AB361000, v24, OS_LOG_TYPE_INFO, "GKGameCenterViewController.initWithGame:%@\n hostPID:%@\n restrictionMode:%ld\n deeplink:%@\n launchContext:%@", buf, 0x34u);

    a4 = v45;
  }
  v46.receiver = self;
  v46.super_class = (Class)GKGameCenterViewController;
  v26 = -[GKGameCenterViewController init](&v46, sel_init);
  if (v26)
  {
    objc_msgSend(v14, "objectForKeyedSubscript:", *MEMORY[0x1E0D24F70]);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v27, "isEqualToString:", *MEMORY[0x1E0D24F78]))
    {
      v26->_viewState = 0;
      objc_msgSend(v14, "objectForKeyedSubscript:", *MEMORY[0x1E0D24F68]);
      v28 = objc_claimAutoreleasedReturnValue();
      leaderboardIdentifier = v26->_leaderboardIdentifier;
      v26->_leaderboardIdentifier = (NSString *)v28;

      objc_msgSend(v14, "objectForKeyedSubscript:", *MEMORY[0x1E0D24F80]);
      v30 = objc_claimAutoreleasedReturnValue();
      leaderboardTitle = v26->_leaderboardTitle;
      v26->_leaderboardTitle = (NSString *)v30;

      objc_msgSend(v14, "objectForKeyedSubscript:", *MEMORY[0x1E0D24F98]);
      v32 = objc_claimAutoreleasedReturnValue();
      playerIdentifier = v26->_playerIdentifier;
      v26->_playerIdentifier = (NSString *)v32;

      objc_msgSend(v14, "objectForKeyedSubscript:", *MEMORY[0x1E0D24F90]);
      v34 = objc_claimAutoreleasedReturnValue();
      v35 = 1512;
    }
    else if (objc_msgSend(v27, "isEqualToString:", *MEMORY[0x1E0D24F88]))
    {
      v26->_viewState = 3;
      objc_msgSend(v14, "objectForKeyedSubscript:", *MEMORY[0x1E0D24F98]);
      v34 = objc_claimAutoreleasedReturnValue();
      v35 = 1496;
    }
    else if (objc_msgSend(v27, "isEqualToString:", *MEMORY[0x1E0D24F58]))
    {
      v26->_viewState = 1;
      objc_msgSend(v14, "objectForKeyedSubscript:", *MEMORY[0x1E0D24F50]);
      v36 = objc_claimAutoreleasedReturnValue();
      achievementIdentifier = v26->_achievementIdentifier;
      v26->_achievementIdentifier = (NSString *)v36;

      objc_msgSend(v14, "objectForKeyedSubscript:", *MEMORY[0x1E0D24F90]);
      v38 = objc_claimAutoreleasedReturnValue();
      gameBundleID = v26->_gameBundleID;
      v26->_gameBundleID = (NSString *)v38;

      objc_msgSend(v14, "objectForKeyedSubscript:", *MEMORY[0x1E0D24F98]);
      v40 = objc_claimAutoreleasedReturnValue();
      v41 = v26->_playerIdentifier;
      v26->_playerIdentifier = (NSString *)v40;

      objc_msgSend(v14, "objectForKeyedSubscript:", *MEMORY[0x1E0D24F80]);
      v34 = objc_claimAutoreleasedReturnValue();
      v35 = 1504;
    }
    else
    {
      if (!objc_msgSend(v27, "isEqualToString:", *MEMORY[0x1E0D24F60]))
      {
        v26->_viewState = -1;
        goto LABEL_15;
      }
      v26->_viewState = 4;
      objc_msgSend(v14, "objectForKeyedSubscript:", *MEMORY[0x1E0D24F68]);
      v34 = objc_claimAutoreleasedReturnValue();
      v35 = 1488;
    }
    v42 = *(Class *)((char *)&v26->super.super.super.super.isa + v35);
    *(Class *)((char *)&v26->super.super.super.super.isa + v35) = (Class)v34;

LABEL_15:
    v26->_leaderboardTimeScope = 2;
    v26->_leaderboardPlayerScope = 1;
    objc_storeStrong((id *)&v26->_actualGame, a3);
    v26->_actualHostPID = a4;
    v26->_restrictionMode = a5;
    objc_storeStrong((id *)&v26->_launchContext, a7);
    -[GKGameCenterViewController _setupChildViewController](v26, "_setupChildViewController");

  }
  return v26;
}

- (void)setViewStateFromExtension:(int64_t)a3
{
  self->_viewState = a3;
}

- (void)setLeaderboardIdentifierFromExtension:(id)a3
{
  objc_storeStrong((id *)&self->_leaderboardIdentifier, a3);
}

- (void)setLeaderboardTimeScopeFromExtension:(int64_t)a3
{
  self->_leaderboardTimeScope = a3;
}

- (void)setLeaderboardPlayerScopeFromExtension:(int64_t)a3
{
  self->_leaderboardPlayerScope = a3;
}

- (void)notifyDelegateOnWillFinish
{
  id v3;

  -[GKGameCenterViewController gameCenterDelegate](self, "gameCenterDelegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "gameCenterViewControllerDidFinish:", self);

}

- (void)presentOverlayWithInitialState:(id)a3
{
  uint64_t v4;
  GKGameCenterViewController *v5;

  v4 = sub_1AB7DAEB8();
  v5 = self;
  GKGameCenterViewController.presentOverlay(initialState:)((Swift::OpaquePointer)v4);

  swift_bridgeObjectRelease();
}

void __55__GKGameCenterViewController__setupChildViewController__block_invoke_2_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_1(&dword_1AB361000, a1, a3, "We failed to present dashboard in the Game Overlay system.", a5, a6, a7, a8, 0);
}

void __56__GKGameCenterViewController__setupRemoteViewController__block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_1(&dword_1AB361000, a1, a3, "We failed to present Game Center dashboard extension.", a5, a6, a7, a8, 0);
}

- (void)setViewState:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  uint64_t v2;
  uint64_t v3;

  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_3(&dword_1AB361000, v0, v1, "API set viewState %ld (was: %ld)", v2, v3);
  OUTLINED_FUNCTION_4();
}

- (void)setLeaderboardIdentifier:(NSObject *)a3 .cold.1(uint64_t a1, _QWORD *a2, NSObject *a3)
{
  _BYTE v3[24];

  *(_DWORD *)v3 = 138412546;
  *(_QWORD *)&v3[4] = a1;
  *(_WORD *)&v3[12] = 2112;
  *(_QWORD *)&v3[14] = *a2;
  OUTLINED_FUNCTION_0_3(&dword_1AB361000, (uint64_t)a2, a3, "API set leaderboardIdentifier %@ (was: %@)", *(_QWORD *)v3, *(_QWORD *)&v3[8], *(_QWORD *)&v3[16]);
  OUTLINED_FUNCTION_4();
}

- (void)setLeaderboardTimeScope:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  uint64_t v2;
  uint64_t v3;

  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_3(&dword_1AB361000, v0, v1, "API set leaderboardTimeScope %ld (was: %ld)", v2, v3);
  OUTLINED_FUNCTION_4();
}

- (void)setLeaderboardPlayerScope:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  uint64_t v2;
  uint64_t v3;

  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_3(&dword_1AB361000, v0, v1, "API set leaderboardPlayerScope %ld (was: %ld)", v2, v3);
  OUTLINED_FUNCTION_4();
}

@end
