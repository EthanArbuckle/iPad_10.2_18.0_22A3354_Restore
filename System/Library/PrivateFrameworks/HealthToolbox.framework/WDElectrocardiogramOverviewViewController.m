@implementation WDElectrocardiogramOverviewViewController

- (WDElectrocardiogramOverviewViewController)initWithDisplayType:(id)a3 profile:(id)a4 mode:(int64_t)a5
{
  id v9;
  id v10;
  WDElectrocardiogramOverviewViewController *v11;
  WDElectrocardiogramOverviewViewController *v12;
  id *p_displayType;
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  WDElectrocardiogramListDataProvider *dataProvider;
  WDElectrocardiogramFilterDataProvider *v19;
  WDElectrocardiogramFilterDataProvider *filterDataProvider;
  id v21;
  void *v22;
  _BOOL8 v23;
  void *v24;
  uint64_t v25;
  HKDataMetadataSectionProtocol *educationSection;
  HKElectrocardiogramMoreHealthDataProvider *v27;
  HKElectrocardiogramMoreHealthDataProvider *moreHealthDataProvider;
  void *v29;
  void *v30;
  void *v31;
  NSObject *v32;
  NSObject *v33;
  void *v34;
  id v35;
  void *v36;
  id v37;
  uint64_t v38;
  void *v39;
  void *v40;
  uint64_t v41;
  HKFeatureStatusManager *featureStatusManager;
  void *v43;
  uint64_t v44;
  UITapGestureRecognizer *tripleTapToSettingsRecognizer;
  void *v46;
  void *v47;
  HKFeatureStatusManager *v48;
  uint64_t v49;
  id v50;
  HKFeatureStatus *featureStatus;
  os_log_t *v52;
  os_log_t v53;
  os_log_t v54;
  NSObject *v55;
  void *v56;
  id v57;
  int v59;
  id v60;
  id v61;
  objc_super v62;
  uint8_t buf[4];
  void *v64;
  __int16 v65;
  void *v66;
  uint64_t v67;

  v67 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a4;
  v62.receiver = self;
  v62.super_class = (Class)WDElectrocardiogramOverviewViewController;
  v11 = -[WDElectrocardiogramOverviewViewController initWithStyle:](&v62, sel_initWithStyle_, 1);
  v12 = v11;
  if (v11)
  {
    v60 = v9;
    v11->_firstViewDidLayoutSubviews = 1;
    p_displayType = (id *)&v11->_displayType;
    objc_storeStrong((id *)&v11->_displayType, a3);
    v14 = objc_storeWeak((id *)&v12->_profile, v10);
    v59 = a5;
    v12->_mode = a5;
    v15 = *p_displayType;
    v16 = v14;
    -[WDElectrocardiogramOverviewViewController createDataProviderWithDisplayType:profile:mode:](v12, "createDataProviderWithDisplayType:profile:mode:", v15, v10, v12->_mode);
    v17 = objc_claimAutoreleasedReturnValue();
    dataProvider = v12->_dataProvider;
    v12->_dataProvider = (WDElectrocardiogramListDataProvider *)v17;

    v12->_placeholderCellCount = 3;
    v19 = -[WDElectrocardiogramFilterDataProvider initWithProfile:delegate:]([WDElectrocardiogramFilterDataProvider alloc], "initWithProfile:delegate:", v10, v12);
    filterDataProvider = v12->_filterDataProvider;
    v12->_filterDataProvider = v19;

    v21 = objc_alloc(MEMORY[0x24BE4C098]);
    objc_msgSend(v10, "healthStore");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = v12->_mode == 0;
    -[WDElectrocardiogramListDataProvider activeECGAlgorithmVersion](v12->_dataProvider, "activeECGAlgorithmVersion");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v21, "initWithHealthStore:forSinglePlayer:activeAlgorithmVersion:", v22, v23, v24);
    educationSection = v12->_educationSection;
    v12->_educationSection = (HKDataMetadataSectionProtocol *)v25;

    v27 = (HKElectrocardiogramMoreHealthDataProvider *)objc_alloc_init(MEMORY[0x24BE4A608]);
    moreHealthDataProvider = v12->_moreHealthDataProvider;
    v12->_moreHealthDataProvider = v27;

    HKPreferredRegulatoryDomainProvider();
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "currentEstimate");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    _HKInitializeLogging();
    v31 = (void *)*MEMORY[0x24BDD3010];
    v32 = *MEMORY[0x24BDD3010];
    if (v30)
    {
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      {
        v33 = v31;
        v34 = (void *)objc_opt_class();
        v35 = v34;
        objc_msgSend(v30, "ISOCode");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v64 = v34;
        v65 = 2112;
        v66 = v36;
        _os_log_impl(&dword_215814000, v33, OS_LOG_TYPE_DEFAULT, "[%{public}@] Region code: %@", buf, 0x16u);

      }
    }
    else if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      -[WDElectrocardiogramOverviewViewController initWithDisplayType:profile:mode:].cold.2(v31);
    }
    v37 = objc_alloc(MEMORY[0x24BDD3BF8]);
    v38 = *MEMORY[0x24BDD2DE0];
    objc_msgSend(v10, "healthStore");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "ISOCode");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = objc_msgSend(v37, "initWithFeatureIdentifier:healthStore:currentCountryCode:", v38, v39, v40);
    featureStatusManager = v12->_featureStatusManager;
    v12->_featureStatusManager = (HKFeatureStatusManager *)v41;

    v12->_displayAboutRowBeforeOnboarding = -[WDElectrocardiogramOverviewViewController _shouldDisplayAboutRowBeforeOnboarding](v12, "_shouldDisplayAboutRowBeforeOnboarding");
    objc_msgSend(MEMORY[0x24BDD4198], "sharedBehavior");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v38) = objc_msgSend(v43, "isAppleInternalInstall");

    if ((_DWORD)v38)
    {
      v44 = objc_msgSend(objc_alloc(MEMORY[0x24BDF6E80]), "initWithTarget:action:", v12, sel_showInternalSettings);
      tripleTapToSettingsRecognizer = v12->_tripleTapToSettingsRecognizer;
      v12->_tripleTapToSettingsRecognizer = (UITapGestureRecognizer *)v44;

    }
    objc_msgSend(*p_displayType, "localization");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "displayName");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    -[WDElectrocardiogramOverviewViewController setTitle:](v12, "setTitle:", v47);

    v48 = v12->_featureStatusManager;
    v61 = 0;
    -[HKFeatureStatusManager featureStatusWithError:](v48, "featureStatusWithError:", &v61);
    v49 = objc_claimAutoreleasedReturnValue();
    v50 = v61;
    featureStatus = v12->_featureStatus;
    v12->_featureStatus = (HKFeatureStatus *)v49;

    v52 = (os_log_t *)MEMORY[0x24BDD3010];
    if (!v12->_featureStatus)
    {
      _HKInitializeLogging();
      v53 = *v52;
      if (os_log_type_enabled(*v52, OS_LOG_TYPE_ERROR))
        -[WDElectrocardiogramOverviewViewController initWithDisplayType:profile:mode:].cold.1(v53, (uint64_t)v12, (uint64_t)v50);
    }
    -[HKFeatureStatusManager registerObserver:](v12->_featureStatusManager, "registerObserver:", v12);
    _HKInitializeLogging();
    v54 = *v52;
    if (os_log_type_enabled(*v52, OS_LOG_TYPE_DEFAULT))
    {
      v55 = v54;
      v56 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138543618;
      v64 = v56;
      v65 = 1024;
      LODWORD(v66) = v59;
      v57 = v56;
      _os_log_impl(&dword_215814000, v55, OS_LOG_TYPE_DEFAULT, "[%{public}@] Initialized with mode: %i", buf, 0x12u);

    }
    v9 = v60;
  }

  return v12;
}

- (void)dealloc
{
  objc_super v3;

  -[HKFeatureStatusManager unregisterObserver:](self->_featureStatusManager, "unregisterObserver:", self);
  v3.receiver = self;
  v3.super_class = (Class)WDElectrocardiogramOverviewViewController;
  -[WDElectrocardiogramOverviewViewController dealloc](&v3, sel_dealloc);
}

