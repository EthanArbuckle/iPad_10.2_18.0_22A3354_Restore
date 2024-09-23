@implementation WDClinicalOnboardingViewController

- (WDClinicalOnboardingViewController)initWithProfile:(id)a3
{
  return -[WDClinicalOnboardingViewController initWithProfile:gatewayProxy:](self, "initWithProfile:gatewayProxy:", a3, 0);
}

- (WDClinicalOnboardingViewController)initWithProfile:(id)a3 gatewayProxy:(id)a4
{
  id v7;
  id v8;
  WDClinicalOnboardingViewController *v9;
  WDClinicalOnboardingViewController *v10;
  NSMutableDictionary *v11;
  NSMutableDictionary *resultsCache;
  NSString *searchQuery;
  NSArray *searchTerms;
  id v15;
  void *v16;
  uint64_t v17;
  HKClinicalProviderServiceStore *providerServiceStore;
  HRUITableViewSectionConfiguration *v19;
  HRUITableViewSectionConfiguration *sectionConfiguration;
  objc_super v22;

  v7 = a3;
  v8 = a4;
  v22.receiver = self;
  v22.super_class = (Class)WDClinicalOnboardingViewController;
  v9 = -[HKTableViewController initWithUsingInsetStyling:](&v22, sel_initWithUsingInsetStyling_, 1);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_profile, a3);
    v11 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    resultsCache = v10->_resultsCache;
    v10->_resultsCache = v11;

    searchQuery = v10->_searchQuery;
    v10->_searchQuery = (NSString *)&stru_1E74EA150;

    searchTerms = v10->_searchTerms;
    v10->_searchTerms = (NSArray *)MEMORY[0x1E0C9AA60];

    v15 = objc_alloc(MEMORY[0x1E0D2EEE8]);
    objc_msgSend(v7, "healthStore");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v15, "initWithHealthStore:", v16);
    providerServiceStore = v10->_providerServiceStore;
    v10->_providerServiceStore = (HKClinicalProviderServiceStore *)v17;

    objc_storeStrong((id *)&v10->_pendingGatewayProxy, a4);
    v19 = objc_alloc_init(HRUITableViewSectionConfiguration);
    sectionConfiguration = v10->_sectionConfiguration;
    v10->_sectionConfiguration = v19;

  }
  return v10;
}

- (BOOL)definesPresentationContext
{
  return 1;
}

- (void)loadView
{
  void *v3;
  void *v4;
  double v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)WDClinicalOnboardingViewController;
  -[WDClinicalOnboardingViewController loadView](&v11, sel_loadView);
  HRLocalizedString(CFSTR("HEALTH_RECORDS_ONBOARDING_TITLE"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDClinicalOnboardingViewController setTitle:](self, "setTitle:", v3);

  -[WDClinicalOnboardingViewController tableView](self, "tableView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_setTopPadding:", 0.0);

  v5 = *MEMORY[0x1E0D2F3F0];
  -[WDClinicalOnboardingViewController tableView](self, "tableView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setSeparatorInset:", 0.0, v5, 0.0, 0.0);

  -[WDClinicalOnboardingViewController tableView](self, "tableView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setBackgroundView:", 0);

  objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDClinicalOnboardingViewController tableView](self, "tableView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setBackgroundColor:", v8);

  -[WDClinicalOnboardingViewController tableView](self, "tableView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setKeyboardDismissMode:", 2);

  -[WDClinicalOnboardingViewController _configureNavigationItems](self, "_configureNavigationItems");
  -[WDClinicalOnboardingViewController _configureSearchController](self, "_configureSearchController");
  -[WDClinicalOnboardingViewController _configureTableViewCells](self, "_configureTableViewCells");
  -[WDClinicalOnboardingViewController _cacheFeaturedBrandLogos](self, "_cacheFeaturedBrandLogos");
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)WDClinicalOnboardingViewController;
  -[HKTableViewController viewDidLoad](&v6, sel_viewDidLoad);
  -[WDClinicalOnboardingViewController pendingGatewayProxy](self, "pendingGatewayProxy");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[WDClinicalOnboardingViewController pendingGatewayProxy](self, "pendingGatewayProxy");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[WDClinicalOnboardingViewController _loadGatewayProxyForDeeplinking:](self, "_loadGatewayProxyForDeeplinking:", v4);

  }
  else
  {
    -[WDClinicalOnboardingViewController _configureLocationServices](self, "_configureLocationServices");
  }
  -[WDClinicalOnboardingViewController setShowProviderNotFound:](self, "setShowProviderNotFound:", self->_showProviderNotFound);
  -[WDClinicalOnboardingViewController _beginLoadingAlreadyConnectedAccountsIfNecessary](self, "_beginLoadingAlreadyConnectedAccountsIfNecessary");
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObserver:selector:name:object:", self, sel__applicationDidBecomeActive, *MEMORY[0x1E0DC4750], 0);

}

- (CGSize)preferredContentSize
{
  double v2;
  double v3;
  CGSize result;

  objc_msgSend(MEMORY[0x1E0D65130], "preferredContentSize");
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)didReceiveMemoryWarning
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)WDClinicalOnboardingViewController;
  -[WDClinicalOnboardingViewController didReceiveMemoryWarning](&v3, sel_didReceiveMemoryWarning);
  if (-[WDClinicalOnboardingViewController _isSimulator](self, "_isSimulator"))
    -[WDClinicalOnboardingViewController setSampleAccountsLoader:](self, "setSampleAccountsLoader:", 0);
}

- (id)_providerNotFoundExplanationMessage
{
  if (self->_showOnlyClinicalSharingCapableProviders)
    HROsloLocalizedString(CFSTR("HEALTH_RECORDS_ONBOARDING_NO_LOCATIONS_FOUND_MESSAGE_SHARING"), a2);
  else
    HRLocalizedString(CFSTR("HEALTH_RECORDS_ONBOARDING_NO_LOCATIONS_FOUND_MESSAGE_CHR"));
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)keyCommands
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[3];

  v6[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0DC3930], "keyCommandWithInput:modifierFlags:action:", *MEMORY[0x1E0DC4DA0], 0, sel_dismiss_);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3930], "keyCommandWithInput:modifierFlags:action:", CFSTR("f"), 0x100000, sel_activateSearch_);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v2;
  v6[1] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)activateSearch:(id)a3
{
  id v3;

  -[UISearchController searchBar](self->_searchController, "searchBar", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "becomeFirstResponder");

}

- (void)_configureLeftNavigationItemAsCancel
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v6 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 1, self, sel_dismiss_);
  -[WDClinicalOnboardingViewController navigationItem](self, "navigationItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setLeftBarButtonItem:", v6);

  -[WDClinicalOnboardingViewController navigationItem](self, "navigationItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "leftBarButtonItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAccessibilityIdentifier:", CFSTR("UIA.Health.ClinicalOnboarding.Navigation.Cancel"));

}

- (void)_configureRightNavigationItems
{
  void *v3;
  char v4;
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
  id v16;
  _QWORD v17[5];
  _QWORD v18[3];

  v18[2] = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(MEMORY[0x1E0CB6F18], "isAppleInternalInstall")
    && (objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults"),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        v4 = objc_msgSend(v3, "BOOLForKey:", *MEMORY[0x1E0CB7708]),
        v3,
        (v4 & 1) == 0))
  {
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __68__WDClinicalOnboardingViewController__configureRightNavigationItems__block_invoke;
    v17[3] = &unk_1E74D1138;
    v17[4] = self;
    objc_msgSend(MEMORY[0x1E0DC3428], "actionWithTitle:image:identifier:handler:", CFSTR("Suggest New Provider"), 0, 0, v17);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    HKHealthRecordsCurrentEnvironment();
    HKHealthRecordsNameForEnvironment();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)MEMORY[0x1E0DC39D0];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Environment: %@"), v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[WDClinicalOnboardingViewController _changeEnvironmentMenuElements](self, "_changeEnvironmentMenuElements");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "menuWithTitle:children:", v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = (void *)MEMORY[0x1E0DC39D0];
    v18[0] = v5;
    v18[1] = v10;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "menuWithTitle:children:", CFSTR("Internal Only Options"), v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithTitle:menu:", CFSTR("Internal"), v13);
    -[WDClinicalOnboardingViewController navigationItem](self, "navigationItem");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setRightBarButtonItem:", v14);

  }
  else
  {
    -[WDClinicalOnboardingViewController navigationItem](self, "navigationItem");
    v16 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setRightBarButtonItem:", 0);

  }
}

uint64_t __68__WDClinicalOnboardingViewController__configureRightNavigationItems__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_suggestNewProviders");
}

- (void)_configureNavigationItems
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[WDClinicalOnboardingViewController presentingViewController](self, "presentingViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[WDClinicalOnboardingViewController presentingViewController](self, "presentingViewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "navigationController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "navigationBar");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setAccessibilityIdentifier:", CFSTR("UIA.Health.ClinicalOnboarding.Navigation"));

    -[WDClinicalOnboardingViewController _configureLeftNavigationItemAsCancel](self, "_configureLeftNavigationItemAsCancel");
    -[WDClinicalOnboardingViewController _configureRightNavigationItems](self, "_configureRightNavigationItems");
  }
}

- (void)_configureSearchController
{
  UISearchController *v3;
  UISearchController *searchController;
  void *v5;
  void *v6;
  UISearchController *v7;
  void *v8;
  void *v9;
  id v10;

  v3 = (UISearchController *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3C40]), "initWithSearchResultsController:", 0);
  searchController = self->_searchController;
  self->_searchController = v3;

  -[UISearchController setDelegate:](self->_searchController, "setDelegate:", self);
  -[UISearchController searchBar](self->_searchController, "searchBar");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setDelegate:", self);
  HRLocalizedString(CFSTR("HEALTH_RECORDS_ONBOARDING_SEARCH_PLACEHOLDER"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setPlaceholder:", v5);

  objc_msgSend(v10, "searchTextField");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAccessibilityIdentifier:", CFSTR("UIA.Health.ClinicalOnboarding.SearchBar.SearchText"));

  -[UISearchController setSearchResultsUpdater:](self->_searchController, "setSearchResultsUpdater:", self);
  -[UISearchController setHidesNavigationBarDuringPresentation:](self->_searchController, "setHidesNavigationBarDuringPresentation:", 1);
  -[UISearchController setObscuresBackgroundDuringPresentation:](self->_searchController, "setObscuresBackgroundDuringPresentation:", 0);
  v7 = self->_searchController;
  -[WDClinicalOnboardingViewController navigationItem](self, "navigationItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setSearchController:", v7);

  -[WDClinicalOnboardingViewController navigationItem](self, "navigationItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setHidesSearchBarWhenScrolling:", 0);

}

- (void)_configureTableViewCells
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;

  -[WDClinicalOnboardingViewController tableView](self, "tableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "registerClass:forCellReuseIdentifier:", objc_opt_class(), CFSTR("AlreadyConnectedCell"));

  -[WDClinicalOnboardingViewController tableView](self, "tableView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "registerClass:forCellReuseIdentifier:", objc_opt_class(), CFSTR("SearchResultCell"));

  -[WDClinicalOnboardingViewController tableView](self, "tableView");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_class();
  +[HRWDSpinnerTableViewCell defaultReuseIdentifier](HRWDSpinnerTableViewCell, "defaultReuseIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "registerClass:forCellReuseIdentifier:", v5, v6);

}

- (void)_cacheFeaturedBrandLogos
{
  void *v2;
  id v3;

  -[HRProfile healthRecordsStore](self->_profile, "healthRecordsStore");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "hk_brandImageManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cacheFeaturedBrandLogosWithCompletion:", &__block_literal_global);

}

void __62__WDClinicalOnboardingViewController__cacheFeaturedBrandLogos__block_invoke(uint64_t a1, char a2, void *a3)
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = v4;
  if ((a2 & 1) == 0 && objc_msgSend(v4, "code") != 608)
  {
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52D8], OS_LOG_TYPE_ERROR))
      __62__WDClinicalOnboardingViewController__cacheFeaturedBrandLogos__block_invoke_cold_1();
  }

}

