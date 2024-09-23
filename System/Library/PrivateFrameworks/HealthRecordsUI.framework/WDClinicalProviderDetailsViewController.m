@implementation WDClinicalProviderDetailsViewController

- (id)_initWithProfile:(id)a3
{
  id v4;
  WDClinicalProviderDetailsViewController *v5;
  WDClinicalProviderDetailsViewController *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  HKClinicalProviderServiceStore *providerServiceStore;

  v4 = a3;
  v5 = -[WDClinicalProviderDetailsViewController initWithStyle:](self, "initWithStyle:", 1);
  v6 = v5;
  if (v5)
  {
    -[WDClinicalProviderDetailsViewController setProfile:](v5, "setProfile:", v4);
    v7 = objc_alloc_init(MEMORY[0x1E0C99D38]);
    -[WDClinicalProviderDetailsViewController setProviderCache:](v6, "setProviderCache:", v7);

    v8 = objc_alloc(MEMORY[0x1E0D2EEE8]);
    -[WDClinicalProviderDetailsViewController profile](v6, "profile");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "healthStore");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v8, "initWithHealthStore:", v10);
    providerServiceStore = v6->_providerServiceStore;
    v6->_providerServiceStore = (HKClinicalProviderServiceStore *)v11;

  }
  return v6;
}

- (WDClinicalProviderDetailsViewController)initWithProfile:(id)a3 searchResult:(id)a4
{
  id v6;
  WDClinicalProviderDetailsViewController *v7;
  WDClinicalProviderDetailsViewController *v8;

  v6 = a4;
  v7 = -[WDClinicalProviderDetailsViewController _initWithProfile:](self, "_initWithProfile:", a3);
  v8 = v7;
  if (v7)
    -[WDClinicalProviderDetailsViewController setSearchResult:](v7, "setSearchResult:", v6);

  return v8;
}

- (WDClinicalProviderDetailsViewController)initWithProfile:(id)a3 provider:(id)a4
{
  id v6;
  WDClinicalProviderDetailsViewController *v7;
  WDClinicalProviderDetailsViewController *v8;

  v6 = a4;
  v7 = -[WDClinicalProviderDetailsViewController _initWithProfile:](self, "_initWithProfile:", a3);
  v8 = v7;
  if (v7)
    -[WDClinicalProviderDetailsViewController setProvider:](v7, "setProvider:", v6);

  return v8;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  double v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  objc_super v24;

  v24.receiver = self;
  v24.super_class = (Class)WDClinicalProviderDetailsViewController;
  -[HKTableViewController viewDidLoad](&v24, sel_viewDidLoad);
  objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDClinicalProviderDetailsViewController tableView](self, "tableView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBackgroundColor:", v3);

  v5 = *MEMORY[0x1E0DC53D8];
  -[WDClinicalProviderDetailsViewController tableView](self, "tableView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setRowHeight:", v5);

  -[WDClinicalProviderDetailsViewController tableView](self, "tableView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setEstimatedRowHeight:", 300.0);

  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDClinicalProviderDetailsViewController tableView](self, "tableView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setSeparatorColor:", v8);

  -[WDClinicalProviderDetailsViewController navigationController](self, "navigationController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "navigationBar");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setPrefersLargeTitles:", 0);

  -[WDClinicalProviderDetailsViewController tableView](self, "tableView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_opt_class();
  +[WDClinicalLocationCell defaultReuseIdentifier](WDClinicalOnboardingLocationCell, "defaultReuseIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "registerClass:forCellReuseIdentifier:", v13, v14);

  -[WDClinicalProviderDetailsViewController tableView](self, "tableView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_opt_class();
  +[WDMedicalRecordGroupableCell defaultReuseIdentifier](WDClinicalOnboardingGatewayCell, "defaultReuseIdentifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "registerClass:forCellReuseIdentifier:", v16, v17);

  -[WDClinicalProviderDetailsViewController tableView](self, "tableView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_opt_class();
  objc_msgSend((id)objc_opt_class(), "defaultReuseIdentifier");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "registerClass:forCellReuseIdentifier:", v19, v20);

  +[CHRAnalyticsManager shared](CHRAnalyticsManager, "shared");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDClinicalProviderDetailsViewController provider](self, "provider");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "informationURL");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "postOnboardingFunnelEventWithStep:context:gatewayUrl:", 3, 0, v23);

}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)WDClinicalProviderDetailsViewController;
  -[WDClinicalProviderDetailsViewController viewWillAppear:](&v6, sel_viewWillAppear_, a3);
  -[WDClinicalProviderDetailsViewController searchResult](self, "searchResult");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[WDClinicalProviderDetailsViewController searchResult](self, "searchResult");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[WDClinicalProviderDetailsViewController _fetchDetailsForSearchResult:](self, "_fetchDetailsForSearchResult:", v5);

  }
}

- (void)_fetchDetailsForSearchResult:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  _QWORD v23[5];
  id v24;
  _QWORD block[5];
  id v26;
  id v27;

  v4 = a3;
  -[WDClinicalProviderDetailsViewController _showSpinnerView](self, "_showSpinnerView");
  objc_msgSend(v4, "externalID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDClinicalProviderDetailsViewController providerCache](self, "providerCache");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("_CacheDateKey"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "timeIntervalSinceDate:", v8);
      v11 = v10;

      if (v11 <= 180.0)
      {
        objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("_CacheProviderKey"));
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        -[WDClinicalProviderDetailsViewController setProvider:](self, "setProvider:", v22);
        -[WDClinicalProviderDetailsViewController _hideSpinnerView](self, "_hideSpinnerView");

        goto LABEL_13;
      }
      -[WDClinicalProviderDetailsViewController providerCache](self, "providerCache");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "removeObjectForKey:", v5);

    }
  }
  objc_msgSend(v4, "externalID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "hasPrefix:", *MEMORY[0x1E0D2EE48]);

  if (v14)
  {
    -[HRProfile clinicalSampleAccountsLoader](self->_profile, "clinicalSampleAccountsLoader");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "externalID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = 0;
    objc_msgSend(v15, "providerForSampleDataSearchResultWithExternalID:error:", v16, &v27);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v27;

    if (v17)
    {
      -[WDClinicalProviderDetailsViewController setProvider:](self, "setProvider:", v17);
      -[WDClinicalProviderDetailsViewController _hideSpinnerView](self, "_hideSpinnerView");
    }
    else
    {
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __72__WDClinicalProviderDetailsViewController__fetchDetailsForSearchResult___block_invoke;
      block[3] = &unk_1E74D1A90;
      block[4] = self;
      v26 = v18;
      dispatch_async(MEMORY[0x1E0C80D38], block);

    }
  }
  else
  {
    -[WDClinicalProviderDetailsViewController setFetchesInFlight:](self, "setFetchesInFlight:", -[WDClinicalProviderDetailsViewController fetchesInFlight](self, "fetchesInFlight") + 1);
    -[WDClinicalProviderDetailsViewController providerServiceStore](self, "providerServiceStore");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "externalID");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "batchID");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __72__WDClinicalProviderDetailsViewController__fetchDetailsForSearchResult___block_invoke_2;
    v23[3] = &unk_1E74D2408;
    v23[4] = self;
    v24 = v5;
    objc_msgSend(v19, "fetchRemoteProviderWithExternalID:batchID:completion:", v20, v21, v23);

  }
