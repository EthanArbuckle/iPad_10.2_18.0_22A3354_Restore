@implementation GKTurnBasedMatchesViewController

- (GKTurnBasedMatchesViewController)init
{
  GKGridLayout *v3;
  GKTurnBasedMatchesViewController *v4;
  void *v5;
  objc_super v7;

  v3 = objc_alloc_init(GKGridLayout);
  v7.receiver = self;
  v7.super_class = (Class)GKTurnBasedMatchesViewController;
  v4 = -[GKCollectionViewController initWithCollectionViewLayout:](&v7, sel_initWithCollectionViewLayout_, v3);

  if (v4)
  {
    -[GKTurnBasedMatchesViewController setRestorationClass:](v4, "setRestorationClass:", objc_opt_class());
    -[GKTurnBasedMatchesViewController setRestorationIdentifier:](v4, "setRestorationIdentifier:", CFSTR("TurnBasedMatches"));
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObserver:selector:name:object:", v4, sel_applicationDidEnterBackground, *MEMORY[0x1E0DC4768], 0);

    v4->_showPlay = 1;
    v4->_showQuit = 1;
  }
  return v4;
}

- (GKTurnBasedMatchesViewController)initWithMatchRequest:(id)a3
{
  id v5;
  GKTurnBasedMatchesViewController *v6;
  GKTurnBasedMatchesViewController *v7;

  v5 = a3;
  v6 = -[GKTurnBasedMatchesViewController init](self, "init");
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_matchRequest, a3);

  return v7;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:", self);

  v5.receiver = self;
  v5.super_class = (Class)GKTurnBasedMatchesViewController;
  -[GKCollectionViewController dealloc](&v5, sel_dealloc);
}

- (void)setGame:(id)a3
{
  void *v5;
  void *v6;
  GKGame *v7;

  v7 = (GKGame *)a3;
  if (self->_game != v7)
  {
    objc_storeStrong((id *)&self->_game, a3);
    -[GKGame name](v7, "name");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKTurnBasedMatchesViewController navigationItem](self, "navigationItem");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setTitle:", v5);

  }
}

- (BOOL)isInGame
{
  void *v2;
  BOOL v3;

  -[GKTurnBasedMatchesViewController delegate](self, "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (void)configureDataSource
{
  GKTurnBasedMatchesDataSource *v3;
  void *v4;
  double v5;
  objc_super v6;

  v3 = objc_alloc_init(GKTurnBasedMatchesDataSource);
  -[GKTurnBasedMatchesViewController setMatchesDataSource:](self, "setMatchesDataSource:", v3);

  -[GKTurnBasedMatchesDataSource configureDataSource](self->_matchesDataSource, "configureDataSource");
  -[GKTurnBasedMatchesDataSource setGame:](self->_matchesDataSource, "setGame:", self->_game);
  +[GKGridLayoutMetrics metrics](GKSectionMetrics, "metrics");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "padding");
  objc_msgSend(v4, "setPadding:", 0.0);
  objc_msgSend(v4, "sectionHeaderHeight");
  self->_initialSectionHeaderHeight = v5;
  -[GKCollectionViewDataSource setDefaultSectionMetrics:](self->_matchesDataSource, "setDefaultSectionMetrics:", v4);
  -[GKCollectionViewController setDataSource:](self, "setDataSource:", self->_matchesDataSource);
  v6.receiver = self;
  v6.super_class = (Class)GKTurnBasedMatchesViewController;
  -[GKCollectionViewController configureDataSource](&v6, sel_configureDataSource);

}

- (void)configureViewFactories
{
  void *v3;

  -[GKCollectionViewController collectionView](self, "collectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_gkRegisterClass:forSupplementaryViewOfKind:", objc_opt_class(), CFSTR("SectionHeader"));

  -[GKCollectionViewDataSource registerSupplementaryViewOfKind:withClass:target:configurator:](self->_matchesDataSource, "registerSupplementaryViewOfKind:withClass:target:configurator:", CFSTR("SectionHeader"), objc_opt_class(), self, sel_configureHeader_indexPath_);
}

- (void)configureHeader:(id)a3 indexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;

  v6 = a4;
  v7 = a3;
  -[GKTurnBasedMatchesViewController matchesDataSource](self, "matchesDataSource");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v6, "section");

  objc_msgSend(v8, "titleForSection:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "localizedUppercaseString");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setLeftText:", v11);

  objc_msgSend(MEMORY[0x1E0DC1350], "_gkPreferredFontForTextStyle:symbolicTraits:", *MEMORY[0x1E0DC4AB8], 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "leftLabel");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setFont:", v12);

  objc_msgSend(v7, "leftLabel");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "textColor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "colorWithAlphaComponent:", 0.600000024);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "leftLabel");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setTextColor:", v16);

  v18 = *MEMORY[0x1E0CD2EA0];
  objc_msgSend(v7, "leftLabel");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "layer");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setCompositingFilter:", v18);

  objc_msgSend(v7, "underlineView");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setHidden:", 1);

  objc_msgSend(v7, "backgroundView");
  v22 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v22, "setHidden:", 0);
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
  objc_super v12;

  if (-[GKTurnBasedMatchesViewController isInGame](self, "isInGame"))
  {
    -[GKTurnBasedMatchesViewController navigationController](self, "navigationController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "makeNavigationBarBackgroundTranslucent");

    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKTurnBasedMatchesViewController navigationController](self, "navigationController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "navigationBar");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setTintColor:", v4);

    v7 = (void *)objc_opt_new();
    -[GKTurnBasedMatchesViewController navigationController](self, "navigationController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "navigationBar");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setShadowImage:", v7);

  }
  v12.receiver = self;
  v12.super_class = (Class)GKTurnBasedMatchesViewController;
  -[GKCollectionViewController viewDidLoad](&v12, sel_viewDidLoad);
  -[GKTurnBasedMatchesViewController configureNavigationBarFocusGuide](self, "configureNavigationBarFocusGuide");
  -[GKTurnBasedMatchesViewController configureCollectionViewFocusGuide](self, "configureCollectionViewFocusGuide");
  -[GKCollectionViewController collectionView](self, "collectionView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[GKTurnBasedMatchesViewController updateUIBasedOnTraitCollection](self, "updateUIBasedOnTraitCollection");
  -[GKCollectionViewController collectionView](self, "collectionView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setShowsVerticalScrollIndicator:", 0);

}

