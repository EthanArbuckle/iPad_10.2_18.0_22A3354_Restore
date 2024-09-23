@implementation AVTAvatarActionsViewController

- (AVTAvatarActionsViewController)initWithAVTViewSessionProvider:(id)a3 actionsController:(id)a4 environment:(id)a5
{
  id v9;
  id v10;
  id v11;
  AVTAvatarActionsViewController *v12;
  AVTAvatarActionsViewController *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)AVTAvatarActionsViewController;
  v12 = -[AVTAvatarActionsViewController initWithNibName:bundle:](&v15, sel_initWithNibName_bundle_, 0, 0);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_sessionProvider, a3);
    objc_storeStrong((id *)&v13->_actionsController, a4);
    objc_storeStrong((id *)&v13->_environment, a5);
    objc_msgSend(v10, "setDelegate:", v13);
    v13->_allowFacetracking = AVTUIIsFacetrackingSupported();
  }

  return v13;
}

- (void)configureAVTViewSession:(id)a3 withAvatarRecord:(id)a4 completionBlock:(id)a5
{
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  int v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;

  v20 = a3;
  v8 = a5;
  v9 = a4;
  objc_msgSend(v20, "avtView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "updateInterfaceOrientation");

  v11 = AVTUIShowTrackingLostReticle_once();
  objc_msgSend(v20, "avtView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setEnableReticle:", v11);

  if ((AVTUIForceCameraDisclosures_once() & 1) != 0 || AVTDeviceIsGreenTea())
    v13 = AVTUIHasDisplayedCameraDisclosureSplashScreen();
  else
    v13 = 1;
  v14 = -[AVTAvatarActionsViewController allowFacetracking](self, "allowFacetracking") & v13;
  objc_msgSend(v20, "avtView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setEnableFaceTracking:", v14);

  -[AVTAvatarActionsViewController view](self, "view");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "backgroundColor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "avtView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setBackgroundColor:", v17);

  objc_msgSend(v20, "avtViewUpdater");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setAvatarRecord:completionHandler:", v9, v8);

}

- (void)loadView
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  AVTImageTransitioningContainerView *v8;
  void *v9;
  AVTImageTransitioningContainerView *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  id v18;

  v3 = objc_alloc(MEMORY[0x1E0CEABB0]);
  objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  v5 = (void *)objc_msgSend(v3, "initWithFrame:");
  -[AVTAvatarActionsViewController setView:](self, "setView:", v5);

  +[AVTUIColorRepository modalBackgroundColor](AVTUIColorRepository, "modalBackgroundColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTAvatarActionsViewController view](self, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setBackgroundColor:", v6);

  v8 = [AVTImageTransitioningContainerView alloc];
  -[AVTAvatarActionsViewController view](self, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "bounds");
  v10 = -[AVTImageTransitioningContainerView initWithFrame:layoutMode:](v8, "initWithFrame:layoutMode:", 1);
  -[AVTAvatarActionsViewController setAvatarContainer:](self, "setAvatarContainer:", v10);

  -[AVTAvatarActionsViewController sessionProvider](self, "sessionProvider");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "avtViewBackingSize");
  v13 = v12;
  v15 = v14;
  -[AVTAvatarActionsViewController avatarContainer](self, "avatarContainer");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setAspectRatio:", v13, v15);

  -[AVTAvatarActionsViewController view](self, "view");
  v18 = (id)objc_claimAutoreleasedReturnValue();
  -[AVTAvatarActionsViewController avatarContainer](self, "avatarContainer");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "addSubview:", v17);

}

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AVTAvatarActionsViewController;
  -[AVTAvatarActionsViewController viewDidLoad](&v3, sel_viewDidLoad);
  -[AVTAvatarActionsViewController layoutViewForActionsController](self, "layoutViewForActionsController");
}

- (void)layoutViewForActionsController
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;

  -[AVTAvatarActionsViewController actionsController](self, "actionsController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "inlineActionButtons");
  v12 = (id)objc_claimAutoreleasedReturnValue();

  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA9E0]), "initWithArrangedSubviews:", v12);
  objc_msgSend(v4, "setAxis:", 1);
  objc_msgSend(v4, "setDistribution:", 1);
  objc_msgSend(v4, "setSpacing:", 10.0);
  -[AVTAvatarActionsViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addSubview:", v4);

  -[AVTAvatarActionsViewController buttonsView](self, "buttonsView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[AVTAvatarActionsViewController buttonsView](self, "buttonsView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "removeFromSuperview");

  }
  -[AVTAvatarActionsViewController setButtonsView:](self, "setButtonsView:", v4);
  -[AVTAvatarActionsViewController configureNavigationItems](self, "configureNavigationItems");
  -[AVTAvatarActionsViewController currentLayout](self, "currentLayout");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "buttonCount");
  v10 = objc_msgSend(v12, "count");

  if (v9 == v10)
  {
    -[AVTAvatarActionsViewController currentLayout](self, "currentLayout");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVTAvatarActionsViewController applyLayout:](self, "applyLayout:", v11);

  }
  else
  {
    -[AVTAvatarActionsViewController rebuildLayout](self, "rebuildLayout");
  }

}

- (void)configureNavigationItems
{
  void *v3;
  int v4;
  AVTToolbarButton *v5;
  void *v6;
  void *v7;
  AVTToolbarButton *v8;
  AVTToolBar *v9;
  void *v10;
  AVTToolBar *v11;
  void *v12;
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
  _QWORD v24[2];

  v24[1] = *MEMORY[0x1E0C80C00];
  -[AVTAvatarActionsViewController environment](self, "environment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "deviceIsMac");

  if (v4)
  {
    v5 = [AVTToolbarButton alloc];
    AVTAvatarUIBundle();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("DONE"), &stru_1EA5207B8, CFSTR("Localized"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[AVTToolbarButton initWithTitle:isDefault:](v5, "initWithTitle:isDefault:", v7, 1);

    v9 = [AVTToolBar alloc];
    v24[0] = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[AVTToolBar initWithButtons:](v9, "initWithButtons:", v10);

    -[AVTAvatarActionsViewController view](self, "view");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "bounds");
    v14 = v13;
    v16 = v15;
    v18 = v17;

    +[AVTToolBar defaultToolBarHeight](AVTToolBar, "defaultToolBarHeight");
    -[AVTToolBar setFrame:](v11, "setFrame:", v14, v18 - v19, v16, v19);
    -[AVTToolBar setAutoresizingMask:](v11, "setAutoresizingMask:", 10);
    -[AVTToolBar setDelegate:](v11, "setDelegate:", self);
    -[AVTAvatarActionsViewController view](self, "view");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "addSubview:", v11);

    -[AVTAvatarActionsViewController setToolbar:](self, "setToolbar:", v11);
    -[AVTAvatarActionsViewController navigationController](self, "navigationController");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setNavigationBarHidden:", 1);

  }
  else
  {
    v23 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA380]), "initWithBarButtonSystemItem:target:action:", 0, self, sel_didTapDone_);
    -[AVTAvatarActionsViewController navigationItem](self, "navigationItem");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setRightBarButtonItem:", v23);

  }
}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)AVTAvatarActionsViewController;
  -[AVTAvatarActionsViewController viewWillAppear:](&v5, sel_viewWillAppear_, a3);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObserver:selector:name:object:", self, sel_contentSizeCategoryDidChange_, *MEMORY[0x1E0CEB3F0], 0);

  -[AVTAvatarActionsViewController beginAVTViewSessionWithDidBeginBlock:](self, "beginAVTViewSessionWithDidBeginBlock:", 0);
}

- (void)viewWillDisappear:(BOOL)a3
{
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)AVTAvatarActionsViewController;
  -[AVTAvatarActionsViewController viewWillDisappear:](&v6, sel_viewWillDisappear_, a3);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:name:object:", self, *MEMORY[0x1E0CEB3F0], 0);

  -[AVTAvatarActionsViewController avtViewSession](self, "avtViewSession");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "tearDownWithCompletionHandler:", 0);

}

