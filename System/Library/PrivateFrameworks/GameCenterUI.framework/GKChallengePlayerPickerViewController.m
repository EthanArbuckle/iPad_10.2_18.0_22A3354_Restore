@implementation GKChallengePlayerPickerViewController

- (GKChallengePlayerPickerViewController)initWithChallenge:(id)a3 initiallySelectedPlayers:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  GKChallengePlayerPickerViewController *v10;
  GKDashboardChallengePlayerPickerDataSource *v11;
  void *v12;
  void *v13;
  objc_super v15;

  v6 = a3;
  v7 = a4;
  objc_msgSend((id)objc_opt_class(), "_gkPlatformNibName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v15.receiver = self;
  v15.super_class = (Class)GKChallengePlayerPickerViewController;
  v10 = -[GKDashboardCollectionViewController initWithNibName:bundle:](&v15, sel_initWithNibName_bundle_, v8, v9);

  if (v10)
  {
    -[GKChallengePlayerPickerViewController setChallenge:](v10, "setChallenge:", v6);
    -[GKChallengePlayerPickerViewController setInitiallySelectedPlayers:](v10, "setInitiallySelectedPlayers:", v7);
    v11 = -[GKDashboardChallengePlayerPickerDataSource initWithChallenge:]([GKDashboardChallengePlayerPickerDataSource alloc], "initWithChallenge:", v6);
    -[GKDashboardChallengePlayerPickerDataSource setShowingFriendSuggestions:](v11, "setShowingFriendSuggestions:", 1);
    -[GKDashboardCollectionViewController setDataSource:](v10, "setDataSource:", v11);
    GKGameCenterUIFrameworkBundle();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    GKGetLocalizedStringFromTableInBundle();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKChallengePlayerPickerViewController setTitle:](v10, "setTitle:", v13);

    -[GKLoadingViewController setLoadingIndicatorDelay:](v10, "setLoadingIndicatorDelay:", 0.0);
  }

  return v10;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0D25298], "daemonProxy");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeDataUpdateDelegate:", self);

  v4.receiver = self;
  v4.super_class = (Class)GKChallengePlayerPickerViewController;
  -[GKDashboardCollectionViewController dealloc](&v4, sel_dealloc);
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
  id v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  id v21;
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
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  void (*v43)(uint64_t, void *);
  void *v44;
  id v45;
  id location;
  objc_super v47;

  v47.receiver = self;
  v47.super_class = (Class)GKChallengePlayerPickerViewController;
  -[GKDashboardCollectionViewController viewDidLoad](&v47, sel_viewDidLoad);
  objc_msgSend(MEMORY[0x1E0D25298], "daemonProxy");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addDataUpdateDelegate:", self);

  objc_initWeak(&location, self);
  -[GKDashboardCollectionViewController dataSource](self, "dataSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = MEMORY[0x1E0C809B0];
  v42 = 3221225472;
  v43 = __52__GKChallengePlayerPickerViewController_viewDidLoad__block_invoke;
  v44 = &unk_1E59C4AA0;
  objc_copyWeak(&v45, &location);
  objc_msgSend(v4, "setInviteFriendHandler:", &v41);

  -[GKChallengePlayerPickerViewController searchBar](self, "searchBar", v41, v42, v43, v44);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setShowsCancelButton:", 0);

  -[GKChallengePlayerPickerViewController navigationItem](self, "navigationItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_setAutoScrollEdgeTransitionDistance:", 40.0);

  -[GKChallengePlayerPickerViewController navigationItem](self, "navigationItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_setManualScrollEdgeAppearanceEnabled:", 1);

  -[GKChallengePlayerPickerViewController title](self, "title");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKChallengePlayerPickerViewController navigationItem](self, "navigationItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setTitle:", v8);

  -[GKChallengePlayerPickerViewController setOverrideUserInterfaceStyle:](self, "setOverrideUserInterfaceStyle:", 2);
  -[GKChallengePlayerPickerViewController navigationController](self, "navigationController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setNavigationBarHidden:", 1);

  -[GKChallenge detailGoalText](self->_challenge, "detailGoalText");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setText:](self->_descriptionLabel, "setText:", v11);

  -[GKDashboardCollectionViewController collectionView](self, "collectionView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKDashboardCollectionViewController setToHorizontalLayout:](self, "setToHorizontalLayout:", 0);
  -[GKDashboardCollectionViewController setAutoWidthUsesTwoColumnsWhenSpace:](self, "setAutoWidthUsesTwoColumnsWhenSpace:", 0);
  objc_msgSend(v12, "collectionViewLayout");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v13, "setCentersItemsInExcessSpace:", 1);
    objc_msgSend(v13, "setFocusScaleFactor:", 1.0);
  }
  objc_msgSend(v12, "setDelegate:", self);
  objc_msgSend(v12, "setClipsToBounds:", 1);
  if (self->_scrollingHeaderTopConstraint)
  {
    -[GKChallengePlayerPickerViewController setShouldApplyInitialOffset:](self, "setShouldApplyInitialOffset:", 1);
    objc_msgSend(v12, "contentInset");
    v15 = v14;
    v17 = v16;
    v19 = v18;
    -[UIView bounds](self->_scrollingHeader, "bounds");
    objc_msgSend(v12, "setContentInset:", v20, v15, v17, v19);
  }
  if (!self->_sendButton)
  {
    v21 = objc_alloc(MEMORY[0x1E0DC34F0]);
    GKGameCenterUIFrameworkBundle();
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    GKGetLocalizedStringFromTableInBundle();
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = (void *)objc_msgSend(v21, "initWithTitle:style:target:action:", v23, 2, self, sel_send_);
    -[GKChallengePlayerPickerViewController navigationItem](self, "navigationItem");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setRightBarButtonItem:", v24);

  }
  -[GKChallengePlayerPickerViewController configureCollectionView](self, "configureCollectionView");
  -[GKChallengePlayerPickerViewController title](self, "title");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKChallengePlayerPickerViewController titleLabel](self, "titleLabel");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setText:", v26);

  GKGameCenterUIFrameworkBundle();
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  GKGetLocalizedStringFromTableInBundle();
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKChallengePlayerPickerViewController searchBar](self, "searchBar");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setPlaceholder:", v29);

  -[GKChallengePlayerPickerViewController searchBar](self, "searchBar");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "cancelButton");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  GKGameCenterUIFrameworkBundle();
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  GKGetLocalizedStringFromTableInBundle();
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "setTitle:forState:", v34, 0);

  -[GKChallengePlayerPickerViewController sendButton](self, "sendButton");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  GKGameCenterUIFrameworkBundle();
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  GKGetLocalizedStringFromTableInBundle();
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "setTitle:forState:", v37, 0);

  -[GKChallengePlayerPickerViewController cancelButton](self, "cancelButton");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  GKGameCenterUIFrameworkBundle();
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  GKGetLocalizedStringFromTableInBundle();
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "setTitle:forState:", v40, 0);

  -[GKChallengePlayerPickerViewController updateButtonEnableState](self, "updateButtonEnableState");
  -[GKChallengePlayerPickerViewController configureButtonsFocusEffect](self, "configureButtonsFocusEffect");
  -[GKChallengePlayerPickerViewController configureFocusGuides](self, "configureFocusGuides");

  objc_destroyWeak(&v45);
  objc_destroyWeak(&location);
}