- (void)configureNavigationBarFocusGuide
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
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
  _QWORD v32[4];
  _QWORD v33[2];

  v33[1] = *MEMORY[0x1E0C80C00];
  -[GKTurnBasedMatchesViewController navigationController](self, "navigationController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "navigationBar");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = objc_alloc_init(MEMORY[0x1E0DC37D0]);
    -[GKTurnBasedMatchesViewController navigationController](self, "navigationController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "navigationBar");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v33[0] = v7;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v33, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setPreferredFocusEnvironments:", v8);

    -[GKTurnBasedMatchesViewController view](self, "view");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addLayoutGuide:", v5);

    -[GKTurnBasedMatchesViewController navigationController](self, "navigationController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "navigationBar");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "frame");
    v13 = v12;

    v24 = (void *)MEMORY[0x1E0CB3718];
    objc_msgSend(v5, "topAnchor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKTurnBasedMatchesViewController view](self, "view");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "topAnchor");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "constraintEqualToAnchor:", v29);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v32[0] = v28;
    objc_msgSend(v5, "bottomAnchor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKTurnBasedMatchesViewController view](self, "view");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "topAnchor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "constraintEqualToAnchor:constant:", v25, v13);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v32[1] = v23;
    objc_msgSend(v5, "leadingAnchor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKTurnBasedMatchesViewController view](self, "view");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "leadingAnchor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "constraintEqualToAnchor:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v32[2] = v17;
    objc_msgSend(v5, "trailingAnchor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKTurnBasedMatchesViewController view](self, "view");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "trailingAnchor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "constraintEqualToAnchor:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v32[3] = v21;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v32, 4);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "activateConstraints:", v22);

  }
}

- (void)configureCollectionViewFocusGuide
{
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
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
  id v31;
  id v32;
  _QWORD v33[4];
  _QWORD v34[2];

  v34[1] = *MEMORY[0x1E0C80C00];
  -[GKTurnBasedMatchesViewController navigationController](self, "navigationController");
  v31 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "navigationBar");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)v3;
    -[GKCollectionViewController collectionView](self, "collectionView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      v6 = objc_alloc_init(MEMORY[0x1E0DC37D0]);
      -[GKCollectionViewController collectionView](self, "collectionView");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v34[0] = v7;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v34, 1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setPreferredFocusEnvironments:", v8);

      -[GKTurnBasedMatchesViewController view](self, "view");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "addLayoutGuide:", v6);

      -[GKTurnBasedMatchesViewController navigationController](self, "navigationController");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "navigationBar");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "frame");
      v13 = v12;

      v24 = (void *)MEMORY[0x1E0CB3718];
      objc_msgSend(v6, "topAnchor");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      -[GKTurnBasedMatchesViewController view](self, "view");
      v32 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "topAnchor");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "constraintEqualToAnchor:constant:", v29, v13);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v33[0] = v28;
      objc_msgSend(v6, "bottomAnchor");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[GKTurnBasedMatchesViewController view](self, "view");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "bottomAnchor");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "constraintEqualToAnchor:", v25);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v33[1] = v23;
      objc_msgSend(v6, "leadingAnchor");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[GKTurnBasedMatchesViewController view](self, "view");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "leadingAnchor");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "constraintEqualToAnchor:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v33[2] = v17;
      objc_msgSend(v6, "trailingAnchor");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[GKTurnBasedMatchesViewController view](self, "view");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "trailingAnchor");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "constraintEqualToAnchor:", v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v33[3] = v21;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v33, 4);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "activateConstraints:", v22);

    }
  }
  else
  {

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
  objc_super v12;

  v3 = a3;
  if (-[GKTurnBasedMatchesViewController isInGame](self, "isInGame"))
  {
    objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObserver:selector:name:object:", self, sel_handleTurnBasedEvent_, *MEMORY[0x1E0D24D48], 0);

    -[GKTurnBasedMatchesViewController navigationItem](self, "navigationItem");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 0, self, sel_cancelButtonPressed);
    objc_msgSend(v6, "setLeftBarButtonItem:", v7);
    objc_msgSend(MEMORY[0x1E0D253B0], "shared");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "multiplayerAllowedPlayerType");

    if (v9)
    {
      v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 4, self, sel_addPressed);
      objc_msgSend(v6, "setRightBarButtonItem:", v10);

    }
    -[GKTurnBasedMatchesDataSource setDetailPressedAction:](self->_matchesDataSource, "setDetailPressedAction:", sel_detailPressedForMatch_);
    if (!-[GKTurnBasedMatchesViewController showExistingMatches](self, "showExistingMatches"))
      -[GKTurnBasedMatchesViewController showInviteControllerAnimated:](self, "showInviteControllerAnimated:", 0);
    -[GKTurnBasedMatchesViewController navigationController](self, "navigationController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setNavigationBarHidden:animated:", 0, 0);

  }
  v12.receiver = self;
  v12.super_class = (Class)GKTurnBasedMatchesViewController;
  -[GKCollectionViewController viewWillAppear:](&v12, sel_viewWillAppear_, v3);
}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)GKTurnBasedMatchesViewController;
  -[GKCollectionViewController viewDidAppear:](&v12, sel_viewDidAppear_, a3);
  -[GKTurnBasedMatchesViewController delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKMatchRequest validateForTurnBased](self->_matchRequest, "validateForTurnBased");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(v4, "turnBasedViewController:didFailWithError:", self, v5);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D253B0], "shared");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "multiplayerAllowedPlayerType");

    if (!v7)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "userErrorForCode:underlyingError:", 10, 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "turnBasedViewController:didFailWithError:", self, v8);

    }
  }
  -[GKTurnBasedMatchesViewController view](self, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "window");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "_rootSheetPresentationController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "_setShouldScaleDownBehindDescendantSheets:", 0);

}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  objc_super v6;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObserver:", self);

  v6.receiver = self;
  v6.super_class = (Class)GKTurnBasedMatchesViewController;
  -[GKCollectionViewController viewWillDisappear:](&v6, sel_viewWillDisappear_, v3);
}

- (void)traitCollectionDidChange:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)GKTurnBasedMatchesViewController;
  -[GKCollectionViewController traitCollectionDidChange:](&v4, sel_traitCollectionDidChange_, a3);
  -[GKTurnBasedMatchesViewController updateUIBasedOnTraitCollection](self, "updateUIBasedOnTraitCollection");
}

