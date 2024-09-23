@implementation GKDashboardChallengePlayerPickerViewController

- (GKDashboardChallengePlayerPickerViewController)initWithChallenge:(id)a3 initiallySelectedPlayers:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  GKDashboardChallengePlayerPickerViewController *v10;
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
  v15.super_class = (Class)GKDashboardChallengePlayerPickerViewController;
  v10 = -[GKDashboardCollectionViewController initWithNibName:bundle:](&v15, sel_initWithNibName_bundle_, v8, v9);

  if (v10)
  {
    -[GKDashboardChallengePlayerPickerViewController setChallenge:](v10, "setChallenge:", v6);
    -[GKDashboardChallengePlayerPickerViewController setInitiallySelectedPlayers:](v10, "setInitiallySelectedPlayers:", v7);
    v11 = -[GKDashboardChallengePlayerPickerDataSource initWithChallenge:]([GKDashboardChallengePlayerPickerDataSource alloc], "initWithChallenge:", v6);
    -[GKDashboardCollectionViewController setDataSource:](v10, "setDataSource:", v11);
    GKGameCenterUIFrameworkBundle();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    GKGetLocalizedStringFromTableInBundle();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKDashboardChallengePlayerPickerViewController setTitle:](v10, "setTitle:", v13);

    -[GKLoadingViewController setLoadingIndicatorDelay:](v10, "setLoadingIndicatorDelay:", 0.0);
  }

  return v10;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  id v5;
  NSLayoutConstraint *scrollingHeaderTopConstraint;
  double left;
  double bottom;
  double right;
  double v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)GKDashboardChallengePlayerPickerViewController;
  -[GKDashboardCollectionViewController viewDidLoad](&v17, sel_viewDidLoad);
  -[GKChallenge detailGoalText](self->_challenge, "detailGoalText");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setText:](self->_descriptionLabel, "setText:", v3);

  -[GKDashboardCollectionViewController collectionView](self, "collectionView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKDashboardCollectionViewController setToHorizontalLayout:](self, "setToHorizontalLayout:", 0);
  -[GKDashboardCollectionViewController setAutoWidthUsesTwoColumnsWhenSpace:](self, "setAutoWidthUsesTwoColumnsWhenSpace:", 1);
  objc_msgSend(v4, "collectionViewLayout");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v5, "setCentersItemsInExcessSpace:", 1);
    objc_msgSend(v5, "setFocusScaleFactor:", 1.0);
  }
  objc_msgSend(v4, "setDelegate:", self);
  objc_msgSend(v4, "setClipsToBounds:", 0);
  scrollingHeaderTopConstraint = self->_scrollingHeaderTopConstraint;
  if (scrollingHeaderTopConstraint)
  {
    -[NSLayoutConstraint constant](scrollingHeaderTopConstraint, "constant");
    -[GKDashboardChallengePlayerPickerViewController setScrollingHeaderTopConstraintConstant:](self, "setScrollingHeaderTopConstraintConstant:");
    objc_msgSend(v5, "sectionInset");
    -[GKDashboardChallengePlayerPickerViewController setInitialInsets:](self, "setInitialInsets:");
    -[GKDashboardChallengePlayerPickerViewController setShouldApplyInitialOffset:](self, "setShouldApplyInitialOffset:", 1);
    -[UIView layoutIfNeeded](self->_scrollingHeader, "layoutIfNeeded");
    left = self->_initialInsets.left;
    bottom = self->_initialInsets.bottom;
    right = self->_initialInsets.right;
    -[UIView bounds](self->_scrollingHeader, "bounds");
    objc_msgSend(v5, "setSectionInset:", self->_initialInsets.top + v10, left, bottom, right);
  }
  if (!self->_sendButton)
  {
    v11 = objc_alloc(MEMORY[0x1E0DC34F0]);
    GKGameCenterUIFrameworkBundle();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    GKGetLocalizedStringFromTableInBundle();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v11, "initWithTitle:style:target:action:", v13, 2, self, sel_send_);
    -[GKDashboardChallengePlayerPickerViewController navigationItem](self, "navigationItem");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setRightBarButtonItem:", v14);

  }
  -[NSLayoutConstraint constant](self->_customizeMessageBottomConstraint, "constant");
  self->_initialCustomizeMessageBottomConstraintConstant = v16;
  -[GKDashboardChallengePlayerPickerViewController adjustCustomizeMessageConstraint](self, "adjustCustomizeMessageConstraint");
  -[GKDashboardChallengePlayerPickerViewController _updateButtonEnableState](self, "_updateButtonEnableState");

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
  v14.super_class = (Class)GKDashboardChallengePlayerPickerViewController;
  -[GKDashboardCollectionViewController viewWillAppear:](&v14, sel_viewWillAppear_, a3);
  -[GKDashboardChallengePlayerPickerViewController navigationController](self, "navigationController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "viewControllers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6 == 1)
  {
    -[GKDashboardChallengePlayerPickerViewController navigationItem](self, "navigationItem");
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
      -[GKDashboardChallengePlayerPickerViewController navigationItem](self, "navigationItem");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setLeftBarButtonItem:", v12);

    }
  }
  -[GKDashboardChallengePlayerPickerViewController applyInitialContentOffset](self, "applyInitialContentOffset");
}