- (void)_loadGatewayProxyForDeeplinking:(id)a3
{
  HRUITableViewSectionConfiguration *sectionConfiguration;
  id v5;
  void *v6;
  BOOL v7;
  HKClinicalProviderServiceStore *providerServiceStore;
  void *v9;
  void *v10;
  _QWORD v11[5];

  sectionConfiguration = self->_sectionConfiguration;
  v5 = a3;
  -[HRUITableViewSectionConfiguration sections](sectionConfiguration, "sections");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "count"))
  {

  }
  else
  {
    v7 = -[WDClinicalOnboardingViewController showingNoLocations](self, "showingNoLocations");

    if (!v7)
      -[WDClinicalOnboardingViewController _showSpinnerView](self, "_showSpinnerView");
  }
  providerServiceStore = self->_providerServiceStore;
  objc_msgSend(v5, "gatewayID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "batchID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __70__WDClinicalOnboardingViewController__loadGatewayProxyForDeeplinking___block_invoke;
  v11[3] = &unk_1E74D11F0;
  v11[4] = self;
  -[HKClinicalProviderServiceStore fetchRemoteGatewayWithExternalID:batchID:completion:](providerServiceStore, "fetchRemoteGatewayWithExternalID:batchID:completion:", v9, v10, v11);

}

void __70__WDClinicalOnboardingViewController__loadGatewayProxyForDeeplinking___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  _QWORD block[4];
  id v10;
  id v11;
  uint64_t v12;

  v5 = a2;
  v6 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __70__WDClinicalOnboardingViewController__loadGatewayProxyForDeeplinking___block_invoke_2;
  block[3] = &unk_1E74D11C8;
  v10 = v5;
  v11 = v6;
  v12 = *(_QWORD *)(a1 + 32);
  v7 = v6;
  v8 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __70__WDClinicalOnboardingViewController__loadGatewayProxyForDeeplinking___block_invoke_2(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  WDClinicalProviderDetailsViewController *v9;
  void *v10;
  WDClinicalProviderDetailsViewController *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v17[5];
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(a1 + 32))
  {
    v2 = objc_alloc(MEMORY[0x1E0D2EEC8]);
    objc_msgSend(*(id *)(a1 + 32), "title");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "subtitle");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "informationURL");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "brand");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = *(_QWORD *)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v2, "initWithExternalID:title:subtitle:location:informationURL:brand:gateways:", CFSTR("DEEPLINK_FAKEPROVIDEREXTERNALID"), v3, v4, 0, v5, v6, v7);

    v9 = [WDClinicalProviderDetailsViewController alloc];
    objc_msgSend(*(id *)(a1 + 48), "profile");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[WDClinicalProviderDetailsViewController initWithProfile:provider:](v9, "initWithProfile:provider:", v10, v8);

    objc_msgSend(*(id *)(a1 + 48), "navigationController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "pushViewController:animated:", v11, 1);

    objc_msgSend(*(id *)(a1 + 48), "navigationController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "transitionCoordinator");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __70__WDClinicalOnboardingViewController__loadGatewayProxyForDeeplinking___block_invoke_264;
    v17[3] = &unk_1E74D11A0;
    v17[4] = *(_QWORD *)(a1 + 48);
    objc_msgSend(v14, "animateAlongsideTransition:completion:", 0, v17);

  }
  else
  {
    _HKInitializeLogging();
    v15 = (void *)*MEMORY[0x1E0CB52D8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52D8], OS_LOG_TYPE_ERROR))
      __70__WDClinicalOnboardingViewController__loadGatewayProxyForDeeplinking___block_invoke_2_cold_1(a1, v15);
    objc_msgSend(*(id *)(a1 + 48), "setShowProviderNotFound:", 1);
    objc_msgSend(*(id *)(a1 + 48), "setPendingGatewayProxy:", 0);
  }
  return objc_msgSend(*(id *)(a1 + 48), "_configureLocationServices");
}

uint64_t __70__WDClinicalOnboardingViewController__loadGatewayProxyForDeeplinking___block_invoke_264(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setPendingGatewayProxy:", 0);
}

- (unint64_t)supportedInterfaceOrientations
{
  return 2;
}

- (void)_resetCacheAndReloadData
{
  -[NSMutableDictionary removeAllObjects](self->_resultsCache, "removeAllObjects");
  -[WDClinicalOnboardingViewController _searchUsingQuery:](self, "_searchUsingQuery:", &stru_1E74EA150);
}

- (void)reloadData
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  -[HRUITableViewSectionConfiguration removeAllSections](self->_sectionConfiguration, "removeAllSections");
  -[WDClinicalOnboardingViewController pendingGatewayProxy](self, "pendingGatewayProxy");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3 || -[WDClinicalOnboardingViewController showingMainSpinner](self, "showingMainSpinner"))
    goto LABEL_16;
  if (-[WDClinicalOnboardingViewController hasCompletedAtLeastOneFetch](self, "hasCompletedAtLeastOneFetch"))
  {
    if (-[WDClinicalOnboardingViewController hasSearchTerm](self, "hasSearchTerm"))
    {
      if (!-[NSMutableOrderedSet count](self->_alreadySharingSearchResults, "count"))
      {
        v8 = 0;
LABEL_9:
        if (-[NSMutableOrderedSet count](self->_supportedSearchResults, "count"))
        {
          -[HRUITableViewSectionConfiguration addSectionWithIdentifier:firstRowReuseIdentifier:](self->_sectionConfiguration, "addSectionWithIdentifier:firstRowReuseIdentifier:", CFSTR("SupportedLocations"), 0);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v10 = v9;
          if ((v8 & 1) != 0)
          {
            HRLocalizedString(CFSTR("HEALTH_RECORDS_ONBOARDING_SEARCH_SUGGESTIONS"));
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "setHeaderString:", v11);

          }
          else
          {
            objc_msgSend(v9, "setHeaderString:", 0);
          }
          -[WDClinicalOnboardingViewController _providerNotFoundExplanationMessage](self, "_providerNotFoundExplanationMessage");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "setFooterString:", v12);

          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[NSMutableOrderedSet count](self->_supportedSearchResults, "count"));
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "setEstimatedNumRows:", v13);

        }
        if (-[NSMutableOrderedSet count](self->_unsupportedSearchResults, "count"))
        {
          -[HRUITableViewSectionConfiguration addSectionWithIdentifier:firstRowReuseIdentifier:](self->_sectionConfiguration, "addSectionWithIdentifier:firstRowReuseIdentifier:", CFSTR("UnsupportedLocations"), 0);
          v3 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[NSMutableOrderedSet count](self->_unsupportedSearchResults, "count"));
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "setEstimatedNumRows:", v14);

LABEL_16:
          goto LABEL_17;
        }
        goto LABEL_17;
      }
      -[HRUITableViewSectionConfiguration addSectionWithIdentifier:firstRowReuseIdentifier:](self->_sectionConfiguration, "addSectionWithIdentifier:firstRowReuseIdentifier:", CFSTR("AlreadySharing"), 0);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      HROsloLocalizedString(CFSTR("HEALTH_RECORDS_ONBOARDING_ALREADY_SHARING"), v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setHeaderString:", v6);

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[NSMutableOrderedSet count](self->_alreadySharingSearchResults, "count"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setEstimatedNumRows:", v7);

    }
    v8 = 1;
    goto LABEL_9;
  }
LABEL_17:
  -[WDClinicalOnboardingViewController tableView](self, "tableView");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "reloadData");

}

- (void)setShowProviderNotFound:(BOOL)a3
{
  void *v4;

  self->_showProviderNotFound = a3;
  if (-[WDClinicalOnboardingViewController isViewLoaded](self, "isViewLoaded"))
  {
    if (self->_showProviderNotFound)
    {
      -[WDClinicalOnboardingViewController _configureProviderNotFoundView](self, "_configureProviderNotFoundView");
    }
    else
    {
      -[WDClinicalOnboardingViewController tableView](self, "tableView");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setTableHeaderView:", 0);

      -[WDClinicalOnboardingViewController setProviderNotFoundView:](self, "setProviderNotFoundView:", 0);
    }
    -[WDClinicalOnboardingViewController _updateTableHeaderViewHeight](self, "_updateTableHeaderViewHeight");
  }
}

- (void)_configureProviderNotFoundView
{
  HRProviderNotFoundView *v3;
  HRProviderNotFoundView *v4;
  void *v5;
  id v6;

  v3 = [HRProviderNotFoundView alloc];
  v4 = -[HRProviderNotFoundView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  -[WDClinicalOnboardingViewController setProviderNotFoundView:](self, "setProviderNotFoundView:", v4);

  -[WDClinicalOnboardingViewController providerNotFoundView](self, "providerNotFoundView");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[WDClinicalOnboardingViewController tableView](self, "tableView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTableHeaderView:", v6);

}

- (void)viewDidLayoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)WDClinicalOnboardingViewController;
  -[WDClinicalOnboardingViewController viewDidLayoutSubviews](&v3, sel_viewDidLayoutSubviews);
  -[WDClinicalOnboardingViewController _updateTableHeaderViewHeight](self, "_updateTableHeaderViewHeight");
}

- (void)_updateTableHeaderViewHeight
{
  void *v3;
  _QWORD v4[5];

  -[WDClinicalOnboardingViewController providerNotFoundView](self, "providerNotFoundView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __66__WDClinicalOnboardingViewController__updateTableHeaderViewHeight__block_invoke;
    v4[3] = &unk_1E74D1218;
    v4[4] = self;
    objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:animations:", v4, 0.0);
  }
}

void __66__WDClinicalOnboardingViewController__updateTableHeaderViewHeight__block_invoke(uint64_t a1)
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  id v12;

  objc_msgSend(*(id *)(a1 + 32), "providerNotFoundView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "frame");
  v4 = v3;
  v6 = v5;
  v8 = v7;

  objc_msgSend(*(id *)(a1 + 32), "providerNotFoundView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "systemLayoutSizeFittingSize:", *MEMORY[0x1E0DC4FF8], *(double *)(MEMORY[0x1E0DC4FF8] + 8));
  v11 = v10;

  objc_msgSend(*(id *)(a1 + 32), "providerNotFoundView");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setFrame:", v4, v6, v8, v11);

}

- (void)_configureLocationServices
{
  CLLocationManager *v3;
  CLLocationManager *locationManager;

  if (!self->_locationManager)
  {
    v3 = (CLLocationManager *)objc_alloc_init(MEMORY[0x1E0C9E3C8]);
    locationManager = self->_locationManager;
    self->_locationManager = v3;

    -[CLLocationManager setDelegate:](self->_locationManager, "setDelegate:", self);
  }
}

- (void)locationManagerDidChangeAuthorization:(id)a3
{
  id v4;
  int v5;
  uint64_t v6;
  double *v7;
  void *v8;
  void *v9;
  BOOL v10;

  v4 = a3;
  v5 = objc_msgSend(v4, "authorizationStatus");
  if ((v5 - 1) < 2)
  {
    -[WDClinicalOnboardingViewController _configureDeniedAuthorization](self, "_configureDeniedAuthorization");
  }
  else if ((v5 - 3) >= 2)
  {
    if (!v5)
      -[WDClinicalOnboardingViewController _requestWhenInUseAuthorizationIfNeeded](self, "_requestWhenInUseAuthorizationIfNeeded");
  }
  else
  {
    v6 = objc_msgSend(v4, "accuracyAuthorization");
    v7 = (double *)MEMORY[0x1E0C9E4F8];
    if (v6)
      v7 = (double *)MEMORY[0x1E0C9E4E0];
    objc_msgSend(v4, "setDesiredAccuracy:", *v7);
    _HKInitializeLogging();
    v8 = (void *)*MEMORY[0x1E0CB52D8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52D8], OS_LOG_TYPE_DEBUG))
      -[WDClinicalOnboardingViewController locationManagerDidChangeAuthorization:].cold.1(v8);
    objc_msgSend(v4, "startUpdatingLocation");
    -[HRUITableViewSectionConfiguration sections](self->_sectionConfiguration, "sections");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "count"))
    {

    }
    else
    {
      v10 = -[WDClinicalOnboardingViewController showingNoLocations](self, "showingNoLocations");

      if (!v10)
        -[WDClinicalOnboardingViewController _showSpinnerView](self, "_showSpinnerView");
    }
  }

}

- (void)locationManager:(id)a3 didUpdateLocations:(id)a4
{
  id v6;
  id v7;
  void *v8;
  CLLocation *v9;
  CLLocation *location;
  CLLocationManager *locationManager;

  v6 = a3;
  v7 = a4;
  _HKInitializeLogging();
  v8 = (void *)*MEMORY[0x1E0CB52D8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52D8], OS_LOG_TYPE_DEBUG))
    -[WDClinicalOnboardingViewController locationManager:didUpdateLocations:].cold.1(v8);
  objc_msgSend(v6, "stopUpdatingLocation");
  objc_msgSend(v7, "lastObject");
  v9 = (CLLocation *)objc_claimAutoreleasedReturnValue();

  location = self->_location;
  self->_location = v9;

  locationManager = self->_locationManager;
  self->_locationManager = 0;

  -[WDClinicalOnboardingViewController setLocationEnabled:](self, "setLocationEnabled:", 1);
  -[WDClinicalOnboardingViewController _presentInitialResultsIfNecessary](self, "_presentInitialResultsIfNecessary");

}