- (void)updateUIBasedOnTraitCollection
{
  void *v3;
  GameLayerPageGrid *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
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
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  double v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  double v38;
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
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  double v57;
  double v58;
  void *v59;
  NSString *v60;
  void *v61;
  void *v62;
  GameLayerPageGrid *v63;

  -[GKCollectionViewController collectionView](self, "collectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_gkRemoveAllConstraints");

  v4 = [GameLayerPageGrid alloc];
  -[GKCollectionViewController collectionView](self, "collectionView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bounds");
  v7 = v6;
  v9 = v8;
  -[GKTurnBasedMatchesViewController view](self, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "traitCollection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v63 = -[GameLayerPageGrid initWithSize:traitCollection:](v4, "initWithSize:traitCollection:", v11, v7, v9);

  -[GKTurnBasedMatchesViewController view](self, "view");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "traitCollection");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "userInterfaceIdiom");
  -[GameLayerPageGrid columnWidth](v63, "columnWidth");
  v16 = v15;
  -[GameLayerPageGrid interColumnSpacing](v63, "interColumnSpacing");
  v18 = v17 + v17 + v16 * 3.0;
  v19 = v17 * 3.0 + v16 * 4.0;
  if (v14)
    v20 = v19;
  else
    v20 = v18;

  -[GKCollectionViewController collectionView](self, "collectionView");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "bounds");
  v23 = v22;
  -[GameLayerPageGrid minimumInsets](v63, "minimumInsets");
  v25 = v23 - v24;
  -[GameLayerPageGrid minimumInsets](v63, "minimumInsets");
  v27 = v25 - v26;

  -[GKCollectionViewController collectionView](self, "collectionView");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = v28;
  if (v20 <= v27)
  {
    objc_msgSend(v28, "widthAnchor");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "constraintEqualToConstant:", v20);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "setActive:", 1);
  }
  else
  {
    objc_msgSend(v28, "leftAnchor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKTurnBasedMatchesViewController view](self, "view");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "leftAnchor");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[GameLayerPageGrid minimumInsets](v63, "minimumInsets");
    objc_msgSend(v30, "constraintEqualToAnchor:constant:", v32, v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "setActive:", 1);

    -[GKCollectionViewController collectionView](self, "collectionView");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "rightAnchor");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKTurnBasedMatchesViewController view](self, "view");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "rightAnchor");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[GameLayerPageGrid minimumInsets](v63, "minimumInsets");
    objc_msgSend(v35, "constraintEqualToAnchor:constant:", v37, -v38);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "setActive:", 1);

  }
  -[GKCollectionViewController collectionView](self, "collectionView");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "centerXAnchor");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKTurnBasedMatchesViewController view](self, "view");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "centerXAnchor");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "constraintEqualToAnchor:", v43);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "setActive:", 1);

  -[GKCollectionViewController collectionView](self, "collectionView");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "topAnchor");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKTurnBasedMatchesViewController view](self, "view");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "topAnchor");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "constraintEqualToAnchor:", v48);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "setActive:", 1);

  -[GKCollectionViewController collectionView](self, "collectionView");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "bottomAnchor");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKTurnBasedMatchesViewController view](self, "view");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "bottomAnchor");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "constraintEqualToAnchor:", v53);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "setActive:", 1);

  -[GKCollectionViewController collectionView](self, "collectionView");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "setNeedsLayout");

  -[GKTurnBasedMatchesViewController configureDetailButtonFocusGuide](self, "configureDetailButtonFocusGuide");
  -[GKCollectionViewDataSource defaultSectionMetrics](self->_matchesDataSource, "defaultSectionMetrics");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  +[GKTurnParticipantCell defaultRowHeight](GKTurnParticipantCell, "defaultRowHeight");
  v58 = v57;
  -[GKTurnBasedMatchesViewController traitCollection](self, "traitCollection");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "preferredContentSizeCategory");
  v60 = (NSString *)objc_claimAutoreleasedReturnValue();
  LODWORD(v53) = UIContentSizeCategoryIsAccessibilityCategory(v60);

  if ((_DWORD)v53)
  {
    v58 = v58 * 1.7;
    objc_msgSend(v56, "setSectionHeadersShouldPin:", 0);
  }
  objc_msgSend(MEMORY[0x1E0DC37F8], "defaultMetrics");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "scaledValueForValue:", v58);
  objc_msgSend(v56, "setDesiredItemHeight:");

  objc_msgSend(v56, "setItemHeightList:", 0);
  objc_msgSend(MEMORY[0x1E0DC37F8], "defaultMetrics");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "scaledValueForValue:", self->_initialSectionHeaderHeight);
  objc_msgSend(v56, "setSectionHeaderHeight:");

  -[GKCollectionViewDataSource setDefaultSectionMetrics:](self->_matchesDataSource, "setDefaultSectionMetrics:", v56);
  -[GKCollectionViewController _gkSetContentsNeedUpdateWithHandler:](self, "_gkSetContentsNeedUpdateWithHandler:", 0);

}

- (void)configureDetailButtonFocusGuide
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
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
  _QWORD v37[6];

  v37[4] = *MEMORY[0x1E0C80C00];
  -[GKTurnBasedMatchesViewController detailButtonFocusGuide](self, "detailButtonFocusGuide");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[GKTurnBasedMatchesViewController view](self, "view");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKTurnBasedMatchesViewController detailButtonFocusGuide](self, "detailButtonFocusGuide");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeLayoutGuide:", v5);

  }
  v6 = objc_alloc_init(MEMORY[0x1E0DC37D0]);
  -[GKTurnBasedMatchesViewController setDetailButtonFocusGuide:](self, "setDetailButtonFocusGuide:", v6);

  -[GKTurnBasedMatchesViewController view](self, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKTurnBasedMatchesViewController detailButtonFocusGuide](self, "detailButtonFocusGuide");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addLayoutGuide:", v8);

  -[GKTurnBasedMatchesViewController navigationController](self, "navigationController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "navigationBar");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[GKTurnBasedMatchesViewController navigationController](self, "navigationController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "navigationBar");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "frame");
    v14 = v13;

    v27 = (void *)MEMORY[0x1E0CB3718];
    -[GKTurnBasedMatchesViewController detailButtonFocusGuide](self, "detailButtonFocusGuide");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "topAnchor");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKTurnBasedMatchesViewController view](self, "view");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "topAnchor");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "constraintEqualToAnchor:constant:", v33, v14);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v37[0] = v32;
    -[GKTurnBasedMatchesViewController detailButtonFocusGuide](self, "detailButtonFocusGuide");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "bottomAnchor");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKTurnBasedMatchesViewController view](self, "view");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "bottomAnchor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "constraintEqualToAnchor:", v28);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v37[1] = v26;
    -[GKTurnBasedMatchesViewController detailButtonFocusGuide](self, "detailButtonFocusGuide");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "leadingAnchor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKCollectionViewController collectionView](self, "collectionView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "trailingAnchor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "constraintEqualToAnchor:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v37[2] = v18;
    -[GKTurnBasedMatchesViewController detailButtonFocusGuide](self, "detailButtonFocusGuide");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "trailingAnchor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKCollectionViewController collectionView](self, "collectionView");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "trailingAnchor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "constraintEqualToAnchor:constant:", v22, 1.0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v37[3] = v23;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v37, 4);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "activateConstraints:", v24);

  }
}