- (id)createDataProviderWithDisplayType:(id)a3 profile:(id)a4 mode:(int64_t)a5
{
  id v7;
  id v8;
  WDElectrocardiogramListDataProvider *v9;

  v7 = a4;
  v8 = a3;
  v9 = -[WDElectrocardiogramListDataProvider initWithDisplayType:profile:mode:]([WDElectrocardiogramListDataProvider alloc], "initWithDisplayType:profile:mode:", v8, v7, a5);

  -[WDElectrocardiogramListDataProvider setRecentSampleLimit:](v9, "setRecentSampleLimit:", 3);
  return v9;
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
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  void (*v32)(uint64_t);
  void *v33;
  id v34;
  id location;
  objc_super v36;
  _QWORD v37[2];

  v37[1] = *MEMORY[0x24BDAC8D0];
  v36.receiver = self;
  v36.super_class = (Class)WDElectrocardiogramOverviewViewController;
  -[HKTableViewController viewDidLoad](&v36, sel_viewDidLoad);
  -[WDElectrocardiogramOverviewViewController navigationItem](self, "navigationItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setLargeTitleDisplayMode:", 2);

  -[WDElectrocardiogramOverviewViewController dataProvider](self, "dataProvider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDElectrocardiogramOverviewViewController tableView](self, "tableView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "customizeTableView:", v5);

  -[WDElectrocardiogramOverviewViewController dataProvider](self, "dataProvider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v5) = objc_msgSend(v6, "cellStyle") == 2;

  if ((_DWORD)v5)
  {
    -[WDElectrocardiogramOverviewViewController dataProvider](self, "dataProvider");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "customEstimatedCellHeight");
    v9 = v8;
    -[WDElectrocardiogramOverviewViewController tableView](self, "tableView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setEstimatedRowHeight:", v9);

    -[WDElectrocardiogramOverviewViewController dataProvider](self, "dataProvider");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "customCellHeight");
    v13 = v12;
    -[WDElectrocardiogramOverviewViewController tableView](self, "tableView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setRowHeight:", v13);

  }
  -[WDElectrocardiogramOverviewViewController tableView](self, "tableView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setEstimatedSectionHeaderHeight:", 100.0);

  -[WDElectrocardiogramOverviewViewController tableView](self, "tableView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setSectionHeaderHeight:", *MEMORY[0x24BDF7DE0]);

  -[WDElectrocardiogramOverviewViewController tableView](self, "tableView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "_setSectionContentInsetFollowsLayoutMargins:", 1);

  -[WDElectrocardiogramOverviewViewController tableView](self, "tableView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "_setSectionCornerRadius:", *MEMORY[0x24BE4A250]);

  -[WDElectrocardiogramOverviewViewController tableView](self, "tableView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setSelfSizingInvalidation:", 2);

  -[WDElectrocardiogramOverviewViewController tableView](self, "tableView");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_opt_class();
  +[WDHeartRhythmHeaderView defaultReuseIdentifier](WDHeartRhythmHeaderView, "defaultReuseIdentifier");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "registerClass:forHeaderFooterViewReuseIdentifier:", v21, v22);

  -[WDElectrocardiogramOverviewViewController tableView](self, "tableView");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_opt_class();
  +[WDHeartRhythmSectionHeaderView defaultReuseIdentifier](WDHeartRhythmSectionHeaderView, "defaultReuseIdentifier");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "registerClass:forHeaderFooterViewReuseIdentifier:", v24, v25);

  -[WDElectrocardiogramOverviewViewController _reloadElectrocardiogramSetupTableHeaderView](self, "_reloadElectrocardiogramSetupTableHeaderView");
  objc_initWeak(&location, self);
  -[WDElectrocardiogramOverviewViewController dataProvider](self, "dataProvider");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = MEMORY[0x24BDAC760];
  v31 = 3221225472;
  v32 = __56__WDElectrocardiogramOverviewViewController_viewDidLoad__block_invoke;
  v33 = &unk_24D38CFD8;
  objc_copyWeak(&v34, &location);
  objc_msgSend(v26, "startCollectingDataWithUpdateHandler:", &v30);

  objc_msgSend(MEMORY[0x24BE4C0C8], "sharedManager", v30, v31, v32, v33);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "trackElectrocardiogramDataTypeViewed");
  v37[0] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v37, 1);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = (id)-[WDElectrocardiogramOverviewViewController registerForTraitChanges:withTarget:action:](self, "registerForTraitChanges:withTarget:action:", v28, self, sel_widthDesignationDidChangeWithTraitEnvironment_previousTraitCollection_);

  objc_destroyWeak(&v34);
  objc_destroyWeak(&location);
}

void __56__WDElectrocardiogramOverviewViewController_viewDidLoad__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "setPlaceholderCellCount:", 0);
    objc_msgSend(v3, "tableView");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "reloadData");

    WeakRetained = v3;
  }

}

- (void)viewDidAppear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v12;

  v3 = a3;
  -[WDElectrocardiogramOverviewViewController filterDataProvider](self, "filterDataProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "start");

  objc_msgSend(MEMORY[0x24BDD4198], "sharedBehavior");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isAppleInternalInstall");

  if (v7)
  {
    -[WDElectrocardiogramOverviewViewController tripleTapToSettingsRecognizer](self, "tripleTapToSettingsRecognizer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setNumberOfTapsRequired:", 3);

    -[WDElectrocardiogramOverviewViewController navigationController](self, "navigationController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "navigationBar");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[WDElectrocardiogramOverviewViewController tripleTapToSettingsRecognizer](self, "tripleTapToSettingsRecognizer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addGestureRecognizer:", v11);

  }
  v12.receiver = self;
  v12.super_class = (Class)WDElectrocardiogramOverviewViewController;
  -[WDElectrocardiogramOverviewViewController viewDidAppear:](&v12, sel_viewDidAppear_, v3);
}

- (void)viewDidDisappear:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)WDElectrocardiogramOverviewViewController;
  -[WDElectrocardiogramOverviewViewController viewDidDisappear:](&v9, sel_viewDidDisappear_, a3);
  -[WDElectrocardiogramOverviewViewController tripleTapToSettingsRecognizer](self, "tripleTapToSettingsRecognizer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[WDElectrocardiogramOverviewViewController navigationController](self, "navigationController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "navigationBar");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[WDElectrocardiogramOverviewViewController tripleTapToSettingsRecognizer](self, "tripleTapToSettingsRecognizer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeGestureRecognizer:", v7);

  }
  -[WDElectrocardiogramOverviewViewController filterDataProvider](self, "filterDataProvider");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stop");

}

- (void)viewDidLayoutSubviews
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)WDElectrocardiogramOverviewViewController;
  -[WDElectrocardiogramOverviewViewController viewDidLayoutSubviews](&v6, sel_viewDidLayoutSubviews);
  if (-[WDElectrocardiogramOverviewViewController firstViewDidLayoutSubviews](self, "firstViewDidLayoutSubviews"))
  {
    -[WDElectrocardiogramOverviewViewController setFirstViewDidLayoutSubviews:](self, "setFirstViewDidLayoutSubviews:", 0);
    -[WDElectrocardiogramOverviewViewController tableView](self, "tableView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "tableHeaderView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[WDElectrocardiogramOverviewViewController tableView](self, "tableView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setTableHeaderView:", v4);

  }
}

- (void)viewIsAppearing:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)WDElectrocardiogramOverviewViewController;
  -[WDElectrocardiogramOverviewViewController viewIsAppearing:](&v5, sel_viewIsAppearing_, a3);
  -[WDElectrocardiogramOverviewViewController traitCollection](self, "traitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDElectrocardiogramOverviewViewController updateMarginsForWidthDesignation:](self, "updateMarginsForWidthDesignation:", -[WDElectrocardiogramOverviewViewController widthDesignationFromTraitCollection:](self, "widthDesignationFromTraitCollection:", v4));

}

- (void)showInternalSettings
{
  WDElectrocardiogramInternalSettingsViewController *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  WDElectrocardiogramInternalSettingsViewController *v8;

  v3 = [WDElectrocardiogramInternalSettingsViewController alloc];
  -[WDElectrocardiogramOverviewViewController profile](self, "profile");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "healthStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDElectrocardiogramOverviewViewController profile](self, "profile");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dateCache");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[WDElectrocardiogramInternalSettingsViewController initWithHealthStore:dateCache:](v3, "initWithHealthStore:dateCache:", v5, v7);

  -[WDElectrocardiogramOverviewViewController showAdaptively:sender:](self, "showAdaptively:sender:", v8, self);
}

- (double)adjustedSafeAreaInsetTop
{
  void *v2;
  double v3;
  double v4;

  -[WDElectrocardiogramOverviewViewController view](self, "view");
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

  -[WDElectrocardiogramOverviewViewController tableView](self, "tableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDElectrocardiogramOverviewViewController adjustedSafeAreaInsetTop](self, "adjustedSafeAreaInsetTop");
  objc_msgSend(v3, "setContentOffset:animated:", 0, 0.0, -v4);

  -[WDElectrocardiogramOverviewViewController tableView](self, "tableView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "reloadData");

  -[WDElectrocardiogramOverviewViewController tableView](self, "tableView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "layoutIfNeeded");

  -[WDElectrocardiogramOverviewViewController tableView](self, "tableView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDElectrocardiogramOverviewViewController adjustedSafeAreaInsetTop](self, "adjustedSafeAreaInsetTop");
  objc_msgSend(v7, "setContentOffset:animated:", 0, 0.0, -v8);

  -[WDElectrocardiogramOverviewViewController tableView](self, "tableView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD15E0], "indexSetWithIndex:", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "reloadSections:withRowAnimation:", v10, 5);

  -[WDElectrocardiogramOverviewViewController _reloadElectrocardiogramSetupTableHeaderView](self, "_reloadElectrocardiogramSetupTableHeaderView");
}

- (void)featureStatusProviding:(id)a3 didUpdateFeatureStatus:(id)a4
{
  id v5;
  void *v6;
  NSObject *v7;
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;
  uint8_t buf[4];
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  _HKInitializeLogging();
  v6 = (void *)*MEMORY[0x24BDD3010];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3010], OS_LOG_TYPE_DEFAULT))
  {
    v7 = v6;
    *(_DWORD *)buf = 138543362;
    v13 = (id)objc_opt_class();
    v8 = v13;
    _os_log_impl(&dword_215814000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] Did update feature status.", buf, 0xCu);

  }
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __91__WDElectrocardiogramOverviewViewController_featureStatusProviding_didUpdateFeatureStatus___block_invoke;
  v10[3] = &unk_24D38CEC0;
  v10[4] = self;
  v11 = v5;
  v9 = v5;
  dispatch_async(MEMORY[0x24BDAC9B8], v10);

}

void __91__WDElectrocardiogramOverviewViewController_featureStatusProviding_didUpdateFeatureStatus___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  id v5;
  void *v6;
  char v7;
  uint8_t v8[24];
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "availabilityStateCache");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "setAvailabilityStateCache:", 0);
    _HKInitializeLogging();
    v3 = (void *)*MEMORY[0x24BDD3010];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3010], OS_LOG_TYPE_DEFAULT))
    {
      v4 = v3;
      *(_DWORD *)v8 = 138543362;
      *(_QWORD *)&v8[4] = objc_opt_class();
      v5 = *(id *)&v8[4];
      _os_log_impl(&dword_215814000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] Availabilility cache invalidated.", v8, 0xCu);

    }
  }
  objc_msgSend(*(id *)(a1 + 32), "featureStatus", *(_OWORD *)v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqual:", *(_QWORD *)(a1 + 40));

  if ((v7 & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "setFeatureStatus:", *(_QWORD *)(a1 + 40));
    objc_msgSend(*(id *)(a1 + 32), "_reloadTableViewAndScrollToTop");
  }
}

