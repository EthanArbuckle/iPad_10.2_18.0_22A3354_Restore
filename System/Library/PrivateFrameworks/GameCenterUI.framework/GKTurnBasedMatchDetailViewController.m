@implementation GKTurnBasedMatchDetailViewController

- (GKTurnBasedMatchDetailViewController)init
{
  GKGridLayout *v3;
  GKTurnBasedMatchDetailViewController *v4;
  objc_super v6;

  v3 = objc_alloc_init(GKGridLayout);
  v6.receiver = self;
  v6.super_class = (Class)GKTurnBasedMatchDetailViewController;
  v4 = -[GKCollectionViewController initWithCollectionViewLayout:](&v6, sel_initWithCollectionViewLayout_, v3);

  if (v4)
  {
    -[GKTurnBasedMatchDetailViewController setRestorationClass:](v4, "setRestorationClass:", objc_opt_class());
    -[GKTurnBasedMatchDetailViewController setRestorationIdentifier:](v4, "setRestorationIdentifier:", CFSTR("TurnBasedMatchDetail"));
  }
  return v4;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)GKTurnBasedMatchDetailViewController;
  -[GKCollectionViewController dealloc](&v4, sel_dealloc);
}

- (void)setMatch:(id)a3
{
  GKTurnBasedMatch *v5;
  GKTurnBasedMatch *v6;

  v5 = (GKTurnBasedMatch *)a3;
  if (self->_match != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_match, a3);
    -[GKTurnBasedMatchDetailViewController didUpdateModel](self, "didUpdateModel");
    v5 = v6;
  }

}

- (void)configureDataSource
{
  void *v3;
  GKTurnBasedParticipantsDataSource *v4;
  GKTurnBasedParticipantsDataSource *participantsDataSource;
  void *v6;
  void *v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  objc_super v13;

  -[GKCollectionViewController dataSource](self, "dataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v4 = objc_alloc_init(GKTurnBasedParticipantsDataSource);
    participantsDataSource = self->_participantsDataSource;
    self->_participantsDataSource = v4;

    objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[GKSectionMetrics metricsForIdiom:](GKSectionMetrics, "metricsForIdiom:", objc_msgSend(v6, "userInterfaceIdiom"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "sectionHeaderHeight");
    self->_initialSectionHeaderHeight = v8;
    -[GKCollectionViewDataSource setDefaultSectionMetrics:](self->_participantsDataSource, "setDefaultSectionMetrics:", v7);
    +[GKSupplementaryViewMetrics supplementaryMetrics](GKSupplementaryViewMetrics, "supplementaryMetrics");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setKind:", CFSTR("GKTurnBasedMatchDetailHeaderKind"));
    objc_msgSend(v9, "setShouldPin:", 0);
    -[GKCollectionViewDataSource dataSourceMetrics](self->_participantsDataSource, "dataSourceMetrics");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "insertSupplementaryMetrics:forKey:atLocation:", v9, CFSTR("detailHeader"), 0);

    -[GKTurnBasedMatchDetailViewController participantsDataSource](self, "participantsDataSource");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObserver:forKeyPath:options:context:", self, CFSTR("match"), 1, 0);

    -[GKTurnBasedMatchDetailViewController match](self, "match");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKTurnBasedParticipantsDataSource setMatch:](self->_participantsDataSource, "setMatch:", v12);

    -[GKBasicCollectionViewController setDataSource:](self, "setDataSource:", self->_participantsDataSource);
    v13.receiver = self;
    v13.super_class = (Class)GKTurnBasedMatchDetailViewController;
    -[GKBasicCollectionViewController configureDataSource](&v13, sel_configureDataSource);

  }
}