- (void)locationManager:(id)a3 didFailWithError:(id)a4
{
  id v6;
  CLLocationManager *locationManager;
  uint64_t v8;
  NSObject *v9;
  _BOOL4 v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v6 = a4;
  objc_msgSend(a3, "stopUpdatingLocation");
  locationManager = self->_locationManager;
  self->_locationManager = 0;

  if (objc_msgSend(v6, "code") == 1)
  {
    -[WDClinicalOnboardingViewController _configureDeniedAuthorization](self, "_configureDeniedAuthorization");
  }
  else
  {
    -[WDClinicalOnboardingViewController _presentInitialResultsIfNecessary](self, "_presentInitialResultsIfNecessary");
    v8 = objc_msgSend(v6, "code");
    _HKInitializeLogging();
    v9 = *MEMORY[0x1E0CB52D8];
    v10 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52D8], OS_LOG_TYPE_ERROR);
    if (v8)
    {
      if (v10)
        -[WDClinicalOnboardingViewController locationManager:didFailWithError:].cold.2();
    }
    else if (v10)
    {
      -[WDClinicalOnboardingViewController locationManager:didFailWithError:].cold.1(v9, v11, v12, v13, v14, v15, v16, v17);
    }
  }

}

- (void)_requestWhenInUseAuthorizationIfNeeded
{
  void *v3;
  void *v4;

  if (self->_locationManager)
  {
    -[WDClinicalOnboardingViewController viewIfLoaded](self, "viewIfLoaded");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "window");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
      -[CLLocationManager requestWhenInUseAuthorization](self->_locationManager, "requestWhenInUseAuthorization");
  }
}

- (void)_configureDeniedAuthorization
{
  OUTLINED_FUNCTION_11(&dword_1BC30A000, a1, a3, "user denied location authorization", a5, a6, a7, a8, 0);
}

- (void)_disableLocationAwareness
{
  CLLocation *location;
  id v4;

  location = self->_location;
  self->_location = 0;

  -[WDClinicalOnboardingViewController setLocationEnabled:](self, "setLocationEnabled:", 0);
  -[WDClinicalOnboardingViewController resultsCache](self, "resultsCache");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", 0, CFSTR("DefaultListKey"));

}

- (void)willPresentSearchController:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  -[WDClinicalOnboardingViewController presentingViewController](self, "presentingViewController", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[WDClinicalOnboardingViewController navigationItem](self, "navigationItem");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "leftBarButtonItem");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setHidden:", 1);

  }
}

- (void)willDismissSearchController:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  -[WDClinicalOnboardingViewController setSearchQuery:](self, "setSearchQuery:", &stru_1E74EA150);
  -[WDClinicalOnboardingViewController setSearchTerms:](self, "setSearchTerms:", MEMORY[0x1E0C9AA60]);
  -[WDClinicalOnboardingViewController presentingViewController](self, "presentingViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[WDClinicalOnboardingViewController navigationItem](self, "navigationItem");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "leftBarButtonItem");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setHidden:", 0);

  }
}

- (void)updateSearchResultsForSearchController:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  void *v8;
  NSTimer *v9;
  NSTimer *searchTimer;
  _QWORD v11[5];
  id v12;

  v4 = a3;
  -[WDClinicalOnboardingViewController _hideNoGeoView](self, "_hideNoGeoView");
  objc_msgSend(v4, "searchBar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "text");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "length"))
  {
    -[NSTimer invalidate](self->_searchTimer, "invalidate");
    v7 = dbl_1BC636F70[(unint64_t)objc_msgSend(v6, "length") > 6];
    v8 = (void *)MEMORY[0x1E0C99E88];
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __77__WDClinicalOnboardingViewController_updateSearchResultsForSearchController___block_invoke;
    v11[3] = &unk_1E74D1240;
    v11[4] = self;
    v12 = v6;
    objc_msgSend(v8, "scheduledTimerWithTimeInterval:repeats:block:", 0, v11, v7);
    v9 = (NSTimer *)objc_claimAutoreleasedReturnValue();
    searchTimer = self->_searchTimer;
    self->_searchTimer = v9;

  }
  else
  {
    -[WDClinicalOnboardingViewController _cancelSearch](self, "_cancelSearch");
  }

}

void __77__WDClinicalOnboardingViewController_updateSearchResultsForSearchController___block_invoke(uint64_t a1)
{
  _QWORD block[5];

  objc_msgSend(*(id *)(a1 + 32), "_searchUsingQuery:", *(_QWORD *)(a1 + 40));
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __77__WDClinicalOnboardingViewController_updateSearchResultsForSearchController___block_invoke_2;
  block[3] = &unk_1E74D1218;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

_BYTE *__77__WDClinicalOnboardingViewController_updateSearchResultsForSearchController___block_invoke_2(uint64_t a1)
{
  _BYTE *result;

  result = *(_BYTE **)(a1 + 32);
  if (result[1064])
    return (_BYTE *)objc_msgSend(result, "setShowProviderNotFound:", 0);
  return result;
}

- (void)_cancelSearch
{
  NSTimer *searchTimer;
  void *v4;
  id v5;

  -[NSTimer invalidate](self->_searchTimer, "invalidate");
  searchTimer = self->_searchTimer;
  self->_searchTimer = 0;

  -[WDClinicalOnboardingViewController setAlreadySharingSearchResults:](self, "setAlreadySharingSearchResults:", 0);
  -[WDClinicalOnboardingViewController setUnsupportedSearchResults:](self, "setUnsupportedSearchResults:", 0);
  -[WDClinicalOnboardingViewController setSupportedSearchResults:](self, "setSupportedSearchResults:", 0);
  -[UISearchController searchBar](self->_searchController, "searchBar");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "text");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDClinicalOnboardingViewController _searchUsingQuery:](self, "_searchUsingQuery:", v4);

}

- (void)_presentInitialResultsIfNecessary
{
  if (!-[WDClinicalOnboardingViewController hasSearchTerm](self, "hasSearchTerm"))
    -[WDClinicalOnboardingViewController _searchUsingQuery:](self, "_searchUsingQuery:", &stru_1E74EA150);
}

- (void)_searchUsingQuery:(id)a3
{
  void *v4;
  _BOOL4 v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a3;
  -[WDClinicalOnboardingViewController searchQuery](self, "searchQuery");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "length"))
    v5 = 0;
  else
    v5 = objc_msgSend(v15, "length") != 0;

  -[WDClinicalOnboardingViewController _cacheKeyForSearchQuery:](self, "_cacheKeyForSearchQuery:", v15);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDClinicalOnboardingViewController setSearchQuery:](self, "setSearchQuery:", v15);
  objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "componentsSeparatedByCharactersInSet:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDClinicalOnboardingViewController setSearchTerms:](self, "setSearchTerms:", v8);

  -[WDClinicalOnboardingViewController _hideSpinnerView](self, "_hideSpinnerView");
  if (-[WDClinicalOnboardingViewController locationEnabled](self, "locationEnabled") || objc_msgSend(v15, "length"))
  {
    -[WDClinicalOnboardingViewController resultsCache](self, "resultsCache");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:", v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("AlreadySharingKey"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[WDClinicalOnboardingViewController setAlreadySharingSearchResults:](self, "setAlreadySharingSearchResults:", v11);

      objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("SupportedKey"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[WDClinicalOnboardingViewController setSupportedSearchResults:](self, "setSupportedSearchResults:", v12);

      objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("UnsupportedKey"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[WDClinicalOnboardingViewController setUnsupportedSearchResults:](self, "setUnsupportedSearchResults:", v13);

      objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("NextFromKey"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[WDClinicalOnboardingViewController setNextFrom:](self, "setNextFrom:", objc_msgSend(v14, "integerValue"));

      -[WDClinicalOnboardingViewController setSpinnerIndexPath:](self, "setSpinnerIndexPath:", 0);
      -[WDClinicalOnboardingViewController reloadData](self, "reloadData");
      -[WDClinicalOnboardingViewController _showNoLocationsViewIfNeeded](self, "_showNoLocationsViewIfNeeded");
    }
    else
    {
      if (v5)
      {
        -[WDClinicalOnboardingViewController _resetSearchResults](self, "_resetSearchResults");
        -[WDClinicalOnboardingViewController reloadData](self, "reloadData");
      }
      -[WDClinicalOnboardingViewController setNextFrom:](self, "setNextFrom:", 0);
      -[WDClinicalOnboardingViewController _searchResultsForQuery:from:](self, "_searchResultsForQuery:from:", v15, 0);
    }

  }
  else if (-[WDClinicalOnboardingViewController _isSimulator](self, "_isSimulator"))
  {
    ++self->_searchesInFlight;
    -[WDClinicalOnboardingViewController _didFetchResultsForQuery:searchResultsPage:error:](self, "_didFetchResultsForQuery:searchResultsPage:error:", &stru_1E74EA150, 0, 0);
  }
  else
  {
    -[WDClinicalOnboardingViewController _resetSearchResults](self, "_resetSearchResults");
    if (!-[UISearchController isActive](self->_searchController, "isActive"))
      -[WDClinicalOnboardingViewController _showNoGeoView](self, "_showNoGeoView");
    -[WDClinicalOnboardingViewController reloadData](self, "reloadData");
  }

}

- (void)_searchResultsForQuery:(id)a3 from:(int64_t)a4
{
  id v6;
  CLLocation *location;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  void *v12;
  void *v13;
  HKClinicalProviderServiceStore *providerServiceStore;
  id v15;
  _QWORD v16[5];
  id v17;

  v6 = a3;
  location = self->_location;
  if (location)
  {
    v8 = (void *)MEMORY[0x1E0CB37E8];
    -[CLLocation coordinate](location, "coordinate");
    objc_msgSend(v8, "numberWithDouble:");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)MEMORY[0x1E0CB37E8];
    -[CLLocation coordinate](self->_location, "coordinate");
    objc_msgSend(v10, "numberWithDouble:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = 0;
    v9 = 0;
  }
  -[HKClinicalProviderServiceStore cancelInFlightSearchQueriesWithCompletion:](self->_providerServiceStore, "cancelInFlightSearchQueriesWithCompletion:", &__block_literal_global_281);
  if (!-[WDClinicalOnboardingViewController hasSearchResults](self, "hasSearchResults"))
    -[WDClinicalOnboardingViewController _showSpinnerView](self, "_showSpinnerView");
  ++self->_searchesInFlight;
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D2EED0]), "initWithSearchString:latitude:longitude:pageOffset:options:", v6, v9, v12, a4, self->_showOnlyClinicalSharingCapableProviders);
  providerServiceStore = self->_providerServiceStore;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __66__WDClinicalOnboardingViewController__searchResultsForQuery_from___block_invoke_283;
  v16[3] = &unk_1E74D12B0;
  v16[4] = self;
  v17 = v6;
  v15 = v6;
  -[HKClinicalProviderServiceStore fetchRemoteSearchResultsPageForQuery:completion:](providerServiceStore, "fetchRemoteSearchResultsPageForQuery:completion:", v13, v16);

}

void __66__WDClinicalOnboardingViewController__searchResultsForQuery_from___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v4;

  v4 = a3;
  if ((a2 & 1) == 0)
  {
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52D8], OS_LOG_TYPE_ERROR))
      __66__WDClinicalOnboardingViewController__searchResultsForQuery_from___block_invoke_cold_1();
  }

}

void __66__WDClinicalOnboardingViewController__searchResultsForQuery_from___block_invoke_283(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;
  id v13;

  v5 = a2;
  v6 = a3;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __66__WDClinicalOnboardingViewController__searchResultsForQuery_from___block_invoke_2;
  v10[3] = &unk_1E74D1288;
  v7 = *(void **)(a1 + 40);
  v10[4] = *(_QWORD *)(a1 + 32);
  v11 = v7;
  v12 = v5;
  v13 = v6;
  v8 = v6;
  v9 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], v10);

}