- (void)widthDesignationDidChangeWithTraitEnvironment:(id)a3 previousTraitCollection:(id)a4
{
  void *v5;
  int64_t v6;

  objc_msgSend(a3, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[WDElectrocardiogramOverviewViewController widthDesignationFromTraitCollection:](self, "widthDesignationFromTraitCollection:", v5);

  -[WDElectrocardiogramOverviewViewController updateMarginsForWidthDesignation:](self, "updateMarginsForWidthDesignation:", v6);
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
  -[WDElectrocardiogramOverviewViewController tableView](self, "tableView");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setDirectionalLayoutMargins:", v5, v7, v9, v11);

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
  uint64_t v13;
  id v14;

  v3 = a3;
  v5 = objc_alloc(MEMORY[0x24BE4C0A0]);
  -[WDElectrocardiogramOverviewViewController profile](self, "profile");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "healthStore");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDElectrocardiogramOverviewViewController profile](self, "profile");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "dateCache");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v13) = 1;
  v10 = (void *)objc_msgSend(v5, "initWithOnboardingType:isFirstTimeOnboarding:healthStore:dateCache:provenance:delegate:isSampleInteractive:", 0, v3, v7, v9, 2, self, v13);
  -[WDElectrocardiogramOverviewViewController setOnboardingManager:](self, "setOnboardingManager:", v10);

  -[WDElectrocardiogramOverviewViewController onboardingManager](self, "onboardingManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "onboardingNavigationController");
  v14 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "setModalInPresentation:", 1);
  -[WDElectrocardiogramOverviewViewController navigationController](self, "navigationController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "presentViewController:animated:completion:", v14, 1, 0);

}

- (void)_startUpgrade
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;

  v3 = objc_alloc(MEMORY[0x24BE4C0A0]);
  -[WDElectrocardiogramOverviewViewController profile](self, "profile");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "healthStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDElectrocardiogramOverviewViewController profile](self, "profile");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dateCache");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v11) = 1;
  v8 = (void *)objc_msgSend(v3, "initWithOnboardingType:isFirstTimeOnboarding:healthStore:dateCache:provenance:delegate:isSampleInteractive:", 1, 0, v5, v7, 2, self, v11);
  -[WDElectrocardiogramOverviewViewController setOnboardingManager:](self, "setOnboardingManager:", v8);

  -[WDElectrocardiogramOverviewViewController onboardingManager](self, "onboardingManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "onboardingNavigationController");
  v12 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "setModalInPresentation:", 1);
  -[WDElectrocardiogramOverviewViewController navigationController](self, "navigationController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "presentViewController:animated:completion:", v12, 1, 0);

}

- (WDElectrocardiogramOverviewSectionInfo)sectionInfo
{
  void *v5;
  uint64_t v6;
  int64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  int64_t mode;
  BOOL v12;
  int64_t v13;
  int64_t v14;
  uint64_t v15;
  BOOL v16;
  int64_t v17;
  int64_t v18;
  int64_t v19;
  BOOL v20;
  int64_t v21;
  int64_t v22;
  WDElectrocardiogramOverviewSectionInfo *result;
  int64_t v24;
  int64_t v25;
  BOOL v26;
  int64_t v27;
  int64_t v28;
  int64_t v29;
  BOOL v30;
  int64_t v31;
  int64_t v32;
  uint64_t v33;
  int64_t v34;
  int64_t v35;
  int64_t v36;
  BOOL v37;
  int64_t v38;
  int64_t v39;
  int64_t v40;
  int64_t v41;
  BOOL v42;
  int64_t v43;
  BOOL v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;

  *(_OWORD *)&retstr->var4 = 0u;
  *(_OWORD *)&retstr->var6 = 0u;
  *(_OWORD *)&retstr->var0 = 0u;
  *(_OWORD *)&retstr->var2 = 0u;
  -[WDElectrocardiogramOverviewViewController dataProvider](self, "dataProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "numberOfSections");

  v7 = -[WDElectrocardiogramOverviewViewController placeholderCellCount](self, "placeholderCellCount");
  -[WDElectrocardiogramOverviewViewController moreHealthDataProvider](self, "moreHealthDataProvider");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");

  -[WDElectrocardiogramOverviewViewController filterDataProvider](self, "filterDataProvider");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  mode = self->_mode;
  if (!mode)
  {
    result = -[WDElectrocardiogramOverviewViewController availabilityState](self, "availabilityState");
    switch((unint64_t)result)
    {
      case 0uLL:
      case 3uLL:
        if (v6)
          v26 = 0;
        else
          v26 = v7 <= 0;
        v27 = !v26;
        if (v26)
          v28 = -1;
        else
          v28 = 0;
        v29 = 1;
        if ((_DWORD)v27)
          v29 = 2;
        if (!v10)
        {
          v29 = v27;
          v27 = -1;
        }
        retstr->var0 = v28;
        retstr->var1 = v27;
        retstr->var2 = v29;
        retstr->var3 = v29 + 1;
        v30 = v9 <= 0;
        if (v9 <= 0)
          v31 = v29 + 2;
        else
          v31 = v29 + 3;
        if (v30)
          v32 = -1;
        else
          v32 = v29 + 2;
        retstr->var4 = v32;
        retstr->var5 = v31;
        result = -[WDElectrocardiogramOverviewViewController userConfigurationRowInfo](self, "userConfigurationRowInfo");
        v33 = v47;
        goto LABEL_79;
      case 1uLL:
        v34 = v6 != 0;
        if (v6)
          v35 = 0;
        else
          v35 = -1;
        v36 = 1;
        if (v6)
          v36 = 2;
        if (!v10)
        {
          v36 = v6 != 0;
          v34 = -1;
        }
        retstr->var0 = v35;
        retstr->var1 = v34;
        retstr->var2 = -1;
        retstr->var3 = v36;
        v37 = v9 <= 0;
        if (v9 <= 0)
          v31 = v36 + 1;
        else
          v31 = v36 + 2;
        if (v37)
          v38 = -1;
        else
          v38 = v36 + 1;
        retstr->var4 = v38;
        retstr->var5 = v31;
        result = -[WDElectrocardiogramOverviewViewController userConfigurationRowInfo](self, "userConfigurationRowInfo");
        v33 = v46;
        goto LABEL_79;
      case 2uLL:
        v39 = v6 != 0;
        if (v6)
          v40 = 0;
        else
          v40 = -1;
        v41 = 1;
        if (v6)
          v41 = 2;
        if (!v10)
        {
          v41 = v6 != 0;
          v39 = -1;
        }
        retstr->var0 = v40;
        retstr->var1 = v39;
        retstr->var2 = -1;
        retstr->var3 = v41;
        v42 = v9 <= 0;
        if (v9 <= 0)
          v31 = v41 + 1;
        else
          v31 = v41 + 2;
        if (v42)
          v43 = -1;
        else
          v43 = v41 + 1;
        retstr->var4 = v43;
        retstr->var5 = v31;
        result = -[WDElectrocardiogramOverviewViewController userConfigurationRowInfo](self, "userConfigurationRowInfo");
        v33 = v45;
LABEL_79:
        v44 = v33 <= 0;
        if (v33 <= 0)
          v24 = v31 + 1;
        else
          v24 = v31 + 2;
        if (v44)
          v25 = -1;
        else
          v25 = v31 + 1;
        goto LABEL_85;
      default:
        return result;
    }
  }
  if (v6)
    v12 = 0;
  else
    v12 = v7 <= 0;
  v13 = !v12;
  if (v12)
    v14 = -1;
  else
    v14 = 0;
  v15 = 1;
  if ((_DWORD)v13)
    v15 = 2;
  v16 = mode == 1;
  if (mode == 1)
    v17 = v15;
  else
    v17 = v13;
  if (!v16)
    v13 = -1;
  retstr->var0 = v14;
  retstr->var1 = v13;
  v18 = v17 + 2;
  retstr->var2 = v17;
  retstr->var3 = v17 + 1;
  v19 = v17 + 3;
  v20 = v9 <= 0;
  if (v9 <= 0)
    v21 = v18;
  else
    v21 = v19;
  if (v20)
    v22 = -1;
  else
    v22 = v18;
  retstr->var4 = v22;
  retstr->var5 = -1;
  result = -[WDElectrocardiogramOverviewViewController userConfigurationRowInfo](self, "userConfigurationRowInfo");
  if (v48 <= 0)
    v24 = v21;
  else
    v24 = v21 + 1;
  if (v48 <= 0)
    v25 = -1;
  else
    v25 = v21;
LABEL_85:
  retstr->var6 = v25;
  retstr->var7 = v24;
  return result;
}

- (WDElectrocardiogramOverviewUserConfigurationRowInfo)userConfigurationRowInfo
{
  int64_t var0;
  WDElectrocardiogramOverviewUserConfigurationRowInfo *v5;
  int64_t v6;
  int v7;
  BOOL v8;

  retstr->var0 = 0;
  retstr->var1 = 0;
  retstr->var2 = 0;
  var0 = self[44].var0;
  if (var0 == 1)
  {
    v6 = -1;
LABEL_6:
    retstr->var0 = v6;
    retstr->var2 = var0;
  }
  else if (var0 != 2)
  {
    v5 = self;
    self = (WDElectrocardiogramOverviewUserConfigurationRowInfo *)-[WDElectrocardiogramOverviewUserConfigurationRowInfo availabilityState](self, "availabilityState");
    switch((unint64_t)self)
    {
      case 0uLL:
      case 3uLL:
        retstr->var1 = 0;
        var0 = 2;
        v6 = 1;
        goto LABEL_6;
      case 1uLL:
        v7 = BYTE1(v5[42].var2);
        retstr->var1 = 0;
        v8 = v7 == 0;
        if (v7)
          v6 = 1;
        else
          v6 = -1;
        var0 = 1;
        if (!v8)
          var0 = 2;
        goto LABEL_6;
      case 2uLL:
        retstr->var1 = 0;
        v6 = -1;
        var0 = 1;
        goto LABEL_6;
      default:
        return self;
    }
  }
  return self;
}

- (int64_t)availabilityState
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v10;

  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hk_keyExists:", CFSTR("WDCinnamonOnboardingStateOverrideKey"));

  if (v4)
  {
    objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "integerForKey:", CFSTR("WDCinnamonOnboardingStateOverrideKey"));
LABEL_5:
    v8 = (void *)v6;
    goto LABEL_6;
  }
  -[WDElectrocardiogramOverviewViewController availabilityStateCache](self, "availabilityStateCache");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[WDElectrocardiogramOverviewViewController availabilityStateCache](self, "availabilityStateCache");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "integerValue");
    goto LABEL_5;
  }
  -[WDElectrocardiogramOverviewViewController featureStatus](self, "featureStatus");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
    return (int64_t)v8;
  -[WDElectrocardiogramOverviewViewController featureStatus](self, "featureStatus");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)HKElectrocardiogramOverviewAvailabilityState(v10);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDElectrocardiogramOverviewViewController setAvailabilityStateCache:](self, "setAvailabilityStateCache:", v5);