void __52__GKChallengePlayerPickerViewController_viewDidLoad__block_invoke(uint64_t a1, void *a2)
{
  id *v3;
  id WeakRetained;
  void *v5;
  id v6;
  void (**v7)(_QWORD, _QWORD);
  id v8;

  v8 = a2;
  v3 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend(WeakRetained, "inviteFriendHandler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = objc_loadWeakRetained(v3);
    objc_msgSend(v6, "inviteFriendHandler");
    v7 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id))v7)[2](v7, v8);

  }
}

- (void)configureButtonsFocusEffect
{
  void *v3;
  double x;
  double y;
  double width;
  double height;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  CGRect v20;
  CGRect v21;
  CGRect v22;
  CGRect v23;

  -[GKChallengePlayerPickerViewController sendButton](self, "sendButton");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v21 = CGRectInset(v20, -8.0, -4.0);
  x = v21.origin.x;
  y = v21.origin.y;
  width = v21.size.width;
  height = v21.size.height;

  v8 = *MEMORY[0x1E0CD2A68];
  objc_msgSend(MEMORY[0x1E0DC37D8], "effectWithRoundedRect:cornerRadius:curve:", *MEMORY[0x1E0CD2A68], x, y, width, height, 8.0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKChallengePlayerPickerViewController sendButton](self, "sendButton");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setFocusEffect:", v9);

  -[GKChallengePlayerPickerViewController cancelButton](self, "cancelButton");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "bounds");
  v23 = CGRectInset(v22, -8.0, -4.0);
  v12 = v23.origin.x;
  v13 = v23.origin.y;
  v14 = v23.size.width;
  v15 = v23.size.height;

  objc_msgSend(MEMORY[0x1E0DC37D8], "effectWithRoundedRect:cornerRadius:curve:", v8, v12, v13, v14, v15, 8.0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKChallengePlayerPickerViewController cancelButton](self, "cancelButton");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setFocusEffect:", v16);

  objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v19 = (id)objc_claimAutoreleasedReturnValue();
  -[GKChallengePlayerPickerViewController view](self, "view");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setTintColor:", v19);

}