- (BOOL)isLoadingOrRemovingPreloadedMatch
{
  void *v2;
  char v3;

  -[GKTurnBasedMatchesViewController inviteController](self, "inviteController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isLoadingOrRemovingPreloadedMatch");

  return v3;
}

- (void)loadDataWithCompletionHandlerAndError:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  BOOL v8;
  uint64_t v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  GKTurnBasedMatchesViewController *v17;

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0D252A8];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterUI/iOS/Framework/GKTurnBasedMatchesViewController_iOS.m", 322, "-[GKTurnBasedMatchesViewController loadDataWithCompletionHandlerAndError:]");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dispatchGroupWithName:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[GKTurnBasedMatchesViewController isLoadingOrRemovingPreloadedMatch](self, "isLoadingOrRemovingPreloadedMatch");
  v9 = MEMORY[0x1E0C809B0];
  if (!v8)
  {
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __74__GKTurnBasedMatchesViewController_loadDataWithCompletionHandlerAndError___block_invoke;
    v15[3] = &unk_1E59C41C0;
    v16 = v7;
    v17 = self;
    objc_msgSend(v16, "perform:", v15);

  }
  v12[0] = v9;
  v12[1] = 3221225472;
  v12[2] = __74__GKTurnBasedMatchesViewController_loadDataWithCompletionHandlerAndError___block_invoke_3;
  v12[3] = &unk_1E59C4D80;
  v13 = v7;
  v14 = v4;
  v10 = v7;
  v11 = v4;
  objc_msgSend(v10, "notifyOnMainQueueWithBlock:", v12);

}

void __74__GKTurnBasedMatchesViewController_loadDataWithCompletionHandlerAndError___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  id v7;
  objc_super v8;
  _QWORD v9[4];
  id v10;
  uint64_t v11;
  id v12;

  v3 = a2;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __74__GKTurnBasedMatchesViewController_loadDataWithCompletionHandlerAndError___block_invoke_2;
  v9[3] = &unk_1E59C7DB0;
  v4 = *(void **)(a1 + 40);
  v5 = *(id *)(a1 + 32);
  v6 = *(_QWORD *)(a1 + 40);
  v10 = v5;
  v11 = v6;
  v12 = v3;
  v8.receiver = v4;
  v8.super_class = (Class)GKTurnBasedMatchesViewController;
  v7 = v3;
  objc_msgSendSuper2(&v8, sel_loadDataWithCompletionHandlerAndError_, v9);

}

uint64_t __74__GKTurnBasedMatchesViewController_loadDataWithCompletionHandlerAndError___block_invoke_2(uint64_t a1, uint64_t a2)
{
  int v4;
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;

  objc_msgSend(*(id *)(a1 + 32), "setError:", a2);
  v4 = objc_msgSend(*(id *)(a1 + 40), "isInGame");
  if (!a2 && v4)
  {
    v5 = *(_QWORD **)(a1 + 40);
    v6 = v5[149];
    objc_msgSend(v5, "matchesDataSource");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "numberOfMatches");

    if (v6 <= v8)
      v9 = v8;
    else
      v9 = v6;
    *(_QWORD *)(*(_QWORD *)(a1 + 40) + 1192) = v9;
    v10 = *(_QWORD **)(a1 + 40);
    if (!v10[149])
      objc_msgSend(v10, "showInviteControllerAnimated:", 0);
  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

void __74__GKTurnBasedMatchesViewController_loadDataWithCompletionHandlerAndError___block_invoke_3(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  if (v1)
  {
    objc_msgSend(*(id *)(a1 + 32), "error");
    v2 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

  }
}

- (BOOL)_gkShouldRefreshContentsForDataType:(unsigned int)a3 userInfo:(id)a4
{
  uint64_t v4;
  id v6;
  BOOL v7;
  objc_super v9;

  v4 = *(_QWORD *)&a3;
  v6 = a4;
  if ((_DWORD)v4 == 14
    && -[GKTurnBasedMatchesViewController isLoadingOrRemovingPreloadedMatch](self, "isLoadingOrRemovingPreloadedMatch"))
  {
    v7 = 0;
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)GKTurnBasedMatchesViewController;
    v7 = -[GKCollectionViewController _gkShouldRefreshContentsForDataType:userInfo:](&v9, sel__gkShouldRefreshContentsForDataType_userInfo_, v4, v6);
  }

  return v7;
}

- (void)didEnterNoContentState
{
  if (-[GKTurnBasedMatchesViewController isInGame](self, "isInGame"))
    -[GKTurnBasedMatchesViewController showInviteControllerAnimated:](self, "showInviteControllerAnimated:", 0);
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  void *v5;
  id v6;

  -[GKSplittingDataSource itemAtIndexPath:](self->_matchesDataSource, "itemAtIndexPath:", a4);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (-[GKTurnBasedMatchesViewController isInGame](self, "isInGame"))
  {
    if (objc_msgSend(v6, "state") == 1)
    {
      -[GKTurnBasedMatchesViewController acceptInviteForMatch:](self, "acceptInviteForMatch:", v6);
    }
    else
    {
      objc_msgSend(v6, "internal");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[GKTurnBasedMatchesViewController showMatch:](self, "showMatch:", v5);

    }
  }
  else
  {
    -[GKTurnBasedMatchesViewController showDetailForMatch:](self, "showDetailForMatch:", v6);
  }

}

- (void)collectionView:(id)a3 didUpdateFocusInContext:(id)a4 withAnimationCoordinator:(id)a5
{
  id v6;
  void *v7;
  char isKindOfClass;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  objc_msgSend(v6, "nextFocusedItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v6, "nextFocusedItem");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "detailButton");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = v10;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKTurnBasedMatchesViewController detailButtonFocusGuide](self, "detailButtonFocusGuide");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setPreferredFocusEnvironments:", v11);

  }
}

- (void)applicationDidEnterBackground
{
  -[GKTurnBasedMatchesViewController dismissDetailViewControllerAnimated:](self, "dismissDetailViewControllerAnimated:", 0);
}

