@implementation MRUControlCenterViewController

- (MRUControlCenterViewController)init
{
  MRUControlCenterViewController *v2;
  MRUControlCenterViewController *v3;
  id v4;
  void *v5;
  MediaControlsEndpointsManager *v6;
  MediaControlsEndpointsManager *endpointsManager;
  uint64_t v8;
  NSMutableDictionary *nowPlayingControllers;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)MRUControlCenterViewController;
  v2 = -[MRUControlCenterViewController init](&v11, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_pendingNowPlayingExpandedLayout = 0x7FFFFFFFFFFFFFFFLL;
    if (MRAVOutputContextGetSharedAudioPresentationContext())
    {
      v4 = objc_alloc_init(MEMORY[0x1E0CC23D8]);
      objc_msgSend(v4, "setStyle:", 0);
      v5 = (void *)MRAVOutputContextCopyUniqueIdentifier();
      objc_msgSend(v4, "setRoutingContextUID:", v5);

      objc_msgSend(v4, "setAllowsNowPlayingApplicationLaunch:", 1);
      v6 = -[MediaControlsEndpointsManager initWithConfiguration:]([MediaControlsEndpointsManager alloc], "initWithConfiguration:", v4);
      endpointsManager = v3->_endpointsManager;
      v3->_endpointsManager = v6;

      -[MediaControlsEndpointsManager setDelegate:](v3->_endpointsManager, "setDelegate:", v3);
    }
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v8 = objc_claimAutoreleasedReturnValue();
    nowPlayingControllers = v3->_nowPlayingControllers;
    v3->_nowPlayingControllers = (NSMutableDictionary *)v8;

  }
  return v3;
}

- (void)loadView
{
  MRUControlCenterView *v3;
  MRUControlCenterView *v4;

  v3 = [MRUControlCenterView alloc];
  v4 = -[MRUControlCenterView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  -[MRUControlCenterViewController setView:](self, "setView:", v4);

}

- (void)viewDidLoad
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
  uint64_t v18;
  uint64_t v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  id v24;
  UICollectionViewDiffableDataSource *v25;
  UICollectionViewDiffableDataSource *dataSource;
  void *v27;
  void *v28;
  uint64_t v29;
  id v30;
  _QWORD v31[4];
  id v32;
  _QWORD v33[4];
  id v34;
  id location;
  objc_super v36;

  v36.receiver = self;
  v36.super_class = (Class)MRUControlCenterViewController;
  -[MRUControlCenterViewController viewDidLoad](&v36, sel_viewDidLoad);
  -[MRUControlCenterViewController setOverrideUserInterfaceStyle:](self, "setOverrideUserInterfaceStyle:", 2);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D80]), "initWithTarget:action:", self, sel_dismiss);
  objc_msgSend(v3, "setDelegate:", self);
  -[MRUControlCenterViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addGestureRecognizer:", v3);

  -[MRUControlCenterViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "routingButton");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addTarget:action:forControlEvents:", self, sel_didSelectRoutingButton_, 64);

  +[MRUAssetsProvider controlOtherSpeakers](MRUAssetsProvider, "controlOtherSpeakers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRUControlCenterViewController view](self, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "moreButton");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setImage:", v7);

  +[MRUStringsProvider controlOtherSpeakersMultipleLines](MRUStringsProvider, "controlOtherSpeakersMultipleLines");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRUControlCenterViewController view](self, "view");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "moreButton");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setTitle:", v10);

  -[MRUControlCenterViewController view](self, "view");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "moreButton");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addTarget:action:forControlEvents:", self, sel_didSelectListState_, 64);

  -[MRUControlCenterViewController view](self, "view");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "collectionView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setDelegate:", self);

  objc_initWeak(&location, self);
  v17 = (void *)MEMORY[0x1E0DC35C8];
  v18 = objc_opt_class();
  v19 = MEMORY[0x1E0C809B0];
  v33[0] = MEMORY[0x1E0C809B0];
  v33[1] = 3221225472;
  v33[2] = __45__MRUControlCenterViewController_viewDidLoad__block_invoke;
  v33[3] = &unk_1E581A508;
  objc_copyWeak(&v34, &location);
  objc_msgSend(v17, "registrationWithCellClass:configurationHandler:", v18, v33);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_alloc(MEMORY[0x1E0DC35E8]);
  -[MRUControlCenterViewController view](self, "view");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "collectionView");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v31[0] = v19;
  v31[1] = 3221225472;
  v31[2] = __45__MRUControlCenterViewController_viewDidLoad__block_invoke_2;
  v31[3] = &unk_1E5819D08;
  v24 = v20;
  v32 = v24;
  v25 = (UICollectionViewDiffableDataSource *)objc_msgSend(v21, "initWithCollectionView:cellProvider:", v23, v31);
  dataSource = self->_dataSource;
  self->_dataSource = v25;

  -[MRUControlCenterViewController createNowPlayingViewController](self, "createNowPlayingViewController");
  objc_copyWeak(&v30, &location);
  -[MRUControlCenterViewController view](self, "view", v19, 3221225472, __45__MRUControlCenterViewController_viewDidLoad__block_invoke_3, &unk_1E581A530);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "routingButton");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setImageForRoute:", &v29);

  -[MRUControlCenterViewController updateNowPlayingControllers](self, "updateNowPlayingControllers");
  objc_destroyWeak(&v30);

  objc_destroyWeak(&v34);
  objc_destroyWeak(&location);

}

void __45__MRUControlCenterViewController_viewDidLoad__block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id *v5;
  id v6;
  id v7;
  id WeakRetained;

  v5 = (id *)(a1 + 32);
  v6 = a4;
  v7 = a2;
  WeakRetained = objc_loadWeakRetained(v5);
  objc_msgSend(WeakRetained, "updateCell:forIdentifier:", v7, v6);

}

uint64_t __45__MRUControlCenterViewController_viewDidLoad__block_invoke_2(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  return objc_msgSend(a2, "dequeueConfiguredReusableCellWithRegistration:forIndexPath:item:", *(_QWORD *)(a1 + 32), a3, a4);
}

void __45__MRUControlCenterViewController_viewDidLoad__block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  id WeakRetained;

  v4 = (id *)(a1 + 32);
  v5 = a3;
  v6 = a2;
  WeakRetained = objc_loadWeakRetained(v4);
  objc_msgSend(WeakRetained, "nowPlayingViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "controller");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "imageForRoute:completion:", v6, v5);

}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  -[MRUControlCenterViewController setOnScreen:](self, "setOnScreen:", 1);
  v5.receiver = self;
  v5.super_class = (Class)MRUControlCenterViewController;
  -[MRUControlCenterViewController viewWillAppear:](&v5, sel_viewWillAppear_, v3);
}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  -[MRUControlCenterViewController setOnScreen:](self, "setOnScreen:", 0);
  v5.receiver = self;
  v5.super_class = (Class)MRUControlCenterViewController;
  -[MRUControlCenterViewController viewWillDisappear:](&v5, sel_viewWillDisappear_, v3);
}

