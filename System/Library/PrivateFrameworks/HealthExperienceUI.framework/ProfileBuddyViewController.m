@implementation ProfileBuddyViewController

- (ProfileBuddyViewController)init
{
  void *v3;
  ProfileBuddyViewController *v4;

  objc_msgSend(MEMORY[0x1E0D2F2B0], "buddyFlowUserInfoWithDemographicsInformation:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[ProfileBuddyViewController initWithBuddyFlowUserInfo:](self, "initWithBuddyFlowUserInfo:", v3);

  return v4;
}

- (ProfileBuddyViewController)initWithBuddyFlowUserInfo:(id)a3
{
  id v5;
  ProfileBuddyViewController *v6;
  ProfileBuddyViewController *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ProfileBuddyViewController;
  v6 = -[ProfileBuddyViewController initWithStyle:](&v9, sel_initWithStyle_, 1);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_userInfo, a3);
    v7->_hasSetUpHeaderAndFooterViews = 0;
  }

  return v7;
}

- (WDBuddyFlowUserInfo)buddyFlowUserInfo
{
  return self->_userInfo;
}

- (ProfileBuddyViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  void *v5;
  uint64_t v6;
  void *v7;

  v5 = (void *)MEMORY[0x1E0C99DA0];
  v6 = *MEMORY[0x1E0C99778];
  NSStringFromSelector(a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "raise:format:", v6, CFSTR("The -%@ method is not available on %@"), v7, objc_opt_class());

  return 0;
}

- (unint64_t)supportedInterfaceOrientations
{
  return 2;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)ProfileBuddyViewController;
  -[ProfileBuddyViewController dealloc](&v4, sel_dealloc);
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  _QWORD block[5];
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)ProfileBuddyViewController;
  -[ProfileBuddyViewController traitCollectionDidChange:](&v10, sel_traitCollectionDidChange_, v4);
  if (v4)
  {
    -[ProfileBuddyViewController traitCollection](self, "traitCollection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "preferredContentSizeCategory");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "preferredContentSizeCategory");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "isEqualToString:", v7);

    if ((v8 & 1) == 0)
    {
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __55__ProfileBuddyViewController_traitCollectionDidChange___block_invoke;
      block[3] = &unk_1E5575398;
      block[4] = self;
      dispatch_async(MEMORY[0x1E0C80D38], block);
    }
  }

}

uint64_t __55__ProfileBuddyViewController_traitCollectionDidChange___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateForCurrentSizeCategory");
}

- (void)_setupObservers
{
  id v3;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__localeDidChange_, *MEMORY[0x1E0C99720], 0);

}

- (NSArray)dataEntryItems
{
  void *dataEntryItems;
  NSArray *v4;
  NSArray *v5;
  NSArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  dataEntryItems = self->_dataEntryItems;
  if (!dataEntryItems)
  {
    dataEntryItems = self->_userInfo;
    if (dataEntryItems)
    {
      objc_msgSend(dataEntryItems, "defaultDataEntryItems");
      v4 = (NSArray *)objc_claimAutoreleasedReturnValue();
      v5 = self->_dataEntryItems;
      self->_dataEntryItems = v4;

      v14 = 0u;
      v15 = 0u;
      v12 = 0u;
      v13 = 0u;
      v6 = self->_dataEntryItems;
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v7)
      {
        v8 = v7;
        v9 = *(_QWORD *)v13;
        do
        {
          for (i = 0; i != v8; ++i)
          {
            if (*(_QWORD *)v13 != v9)
              objc_enumerationMutation(v6);
            objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * i), "setToolbarDelegate:", self, (_QWORD)v12);
          }
          v8 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
        }
        while (v8);
      }

      dataEntryItems = self->_dataEntryItems;
    }
  }
  return (NSArray *)dataEntryItems;
}