uint64_t __66__WDClinicalOnboardingViewController__searchResultsForQuery_from___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setHasCompletedAtLeastOneFetch:", 1);
  return objc_msgSend(*(id *)(a1 + 32), "_didFetchResultsForQuery:searchResultsPage:error:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

- (void)_didFetchResultsForQuery:(id)a3 searchResultsPage:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  id v47;
  id v48;
  id v49;
  _QWORD v50[5];
  _QWORD v51[5];
  _QWORD v52[4];
  _QWORD v53[6];

  v53[4] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  --self->_searchesInFlight;
  -[WDClinicalOnboardingViewController _hideSpinnerView](self, "_hideSpinnerView");
  if (v9 || (objc_msgSend(v10, "hk_isUserCanceledError") & 1) == 0)
  {
    -[WDClinicalOnboardingViewController _cacheKeyForSearchQuery:](self, "_cacheKeyForSearchQuery:", v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v9;
    if (-[WDClinicalOnboardingViewController _isSimulator](self, "_isSimulator"))
    {
      -[WDClinicalOnboardingViewController setHasCompletedAtLeastOneFetch:](self, "setHasCompletedAtLeastOneFetch:", 1);
      if (v9)
        goto LABEL_7;
      v13 = objc_alloc(MEMORY[0x1E0D2EEE0]);
      v12 = (id)objc_msgSend(v13, "initWithSearchResults:from:nextFrom:size:", MEMORY[0x1E0C9AA60], 0, 0, 0);
    }
    if (!v12)
    {
      -[WDClinicalOnboardingViewController resultsCache](self, "resultsCache");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "removeObjectForKey:", v11);

      -[WDClinicalOnboardingViewController _resetSearchResults](self, "_resetSearchResults");
      -[WDClinicalOnboardingViewController setNextFrom:](self, "setNextFrom:", 0);
      -[WDClinicalOnboardingViewController setSpinnerIndexPath:](self, "setSpinnerIndexPath:", 0);
      -[WDClinicalOnboardingViewController reloadData](self, "reloadData");
      -[WDClinicalOnboardingViewController _showNoLocationsViewIfNeeded](self, "_showNoLocationsViewIfNeeded");
      if (v10)
        -[WDClinicalOnboardingViewController _presentError:](self, "_presentError:", v10);
      goto LABEL_26;
    }
LABEL_7:
    v48 = v9;
    -[WDClinicalOnboardingViewController resultsCache](self, "resultsCache");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = v11;
    objc_msgSend(v14, "objectForKeyedSubscript:", v11);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("AlreadySharingKey"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
      objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("AlreadySharingKey"));
    else
      -[WDClinicalOnboardingViewController _emptyMutableOrderedSet](self, "_emptyMutableOrderedSet");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[WDClinicalOnboardingViewController setAlreadySharingSearchResults:](self, "setAlreadySharingSearchResults:", v17);

    LODWORD(v17) = -[WDClinicalOnboardingViewController _isSimulator](self, "_isSimulator");
    objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("SupportedKey"));
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = (void *)v18;
    if ((_DWORD)v17)
    {
      if (!v18)
      {
        -[WDClinicalOnboardingViewController _mutableOrderedSetWithSampleAccountsForQuery:](self, "_mutableOrderedSetWithSampleAccountsForQuery:", v8);
        v20 = objc_claimAutoreleasedReturnValue();
LABEL_18:
        v22 = (void *)v20;
        -[WDClinicalOnboardingViewController setSupportedSearchResults:](self, "setSupportedSearchResults:", v20);

        objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("UnsupportedKey"));
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        if (v23)
          objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("UnsupportedKey"));
        else
          -[WDClinicalOnboardingViewController _emptyMutableOrderedSet](self, "_emptyMutableOrderedSet");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        -[WDClinicalOnboardingViewController setUnsupportedSearchResults:](self, "setUnsupportedSearchResults:", v24);

        objc_msgSend(v12, "searchResults");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = MEMORY[0x1E0C809B0];
        v51[0] = MEMORY[0x1E0C809B0];
        v51[1] = 3221225472;
        v51[2] = __87__WDClinicalOnboardingViewController__didFetchResultsForQuery_searchResultsPage_error___block_invoke;
        v51[3] = &unk_1E74D12D8;
        v51[4] = self;
        objc_msgSend(v25, "hk_filter:", v51);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "hk_filter:", &__block_literal_global_287);
        v28 = objc_claimAutoreleasedReturnValue();
        v50[0] = v26;
        v50[1] = 3221225472;
        v50[2] = __87__WDClinicalOnboardingViewController__didFetchResultsForQuery_searchResultsPage_error___block_invoke_3;
        v50[3] = &unk_1E74D12D8;
        v50[4] = self;
        v44 = v25;
        objc_msgSend(v25, "hk_filter:", v50);
        v29 = objc_claimAutoreleasedReturnValue();
        -[WDClinicalOnboardingViewController alreadySharingSearchResults](self, "alreadySharingSearchResults");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v43 = (void *)v29;
        objc_msgSend(v30, "addObjectsFromArray:", v29);

        v49 = v8;
        v47 = v10;
        v45 = v15;
        if (-[NSArray count](self->_alreadyConnectedAccounts, "count")
          && !objc_msgSend(v12, "from")
          && !-[WDClinicalOnboardingViewController hasSearchTerm](self, "hasSearchTerm"))
        {
          -[NSArray arrayByAddingObjectsFromArray:](self->_alreadyConnectedAccounts, "arrayByAddingObjectsFromArray:", v27);
          v31 = objc_claimAutoreleasedReturnValue();

          v27 = (void *)v31;
        }
        -[WDClinicalOnboardingViewController supportedSearchResults](self, "supportedSearchResults");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v42 = v27;
        objc_msgSend(v32, "addObjectsFromArray:", v27);

        -[WDClinicalOnboardingViewController unsupportedSearchResults](self, "unsupportedSearchResults");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = (void *)v28;
        objc_msgSend(v33, "addObjectsFromArray:", v28);

        -[WDClinicalOnboardingViewController setNextFrom:](self, "setNextFrom:", objc_msgSend(v12, "nextFrom"));
        v52[0] = CFSTR("AlreadySharingKey");
        -[WDClinicalOnboardingViewController alreadySharingSearchResults](self, "alreadySharingSearchResults");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v53[0] = v35;
        v52[1] = CFSTR("SupportedKey");
        -[WDClinicalOnboardingViewController supportedSearchResults](self, "supportedSearchResults");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v53[1] = v36;
        v52[2] = CFSTR("UnsupportedKey");
        -[WDClinicalOnboardingViewController unsupportedSearchResults](self, "unsupportedSearchResults");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v53[2] = v37;
        v52[3] = CFSTR("NextFromKey");
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v12, "nextFrom"));
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v53[3] = v38;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v53, v52, 4);
        v39 = v12;
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        -[WDClinicalOnboardingViewController resultsCache](self, "resultsCache");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = v46;
        objc_msgSend(v41, "setObject:forKeyedSubscript:", v40, v46);

        -[WDClinicalOnboardingViewController setSpinnerIndexPath:](self, "setSpinnerIndexPath:", 0);
        -[WDClinicalOnboardingViewController reloadData](self, "reloadData");
        -[WDClinicalOnboardingViewController _showNoLocationsViewIfNeeded](self, "_showNoLocationsViewIfNeeded");

        v9 = v48;
        v8 = v49;
        v10 = v47;
LABEL_26:

        goto LABEL_27;
      }
    }
    else if (!v18)
    {
      -[WDClinicalOnboardingViewController _emptyMutableOrderedSet](self, "_emptyMutableOrderedSet");
      v20 = objc_claimAutoreleasedReturnValue();
      goto LABEL_18;
    }
    objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("SupportedKey"));
    v20 = objc_claimAutoreleasedReturnValue();
    goto LABEL_18;
  }
LABEL_27:

}

uint64_t __87__WDClinicalOnboardingViewController__didFetchResultsForQuery_searchResultsPage_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;

  v3 = a2;
  if (objc_msgSend(v3, "isSupported"))
  {
    v4 = *(void **)(*(_QWORD *)(a1 + 32) + 1104);
    objc_msgSend(v3, "brand");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v4, "containsObject:", v5) & 1) != 0)
    {
      v6 = 0;
    }
    else
    {
      v7 = *(void **)(*(_QWORD *)(a1 + 32) + 1096);
      objc_msgSend(v3, "brand");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v7, "containsObject:", v8) ^ 1;

    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

uint64_t __87__WDClinicalOnboardingViewController__didFetchResultsForQuery_searchResultsPage_error___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isSupported") ^ 1;
}

uint64_t __87__WDClinicalOnboardingViewController__didFetchResultsForQuery_searchResultsPage_error___block_invoke_3(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 1104);
  objc_msgSend(a2, "brand");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "containsObject:", v3);

  return v4;
}

- (id)_cacheKeyForSearchQuery:(id)a3
{
  __CFString *v3;
  __CFString *v4;
  __CFString *v5;

  v3 = (__CFString *)a3;
  if (-[__CFString length](v3, "length"))
    v4 = v3;
  else
    v4 = CFSTR("DefaultListKey");
  v5 = v4;

  return v5;
}

- (void)_resetSearchResults
{
  void *v3;
  void *v4;
  id v5;

  -[WDClinicalOnboardingViewController _emptyMutableOrderedSet](self, "_emptyMutableOrderedSet");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDClinicalOnboardingViewController setAlreadySharingSearchResults:](self, "setAlreadySharingSearchResults:", v3);

  -[WDClinicalOnboardingViewController _emptyMutableOrderedSet](self, "_emptyMutableOrderedSet");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDClinicalOnboardingViewController setSupportedSearchResults:](self, "setSupportedSearchResults:", v4);

  -[WDClinicalOnboardingViewController _emptyMutableOrderedSet](self, "_emptyMutableOrderedSet");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[WDClinicalOnboardingViewController setUnsupportedSearchResults:](self, "setUnsupportedSearchResults:", v5);

}

- (id)_emptyMutableOrderedSet
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E10]), "initWithCapacity:", 50);
}

- (id)_mutableOrderedSetWithSampleAccountsForQuery:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;

  v4 = a3;
  -[WDClinicalOnboardingViewController _emptyMutableOrderedSet](self, "_emptyMutableOrderedSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "length");

  if (!v6)
  {
    -[WDClinicalOnboardingViewController sampleAccountsLoader](self, "sampleAccountsLoader");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "sampleAccountsAsSearchResults");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "addObjectsFromArray:", v8);
  }
  return v5;
}

- (void)scrollViewDidChangeAdjustedContentInset:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[WDClinicalOnboardingViewController tableView](self, "tableView");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == v4)
    -[WDClinicalOnboardingViewController _updateNoContentViewConstraints](self, "_updateNoContentViewConstraints");
}

