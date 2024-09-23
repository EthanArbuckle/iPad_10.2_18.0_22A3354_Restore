@implementation GKLeaderboardListViewController

- (GKLeaderboardListViewController)initWithGameRecord:(id)a3 leaderboardSet:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  GKLeaderboardListViewController *v10;
  GKLeaderboardListDataSource *v11;
  GKLeaderboardListDataSource *v12;
  void *v13;
  void *v14;
  objc_super v16;

  v6 = a3;
  v7 = a4;
  objc_msgSend((id)objc_opt_class(), "_gkPlatformNibName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v16.receiver = self;
  v16.super_class = (Class)GKLeaderboardListViewController;
  v10 = -[GKLoadingViewController initWithNibName:bundle:](&v16, sel_initWithNibName_bundle_, v8, v9);

  if (v10)
  {
    if (v7 || !objc_msgSend(v6, "supportsLeaderboardSets"))
    {
      -[GKLeaderboardListViewController setShowingLeaderboardSets:](v10, "setShowingLeaderboardSets:", 0);
      v11 = -[GKLeaderboardListDataSource initWithGameRecord:leaderboardSet:]([GKLeaderboardListDataSource alloc], "initWithGameRecord:leaderboardSet:", v6, v7);
    }
    else
    {
      -[GKLeaderboardListViewController setShowingLeaderboardSets:](v10, "setShowingLeaderboardSets:", 1);
      v11 = -[GKGameLayerCollectionDataSource initWithGameRecord:]([GKLeaderboardSetDataSource alloc], "initWithGameRecord:", v6);
    }
    v12 = v11;
    -[GKLeaderboardListViewController setDataSource:](v10, "setDataSource:", v11);

    -[GKLeaderboardListViewController title](v10, "title");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKLeaderboardListViewController navigationItem](v10, "navigationItem");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setTitle:", v13);

  }
  return v10;
}

- (id)title
{
  void *v2;
  void *v3;

  -[GKLeaderboardListViewController showingLeaderboardSets](self, "showingLeaderboardSets");
  GKGameCenterUIFrameworkBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  GKGetLocalizedStringFromTableInBundle();
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)setLeaderboardAssetNames:(id)a3
{
  void *v5;
  char isKindOfClass;
  void *v7;
  void *v8;
  char v9;
  id v10;

  v10 = a3;
  objc_storeStrong((id *)&self->_leaderboardAssetNames, a3);
  -[GKLeaderboardListViewController dataSource](self, "dataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  -[GKLeaderboardListViewController dataSource](self, "dataSource");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v7, "setLeaderboardAssetNames:", v10);
LABEL_5:

    goto LABEL_6;
  }
  objc_opt_class();
  v9 = objc_opt_isKindOfClass();

  if ((v9 & 1) != 0)
  {
    -[GKLeaderboardListViewController dataSource](self, "dataSource");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setAssetNames:", v10);
    goto LABEL_5;
  }
LABEL_6:

}

- (void)setLeaderboardSetAssetNames:(id)a3
{
  void *v5;
  char isKindOfClass;
  void *v7;
  id v8;

  v8 = a3;
  objc_storeStrong((id *)&self->_leaderboardSetAssetNames, a3);
  -[GKLeaderboardListViewController dataSource](self, "dataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    -[GKLeaderboardListViewController dataSource](self, "dataSource");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setLeaderboardSetAssetNames:", v8);

  }
}

