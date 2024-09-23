@implementation GKDashboardLeaderboardScoreViewController

- (GKDashboardLeaderboardScoreViewController)initWithGameRecord:(id)a3 leaderboard:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  GKDashboardLeaderboardScoreViewController *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  GKDashboardLeaderboardScoreDataSource *v15;
  GKDashboardLeaderboardScoreDataSource *friendDataSource;
  id v17;
  void *v18;
  void *v19;
  GKDashboardLeaderboardScoreDataSource *v20;
  GKDashboardLeaderboardScoreDataSource *globalDataSource;
  GKCollectionMultiDataSource *v22;
  void *v23;
  objc_super v25;
  _QWORD v26[3];

  v26[2] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend((id)objc_opt_class(), "_gkPlatformNibName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v25.receiver = self;
  v25.super_class = (Class)GKDashboardLeaderboardScoreViewController;
  v10 = -[GKDashboardCollectionViewController initWithNibName:bundle:](&v25, sel_initWithNibName_bundle_, v8, v9);

  if (v10)
  {
    -[GKDashboardLeaderboardScoreViewController setLeaderboard:](v10, "setLeaderboard:", v7);
    objc_msgSend(v7, "title");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKDashboardLeaderboardScoreViewController setTitle:](v10, "setTitle:", v11);

    v10->_timeScope = sInitialTimeScope_0;
    v12 = objc_alloc(MEMORY[0x1E0D25308]);
    objc_msgSend(v7, "internal");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v12, "initWithInternalRepresentation:", v13);

    objc_msgSend(v14, "setPlayerScope:", 1);
    objc_msgSend(v14, "setTimeScope:", v10->_timeScope);
    v15 = -[GKDashboardLeaderboardScoreDataSource initWithGameRecord:leaderboard:]([GKDashboardLeaderboardScoreDataSource alloc], "initWithGameRecord:leaderboard:", v6, v14);
    friendDataSource = v10->_friendDataSource;
    v10->_friendDataSource = v15;

    -[GKDashboardLeaderboardScoreDataSource setTimeScopeTarget:](v10->_friendDataSource, "setTimeScopeTarget:", v10);
    -[GKDashboardLeaderboardScoreDataSource setTimeScopeAction:](v10->_friendDataSource, "setTimeScopeAction:", sel_timeScopePressed_);
    v17 = objc_alloc(MEMORY[0x1E0D25308]);
    objc_msgSend(v7, "internal");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (void *)objc_msgSend(v17, "initWithInternalRepresentation:", v18);

    objc_msgSend(v19, "setPlayerScope:", 0);
    objc_msgSend(v19, "setTimeScope:", v10->_timeScope);
    v20 = -[GKDashboardLeaderboardScoreDataSource initWithGameRecord:leaderboard:]([GKDashboardLeaderboardScoreDataSource alloc], "initWithGameRecord:leaderboard:", v6, v19);
    globalDataSource = v10->_globalDataSource;
    v10->_globalDataSource = v20;

    -[GKDashboardLeaderboardScoreDataSource setTimeScopeTarget:](v10->_globalDataSource, "setTimeScopeTarget:", v10);
    -[GKDashboardLeaderboardScoreDataSource setTimeScopeAction:](v10->_globalDataSource, "setTimeScopeAction:", sel_timeScopePressed_);
    v22 = objc_alloc_init(GKCollectionMultiDataSource);
    v26[0] = v10->_friendDataSource;
    v26[1] = v10->_globalDataSource;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 2);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKCollectionMultiDataSource setDataSources:](v22, "setDataSources:", v23);

    -[GKDashboardCollectionViewController setDataSource:](v10, "setDataSource:", v22);
    -[GKLoadingViewController setLoadingIndicatorDelay:](v10, "setLoadingIndicatorDelay:", 0.0);

  }
  return v10;
}

+ (int64_t)initialTimeScope
{
  return sInitialTimeScope_0;
}