- (void)viewDidAppear:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  -[GKDashboardChallengePlayerPickerViewController applyInitialContentOffset](self, "applyInitialContentOffset");
  -[GKDashboardChallengePlayerPickerViewController setShouldIgnoreClearSelection:](self, "setShouldIgnoreClearSelection:", 1);
  v5.receiver = self;
  v5.super_class = (Class)GKDashboardChallengePlayerPickerViewController;
  -[GKDashboardCollectionViewController viewDidAppear:](&v5, sel_viewDidAppear_, v3);
  -[GKDashboardChallengePlayerPickerViewController setShouldIgnoreClearSelection:](self, "setShouldIgnoreClearSelection:", 0);
  -[GKDashboardChallengePlayerPickerViewController setShouldApplyInitialOffset:](self, "setShouldApplyInitialOffset:", 0);
}

- (void)adjustCustomizeMessageConstraint
{
  BOOL v2;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  double v8;
  id v9;

  if (self->_customizeMessageBottomConstraint)
    v2 = *MEMORY[0x1E0D253F8] == 0;
  else
    v2 = 0;
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "userInterfaceIdiom");

    if (v5 == 1)
    {
      -[GKDashboardChallengePlayerPickerViewController presentingViewController](self, "presentingViewController");
      v9 = (id)objc_claimAutoreleasedReturnValue();
      if (v9)
      {
        -[NSLayoutConstraint setConstant:](self->_customizeMessageBottomConstraint, "setConstant:", self->_initialCustomizeMessageBottomConstraintConstant);
      }
      else
      {
        -[GKDashboardChallengePlayerPickerViewController tabBarController](self, "tabBarController");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "tabBar");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "bounds");
        -[NSLayoutConstraint setConstant:](self->_customizeMessageBottomConstraint, "setConstant:", v8 + self->_initialCustomizeMessageBottomConstraintConstant);

      }
    }
  }
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
  v9.super_class = (Class)GKDashboardChallengePlayerPickerViewController;
  v7 = a4;
  -[GKDashboardChallengePlayerPickerViewController viewWillTransitionToSize:withTransitionCoordinator:](&v9, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __101__GKDashboardChallengePlayerPickerViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v8[3] = &unk_1E59C4FB0;
  v8[4] = self;
  objc_msgSend(v7, "animateAlongsideTransition:completion:", v8, &__block_literal_global_4);

}

uint64_t __101__GKDashboardChallengePlayerPickerViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "adjustCustomizeMessageConstraint");
}

- (void)applyInitialContentOffset
{
  void *v3;
  void *v4;
  uint64_t v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  id v11;

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
      v11 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "contentOffset");
      v7 = v6;
      -[UIView bounds](self->_scrollingHeader, "bounds");
      v9 = v8;
      objc_msgSend(v11, "contentInset");
      objc_msgSend(v11, "setContentOffset:animated:", 0, v7, v9 - v10);

    }
  }
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
    v4.super_class = (Class)GKDashboardChallengePlayerPickerViewController;
    -[GKDashboardCollectionViewController loadData](&v4, sel_loadData);
  }
  else
  {
    challenge = self->_challenge;
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __58__GKDashboardChallengePlayerPickerViewController_loadData__block_invoke;
    v5[3] = &unk_1E59C4148;
    v5[4] = self;
    -[GKChallenge loadDetailsWithCompletionHandler:](challenge, "loadDetailsWithCompletionHandler:", v5);
  }
}