- (void)donePressed:(id)a3
{
  id v3;

  -[UIViewController _gkExtensionViewController](self, "_gkExtensionViewController", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "finish");

}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  GKLeaderboardCollectionViewFlowLayout *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int64_t v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  objc_super v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  v20.receiver = self;
  v20.super_class = (Class)GKLeaderboardListViewController;
  -[GKLeaderboardListViewController viewDidLoad](&v20, sel_viewDidLoad);
  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKLeaderboardListViewController collectionView](self, "collectionView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBackgroundColor:", v3);

  -[GKLeaderboardListViewController setupVisualEffect](self, "setupVisualEffect");
  v5 = objc_alloc_init(GKLeaderboardCollectionViewFlowLayout);
  -[GKLeaderboardListViewController collectionView](self, "collectionView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setCollectionViewLayout:", v5);

  -[GKLeaderboardListViewController updateLayout](self, "updateLayout");
  -[GKLeaderboardListViewController collectionView](self, "collectionView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[GKLeaderboardListViewController collectionView](self, "collectionView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKLoadingViewController setViewsToHideWhileLoading:](self, "setViewsToHideWhileLoading:", v9);

  }
  -[GKLeaderboardListViewController dataSource](self, "dataSource");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKLeaderboardListViewController collectionView](self, "collectionView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setupCollectionView:", v11);

  -[GKLeaderboardListViewController dataSource](self, "dataSource");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setPresentationViewController:", self);

  -[GKLeaderboardListViewController navigationItem](self, "navigationItem");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "_setAutoScrollEdgeTransitionDistance:", 40.0);

  -[GKLeaderboardListViewController navigationItem](self, "navigationItem");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "_setManualScrollEdgeAppearanceEnabled:", 1);

  v15 = -[GKLeaderboardListViewController preferredLargeTitleDisplayMode](self, "preferredLargeTitleDisplayMode");
  -[GKLeaderboardListViewController navigationItem](self, "navigationItem");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setLargeTitleDisplayMode:", v15);

  -[GKLeaderboardListViewController configureCloseButton](self, "configureCloseButton");
  -[GKLeaderboardListViewController collectionView](self, "collectionView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "layer");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v19) = 0;
  objc_msgSend(v18, "setOpacity:", v19);

}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  -[GKLeaderboardListViewController collectionView](self, "collectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setDataSource:", 0);

  -[GKLeaderboardListViewController collectionView](self, "collectionView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDelegate:", 0);

  v5.receiver = self;
  v5.super_class = (Class)GKLeaderboardListViewController;
  -[GKLeaderboardListViewController dealloc](&v5, sel_dealloc);
}

- (void)viewIsAppearing:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)GKLeaderboardListViewController;
  -[GKLeaderboardListViewController viewIsAppearing:](&v4, sel_viewIsAppearing_, a3);
  -[GKLeaderboardListViewController updateLargeTitleInsets](self, "updateLargeTitleInsets");
}

- (void)viewWillAppear:(BOOL)a3
{
  __CFString *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)GKLeaderboardListViewController;
  -[GKLeaderboardListViewController viewWillAppear:](&v5, sel_viewWillAppear_, a3);
  -[GKLoadingViewController loadingState](self, "loadingState");
  v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (v4 == CFSTR("Initial"))
    -[GKLoadingViewController setLoadingState:](self, "setLoadingState:", CFSTR("LoadingState"));

}

- (void)viewWillDisappear:(BOOL)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)GKLeaderboardListViewController;
  -[GKLeaderboardListViewController viewWillDisappear:](&v3, sel_viewWillDisappear_, a3);
}

- (void)viewDidLayoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)GKLeaderboardListViewController;
  -[GKLeaderboardListViewController viewDidLayoutSubviews](&v3, sel_viewDidLayoutSubviews);
  -[GKLeaderboardListViewController updateLargeTitleInsets](self, "updateLargeTitleInsets");
}