- (void)configureFocusGuides
{
  void *v3;
  id v4;
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
  id v16;
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
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  _QWORD v49[4];
  void *v50;
  _QWORD v51[4];
  _QWORD v52[3];

  v52[1] = *MEMORY[0x1E0C80C00];
  -[GKChallengePlayerPickerViewController cancelButton](self, "cancelButton");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = objc_alloc_init(MEMORY[0x1E0DC37D0]);
    -[GKChallengePlayerPickerViewController cancelButton](self, "cancelButton");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v52[0] = v5;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v52, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setPreferredFocusEnvironments:", v6);

    -[GKChallengePlayerPickerViewController view](self, "view");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addLayoutGuide:", v4);

    v33 = (void *)MEMORY[0x1E0CB3718];
    objc_msgSend(v4, "leadingAnchor");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKChallengePlayerPickerViewController view](self, "view");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "leadingAnchor");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "constraintEqualToAnchor:", v43);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v51[0] = v41;
    objc_msgSend(v4, "trailingAnchor");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKChallengePlayerPickerViewController view](self, "view");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "centerXAnchor");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "constraintEqualToAnchor:", v35);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v51[1] = v31;
    objc_msgSend(v4, "topAnchor");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKChallengePlayerPickerViewController view](self, "view");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "topAnchor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "constraintEqualToAnchor:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v51[2] = v9;
    objc_msgSend(v4, "bottomAnchor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKChallengePlayerPickerViewController view](self, "view");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "topAnchor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "constraintEqualToAnchor:constant:", v12, 1.0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v51[3] = v13;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v51, 4);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "activateConstraints:", v14);

  }
  -[GKChallengePlayerPickerViewController sendButton](self, "sendButton");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    v16 = objc_alloc_init(MEMORY[0x1E0DC37D0]);
    -[GKChallengePlayerPickerViewController sendButton](self, "sendButton");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = v17;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v50, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setPreferredFocusEnvironments:", v18);

    -[GKChallengePlayerPickerViewController view](self, "view");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "addLayoutGuide:", v16);

    v34 = (void *)MEMORY[0x1E0CB3718];
    objc_msgSend(v16, "leadingAnchor");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKChallengePlayerPickerViewController view](self, "view");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "centerXAnchor");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "constraintEqualToAnchor:", v44);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v49[0] = v42;
    objc_msgSend(v16, "trailingAnchor");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKChallengePlayerPickerViewController view](self, "view");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "trailingAnchor");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "constraintEqualToAnchor:", v36);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v49[1] = v32;
    objc_msgSend(v16, "topAnchor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKChallengePlayerPickerViewController view](self, "view");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "topAnchor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "constraintEqualToAnchor:", v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v49[2] = v23;
    objc_msgSend(v16, "bottomAnchor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKChallengePlayerPickerViewController view](self, "view");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "topAnchor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "constraintEqualToAnchor:constant:", v26, 1.0);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v49[3] = v27;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v49, 4);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "activateConstraints:", v28);

  }
}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)GKChallengePlayerPickerViewController;
  -[GKDashboardCollectionViewController viewWillAppear:](&v14, sel_viewWillAppear_, a3);
  -[GKChallengePlayerPickerViewController applyInitialContentOffset](self, "applyInitialContentOffset");
  -[GKChallengePlayerPickerViewController setShouldApplyInitialOffset:](self, "setShouldApplyInitialOffset:", 0);
  -[GKChallengePlayerPickerViewController navigationController](self, "navigationController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "viewControllers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6 == 1)
  {
    -[GKChallengePlayerPickerViewController navigationItem](self, "navigationItem");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "leftBarButtonItem");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8)
    {
      v9 = objc_alloc(MEMORY[0x1E0DC34F0]);
      GKGameCenterUIFrameworkBundle();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      GKGetLocalizedStringFromTableInBundle();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (void *)objc_msgSend(v9, "initWithTitle:style:target:action:", v11, 0, self, sel_cancel_);
      -[GKChallengePlayerPickerViewController navigationItem](self, "navigationItem");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setLeftBarButtonItem:", v12);

    }
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  _BOOL8 v3;
  id v5;
  void *v6;
  void *v7;
  objc_super v8;

  v3 = a3;
  -[GKChallengePlayerPickerViewController setShouldIgnoreClearSelection:](self, "setShouldIgnoreClearSelection:", 1);
  v8.receiver = self;
  v8.super_class = (Class)GKChallengePlayerPickerViewController;
  -[GKDashboardCollectionViewController viewDidAppear:](&v8, sel_viewDidAppear_, v3);
  -[GKChallengePlayerPickerViewController setShouldIgnoreClearSelection:](self, "setShouldIgnoreClearSelection:", 0);
  v5 = objc_alloc_init(MEMORY[0x1E0DC3D80]);
  objc_msgSend(v5, "addTarget:action:", self, sel_cancel_);
  objc_msgSend(v5, "setAllowedPressTypes:", &unk_1E5A5EBC0);
  -[GKChallengePlayerPickerViewController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addGestureRecognizer:", v5);

  objc_msgSend(MEMORY[0x1E0D25238], "reporter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "recordPageWithID:pageContext:pageType:", CFSTR("friendSelect"), CFSTR("dashboard"), CFSTR("challenge"));

}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  objc_super v6;

  v3 = a3;
  -[GKChallengePlayerPickerViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeAllGestureRecognizers");

  v6.receiver = self;
  v6.super_class = (Class)GKChallengePlayerPickerViewController;
  -[GKChallengePlayerPickerViewController viewWillDisappear:](&v6, sel_viewWillDisappear_, v3);
}

- (void)viewWillLayoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)GKChallengePlayerPickerViewController;
  -[GKChallengePlayerPickerViewController viewWillLayoutSubviews](&v3, sel_viewWillLayoutSubviews);
  -[GKChallengePlayerPickerViewController configureCollectionView](self, "configureCollectionView");
}

