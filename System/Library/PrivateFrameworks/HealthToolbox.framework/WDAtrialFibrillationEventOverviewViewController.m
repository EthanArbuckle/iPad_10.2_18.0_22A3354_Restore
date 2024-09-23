@implementation WDAtrialFibrillationEventOverviewViewController

- (WDAtrialFibrillationEventOverviewViewController)initWithDisplayType:(id)a3 profile:(id)a4 mode:(int64_t)a5
{
  id v9;
  id v10;
  WDAtrialFibrillationEventOverviewViewController *v11;
  WDAtrialFibrillationEventOverviewViewController *v12;
  HKDisplayType *displayType;
  WDProfile *profile;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  WDDataListViewControllerDataProvider *dataProvider;
  uint64_t v19;
  HKDataMetadataSectionProtocol *metaDataSection;
  int64_t mode;
  void *v22;
  id v23;
  uint64_t v24;
  id v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  HKKeyValueDomain *keyValueDomain;
  void *v30;
  uint64_t v31;
  UITapGestureRecognizer *tripleTapToSettingsRecognizer;
  objc_super v34;

  v9 = a3;
  v10 = a4;
  v34.receiver = self;
  v34.super_class = (Class)WDAtrialFibrillationEventOverviewViewController;
  v11 = -[WDAtrialFibrillationEventOverviewViewController initWithStyle:](&v34, sel_initWithStyle_, 1);
  v12 = v11;
  if (v11)
  {
    v11->_firstViewDidLayoutSubviews = 1;
    objc_storeStrong((id *)&v11->_displayType, a3);
    objc_storeStrong((id *)&v12->_profile, a4);
    v12->_mode = a5;
    displayType = v12->_displayType;
    profile = v12->_profile;
    -[WDProfile unitController](profile, "unitController");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKDisplayType wd_listViewControllerDataProviderWithProfile:unitController:](displayType, "wd_listViewControllerDataProviderWithProfile:unitController:", profile, v15);
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = 1032;
    dataProvider = v12->_dataProvider;
    v12->_dataProvider = (WDDataListViewControllerDataProvider *)v16;

    -[WDDataListViewControllerDataProvider setHasDetailViewController:](v12->_dataProvider, "setHasDetailViewController:", -[WDAtrialFibrillationEventOverviewViewController _hasDetailViewController](v12, "_hasDetailViewController"));
    v19 = objc_msgSend(objc_alloc(MEMORY[0x24BE4C088]), "initForSinglePlayer:", v12->_mode == 0);
    metaDataSection = v12->_metaDataSection;
    v12->_metaDataSection = (HKDataMetadataSectionProtocol *)v19;

    mode = v12->_mode;
    if (mode)
    {
      v22 = 0;
    }
    else
    {
      v23 = objc_alloc(MEMORY[0x24BDD3BF8]);
      v24 = *MEMORY[0x24BDD2E00];
      objc_msgSend(v10, "healthStore");
      v17 = objc_claimAutoreleasedReturnValue();
      v22 = (void *)objc_msgSend(v23, "initWithFeatureIdentifier:healthStore:", v24, v17);
    }
    objc_storeStrong((id *)&v12->_statusManager, v22);
    if (!mode)
    {

    }
    v25 = objc_alloc(MEMORY[0x24BDD3C98]);
    v26 = *MEMORY[0x24BDD4678];
    objc_msgSend(v10, "healthStore");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v25, "initWithCategory:domainName:healthStore:", 0, v26, v27);
    keyValueDomain = v12->_keyValueDomain;
    v12->_keyValueDomain = (HKKeyValueDomain *)v28;

    -[WDAtrialFibrillationEventOverviewViewController _updateDetectionState](v12, "_updateDetectionState");
    objc_msgSend(MEMORY[0x24BDD4198], "sharedBehavior");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v26) = objc_msgSend(v30, "isAppleInternalInstall");

    if ((_DWORD)v26)
    {
      v31 = objc_msgSend(objc_alloc(MEMORY[0x24BDF6E80]), "initWithTarget:action:", v12, sel__showInternalSettingsViewController);
      tripleTapToSettingsRecognizer = v12->_tripleTapToSettingsRecognizer;
      v12->_tripleTapToSettingsRecognizer = (UITapGestureRecognizer *)v31;

    }
  }

  return v12;
}

- (id)makeInternalSettingsControllerWithHealthStore:(id)a3
{
  return objc_alloc_init(MEMORY[0x24BDF6F98]);
}