- (void)viewWillLayoutSubviews
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  void *v7;
  double v8;
  void *v9;
  void *v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)MRUControlCenterViewController;
  -[MRUControlCenterViewController viewWillLayoutSubviews](&v11, sel_viewWillLayoutSubviews);
  -[MRUControlCenterViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "state"))
    CCUIExpandedModuleContinuousCornerRadius();
  else
    -[MRUControlCenterViewController compactContinuousCornerRadius](self, "compactContinuousCornerRadius");
  v5 = v4;

  -[MRUControlCenterViewController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setCornerRadius:", v5);

  -[MRUControlCenterViewController view](self, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (MRULayoutShouldBeVertical())
    v8 = 0.0;
  else
    v8 = v5;
  -[MRUControlCenterViewController nowPlayingViewController](self, "nowPlayingViewController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "routingViewController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setScrollIndicatorInsets:", v8, 0.0, v5, 0.0);

}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  id v7;
  _QWORD v8[5];
  _QWORD v9[5];
  objc_super v10;

  height = a3.height;
  width = a3.width;
  v10.receiver = self;
  v10.super_class = (Class)MRUControlCenterViewController;
  v7 = a4;
  -[MRUControlCenterViewController viewWillTransitionToSize:withTransitionCoordinator:](&v10, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  v8[4] = self;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __85__MRUControlCenterViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v9[3] = &unk_1E5819C40;
  v9[4] = self;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __85__MRUControlCenterViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_3;
  v8[3] = &unk_1E5819C40;
  objc_msgSend(v7, "animateAlongsideTransition:completion:", v9, v8);

}

uint64_t __85__MRUControlCenterViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v4[5];
  CAFrameRateRange v5;

  v2 = (void *)MEMORY[0x1E0DC3F10];
  v5 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __85__MRUControlCenterViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_2;
  v4[3] = &unk_1E5818C88;
  v4[4] = *(_QWORD *)(a1 + 32);
  return objc_msgSend(v2, "_modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:", 1966081, v4, *(double *)&v5.minimum, *(double *)&v5.maximum, *(double *)&v5.preferred);
}

void __85__MRUControlCenterViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setTransitioning:", 1);

  objc_msgSend(*(id *)(a1 + 32), "setState:", objc_msgSend(*(id *)(a1 + 32), "pendingState"));
  objc_msgSend(*(id *)(a1 + 32), "view");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "layoutIfNeeded");

}

uint64_t __85__MRUControlCenterViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_3(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setTransitioning:", 0);

  return objc_msgSend(*(id *)(a1 + 32), "updateNowPlayingControllers");
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)setOnScreen:(BOOL)a3
{
  void *v3;
  _BOOL4 v4;
  uint64_t v6;
  void *v7;
  void *v8;

  if (self->_onScreen != a3)
  {
    v4 = a3;
    self->_onScreen = a3;
    if (a3)
    {
      -[MRUControlCenterViewController view](self, "view");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v3, "showRoutingButton");
    }
    else
    {
      v6 = 0;
    }
    -[MRUControlCenterViewController view](self, "view");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "routingButton");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setOnScreen:", v6);

    if (v4)
    -[MRUControlCenterViewController updateDiscoveryMode](self, "updateDiscoveryMode");
  }
}

- (void)setState:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  -[MRUControlCenterViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setState:", a3);

  -[MRUControlCenterViewController updateNowPlayingViewControllerLayout](self, "updateNowPlayingViewControllerLayout");
  -[MRUControlCenterViewController updateDiscoveryMode](self, "updateDiscoveryMode");
  -[MRUControlCenterViewController alertViewController](self, "alertViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (a3 != 1 && v6)
    -[MRUControlCenterViewController setAlertViewController:](self, "setAlertViewController:", 0);
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[NSMutableDictionary allValues](self->_nowPlayingControllers, "allValues", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");

  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v14;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v14 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v12++), "updateAutomaticResponseLoading");
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v10);
  }

  (*((void (**)(id, BOOL))self->_homeGestureDismissalAllowedBlock + 2))(self->_homeGestureDismissalAllowedBlock, a3 != 0);
}

- (id)selectedIdentifier
{
  void *v2;
  void *v3;

  -[MRUNowPlayingViewController controller](self->_nowPlayingViewController, "controller");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)setAlertViewController:(id)a3
{
  UIViewController *v5;
  UIViewController *alertViewController;
  UIViewController *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  UIViewController *v13;
  _QWORD v14[4];
  UIViewController *v15;
  UIViewController *v16;
  MRUControlCenterViewController *v17;
  _QWORD v18[4];
  UIViewController *v19;
  MRUControlCenterViewController *v20;
  UIViewController *v21;

  v5 = (UIViewController *)a3;
  alertViewController = self->_alertViewController;
  if (alertViewController != v5)
  {
    v7 = alertViewController;
    objc_storeStrong((id *)&self->_alertViewController, a3);
    -[UIViewController willMoveToParentViewController:](v7, "willMoveToParentViewController:", 0);
    -[UIViewController beginAppearanceTransition:animated:](v7, "beginAppearanceTransition:animated:", 0, 1);
    if (v5)
    {
      -[MRUControlCenterViewController addChildViewController:](self, "addChildViewController:", v5);
      -[UIViewController view](v5, "view");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[MRUControlCenterViewController view](self, "view");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setAlertView:", v8);

      -[MRUControlCenterViewController view](self, "view");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "layoutIfNeeded");
    }
    else
    {
      -[MRUControlCenterViewController view](self, "view");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setAlertView:", 0);
    }

    v11 = (void *)MEMORY[0x1E0DC3F10];
    v12 = MEMORY[0x1E0C809B0];
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __57__MRUControlCenterViewController_setAlertViewController___block_invoke;
    v18[3] = &unk_1E5819160;
    v19 = v7;
    v20 = self;
    v21 = v5;
    v14[0] = v12;
    v14[1] = 3221225472;
    v14[2] = __57__MRUControlCenterViewController_setAlertViewController___block_invoke_2;
    v14[3] = &unk_1E5819188;
    v15 = v19;
    v16 = v21;
    v17 = self;
    v13 = v19;
    objc_msgSend(v11, "mru_animateUsingType:animations:completion:", 0, v18, v14);

  }
}

void __57__MRUControlCenterViewController_setAlertViewController___block_invoke(uint64_t a1)
{
  void *v2;
  _BOOL8 v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAlpha:", 0.0);

  v3 = *(_QWORD *)(a1 + 48) != 0;
  objc_msgSend(*(id *)(a1 + 40), "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setShowAlertView:", v3);

  objc_msgSend(*(id *)(a1 + 40), "view");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "layoutIfNeeded");

}

uint64_t __57__MRUControlCenterViewController_setAlertViewController___block_invoke_2(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeFromSuperview");

  objc_msgSend(*(id *)(a1 + 32), "removeFromParentViewController");
  objc_msgSend(*(id *)(a1 + 32), "endAppearanceTransition");
  return objc_msgSend(*(id *)(a1 + 40), "didMoveToParentViewController:", *(_QWORD *)(a1 + 48));
}

