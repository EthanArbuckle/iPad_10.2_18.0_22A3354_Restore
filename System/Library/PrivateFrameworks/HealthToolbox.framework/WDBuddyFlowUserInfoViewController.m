@implementation WDBuddyFlowUserInfoViewController

- (WDBuddyFlowUserInfoViewController)initWithProfile:(id)a3 isLastScreen:(BOOL)a4
{
  id v7;
  WDBuddyFlowUserInfoViewController *v8;
  WDBuddyFlowUserInfoViewController *v9;
  id *p_profile;
  uint64_t v11;
  HKHealthStore *healthStore;
  uint64_t v13;
  WDUserDefaults *userDefaults;
  NSString *baseAutomationIdentifier;
  objc_super v17;

  v7 = a3;
  v17.receiver = self;
  v17.super_class = (Class)WDBuddyFlowUserInfoViewController;
  v8 = -[WDBuddyFlowUserInfoViewController initWithStyle:](&v17, sel_initWithStyle_, 1);
  v9 = v8;
  if (v8)
  {
    p_profile = (id *)&v8->_profile;
    objc_storeStrong((id *)&v8->_profile, a3);
    v9->_isLastScreen = a4;
    objc_msgSend(*p_profile, "healthStore");
    v11 = objc_claimAutoreleasedReturnValue();
    healthStore = v9->_healthStore;
    v9->_healthStore = (HKHealthStore *)v11;

    objc_msgSend(*p_profile, "userDefaults");
    v13 = objc_claimAutoreleasedReturnValue();
    userDefaults = v9->_userDefaults;
    v9->_userDefaults = (WDUserDefaults *)v13;

    v9->_hasSetUpHeaderAndFooterViews = 0;
    baseAutomationIdentifier = v9->_baseAutomationIdentifier;
    v9->_baseAutomationIdentifier = (NSString *)CFSTR("UIA.Health.BuddyOnboarding.UserInfoScreen");

    -[WDBuddyFlowUserInfoViewController _setupObservers](v9, "_setupObservers");
  }

  return v9;
}

- (WDBuddyFlowUserInfoViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  void *v5;
  uint64_t v6;
  void *v7;

  v5 = (void *)MEMORY[0x24BDBCE88];
  v6 = *MEMORY[0x24BDBCAB8];
  NSStringFromSelector(a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "raise:format:", v6, CFSTR("The -%@ method is not available on %@"), v7, objc_opt_class());

  return 0;
}

- (WDBuddyFlowUserInfoViewController)initWithStyle:(int64_t)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)WDBuddyFlowUserInfoViewController;
  return -[WDBuddyFlowUserInfoViewController initWithStyle:](&v4, sel_initWithStyle_, a3);
}

- (WDBuddyFlowUserInfoViewController)initWithCoder:(id)a3
{
  return -[WDBuddyFlowUserInfoViewController initWithStyle:](self, "initWithStyle:", 0);
}

- (unint64_t)supportedInterfaceOrientations
{
  return 2;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)WDBuddyFlowUserInfoViewController;
  -[WDBuddyFlowUserInfoViewController dealloc](&v4, sel_dealloc);
}

- (void)_setupObservers
{
  id v3;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__localeDidChange_, *MEMORY[0x24BDBCA70], 0);

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

  v17 = *MEMORY[0x24BDAC8D0];
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
  id v4;
  void *v5;
  WDBuddyFlowContinueFooterView *footerView;
  id v7;
  _QWORD v8[5];
  id v9;
  id location;

  v4 = a3;
  -[WDBuddyFlowUserInfoViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "endEditing:", 1);

  footerView = self->_footerView;
  v7 = objc_initWeak(&location, footerView);
  -[WDBuddyFlowContinueFooterView setWaitingState](footerView, "setWaitingState");

  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __58__WDBuddyFlowUserInfoViewController_continueButtonTapped___block_invoke;
  v8[3] = &unk_24D38E440;
  v8[4] = self;
  objc_copyWeak(&v9, &location);
  -[WDBuddyFlowUserInfoViewController _saveDataWithCompletion:](self, "_saveDataWithCompletion:", v8);
  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);

}