- (void)showInviteControllerAnimated:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  uint64_t v6;
  void *v7;
  GKTurnBasedMatchesViewController *v8;
  GKTurnBasedInviteViewController *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  GKTurnBasedInviteViewController *v15;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0D253B0], "shared");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "multiplayerAllowedPlayerType");

  if (v6)
  {
    -[GKTurnBasedMatchesViewController navigationController](self, "navigationController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "topViewController");
    v8 = (GKTurnBasedMatchesViewController *)objc_claimAutoreleasedReturnValue();

    if (v8 == self)
    {
      v9 = [GKTurnBasedInviteViewController alloc];
      -[GKTurnBasedMatchesViewController matchRequest](self, "matchRequest");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = -[GKMultiplayerViewController initWithMatchRequest:](v9, "initWithMatchRequest:", v10);

      -[GKMultiplayerViewController setGame:](v15, "setGame:", self->_game);
      -[GKTurnBasedInviteViewController setDelegate:](v15, "setDelegate:", self);
      if (-[GKTurnBasedMatchesViewController showExistingMatches](self, "showExistingMatches")
        && -[GKTurnBasedMatchesDataSource numberOfMatches](self->_matchesDataSource, "numberOfMatches"))
      {
        -[GKMultiplayerViewController setShowCancelButton:](v15, "setShowCancelButton:", 0);
        GKGameCenterUIFrameworkBundle();
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        GKGetLocalizedStringFromTableInBundle();
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[GKTurnBasedMatchesViewController navigationItem](self, "navigationItem");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setBackButtonTitle:", v12);

      }
      else
      {
        -[GKMultiplayerViewController setShowCancelButton:](v15, "setShowCancelButton:", 1);
      }
      -[GKTurnBasedMatchesViewController navigationController](self, "navigationController");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "pushViewController:animated:", v15, v3);

      -[GKTurnBasedMatchesViewController setInviteController:](self, "setInviteController:", v15);
    }
  }
}

- (void)turnBasedInviteViewControllerWasCancelled:(id)a3
{
  objc_super v3;
  _QWORD v4[5];

  v4[1] = 3221225472;
  v4[2] = __78__GKTurnBasedMatchesViewController_turnBasedInviteViewControllerWasCancelled___block_invoke;
  v4[3] = &unk_1E59C45D8;
  v4[4] = self;
  v3.receiver = self;
  v3.super_class = (Class)GKTurnBasedMatchesViewController;
  v4[0] = MEMORY[0x1E0C809B0];
  -[GKCollectionViewController loadDataWithCompletionHandlerAndError:](&v3, sel_loadDataWithCompletionHandlerAndError_, v4);
}

void __78__GKTurnBasedMatchesViewController_turnBasedInviteViewControllerWasCancelled___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id v4;
  id v5;

  if (objc_msgSend(*(id *)(a1 + 32), "showExistingMatches")
    && (objc_msgSend(*(id *)(a1 + 32), "matchesDataSource"),
        v2 = (void *)objc_claimAutoreleasedReturnValue(),
        v3 = objc_msgSend(v2, "numberOfMatches"),
        v2,
        v3))
  {
    objc_msgSend(*(id *)(a1 + 32), "navigationController");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    v4 = (id)objc_msgSend(v5, "popToViewController:animated:", *(_QWORD *)(a1 + 32), 1);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "turnBasedViewControllerWasCancelled:", *(_QWORD *)(a1 + 32));
  }

}

- (void)turnBasedInviteViewController:(id)a3 didCreateMatchID:(id)a4
{
  _QWORD v4[5];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __83__GKTurnBasedMatchesViewController_turnBasedInviteViewController_didCreateMatchID___block_invoke;
  v4[3] = &unk_1E59C5D58;
  v4[4] = self;
  objc_msgSend(MEMORY[0x1E0D253E0], "loadMatchWithID:withCompletionHandler:", a4, v4);
}

void __83__GKTurnBasedMatchesViewController_turnBasedInviteViewController_didCreateMatchID___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "internal");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "showMatch:", v3);

}

- (void)turnBasedInviteViewController:(id)a3 didFailWithError:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  -[GKTurnBasedMatchesViewController delegate](self, "delegate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "turnBasedViewController:didFailWithError:", self, v5);

}

- (void)cancelButtonPressed
{
  id v3;

  -[GKTurnBasedMatchesViewController delegate](self, "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "turnBasedViewControllerWasCancelled:", self);

}

- (void)addPressed
{
  -[GKTurnBasedMatchesViewController showInviteControllerAnimated:](self, "showInviteControllerAnimated:", 1);
}

- (void)launchGameAndShowMatch:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  if (-[GKGame isInstalled](self->_game, "isInstalled"))
  {
    objc_msgSend(MEMORY[0x1E0D25298], "proxyForLocalPlayer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "turnBasedServicePrivate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "showMatch:", v6);

  }
}

- (void)notifyGameWithMatch:(id)a3 orError:(id)a4
{
  unint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  NSObject **v15;
  NSObject *v16;
  id v17;

  v6 = (unint64_t)a3;
  v7 = (uint64_t)a4;
  if (!-[GKTurnBasedMatchesViewController isInGame](self, "isInGame"))
  {
    objc_msgSend((id)v6, "internal");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKTurnBasedMatchesViewController launchGameAndShowMatch:](self, "launchGameAndShowMatch:", v9);
    goto LABEL_12;
  }
  if (v6 | v7)
  {
    -[GKTurnBasedMatchesViewController delegate](self, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v6)
    {
      objc_msgSend(v8, "turnBasedViewController:didFindMatch:", self, v6);
      goto LABEL_12;
    }
  }
  else
  {
    v10 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Assertion failed"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterUI/iOS/Framework/GKTurnBasedMatchesViewController_iOS.m");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "lastPathComponent");
    v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v10, "stringWithFormat:", CFSTR("%@ (match != ((void *)0) || error != ((void *)0))\n[%s (%s:%d)]"), v11, "-[GKTurnBasedMatchesViewController notifyGameWithMatch:orError:]", objc_msgSend(v13, "UTF8String"), 477);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("GameKit Exception"), CFSTR("%@"), v14);
    -[GKTurnBasedMatchesViewController delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v15 = (NSObject **)MEMORY[0x1E0D25460];
  v16 = *MEMORY[0x1E0D25460];
  if (!*MEMORY[0x1E0D25460])
  {
    v17 = (id)GKOSLoggers();
    v16 = *v15;
  }
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    -[GKTurnBasedMatchesViewController notifyGameWithMatch:orError:].cold.1(v7, v16);
  objc_msgSend(v9, "turnBasedViewController:didFailWithError:", self, v7);
LABEL_12:

}