- (void)continueButtonTapped:(id)a3
{
  void *v4;
  id v5;

  -[ProfileBuddyViewController view](self, "view", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "endEditing:", 1);

  -[ProfileBuddyViewController delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "profileBuddyViewControllerDidTapContinue:", self);

}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ProfileBuddyViewController;
  -[HKTableViewController viewDidLoad](&v6, sel_viewDidLoad);
  objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ProfileBuddyViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBackgroundColor:", v3);

  -[ProfileBuddyViewController tableView](self, "tableView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setKeyboardDismissMode:", 1);

  -[ProfileBuddyViewController _updateForCurrentSizeCategory](self, "_updateForCurrentSizeCategory");
}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)ProfileBuddyViewController;
  -[ProfileBuddyViewController viewWillAppear:](&v10, sel_viewWillAppear_, a3);
  -[ProfileBuddyViewController setUpHeaderAndFooterViewsIfNeeded](self, "setUpHeaderAndFooterViewsIfNeeded");
  -[ProfileBuddyViewController navigationController](self, "navigationController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setNavigationBarHidden:animated:", 0, 0);

  -[ProfileBuddyViewController navigationController](self, "navigationController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "navigationBar");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_setHidesShadow:", 1);

  -[ProfileBuddyViewController navigationController](self, "navigationController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "navigationBar");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setBarTintColor:", v9);

}

- (void)setUpHeaderAndFooterViewsIfNeeded
{
  HKTitledContactBuddyHeaderView *v3;
  HKTitledContactBuddyHeaderView *headerView;
  WDBuddyFlowContinueFooterView *v5;
  WDBuddyFlowContinueFooterView *footerView;
  HKTitledContactBuddyHeaderView *v7;
  void *v8;
  WDBuddyFlowContinueFooterView *v9;
  void *v10;

  if (!self->_hasSetUpHeaderAndFooterViews)
  {
    -[ProfileBuddyViewController _createTableHeaderView](self, "_createTableHeaderView");
    v3 = (HKTitledContactBuddyHeaderView *)objc_claimAutoreleasedReturnValue();
    headerView = self->_headerView;
    self->_headerView = v3;

    -[ProfileBuddyViewController _createTableFooterView](self, "_createTableFooterView");
    v5 = (WDBuddyFlowContinueFooterView *)objc_claimAutoreleasedReturnValue();
    footerView = self->_footerView;
    self->_footerView = v5;

    v7 = self->_headerView;
    -[ProfileBuddyViewController tableView](self, "tableView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setTableHeaderView:", v7);

    v9 = self->_footerView;
    -[ProfileBuddyViewController tableView](self, "tableView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setTableFooterView:", v9);

    self->_hasSetUpHeaderAndFooterViews = 1;
  }
}

- (void)_updateForCurrentSizeCategory
{
  double v3;
  double v4;
  double v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  objc_msgSend(MEMORY[0x1E0DC1350], "hk_preferredFontForTextStyle:symbolicTraits:", *MEMORY[0x1E0DC4A88], 2);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "_scaledValueForValue:", 60.0);
  v4 = v3;
  if (HKUIApplicationIsUsingAccessibilityContentSizeCategory())
  {
    v5 = *MEMORY[0x1E0DC53D8];
    -[ProfileBuddyViewController tableView](self, "tableView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setRowHeight:", v5);

    -[ProfileBuddyViewController tableView](self, "tableView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setEstimatedRowHeight:", v4);
  }
  else
  {
    -[ProfileBuddyViewController tableView](self, "tableView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setRowHeight:", v4);
  }

  -[ProfileBuddyViewController _configureHeaderView:](self, "_configureHeaderView:", self->_headerView);
  -[ProfileBuddyViewController tableView](self, "tableView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "reloadData");

}

- (id)_createTableHeaderView
{
  void *v3;
  double Height;
  void *v5;
  double v6;
  double v7;
  void *v8;
  double Width;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  CGRect v16;
  CGRect v17;

  -[ProfileBuddyViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "frame");
  Height = CGRectGetHeight(v16);
  -[ProfileBuddyViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "frame");
  v7 = (Height + v6) * 0.33 + -64.0;

  if (v7 < 150.0)
    v7 = 150.0;
  -[ProfileBuddyViewController tableView](self, "tableView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "frame");
  Width = CGRectGetWidth(v17);

  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D2F8C0]), "initWithTopInset:parentViewController:", self, v7);
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("HEALTH_DETAILS do not loc"), &stru_1E55A2388, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setTitleText:", v12);

  objc_msgSend(v10, "widthAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "constraintEqualToConstant:", Width);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setActive:", 1);

  -[ProfileBuddyViewController _configureHeaderView:](self, "_configureHeaderView:", v10);
  return v10;
}