void __58__WDBuddyFlowUserInfoViewController_continueButtonTapped___block_invoke(uint64_t a1)
{
  _QWORD v1[5];
  id v2;

  v1[0] = MEMORY[0x24BDAC760];
  v1[1] = 3221225472;
  v1[2] = __58__WDBuddyFlowUserInfoViewController_continueButtonTapped___block_invoke_2;
  v1[3] = &unk_24D38E440;
  v1[4] = *(_QWORD *)(a1 + 32);
  objc_copyWeak(&v2, (id *)(a1 + 40));
  dispatch_async(MEMORY[0x24BDAC9B8], v1);
  objc_destroyWeak(&v2);
}

void __58__WDBuddyFlowUserInfoViewController_continueButtonTapped___block_invoke_2(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __58__WDBuddyFlowUserInfoViewController_continueButtonTapped___block_invoke_3;
  v3[3] = &unk_24D38CFD8;
  objc_copyWeak(&v4, (id *)(a1 + 40));
  objc_msgSend(v2, "didTapContinueButtonWithCompletion:", v3);

  objc_destroyWeak(&v4);
}

void __58__WDBuddyFlowUserInfoViewController_continueButtonTapped___block_invoke_3(uint64_t a1)
{
  _QWORD block[4];
  id v2;

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __58__WDBuddyFlowUserInfoViewController_continueButtonTapped___block_invoke_4;
  block[3] = &unk_24D38CFD8;
  objc_copyWeak(&v2, (id *)(a1 + 32));
  dispatch_async(MEMORY[0x24BDAC9B8], block);
  objc_destroyWeak(&v2);
}