- (void)dismiss
{
  -[MRUControlCenterViewController dismissWithCompletion:](self, "dismissWithCompletion:", 0);
}

- (void)didSelectRoutingButton:(id)a3
{
  if (self->_routingCornerViewTappedBlock)
  {
    self->_pendingNowPlayingExpandedLayout = 1;
    (*((void (**)(void))self->_routingCornerViewTappedBlock + 2))();
  }
}

- (void)didSelectListState:(id)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __53__MRUControlCenterViewController_didSelectListState___block_invoke;
  v3[3] = &unk_1E5818C88;
  v3[4] = self;
  -[MRUControlCenterViewController transitionToState:completion:](self, "transitionToState:completion:", 2, v3);
}

uint64_t __53__MRUControlCenterViewController_didSelectListState___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateNowPlayingControllers");
}

- (void)didSelectQuickControl:(id)a3
{
  NSMutableDictionary *nowPlayingControllers;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  nowPlayingControllers = self->_nowPlayingControllers;
  objc_msgSend(a3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](nowPlayingControllers, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "quickControlItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "mainAction");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  v7 = v8;
  if (v8)
  {
    (*((void (**)(id))v8 + 2))(v8);
    v7 = v8;
  }

}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  id location;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "deselectItemAtIndexPath:animated:", v7, 0);
  -[UICollectionViewDiffableDataSource itemIdentifierForIndexPath:](self->_dataSource, "itemIdentifierForIndexPath:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](self->_nowPlayingControllers, "objectForKeyedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "endpointController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "route");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_initWeak(&location, self);
  objc_msgSend(v9, "endpointController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __74__MRUControlCenterViewController_collectionView_didSelectItemAtIndexPath___block_invoke;
  v15[3] = &unk_1E58191B0;
  objc_copyWeak(&v18, &location);
  v13 = v9;
  v16 = v13;
  v14 = v11;
  v17 = v14;
  objc_msgSend(v12, "connectAllowingAuthenticationWithCompletion:", v15);

  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);

}

void __74__MRUControlCenterViewController_collectionView_didSelectItemAtIndexPath___block_invoke(uint64_t a1, int a2)
{
  id WeakRetained;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[4];
  id v11;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v5 = WeakRetained;
  if (a2)
  {
    v6 = *(_QWORD *)(a1 + 32);
    objc_msgSend(WeakRetained, "nowPlayingViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setController:", v6);

    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D4C608]), "initWithName:requestID:reason:userInitiated:", CFSTR("collectionView:didSelectItemAtIndexPath:"), 0, CFSTR("User selected active system endpoint"), 1);
    objc_msgSend(v5, "endpointsManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setActiveSystemRoute:requestDetails:", *(_QWORD *)(a1 + 40), v8);

    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __74__MRUControlCenterViewController_collectionView_didSelectItemAtIndexPath___block_invoke_2;
    v10[3] = &unk_1E5818C88;
    v11 = v5;
    objc_msgSend(v11, "transitionToState:completion:", 1, v10);

  }
}

uint64_t __74__MRUControlCenterViewController_collectionView_didSelectItemAtIndexPath___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateNowPlayingControllers");
}

- (void)endpointsManager:(id)a3 activeSystemRouteDidChange:(id)a4
{
  -[MRUControlCenterViewController updateSelectedViewController](self, "updateSelectedViewController", a3, a4);
  -[MRUControlCenterViewController updateDiscoveryMode](self, "updateDiscoveryMode");
  -[MRUControlCenterViewController updateRoutingButtonWithReason:](self, "updateRoutingButtonWithReason:", CFSTR("activeSystemRouteDidChange"));
}

- (void)endpointsManager:(id)a3 defersRoutesReplacement:(id)a4
{
  void *v5;
  id replaceRoutes;
  void *v7;
  char v8;

  v5 = _Block_copy(a4);
  replaceRoutes = self->_replaceRoutes;
  self->_replaceRoutes = v5;

  -[MRUControlCenterViewController view](self, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isTransitioning");

  if ((v8 & 1) == 0)
    -[MRUControlCenterViewController updateNowPlayingControllers](self, "updateNowPlayingControllers");
}

- (void)nowPlayingViewController:(id)a3 didChangeSizeWithAnimations:(id)a4 completion:(id)a5
{
  void (**v7)(_QWORD);
  void (**v8)(_QWORD);
  void *v9;
  void *v10;
  char v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  _QWORD v20[4];
  void (**v21)(_QWORD);
  _QWORD v22[5];
  void (**v23)(_QWORD);
  _QWORD v24[4];
  void (**v25)(_QWORD);
  _QWORD v26[5];
  void (**v27)(_QWORD);

  v7 = (void (**)(_QWORD))a4;
  v8 = (void (**)(_QWORD))a5;
  -[MRUControlCenterViewController view](self, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "state") == 1)
  {
    -[MRUControlCenterViewController view](self, "view");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "isTransitioning");

    if ((v11 & 1) == 0)
    {
      v12 = (void *)MEMORY[0x1E0DC3F10];
      v13 = MEMORY[0x1E0C809B0];
      v26[0] = MEMORY[0x1E0C809B0];
      v26[1] = 3221225472;
      v26[2] = __98__MRUControlCenterViewController_nowPlayingViewController_didChangeSizeWithAnimations_completion___block_invoke;
      v26[3] = &unk_1E58194F0;
      v26[4] = self;
      v27 = v7;
      v24[0] = v13;
      v24[1] = 3221225472;
      v24[2] = __98__MRUControlCenterViewController_nowPlayingViewController_didChangeSizeWithAnimations_completion___block_invoke_2;
      v24[3] = &unk_1E581A558;
      v25 = v8;
      objc_msgSend(v12, "mru_animateUsingType:animations:completion:", 0, v26, v24);

      v14 = v27;
LABEL_7:

      goto LABEL_12;
    }
  }
  else
  {

  }
  -[MRUControlCenterViewController transitionCoordinator](self, "transitionCoordinator");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    -[MRUControlCenterViewController transitionCoordinator](self, "transitionCoordinator");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = MEMORY[0x1E0C809B0];
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __98__MRUControlCenterViewController_nowPlayingViewController_didChangeSizeWithAnimations_completion___block_invoke_3;
    v22[3] = &unk_1E581A580;
    v22[4] = self;
    v23 = v7;
    v20[0] = v17;
    v20[1] = 3221225472;
    v20[2] = __98__MRUControlCenterViewController_nowPlayingViewController_didChangeSizeWithAnimations_completion___block_invoke_4;
    v20[3] = &unk_1E581A5A8;
    v21 = v8;
    objc_msgSend(v16, "animateAlongsideTransition:completion:", v22, v20);

    v14 = v23;
    goto LABEL_7;
  }
  if (v7)
    v7[2](v7);
  -[MRUControlCenterViewController view](self, "view");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setNeedsLayout");

  -[MRUControlCenterViewController view](self, "view");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "layoutIfNeeded");

  if (v8)
    v8[2](v8);
LABEL_12:

}