- (void)contentSizeCategoryDidChange:(id)a3
{
  void *v4;

  -[AVTAvatarActionsViewController actionsController](self, "actionsController", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "updateForChangedContentCategorySize");

  -[AVTAvatarActionsViewController layoutViewForActionsController](self, "layoutViewForActionsController");
}

- (void)beginAVTViewSessionWithDidBeginBlock:(id)a3
{
  void (**v4)(id, void *);
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void (**v9)(_QWORD, _QWORD);
  void *v10;
  uint64_t v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;
  id location;

  v4 = (void (**)(id, void *))a3;
  -[AVTAvatarActionsViewController avtViewSession](self, "avtViewSession");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isActive");

  if (v6)
  {
    if (v4)
    {
      -[AVTAvatarActionsViewController avtViewSession](self, "avtViewSession");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v4[2](v4, v7);

    }
  }
  else
  {
    -[AVTAvatarActionsViewController postSessionDidBecomeActiveHandler](self, "postSessionDidBecomeActiveHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      -[AVTAvatarActionsViewController postSessionDidBecomeActiveHandler](self, "postSessionDidBecomeActiveHandler");
      v9 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      v9[2](v9, 0);

    }
    -[AVTAvatarActionsViewController setPostSessionDidBecomeActiveHandler:](self, "setPostSessionDidBecomeActiveHandler:", v4);
    objc_initWeak(&location, self);
    -[AVTAvatarActionsViewController sessionProvider](self, "sessionProvider");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = MEMORY[0x1E0C809B0];
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __71__AVTAvatarActionsViewController_beginAVTViewSessionWithDidBeginBlock___block_invoke;
    v15[3] = &unk_1EA51D1D8;
    objc_copyWeak(&v16, &location);
    v13[0] = v11;
    v13[1] = 3221225472;
    v13[2] = __71__AVTAvatarActionsViewController_beginAVTViewSessionWithDidBeginBlock___block_invoke_2;
    v13[3] = &unk_1EA51D200;
    objc_copyWeak(&v14, &location);
    objc_msgSend(v10, "sessionWithDidBecomeActiveHandler:tearDownHandler:", v15, v13);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVTAvatarActionsViewController setAvtViewSession:](self, "setAvtViewSession:", v12);

    objc_destroyWeak(&v14);
    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }

}

void __71__AVTAvatarActionsViewController_beginAVTViewSessionWithDidBeginBlock___block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  void (**v5)(_QWORD, _QWORD);
  id v6;

  v6 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "beginUsingAVTViewFromSession:", v6);
  objc_msgSend(WeakRetained, "postSessionDidBecomeActiveHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(WeakRetained, "postSessionDidBecomeActiveHandler");
    v5 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id))v5)[2](v5, v6);

  }
  objc_msgSend(WeakRetained, "setPostSessionDidBecomeActiveHandler:", 0);

}

void __71__AVTAvatarActionsViewController_beginAVTViewSessionWithDidBeginBlock___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id *v4;
  void (**v5)(_QWORD);
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
  id WeakRetained;

  v4 = (id *)(a1 + 32);
  v5 = a3;
  v6 = a2;
  WeakRetained = objc_loadWeakRetained(v4);
  objc_msgSend(v6, "avtViewContainer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(WeakRetained, "tapGestureRecognizer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeGestureRecognizer:", v8);

  objc_msgSend(WeakRetained, "setTapGestureRecognizer:", 0);
  if ((objc_msgSend(WeakRetained, "shouldHideUserInfoView") & 1) == 0)
  {
    objc_msgSend(WeakRetained, "sessionProvider");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "faceTrackingManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "userInfoView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "removeFromSuperview");

  }
  objc_msgSend(WeakRetained, "sessionProvider");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "faceTrackingManager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setDelegate:", 0);

  v14 = (void *)MEMORY[0x1E0D006A8];
  objc_msgSend(WeakRetained, "avtViewSession");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "avtView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "avatarContainer");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "environment");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "logger");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "snapshotAVTView:matchingViewSize:highQuality:logger:", v16, v17, 1, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(WeakRetained, "avatarContainer");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setStaticImage:", v20);

  objc_msgSend(WeakRetained, "avatarContainer");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setLiveView:", 0);

  objc_msgSend(WeakRetained, "avatarContainer");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "transitionStaticViewToFront");

  objc_msgSend(WeakRetained, "setAvtViewSession:", 0);
  v5[2](v5);

}

- (void)beginUsingAVTViewFromSession:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v12[5];
  id v13;

  v4 = a3;
  -[AVTAvatarActionsViewController avatarContainer](self, "avatarContainer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "avtViewContainer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setLiveView:", v6);

  -[AVTAvatarActionsViewController avatarContainer](self, "avatarContainer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "transitionLiveViewToFront");

  -[AVTAvatarActionsViewController actionsController](self, "actionsController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "actionsModel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "avatarRecord");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __63__AVTAvatarActionsViewController_beginUsingAVTViewFromSession___block_invoke;
  v12[3] = &unk_1EA51D228;
  v12[4] = self;
  v13 = v4;
  v11 = v4;
  -[AVTAvatarActionsViewController configureAVTViewSession:withAvatarRecord:completionBlock:](self, "configureAVTViewSession:withAvatarRecord:completionBlock:", v11, v10, v12);

}

void __63__AVTAvatarActionsViewController_beginUsingAVTViewFromSession___block_invoke(uint64_t a1)
{
  void *v2;
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
  id v17;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEAA88]), "initWithTarget:action:", *(_QWORD *)(a1 + 32), sel_didTapAvatarView_);
  objc_msgSend(*(id *)(a1 + 32), "setTapGestureRecognizer:", v2);

  objc_msgSend(*(id *)(a1 + 40), "avtViewContainer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "tapGestureRecognizer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addGestureRecognizer:", v4);

  if (objc_msgSend(*(id *)(a1 + 32), "allowFacetracking"))
  {
    objc_msgSend(*(id *)(a1 + 32), "sessionProvider");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "faceTrackingManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setFaceTrackingManagementPaused:", 0);

    v7 = *(void **)(a1 + 32);
    objc_msgSend(v7, "sessionProvider");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "faceTrackingManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setDelegate:", v7);

    objc_msgSend(*(id *)(a1 + 32), "sessionProvider");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "faceTrackingManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "resumeFaceTrackingIfNeededAnimated:", 0);

    objc_msgSend(*(id *)(a1 + 40), "avtView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "transitionToFaceTrackingWithDuration:completionHandler:", 0, 0.0);

    if ((objc_msgSend(*(id *)(a1 + 32), "shouldHideUserInfoView") & 1) == 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "configureUserInfoLabel");
      objc_msgSend(*(id *)(a1 + 32), "view");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "sessionProvider");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "faceTrackingManager");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "userInfoView");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "bringSubviewToFront:", v16);

    }
  }
  objc_msgSend(*(id *)(a1 + 32), "view");
  v17 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setNeedsLayout");

}

- (void)configureUserInfoLabel
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  -[AVTAvatarActionsViewController sessionProvider](self, "sessionProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "faceTrackingManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "userInfoView");
  v10 = (id)objc_claimAutoreleasedReturnValue();

  -[AVTAvatarActionsViewController currentLayout](self, "currentLayout");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[AVTAvatarActionsViewController currentLayout](self, "currentLayout");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "userInfoFrame");
    objc_msgSend(v10, "setFrame:");

  }
  -[AVTAvatarActionsViewController view](self, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "backgroundColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setContainerBackgroundColor:", v8);

  -[AVTAvatarActionsViewController view](self, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addSubview:", v10);

}