LABEL_6:

  return (int64_t)v8;
}

- (BOOL)shouldShowRecordingRescindedHeader
{
  int64_t v3;

  if (-[WDElectrocardiogramOverviewViewController availabilityState](self, "availabilityState") == 2)
  {
    LOBYTE(v3) = 0;
  }
  else
  {
    v3 = -[WDElectrocardiogramOverviewViewController _electrocardiogramRecordingRescindedStatus](self, "_electrocardiogramRecordingRescindedStatus");
    if (v3)
      LOBYTE(v3) = -[WDElectrocardiogramOverviewViewController mode](self, "mode") == 0;
  }
  return v3;
}

- (BOOL)isPinned
{
  return 0;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  int64_t v4;

  -[WDElectrocardiogramOverviewViewController sectionInfo](self, "sectionInfo", a3);
  return v4;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  void *v6;
  int64_t v7;
  int64_t v9;

  -[WDElectrocardiogramOverviewViewController sectionInfo](self, "sectionInfo", a3);
  if (a4)
    return 0;
  -[WDElectrocardiogramOverviewViewController dataProvider](self, "dataProvider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "numberOfObjectsForSection:", 0);

  if (-[WDElectrocardiogramOverviewViewController mode](self, "mode") == 2 && v7 > 5)
    return 6;
  v9 = -[WDElectrocardiogramOverviewViewController placeholderCellCount](self, "placeholderCellCount");
  if (v9 <= v7)
    return v7;
  else
    return v9;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  int64_t v12;

  v6 = a3;
  v7 = a4;
  -[WDElectrocardiogramOverviewViewController sectionInfo](self, "sectionInfo");
  if (!objc_msgSend(v7, "section"))
  {
    if (-[WDElectrocardiogramOverviewViewController mode](self, "mode") == 2 && objc_msgSend(v7, "row") == 5)
    {
      -[WDElectrocardiogramOverviewViewController _showAllResultsForSummarySharingProfile](self, "_showAllResultsForSummarySharingProfile");
      v8 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[WDElectrocardiogramOverviewViewController _cellForSampleAtIndex:section:](self, "_cellForSampleAtIndex:section:", objc_msgSend(v7, "row"), objc_msgSend(v7, "section"));
      v8 = (id)objc_claimAutoreleasedReturnValue();
    }
    goto LABEL_9;
  }
  if (objc_msgSend(v7, "section"))
  {
    if (!objc_msgSend(v7, "section"))
    {
      -[WDElectrocardiogramOverviewViewController educationSection](self, "educationSection");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "cellForIndex:tableView:", objc_msgSend(v7, "row"), v6);
      v11 = objc_claimAutoreleasedReturnValue();
LABEL_20:
      v9 = (void *)v11;

      goto LABEL_21;
    }
    if (objc_msgSend(v7, "section"))
    {
      if (!objc_msgSend(v7, "section"))
      {
        -[WDElectrocardiogramOverviewViewController moreHealthDataProvider](self, "moreHealthDataProvider");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "cellForRow:tableView:", objc_msgSend(v7, "row"), v6);
        v11 = objc_claimAutoreleasedReturnValue();
        goto LABEL_20;
      }
      if (objc_msgSend(v7, "section"))
      {
        if (!objc_msgSend(v7, "section"))
        {
          -[WDElectrocardiogramOverviewViewController userConfigurationRowInfo](self, "userConfigurationRowInfo");
          if (!objc_msgSend(v7, "row"))
          {
            -[WDElectrocardiogramOverviewViewController _cellForDataSourcesAndAccess](self, "_cellForDataSourcesAndAccess");
            v8 = (id)objc_claimAutoreleasedReturnValue();
            goto LABEL_9;
          }
          if (!objc_msgSend(v7, "row"))
          {
            -[WDElectrocardiogramOverviewViewController _cellForRegulatoryPane](self, "_cellForRegulatoryPane");
            v8 = (id)objc_claimAutoreleasedReturnValue();
            goto LABEL_9;
          }
        }
        v8 = objc_alloc_init(MEMORY[0x24BDF6E60]);
        goto LABEL_9;
      }
      -[WDElectrocardiogramOverviewViewController _cellForFavorites](self, "_cellForFavorites");
      v8 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[WDElectrocardiogramOverviewViewController _cellForDescription](self, "_cellForDescription");
      v8 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    if (!self->_mode)
    {
      v12 = -[WDElectrocardiogramOverviewViewController availabilityState](self, "availabilityState");
      if ((unint64_t)(v12 - 1) < 2 || v12 != 3 && v12)
      {
        +[WDElectrocardiogramFilterDataProvider cellTitleForType:](WDElectrocardiogramFilterDataProvider, "cellTitleForType:", 0);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[WDElectrocardiogramOverviewViewController _cellWithDisclosureIndicatorAndText:value:](self, "_cellWithDisclosureIndicatorAndText:value:", v10, 0);
        v11 = objc_claimAutoreleasedReturnValue();
        goto LABEL_20;
      }
    }
    -[WDElectrocardiogramOverviewViewController _showAllResultsCellForType:](self, "_showAllResultsCellForType:", -[WDElectrocardiogramOverviewViewController _filterTypeForDataSectionRow:](self, "_filterTypeForDataSectionRow:", objc_msgSend(v7, "row")));
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
LABEL_9:
  v9 = v8;
LABEL_21:

  return v9;
}

- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4
{
  void *v5;
  void *v6;
  void *v7;

  -[WDElectrocardiogramOverviewViewController sectionInfo](self, "sectionInfo", a3, 0, 0, 0, 0, 0);
  if (a4)
    return 0;
  WDBundle();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("PINNED_SECTION_FOOTER"), &stru_24D38E7C8, CFSTR("WellnessDashboard-Localizable-Cinnamon"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  HKConditionallyRedactedHeartRhythmString();
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  void *v12;
  uint64_t v14;

  v6 = a3;
  if (a4
    || !-[WDElectrocardiogramOverviewViewController shouldShowRecordingRescindedHeader](self, "shouldShowRecordingRescindedHeader"))
  {
    -[WDElectrocardiogramOverviewViewController sectionInfo](self, "sectionInfo", 0);
    if (v14 == a4)
    {
      if (-[WDElectrocardiogramOverviewViewController mode](self, "mode") == 2)
      {
        WDBundle();
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = v8;
        v10 = CFSTR("RECENT_RESULTS_TITLE");
LABEL_10:
        objc_msgSend(v8, "localizedStringForKey:value:table:", v10, &stru_24D38E7C8, CFSTR("WellnessDashboard-Localizable-Cinnamon"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        HKConditionallyRedactedHeartRhythmString();
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[WDElectrocardiogramOverviewViewController _sectionHeaderViewWithTitle:](self, "_sectionHeaderViewWithTitle:", v12);
        v7 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_12;
      }
    }
    else if (!a4)
    {
      WDBundle();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v8;
      v10 = CFSTR("MORE_SECTION_TITLE");
      goto LABEL_10;
    }
    v7 = 0;
    goto LABEL_12;
  }
  -[WDElectrocardiogramOverviewViewController _recordingRescindedHeaderView](self, "_recordingRescindedHeaderView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_12:

  return v7;
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
  -[WDElectrocardiogramOverviewViewController tableView](self, "tableView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[WDHeartRhythmSectionHeaderView defaultReuseIdentifier](WDHeartRhythmSectionHeaderView, "defaultReuseIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dequeueReusableHeaderFooterViewWithIdentifier:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "setTitleText:", v4);
  objc_msgSend(CFSTR("Overview"), "stringByAppendingFormat:", CFSTR(".SectionHeader.%@"), v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD17C8], "healthAccessibilityIdentifier:suffix:", 1, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAccessibilityIdentifier:", v9);

  return v7;
}

- (id)_recordingRescindedHeaderView
{
  void *v3;
  void *v4;
  void *v5;
  int64_t v6;
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

  -[WDElectrocardiogramOverviewViewController tableView](self, "tableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[WDHeartRhythmHeaderView defaultReuseIdentifier](WDHeartRhythmHeaderView, "defaultReuseIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dequeueReusableHeaderFooterViewWithIdentifier:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[WDElectrocardiogramOverviewViewController _electrocardiogramRecordingRescindedStatus](self, "_electrocardiogramRecordingRescindedStatus");
  if (v6 == 2)
  {
    WDBundle();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("ELECTROCARDIOGRAM_RECORDING_SEED_EXPIRED_TITLE"), &stru_24D38E7C8, CFSTR("WellnessDashboard-Localizable-Cinnamon"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    HKConditionallyRedactedHeartRhythmString();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setTitleText:", v16);

    WDBundle();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("ELECTROCARDIOGRAM_RECORDING_SEED_EXPIRED_LEARN_MORE"), &stru_24D38E7C8, CFSTR("WellnessDashboard-Localizable-Cinnamon"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    HKConditionallyRedactedHeartRhythmString();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)MEMORY[0x24BDBCF48];
    WDBundle();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "localizedStringForKey:value:table:", CFSTR("ELECTROCARDIOGRAM_RECORDING_SEED_EXPIRED_URL"), &stru_24D38E7C8, CFSTR("WellnessDashboard-Localizable-Cinnamon"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    HKConditionallyRedactedHeartRhythmString();
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "URLWithString:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setBodyText:URLText:URL:", 0, v17, v22);

    goto LABEL_5;
  }
  if (v6 == 1)
  {
    WDBundle();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("ELECTROCARDIOGRAM_RECORDING_DISABLED_TITLE"), &stru_24D38E7C8, CFSTR("WellnessDashboard-Localizable-Cinnamon"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    HKConditionallyRedactedHeartRhythmString();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setTitleText:", v9);

    WDBundle();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("ELECTROCARDIOGRAM_RECORDING_DISABLED_LEARN_MORE"), &stru_24D38E7C8, CFSTR("WellnessDashboard-Localizable-Cinnamon"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    HKConditionallyRedactedHeartRhythmString();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", *MEMORY[0x24BDD2BD8]);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setBodyText:URLText:URL:", 0, v12, v13);

LABEL_5:
    return v5;
  }
  _HKInitializeLogging();
  v23 = (void *)*MEMORY[0x24BDD3010];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3010], OS_LOG_TYPE_ERROR))
    -[WDElectrocardiogramOverviewViewController _recordingRescindedHeaderView].cold.1(v23);
  return v5;
}

- (int64_t)_electrocardiogramRecordingRescindedStatus
{
  int64_t v3;
  void *v4;
  void *v5;
  void *v6;

  -[WDElectrocardiogramOverviewViewController featureStatus](self, "featureStatus");
  v3 = objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[WDElectrocardiogramOverviewViewController featureStatus](self, "featureStatus");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x24BDD2CA8]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "unsatisfiedRequirementIdentifiers");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_msgSend(v6, "containsObject:", *MEMORY[0x24BDD2DA0]) & 1) != 0)
      v3 = 2;
    else
      v3 = objc_msgSend(v6, "containsObject:", *MEMORY[0x24BDD2D08]);

  }
  return v3;
}

