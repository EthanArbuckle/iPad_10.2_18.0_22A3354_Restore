@implementation MRUMediaControlsModuleViewController

- (MRUMediaControlsModuleViewController)initWithManager:(id)a3
{
  id v5;
  MRUMediaControlsModuleViewController *v6;
  MRUMediaControlsModuleViewController *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MRUMediaControlsModuleViewController;
  v6 = -[MRUMediaControlsModuleViewController init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_expandedLayout = 0x7FFFFFFFFFFFFFFFLL;
    v6->_gridSizeClass = 4;
    objc_storeStrong((id *)&v6->_manager, a3);
    -[MRUNowPlayingControllerManager addObserver:](v7->_manager, "addObserver:", v7);
  }

  return v7;
}

- (void)loadView
{
  MRUMediaControlsModuleView *v3;
  MRUMediaControlsModuleView *v4;

  v3 = [MRUMediaControlsModuleView alloc];
  v4 = -[MRUMediaControlsModuleView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  -[MRUMediaControlsModuleViewController setView:](self, "setView:", v4);

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
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  UICollectionViewDiffableDataSource *v19;
  UICollectionViewDiffableDataSource *dataSource;
  _QWORD v21[4];
  id v22;
  _QWORD v23[4];
  id v24;
  id location;
  objc_super v26;

  v26.receiver = self;
  v26.super_class = (Class)MRUMediaControlsModuleViewController;
  -[MRUMediaControlsModuleViewController viewDidLoad](&v26, sel_viewDidLoad);
  -[MRUMediaControlsModuleViewController setOverrideUserInterfaceStyle:](self, "setOverrideUserInterfaceStyle:", 2);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D80]), "initWithTarget:action:", self, sel_dismiss);
  objc_msgSend(v3, "setDelegate:", self);
  -[MRUMediaControlsModuleViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addGestureRecognizer:", v3);

  -[MRUMediaControlsModuleViewController contentMetrics](self, "contentMetrics");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRUMediaControlsModuleViewController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setContentMetrics:", v5);

  -[MRUMediaControlsModuleViewController view](self, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "moreButton");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addTarget:action:forControlEvents:", self, sel_didSelectListState_, 64);

  -[MRUMediaControlsModuleViewController view](self, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "collectionView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setDelegate:", self);

  objc_initWeak(&location, self);
  v11 = (void *)MEMORY[0x1E0DC35C8];
  v12 = objc_opt_class();
  v13 = MEMORY[0x1E0C809B0];
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __51__MRUMediaControlsModuleViewController_viewDidLoad__block_invoke;
  v23[3] = &unk_1E581A508;
  objc_copyWeak(&v24, &location);
  objc_msgSend(v11, "registrationWithCellClass:configurationHandler:", v12, v23);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_alloc(MEMORY[0x1E0DC35E8]);
  -[MRUMediaControlsModuleViewController view](self, "view");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "collectionView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v13;
  v21[1] = 3221225472;
  v21[2] = __51__MRUMediaControlsModuleViewController_viewDidLoad__block_invoke_2;
  v21[3] = &unk_1E5819D08;
  v18 = v14;
  v22 = v18;
  v19 = (UICollectionViewDiffableDataSource *)objc_msgSend(v15, "initWithCollectionView:cellProvider:", v17, v21);
  dataSource = self->_dataSource;
  self->_dataSource = v19;

  -[MRUMediaControlsModuleViewController createNowPlayingViewController](self, "createNowPlayingViewController");
  -[MRUMediaControlsModuleViewController createRoutingViewController](self, "createRoutingViewController");
  -[MRUMediaControlsModuleViewController updateLayout](self, "updateLayout");

  objc_destroyWeak(&v24);
  objc_destroyWeak(&location);

}

void __51__MRUMediaControlsModuleViewController_viewDidLoad__block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
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

uint64_t __51__MRUMediaControlsModuleViewController_viewDidLoad__block_invoke_2(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  return objc_msgSend(a2, "dequeueConfiguredReusableCellWithRegistration:forIndexPath:item:", *(_QWORD *)(a1 + 32), a3, a4);
}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MRUMediaControlsModuleViewController;
  -[MRUMediaControlsModuleViewController viewWillAppear:](&v4, sel_viewWillAppear_, a3);
  -[MRUMediaControlsModuleViewController setOnScreen:](self, "setOnScreen:", 1);
}

- (void)viewWillDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MRUMediaControlsModuleViewController;
  -[MRUMediaControlsModuleViewController viewWillDisappear:](&v4, sel_viewWillDisappear_, a3);
  -[MRUMediaControlsModuleViewController setOnScreen:](self, "setOnScreen:", 0);
}

- (void)viewWillLayoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MRUMediaControlsModuleViewController;
  -[MRUMediaControlsModuleViewController viewWillLayoutSubviews](&v3, sel_viewWillLayoutSubviews);
  -[MRUMediaControlsModuleViewController updateCornerRadius](self, "updateCornerRadius");
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
  v10.super_class = (Class)MRUMediaControlsModuleViewController;
  v7 = a4;
  -[MRUMediaControlsModuleViewController viewWillTransitionToSize:withTransitionCoordinator:](&v10, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  v8[4] = self;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __91__MRUMediaControlsModuleViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v9[3] = &unk_1E5819C40;
  v9[4] = self;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __91__MRUMediaControlsModuleViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_2;
  v8[3] = &unk_1E5819C40;
  objc_msgSend(v7, "animateAlongsideTransition:completion:", v9, v8);

}

void __91__MRUMediaControlsModuleViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setTransitioning:", 1);

  objc_msgSend(*(id *)(a1 + 32), "updateLayout");
  objc_msgSend(*(id *)(a1 + 32), "view");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "layoutIfNeeded");

}

uint64_t __91__MRUMediaControlsModuleViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_2(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setTransitioning:", 0);

  objc_msgSend(*(id *)(a1 + 32), "updateNowPlayingControllers");
  return objc_msgSend(*(id *)(a1 + 32), "updateActiveViewController");
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)setOnScreen:(BOOL)a3
{
  id v4;

  if (self->_onScreen != a3)
  {
    self->_onScreen = a3;
    -[MRUMediaControlsModuleViewController updateDiscoveryMode](self, "updateDiscoveryMode");
    -[MRUMediaControlsModuleViewController manager](self, "manager");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "updateAutomaticResponseLoading");

  }
}