- (void)configureViewFactories
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)GKTurnBasedMatchDetailViewController;
  -[GKCollectionViewController configureViewFactories](&v5, sel_configureViewFactories);
  -[GKCollectionViewController collectionView](self, "collectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_gkRegisterClass:forSupplementaryViewOfKind:", objc_opt_class(), CFSTR("GKTurnBasedMatchDetailHeaderKind"));

  -[GKCollectionViewDataSource registerSupplementaryViewOfKind:withClass:target:configurator:](self->_participantsDataSource, "registerSupplementaryViewOfKind:withClass:target:configurator:", CFSTR("GKTurnBasedMatchDetailHeaderKind"), objc_opt_class(), self, sel_configureMatchDetailHeader_);
  -[GKCollectionViewController collectionView](self, "collectionView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_gkRegisterClass:forSupplementaryViewOfKind:", objc_opt_class(), CFSTR("SectionHeader"));

  -[GKCollectionViewDataSource registerSupplementaryViewOfKind:withClass:target:configurator:](self->_participantsDataSource, "registerSupplementaryViewOfKind:withClass:target:configurator:", CFSTR("SectionHeader"), objc_opt_class(), self, sel_configureHeader_indexPath_);
}

- (void)configureMatchDetailHeader:(id)a3
{
  id v4;

  v4 = a3;
  -[GKTurnBasedMatchDetailViewController setHeaderView:](self, "setHeaderView:", v4);
  objc_msgSend(v4, "setActionTarget:", self);

  -[GKTurnBasedMatchDetailViewController updateUIBasedOnTraitCollection](self, "updateUIBasedOnTraitCollection");
  -[GKTurnBasedMatchDetailViewController didUpdateModel](self, "didUpdateModel");
}

- (void)configureHeader:(id)a3 indexPath:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;

  v5 = a3;
  -[GKTurnBasedMatchDetailViewController participantsDataSource](self, "participantsDataSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sectionTitle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedUppercaseString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setLeftText:", v8);

  objc_msgSend(MEMORY[0x1E0DC1350], "_gkPreferredFontForTextStyle:symbolicTraits:", *MEMORY[0x1E0DC4AB8], 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "leftLabel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setFont:", v9);

  objc_msgSend(v5, "leftLabel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "textColor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "colorWithAlphaComponent:", 0.600000024);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "leftLabel");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setTextColor:", v13);

  v15 = *MEMORY[0x1E0CD2EA0];
  objc_msgSend(v5, "leftLabel");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "layer");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setCompositingFilter:", v15);

  objc_msgSend(v5, "underlineView");
  v18 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v18, "setHidden:", 1);
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  void *v7;
  id v8;

  if (objc_msgSend(a3, "isEqual:", CFSTR("match"), a4, a5, a6))
  {
    -[GKTurnBasedMatchDetailViewController participantsDataSource](self, "participantsDataSource");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "match");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKTurnBasedMatchDetailViewController setMatch:](self, "setMatch:", v7);

  }
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
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)GKTurnBasedMatchDetailViewController;
  -[GKCollectionViewController viewDidLoad](&v13, sel_viewDidLoad);
  -[GKTurnBasedMatchDetailViewController navigationController](self, "navigationController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "makeNavigationBarBackgroundTranslucent");

  -[GKCollectionViewController collectionView](self, "collectionView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[GKCollectionViewController collectionView](self, "collectionView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setShowsVerticalScrollIndicator:", 0);

  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 0, self, sel_doneButtonPressed_);
  -[GKTurnBasedMatchDetailViewController navigationItem](self, "navigationItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setLeftBarButtonItem:", v6);

  -[GKTurnBasedMatchDetailViewController match](self, "match");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "matchTitle");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKTurnBasedMatchDetailViewController navigationItem](self, "navigationItem");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setTitle:", v9);

  -[GKTurnBasedMatchDetailViewController match](self, "match");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "matchTitle");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKTurnBasedMatchDetailViewController setTitle:](self, "setTitle:", v12);

  -[GKTurnBasedMatchDetailViewController addBackgroundVisualEffect](self, "addBackgroundVisualEffect");
}