- (void)setupVisualEffect
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = (id)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0DC3F50], "_gkGameLayerBackgroundVisualEffect");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setBackgroundEffects:", v3);

  objc_msgSend(v7, "_setGroupName:", CFSTR("gameLayerGroup"));
  -[GKLeaderboardListViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "insertSubview:atIndex:", v7, 0);

  objc_msgSend(v7, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v5 = (void *)MEMORY[0x1E0CB3718];
  -[GKLeaderboardListViewController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_gkInstallEdgeConstraintsForView:containedWithinParentView:", v7, v6);

}

- (void)viewDidAppear:(BOOL)a3
{
  _BOOL4 v4;
  __CFString *v5;
  __CFString *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GKLeaderboardListViewController;
  -[GKLeaderboardListViewController viewDidAppear:](&v7, sel_viewDidAppear_, a3);
  -[GKLeaderboardListViewController clearSelection](self, "clearSelection");
  -[GKLeaderboardListViewController setNeedsFocusUpdate](self, "setNeedsFocusUpdate");
  v4 = -[GKLeaderboardListViewController showingLeaderboardSets](self, "showingLeaderboardSets");
  v5 = CFSTR("leaderboardGroups");
  if (v4)
    v5 = CFSTR("leaderboardCollection");
  v6 = v5;
  +[GKMetricsBridge recordLeaderboardPageEventWithPageId:withReferrerData:](_TtC12GameCenterUI15GKMetricsBridge, "recordLeaderboardPageEventWithPageId:withReferrerData:", v6, -[GKLeaderboardListViewController isDeeplinked](self, "isDeeplinked"));

}

- (void)updateLayout
{
  void *v3;
  _BOOL8 v4;
  void *v5;
  void *v6;
  uint64_t v7;
  NSString *category;

  -[GKLeaderboardListViewController traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "preferredContentSizeCategory");
  category = (NSString *)objc_claimAutoreleasedReturnValue();

  if (UIContentSizeCategoryIsAccessibilityCategory(category))
  {
    v4 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3E88], "currentTraitCollection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "verticalSizeClass") == 1)
    {
      objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "userInterfaceIdiom");

      v4 = v7 != 1;
    }
    else
    {
      v4 = 0;
    }

  }
  -[GKLeaderboardListViewController setHorizontalLayout:](self, "setHorizontalLayout:", v4);

}

- (int64_t)preferredLargeTitleDisplayMode
{
  if (self->_preferredLargeTitleDisplayMode)
    return self->_preferredLargeTitleDisplayMode;
  else
    return 2;
}

- (void)updateLargeTitleInsets
{
  void *v3;
  void *v4;
  uint64_t v5;
  GameLayerPageGrid *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  GameLayerPageGrid *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  id v19;

  -[GKLeaderboardListViewController navigationController](self, "navigationController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "navigationBar");
  v19 = (id)objc_claimAutoreleasedReturnValue();

  -[GKLeaderboardListViewController navigationItem](self, "navigationItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "largeTitleDisplayMode");

  if (v5 != 2 && v19)
  {
    v6 = [GameLayerPageGrid alloc];
    -[GKLeaderboardListViewController view](self, "view");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "bounds");
    v9 = v8;
    v11 = v10;
    -[GKLeaderboardListViewController traitCollection](self, "traitCollection");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[GameLayerPageGrid initWithSize:traitCollection:](v6, "initWithSize:traitCollection:", v12, v9, v11);

    -[GameLayerPageGrid centeringInsets](v13, "centeringInsets");
    v15 = v14;
    -[GameLayerPageGrid centeringInsets](v13, "centeringInsets");
    v17 = v16;
    -[GKLeaderboardListViewController navigationItem](self, "navigationItem");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setLargeTitleInsets:", 0.0, v15, 0.0, v17);

    objc_msgSend(v19, "setNeedsLayout");
  }

}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)GKLeaderboardListViewController;
  v4 = a3;
  -[GKLeaderboardListViewController traitCollectionDidChange:](&v9, sel_traitCollectionDidChange_, v4);
  -[GKLeaderboardListViewController traitCollection](self, "traitCollection", v9.receiver, v9.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "preferredContentSizeCategory");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "preferredContentSizeCategory");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7 != v6)
  {
    -[GKLeaderboardListViewController updateLayout](self, "updateLayout");
    -[GKLeaderboardListViewController collectionView](self, "collectionView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "reloadData");

  }
}