void __58__WDBuddyFlowUserInfoViewController_continueButtonTapped___block_invoke_4(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "resetWaitingState");

}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  WDBuddyFlowUserInfo *v5;
  WDBuddyFlowUserInfo *userInfo;
  void *v7;
  NSString *baseAutomationIdentifier;
  void *v9;
  void *v10;
  id v11;
  objc_super v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  v12.receiver = self;
  v12.super_class = (Class)WDBuddyFlowUserInfoViewController;
  -[HKTableViewController viewDidLoad](&v12, sel_viewDidLoad);
  objc_msgSend(MEMORY[0x24BDF6950], "systemBackgroundColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDBuddyFlowUserInfoViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBackgroundColor:", v3);

  +[WDBuddyFlowUserInfo buddyFlowUserInfoWithDemographicsInformation:](WDBuddyFlowUserInfo, "buddyFlowUserInfoWithDemographicsInformation:", 0);
  v5 = (WDBuddyFlowUserInfo *)objc_claimAutoreleasedReturnValue();
  userInfo = self->_userInfo;
  self->_userInfo = v5;

  -[WDBuddyFlowUserInfoViewController tableView](self, "tableView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setKeyboardDismissMode:", 1);

  -[WDBuddyFlowUserInfoViewController _loadData](self, "_loadData");
  -[WDBuddyFlowUserInfoViewController _updateForCurrentSizeCategory](self, "_updateForCurrentSizeCategory");
  baseAutomationIdentifier = self->_baseAutomationIdentifier;
  -[WDBuddyFlowUserInfoViewController view](self, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setAccessibilityIdentifier:", baseAutomationIdentifier);

  v13[0] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v13, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (id)-[WDBuddyFlowUserInfoViewController registerForTraitChanges:withTarget:action:](self, "registerForTraitChanges:withTarget:action:", v10, self, sel__updateForCurrentSizeCategory);

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
  v10.super_class = (Class)WDBuddyFlowUserInfoViewController;
  -[WDBuddyFlowUserInfoViewController viewWillAppear:](&v10, sel_viewWillAppear_, a3);
  -[WDBuddyFlowUserInfoViewController setUpHeaderAndFooterViewsIfNeeded](self, "setUpHeaderAndFooterViewsIfNeeded");
  -[WDBuddyFlowUserInfoViewController navigationController](self, "navigationController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setNavigationBarHidden:animated:", 0, 0);

  -[WDBuddyFlowUserInfoViewController navigationController](self, "navigationController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "navigationBar");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_setHidesShadow:", 1);

  -[WDBuddyFlowUserInfoViewController navigationController](self, "navigationController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "navigationBar");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6950], "systemBackgroundColor");
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
    -[WDBuddyFlowUserInfoViewController _createTableHeaderView](self, "_createTableHeaderView");
    v3 = (HKTitledContactBuddyHeaderView *)objc_claimAutoreleasedReturnValue();
    headerView = self->_headerView;
    self->_headerView = v3;

    -[WDBuddyFlowUserInfoViewController _createTableFooterView](self, "_createTableFooterView");
    v5 = (WDBuddyFlowContinueFooterView *)objc_claimAutoreleasedReturnValue();
    footerView = self->_footerView;
    self->_footerView = v5;

    v7 = self->_headerView;
    -[WDBuddyFlowUserInfoViewController tableView](self, "tableView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setTableHeaderView:", v7);

    v9 = self->_footerView;
    -[WDBuddyFlowUserInfoViewController tableView](self, "tableView");
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

  objc_msgSend(MEMORY[0x24BDF6A70], "hk_preferredFontForTextStyle:symbolicTraits:", *MEMORY[0x24BDF77B0], 2);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "_scaledValueForValue:", 60.0);
  v4 = v3;
  if (HKUIApplicationIsUsingAccessibilityContentSizeCategory())
  {
    v5 = *MEMORY[0x24BDF7DE0];
    -[WDBuddyFlowUserInfoViewController tableView](self, "tableView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setRowHeight:", v5);

    -[WDBuddyFlowUserInfoViewController tableView](self, "tableView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setEstimatedRowHeight:", v4);
  }
  else
  {
    -[WDBuddyFlowUserInfoViewController tableView](self, "tableView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setRowHeight:", v4);
  }

  -[WDBuddyFlowUserInfoViewController _configureHeaderView:](self, "_configureHeaderView:", self->_headerView);
  -[WDBuddyFlowUserInfoViewController tableView](self, "tableView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "reloadData");

}

- (void)_loadData
{
  HKHealthStore *healthStore;
  _QWORD v3[5];

  healthStore = self->_healthStore;
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __46__WDBuddyFlowUserInfoViewController__loadData__block_invoke;
  v3[3] = &unk_24D38E468;
  v3[4] = self;
  -[HKHealthStore hk_fetchExistingDemographicInformationWithCompletion:](healthStore, "hk_fetchExistingDemographicInformationWithCompletion:", v3);
}

void __46__WDBuddyFlowUserInfoViewController__loadData__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[5];
  id v6;

  v3 = a2;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __46__WDBuddyFlowUserInfoViewController__loadData__block_invoke_2;
  v5[3] = &unk_24D38CEC0;
  v5[4] = *(_QWORD *)(a1 + 32);
  v6 = v3;
  v4 = v3;
  dispatch_async(MEMORY[0x24BDAC9B8], v5);

}

void __46__WDBuddyFlowUserInfoViewController__loadData__block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;

  +[WDBuddyFlowUserInfo buddyFlowUserInfoWithDemographicsInformation:](WDBuddyFlowUserInfo, "buddyFlowUserInfoWithDemographicsInformation:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 1104);
  *(_QWORD *)(v3 + 1104) = v2;

  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(v5 + 1096);
  *(_QWORD *)(v5 + 1096) = 0;

  objc_msgSend(*(id *)(a1 + 32), "tableView");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "reloadData");

}