- (void)addBackgroundVisualEffect
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
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;

  v22 = objc_alloc_init(MEMORY[0x1E0DC3F58]);
  objc_msgSend(MEMORY[0x1E0DC3F50], "_gkGameLayerBackgroundVisualEffect");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setBackgroundEffects:", v3);

  -[GKTurnBasedMatchDetailViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  objc_msgSend(v22, "setFrame:");

  objc_msgSend(v22, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[GKTurnBasedMatchDetailViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "insertSubview:atIndex:", v22, 0);

  objc_msgSend(v22, "topAnchor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKTurnBasedMatchDetailViewController view](self, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "topAnchor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "constraintEqualToAnchor:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setActive:", 1);

  objc_msgSend(v22, "bottomAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKTurnBasedMatchDetailViewController view](self, "view");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "bottomAnchor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "constraintEqualToAnchor:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setActive:", 1);

  objc_msgSend(v22, "leadingAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKTurnBasedMatchDetailViewController view](self, "view");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "leadingAnchor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "constraintEqualToAnchor:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setActive:", 1);

  objc_msgSend(v22, "trailingAnchor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKTurnBasedMatchDetailViewController view](self, "view");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "trailingAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "constraintEqualToAnchor:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setActive:", 1);

}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)GKTurnBasedMatchDetailViewController;
  -[GKCollectionViewController viewWillAppear:](&v4, sel_viewWillAppear_, a3);
  -[GKTurnBasedMatchDetailViewController didUpdateModel](self, "didUpdateModel");
  -[GKTurnBasedMatchDetailViewController setActionButtonEnabled:](self, "setActionButtonEnabled:", 1);
  -[GKTurnBasedMatchDetailHeaderView setLabelAlpha:](self->_headerView, "setLabelAlpha:", 1.0);
  -[GKTurnBasedMatchDetailViewController updateUIBasedOnTraitCollection](self, "updateUIBasedOnTraitCollection");
}

- (void)viewDidAppear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v3 = a3;
  -[GKTurnBasedMatchDetailViewController navigationController](self, "navigationController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "navigationBar");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKTurnBasedMatchDetailViewController _gkConfigureFocusGuidesForNavigationBar:](self, "_gkConfigureFocusGuidesForNavigationBar:", v6);

  objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObserver:selector:name:object:", self, sel_handleTurnBasedEvent_, *MEMORY[0x1E0D24D48], 0);

  v8.receiver = self;
  v8.super_class = (Class)GKTurnBasedMatchDetailViewController;
  -[GKCollectionViewController viewDidAppear:](&v8, sel_viewDidAppear_, v3);
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
  v6.super_class = (Class)GKTurnBasedMatchDetailViewController;
  -[GKCollectionViewController viewWillDisappear:](&v6, sel_viewWillDisappear_, v3);
}