- (void)setLayout:(int64_t)a3
{
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
  void *v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  void *v27;
  void (**homeGestureDismissalAllowedBlock)(id, BOOL);

  -[MRUMediaControlsModuleViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setLayout:", a3);

  -[MRUMediaControlsModuleViewController nowPlayingViewController](self, "nowPlayingViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setLayout:", a3);

  -[MRUMediaControlsModuleViewController updateDiscoveryMode](self, "updateDiscoveryMode");
  -[MRUMediaControlsModuleViewController updateRoutingDiscoveryMode](self, "updateRoutingDiscoveryMode");
  -[MRUMediaControlsModuleViewController updateMoreButton](self, "updateMoreButton");
  -[MRUMediaControlsModuleViewController manager](self, "manager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "updateAutomaticResponseLoading");

  -[MRUMediaControlsModuleViewController view](self, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MRUMediaModuleContentInsetsForLayout(objc_msgSend(v8, "layout"));
  v11 = v10;
  v13 = v12;
  v15 = v14;
  -[MRUMediaControlsModuleViewController view](self, "view");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "backgroundView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setContentEdgeInsets:", v9, v11, v13, v15);

  -[MRUMediaControlsModuleViewController view](self, "view");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = MRUMediaModuleContentInsetsForLayout(objc_msgSend(v18, "layout"));
  v21 = v20;
  v23 = v22;
  v25 = v24;
  -[MRUMediaControlsModuleViewController nowPlayingViewController](self, "nowPlayingViewController");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setContentEdgeInsets:", v19, v21, v23, v25);

  -[MRUMediaControlsModuleViewController updateRoutingContentEdgeInsets](self, "updateRoutingContentEdgeInsets");
  -[MRUMediaControlsModuleViewController alertViewController](self, "alertViewController");
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  if (a3 != 6 && v27)
    -[MRUMediaControlsModuleViewController setAlertViewController:](self, "setAlertViewController:", 0);
  homeGestureDismissalAllowedBlock = (void (**)(id, BOOL))self->_homeGestureDismissalAllowedBlock;
  if (homeGestureDismissalAllowedBlock)
    homeGestureDismissalAllowedBlock[2](homeGestureDismissalAllowedBlock, (unint64_t)(a3 - 1) < 2);
}

- (id)activeIdentifier
{
  void *v2;
  void *v3;

  -[MRUMediaControlsModuleNowPlayingViewController controller](self->_nowPlayingViewController, "controller");
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
  MRUMediaControlsModuleViewController *v17;
  _QWORD v18[4];
  UIViewController *v19;
  MRUMediaControlsModuleViewController *v20;
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
      -[MRUMediaControlsModuleViewController addChildViewController:](self, "addChildViewController:", v5);
      -[UIViewController view](v5, "view");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[MRUMediaControlsModuleViewController view](self, "view");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setAlertView:", v8);

      -[MRUMediaControlsModuleViewController view](self, "view");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "layoutIfNeeded");
    }
    else
    {
      -[MRUMediaControlsModuleViewController view](self, "view");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setAlertView:", 0);
    }

    v11 = (void *)MEMORY[0x1E0DC3F10];
    v12 = MEMORY[0x1E0C809B0];
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __63__MRUMediaControlsModuleViewController_setAlertViewController___block_invoke;
    v18[3] = &unk_1E5819160;
    v19 = v7;
    v20 = self;
    v21 = v5;
    v14[0] = v12;
    v14[1] = 3221225472;
    v14[2] = __63__MRUMediaControlsModuleViewController_setAlertViewController___block_invoke_2;
    v14[3] = &unk_1E5819188;
    v15 = v19;
    v16 = v21;
    v17 = self;
    v13 = v19;
    objc_msgSend(v11, "mru_animateUsingType:animations:completion:", 0, v18, v14);

  }
}

void __63__MRUMediaControlsModuleViewController_setAlertViewController___block_invoke(uint64_t a1)
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

uint64_t __63__MRUMediaControlsModuleViewController_setAlertViewController___block_invoke_2(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeFromSuperview");

  objc_msgSend(*(id *)(a1 + 32), "removeFromParentViewController");
  objc_msgSend(*(id *)(a1 + 32), "endAppearanceTransition");
  return objc_msgSend(*(id *)(a1 + 40), "didMoveToParentViewController:", *(_QWORD *)(a1 + 48));
}

- (void)setContentMetrics:(id)a3
{
  CCUIModuleContentMetrics *v5;
  void *v6;
  CCUIModuleContentMetrics *v7;
  char v8;
  CCUIModuleContentMetrics *v9;

  v9 = (CCUIModuleContentMetrics *)a3;
  v5 = self->_contentMetrics;
  v6 = v9;
  if (v5 == v9)
    goto LABEL_4;
  v7 = v5;
  v8 = -[CCUIModuleContentMetrics isEqual:](v5, "isEqual:", v9);

  if ((v8 & 1) == 0)
  {
    objc_storeStrong((id *)&self->_contentMetrics, a3);
    -[MRUMediaControlsModuleViewController view](self, "view");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setContentMetrics:", v9);
LABEL_4:

  }
}

- (void)dismiss
{
  -[MRUMediaControlsModuleViewController dismissWithCompletion:](self, "dismissWithCompletion:", 0);
}

- (void)didSelectListState:(id)a3
{
  void *v4;
  uint64_t v5;

  -[MRUMediaControlsModuleViewController updateNowPlayingControllers](self, "updateNowPlayingControllers", a3);
  -[MRUMediaControlsModuleViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "layout");

  if ((unint64_t)(v5 - 6) <= 3)
    self->_expandedLayout = qword_1AAAD66A8[v5 - 6];
  if (self->_isExpanded)
    -[MRUMediaControlsModuleViewController updateLayout](self, "updateLayout");
  else
    (*((void (**)(void))self->_routingCornerViewTappedBlock + 2))();
}

- (void)didSelectQuickControl:(id)a3
{
  MRUNowPlayingControllerManager *manager;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  manager = self->_manager;
  objc_msgSend(a3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRUNowPlayingControllerManager controllerForIdentifier:](manager, "controllerForIdentifier:", v4);
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
  uint64_t v11;
  void *v12;
  uint64_t v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17[2];
  id location;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "deselectItemAtIndexPath:animated:", v7, 0);
  -[UICollectionViewDiffableDataSource itemIdentifierForIndexPath:](self->_dataSource, "itemIdentifierForIndexPath:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRUNowPlayingControllerManager controllerForIdentifier:](self->_manager, "controllerForIdentifier:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRUMediaControlsModuleViewController view](self, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "layout");

  objc_initWeak(&location, self);
  objc_msgSend(v9, "endpointController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11 == 1)
    v13 = 6;
  else
    v13 = 7;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __80__MRUMediaControlsModuleViewController_collectionView_didSelectItemAtIndexPath___block_invoke;
  v15[3] = &unk_1E581C1D0;
  objc_copyWeak(v17, &location);
  v14 = v9;
  v16 = v14;
  v17[1] = (id)v13;
  objc_msgSend(v12, "connectAllowingAuthenticationWithCompletion:", v15);

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);

}

void __80__MRUMediaControlsModuleViewController_collectionView_didSelectItemAtIndexPath___block_invoke(uint64_t a1, int a2)
{
  id WeakRetained;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  _QWORD v9[4];
  id v10;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = WeakRetained;
  if (a2)
  {
    v6 = *(_QWORD *)(a1 + 32);
    objc_msgSend(WeakRetained, "manager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setActiveController:", v6);

    objc_msgSend(v5, "setActiveController:", *(_QWORD *)(a1 + 32));
    v8 = *(_QWORD *)(a1 + 48);
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __80__MRUMediaControlsModuleViewController_collectionView_didSelectItemAtIndexPath___block_invoke_2;
    v9[3] = &unk_1E5818C88;
    v10 = v5;
    objc_msgSend(v10, "transitionToLayout:completion:", v8, v9);

  }
}

uint64_t __80__MRUMediaControlsModuleViewController_collectionView_didSelectItemAtIndexPath___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateNowPlayingControllers");
}

- (void)nowPlayingControllerManager:(id)a3 didChangeActiveController:(id)a4
{
  -[MRUMediaControlsModuleViewController setActiveController:](self, "setActiveController:", a4);
  -[MRUMediaControlsModuleViewController updateDiscoveryMode](self, "updateDiscoveryMode");
}