- (BOOL)isLoading
{
  __CFString *v2;
  BOOL v3;

  -[GKLoadingViewController loadingState](self, "loadingState");
  v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v3 = 1;
  if (v2)
  {
    if (v2 != CFSTR("Initial") && v2 != CFSTR("LoadingState"))
      v3 = v2 == CFSTR("RefreshingState");
  }

  return v3;
}

- (void)didEnterLoadingState
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)GKLeaderboardListViewController;
  -[GKLoadingViewController didEnterLoadingState](&v3, sel_didEnterLoadingState);
  -[GKLeaderboardListViewController loadData](self, "loadData");
}

- (void)loadData
{
  void *v3;
  _QWORD v4[5];

  -[GKLeaderboardListViewController dataSource](self, "dataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __43__GKLeaderboardListViewController_loadData__block_invoke;
  v4[3] = &unk_1E59C5DA0;
  v4[4] = self;
  objc_msgSend(v3, "loadDataWithCompletionHandler:", v4);

}

void __43__GKLeaderboardListViewController_loadData__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v4;
  double v5;
  void *v6;
  void *v7;
  _QWORD v8[5];

  objc_msgSend(*(id *)(a1 + 32), "dataUpdated:withError:", a2, a3);
  objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
  objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("opacity"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setRemovedOnCompletion:", 0);
  objc_msgSend(v4, "setFromValue:", &unk_1E5A5E268);
  objc_msgSend(v4, "setToValue:", &unk_1E5A5E280);
  objc_msgSend(v4, "setDuration:", 0.33);
  LODWORD(v5) = 0;
  objc_msgSend(v4, "setRepeatCount:", v5);
  objc_msgSend(v4, "setAutoreverses:", 0);
  objc_msgSend(v4, "setFillMode:", *MEMORY[0x1E0CD2B58]);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __43__GKLeaderboardListViewController_loadData__block_invoke_55;
  v8[3] = &unk_1E59C4148;
  v8[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CD28B0], "setCompletionBlock:", v8);
  objc_msgSend(*(id *)(a1 + 32), "collectionView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "layer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addAnimation:forKey:", v4, CFSTR("opacity"));

  objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
}

void __43__GKLeaderboardListViewController_loadData__block_invoke_55(uint64_t a1)
{
  void *v1;
  double v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "collectionView");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "layer");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v2) = 1.0;
  objc_msgSend(v1, "setOpacity:", v2);

}

- (BOOL)hasData
{
  void *v2;
  BOOL v3;

  -[GKLeaderboardListViewController dataSource](self, "dataSource");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "itemCount") > 0;

  return v3;
}

- (void)dataUpdated:(BOOL)a3 withError:(id)a4
{
  _BOOL4 v4;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  v9 = a4;
  if (-[GKLeaderboardListViewController hasData](self, "hasData"))
  {
    -[GKLoadingViewController setLoadingState:](self, "setLoadingState:", CFSTR("LoadedState"));
    -[GKLeaderboardListViewController hideNoContentPlaceholder](self, "hideNoContentPlaceholder");
    if (!v4)
      goto LABEL_6;
    goto LABEL_5;
  }
  -[GKLoadingViewController setLoadingState:](self, "setLoadingState:", CFSTR("NoContentState"));
  -[GKLeaderboardListViewController showNoContentPlaceholderForError:](self, "showNoContentPlaceholderForError:", v9);
  if (v4)
  {
LABEL_5:
    -[GKLeaderboardListViewController collectionView](self, "collectionView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndex:", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "reloadSections:", v7);

    -[GKLeaderboardListViewController setNeedsFocusUpdate](self, "setNeedsFocusUpdate");
    -[GKLeaderboardListViewController navigationController](self, "navigationController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setNeedsFocusUpdate");

  }
LABEL_6:

}