- (void)viewDidLayoutSubviews
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)GKChallengePlayerPickerViewController;
  -[GKChallengePlayerPickerViewController viewDidLayoutSubviews](&v2, sel_viewDidLayoutSubviews);
}

- (void)configureCollectionView
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
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
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;

  -[GKDashboardCollectionViewController collectionView](self, "collectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "collectionViewLayout");
  v38 = (id)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = v38;
    objc_msgSend(v4, "setMinimumLineSpacing:", 0.0);
    objc_msgSend(v4, "setMinimumInteritemSpacing:", 0.0);
    objc_msgSend(v4, "sectionInset");
    objc_msgSend(v4, "setSectionInset:");

  }
  -[GKDashboardCollectionViewController collectionView](self, "collectionView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[GKDashboardCollectionViewController collectionView](self, "collectionView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setShowsVerticalScrollIndicator:", 1);

  -[GKDashboardCollectionViewController collectionView](self, "collectionView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_gkRemoveAllConstraints");

  -[GKChallengePlayerPickerViewController traitCollection](self, "traitCollection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "verticalSizeClass");

  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "userInterfaceIdiom");

  -[GKDashboardCollectionViewController collectionView](self, "collectionView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v11 == 1 || v9 != 1)
  {
    objc_msgSend(v12, "leftAnchor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKChallengePlayerPickerViewController view](self, "view");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "leftAnchor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "constraintEqualToAnchor:constant:", v18, 0.0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setActive:", 1);

    -[GKDashboardCollectionViewController collectionView](self, "collectionView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "rightAnchor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKChallengePlayerPickerViewController view](self, "view");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "rightAnchor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "constraintEqualToAnchor:constant:", v20, 0.0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setActive:", 1);

  }
  else
  {
    objc_msgSend(v12, "widthAnchor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "constraintEqualToConstant:", 500.0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setActive:", 1);
  }

  -[GKDashboardCollectionViewController collectionView](self, "collectionView");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "centerXAnchor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKChallengePlayerPickerViewController view](self, "view");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "centerXAnchor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "constraintEqualToAnchor:", v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setActive:", 1);

  -[GKDashboardCollectionViewController collectionView](self, "collectionView");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "topAnchor");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKChallengePlayerPickerViewController titleView](self, "titleView");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "bottomAnchor");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "constraintEqualToAnchor:", v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "setActive:", 1);

  -[GKDashboardCollectionViewController collectionView](self, "collectionView");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "bottomAnchor");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKChallengePlayerPickerViewController view](self, "view");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "bottomAnchor");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "constraintEqualToAnchor:", v35);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "setActive:", 1);

  -[GKDashboardCollectionViewController collectionView](self, "collectionView");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "setNeedsLayout");

}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD block[5];
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)GKChallengePlayerPickerViewController;
  -[GKDashboardCollectionViewController traitCollectionDidChange:](&v13, sel_traitCollectionDidChange_, v4);
  -[GKChallengePlayerPickerViewController traitCollection](self, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "horizontalSizeClass");
  if (v6 == objc_msgSend(v4, "horizontalSizeClass"))
  {
    -[GKChallengePlayerPickerViewController traitCollection](self, "traitCollection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "layoutDirection");
    if (v8 == objc_msgSend(v4, "layoutDirection"))
    {
      -[GKChallengePlayerPickerViewController traitCollection](self, "traitCollection");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "preferredContentSizeCategory");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "preferredContentSizeCategory");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (v10 == v11)
        goto LABEL_8;
      goto LABEL_7;
    }

  }