- (BOOL)_isElectrocardiogramRecordingAgeGated
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[WDElectrocardiogramOverviewViewController featureStatus](self, "featureStatus");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return 0;
  -[WDElectrocardiogramOverviewViewController featureStatus](self, "featureStatus");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x24BDD2CA8]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unsatisfiedRequirementIdentifiers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v4) = objc_msgSend(v6, "containsObject:", *MEMORY[0x24BDD2D48]);
  return (char)v4;
}

- (int64_t)_availabilityStateToShowInSetupTableHeaderView
{
  int64_t v4;
  int64_t v5;
  _BOOL4 v6;
  int v7;
  BOOL v8;
  int64_t v9;
  int64_t v10;
  int v11;
  uint64_t v12;

  if (self->_mode)
    return 0;
  v4 = -[WDElectrocardiogramOverviewViewController availabilityState](self, "availabilityState");
  v5 = -[WDElectrocardiogramOverviewViewController _electrocardiogramRecordingRescindedStatus](self, "_electrocardiogramRecordingRescindedStatus");
  v6 = -[WDElectrocardiogramOverviewViewController _isElectrocardiogramRecordingAgeGated](self, "_isElectrocardiogramRecordingAgeGated");
  if (v5)
    v7 = 1;
  else
    v7 = v6;
  v8 = v7 == 0;
  v9 = 2;
  if (v8)
    v9 = 3;
  v10 = 2;
  if (v5)
    v11 = 1;
  else
    v11 = v6;
  v8 = v11 == 0;
  v12 = 1;
  if (!v8)
    v12 = 2;
  if (v4 != 1)
    v12 = 0;
  if (v4 != 2)
    v10 = v12;
  if (v4 == 3)
    return v9;
  else
    return v10;
}

- (void)_reloadElectrocardiogramSetupTableHeaderView
{
  id v3;
  void *v4;
  void *v5;
  WDElectrocardiogramOverviewViewController *v6;
  uint64_t v7;
  void *v8;
  double Width;
  void *v10;
  id v11;
  CGRect v12;

  switch(-[WDElectrocardiogramOverviewViewController _availabilityStateToShowInSetupTableHeaderView](self, "_availabilityStateToShowInSetupTableHeaderView"))
  {
    case 0:
    case 2:
      -[WDElectrocardiogramOverviewViewController _removeUpgradeTileNotProminentIfNeeded](self, "_removeUpgradeTileNotProminentIfNeeded");
      v3 = objc_alloc(MEMORY[0x24BDF6F90]);
      -[WDElectrocardiogramOverviewViewController tableView](self, "tableView");
      v11 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "bounds");
      v4 = (void *)objc_msgSend(v3, "initWithFrame:", 0.0, 0.0);
      -[WDElectrocardiogramOverviewViewController tableView](self, "tableView");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setTableHeaderView:", v4);

      goto LABEL_8;
    case 1:
      -[WDElectrocardiogramOverviewViewController _removeUpgradeTileNotProminentIfNeeded](self, "_removeUpgradeTileNotProminentIfNeeded");
      v6 = self;
      v7 = 0;
      goto LABEL_6;
    case 3:
      if (-[WDElectrocardiogramOverviewViewController _showUpgradeTileInProminentPosition](self, "_showUpgradeTileInProminentPosition"))
      {
        v6 = self;
        v7 = 1;
LABEL_6:
        -[WDElectrocardiogramOverviewViewController _setTableHeaderViewWithUpgradeView:](v6, "_setTableHeaderViewWithUpgradeView:", v7);
      }
      else
      {
        -[WDElectrocardiogramOverviewViewController _showUpgradeTileNotProminent](self, "_showUpgradeTileNotProminent");
        -[WDElectrocardiogramOverviewViewController tableView](self, "tableView");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "bounds");
        Width = CGRectGetWidth(v12);

        v11 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDF6F90]), "initWithFrame:", 0.0, 0.0, Width, 2.22507386e-308);
        -[WDElectrocardiogramOverviewViewController tableView](self, "tableView");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setTableHeaderView:", v11);

LABEL_8:
      }
      return;
    default:
      return;
  }
}

- (void)_showUpgradeTileNotProminent
{
  void *v3;
  void *v4;
  id v5;

  -[WDElectrocardiogramOverviewViewController _electrocardiogramSetupContainerViewWithUpgrade:](self, "_electrocardiogramSetupContainerViewWithUpgrade:", 1);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE4A610]), "initWithView:identifier:", v5, CFSTR("UpgradeTileNotProminentIdentifier"));
  -[WDElectrocardiogramOverviewViewController moreHealthDataProvider](self, "moreHealthDataProvider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addItem:", v3);

}

- (void)_removeUpgradeTileNotProminentIfNeeded
{
  void *v3;

  -[WDElectrocardiogramOverviewViewController moreHealthDataProvider](self, "moreHealthDataProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeItemWithIdentifier:", CFSTR("UpgradeTileNotProminentIdentifier"));

  -[WDElectrocardiogramOverviewViewController _reloadMoreHealthSectionWithAnimation:](self, "_reloadMoreHealthSectionWithAnimation:", 0);
}

- (void)_reloadMoreHealthSectionWithAnimation:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  uint64_t v6;
  void *v7;

  v3 = a3;
  -[WDElectrocardiogramOverviewViewController sectionInfo](self, "sectionInfo", 0, 0, 0, 0);
  objc_msgSend(MEMORY[0x24BDD15E0], "indexSetWithIndex:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    v6 = 100;
  else
    v6 = 5;
  -[WDElectrocardiogramOverviewViewController tableView](self, "tableView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "reloadSections:withRowAnimation:", v5, v6);

}

- (BOOL)_showUpgradeTileInProminentPosition
{
  NSObject *v3;
  _BOOL4 v4;
  BOOL result;
  void *v6;
  char v7;
  int v8;
  WDElectrocardiogramOverviewViewController *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  if (-[WDElectrocardiogramOverviewViewController _userLocaleOnlySupportsECG1](self, "_userLocaleOnlySupportsECG1"))
  {
    _HKInitializeLogging();
    v3 = *MEMORY[0x24BDD3010];
    v4 = os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3010], OS_LOG_TYPE_DEFAULT);
    result = 0;
    if (v4)
    {
      v8 = 138543362;
      v9 = self;
      _os_log_impl(&dword_215814000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@]: ECG1 only country. Demote upgrade ad.", (uint8_t *)&v8, 0xCu);
      return 0;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCF50], "hk_heartRhythmDefaults");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "BOOLForKey:", CFSTR("PromimentUpgradeTileDismissed"));

    return v7 ^ 1;
  }
  return result;
}