- (void)nowPlayingControllerManager:(id)a3 didChangeControllers:(id)a4
{
  void *v5;
  char v6;

  -[MRUMediaControlsModuleViewController view](self, "view", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isTransitioning");

  if ((v6 & 1) == 0)
    -[MRUMediaControlsModuleViewController updateNowPlayingControllers](self, "updateNowPlayingControllers");
}

- (void)nowPlayingViewController:(id)a3 applyLayout:(int64_t)a4
{
  void *v5;
  uint64_t v6;
  void (**routingCornerViewTappedBlock)(void);
  void (**v8)(void);
  _QWORD v9[5];

  self->_expandedLayout = a4;
  -[MRUMediaControlsModuleViewController view](self, "view", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "layout");

  if ((unint64_t)(v6 - 6) > 3)
  {
    if (!+[MRUFeatureFlagProvider isNewControlsRouteExpandAllLayoutsEnabled](MRUFeatureFlagProvider, "isNewControlsRouteExpandAllLayoutsEnabled"))
    {
      routingCornerViewTappedBlock = (void (**)(void))self->_routingCornerViewTappedBlock;
      if (routingCornerViewTappedBlock)
        routingCornerViewTappedBlock[2]();
    }
  }
  else
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __77__MRUMediaControlsModuleViewController_nowPlayingViewController_applyLayout___block_invoke;
    v9[3] = &unk_1E5818C88;
    v9[4] = self;
    objc_msgSend(MEMORY[0x1E0DC3F10], "mru_animateUsingType:animations:", 0, v9);
  }
  if (+[MRUFeatureFlagProvider isNewControlsRouteExpandAllLayoutsEnabled](MRUFeatureFlagProvider, "isNewControlsRouteExpandAllLayoutsEnabled"))
  {
    v8 = (void (**)(void))self->_routingCornerViewTappedBlock;
    if (v8)
      v8[2]();
  }
}

void __77__MRUMediaControlsModuleViewController_nowPlayingViewController_applyLayout___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "updateLayout");
  objc_msgSend(*(id *)(a1 + 32), "view");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "layoutIfNeeded");

}

- (void)nowPlayingViewController:(id)a3 cordinateDismissal:(id)a4
{
  -[MRUMediaControlsModuleViewController dismissWithCompletion:](self, "dismissWithCompletion:", a4);
}

- (BOOL)nowPlayingControllerShouldAutomaticallyUpdateResponse:(id)a3
{
  void *v4;
  unint64_t v5;

  -[MRUMediaControlsModuleViewController view](self, "view", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "layout");

  return v5 <= 9 && ((1 << v5) & 0x3C6) != 0 && self->_onScreen;
}

- (void)nowPlayingController:(id)a3 endpointController:(id)a4 didChangeRoute:(id)a5
{
  id v6;

  objc_msgSend(a3, "identifier");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[MRUMediaControlsModuleViewController updateCellForIdentifier:](self, "updateCellForIdentifier:", v6);

}

- (void)nowPlayingController:(id)a3 metadataController:(id)a4 didChangeArtwork:(id)a5
{
  id v6;

  objc_msgSend(a3, "identifier");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[MRUMediaControlsModuleViewController updateCellForIdentifier:](self, "updateCellForIdentifier:", v6);

}

- (void)nowPlayingController:(id)a3 metadataController:(id)a4 didChangeNowPlayingInfo:(id)a5
{
  id v6;

  objc_msgSend(a3, "identifier");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[MRUMediaControlsModuleViewController updateCellForIdentifier:](self, "updateCellForIdentifier:", v6);

}

- (void)nowPlayingController:(id)a3 didChangeQuickControlItem:(id)a4
{
  id v5;

  objc_msgSend(a3, "identifier");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[MRUMediaControlsModuleViewController updateCellForIdentifier:](self, "updateCellForIdentifier:", v5);

}

- (void)routingViewController:(id)a3 didSelectRoutingViewItem:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  id v10;
  id location;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "actionIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqualToString:", *MEMORY[0x1E0CC1D18]);

  if (v9)
  {
    objc_initWeak(&location, self);
    objc_copyWeak(&v10, &location);
    SBSRequestPasscodeUnlockAlertUI();
    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }

}

void __87__MRUMediaControlsModuleViewController_routingViewController_didSelectRoutingViewItem___block_invoke(uint64_t a1, int a2)
{
  id WeakRetained;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (a2)
  {
    objc_msgSend(MEMORY[0x1E0D975F8], "instantiateViewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setFlags:", 1);
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __87__MRUMediaControlsModuleViewController_routingViewController_didSelectRoutingViewItem___block_invoke_2;
    v6[3] = &unk_1E58191D8;
    v5 = WeakRetained;
    v7 = v5;
    objc_msgSend(v4, "setCompletion:", v6);
    objc_msgSend(v5, "setAlertViewController:", v4);

  }
}

void __87__MRUMediaControlsModuleViewController_routingViewController_didSelectRoutingViewItem___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  MCLogCategoryDefault();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = objc_opt_class();
    objc_msgSend(v5, "mediaRouteIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138412802;
    v11 = v8;
    v12 = 2112;
    v13 = v9;
    v14 = 2112;
    v15 = v6;
    _os_log_impl(&dword_1AA991000, v7, OS_LOG_TYPE_DEFAULT, "%@ ShareAudio dismissed: RouteID %@, Error %@", (uint8_t *)&v10, 0x20u);

  }
  objc_msgSend(*(id *)(a1 + 32), "setAlertViewController:", 0);

}

- (void)artworkView:(id)a3 didChangeArtworkImage:(id)a4
{
  id v5;
  void *v6;
  id v7;

  v5 = a4;
  -[MRUMediaControlsModuleViewController view](self, "view");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "backgroundView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setBackdropImage:", v5);

}

- (void)setGridSizeClass:(int64_t)a3
{
  self->_gridSizeClass = a3;
  self->_expandedLayout = 0x7FFFFFFFFFFFFFFFLL;
  -[MRUMediaControlsModuleViewController updateLayout](self, "updateLayout");
}

- (void)setCompactContinuousCornerRadius:(double)a3
{
  self->_compactContinuousCornerRadius = a3;
  -[MRUMediaControlsModuleViewController updateCornerRadius](self, "updateCornerRadius");
}

- (void)setContentRenderingMode:(unint64_t)a3
{
  if (self->_contentRenderingMode != a3)
  {
    self->_contentRenderingMode = a3;
    -[MRUMediaControlsModuleViewController updateLayout](self, "updateLayout");
  }
}

- (void)setResizing:(BOOL)a3
{
  self->_resizing = a3;
  -[MRUMediaControlsModuleNowPlayingViewController setResizing:](self->_nowPlayingViewController, "setResizing:");
}