- (void)_saveDataWithCompletion:(id)a3
{
  id v4;
  WDBuddyFlowUserInfo *userInfo;
  HKHealthStore *healthStore;
  id v7;
  _QWORD v8[5];
  id v9;
  _QWORD v10[5];

  v4 = a3;
  userInfo = self->_userInfo;
  healthStore = self->_healthStore;
  v9 = v4;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __61__WDBuddyFlowUserInfoViewController__saveDataWithCompletion___block_invoke;
  v10[3] = &unk_24D38D000;
  v10[4] = self;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __61__WDBuddyFlowUserInfoViewController__saveDataWithCompletion___block_invoke_2;
  v8[3] = &unk_24D38D460;
  v8[4] = self;
  v7 = v4;
  -[WDBuddyFlowUserInfo saveChangesToHealthStore:andSaveNameCompletion:andOverallCompletion:](userInfo, "saveChangesToHealthStore:andSaveNameCompletion:andOverallCompletion:", healthStore, v10, v8);

}

void __61__WDBuddyFlowUserInfoViewController__saveDataWithCompletion___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "didSaveFirstLastNameFor:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1040));

}

uint64_t __61__WDBuddyFlowUserInfoViewController__saveDataWithCompletion___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  _HKInitializeLogging();
  v2 = *MEMORY[0x24BDD3070];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3070], OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v5 = 138543362;
    v6 = v3;
    _os_log_impl(&dword_215814000, v2, OS_LOG_TYPE_DEFAULT, "[%{public}@] Completed saving changes to health store.", (uint8_t *)&v5, 0xCu);
  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
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

  -[WDBuddyFlowUserInfoViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "frame");
  Height = CGRectGetHeight(v16);
  -[WDBuddyFlowUserInfoViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "frame");
  v7 = (Height + v6) * 0.33 + -64.0;

  if (v7 < 150.0)
    v7 = 150.0;
  -[WDBuddyFlowUserInfoViewController tableView](self, "tableView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "frame");
  Width = CGRectGetWidth(v17);

  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE4A8D8]), "initWithTopInset:parentViewController:", self, v7);
  WDBundle();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("HEALTH_DETAILS"), &stru_24D38E7C8, CFSTR("WellnessDashboard-Localizable"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setTitleText:", v12);

  objc_msgSend(v10, "widthAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "constraintEqualToConstant:", Width);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setActive:", 1);

  -[WDBuddyFlowUserInfoViewController _configureHeaderView:](self, "_configureHeaderView:", v10);
  return v10;
}