void __98__MRUControlCenterViewController_nowPlayingViewController_didChangeSizeWithAnimations_completion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;

  v2 = *(_QWORD *)(a1 + 40);
  if (v2)
    (*(void (**)(void))(v2 + 16))();
  objc_msgSend(*(id *)(a1 + 32), "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setNeedsLayout");

  objc_msgSend(*(id *)(a1 + 32), "view");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "layoutIfNeeded");

}

uint64_t __98__MRUControlCenterViewController_nowPlayingViewController_didChangeSizeWithAnimations_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __98__MRUControlCenterViewController_nowPlayingViewController_didChangeSizeWithAnimations_completion___block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;

  v2 = *(_QWORD *)(a1 + 40);
  if (v2)
    (*(void (**)(void))(v2 + 16))();
  objc_msgSend(*(id *)(a1 + 32), "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setNeedsLayout");

  objc_msgSend(*(id *)(a1 + 32), "view");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "layoutIfNeeded");

}

uint64_t __98__MRUControlCenterViewController_nowPlayingViewController_didChangeSizeWithAnimations_completion___block_invoke_4(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)nowPlayingViewController:(id)a3 applyLayout:(int64_t)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  MRUControlCenterViewController *v13;
  int64_t v14;

  v6 = a3;
  -[MRUControlCenterViewController view](self, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "state");

  if (!a4 || v8)
  {
    -[MRUControlCenterViewController view](self, "view");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setNeedsLayout");

    v10 = (void *)MEMORY[0x1E0DC3F10];
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __71__MRUControlCenterViewController_nowPlayingViewController_applyLayout___block_invoke;
    v11[3] = &unk_1E58192F0;
    v13 = self;
    v14 = a4;
    v12 = v6;
    objc_msgSend(v10, "mru_animateUsingType:animations:", 0, v11);

  }
  else if (self->_routingCornerViewTappedBlock)
  {
    self->_pendingNowPlayingExpandedLayout = a4;
    (*((void (**)(void))self->_routingCornerViewTappedBlock + 2))();
  }

}

void __71__MRUControlCenterViewController_nowPlayingViewController_applyLayout___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "setLayout:", *(_QWORD *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 40), "view");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "layoutIfNeeded");

}

- (void)nowPlayingViewController:(id)a3 showViewController:(id)a4
{
  -[MRUControlCenterViewController setAlertViewController:](self, "setAlertViewController:", a4);
}

- (BOOL)nowPlayingControllerShouldAutomaticallyUpdateResponse:(id)a3
{
  void *v3;
  BOOL v4;

  -[MRUControlCenterViewController view](self, "view", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "state") != 0;

  return v4;
}

- (void)nowPlayingController:(id)a3 endpointController:(id)a4 didChangeRoute:(id)a5
{
  id v6;
  void *v7;
  id v8;

  v6 = a3;
  objc_msgSend(v6, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRUControlCenterViewController updateCellForIdentifier:](self, "updateCellForIdentifier:", v7);

  -[MRUNowPlayingViewController controller](self->_nowPlayingViewController, "controller");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (v8 == v6)
    -[MRUControlCenterViewController updateRoutingButtonWithReason:](self, "updateRoutingButtonWithReason:", CFSTR("didChangeRoute"));
}

- (void)nowPlayingController:(id)a3 metadataController:(id)a4 didChangeArtwork:(id)a5
{
  id v6;

  objc_msgSend(a3, "identifier");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[MRUControlCenterViewController updateCellForIdentifier:](self, "updateCellForIdentifier:", v6);

}

- (void)nowPlayingController:(id)a3 metadataController:(id)a4 didChangeNowPlayingInfo:(id)a5
{
  id v6;

  objc_msgSend(a3, "identifier");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[MRUControlCenterViewController updateCellForIdentifier:](self, "updateCellForIdentifier:", v6);

}

- (void)nowPlayingController:(id)a3 didChangeQuickControlItem:(id)a4
{
  id v5;

  objc_msgSend(a3, "identifier");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[MRUControlCenterViewController updateCellForIdentifier:](self, "updateCellForIdentifier:", v5);

}

- (double)preferredExpandedContentHeight
{
  void *v2;
  void *v3;
  double Height;
  CGRect v6;

  -[MRUControlCenterViewController view](self, "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  Height = CGRectGetHeight(v6);

  return Height;
}

- (double)preferredExpandedContentWidth
{
  void *v3;
  _BOOL8 ShouldBeVertical;
  double Width;
  void *v6;
  void *v7;
  CGRect v9;

  -[MRUControlCenterViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  ShouldBeVertical = MRULayoutShouldBeVertical();
  if (ShouldBeVertical)
  {
    Width = MRUDefaultExpandedWidth(ShouldBeVertical);
  }
  else
  {
    -[MRUControlCenterViewController view](self, "view");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "window");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "bounds");
    Width = CGRectGetWidth(v9);

  }
  return Width;
}

- (void)setCompactContinuousCornerRadius:(double)a3
{
  id v3;

  if (self->_compactContinuousCornerRadius != a3)
  {
    self->_compactContinuousCornerRadius = a3;
    -[MRUControlCenterViewController viewIfLoaded](self, "viewIfLoaded");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setNeedsLayout");

  }
}

- (BOOL)providesOwnPlatter
{
  return 1;
}

- (BOOL)shouldPerformHoverInteraction
{
  return 0;
}

- (BOOL)shouldExpandModuleOnTouch:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;

  v4 = a3;
  -[MRUControlCenterViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "routingButton");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "locationInView:", v6);
  v8 = v7;
  v10 = v9;

  LOBYTE(v5) = objc_msgSend(v6, "pointInside:withEvent:", 0, v8, v10) ^ 1;
  return (char)v5;
}

- (BOOL)canDismissPresentedContent
{
  void *v2;
  BOOL v3;

  -[MRUControlCenterViewController view](self, "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "state") == 2;

  return v3;
}

- (void)willTransitionToExpandedContentMode:(BOOL)a3
{
  self->_pendingState = a3;
}

- (void)dismissPresentedContentAnimated:(BOOL)a3 completion:(id)a4
{
  if (a3)
    -[MRUControlCenterViewController transitionToState:completion:](self, "transitionToState:completion:", 1, a4);
  else
    -[MRUControlCenterViewController setState:](self, "setState:", 1, a4);
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  BOOL v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  void *v25;
  void *v26;
  CGPoint v28;
  CGPoint v29;
  CGRect v30;
  CGRect v31;

  v5 = a4;
  -[MRUControlCenterViewController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "state");

  if (v7 == 2)
  {
    -[MRUControlCenterViewController view](self, "view");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "collectionView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "locationInView:", v19);
    v21 = v20;
    v23 = v22;

    -[MRUControlCenterViewController view](self, "view");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "collectionView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "indexPathForItemAtPoint:", v21, v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(self) = v24 == 0;

LABEL_10:
    goto LABEL_11;
  }
  if (v7 == 1)
  {
    -[MRUControlCenterViewController view](self, "view");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "locationInView:", v8);
    v10 = v9;
    v12 = v11;

    -[MRUControlCenterViewController view](self, "view");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "showMoreButton");

    -[MRUControlCenterViewController view](self, "view");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "containerView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "frame");
    v28.x = v10;
    v28.y = v12;
    v17 = CGRectContainsPoint(v30, v28);
    if (v14)
    {
      if (v17)
      {
        LOBYTE(self) = 0;
      }
      else
      {
        -[MRUControlCenterViewController view](self, "view");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "moreButton");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "frame");
        v29.x = v10;
        v29.y = v12;
        LODWORD(self) = !CGRectContainsPoint(v31, v29);

      }
    }
    else
    {
      LOBYTE(self) = !v17;
    }
    goto LABEL_10;
  }
  LOBYTE(self) = 0;