- (void)updateUIBasedOnTraitCollection
{
  void *v3;
  uint64_t v4;
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
  double v32;
  double v33;
  void *v34;
  NSString *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  id v42;

  -[GKTurnBasedMatchDetailViewController traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "verticalSizeClass");

  -[GKCollectionViewController collectionView](self, "collectionView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_gkRemoveAllConstraints");

  -[GKCollectionViewController collectionView](self, "collectionView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v4 == 1)
  {
    objc_msgSend(v6, "widthAnchor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "constraintEqualToConstant:", 500.0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setActive:", 1);
  }
  else
  {
    objc_msgSend(v6, "leftAnchor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKTurnBasedMatchDetailViewController view](self, "view");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "leftAnchor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "constraintEqualToAnchor:constant:", v12, 16.0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setActive:", 1);

    -[GKCollectionViewController collectionView](self, "collectionView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "rightAnchor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKTurnBasedMatchDetailViewController view](self, "view");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "rightAnchor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "constraintEqualToAnchor:constant:", v14, -16.0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setActive:", 1);

  }
  -[GKCollectionViewController collectionView](self, "collectionView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "centerXAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKTurnBasedMatchDetailViewController view](self, "view");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "centerXAnchor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "constraintEqualToAnchor:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setActive:", 1);

  -[GKCollectionViewController collectionView](self, "collectionView");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "topAnchor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKTurnBasedMatchDetailViewController view](self, "view");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "topAnchor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "constraintEqualToAnchor:", v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setActive:", 1);

  -[GKCollectionViewController collectionView](self, "collectionView");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "bottomAnchor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKTurnBasedMatchDetailViewController view](self, "view");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "bottomAnchor");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "constraintEqualToAnchor:", v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setActive:", 1);

  -[GKCollectionViewController collectionView](self, "collectionView");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "setNeedsLayout");

  -[GKCollectionViewDataSource defaultSectionMetrics](self->_participantsDataSource, "defaultSectionMetrics");
  v42 = (id)objc_claimAutoreleasedReturnValue();
  +[GKTurnParticipantCell defaultRowHeight](GKTurnParticipantCell, "defaultRowHeight");
  v33 = v32;
  -[GKTurnBasedMatchDetailViewController traitCollection](self, "traitCollection");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "preferredContentSizeCategory");
  v35 = (NSString *)objc_claimAutoreleasedReturnValue();
  LODWORD(v28) = UIContentSizeCategoryIsAccessibilityCategory(v35);

  if ((_DWORD)v28)
  {
    v33 = v33 * 1.7;
    objc_msgSend(v42, "setSectionHeadersShouldPin:", 0);
  }
  objc_msgSend(MEMORY[0x1E0DC37F8], "defaultMetrics");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "scaledValueForValue:", v33);
  objc_msgSend(v42, "setDesiredItemHeight:");

  objc_msgSend(v42, "setItemHeightList:", 0);
  objc_msgSend(MEMORY[0x1E0DC37F8], "defaultMetrics");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "scaledValueForValue:", self->_initialSectionHeaderHeight);
  objc_msgSend(v42, "setSectionHeaderHeight:");

  -[GKCollectionViewDataSource dataSourceMetrics](self->_participantsDataSource, "dataSourceMetrics");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "supplementaryMetricsForKey:", CFSTR("detailHeader"));
  v39 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC37F8], "defaultMetrics");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "scaledValueForValue:", 255.0);
  objc_msgSend(v39, "setDesiredHeight:");

  -[GKCollectionViewDataSource dataSourceMetrics](self->_participantsDataSource, "dataSourceMetrics");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "replaceSupplementaryMetrics:forKey:", v39, CFSTR("detailHeader"));

  -[GKCollectionViewController _gkSetContentsNeedUpdateWithHandler:](self, "_gkSetContentsNeedUpdateWithHandler:", 0);
}

- (void)traitCollectionDidChange:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)GKTurnBasedMatchDetailViewController;
  -[GKCollectionViewController traitCollectionDidChange:](&v4, sel_traitCollectionDidChange_, a3);
  -[GKTurnBasedMatchDetailViewController updateUIBasedOnTraitCollection](self, "updateUIBasedOnTraitCollection");
}

- (void)didUpdateModel
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  -[GKTurnBasedMatchDetailHeaderView setMatch:](self->_headerView, "setMatch:", self->_match);
  -[GKTurnBasedMatchDetailHeaderView setActionSelector:](self->_headerView, "setActionSelector:", 0);
  -[GKTurnBasedMatchDetailHeaderView setInfoText:](self->_headerView, "setInfoText:", 0);
  if (-[GKGame isInstalled](self->_game, "isInstalled"))
  {
    switch(-[GKTurnBasedMatch state](self->_match, "state"))
    {
      case 1u:
        GKGameCenterUIFrameworkBundle();
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        GKGetLocalizedStringFromTableInBundle();
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[GKTurnBasedMatchDetailHeaderView setActionText:](self->_headerView, "setActionText:", v17);

        v13 = sel_acceptInvitation_;
        goto LABEL_9;
      case 2u:
      case 3u:
      case 4u:
      case 5u:
        GKGameCenterUIFrameworkBundle();
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        GKGetLocalizedStringFromTableInBundle();
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[GKTurnBasedMatchDetailHeaderView setActionText:](self->_headerView, "setActionText:", v15);

        v13 = sel_chooseMatch_;
        goto LABEL_9;
      default:
        -[GKTurnBasedMatchDetailHeaderView setActionText:](self->_headerView, "setActionText:", &stru_1E59EB978);
        break;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D253B0], "shared");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "isAppInstallationRestricted");

    if (v4)
    {
      v5 = (void *)MEMORY[0x1E0CB3940];
      GKGameCenterUIFrameworkBundle();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      GKGetLocalizedStringFromTableInBundle();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[GKTurnBasedMatchDetailViewController game](self, "game");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "name");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "stringWithFormat:", v7, v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[GKTurnBasedMatchDetailHeaderView setInfoText:](self->_headerView, "setInfoText:", v10);

    }
    else
    {
      GKGameCenterUIFrameworkBundle();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      GKGetLocalizedStringFromTableInBundle();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[GKTurnBasedMatchDetailHeaderView setActionText:](self->_headerView, "setActionText:", v12);

      v13 = sel_buyButtonPressed_;
LABEL_9:
      -[GKTurnBasedMatchDetailHeaderView setActionSelector:](self->_headerView, "setActionSelector:", v13);
    }
  }
  -[GKTurnBasedMatchDetailViewController setupActionButton](self, "setupActionButton");
  if (!self->_shouldShowPlay)
  {
    -[GKTurnBasedMatchDetailHeaderView actionButton](self->_headerView, "actionButton");
    v18 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setHidden:", 1);

  }
}