- (void)_showInternalSettingsViewController
{
  void *v3;
  id v4;

  -[WDProfile healthStore](self->_profile, "healthStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDAtrialFibrillationEventOverviewViewController makeInternalSettingsControllerWithHealthStore:](self, "makeInternalSettingsControllerWithHealthStore:", v3);
  v4 = (id)objc_claimAutoreleasedReturnValue();

  -[WDAtrialFibrillationEventOverviewViewController showViewController:sender:](self, "showViewController:sender:", v4, self);
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)WDAtrialFibrillationEventOverviewViewController;
  -[WDAtrialFibrillationEventOverviewViewController dealloc](&v4, sel_dealloc);
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
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  WDDataListViewControllerDataProvider *dataProvider;
  _QWORD v24[4];
  id v25;
  id location;
  objc_super v27;
  _QWORD v28[2];

  v28[1] = *MEMORY[0x24BDAC8D0];
  v27.receiver = self;
  v27.super_class = (Class)WDAtrialFibrillationEventOverviewViewController;
  -[HKTableViewController viewDidLoad](&v27, sel_viewDidLoad);
  -[HKDisplayType localization](self->_displayType, "localization");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "displayName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDAtrialFibrillationEventOverviewViewController setTitle:](self, "setTitle:", v4);

  -[WDAtrialFibrillationEventOverviewViewController navigationItem](self, "navigationItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setLargeTitleDisplayMode:", 2);

  -[HKFeatureStatusManager registerObserver:](self->_statusManager, "registerObserver:", self);
  -[WDAtrialFibrillationEventOverviewViewController tableView](self, "tableView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setEstimatedSectionHeaderHeight:", 100.0);

  -[WDAtrialFibrillationEventOverviewViewController tableView](self, "tableView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setSectionHeaderHeight:", *MEMORY[0x24BDF7DE0]);

  -[WDAtrialFibrillationEventOverviewViewController tableView](self, "tableView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_setSectionContentInsetFollowsLayoutMargins:", 1);

  -[WDAtrialFibrillationEventOverviewViewController tableView](self, "tableView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "_setSectionCornerRadius:", *MEMORY[0x24BE4A250]);

  -[WDAtrialFibrillationEventOverviewViewController tableView](self, "tableView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_opt_class();
  +[WDAtrialFibrillationDetectionSetupTableViewCell defaultReuseIdentifier](WDAtrialFibrillationDetectionSetupTableViewCell, "defaultReuseIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "registerClass:forCellReuseIdentifier:", v11, v12);

  -[WDAtrialFibrillationEventOverviewViewController tableView](self, "tableView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_opt_class();
  +[WDHeartRhythmHeaderView defaultReuseIdentifier](WDHeartRhythmHeaderView, "defaultReuseIdentifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "registerClass:forHeaderFooterViewReuseIdentifier:", v14, v15);

  -[WDAtrialFibrillationEventOverviewViewController tableView](self, "tableView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_opt_class();
  +[WDHeartRhythmSectionHeaderView defaultReuseIdentifier](WDHeartRhythmSectionHeaderView, "defaultReuseIdentifier");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "registerClass:forHeaderFooterViewReuseIdentifier:", v17, v18);

  -[WDAtrialFibrillationEventOverviewViewController tableView](self, "tableView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "registerClass:forCellReuseIdentifier:", objc_opt_class(), CFSTR("Regulatory"));

  -[WDAtrialFibrillationEventOverviewViewController tableView](self, "tableView");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "registerClass:forCellReuseIdentifier:", objc_opt_class(), CFSTR("DataTypeDescription"));

  v28[0] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v28, 1);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (id)-[WDAtrialFibrillationEventOverviewViewController registerForTraitChanges:withTarget:action:](self, "registerForTraitChanges:withTarget:action:", v21, self, sel_widthDesignationDidChangeWithTraitEnvironment_previousTraitCollection_);

  objc_initWeak(&location, self);
  dataProvider = self->_dataProvider;
  v24[0] = MEMORY[0x24BDAC760];
  v24[1] = 3221225472;
  v24[2] = __62__WDAtrialFibrillationEventOverviewViewController_viewDidLoad__block_invoke;
  v24[3] = &unk_24D38CFD8;
  objc_copyWeak(&v25, &location);
  -[WDDataListViewControllerDataProvider startCollectingDataWithUpdateHandler:](dataProvider, "startCollectingDataWithUpdateHandler:", v24);
  objc_destroyWeak(&v25);
  objc_destroyWeak(&location);
}

void __62__WDAtrialFibrillationEventOverviewViewController_viewDidLoad__block_invoke(uint64_t a1)
{
  _QWORD block[4];
  id v2;

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __62__WDAtrialFibrillationEventOverviewViewController_viewDidLoad__block_invoke_2;
  block[3] = &unk_24D38CFD8;
  objc_copyWeak(&v2, (id *)(a1 + 32));
  dispatch_async(MEMORY[0x24BDAC9B8], block);
  objc_destroyWeak(&v2);
}

void __62__WDAtrialFibrillationEventOverviewViewController_viewDidLoad__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_reloadAllData");

}

- (void)viewIsAppearing:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)WDAtrialFibrillationEventOverviewViewController;
  -[WDAtrialFibrillationEventOverviewViewController viewIsAppearing:](&v5, sel_viewIsAppearing_, a3);
  -[WDAtrialFibrillationEventOverviewViewController traitCollection](self, "traitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDAtrialFibrillationEventOverviewViewController updateMarginsForWidthDesignation:](self, "updateMarginsForWidthDesignation:", -[WDAtrialFibrillationEventOverviewViewController widthDesignationFromTraitCollection:](self, "widthDesignationFromTraitCollection:", v4));

}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)WDAtrialFibrillationEventOverviewViewController;
  -[WDAtrialFibrillationEventOverviewViewController viewWillAppear:](&v4, sel_viewWillAppear_, a3);
  -[WDAtrialFibrillationEventOverviewViewController _reloadAllData](self, "_reloadAllData");
}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)WDAtrialFibrillationEventOverviewViewController;
  -[WDAtrialFibrillationEventOverviewViewController viewDidAppear:](&v10, sel_viewDidAppear_, a3);
  objc_msgSend(MEMORY[0x24BDD4198], "sharedBehavior");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isAppleInternalInstall");

  if (v5)
  {
    -[WDAtrialFibrillationEventOverviewViewController tripleTapToSettingsRecognizer](self, "tripleTapToSettingsRecognizer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setNumberOfTapsRequired:", 3);

    -[WDAtrialFibrillationEventOverviewViewController navigationController](self, "navigationController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "navigationBar");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[WDAtrialFibrillationEventOverviewViewController tripleTapToSettingsRecognizer](self, "tripleTapToSettingsRecognizer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addGestureRecognizer:", v9);

  }
}

- (void)viewDidLayoutSubviews
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)WDAtrialFibrillationEventOverviewViewController;
  -[WDAtrialFibrillationEventOverviewViewController viewDidLayoutSubviews](&v6, sel_viewDidLayoutSubviews);
  if (-[WDAtrialFibrillationEventOverviewViewController firstViewDidLayoutSubviews](self, "firstViewDidLayoutSubviews"))
  {
    -[WDAtrialFibrillationEventOverviewViewController setFirstViewDidLayoutSubviews:](self, "setFirstViewDidLayoutSubviews:", 0);
    -[WDAtrialFibrillationEventOverviewViewController tableView](self, "tableView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "tableHeaderView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[WDAtrialFibrillationEventOverviewViewController tableView](self, "tableView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setTableHeaderView:", v4);

  }
}

- (NSArray)sectionsToDisplay
{
  NSArray *sectionsToDisplay;
  NSArray *v3;
  id v5;
  void *v6;
  HKFeatureStatus *featureStatus;
  void *v8;
  uint64_t v9;
  NSArray *v10;
  NSArray *v11;

  sectionsToDisplay = self->_sectionsToDisplay;
  if (sectionsToDisplay)
  {
    v3 = sectionsToDisplay;
  }
  else
  {
    v5 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v6 = v5;
    if (self->_detectionState != 5)
    {
      objc_msgSend(v5, "addObject:", &unk_24D3A5B70);
      objc_msgSend(v6, "addObject:", &unk_24D3A5B88);
    }
    featureStatus = self->_featureStatus;
    if (featureStatus
      && (-[HKFeatureStatus isOnboardingRecordPresent](featureStatus, "isOnboardingRecordPresent") & 1) != 0
      || self->_mode)
    {
      objc_msgSend(v6, "addObject:", &unk_24D3A5BA0);
    }
    objc_msgSend(v6, "addObject:", &unk_24D3A5BB8);
    if (!self->_mode)
      objc_msgSend(v6, "addObject:", &unk_24D3A5BD0);
    -[WDAtrialFibrillationEventOverviewViewController userConfigurationRowsToDisplay](self, "userConfigurationRowsToDisplay");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "count");

    if (v9)
      objc_msgSend(v6, "addObject:", &unk_24D3A5BE8);
    objc_msgSend(v6, "addObject:", &unk_24D3A5C00);
    v10 = (NSArray *)objc_msgSend(v6, "copy");
    v11 = self->_sectionsToDisplay;
    self->_sectionsToDisplay = v10;

    v3 = self->_sectionsToDisplay;
  }
  return v3;
}

- (int64_t)_sectionIndexForSection:(int64_t)a3
{
  NSArray *sectionsToDisplay;
  void *v4;
  int64_t v5;

  sectionsToDisplay = self->_sectionsToDisplay;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[NSArray indexOfObject:](sectionsToDisplay, "indexOfObject:", v4);

  return v5;
}

- (id)userConfigurationRowsToDisplay
{
  int64_t mode;
  void *v3;

  mode = self->_mode;
  v3 = &unk_24D3A61A0;
  if (mode == 1)
    v3 = &unk_24D3A61B8;
  if (mode == 2)
    return (id)MEMORY[0x24BDBD1A8];
  else
    return v3;
}

- (double)adjustedSafeAreaInsetTop
{
  void *v2;
  double v3;
  double v4;

  -[WDAtrialFibrillationEventOverviewViewController view](self, "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safeAreaInsets");
  v4 = v3;

  return v4;
}