LABEL_13:

}

uint64_t __72__WDClinicalProviderDetailsViewController__fetchDetailsForSearchResult___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_hideSpinnerView");
  return objc_msgSend(*(id *)(a1 + 32), "_presentError:", *(_QWORD *)(a1 + 40));
}

void __72__WDClinicalProviderDetailsViewController__fetchDetailsForSearchResult___block_invoke_2(uint64_t a1, void *a2, void *a3)
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
  v10[2] = __72__WDClinicalProviderDetailsViewController__fetchDetailsForSearchResult___block_invoke_3;
  v10[3] = &unk_1E74D1288;
  v7 = *(void **)(a1 + 40);
  v10[4] = *(_QWORD *)(a1 + 32);
  v11 = v5;
  v12 = v6;
  v13 = v7;
  v8 = v6;
  v9 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], v10);

}

void __72__WDClinicalProviderDetailsViewController__fetchDetailsForSearchResult___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v5[2];
  _QWORD v6[3];

  v6[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "setFetchesInFlight:", objc_msgSend(*(id *)(a1 + 32), "fetchesInFlight") - 1);
  if (*(_QWORD *)(a1 + 40))
  {
    v5[0] = CFSTR("_CacheDateKey");
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v5[1] = CFSTR("_CacheProviderKey");
    v6[0] = v2;
    v6[1] = *(_QWORD *)(a1 + 40);
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, v5, 2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "providerCache");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v3, *(_QWORD *)(a1 + 56));

    objc_msgSend(*(id *)(a1 + 32), "setProvider:", *(_QWORD *)(a1 + 40));
    objc_msgSend(*(id *)(a1 + 32), "_hideSpinnerView");

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "setProvider:", 0);
    if (*(_QWORD *)(a1 + 48))
    {
      objc_msgSend(*(id *)(a1 + 32), "_hideSpinnerView");
      objc_msgSend(*(id *)(a1 + 32), "_presentError:", *(_QWORD *)(a1 + 48));
    }
  }
}

- (void)_computeSections
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  WDClinicalProviderDetailsViewController *v11;
  id v12;

  -[HKClinicalProvider gateways](self->_provider, "gateways");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "hk_map:", &__block_literal_global_7);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[WDClinicalProviderDetailsViewController profile](self, "profile");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "clinicalAccountStore");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __59__WDClinicalProviderDetailsViewController__computeSections__block_invoke_2;
    v9[3] = &unk_1E74D24B0;
    v10 = v5;
    v11 = self;
    v12 = v4;
    v8 = v5;
    objc_msgSend(v7, "fetchAccountsForGatewaysWithExternalIDs:completion:", v8, v9);

  }
}

uint64_t __59__WDClinicalProviderDetailsViewController__computeSections__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "externalID");
}

void __59__WDClinicalProviderDetailsViewController__computeSections__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  _QWORD block[5];
  id v11;
  id v12;

  v5 = a3;
  if (a2)
  {
    objc_msgSend(a2, "hk_map:", &__block_literal_global_202);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __59__WDClinicalProviderDetailsViewController__computeSections__block_invoke_2_203;
    block[3] = &unk_1E74D11C8;
    v7 = *(void **)(a1 + 48);
    block[4] = *(_QWORD *)(a1 + 40);
    v11 = v7;
    v12 = v6;
    v8 = v6;
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
  else
  {
    _HKInitializeLogging();
    v9 = (void *)*MEMORY[0x1E0CB52D8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52D8], OS_LOG_TYPE_ERROR))
      __59__WDClinicalProviderDetailsViewController__computeSections__block_invoke_2_cold_1(a1, v9, (uint64_t)v5);
  }

}

uint64_t __59__WDClinicalProviderDetailsViewController__computeSections__block_invoke_200(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "gateway");
}