- (UIEdgeInsets)additionalSafeAreaInsets
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
  double v13;
  UIEdgeInsets result;

  -[AVTAvatarActionsViewController toolbar](self, "toolbar");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[AVTAvatarActionsViewController toolbar](self, "toolbar");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "bounds");
    v6 = v5;

    v7 = 0.0;
    v8 = 0.0;
    v9 = 0.0;
  }
  else
  {
    v9 = *MEMORY[0x1E0CEB4B0];
    v8 = *(double *)(MEMORY[0x1E0CEB4B0] + 8);
    v6 = *(double *)(MEMORY[0x1E0CEB4B0] + 16);
    v7 = *(double *)(MEMORY[0x1E0CEB4B0] + 24);
  }

  v10 = v9;
  v11 = v8;
  v12 = v6;
  v13 = v7;
  result.right = v13;
  result.bottom = v12;
  result.left = v11;
  result.top = v10;
  return result;
}

- (void)viewDidLayoutSubviews
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
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
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  objc_super v30;

  v30.receiver = self;
  v30.super_class = (Class)AVTAvatarActionsViewController;
  -[AVTAvatarActionsViewController viewDidLayoutSubviews](&v30, sel_viewDidLayoutSubviews);
  -[AVTAvatarActionsViewController currentLayout](self, "currentLayout");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "containerSize");
  v5 = v4;
  v7 = v6;
  -[AVTAvatarActionsViewController view](self, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "bounds");
  if (v5 != v10 || v7 != v9)
  {

LABEL_6:
    -[AVTAvatarActionsViewController rebuildLayout](self, "rebuildLayout");
    return;
  }
  -[AVTAvatarActionsViewController currentLayout](self, "currentLayout");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "edgeInsets");
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v20 = v19;
  -[AVTAvatarActionsViewController view](self, "view");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "safeAreaInsets");
  v23 = v22;
  v25 = v24;
  v27 = v26;
  v29 = v28;

  if (v16 != v25 || v14 != v23 || v20 != v29 || v18 != v27)
    goto LABEL_6;
}

- (void)rebuildLayout
{
  void *v3;
  void *v4;
  int v5;
  __objc2_class *v6;
  id v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  id v26;

  -[AVTAvatarActionsViewController environment](self, "environment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "deviceIsPad"))
  {

  }
  else
  {
    -[AVTAvatarActionsViewController environment](self, "environment");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "deviceIsMac");

    if (!v5)
    {
      v6 = AVTAvatarActionsViewControllerLayout;
      goto LABEL_6;
    }
  }
  v6 = AVTAvatarActionsViewControllerPadLayout;
LABEL_6:
  v7 = [v6 alloc];
  -[AVTAvatarActionsViewController view](self, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "bounds");
  v10 = v9;
  v12 = v11;
  -[AVTAvatarActionsViewController view](self, "view");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "safeAreaInsets");
  v15 = v14;
  v17 = v16;
  v19 = v18;
  v21 = v20;
  -[AVTAvatarActionsViewController buttonsView](self, "buttonsView");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "arrangedSubviews");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v23, "count");
  -[AVTAvatarActionsViewController sessionProvider](self, "sessionProvider");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = (id)objc_msgSend(v7, "initWithContainerSize:insets:buttonCount:avtViewLayoutInfo:", v24, v25, v10, v12, v15, v17, v19, v21);

  -[AVTAvatarActionsViewController applyLayout:](self, "applyLayout:", v26);
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  id v7;
  _QWORD v8[5];
  objc_super v9;

  height = a3.height;
  width = a3.width;
  v9.receiver = self;
  v9.super_class = (Class)AVTAvatarActionsViewController;
  v7 = a4;
  -[AVTAvatarActionsViewController viewWillTransitionToSize:withTransitionCoordinator:](&v9, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __85__AVTAvatarActionsViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v8[3] = &unk_1EA51D1B0;
  v8[4] = self;
  objc_msgSend(v7, "animateAlongsideTransition:completion:", v8, 0);

}

void __85__AVTAvatarActionsViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "avtViewSession");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "avtView");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "updateInterfaceOrientation");

}

- (void)applyLayout:(id)a3
{
  BOOL v4;
  void *v5;
  void *v6;
  int v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  void *v26;
  void *v27;
  double v28;
  double v29;
  void *v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  void *v39;
  id v40;

  v40 = a3;
  v4 = -[AVTAvatarActionsViewController isAnimating](self, "isAnimating");
  v5 = v40;
  if (v40 && !v4)
  {
    -[AVTAvatarActionsViewController avtViewSession](self, "avtViewSession");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isActive");

    if (v7)
    {
      objc_msgSend(v40, "avatarContainerViewFrame");
      v9 = v8;
      v11 = v10;
      v13 = v12;
      v15 = v14;
      -[AVTAvatarActionsViewController avatarContainer](self, "avatarContainer");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setFrame:", v9, v11, v13, v15);

      if (!-[AVTAvatarActionsViewController shouldHideUserInfoView](self, "shouldHideUserInfoView"))
      {
        objc_msgSend(v40, "userInfoFrame");
        v18 = v17;
        v20 = v19;
        v22 = v21;
        v24 = v23;
        -[AVTAvatarActionsViewController sessionProvider](self, "sessionProvider");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "faceTrackingManager");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "userInfoView");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "setFrame:", v18, v20, v22, v24);

      }
    }
    objc_msgSend(v40, "actionButtonsViewAlpha");
    v29 = v28;
    -[AVTAvatarActionsViewController buttonsView](self, "buttonsView");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setAlpha:", v29);

    objc_msgSend(v40, "actionButtonsViewFrame");
    v32 = v31;
    v34 = v33;
    v36 = v35;
    v38 = v37;
    -[AVTAvatarActionsViewController buttonsView](self, "buttonsView");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "setFrame:", v32, v34, v36, v38);

    -[AVTAvatarActionsViewController setCurrentLayout:](self, "setCurrentLayout:", v40);
    v5 = v40;
  }

}

- (void)createTransitionImageViewIfNeeded
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  int v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  id v17;

  -[AVTAvatarActionsViewController transitionImageView](self, "transitionImageView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v4 = objc_alloc_init(MEMORY[0x1E0CEA658]);
    -[AVTAvatarActionsViewController setTransitionImageView:](self, "setTransitionImageView:", v4);

    -[AVTAvatarActionsViewController transitionImageView](self, "transitionImageView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setContentMode:", 1);

    -[AVTAvatarActionsViewController avtViewSession](self, "avtViewSession");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isActive");

    if (v7)
    {
      -[AVTAvatarActionsViewController avatarContainer](self, "avatarContainer");
      v17 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "frame");
      v9 = v8;
      v11 = v10;
      v13 = v12;
      v15 = v14;
      -[AVTAvatarActionsViewController transitionImageView](self, "transitionImageView");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setFrame:", v9, v11, v13, v15);

    }
  }
}

- (void)didTapAvatarView:(id)a3
{
  void *v4;
  int v5;
  void *v6;
  id v7;

  -[AVTAvatarActionsViewController avtViewSession](self, "avtViewSession", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isActive");

  if (v5)
  {
    -[AVTAvatarActionsViewController sessionProvider](self, "sessionProvider");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "faceTrackingManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "resumeFaceTrackingIfNeededAnimated:", 1);

  }
}

- (void)didTapDone:(id)a3
{
  id v4;

  -[AVTAvatarActionsViewController delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "avatarActionsViewControllerDidFinish:", self);

}

- (void)prepareForAnimatedTransitionWithLayout:(id)a3 completionBlock:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id v13;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __89__AVTAvatarActionsViewController_prepareForAnimatedTransitionWithLayout_completionBlock___block_invoke;
  v10[3] = &unk_1EA51F208;
  objc_copyWeak(&v13, &location);
  v8 = v6;
  v11 = v8;
  v9 = v7;
  v12 = v9;
  -[AVTAvatarActionsViewController beginAVTViewSessionWithDidBeginBlock:](self, "beginAVTViewSessionWithDidBeginBlock:", v10);

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);

}