- (double)preferredExpandedContentHeight
{
  void *v2;
  void *v3;
  double Height;
  CGRect v6;

  -[MRUMediaControlsModuleViewController view](self, "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  Height = CGRectGetHeight(v6);

  return Height;
}

- (double)preferredExpandedContentWidth
{
  void *v2;
  double v3;
  double v4;

  -[MRUMediaControlsModuleViewController view](self, "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (MRULayoutShouldBeVertical())
    v3 = MRUExpandedTallWidth();
  else
    v3 = MRUExpandedWideWidth();
  v4 = v3;

  return v4;
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
  uint64_t v6;
  BOOL v7;

  v4 = a3;
  -[MRUMediaControlsModuleViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "layout");

  v7 = (v6 & 0xFFFFFFFFFFFFFFFELL) != 6
    && -[MRUMediaControlsModuleNowPlayingViewController shouldExpandModuleOnTouch:](self->_nowPlayingViewController, "shouldExpandModuleOnTouch:", v4);

  return v7;
}

- (BOOL)shouldBeginTransitionToExpandedContentModule
{
  void *v3;
  uint64_t v4;

  -[MRUMediaControlsModuleViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "layout");

  return (unint64_t)(v4 - 5) > 1 || self->_expandedLayout != 0x7FFFFFFFFFFFFFFFLL;
}

- (BOOL)canDismissPresentedContent
{
  void *v3;
  BOOL v4;
  void *v5;

  -[MRUMediaControlsModuleViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "layout") == 1)
  {
    v4 = 1;
  }
  else
  {
    -[MRUMediaControlsModuleViewController view](self, "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v5, "layout") == 2;

  }
  return v4;
}

- (void)willTransitionToExpandedContentMode:(BOOL)a3
{
  self->_isExpanded = a3;
}

- (unint64_t)implicitlyExpandedGridSizeClasses
{
  return 1536;
}

- (void)dismissPresentedContentAnimated:(BOOL)a3 completion:(id)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  uint64_t v8;
  _QWORD v9[5];
  id v10;

  v4 = a3;
  v6 = a4;
  -[MRUMediaControlsModuleViewController view](self, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (MRULayoutShouldBeVertical())
    v8 = 6;
  else
    v8 = 7;

  if (-[MRUMediaControlsModuleViewController gridSizeClass](self, "gridSizeClass") == 9
    || -[MRUMediaControlsModuleViewController gridSizeClass](self, "gridSizeClass") == 10)
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __83__MRUMediaControlsModuleViewController_dismissPresentedContentAnimated_completion___block_invoke;
    v9[3] = &unk_1E5819B40;
    v9[4] = self;
    v10 = v6;
    -[MRUMediaControlsModuleViewController transitionToLayout:completion:](self, "transitionToLayout:completion:", v8, v9);

  }
  else if (v4)
  {
    -[MRUMediaControlsModuleViewController transitionToLayout:completion:](self, "transitionToLayout:completion:", v8, v6);
  }
  else
  {
    -[MRUMediaControlsModuleViewController setLayout:](self, "setLayout:", v8);
  }

}

uint64_t __83__MRUMediaControlsModuleViewController_dismissPresentedContentAnimated_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "dismissWithCompletion:", *(_QWORD *)(a1 + 40));
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  BOOL v17;

  v5 = a4;
  -[MRUMediaControlsModuleViewController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "layout");

  if ((unint64_t)(v7 - 1) > 1)
  {
    v17 = 0;
  }
  else
  {
    -[MRUMediaControlsModuleViewController view](self, "view");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "collectionView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "locationInView:", v9);
    v11 = v10;
    v13 = v12;

    -[MRUMediaControlsModuleViewController view](self, "view");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "collectionView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "indexPathForItemAtPoint:", v11, v13);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v16 == 0;

  }
  return v17;
}

- (void)createNowPlayingViewController
{
  MRUMediaControlsModuleNowPlayingViewController *v3;
  void *v4;
  void *v5;
  void *v6;
  MRUMediaControlsModuleNowPlayingViewController *nowPlayingViewController;
  MRUMediaControlsModuleNowPlayingViewController *v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = objc_alloc_init(MRUMediaControlsModuleNowPlayingViewController);
  -[MRUMediaControlsModuleNowPlayingViewController setDelegate:](v3, "setDelegate:", self);
  -[MRUMediaControlsModuleViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stylingProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRUMediaControlsModuleNowPlayingViewController setStylingProvider:](v3, "setStylingProvider:", v5);

  -[MRUMediaControlsModuleNowPlayingViewController artworkView](v3, "artworkView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObserver:", self);

  nowPlayingViewController = self->_nowPlayingViewController;
  self->_nowPlayingViewController = v3;
  v8 = v3;

  -[MRUMediaControlsModuleViewController addChildViewController:](self, "addChildViewController:", self->_nowPlayingViewController);
  -[MRUMediaControlsModuleNowPlayingViewController view](self->_nowPlayingViewController, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRUMediaControlsModuleViewController view](self, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "containerView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setNowPlayingView:", v9);

  -[MRUMediaControlsModuleNowPlayingViewController didMoveToParentViewController:](self->_nowPlayingViewController, "didMoveToParentViewController:", self);
  -[MRUMediaControlsModuleViewController updateActiveViewController](self, "updateActiveViewController");
}

- (void)createRoutingViewController
{
  MRURoutingViewController *v3;
  MRURoutingViewController *routingViewController;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = objc_alloc_init(MRURoutingViewController);
  routingViewController = self->_routingViewController;
  self->_routingViewController = v3;

  -[MRURoutingViewController setDelegate:](self->_routingViewController, "setDelegate:", self);
  -[MRUMediaControlsModuleViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stylingProvider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRURoutingViewController setStylingProvider:](self->_routingViewController, "setStylingProvider:", v6);

  -[MRUMediaControlsModuleViewController updateRoutingDiscoveryMode](self, "updateRoutingDiscoveryMode");
  -[MRUMediaControlsModuleViewController updateRoutingDataControllers](self, "updateRoutingDataControllers");
  -[MRUMediaControlsModuleViewController addChildViewController:](self, "addChildViewController:", self->_routingViewController);
  -[MRURoutingViewController view](self->_routingViewController, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRUMediaControlsModuleViewController view](self, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "containerView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "routingView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setContentView:", v7);

  -[MRURoutingViewController didMoveToParentViewController:](self->_routingViewController, "didMoveToParentViewController:", self);
  -[MRUMediaControlsModuleViewController updateRoutingController](self, "updateRoutingController");
}

- (void)updateVolumeController
{
  void *v3;
  void *v4;
  void *v5;
  MRUVolumeController *v6;
  MRUVolumeGroupCoordinator *v7;
  id v8;

  -[MRUMediaControlsModuleNowPlayingViewController controller](self->_nowPlayingViewController, "controller");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "endpointController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "route");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CC2538]), "initWithGroupRoute:outputDeviceRoute:", v8, 0);
  v6 = -[MPVolumeController initWithDataSource:]([MRUVolumeController alloc], "initWithDataSource:", v5);
  v7 = -[MRUVolumeGroupCoordinator initWithMainVolumeController:]([MRUVolumeGroupCoordinator alloc], "initWithMainVolumeController:", v6);
  -[MRUMediaControlsModuleNowPlayingViewController setVolumeController:](self->_nowPlayingViewController, "setVolumeController:", v6);
  -[MRUMediaControlsModuleNowPlayingViewController setVolumeGroupCoordinator:](self->_nowPlayingViewController, "setVolumeGroupCoordinator:", v7);
  -[MRURoutingViewController setVolumeGroupCoordinator:](self->_routingViewController, "setVolumeGroupCoordinator:", v7);

}

- (void)updateRoutingController
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  id v8;
  _QWORD block[4];
  id v10;
  id v11;
  id location;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@(devices)"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  dispatch_get_global_queue(25, 0);
  v7 = objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __63__MRUMediaControlsModuleViewController_updateRoutingController__block_invoke;
  block[3] = &unk_1E5818C18;
  objc_copyWeak(&v11, &location);
  v10 = v6;
  v8 = v6;
  dispatch_async(v7, block);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);

}