- (BOOL)collectionView:(id)a3 shouldHighlightItemAtIndexPath:(id)a4
{
  return 0;
}

- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4
{
  return 0;
}

- (void)setupActionButton
{
  void *v3;
  char *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  id v15;

  switch(-[GKTurnBasedMatch state](self->_match, "state"))
  {
    case 1u:
      GKGameCenterUIFrameworkBundle();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      GKGetLocalizedStringFromTableInBundle();
      v15 = (id)objc_claimAutoreleasedReturnValue();

      v4 = sel_declineInvitation_;
      goto LABEL_12;
    case 2u:
    case 3u:
      GKGameCenterUIFrameworkBundle();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      GKGetLocalizedStringFromTableInBundle();
      v15 = (id)objc_claimAutoreleasedReturnValue();

      if (!self->_isInGame)
        goto LABEL_11;
      v4 = sel_quitMatch_;
LABEL_7:
      if (self->_shouldShowQuit || (-[GKTurnBasedMatch isMyTurn](self->_match, "isMyTurn") & 1) == 0)
        goto LABEL_12;
      -[GKTurnBasedMatchDetailViewController navigationItem](self, "navigationItem");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setRightBarButtonItem:", 0);
      goto LABEL_14;
    case 4u:
      GKGameCenterUIFrameworkBundle();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      GKGetLocalizedStringFromTableInBundle();
      v15 = (id)objc_claimAutoreleasedReturnValue();

      v4 = sel_quitMatch_;
      if (self->_isInGame)
        goto LABEL_7;
      goto LABEL_12;
    case 5u:
      GKGameCenterUIFrameworkBundle();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      GKGetLocalizedStringFromTableInBundle();
      v15 = (id)objc_claimAutoreleasedReturnValue();

LABEL_11:
      v4 = sel_removeMatch_;
      goto LABEL_12;
    default:
      GKGameCenterUIFrameworkBundle();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      GKGetLocalizedStringFromTableInBundle();
      v15 = (id)objc_claimAutoreleasedReturnValue();

      v4 = 0;
LABEL_12:
      -[GKTurnBasedMatchDetailViewController navigationItem](self, "navigationItem");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "rightBarButtonItem");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "title");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "isEqualToString:", v15);

      if ((v13 & 1) != 0)
        goto LABEL_15;
      v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithTitle:style:target:action:", v15, 0, self, v4);
      -[GKTurnBasedMatchDetailViewController navigationItem](self, "navigationItem");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setRightBarButtonItem:", v8);

LABEL_14:
LABEL_15:

      return;
  }
}

- (void)setActionButtonEnabled:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  id v5;

  v3 = a3;
  -[GKTurnBasedMatchDetailViewController navigationItem](self, "navigationItem");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "rightBarButtonItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setEnabled:", v3);

}

- (void)acceptInvitation:(id)a3
{
  id v4;

  -[GKTurnBasedMatchDetailViewController setActionButtonEnabled:](self, "setActionButtonEnabled:", 0);
  -[GKTurnBasedMatchDetailViewController delegate](self, "delegate");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "turnBasedMatchDetailViewControllerDidAcceptInvitation:", self);

}