LABEL_11:

  return (char)self;
}

- (void)createNowPlayingViewController
{
  MRUNowPlayingViewController *v3;
  MRUNowPlayingViewController *nowPlayingViewController;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t, void *);
  void *v12;
  id v13;
  id location;

  v3 = objc_alloc_init(MRUNowPlayingViewController);
  nowPlayingViewController = self->_nowPlayingViewController;
  self->_nowPlayingViewController = v3;

  -[MRUNowPlayingViewController setShowArtworkView:](self->_nowPlayingViewController, "setShowArtworkView:", 1);
  -[MRUNowPlayingViewController setDelegate:](self->_nowPlayingViewController, "setDelegate:", self);
  -[MRUNowPlayingViewController setPlaybackDataSource:](self->_nowPlayingViewController, "setPlaybackDataSource:", self->_endpointsManager);
  -[MRUControlCenterViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stylingProvider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRUNowPlayingViewController setStylingProvider:](self->_nowPlayingViewController, "setStylingProvider:", v6);

  -[MRUNowPlayingViewController setContext:](self->_nowPlayingViewController, "setContext:", 1);
  -[MRUNowPlayingViewController setSupportsHorizontalLayout:](self->_nowPlayingViewController, "setSupportsHorizontalLayout:", 1);
  -[MRUNowPlayingViewController setContentEdgeInsets:](self->_nowPlayingViewController, "setContentEdgeInsets:", 24.0, 24.0, 24.0, 24.0);
  objc_initWeak(&location, self);
  v9 = MEMORY[0x1E0C809B0];
  v10 = 3221225472;
  v11 = __64__MRUControlCenterViewController_createNowPlayingViewController__block_invoke;
  v12 = &unk_1E581A5D0;
  objc_copyWeak(&v13, &location);
  -[MRUNowPlayingViewController setCoordinatedDismissalBlock:](self->_nowPlayingViewController, "setCoordinatedDismissalBlock:", &v9);
  -[MRUControlCenterViewController addChildViewController:](self, "addChildViewController:", self->_nowPlayingViewController, v9, v10, v11, v12);
  -[MRUNowPlayingViewController view](self->_nowPlayingViewController, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRUControlCenterViewController view](self, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setContentView:", v7);

  -[MRUNowPlayingViewController didMoveToParentViewController:](self->_nowPlayingViewController, "didMoveToParentViewController:", self);
  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

void __64__MRUControlCenterViewController_createNowPlayingViewController__block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "dismissWithCompletion:", v3);

}

- (void)updateNowPlayingControllers
{
  uint64_t (**replaceRoutes)(id, SEL);
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  __int128 v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  MRUEndpointController *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  MRUNowPlayingController *v28;
  uint64_t v29;
  void *v30;
  NSMutableDictionary *nowPlayingControllers;
  void *v32;
  id v33;
  UICollectionViewDiffableDataSource *dataSource;
  __int128 v35;
  uint64_t v36;
  _QWORD v37[5];
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  uint8_t buf[4];
  uint64_t v43;
  __int16 v44;
  void *v45;
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  replaceRoutes = (uint64_t (**)(id, SEL))self->_replaceRoutes;
  if (replaceRoutes)
  {
    v4 = (id)replaceRoutes[2](replaceRoutes, a2);
    v5 = self->_replaceRoutes;
    self->_replaceRoutes = 0;

  }
  v6 = (void *)MEMORY[0x1E0C99DE8];
  -[MediaControlsEndpointsManager routes](self->_endpointsManager, "routes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "arrayWithCapacity:", objc_msgSend(v7, "count"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)MEMORY[0x1E0C99E20];
  -[NSMutableDictionary allKeys](self->_nowPlayingControllers, "allKeys");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setWithArray:", v10);
  v11 = objc_claimAutoreleasedReturnValue();

  v12 = (void *)v11;
  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  -[MediaControlsEndpointsManager routes](self->_endpointsManager, "routes");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v38, v46, 16);
  if (v14)
  {
    v16 = v14;
    v17 = *(_QWORD *)v39;
    *(_QWORD *)&v15 = 138412546;
    v35 = v15;
    do
    {
      v18 = 0;
      v36 = v16;
      do
      {
        if (*(_QWORD *)v39 != v17)
          objc_enumerationMutation(v13);
        v19 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * v18);
        objc_msgSend(v19, "routeUID", v35);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        if (v20)
        {
          objc_msgSend(v8, "addObject:", v20);
          objc_msgSend(v12, "removeObject:", v20);
          -[NSMutableDictionary objectForKeyedSubscript:](self->_nowPlayingControllers, "objectForKeyedSubscript:", v20);
          v21 = (void *)objc_claimAutoreleasedReturnValue();

          if (v21)
            goto LABEL_14;
          -[MediaControlsEndpointsManager endpointControllerForRoute:](self->_endpointsManager, "endpointControllerForRoute:", v19);
          v22 = objc_claimAutoreleasedReturnValue();
          v23 = -[MRUEndpointController initWithEndpointController:]([MRUEndpointController alloc], "initWithEndpointController:", v22);
          v24 = v17;
          v25 = v13;
          v26 = v12;
          v27 = v8;
          v28 = -[MRUNowPlayingController initWithEndpointController:]([MRUNowPlayingController alloc], "initWithEndpointController:", v23);
          -[MRUNowPlayingController addObserver:](v28, "addObserver:", self);
          -[NSMutableDictionary setObject:forKeyedSubscript:](self->_nowPlayingControllers, "setObject:forKeyedSubscript:", v28, v20);

          v8 = v27;
          v12 = v26;
          v13 = v25;
          v17 = v24;
          v16 = v36;

        }
        else
        {
          MCLogCategoryDefault();
          v22 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
          {
            v29 = objc_opt_class();
            *(_DWORD *)buf = v35;
            v43 = v29;
            v44 = 2112;
            v45 = v19;
            _os_log_impl(&dword_1AA991000, v22, OS_LOG_TYPE_ERROR, "%@ ignoring endpoint route with no routeUID: %@", buf, 0x16u);
          }
        }

LABEL_14:
        ++v18;
      }
      while (v16 != v18);
      v16 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v38, v46, 16);
    }
    while (v16);
  }

  v30 = v12;
  nowPlayingControllers = self->_nowPlayingControllers;
  objc_msgSend(v30, "allObjects");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary removeObjectsForKeys:](nowPlayingControllers, "removeObjectsForKeys:", v32);

  v33 = objc_alloc_init(MEMORY[0x1E0DC3398]);
  objc_msgSend(v33, "appendSectionsWithIdentifiers:", &unk_1E58784F8);
  objc_msgSend(v33, "appendItemsWithIdentifiers:", v8);
  dataSource = self->_dataSource;
  v37[0] = MEMORY[0x1E0C809B0];
  v37[1] = 3221225472;
  v37[2] = __61__MRUControlCenterViewController_updateNowPlayingControllers__block_invoke;
  v37[3] = &unk_1E5818C88;
  v37[4] = self;
  -[UICollectionViewDiffableDataSource applySnapshot:animatingDifferences:completion:](dataSource, "applySnapshot:animatingDifferences:completion:", v33, 1, v37);
  -[MRUControlCenterViewController updateSelectedViewController](self, "updateSelectedViewController");
  -[MRUControlCenterViewController updateMoreButtonVisibility](self, "updateMoreButtonVisibility");
  -[MRUControlCenterViewController updateRoutingDataControllers](self, "updateRoutingDataControllers");

}