uint64_t __59__WDClinicalProviderDetailsViewController__computeSections__block_invoke_2_203(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_computeSectionsWithGateways:connectedGateways:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)_computeSectionsWithGateways:(id)a3 connectedGateways:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  NSArray *v17;
  NSArray *connectedGateways;
  void *v19;
  void *v20;
  NSArray *v21;
  NSArray *unconnectedGateways;
  void *v23;
  NSArray *v24;
  NSArray *unavailableGateways;
  void *v26;
  NSArray *v27;
  NSArray *internalOnlyVisibleGateways;
  NSUInteger v29;
  NSUInteger v30;
  NSUInteger v31;
  id v32;
  id v33;
  NSArray *v34;
  NSArray *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  id v41;
  id v42;
  id v43;
  id v44;
  NSArray *v45;
  NSArray *sections;
  void *v47;
  void *v48;
  NSArray *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  void *v54;
  NSArray *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  void *v59;
  void *v60;
  id v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  void *v65;
  void *v66;
  id v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  void *v71;
  void *v72;
  uint64_t v73;
  uint64_t v74;
  id v75;
  id v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  _BYTE v97[128];
  _BYTE v98[128];
  _BYTE v99[128];
  _BYTE v100[128];
  _QWORD v101[5];
  _QWORD v102[2];
  _BYTE v103[128];
  uint64_t v104;

  v104 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  v76 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v75 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (objc_msgSend(MEMORY[0x1E0CB6F18], "isAppleInternalInstall"))
    v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  else
    v8 = 0;
  v95 = 0u;
  v96 = 0u;
  v93 = 0u;
  v94 = 0u;
  v9 = v6;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v93, v103, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v94;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v94 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v93 + 1) + 8 * i);
        if (objc_msgSend(v14, "status") != 3)
        {
          objc_msgSend(v14, "newerSupportedGatewayVersion");
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          v16 = v8;
          if (!v15)
          {
            if (objc_msgSend(v14, "status") == 2)
              v16 = v75;
            else
              v16 = v76;
          }
          objc_msgSend(v16, "addObject:", v14);
        }
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v93, v103, 16);
    }
    while (v11);
  }

  -[WDClinicalProviderDetailsViewController _orderGatewaysForDisplay:](self, "_orderGatewaysForDisplay:", v7);
  v17 = (NSArray *)objc_claimAutoreleasedReturnValue();
  connectedGateways = self->_connectedGateways;
  self->_connectedGateways = v17;

  objc_msgSend(v76, "arrayByExcludingObjectsInArray:", self->_connectedGateways);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDClinicalProviderDetailsViewController _filterGatewaysForDisplay:](self, "_filterGatewaysForDisplay:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDClinicalProviderDetailsViewController _orderGatewaysForDisplay:](self, "_orderGatewaysForDisplay:", v20);
  v21 = (NSArray *)objc_claimAutoreleasedReturnValue();
  unconnectedGateways = self->_unconnectedGateways;
  self->_unconnectedGateways = v21;

  objc_msgSend(v75, "arrayByExcludingObjectsInArray:", self->_connectedGateways);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDClinicalProviderDetailsViewController _orderGatewaysForDisplay:](self, "_orderGatewaysForDisplay:", v23);
  v24 = (NSArray *)objc_claimAutoreleasedReturnValue();
  unavailableGateways = self->_unavailableGateways;
  self->_unavailableGateways = v24;

  objc_msgSend(v8, "arrayByExcludingObjectsInArray:", self->_connectedGateways);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDClinicalProviderDetailsViewController _orderGatewaysForDisplay:](self, "_orderGatewaysForDisplay:", v26);
  v27 = (NSArray *)objc_claimAutoreleasedReturnValue();
  internalOnlyVisibleGateways = self->_internalOnlyVisibleGateways;
  self->_internalOnlyVisibleGateways = v27;

  v29 = -[NSArray count](self->_connectedGateways, "count");
  v30 = -[NSArray count](self->_unconnectedGateways, "count") + v29;
  v31 = v30 + -[NSArray count](self->_unavailableGateways, "count");
  if (v31 + -[NSArray count](self->_internalOnlyVisibleGateways, "count"))
  {
    v73 = 1096;
    v74 = 1104;
    v40 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v101[0] = v40;
    v41 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v101[1] = v41;
    v42 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v101[2] = v42;
    v43 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v101[3] = v43;
    v44 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v101[4] = v44;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v101, 5);
    v45 = (NSArray *)objc_claimAutoreleasedReturnValue();
    sections = self->_sections;
    self->_sections = v45;

    -[NSArray objectAtIndexedSubscript:](self->_sections, "objectAtIndexedSubscript:", 0);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    +[WDClinicalLocationCell defaultReuseIdentifier](WDClinicalOnboardingLocationCell, "defaultReuseIdentifier");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "addObject:", v48);

    v91 = 0u;
    v92 = 0u;
    v89 = 0u;
    v90 = 0u;
    v49 = self->_connectedGateways;
    v50 = -[NSArray countByEnumeratingWithState:objects:count:](v49, "countByEnumeratingWithState:objects:count:", &v89, v100, 16);
    if (v50)
    {
      v51 = v50;
      v52 = *(_QWORD *)v90;
      while (1)
      {
        if (*(_QWORD *)v90 != v52)
          objc_enumerationMutation(v49);
        -[NSArray objectAtIndexedSubscript:](self->_sections, "objectAtIndexedSubscript:", 2, v73, v74);
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        +[WDMedicalRecordGroupableCell defaultReuseIdentifier](WDClinicalOnboardingGatewayCell, "defaultReuseIdentifier");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v53, "addObject:", v54);

        if (!--v51)
        {
          v51 = -[NSArray countByEnumeratingWithState:objects:count:](v49, "countByEnumeratingWithState:objects:count:", &v89, v100, 16);
          if (!v51)
            break;
        }
      }
    }

    v87 = 0u;
    v88 = 0u;
    v85 = 0u;
    v86 = 0u;
    v55 = self->_unconnectedGateways;
    v56 = -[NSArray countByEnumeratingWithState:objects:count:](v55, "countByEnumeratingWithState:objects:count:", &v85, v99, 16);
    if (v56)
    {
      v57 = v56;
      v58 = *(_QWORD *)v86;
      while (1)
      {
        if (*(_QWORD *)v86 != v58)
          objc_enumerationMutation(v55);
        -[NSArray objectAtIndexedSubscript:](self->_sections, "objectAtIndexedSubscript:", 1, v73);
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        +[WDMedicalRecordGroupableCell defaultReuseIdentifier](WDClinicalOnboardingGatewayCell, "defaultReuseIdentifier");
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v59, "addObject:", v60);

        if (!--v57)
        {
          v57 = -[NSArray countByEnumeratingWithState:objects:count:](v55, "countByEnumeratingWithState:objects:count:", &v85, v99, 16);
          if (!v57)
            break;
        }
      }
    }

    v83 = 0u;
    v84 = 0u;
    v81 = 0u;
    v82 = 0u;
    v61 = *(id *)((char *)&self->super.super.super.super.super.isa + v73);
    v62 = objc_msgSend(v61, "countByEnumeratingWithState:objects:count:", &v81, v98, 16);
    if (v62)
    {
      v63 = v62;
      v64 = *(_QWORD *)v82;
      while (1)
      {
        if (*(_QWORD *)v82 != v64)
          objc_enumerationMutation(v61);
        -[NSArray objectAtIndexedSubscript:](self->_sections, "objectAtIndexedSubscript:", 3, v73);
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        +[WDMedicalRecordGroupableCell defaultReuseIdentifier](WDClinicalOnboardingGatewayCell, "defaultReuseIdentifier");
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v65, "addObject:", v66);

        if (!--v63)
        {
          v63 = objc_msgSend(v61, "countByEnumeratingWithState:objects:count:", &v81, v98, 16);
          if (!v63)
            break;
        }
      }
    }

    v79 = 0u;
    v80 = 0u;
    v77 = 0u;
    v78 = 0u;
    v67 = *(id *)((char *)&self->super.super.super.super.super.isa + v74);
    v68 = objc_msgSend(v67, "countByEnumeratingWithState:objects:count:", &v77, v97, 16);
    if (v68)
    {
      v69 = v68;
      v70 = *(_QWORD *)v78;
      while (1)
      {
        if (*(_QWORD *)v78 != v70)
          objc_enumerationMutation(v67);
        -[NSArray objectAtIndexedSubscript:](self->_sections, "objectAtIndexedSubscript:", 4, v73);
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        +[WDMedicalRecordGroupableCell defaultReuseIdentifier](WDClinicalOnboardingGatewayCell, "defaultReuseIdentifier");
        v72 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v71, "addObject:", v72);

        if (!--v69)
        {
          v69 = objc_msgSend(v67, "countByEnumeratingWithState:objects:count:", &v77, v97, 16);
          if (!v69)
            break;
        }
      }
    }

    -[WDClinicalProviderDetailsViewController tableView](self, "tableView");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "reloadData");
  }
  else
  {
    self->_noGatewaysFound = 1;
    v32 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v102[0] = v32;
    v33 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v102[1] = v33;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v102, 2);
    v34 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v35 = self->_sections;
    self->_sections = v34;

    -[NSArray objectAtIndexedSubscript:](self->_sections, "objectAtIndexedSubscript:", 0);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    +[WDClinicalLocationCell defaultReuseIdentifier](WDClinicalOnboardingLocationCell, "defaultReuseIdentifier");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "addObject:", v37);

    -[NSArray objectAtIndexedSubscript:](self->_sections, "objectAtIndexedSubscript:", 1);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "defaultReuseIdentifier");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "addObject:", v39);

  }
}