LABEL_7:
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __66__GKChallengePlayerPickerViewController_traitCollectionDidChange___block_invoke;
  block[3] = &unk_1E59C4148;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
LABEL_8:

}

void __66__GKChallengePlayerPickerViewController_traitCollectionDidChange___block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "collectionView");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "reloadData");

}

- (void)applyInitialContentOffset
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  _QWORD block[4];
  id v9;

  if (self->_shouldApplyInitialOffset)
  {
    -[GKDashboardCollectionViewController dataSource](self, "dataSource");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "selectedPlayers");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "count");

    if (!v5)
    {
      -[GKDashboardCollectionViewController collectionView](self, "collectionView");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __66__GKChallengePlayerPickerViewController_applyInitialContentOffset__block_invoke;
      block[3] = &unk_1E59C4148;
      v9 = v6;
      v7 = v6;
      dispatch_async(MEMORY[0x1E0C80D38], block);

    }
  }
}

uint64_t __66__GKChallengePlayerPickerViewController_applyInitialContentOffset__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setContentOffset:animated:", 0, 0.0, 0.0);
}

- (void)setMessage:(id)a3
{
  NSString *v4;
  NSString *message;
  id v6;

  v6 = a3;
  if (!-[NSString isEqualToString:](self->_message, "isEqualToString:"))
  {
    v4 = (NSString *)objc_msgSend(v6, "copy");
    message = self->_message;
    self->_message = v4;

    -[UITextField setText:](self->_messageField, "setText:", v6);
  }

}

- (void)loadData
{
  GKChallenge *challenge;
  objc_super v4;
  _QWORD v5[5];

  if ((-[GKChallenge detailsLoaded](self->_challenge, "detailsLoaded") & 1) != 0)
  {
    v4.receiver = self;
    v4.super_class = (Class)GKChallengePlayerPickerViewController;
    -[GKDashboardCollectionViewController loadData](&v4, sel_loadData);
  }
  else
  {
    challenge = self->_challenge;
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __49__GKChallengePlayerPickerViewController_loadData__block_invoke;
    v5[3] = &unk_1E59C4148;
    v5[4] = self;
    -[GKChallenge loadDetailsWithCompletionHandler:](challenge, "loadDetailsWithCompletionHandler:", v5);
  }
}

id __49__GKChallengePlayerPickerViewController_loadData__block_invoke(uint64_t a1)
{
  objc_super v2;

  v2.receiver = *(id *)(a1 + 32);
  v2.super_class = (Class)GKChallengePlayerPickerViewController;
  return objc_msgSendSuper2(&v2, sel_loadData);
}

- (void)dataUpdated:(BOOL)a3 withError:(id)a4
{
  void *v5;
  void *v6;
  NSUInteger v7;
  uint64_t v8;
  void *v9;
  NSArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
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
  v23.super_class = (Class)GKChallengePlayerPickerViewController;
  -[GKDashboardCollectionViewController dataUpdated:withError:](&v23, sel_dataUpdated_withError_, a3, a4);
  -[GKDashboardCollectionViewController dataSource](self, "dataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0C99DE8];
  v7 = -[NSArray count](self->_initiallySelectedPlayers, "count");
  if (v7 <= 1)
    v8 = 1;
  else
    v8 = v7;
  objc_msgSend(v6, "arrayWithCapacity:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NSArray count](self->_initiallySelectedPlayers, "count"))
  {
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    v10 = self->_initiallySelectedPlayers;
    v11 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v20;
      do
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v20 != v13)
            objc_enumerationMutation(v10);
          objc_msgSend(v5, "indexPathForPlayer:", *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v14), (_QWORD)v19);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          if (v15)
            objc_msgSend(v9, "addObject:", v15);

          ++v14;
        }
        while (v12 != v14);
        v12 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
      }
      while (v12);
    }

    -[GKChallengePlayerPickerViewController setInitiallySelectedPlayers:](self, "setInitiallySelectedPlayers:", 0);
  }
  else if (objc_msgSend(v5, "itemCount") == 1)
  {
    objc_msgSend(v5, "searchText");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "length");

    if (!v17)
    {
      objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", 0, 0);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "addObject:", v18);

    }
  }
  if (objc_msgSend(v9, "count", (_QWORD)v19))
    -[GKChallengePlayerPickerViewController selectPlayersAtIndexPaths:](self, "selectPlayersAtIndexPaths:", v9);
  -[GKChallengePlayerPickerViewController updateButtonEnableState](self, "updateButtonEnableState");

}