void __89__AVTAvatarActionsViewController_prepareForAnimatedTransitionWithLayout_completionBlock___block_invoke(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "applyLayout:", *(_QWORD *)(a1 + 32));
  objc_msgSend(WeakRetained, "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "layoutIfNeeded");

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)toolbar:(id)a3 didSelectButton:(id)a4 atIndex:(unint64_t)a5
{
  -[AVTAvatarActionsViewController didTapDone:](self, "didTapDone:", a4);
}

- (void)presentEditorViewController:(id)a3 forActionsController:(id)a4 isCreate:(BOOL)a5
{
  AVTTransparentNavigationController *v7;
  void *v8;
  id v9;

  v9 = a3;
  -[AVTAvatarActionsViewController setEditorViewController:](self, "setEditorViewController:");
  if (a5
    || +[AVTAvatarEditorViewController shouldShowSplashScreen](AVTAvatarEditorViewController, "shouldShowSplashScreen"))
  {
    v7 = -[AVTTransparentNavigationController initWithRootViewController:]([AVTTransparentNavigationController alloc], "initWithRootViewController:", v9);
    -[AVTAvatarActionsViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v7, 1, 0);
  }
  else
  {
    -[AVTAvatarActionsViewController navigationController](self, "navigationController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setDelegate:", self);

    -[AVTAvatarActionsViewController navigationController](self, "navigationController");
    v7 = (AVTTransparentNavigationController *)objc_claimAutoreleasedReturnValue();
    -[AVTTransparentNavigationController pushViewController:animated:](v7, "pushViewController:animated:", v9, 1);
  }

}

- (void)dismissEditorViewController:(id)a3 forActionsController:(id)a4 wasCreate:(BOOL)a5 didEdit:(BOOL)a6 animated:(BOOL)a7 completion:(id)a8
{
  _BOOL8 v9;
  id v14;
  void (**v15)(_QWORD);
  void *v16;
  void *v17;
  id v18;
  id v19;

  v9 = a7;
  v19 = a3;
  v14 = a4;
  v15 = (void (**)(_QWORD))a8;
  if (a5
    || (-[AVTAvatarActionsViewController presentedViewController](self, "presentedViewController"),
        v16 = (void *)objc_claimAutoreleasedReturnValue(),
        v16,
        v16))
  {
    if (!a6)
    {
      -[AVTAvatarActionsViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", v9, v15);
      goto LABEL_8;
    }
  }
  else
  {
    -[AVTAvatarActionsViewController navigationController](self, "navigationController");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (id)objc_msgSend(v17, "popViewControllerAnimated:", 1);

  }
  if (v15)
    v15[2](v15);
LABEL_8:
  -[AVTAvatarActionsViewController setEditorViewController:](self, "setEditorViewController:", 0);

}

- (void)actionsController:(id)a3 didAddRecord:(id)a4
{
  void *v5;
  char v6;
  void *v7;
  id v8;

  v8 = a4;
  -[AVTAvatarActionsViewController delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[AVTAvatarActionsViewController delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "avatarActionsViewController:didPerformAction:withAvatarRecord:", self, 3, v8);

  }
  -[AVTAvatarActionsViewController willPresentAvatarRecord:](self, "willPresentAvatarRecord:", v8);

}

- (void)actionsController:(id)a3 didEditRecord:(id)a4
{
  void *v5;
  char v6;
  void *v7;
  id v8;

  v8 = a4;
  -[AVTAvatarActionsViewController delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[AVTAvatarActionsViewController delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "avatarActionsViewController:didPerformAction:withAvatarRecord:", self, 0, v8);

  }
  -[AVTAvatarActionsViewController willPresentAvatarRecord:](self, "willPresentAvatarRecord:", v8);

}

- (void)actionsController:(id)a3 didCancelEditingRecord:(id)a4
{
  -[AVTAvatarActionsViewController willPresentAvatarRecord:](self, "willPresentAvatarRecord:", a4);
}

- (void)willPresentAvatarRecord:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  id v7;

  v7 = a3;
  -[AVTAvatarActionsViewController delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[AVTAvatarActionsViewController delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "avatarActionsViewController:willPresentAvatarRecord:", self, v7);

  }
}

- (void)actionsController:(id)a3 didDuplicateToRecord:(id)a4 completionBlock:(id)a5
{
  id v7;
  id v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  _QWORD v20[5];
  id v21;

  v7 = a4;
  v8 = a5;
  -[AVTAvatarActionsViewController delegate](self, "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_opt_respondsToSelector();

  if ((v10 & 1) != 0)
  {
    -[AVTAvatarActionsViewController delegate](self, "delegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "avatarActionsViewController:didPerformAction:withAvatarRecord:", self, 3, v7);

  }
  v12 = (void *)MEMORY[0x1E0D006A8];
  -[AVTAvatarActionsViewController avtViewSession](self, "avtViewSession");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "avtView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTAvatarActionsViewController avatarContainer](self, "avatarContainer");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTAvatarActionsViewController environment](self, "environment");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "logger");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "snapshotAVTView:matchingViewSize:highQuality:logger:", v14, v15, 1, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  -[AVTAvatarActionsViewController createTransitionImageViewIfNeeded](self, "createTransitionImageViewIfNeeded");
  -[AVTAvatarActionsViewController setIsAnimating:](self, "setIsAnimating:", 1);
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __89__AVTAvatarActionsViewController_actionsController_didDuplicateToRecord_completionBlock___block_invoke;
  v20[3] = &unk_1EA51D490;
  v20[4] = self;
  v21 = v8;
  v19 = v8;
  -[AVTAvatarActionsViewController performTransitionAfterDuplicateToRecord:previousRecordImage:completionBlock:](self, "performTransitionAfterDuplicateToRecord:previousRecordImage:completionBlock:", v7, v18, v20);

}

uint64_t __89__AVTAvatarActionsViewController_actionsController_didDuplicateToRecord_completionBlock___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setIsAnimating:", 0);
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (id)actionsModel:(id)a3 recordUpdateForDeletingRecord:(id)a4
{
  id v5;
  void *v6;
  void *v7;

  v5 = a4;
  -[AVTAvatarActionsViewController delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "avatarActionsViewController:recordUpdateForDeletingRecord:", self, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)actionsController:(id)a3 didDeleteRecord:(id)a4 withRecordUpdate:(id)a5 completionBlock:(id)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  char v13;
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
  uint64_t v25;
  id v26;
  void *v27;
  _QWORD v28[5];
  id v29;

  v9 = a4;
  v10 = a6;
  v11 = a5;
  -[AVTAvatarActionsViewController delegate](self, "delegate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_opt_respondsToSelector();

  if ((v13 & 1) != 0)
  {
    -[AVTAvatarActionsViewController delegate](self, "delegate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "avatarActionsViewController:didPerformAction:withAvatarRecord:", self, 2, v9);

  }
  objc_msgSend(v11, "avatarRecord");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTAvatarActionsViewController willPresentAvatarRecord:](self, "willPresentAvatarRecord:", v15);

  v16 = (void *)MEMORY[0x1E0D006A8];
  -[AVTAvatarActionsViewController avtViewSession](self, "avtViewSession");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "avtView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTAvatarActionsViewController avtViewSession](self, "avtViewSession");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "avtView");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTAvatarActionsViewController environment](self, "environment");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "logger");
  v27 = v9;
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "snapshotAVTView:matchingViewSize:highQuality:logger:", v18, v20, 1, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  -[AVTAvatarActionsViewController createTransitionImageViewIfNeeded](self, "createTransitionImageViewIfNeeded");
  -[AVTAvatarActionsViewController setIsAnimating:](self, "setIsAnimating:", 1);
  objc_msgSend(v11, "avatarRecord");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v11, "fromLeft");

  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __101__AVTAvatarActionsViewController_actionsController_didDeleteRecord_withRecordUpdate_completionBlock___block_invoke;
  v28[3] = &unk_1EA51D490;
  v28[4] = self;
  v29 = v10;
  v26 = v10;
  -[AVTAvatarActionsViewController performTransitionAfterDeleteToRecord:fromLeft:previousRecordImage:completionBlock:](self, "performTransitionAfterDeleteToRecord:fromLeft:previousRecordImage:completionBlock:", v24, v25, v23, v28);

}

uint64_t __101__AVTAvatarActionsViewController_actionsController_didDeleteRecord_withRecordUpdate_completionBlock___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setIsAnimating:", 0);
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)actionsControllerDidFinish:(id)a3
{
  id v4;

  -[AVTAvatarActionsViewController delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "avatarActionsViewControllerDidFinish:", self);

}

- (void)actionsController:(id)a3 presentAlertController:(id)a4
{
  -[AVTAvatarActionsViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", a4, 1, 0);
}

- (double)duplicateScaleDuration
{
  void *v2;
  double v3;
  double v4;

  +[AVTUIEnvironment defaultEnvironment](AVTUIEnvironment, "defaultEnvironment");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "actionAnimationsMultiplier");
  v4 = v3 * 0.84 * 0.6;

  return v4;
}

- (double)duplicateScaleDelay
{
  void *v2;
  double v3;
  double v4;

  +[AVTUIEnvironment defaultEnvironment](AVTUIEnvironment, "defaultEnvironment");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "actionAnimationsMultiplier");
  v4 = v3 * 0.84 * 0.4;

  return v4;
}