void __63__MRUMediaControlsModuleViewController_updateRoutingController__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  MRUOutputDeviceRoutingDataSource *v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  MRUOutputDeviceRoutingDataSource *v14;
  _QWORD block[4];
  MRUOutputDeviceRoutingDataSource *v16;
  id v17;
  id v18;
  id v19;
  id v20;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "manager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "activeController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "endpointController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "route");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "routingViewController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_alloc_init(MRUOutputDeviceRoutingDataSource);
    -[MRUOutputDeviceRoutingDataSource setEndpointRoute:](v9, "setEndpointRoute:", v7);
    if (MRAVOutputContextGetSharedAudioPresentationContext())
    {
      v10 = (void *)MRAVOutputContextCopyUniqueIdentifier();
      -[MRUOutputDeviceRoutingDataSource setRoutingContextUID:](v9, "setRoutingContextUID:", v10);

    }
    -[MRUOutputDeviceRoutingDataSource setSupportsMultipleSelection:](v9, "setSupportsMultipleSelection:", 1);
    -[MPAVRoutingDataSource setFilterMode:](v9, "setFilterMode:", 0);
    -[MRUOutputDeviceRoutingDataSource setInitiator:](v9, "setInitiator:", *MEMORY[0x1E0CF63F0]);
    -[MRUOutputDeviceRoutingDataSource setDetachesRoutesToGroup:](v9, "setDetachesRoutesToGroup:", 1);
    -[MRUOutputDeviceRoutingDataSource setHearingAidDelegate:](v9, "setHearingAidDelegate:", v8);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __63__MRUMediaControlsModuleViewController_updateRoutingController__block_invoke_2;
    block[3] = &unk_1E581C1F8;
    v16 = v9;
    v17 = *(id *)(a1 + 32);
    v18 = v4;
    v19 = v8;
    v20 = v7;
    v11 = v7;
    v12 = v8;
    v13 = v4;
    v14 = v9;
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
}

void __63__MRUMediaControlsModuleViewController_updateRoutingController__block_invoke_2(uint64_t a1)
{
  id v2;

  v2 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CC2318]), "initWithDataSource:name:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  objc_msgSend(v2, "setPlaybackDataSource:", *(_QWORD *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 56), "setRoutingController:", v2);
  objc_msgSend(*(id *)(a1 + 56), "setEndpointRoute:", *(_QWORD *)(a1 + 64));

}

- (void)updateLayout
{
  _BOOL8 v3;
  void *v4;
  int64_t expandedLayout;
  uint64_t v8;
  void *v9;
  int64_t v10;
  void *v11;
  int64_t v12;
  int64_t v13;
  MRUMediaControlsModuleViewController *v14;
  id v15;

  v3 = self->_contentRenderingMode == 1;
  -[MRUMediaControlsModuleViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setShowPreviewView:", v3);

  expandedLayout = self->_expandedLayout;
  if (expandedLayout == 2 || expandedLayout == 1)
  {
    -[MRUMediaControlsModuleViewController transitionToLayout:completion:](self, "transitionToLayout:completion:");
    -[MRUMediaControlsModuleViewController setExpandedLayout:](self, "setExpandedLayout:", 0x7FFFFFFFFFFFFFFFLL);
    return;
  }
  if (expandedLayout != 0x7FFFFFFFFFFFFFFFLL || !self->_isExpanded)
  {
    if (self->_isExpanded)
    {
      -[MRUMediaControlsModuleViewController setLayout:](self, "setLayout:");
      -[MRUMediaControlsModuleViewController setExpandedLayout:](self, "setExpandedLayout:", 0x7FFFFFFFFFFFFFFFLL);
      return;
    }
    -[MRUMediaControlsModuleViewController view](self, "view");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "layout") == 6)
    {
      v10 = self->_expandedLayout;

      if (v10 == 8)
        goto LABEL_22;
    }
    else
    {

    }
    if (!self->_isExpanded)
    {
      -[MRUMediaControlsModuleViewController view](self, "view");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v11, "layout") == 7)
      {
        v12 = self->_expandedLayout;

        if (v12 == 9)
        {
LABEL_22:
          v13 = self->_expandedLayout;
          v14 = self;
LABEL_31:
          -[MRUMediaControlsModuleViewController setLayout:](v14, "setLayout:", v13);
          return;
        }
      }
      else
      {

      }
    }
    switch(self->_gridSizeClass)
    {
      case 0:
      case 1:
      case 2:
      case 3:
        v14 = self;
        v13 = 0;
        break;
      case 5:
        v14 = self;
        v13 = 4;
        break;
      case 6:
        v14 = self;
        v13 = 5;
        break;
      case 7:
      case 9:
        v14 = self;
        v13 = 6;
        break;
      case 0xALL:
        v14 = self;
        v13 = 7;
        break;
      default:
        v14 = self;
        v13 = 3;
        break;
    }
    goto LABEL_31;
  }
  -[MRUMediaControlsModuleViewController view](self, "view");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  if (MRULayoutShouldBeVertical())
    v8 = 6;
  else
    v8 = 7;
  -[MRUMediaControlsModuleViewController setLayout:](self, "setLayout:", v8);

}

uint64_t __52__MRUMediaControlsModuleViewController_updateLayout__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "updateNowPlayingControllers");
  return objc_msgSend(*(id *)(a1 + 32), "updateActiveViewController");
}

uint64_t __52__MRUMediaControlsModuleViewController_updateLayout__block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "updateNowPlayingControllers");
  return objc_msgSend(*(id *)(a1 + 32), "updateActiveViewController");
}

- (void)updateCornerRadius
{
  void *v3;
  uint64_t v4;
  double compactContinuousCornerRadius;
  void *v6;
  double v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  id v23;

  -[MRUMediaControlsModuleViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "layout");

  switch(v4)
  {
    case 0:
    case 3:
    case 4:
    case 5:
      compactContinuousCornerRadius = self->_compactContinuousCornerRadius;
      -[MRUMediaControlsModuleViewController view](self, "view");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setCornerRadius:", compactContinuousCornerRadius);

      v7 = self->_compactContinuousCornerRadius;
      goto LABEL_16;
    case 1:
    case 2:
      -[MRUMediaControlsModuleViewController view](self, "view");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setCornerRadius:", 25.0);

      -[MRUMediaControlsModuleViewController routingViewController](self, "routingViewController");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 0.0;
      v11 = 25.0;
      v23 = v9;
      goto LABEL_20;
    case 6:
    case 8:
      if (self->_isExpanded)
      {
        CCUIExpandedModuleContinuousCornerRadius();
        v13 = v12;
      }
      else
      {
        v13 = self->_compactContinuousCornerRadius;
      }
      -[MRUMediaControlsModuleViewController view](self, "view");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setCornerRadius:", v13);

      if (self->_isExpanded)
      {
        CCUIExpandedModuleContinuousCornerRadius();
        v7 = v17;
      }
      else
      {
        v7 = self->_compactContinuousCornerRadius;
      }
LABEL_16:
      -[MRUMediaControlsModuleViewController routingViewController](self, "routingViewController");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 0.0;
      v23 = v9;
      v11 = v7;
      goto LABEL_20;
    case 7:
    case 9:
      if (self->_isExpanded)
      {
        CCUIExpandedModuleContinuousCornerRadius();
        v15 = v14;
      }
      else
      {
        v15 = self->_compactContinuousCornerRadius;
      }
      -[MRUMediaControlsModuleViewController view](self, "view");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setCornerRadius:", v15);

      if (self->_isExpanded)
      {
        CCUIExpandedModuleContinuousCornerRadius();
        v20 = v19;
        if (self->_isExpanded)
        {
          CCUIExpandedModuleContinuousCornerRadius();
          v22 = v21;
          goto LABEL_19;
        }
      }
      else
      {
        v20 = self->_compactContinuousCornerRadius;
      }
      v22 = self->_compactContinuousCornerRadius;
LABEL_19:
      -[MRUMediaControlsModuleViewController routingViewController](self, "routingViewController");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = v9;
      v10 = v20;
      v11 = v22;
LABEL_20:
      objc_msgSend(v9, "setScrollIndicatorInsets:", v10, 0.0, v11, 0.0);

      return;
    default:
      return;
  }
}