- (void)_updateNoContentViewConstraints
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  id WeakRetained;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  id v15;
  id v16;

  -[WDClinicalOnboardingViewController tableView](self, "tableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "adjustedContentInset");
  v5 = v4;
  -[WDClinicalOnboardingViewController tableView](self, "tableView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "safeAreaInsets");
  v8 = v5 - v7;
  WeakRetained = objc_loadWeakRetained((id *)&self->_noContentTopConstraint);
  objc_msgSend(WeakRetained, "setConstant:", v8);

  -[WDClinicalOnboardingViewController tableView](self, "tableView");
  v16 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "adjustedContentInset");
  v11 = v10;
  -[WDClinicalOnboardingViewController tableView](self, "tableView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "safeAreaInsets");
  v14 = -(v11 - v13);
  v15 = objc_loadWeakRetained((id *)&self->_noContentBottomConstraint);
  objc_msgSend(v15, "setConstant:", v14);

}

- (id)_createNoContentParentView
{
  id v2;

  v2 = objc_alloc_init(MEMORY[0x1E0DC3F10]);
  objc_msgSend(v2, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v2, "setPreservesSuperviewLayoutMargins:", 1);
  objc_msgSend(v2, "setClipsToBounds:", 1);
  return v2;
}

- (void)_showNoContentView:(id)a3
{
  id v4;
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
  float v15;
  double v16;
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
  void *v37;
  void *v38;
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
  void *v57;
  id v58;
  void *v59;
  _QWORD v60[5];
  _QWORD v61[8];

  v61[6] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[UIView subviews](self->_noContentParentView, "subviews");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "makeObjectsPerformSelector:", sel_removeFromSuperview);

  if (v4)
  {
    if (self->_noContentParentView)
    {
      -[WDClinicalOnboardingViewController setNoContentParentView:](self, "setNoContentParentView:");
    }
    else
    {
      -[WDClinicalOnboardingViewController _createNoContentParentView](self, "_createNoContentParentView");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[WDClinicalOnboardingViewController setNoContentParentView:](self, "setNoContentParentView:", v6);

    }
    -[UIView addSubview:](self->_noContentParentView, "addSubview:", v4);
    objc_msgSend(v4, "topAnchor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView safeAreaLayoutGuide](self->_noContentParentView, "safeAreaLayoutGuide");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "topAnchor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "constraintGreaterThanOrEqualToSystemSpacingBelowAnchor:multiplier:", v9, 1.0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v59 = v10;
    -[WDClinicalOnboardingViewController setNoContentTopConstraint:](self, "setNoContentTopConstraint:", v10);
    objc_msgSend(v4, "bottomAnchor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView safeAreaLayoutGuide](self->_noContentParentView, "safeAreaLayoutGuide");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "bottomAnchor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "constraintLessThanOrEqualToSystemSpacingBelowAnchor:multiplier:", v13, 1.0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "priority");
    *(float *)&v16 = v15 + -1.0;
    objc_msgSend(v14, "setPriority:", v16);
    -[WDClinicalOnboardingViewController setNoContentBottomConstraint:](self, "setNoContentBottomConstraint:", v14);
    -[WDClinicalOnboardingViewController _updateNoContentViewConstraints](self, "_updateNoContentViewConstraints");
    v45 = (void *)MEMORY[0x1E0CB3718];
    objc_msgSend(v4, "widthAnchor");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView widthAnchor](self->_noContentParentView, "widthAnchor");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "constraintLessThanOrEqualToAnchor:", v53);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v61[0] = v51;
    objc_msgSend(v4, "centerXAnchor");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView centerXAnchor](self->_noContentParentView, "centerXAnchor");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "constraintEqualToAnchor:", v47);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v61[1] = v17;
    objc_msgSend(v4, "leadingAnchor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView leadingAnchor](self->_noContentParentView, "leadingAnchor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "constraintGreaterThanOrEqualToAnchor:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v61[2] = v20;
    v58 = v4;
    objc_msgSend(v4, "trailingAnchor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView trailingAnchor](self->_noContentParentView, "trailingAnchor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "constraintLessThanOrEqualToAnchor:", v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v61[3] = v23;
    v61[4] = v59;
    v57 = v14;
    v61[5] = v14;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v61, 6);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "activateConstraints:", v24);

    -[UIView superview](self->_noContentParentView, "superview");
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v25)
    {
      -[WDClinicalOnboardingViewController tableView](self, "tableView");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "addSubview:", self->_noContentParentView);

      v41 = (void *)MEMORY[0x1E0CB3718];
      -[UIView widthAnchor](self->_noContentParentView, "widthAnchor");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      -[WDClinicalOnboardingViewController tableView](self, "tableView");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v56, "widthAnchor");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v54, "constraintEqualToAnchor:", v52);
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      v60[0] = v50;
      -[UIView topAnchor](self->_noContentParentView, "topAnchor");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      -[WDClinicalOnboardingViewController tableView](self, "tableView");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "safeAreaLayoutGuide");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "topAnchor");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "constraintEqualToAnchor:", v43);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v60[1] = v42;
      -[UIView bottomAnchor](self->_noContentParentView, "bottomAnchor");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      -[WDClinicalOnboardingViewController tableView](self, "tableView");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "safeAreaLayoutGuide");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "bottomAnchor");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "constraintEqualToAnchor:", v37);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v60[2] = v27;
      -[UIView leadingAnchor](self->_noContentParentView, "leadingAnchor");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      -[WDClinicalOnboardingViewController tableView](self, "tableView");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "leadingAnchor");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "constraintEqualToAnchor:", v30);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v60[3] = v31;
      -[UIView trailingAnchor](self->_noContentParentView, "trailingAnchor");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      -[WDClinicalOnboardingViewController tableView](self, "tableView");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "trailingAnchor");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "constraintEqualToAnchor:", v34);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v60[4] = v35;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v60, 5);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "activateConstraints:", v36);

    }
    v4 = v58;
  }
  else
  {
    -[UIView removeFromSuperview](self->_noContentParentView, "removeFromSuperview");
  }

}

- (BOOL)showingNoLocations
{
  void *v2;
  BOOL v3;

  -[_UIContentUnavailableView superview](self->_noLocationsView, "superview");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (id)_createNoLocationsView
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;

  v3 = objc_alloc(MEMORY[0x1E0DC40B8]);
  HRLocalizedString(CFSTR("HEALTH_RECORDS_ONBOARDING_NO_LOCATIONS_FOUND"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithFrame:title:style:", v4, 0, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));

  objc_msgSend(v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[WDClinicalOnboardingViewController _providerNotFoundExplanationMessage](self, "_providerNotFoundExplanationMessage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setMessage:", v6);

  LODWORD(v7) = 1148846080;
  objc_msgSend(v5, "setContentCompressionResistancePriority:forAxis:", 1, v7);
  return v5;
}

- (void)_showNoLocationsViewIfNeeded
{
  void *v3;
  void *v4;

  if (-[WDClinicalOnboardingViewController hasSearchResults](self, "hasSearchResults"))
  {
    -[WDClinicalOnboardingViewController _hideNoLocationsView](self, "_hideNoLocationsView");
  }
  else
  {
    -[_UIContentUnavailableView superview](self->_noLocationsView, "superview");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v3)
    {
      if (self->_noLocationsView)
      {
        -[WDClinicalOnboardingViewController setNoLocationsView:](self, "setNoLocationsView:");
      }
      else
      {
        -[WDClinicalOnboardingViewController _createNoLocationsView](self, "_createNoLocationsView");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        -[WDClinicalOnboardingViewController setNoLocationsView:](self, "setNoLocationsView:", v4);

      }
      -[WDClinicalOnboardingViewController _showNoContentView:](self, "_showNoContentView:", self->_noLocationsView);
    }
  }
}

- (void)_hideNoLocationsView
{
  -[WDClinicalOnboardingViewController _showNoContentView:](self, "_showNoContentView:", 0);
}

- (BOOL)showingMainSpinner
{
  void *v2;
  BOOL v3;

  -[HRWDSpinnerView superview](self->_spinnerView, "superview");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (id)_createSpinnerView
{
  HRWDSpinnerView *v2;
  void *v3;
  void *v4;

  v2 = objc_alloc_init(HRWDSpinnerView);
  -[HRWDSpinnerView setTranslatesAutoresizingMaskIntoConstraints:](v2, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  HRLocalizedString(CFSTR("LOADING_NO_ELLIPSIS"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HRWDSpinnerView setMessageWhileSpinning:](v2, "setMessageWhileSpinning:", v3);

  objc_msgSend(MEMORY[0x1E0DC1350], "_preferredFontForTextStyle:variant:", *MEMORY[0x1E0DC4B10], 1024);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HRWDSpinnerView setMessageFont:](v2, "setMessageFont:", v4);

  return v2;
}

- (void)_showSpinnerView
{
  void *v3;
  void *v4;

  -[HRWDSpinnerView superview](self->_spinnerView, "superview");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    if (self->_spinnerView)
    {
      -[WDClinicalOnboardingViewController setSpinnerView:](self, "setSpinnerView:");
    }
    else
    {
      -[WDClinicalOnboardingViewController _createSpinnerView](self, "_createSpinnerView");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      -[WDClinicalOnboardingViewController setSpinnerView:](self, "setSpinnerView:", v4);

    }
    -[WDClinicalOnboardingViewController _showNoContentView:](self, "_showNoContentView:", self->_spinnerView);
    -[HRWDSpinnerView startSpinner](self->_spinnerView, "startSpinner");
  }
}

- (void)_hideSpinnerView
{
  -[HRWDSpinnerView stopSpinner](self->_spinnerView, "stopSpinner");
  -[WDClinicalOnboardingViewController _showNoContentView:](self, "_showNoContentView:", 0);
}

- (BOOL)showingNoGeoView
{
  void *v2;
  BOOL v3;

  -[WDClinicalOnboardingNoGeoView superview](self->_noGeoView, "superview");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (id)_createNoGeoView
{
  WDClinicalOnboardingNoGeoView *v2;

  v2 = objc_alloc_init(WDClinicalOnboardingNoGeoView);
  -[WDClinicalOnboardingNoGeoView setTranslatesAutoresizingMaskIntoConstraints:](v2, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  return v2;
}

- (void)_showNoGeoView
{
  void *v3;
  void *v4;

  -[WDClinicalOnboardingNoGeoView superview](self->_noGeoView, "superview");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    if (self->_noGeoView)
    {
      -[WDClinicalOnboardingViewController setNoGeoView:](self, "setNoGeoView:");
    }
    else
    {
      -[WDClinicalOnboardingViewController _createNoGeoView](self, "_createNoGeoView");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      -[WDClinicalOnboardingViewController setNoGeoView:](self, "setNoGeoView:", v4);

    }
    -[WDClinicalOnboardingViewController _showNoContentView:](self, "_showNoContentView:", self->_noGeoView);
  }
}

- (void)_hideNoGeoView
{
  -[WDClinicalOnboardingViewController _showNoContentView:](self, "_showNoContentView:", 0);
}

- (BOOL)couldFetchAdditionalResults
{
  return -[WDClinicalOnboardingViewController nextFrom](self, "nextFrom") > 0;
}

- (BOOL)hasSearchTerm
{
  return -[NSString length](self->_searchQuery, "length") != 0;
}

- (BOOL)hasSearchResults
{
  return -[NSMutableOrderedSet count](self->_supportedSearchResults, "count")
      || -[WDClinicalOnboardingViewController hasSearchTerm](self, "hasSearchTerm")
      && -[NSMutableOrderedSet count](self->_alreadySharingSearchResults, "count")
      || -[NSMutableOrderedSet count](self->_unsupportedSearchResults, "count") != 0;
}

- (BOOL)searchInFlight
{
  return self->_searchesInFlight > 0;
}

- (WDClinicalSampleAccountsLoader)sampleAccountsLoader
{
  WDClinicalSampleAccountsLoader *sampleAccountsLoader;
  WDClinicalSampleAccountsLoader *v4;

  sampleAccountsLoader = self->_sampleAccountsLoader;
  if (!sampleAccountsLoader)
  {
    v4 = -[WDClinicalSampleAccountsLoader initWithProfile:]([WDClinicalSampleAccountsLoader alloc], "initWithProfile:", self->_profile);
    -[WDClinicalOnboardingViewController setSampleAccountsLoader:](self, "setSampleAccountsLoader:", v4);

    sampleAccountsLoader = self->_sampleAccountsLoader;
  }
  return sampleAccountsLoader;
}

- (BOOL)_isSimulator
{
  return 0;
}

- (void)_beginLoadingAlreadyConnectedAccountsIfNecessary
{
  NSObject *v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint8_t v5[24];

  OUTLINED_FUNCTION_5(a1);
  v2 = (objc_class *)OUTLINED_FUNCTION_14();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1BC30A000, v1, v4, "%{public}@: beginning to fetch all accounts", v5);

  OUTLINED_FUNCTION_2();
}

void __86__WDClinicalOnboardingViewController__beginLoadingAlreadyConnectedAccountsIfNecessary__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  _QWORD block[4];
  id v10;
  id v11;
  id v12;

  v5 = a2;
  v6 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __86__WDClinicalOnboardingViewController__beginLoadingAlreadyConnectedAccountsIfNecessary__block_invoke_2;
  block[3] = &unk_1E74D1440;
  objc_copyWeak(&v12, (id *)(a1 + 32));
  v10 = v6;
  v11 = v5;
  v7 = v5;
  v8 = v6;
  dispatch_async(MEMORY[0x1E0C80D38], block);

  objc_destroyWeak(&v12);
}

void __86__WDClinicalOnboardingViewController__beginLoadingAlreadyConnectedAccountsIfNecessary__block_invoke_2(uint64_t a1)
{
  id *v2;
  NSObject *v3;
  id WeakRetained;
  objc_class *v5;
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  id v10;
  objc_class *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  id to;
  uint8_t buf[4];
  id v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v2 = (id *)(a1 + 48);
  objc_copyWeak(&to, (id *)(a1 + 48));
  if (*(_QWORD *)(a1 + 32))
  {
    _HKInitializeLogging();
    v3 = (id)*MEMORY[0x1E0CB52D8];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      WeakRetained = objc_loadWeakRetained(v2);
      v5 = (objc_class *)objc_opt_class();
      NSStringFromClass(v5);
      v6 = (id)objc_claimAutoreleasedReturnValue();
      HKSensitiveLogItem();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v24 = v6;
      v25 = 2114;
      v26 = v7;
      _os_log_error_impl(&dword_1BC30A000, v3, OS_LOG_TYPE_ERROR, "%{public}@: failed fetching all accounts: %{public}@", buf, 0x16u);

    }
  }
  else
  {
    _HKInitializeLogging();
    v8 = (void *)*MEMORY[0x1E0CB52D8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52D8], OS_LOG_TYPE_DEBUG))
    {
      v9 = v8;
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        v10 = objc_loadWeakRetained(v2);
        v11 = (objc_class *)objc_opt_class();
        NSStringFromClass(v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        __86__WDClinicalOnboardingViewController__beginLoadingAlreadyConnectedAccountsIfNecessary__block_invoke_2_cold_1(v12, (uint64_t)buf, v9, v10);
      }

    }
    objc_msgSend(*(id *)(a1 + 40), "hk_filter:", &__block_literal_global_305);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "sortedArrayUsingComparator:", &__block_literal_global_308);
    v3 = objc_claimAutoreleasedReturnValue();

    v14 = objc_loadWeakRetained(&to);
    objc_msgSend(v14, "setAlreadyConnectedAccounts:", v3);

    -[NSObject hk_mapToSet:](v3, "hk_mapToSet:", &__block_literal_global_310);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_loadWeakRetained(&to);
    objc_msgSend(v16, "setAlreadyConnectedBrands:", v15);

    objc_msgSend(*(id *)(a1 + 40), "hk_filter:", &__block_literal_global_311);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "hk_map:", &__block_literal_global_312);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_loadWeakRetained(&to);
    objc_msgSend(v20, "setAlreadySharingBrands:", v19);

    v21 = objc_loadWeakRetained(&to);
    objc_msgSend(v21, "reloadData");

  }
  objc_destroyWeak(&to);
}