- (void)declineInvitation:(id)a3
{
  id v4;

  -[GKTurnBasedMatchDetailViewController setActionButtonEnabled:](self, "setActionButtonEnabled:", 0);
  -[GKTurnBasedMatchDetailViewController delegate](self, "delegate");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "turnBasedMatchDetailViewControllerDidDeclineInvitation:", self);

}

- (void)chooseMatch:(id)a3
{
  id v4;

  -[GKTurnBasedMatchDetailViewController setActionButtonEnabled:](self, "setActionButtonEnabled:", 0);
  -[GKTurnBasedMatchDetailViewController delegate](self, "delegate");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "turnBasedMatchDetailViewControllerDidChooseMatch:", self);

}

- (void)quitMatch:(id)a3
{
  id v4;

  -[GKTurnBasedMatchDetailViewController setActionButtonEnabled:](self, "setActionButtonEnabled:", 0);
  -[GKTurnBasedMatchDetailViewController delegate](self, "delegate");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "turnBasedMatchDetailViewControllerDidQuitMatch:", self);

}

- (void)removeMatch:(id)a3
{
  id v4;

  -[GKTurnBasedMatchDetailViewController setActionButtonEnabled:](self, "setActionButtonEnabled:", 0);
  -[GKTurnBasedMatchDetailViewController delegate](self, "delegate");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "turnBasedMatchDetailViewControllerDidRemoveMatch:", self);

}

- (void)handleTurnBasedEvent:(id)a3
{
  void *v4;
  int v5;
  id v6;

  objc_msgSend(a3, "object");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[GKTurnBasedMatch matchID](self->_match, "matchID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v6, "isEqual:", v4);

  if (v5)
    -[GKCollectionViewController setNeedsReload](self, "setNeedsReload");

}

- (void)buyButtonPressed:(id)a3
{
  id v4;

  -[GKTurnBasedMatchDetailViewController delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "turnBasedMatchDetailViewControllerDidShowStore:", self);

}

- (void)doneButtonPressed:(id)a3
{
  -[GKTurnBasedMatchDetailViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (id)preferredFocusEnvironments
{
  void *v2;
  void *v3;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  -[GKTurnBasedMatchDetailViewController headerView](self, "headerView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (GKTurnBasedMatchDetailViewControllerDelegate)delegate
{
  return (GKTurnBasedMatchDetailViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegateWeak);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegateWeak, a3);
}

- (GKTurnBasedMatch)match
{
  return self->_match;
}

- (GKGame)game
{
  return self->_game;
}

- (void)setGame:(id)a3
{
  objc_storeStrong((id *)&self->_game, a3);
}

- (BOOL)isInGame
{
  return self->_isInGame;
}

- (void)setIsInGame:(BOOL)a3
{
  self->_isInGame = a3;
}

- (BOOL)shouldShowPlay
{
  return self->_shouldShowPlay;
}

- (void)setShouldShowPlay:(BOOL)a3
{
  self->_shouldShowPlay = a3;
}

- (BOOL)shouldShowQuit
{
  return self->_shouldShowQuit;
}

- (void)setShouldShowQuit:(BOOL)a3
{
  self->_shouldShowQuit = a3;
}

- (GKTurnBasedParticipantsDataSource)participantsDataSource
{
  return self->_participantsDataSource;
}

- (void)setParticipantsDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_participantsDataSource, a3);
}

- (GKTurnBasedMatchDetailHeaderView)headerView
{
  return self->_headerView;
}

- (void)setHeaderView:(id)a3
{
  objc_storeStrong((id *)&self->_headerView, a3);
}

- (double)initialSectionHeaderHeight
{
  return self->_initialSectionHeaderHeight;
}

- (void)setInitialSectionHeaderHeight:(double)a3
{
  self->_initialSectionHeaderHeight = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_headerView, 0);
  objc_storeStrong((id *)&self->_participantsDataSource, 0);
  objc_storeStrong((id *)&self->_game, 0);
  objc_storeStrong((id *)&self->_match, 0);
  objc_destroyWeak((id *)&self->_delegateWeak);
}

@end
