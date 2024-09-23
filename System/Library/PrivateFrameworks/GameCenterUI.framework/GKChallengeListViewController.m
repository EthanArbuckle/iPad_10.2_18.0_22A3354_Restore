@implementation GKChallengeListViewController

- (GKChallengeListViewController)initWithGameRecord:(id)a3
{
  id v4;
  GKChallengeListViewController *v5;
  GKChallengeDataSource *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)GKChallengeListViewController;
  v5 = -[GKDashboardCollectionViewController initWithNibName:bundle:](&v8, sel_initWithNibName_bundle_, 0, 0);
  if (v5)
  {
    v6 = -[GKDashboardChallengeDataSource initWithGameRecord:]([GKChallengeDataSource alloc], "initWithGameRecord:", v4);
    -[GKDashboardCollectionViewController setDataSource:](v5, "setDataSource:", v6);

  }
  return v5;
}

- (void)showNoContentPlaceholderForError:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  GKNoContentView *v8;
  void *v9;
  GKNoContentView *v10;
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
  _QWORD v23[3];

  v23[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[GKDashboardCollectionViewController collectionView](self, "collectionView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[GKDashboardCollectionViewController collectionView](self, "collectionView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setHidden:", 1);

    -[GKDashboardCollectionViewController noContentView](self, "noContentView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v7)
    {
      v8 = [GKNoContentView alloc];
      -[GKDashboardCollectionViewController collectionView](self, "collectionView");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "bounds");
      v10 = -[GKNoContentView initWithFrame:](v8, "initWithFrame:");
      -[GKDashboardCollectionViewController setNoContentView:](self, "setNoContentView:", v10);

      -[GKDashboardCollectionViewController noContentView](self, "noContentView");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

      -[GKDashboardCollectionViewController collectionView](self, "collectionView");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "superview");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      -[GKDashboardCollectionViewController noContentView](self, "noContentView");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[GKDashboardCollectionViewController collectionView](self, "collectionView");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "insertSubview:aboveSubview:", v14, v15);

      v16 = (void *)MEMORY[0x1E0CB3718];
      -[GKDashboardCollectionViewController noContentView](self, "noContentView");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "_gkInstallEdgeConstraintsForView:containedWithinParentView:", v17, v13);

      -[GKDashboardCollectionViewController collectionView](self, "collectionView");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v23[0] = v18;
      -[GKDashboardCollectionViewController noContentView](self, "noContentView");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v23[1] = v19;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 2);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[GKLoadingViewController setViewsToHideWhileLoading:](self, "setViewsToHideWhileLoading:", v20);

    }
    -[GKDashboardCollectionViewController noContentView](self, "noContentView");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKChallengeListViewController setupNoContentView:withError:](self, "setupNoContentView:withError:", v21, v4);

    -[GKDashboardCollectionViewController noContentView](self, "noContentView");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setHidden:", 0);

  }
}

- (void)setupNoContentView:(id)a3 withError:(id)a4
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  GKGameCenterUIFrameworkBundle();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  GKGetLocalizedStringFromTableInBundle();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTitle:", v6);

  GKGameCenterUIFrameworkBundle();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  GKGetLocalizedStringFromTableInBundle();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setMessage:", v8);

  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBackgroundColor:", v9);

}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int64_t v9;
  void *v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)GKChallengeListViewController;
  -[GKDashboardCollectionViewController viewDidLoad](&v11, sel_viewDidLoad);
  GKGameCenterUIFrameworkBundle();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  GKGetLocalizedStringFromTableInBundle();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKChallengeListViewController setTitle:](self, "setTitle:", v4);

  -[GKChallengeListViewController navigationItem](self, "navigationItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_setAutoScrollEdgeTransitionDistance:", 40.0);

  -[GKChallengeListViewController navigationItem](self, "navigationItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_setManualScrollEdgeAppearanceEnabled:", 1);

  -[GKChallengeListViewController title](self, "title");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKChallengeListViewController navigationItem](self, "navigationItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTitle:", v7);

  v9 = -[GKChallengeListViewController preferredLargeTitleDisplayMode](self, "preferredLargeTitleDisplayMode");
  -[GKChallengeListViewController navigationItem](self, "navigationItem");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setLargeTitleDisplayMode:", v9);

  -[GKChallengeListViewController configureCloseButton](self, "configureCloseButton");
  -[GKChallengeListViewController configureCollectionView](self, "configureCollectionView");
}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)GKChallengeListViewController;
  -[GKDashboardCollectionViewController viewWillAppear:](&v4, sel_viewWillAppear_, a3);
  -[GKDashboardCollectionViewController setNeedsRefresh](self, "setNeedsRefresh");
}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)GKChallengeListViewController;
  -[GKDashboardCollectionViewController viewDidAppear:](&v4, sel_viewDidAppear_, a3);
  self->_startTime = CFAbsoluteTimeGetCurrent();
  +[GKMetricsBridge recordChallengePageEventWithReferrerData:](_TtC12GameCenterUI15GKMetricsBridge, "recordChallengePageEventWithReferrerData:", -[GKChallengeListViewController isDeeplinked](self, "isDeeplinked"));
}