void __61__MRUControlCenterViewController_updateNowPlayingControllers__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "view");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "updateCollectionViewContentInset");

}

- (void)updateSelectedViewController
{
  void *v3;
  void *v4;
  char v5;
  void *v6;
  id v7;

  -[MediaControlsEndpointsManager activeSystemRoute](self->_endpointsManager, "activeSystemRoute");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "routeUID");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  -[MRUControlCenterViewController selectedIdentifier](self, "selectedIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", v7);

  if ((v5 & 1) == 0)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_nowPlayingControllers, "objectForKeyedSubscript:", v7);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[MRUNowPlayingViewController setController:](self->_nowPlayingViewController, "setController:", v6);

    -[MRUControlCenterViewController updateRoutingButtonWithReason:](self, "updateRoutingButtonWithReason:", CFSTR("updateSelectedViewController"));
    -[MRUControlCenterViewController updateRoutingDataControllers](self, "updateRoutingDataControllers");
  }

}

- (void)updateRoutingDataControllers
{
  void *v3;
  id v4;

  -[NSMutableDictionary allValues](self->_nowPlayingControllers, "allValues");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[MRUNowPlayingViewController routingViewController](self->_nowPlayingViewController, "routingViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setNowPlayingControllers:", v4);

}

- (void)updateMoreButtonVisibility
{
  void *v3;
  _BOOL8 ShouldBeVertical;
  void *v5;
  uint64_t v6;
  id v7;
  _QWORD v8[5];
  BOOL v9;

  if ((unint64_t)-[NSMutableDictionary count](self->_nowPlayingControllers, "count") < 2)
  {
    ShouldBeVertical = 0;
  }
  else if (MRUIsSmallScreen())
  {
    -[MRUControlCenterViewController view](self, "view");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    ShouldBeVertical = MRULayoutShouldBeVertical();

  }
  else
  {
    ShouldBeVertical = 1;
  }
  if (-[MRUControlCenterViewController isViewLoaded](self, "isViewLoaded"))
  {
    if (self->_onScreen
      && (-[MRUControlCenterViewController view](self, "view"),
          v5 = (void *)objc_claimAutoreleasedReturnValue(),
          v6 = objc_msgSend(v5, "state"),
          v5,
          v6 == 1))
    {
      v8[0] = MEMORY[0x1E0C809B0];
      v8[1] = 3221225472;
      v8[2] = __60__MRUControlCenterViewController_updateMoreButtonVisibility__block_invoke;
      v8[3] = &unk_1E5818D00;
      v8[4] = self;
      v9 = ShouldBeVertical;
      objc_msgSend(MEMORY[0x1E0DC3F10], "mru_animateUsingType:animations:", 0, v8);
    }
    else
    {
      -[MRUControlCenterViewController view](self, "view");
      v7 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setShowMoreButton:", ShouldBeVertical);

    }
  }
}

void __60__MRUControlCenterViewController_updateMoreButtonVisibility__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;

  v2 = *(unsigned __int8 *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setShowMoreButton:", v2);

  objc_msgSend(*(id *)(a1 + 32), "view");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "layoutIfNeeded");

}

- (void)updateDiscoveryMode
{
  void *v3;
  uint64_t v4;
  uint64_t v5;

  if (!self->_onScreen)
  {
LABEL_6:
    v5 = 0;
    goto LABEL_7;
  }
  -[MRUControlCenterViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "state");

  if (!v4)
  {
    if (self->_onScreen
      && !-[MediaControlsEndpointsManager isActiveSystemEndpointEqualToLocalEndpoint](self->_endpointsManager, "isActiveSystemEndpointEqualToLocalEndpoint"))
    {
      v5 = 1;
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  v5 = 3;
LABEL_7:
  -[MediaControlsEndpointsManager setDiscoveryMode:](self->_endpointsManager, "setDiscoveryMode:", v5);
}

- (void)updateCellForIdentifier:(id)a3
{
  UICollectionViewDiffableDataSource *dataSource;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  dataSource = self->_dataSource;
  v5 = a3;
  -[UICollectionViewDiffableDataSource indexPathForItemIdentifier:](dataSource, "indexPathForItemIdentifier:", v5);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[MRUControlCenterViewController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "collectionView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "cellForItemAtIndexPath:", v9);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[MRUControlCenterViewController updateCell:forIdentifier:](self, "updateCell:forIdentifier:", v8, v5);
}

- (void)updateCell:(id)a3 forIdentifier:(id)a4
{
  NSMutableDictionary *nowPlayingControllers;
  id v6;
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
  id v35;

  nowPlayingControllers = self->_nowPlayingControllers;
  v6 = a3;
  -[NSMutableDictionary objectForKeyedSubscript:](nowPlayingControllers, "objectForKeyedSubscript:", a4);
  v35 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "endpointController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "route");
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v35, "metadataController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "artwork");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v35, "metadataController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "nowPlayingInfo");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v35, "quickControlItem");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "cellContentView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "artworkView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "cellContentView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "headerView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "cellContentView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "headerView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "labelView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "setArtwork:", v9);
  v20 = (void *)MEMORY[0x1E0DC3870];
  objc_msgSend(v35, "deviceSymbolName");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "_systemImageNamed:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setPlaceholderImage:", v22);

  objc_msgSend(v19, "setRoute:", v33);
  objc_msgSend(v11, "stringForComponents:", 59);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setTitle:", v23);

  objc_msgSend(v11, "placeholder");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setPlaceholder:", v24);

  objc_msgSend(v19, "setShowPlaceholder:", objc_msgSend(v11, "showPlaceholder"));
  objc_msgSend(v35, "identifier");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "transportButton");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setIdentifier:", v25);

  objc_msgSend(v16, "setShowTransportButton:", objc_msgSend(v12, "isEnabled"));
  objc_msgSend(v16, "transportButton");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "asset");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setAsset:", v28);

  objc_msgSend(v16, "transportButton");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "addTarget:action:forEvents:", self, sel_didSelectQuickControl_, 64);

  -[MRUControlCenterViewController view](self, "view");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "stylingProvider");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "cellContentView");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "setStylingProvider:", v31);

  objc_msgSend(v6, "setContentEdgeInsets:", 24.0, 24.0, 24.0, 24.0);
  CCUIExpandedModuleContinuousCornerRadius();
  objc_msgSend(v6, "setCornerRadius:");

}