- (id)_filterGatewaysForDisplay:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        -[WDClinicalProviderDetailsViewController latestSupportedVersionOfGateway:fromGateways:](self, "latestSupportedVersionOfGateway:fromGateways:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v10), v6, (_QWORD)v14);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11)
          objc_msgSend(v5, "addObject:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

  objc_msgSend(v5, "allObjects");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)latestSupportedVersionOfGateway:(id)a3 fromGateways:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  _BOOL4 v15;
  NSObject *v17;
  objc_class *v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v22[4];
  id v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = HKProviderServiceMaximumCompatibleAPIVersion();
  if (objc_msgSend(v5, "minCompatibleAPIVersion") <= v7)
  {
    objc_msgSend(v5, "newerSupportedGatewayVersion");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
    {
      v22[0] = MEMORY[0x1E0C809B0];
      v22[1] = 3221225472;
      v22[2] = __88__WDClinicalProviderDetailsViewController_latestSupportedVersionOfGateway_fromGateways___block_invoke;
      v22[3] = &unk_1E74D24D8;
      v11 = v9;
      v23 = v11;
      objc_msgSend(v6, "hk_firstObjectPassingTest:", v22);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v12;
      if (!v12)
      {
        _HKInitializeLogging();
        v14 = (void *)*MEMORY[0x1E0CB52D8];
        v15 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52D8], OS_LOG_TYPE_ERROR);
        v13 = v5;
        if (v15)
        {
          v17 = v14;
          v18 = (objc_class *)objc_opt_class();
          NSStringFromClass(v18);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "gatewayID");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "externalID");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v25 = v19;
          v26 = 2114;
          v27 = v20;
          v28 = 2114;
          v29 = v21;
          _os_log_error_impl(&dword_1BC30A000, v17, OS_LOG_TYPE_ERROR, "%{public}@ got a newer gateway reference (%{public}@) for gateway %{public}@, however it's not been returned from PC", buf, 0x20u);

          v13 = v5;
        }
      }
      v8 = v13;

    }
    else
    {
      v8 = v5;
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

uint64_t __88__WDClinicalProviderDetailsViewController_latestSupportedVersionOfGateway_fromGateways___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "gatewayID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "externalID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v4, "isEqualToString:", v5);
  return v6;
}

- (id)_orderGatewaysForDisplay:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[3];

  v9[2] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (objc_msgSend(v3, "count"))
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3928]), "initWithKey:ascending:selector:", CFSTR("title"), 1, sel_localizedCaseInsensitiveCompare_);
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3928]), "initWithKey:ascending:selector:", CFSTR("subtitle"), 1, sel_localizedCaseInsensitiveCompare_);
    v9[0] = v4;
    v9[1] = v5;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "sortedArrayUsingDescriptors:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v7;
}