- (void)_configureHeaderView:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  id v12;

  v12 = a3;
  WDBundle();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("HEALTH_DETAILS_DESCRIPTION"), &stru_24D38E7C8, CFSTR("WellnessDashboard-Localizable"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setBodyText:", v5);

  objc_msgSend(v12, "setBodyTextAlignment:", 0);
  -[WDBuddyFlowUserInfoViewController tableView](self, "tableView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "frame");
  objc_msgSend(v12, "systemLayoutSizeFittingSize:", v7, *(double *)(MEMORY[0x24BDF7B88] + 8));
  v9 = v8;
  v11 = v10;

  objc_msgSend(v12, "setFrame:", 0.0, 0.0, v9, v11);
  objc_msgSend(v12, "setBodyTextAlignment:", 1);

}

- (id)_createTableFooterView
{
  void *v3;
  double Width;
  WDBuddyFlowContinueFooterView *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[3];
  CGRect v12;

  v11[2] = *MEMORY[0x24BDAC8D0];
  -[WDBuddyFlowUserInfoViewController tableView](self, "tableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "frame");
  Width = CGRectGetWidth(v12);

  v5 = -[WDBuddyFlowContinueFooterView initWithTarget:action:bottomInset:width:isLastScreen:]([WDBuddyFlowContinueFooterView alloc], "initWithTarget:action:bottomInset:width:isLastScreen:", self, sel_continueButtonTapped_, self->_isLastScreen, 40.0, Width);
  -[WDBuddyFlowContinueFooterView continueButton](v5, "continueButton");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addTarget:action:forControlEvents:", self, sel_continueButtonTapped_, 64);

  -[WDBuddyFlowContinueFooterView continueButton](v5, "continueButton");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = self->_baseAutomationIdentifier;
  v11[1] = CFSTR("ContinueButton");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v11, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  HKUIJoinStringsForAutomationIdentifier();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAccessibilityIdentifier:", v9);

  return v5;
}

- (void)_localeDidChange:(id)a3
{
  -[NSArray makeObjectsPerformSelector:withObject:](self->_dataEntryItems, "makeObjectsPerformSelector:withObject:", sel_localeDidChange_, a3);
}

- (void)dataEntryItemDonePressed:(id)a3
{
  id v3;

  -[WDBuddyFlowUserInfoViewController view](self, "view", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "endEditing:", 0);

}

- (void)dataEntryItemPrevPressed:(id)a3
{
  uint64_t v4;

  v4 = -[NSArray indexOfObject:](self->_dataEntryItems, "indexOfObject:", a3);
  if (v4 <= 0)
    v4 = -[NSArray count](self->_dataEntryItems, "count");
  -[WDBuddyFlowUserInfoViewController focusItemAtIndex:](self, "focusItemAtIndex:", v4 - 1);
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
  -[WDBuddyFlowUserInfoViewController focusItemAtIndex:](self, "focusItemAtIndex:", v5);
}

- (void)focusItemAtIndex:(int64_t)a3
{
  void *v5;
  void *v6;
  id v7;

  -[NSArray objectAtIndexedSubscript:](self->_dataEntryItems, "objectAtIndexedSubscript:");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "beginEditing");
  objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForRow:inSection:", a3, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDBuddyFlowUserInfoViewController tableView](self, "tableView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "scrollToRowAtIndexPath:atScrollPosition:animated:", v5, 3, 1);

}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  void *v4;
  int64_t v5;

  -[WDBuddyFlowUserInfoViewController dataEntryItems](self, "dataEntryItems", a3, a4);
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
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v15[3];

  v15[2] = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  -[WDBuddyFlowUserInfoViewController dataEntryItems](self, "dataEntryItems");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "row");

  objc_msgSend(v6, "objectAtIndex:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "cell");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = self->_baseAutomationIdentifier;
  objc_msgSend(v8, "accessibilityIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15[1] = v10;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v15, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  HKUIJoinStringsForAutomationIdentifier();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setAccessibilityIdentifier:", v12);

  objc_msgSend(v8, "cell");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  id v9;

  v6 = a4;
  objc_msgSend(a3, "deselectRowAtIndexPath:animated:", v6, 1);
  -[WDBuddyFlowUserInfoViewController dataEntryItems](self, "dataEntryItems");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "row");

  objc_msgSend(v7, "objectAtIndex:", v8);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "beginEditing");
}

- (WDBuddyControllerUserInfoDelegate)delegate
{
  return (WDBuddyControllerUserInfoDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void)setDataEntryItems:(id)a3
{
  objc_storeStrong((id *)&self->_dataEntryItems, a3);
}

- (WDBuddyFlowUserInfo)userInfo
{
  return self->_userInfo;
}

- (void)setUserInfo:(id)a3
{
  objc_storeStrong((id *)&self->_userInfo, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_dataEntryItems, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_footerView, 0);
  objc_storeStrong((id *)&self->_headerView, 0);
  objc_storeStrong((id *)&self->_baseAutomationIdentifier, 0);
  objc_storeStrong((id *)&self->_userDefaults, 0);
  objc_storeStrong((id *)&self->_healthStore, 0);
  objc_storeStrong((id *)&self->_profile, 0);
}

@end