- (void)selectPlayersAtIndexPaths:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[GKDashboardCollectionViewController dataSource](self, "dataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKDashboardCollectionViewController collectionView](self, "collectionView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v7 = v4;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v8)
  {
    v9 = v8;
    v10 = 0;
    v11 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v15 != v11)
          objc_enumerationMutation(v7);
        v13 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i);
        if (objc_msgSend(v5, "collectionView:shouldSelectItemAtIndexPath:", v6, v13, (_QWORD)v14))
        {
          objc_msgSend(v6, "selectItemAtIndexPath:animated:scrollPosition:", v13, 0, 18);
          -[GKChallengePlayerPickerViewController collectionView:didSelectItemAtIndexPath:](self, "collectionView:didSelectItemAtIndexPath:", v6, v13);
          v10 = 1;
        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v9);

    if ((v10 & 1) != 0)
      -[GKChallengePlayerPickerViewController setNeedsFocusUpdate](self, "setNeedsFocusUpdate");
  }
  else
  {

  }
}

- (void)setupNoContentView:(id)a3 withError:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  objc_super v13;

  v6 = a3;
  v7 = a4;
  -[GKDashboardCollectionViewController dataSource](self, "dataSource");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "searchText");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "length");

  if (v10)
  {
    GKGameCenterUIFrameworkBundle();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    GKGetLocalizedStringFromTableInBundle();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setMessage:", v12);

  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)GKChallengePlayerPickerViewController;
    -[GKDashboardCollectionViewController setupNoContentView:withError:](&v13, sel_setupNoContentView_withError_, v6, v7);
  }

}

- (id)preferredFocusEnvironments
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  -[GKDashboardCollectionViewController collectionView](self, "collectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[GKDashboardCollectionViewController collectionView](self, "collectionView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)GKChallengePlayerPickerViewController;
    -[GKDashboardCollectionViewController preferredFocusEnvironments](&v7, sel_preferredFocusEnvironments);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

- (void)clearSelection
{
  void *v3;
  objc_super v4;

  if (!self->_shouldIgnoreClearSelection)
  {
    v4.receiver = self;
    v4.super_class = (Class)GKChallengePlayerPickerViewController;
    -[GKDashboardCollectionViewController clearSelection](&v4, sel_clearSelection);
    -[GKDashboardCollectionViewController dataSource](self, "dataSource");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "clearSelection");

    -[GKChallengePlayerPickerViewController updateButtonEnableState](self, "updateButtonEnableState");
  }
}

- (void)send:(id)a3
{
  void *v4;
  void *v5;
  void (**completionHandler)(id, void *, NSString *);
  id v7;

  -[GKDashboardCollectionViewController dataSource](self, "dataSource", a3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "selectedPlayers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v4, "count") < 0xB)
  {
    if (objc_msgSend(v4, "count"))
    {
      -[GKChallenge issueToPlayers:message:](self->_challenge, "issueToPlayers:message:", v4, self->_message);
      completionHandler = (void (**)(id, void *, NSString *))self->_completionHandler;
      if (completionHandler)
        completionHandler[2](completionHandler, v4, self->_message);
      -[UIViewController _gkRemoveViewController:animated:](self, "_gkRemoveViewController:animated:", self, 1);
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D25280], "tooManyPlayersAlertController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKChallengePlayerPickerViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v5, 1, 0);

  }
}

- (void)addMessage:(id)a3
{
  id v4;
  void *v5;
  GKChallengeComposeController *v6;
  GKChallenge *challenge;
  NSString *message;
  void *v9;
  GKChallengeComposeController *v10;
  _QWORD v11[5];
  id v12;
  id location;

  v4 = a3;
  -[GKDashboardCollectionViewController dataSource](self, "dataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = [GKChallengeComposeController alloc];
  challenge = self->_challenge;
  message = self->_message;
  objc_msgSend(v5, "selectedPlayers");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[GKChallengeComposeController initWithChallenge:defaultMessage:players:](v6, "initWithChallenge:defaultMessage:players:", challenge, message, v9);

  objc_initWeak(&location, v10);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __52__GKChallengePlayerPickerViewController_addMessage___block_invoke;
  v11[3] = &unk_1E59C5018;
  v11[4] = self;
  objc_copyWeak(&v12, &location);
  -[GKSimpleComposeController setDoneHandler:](v10, "setDoneHandler:", v11);
  -[UIViewController _gkShowViewController:](self, "_gkShowViewController:", v10);
  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);

}

void __52__GKChallengePlayerPickerViewController_addMessage___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  id *v8;
  id WeakRetained;
  id v10;
  _QWORD v11[5];
  id v12;

  v5 = a2;
  v6 = v5;
  if (!a3)
  {
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __52__GKChallengePlayerPickerViewController_addMessage___block_invoke_2;
    v11[3] = &unk_1E59C4708;
    v11[4] = *(_QWORD *)(a1 + 32);
    v12 = v5;
    dispatch_async(MEMORY[0x1E0C80D38], v11);

  }
  v7 = *(void **)(a1 + 32);
  v8 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained(v8);
  objc_msgSend(v7, "_gkRemoveViewController:animated:", WeakRetained, 1);

  v10 = objc_loadWeakRetained(v8);
  objc_msgSend(v10, "setDoneHandler:", 0);

}