- (void)performTransitionAfterDuplicateToRecord:(id)a3 previousRecordImage:(id)a4 completionBlock:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  void *v15;
  uint64_t v16;
  void *v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  CGFloat x;
  _QWORD v38[5];
  id v39;
  CGFloat v40;
  CGFloat v41;
  CGFloat v42;
  CGFloat v43;
  double v44;
  CGFloat v45;
  CGFloat v46;
  CGFloat v47;
  CGAffineTransform v48;
  CGAffineTransform v49;
  CGAffineTransform v50;
  CGRect v51;
  CGRect v52;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[AVTAvatarActionsViewController transitionImageView](self, "transitionImageView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "frame");
  v52 = CGRectInset(v51, 20.0, 20.0);
  x = v52.origin.x;
  y = v52.origin.y;
  width = v52.size.width;
  height = v52.size.height;

  -[AVTAvatarActionsViewController environment](self, "environment");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "userInterfaceLayoutDirection");

  -[AVTAvatarActionsViewController view](self, "view");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "bounds");
  if (v16)
    v19 = -v18;
  else
    v19 = v18;

  memset(&v50, 0, sizeof(v50));
  CGAffineTransformMakeScale(&v50, 0.0, 0.0);
  -[AVTAvatarActionsViewController transitionImageView](self, "transitionImageView");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setImage:", v9);

  -[AVTAvatarActionsViewController avatarContainer](self, "avatarContainer");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "frame");
  v23 = v22;
  v25 = v24;
  v27 = v26;
  v29 = v28;
  -[AVTAvatarActionsViewController transitionImageView](self, "transitionImageView");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setFrame:", v23, v25, v27, v29);

  -[AVTAvatarActionsViewController view](self, "view");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTAvatarActionsViewController transitionImageView](self, "transitionImageView");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "addSubview:", v32);

  v49 = v50;
  -[AVTAvatarActionsViewController avatarContainer](self, "avatarContainer");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = v49;
  objc_msgSend(v33, "setTransform:", &v48);

  -[AVTAvatarActionsViewController avatarContainer](self, "avatarContainer");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "setAlpha:", 0.0);

  -[AVTAvatarActionsViewController avtViewSession](self, "avtViewSession");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v38[0] = MEMORY[0x1E0C809B0];
  v38[1] = 3221225472;
  v38[2] = __110__AVTAvatarActionsViewController_performTransitionAfterDuplicateToRecord_previousRecordImage_completionBlock___block_invoke;
  v38[3] = &unk_1EA51F280;
  v40 = x;
  v41 = y;
  v42 = width;
  v43 = height;
  v44 = v19;
  v45 = y;
  v46 = width;
  v47 = height;
  v38[4] = self;
  v39 = v8;
  v36 = v8;
  -[AVTAvatarActionsViewController configureAVTViewSession:withAvatarRecord:completionBlock:](self, "configureAVTViewSession:withAvatarRecord:completionBlock:", v35, v10, v38);

}

void __110__AVTAvatarActionsViewController_performTransitionAfterDuplicateToRecord_previousRecordImage_completionBlock___block_invoke(uint64_t a1, int a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  double v6;
  double v7;
  __int128 v8;
  __int128 v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  _QWORD v15[5];
  _QWORD v16[5];
  id v17;
  _QWORD v18[4];
  uint64_t v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;

  if (a2)
  {
    v3 = (void *)MEMORY[0x1E0CEABB0];
    +[AVTUIEnvironment defaultEnvironment](AVTUIEnvironment, "defaultEnvironment");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "actionAnimationsMultiplier");
    v5 = MEMORY[0x1E0C809B0];
    v7 = v6 * 0.84;
    v18[0] = MEMORY[0x1E0C809B0];
    v8 = *(_OWORD *)(a1 + 64);
    v20 = *(_OWORD *)(a1 + 48);
    v21 = v8;
    v9 = *(_OWORD *)(a1 + 96);
    v22 = *(_OWORD *)(a1 + 80);
    v18[1] = 3221225472;
    v18[2] = __110__AVTAvatarActionsViewController_performTransitionAfterDuplicateToRecord_previousRecordImage_completionBlock___block_invoke_2;
    v18[3] = &unk_1EA51F258;
    v23 = v9;
    v16[2] = __110__AVTAvatarActionsViewController_performTransitionAfterDuplicateToRecord_previousRecordImage_completionBlock___block_invoke_6;
    v16[3] = &unk_1EA51E2B8;
    v10 = *(void **)(a1 + 40);
    v19 = *(_QWORD *)(a1 + 32);
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[4] = v19;
    v17 = v10;
    objc_msgSend(v3, "animateKeyframesWithDuration:delay:options:animations:completion:", 0, v18, v16, v7, 0.0);

    v11 = (void *)MEMORY[0x1E0CEABB0];
    objc_msgSend(*(id *)(a1 + 32), "duplicateScaleDuration");
    v13 = v12;
    objc_msgSend(*(id *)(a1 + 32), "duplicateScaleDelay");
    v15[0] = v5;
    v15[1] = 3221225472;
    v15[2] = __110__AVTAvatarActionsViewController_performTransitionAfterDuplicateToRecord_previousRecordImage_completionBlock___block_invoke_7;
    v15[3] = &unk_1EA51D188;
    v15[4] = *(_QWORD *)(a1 + 32);
    objc_msgSend(v11, "animateWithDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:", 0, v15, 0, v13, v14, 0.6, 0.0);

  }
}

uint64_t __110__AVTAvatarActionsViewController_performTransitionAfterDuplicateToRecord_previousRecordImage_completionBlock___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  _QWORD v4[5];
  _QWORD v5[5];
  __int128 v6;
  __int128 v7;
  _QWORD v8[5];
  __int128 v9;
  __int128 v10;

  v2 = MEMORY[0x1E0C809B0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __110__AVTAvatarActionsViewController_performTransitionAfterDuplicateToRecord_previousRecordImage_completionBlock___block_invoke_3;
  v8[3] = &unk_1EA51F230;
  v8[4] = *(_QWORD *)(a1 + 32);
  v9 = *(_OWORD *)(a1 + 40);
  v10 = *(_OWORD *)(a1 + 56);
  objc_msgSend(MEMORY[0x1E0CEABB0], "addKeyframeWithRelativeStartTime:relativeDuration:animations:", v8, 0.0, 0.1);
  v5[0] = v2;
  v5[1] = 3221225472;
  v5[2] = __110__AVTAvatarActionsViewController_performTransitionAfterDuplicateToRecord_previousRecordImage_completionBlock___block_invoke_4;
  v5[3] = &unk_1EA51F230;
  v5[4] = *(_QWORD *)(a1 + 32);
  v6 = *(_OWORD *)(a1 + 72);
  v7 = *(_OWORD *)(a1 + 88);
  objc_msgSend(MEMORY[0x1E0CEABB0], "addKeyframeWithRelativeStartTime:relativeDuration:animations:", v5, 0.2, 0.6);
  v4[0] = v2;
  v4[1] = 3221225472;
  v4[2] = __110__AVTAvatarActionsViewController_performTransitionAfterDuplicateToRecord_previousRecordImage_completionBlock___block_invoke_5;
  v4[3] = &unk_1EA51D188;
  v4[4] = *(_QWORD *)(a1 + 32);
  return objc_msgSend(MEMORY[0x1E0CEABB0], "addKeyframeWithRelativeStartTime:relativeDuration:animations:", v4, 0.4, 0.5);
}