- (void)showNoContentPlaceholderForError:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  GKNoContentView *v7;
  GKNoContentView *v8;
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
  _QWORD v22[3];

  v22[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (self->_collectionView)
  {
    -[GKLeaderboardListViewController collectionView](self, "collectionView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setHidden:", 1);

    -[GKLeaderboardListViewController noContentView](self, "noContentView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
    {
      v7 = [GKNoContentView alloc];
      -[UICollectionView bounds](self->_collectionView, "bounds");
      v8 = -[GKNoContentView initWithFrame:](v7, "initWithFrame:");
      -[GKLeaderboardListViewController setNoContentView:](self, "setNoContentView:", v8);

      -[GKLeaderboardListViewController noContentView](self, "noContentView");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

      -[GKLeaderboardListViewController collectionView](self, "collectionView");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "superview");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      -[GKLeaderboardListViewController noContentView](self, "noContentView");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[GKLeaderboardListViewController collectionView](self, "collectionView");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "insertSubview:aboveSubview:", v12, v13);

      v14 = (void *)MEMORY[0x1E0CB3718];
      -[GKLeaderboardListViewController noContentView](self, "noContentView");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[GKLeaderboardListViewController collectionView](self, "collectionView");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "_gkConstraintsForView:withinView:insets:", v15, v16, *MEMORY[0x1E0DC49E8], *(double *)(MEMORY[0x1E0DC49E8] + 8), *(double *)(MEMORY[0x1E0DC49E8] + 16), *(double *)(MEMORY[0x1E0DC49E8] + 24));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "addConstraints:", v17);

      -[GKLeaderboardListViewController collectionView](self, "collectionView");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v22[0] = v18;
      -[GKLeaderboardListViewController noContentView](self, "noContentView");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v22[1] = v19;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 2);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[GKLoadingViewController setViewsToHideWhileLoading:](self, "setViewsToHideWhileLoading:", v20);

    }
    -[GKLeaderboardListViewController setupNoContentView:withError:](self, "setupNoContentView:withError:", self->_noContentView, v4);
    -[GKLeaderboardListViewController noContentView](self, "noContentView");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setHidden:", 0);

  }
}

- (void)hideNoContentPlaceholder
{
  void *v3;
  id v4;

  -[GKLeaderboardListViewController noContentView](self, "noContentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setHidden:", 1);

  -[GKLeaderboardListViewController collectionView](self, "collectionView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHidden:", 0);

}

- (void)setupNoContentView:(id)a3 withError:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  GKGameCenterUIFrameworkBundle();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  GKGetLocalizedStringFromTableInBundle();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setTitle:", v6);

  if (a4)
  {
    GKGameCenterUIFrameworkBundle();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    GKGetLocalizedStringFromTableInBundle();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setMessage:", v8);

  }
  else
  {
    objc_msgSend(v9, "setMessage:", 0);
  }

}

- (void)setNeedsRefresh
{
  _QWORD block[5];

  if (!-[GKLeaderboardListViewController isLoading](self, "isLoading"))
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __50__GKLeaderboardListViewController_setNeedsRefresh__block_invoke;
    block[3] = &unk_1E59C4148;
    block[4] = self;
    dispatch_async(MEMORY[0x1E0C80D38], block);
  }
}

void __50__GKLeaderboardListViewController_setNeedsRefresh__block_invoke()
{
  dispatch_time_t v0;

  gk_dispatch_debounce();
  v0 = dispatch_time(0, 1000000000);
  dispatch_after(v0, MEMORY[0x1E0C80D38], &__block_literal_global_40);
}

uint64_t __50__GKLeaderboardListViewController_setNeedsRefresh__block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "isLoading");
  if ((result & 1) == 0)
    return objc_msgSend(*(id *)(a1 + 32), "setLoadingState:", CFSTR("RefreshingState"));
  return result;
}

uint64_t __50__GKLeaderboardListViewController_setNeedsRefresh__block_invoke_3()
{
  return GKAtomicCompareAndSwap32();
}