uint64_t __52__GKChallengePlayerPickerViewController_addMessage___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setMessage:", *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "send:", *(_QWORD *)(a1 + 32));
}

- (void)cancel:(id)a3
{
  id completionHandler;

  completionHandler = self->_completionHandler;
  if (completionHandler)
    (*((void (**)(id, _QWORD, _QWORD))completionHandler + 2))(completionHandler, 0, 0);
  -[UIViewController _gkRemoveViewController:animated:](self, "_gkRemoveViewController:animated:", self, 1);
}

- (BOOL)textFieldShouldReturn:(id)a3
{
  UITextField *messageField;
  void *v6;
  _QWORD block[5];

  messageField = self->_messageField;
  if (messageField == a3)
  {
    objc_msgSend(a3, "text");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKChallengePlayerPickerViewController setMessage:](self, "setMessage:", v6);

    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __63__GKChallengePlayerPickerViewController_textFieldShouldReturn___block_invoke;
    block[3] = &unk_1E59C4148;
    block[4] = self;
    dispatch_async(MEMORY[0x1E0C80D38], block);
  }
  return messageField != a3;
}

uint64_t __63__GKChallengePlayerPickerViewController_textFieldShouldReturn___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "send:", *(_QWORD *)(a1 + 32));
}

- (void)updateButtonEnableState
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;

  -[GKDashboardCollectionViewController dataSource](self, "dataSource");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "selectedPlayers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  -[UIButton setEnabled:](self->_sendButton, "setEnabled:", v4 != 0);
  if (!self->_sendButton)
  {
    -[GKChallengePlayerPickerViewController navigationItem](self, "navigationItem");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "rightBarButtonItem");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setEnabled:", v4 != 0);

  }
}

- (void)refreshContentsForDataType:(unsigned int)a3 userInfo:(id)a4
{
  id v6;
  id v7;
  _QWORD block[4];
  id v9;
  GKChallengePlayerPickerViewController *v10;
  unsigned int v11;

  v6 = a4;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __77__GKChallengePlayerPickerViewController_refreshContentsForDataType_userInfo___block_invoke;
  block[3] = &unk_1E59C6D60;
  v11 = a3;
  v9 = v6;
  v10 = self;
  v7 = v6;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __77__GKChallengePlayerPickerViewController_refreshContentsForDataType_userInfo___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  if (*(_DWORD *)(a1 + 48) == 4)
  {
    objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", *MEMORY[0x1E0D24B98]);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "dataSource");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addInvitedFriendContactIdentifier:", v2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      objc_msgSend(*(id *)(a1 + 40), "collectionView");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v7[0] = v4;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "reloadItemsAtIndexPaths:", v6);

    }
  }
}

- (void)searchBar:(id)a3 textDidChange:(id)a4
{
  -[GKChallengePlayerPickerViewController setSearchText:](self, "setSearchText:", a4);
}

- (void)searchBarCancelButtonClicked:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "setText:", 0);
  objc_msgSend(v4, "resignFirstResponder");

  -[GKChallengePlayerPickerViewController setSearchText:](self, "setSearchText:", 0);
}

- (void)searchBarSearchButtonClicked:(id)a3
{
  objc_msgSend(a3, "resignFirstResponder");
}

- (void)setSearchText:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[GKDashboardCollectionViewController dataSource](self, "dataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSearchText:", v4);
  -[GKChallengePlayerPickerViewController dataUpdated:withError:](self, "dataUpdated:withError:", 1, 0);
  -[GKDashboardCollectionViewController collectionView](self, "collectionView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "selectedPlayers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v14;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v14 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(v5, "indexPathForPlayer:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v11));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "selectItemAtIndexPath:animated:scrollPosition:", v12, 0, 0);

        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v9);
  }

}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)GKChallengePlayerPickerViewController;
  -[GKDashboardCollectionViewController collectionView:didSelectItemAtIndexPath:](&v5, sel_collectionView_didSelectItemAtIndexPath_, a3, a4);
  -[GKChallengePlayerPickerViewController updateButtonEnableState](self, "updateButtonEnableState");
}