+ (void)setInitialTimeScope:(int64_t)a3
{
  sInitialTimeScope_0 = a3;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  __objc2_class **v10;
  id v11;
  void *v12;
  double v13;
  void *v14;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)GKDashboardLeaderboardScoreViewController;
  -[GKDashboardCollectionViewController viewDidLoad](&v15, sel_viewDidLoad);
  -[UIViewController _gkExtensionViewController](self, "_gkExtensionViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKDashboardLeaderboardScoreViewController leaderboard](self, "leaderboard");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dashboardDidChangeToLeaderboardIdentifier:", v5);

  -[GKDashboardCollectionViewController collectionView](self, "collectionView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKDashboardLeaderboardScoreViewController view](self, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bounds");
  LODWORD(v5) = -[GKDashboardLeaderboardScoreViewController shouldUseTwoColumnLayoutForSize:](self, "shouldUseTwoColumnLayoutForSize:", v8, v9);

  v10 = off_1E59C28C0;
  if (!(_DWORD)v5)
    v10 = off_1E59C28D0;
  v11 = objc_alloc_init(*v10);
  objc_msgSend(v11, "setTopHeaderHeight:", 0.0);
  objc_msgSend(v6, "setCollectionViewLayout:", v11);
  -[GKDashboardCollectionViewController dataSource](self, "dataSource");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setupCollectionView:", v6);

  objc_msgSend(v11, "topHeaderHeight");
  if (v13 > 0.0)
  {
    +[NSObject _gkNib](GKDashboardLeaderboardScoreHeaderView, "_gkNib");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "registerNib:forSupplementaryViewOfKind:withReuseIdentifier:", v14, CFSTR("GKCollectionLayoutTopHeaderKind"), CFSTR("topHeader"));
    objc_msgSend(v6, "setDataSource:", self);

  }
}

- (void)dataUpdated:(BOOL)a3 withError:(id)a4
{
  int64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)GKDashboardLeaderboardScoreViewController;
  -[GKDashboardCollectionViewController dataUpdated:withError:](&v14, sel_dataUpdated_withError_, a3, a4);
  v5 = -[GKDashboardLeaderboardScoreDataSource itemCount](self->_friendDataSource, "itemCount");
  objc_msgSend(MEMORY[0x1E0D253C0], "reporter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *MEMORY[0x1E0D25018];
  objc_msgSend(v6, "reportEvent:type:", *MEMORY[0x1E0D25018], *MEMORY[0x1E0D24C08]);

  objc_msgSend(MEMORY[0x1E0D253C0], "reporter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = *MEMORY[0x1E0D24BC8];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "reportEvent:type:friendsPlayedThisGame:", v7, v9, v10);

  -[GKDashboardLeaderboardScoreViewController title](self, "title");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
    -[GKDashboardLeaderboardScoreDataSource leaderboard](self->_globalDataSource, "leaderboard");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "title");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKDashboardLeaderboardScoreViewController setTitle:](self, "setTitle:", v13);

  }
}

- (void)setupNoContentView:(id)a3 withError:(id)a4
{
  id v6;
  id v7;
  unint64_t timeScope;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t, void *);
  void *v19;
  id v20;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  v16 = MEMORY[0x1E0C809B0];
  v17 = 3221225472;
  v18 = __74__GKDashboardLeaderboardScoreViewController_setupNoContentView_withError___block_invoke;
  v19 = &unk_1E59C8480;
  objc_copyWeak(&v20, &location);
  objc_msgSend(v6, "setButtonAction:", &v16);
  timeScope = self->_timeScope;
  if (timeScope < 2)
  {
    GKGameCenterUIFrameworkBundle();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    GKGetLocalizedStringFromTableInBundle();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setTitle:", v12, v16, v17, v18, v19);

    GKGameCenterUIFrameworkBundle();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    GKGetLocalizedStringFromTableInBundle();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setMessage:", v14);

    objc_msgSend(MEMORY[0x1E0D25308], "localizedStringForTimeScope:", self->_timeScope);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setButtonTitle:", v15);

  }
  else if (timeScope == 2)
  {
    GKGameCenterUIFrameworkBundle();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    GKGetLocalizedStringFromTableInBundle();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setTitle:", v10, v16, v17, v18, v19);

    objc_msgSend(v6, "setMessage:", 0);
    objc_msgSend(v6, "setButtonTitle:", 0);
  }
  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);

}

void __74__GKDashboardLeaderboardScoreViewController_setupNoContentView_withError___block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  id v5;

  v5 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
    objc_msgSend(WeakRetained, "timeScopePressed:", v5);

}