- (void)updateRoutingContentEdgeInsets
{
  void *v3;
  uint64_t v4;
  void *v5;
  double v6;
  double v7;
  id v8;

  -[MRUMediaControlsModuleViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "layout");

  -[MRUMediaControlsModuleViewController routingViewController](self, "routingViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v5;
  v6 = 0.0;
  if (v4 == 9)
    v6 = 13.0;
  v7 = 12.0;
  if (v4 == 9)
    v7 = 13.0;
  objc_msgSend(v5, "setContentEdgeInsets:", v6, 24.0, v7, 24.0);

}

- (void)updateRoutingDiscoveryMode
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  _BOOL8 onScreen;

  -[MRUMediaControlsModuleViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "layout");

  v5 = 3;
  if (!self->_onScreen)
    v5 = 0;
  if ((v4 & 0xFFFFFFFFFFFFFFFELL) == 8)
    onScreen = v5;
  else
    onScreen = self->_onScreen;
  -[MRURoutingViewController setDiscoveryMode:](self->_routingViewController, "setDiscoveryMode:", onScreen);
}

- (void)updateNowPlayingControllers
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  _BOOL8 v7;
  void *v8;
  id v9;
  UICollectionViewDiffableDataSource *dataSource;
  _QWORD v11[5];
  _QWORD v12[5];

  -[MRUNowPlayingControllerManager controllers](self->_manager, "controllers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __67__MRUMediaControlsModuleViewController_updateNowPlayingControllers__block_invoke;
  v12[3] = &unk_1E581C220;
  v12[4] = self;
  objc_msgSend(v3, "msv_map:", v12);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[MRUMediaControlsModuleViewController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "layout") == 1)
  {
    v7 = 1;
  }
  else
  {
    -[MRUMediaControlsModuleViewController view](self, "view");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v8, "layout") == 2;

  }
  v9 = objc_alloc_init(MEMORY[0x1E0DC3398]);
  objc_msgSend(v9, "appendSectionsWithIdentifiers:", &unk_1E5878558);
  objc_msgSend(v9, "appendItemsWithIdentifiers:", v5);
  dataSource = self->_dataSource;
  v11[0] = v4;
  v11[1] = 3221225472;
  v11[2] = __67__MRUMediaControlsModuleViewController_updateNowPlayingControllers__block_invoke_2;
  v11[3] = &unk_1E5818C88;
  v11[4] = self;
  -[UICollectionViewDiffableDataSource applySnapshot:animatingDifferences:completion:](dataSource, "applySnapshot:animatingDifferences:completion:", v9, v7, v11);
  -[MRUMediaControlsModuleViewController updateMoreButton](self, "updateMoreButton");
  -[MRUMediaControlsModuleViewController updateRoutingDataControllers](self, "updateRoutingDataControllers");

}

id __67__MRUMediaControlsModuleViewController_updateNowPlayingControllers__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;
  void *v4;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = a2;
  objc_msgSend(v3, "addObserver:", v2);
  objc_msgSend(v3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

void __67__MRUMediaControlsModuleViewController_updateNowPlayingControllers__block_invoke_2(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "view");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "updateCollectionViewContentInset");

}

- (void)setActiveController:(id)a3
{
  void *v4;
  void *v5;
  char v6;
  id v7;

  v7 = a3;
  -[MRUMediaControlsModuleViewController activeIdentifier](self, "activeIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isEqualToString:", v5);

  if ((v6 & 1) == 0)
  {
    -[MRUMediaControlsModuleNowPlayingViewController setController:](self->_nowPlayingViewController, "setController:", v7);
    -[MRUMediaControlsModuleViewController updateRoutingController](self, "updateRoutingController");
    -[MRUMediaControlsModuleViewController updateVolumeController](self, "updateVolumeController");
  }

}

- (void)updateActiveViewController
{
  id v3;

  -[MRUNowPlayingControllerManager activeController](self->_manager, "activeController");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[MRUMediaControlsModuleViewController setActiveController:](self, "setActiveController:", v3);

}

- (void)updateRoutingDataControllers
{
  id v3;

  -[MRUNowPlayingControllerManager controllers](self->_manager, "controllers");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[MRURoutingViewController setNowPlayingControllers:](self->_routingViewController, "setNowPlayingControllers:", v3);

}

- (void)updateMoreButton
{
  void *v3;
  void *v4;
  _BOOL8 v5;
  void *v6;
  uint64_t v7;
  void *v8;
  unint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  _QWORD v13[5];
  BOOL v14;

  -[MRUMediaControlsModuleViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "moreButton");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = -[MRUMediaControlsModuleViewController showMoreButton](self, "showMoreButton");
  -[MRUNowPlayingControllerManager controllers](self->_manager, "controllers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  objc_msgSend(v4, "setCount:", v7);
  -[MRUMediaControlsModuleViewController view](self, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "layout");

  if (v9 <= 9 && ((1 << v9) & 0x284) != 0)
  {
    +[MRUStringsProvider controlOtherSpeakers](MRUStringsProvider, "controlOtherSpeakers");
    v10 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    +[MRUStringsProvider controlOtherSpeakersMultipleLines](MRUStringsProvider, "controlOtherSpeakersMultipleLines");
    v10 = objc_claimAutoreleasedReturnValue();
  }
  v11 = (void *)v10;
  objc_msgSend(v4, "setTitle:", v10);

  if (self->_onScreen)
  {
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __56__MRUMediaControlsModuleViewController_updateMoreButton__block_invoke;
    v13[3] = &unk_1E5818D00;
    v13[4] = self;
    v14 = v5;
    objc_msgSend(MEMORY[0x1E0DC3F10], "mru_animateUsingType:animations:", 0, v13);
  }
  else
  {
    -[MRUMediaControlsModuleViewController view](self, "view");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setShowMoreButton:", v5);

  }
}

void __56__MRUMediaControlsModuleViewController_updateMoreButton__block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(unsigned __int8 *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "view");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setShowMoreButton:", v1);

}

- (BOOL)showMoreButton
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  BOOL ShouldBeVertical;

  -[MRUMediaControlsModuleViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "layout");

  if ((unint64_t)(v4 - 6) > 3)
    return 0;
  -[MRUNowPlayingControllerManager controllers](self->_manager, "controllers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v5, "count") < 2)
  {
    ShouldBeVertical = 0;
  }
  else if (MRUIsSmallScreen())
  {
    -[MRUMediaControlsModuleViewController view](self, "view");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    ShouldBeVertical = MRULayoutShouldBeVertical();

  }
  else
  {
    ShouldBeVertical = 1;
  }

  return ShouldBeVertical;
}