- (void)acceptInviteForMatch:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  _QWORD v10[5];

  v4 = a3;
  if (!v4)
  {
    v5 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Assertion failed"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterUI/iOS/Framework/GKTurnBasedMatchesViewController_iOS.m");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "lastPathComponent");
    v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v5, "stringWithFormat:", CFSTR("%@ (match)\n[%s (%s:%d)]"), v6, "-[GKTurnBasedMatchesViewController acceptInviteForMatch:]", objc_msgSend(v8, "UTF8String"), 494);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("GameKit Exception"), CFSTR("%@"), v9);
  }
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __57__GKTurnBasedMatchesViewController_acceptInviteForMatch___block_invoke;
  v10[3] = &unk_1E59C5D58;
  v10[4] = self;
  objc_msgSend(v4, "acceptInviteWithCompletionHandler:", v10);

}

uint64_t __57__GKTurnBasedMatchesViewController_acceptInviteForMatch___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "notifyGameWithMatch:orError:", a2, a3);
}

- (void)showMatch:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  _QWORD v7[5];

  v6 = a3;
  if (-[GKTurnBasedMatchesViewController isInGame](self, "isInGame"))
  {
    v4 = (void *)MEMORY[0x1E0D253E0];
    objc_msgSend(v6, "matchID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __46__GKTurnBasedMatchesViewController_showMatch___block_invoke;
    v7[3] = &unk_1E59C5D58;
    v7[4] = self;
    objc_msgSend(v4, "loadTurnBasedMatchWithDetailsForMatchID:withCompletionHandler:", v5, v7);

  }
  else
  {
    -[GKTurnBasedMatchesViewController launchGameAndShowMatch:](self, "launchGameAndShowMatch:", v6);

  }
}

uint64_t __46__GKTurnBasedMatchesViewController_showMatch___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "notifyGameWithMatch:orError:", a2, a3);
}

- (void)showDetailForMatch:(id)a3
{
  id v4;
  GKTurnBasedMatchDetailViewController *v5;
  void *v6;
  GKNavigationController *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    v4 = a3;
    v5 = objc_alloc_init(GKTurnBasedMatchDetailViewController);
    -[GKTurnBasedMatchDetailViewController setShouldShowPlay:](v5, "setShouldShowPlay:", -[GKTurnBasedMatchesViewController showPlay](self, "showPlay"));
    -[GKTurnBasedMatchDetailViewController setShouldShowQuit:](v5, "setShouldShowQuit:", -[GKTurnBasedMatchesViewController showQuit](self, "showQuit"));
    -[GKTurnBasedMatchDetailViewController setMatch:](v5, "setMatch:", v4);
    objc_msgSend(v4, "game");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    -[GKTurnBasedMatchDetailViewController setGame:](v5, "setGame:", v6);
    -[GKTurnBasedMatchDetailViewController setDelegate:](v5, "setDelegate:", self);
    -[GKTurnBasedMatchDetailViewController setIsInGame:](v5, "setIsInGame:", -[GKTurnBasedMatchesViewController isInGame](self, "isInGame"));
    v7 = objc_alloc_init(GKNavigationController);
    v11[0] = v5;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKNavigationController setViewControllers:](v7, "setViewControllers:", v8);

    -[GKNavigationController setModalPresentationStyle:](v7, "setModalPresentationStyle:", 1);
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKNavigationController view](v7, "view");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setTintColor:", v9);

    -[GKTurnBasedMatchesViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v7, 1, 0);
  }
}

- (void)presentNavigationControllerInPopover:(id)a3 fromCell:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  objc_msgSend(v10, "setModalPresentationStyle:", 7);
  objc_msgSend(v10, "navigationBar");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "_setHidesShadow:", 1);

  objc_msgSend(v10, "popoverPresentationController");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setPermittedArrowDirections:", 15);
  objc_msgSend(v13, "setSourceView:", v9);
  objc_msgSend(v9, "popoverSourceView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "frame");
  objc_msgSend(v13, "setSourceRect:");

  objc_msgSend(v13, "setDelegate:", self);
  -[GKTurnBasedMatchesViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v10, 1, v8);

}

- (void)dismissDetailViewControllerInPopover:(BOOL)a3 completion:(id)a4
{
  _BOOL8 v4;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  v6 = a4;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __84__GKTurnBasedMatchesViewController_dismissDetailViewControllerInPopover_completion___block_invoke;
  v8[3] = &unk_1E59C4DA8;
  v9 = v6;
  v7 = v6;
  -[GKTurnBasedMatchesViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", v4, v8);

}

uint64_t __84__GKTurnBasedMatchesViewController_dismissDetailViewControllerInPopover_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)dismissDetailViewControllerAnimated:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  uint64_t v6;
  BOOL v7;
  void *v8;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "userInterfaceIdiom");

  if (v6 != 1 || (*MEMORY[0x1E0D253F8] ? (v7 = *MEMORY[0x1E0D25B68] == 0) : (v7 = 0), v7))
  {
    -[GKTurnBasedMatchesViewController presentedViewController](self, "presentedViewController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "dismissViewControllerAnimated:completion:", v3, 0);

    -[GKCollectionViewController clearSelectionHighlight](self, "clearSelectionHighlight");
  }
  else
  {
    -[GKTurnBasedMatchesViewController dismissDetailViewControllerInPopover:completion:](self, "dismissDetailViewControllerInPopover:completion:", v3, 0);
  }
}

- (void)_gkRestorePopoverWithViewControllers:(id)a3 completion:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  BOOL v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  GKNavigationController *v23;
  id v24;

  v24 = a3;
  v6 = a4;
  objc_msgSend(v24, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "userInterfaceIdiom");

  if (v9 == 1)
  {
    objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "bounds");
    v12 = v11;
    v14 = v13;

    v15 = v12 > 1024.0;
    if (v14 > 1024.0)
      v15 = 1;
    v16 = 320.0;
    if (v15)
      v16 = 375.0;
  }
  else
  {
    v16 = 320.0;
  }
  objc_msgSend(v7, "setPreferredContentSize:", v16, 440.0);
  -[GKCollectionViewController gkDataSource](self, "gkDataSource");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_gkRepresentedObject");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "indexPathsForItem:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "firstObject");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  -[GKCollectionViewController collectionView](self, "collectionView");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "cellForItemAtIndexPath:", v20);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
  {
    v23 = objc_alloc_init(GKNavigationController);
    -[GKNavigationController setViewControllers:](v23, "setViewControllers:", v24);
    -[GKTurnBasedMatchesViewController presentNavigationControllerInPopover:fromCell:completion:](self, "presentNavigationControllerInPopover:fromCell:completion:", v23, v22, v6);

  }
}