id __58__GKDashboardChallengePlayerPickerViewController_loadData__block_invoke(uint64_t a1)
{
  objc_super v2;

  v2.receiver = *(id *)(a1 + 32);
  v2.super_class = (Class)GKDashboardChallengePlayerPickerViewController;
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
  v23.super_class = (Class)GKDashboardChallengePlayerPickerViewController;
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

    -[GKDashboardChallengePlayerPickerViewController setInitiallySelectedPlayers:](self, "setInitiallySelectedPlayers:", 0);
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
    -[GKDashboardChallengePlayerPickerViewController selectPlayersAtIndexPaths:](self, "selectPlayersAtIndexPaths:", v9);
  -[GKDashboardChallengePlayerPickerViewController _updateButtonEnableState](self, "_updateButtonEnableState");

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
          -[GKDashboardChallengePlayerPickerViewController collectionView:didSelectItemAtIndexPath:](self, "collectionView:didSelectItemAtIndexPath:", v6, v13);
          v10 = 1;
        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v9);

    if ((v10 & 1) != 0)
      -[GKDashboardChallengePlayerPickerViewController setNeedsFocusUpdate](self, "setNeedsFocusUpdate");
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
    v13.super_class = (Class)GKDashboardChallengePlayerPickerViewController;
    -[GKDashboardCollectionViewController setupNoContentView:withError:](&v13, sel_setupNoContentView_withError_, v6, v7);
  }

}

- (id)preferredFocusEnvironments
{
  UIButton *v3;
  UIButton *v4;
  void *v5;
  objc_super v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  if (-[UIButton isEnabled](self->_sendButton, "isEnabled")
    && (v3 = self->_sendButton) != 0)
  {
    v4 = v3;
    v8[0] = v3;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    return v5;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)GKDashboardChallengePlayerPickerViewController;
    -[GKDashboardCollectionViewController preferredFocusEnvironments](&v7, sel_preferredFocusEnvironments);
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

- (void)clearSelection
{
  void *v3;
  objc_super v4;

  if (!self->_shouldIgnoreClearSelection)
  {
    v4.receiver = self;
    v4.super_class = (Class)GKDashboardChallengePlayerPickerViewController;
    -[GKDashboardCollectionViewController clearSelection](&v4, sel_clearSelection);
    -[GKDashboardCollectionViewController dataSource](self, "dataSource");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "clearSelection");

    -[GKDashboardChallengePlayerPickerViewController _updateButtonEnableState](self, "_updateButtonEnableState");
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
    -[GKDashboardChallengePlayerPickerViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v5, 1, 0);

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
  id from;

  v4 = a3;
  -[GKDashboardCollectionViewController dataSource](self, "dataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = [GKChallengeComposeController alloc];
  challenge = self->_challenge;
  message = self->_message;
  objc_msgSend(v5, "selectedPlayers");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[GKChallengeComposeController initWithChallenge:defaultMessage:players:](v6, "initWithChallenge:defaultMessage:players:", challenge, message, v9);

  from = 0;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __61__GKDashboardChallengePlayerPickerViewController_addMessage___block_invoke;
  v11[3] = &unk_1E59C5018;
  v11[4] = self;
  objc_copyWeak(&v12, &from);
  -[GKSimpleComposeController setDoneHandler:](v10, "setDoneHandler:", v11);
  -[UIViewController _gkShowViewController:](self, "_gkShowViewController:", v10);
  objc_destroyWeak(&v12);
  objc_destroyWeak(&from);

}

void __61__GKDashboardChallengePlayerPickerViewController_addMessage___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  _QWORD v8[5];
  id v9;

  v5 = a2;
  v6 = a3;
  if (!v6)
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __61__GKDashboardChallengePlayerPickerViewController_addMessage___block_invoke_2;
    v8[3] = &unk_1E59C4708;
    v8[4] = *(_QWORD *)(a1 + 32);
    v9 = v5;
    dispatch_async(MEMORY[0x1E0C80D38], v8);

  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    objc_msgSend(*(id *)(a1 + 32), "_gkRemoveViewController:animated:", WeakRetained, 1);
    objc_msgSend(WeakRetained, "setDoneHandler:", 0);
  }

}

uint64_t __61__GKDashboardChallengePlayerPickerViewController_addMessage___block_invoke_2(uint64_t a1)
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
    -[GKDashboardChallengePlayerPickerViewController setMessage:](self, "setMessage:", v6);

    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __72__GKDashboardChallengePlayerPickerViewController_textFieldShouldReturn___block_invoke;
    block[3] = &unk_1E59C4148;
    block[4] = self;
    dispatch_async(MEMORY[0x1E0C80D38], block);
  }
  return messageField != a3;
}

uint64_t __72__GKDashboardChallengePlayerPickerViewController_textFieldShouldReturn___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "send:", *(_QWORD *)(a1 + 32));
}