- (BOOL)_userLocaleOnlySupportsECG1
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x24BDBCEA0], "autoupdatingCurrentLocale");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x24BDD3C70];
  objc_msgSend(v2, "countryCode");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = objc_msgSend(v3, "isECG1SupportedOnlyForCountryCode:", v4);

  return (char)v3;
}

- (void)_reloadAllSections
{
  WDElectrocardiogramFilterDataProvider *v3;
  void *v4;
  WDElectrocardiogramFilterDataProvider *v5;
  id v6;
  void *v7;
  void *v8;
  _BOOL8 v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v3 = [WDElectrocardiogramFilterDataProvider alloc];
  -[WDElectrocardiogramOverviewViewController profile](self, "profile");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[WDElectrocardiogramFilterDataProvider initWithProfile:delegate:](v3, "initWithProfile:delegate:", v4, self);
  -[WDElectrocardiogramOverviewViewController setFilterDataProvider:](self, "setFilterDataProvider:", v5);

  v6 = objc_alloc(MEMORY[0x24BE4C098]);
  -[WDElectrocardiogramOverviewViewController profile](self, "profile");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "healthStore");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = self->_mode == 0;
  -[WDElectrocardiogramOverviewViewController dataProvider](self, "dataProvider");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "activeECGAlgorithmVersion");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v6, "initWithHealthStore:forSinglePlayer:activeAlgorithmVersion:", v8, v9, v11);
  -[WDElectrocardiogramOverviewViewController setEducationSection:](self, "setEducationSection:", v12);

  -[WDElectrocardiogramOverviewViewController filterDataProvider](self, "filterDataProvider");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "start");

  -[WDElectrocardiogramOverviewViewController tableView](self, "tableView");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "reloadData");

}