- (void)turnBasedMatchDetailViewControllerDidAcceptInvitation:(id)a3
{
  id v4;

  objc_msgSend(a3, "match");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[GKTurnBasedMatchesViewController acceptInviteForMatch:](self, "acceptInviteForMatch:", v4);

}

- (void)turnBasedMatchDetailViewControllerDidDeclineInvitation:(id)a3
{
  id v4;
  void *v5;
  _QWORD v6[5];

  v4 = a3;
  -[GKTurnBasedMatchesViewController dismissDetailViewControllerAnimated:](self, "dismissDetailViewControllerAnimated:", 1);
  objc_msgSend(v4, "match");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __91__GKTurnBasedMatchesViewController_turnBasedMatchDetailViewControllerDidDeclineInvitation___block_invoke;
  v6[3] = &unk_1E59C45D8;
  v6[4] = self;
  objc_msgSend(v5, "declineInviteWithCompletionHandler:", v6);

}

uint64_t __91__GKTurnBasedMatchesViewController_turnBasedMatchDetailViewControllerDidDeclineInvitation___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setNeedsReload");
}

- (void)turnBasedMatchDetailViewControllerDidChooseMatch:(id)a3
{
  void *v4;
  id v5;

  objc_msgSend(a3, "match");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "internal");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKTurnBasedMatchesViewController showMatch:](self, "showMatch:", v4);

}

- (void)turnBasedMatchDetailViewControllerDidQuitMatch:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  NSObject **v10;
  NSObject *v11;
  id v12;
  _QWORD v13[5];
  _QWORD v14[4];
  id v15;
  id v16;
  GKTurnBasedMatchesViewController *v17;
  id v18;

  v4 = a3;
  objc_msgSend(v4, "match");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localPlayerParticipant");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKTurnBasedMatchesViewController delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "match");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isMyTurn");

  if (v9)
  {
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __83__GKTurnBasedMatchesViewController_turnBasedMatchDetailViewControllerDidQuitMatch___block_invoke;
    v14[3] = &unk_1E59C7DD8;
    v15 = v4;
    v16 = v5;
    v17 = self;
    v18 = v7;
    objc_msgSend(v16, "loadMatchDataWithCompletionHandler:", v14);

  }
  else
  {
    -[GKTurnBasedMatchesViewController dismissDetailViewControllerAnimated:](self, "dismissDetailViewControllerAnimated:", 1);
    if (objc_msgSend(v6, "status") == 4)
    {
      v10 = (NSObject **)MEMORY[0x1E0D25460];
      v11 = *MEMORY[0x1E0D25460];
      if (!*MEMORY[0x1E0D25460])
      {
        v12 = (id)GKOSLoggers();
        v11 = *v10;
      }
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
        -[GKTurnBasedMatchesViewController turnBasedMatchDetailViewControllerDidQuitMatch:].cold.1();
    }
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __83__GKTurnBasedMatchesViewController_turnBasedMatchDetailViewControllerDidQuitMatch___block_invoke_106;
    v13[3] = &unk_1E59C45D8;
    v13[4] = self;
    objc_msgSend(v5, "participantQuitOutOfTurnWithOutcome:withCompletionHandler:", 1, v13);
  }

}

void __83__GKTurnBasedMatchesViewController_turnBasedMatchDetailViewControllerDidQuitMatch___block_invoke(id *a1, uint64_t a2, uint64_t a3)
{
  void *v4;
  void *v5;
  _QWORD block[5];

  if (a3)
  {
    objc_msgSend(a1[7], "turnBasedViewController:didFailWithError:", a1[6], a3);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __83__GKTurnBasedMatchesViewController_turnBasedMatchDetailViewControllerDidQuitMatch___block_invoke_2;
    block[3] = &unk_1E59C4148;
    block[4] = a1[6];
    dispatch_async(MEMORY[0x1E0C80D38], block);
  }
  else
  {
    objc_msgSend(a1[4], "setMatch:", a1[5]);
    objc_msgSend(a1[4], "setNeedsReload");
    objc_msgSend(a1[5], "matchID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[6], "setMatchIDWaitingForTurnEvent:", v4);

    objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObserver:selector:name:object:", a1[6], sel_handleTurnBasedEvent_, *MEMORY[0x1E0D24D48], 0);

    objc_msgSend(a1[7], "turnBasedViewController:playerQuitForMatch:", a1[6], a1[5]);
  }
}

uint64_t __83__GKTurnBasedMatchesViewController_turnBasedMatchDetailViewControllerDidQuitMatch___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "dismissDetailViewControllerAnimated:", 1);
}

uint64_t __83__GKTurnBasedMatchesViewController_turnBasedMatchDetailViewControllerDidQuitMatch___block_invoke_106(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setNeedsReload");
}

- (void)turnBasedMatchesDataSource:(id)a3 didQuitMatch:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  NSObject **v8;
  NSObject *v9;
  id v10;
  _QWORD v11[5];
  _QWORD v12[5];
  id v13;
  id v14;

  v5 = a4;
  objc_msgSend(v5, "localPlayerParticipant");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKTurnBasedMatchesViewController delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isMyTurn"))
  {
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __76__GKTurnBasedMatchesViewController_turnBasedMatchesDataSource_didQuitMatch___block_invoke;
    v12[3] = &unk_1E59C7E00;
    v12[4] = self;
    v13 = v5;
    v14 = v7;
    objc_msgSend(v13, "loadMatchDataWithCompletionHandler:", v12);

  }
  else
  {
    if (objc_msgSend(v6, "status") == 4)
    {
      v8 = (NSObject **)MEMORY[0x1E0D25460];
      v9 = *MEMORY[0x1E0D25460];
      if (!*MEMORY[0x1E0D25460])
      {
        v10 = (id)GKOSLoggers();
        v9 = *v8;
      }
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        -[GKTurnBasedMatchesViewController turnBasedMatchDetailViewControllerDidQuitMatch:].cold.1();
    }
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __76__GKTurnBasedMatchesViewController_turnBasedMatchesDataSource_didQuitMatch___block_invoke_107;
    v11[3] = &unk_1E59C45D8;
    v11[4] = self;
    objc_msgSend(v5, "participantQuitOutOfTurnWithOutcome:withCompletionHandler:", 1, v11);
  }

}