- (id)_gatewayAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  switch(objc_msgSend(v4, "section"))
  {
    case 1:
      -[WDClinicalProviderDetailsViewController unconnectedGateways](self, "unconnectedGateways");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    case 2:
      -[WDClinicalProviderDetailsViewController connectedGateways](self, "connectedGateways");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    case 3:
      -[WDClinicalProviderDetailsViewController unavailableGateways](self, "unavailableGateways");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    case 4:
      -[WDClinicalProviderDetailsViewController internalOnlyVisibleGateways](self, "internalOnlyVisibleGateways");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_7:
      v7 = v5;
      objc_msgSend(v5, "objectAtIndexedSubscript:", objc_msgSend(v4, "row"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      break;
    default:
      v6 = 0;
      break;
  }

  return v6;
}

- (void)_presentError:(id)a3
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

  v4 = a3;
  _HKInitializeLogging();
  v5 = (void *)*MEMORY[0x1E0CB52D8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52D8], OS_LOG_TYPE_ERROR))
    -[WDClinicalProviderDetailsViewController _presentError:].cold.1(v5, v4);
  -[WDClinicalProviderDetailsViewController presentedViewController](self, "presentedViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    HRLocalizedString(CFSTR("HEALTH_RECORDS_PROVIDER_SERVICE_ERROR_ONBOARDING_DETAILS"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(MEMORY[0x1E0CB6F18], "isAppleInternalInstall"))
    {
      objc_msgSend(v4, "localizedDescription");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "stringByAppendingFormat:", CFSTR("\n\n[Internal Only]\n%@"), v8);
      v9 = objc_claimAutoreleasedReturnValue();

      v7 = (void *)v9;
    }
    v10 = (void *)MEMORY[0x1E0DC3450];
    HRLocalizedString(CFSTR("HEALTH_RECORDS_PROVIDER_SERVICE_ERROR_TITLE"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "basicAlertControllerWithTitle:message:", v11, v7);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    -[WDClinicalProviderDetailsViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v12, 1, 0);
  }

}

- (unint64_t)supportedInterfaceOrientations
{
  return 2;
}

- (void)setProvider:(id)a3
{
  id v5;
  id v6;

  v6 = a3;
  -[WDClinicalProviderDetailsViewController provider](self, "provider");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 != v6)
  {
    objc_storeStrong((id *)&self->_provider, a3);
    self->_noGatewaysFound = 0;
    -[WDClinicalProviderDetailsViewController _computeSections](self, "_computeSections");
  }

}

- (void)scrollViewDidChangeAdjustedContentInset:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[WDClinicalProviderDetailsViewController tableView](self, "tableView");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == v4)
    -[WDClinicalProviderDetailsViewController _updateNoContentViewConstraints](self, "_updateNoContentViewConstraints");
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

  -[WDClinicalProviderDetailsViewController tableView](self, "tableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "adjustedContentInset");
  v5 = v4;
  -[WDClinicalProviderDetailsViewController tableView](self, "tableView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "safeAreaInsets");
  v8 = v5 - v7;
  WeakRetained = objc_loadWeakRetained((id *)&self->_noContentTopConstraint);
  objc_msgSend(WeakRetained, "setConstant:", v8);

  -[WDClinicalProviderDetailsViewController tableView](self, "tableView");
  v16 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "adjustedContentInset");
  v11 = v10;
  -[WDClinicalProviderDetailsViewController tableView](self, "tableView");
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
      -[WDClinicalProviderDetailsViewController setNoContentParentView:](self, "setNoContentParentView:");
    }
    else
    {
      -[WDClinicalProviderDetailsViewController _createNoContentParentView](self, "_createNoContentParentView");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[WDClinicalProviderDetailsViewController setNoContentParentView:](self, "setNoContentParentView:", v6);

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
    -[WDClinicalProviderDetailsViewController setNoContentTopConstraint:](self, "setNoContentTopConstraint:", v10);
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
    -[WDClinicalProviderDetailsViewController setNoContentBottomConstraint:](self, "setNoContentBottomConstraint:", v14);
    -[WDClinicalProviderDetailsViewController _updateNoContentViewConstraints](self, "_updateNoContentViewConstraints");
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
      -[WDClinicalProviderDetailsViewController tableView](self, "tableView");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "addSubview:", self->_noContentParentView);

      v41 = (void *)MEMORY[0x1E0CB3718];
      -[UIView widthAnchor](self->_noContentParentView, "widthAnchor");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      -[WDClinicalProviderDetailsViewController tableView](self, "tableView");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v56, "widthAnchor");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v54, "constraintEqualToAnchor:", v52);
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      v60[0] = v50;
      -[UIView topAnchor](self->_noContentParentView, "topAnchor");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      -[WDClinicalProviderDetailsViewController tableView](self, "tableView");
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
      -[WDClinicalProviderDetailsViewController tableView](self, "tableView");
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
      -[WDClinicalProviderDetailsViewController tableView](self, "tableView");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "leadingAnchor");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "constraintEqualToAnchor:", v30);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v60[3] = v31;
      -[UIView trailingAnchor](self->_noContentParentView, "trailingAnchor");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      -[WDClinicalProviderDetailsViewController tableView](self, "tableView");
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

- (id)_createSpinnerView
{
  HRWDSpinnerView *v2;
  void *v3;

  v2 = objc_alloc_init(HRWDSpinnerView);
  -[HRWDSpinnerView setTranslatesAutoresizingMaskIntoConstraints:](v2, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(MEMORY[0x1E0DC1350], "_preferredFontForTextStyle:variant:", *MEMORY[0x1E0DC4B10], 1024);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HRWDSpinnerView setMessageFont:](v2, "setMessageFont:", v3);

  return v2;
}

- (void)_showSpinnerView
{
  void *v3;
  void *v4;
  id v5;

  -[HRWDSpinnerView superview](self->_spinnerView, "superview");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    if (self->_spinnerView)
    {
      -[WDClinicalProviderDetailsViewController setSpinnerView:](self, "setSpinnerView:");
    }
    else
    {
      -[WDClinicalProviderDetailsViewController _createSpinnerView](self, "_createSpinnerView");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      -[WDClinicalProviderDetailsViewController setSpinnerView:](self, "setSpinnerView:", v4);

    }
    -[WDClinicalProviderDetailsViewController _showNoContentView:](self, "_showNoContentView:", self->_spinnerView);
    -[HRWDSpinnerView startSpinner](self->_spinnerView, "startSpinner");
    -[WDClinicalProviderDetailsViewController tableView](self, "tableView");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "reloadData");

  }
}

- (void)_hideSpinnerView
{
  id v3;

  -[HRWDSpinnerView stopSpinner](self->_spinnerView, "stopSpinner");
  -[WDClinicalProviderDetailsViewController _showNoContentView:](self, "_showNoContentView:", 0);
  -[WDClinicalProviderDetailsViewController tableView](self, "tableView");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "reloadData");

}