- (void)updateVisibilityForActiveCell:(BOOL)a3 inActiveCells:(BOOL)a4
{
  UICollectionViewDiffableDataSource *dataSource;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _OWORD *v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  __int128 v20;
  CGAffineTransform *v21;
  void *v22;
  _BOOL8 v23;
  uint64_t v24;
  uint64_t v25;
  __int128 v26;
  _BOOL4 v27;
  id obj;
  _BOOL4 v29;
  CGAffineTransform v30;
  CGAffineTransform v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  uint64_t v37;

  v29 = a4;
  v27 = a3;
  v37 = *MEMORY[0x1E0C80C00];
  dataSource = self->_dataSource;
  -[MRUControlCenterViewController selectedIdentifier](self, "selectedIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UICollectionViewDiffableDataSource indexPathForItemIdentifier:](dataSource, "indexPathForItemIdentifier:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  -[MRUControlCenterViewController view](self, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "collectionView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "visibleCells");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  obj = v10;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v33;
    v14 = (_OWORD *)MEMORY[0x1E0C9BAA8];
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v33 != v13)
          objc_enumerationMutation(obj);
        v16 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
        -[MRUControlCenterViewController view](self, "view");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "collectionView");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "indexPathForCell:", v16);
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v19, "isEqual:", v7))
        {
          v20 = v14[1];
          *(_OWORD *)&v31.a = *v14;
          *(_OWORD *)&v31.c = v20;
          *(_OWORD *)&v31.tx = v14[2];
          v21 = &v31;
          v22 = v16;
          v23 = v27;
        }
        else
        {
          v24 = objc_msgSend(v19, "item");
          v25 = objc_msgSend(v7, "item");
          memset(&v31, 0, sizeof(v31));
          if (v29)
          {
            v26 = v14[1];
            *(_OWORD *)&v31.a = *v14;
            *(_OWORD *)&v31.c = v26;
            *(_OWORD *)&v31.tx = v14[2];
          }
          else
          {
            CGAffineTransformMakeTranslation(&v31, 0.0, (double)(200 * (v24 - v25)));
          }
          v30 = v31;
          v21 = &v30;
          v22 = v16;
          v23 = v29;
        }
        objc_msgSend(v22, "setTransitionTransform:isVisible:", v21, v23);

      }
      v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
    }
    while (v12);
  }

}

- (void)updateNowPlayingViewControllerLayout
{
  void *v3;
  uint64_t v4;
  MRUNowPlayingViewController *nowPlayingViewController;
  uint64_t v6;
  int64_t pendingNowPlayingExpandedLayout;

  -[MRUControlCenterViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "state");

  if (v4 == 2)
  {
    nowPlayingViewController = self->_nowPlayingViewController;
    v6 = 3;
LABEL_6:
    -[MRUNowPlayingViewController setLayout:](nowPlayingViewController, "setLayout:", v6);
    return;
  }
  if (v4 != 1)
  {
    if (v4)
      return;
    nowPlayingViewController = self->_nowPlayingViewController;
    v6 = 0;
    goto LABEL_6;
  }
  if (self->_pendingNowPlayingExpandedLayout == 0x7FFFFFFFFFFFFFFFLL)
    pendingNowPlayingExpandedLayout = 2;
  else
    pendingNowPlayingExpandedLayout = self->_pendingNowPlayingExpandedLayout;
  -[MRUNowPlayingViewController setLayout:](self->_nowPlayingViewController, "setLayout:", pendingNowPlayingExpandedLayout);
  self->_pendingNowPlayingExpandedLayout = 0x7FFFFFFFFFFFFFFFLL;
}

- (void)updateRoutingButtonWithReason:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  int v15;
  uint64_t v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  MCLogCategoryDefault();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v15 = 138543618;
    v16 = objc_opt_class();
    v17 = 2112;
    v18 = v4;
    _os_log_impl(&dword_1AA991000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ updateRoutingButtonWithReason:%@", (uint8_t *)&v15, 0x16u);
  }

  -[MRUNowPlayingViewController controller](self->_nowPlayingViewController, "controller");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "endpointController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "route");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "canModifyGroupMembership");

  -[MRUControlCenterViewController view](self, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setShowRoutingButton:", v9);

  if ((_DWORD)v9)
  {
    -[MRUControlCenterViewController view](self, "view");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "routingButton");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v7, "isDeviceSystemRoute"))
      v13 = objc_msgSend(v7, "isAirPlaying");
    else
      v13 = 1;
    objc_msgSend(v7, "route");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setRoute:showRouteLabel:", v14, v13);

  }
}

- (void)transitionToState:(int64_t)a3 completion:(id)a4
{
  void (**v6)(_QWORD);
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  UICollectionViewDiffableDataSource *dataSource;
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
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  void *v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  void *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  void *v46;
  UICollectionViewDiffableDataSource *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  void *v61;
  double v62;
  double v63;
  double v64;
  double v65;
  double v66;
  double v67;
  double v68;
  double v69;
  void *v70;
  void *v71;
  void *v72;
  _QWORD v73[5];
  void (**v74)(_QWORD);
  _QWORD v75[5];
  _QWORD v76[5];
  void (**v77)(_QWORD);
  _QWORD v78[5];

  v6 = (void (**)(_QWORD))a4;
  -[MRUControlCenterViewController view](self, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "state");

  -[MRUControlCenterViewController view](self, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (a3 == 2 && v8 == 1)
  {
    objc_msgSend(v9, "setTransitioning:", 1);

    -[MRUControlCenterViewController view](self, "view");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "collectionViewLayout");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "invalidateLayout");

    dataSource = self->_dataSource;
    -[MRUControlCenterViewController selectedIdentifier](self, "selectedIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[UICollectionViewDiffableDataSource indexPathForItemIdentifier:](dataSource, "indexPathForItemIdentifier:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    -[MRUControlCenterViewController view](self, "view");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "collectionView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "scrollToItemAtIndexPath:atScrollPosition:animated:", v15, 2, 0);

    -[MRUControlCenterViewController view](self, "view");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "collectionView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "layoutIfNeeded");

    -[MRUControlCenterViewController view](self, "view");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "collectionView");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "cellForItemAtIndexPath:", v15);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    -[MRUControlCenterViewController view](self, "view");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "collectionView");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "frame");
    v26 = v25;
    v28 = v27;
    v30 = v29;
    v32 = v31;
    -[MRUControlCenterViewController view](self, "view");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "convertRect:toView:", v33, v26, v28, v30, v32);
    v35 = v34;
    v37 = v36;
    v39 = v38;
    v41 = v40;
    -[MRUControlCenterViewController view](self, "view");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "setTransitionFrame:", v35, v37, v39, v41);

    -[MRUControlCenterViewController updateVisibilityForActiveCell:inActiveCells:](self, "updateVisibilityForActiveCell:inActiveCells:", 0, 0);
    v43 = (void *)MEMORY[0x1E0DC3F10];
    v78[0] = MEMORY[0x1E0C809B0];
    v78[1] = 3221225472;
    v78[2] = __63__MRUControlCenterViewController_transitionToState_completion___block_invoke;
    v78[3] = &unk_1E5818C88;
    v78[4] = self;
    v76[0] = MEMORY[0x1E0C809B0];
    v76[1] = 3221225472;
    v76[2] = __63__MRUControlCenterViewController_transitionToState_completion___block_invoke_2;
    v76[3] = &unk_1E5819D58;
    v76[4] = self;
    v77 = v6;
    objc_msgSend(v43, "mru_animateUsingType:animations:completion:", 0, v78, v76);
    v44 = v77;