void __110__AVTAvatarActionsViewController_performTransitionAfterDuplicateToRecord_previousRecordImage_completionBlock___block_invoke_3(uint64_t a1)
{
  double v1;
  double v2;
  double v3;
  double v4;
  id v5;

  v1 = *(double *)(a1 + 40);
  v2 = *(double *)(a1 + 48);
  v3 = *(double *)(a1 + 56);
  v4 = *(double *)(a1 + 64);
  objc_msgSend(*(id *)(a1 + 32), "transitionImageView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFrame:", v1, v2, v3, v4);

}

void __110__AVTAvatarActionsViewController_performTransitionAfterDuplicateToRecord_previousRecordImage_completionBlock___block_invoke_4(uint64_t a1)
{
  double v1;
  double v2;
  double v3;
  double v4;
  id v5;

  v1 = *(double *)(a1 + 40);
  v2 = *(double *)(a1 + 48);
  v3 = *(double *)(a1 + 56);
  v4 = *(double *)(a1 + 64);
  objc_msgSend(*(id *)(a1 + 32), "transitionImageView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFrame:", v1, v2, v3, v4);

}

void __110__AVTAvatarActionsViewController_performTransitionAfterDuplicateToRecord_previousRecordImage_completionBlock___block_invoke_5(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "avatarContainer");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setAlpha:", 1.0);

}

uint64_t __110__AVTAvatarActionsViewController_performTransitionAfterDuplicateToRecord_previousRecordImage_completionBlock___block_invoke_6(uint64_t a1, char a2)
{
  void *v3;
  void *v4;
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
  uint64_t result;

  if ((a2 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("Duplicate transtion interrupted unexpectedly!"), 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "raise");

  }
  objc_msgSend(*(id *)(a1 + 32), "transitionImageView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeFromSuperview");

  objc_msgSend(*(id *)(a1 + 32), "transitionImageView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAlpha:", 1.0);

  objc_msgSend(*(id *)(a1 + 32), "transitionImageView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setImage:", 0);

  objc_msgSend(*(id *)(a1 + 32), "avatarContainer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "frame");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;
  objc_msgSend(*(id *)(a1 + 32), "transitionImageView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setFrame:", v9, v11, v13, v15);

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __110__AVTAvatarActionsViewController_performTransitionAfterDuplicateToRecord_previousRecordImage_completionBlock___block_invoke_7(uint64_t a1)
{
  void *v1;
  __int128 v2;
  _OWORD v3[3];

  objc_msgSend(*(id *)(a1 + 32), "avatarContainer");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  v3[0] = *MEMORY[0x1E0C9BAA8];
  v3[1] = v2;
  v3[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  objc_msgSend(v1, "setTransform:", v3);

}

- (double)deleteMoveInDuration
{
  void *v2;
  double v3;
  double v4;

  +[AVTUIEnvironment defaultEnvironment](AVTUIEnvironment, "defaultEnvironment");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "actionAnimationsMultiplier");
  v4 = v3 * 0.84 * 0.5;

  return v4;
}

- (double)deleteMoveInDelay
{
  void *v2;
  double v3;
  double v4;

  +[AVTUIEnvironment defaultEnvironment](AVTUIEnvironment, "defaultEnvironment");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "actionAnimationsMultiplier");
  v4 = v3 * 0.84 * 0.5;

  return v4;
}

- (void)performTransitionAfterDeleteToRecord:(id)a3 fromLeft:(BOOL)a4 previousRecordImage:(id)a5 completionBlock:(id)a6
{
  int v8;
  id v10;
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  void *v32;
  int v33;
  double MaxX;
  void *v35;
  void *v36;
  void *v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  uint64_t v50;
  id v56;
  uint64_t v57;
  void *v58;
  double v59;
  double v60;
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  uint64_t v65;
  _QWORD block[5];
  id v67;
  id v68;
  _QWORD v69[5];
  id v70;
  CGFloat v71;
  CGFloat v72;
  CGFloat v73;
  CGFloat v74;
  double v75;
  double v76;
  __int128 v77;
  uint64_t v78;
  double v79;
  double v80;
  double v81;
  BOOL v82;
  CGRect v83;
  CGRect v84;
  CGRect v85;

  v8 = a4;
  v10 = a3;
  v11 = a6;
  v12 = a5;
  -[AVTAvatarActionsViewController avatarContainer](self, "avatarContainer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "frame");
  v15 = v14;
  v59 = v17;
  v60 = v16;
  v19 = v18;

  -[AVTAvatarActionsViewController transitionImageView](self, "transitionImageView");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "frame");
  v84 = CGRectInset(v83, -20.0, -20.0);
  y = v84.origin.y;
  x = v84.origin.x;
  height = v84.size.height;
  width = v84.size.width;

  -[AVTAvatarActionsViewController transitionImageView](self, "transitionImageView");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "frame");
  v23 = v22;
  v25 = v24;
  v27 = v26;
  v29 = v28;

  v30 = v23 + v27 * 0.5;
  v31 = v25 + v29 * 0.5;
  -[AVTAvatarActionsViewController environment](self, "environment");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = objc_msgSend(v32, "userInterfaceLayoutDirection") != 0;

  v65 = v15;
  if (v33 == v8)
  {
    -[AVTAvatarActionsViewController view](self, "view");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "bounds");
    MaxX = CGRectGetMaxX(v85);

  }
  else
  {
    MaxX = 0.0 - v19;
  }
  -[AVTAvatarActionsViewController transitionImageView](self, "transitionImageView");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "setImage:", v12);

  -[AVTAvatarActionsViewController avatarContainer](self, "avatarContainer");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "frame");
  v39 = v38;
  v41 = v40;
  v43 = v42;
  v45 = v44;
  -[AVTAvatarActionsViewController transitionImageView](self, "transitionImageView");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "setFrame:", v39, v41, v43, v45);

  -[AVTAvatarActionsViewController view](self, "view");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTAvatarActionsViewController transitionImageView](self, "transitionImageView");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "addSubview:", v48);

  -[AVTAvatarActionsViewController avatarContainer](self, "avatarContainer");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "setFrame:", MaxX, v60, v19, v59);

  v50 = MEMORY[0x1E0C809B0];
  v69[0] = MEMORY[0x1E0C809B0];
  v69[1] = 3221225472;
  v69[2] = __116__AVTAvatarActionsViewController_performTransitionAfterDeleteToRecord_fromLeft_previousRecordImage_completionBlock___block_invoke;
  v69[3] = &unk_1EA51F2D0;
  v69[4] = self;
  v71 = x;
  v72 = y;
  v73 = width;
  v74 = height;
  v75 = v30;
  v76 = v31;
  __asm { FMOV            V0.2D, #1.0 }
  v77 = _Q0;
  v56 = v11;
  v70 = v56;
  v82 = v10 != 0;
  v78 = v65;
  v79 = v60;
  v80 = v19;
  v81 = v59;
  v57 = MEMORY[0x1DF0D0754](v69);
  v58 = (void *)v57;
  if (v10)
  {
    block[0] = v50;
    block[1] = 3221225472;
    block[2] = __116__AVTAvatarActionsViewController_performTransitionAfterDeleteToRecord_fromLeft_previousRecordImage_completionBlock___block_invoke_8;
    block[3] = &unk_1EA51F2F8;
    block[4] = self;
    v67 = v10;
    v68 = v58;
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
  else
  {
    (*(void (**)(uint64_t, uint64_t))(v57 + 16))(v57, 1);
  }

}

void __116__AVTAvatarActionsViewController_performTransitionAfterDeleteToRecord_fromLeft_previousRecordImage_completionBlock___block_invoke(uint64_t a1, int a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  double v6;
  double v7;
  __int128 v8;
  __int128 v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  __int128 v14;
  double v15;
  void *v16;
  double v17;
  dispatch_time_t v18;
  _QWORD v19[4];
  id v20;
  _QWORD v21[5];
  __int128 v22;
  __int128 v23;
  _QWORD v24[5];
  id v25;
  char v26;
  _QWORD v27[4];
  uint64_t v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;

  if (a2)
  {
    v3 = (void *)MEMORY[0x1E0CEABB0];
    +[AVTUIEnvironment defaultEnvironment](AVTUIEnvironment, "defaultEnvironment");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "actionAnimationsMultiplier");
    v5 = MEMORY[0x1E0C809B0];
    v7 = v6 * 0.84;
    v27[0] = MEMORY[0x1E0C809B0];
    v8 = *(_OWORD *)(a1 + 64);
    v29 = *(_OWORD *)(a1 + 48);
    v30 = v8;
    v9 = *(_OWORD *)(a1 + 96);
    v31 = *(_OWORD *)(a1 + 80);
    v27[1] = 3221225472;
    v27[2] = __116__AVTAvatarActionsViewController_performTransitionAfterDeleteToRecord_fromLeft_previousRecordImage_completionBlock___block_invoke_2;
    v27[3] = &unk_1EA51F258;
    v32 = v9;
    v24[2] = __116__AVTAvatarActionsViewController_performTransitionAfterDeleteToRecord_fromLeft_previousRecordImage_completionBlock___block_invoke_5;
    v24[3] = &unk_1EA51F2A8;
    v10 = *(void **)(a1 + 40);
    v28 = *(_QWORD *)(a1 + 32);
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[4] = v28;
    v25 = v10;
    v26 = *(_BYTE *)(a1 + 144);
    objc_msgSend(v3, "animateKeyframesWithDuration:delay:options:animations:completion:", 0, v27, v24, v7, 0.0);

    if (*(_BYTE *)(a1 + 144))
    {
      v11 = (void *)MEMORY[0x1E0CEABB0];
      objc_msgSend(*(id *)(a1 + 32), "deleteMoveInDuration");
      v13 = v12;
      objc_msgSend(*(id *)(a1 + 32), "deleteMoveInDelay");
      v21[0] = v5;
      v21[1] = 3221225472;
      v21[2] = __116__AVTAvatarActionsViewController_performTransitionAfterDeleteToRecord_fromLeft_previousRecordImage_completionBlock___block_invoke_6;
      v21[3] = &unk_1EA51F230;
      v21[4] = *(_QWORD *)(a1 + 32);
      v14 = *(_OWORD *)(a1 + 128);
      v22 = *(_OWORD *)(a1 + 112);
      v23 = v14;
      objc_msgSend(v11, "animateWithDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:", 0, v21, 0, v13, v15, 0.8, 0.0);
    }
    else
    {
      +[AVTUIEnvironment defaultEnvironment](AVTUIEnvironment, "defaultEnvironment");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "actionAnimationsMultiplier");
      v18 = dispatch_time(0, (uint64_t)(v17 * 0.84 * 0.2 * 1000000000.0));
      v19[0] = v5;
      v19[1] = 3221225472;
      v19[2] = __116__AVTAvatarActionsViewController_performTransitionAfterDeleteToRecord_fromLeft_previousRecordImage_completionBlock___block_invoke_7;
      v19[3] = &unk_1EA51D810;
      v20 = *(id *)(a1 + 40);
      dispatch_after(v18, MEMORY[0x1E0C80D38], v19);

    }
  }
}