- (void)viewWillDisappear:(BOOL)a3
{
  void *v4;
  uint64_t v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GKChallengeListViewController;
  -[GKChallengeListViewController viewWillDisappear:](&v6, sel_viewWillDisappear_, a3);
  objc_msgSend(MEMORY[0x1E0D253C0], "reporter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *MEMORY[0x1E0D24D00];
  -[GKChallengeListViewController startTime](self, "startTime");
  objc_msgSend(v4, "reportScreenTimeEventForType:withStartTimestamp:", v5);

}

- (void)configureCloseButton
{
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0DC3518], "_gkXmarkedCloseButtonWithTarget:action:", self, sel_donePressed_);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithCustomView:", v5);
  -[GKChallengeListViewController navigationItem](self, "navigationItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setRightBarButtonItem:", v3);

}

- (void)viewWillLayoutSubviews
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)GKChallengeListViewController;
  -[GKChallengeListViewController viewWillLayoutSubviews](&v18, sel_viewWillLayoutSubviews);
  -[GKChallengeListViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "readableContentGuide");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "layoutFrame");
  v6 = v5;
  -[GKDashboardCollectionViewController collectionView](self, "collectionView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "frame");
  v9 = v6 - v8;

  -[GKDashboardCollectionViewController collectionView](self, "collectionView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "contentInset");
  v12 = v11;
  v13 = fmax(v9, 16.0);
  -[GKDashboardCollectionViewController collectionView](self, "collectionView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "contentInset");
  v16 = v15;
  -[GKDashboardCollectionViewController collectionView](self, "collectionView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setContentInset:", v12, v13, v16, v13);

}

- (void)viewDidLayoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)GKChallengeListViewController;
  -[GKChallengeListViewController viewDidLayoutSubviews](&v3, sel_viewDidLayoutSubviews);
  -[GKChallengeListViewController updateLargeTitleInsets](self, "updateLargeTitleInsets");
}

- (void)configureCollectionView
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  -[GKDashboardCollectionViewController collectionView](self, "collectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[GKDashboardCollectionViewController collectionView](self, "collectionView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setShowsVerticalScrollIndicator:", 0);

  -[GKDashboardCollectionViewController collectionView](self, "collectionView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_gkRemoveAllConstraints");

  v6 = (void *)MEMORY[0x1E0CB3718];
  -[GKDashboardCollectionViewController collectionView](self, "collectionView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKChallengeListViewController view](self, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_gkInstallEdgeConstraintsForView:containedWithinParentView:", v7, v8);

  -[GKDashboardCollectionViewController collectionView](self, "collectionView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "collectionViewLayout");
  v10 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "setSectionInsetRelativeWithContentInset:", 1);
}

- (void)donePressed:(id)a3
{
  id v3;

  -[UIViewController _gkExtensionViewController](self, "_gkExtensionViewController", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "finish");

}

- (void)setShouldShowPlayForChallenge:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  id v8;
  NSObject *v9;

  v3 = a3;
  self->_shouldShowPlayForChallenge = a3;
  -[GKDashboardCollectionViewController dataSource](self, "dataSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setShouldShowPlay:", v3);

  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0D252C0], "currentGame");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "internal");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "supportsChallenges");

    if (v7)
    {
      if (!*MEMORY[0x1E0D25460])
        v8 = (id)GKOSLoggers();
      v9 = *MEMORY[0x1E0D25448];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D25448], OS_LOG_TYPE_ERROR))
        -[GKChallengeListViewController setShouldShowPlayForChallenge:].cold.1(v9);
    }
  }
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
  v13.super_class = (Class)GKChallengeListViewController;
  -[GKDashboardCollectionViewController traitCollectionDidChange:](&v13, sel_traitCollectionDidChange_, v4);
  -[GKChallengeListViewController traitCollection](self, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "horizontalSizeClass");
  if (v6 == objc_msgSend(v4, "horizontalSizeClass"))
  {
    -[GKChallengeListViewController traitCollection](self, "traitCollection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "layoutDirection");
    if (v8 == objc_msgSend(v4, "layoutDirection"))
    {
      -[GKChallengeListViewController traitCollection](self, "traitCollection");
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
  block[2] = __58__GKChallengeListViewController_traitCollectionDidChange___block_invoke;
  block[3] = &unk_1E59C4148;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
LABEL_8:

}

void __58__GKChallengeListViewController_traitCollectionDidChange___block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "collectionView");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "reloadData");

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
  void *v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  id v13;

  -[GKChallengeListViewController navigationController](self, "navigationController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "navigationBar");
  v13 = (id)objc_claimAutoreleasedReturnValue();

  -[GKChallengeListViewController navigationItem](self, "navigationItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "largeTitleDisplayMode");

  if (v5 != 2 && v13)
  {
    -[GKDashboardCollectionViewController collectionView](self, "collectionView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "contentInset");
    v8 = v7;
    -[GKDashboardCollectionViewController collectionView](self, "collectionView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "frame");
    v11 = v8 + v10;

    -[GKChallengeListViewController navigationItem](self, "navigationItem");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setLargeTitleInsets:", 0.0, v11, 0.0, v11);

    objc_msgSend(v13, "setNeedsLayout");
  }

}

- (BOOL)shouldShowPlayForChallenge
{
  return self->_shouldShowPlayForChallenge;
}

- (double)startTime
{
  return self->_startTime;
}

- (void)setStartTime:(double)a3
{
  self->_startTime = a3;
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

- (void)setShouldShowPlayForChallenge:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1AB361000, log, OS_LOG_TYPE_ERROR, "Applications support Game Center Challenges should register a listener for player:wantsToPlayChallenge: defined in the GKChallengeListener protocol.", v1, 2u);
}

@end