LABEL_7:

    goto LABEL_8;
  }
  v45 = objc_msgSend(v9, "state");

  if (a3 == 1 && v45 == 2)
  {
    -[MRUControlCenterViewController view](self, "view");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "setTransitioning:", 1);

    v47 = self->_dataSource;
    -[MRUControlCenterViewController selectedIdentifier](self, "selectedIdentifier");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    -[UICollectionViewDiffableDataSource indexPathForItemIdentifier:](v47, "indexPathForItemIdentifier:", v48);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    -[MRUControlCenterViewController view](self, "view");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "collectionView");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "cellForItemAtIndexPath:", v15);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    -[MRUControlCenterViewController view](self, "view");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "collectionView");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "frame");
    v54 = v53;
    v56 = v55;
    v58 = v57;
    v60 = v59;
    -[MRUControlCenterViewController view](self, "view");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "convertRect:toView:", v61, v54, v56, v58, v60);
    v63 = v62;
    v65 = v64;
    v67 = v66;
    v69 = v68;
    -[MRUControlCenterViewController view](self, "view");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v70, "setTransitionFrame:", v63, v65, v67, v69);

    -[MRUControlCenterViewController view](self, "view");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v71, "layoutIfNeeded");

    -[MRUControlCenterViewController updateVisibilityForActiveCell:inActiveCells:](self, "updateVisibilityForActiveCell:inActiveCells:", 0, 1);
    v72 = (void *)MEMORY[0x1E0DC3F10];
    v75[0] = MEMORY[0x1E0C809B0];
    v75[1] = 3221225472;
    v75[2] = __63__MRUControlCenterViewController_transitionToState_completion___block_invoke_3;
    v75[3] = &unk_1E5818C88;
    v75[4] = self;
    v73[0] = MEMORY[0x1E0C809B0];
    v73[1] = 3221225472;
    v73[2] = __63__MRUControlCenterViewController_transitionToState_completion___block_invoke_4;
    v73[3] = &unk_1E5819D58;
    v73[4] = self;
    v74 = v6;
    objc_msgSend(v72, "mru_animateUsingType:animations:completion:", 0, v75, v73);
    v44 = v74;
    goto LABEL_7;
  }
  -[MRUControlCenterViewController setState:](self, "setState:", a3);
  if (v6)
    v6[2](v6);
LABEL_8:

}

void __63__MRUControlCenterViewController_transitionToState_completion___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "setState:", 2);
  objc_msgSend(*(id *)(a1 + 32), "updateVisibilityForActiveCell:inActiveCells:", 0, 1);
  objc_msgSend(*(id *)(a1 + 32), "view");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "layoutIfNeeded");

}

uint64_t __63__MRUControlCenterViewController_transitionToState_completion___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "updateVisibilityForActiveCell:inActiveCells:", 1, 1);
  objc_msgSend(*(id *)(a1 + 32), "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setTransitioning:", 0);

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __63__MRUControlCenterViewController_transitionToState_completion___block_invoke_3(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "setState:", 1);
  objc_msgSend(*(id *)(a1 + 32), "updateVisibilityForActiveCell:inActiveCells:", 0, 0);
  objc_msgSend(*(id *)(a1 + 32), "view");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "layoutIfNeeded");

}

uint64_t __63__MRUControlCenterViewController_transitionToState_completion___block_invoke_4(uint64_t a1)
{
  void *v2;
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "updateVisibilityForActiveCell:inActiveCells:", 1, 1);
  objc_msgSend(*(id *)(a1 + 32), "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setTransitioning:", 0);

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)dismissWithCompletion:(id)a3
{
  void (**dismissalBlock)(id, id);

  dismissalBlock = (void (**)(id, id))self->_dismissalBlock;
  if (dismissalBlock)
    dismissalBlock[2](dismissalBlock, a3);
}

- (id)homeGestureDismissalAllowedBlock
{
  return self->_homeGestureDismissalAllowedBlock;
}

- (void)setHomeGestureDismissalAllowedBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 976);
}

- (id)routingCornerViewTappedBlock
{
  return self->_routingCornerViewTappedBlock;
}

- (void)setRoutingCornerViewTappedBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 984);
}

- (id)dismissalBlock
{
  return self->_dismissalBlock;
}

- (void)setDismissalBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 992);
}

- (double)compactContinuousCornerRadius
{
  return self->_compactContinuousCornerRadius;
}

- (MediaControlsEndpointsManager)endpointsManager
{
  return self->_endpointsManager;
}

- (void)setEndpointsManager:(id)a3
{
  objc_storeStrong((id *)&self->_endpointsManager, a3);
}

- (UICollectionViewDiffableDataSource)dataSource
{
  return self->_dataSource;
}

- (void)setDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_dataSource, a3);
}

- (NSMutableDictionary)nowPlayingControllers
{
  return self->_nowPlayingControllers;
}

- (void)setNowPlayingControllers:(id)a3
{
  objc_storeStrong((id *)&self->_nowPlayingControllers, a3);
}

- (MRUNowPlayingViewController)nowPlayingViewController
{
  return self->_nowPlayingViewController;
}

- (void)setNowPlayingViewController:(id)a3
{
  objc_storeStrong((id *)&self->_nowPlayingViewController, a3);
}

- (id)replaceRoutes
{
  return self->_replaceRoutes;
}

- (void)setReplaceRoutes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1040);
}

- (UIViewController)alertViewController
{
  return self->_alertViewController;
}

- (BOOL)isOnScreen
{
  return self->_onScreen;
}

- (int64_t)pendingState
{
  return self->_pendingState;
}

- (void)setPendingState:(int64_t)a3
{
  self->_pendingState = a3;
}

- (int64_t)pendingNowPlayingExpandedLayout
{
  return self->_pendingNowPlayingExpandedLayout;
}

- (void)setPendingNowPlayingExpandedLayout:(int64_t)a3
{
  self->_pendingNowPlayingExpandedLayout = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alertViewController, 0);
  objc_storeStrong(&self->_replaceRoutes, 0);
  objc_storeStrong((id *)&self->_nowPlayingViewController, 0);
  objc_storeStrong((id *)&self->_nowPlayingControllers, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_endpointsManager, 0);
  objc_storeStrong(&self->_dismissalBlock, 0);
  objc_storeStrong(&self->_routingCornerViewTappedBlock, 0);
  objc_storeStrong(&self->_homeGestureDismissalAllowedBlock, 0);
}

@end