- (void)_configureHeaderView:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  id v13;

  v4 = (void *)MEMORY[0x1E0CB34D0];
  v13 = a3;
  objc_msgSend(v4, "mainBundle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("HEALTH_DETAILS_DESCRIPTION do not loc"), &stru_1E55A2388, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setBodyText:", v6);

  objc_msgSend(v13, "setBodyTextAlignment:", 0);
  -[ProfileBuddyViewController tableView](self, "tableView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "frame");
  objc_msgSend(v13, "systemLayoutSizeFittingSize:", v8, *(double *)(MEMORY[0x1E0DC4FF8] + 8));
  v10 = v9;
  v12 = v11;

  objc_msgSend(v13, "setFrame:", 0.0, 0.0, v10, v12);
  objc_msgSend(v13, "setBodyTextAlignment:", 1);

}

- (id)_createTableFooterView
{
  void *v3;
  double Width;
  void *v5;
  void *v6;
  CGRect v8;

  -[ProfileBuddyViewController tableView](self, "tableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "frame");
  Width = CGRectGetWidth(v8);

  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D2F2A8]), "initWithTarget:action:bottomInset:width:isLastScreen:", self, sel_continueButtonTapped_, 1, 40.0, Width);
  objc_msgSend(v5, "continueButton");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addTarget:action:forEvents:", self, sel_continueButtonTapped_, 64);

  return v5;
}

- (void)_localeDidChange:(id)a3
{
  -[NSArray makeObjectsPerformSelector:withObject:](self->_dataEntryItems, "makeObjectsPerformSelector:withObject:", sel_localeDidChange_, a3);
}

- (void)dataEntryItemDonePressed:(id)a3
{
  id v3;

  -[ProfileBuddyViewController view](self, "view", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "endEditing:", 0);

}

- (void)dataEntryItemPrevPressed:(id)a3
{
  uint64_t v4;

  v4 = -[NSArray indexOfObject:](self->_dataEntryItems, "indexOfObject:", a3);
  if (v4 <= 0)
    v4 = -[NSArray count](self->_dataEntryItems, "count");
  -[ProfileBuddyViewController focusItemAtIndex:](self, "focusItemAtIndex:", v4 - 1);
}

- (void)dataEntryItemNextPressed:(id)a3
{
  NSUInteger v4;
  NSUInteger v5;

  v4 = -[NSArray indexOfObject:](self->_dataEntryItems, "indexOfObject:", a3);
  if (v4 + 1 < -[NSArray count](self->_dataEntryItems, "count"))
    v5 = v4 + 1;
  else
    v5 = 0;
  -[ProfileBuddyViewController focusItemAtIndex:](self, "focusItemAtIndex:", v5);
}

- (void)focusItemAtIndex:(int64_t)a3
{
  void *v5;
  void *v6;
  id v7;

  -[NSArray objectAtIndexedSubscript:](self->_dataEntryItems, "objectAtIndexedSubscript:");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "beginEditing");
  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", a3, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ProfileBuddyViewController tableView](self, "tableView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "scrollToRowAtIndexPath:atScrollPosition:animated:", v5, 3, 1);

}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  void *v4;
  int64_t v5;

  -[ProfileBuddyViewController dataEntryItems](self, "dataEntryItems", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  return v5;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  v5 = a4;
  -[ProfileBuddyViewController dataEntryItems](self, "dataEntryItems");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "row");

  objc_msgSend(v6, "objectAtIndex:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "cell");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  id v9;

  v6 = a4;
  objc_msgSend(a3, "deselectRowAtIndexPath:animated:", v6, 1);
  -[ProfileBuddyViewController dataEntryItems](self, "dataEntryItems");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "row");

  objc_msgSend(v7, "objectAtIndex:", v8);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "beginEditing");
}

- (ProfileBuddyViewControllerDelegate)delegate
{
  return (ProfileBuddyViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void)setDataEntryItems:(id)a3
{
  objc_storeStrong((id *)&self->_dataEntryItems, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataEntryItems, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_footerView, 0);
  objc_storeStrong((id *)&self->_headerView, 0);
}

@end