uint64_t __86__WDClinicalOnboardingViewController__beginLoadingAlreadyConnectedAccountsIfNecessary__block_invoke_303(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "canEnableSharingToProvider");
}

uint64_t __86__WDClinicalOnboardingViewController__beginLoadingAlreadyConnectedAccountsIfNecessary__block_invoke_2_306(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "title");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "compare:", v6);
  return v7;
}

uint64_t __86__WDClinicalOnboardingViewController__beginLoadingAlreadyConnectedAccountsIfNecessary__block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "brand");
}

uint64_t __86__WDClinicalOnboardingViewController__beginLoadingAlreadyConnectedAccountsIfNecessary__block_invoke_4(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isSharingToProvider");
}

uint64_t __86__WDClinicalOnboardingViewController__beginLoadingAlreadyConnectedAccountsIfNecessary__block_invoke_5(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "brand");
}

- (void)_presentLoginForAlreadyConnectedAccount:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  HRProfile *profile;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id location;

  v4 = a3;
  _HKInitializeLogging();
  v5 = (void *)*MEMORY[0x1E0CB52D8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52D8], OS_LOG_TYPE_DEBUG))
    -[WDClinicalOnboardingViewController _presentLoginForAlreadyConnectedAccount:].cold.1(v5, (uint64_t)self, v4);
  objc_initWeak(&location, self);
  -[HRProfile clinicalSourcesDataProvider](self->_profile, "clinicalSourcesDataProvider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  profile = self->_profile;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __78__WDClinicalOnboardingViewController__presentLoginForAlreadyConnectedAccount___block_invoke;
  v9[3] = &unk_1E74D1490;
  v8 = v4;
  v10 = v8;
  objc_copyWeak(&v11, &location);
  objc_msgSend(v6, "beginReloginSessionForAccount:fromViewController:profile:loginCancelledHandler:errorHandler:", v8, self, profile, 0, v9);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);

}

void __78__WDClinicalOnboardingViewController__presentLoginForAlreadyConnectedAccount___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id WeakRetained;
  id v7;

  v3 = a2;
  +[HRViewControllerFactory shared](HRViewControllerFactory, "shared");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "gateway");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "makeFailedToOnboardAccountAlertControllerToGateway:error:", v5, v3);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "presentViewController:animated:completion:", v7, 1, 0);

}

- (void)_proceedWithAlreadyConnectedAccount:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _HKInitializeLogging();
  v5 = (void *)*MEMORY[0x1E0CB52D8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52D8], OS_LOG_TYPE_DEBUG))
    -[WDClinicalOnboardingViewController _proceedWithAlreadyConnectedAccount:].cold.1(v5, (uint64_t)self, v4);
  +[OAuthCompletionNotificationUserInfoKeys account](_TtC15HealthRecordsUI39OAuthCompletionNotificationUserInfoKeys, "account");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v6;
  v13[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)MEMORY[0x1E0CB37C0];
  objc_msgSend(MEMORY[0x1E0CB37C0], "OAuthCompletionNotification");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "notificationWithName:object:userInfo:", v9, self, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "postNotification:", v10);

}

- (void)dismiss:(id)a3
{
  void *v4;
  id v5;

  -[WDClinicalOnboardingViewController dismissalViewController](self, "dismissalViewController", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    -[WDClinicalOnboardingViewController dismissalViewController](self, "dismissalViewController");
  else
    -[WDClinicalOnboardingViewController navigationController](self, "navigationController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dismissViewControllerAnimated:completion:", 1, 0);

}

- (void)_presentError:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  uint64_t v10;
  const __CFString *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  v4 = a3;
  _HKInitializeLogging();
  v5 = (void *)*MEMORY[0x1E0CB52D8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52D8], OS_LOG_TYPE_ERROR))
    -[WDClinicalOnboardingViewController _presentError:].cold.1(v5, v4);
  HRLocalizedString(CFSTR("HEALTH_RECORDS_PROVIDER_SERVICE_ERROR_TITLE"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  HRLocalizedString(CFSTR("HEALTH_RECORDS_PROVIDER_SERVICE_ERROR_ONBOARDING_SEARCH"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "domain");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqualToString:", *MEMORY[0x1E0CB32E8]);

  if (v9)
  {
    v10 = objc_msgSend(v4, "code");
    if (v10 == -1009)
    {
      v11 = CFSTR("HEALTH_RECORDS_ERROR_NO_CONNECTION_TO_INTERNET");
      goto LABEL_9;
    }
    if (v10 == -1003 && objc_msgSend(MEMORY[0x1E0CB6F18], "isAppleInternalInstall"))
    {
      v11 = CFSTR("HEALTH_RECORDS_ERROR_REQUIRES_INTERNAL_NETWORK");
LABEL_9:
      HRLocalizedString(v11);
      v12 = objc_claimAutoreleasedReturnValue();

      v7 = (void *)v12;
    }
  }
  -[WDClinicalOnboardingViewController presentedViewController](self, "presentedViewController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v13)
  {
    objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", v6, v7, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)MEMORY[0x1E0DC3448];
    HBXLocalizedString(CFSTR("OK"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "actionWithTitle:style:handler:", v16, 0, 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v14, "addAction:", v17);
    -[WDClinicalOnboardingViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v14, 1, 0);

  }
}

- (void)_suggestNewProviders
{
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", CFSTR("Suggest New Providers"), CFSTR("Let the team know which healthcare providers you would like to see supported by filing a Radar."), 1);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3448], "actionWithTitle:style:handler:", CFSTR("Cancel"), 1, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3448], "actionWithTitle:style:handler:", CFSTR("File Radar"), 0, &__block_literal_global_340);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addAction:", v4);
  objc_msgSend(v5, "addAction:", v3);
  -[WDClinicalOnboardingViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v5, 1, 0);

}

void __58__WDClinicalOnboardingViewController__suggestNewProviders__block_invoke()
{
  void *v0;
  id v1;

  objc_msgSend(MEMORY[0x1E0C99E98], "hk_tapToHealthRadarURLForComponent:title:description:classification:reproducibility:keywords:autoDiagnostics:attachments:", 938492, CFSTR("[HealthcareProviderSuggestion] "), CFSTR("It would be great to also see support for these healthcare providers:\n1. "), 9, 6, 0, 0, 0);
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "openURL:configuration:completionHandler:", v1, 0, &__block_literal_global_348);

}

void __58__WDClinicalOnboardingViewController__suggestNewProviders__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;

  v4 = a3;
  if (!a2)
  {
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52C0], OS_LOG_TYPE_ERROR))
      __58__WDClinicalOnboardingViewController__suggestNewProviders__block_invoke_2_cold_1();
  }

}

- (id)_changeEnvironmentMenuElements
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[6];

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v4 = 0;
  v5 = MEMORY[0x1E0C809B0];
  do
  {
    HKHealthRecordsNameForEnvironment();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = v5;
    v10[1] = 3221225472;
    v10[2] = __68__WDClinicalOnboardingViewController__changeEnvironmentMenuElements__block_invoke;
    v10[3] = &unk_1E74D1538;
    v10[4] = self;
    v10[5] = v4;
    objc_msgSend(MEMORY[0x1E0DC3428], "actionWithTitle:image:identifier:handler:", v6, 0, 0, v10);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v7);

    ++v4;
  }
  while (v4 != 14);
  v8 = (void *)objc_msgSend(v3, "copy");

  return v8;
}

uint64_t __68__WDClinicalOnboardingViewController__changeEnvironmentMenuElements__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_changeEnvironment:", *(_QWORD *)(a1 + 40));
}

- (void)_changeEnvironment:(int64_t)a3
{
  NSObject *v4;
  _QWORD block[5];

  if (objc_msgSend(MEMORY[0x1E0CB6F18], "isAppleInternalInstall"))
  {
    HKHealthRecordsSetEnvironment();
    dispatch_get_global_queue(2, 0);
    v4 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __57__WDClinicalOnboardingViewController__changeEnvironment___block_invoke;
    block[3] = &unk_1E74D1218;
    block[4] = self;
    dispatch_async(v4, block);

  }
}

void __57__WDClinicalOnboardingViewController__changeEnvironment___block_invoke(uint64_t a1)
{
  id v2;
  char v3;
  id v4;
  NSObject *v5;
  _QWORD v6[5];
  id v7;

  v2 = objc_alloc_init(MEMORY[0x1E0CB3958]);
  objc_msgSend(v2, "setLaunchPath:", CFSTR("/bin/zsh"));
  objc_msgSend(v2, "setArguments:", &unk_1E7513080);
  v7 = 0;
  v3 = objc_msgSend(v2, "launchAndReturnError:", &v7);
  v4 = v7;
  if ((v3 & 1) == 0)
  {
    _HKInitializeLogging();
    v5 = *MEMORY[0x1E0CB52D8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52D8], OS_LOG_TYPE_ERROR))
      __57__WDClinicalOnboardingViewController__changeEnvironment___block_invoke_cold_1(a1, (uint64_t)v4, v5);
  }
  objc_msgSend(v2, "waitUntilExit");
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __57__WDClinicalOnboardingViewController__changeEnvironment___block_invoke_357;
  v6[3] = &unk_1E74D1218;
  v6[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

uint64_t __57__WDClinicalOnboardingViewController__changeEnvironment___block_invoke_357(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_resetCacheAndReloadData");
  return objc_msgSend(*(id *)(a1 + 32), "_configureRightNavigationItems");
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  double v9;

  -[HRUITableViewSectionConfiguration sections](self->_sectionConfiguration, "sections", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndexedSubscript:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "headerString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "length");

  if (v8)
    v9 = *MEMORY[0x1E0DC53D8];
  else
    v9 = 10.0;

  return v9;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  void *v5;
  void *v6;
  void *v7;

  -[HRUITableViewSectionConfiguration sections](self->_sectionConfiguration, "sections", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndexedSubscript:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "headerString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4
{
  id v6;
  NSIndexPath *spinnerIndexPath;
  void *v8;
  void *v9;
  void *v10;

  v6 = a3;
  spinnerIndexPath = self->_spinnerIndexPath;
  if (spinnerIndexPath && -[NSIndexPath section](spinnerIndexPath, "section") == a4)
  {
    v8 = 0;
  }
  else
  {
    -[HRUITableViewSectionConfiguration sections](self->_sectionConfiguration, "sections");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectAtIndexedSubscript:", a4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "footerString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v8;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  void *v3;
  int64_t v4;

  -[HRUITableViewSectionConfiguration sections](self->_sectionConfiguration, "sections", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  return v4;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  void *v6;
  void *v7;
  void *v8;
  _BOOL4 v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int64_t v14;

  -[HRUITableViewSectionConfiguration sections](self->_sectionConfiguration, "sections", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectAtIndexedSubscript:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v8, "isEqualToString:", CFSTR("SupportedLocations")))
  {

    goto LABEL_5;
  }
  v9 = -[WDClinicalOnboardingViewController couldFetchAdditionalResults](self, "couldFetchAdditionalResults");

  if (!v9)
  {
LABEL_5:
    objc_msgSend(v7, "estimatedNumRows");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "integerValue");
    goto LABEL_6;
  }
  v10 = (void *)MEMORY[0x1E0CB36B0];
  objc_msgSend(v7, "estimatedNumRows");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "indexPathForRow:inSection:", objc_msgSend(v11, "integerValue"), a4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDClinicalOnboardingViewController setSpinnerIndexPath:](self, "setSpinnerIndexPath:", v12);

  objc_msgSend(v7, "estimatedNumRows");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "integerValue") + 1;
LABEL_6:

  return v14;
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  void *v5;
  id v6;
  id v7;

  v5 = (void *)MEMORY[0x1E0DC3658];
  v6 = a4;
  objc_msgSend(v5, "secondarySystemBackgroundColor");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setBackgroundColor:", v7);

}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v6 = a3;
  v7 = a4;
  -[WDClinicalOnboardingViewController spinnerIndexPath](self, "spinnerIndexPath");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "isEqual:", v8);

  if (v9)
  {
    +[HRWDSpinnerTableViewCell defaultReuseIdentifier](HRWDSpinnerTableViewCell, "defaultReuseIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "dequeueReusableCellWithIdentifier:forIndexPath:", v10, v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[WDClinicalOnboardingViewController accountSearchResultAtIndexPath:](self, "accountSearchResultAtIndexPath:", v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      objc_msgSend(v6, "dequeueReusableCellWithIdentifier:forIndexPath:", CFSTR("AlreadyConnectedCell"), v7);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setSelectionStyle:", 3);
      objc_msgSend(v11, "setAccessoryType:", 1);
      -[HRProfile clinicalSourcesDataProvider](self->_profile, "clinicalSourcesDataProvider");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setBrandable:dataProvider:", v10, v12);

    }
    else
    {
      -[WDClinicalOnboardingViewController providerSearchResultAtIndexPath:](self, "providerSearchResultAtIndexPath:", v7);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v13)
      {
        _HKInitializeLogging();
        v14 = (void *)*MEMORY[0x1E0CB52D8];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52D8], OS_LOG_TYPE_ERROR))
          -[WDClinicalOnboardingViewController tableView:cellForRowAtIndexPath:].cold.1(v14);
      }
      objc_msgSend(v6, "dequeueReusableCellWithIdentifier:forIndexPath:", CFSTR("SearchResultCell"), v7);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[HRProfile clinicalSourcesDataProvider](self->_profile, "clinicalSourcesDataProvider");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setSearchResult:dataProvider:searchTerms:", v13, v15, self->_searchTerms);

      objc_msgSend(v11, "setSelectionStyle:", 3);
    }
  }

  return v11;
}