- (void)collectionView:(id)a3 didDeselectItemAtIndexPath:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)GKChallengePlayerPickerViewController;
  -[GKDashboardCollectionViewController collectionView:didDeselectItemAtIndexPath:](&v5, sel_collectionView_didDeselectItemAtIndexPath_, a3, a4);
  -[GKChallengePlayerPickerViewController updateButtonEnableState](self, "updateButtonEnableState");
}

- (void)scrollViewDidScroll:(id)a3
{
  double v4;
  double v5;
  void *v6;
  double v7;
  id v8;

  if (self->_scrollingHeaderTopConstraint)
  {
    objc_msgSend(a3, "contentOffset");
    v5 = -v4;
    -[GKDashboardCollectionViewController collectionView](self, "collectionView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "contentInset");
    -[NSLayoutConstraint setConstant:](self->_scrollingHeaderTopConstraint, "setConstant:", v5 - v7);

  }
  -[GKChallengePlayerPickerViewController searchBar](self, "searchBar", a3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "resignFirstResponder");

}

- (NSString)message
{
  return self->_message;
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1160);
}

- (id)inviteFriendHandler
{
  return self->_inviteFriendHandler;
}

- (void)setInviteFriendHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1168);
}

- (GKChallenge)challenge
{
  return self->_challenge;
}

- (void)setChallenge:(id)a3
{
  objc_storeStrong((id *)&self->_challenge, a3);
}

- (NSArray)initiallySelectedPlayers
{
  return self->_initiallySelectedPlayers;
}

- (void)setInitiallySelectedPlayers:(id)a3
{
  objc_storeStrong((id *)&self->_initiallySelectedPlayers, a3);
}

- (BOOL)shouldIgnoreClearSelection
{
  return self->_shouldIgnoreClearSelection;
}

- (void)setShouldIgnoreClearSelection:(BOOL)a3
{
  self->_shouldIgnoreClearSelection = a3;
}

- (UILabel)descriptionLabel
{
  return self->_descriptionLabel;
}

- (void)setDescriptionLabel:(id)a3
{
  self->_descriptionLabel = (UILabel *)a3;
}

- (UIButton)sendButton
{
  return self->_sendButton;
}

- (void)setSendButton:(id)a3
{
  self->_sendButton = (UIButton *)a3;
}

- (UITextField)messageField
{
  return self->_messageField;
}

- (void)setMessageField:(id)a3
{
  self->_messageField = (UITextField *)a3;
}

- (UIView)titleView
{
  return self->_titleView;
}

- (void)setTitleView:(id)a3
{
  objc_storeStrong((id *)&self->_titleView, a3);
}

- (UISearchBar)searchBar
{
  return self->_searchBar;
}

- (void)setSearchBar:(id)a3
{
  objc_storeStrong((id *)&self->_searchBar, a3);
}

- (UIButton)cancelButton
{
  return self->_cancelButton;
}

- (void)setCancelButton:(id)a3
{
  objc_storeStrong((id *)&self->_cancelButton, a3);
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_titleLabel, a3);
}

- (UIView)scrollingHeader
{
  return self->_scrollingHeader;
}

- (void)setScrollingHeader:(id)a3
{
  self->_scrollingHeader = (UIView *)a3;
}

- (NSLayoutConstraint)scrollingHeaderTopConstraint
{
  return self->_scrollingHeaderTopConstraint;
}

- (void)setScrollingHeaderTopConstraint:(id)a3
{
  self->_scrollingHeaderTopConstraint = (NSLayoutConstraint *)a3;
}

- (BOOL)shouldApplyInitialOffset
{
  return self->_shouldApplyInitialOffset;
}

- (void)setShouldApplyInitialOffset:(BOOL)a3
{
  self->_shouldApplyInitialOffset = a3;
}

- (UIViewController)composeController
{
  return self->_composeController;
}

- (void)setComposeController:(id)a3
{
  objc_storeStrong((id *)&self->_composeController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_composeController, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_cancelButton, 0);
  objc_storeStrong((id *)&self->_searchBar, 0);
  objc_storeStrong((id *)&self->_titleView, 0);
  objc_storeStrong((id *)&self->_initiallySelectedPlayers, 0);
  objc_storeStrong((id *)&self->_challenge, 0);
  objc_storeStrong(&self->_inviteFriendHandler, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_message, 0);
}

@end