- (void)_reloadTableViewAndScrollToTop
{
  void *v3;
  double v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  void *v9;
  void *v10;

  -[WDAtrialFibrillationEventOverviewViewController tableView](self, "tableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDAtrialFibrillationEventOverviewViewController adjustedSafeAreaInsetTop](self, "adjustedSafeAreaInsetTop");
  objc_msgSend(v3, "setContentOffset:animated:", 0, 0.0, -v4);

  -[WDAtrialFibrillationEventOverviewViewController tableView](self, "tableView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "reloadData");

  -[WDAtrialFibrillationEventOverviewViewController tableView](self, "tableView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "layoutIfNeeded");

  -[WDAtrialFibrillationEventOverviewViewController tableView](self, "tableView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDAtrialFibrillationEventOverviewViewController adjustedSafeAreaInsetTop](self, "adjustedSafeAreaInsetTop");
  objc_msgSend(v7, "setContentOffset:animated:", 0, 0.0, -v8);

  -[WDAtrialFibrillationEventOverviewViewController tableView](self, "tableView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD15E0], "indexSetWithIndex:", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "reloadSections:withRowAnimation:", v10, 5);

  -[WDAtrialFibrillationEventOverviewViewController _reloadAtrialFibrillationSetupTableHeaderView](self, "_reloadAtrialFibrillationSetupTableHeaderView");
}

- (void)widthDesignationDidChangeWithTraitEnvironment:(id)a3 previousTraitCollection:(id)a4
{
  void *v5;
  int64_t v6;

  objc_msgSend(a3, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[WDAtrialFibrillationEventOverviewViewController widthDesignationFromTraitCollection:](self, "widthDesignationFromTraitCollection:", v5);

  -[WDAtrialFibrillationEventOverviewViewController updateMarginsForWidthDesignation:](self, "updateMarginsForWidthDesignation:", v6);
}

- (int64_t)widthDesignationFromTraitCollection:(id)a3
{
  id v3;
  int64_t v4;

  v3 = a3;
  v4 = objc_msgSend(v3, "valueForNSIntegerTrait:", objc_opt_class());

  return v4;
}

- (void)updateMarginsForWidthDesignation:(int64_t)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  id v12;

  objc_msgSend(MEMORY[0x24BE4A578], "edgeInsetsForWidthDesignation:", a3);
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  -[WDAtrialFibrillationEventOverviewViewController tableView](self, "tableView");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setDirectionalLayoutMargins:", v5, v7, v9, v11);

}

- (void)featureStatusProviding:(id)a3 didUpdateFeatureStatus:(id)a4
{
  void *v5;
  NSObject *v6;
  id v7;
  _QWORD block[5];
  uint8_t buf[4];
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  _HKInitializeLogging();
  v5 = (void *)*MEMORY[0x24BDD3010];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3010], OS_LOG_TYPE_DEFAULT))
  {
    v6 = v5;
    *(_DWORD *)buf = 138543362;
    v10 = (id)objc_opt_class();
    v7 = v10;
    _os_log_impl(&dword_215814000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@]: Received update for IRN feature status", buf, 0xCu);

  }
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __97__WDAtrialFibrillationEventOverviewViewController_featureStatusProviding_didUpdateFeatureStatus___block_invoke;
  block[3] = &unk_24D38D000;
  block[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

uint64_t __97__WDAtrialFibrillationEventOverviewViewController_featureStatusProviding_didUpdateFeatureStatus___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_reloadAllData");
}

- (void)_startOnboardingForFirstTime:(BOOL)a3
{
  _BOOL8 v3;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v3 = a3;
  v5 = objc_alloc(MEMORY[0x24BE4C090]);
  -[WDAtrialFibrillationEventOverviewViewController profile](self, "profile");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "healthStore");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDAtrialFibrillationEventOverviewViewController profile](self, "profile");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "dateCache");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v5, "initWithOnboardingType:isFirstTimeOnboarding:healthStore:dateCache:provenance:delegate:", 0, v3, v7, v9, 2, self);
  -[WDAtrialFibrillationEventOverviewViewController setOnboardingManager:](self, "setOnboardingManager:", v10);

  -[WDAtrialFibrillationEventOverviewViewController onboardingManager](self, "onboardingManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "onboardingNavigationController");
  v13 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "setModalInPresentation:", 1);
  -[WDAtrialFibrillationEventOverviewViewController navigationController](self, "navigationController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "presentViewController:animated:completion:", v13, 1, 0);

}

- (BOOL)_hasDetailViewController
{
  return self->_mode != 2;
}

- (void)_updateDetectionState
{
  void *v1;
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_5(a1);
  v2 = (void *)OUTLINED_FUNCTION_2();
  v3 = OUTLINED_FUNCTION_0_0(v2);
  OUTLINED_FUNCTION_0(&dword_215814000, v4, v5, "[%{public}@]: Error retrieving notification setting state IRN; reporting 'off': %{public}@",
    v6,
    v7,
    v8,
    v9,
    v10);

  OUTLINED_FUNCTION_1();
}

- (void)_reloadAllData
{
  uint64_t v3;
  uint64_t v4;
  int64_t detectionState;
  void *v6;

  v3 = -[WDDataListViewControllerDataProvider numberOfObjectsForSection:](self->_dataProvider, "numberOfObjectsForSection:", 0);
  if (v3 >= 3)
    v4 = 3;
  else
    v4 = v3;
  -[WDAtrialFibrillationEventOverviewViewController setVisibleSampleCount:](self, "setVisibleSampleCount:", v4);
  -[WDAtrialFibrillationEventOverviewViewController recomputeTotalSampleCount](self, "recomputeTotalSampleCount");
  detectionState = self->_detectionState;
  -[WDAtrialFibrillationEventOverviewViewController _updateDetectionState](self, "_updateDetectionState");
  if (detectionState != self->_detectionState)
    -[WDAtrialFibrillationEventOverviewViewController setSectionsToDisplay:](self, "setSectionsToDisplay:", 0);
  -[WDAtrialFibrillationEventOverviewViewController _getLatestAnalyzedSampleDate](self, "_getLatestAnalyzedSampleDate");
  -[WDAtrialFibrillationEventOverviewViewController tableView](self, "tableView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "reloadData");

  -[WDAtrialFibrillationEventOverviewViewController _reloadAtrialFibrillationSetupTableHeaderView](self, "_reloadAtrialFibrillationSetupTableHeaderView");
}

- (void)recomputeTotalSampleCount
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t, uint64_t, void *, void *);
  void *v12;
  WDAtrialFibrillationEventOverviewViewController *v13;
  id v14;

  objc_msgSend(MEMORY[0x24BDD3990], "atrialFibrillationEventType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc(MEMORY[0x24BDD3EE0]);
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x24BDAC760];
  v10 = 3221225472;
  v11 = __76__WDAtrialFibrillationEventOverviewViewController_recomputeTotalSampleCount__block_invoke;
  v12 = &unk_24D38D050;
  v13 = self;
  v14 = v3;
  v6 = v3;
  v7 = (void *)objc_msgSend(v4, "initWithSampleTypes:predicate:resultsHandler:", v5, 0, &v9);

  -[WDProfile healthStore](self->_profile, "healthStore", v9, v10, v11, v12, v13);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "executeQuery:", v7);

}

void __76__WDAtrialFibrillationEventOverviewViewController_recomputeTotalSampleCount__block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  _QWORD v10[6];

  v6 = a4;
  if (a3)
  {
    objc_msgSend(a3, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "integerValue");

    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __76__WDAtrialFibrillationEventOverviewViewController_recomputeTotalSampleCount__block_invoke_242;
    v10[3] = &unk_24D38D028;
    v10[4] = *(_QWORD *)(a1 + 32);
    v10[5] = v8;
    dispatch_async(MEMORY[0x24BDAC9B8], v10);
  }
  else
  {
    _HKInitializeLogging();
    v9 = (void *)*MEMORY[0x24BDD3010];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3010], OS_LOG_TYPE_ERROR))
      __76__WDAtrialFibrillationEventOverviewViewController_recomputeTotalSampleCount__block_invoke_cold_1(a1, v9);
  }

}

void __76__WDAtrialFibrillationEventOverviewViewController_recomputeTotalSampleCount__block_invoke_242(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "setTotalSampleCount:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "tableView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "reloadData");

}