- (BOOL)_gkShouldRefreshContentsForDataType:(unsigned int)a3 userInfo:(id)a4
{
  return (a3 & 0xFFFFFFFD) == 9;
}

- (void)configureCloseButton
{
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0DC3518], "_gkXmarkedCloseButtonWithTarget:action:", self, sel_donePressed_);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithCustomView:", v5);
  -[GKLeaderboardListViewController navigationItem](self, "navigationItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setRightBarButtonItem:", v3);

}

- (void)setHorizontalLayout:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v3 = a3;
  -[GKLeaderboardListViewController collectionView](self, "collectionView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "collectionViewLayout");
  v10 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "setScrollDirection:", v3);
  -[GKLeaderboardListViewController collectionView](self, "collectionView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAlwaysBounceVertical:", v3 ^ 1);

  -[GKLeaderboardListViewController collectionView](self, "collectionView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAlwaysBounceHorizontal:", v3);

  -[GKLeaderboardListViewController collectionView](self, "collectionView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setShowsVerticalScrollIndicator:", v3 ^ 1);

  -[GKLeaderboardListViewController collectionView](self, "collectionView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setShowsHorizontalScrollIndicator:", v3);

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
  v9.super_class = (Class)GKLeaderboardListViewController;
  v7 = a4;
  -[GKLeaderboardListViewController viewWillTransitionToSize:withTransitionCoordinator:](&v9, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __86__GKLeaderboardListViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v8[3] = &unk_1E59C4FB0;
  v8[4] = self;
  objc_msgSend(v7, "animateAlongsideTransition:completion:", v8, &__block_literal_global_71);

}

void __86__GKLeaderboardListViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "updateLayout");
  objc_msgSend(*(id *)(a1 + 32), "collectionView");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "collectionViewLayout");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "invalidateLayout");

}

- (void)clearSelection
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  -[GKLeaderboardListViewController collectionView](self, "collectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "indexPathsForSelectedItems");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v9);
        -[GKLeaderboardListViewController collectionView](self, "collectionView", (_QWORD)v12);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "deselectItemAtIndexPath:animated:", v10, 1);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

}

- (GKGameLayerCollectionDataSource)dataSource
{
  return self->_dataSource;
}

- (void)setDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_dataSource, a3);
}

- (NSDictionary)leaderboardSetAssetNames
{
  return self->_leaderboardSetAssetNames;
}

- (NSDictionary)leaderboardAssetNames
{
  return self->_leaderboardAssetNames;
}

- (BOOL)isDeeplinked
{
  return self->_isDeeplinked;
}

- (void)setIsDeeplinked:(BOOL)a3
{
  self->_isDeeplinked = a3;
}

- (void)setPreferredLargeTitleDisplayMode:(int64_t)a3
{
  self->_preferredLargeTitleDisplayMode = a3;
}

- (UICollectionView)collectionView
{
  return self->_collectionView;
}

- (void)setCollectionView:(id)a3
{
  objc_storeStrong((id *)&self->_collectionView, a3);
}

- (BOOL)showingLeaderboardSets
{
  return self->_showingLeaderboardSets;
}

- (void)setShowingLeaderboardSets:(BOOL)a3
{
  self->_showingLeaderboardSets = a3;
}

- (GKNoContentView)noContentView
{
  return self->_noContentView;
}

- (void)setNoContentView:(id)a3
{
  objc_storeStrong((id *)&self->_noContentView, a3);
}

- (BOOL)canSegueToScores
{
  return self->_canSegueToScores;
}

- (void)setCanSegueToScores:(BOOL)a3
{
  self->_canSegueToScores = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_noContentView, 0);
  objc_storeStrong((id *)&self->_collectionView, 0);
  objc_storeStrong((id *)&self->_leaderboardAssetNames, 0);
  objc_storeStrong((id *)&self->_leaderboardSetAssetNames, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
}

@end