uint64_t __116__AVTAvatarActionsViewController_performTransitionAfterDeleteToRecord_fromLeft_previousRecordImage_completionBlock___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  __int128 v3;
  _QWORD v5[5];
  __int128 v6;
  __int128 v7;
  _QWORD v8[5];
  __int128 v9;
  __int128 v10;

  v2 = MEMORY[0x1E0C809B0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __116__AVTAvatarActionsViewController_performTransitionAfterDeleteToRecord_fromLeft_previousRecordImage_completionBlock___block_invoke_3;
  v8[3] = &unk_1EA51F230;
  v8[4] = *(_QWORD *)(a1 + 32);
  v3 = *(_OWORD *)(a1 + 56);
  v9 = *(_OWORD *)(a1 + 40);
  v10 = v3;
  objc_msgSend(MEMORY[0x1E0CEABB0], "addKeyframeWithRelativeStartTime:relativeDuration:animations:", v8, 0.0, 0.1);
  v5[0] = v2;
  v5[1] = 3221225472;
  v5[2] = __116__AVTAvatarActionsViewController_performTransitionAfterDeleteToRecord_fromLeft_previousRecordImage_completionBlock___block_invoke_4;
  v5[3] = &unk_1EA51F230;
  v5[4] = *(_QWORD *)(a1 + 32);
  v6 = *(_OWORD *)(a1 + 72);
  v7 = *(_OWORD *)(a1 + 88);
  return objc_msgSend(MEMORY[0x1E0CEABB0], "addKeyframeWithRelativeStartTime:relativeDuration:animations:", v5, 0.2, 0.3);
}

void __116__AVTAvatarActionsViewController_performTransitionAfterDeleteToRecord_fromLeft_previousRecordImage_completionBlock___block_invoke_3(uint64_t a1)
{
  double v1;
  double v2;
  double v3;
  double v4;
  id v5;

  v1 = *(double *)(a1 + 40);
  v2 = *(double *)(a1 + 48);
  v3 = *(double *)(a1 + 56);
  v4 = *(double *)(a1 + 64);
  objc_msgSend(*(id *)(a1 + 32), "transitionImageView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFrame:", v1, v2, v3, v4);

}

void __116__AVTAvatarActionsViewController_performTransitionAfterDeleteToRecord_fromLeft_previousRecordImage_completionBlock___block_invoke_4(uint64_t a1)
{
  double v2;
  double v3;
  double v4;
  double v5;
  void *v6;
  id v7;

  v2 = *(double *)(a1 + 40);
  v3 = *(double *)(a1 + 48);
  v4 = *(double *)(a1 + 56);
  v5 = *(double *)(a1 + 64);
  objc_msgSend(*(id *)(a1 + 32), "transitionImageView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setFrame:", v2, v3, v4, v5);

  objc_msgSend(*(id *)(a1 + 32), "transitionImageView");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAlpha:", 0.0);

}