- (void)_getLatestAnalyzedSampleDate
{
  void *v3;
  uint64_t v4;
  _QWORD v5[5];

  -[WDAtrialFibrillationEventOverviewViewController keyValueDomain](self, "keyValueDomain");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *MEMORY[0x24BDD4688];
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __79__WDAtrialFibrillationEventOverviewViewController__getLatestAnalyzedSampleDate__block_invoke;
  v5[3] = &unk_24D38D078;
  v5[4] = self;
  objc_msgSend(v3, "dateForKey:completion:", v4, v5);

}

void __79__WDAtrialFibrillationEventOverviewViewController__getLatestAnalyzedSampleDate__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  _QWORD v8[5];
  id v9;

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    _HKInitializeLogging();
    v7 = (void *)*MEMORY[0x24BDD3010];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3010], OS_LOG_TYPE_ERROR))
      __79__WDAtrialFibrillationEventOverviewViewController__getLatestAnalyzedSampleDate__block_invoke_cold_1(a1, v7);
  }
  else
  {
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __79__WDAtrialFibrillationEventOverviewViewController__getLatestAnalyzedSampleDate__block_invoke_244;
    v8[3] = &unk_24D38CEC0;
    v8[4] = *(_QWORD *)(a1 + 32);
    v9 = v5;
    dispatch_async(MEMORY[0x24BDAC9B8], v8);

  }
}

void __79__WDAtrialFibrillationEventOverviewViewController__getLatestAnalyzedSampleDate__block_invoke_244(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "setLatestAnalyzedSampleDate:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "tableView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "reloadData");

}