uint64_t __76__GKTurnBasedMatchesViewController_turnBasedMatchesDataSource_didQuitMatch___block_invoke(id *a1, uint64_t a2, uint64_t a3)
{
  void *v5;
  void *v6;

  if (a3)
    return objc_msgSend(a1[6], "turnBasedViewController:didFailWithError:", a1[4], a3);
  objc_msgSend(a1[5], "matchID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[4], "setMatchIDWaitingForTurnEvent:", v5);

  objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObserver:selector:name:object:", a1[4], sel_handleTurnBasedEvent_, *MEMORY[0x1E0D24D48], 0);

  return objc_msgSend(a1[6], "turnBasedViewController:playerQuitForMatch:", a1[4], a1[5]);
}

uint64_t __76__GKTurnBasedMatchesViewController_turnBasedMatchesDataSource_didQuitMatch___block_invoke_107(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setNeedsReload");
}

- (void)turnBasedMatchDetailViewControllerDidRemoveMatch:(id)a3
{
  id v4;
  void *v5;
  _QWORD v6[5];

  v4 = a3;
  -[GKTurnBasedMatchesViewController dismissDetailViewControllerAnimated:](self, "dismissDetailViewControllerAnimated:", 1);
  objc_msgSend(v4, "match");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __85__GKTurnBasedMatchesViewController_turnBasedMatchDetailViewControllerDidRemoveMatch___block_invoke;
  v6[3] = &unk_1E59C45D8;
  v6[4] = self;
  objc_msgSend(v5, "removeWithCompletionHandler:", v6);

}

uint64_t __85__GKTurnBasedMatchesViewController_turnBasedMatchDetailViewControllerDidRemoveMatch___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setNeedsReload");
}

- (void)turnBasedMatchDetailViewControllerDidShowStore:(id)a3
{
  void *v4;
  uint64_t v5;
  BOOL v6;
  id v7;

  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "userInterfaceIdiom");

  if (v5 == 1)
  {
    if (*MEMORY[0x1E0D253F8])
      v6 = *MEMORY[0x1E0D25B68] == 0;
    else
      v6 = 0;
    if (!v6)
    {
      -[GKTurnBasedMatchesViewController dismissDetailViewControllerAnimated:](self, "dismissDetailViewControllerAnimated:", 1);
      -[GKTurnBasedMatchesViewController game](self, "game");
      v7 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "openAppStorePage");

    }
  }
}

- (void)handleTurnBasedEvent:(id)a3
{
  void *v4;
  _QWORD block[5];

  objc_msgSend(a3, "object");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[GKTurnBasedMatchesViewController isInGame](self, "isInGame")
    && objc_msgSend(v4, "isEqualToString:", self->_matchIDWaitingForTurnEvent))
  {
    -[GKTurnBasedMatchesViewController setMatchIDWaitingForTurnEvent:](self, "setMatchIDWaitingForTurnEvent:", 0);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __57__GKTurnBasedMatchesViewController_handleTurnBasedEvent___block_invoke;
    block[3] = &unk_1E59C4148;
    block[4] = self;
    dispatch_async(MEMORY[0x1E0C80D38], block);
  }

}

uint64_t __57__GKTurnBasedMatchesViewController_handleTurnBasedEvent___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "dismissViewControllerAnimated:completion:", 1, 0);
}

- (GKCollectionViewController)masterViewController
{
  return (GKCollectionViewController *)objc_loadWeakRetained((id *)&self->_masterViewController);
}

- (void)setMasterViewController:(id)a3
{
  objc_storeWeak((id *)&self->_masterViewController, a3);
}

- (GKGame)game
{
  return self->_game;
}

- (GKMatchRequest)matchRequest
{
  return self->_matchRequest;
}

- (void)setMatchRequest:(id)a3
{
  objc_storeStrong((id *)&self->_matchRequest, a3);
}

- (GKTurnBasedMatchesViewControllerDelegate)delegate
{
  return (GKTurnBasedMatchesViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)showExistingMatches
{
  return self->_showExistingMatches;
}

- (void)setShowExistingMatches:(BOOL)a3
{
  self->_showExistingMatches = a3;
}

- (BOOL)showPlay
{
  return self->_showPlay;
}

- (void)setShowPlay:(BOOL)a3
{
  self->_showPlay = a3;
}

- (BOOL)showQuit
{
  return self->_showQuit;
}

- (void)setShowQuit:(BOOL)a3
{
  self->_showQuit = a3;
}

- (GKTurnBasedMatchesDataSource)matchesDataSource
{
  return self->_matchesDataSource;
}

- (void)setMatchesDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_matchesDataSource, a3);
}

- (int64_t)maxMatchesSeen
{
  return self->_maxMatchesSeen;
}

- (void)setMaxMatchesSeen:(int64_t)a3
{
  self->_maxMatchesSeen = a3;
}

- (NSString)matchIDWaitingForTurnEvent
{
  return self->_matchIDWaitingForTurnEvent;
}

- (void)setMatchIDWaitingForTurnEvent:(id)a3
{
  objc_storeStrong((id *)&self->_matchIDWaitingForTurnEvent, a3);
}

- (GKTurnBasedInviteViewController)inviteController
{
  return self->_inviteController;
}

- (void)setInviteController:(id)a3
{
  objc_storeStrong((id *)&self->_inviteController, a3);
}

- (double)initialSectionHeaderHeight
{
  return self->_initialSectionHeaderHeight;
}

- (void)setInitialSectionHeaderHeight:(double)a3
{
  self->_initialSectionHeaderHeight = a3;
}

- (UIFocusGuide)detailButtonFocusGuide
{
  return self->_detailButtonFocusGuide;
}

- (void)setDetailButtonFocusGuide:(id)a3
{
  objc_storeStrong((id *)&self->_detailButtonFocusGuide, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_detailButtonFocusGuide, 0);
  objc_storeStrong((id *)&self->_inviteController, 0);
  objc_storeStrong((id *)&self->_matchIDWaitingForTurnEvent, 0);
  objc_storeStrong((id *)&self->_matchesDataSource, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_matchRequest, 0);
  objc_storeStrong((id *)&self->_game, 0);
  objc_destroyWeak((id *)&self->_masterViewController);
}

- (void)notifyGameWithMatch:(uint64_t)a1 orError:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_debug_impl(&dword_1AB361000, a2, OS_LOG_TYPE_DEBUG, "no match for notifyGameWithMatch: ->error loading TBG match details: %@", (uint8_t *)&v2, 0xCu);
  OUTLINED_FUNCTION_4();
}

- (void)turnBasedMatchDetailViewControllerDidQuitMatch:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_7_2();
  OUTLINED_FUNCTION_0_3(&dword_1AB361000, v0, v1, "localParticipant: %@ has unexpected status for being active in match: %@");
  OUTLINED_FUNCTION_4();
}

@end