- (id)providerSearchResultAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  __CFString *v7;
  __CFString *v8;
  void *v9;
  char v10;
  int *v11;
  __CFString *v12;
  __CFString *v13;
  void *v14;
  char v15;
  __CFString *v16;
  __CFString *v17;
  void *v18;
  int v19;
  id v20;
  unint64_t v21;
  void *v22;
  id v23;

  v4 = a3;
  -[HRUITableViewSectionConfiguration sections](self->_sectionConfiguration, "sections");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndexedSubscript:", objc_msgSend(v4, "section"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "identifier");
  v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (v7 == CFSTR("SupportedLocations")
    || (v8 = v7,
        objc_msgSend(v6, "identifier"),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("SupportedLocations")),
        v9,
        v8,
        (v10 & 1) != 0))
  {
    v11 = &OBJC_IVAR___WDClinicalOnboardingViewController__supportedSearchResults;
LABEL_10:
    v20 = *(id *)((char *)&self->super.super.super.super.super.isa + *v11);
    goto LABEL_11;
  }
  objc_msgSend(v6, "identifier");
  v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (v12 == CFSTR("AlreadySharing")
    || (v13 = v12,
        objc_msgSend(v6, "identifier"),
        v14 = (void *)objc_claimAutoreleasedReturnValue(),
        v15 = objc_msgSend(v14, "isEqualToString:", CFSTR("AlreadySharing")),
        v14,
        v13,
        (v15 & 1) != 0))
  {
    v11 = &OBJC_IVAR___WDClinicalOnboardingViewController__alreadySharingSearchResults;
    goto LABEL_10;
  }
  objc_msgSend(v6, "identifier");
  v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (v16 == CFSTR("UnsupportedLocations")
    || (v17 = v16,
        objc_msgSend(v6, "identifier"),
        v18 = (void *)objc_claimAutoreleasedReturnValue(),
        v19 = objc_msgSend(v18, "isEqualToString:", CFSTR("UnsupportedLocations")),
        v18,
        v17,
        v19))
  {
    v11 = &OBJC_IVAR___WDClinicalOnboardingViewController__unsupportedSearchResults;
    goto LABEL_10;
  }
  v20 = 0;
LABEL_11:
  v21 = objc_msgSend(v4, "row");
  if (v21 >= objc_msgSend(v20, "count"))
  {
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52D8], OS_LOG_TYPE_ERROR))
      -[WDClinicalOnboardingViewController providerSearchResultAtIndexPath:].cold.1();
    v23 = 0;
  }
  else
  {
    objc_msgSend(v20, "objectAtIndexedSubscript:", objc_msgSend(v4, "row"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v23 = v22;
    else
      v23 = 0;

  }
  return v23;
}

- (id)accountSearchResultAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  __CFString *v7;
  __CFString *v8;
  void *v9;
  char v10;
  int *v11;
  __CFString *v12;
  __CFString *v13;
  void *v14;
  int v15;
  id v16;
  unint64_t v17;
  void *v18;
  id v19;

  v4 = a3;
  -[HRUITableViewSectionConfiguration sections](self->_sectionConfiguration, "sections");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndexedSubscript:", objc_msgSend(v4, "section"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "identifier");
  v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (v7 == CFSTR("SupportedLocations")
    || (v8 = v7,
        objc_msgSend(v6, "identifier"),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("SupportedLocations")),
        v9,
        v8,
        (v10 & 1) != 0))
  {
    v11 = &OBJC_IVAR___WDClinicalOnboardingViewController__supportedSearchResults;
LABEL_7:
    v16 = *(id *)((char *)&self->super.super.super.super.super.isa + *v11);
    goto LABEL_8;
  }
  objc_msgSend(v6, "identifier");
  v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (v12 == CFSTR("UnsupportedLocations")
    || (v13 = v12,
        objc_msgSend(v6, "identifier"),
        v14 = (void *)objc_claimAutoreleasedReturnValue(),
        v15 = objc_msgSend(v14, "isEqualToString:", CFSTR("UnsupportedLocations")),
        v14,
        v13,
        v15))
  {
    v11 = &OBJC_IVAR___WDClinicalOnboardingViewController__unsupportedSearchResults;
    goto LABEL_7;
  }
  v16 = 0;
LABEL_8:
  v17 = objc_msgSend(v4, "row");
  if (v17 >= objc_msgSend(v16, "count"))
  {
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52D8], OS_LOG_TYPE_ERROR))
      -[WDClinicalOnboardingViewController providerSearchResultAtIndexPath:].cold.1();
    v19 = 0;
  }
  else
  {
    objc_msgSend(v16, "objectAtIndexedSubscript:", objc_msgSend(v4, "row"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v19 = v18;
    else
      v19 = 0;

  }
  return v19;
}

- (void)scrollViewDidScroll:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  id v11;

  v4 = a3;
  objc_msgSend(v4, "contentOffset");
  v6 = v5;
  objc_msgSend(v4, "frame");
  v8 = v6 + v7;
  objc_msgSend(v4, "contentSize");
  v10 = v9;

  if (v8 >= v10 - (float)(*MEMORY[0x1E0DC53E0] + *MEMORY[0x1E0DC53E0])
    && -[WDClinicalOnboardingViewController couldFetchAdditionalResults](self, "couldFetchAdditionalResults")
    && !-[WDClinicalOnboardingViewController searchInFlight](self, "searchInFlight"))
  {
    -[WDClinicalOnboardingViewController searchQuery](self, "searchQuery");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    -[WDClinicalOnboardingViewController _searchResultsForQuery:from:](self, "_searchResultsForQuery:from:", v11, -[WDClinicalOnboardingViewController nextFrom](self, "nextFrom"));

  }
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  WDClinicalProviderDetailsViewController *v12;
  void *v13;

  v5 = a4;
  -[WDClinicalOnboardingViewController accountSearchResultAtIndexPath:](self, "accountSearchResultAtIndexPath:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    _HKInitializeLogging();
    v7 = (void *)*MEMORY[0x1E0CB52D8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52D8], OS_LOG_TYPE_DEBUG))
      -[WDClinicalOnboardingViewController tableView:didSelectRowAtIndexPath:].cold.3(v7, (uint64_t)self, v6);
    if (objc_msgSend(v6, "needsLoginToEnableClinicalSharing"))
    {
      -[WDClinicalOnboardingViewController _presentLoginForAlreadyConnectedAccount:](self, "_presentLoginForAlreadyConnectedAccount:", v6);
      -[WDClinicalOnboardingViewController tableView](self, "tableView");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "deselectRowAtIndexPath:animated:", v5, 1);

    }
    else
    {
      -[WDClinicalOnboardingViewController _proceedWithAlreadyConnectedAccount:](self, "_proceedWithAlreadyConnectedAccount:", v6);
    }
  }
  else
  {
    -[WDClinicalOnboardingViewController providerSearchResultAtIndexPath:](self, "providerSearchResultAtIndexPath:", v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      if (-[WDClinicalOnboardingViewController _isSimulator](self, "_isSimulator"))
      {
        -[WDClinicalOnboardingViewController sampleAccountsLoader](self, "sampleAccountsLoader");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[HRProfile setClinicalSampleAccountsLoader:](self->_profile, "setClinicalSampleAccountsLoader:", v10);

      }
      _HKInitializeLogging();
      v11 = (void *)*MEMORY[0x1E0CB52D8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52D8], OS_LOG_TYPE_DEBUG))
        -[WDClinicalOnboardingViewController tableView:didSelectRowAtIndexPath:].cold.2(v11);
      v12 = -[WDClinicalProviderDetailsViewController initWithProfile:searchResult:]([WDClinicalProviderDetailsViewController alloc], "initWithProfile:searchResult:", self->_profile, v9);
      -[WDClinicalOnboardingViewController showViewController:sender:](self, "showViewController:sender:", v12, self);

    }
    else
    {
      _HKInitializeLogging();
      v13 = (void *)*MEMORY[0x1E0CB52D8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52D8], OS_LOG_TYPE_ERROR))
        -[WDClinicalOnboardingViewController tableView:didSelectRowAtIndexPath:].cold.1(v13);
    }

  }
}

- (BOOL)showProviderNotFound
{
  return self->_showProviderNotFound;
}

- (BOOL)showOnlyClinicalSharingCapableProviders
{
  return self->_showOnlyClinicalSharingCapableProviders;
}

- (void)setShowOnlyClinicalSharingCapableProviders:(BOOL)a3
{
  self->_showOnlyClinicalSharingCapableProviders = a3;
}

- (HRProfile)profile
{
  return self->_profile;
}

- (void)setProfile:(id)a3
{
  objc_storeStrong((id *)&self->_profile, a3);
}

- (HKClinicalProviderServiceStore)providerServiceStore
{
  return self->_providerServiceStore;
}

- (NSArray)alreadyConnectedAccounts
{
  return self->_alreadyConnectedAccounts;
}

- (void)setAlreadyConnectedAccounts:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1088);
}

- (NSSet)alreadyConnectedBrands
{
  return self->_alreadyConnectedBrands;
}

- (void)setAlreadyConnectedBrands:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1096);
}

- (NSSet)alreadySharingBrands
{
  return self->_alreadySharingBrands;
}

- (void)setAlreadySharingBrands:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1104);
}

- (NSMutableOrderedSet)alreadySharingSearchResults
{
  return self->_alreadySharingSearchResults;
}

- (void)setAlreadySharingSearchResults:(id)a3
{
  objc_storeStrong((id *)&self->_alreadySharingSearchResults, a3);
}

- (NSMutableOrderedSet)supportedSearchResults
{
  return self->_supportedSearchResults;
}

- (void)setSupportedSearchResults:(id)a3
{
  objc_storeStrong((id *)&self->_supportedSearchResults, a3);
}

- (NSMutableOrderedSet)unsupportedSearchResults
{
  return self->_unsupportedSearchResults;
}

- (void)setUnsupportedSearchResults:(id)a3
{
  objc_storeStrong((id *)&self->_unsupportedSearchResults, a3);
}

- (NSString)searchQuery
{
  return self->_searchQuery;
}

- (void)setSearchQuery:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1136);
}

- (NSArray)searchTerms
{
  return self->_searchTerms;
}