- (id)_cellForFavorites
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = objc_alloc(MEMORY[0x24BE4A630]);
  objc_msgSend(MEMORY[0x24BE4A630], "reuseIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithStyle:reuseIdentifier:", 0, v4);

  objc_msgSend(v5, "setFavorited:", -[WDAtrialFibrillationEventOverviewViewController isPinned](self, "isPinned"));
  -[WDAtrialFibrillationEventOverviewViewController axidForElementWithString:](self, "axidForElementWithString:", CFSTR("AddToFavorites"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAccessibilityIdentifier:", v6);

  return v5;
}

- (id)_cellForDataSourcesAndAccess
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6E60]), "initWithStyle:reuseIdentifier:", 0, CFSTR("DataSourcesAndAccessCellIdentifier"));
  objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("SHARE_DATA_TITLE"), &stru_24D38E7C8, CFSTR("HealthUI-Localizable"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "textLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setText:", v5);

  objc_msgSend(v3, "setAccessoryType:", 1);
  -[WDAtrialFibrillationEventOverviewViewController axidForElementWithString:](self, "axidForElementWithString:", CFSTR("DataSourcesAndAccess"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAccessibilityIdentifier:", v7);

  return v3;
}

- (id)_cellForShowAll
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

  -[WDAtrialFibrillationEventOverviewViewController tableView](self, "tableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dequeueReusableCellWithIdentifier:", CFSTR("ShowAllCell"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6E60]), "initWithStyle:reuseIdentifier:", 1, CFSTR("ShowAllCell"));
  WDBundle();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("SHOW_ALL_DATA"), &stru_24D38E7C8, CFSTR("WellnessDashboard-Localizable"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "textLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setText:", v6);

  objc_msgSend(v4, "setAccessoryType:", 1);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", self->_totalSampleCount);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  HKLocalizedStringForNumberWithTemplate();
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "detailTextLabel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setText:", v9);

  -[WDAtrialFibrillationEventOverviewViewController axidForElementWithString:](self, "axidForElementWithString:", CFSTR("All Data"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAccessibilityIdentifier:", v11);

  return v4;
}

- (id)_cellForRegulatory
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  -[WDAtrialFibrillationEventOverviewViewController tableView](self, "tableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dequeueReusableCellWithIdentifier:", CFSTR("Regulatory"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  WDBundle();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("ATRIAL_FIBRILLATION_DETECTION_REGULATORY_LABEL"), &stru_24D38E7C8, CFSTR("WellnessDashboard-Localizable-Antimony"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "textLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setText:", v6);

  objc_msgSend(v4, "setAccessoryType:", 1);
  objc_msgSend(v4, "textLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setNumberOfLines:", 0);

  -[WDAtrialFibrillationEventOverviewViewController axidForElementWithString:](self, "axidForElementWithString:", CFSTR("About"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAccessibilityIdentifier:", v9);

  return v4;
}

- (id)_cellForDataTypeDescription
{
  void *v3;
  void *v4;
  _BOOL8 v5;
  void *v6;

  -[WDAtrialFibrillationEventOverviewViewController tableView](self, "tableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dequeueReusableCellWithIdentifier:", CFSTR("DataTypeDescription"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = (-[WDAtrialFibrillationEventOverviewViewController detectionState](self, "detectionState") == 6
     || -[WDAtrialFibrillationEventOverviewViewController detectionState](self, "detectionState") == 7)
    && self->_mode == 0;
  objc_msgSend(v4, "setFeatureAvailable:", v5);
  -[WDAtrialFibrillationEventOverviewViewController axidForElementWithString:](self, "axidForElementWithString:", CFSTR("AboutIRNDescription"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAccessibilityIdentifier:", v6);

  return v4;
}

- (id)_cellForAFibEventInTable:(id)a3 atIndexPath:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v5 = a4;
  -[WDAtrialFibrillationEventOverviewViewController dataProvider](self, "dataProvider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectAtIndex:forSection:", objc_msgSend(v5, "row"), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[WDAtrialFibrillationEventOverviewViewController dataProvider](self, "dataProvider");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDAtrialFibrillationEventOverviewViewController tableView](self, "tableView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "customCellForObject:indexPath:tableView:", v7, v5, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)_cellForAFibEducationalMaterialInTable:(id)a3 atIndex:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a3;
  -[WDAtrialFibrillationEventOverviewViewController metaDataSection](self, "metaDataSection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "cellForIndex:tableView:", a4, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)_cellForIRN2ConsentForm
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6E60]), "initWithStyle:reuseIdentifier:", 0, CFSTR("iConsent"));
  objc_msgSend(v2, "textLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setText:", CFSTR("IRN 2.0 Carry Consent (Internal Only)"));

  objc_msgSend(v2, "textLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setNumberOfLines:", 0);

  return v2;
}

- (id)_pushShowAllViewController
{
  WDDataListViewControllerDataProvider *v3;
  HKDisplayType *displayType;
  WDProfile *profile;
  void *v6;
  WDDataListViewController *v7;
  void *v8;
  double v9;
  void *v10;

  if (self->_mode == 2)
  {
    v3 = self->_dataProvider;
  }
  else
  {
    displayType = self->_displayType;
    profile = self->_profile;
    -[WDProfile unitController](profile, "unitController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKDisplayType wd_listViewControllerDataProviderWithProfile:unitController:](displayType, "wd_listViewControllerDataProviderWithProfile:unitController:", profile, v6);
    v3 = (WDDataListViewControllerDataProvider *)objc_claimAutoreleasedReturnValue();

    -[WDDataListViewControllerDataProvider setHasDetailViewController:](v3, "setHasDetailViewController:", -[WDAtrialFibrillationEventOverviewViewController _hasDetailViewController](self, "_hasDetailViewController"));
  }
  v7 = -[WDDataListViewController initWithDisplayType:profile:dataProvider:usingInsetStyling:]([WDDataListViewController alloc], "initWithDisplayType:profile:dataProvider:usingInsetStyling:", self->_displayType, self->_profile, v3, 1);
  -[WDDataListViewController tableView](v7, "tableView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_setSectionContentInsetFollowsLayoutMargins:", 1);

  v9 = *MEMORY[0x24BE4A250];
  -[WDDataListViewController tableView](v7, "tableView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "_setSectionCornerRadius:", v9);

  -[WDAtrialFibrillationEventOverviewViewController showAdaptively:sender:](self, "showAdaptively:sender:", v7, self);
  return v7;
}

- (id)_pushDataSourcesAndAccessController
{
  void *v3;
  WDDisplayTypeDataSourcesTableViewController *v4;
  HKDisplayType *displayType;
  void *v6;
  WDDisplayTypeDataSourcesTableViewController *v7;

  objc_msgSend(MEMORY[0x24BE4A5C0], "categoryWithID:", -[HKDisplayType categoryIdentifier](self->_displayType, "categoryIdentifier"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = [WDDisplayTypeDataSourcesTableViewController alloc];
  displayType = self->_displayType;
  -[WDProfile sourceOrderController](self->_profile, "sourceOrderController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[WDDisplayTypeDataSourcesTableViewController initWithDisplayType:displayCategory:sourceOrderController:profile:](v4, "initWithDisplayType:displayCategory:sourceOrderController:profile:", displayType, v3, v6, self->_profile);

  -[WDDisplayTypeDataSourcesTableViewController setShouldInsetSectionContentForDataSourceDataList:](v7, "setShouldInsetSectionContentForDataSourceDataList:", 1);
  -[WDAtrialFibrillationEventOverviewViewController showAdaptively:sender:](self, "showAdaptively:sender:", v7, self);

  return v7;
}

- (BOOL)isPinned
{
  return 0;
}

- (id)featureStatusCells
{
  return (id)MEMORY[0x24BDBD1A8];
}

- (id)featureStatusFooterView
{
  return 0;
}

- (void)reloadFeatureStatusSection
{
  int64_t v3;
  void *v4;
  id v5;

  v3 = -[WDAtrialFibrillationEventOverviewViewController _sectionIndexForSection:](self, "_sectionIndexForSection:", 6);
  if (v3 != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(MEMORY[0x24BDD15E0], "indexSetWithIndex:", v3);
    v5 = (id)objc_claimAutoreleasedReturnValue();
    -[WDAtrialFibrillationEventOverviewViewController tableView](self, "tableView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "reloadSections:withRowAnimation:", v5, 100);

  }
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  void *v3;
  int64_t v4;

  -[WDAtrialFibrillationEventOverviewViewController sectionsToDisplay](self, "sectionsToDisplay", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  return v4;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  void *v6;
  void *v7;
  uint64_t v8;
  int64_t result;
  void *v10;
  void *v11;
  uint64_t v12;
  int64_t v13;

  -[WDAtrialFibrillationEventOverviewViewController sectionsToDisplay](self, "sectionsToDisplay", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectAtIndexedSubscript:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "integerValue");

  result = 1;
  switch(v8)
  {
    case 0:
      return -[WDAtrialFibrillationEventOverviewViewController visibleSampleCount](self, "visibleSampleCount");
    case 1:
    case 2:
    case 4:
      return result;
    case 3:
      -[WDAtrialFibrillationEventOverviewViewController metaDataSection](self, "metaDataSection");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "numberOfRowsInSection");
      goto LABEL_8;
    case 5:
      -[WDAtrialFibrillationEventOverviewViewController userConfigurationRowsToDisplay](self, "userConfigurationRowsToDisplay");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    case 6:
      -[WDAtrialFibrillationEventOverviewViewController featureStatusCells](self, "featureStatusCells");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_6:
      v11 = v10;
      v12 = objc_msgSend(v10, "count");
LABEL_8:
      v13 = v12;

      result = v13;
      break;
    default:
      result = 0;
      break;
  }
  return result;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  objc_class *v15;
  void *v16;
  uint64_t v17;
  void *v18;

  v6 = a3;
  v7 = a4;
  -[WDAtrialFibrillationEventOverviewViewController sectionsToDisplay](self, "sectionsToDisplay");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectAtIndexedSubscript:", objc_msgSend(v7, "section"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "integerValue");

  switch(v10)
  {
    case 0:
      -[WDAtrialFibrillationEventOverviewViewController _cellForAFibEventInTable:atIndexPath:](self, "_cellForAFibEventInTable:atIndexPath:", v6, v7);
      v11 = objc_claimAutoreleasedReturnValue();
      goto LABEL_14;
    case 1:
      -[WDAtrialFibrillationEventOverviewViewController _cellForShowAll](self, "_cellForShowAll");
      v11 = objc_claimAutoreleasedReturnValue();
      goto LABEL_14;
    case 2:
      -[WDAtrialFibrillationEventOverviewViewController _cellForDataTypeDescription](self, "_cellForDataTypeDescription");
      v11 = objc_claimAutoreleasedReturnValue();
      goto LABEL_14;
    case 3:
      -[WDAtrialFibrillationEventOverviewViewController _cellForAFibEducationalMaterialInTable:atIndex:](self, "_cellForAFibEducationalMaterialInTable:atIndex:", v6, objc_msgSend(v7, "row"));
      v11 = objc_claimAutoreleasedReturnValue();
      goto LABEL_14;
    case 4:
      -[WDAtrialFibrillationEventOverviewViewController _cellForFavorites](self, "_cellForFavorites");
      v11 = objc_claimAutoreleasedReturnValue();
      goto LABEL_14;
    case 5:
      -[WDAtrialFibrillationEventOverviewViewController userConfigurationRowsToDisplay](self, "userConfigurationRowsToDisplay");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "objectAtIndexedSubscript:", objc_msgSend(v7, "row"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "integerValue");

      if (v14 == 1)
      {
        -[WDAtrialFibrillationEventOverviewViewController _cellForRegulatory](self, "_cellForRegulatory");
        v11 = objc_claimAutoreleasedReturnValue();
        goto LABEL_14;
      }
      if (!v14)
      {
        -[WDAtrialFibrillationEventOverviewViewController _cellForDataSourcesAndAccess](self, "_cellForDataSourcesAndAccess");
        v11 = objc_claimAutoreleasedReturnValue();
LABEL_14:
        v18 = (void *)v11;
        goto LABEL_15;
      }
LABEL_10:
      v15 = (objc_class *)objc_opt_class();
      NSStringFromClass(v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      HKErrorTableViewCell();
      v17 = objc_claimAutoreleasedReturnValue();
LABEL_12:
      v18 = (void *)v17;

LABEL_15:
      return v18;
    case 6:
      -[WDAtrialFibrillationEventOverviewViewController featureStatusCells](self, "featureStatusCells");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "objectAtIndexedSubscript:", objc_msgSend(v7, "row"));
      v17 = objc_claimAutoreleasedReturnValue();
      goto LABEL_12;
    default:
      goto LABEL_10;
  }
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  const __CFString *v12;
  void *v13;
  void *v14;

  v6 = a3;
  if (a4 || self->_detectionState)
  {
    -[WDAtrialFibrillationEventOverviewViewController sectionsToDisplay](self, "sectionsToDisplay");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectAtIndexedSubscript:", a4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "integerValue");

    switch(v9)
    {
      case 0:
        if (-[WDAtrialFibrillationEventOverviewViewController visibleSampleCount](self, "visibleSampleCount") < 1)
          goto LABEL_8;
        goto LABEL_5;
      case 1:
        if (-[WDAtrialFibrillationEventOverviewViewController visibleSampleCount](self, "visibleSampleCount"))
          goto LABEL_8;
LABEL_5:
        WDBundle();
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = v10;
        v12 = CFSTR("ATRIAL_FIBRILLATION_DETECTION_NOTIFICATIONS_SECTION_TITLE");
LABEL_12:
        objc_msgSend(v10, "localizedStringForKey:value:table:", v12, &stru_24D38E7C8, CFSTR("WellnessDashboard-Localizable-Antimony"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[WDAtrialFibrillationEventOverviewViewController _sectionHeaderViewWithTitle:](self, "_sectionHeaderViewWithTitle:", v14);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        break;
      case 2:
        WDBundle();
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = v10;
        v12 = CFSTR("ATRIAL_FIBRILLATION_DETECTION_ABOUT_SECTION_TITLE");
        goto LABEL_12;
      case 3:
        WDBundle();
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = v10;
        v12 = CFSTR("ATRIAL_FIBRILLATION_DETECTION_EDUCATION_SECTION_TITLE");
        goto LABEL_12;
      case 4:
        WDBundle();
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = v10;
        v12 = CFSTR("ATRIAL_FIBRILLATION_DETECTION_OPTIONS_SECTION_TITLE");
        goto LABEL_12;
      default:
LABEL_8:
        v13 = 0;
        break;
    }
  }
  else
  {
    -[WDAtrialFibrillationEventOverviewViewController _atrialFibrillationDetectionRescindedHeaderView](self, "_atrialFibrillationDetectionRescindedHeaderView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v13;
}

- (id)_sectionHeaderViewWithTitle:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  -[WDAtrialFibrillationEventOverviewViewController tableView](self, "tableView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[WDHeartRhythmSectionHeaderView defaultReuseIdentifier](WDHeartRhythmSectionHeaderView, "defaultReuseIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dequeueReusableHeaderFooterViewWithIdentifier:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "setTitleText:", v4);
  -[WDAtrialFibrillationEventOverviewViewController axidForElementWithString:](self, "axidForElementWithString:", CFSTR("SectionHeader."));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringByAppendingString:", v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "setAccessibilityIdentifier:", v9);
  return v7;
}

- (id)_atrialFibrillationDetectionRescindedHeaderView
{
  void *v3;
  void *v4;
  void *v5;
  HKFeatureStatus *featureStatus;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  char v11;
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

  -[WDAtrialFibrillationEventOverviewViewController tableView](self, "tableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[WDHeartRhythmHeaderView defaultReuseIdentifier](WDHeartRhythmHeaderView, "defaultReuseIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dequeueReusableHeaderFooterViewWithIdentifier:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  featureStatus = self->_featureStatus;
  if (featureStatus)
  {
    -[HKFeatureStatus objectForKeyedSubscript:](featureStatus, "objectForKeyedSubscript:", *MEMORY[0x24BDD2CA8]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x24BDD2DA0]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "BOOLValue");

    objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x24BDD2D08]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "BOOLValue");

    if ((v9 & 1) != 0)
    {
      if ((v11 & 1) != 0)
      {
        _HKInitializeLogging();
        v12 = (void *)*MEMORY[0x24BDD3010];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3010], OS_LOG_TYPE_FAULT))
          -[WDAtrialFibrillationEventOverviewViewController _atrialFibrillationDetectionRescindedHeaderView].cold.2(v12);
        goto LABEL_11;
      }
      WDBundle();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "localizedStringForKey:value:table:", CFSTR("ATRIAL_FIBRILLATION_DETECTION_DISABLED_TITLE"), &stru_24D38E7C8, CFSTR("WellnessDashboard-Localizable-Antimony"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setTitleText:", v23);

      WDBundle();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("ATRIAL_FIBRILLATION_DETECTION_DISABLED_LEARN_MORE"), &stru_24D38E7C8, CFSTR("WellnessDashboard-Localizable-Antimony"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", *MEMORY[0x24BDD2810]);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setBodyText:URLText:URL:", 0, v24, v25);

    }
    else
    {
      WDBundle();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("ATRIAL_FIBRILLATION_DETECTION_SEED_EXPIRED_TITLE"), &stru_24D38E7C8, CFSTR("WellnessDashboard-Localizable-Antimony"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setTitleText:", v15);

      WDBundle();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("ATRIAL_FIBRILLATION_DETECTION_SEED_EXPIRED_LEARN_MORE"), &stru_24D38E7C8, CFSTR("WellnessDashboard-Localizable-Antimony"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = (void *)MEMORY[0x24BDBCF48];
      WDBundle();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "localizedStringForKey:value:table:", CFSTR("ATRIAL_FIBRILLATION_DETECTION_SEED_EXPIRED_URL"), &stru_24D38E7C8, CFSTR("WellnessDashboard-Localizable-Antimony"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "URLWithString:", v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setBodyText:URLText:URL:", 0, v17, v21);

    }
LABEL_11:

    return v5;
  }
  _HKInitializeLogging();
  v13 = (void *)*MEMORY[0x24BDD3010];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3010], OS_LOG_TYPE_FAULT))
    -[WDAtrialFibrillationEventOverviewViewController _atrialFibrillationDetectionRescindedHeaderView].cold.1(v13);
  return v5;
}

- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4
{
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  const __CFString *v17;

  -[WDAtrialFibrillationEventOverviewViewController sectionsToDisplay](self, "sectionsToDisplay", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectAtIndexedSubscript:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "integerValue");

  if (v8 == 4)
  {
    WDBundle();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v16;
    v17 = CFSTR("ATRIAL_FIBRILLATION_DETECTION_PINNED_FOOTER");
    goto LABEL_8;
  }
  if (v8 == 1 && self->_detectionState == 6)
  {
    -[WDAtrialFibrillationEventOverviewViewController latestAnalyzedSampleDate](self, "latestAnalyzedSampleDate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      -[WDAtrialFibrillationEventOverviewViewController latestAnalyzedSampleDate](self, "latestAnalyzedSampleDate");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      HKLocalizedStringForDateAndTemplate();
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      v12 = (void *)MEMORY[0x24BDD17C8];
      WDBundle();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("ATRIAL_FIBRILLATION_DETECTION_LAST_SAMPLE_%@"), &stru_24D38E7C8, CFSTR("WellnessDashboard-Localizable-Antimony"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "stringWithFormat:", v14, v11);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_9:
      return v15;
    }
    WDBundle();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v16;
    v17 = CFSTR("ATRIAL_FIBRILLATION_DETECTION_ENABLED_NO_SAMPLES");
LABEL_8:
    objc_msgSend(v16, "localizedStringForKey:value:table:", v17, &stru_24D38E7C8, CFSTR("WellnessDashboard-Localizable-Antimony"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }
  v15 = 0;
  return v15;
}

- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4
{
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  const __CFString *v15;
  id v16;
  void *v17;
  const __CFString *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  id v30;

  -[WDAtrialFibrillationEventOverviewViewController sectionsToDisplay](self, "sectionsToDisplay", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectAtIndexedSubscript:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "integerValue");

  if (v8 == 1)
  {
    v9 = 0;
    switch(self->_detectionState)
    {
      case 1:
        v16 = objc_alloc(MEMORY[0x24BE4A638]);
        objc_msgSend(MEMORY[0x24BE4A638], "defaultReuseIdentifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        WDBundle();
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = v17;
        v18 = CFSTR("ATRIAL_FIBRILLATION_DETECTION_HEART_AGE_GATED");
        goto LABEL_11;
      case 2:
      case 7:
        objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", CFSTR("bridge:root=com.apple.HeartRateSettings"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        WDBundle();
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("ATRIAL_FIBRILLATION_DETECTION_AVAILABLE_OFF"), &stru_24D38E7C8, CFSTR("WellnessDashboard-Localizable-Antimony"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        WDBundle();
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = v13;
        v15 = CFSTR("ATRIAL_FIBRILLATION_DETECTION_AVAILABLE_OFF_LINK");
        goto LABEL_9;
      case 4:
        v19 = (void *)MEMORY[0x24BDBCF48];
        WDBundle();
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "localizedStringForKey:value:table:", CFSTR("ATRIAL_FIBRILLATION_DETECTION_UNAVAILABLE_LEARN_MORE_URL"), &stru_24D38E7C8, CFSTR("WellnessDashboard-Localizable-Antimony"));
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "URLWithString:", v21);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        WDBundle();
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "localizedStringForKey:value:table:", CFSTR("ATRIAL_FIBRILLATION_DETECTION_UNAVAILABLE_ON_ACTIVE_WATCH"), &stru_24D38E7C8, CFSTR("WellnessDashboard-Localizable-Antimony"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        WDBundle();
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = v13;
        v15 = CFSTR("ATRIAL_FIBRILLATION_DETECTION_UNAVAILABLE_LEARN_MORE");
LABEL_9:
        objc_msgSend(v13, "localizedStringForKey:value:table:", v15, &stru_24D38E7C8, CFSTR("WellnessDashboard-Localizable-Antimony"));
        v23 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), v12, v23);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = objc_alloc(MEMORY[0x24BE4A638]);
        objc_msgSend(MEMORY[0x24BE4A638], "defaultReuseIdentifier");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = objc_msgSend(v24, "rangeOfString:", v23);
        v9 = (void *)objc_msgSend(v25, "initWithReuseIdentifier:fullText:linkRange:link:", v26, v24, v27, v28, v10);

        goto LABEL_12;
      case 0xBLL:
        v16 = objc_alloc(MEMORY[0x24BE4A638]);
        objc_msgSend(MEMORY[0x24BE4A638], "defaultReuseIdentifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        WDBundle();
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = v17;
        v18 = CFSTR("ATRIAL_FIBRILLATION_DETECTION_UNAVAILABLE_ON_ACTIVE_WATCH");
LABEL_11:
        objc_msgSend(v17, "localizedStringForKey:value:table:", v18, &stru_24D38E7C8, CFSTR("WellnessDashboard-Localizable-Antimony"));
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = objc_alloc_init(MEMORY[0x24BDBCF48]);
        v9 = (void *)objc_msgSend(v16, "initWithReuseIdentifier:bodyText:linkText:link:", v10, v29, &stru_24D38E7C8, v30);

LABEL_12:
        break;
      default:
        return v9;
    }
  }
  else if (v8 == 6)
  {
    -[WDAtrialFibrillationEventOverviewViewController featureStatusFooterView](self, "featureStatusFooterView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }
  return v9;
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;

  v15 = a3;
  v8 = a4;
  v9 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setSeparatorColor:", v10);

  }
  -[WDAtrialFibrillationEventOverviewViewController sectionsToDisplay](self, "sectionsToDisplay");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectAtIndexedSubscript:", objc_msgSend(v9, "section"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "integerValue");

  if (v13 == 3)
  {
    -[WDAtrialFibrillationEventOverviewViewController metaDataSection](self, "metaDataSection");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "willDisplayCell:forIndex:tableView:", v8, objc_msgSend(v9, "row"), v15);

  }
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  id v18;
  id v19;

  v19 = a3;
  v6 = a4;
  objc_msgSend(v19, "deselectRowAtIndexPath:animated:", v6, 1);
  -[WDAtrialFibrillationEventOverviewViewController sectionsToDisplay](self, "sectionsToDisplay");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectAtIndexedSubscript:", objc_msgSend(v6, "section"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "integerValue");

  switch(v9)
  {
    case 0:
      -[WDAtrialFibrillationEventOverviewViewController dataProvider](self, "dataProvider");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "viewControllerForItemAtIndexPath:", v6);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (v11)
        -[WDAtrialFibrillationEventOverviewViewController showAdaptively:sender:](self, "showAdaptively:sender:", v11, self);
      goto LABEL_8;
    case 1:
      v12 = -[WDAtrialFibrillationEventOverviewViewController _pushShowAllViewController](self, "_pushShowAllViewController");
      break;
    case 3:
      -[WDAtrialFibrillationEventOverviewViewController metaDataSection](self, "metaDataSection");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v6, "row");
      -[WDAtrialFibrillationEventOverviewViewController navigationController](self, "navigationController");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "selectCellForIndex:navigationController:animated:", v13, v14, 1);

      goto LABEL_8;
    case 4:
      objc_msgSend(v19, "cellForRowAtIndexPath:", v6);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setFavorited:", objc_msgSend(v11, "isFavorited") ^ 1);
      -[WDAtrialFibrillationEventOverviewViewController setPinned:](self, "setPinned:", objc_msgSend(v11, "isFavorited"));
LABEL_8:

      break;
    case 5:
      -[WDAtrialFibrillationEventOverviewViewController userConfigurationRowsToDisplay](self, "userConfigurationRowsToDisplay");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "objectAtIndexedSubscript:", objc_msgSend(v6, "row"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "integerValue");

      if (v17 == 1)
      {
        -[WDAtrialFibrillationEventOverviewViewController didSelectRegulatoryRow](self, "didSelectRegulatoryRow");
      }
      else if (!v17)
      {
        v18 = -[WDAtrialFibrillationEventOverviewViewController _pushDataSourcesAndAccessController](self, "_pushDataSourcesAndAccessController");
      }
      break;
    case 6:
      -[WDAtrialFibrillationEventOverviewViewController featureStatusCellTappedAtIndexPath:](self, "featureStatusCellTappedAtIndexPath:", v6);
      break;
    default:
      break;
  }

}

- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4
{
  void *v5;
  void *v6;
  uint64_t v7;
  double result;

  -[WDAtrialFibrillationEventOverviewViewController sectionsToDisplay](self, "sectionsToDisplay", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndexedSubscript:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "integerValue");

  result = *MEMORY[0x24BDF7DE0];
  if (!v7)
    return 2.22507386e-308;
  return result;
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  void *v5;
  void *v6;
  uint64_t v7;
  double result;

  -[WDAtrialFibrillationEventOverviewViewController sectionsToDisplay](self, "sectionsToDisplay", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndexedSubscript:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "integerValue");

  result = *MEMORY[0x24BDF7DE0];
  if (v7 == 6)
    return 2.22507386e-308;
  return result;
}

- (id)axidForElementWithString:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = a3;
  objc_msgSend(v3, "healthAccessibilityIdentifier:suffix:", 2, CFSTR("Overview"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringByAppendingFormat:", CFSTR(".%@"), v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)_reloadAtrialFibrillationSetupTableHeaderView
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
  id v18;
  id v19;

  if (self->_detectionState == 5)
  {
    -[WDAtrialFibrillationEventOverviewViewController _atrialFibrillationSetupContainerView](self, "_atrialFibrillationSetupContainerView");
    v19 = (id)objc_claimAutoreleasedReturnValue();
    -[WDAtrialFibrillationEventOverviewViewController tableView](self, "tableView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setTableHeaderView:", v19);

    objc_msgSend(v19, "widthAnchor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[WDAtrialFibrillationEventOverviewViewController tableView](self, "tableView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "widthAnchor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "constraintEqualToAnchor:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setActive:", 1);

    objc_msgSend(v19, "centerXAnchor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[WDAtrialFibrillationEventOverviewViewController tableView](self, "tableView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "centerXAnchor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "constraintEqualToAnchor:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setActive:", 1);

    objc_msgSend(v19, "topAnchor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[WDAtrialFibrillationEventOverviewViewController tableView](self, "tableView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "topAnchor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "constraintEqualToAnchor:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setActive:", 1);

    -[WDAtrialFibrillationEventOverviewViewController tableView](self, "tableView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "tableHeaderView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "layoutIfNeeded");
  }
  else
  {
    v18 = objc_alloc(MEMORY[0x24BDF6F90]);
    -[WDAtrialFibrillationEventOverviewViewController tableView](self, "tableView");
    v19 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "bounds");
    v16 = (void *)objc_msgSend(v18, "initWithFrame:", 0.0, 0.0);
    -[WDAtrialFibrillationEventOverviewViewController tableView](self, "tableView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setTableHeaderView:", v16);
  }

}

- (id)_atrialFibrillationSetupContainerView
{
  id v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  WDAtrialFibrillationDetectionSetupView *v9;

  v3 = objc_alloc(MEMORY[0x24BDF6F90]);
  v4 = *MEMORY[0x24BDBF090];
  v5 = *(double *)(MEMORY[0x24BDBF090] + 8);
  v6 = *(double *)(MEMORY[0x24BDBF090] + 16);
  v7 = *(double *)(MEMORY[0x24BDBF090] + 24);
  v8 = (void *)objc_msgSend(v3, "initWithFrame:", *MEMORY[0x24BDBF090], v5, v6, v7);
  objc_msgSend(v8, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v9 = -[HKOnboardingSetupView initWithFrame:]([WDAtrialFibrillationDetectionSetupView alloc], "initWithFrame:", v4, v5, v6, v7);
  -[HKOnboardingSetupView setDelegate:](v9, "setDelegate:", self);
  objc_msgSend(v8, "addSubview:", v9);
  -[WDAtrialFibrillationDetectionSetupView hk_alignConstraintsWithView:](v9, "hk_alignConstraintsWithView:", v8);

  return v8;
}

- (void)beginOnboardingForOnboardingSetupView:(id)a3
{
  -[WDAtrialFibrillationEventOverviewViewController _startOnboardingForFirstTime:](self, "_startOnboardingForFirstTime:", 1);
}

- (void)launchOnboardingToReenableFeature
{
  -[WDAtrialFibrillationEventOverviewViewController _startOnboardingForFirstTime:](self, "_startOnboardingForFirstTime:", 0);
}

- (void)didCompleteOnboarding
{
  -[WDAtrialFibrillationEventOverviewViewController setOnboardingManager:](self, "setOnboardingManager:", 0);
}

- (void)didDismissOnboarding
{
  -[WDAtrialFibrillationEventOverviewViewController setOnboardingManager:](self, "setOnboardingManager:", 0);
}

- (WDDataListViewControllerDataProvider)dataProvider
{
  return self->_dataProvider;
}

- (void)setDataProvider:(id)a3
{
  objc_storeStrong((id *)&self->_dataProvider, a3);
}

- (int64_t)totalSampleCount
{
  return self->_totalSampleCount;
}

- (void)setTotalSampleCount:(int64_t)a3
{
  self->_totalSampleCount = a3;
}

- (BOOL)firstViewDidLayoutSubviews
{
  return self->_firstViewDidLayoutSubviews;
}

- (void)setFirstViewDidLayoutSubviews:(BOOL)a3
{
  self->_firstViewDidLayoutSubviews = a3;
}

- (HKDisplayType)displayType
{
  return self->_displayType;
}

- (void)setDisplayType:(id)a3
{
  objc_storeStrong((id *)&self->_displayType, a3);
}

- (WDProfile)profile
{
  return self->_profile;
}

- (void)setProfile:(id)a3
{
  objc_storeStrong((id *)&self->_profile, a3);
}

- (int64_t)mode
{
  return self->_mode;
}

- (HRAtrialFibrillationOnboardingManager)onboardingManager
{
  return self->_onboardingManager;
}

- (void)setOnboardingManager:(id)a3
{
  objc_storeStrong((id *)&self->_onboardingManager, a3);
}

- (HKKeyValueDomain)keyValueDomain
{
  return self->_keyValueDomain;
}

- (void)setKeyValueDomain:(id)a3
{
  objc_storeStrong((id *)&self->_keyValueDomain, a3);
}

- (HKFeatureStatusManager)statusManager
{
  return self->_statusManager;
}

- (void)setStatusManager:(id)a3
{
  objc_storeStrong((id *)&self->_statusManager, a3);
}

- (int64_t)detectionState
{
  return self->_detectionState;
}

- (void)setDetectionState:(int64_t)a3
{
  self->_detectionState = a3;
}

- (UITapGestureRecognizer)tripleTapToSettingsRecognizer
{
  return self->_tripleTapToSettingsRecognizer;
}

- (void)setTripleTapToSettingsRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_tripleTapToSettingsRecognizer, a3);
}

- (HKFeatureStatus)featureStatus
{
  return self->_featureStatus;
}

- (void)setFeatureStatus:(id)a3
{
  objc_storeStrong((id *)&self->_featureStatus, a3);
}

- (void)setSectionsToDisplay:(id)a3
{
  objc_storeStrong((id *)&self->_sectionsToDisplay, a3);
}

- (HKDataMetadataSectionProtocol)metaDataSection
{
  return self->_metaDataSection;
}

- (void)setMetaDataSection:(id)a3
{
  objc_storeStrong((id *)&self->_metaDataSection, a3);
}

- (NSDate)latestAnalyzedSampleDate
{
  return self->_latestAnalyzedSampleDate;
}

- (void)setLatestAnalyzedSampleDate:(id)a3
{
  objc_storeStrong((id *)&self->_latestAnalyzedSampleDate, a3);
}

- (int64_t)visibleSampleCount
{
  return self->_visibleSampleCount;
}

- (void)setVisibleSampleCount:(int64_t)a3
{
  self->_visibleSampleCount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_latestAnalyzedSampleDate, 0);
  objc_storeStrong((id *)&self->_metaDataSection, 0);
  objc_storeStrong((id *)&self->_sectionsToDisplay, 0);
  objc_storeStrong((id *)&self->_featureStatus, 0);
  objc_storeStrong((id *)&self->_tripleTapToSettingsRecognizer, 0);
  objc_storeStrong((id *)&self->_statusManager, 0);
  objc_storeStrong((id *)&self->_keyValueDomain, 0);
  objc_storeStrong((id *)&self->_onboardingManager, 0);
  objc_storeStrong((id *)&self->_profile, 0);
  objc_storeStrong((id *)&self->_displayType, 0);
  objc_storeStrong((id *)&self->_dataProvider, 0);
}

void __76__WDAtrialFibrillationEventOverviewViewController_recomputeTotalSampleCount__block_invoke_cold_1(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  OUTLINED_FUNCTION_2_0(a1, a2);
  v3 = (void *)OUTLINED_FUNCTION_2();
  v4 = OUTLINED_FUNCTION_0_0(v3);
  OUTLINED_FUNCTION_0(&dword_215814000, v5, v6, "%{public}@: Error counting heart event samples: %{public}@", v7, v8, v9, v10, v11);

  OUTLINED_FUNCTION_1();
}

void __79__WDAtrialFibrillationEventOverviewViewController__getLatestAnalyzedSampleDate__block_invoke_cold_1(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  OUTLINED_FUNCTION_2_0(a1, a2);
  v3 = (void *)OUTLINED_FUNCTION_2();
  v4 = OUTLINED_FUNCTION_0_0(v3);
  OUTLINED_FUNCTION_0(&dword_215814000, v5, v6, "%{public}@: Error loading latest analyzed sample time: %{public}@", v7, v8, v9, v10, v11);

  OUTLINED_FUNCTION_1();
}

- (void)_atrialFibrillationDetectionRescindedHeaderView
{
  void *v1;
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_5(a1);
  v2 = (void *)OUTLINED_FUNCTION_9();
  v3 = OUTLINED_FUNCTION_7(v2);
  OUTLINED_FUNCTION_4(&dword_215814000, v4, v5, "[%{public}@]: Asked to configure rescinded header view, but IRN is not rescinded", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_8();
}

@end