- (void)updateDiscoveryMode
{
  void *v3;
  unint64_t v4;
  int64_t v6;
  void *v7;
  void *v8;

  -[MRUMediaControlsModuleViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "layout");

  if (v4 > 9 || ((1 << v4) & 0x3C6) == 0)
  {
    if (self->_onScreen)
    {
      -[MRUMediaControlsModuleNowPlayingViewController controller](self->_nowPlayingViewController, "controller");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "endpointController");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v8, "isDeviceSystemRoute") ^ 1;

    }
    else
    {
      v6 = 0;
    }
  }
  else if (self->_onScreen)
  {
    v6 = 3;
  }
  else
  {
    v6 = 0;
  }
  self->_discoveryMode = v6;
  -[MRUNowPlayingControllerManager updateDiscoveryMode](self->_manager, "updateDiscoveryMode");
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
  -[MRUMediaControlsModuleViewController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "collectionView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "cellForItemAtIndexPath:", v9);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[MRUMediaControlsModuleViewController updateCell:forIdentifier:](self, "updateCell:forIdentifier:", v8, v5);
}

- (void)updateCell:(id)a3 forIdentifier:(id)a4
{
  MRUNowPlayingControllerManager *manager;
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
  void *v34;
  void *v35;
  id v36;

  manager = self->_manager;
  v6 = a3;
  -[MRUNowPlayingControllerManager controllerForIdentifier:](manager, "controllerForIdentifier:", a4);
  v36 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "endpointController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "route");
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v36, "metadataController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "artwork");
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v36, "metadataController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "nowPlayingInfo");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v36, "quickControlItem");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)MEMORY[0x1E0DC3870];
  objc_msgSend(v36, "deviceSymbolName");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "_systemImageNamed:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "cellContentView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "artworkView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "cellContentView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "headerView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "cellContentView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "headerView");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "labelView");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "setArtwork:", v34);
  objc_msgSend(v16, "setPlaceholderImage:", v14);
  objc_msgSend(v21, "setRoute:", v35);
  objc_msgSend(v21, "setDeviceImage:", v14);
  objc_msgSend(v10, "stringForComponents:", 59);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setTitle:", v22);

  objc_msgSend(v10, "placeholder");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setPlaceholder:", v23);

  objc_msgSend(v21, "setShowPlaceholder:", objc_msgSend(v10, "showPlaceholder"));
  objc_msgSend(v36, "identifier");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "transportButton");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setIdentifier:", v24);

  objc_msgSend(v18, "setShowTransportButton:", objc_msgSend(v11, "isEnabled"));
  objc_msgSend(v18, "transportButton");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "asset");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setAsset:", v27);

  objc_msgSend(v18, "transportButton");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "addTarget:action:forControlEvents:", self, sel_didSelectQuickControl_, 64);

  -[MRUMediaControlsModuleViewController contentMetrics](self, "contentMetrics");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setContentMetrics:", v29);

  -[MRUMediaControlsModuleViewController view](self, "view");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "stylingProvider");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "cellContentView");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "setStylingProvider:", v31);

  objc_msgSend(v6, "setContentEdgeInsets:", MRUMediaModuleContentInsetsForLayout(1));
  CCUINumberOfRowsForGridSizeClass();
  MEMORY[0x1AF423F90]();
  CCUILayoutGutter();
  CCUICompactModuleContinuousCornerRadiusForGridSizeClass();
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
  -[MRUMediaControlsModuleViewController activeIdentifier](self, "activeIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UICollectionViewDiffableDataSource indexPathForItemIdentifier:](dataSource, "indexPathForItemIdentifier:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  -[MRUMediaControlsModuleViewController view](self, "view");
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
        -[MRUMediaControlsModuleViewController view](self, "view");
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

- (void)transitionToLayout:(int64_t)a3 completion:(id)a4
{
  void (**v6)(_QWORD);
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  UICollectionViewDiffableDataSource *dataSource;
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
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  void *v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  void *v44;
  void *v45;
  id v46;
  void *v47;
  void *v48;
  void *v49;
  UICollectionViewDiffableDataSource *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  void *v65;
  double v66;
  double v67;
  double v68;
  double v69;
  double v70;
  double v71;
  double v72;
  double v73;
  void *v74;
  void *v75;
  void *v76;
  _QWORD v77[5];
  void (**v78)(_QWORD);
  _QWORD v79[6];
  _QWORD v80[5];
  void (**v81)(_QWORD);
  _QWORD v82[5];
  id v83;
  int64_t v84;

  v6 = (void (**)(_QWORD))a4;
  -[MRUMediaControlsModuleViewController view](self, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "layout") == 6)
  {

    if ((unint64_t)(a3 - 1) <= 1)
      goto LABEL_12;
  }
  else
  {
    -[MRUMediaControlsModuleViewController view](self, "view");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "layout") == 7)
    {

      if ((unint64_t)(a3 - 1) < 2)
        goto LABEL_12;
    }
    else
    {
      -[MRUMediaControlsModuleViewController view](self, "view");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v9, "layout") == 8)
      {

        if ((unint64_t)(a3 - 1) < 2)
        {
LABEL_12:
          -[MRUMediaControlsModuleViewController view](self, "view");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "setTransitioning:", 1);

          -[MRUMediaControlsModuleViewController view](self, "view");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "collectionViewLayout");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "invalidateLayout");

          dataSource = self->_dataSource;
          -[MRUMediaControlsModuleViewController activeIdentifier](self, "activeIdentifier");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          -[UICollectionViewDiffableDataSource indexPathForItemIdentifier:](dataSource, "indexPathForItemIdentifier:", v16);
          v17 = (void *)objc_claimAutoreleasedReturnValue();

          -[MRUMediaControlsModuleViewController view](self, "view");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "collectionView");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "scrollToItemAtIndexPath:atScrollPosition:animated:", v17, 2, 0);

          -[MRUMediaControlsModuleViewController view](self, "view");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "collectionView");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "layoutIfNeeded");

          -[MRUMediaControlsModuleViewController view](self, "view");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "collectionView");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "cellForItemAtIndexPath:", v17);
          v24 = (void *)objc_claimAutoreleasedReturnValue();

          -[MRUMediaControlsModuleViewController view](self, "view");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "collectionView");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "frame");
          v28 = v27;
          v30 = v29;
          v32 = v31;
          v34 = v33;
          -[MRUMediaControlsModuleViewController view](self, "view");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "convertRect:toView:", v35, v28, v30, v32, v34);
          v37 = v36;
          v39 = v38;
          v41 = v40;
          v43 = v42;
          -[MRUMediaControlsModuleViewController view](self, "view");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v44, "setTransitionFrame:", v37, v39, v41, v43);

          -[MRUMediaControlsModuleViewController updateVisibilityForActiveCell:inActiveCells:](self, "updateVisibilityForActiveCell:inActiveCells:", 0, 0);
          v45 = (void *)MEMORY[0x1E0DC3F10];
          v82[0] = MEMORY[0x1E0C809B0];
          v82[1] = 3221225472;
          v82[2] = __70__MRUMediaControlsModuleViewController_transitionToLayout_completion___block_invoke;
          v82[3] = &unk_1E58192F0;
          v83 = v24;
          v84 = a3;
          v82[4] = self;
          v80[0] = MEMORY[0x1E0C809B0];
          v80[1] = 3221225472;
          v80[2] = __70__MRUMediaControlsModuleViewController_transitionToLayout_completion___block_invoke_2;
          v80[3] = &unk_1E5819D58;
          v80[4] = self;
          v81 = v6;
          v46 = v24;
          objc_msgSend(v45, "mru_animateUsingType:animations:completion:", 0, v82, v80);