- (void)clearLoginBusyIndicator
{
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  -[WDClinicalProviderDetailsViewController _hideSpinnerView](self, "_hideSpinnerView");
}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  BOOL v7;

  v5 = a4;
  v6 = v5;
  v7 = !self->_noGatewaysFound && (objc_msgSend(v5, "section") == 1 || objc_msgSend(v6, "section") == 4);

  return v7;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  id v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  NSObject *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  _QWORD v32[5];
  uint8_t buf[4];
  id v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  if (!self->_noGatewaysFound)
  {
    objc_msgSend(a3, "cellForRowAtIndexPath:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
LABEL_15:

      goto LABEL_16;
    }
    -[WDClinicalProviderDetailsViewController _gatewayAtIndexPath:](self, "_gatewayAtIndexPath:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v8)
    {
      _HKInitializeLogging();
      v12 = (void *)*MEMORY[0x1E0CB52D8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52D8], OS_LOG_TYPE_ERROR))
        -[WDClinicalProviderDetailsViewController tableView:didSelectRowAtIndexPath:].cold.1(v12);
      goto LABEL_14;
    }
    if (-[NSArray containsObject:](self->_unconnectedGateways, "containsObject:", v8)
      || -[NSArray containsObject:](self->_internalOnlyVisibleGateways, "containsObject:", v8))
    {
      if (!objc_msgSend(MEMORY[0x1E0CB6F18], "isRunningStoreDemoMode"))
      {
        objc_msgSend(v8, "externalID");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "hasPrefix:", *MEMORY[0x1E0D2EE40]);

        if (!v14)
        {
          switch(objc_msgSend(v8, "status"))
          {
            case 0:
              _HKInitializeLogging();
              v16 = *MEMORY[0x1E0CB52D8];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52D8], OS_LOG_TYPE_ERROR))
                -[WDClinicalProviderDetailsViewController tableView:didSelectRowAtIndexPath:].cold.2(v16, v17, v18, v19, v20, v21, v22, v23);
              goto LABEL_20;
            case 1:
LABEL_20:
              -[WDClinicalProviderDetailsViewController _handleTapForActivateGateway:](self, "_handleTapForActivateGateway:", v8);
              break;
            case 2:
              objc_msgSend(v8, "title");
              v10 = objc_claimAutoreleasedReturnValue();
              -[WDClinicalProviderDetailsViewController _presentUnavailableAlertForGatewayTitle:](self, "_presentUnavailableAlertForGatewayTitle:", v10);
              goto LABEL_13;
            case 3:
              _HKInitializeLogging();
              v24 = *MEMORY[0x1E0CB52D8];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52D8], OS_LOG_TYPE_ERROR))
                -[WDClinicalProviderDetailsViewController tableView:didSelectRowAtIndexPath:].cold.3(v24, v25, v26, v27, v28, v29, v30, v31);
              break;
            default:
              goto LABEL_14;
          }
          goto LABEL_14;
        }
        -[HRProfile clinicalSampleAccountsLoader](self->_profile, "clinicalSampleAccountsLoader");
        v10 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "externalID");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v32[0] = MEMORY[0x1E0C809B0];
        v32[1] = 3221225472;
        v32[2] = __77__WDClinicalProviderDetailsViewController_tableView_didSelectRowAtIndexPath___block_invoke;
        v32[3] = &unk_1E74D2500;
        v32[4] = self;
        -[NSObject loadFirstSampleAccountDataBatchForGatewayWithExternalID:completion:](v10, "loadFirstSampleAccountDataBatchForGatewayWithExternalID:completion:", v15, v32);

        goto LABEL_13;
      }
      _HKInitializeLogging();
      v9 = (void *)*MEMORY[0x1E0CB52D8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52D8], OS_LOG_TYPE_DEFAULT))
      {
        v10 = v9;
        *(_DWORD *)buf = 138543362;
        v34 = (id)objc_opt_class();
        v11 = v34;
        _os_log_impl(&dword_1BC30A000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ running store demo mode, connecting to gateways is not supported", buf, 0xCu);

LABEL_13:
      }
    }
LABEL_14:

    goto LABEL_15;
  }
LABEL_16:

}

void __77__WDClinicalProviderDetailsViewController_tableView_didSelectRowAtIndexPath___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  id v8;
  id v9;
  _QWORD block[4];
  id v11;
  uint64_t v12;
  id v13;

  v5 = a2;
  v6 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __77__WDClinicalProviderDetailsViewController_tableView_didSelectRowAtIndexPath___block_invoke_2;
  block[3] = &unk_1E74D11C8;
  v7 = *(_QWORD *)(a1 + 32);
  v11 = v5;
  v12 = v7;
  v13 = v6;
  v8 = v6;
  v9 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __77__WDClinicalProviderDetailsViewController_tableView_didSelectRowAtIndexPath___block_invoke_2(_QWORD *a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  if (a1[4])
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37C0], "OAuthCompletionNotification");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = a1[5];
    +[OAuthCompletionNotificationUserInfoKeys account](_TtC15HealthRecordsUI39OAuthCompletionNotificationUserInfoKeys, "account");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = a1[4];
    v8 = v5;
    v9[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "postNotificationName:object:userInfo:", v3, v4, v7);

  }
  else
  {
    objc_msgSend((id)a1[5], "_presentError:", a1[6]);
  }
}