- (void)_updateButtonEnableState
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  -[GKDashboardCollectionViewController dataSource](self, "dataSource");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "selectedPlayers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  -[UIButton setEnabled:](self->_sendButton, "setEnabled:", v4 != 0);
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0D253B0], "shared");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIBarButtonItem setEnabled:](self->_customizeMessageButton, "setEnabled:", objc_msgSend(v5, "shouldAllowCustomCommunication"));

  }
  else
  {
    -[UIBarButtonItem setEnabled:](self->_customizeMessageButton, "setEnabled:", 0);
  }
  if (!self->_sendButton)
  {
    -[GKDashboardChallengePlayerPickerViewController navigationItem](self, "navigationItem");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "rightBarButtonItem");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setEnabled:", v4 != 0);

  }
}

- (void)searchBar:(id)a3 textDidChange:(id)a4
{
  -[GKDashboardChallengePlayerPickerViewController setSearchText:](self, "setSearchText:", a4);
}

- (void)searchBarCancelButtonClicked:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "setText:", 0);
  objc_msgSend(v4, "resignFirstResponder");

  -[GKDashboardChallengePlayerPickerViewController setSearchText:](self, "setSearchText:", 0);
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
  -[GKDashboardChallengePlayerPickerViewController dataUpdated:withError:](self, "dataUpdated:withError:", 1, 0);
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
  v5.super_class = (Class)GKDashboardChallengePlayerPickerViewController;
  -[GKDashboardCollectionViewController collectionView:didSelectItemAtIndexPath:](&v5, sel_collectionView_didSelectItemAtIndexPath_, a3, a4);
  -[GKDashboardChallengePlayerPickerViewController _updateButtonEnableState](self, "_updateButtonEnableState");
}

- (void)collectionView:(id)a3 didDeselectItemAtIndexPath:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)GKDashboardChallengePlayerPickerViewController;
  -[GKDashboardCollectionViewController collectionView:didDeselectItemAtIndexPath:](&v5, sel_collectionView_didDeselectItemAtIndexPath_, a3, a4);
  -[GKDashboardChallengePlayerPickerViewController _updateButtonEnableState](self, "_updateButtonEnableState");
}

- (void)scrollViewDidScroll:(id)a3
{
  double scrollingHeaderTopConstraintConstant;
  double v5;

  if (self->_scrollingHeaderTopConstraint)
  {
    scrollingHeaderTopConstraintConstant = self->_scrollingHeaderTopConstraintConstant;
    objc_msgSend(a3, "contentOffset");
    -[NSLayoutConstraint setConstant:](self->_scrollingHeaderTopConstraint, "setConstant:", scrollingHeaderTopConstraintConstant - v5);
    -[GKDashboardChallengePlayerPickerViewController applyInitialContentOffset](self, "applyInitialContentOffset");
  }
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

- (UIBarButtonItem)customizeMessageButton
{
  return self->_customizeMessageButton;
}

- (void)setCustomizeMessageButton:(id)a3
{
  self->_customizeMessageButton = (UIBarButtonItem *)a3;
}

- (UITextField)messageField
{
  return self->_messageField;
}

- (void)setMessageField:(id)a3
{
  self->_messageField = (UITextField *)a3;
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

- (double)scrollingHeaderTopConstraintConstant
{
  return self->_scrollingHeaderTopConstraintConstant;
}

- (void)setScrollingHeaderTopConstraintConstant:(double)a3
{
  self->_scrollingHeaderTopConstraintConstant = a3;
}

- (UIEdgeInsets)initialInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_initialInsets.top;
  left = self->_initialInsets.left;
  bottom = self->_initialInsets.bottom;
  right = self->_initialInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setInitialInsets:(UIEdgeInsets)a3
{
  self->_initialInsets = a3;
}

- (BOOL)shouldApplyInitialOffset
{
  return self->_shouldApplyInitialOffset;
}

- (void)setShouldApplyInitialOffset:(BOOL)a3
{
  self->_shouldApplyInitialOffset = a3;
}

- (NSLayoutConstraint)customizeMessageBottomConstraint
{
  return self->_customizeMessageBottomConstraint;
}

- (void)setCustomizeMessageBottomConstraint:(id)a3
{
  self->_customizeMessageBottomConstraint = (NSLayoutConstraint *)a3;
}

- (double)initialCustomizeMessageBottomConstraintConstant
{
  return self->_initialCustomizeMessageBottomConstraintConstant;
}

- (void)setInitialCustomizeMessageBottomConstraintConstant:(double)a3
{
  self->_initialCustomizeMessageBottomConstraintConstant = a3;
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
  objc_storeStrong((id *)&self->_initiallySelectedPlayers, 0);
  objc_storeStrong((id *)&self->_challenge, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_message, 0);
}

@end