LABEL_19:
          goto LABEL_23;
        }
      }
      else
      {
        -[MRUMediaControlsModuleViewController view](self, "view");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "layout");

        if ((unint64_t)(a3 - 1) <= 1 && v11 == 9)
          goto LABEL_12;
      }
    }
  }
  -[MRUMediaControlsModuleViewController view](self, "view");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v47, "layout") != 1)
  {
    -[MRUMediaControlsModuleViewController view](self, "view");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v48, "layout") != 2)
    {

      goto LABEL_21;
    }

    if ((a3 & 0xFFFFFFFFFFFFFFFELL) != 6)
      goto LABEL_21;
LABEL_18:
    -[MRUMediaControlsModuleViewController view](self, "view");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "setTransitioning:", 1);

    v50 = self->_dataSource;
    -[MRUMediaControlsModuleViewController activeIdentifier](self, "activeIdentifier");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    -[UICollectionViewDiffableDataSource indexPathForItemIdentifier:](v50, "indexPathForItemIdentifier:", v51);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    -[MRUMediaControlsModuleViewController view](self, "view");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "collectionView");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "cellForItemAtIndexPath:", v17);
    v54 = (void *)objc_claimAutoreleasedReturnValue();

    -[MRUMediaControlsModuleViewController view](self, "view");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "collectionView");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "frame");
    v58 = v57;
    v60 = v59;
    v62 = v61;
    v64 = v63;
    -[MRUMediaControlsModuleViewController view](self, "view");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "convertRect:toView:", v65, v58, v60, v62, v64);
    v67 = v66;
    v69 = v68;
    v71 = v70;
    v73 = v72;
    -[MRUMediaControlsModuleViewController view](self, "view");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v74, "setTransitionFrame:", v67, v69, v71, v73);

    -[MRUMediaControlsModuleViewController view](self, "view");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v75, "layoutIfNeeded");

    -[MRUMediaControlsModuleViewController updateVisibilityForActiveCell:inActiveCells:](self, "updateVisibilityForActiveCell:inActiveCells:", 0, 1);
    v76 = (void *)MEMORY[0x1E0DC3F10];
    v79[0] = MEMORY[0x1E0C809B0];
    v79[1] = 3221225472;
    v79[2] = __70__MRUMediaControlsModuleViewController_transitionToLayout_completion___block_invoke_3;
    v79[3] = &unk_1E5819110;
    v79[4] = self;
    v79[5] = a3;
    v77[0] = MEMORY[0x1E0C809B0];
    v77[1] = 3221225472;
    v77[2] = __70__MRUMediaControlsModuleViewController_transitionToLayout_completion___block_invoke_4;
    v77[3] = &unk_1E5819D58;
    v77[4] = self;
    v78 = v6;
    objc_msgSend(v76, "mru_animateUsingType:animations:completion:", 0, v79, v77);

    goto LABEL_19;
  }

  if ((a3 & 0xFFFFFFFFFFFFFFFELL) == 6)
    goto LABEL_18;
LABEL_21:
  -[MRUMediaControlsModuleViewController setLayout:](self, "setLayout:", a3);
  if (v6)
    v6[2](v6);
LABEL_23:

}

void __70__MRUMediaControlsModuleViewController_transitionToLayout_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
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
  id v22;

  objc_msgSend(*(id *)(a1 + 32), "setLayout:", *(_QWORD *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 32), "updateVisibilityForActiveCell:inActiveCells:", 0, 1);
  objc_msgSend(*(id *)(a1 + 32), "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "layoutIfNeeded");

  objc_msgSend(*(id *)(a1 + 32), "view");
  v22 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "collectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "frame");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  objc_msgSend(*(id *)(a1 + 32), "view");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "convertRect:toView:", v12, v5, v7, v9, v11);
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v20 = v19;
  objc_msgSend(*(id *)(a1 + 32), "view");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setTransitionFrame:", v14, v16, v18, v20);

}

uint64_t __70__MRUMediaControlsModuleViewController_transitionToLayout_completion___block_invoke_2(uint64_t a1)
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

void __70__MRUMediaControlsModuleViewController_transitionToLayout_completion___block_invoke_3(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "setLayout:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "updateVisibilityForActiveCell:inActiveCells:", 0, 0);
  objc_msgSend(*(id *)(a1 + 32), "view");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "layoutIfNeeded");

}

uint64_t __70__MRUMediaControlsModuleViewController_transitionToLayout_completion___block_invoke_4(uint64_t a1)
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

- (int64_t)discoveryMode
{
  return self->_discoveryMode;
}

- (void)setDiscoveryMode:(int64_t)a3
{
  self->_discoveryMode = a3;
}

- (CCUIModuleContentMetrics)contentMetrics
{
  return self->_contentMetrics;
}

- (id)homeGestureDismissalAllowedBlock
{
  return self->_homeGestureDismissalAllowedBlock;
}

- (void)setHomeGestureDismissalAllowedBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 992);
}

- (MRUNowPlayingControllerManager)manager
{
  return self->_manager;
}

- (id)routingCornerViewTappedBlock
{
  return self->_routingCornerViewTappedBlock;
}

- (void)setRoutingCornerViewTappedBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1008);
}

- (id)dismissalBlock
{
  return self->_dismissalBlock;
}

- (void)setDismissalBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1016);
}

- (int64_t)gridSizeClass
{
  return self->_gridSizeClass;
}

- (double)compactContinuousCornerRadius
{
  return self->_compactContinuousCornerRadius;
}

- (unint64_t)contentRenderingMode
{
  return self->_contentRenderingMode;
}

- (BOOL)isResizing
{
  return self->_resizing;
}

- (UICollectionViewDiffableDataSource)dataSource
{
  return self->_dataSource;
}

- (void)setDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_dataSource, a3);
}

- (MRUMediaControlsModuleNowPlayingViewController)nowPlayingViewController
{
  return self->_nowPlayingViewController;
}

- (void)setNowPlayingViewController:(id)a3
{
  objc_storeStrong((id *)&self->_nowPlayingViewController, a3);
}

- (MRURoutingViewController)routingViewController
{
  return self->_routingViewController;
}

- (void)setRoutingViewController:(id)a3
{
  objc_storeStrong((id *)&self->_routingViewController, a3);
}

- (UIViewController)alertViewController
{
  return self->_alertViewController;
}

- (BOOL)isOnScreen
{
  return self->_onScreen;
}

- (BOOL)isExpanded
{
  return self->_isExpanded;
}

- (void)setIsExpanded:(BOOL)a3
{
  self->_isExpanded = a3;
}

- (int64_t)expandedLayout
{
  return self->_expandedLayout;
}

- (void)setExpandedLayout:(int64_t)a3
{
  self->_expandedLayout = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alertViewController, 0);
  objc_storeStrong((id *)&self->_routingViewController, 0);
  objc_storeStrong((id *)&self->_nowPlayingViewController, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong(&self->_dismissalBlock, 0);
  objc_storeStrong(&self->_routingCornerViewTappedBlock, 0);
  objc_storeStrong((id *)&self->_manager, 0);
  objc_storeStrong(&self->_homeGestureDismissalAllowedBlock, 0);
  objc_storeStrong((id *)&self->_contentMetrics, 0);
}

@end