- (void)setSearchTerms:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1144);
}

- (NSMutableDictionary)resultsCache
{
  return self->_resultsCache;
}

- (int64_t)nextFrom
{
  return self->_nextFrom;
}

- (void)setNextFrom:(int64_t)a3
{
  self->_nextFrom = a3;
}

- (void)setSearchInFlight:(BOOL)a3
{
  self->_searchInFlight = a3;
}

- (HRUITableViewSectionConfiguration)sectionConfiguration
{
  return self->_sectionConfiguration;
}

- (void)setSectionConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_sectionConfiguration, a3);
}

- (BOOL)hasCompletedAtLeastOneFetch
{
  return self->_hasCompletedAtLeastOneFetch;
}

- (void)setHasCompletedAtLeastOneFetch:(BOOL)a3
{
  self->_hasCompletedAtLeastOneFetch = a3;
}

- (BOOL)locationEnabled
{
  return self->_locationEnabled;
}

- (void)setLocationEnabled:(BOOL)a3
{
  self->_locationEnabled = a3;
}

- (UIView)noContentParentView
{
  return self->_noContentParentView;
}

- (void)setNoContentParentView:(id)a3
{
  objc_storeStrong((id *)&self->_noContentParentView, a3);
}

- (_UIContentUnavailableView)noLocationsView
{
  return self->_noLocationsView;
}

- (void)setNoLocationsView:(id)a3
{
  objc_storeStrong((id *)&self->_noLocationsView, a3);
}

- (NSLayoutConstraint)noContentTopConstraint
{
  return (NSLayoutConstraint *)objc_loadWeakRetained((id *)&self->_noContentTopConstraint);
}

- (void)setNoContentTopConstraint:(id)a3
{
  objc_storeWeak((id *)&self->_noContentTopConstraint, a3);
}

- (NSLayoutConstraint)noContentBottomConstraint
{
  return (NSLayoutConstraint *)objc_loadWeakRetained((id *)&self->_noContentBottomConstraint);
}

- (void)setNoContentBottomConstraint:(id)a3
{
  objc_storeWeak((id *)&self->_noContentBottomConstraint, a3);
}

- (WDClinicalOnboardingNoGeoView)noGeoView
{
  return self->_noGeoView;
}

- (void)setNoGeoView:(id)a3
{
  objc_storeStrong((id *)&self->_noGeoView, a3);
}

- (UIView)providerNotFoundView
{
  return self->_providerNotFoundView;
}

- (void)setProviderNotFoundView:(id)a3
{
  objc_storeStrong((id *)&self->_providerNotFoundView, a3);
}

- (UIViewController)dismissalViewController
{
  return (UIViewController *)objc_loadWeakRetained((id *)&self->_dismissalViewController);
}

- (void)setDismissalViewController:(id)a3
{
  objc_storeWeak((id *)&self->_dismissalViewController, a3);
}

- (NSIndexPath)spinnerIndexPath
{
  return self->_spinnerIndexPath;
}

- (void)setSpinnerIndexPath:(id)a3
{
  objc_storeStrong((id *)&self->_spinnerIndexPath, a3);
}

- (HRWDSpinnerView)spinnerView
{
  return self->_spinnerView;
}

- (void)setSpinnerView:(id)a3
{
  objc_storeStrong((id *)&self->_spinnerView, a3);
}

- (void)setSampleAccountsLoader:(id)a3
{
  objc_storeStrong((id *)&self->_sampleAccountsLoader, a3);
}

- (WDClinicalGatewayProxy)pendingGatewayProxy
{
  return self->_pendingGatewayProxy;
}

- (void)setPendingGatewayProxy:(id)a3
{
  objc_storeStrong((id *)&self->_pendingGatewayProxy, a3);
}

- (HKClinicalAccountStore)accountStore
{
  return self->_accountStore;
}

- (void)setAccountStore:(id)a3
{
  objc_storeStrong((id *)&self->_accountStore, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accountStore, 0);
  objc_storeStrong((id *)&self->_pendingGatewayProxy, 0);
  objc_storeStrong((id *)&self->_sampleAccountsLoader, 0);
  objc_storeStrong((id *)&self->_spinnerView, 0);
  objc_storeStrong((id *)&self->_spinnerIndexPath, 0);
  objc_destroyWeak((id *)&self->_dismissalViewController);
  objc_storeStrong((id *)&self->_providerNotFoundView, 0);
  objc_storeStrong((id *)&self->_noGeoView, 0);
  objc_destroyWeak((id *)&self->_noContentBottomConstraint);
  objc_destroyWeak((id *)&self->_noContentTopConstraint);
  objc_storeStrong((id *)&self->_noLocationsView, 0);
  objc_storeStrong((id *)&self->_noContentParentView, 0);
  objc_storeStrong((id *)&self->_sectionConfiguration, 0);
  objc_storeStrong((id *)&self->_resultsCache, 0);
  objc_storeStrong((id *)&self->_searchTerms, 0);
  objc_storeStrong((id *)&self->_searchQuery, 0);
  objc_storeStrong((id *)&self->_unsupportedSearchResults, 0);
  objc_storeStrong((id *)&self->_supportedSearchResults, 0);
  objc_storeStrong((id *)&self->_alreadySharingSearchResults, 0);
  objc_storeStrong((id *)&self->_alreadySharingBrands, 0);
  objc_storeStrong((id *)&self->_alreadyConnectedBrands, 0);
  objc_storeStrong((id *)&self->_alreadyConnectedAccounts, 0);
  objc_storeStrong((id *)&self->_providerServiceStore, 0);
  objc_storeStrong((id *)&self->_profile, 0);
  objc_storeStrong((id *)&self->_location, 0);
  objc_storeStrong((id *)&self->_locationManager, 0);
  objc_storeStrong((id *)&self->_searchController, 0);
  objc_storeStrong((id *)&self->_searchTimer, 0);
}

void __62__WDClinicalOnboardingViewController__cacheFeaturedBrandLogos__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0(&dword_1BC30A000, v0, v1, "Failed to cache brand logos: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

void __70__WDClinicalOnboardingViewController__loadGatewayProxyForDeeplinking___block_invoke_2_cold_1(uint64_t a1, void *a2)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  HKSensitiveLogItem();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1(&dword_1BC30A000, v2, v4, "Failed to fetch remote gateway, error: %@", v5);

  OUTLINED_FUNCTION_2();
}

- (void)locationManagerDidChangeAuthorization:(void *)a1 .cold.1(void *a1)
{
  NSObject *v1;
  void *v2;
  id v3;
  uint64_t v4;
  uint8_t v5[24];

  OUTLINED_FUNCTION_5(a1);
  v2 = (void *)OUTLINED_FUNCTION_8();
  v3 = OUTLINED_FUNCTION_16(v2);
  OUTLINED_FUNCTION_4(&dword_1BC30A000, v1, v4, "%{public}@ requesting current location", v5);

  OUTLINED_FUNCTION_2();
}

- (void)locationManager:(void *)a1 didUpdateLocations:.cold.1(void *a1)
{
  NSObject *v1;
  void *v2;
  id v3;
  uint64_t v4;
  uint8_t v5[24];

  OUTLINED_FUNCTION_5(a1);
  v2 = (void *)OUTLINED_FUNCTION_8();
  v3 = OUTLINED_FUNCTION_16(v2);
  OUTLINED_FUNCTION_4(&dword_1BC30A000, v1, v4, "%{public}@ received current location", v5);

  OUTLINED_FUNCTION_2();
}

- (void)locationManager:(uint64_t)a3 didFailWithError:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_11(&dword_1BC30A000, a1, a3, "could not obtain location fix", a5, a6, a7, a8, 0);
}

- (void)locationManager:didFailWithError:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0(&dword_1BC30A000, v0, v1, "could not determine location, error: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

void __66__WDClinicalOnboardingViewController__searchResultsForQuery_from___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0(&dword_1BC30A000, v0, v1, "Unable to cancel in-flight search requests; error: %{public}@",
    v2,
    v3,
    v4,
    v5,
    v6);
  OUTLINED_FUNCTION_7();
}

void __86__WDClinicalOnboardingViewController__beginLoadingAlreadyConnectedAccountsIfNecessary__block_invoke_2_cold_1(void *a1, uint64_t a2, NSObject *a3, void *a4)
{
  *(_DWORD *)a2 = 138543362;
  *(_QWORD *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_4(&dword_1BC30A000, a3, (uint64_t)a3, "%{public}@: successfully fetched all accounts", (uint8_t *)a2);

}

- (void)_presentLoginForAlreadyConnectedAccount:(void *)a3 .cold.1(void *a1, uint64_t a2, void *a3)
{
  NSObject *v3;
  objc_class *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint8_t v9[24];

  OUTLINED_FUNCTION_5(a1);
  v5 = (objc_class *)OUTLINED_FUNCTION_14();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a3, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_15(&dword_1BC30A000, v3, v8, "%{public}@: presenting login for account %{public}@", v9);

  OUTLINED_FUNCTION_3();
}

- (void)_proceedWithAlreadyConnectedAccount:(void *)a3 .cold.1(void *a1, uint64_t a2, void *a3)
{
  NSObject *v3;
  objc_class *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint8_t v9[24];

  OUTLINED_FUNCTION_5(a1);
  v5 = (objc_class *)OUTLINED_FUNCTION_10();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a3, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_15(&dword_1BC30A000, v3, v8, "%{public}@: proceeding with account %{public}@", v9);

  OUTLINED_FUNCTION_3();
}

- (void)_presentError:(void *)a1 .cold.1(void *a1, void *a2)
{
  NSObject *v3;
  void *v4;
  uint64_t v5;
  uint8_t v6[24];

  v3 = OUTLINED_FUNCTION_5(a1);
  objc_msgSend(a2, "localizedDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1(&dword_1BC30A000, v3, v5, "onboarding search error: %{public}@", v6);

  OUTLINED_FUNCTION_2();
}

void __58__WDClinicalOnboardingViewController__suggestNewProviders__block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0(&dword_1BC30A000, v0, v1, "Could not open Tap-to-Radar URL %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

void __57__WDClinicalOnboardingViewController__changeEnvironment___block_invoke_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(a1 + 32);
  v4 = 138543618;
  v5 = v3;
  v6 = 2114;
  v7 = a2;
  OUTLINED_FUNCTION_9(&dword_1BC30A000, a3, (uint64_t)a3, "%{public}@ error killing healthd: %{public}@", (uint8_t *)&v4);
  OUTLINED_FUNCTION_7();
}

- (void)tableView:(void *)a1 cellForRowAtIndexPath:.cold.1(void *a1)
{
  NSObject *v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint8_t v5[24];

  OUTLINED_FUNCTION_5(a1);
  v2 = (objc_class *)OUTLINED_FUNCTION_10();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_9(&dword_1BC30A000, v1, v4, "%{public}@ neither an account nor a provider search result at index path %{public}@, attempting to continue", v5);

  OUTLINED_FUNCTION_3();
}

- (void)providerSearchResultAtIndexPath:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0(&dword_1BC30A000, v0, v1, "indexPath out of bounds: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

- (void)tableView:(void *)a1 didSelectRowAtIndexPath:.cold.1(void *a1)
{
  NSObject *v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint8_t v5[24];

  OUTLINED_FUNCTION_5(a1);
  v2 = (objc_class *)OUTLINED_FUNCTION_10();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_9(&dword_1BC30A000, v1, v4, "%{public}@: tappable search result at %{public}@ is nil", v5);

  OUTLINED_FUNCTION_3();
}

- (void)tableView:(void *)a1 didSelectRowAtIndexPath:.cold.2(void *a1)
{
  NSObject *v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint8_t v5[24];

  OUTLINED_FUNCTION_5(a1);
  v2 = (objc_class *)OUTLINED_FUNCTION_8();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1BC30A000, v1, v4, "%{public}@: showing provider details view controller", v5);

  OUTLINED_FUNCTION_2();
}

- (void)tableView:(void *)a3 didSelectRowAtIndexPath:.cold.3(void *a1, uint64_t a2, void *a3)
{
  NSObject *v4;
  objc_class *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  int v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a1;
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a3, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 138543874;
  v9 = v6;
  v10 = 2114;
  v11 = v7;
  v12 = 1024;
  v13 = objc_msgSend(a3, "needsLoginToEnableClinicalSharing");
  _os_log_debug_impl(&dword_1BC30A000, v4, OS_LOG_TYPE_DEBUG, "%{public}@: tapped already connected account %{public}@, needs login to enable sharing: %d", (uint8_t *)&v8, 0x1Cu);

}

@end