- (void)_setTableHeaderViewWithUpgradeView:(BOOL)a3
{
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
  id v19;

  -[WDElectrocardiogramOverviewViewController _electrocardiogramSetupContainerViewWithUpgrade:](self, "_electrocardiogramSetupContainerViewWithUpgrade:", a3);
  v19 = (id)objc_claimAutoreleasedReturnValue();
  -[WDElectrocardiogramOverviewViewController tableView](self, "tableView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTableHeaderView:", v19);

  objc_msgSend(v19, "widthAnchor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDElectrocardiogramOverviewViewController tableView](self, "tableView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "widthAnchor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "constraintEqualToAnchor:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setActive:", 1);

  objc_msgSend(v19, "centerXAnchor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDElectrocardiogramOverviewViewController tableView](self, "tableView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "centerXAnchor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "constraintEqualToAnchor:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setActive:", 1);

  objc_msgSend(v19, "topAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDElectrocardiogramOverviewViewController tableView](self, "tableView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "topAnchor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "constraintEqualToAnchor:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setActive:", 1);

  -[WDElectrocardiogramOverviewViewController tableView](self, "tableView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "tableHeaderView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "layoutIfNeeded");

}

- (id)_electrocardiogramSetupContainerViewWithUpgrade:(BOOL)a3
{
  _BOOL4 v3;
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  __objc2_class **v11;
  void *v12;

  v3 = a3;
  v5 = objc_alloc(MEMORY[0x24BDF6F90]);
  v6 = *MEMORY[0x24BDBF090];
  v7 = *(double *)(MEMORY[0x24BDBF090] + 8);
  v8 = *(double *)(MEMORY[0x24BDBF090] + 16);
  v9 = *(double *)(MEMORY[0x24BDBF090] + 24);
  v10 = (void *)objc_msgSend(v5, "initWithFrame:", *MEMORY[0x24BDBF090], v7, v8, v9);
  objc_msgSend(v10, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v11 = off_24D38C7D8;
  if (!v3)
    v11 = off_24D38C7D0;
  v12 = (void *)objc_msgSend(objc_alloc(*v11), "initWithFrame:", v6, v7, v8, v9);
  objc_msgSend(v12, "setDelegate:", self);
  objc_msgSend(v10, "addSubview:", v12);
  objc_msgSend(v12, "hk_alignConstraintsWithView:", v10);

  return v10;
}

- (id)_cellForSampleAtIndex:(int64_t)a3 section:(int64_t)a4
{
  void *v7;
  void *v8;
  unint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;

  objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForRow:inSection:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDElectrocardiogramOverviewViewController dataProvider](self, "dataProvider");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "numberOfObjectsForSection:", a4);

  -[WDElectrocardiogramOverviewViewController dataProvider](self, "dataProvider");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v9 <= a3)
  {
    -[WDElectrocardiogramOverviewViewController tableView](self, "tableView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "placeholderCellAtIndexPath:tableView:", v7, v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v10, "objectAtIndex:forSection:", a3, a4);
    v12 = objc_claimAutoreleasedReturnValue();

    -[WDElectrocardiogramOverviewViewController dataProvider](self, "dataProvider");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[WDElectrocardiogramOverviewViewController tableView](self, "tableView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "customCellForObject:indexPath:tableView:", v12, v7, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = (void *)v12;
  }

  return v15;
}

- (id)_showAllResultsCellForType:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v10;

  +[WDElectrocardiogramFilterDataProvider cellTitleForType:](WDElectrocardiogramFilterDataProvider, "cellTitleForType:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDElectrocardiogramOverviewViewController sectionInfo](self, "sectionInfo");
  if (v10 == -1)
  {
    v7 = 0;
  }
  else
  {
    -[WDElectrocardiogramOverviewViewController filterDataProvider](self, "filterDataProvider");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "displayStringCountForType:", a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  -[WDElectrocardiogramOverviewViewController _cellWithDisclosureIndicatorAndText:value:](self, "_cellWithDisclosureIndicatorAndText:value:", v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)_showAllResultsForSummarySharingProfile
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  +[WDElectrocardiogramFilterDataProvider cellTitleForType:](WDElectrocardiogramFilterDataProvider, "cellTitleForType:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  HKIntegerFormatter();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x24BDD16E0];
  -[WDElectrocardiogramOverviewViewController dataProvider](self, "dataProvider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "samples");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "numberWithInteger:", objc_msgSend(v7, "count"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringFromNumber:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[WDElectrocardiogramOverviewViewController _cellWithDisclosureIndicatorAndText:value:](self, "_cellWithDisclosureIndicatorAndText:value:", v3, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)_cellForFavorites
{
  id v3;
  void *v4;
  void *v5;

  v3 = objc_alloc(MEMORY[0x24BE4A630]);
  objc_msgSend(MEMORY[0x24BE4A630], "reuseIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithStyle:reuseIdentifier:", 0, v4);

  objc_msgSend(v5, "setFavorited:", -[WDElectrocardiogramOverviewViewController isPinned](self, "isPinned"));
  return v5;
}

- (id)_cellForDataSourcesAndAccess
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("SHARE_DATA_TITLE"), &stru_24D38E7C8, CFSTR("HealthUI-Localizable"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDElectrocardiogramOverviewViewController _cellWithDisclosureIndicatorAndText:value:](self, "_cellWithDisclosureIndicatorAndText:value:", v4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_cellForRegulatoryPane
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  WDBundle();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("REGULATORY_PANE_TITLE"), &stru_24D38E7C8, CFSTR("WellnessDashboard-Localizable-Cinnamon"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  HKConditionallyRedactedHeartRhythmString();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDElectrocardiogramOverviewViewController _cellWithDisclosureIndicatorAndText:value:](self, "_cellWithDisclosureIndicatorAndText:value:", v5, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_cellForDescription
{
  WDDisplayTypeDescriptionTableViewCell *v3;
  void *v4;
  void *v5;
  WDDisplayTypeDescriptionTableViewCell *v6;
  void *v7;

  v3 = [WDDisplayTypeDescriptionTableViewCell alloc];
  -[WDElectrocardiogramOverviewViewController displayType](self, "displayType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[WDDisplayTypeDescriptionTableViewCell defaultReuseIdentifier](WDDisplayTypeDescriptionTableViewCell, "defaultReuseIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[WDDisplayTypeDescriptionTableViewCell initWithDisplayType:showAttributionText:reuseIdentifier:](v3, "initWithDisplayType:showAttributionText:reuseIdentifier:", v4, 0, v5);

  -[WDDisplayTypeDescriptionTableViewCell setSelectionStyle:](v6, "setSelectionStyle:", 0);
  objc_msgSend(MEMORY[0x24BDD17C8], "healthAccessibilityIdentifier:suffix:", 1, CFSTR("AboutEcgDescription"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDDisplayTypeDescriptionTableViewCell setAccessibilityIdentifier:](v6, "setAccessibilityIdentifier:", v7);

  return v6;
}

- (id)_cellWithDisclosureIndicatorAndText:(id)a3 value:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v6 = a4;
  v7 = a3;
  -[WDElectrocardiogramOverviewViewController tableView](self, "tableView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "dequeueReusableCellWithIdentifier:", CFSTR("_Value1CellIdentifier"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6E60]), "initWithStyle:reuseIdentifier:", 1, CFSTR("_Value1CellIdentifier"));
  objc_msgSend(v9, "textLabel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setText:", v7);

  objc_msgSend(v9, "textLabel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setNumberOfLines:", 0);

  objc_msgSend(v9, "detailTextLabel");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setText:", v6);

  objc_msgSend(v9, "setAccessoryType:", 1);
  objc_msgSend(CFSTR("Overview"), "stringByAppendingFormat:", CFSTR(".Cell.%@"), v7);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD17C8], "healthAccessibilityIdentifier:suffix:", 1, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setAccessibilityIdentifier:", v14);

  return v9;
}

- (int64_t)_filterTypeForDataSectionRow:(int64_t)a3
{
  return a3;
}

- (void)electrocardiogramFilterDataProvider:(id)a3 didUpdateCount:(int64_t)a4 type:(int64_t)a5
{
  _QWORD v5[6];

  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __101__WDElectrocardiogramOverviewViewController_electrocardiogramFilterDataProvider_didUpdateCount_type___block_invoke;
  v5[3] = &unk_24D38D028;
  v5[4] = self;
  v5[5] = a5;
  dispatch_async(MEMORY[0x24BDAC9B8], v5);
}

void __101__WDElectrocardiogramOverviewViewController_electrocardiogramFilterDataProvider_didUpdateCount_type___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;

  v9 = 0;
  v2 = *(void **)(a1 + 32);
  if (v2)
    objc_msgSend(v2, "sectionInfo", 0);
  objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForRow:inSection:", *(_QWORD *)(a1 + 40), 0, v9);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "tableView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cellForRowAtIndexPath:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "filterDataProvider");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "displayStringCountForType:", *(_QWORD *)(a1 + 40));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "detailTextLabel");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setText:", v7);

  }
}

- (void)beginOnboardingForOnboardingSetupView:(id)a3
{
  NSObject *v4;
  int64_t v5;
  void *v6;
  int v7;
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  _HKInitializeLogging();
  v4 = *MEMORY[0x24BDD3010];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3010], OS_LOG_TYPE_DEFAULT))
  {
    v7 = 136446210;
    v8 = "-[WDElectrocardiogramOverviewViewController beginOnboardingForOnboardingSetupView:]";
    _os_log_impl(&dword_215814000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}s]: Install of ECG app will be triggered after a location check in onboarding", (uint8_t *)&v7, 0xCu);
  }
  v5 = -[WDElectrocardiogramOverviewViewController availabilityState](self, "availabilityState");
  if (v5 == 3)
  {
    objc_msgSend(MEMORY[0x24BDBCF50], "hk_heartRhythmDefaults");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setBool:forKey:", 1, CFSTR("PromimentUpgradeTileDismissed"));

    -[WDElectrocardiogramOverviewViewController _startUpgrade](self, "_startUpgrade");
  }
  else if (v5 == 1)
  {
    -[WDElectrocardiogramOverviewViewController _startOnboardingForFirstTime:](self, "_startOnboardingForFirstTime:", 1);
  }
}

- (void)didTapOnElectrocardiogram:(id)a3
{
  id v4;
  void *v5;
  WDElectrocardiogramDataMetadataViewController *v6;
  void *v7;
  WDElectrocardiogramDataMetadataViewController *v8;

  v4 = a3;
  -[WDElectrocardiogramOverviewViewController _reloadAllSections](self, "_reloadAllSections");
  -[WDElectrocardiogramOverviewViewController onboardingManager](self, "onboardingManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dismissOnboarding");

  v6 = [WDElectrocardiogramDataMetadataViewController alloc];
  -[WDElectrocardiogramOverviewViewController dataProvider](self, "dataProvider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[WDElectrocardiogramDataMetadataViewController initWithSample:delegate:mode:activeAlgorithmVersion:](v6, "initWithSample:delegate:mode:activeAlgorithmVersion:", v4, v7, 0, 0);

  -[WDElectrocardiogramOverviewViewController showAdaptively:sender:](self, "showAdaptively:sender:", v8, self);
}

- (void)didCompleteOnboarding
{
  -[WDElectrocardiogramOverviewViewController _reloadAllSections](self, "_reloadAllSections");
  -[WDElectrocardiogramOverviewViewController setOnboardingManager:](self, "setOnboardingManager:", 0);
}

- (void)didDismissOnboarding
{
  -[WDElectrocardiogramOverviewViewController setOnboardingManager:](self, "setOnboardingManager:", 0);
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  unint64_t v10;
  void *v11;
  unint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  char v19;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "deselectRowAtIndexPath:animated:", v7, 1);
  -[WDElectrocardiogramOverviewViewController sectionInfo](self, "sectionInfo");
  if (objc_msgSend(v7, "section"))
  {
    if (!objc_msgSend(v7, "section"))
    {
      -[WDElectrocardiogramOverviewViewController _dataListViewControllerWithFilterType:](self, "_dataListViewControllerWithFilterType:", -[WDElectrocardiogramOverviewViewController _filterTypeForDataSectionRow:](self, "_filterTypeForDataSectionRow:", objc_msgSend(v7, "row")));
      v8 = objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    }
    if (!objc_msgSend(v7, "section"))
    {
      -[WDElectrocardiogramOverviewViewController educationSection](self, "educationSection");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v7, "row");
      -[WDElectrocardiogramOverviewViewController navigationController](self, "navigationController");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "selectCellForIndex:navigationController:animated:", v16, v17, 1);

      goto LABEL_15;
    }
    if (objc_msgSend(v7, "section"))
    {
      if (!objc_msgSend(v7, "section"))
      {
        objc_msgSend(v6, "cellForRowAtIndexPath:", v7);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setFavorited:", objc_msgSend(v9, "isFavorited") ^ 1);
        -[WDElectrocardiogramOverviewViewController setPinned:](self, "setPinned:", objc_msgSend(v9, "isFavorited"));
        goto LABEL_15;
      }
      if (!objc_msgSend(v7, "section"))
      {
        -[WDElectrocardiogramOverviewViewController userConfigurationRowInfo](self, "userConfigurationRowInfo");
        if (objc_msgSend(v7, "row"))
        {
          if (!objc_msgSend(v7, "row"))
          {
            objc_msgSend(MEMORY[0x24BDBCF50], "hk_heartRhythmDefaults");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v19 = objc_msgSend(v18, "hk_hfeModeEnabled");

            if ((v19 & 1) == 0)
              -[WDElectrocardiogramOverviewViewController didSelectRegulatoryRow](self, "didSelectRegulatoryRow");
          }
        }
        else
        {
          -[WDElectrocardiogramOverviewViewController _showDataSourcesAndAccessController](self, "_showDataSourcesAndAccessController");
        }
      }
    }
  }
  else
  {
    if (-[WDElectrocardiogramOverviewViewController mode](self, "mode") == 2 && objc_msgSend(v7, "row") == 5)
    {
      -[WDElectrocardiogramOverviewViewController _dataListViewControllerForSummaryData](self, "_dataListViewControllerForSummaryData");
      v8 = objc_claimAutoreleasedReturnValue();
LABEL_7:
      v9 = (void *)v8;
      -[WDElectrocardiogramOverviewViewController showAdaptively:sender:](self, "showAdaptively:sender:", v8, self);
LABEL_15:

      goto LABEL_16;
    }
    v10 = objc_msgSend(v7, "row");
    -[WDElectrocardiogramOverviewViewController dataProvider](self, "dataProvider");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "numberOfObjectsForSection:", objc_msgSend(v7, "section"));

    if (v10 < v12)
    {
      -[WDElectrocardiogramOverviewViewController dataProvider](self, "dataProvider");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForRow:inSection:", objc_msgSend(v7, "row"), objc_msgSend(v7, "section"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "viewControllerForItemAtIndexPath:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      -[WDElectrocardiogramOverviewViewController showAdaptively:sender:](self, "showAdaptively:sender:", v15, self);
    }
  }
LABEL_16:

}

- (id)_dataListViewControllerWithFilterType:(int64_t)a3
{
  WDElectrocardiogramListDataProvider *v5;
  void *v6;
  void *v7;
  WDElectrocardiogramListDataProvider *v8;
  WDElectrocardiogramDataListViewController *v9;
  void *v10;
  void *v11;
  WDElectrocardiogramDataListViewController *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  v5 = [WDElectrocardiogramListDataProvider alloc];
  -[WDElectrocardiogramOverviewViewController displayType](self, "displayType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDElectrocardiogramOverviewViewController profile](self, "profile");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[WDElectrocardiogramListDataProvider initWithDisplayType:profile:mode:](v5, "initWithDisplayType:profile:mode:", v6, v7, -[WDElectrocardiogramOverviewViewController mode](self, "mode"));

  v9 = [WDElectrocardiogramDataListViewController alloc];
  -[WDElectrocardiogramOverviewViewController displayType](self, "displayType");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDElectrocardiogramOverviewViewController profile](self, "profile");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[WDElectrocardiogramDataListViewController initWithDisplayType:profile:dataProvider:usingInsetStyling:mode:](v9, "initWithDisplayType:profile:dataProvider:usingInsetStyling:mode:", v10, v11, v8, 1, -[WDElectrocardiogramOverviewViewController mode](self, "mode"));

  -[WDElectrocardiogramOverviewViewController filterDataProvider](self, "filterDataProvider");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "electrocardiogramPredicateForType:", a3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDDataListViewController dataProvider](v12, "dataProvider");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setDefaultQueryPredicate:", v14);

  +[WDElectrocardiogramFilterDataProvider viewControllerTitleForType:](WDElectrocardiogramFilterDataProvider, "viewControllerTitleForType:", a3);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDElectrocardiogramDataListViewController setTitle:](v12, "setTitle:", v16);

  -[WDElectrocardiogramDataListViewController tableView](v12, "tableView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "_setSectionContentInsetFollowsLayoutMargins:", 1);

  return v12;
}