- (void)_handleTapForActivateGateway:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  objc_class *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _HKInitializeLogging();
  v5 = (void *)*MEMORY[0x1E0CB52D8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52D8], OS_LOG_TYPE_DEFAULT))
  {
    v6 = v5;
    v7 = (objc_class *)objc_opt_class();
    NSStringFromClass(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    HKSensitiveLogItem();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v20 = v8;
    v21 = 2114;
    v22 = v9;
    _os_log_impl(&dword_1BC30A000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ did tap gateway %{public}@", buf, 0x16u);

  }
  objc_initWeak((id *)buf, self);
  -[WDClinicalProviderDetailsViewController profile](self, "profile");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "clinicalSourcesDataProvider");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __72__WDClinicalProviderDetailsViewController__handleTapForActivateGateway___block_invoke;
  v17[3] = &unk_1E74D2528;
  objc_copyWeak(&v18, (id *)buf);
  v14[0] = v12;
  v14[1] = 3221225472;
  v14[2] = __72__WDClinicalProviderDetailsViewController__handleTapForActivateGateway___block_invoke_2;
  v14[3] = &unk_1E74D2550;
  objc_copyWeak(&v16, (id *)buf);
  v13 = v4;
  v15 = v13;
  objc_msgSend(v11, "beginInitialLoginSessionForGateway:fromViewController:loginCancelledHandler:errorHandler:", v13, self, v17, v14);

  -[WDClinicalProviderDetailsViewController _showSpinnerView](self, "_showSpinnerView");
  objc_destroyWeak(&v16);
  objc_destroyWeak(&v18);
  objc_destroyWeak((id *)buf);

}

void __72__WDClinicalProviderDetailsViewController__handleTapForActivateGateway___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "clearLoginBusyIndicator");

}

void __72__WDClinicalProviderDetailsViewController__handleTapForActivateGateway___block_invoke_2(uint64_t a1, void *a2)
{
  id *v3;
  id v4;
  id WeakRetained;
  void *v6;
  id v7;
  id v8;

  v3 = (id *)(a1 + 40);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend(WeakRetained, "clearLoginBusyIndicator");

  +[HRViewControllerFactory shared](HRViewControllerFactory, "shared");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "makeFailedToOnboardAccountAlertControllerToGateway:error:", *(_QWORD *)(a1 + 32), v4);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  v7 = objc_loadWeakRetained(v3);
  objc_msgSend(v7, "presentViewController:animated:completion:", v8, 1, 0);

}

- (void)_presentUnavailableAlertForGatewayTitle:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  HRLocalizedString(CFSTR("HEALTH_RECORDS_ONBOARDING_PORTAL_UNAVAILABLE_ALERT_TITLE"));
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0CB3940];
  HRLocalizedString(CFSTR("HEALTH_RECORDS_ONBOARDING_PORTAL_%@_UNAVAILABLE_ALERT_MESSAGE"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", v6, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC3450], "basicAlertControllerWithTitle:message:", v9, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDClinicalProviderDetailsViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v8, 1, 0);

}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  void *v4;
  void *v6;
  int64_t v7;

  -[HRWDSpinnerView superview](self->_spinnerView, "superview", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    return 0;
  -[WDClinicalProviderDetailsViewController sections](self, "sections");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  return v7;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  id v6;
  const __CFString *v7;
  __CFString *v8;

  v6 = a3;
  if (self->_provider)
  {
    switch(a4)
    {
      case 1:
        if (!-[NSArray count](self->_unconnectedGateways, "count"))
          goto LABEL_10;
        v7 = CFSTR("HEALTH_RECORDS_ONBOARDING_ACCOUNTS_UNCONNECTED");
        goto LABEL_9;
      case 2:
        if (!-[NSArray count](self->_connectedGateways, "count"))
          goto LABEL_10;
        v7 = CFSTR("HEALTH_RECORDS_ONBOARDING_ACCOUNTS_CONNECTED");
        goto LABEL_9;
      case 3:
        if (!-[NSArray count](self->_unavailableGateways, "count"))
          goto LABEL_10;
        v7 = CFSTR("HEALTH_RECORDS_ONBOARDING_ACCOUNTS_UNAVAILABLE");
LABEL_9:
        HRLocalizedString(v7);
        v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
        break;
      case 4:
        if (-[NSArray count](self->_internalOnlyVisibleGateways, "count"))
          v8 = CFSTR("[Internal Only] Other Gateways");
        else
          v8 = 0;
        break;
      default:
        goto LABEL_10;
    }
  }
  else
  {
LABEL_10:
    v8 = 0;
  }

  return v8;
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  double result;

  result = *MEMORY[0x1E0DC53D8];
  if (!a4)
    return 0.0;
  return result;
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  void *v4;
  void *v5;

  v4 = (void *)a4;
  if (a4)
  {
    -[WDClinicalProviderDetailsViewController tableView](self, "tableView", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "headerViewForSection:", v4);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v4;
}

- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4
{
  return 0;
}

- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4
{
  return 0.0;
}

- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4
{
  return 0;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  void *v5;
  void *v6;
  int64_t v7;

  -[WDClinicalProviderDetailsViewController sections](self, "sections", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndexedSubscript:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  return v7;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
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
  id v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  _QWORD v38[2];
  _QWORD v39[2];
  _QWORD v40[3];

  v40[2] = *MEMORY[0x1E0C80C00];
  v5 = a4;
  -[WDClinicalProviderDetailsViewController sections](self, "sections");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectAtIndexedSubscript:", objc_msgSend(v5, "section"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectAtIndexedSubscript:", objc_msgSend(v5, "row"));
  v8 = objc_claimAutoreleasedReturnValue();

  -[WDClinicalProviderDetailsViewController tableView](self, "tableView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)v8;
  objc_msgSend(v9, "dequeueReusableCellWithIdentifier:forIndexPath:", v8, v5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[WDClinicalProviderDetailsViewController profile](self, "profile");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "clinicalSourcesDataProvider");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v14 = v11;
    -[WDClinicalProviderDetailsViewController provider](self, "provider");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[WDClinicalProviderDetailsViewController profile](self, "profile");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "clinicalSourcesDataProvider");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setProvider:dataProvider:", v15, v17);

    HKUIJoinStringsForAutomationIdentifier();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v40[0] = v18;
    v40[1] = CFSTR("ProviderName");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v40, 2);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    HKUIJoinStringsForAutomationIdentifier();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "titleLabel");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setAccessibilityIdentifier:", v20);

    v39[0] = v18;
    v39[1] = CFSTR("ProviderDescription");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v39, 2);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    HKUIJoinStringsForAutomationIdentifier();
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "subtitleLabel");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setAccessibilityIdentifier:", v23);

    v38[0] = v18;
    v38[1] = CFSTR("ProviderLocation");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v38, 2);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    HKUIJoinStringsForAutomationIdentifier();
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "detailLabel");
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v27, "setAccessibilityIdentifier:", v26);
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v28 = v11;
    objc_msgSend(MEMORY[0x1E0DC3658], "secondarySystemBackgroundColor");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setPillBackgroundColorOverride:", v29);

    if (objc_msgSend(v5, "row") >= 1)
      objc_msgSend(v28, "setExtraTopPadding:", 1);
    if (objc_msgSend(v5, "section") == 2)
    {
      v30 = 1080;
    }
    else
    {
      if (objc_msgSend(v5, "section") != 3)
      {
        if (objc_msgSend(v5, "section") == 4)
          v36 = 1104;
        else
          v36 = 1088;
        objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa + v36), "objectAtIndexedSubscript:", objc_msgSend(v5, "row"));
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = v28;
        v33 = v31;
        v34 = v13;
        v35 = 0;
        goto LABEL_15;
      }
      v30 = 1096;
    }
    objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa + v30), "objectAtIndexedSubscript:", objc_msgSend(v5, "row"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = v28;
    v33 = v31;
    v34 = v13;
    v35 = 1;
LABEL_15:
    objc_msgSend(v32, "configureWithGateway:dataProvider:connected:", v33, v34, v35);

  }
  return v11;
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  id v5;

  v5 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v5, "willDisplay");

}