- (BOOL)shouldUseTwoColumnLayoutForSize:(CGSize)a3
{
  double width;
  void *v5;
  uint64_t v6;
  void *v8;
  BOOL v9;

  width = a3.width;
  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice", a3.width, a3.height);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "userInterfaceIdiom");

  if (v6 == 1 && width > 400.0)
    return 1;
  -[GKDashboardLeaderboardScoreViewController traitCollection](self, "traitCollection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "verticalSizeClass") == 1;

  return v9;
}

- (void)updateColumnLayoutForSize:(CGSize)a3
{
  objc_class *v4;
  void *v5;
  void *v6;
  char isKindOfClass;
  void *v8;
  id v9;

  -[GKDashboardLeaderboardScoreViewController shouldUseTwoColumnLayoutForSize:](self, "shouldUseTwoColumnLayoutForSize:", a3.width, a3.height);
  v4 = (objc_class *)objc_opt_class();
  -[GKDashboardCollectionViewController collectionView](self, "collectionView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "collectionViewLayout");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    v9 = objc_alloc_init(v4);
    objc_msgSend(v9, "setTopHeaderHeight:", 0.0);
    -[GKDashboardCollectionViewController collectionView](self, "collectionView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setCollectionViewLayout:", v9);

  }
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  id v7;
  void *v8;
  uint64_t v9;
  _QWORD v10[8];
  objc_super v11;

  height = a3.height;
  width = a3.width;
  v11.receiver = self;
  v11.super_class = (Class)GKDashboardLeaderboardScoreViewController;
  v7 = a4;
  -[GKDashboardLeaderboardScoreViewController viewWillTransitionToSize:withTransitionCoordinator:](&v11, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  -[GKDashboardLeaderboardScoreViewController traitCollection](self, "traitCollection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "horizontalSizeClass");

  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __96__GKDashboardLeaderboardScoreViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v10[3] = &unk_1E59C8EF8;
  v10[4] = self;
  v10[5] = v9;
  *(double *)&v10[6] = width;
  *(double *)&v10[7] = height;
  objc_msgSend(v7, "animateAlongsideTransition:completion:", v10, 0);

}

void __96__GKDashboardLeaderboardScoreViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;

  v2 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "horizontalSizeClass");

  if (v2 == v4)
    objc_msgSend(*(id *)(a1 + 32), "updateColumnLayoutForSize:", *(double *)(a1 + 48), *(double *)(a1 + 56));
}

- (void)traitCollectionDidChange:(id)a3
{
  double v4;
  double v5;
  id v6;

  -[GKDashboardLeaderboardScoreViewController view](self, "view", a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "frame");
  -[GKDashboardLeaderboardScoreViewController updateColumnLayoutForSize:](self, "updateColumnLayoutForSize:", v4, v5);

}

- (void)timeScopePressed:(id)a3
{
  id v4;
  void *v5;
  void *v6;
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
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  double v26;
  double x;
  double v28;
  double v29;
  double v30;
  double width;
  double v32;
  double v33;
  double v34;
  CGFloat v35;
  void *v36;
  _QWORD v37[5];
  _QWORD v38[5];
  _QWORD v39[5];
  CGRect v40;
  CGRect v41;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", 0, 0, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0DC3448];
  GKGameCenterUIFrameworkBundle();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  GKGetLocalizedStringFromTableInBundle();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x1E0C809B0];
  v39[0] = MEMORY[0x1E0C809B0];
  v39[1] = 3221225472;
  v39[2] = __62__GKDashboardLeaderboardScoreViewController_timeScopePressed___block_invoke;
  v39[3] = &unk_1E59C8F20;
  v39[4] = self;
  objc_msgSend(v6, "_actionWithTitle:image:style:handler:shouldDismissHandler:", v8, 0, 0, 0, v39);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addAction:", v10);

  v11 = (void *)MEMORY[0x1E0DC3448];
  GKGameCenterUIFrameworkBundle();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  GKGetLocalizedStringFromTableInBundle();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v38[0] = v9;
  v38[1] = 3221225472;
  v38[2] = __62__GKDashboardLeaderboardScoreViewController_timeScopePressed___block_invoke_2;
  v38[3] = &unk_1E59C8F20;
  v38[4] = self;
  objc_msgSend(v11, "_actionWithTitle:image:style:handler:shouldDismissHandler:", v13, 0, 0, 0, v38);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addAction:", v14);

  v15 = (void *)MEMORY[0x1E0DC3448];
  GKGameCenterUIFrameworkBundle();
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  GKGetLocalizedStringFromTableInBundle();
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v37[0] = v9;
  v37[1] = 3221225472;
  v37[2] = __62__GKDashboardLeaderboardScoreViewController_timeScopePressed___block_invoke_3;
  v37[3] = &unk_1E59C8F20;
  v37[4] = self;
  objc_msgSend(v15, "_actionWithTitle:image:style:handler:shouldDismissHandler:", v17, 0, 0, 0, v37);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addAction:", v18);

  objc_msgSend(v5, "actions");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "objectAtIndexedSubscript:", self->_timeScope);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPreferredAction:", v20);

  objc_msgSend(v5, "preferredAction");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "_setChecked:", 1);

  objc_msgSend(v4, "superview");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "popoverPresentationController");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setSourceView:", v22);

  -[GKDashboardCollectionViewController dataSource](self, "dataSource");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v24, "itemCount");

  objc_msgSend(v4, "frame");
  x = v26;
  v29 = v28;
  width = v30;
  v33 = v32;
  if (v25 <= 0)
  {
    objc_msgSend(v4, "frame");
    v35 = v34 * 0.25;
    v40.origin.x = x;
    v40.origin.y = v29;
    v40.size.width = width;
    v40.size.height = v33;
    v41 = CGRectInset(v40, v35, 0.0);
    x = v41.origin.x;
    width = v41.size.width;
    v33 = v41.size.height * 0.5;
    v29 = v41.origin.y + 70.0;
  }
  objc_msgSend(v5, "popoverPresentationController");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "setSourceRect:", x, v29, width, v33);

  -[GKDashboardLeaderboardScoreViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v5, 1, 0);
}