- (id)_dataListViewControllerForSummaryData
{
  WDElectrocardiogramDataListViewController *v3;
  void *v4;
  void *v5;
  void *v6;
  WDElectrocardiogramDataListViewController *v7;
  void *v8;
  void *v9;

  v3 = [WDElectrocardiogramDataListViewController alloc];
  -[WDElectrocardiogramOverviewViewController displayType](self, "displayType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDElectrocardiogramOverviewViewController profile](self, "profile");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDElectrocardiogramOverviewViewController dataProvider](self, "dataProvider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[WDElectrocardiogramDataListViewController initWithDisplayType:profile:dataProvider:usingInsetStyling:mode:](v3, "initWithDisplayType:profile:dataProvider:usingInsetStyling:mode:", v4, v5, v6, 1, -[WDElectrocardiogramOverviewViewController mode](self, "mode"));

  +[WDElectrocardiogramFilterDataProvider viewControllerTitleForType:](WDElectrocardiogramFilterDataProvider, "viewControllerTitleForType:", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDElectrocardiogramDataListViewController setTitle:](v7, "setTitle:", v8);

  -[WDElectrocardiogramDataListViewController tableView](v7, "tableView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "_setSectionContentInsetFollowsLayoutMargins:", 1);

  return v7;
}

- (void)_showDataSourcesAndAccessController
{
  WDDisplayTypeDataSourcesTableViewController *v3;
  HKDisplayType *displayType;
  id WeakRetained;
  void *v6;
  id v7;
  WDDisplayTypeDataSourcesTableViewController *v8;
  id v9;

  objc_msgSend(MEMORY[0x24BE4A5C0], "categoryWithID:", -[HKDisplayType categoryIdentifier](self->_displayType, "categoryIdentifier"));
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v3 = [WDDisplayTypeDataSourcesTableViewController alloc];
  displayType = self->_displayType;
  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  objc_msgSend(WeakRetained, "sourceOrderController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_loadWeakRetained((id *)&self->_profile);
  v8 = -[WDDisplayTypeDataSourcesTableViewController initWithDisplayType:displayCategory:sourceOrderController:profile:](v3, "initWithDisplayType:displayCategory:sourceOrderController:profile:", displayType, v9, v6, v7);

  -[WDDisplayTypeDataSourcesTableViewController setShouldInsetSectionContentForDataSourceDataList:](v8, "setShouldInsetSectionContentForDataSourceDataList:", 1);
  -[WDElectrocardiogramOverviewViewController showAdaptively:sender:](self, "showAdaptively:sender:", v8, self);

}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setSeparatorColor:", v11);

  }
  -[WDElectrocardiogramOverviewViewController sectionInfo](self, "sectionInfo", 0, 0);
  if (!objc_msgSend(v10, "section"))
  {
    -[WDElectrocardiogramOverviewViewController educationSection](self, "educationSection");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "willDisplayCell:forIndex:tableView:", v9, objc_msgSend(v10, "row"), v8);

  }
}

- (void)didSelectReenableFeature
{
  -[WDElectrocardiogramOverviewViewController _startOnboardingForFirstTime:](self, "_startOnboardingForFirstTime:", 0);
}

- (void)traitCollectionDidChange:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  char v7;
  id v8;

  v8 = a3;
  if (!v8)
    goto LABEL_3;
  -[WDElectrocardiogramOverviewViewController traitCollection](self, "traitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "preferredContentSizeCategory");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "preferredContentSizeCategory");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isEqualToString:", v6);

  if ((v7 & 1) == 0)
LABEL_3:
    -[WDElectrocardiogramOverviewViewController _reloadElectrocardiogramSetupTableHeaderView](self, "_reloadElectrocardiogramSetupTableHeaderView");

}

- (BOOL)_shouldDisplayAboutRowBeforeOnboarding
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  char v6;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x24BDAC8D0];
  v8[0] = *MEMORY[0x24BDD2B10];
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v8, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEA0], "autoupdatingCurrentLocale");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "countryCode");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v2, "containsObject:", v5);

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (int64_t)placeholderCellCount
{
  return self->_placeholderCellCount;
}

- (void)setPlaceholderCellCount:(int64_t)a3
{
  self->_placeholderCellCount = a3;
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
  return (WDProfile *)objc_loadWeakRetained((id *)&self->_profile);
}

- (void)setProfile:(id)a3
{
  objc_storeWeak((id *)&self->_profile, a3);
}

- (int64_t)mode
{
  return self->_mode;
}

- (WDElectrocardiogramListDataProvider)dataProvider
{
  return self->_dataProvider;
}

- (void)setDataProvider:(id)a3
{
  objc_storeStrong((id *)&self->_dataProvider, a3);
}

- (HRElectrocardiogramOnboardingManager)onboardingManager
{
  return self->_onboardingManager;
}

- (void)setOnboardingManager:(id)a3
{
  objc_storeStrong((id *)&self->_onboardingManager, a3);
}

- (WDElectrocardiogramFilterDataProvider)filterDataProvider
{
  return self->_filterDataProvider;
}

- (void)setFilterDataProvider:(id)a3
{
  objc_storeStrong((id *)&self->_filterDataProvider, a3);
}

- (HKElectrocardiogramMoreHealthDataProvider)moreHealthDataProvider
{
  return self->_moreHealthDataProvider;
}

- (void)setMoreHealthDataProvider:(id)a3
{
  objc_storeStrong((id *)&self->_moreHealthDataProvider, a3);
}

- (HKFeatureStatusManager)featureStatusManager
{
  return self->_featureStatusManager;
}

- (void)setFeatureStatusManager:(id)a3
{
  objc_storeStrong((id *)&self->_featureStatusManager, a3);
}

- (HKFeatureStatus)featureStatus
{
  return self->_featureStatus;
}

- (void)setFeatureStatus:(id)a3
{
  objc_storeStrong((id *)&self->_featureStatus, a3);
}

- (HKDataMetadataSectionProtocol)educationSection
{
  return self->_educationSection;
}

- (void)setEducationSection:(id)a3
{
  objc_storeStrong((id *)&self->_educationSection, a3);
}

- (UITapGestureRecognizer)tripleTapToSettingsRecognizer
{
  return self->_tripleTapToSettingsRecognizer;
}

- (void)setTripleTapToSettingsRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_tripleTapToSettingsRecognizer, a3);
}

- (BOOL)displayAboutRowBeforeOnboarding
{
  return self->_displayAboutRowBeforeOnboarding;
}

- (void)setDisplayAboutRowBeforeOnboarding:(BOOL)a3
{
  self->_displayAboutRowBeforeOnboarding = a3;
}

- (NSNumber)availabilityStateCache
{
  return self->_availabilityStateCache;
}

- (void)setAvailabilityStateCache:(id)a3
{
  self->_availabilityStateCache = (NSNumber *)a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tripleTapToSettingsRecognizer, 0);
  objc_storeStrong((id *)&self->_educationSection, 0);
  objc_storeStrong((id *)&self->_featureStatus, 0);
  objc_storeStrong((id *)&self->_featureStatusManager, 0);
  objc_storeStrong((id *)&self->_moreHealthDataProvider, 0);
  objc_storeStrong((id *)&self->_filterDataProvider, 0);
  objc_storeStrong((id *)&self->_onboardingManager, 0);
  objc_storeStrong((id *)&self->_dataProvider, 0);
  objc_destroyWeak((id *)&self->_profile);
  objc_storeStrong((id *)&self->_displayType, 0);
}

- (void)initWithDisplayType:(void *)a1 profile:(uint64_t)a2 mode:(uint64_t)a3 .cold.1(void *a1, uint64_t a2, uint64_t a3)
{
  NSObject *v4;
  id v5;
  uint64_t v6;
  int v7;
  id v8;
  __int16 v9;
  uint64_t v10;

  v4 = OUTLINED_FUNCTION_5(a1);
  v7 = 138543618;
  v8 = (id)objc_opt_class();
  v9 = 2112;
  v10 = a3;
  v5 = v8;
  OUTLINED_FUNCTION_2_1(&dword_215814000, v4, v6, "[%{public}@] Failed to get feature status with error: %@", (uint8_t *)&v7);

}

- (void)initWithDisplayType:(void *)a1 profile:mode:.cold.2(void *a1)
{
  NSObject *v1;
  id v2;
  int v3;
  id v4;

  v1 = OUTLINED_FUNCTION_5(a1);
  v3 = 138543362;
  v4 = (id)objc_opt_class();
  v2 = v4;
  _os_log_error_impl(&dword_215814000, v1, OS_LOG_TYPE_ERROR, "[%{public}@] Failed to get country code", (uint8_t *)&v3, 0xCu);

  OUTLINED_FUNCTION_8();
}

- (void)_recordingRescindedHeaderView
{
  NSObject *v1;
  void *v2;
  uint64_t v3;
  int v4;
  const char *v5;
  __int16 v6;
  void *v7;

  v1 = OUTLINED_FUNCTION_5(a1);
  NSStringFromHKFeatureAvailabilityRescindedStatus();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 136446466;
  v5 = "-[WDElectrocardiogramOverviewViewController _recordingRescindedHeaderView]";
  v6 = 2114;
  v7 = v2;
  OUTLINED_FUNCTION_2_1(&dword_215814000, v1, v3, "[%{public}s]: Could not configure rescinded header view for state %{public}@", (uint8_t *)&v4);

  OUTLINED_FUNCTION_8();
}

@end