- (BOOL)tableView:(id)a3 shouldDrawTopSeparatorForSection:(int64_t)a4
{
  return 0;
}

- (BOOL)tableView:(id)a3 shouldDrawBottomSeparatorForSection:(int64_t)a4
{
  return 1;
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

- (HKClinicalProviderSearchResult)searchResult
{
  return self->_searchResult;
}

- (void)setSearchResult:(id)a3
{
  objc_storeStrong((id *)&self->_searchResult, a3);
}

- (int64_t)fetchesInFlight
{
  return self->_fetchesInFlight;
}

- (void)setFetchesInFlight:(int64_t)a3
{
  self->_fetchesInFlight = a3;
}

- (HKClinicalProvider)provider
{
  return self->_provider;
}

- (NSCache)providerCache
{
  return self->_providerCache;
}

- (void)setProviderCache:(id)a3
{
  objc_storeStrong((id *)&self->_providerCache, a3);
}

- (NSArray)connectedGateways
{
  return self->_connectedGateways;
}

- (void)setConnectedGateways:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1080);
}

- (NSArray)unconnectedGateways
{
  return self->_unconnectedGateways;
}

- (void)setUnconnectedGateways:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1088);
}

- (NSArray)unavailableGateways
{
  return self->_unavailableGateways;
}

- (void)setUnavailableGateways:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1096);
}

- (NSArray)internalOnlyVisibleGateways
{
  return self->_internalOnlyVisibleGateways;
}

- (void)setInternalOnlyVisibleGateways:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1104);
}

- (NSArray)sections
{
  return self->_sections;
}

- (void)setSections:(id)a3
{
  objc_storeStrong((id *)&self->_sections, a3);
}

- (HRWDSpinnerView)spinnerView
{
  return self->_spinnerView;
}

- (void)setSpinnerView:(id)a3
{
  objc_storeStrong((id *)&self->_spinnerView, a3);
}

- (UIView)noContentParentView
{
  return self->_noContentParentView;
}

- (void)setNoContentParentView:(id)a3
{
  objc_storeStrong((id *)&self->_noContentParentView, a3);
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

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_noContentBottomConstraint);
  objc_destroyWeak((id *)&self->_noContentTopConstraint);
  objc_storeStrong((id *)&self->_noContentParentView, 0);
  objc_storeStrong((id *)&self->_spinnerView, 0);
  objc_storeStrong((id *)&self->_sections, 0);
  objc_storeStrong((id *)&self->_internalOnlyVisibleGateways, 0);
  objc_storeStrong((id *)&self->_unavailableGateways, 0);
  objc_storeStrong((id *)&self->_unconnectedGateways, 0);
  objc_storeStrong((id *)&self->_connectedGateways, 0);
  objc_storeStrong((id *)&self->_providerCache, 0);
  objc_storeStrong((id *)&self->_provider, 0);
  objc_storeStrong((id *)&self->_searchResult, 0);
  objc_storeStrong((id *)&self->_providerServiceStore, 0);
  objc_storeStrong((id *)&self->_profile, 0);
}

void __59__WDClinicalProviderDetailsViewController__computeSections__block_invoke_2_cold_1(uint64_t a1, void *a2, uint64_t a3)
{
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  HKSensitiveLogItem();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138412546;
  v7 = v5;
  v8 = 2114;
  v9 = a3;
  _os_log_error_impl(&dword_1BC30A000, v4, OS_LOG_TYPE_ERROR, "Failed to fetch accounts for gateways %@: %{public}@", (uint8_t *)&v6, 0x16u);

}

- (void)_presentError:(void *)a1 .cold.1(void *a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v3 = a1;
  objc_msgSend(a2, "localizedDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_0(&dword_1BC30A000, v5, v6, "onboarding details presenting error with underlying description: %{public}@", v7, v8, v9, v10, 2u);

  OUTLINED_FUNCTION_2();
}

- (void)tableView:(void *)a1 didSelectRowAtIndexPath:.cold.1(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v1 = a1;
  HKSensitiveLogItem();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_0(&dword_1BC30A000, v3, v4, "Unable to find gateway for index path: %@", v5, v6, v7, v8, 2u);

  OUTLINED_FUNCTION_2();
}

- (void)tableView:(uint64_t)a3 didSelectRowAtIndexPath:(uint64_t)a4 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_11(&dword_1BC30A000, a1, a3, "Error: connecting to gateway with Unknown status", a5, a6, a7, a8, 0);
}

- (void)tableView:(uint64_t)a3 didSelectRowAtIndexPath:(uint64_t)a4 .cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_11(&dword_1BC30A000, a1, a3, "Error: connecting to gateway with Removed status", a5, a6, a7, a8, 0);
}

@end