uint64_t __116__AVTAvatarActionsViewController_performTransitionAfterDeleteToRecord_fromLeft_previousRecordImage_completionBlock___block_invoke_5(uint64_t result, int a2)
{
  uint64_t v2;
  void *v3;
  void *v4;
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

  if (a2)
  {
    v2 = result;
    objc_msgSend(*(id *)(result + 32), "transitionImageView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "removeFromSuperview");

    objc_msgSend(*(id *)(v2 + 32), "transitionImageView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setAlpha:", 1.0);

    objc_msgSend(*(id *)(v2 + 32), "transitionImageView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setImage:", 0);

    objc_msgSend(*(id *)(v2 + 32), "avatarContainer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "frame");
    v8 = v7;
    v10 = v9;
    v12 = v11;
    v14 = v13;
    objc_msgSend(*(id *)(v2 + 32), "transitionImageView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setFrame:", v8, v10, v12, v14);

    result = *(_QWORD *)(v2 + 40);
    if (result)
    {
      if (*(_BYTE *)(v2 + 48))
        return (*(uint64_t (**)(void))(result + 16))();
    }
  }
  return result;
}

void __116__AVTAvatarActionsViewController_performTransitionAfterDeleteToRecord_fromLeft_previousRecordImage_completionBlock___block_invoke_6(uint64_t a1)
{
  double v1;
  double v2;
  double v3;
  double v4;
  id v5;

  v1 = *(double *)(a1 + 40);
  v2 = *(double *)(a1 + 48);
  v3 = *(double *)(a1 + 56);
  v4 = *(double *)(a1 + 64);
  objc_msgSend(*(id *)(a1 + 32), "avatarContainer");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFrame:", v1, v2, v3, v4);

}

uint64_t __116__AVTAvatarActionsViewController_performTransitionAfterDeleteToRecord_fromLeft_previousRecordImage_completionBlock___block_invoke_7(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __116__AVTAvatarActionsViewController_performTransitionAfterDeleteToRecord_fromLeft_previousRecordImage_completionBlock___block_invoke_8(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(v2, "avtViewSession");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __116__AVTAvatarActionsViewController_performTransitionAfterDeleteToRecord_fromLeft_previousRecordImage_completionBlock___block_invoke_9;
  v5[3] = &unk_1EA51D3F0;
  v4 = *(_QWORD *)(a1 + 40);
  v6 = *(id *)(a1 + 48);
  objc_msgSend(v2, "configureAVTViewSession:withAvatarRecord:completionBlock:", v3, v4, v5);

}

uint64_t __116__AVTAvatarActionsViewController_performTransitionAfterDeleteToRecord_fromLeft_previousRecordImage_completionBlock___block_invoke_9(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)navigationController:(id)a3 animationControllerForOperation:(int64_t)a4 fromViewController:(id)a5 toViewController:(id)a6
{
  void *v8;
  void *v9;
  double v10;
  double v11;
  __objc2_class *v12;
  id v13;
  void *v14;
  void *v15;
  _BOOL8 v16;
  void *v17;
  void *v18;

  -[AVTAvatarActionsViewController currentLayout](self, "currentLayout", a3, a4, a5, a6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    -[AVTAvatarActionsViewController currentLayout](self, "currentLayout");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "userInfoFrame");
    v11 = v10;

  }
  else
  {
    v11 = 0.0;
  }

  if (a4 == 1)
    v12 = AVTActionsToAttributeEditorTransitionAnimator;
  else
    v12 = AVTAttributeEditorToActionsTransitionAnimator;
  v13 = [v12 alloc];
  -[AVTAvatarActionsViewController sessionProvider](self, "sessionProvider");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTAvatarActionsViewController traitCollection](self, "traitCollection");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "layoutDirection") == 1;
  -[AVTAvatarActionsViewController environment](self, "environment");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v13, "initWithAVTViewLayoutInfo:userInfoViewHeight:RTL:environment:", v14, v16, v17, v11);

  return v18;
}

- (int64_t)interfaceOrientationForFaceTrackingManager:(id)a3
{
  void *v3;
  void *v4;
  int64_t v5;

  -[AVTAvatarActionsViewController view](self, "view", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "window");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "_windowInterfaceOrientation");

  return v5;
}

- (void)controllerPresentationWillObstructView:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  char isKindOfClass;
  id v10;

  v10 = a3;
  -[AVTAvatarActionsViewController editorViewController](self, "editorViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[AVTAvatarActionsViewController editorViewController](self, "editorViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "controllerPresentationWillObstructView:", v10);
LABEL_3:

    goto LABEL_4;
  }
  -[AVTAvatarActionsViewController presentedViewController](self, "presentedViewController");
  v6 = objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = (void *)v6;
    -[AVTAvatarActionsViewController presentedViewController](self, "presentedViewController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      -[AVTAvatarActionsViewController presentedViewController](self, "presentedViewController");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "dismissViewControllerAnimated:completion:", 0, 0);
      goto LABEL_3;
    }
  }
LABEL_4:

}

- (AVTAvatarActionsViewControllerDelegate)delegate
{
  return (AVTAvatarActionsViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (AVTAvatarActionsViewControllerLayout)currentLayout
{
  return self->_currentLayout;
}

- (void)setCurrentLayout:(id)a3
{
  objc_storeStrong((id *)&self->_currentLayout, a3);
}

- (BOOL)shouldHideUserInfoView
{
  return self->_shouldHideUserInfoView;
}

- (void)setShouldHideUserInfoView:(BOOL)a3
{
  self->_shouldHideUserInfoView = a3;
}

- (UIStackView)buttonsView
{
  return self->_buttonsView;
}

- (void)setButtonsView:(id)a3
{
  objc_storeStrong((id *)&self->_buttonsView, a3);
}

- (AVTImageTransitioningContainerView)avatarContainer
{
  return self->_avatarContainer;
}

- (void)setAvatarContainer:(id)a3
{
  objc_storeStrong((id *)&self->_avatarContainer, a3);
}

- (AVTToolBar)toolbar
{
  return self->_toolbar;
}

- (void)setToolbar:(id)a3
{
  objc_storeStrong((id *)&self->_toolbar, a3);
}

- (AVTAvatarInlineActionsController)actionsController
{
  return self->_actionsController;
}

- (void)setActionsController:(id)a3
{
  objc_storeStrong((id *)&self->_actionsController, a3);
}

- (AVTViewSessionProvider)sessionProvider
{
  return self->_sessionProvider;
}

- (AVTViewSession)avtViewSession
{
  return self->_avtViewSession;
}

- (void)setAvtViewSession:(id)a3
{
  objc_storeStrong((id *)&self->_avtViewSession, a3);
}

- (id)postSessionDidBecomeActiveHandler
{
  return self->_postSessionDidBecomeActiveHandler;
}

- (void)setPostSessionDidBecomeActiveHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1040);
}

- (UIImageView)transitionImageView
{
  return self->_transitionImageView;
}

- (void)setTransitionImageView:(id)a3
{
  objc_storeStrong((id *)&self->_transitionImageView, a3);
}

- (UITapGestureRecognizer)tapGestureRecognizer
{
  return self->_tapGestureRecognizer;
}

- (void)setTapGestureRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_tapGestureRecognizer, a3);
}

- (BOOL)isAnimating
{
  return self->_isAnimating;
}

- (void)setIsAnimating:(BOOL)a3
{
  self->_isAnimating = a3;
}

- (BOOL)allowFacetracking
{
  return self->_allowFacetracking;
}

- (void)setAllowFacetracking:(BOOL)a3
{
  self->_allowFacetracking = a3;
}

- (AVTUIEnvironment)environment
{
  return self->_environment;
}

- (AVTAvatarEditorViewController)editorViewController
{
  return (AVTAvatarEditorViewController *)objc_loadWeakRetained((id *)&self->_editorViewController);
}

- (void)setEditorViewController:(id)a3
{
  objc_storeWeak((id *)&self->_editorViewController, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_editorViewController);
  objc_storeStrong((id *)&self->_environment, 0);
  objc_storeStrong((id *)&self->_tapGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_transitionImageView, 0);
  objc_storeStrong(&self->_postSessionDidBecomeActiveHandler, 0);
  objc_storeStrong((id *)&self->_avtViewSession, 0);
  objc_storeStrong((id *)&self->_sessionProvider, 0);
  objc_storeStrong((id *)&self->_actionsController, 0);
  objc_storeStrong((id *)&self->_toolbar, 0);
  objc_storeStrong((id *)&self->_avatarContainer, 0);
  objc_storeStrong((id *)&self->_buttonsView, 0);
  objc_storeStrong((id *)&self->_currentLayout, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)performEdit
{
  void *v2;
  id v3;

  -[AVTAvatarActionsViewController actionsController](self, "actionsController");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "actionsModel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "didTapEdit");

}

@end