uint64_t __62__GKDashboardLeaderboardScoreViewController_timeScopePressed___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setTimeScope:", 0);
  return 1;
}

uint64_t __62__GKDashboardLeaderboardScoreViewController_timeScopePressed___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setTimeScope:", 1);
  return 1;
}

uint64_t __62__GKDashboardLeaderboardScoreViewController_timeScopePressed___block_invoke_3(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setTimeScope:", 2);
  return 1;
}

- (void)setTimeScope:(int64_t)a3
{
  void *v5;

  if (self->_timeScope != a3)
  {
    self->_timeScope = a3;
    -[GKDashboardLeaderboardScoreHeaderView setTimeScope:](self->_headerView, "setTimeScope:");
    -[GKDashboardLeaderboardScoreDataSource setTimeScope:](self->_friendDataSource, "setTimeScope:", a3);
    -[GKDashboardLeaderboardScoreDataSource setTimeScope:](self->_globalDataSource, "setTimeScope:", a3);
    objc_msgSend((id)objc_opt_class(), "setInitialTimeScope:", a3);
    -[UIViewController _gkExtensionViewController](self, "_gkExtensionViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "dashboardDidChangeToLeaderboardTimeScope:", a3);

    -[GKDashboardCollectionViewController setNeedsRefresh](self, "setNeedsRefresh");
  }
}

- (void)donePressed:(id)a3
{
  -[UIViewController _gkRemoveViewController:animated:](self, "_gkRemoveViewController:animated:", self, 1);
}

- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v14;
  objc_super v15;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  if (objc_msgSend(v9, "isEqualToString:", CFSTR("GKCollectionLayoutTopHeaderKind")))
  {
    objc_msgSend(v10, "dequeueReusableSupplementaryViewOfKind:withReuseIdentifier:forIndexPath:", v9, CFSTR("topHeader"), v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "setTimeScope:", self->_timeScope);
    -[GKLeaderboard title](self->_leaderboard, "title");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setTitle:", v12);

    objc_msgSend(v11, "setTimeScopeTarget:", self);
    objc_msgSend(v11, "setTimeScopeAction:", sel_timeScopePressed_);
    -[GKDashboardLeaderboardScoreViewController setHeaderView:](self, "setHeaderView:", v11);
    return v11;
  }
  else
  {
    v15.receiver = self;
    v15.super_class = (Class)GKDashboardLeaderboardScoreViewController;
    -[GKDashboardCollectionViewController collectionView:viewForSupplementaryElementOfKind:atIndexPath:](&v15, sel_collectionView_viewForSupplementaryElementOfKind_atIndexPath_, v10, v9, v8);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    return v14;
  }
}

- (GKDashboardLeaderboardScoreHeaderView)headerView
{
  return self->_headerView;
}

- (void)setHeaderView:(id)a3
{
  objc_storeStrong((id *)&self->_headerView, a3);
}

- (GKLeaderboard)leaderboard
{
  return self->_leaderboard;
}

- (void)setLeaderboard:(id)a3
{
  objc_storeStrong((id *)&self->_leaderboard, a3);
}

- (GKDashboardLeaderboardScoreDataSource)friendDataSource
{
  return self->_friendDataSource;
}

- (void)setFriendDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_friendDataSource, a3);
}

- (GKDashboardLeaderboardScoreDataSource)globalDataSource
{
  return self->_globalDataSource;
}

- (void)setGlobalDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_globalDataSource, a3);
}

- (int64_t)timeScope
{
  return self->_timeScope;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_globalDataSource, 0);
  objc_storeStrong((id *)&self->_friendDataSource, 0);
  objc_storeStrong((id *)&self->_leaderboard, 0);
  objc_storeStrong((id *)&self->_headerView, 0);
}

@end
