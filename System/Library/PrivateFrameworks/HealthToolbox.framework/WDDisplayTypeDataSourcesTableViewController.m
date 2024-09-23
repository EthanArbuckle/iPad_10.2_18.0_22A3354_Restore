@implementation WDDisplayTypeDataSourcesTableViewController

- (WDDisplayTypeDataSourcesTableViewController)initWithDisplayType:(id)a3 displayCategory:(id)a4 sourceOrderController:(id)a5 profile:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  WDDisplayTypeDataSourcesTableViewController *v15;
  WDDisplayTypeDataSourcesTableViewController *v16;
  uint64_t v17;
  HKHealthStore *healthStore;
  id v19;
  void *v20;
  uint64_t v21;
  HKProfileStore *profileStore;
  id v23;
  void *v24;
  uint64_t v25;
  HKAuthorizationStore *authorizationStore;
  uint64_t v27;
  NSMutableSet *dataSources;
  uint64_t v29;
  NSMutableArray *orderedDataSources;
  NSArray *readerAppSources;
  NSArray *v32;
  NSArray *readerResearchStudySources;
  uint64_t v34;
  NSMutableDictionary *authorizationRecordsBySource;
  uint64_t v36;
  NSMutableSet *sourcesPendingToggleOn;
  uint64_t v38;
  NSMutableSet *sourcesPendingToggleOff;
  uint64_t v40;
  NSArray *sectionIdentifiers;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  objc_super v51;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v51.receiver = self;
  v51.super_class = (Class)WDDisplayTypeDataSourcesTableViewController;
  v15 = -[HKTableViewController initWithUsingInsetStyling:](&v51, sel_initWithUsingInsetStyling_, 1);
  v16 = v15;
  if (v15)
  {
    v15->_isLoaded = 0;
    objc_storeStrong((id *)&v15->_displayType, a3);
    objc_storeStrong((id *)&v16->_displayCategory, a4);
    objc_storeStrong((id *)&v16->_sourceOrderController, a5);
    objc_storeStrong((id *)&v16->_profile, a6);
    objc_msgSend(v14, "healthStore");
    v17 = objc_claimAutoreleasedReturnValue();
    healthStore = v16->_healthStore;
    v16->_healthStore = (HKHealthStore *)v17;

    v19 = objc_alloc(MEMORY[0x24BDD3E40]);
    objc_msgSend(v14, "healthStore");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v19, "initWithHealthStore:", v20);
    profileStore = v16->_profileStore;
    v16->_profileStore = (HKProfileStore *)v21;

    v23 = objc_alloc(MEMORY[0x24BDD3958]);
    objc_msgSend(v14, "healthStore");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v23, "initWithHealthStore:", v24);
    authorizationStore = v16->_authorizationStore;
    v16->_authorizationStore = (HKAuthorizationStore *)v25;

    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v27 = objc_claimAutoreleasedReturnValue();
    dataSources = v16->_dataSources;
    v16->_dataSources = (NSMutableSet *)v27;

    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v29 = objc_claimAutoreleasedReturnValue();
    orderedDataSources = v16->_orderedDataSources;
    v16->_orderedDataSources = (NSMutableArray *)v29;

    readerAppSources = v16->_readerAppSources;
    v32 = (NSArray *)MEMORY[0x24BDBD1A8];
    v16->_readerAppSources = (NSArray *)MEMORY[0x24BDBD1A8];

    readerResearchStudySources = v16->_readerResearchStudySources;
    v16->_readerResearchStudySources = v32;

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v34 = objc_claimAutoreleasedReturnValue();
    authorizationRecordsBySource = v16->_authorizationRecordsBySource;
    v16->_authorizationRecordsBySource = (NSMutableDictionary *)v34;

    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v36 = objc_claimAutoreleasedReturnValue();
    sourcesPendingToggleOn = v16->_sourcesPendingToggleOn;
    v16->_sourcesPendingToggleOn = (NSMutableSet *)v36;

    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v38 = objc_claimAutoreleasedReturnValue();
    sourcesPendingToggleOff = v16->_sourcesPendingToggleOff;
    v16->_sourcesPendingToggleOff = (NSMutableSet *)v38;

    v16->_shouldInsetSectionContentForDataSourceDataList = 0;
    -[WDDisplayTypeDataSourcesTableViewController createSectionIdentifiers](v16, "createSectionIdentifiers");
    v40 = objc_claimAutoreleasedReturnValue();
    sectionIdentifiers = v16->_sectionIdentifiers;
    v16->_sectionIdentifiers = (NSArray *)v40;

    LODWORD(v32) = -[WDDisplayTypeDataSourcesTableViewController showDataSourcesSectionOnly](v16, "showDataSourcesSectionOnly");
    objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = v42;
    if ((_DWORD)v32)
    {
      objc_msgSend(v42, "localizedStringForKey:value:table:", CFSTR("SHARE_DATA_ONLY_TITLE"), &stru_24D38E7C8, CFSTR("HealthUI-Localizable"));
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      -[WDDisplayTypeDataSourcesTableViewController setTitle:](v16, "setTitle:", v44);

      if (-[WDDisplayTypeDataSourcesTableViewController _isPrimaryProfile](v16, "_isPrimaryProfile"))
      {
LABEL_9:
        -[WDDisplayTypeDataSourcesTableViewController setModalPresentationStyle:](v16, "setModalPresentationStyle:", 2);
        goto LABEL_10;
      }
      -[WDProfile healthStore](v16->_profile, "healthStore");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      WDGetProfileNameForHealthStore(v45);
      v43 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v43)
      {
LABEL_8:

        goto LABEL_9;
      }
      v46 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "localizedStringForKey:value:table:", CFSTR("SHARE_DATA_ONLY_TITLE_%@"), &stru_24D38E7C8, CFSTR("HealthUI-Localizable-tinker"));
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "localizedStringWithFormat:", v48, v43);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      -[WDDisplayTypeDataSourcesTableViewController setTitle:](v16, "setTitle:", v49);

    }
    else
    {
      objc_msgSend(v42, "localizedStringForKey:value:table:", CFSTR("SHARE_DATA_TITLE"), &stru_24D38E7C8, CFSTR("HealthUI-Localizable"));
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      -[WDDisplayTypeDataSourcesTableViewController setTitle:](v16, "setTitle:", v47);
    }

    goto LABEL_8;
  }
LABEL_10:

  return v16;
}

- (WDDisplayTypeDataSourcesTableViewController)initWithStyle:(int64_t)a3
{
  void *v4;
  uint64_t v5;
  void *v6;

  v4 = (void *)MEMORY[0x24BDBCE88];
  v5 = *MEMORY[0x24BDBCAB8];
  NSStringFromSelector(a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "raise:format:", v5, CFSTR("The -%@ method is not available on %@"), v6, objc_opt_class());

  return 0;
}

- (WDDisplayTypeDataSourcesTableViewController)initWithCoder:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)WDDisplayTypeDataSourcesTableViewController;
  return -[WDDisplayTypeDataSourcesTableViewController initWithCoder:](&v4, sel_initWithCoder_, a3);
}

- (WDDisplayTypeDataSourcesTableViewController)initWithNibName:(id)a3 bundle:(id)a4
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

- (void)setSourceListDataSource:(id)a3
{
  HKSourceListDataSource *v5;
  HKSourceListDataSource *sourceListDataSource;
  HKSourceListDataSource *v7;

  v5 = (HKSourceListDataSource *)a3;
  sourceListDataSource = self->_sourceListDataSource;
  if (sourceListDataSource != v5)
  {
    v7 = v5;
    -[HKSourceListDataSource unregisterObserver:](sourceListDataSource, "unregisterObserver:", self);
    objc_storeStrong((id *)&self->_sourceListDataSource, a3);
    -[HKSourceListDataSource registerObserver:](self->_sourceListDataSource, "registerObserver:", self);
    v5 = v7;
  }

}

- (void)updateHeaderView
{
  HKTitledIconHeaderView *headerView;
  void *v4;
  double v5;
  double v6;
  double v7;
  HKTitledIconHeaderView *v8;
  id v9;

  headerView = self->_headerView;
  -[WDDisplayTypeDataSourcesTableViewController tableView](self, "tableView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  v6 = v5;
  LODWORD(v5) = 1148846080;
  LODWORD(v7) = 1112014848;
  -[HKTitledIconHeaderView systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:](headerView, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:", v6, 0.0, v5, v7);

  -[HKTitledIconHeaderView bounds](self->_headerView, "bounds");
  -[HKTitledIconHeaderView setBounds:](self->_headerView, "setBounds:");
  v8 = self->_headerView;
  -[WDDisplayTypeDataSourcesTableViewController tableView](self, "tableView");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setTableHeaderView:", v8);

}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  HKTitledIconHeaderView *v8;
  HKTitledIconHeaderView *headerView;
  HKTitledIconHeaderView *v10;
  void *v11;
  void *v12;
  HKTitledIconHeaderView *v13;
  void *v14;
  void *v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id location;
  objc_super v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x24BDAC8D0];
  v20.receiver = self;
  v20.super_class = (Class)WDDisplayTypeDataSourcesTableViewController;
  -[HKTableViewController viewDidLoad](&v20, sel_viewDidLoad);
  -[WDDisplayTypeDataSourcesTableViewController tableView](self, "tableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setRowHeight:", *MEMORY[0x24BDF7DE0]);
  objc_msgSend(v3, "setAllowsSelectionDuringEditing:", 1);
  objc_msgSend(v3, "setEstimatedRowHeight:", *MEMORY[0x24BE4A140]);
  HKUIJoinStringsForAutomationIdentifier();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAccessibilityIdentifier:", v4);

  objc_msgSend(MEMORY[0x24BDF6AE0], "configurationWithPointSize:", 50.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKDisplayType shareIcon](self->_displayType, "shareIcon");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "imageByApplyingSymbolConfiguration:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (HKTitledIconHeaderView *)objc_alloc_init(MEMORY[0x24BE4A8E0]);
  headerView = self->_headerView;
  self->_headerView = v8;

  v10 = self->_headerView;
  -[HKDisplayType localization](self->_displayType, "localization");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "displayName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKTitledIconHeaderView setTitle:](v10, "setTitle:", v12);

  -[HKTitledIconHeaderView setIconImage:](self->_headerView, "setIconImage:", v7);
  v13 = self->_headerView;
  -[HKDisplayCategory color](self->_displayCategory, "color");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKTitledIconHeaderView setIconImageTint:](v13, "setIconImageTint:", v14);

  -[WDDisplayTypeDataSourcesTableViewController _loadDataSource](self, "_loadDataSource");
  objc_initWeak(&location, self);
  v21[0] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v21, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __58__WDDisplayTypeDataSourcesTableViewController_viewDidLoad__block_invoke;
  v17[3] = &unk_24D38DA60;
  objc_copyWeak(&v18, &location);
  v16 = (id)-[WDDisplayTypeDataSourcesTableViewController registerForTraitChanges:withHandler:](self, "registerForTraitChanges:withHandler:", v15, v17);

  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);

}

void __58__WDDisplayTypeDataSourcesTableViewController_viewDidLoad__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "updateHeaderView");

}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)WDDisplayTypeDataSourcesTableViewController;
  -[WDDisplayTypeDataSourcesTableViewController viewWillAppear:](&v4, sel_viewWillAppear_, a3);
  -[WDDisplayTypeDataSourcesTableViewController updateHeaderView](self, "updateHeaderView");
}

- (id)createSectionIdentifiers
{
  if (-[WDDisplayTypeDataSourcesTableViewController showDataSourcesSectionOnly](self, "showDataSourcesSectionOnly"))
    return &unk_24D3A62D8;
  else
    return &unk_24D3A62F0;
}

- (BOOL)showDataSourcesSectionOnly
{
  if (-[WDDisplayTypeDataSourcesTableViewController _objectTypeRequiresPerObjectAuthorization](self, "_objectTypeRequiresPerObjectAuthorization"))
  {
    return 1;
  }
  else
  {
    return !-[WDDisplayTypeDataSourcesTableViewController _isPrimaryProfile](self, "_isPrimaryProfile");
  }
}

- (BOOL)_objectTypeRequiresPerObjectAuthorization
{
  void *v2;
  char v3;

  -[HKDisplayType objectType](self->_displayType, "objectType");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "requiresPerObjectAuthorization");

  return v3;
}

- (BOOL)_isPrimaryProfile
{
  void *v2;
  void *v3;
  BOOL v4;

  -[WDProfile healthStore](self->_profile, "healthStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "profileIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "type") == 1;

  return v4;
}

- (int64_t)sectionIdentifierForSection:(int64_t)a3
{
  void *v3;
  int64_t v4;

  -[NSArray objectAtIndexedSubscript:](self->_sectionIdentifiers, "objectAtIndexedSubscript:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "integerValue");

  return v4;
}

- (int64_t)sectionForSectionIdentifier:(int64_t)a3
{
  NSArray *sectionIdentifiers;
  void *v4;
  int64_t v5;

  sectionIdentifiers = self->_sectionIdentifiers;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[NSArray indexOfObject:](sectionIdentifiers, "indexOfObject:", v4);

  return v5;
}

- (void)_gatherDataFromDataSource:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  NSMutableDictionary *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  NSMutableArray *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t k;
  void *v33;
  NSMutableArray *orderedDataSources;
  NSMutableDictionary *authorizationRecordsBySource;
  void *v36;
  uint64_t v37;
  id v38;
  NSArray *v39;
  NSArray *readerAppSources;
  NSArray *v41;
  void *v42;
  id v43;
  NSArray *v44;
  NSArray *readerResearchStudySources;
  NSMutableDictionary *v46;
  NSMutableArray *v47;
  void *v48;
  void *v49;
  void *v50;
  id v51;
  _QWORD v52[4];
  id v53;
  _QWORD v54[4];
  id v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  _QWORD v68[5];
  _BYTE v69[128];
  _BYTE v70[128];
  _BYTE v71[128];
  uint64_t v72;

  v72 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a3, "sources");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allSources");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v68[0] = MEMORY[0x24BDAC760];
  v68[1] = 3221225472;
  v68[2] = __73__WDDisplayTypeDataSourcesTableViewController__gatherDataFromDataSource___block_invoke;
  v68[3] = &unk_24D38DA88;
  v68[4] = self;
  objc_msgSend(v5, "hk_filter:", v68);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = (void *)objc_msgSend(v6, "mutableCopy");

  v51 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
  objc_msgSend(v4, "allSources");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "hk_mapToDictionary:", &__block_literal_global_6);
  v48 = (void *)objc_claimAutoreleasedReturnValue();

  v66 = 0u;
  v67 = 0u;
  v64 = 0u;
  v65 = 0u;
  v50 = v4;
  objc_msgSend(v4, "orderedAppSources");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v64, v71, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v65;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v65 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v64 + 1) + 8 * i);
        -[WDDisplayTypeDataSourcesTableViewController loadedAuthorizationRecordsBySource](self, "loadedAuthorizationRecordsBySource");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "source");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "objectForKeyedSubscript:", v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        if (v17)
        {
          if (objc_msgSend(v17, "requestedReading"))
            objc_msgSend(v51, "addObject:", v14);
          -[NSMutableDictionary setObject:forKeyedSubscript:](v7, "setObject:forKeyedSubscript:", v17, v14);
        }

      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v64, v71, 16);
    }
    while (v11);
  }

  v62 = 0u;
  v63 = 0u;
  v60 = 0u;
  v61 = 0u;
  objc_msgSend(v50, "orderedResearchStudySources");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v60, v70, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v61;
    do
    {
      for (j = 0; j != v20; ++j)
      {
        if (*(_QWORD *)v61 != v21)
          objc_enumerationMutation(v18);
        v23 = *(void **)(*((_QWORD *)&v60 + 1) + 8 * j);
        -[WDDisplayTypeDataSourcesTableViewController loadedAuthorizationRecordsBySource](self, "loadedAuthorizationRecordsBySource");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "source");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "objectForKeyedSubscript:", v25);
        v26 = (void *)objc_claimAutoreleasedReturnValue();

        if (v26)
        {
          if (objc_msgSend(v26, "requestedReading"))
            objc_msgSend(v51, "addObject:", v23);
          -[NSMutableDictionary setObject:forKeyedSubscript:](v7, "setObject:forKeyedSubscript:", v26, v23);
        }

      }
      v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v60, v70, 16);
    }
    while (v20);
  }

  v27 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v56 = 0u;
  v57 = 0u;
  v58 = 0u;
  v59 = 0u;
  -[WDDisplayTypeDataSourcesTableViewController loadedOrderedDataSources](self, "loadedOrderedDataSources");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v56, v69, 16);
  if (v29)
  {
    v30 = v29;
    v31 = *(_QWORD *)v57;
    do
    {
      for (k = 0; k != v30; ++k)
      {
        if (*(_QWORD *)v57 != v31)
          objc_enumerationMutation(v28);
        objc_msgSend(v48, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v56 + 1) + 8 * k));
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        if (v33)
          -[NSMutableArray addObject:](v27, "addObject:", v33);

      }
      v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v56, v69, 16);
    }
    while (v30);
  }

  orderedDataSources = self->_orderedDataSources;
  self->_orderedDataSources = v27;
  v47 = v27;

  authorizationRecordsBySource = self->_authorizationRecordsBySource;
  self->_authorizationRecordsBySource = v7;
  v46 = v7;

  -[WDDisplayTypeDataSourcesTableViewController _addDataSources:](self, "_addDataSources:", v49);
  -[WDDisplayTypeDataSourcesTableViewController _sortDataSources](self, "_sortDataSources");
  objc_msgSend(v50, "orderedAppSources");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = MEMORY[0x24BDAC760];
  v54[0] = MEMORY[0x24BDAC760];
  v54[1] = 3221225472;
  v54[2] = __73__WDDisplayTypeDataSourcesTableViewController__gatherDataFromDataSource___block_invoke_3;
  v54[3] = &unk_24D38DA88;
  v38 = v51;
  v55 = v38;
  objc_msgSend(v36, "hk_filter:", v54);
  v39 = (NSArray *)objc_claimAutoreleasedReturnValue();

  readerAppSources = self->_readerAppSources;
  self->_readerAppSources = v39;
  v41 = v39;

  objc_msgSend(v50, "orderedResearchStudySources");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v52[0] = v37;
  v52[1] = 3221225472;
  v52[2] = __73__WDDisplayTypeDataSourcesTableViewController__gatherDataFromDataSource___block_invoke_4;
  v52[3] = &unk_24D38DA88;
  v53 = v38;
  v43 = v38;
  objc_msgSend(v42, "hk_filter:", v52);
  v44 = (NSArray *)objc_claimAutoreleasedReturnValue();

  readerResearchStudySources = self->_readerResearchStudySources;
  self->_readerResearchStudySources = v44;

}

uint64_t __73__WDDisplayTypeDataSourcesTableViewController__gatherDataFromDataSource___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "loadedAllDataSources");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "source");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "containsObject:", v6);

  objc_msgSend(*(id *)(a1 + 32), "loadedAuthorizationRecordsBySource");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "source");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "objectForKeyedSubscript:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v6) = objc_msgSend(v10, "requestedSharing");

  return v7 | v6;
}

void __73__WDDisplayTypeDataSourcesTableViewController__gatherDataFromDataSource___block_invoke_2(uint64_t a1, void *a2, void (**a3)(_QWORD, _QWORD, _QWORD))
{
  void (**v5)(_QWORD, _QWORD, _QWORD);
  id v6;
  id v7;

  v5 = a3;
  v6 = a2;
  objc_msgSend(v6, "source");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, id, id))a3)[2](v5, v7, v6);

}

uint64_t __73__WDDisplayTypeDataSourcesTableViewController__gatherDataFromDataSource___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "containsObject:", a2);
}

uint64_t __73__WDDisplayTypeDataSourcesTableViewController__gatherDataFromDataSource___block_invoke_4(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "containsObject:", a2);
}

- (void)_refreshUI
{
  void *v3;
  void *v4;
  _BOOL4 isLoaded;
  void *v6;
  void *v7;
  NSObject *v8;
  HKTitledIconHeaderView *headerView;
  void *v10;
  void *v11;
  void (**v12)(_QWORD, _QWORD);
  void (**v13)(_QWORD, _QWORD);
  NSArray *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _QWORD v27[5];
  uint8_t buf[8];
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  -[WDDisplayTypeDataSourcesTableViewController tableView](self, "tableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "window");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    isLoaded = self->_isLoaded;
    self->_isLoaded = 1;
    if (-[WDDisplayTypeDataSourcesTableViewController _canEditDataSources](self, "_canEditDataSources"))
    {
      -[WDDisplayTypeDataSourcesTableViewController editButtonItem](self, "editButtonItem");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[WDDisplayTypeDataSourcesTableViewController navigationItem](self, "navigationItem");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setRightBarButtonItem:", v6);

    }
    else
    {
      -[WDDisplayTypeDataSourcesTableViewController navigationItem](self, "navigationItem");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setRightBarButtonItem:", 0);
    }

    headerView = self->_headerView;
    -[HKDisplayType localization](self->_displayType, "localization");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "displayName");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKTitledIconHeaderView setTitle:](headerView, "setTitle:", v11);

    -[WDDisplayTypeDataSourcesTableViewController tableView](self, "tableView");
    v12 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (isLoaded)
    {
      objc_msgSend(v12, "reloadData");
    }
    else
    {
      objc_msgSend(v12, "beginUpdates");

      v27[0] = MEMORY[0x24BDAC760];
      v27[1] = 3221225472;
      v27[2] = __57__WDDisplayTypeDataSourcesTableViewController__refreshUI__block_invoke;
      v27[3] = &unk_24D38DAF0;
      v27[4] = self;
      v13 = (void (**)(_QWORD, _QWORD))MEMORY[0x2199E6E80](v27);
      v23 = 0u;
      v24 = 0u;
      v25 = 0u;
      v26 = 0u;
      v14 = self->_sectionIdentifiers;
      v15 = -[NSArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v23, v29, 16);
      if (v15)
      {
        v16 = v15;
        v17 = *(_QWORD *)v24;
        do
        {
          v18 = 0;
          do
          {
            if (*(_QWORD *)v24 != v17)
              objc_enumerationMutation(v14);
            v13[2](v13, (int)objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * v18++), "intValue", (_QWORD)v23));
          }
          while (v16 != v18);
          v16 = -[NSArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v23, v29, 16);
        }
        while (v16);
      }

      -[WDDisplayTypeDataSourcesTableViewController tableView](self, "tableView");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "endUpdates");

    }
    v20 = -[WDDisplayTypeDataSourcesTableViewController isEditing](self, "isEditing");
    -[WDDisplayTypeDataSourcesTableViewController tableView](self, "tableView");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setEditing:", 0);

    -[WDDisplayTypeDataSourcesTableViewController tableView](self, "tableView");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setEditing:", v20);

  }
  else
  {
    _HKInitializeLogging();
    v8 = *MEMORY[0x24BDD3070];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3070], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_215814000, v8, OS_LOG_TYPE_DEFAULT, "WDDisplayTypeDataSourcesTableViewController has been removed, not updating UI", buf, 2u);
    }
  }
}

void __57__WDDisplayTypeDataSourcesTableViewController__refreshUI__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x24BDAC8D0];
  v3 = objc_msgSend(*(id *)(a1 + 32), "sectionForSectionIdentifier:", a2);
  v4 = *(void **)(a1 + 32);
  objc_msgSend(v4, "tableView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "tableView:numberOfRowsInSection:", v5, v3);

  objc_msgSend(*(id *)(a1 + 32), "tableView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForRow:inSection:", 0, v3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v8;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v12, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "reloadRowsAtIndexPaths:withRowAnimation:", v9, 0);

  if (v6 >= 2)
  {
    objc_msgSend(*(id *)(a1 + 32), "tableView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "_createIndexPathsWithSection:startingRow:numIndices:", v3, 1, v6 - 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "insertRowsAtIndexPaths:withRowAnimation:", v11, 0);

  }
}

- (BOOL)_canEditDataSources
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  BOOL v7;

  -[WDProfile healthStore](self->_profile, "healthStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "profileIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "type");

  -[HKDisplayType behavior](self->_displayType, "behavior");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "allowsSourceReordering"))
    v7 = -[NSMutableArray count](self->_orderedDataSources, "count") != 0;
  else
    v7 = 0;

  return v5 == 1 && v7;
}

- (void)_loadDataSource
{
  void *v3;
  id v4;
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  id v9;
  NSObject *v10;
  void *v11;
  id v12;
  NSObject *v13;
  id v14;
  NSObject *v15;
  id v16;
  id v17;
  id v18;
  _QWORD v19[5];
  id v20;
  id v21;
  id v22;
  _QWORD v23[4];
  id v24;
  NSObject *v25;
  _QWORD v26[4];
  id v27;
  NSObject *v28;
  _QWORD v29[4];
  id v30;
  NSObject *v31;

  -[HKDisplayType sampleType](self->_displayType, "sampleType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v5 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
  v6 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v7 = dispatch_group_create();
  dispatch_group_enter(v7);
  v8 = MEMORY[0x24BDAC760];
  v29[0] = MEMORY[0x24BDAC760];
  v29[1] = 3221225472;
  v29[2] = __62__WDDisplayTypeDataSourcesTableViewController__loadDataSource__block_invoke;
  v29[3] = &unk_24D38DB18;
  v9 = v4;
  v30 = v9;
  v10 = v7;
  v31 = v10;
  -[WDDisplayTypeDataSourcesTableViewController _fetchOrderedSourcesForType:completion:](self, "_fetchOrderedSourcesForType:completion:", v3, v29);
  dispatch_group_enter(v10);
  -[HKDisplayType recordSampleType](self->_displayType, "recordSampleType");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = v8;
  v26[1] = 3221225472;
  v26[2] = __62__WDDisplayTypeDataSourcesTableViewController__loadDataSource__block_invoke_2;
  v26[3] = &unk_24D38DB40;
  v12 = v5;
  v27 = v12;
  v13 = v10;
  v28 = v13;
  -[WDDisplayTypeDataSourcesTableViewController _fetchDataSourcesForSampleType:completion:](self, "_fetchDataSourcesForSampleType:completion:", v11, v26);
  dispatch_group_enter(v13);
  v23[0] = v8;
  v23[1] = 3221225472;
  v23[2] = __62__WDDisplayTypeDataSourcesTableViewController__loadDataSource__block_invoke_3;
  v23[3] = &unk_24D38DB68;
  v14 = v6;
  v24 = v14;
  v25 = v13;
  v15 = v13;
  -[WDDisplayTypeDataSourcesTableViewController _fetchAuthorizationRecordsBySourceForType:completion:](self, "_fetchAuthorizationRecordsBySourceForType:completion:", v3, v23);
  v19[0] = v8;
  v19[1] = 3221225472;
  v19[2] = __62__WDDisplayTypeDataSourcesTableViewController__loadDataSource__block_invoke_4;
  v19[3] = &unk_24D38D410;
  v19[4] = self;
  v20 = v12;
  v21 = v9;
  v22 = v14;
  v16 = v14;
  v17 = v9;
  v18 = v12;
  dispatch_group_notify(v15, MEMORY[0x24BDAC9B8], v19);

}

void __62__WDDisplayTypeDataSourcesTableViewController__loadDataSource__block_invoke(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "addObjectsFromArray:", a2);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __62__WDDisplayTypeDataSourcesTableViewController__loadDataSource__block_invoke_2(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "unionSet:", a2);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __62__WDDisplayTypeDataSourcesTableViewController__loadDataSource__block_invoke_3(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "addEntriesFromDictionary:", a2);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __62__WDDisplayTypeDataSourcesTableViewController__loadDataSource__block_invoke_4(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  objc_msgSend(*(id *)(a1 + 32), "setLoadedAllDataSources:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "setLoadedOrderedDataSources:", *(_QWORD *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 32), "setLoadedAuthorizationRecordsBySource:", *(_QWORD *)(a1 + 56));
  v9 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
  objc_msgSend(*(id *)(a1 + 56), "allKeys");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addObjectsFromArray:", v2);

  objc_msgSend(*(id *)(a1 + 40), "allObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addObjectsFromArray:", v3);

  v4 = objc_alloc(MEMORY[0x24BE4A898]);
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1056);
  objc_msgSend(v9, "allObjects");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v4, "initWithHealthStore:sources:queue:", v5, v6, MEMORY[0x24BDAC9B8]);

  objc_msgSend(v7, "setShouldFetchAppIcons:", 1);
  objc_msgSend(*(id *)(a1 + 32), "setSourceListDataSource:", v7);
  objc_msgSend(*(id *)(a1 + 32), "sourceListDataSource");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "fetchSources");

}

- (void)_fetchOrderedSourcesForType:(id)a3 completion:(id)a4
{
  id v6;
  WDSourceOrderController *sourceOrderController;
  id v8;
  _QWORD v9[4];
  id v10;

  v6 = a4;
  sourceOrderController = self->_sourceOrderController;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __86__WDDisplayTypeDataSourcesTableViewController__fetchOrderedSourcesForType_completion___block_invoke;
  v9[3] = &unk_24D38DB90;
  v10 = v6;
  v8 = v6;
  -[WDSourceOrderController getOrderedSourcesForDataType:withCompletion:](sourceOrderController, "getOrderedSourcesForDataType:withCompletion:", a3, v9);

}

uint64_t __86__WDDisplayTypeDataSourcesTableViewController__fetchOrderedSourcesForType_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)_fetchDataSourcesForSampleType:(id)a3 completion:(id)a4
{
  id v6;
  objc_class *v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  _QWORD v12[4];
  id v13;

  v6 = a4;
  v7 = (objc_class *)MEMORY[0x24BDD3FC8];
  v8 = a3;
  v9 = [v7 alloc];
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __89__WDDisplayTypeDataSourcesTableViewController__fetchDataSourcesForSampleType_completion___block_invoke;
  v12[3] = &unk_24D38DBB8;
  v13 = v6;
  v10 = v6;
  v11 = (void *)objc_msgSend(v9, "initWithSampleType:samplePredicate:completionHandler:", v8, 0, v12);

  -[HKHealthStore executeQuery:](self->_healthStore, "executeQuery:", v11);
}

void __89__WDDisplayTypeDataSourcesTableViewController__fetchDataSourcesForSampleType_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (v9)
  {
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3070], OS_LOG_TYPE_ERROR))
      __89__WDDisplayTypeDataSourcesTableViewController__fetchDataSourcesForSampleType_completion___block_invoke_cold_1();
  }
  v10 = *(_QWORD *)(a1 + 32);
  if (v10)
    (*(void (**)(uint64_t, id))(v10 + 16))(v10, v8);

}

- (void)_fetchAuthorizationRecordsBySourceForType:(id)a3 completion:(id)a4
{
  id v5;
  HKAuthorizationStore *authorizationStore;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;

  v5 = a4;
  authorizationStore = self->_authorizationStore;
  -[HKDisplayType objectType](self->_displayType, "objectType");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __100__WDDisplayTypeDataSourcesTableViewController__fetchAuthorizationRecordsBySourceForType_completion___block_invoke;
  v9[3] = &unk_24D38DBE0;
  v10 = v5;
  v8 = v5;
  -[HKAuthorizationStore fetchAuthorizationRecordsForType:completion:](authorizationStore, "fetchAuthorizationRecordsForType:completion:", v7, v9);

}

void __100__WDDisplayTypeDataSourcesTableViewController__fetchAuthorizationRecordsBySourceForType_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  WDAuthorizationRecord *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v16 = a1;
  v23 = *MEMORY[0x24BDAC8D0];
  v4 = a2;
  v5 = a3;
  if (v5)
  {
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3070], OS_LOG_TYPE_ERROR))
      __100__WDDisplayTypeDataSourcesTableViewController__fetchAuthorizationRecordsBySourceForType_completion___block_invoke_cold_1();
  }
  v17 = v5;
  v6 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  objc_msgSend(v4, "allKeys");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v19 != v10)
          objc_enumerationMutation(v7);
        v12 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i);
        objc_msgSend(v4, "objectForKeyedSubscript:", v12, v16, v17);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = -[WDAuthorizationRecord initWithInternalAuthorizationRecord:]([WDAuthorizationRecord alloc], "initWithInternalAuthorizationRecord:", v13);
        objc_msgSend(v6, "setObject:forKeyedSubscript:", v14, v12);

      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v9);
  }

  v15 = *(_QWORD *)(v16 + 32);
  if (v15)
    (*(void (**)(uint64_t, id))(v15 + 16))(v15, v6);

}

- (id)_createIndexPathsWithSection:(int64_t)a3 startingRow:(int64_t)a4 numIndices:(int64_t)a5
{
  id v8;
  void *v9;

  v8 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  if (a5 >= 1)
  {
    do
    {
      objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForRow:inSection:", a4, a3);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addObject:", v9);

      ++a4;
      --a5;
    }
    while (a5);
  }
  return v8;
}

- (void)_sortDataSources
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  NSMutableSet *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t j;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t k;
  uint64_t v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  _BYTE v35[128];
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v3 = (void *)-[NSMutableArray copy](self->_orderedDataSources, "copy");
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v30, v36, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v31;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v31 != v6)
          objc_enumerationMutation(v3);
        v8 = *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * i);
        if ((-[NSMutableSet containsObject:](self->_dataSources, "containsObject:", v8) & 1) == 0)
          -[NSMutableArray removeObject:](self->_orderedDataSources, "removeObject:", v8);
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v30, v36, 16);
    }
    while (v5);
  }

  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v9 = self->_dataSources;
  v10 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v26, v35, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v27;
    do
    {
      for (j = 0; j != v11; ++j)
      {
        if (*(_QWORD *)v27 != v12)
          objc_enumerationMutation(v9);
        v14 = *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * j);
        if ((-[NSMutableArray containsObject:](self->_orderedDataSources, "containsObject:", v14) & 1) == 0)
          -[NSMutableArray addObject:](self->_orderedDataSources, "addObject:", v14);
      }
      v11 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v26, v35, 16);
    }
    while (v11);
  }

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v16 = (void *)-[NSMutableArray copy](self->_orderedDataSources, "copy", 0);
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v22, v34, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v23;
    do
    {
      for (k = 0; k != v18; ++k)
      {
        if (*(_QWORD *)v23 != v19)
          objc_enumerationMutation(v16);
        v21 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * k);
        if (!-[WDDisplayTypeDataSourcesTableViewController _sourceIsEnabled:](self, "_sourceIsEnabled:", v21))
        {
          objc_msgSend(v15, "addObject:", v21);
          -[NSMutableArray removeObject:](self->_orderedDataSources, "removeObject:", v21);
        }
      }
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v22, v34, 16);
    }
    while (v18);
  }

  -[NSMutableArray addObjectsFromArray:](self->_orderedDataSources, "addObjectsFromArray:", v15);
}

- (void)_updateOrderedSources
{
  WDSourceOrderController *sourceOrderController;
  void *v4;
  id v5;

  -[NSMutableArray hk_map:](self->_orderedDataSources, "hk_map:", &__block_literal_global_246);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  sourceOrderController = self->_sourceOrderController;
  -[HKDisplayType objectType](self->_displayType, "objectType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDSourceOrderController setOrderedSources:dataType:](sourceOrderController, "setOrderedSources:dataType:", v5, v4);

}

uint64_t __68__WDDisplayTypeDataSourcesTableViewController__updateOrderedSources__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "source");
}

- (void)_addDataSources:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  uint64_t v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v5 = (void *)-[NSMutableSet copy](self->_dataSources, "copy");
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v23 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * i);
        if ((objc_msgSend(v4, "containsObject:", v10) & 1) == 0)
        {
          -[NSMutableDictionary objectForKeyedSubscript:](self->_authorizationRecordsBySource, "objectForKeyedSubscript:", v10);
          v11 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v11)
            -[NSMutableSet removeObject:](self->_dataSources, "removeObject:", v10);
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    }
    while (v7);
  }

  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v12 = v4;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v19;
    do
    {
      for (j = 0; j != v14; ++j)
      {
        if (*(_QWORD *)v19 != v15)
          objc_enumerationMutation(v12);
        v17 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * j);
        if ((-[NSMutableSet containsObject:](self->_dataSources, "containsObject:", v17, (_QWORD)v18) & 1) == 0)
          -[NSMutableSet addObject:](self->_dataSources, "addObject:", v17);
      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
    }
    while (v14);
  }

}

- (BOOL)_sourceIsEnabled:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  int v7;
  void *v9;
  void *v10;

  v4 = a3;
  -[HKHealthStore profileIdentifier](self->_healthStore, "profileIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "type");

  if (v6 == 3 || (-[NSMutableSet containsObject:](self->_sourcesPendingToggleOn, "containsObject:", v4) & 1) != 0)
  {
    LOBYTE(v7) = 1;
  }
  else if ((-[NSMutableSet containsObject:](self->_sourcesPendingToggleOff, "containsObject:", v4) & 1) != 0)
  {
    LOBYTE(v7) = 0;
  }
  else
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_authorizationRecordsBySource, "objectForKeyedSubscript:", v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "status");
    if ((HKAuthorizationStatusAllowsSharing() & 1) != 0)
    {
      LOBYTE(v7) = 1;
    }
    else
    {
      objc_msgSend(v4, "source");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v10, "_requiresAuthorization") ^ 1;

    }
  }

  return v7;
}

- (void)_willDisableSource:(id)a3
{
  NSMutableSet *sourcesPendingToggleOn;
  id v5;

  sourcesPendingToggleOn = self->_sourcesPendingToggleOn;
  v5 = a3;
  -[NSMutableSet removeObject:](sourcesPendingToggleOn, "removeObject:", v5);
  -[NSMutableSet addObject:](self->_sourcesPendingToggleOff, "addObject:", v5);

}

- (void)_willEnableSource:(id)a3
{
  NSMutableSet *sourcesPendingToggleOff;
  id v5;

  sourcesPendingToggleOff = self->_sourcesPendingToggleOff;
  v5 = a3;
  -[NSMutableSet removeObject:](sourcesPendingToggleOff, "removeObject:", v5);
  -[NSMutableSet addObject:](self->_sourcesPendingToggleOn, "addObject:", v5);

}

- (void)_sourceIsEnabledDidChange:(id)a3
{
  NSMutableSet *sourcesPendingToggleOff;
  id v5;

  sourcesPendingToggleOff = self->_sourcesPendingToggleOff;
  v5 = a3;
  -[NSMutableSet removeObject:](sourcesPendingToggleOff, "removeObject:", v5);
  -[NSMutableSet removeObject:](self->_sourcesPendingToggleOn, "removeObject:", v5);

}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSArray *v12;
  NSArray *preEditSourcesOrdered;
  void *v14;
  void *v15;
  void *v16;
  NSArray *v17;
  void *v18;
  void *v19;
  id v20;
  _QWORD v21[5];
  id v22;
  BOOL v23;
  objc_super v24;

  v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)WDDisplayTypeDataSourcesTableViewController;
  -[WDDisplayTypeDataSourcesTableViewController setEditing:animated:](&v24, sel_setEditing_animated_, a3, a4);
  if (v4)
  {
    -[WDDisplayTypeDataSourcesTableViewController navigationItem](self, "navigationItem");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "leftBarButtonItem");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      -[WDDisplayTypeDataSourcesTableViewController navigationItem](self, "navigationItem");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "leftBarButtonItem");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[WDDisplayTypeDataSourcesTableViewController setLeftBarButtonItemReference:](self, "setLeftBarButtonItemReference:", v9);

      -[WDDisplayTypeDataSourcesTableViewController navigationItem](self, "navigationItem");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setLeftBarButtonItem:", 0);

    }
    -[WDDisplayTypeDataSourcesTableViewController navigationItem](self, "navigationItem");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setHidesBackButton:animated:", 1, 1);

    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:", self->_orderedDataSources);
    v12 = (NSArray *)objc_claimAutoreleasedReturnValue();
    preEditSourcesOrdered = self->_preEditSourcesOrdered;
    self->_preEditSourcesOrdered = v12;

    -[WDDisplayTypeDataSourcesTableViewController _sortDataSources](self, "_sortDataSources");
  }
  else
  {
    -[WDDisplayTypeDataSourcesTableViewController leftBarButtonItemReference](self, "leftBarButtonItemReference");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[WDDisplayTypeDataSourcesTableViewController navigationItem](self, "navigationItem");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setLeftBarButtonItem:", v14);

    -[WDDisplayTypeDataSourcesTableViewController navigationItem](self, "navigationItem");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setHidesBackButton:animated:", 0, 1);

    if (!-[NSArray isEqualToArray:](self->_preEditSourcesOrdered, "isEqualToArray:", self->_orderedDataSources))
      -[WDDisplayTypeDataSourcesTableViewController _updateOrderedSources](self, "_updateOrderedSources");
    v17 = self->_preEditSourcesOrdered;
    self->_preEditSourcesOrdered = 0;

  }
  -[WDDisplayTypeDataSourcesTableViewController tableView](self, "tableView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)MEMORY[0x24BDF6F90];
  v21[0] = MEMORY[0x24BDAC760];
  v21[1] = 3221225472;
  v21[2] = __67__WDDisplayTypeDataSourcesTableViewController_setEditing_animated___block_invoke;
  v21[3] = &unk_24D38CE00;
  v21[4] = self;
  v22 = v18;
  v23 = v4;
  v20 = v18;
  objc_msgSend(v19, "animateWithDuration:animations:", v21, 0.25);

}

void __67__WDDisplayTypeDataSourcesTableViewController_setEditing_animated___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  _QWORD v11[4];
  id v12;
  uint64_t v13;
  char v14;
  _QWORD v15[4];
  id v16;
  uint64_t v17;
  char v18;

  v2 = *(void **)(a1 + 40);
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 1104);
  v4 = MEMORY[0x24BDAC760];
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __67__WDDisplayTypeDataSourcesTableViewController_setEditing_animated___block_invoke_2;
  v15[3] = &unk_24D38DC48;
  v5 = v2;
  v6 = *(_QWORD *)(a1 + 32);
  v16 = v5;
  v17 = v6;
  v18 = *(_BYTE *)(a1 + 48);
  objc_msgSend(v3, "enumerateObjectsUsingBlock:", v15);
  v7 = *(void **)(a1 + 40);
  v8 = *(void **)(*(_QWORD *)(a1 + 32) + 1112);
  v11[0] = v4;
  v11[1] = 3221225472;
  v11[2] = __67__WDDisplayTypeDataSourcesTableViewController_setEditing_animated___block_invoke_3;
  v11[3] = &unk_24D38DC48;
  v9 = v7;
  v10 = *(_QWORD *)(a1 + 32);
  v12 = v9;
  v13 = v10;
  v14 = *(_BYTE *)(a1 + 48);
  objc_msgSend(v8, "enumerateObjectsUsingBlock:", v11);

}

void __67__WDDisplayTypeDataSourcesTableViewController_setEditing_animated___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v4;
  void *v5;
  double v6;
  void *v7;
  id v8;

  v4 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForRow:inSection:", a3, objc_msgSend(*(id *)(a1 + 40), "sectionForSectionIdentifier:", 0));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cellForRowAtIndexPath:", v5);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (*(_BYTE *)(a1 + 48))
    v6 = 0.600000024;
  else
    v6 = 1.0;
  objc_msgSend(v8, "contentView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAlpha:", v6);

  objc_msgSend(v8, "setUserInteractionEnabled:", *(_BYTE *)(a1 + 48) == 0);
}

void __67__WDDisplayTypeDataSourcesTableViewController_setEditing_animated___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v4;
  void *v5;
  double v6;
  void *v7;
  id v8;

  v4 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForRow:inSection:", a3, objc_msgSend(*(id *)(a1 + 40), "sectionForSectionIdentifier:", 1));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cellForRowAtIndexPath:", v5);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (*(_BYTE *)(a1 + 48))
    v6 = 0.600000024;
  else
    v6 = 1.0;
  objc_msgSend(v8, "contentView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAlpha:", v6);

  objc_msgSend(v8, "setUserInteractionEnabled:", *(_BYTE *)(a1 + 48) == 0);
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return -[NSArray count](self->_sectionIdentifiers, "count", a3);
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  unint64_t v5;
  int64_t result;

  if (!self->_isLoaded)
    return 1;
  v5 = -[WDDisplayTypeDataSourcesTableViewController sectionIdentifierForSection:](self, "sectionIdentifierForSection:", a4);
  if (v5 > 2)
    result = 0;
  else
    result = objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa + *off_24D38DCD8[v5]), "count");
  if (result <= 1)
    return 1;
  return result;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int64_t v9;
  NSArray *readerAppSources;
  uint64_t v11;
  WDDisplayTypeDataSourcesTableViewController *v12;
  id v13;
  NSArray *v14;
  uint64_t v15;
  WDSpinnerTableViewCell *v16;
  NSArray *readerResearchStudySources;
  WDSpinnerTableViewCell *v18;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (self->_isLoaded)
  {
    v9 = -[WDDisplayTypeDataSourcesTableViewController sectionIdentifierForSection:](self, "sectionIdentifierForSection:", objc_msgSend(v7, "section"));
    if (v9 == 2)
    {
      -[WDDisplayTypeDataSourcesTableViewController _dataSourceCellForTableView:row:](self, "_dataSourceCellForTableView:row:", v6, objc_msgSend(v8, "row"));
      v16 = (WDSpinnerTableViewCell *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (v9 == 1)
      {
        readerResearchStudySources = self->_readerResearchStudySources;
        v11 = objc_msgSend(v8, "row");
        v12 = self;
        v13 = v6;
        v14 = readerResearchStudySources;
        v15 = 1;
      }
      else
      {
        if (v9)
        {
          HKErrorTableViewCell();
          v16 = (WDSpinnerTableViewCell *)objc_claimAutoreleasedReturnValue();
          goto LABEL_11;
        }
        readerAppSources = self->_readerAppSources;
        v11 = objc_msgSend(v8, "row");
        v12 = self;
        v13 = v6;
        v14 = readerAppSources;
        v15 = 0;
      }
      -[WDDisplayTypeDataSourcesTableViewController _readerSourceCellForTableView:sourceArray:row:group:](v12, "_readerSourceCellForTableView:sourceArray:row:group:", v13, v14, v11, v15);
      v16 = (WDSpinnerTableViewCell *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v16 = objc_alloc_init(WDSpinnerTableViewCell);
  }
LABEL_11:
  v18 = v16;

  return v18;
}

- (id)_readerSourceCellForTableView:(id)a3 sourceArray:(id)a4 row:(unint64_t)a5 group:(int64_t)a6
{
  id v10;
  id v11;
  const __CFString *v12;
  __CFString *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  id v28;
  id v29;
  id v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  _QWORD v37[4];
  id v38;
  id v39;
  id v40;
  id v41;
  _QWORD v42[4];
  id v43;
  id location;

  v10 = a3;
  v11 = a4;
  if (!a6)
  {
    v12 = CFSTR(".ReaderApps");
    goto LABEL_5;
  }
  if (a6 == 1)
  {
    v12 = CFSTR(".ResearchStudies");
LABEL_5:
    objc_msgSend(CFSTR("Sources"), "stringByAppendingFormat:", v12);
    v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  v13 = CFSTR("Sources");
LABEL_7:
  if (objc_msgSend(v11, "count"))
  {
    objc_msgSend(v11, "objectAtIndexedSubscript:", a5);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKeyedSubscript:](self->_authorizationRecordsBySource, "objectForKeyedSubscript:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "dequeueReusableCellWithIdentifier:", CFSTR("sharing"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v16)
    {
      v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE4A8A8]), "initWithStyle:reuseIdentifier:", 0, CFSTR("sharing"));
      objc_msgSend(v16, "setDelegate:", self);
    }
    objc_msgSend(v16, "setSelectionStyle:", 0);
    objc_msgSend(v14, "source");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "name");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v16, "setDisplayText:", v18);
    if (-[WDDisplayTypeDataSourcesTableViewController isEditing](self, "isEditing"))
      v19 = 0.600000024;
    else
      v19 = 1.0;
    objc_msgSend(v16, "contentView");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setAlpha:", v19);

    objc_msgSend(v15, "status");
    objc_msgSend(v16, "setOn:", HKAuthorizationStatusAllowsReading());
    -[WDProfile healthStore](self->_profile, "healthStore");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "profileIdentifier");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setEnabled:", objc_msgSend(v22, "type") == 1);

    -[__CFString stringByAppendingFormat:](v13, "stringByAppendingFormat:", CFSTR(".%@"), v18);
    v23 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD17C8], "healthAccessibilityIdentifier:suffix:", 0, v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setAccessibilityIdentifier:", v24);

    objc_initWeak(&location, self);
    objc_msgSend(MEMORY[0x24BE4A2B0], "sharedImageManager");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "source");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = MEMORY[0x24BDAC760];
    v42[0] = MEMORY[0x24BDAC760];
    v42[1] = 3221225472;
    v42[2] = __99__WDDisplayTypeDataSourcesTableViewController__readerSourceCellForTableView_sourceArray_row_group___block_invoke;
    v42[3] = &unk_24D38CF38;
    v28 = v16;
    v43 = v28;
    v37[0] = v27;
    v37[1] = 3221225472;
    v37[2] = __99__WDDisplayTypeDataSourcesTableViewController__readerSourceCellForTableView_sourceArray_row_group___block_invoke_2;
    v37[3] = &unk_24D38CF88;
    objc_copyWeak(&v41, &location);
    v29 = v14;
    v38 = v29;
    v30 = v28;
    v39 = v30;
    v40 = v10;
    objc_msgSend(v25, "loadIconForSource:syncHandler:asyncHandler:", v26, v42, v37);

    v31 = v40;
    v32 = v30;

    objc_destroyWeak(&v41);
    objc_destroyWeak(&location);

    v13 = (__CFString *)v23;
  }
  else
  {
    -[WDDisplayTypeDataSourcesTableViewController _noneTableViewCell](self, "_noneTableViewCell");
    v32 = (id)objc_claimAutoreleasedReturnValue();
    v33 = (void *)MEMORY[0x24BDD17C8];
    -[__CFString stringByAppendingString:](v13, "stringByAppendingString:", CFSTR(".None"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "healthAccessibilityIdentifier:suffix:", 0, v34);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "setAccessibilityIdentifier:", v35);

  }
  return v32;
}

uint64_t __99__WDDisplayTypeDataSourcesTableViewController__readerSourceCellForTableView_sourceArray_row_group___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "setIconImage:", a2);
}

void __99__WDDisplayTypeDataSourcesTableViewController__readerSourceCellForTableView_sourceArray_row_group___block_invoke_2(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;

  v5 = a2;
  v6 = a3;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __99__WDDisplayTypeDataSourcesTableViewController__readerSourceCellForTableView_sourceArray_row_group___block_invoke_3;
  v9[3] = &unk_24D38CF60;
  objc_copyWeak(&v15, a1 + 7);
  v10 = v5;
  v11 = a1[4];
  v12 = a1[5];
  v13 = a1[6];
  v14 = v6;
  v7 = v6;
  v8 = v5;
  dispatch_async(MEMORY[0x24BDAC9B8], v9);

  objc_destroyWeak(&v15);
}

void __99__WDDisplayTypeDataSourcesTableViewController__readerSourceCellForTableView_sourceArray_row_group___block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  v2 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "source");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "_handleReturnedImage:forSource:cell:tableView:fetchError:", v2, v3, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));

}

- (id)_dataSourceCellForTableView:(id)a3 row:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  WDDataProviderTableViewCell *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  WDDataProviderTableViewCell *v17;
  id v18;
  WDDataProviderTableViewCell *v19;
  void *v20;
  WDDataProviderTableViewCell *v21;
  void *v22;
  _QWORD v24[4];
  id v25;
  WDDataProviderTableViewCell *v26;
  id v27;
  id v28;
  _QWORD v29[4];
  WDDataProviderTableViewCell *v30;
  id location;

  v6 = a3;
  objc_msgSend(CFSTR("Sources"), "stringByAppendingString:", CFSTR(".DataSources"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NSMutableArray count](self->_orderedDataSources, "count"))
  {
    -[NSMutableArray objectAtIndexedSubscript:](self->_orderedDataSources, "objectAtIndexedSubscript:", a4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "dequeueReusableCellWithIdentifier:", CFSTR("provider"));
    v9 = (WDDataProviderTableViewCell *)objc_claimAutoreleasedReturnValue();
    if (!v9)
    {
      v9 = -[WDDataProviderTableViewCell initWithStyle:reuseIdentifier:]([WDDataProviderTableViewCell alloc], "initWithStyle:reuseIdentifier:", 3, CFSTR("provider"));
      -[WDDataProviderTableViewCell setShowsReorderControl:](v9, "setShowsReorderControl:", 1);
      -[WDDataProviderTableViewCell setShouldIndentWhileEditing:](v9, "setShouldIndentWhileEditing:", 0);
      -[WDDataProviderTableViewCell setAccessoryType:](v9, "setAccessoryType:", -[HKDisplayType isActivitySummary](self->_displayType, "isActivitySummary") ^ 1);
    }
    objc_msgSend(v8, "source");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "name");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    -[WDDataProviderTableViewCell setDisplayName:](v9, "setDisplayName:", v11);
    -[WDDataProviderTableViewCell setActive:](v9, "setActive:", -[WDDisplayTypeDataSourcesTableViewController _sourceIsEnabled:](self, "_sourceIsEnabled:", v8));
    objc_msgSend(v7, "stringByAppendingFormat:", CFSTR(".%@"), v11);
    v12 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD17C8], "healthAccessibilityIdentifier:suffix:", 0, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[WDDataProviderTableViewCell setAccessibilityIdentifier:](v9, "setAccessibilityIdentifier:", v13);

    objc_initWeak(&location, self);
    objc_msgSend(MEMORY[0x24BE4A2B0], "sharedImageManager");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "source");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = MEMORY[0x24BDAC760];
    v29[0] = MEMORY[0x24BDAC760];
    v29[1] = 3221225472;
    v29[2] = __79__WDDisplayTypeDataSourcesTableViewController__dataSourceCellForTableView_row___block_invoke;
    v29[3] = &unk_24D38CF38;
    v17 = v9;
    v30 = v17;
    v24[0] = v16;
    v24[1] = 3221225472;
    v24[2] = __79__WDDisplayTypeDataSourcesTableViewController__dataSourceCellForTableView_row___block_invoke_2;
    v24[3] = &unk_24D38CF88;
    objc_copyWeak(&v28, &location);
    v18 = v8;
    v25 = v18;
    v19 = v17;
    v26 = v19;
    v27 = v6;
    objc_msgSend(v14, "loadIconForSource:syncHandler:asyncHandler:", v15, v29, v24);

    v20 = v27;
    v21 = v19;

    objc_destroyWeak(&v28);
    objc_destroyWeak(&location);

    v7 = (void *)v12;
  }
  else
  {
    -[WDDisplayTypeDataSourcesTableViewController _noneTableViewCell](self, "_noneTableViewCell");
    v21 = (WDDataProviderTableViewCell *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringByAppendingString:", CFSTR(".None"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[WDDataProviderTableViewCell setAccessibilityIdentifier:](v21, "setAccessibilityIdentifier:", v22);

  }
  return v21;
}

uint64_t __79__WDDisplayTypeDataSourcesTableViewController__dataSourceCellForTableView_row___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "setIconImage:", a2);
}

void __79__WDDisplayTypeDataSourcesTableViewController__dataSourceCellForTableView_row___block_invoke_2(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;

  v5 = a2;
  v6 = a3;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __79__WDDisplayTypeDataSourcesTableViewController__dataSourceCellForTableView_row___block_invoke_3;
  v9[3] = &unk_24D38CF60;
  objc_copyWeak(&v15, a1 + 7);
  v10 = v5;
  v11 = a1[4];
  v12 = a1[5];
  v13 = a1[6];
  v14 = v6;
  v7 = v6;
  v8 = v5;
  dispatch_async(MEMORY[0x24BDAC9B8], v9);

  objc_destroyWeak(&v15);
}

void __79__WDDisplayTypeDataSourcesTableViewController__dataSourceCellForTableView_row___block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  v2 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "source");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "_handleReturnedImage:forSource:cell:tableView:fetchError:", v2, v3, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));

}

- (id)_noneTableViewCell
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6E60]), "initWithStyle:reuseIdentifier:", 0, 0);
  WDBundle();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("NONE"), &stru_24D38E7C8, CFSTR("WellnessDashboard-Localizable"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "textLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setText:", v4);

  objc_msgSend(MEMORY[0x24BDF6A70], "hk_preferredFontForTextStyle:", *MEMORY[0x24BDF77B0]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "textLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setFont:", v6);

  objc_msgSend(MEMORY[0x24BDF6950], "secondaryLabelColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "textLabel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setTextColor:", v8);

  objc_msgSend(v2, "setSelectionStyle:", 0);
  return v2;
}

- (void)_handleReturnedImage:(id)a3 forSource:(id)a4 cell:(id)a5 tableView:(id)a6 fetchError:(id)a7
{
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  unint64_t v17;
  void *v18;
  unint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  void *v25;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  if (v12 && !a7)
  {
    objc_msgSend(a6, "indexPathForCell:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    if (v15)
    {
      v17 = objc_msgSend(v15, "row");
      -[WDDisplayTypeDataSourcesTableViewController orderedDataSources](self, "orderedDataSources");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "count");

      if (v17 >= v19)
      {
        _HKInitializeLogging();
        v24 = (void *)*MEMORY[0x24BDD3070];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3070], OS_LOG_TYPE_ERROR))
          -[WDDisplayTypeDataSourcesTableViewController _handleReturnedImage:forSource:cell:tableView:fetchError:].cold.2(v24, v16, self);
      }
      else
      {
        -[WDDisplayTypeDataSourcesTableViewController orderedDataSources](self, "orderedDataSources");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "objectAtIndex:", objc_msgSend(v16, "row"));
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "source");
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v22, "isEqual:", v13))
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
          {
            objc_msgSend(v14, "setIconImage:", v12);
          }
          else
          {
            objc_msgSend(v14, "imageView");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "setImage:", v12);

          }
        }

      }
    }
    else
    {
      _HKInitializeLogging();
      v23 = *MEMORY[0x24BDD3070];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3070], OS_LOG_TYPE_ERROR))
        -[WDDisplayTypeDataSourcesTableViewController _handleReturnedImage:forSource:cell:tableView:fetchError:].cold.1(v23);
    }

  }
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  int64_t v5;
  int v6;
  __CFString *v7;
  __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v5 = -[WDDisplayTypeDataSourcesTableViewController sectionIdentifierForSection:](self, "sectionIdentifierForSection:", a4);
  if (v5 == 2)
  {
    WDBundle();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("DATA_SOURCES_HEADER"), &stru_24D38E7C8, CFSTR("WellnessDashboard-Localizable"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (v5 == 1)
    {
      WDBundle();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("RESEARCH_STUDIES_READ_ACCESS_HEADER"), &stru_24D38E7C8, CFSTR("WellnessDashboard-Localizable"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    }
    if (v5)
    {
      v12 = 0;
      return v12;
    }
    v6 = -[HKDisplayType isDocument](self->_displayType, "isDocument");
    v7 = CFSTR("APPS_READ_ACCESS_HEADER");
    if (v6)
      v7 = CFSTR("SHARE_DATA_HEADER_CCD");
    v8 = v7;
    WDBundle();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "localizedStringForKey:value:table:", v8, &stru_24D38E7C8, CFSTR("WellnessDashboard-Localizable"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "uppercaseStringWithLocale:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_10:
  return v12;
}

- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4
{
  int64_t v5;
  void *v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  HKDisplayType *displayType;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v22;

  v5 = -[WDDisplayTypeDataSourcesTableViewController sectionIdentifierForSection:](self, "sectionIdentifierForSection:", a4);
  switch(v5)
  {
    case 2:
      -[HKHealthStore profileIdentifier](self->_healthStore, "profileIdentifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v10, "type") == 3)
      {
        v11 = -[HKDisplayType displayTypeIdentifier](self->_displayType, "displayTypeIdentifier");

        if (v11 == 257)
        {
          v12 = (void *)MEMORY[0x24BDD17C8];
          WDBundle();
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("%1$@_DATA_TYPE_PROVIDERS_VISION_EXPLANATION_%2$@"), &stru_24D38E7C8, CFSTR("WellnessDashboard-Localizable-Tinker"));
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          -[HKProfileStore synchronouslyFetchFirstName](self->_profileStore, "synchronouslyFetchFirstName");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          displayType = self->_displayType;
          goto LABEL_14;
        }
      }
      else
      {

      }
      -[HKHealthStore profileIdentifier](self->_healthStore, "profileIdentifier");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "type");

      if (v19 != 3)
      {
        v22 = -[HKDisplayType displayTypeIdentifier](self->_displayType, "displayTypeIdentifier");
        v6 = (void *)MEMORY[0x24BDD17C8];
        WDBundle();
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = v7;
        if (v22 == 257)
          v9 = CFSTR("DATA_TYPE_PROVIDERS_VISION_EXPLANATION");
        else
          v9 = CFSTR("DATA_TYPE_PROVIDERS_EXPLANATION");
        goto LABEL_9;
      }
      v12 = (void *)MEMORY[0x24BDD17C8];
      WDBundle();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("%1$@_DATA_TYPE_PROVIDERS_EXPLANATION_%2$@"), &stru_24D38E7C8, CFSTR("WellnessDashboard-Localizable-Tinker"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[HKProfileStore synchronouslyFetchFirstName](self->_profileStore, "synchronouslyFetchFirstName");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      displayType = self->_displayType;
LABEL_14:
      -[HKDisplayType localization](displayType, "localization");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "embeddedDisplayName");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "stringWithFormat:", v13, v14, v20);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_15;
    case 1:
      v6 = (void *)MEMORY[0x24BDD17C8];
      WDBundle();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v7;
      v9 = CFSTR("DATA_TYPE_SHARING_RESEARCH_STUDIES_EXPLANATION");
      goto LABEL_9;
    case 0:
      v6 = (void *)MEMORY[0x24BDD17C8];
      WDBundle();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v7;
      v9 = CFSTR("DATA_TYPE_SHARING_APPS_EXPLANATION");
LABEL_9:
      objc_msgSend(v7, "localizedStringForKey:value:table:", v9, &stru_24D38E7C8, CFSTR("WellnessDashboard-Localizable"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[HKDisplayType localization](self->_displayType, "localization");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "embeddedDisplayName");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "stringWithFormat:", v13, v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_15:

      return v17;
  }
  v17 = 0;
  return v17;
}

- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  int v7;
  BOOL v8;

  v5 = a4;
  -[HKDisplayType behavior](self->_displayType, "behavior");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "allowsSourceReordering");

  v8 = v7
    && -[WDDisplayTypeDataSourcesTableViewController sectionIdentifierForSection:](self, "sectionIdentifierForSection:", objc_msgSend(v5, "section")) == 2&& -[NSMutableArray count](self->_orderedDataSources, "count") != 0;

  return v8;
}

- (BOOL)tableView:(id)a3 canMoveRowAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  BOOL v7;

  v5 = a4;
  if (-[WDDisplayTypeDataSourcesTableViewController sectionIdentifierForSection:](self, "sectionIdentifierForSection:", objc_msgSend(v5, "section")) == 2)
  {
    -[NSMutableArray objectAtIndexedSubscript:](self->_orderedDataSources, "objectAtIndexedSubscript:", objc_msgSend(v5, "row"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[WDDisplayTypeDataSourcesTableViewController _sourceIsEnabled:](self, "_sourceIsEnabled:", v6);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4
{
  return 0;
}

- (void)tableView:(id)a3 moveRowAtIndexPath:(id)a4 toIndexPath:(id)a5
{
  NSMutableArray *orderedDataSources;
  id v8;
  NSMutableArray *v9;
  uint64_t v10;
  id v11;

  orderedDataSources = self->_orderedDataSources;
  v8 = a5;
  -[NSMutableArray objectAtIndexedSubscript:](orderedDataSources, "objectAtIndexedSubscript:", objc_msgSend(a4, "row"));
  v11 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray removeObject:](self->_orderedDataSources, "removeObject:", v11);
  v9 = self->_orderedDataSources;
  v10 = objc_msgSend(v8, "row");

  -[NSMutableArray insertObject:atIndex:](v9, "insertObject:atIndex:", v11, v10);
}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  return -[HKDisplayType isActivitySummary](self->_displayType, "isActivitySummary", a3, a4) ^ 1;
}

- (id)tableView:(id)a3 willSelectRowAtIndexPath:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  if (-[WDDisplayTypeDataSourcesTableViewController sectionIdentifierForSection:](self, "sectionIdentifierForSection:", objc_msgSend(v5, "section")) == 2&& -[NSMutableArray count](self->_orderedDataSources, "count"))
  {
    v6 = v5;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  int v12;
  char v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  HKAuthorizationStore *authorizationStore;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  _QWORD v28[4];
  id v29;
  id v30;
  id v31;
  id v32;
  id location;
  void *v34;
  void *v35;
  _QWORD v36[2];

  v36[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (-[WDDisplayTypeDataSourcesTableViewController sectionIdentifierForSection:](self, "sectionIdentifierForSection:", objc_msgSend(v7, "section")) == 2&& -[NSMutableArray count](self->_orderedDataSources, "count"))
  {
    objc_msgSend(v6, "deselectRowAtIndexPath:animated:", v7, 1);
    -[NSMutableArray objectAtIndexedSubscript:](self->_orderedDataSources, "objectAtIndexedSubscript:", objc_msgSend(v7, "row"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[WDDisplayTypeDataSourcesTableViewController isEditing](self, "isEditing");
    objc_msgSend(v8, "source");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v9)
    {
      v12 = objc_msgSend(v10, "_requiresAuthorization");

      if (v12)
      {
        objc_msgSend(v6, "cellForRowAtIndexPath:", v7);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v26, "isActive");
        -[NSMutableDictionary objectForKeyedSubscript:](self->_authorizationRecordsBySource, "objectForKeyedSubscript:", v8);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        if ((v13 & 1) != 0)
        {
          -[WDDisplayTypeDataSourcesTableViewController _willDisableSource:](self, "_willDisableSource:", v8);
          if (objc_msgSend(v27, "requestedReading")
            && (objc_msgSend(v27, "status"), (HKAuthorizationStatusAllowsReading() & 1) != 0))
          {
            v14 = 103;
          }
          else
          {
            v14 = 104;
          }
        }
        else
        {
          -[WDDisplayTypeDataSourcesTableViewController _willEnableSource:](self, "_willEnableSource:", v8);
          if (objc_msgSend(v27, "requestedReading")
            && (objc_msgSend(v27, "status"), (HKAuthorizationStatusAllowsReading() & 1) != 0))
          {
            v14 = 101;
          }
          else
          {
            v14 = 102;
          }
        }
        v36[0] = v7;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v36, 1);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "reloadRowsAtIndexPaths:withRowAnimation:", v19, 0);

        objc_msgSend(v27, "setStatus:", v14);
        objc_initWeak(&location, self);
        authorizationStore = self->_authorizationStore;
        -[HKDisplayType objectType](self->_displayType, "objectType");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = v21;
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v14);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = v22;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v35, &v34, 1);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "source");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "bundleIdentifier");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v28[0] = MEMORY[0x24BDAC760];
        v28[1] = 3221225472;
        v28[2] = __81__WDDisplayTypeDataSourcesTableViewController_tableView_didSelectRowAtIndexPath___block_invoke;
        v28[3] = &unk_24D38DC98;
        objc_copyWeak(&v32, &location);
        v29 = v8;
        v30 = v6;
        v31 = v7;
        -[HKAuthorizationStore setAuthorizationStatuses:authorizationModes:forBundleIdentifier:options:completion:](authorizationStore, "setAuthorizationStatuses:authorizationModes:forBundleIdentifier:options:completion:", v23, MEMORY[0x24BDBD1B8], v25, 0, v28);

        objc_destroyWeak(&v32);
        objc_destroyWeak(&location);

      }
    }
    else
    {
      -[WDDisplayTypeDataSourcesTableViewController _makeDataListViewControllerForSource:](self, "_makeDataListViewControllerForSource:", v10);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v8, "source");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "name");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setTitle:", v17);

      -[WDDisplayTypeDataSourcesTableViewController navigationController](self, "navigationController");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "pushViewController:animated:", v15, 1);

    }
  }

}

void __81__WDDisplayTypeDataSourcesTableViewController_tableView_didSelectRowAtIndexPath___block_invoke(id *a1, char a2, void *a3)
{
  id v5;
  void *v6;
  _QWORD v7[4];
  id v8;
  id v9;
  id v10;
  id v11;
  char v12;

  v5 = a3;
  if ((a2 & 1) == 0)
  {
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3070], OS_LOG_TYPE_ERROR))
      __81__WDDisplayTypeDataSourcesTableViewController_tableView_didSelectRowAtIndexPath___block_invoke_cold_1();
  }
  objc_msgSend(MEMORY[0x24BDBCF18], "mainRunLoop");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __81__WDDisplayTypeDataSourcesTableViewController_tableView_didSelectRowAtIndexPath___block_invoke_305;
  v7[3] = &unk_24D38DC70;
  objc_copyWeak(&v11, a1 + 7);
  v8 = a1[4];
  v12 = a2;
  v9 = a1[5];
  v10 = a1[6];
  objc_msgSend(v6, "performBlock:", v7);

  objc_destroyWeak(&v11);
}

void __81__WDDisplayTypeDataSourcesTableViewController_tableView_didSelectRowAtIndexPath___block_invoke_305(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(WeakRetained, "_sourceIsEnabledDidChange:", *(_QWORD *)(a1 + 32));
  if (WeakRetained && !*(_BYTE *)(a1 + 64))
  {
    v3 = *(void **)(a1 + 40);
    v5[0] = *(_QWORD *)(a1 + 48);
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v5, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "reloadRowsAtIndexPaths:withRowAnimation:", v4, 0);

  }
}

- (id)_makeDataListViewControllerForSource:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  WDDataListViewController *v7;
  HKDisplayType *displayType;
  WDProfile *profile;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  void *v14;

  objc_msgSend(MEMORY[0x24BDD3E88], "predicateForObjectsFromSource:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDProfile healthStore](self->_profile, "healthStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[HBXHealthAppPluginFactory makeDataListViewControllerForHealthStore:displayType:predicate:](HBXHealthAppPluginFactory, "makeDataListViewControllerForHealthStore:displayType:predicate:", v5, self->_displayType, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = v6;
  }
  else
  {
    displayType = self->_displayType;
    profile = self->_profile;
    -[WDProfile unitController](profile, "unitController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKDisplayType wd_listViewControllerDataProviderWithProfile:unitController:](displayType, "wd_listViewControllerDataProviderWithProfile:unitController:", profile, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "setDefaultQueryPredicate:", v4);
    v7 = -[WDDataListViewController initWithDisplayType:profile:dataProvider:usingInsetStyling:]([WDDataListViewController alloc], "initWithDisplayType:profile:dataProvider:usingInsetStyling:", self->_displayType, self->_profile, v11, 1);
    if (-[WDDisplayTypeDataSourcesTableViewController shouldInsetSectionContentForDataSourceDataList](self, "shouldInsetSectionContentForDataSourceDataList"))
    {
      -[WDDataListViewController tableView](v7, "tableView");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "_setSectionContentInsetFollowsLayoutMargins:", 1);

      v13 = *MEMORY[0x24BE4A250];
      -[WDDataListViewController tableView](v7, "tableView");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "_setSectionCornerRadius:", v13);

    }
  }

  return v7;
}

- (BOOL)tableView:(id)a3 shouldIndentWhileEditingRowAtIndexPath:(id)a4
{
  return 0;
}

- (id)tableView:(id)a3 targetIndexPathForMoveFromRowAtIndexPath:(id)a4 toProposedIndexPath:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;

  v7 = a4;
  v8 = a5;
  if (-[WDDisplayTypeDataSourcesTableViewController sectionIdentifierForSection:](self, "sectionIdentifierForSection:", objc_msgSend(v8, "section")) == 2)
  {
    -[NSMutableArray objectAtIndexedSubscript:](self->_orderedDataSources, "objectAtIndexedSubscript:", objc_msgSend(v8, "row"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[WDDisplayTypeDataSourcesTableViewController _sourceIsEnabled:](self, "_sourceIsEnabled:", v9))
      v10 = v8;
    else
      v10 = v7;
    v11 = v10;

  }
  else
  {
    v11 = v7;
  }

  return v11;
}

- (void)switchCellValueChanged:(id)a3 value:(BOOL)a4
{
  id v5;
  void *v6;
  void *v7;
  int64_t v8;
  int *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  HKAuthorizationStore *authorizationStore;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  -[WDDisplayTypeDataSourcesTableViewController tableView](self, "tableView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "indexPathForCell:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[WDDisplayTypeDataSourcesTableViewController sectionIdentifierForSection:](self, "sectionIdentifierForSection:", objc_msgSend(v7, "section"));
  if (v8)
  {
    if (v8 != 1)
    {
      v10 = 0;
      goto LABEL_7;
    }
    v9 = &OBJC_IVAR___WDDisplayTypeDataSourcesTableViewController__readerResearchStudySources;
  }
  else
  {
    v9 = &OBJC_IVAR___WDDisplayTypeDataSourcesTableViewController__readerAppSources;
  }
  objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa + *v9), "objectAtIndexedSubscript:", objc_msgSend(v7, "row"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_7:
  -[NSMutableDictionary objectForKeyedSubscript:](self->_authorizationRecordsBySource, "objectForKeyedSubscript:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "status");
  HKAuthorizationStatusAllowsSharing();
  v12 = HKInternalAuthorizationStatusMake();
  objc_msgSend(v11, "setStatus:", v12);
  authorizationStore = self->_authorizationStore;
  -[HKDisplayType objectType](self->_displayType, "objectType");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v14;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v12);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v15;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v20, &v19, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "source");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "bundleIdentifier");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKAuthorizationStore setAuthorizationStatuses:authorizationModes:forBundleIdentifier:options:completion:](authorizationStore, "setAuthorizationStatuses:authorizationModes:forBundleIdentifier:options:completion:", v16, MEMORY[0x24BDBD1B8], v18, 0, &__block_literal_global_310);

}

void __76__WDDisplayTypeDataSourcesTableViewController_switchCellValueChanged_value___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v4;

  v4 = a3;
  if ((a2 & 1) == 0)
  {
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3070], OS_LOG_TYPE_ERROR))
      __81__WDDisplayTypeDataSourcesTableViewController_tableView_didSelectRowAtIndexPath___block_invoke_cold_1();
  }

}

- (void)sourceListDataSourceDidUpdate:(id)a3
{
  -[WDDisplayTypeDataSourcesTableViewController _gatherDataFromDataSource:](self, "_gatherDataFromDataSource:", a3);
  -[WDDisplayTypeDataSourcesTableViewController _refreshUI](self, "_refreshUI");
}

- (void)viewControllerWillEnterAdaptiveModal
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t);
  void *v11;
  id v12;
  id location;

  objc_initWeak(&location, self);
  v3 = objc_alloc(MEMORY[0x24BDF6860]);
  v4 = (void *)MEMORY[0x24BDF67B8];
  v8 = MEMORY[0x24BDAC760];
  v9 = 3221225472;
  v10 = __83__WDDisplayTypeDataSourcesTableViewController_viewControllerWillEnterAdaptiveModal__block_invoke;
  v11 = &unk_24D38D0A0;
  objc_copyWeak(&v12, &location);
  objc_msgSend(v4, "actionWithHandler:", &v8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithBarButtonSystemItem:primaryAction:", 0, v5, v8, v9, v10, v11);

  if (-[WDDisplayTypeDataSourcesTableViewController isEditing](self, "isEditing"))
  {
    -[WDDisplayTypeDataSourcesTableViewController setLeftBarButtonItemReference:](self, "setLeftBarButtonItemReference:", v6);
  }
  else
  {
    -[WDDisplayTypeDataSourcesTableViewController navigationItem](self, "navigationItem");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setLeftBarButtonItem:", v6);

  }
  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

void __83__WDDisplayTypeDataSourcesTableViewController_viewControllerWillEnterAdaptiveModal__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "dismissViewControllerAnimated:completion:", 1, 0);

}

- (void)viewControllerDidLeaveAdaptiveModal
{
  id v3;

  if (-[WDDisplayTypeDataSourcesTableViewController isEditing](self, "isEditing"))
  {
    -[WDDisplayTypeDataSourcesTableViewController setLeftBarButtonItemReference:](self, "setLeftBarButtonItemReference:", 0);
  }
  else
  {
    -[WDDisplayTypeDataSourcesTableViewController navigationItem](self, "navigationItem");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setLeftBarButtonItem:", 0);

  }
}

- (BOOL)shouldInsetSectionContentForDataSourceDataList
{
  return self->_shouldInsetSectionContentForDataSourceDataList;
}

- (void)setShouldInsetSectionContentForDataSourceDataList:(BOOL)a3
{
  self->_shouldInsetSectionContentForDataSourceDataList = a3;
}

- (HKSourceListDataSource)sourceListDataSource
{
  return self->_sourceListDataSource;
}

- (NSArray)loadedOrderedDataSources
{
  return self->_loadedOrderedDataSources;
}

- (void)setLoadedOrderedDataSources:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1176);
}

- (NSMutableArray)orderedDataSources
{
  return self->_orderedDataSources;
}

- (void)setOrderedDataSources:(id)a3
{
  objc_storeStrong((id *)&self->_orderedDataSources, a3);
}

- (NSSet)loadedAllDataSources
{
  return self->_loadedAllDataSources;
}

- (void)setLoadedAllDataSources:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1192);
}

- (NSDictionary)loadedAuthorizationRecordsBySource
{
  return self->_loadedAuthorizationRecordsBySource;
}

- (void)setLoadedAuthorizationRecordsBySource:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1200);
}

- (UIBarButtonItem)leftBarButtonItemReference
{
  return self->_leftBarButtonItemReference;
}

- (void)setLeftBarButtonItemReference:(id)a3
{
  objc_storeStrong((id *)&self->_leftBarButtonItemReference, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_leftBarButtonItemReference, 0);
  objc_storeStrong((id *)&self->_loadedAuthorizationRecordsBySource, 0);
  objc_storeStrong((id *)&self->_loadedAllDataSources, 0);
  objc_storeStrong((id *)&self->_orderedDataSources, 0);
  objc_storeStrong((id *)&self->_loadedOrderedDataSources, 0);
  objc_storeStrong((id *)&self->_sourceListDataSource, 0);
  objc_storeStrong((id *)&self->_sectionIdentifiers, 0);
  objc_storeStrong((id *)&self->_sourcesPendingToggleOn, 0);
  objc_storeStrong((id *)&self->_sourcesPendingToggleOff, 0);
  objc_storeStrong((id *)&self->_headerView, 0);
  objc_storeStrong((id *)&self->_authorizationRecordsBySource, 0);
  objc_storeStrong((id *)&self->_readerResearchStudySources, 0);
  objc_storeStrong((id *)&self->_readerAppSources, 0);
  objc_storeStrong((id *)&self->_preEditSourcesOrdered, 0);
  objc_storeStrong((id *)&self->_dataSources, 0);
  objc_storeStrong((id *)&self->_sourceOrderController, 0);
  objc_storeStrong((id *)&self->_authorizationStore, 0);
  objc_storeStrong((id *)&self->_profileStore, 0);
  objc_storeStrong((id *)&self->_healthStore, 0);
  objc_storeStrong((id *)&self->_profile, 0);
  objc_storeStrong((id *)&self->_displayType, 0);
  objc_storeStrong((id *)&self->_displayCategory, 0);
}

void __89__WDDisplayTypeDataSourcesTableViewController__fetchDataSourcesForSampleType_completion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_1(&dword_215814000, v0, v1, "Error fetching source query: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __100__WDDisplayTypeDataSourcesTableViewController__fetchAuthorizationRecordsBySourceForType_completion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_1(&dword_215814000, v0, v1, "Error fetching authorization records: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)_handleReturnedImage:(os_log_t)log forSource:cell:tableView:fetchError:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_215814000, log, OS_LOG_TYPE_ERROR, "_handleReturnedImage could not find index path for cell", v1, 2u);
}

- (void)_handleReturnedImage:(void *)a3 forSource:cell:tableView:fetchError:.cold.2(void *a1, void *a2, void *a3)
{
  NSObject *v5;
  void *v6;
  _DWORD v7[2];
  __int16 v8;
  int v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v5 = a1;
  LODWORD(a2) = objc_msgSend(a2, "row");
  objc_msgSend(a3, "orderedDataSources");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = 67109376;
  v7[1] = (_DWORD)a2;
  v8 = 1024;
  v9 = objc_msgSend(v6, "count");
  _os_log_error_impl(&dword_215814000, v5, OS_LOG_TYPE_ERROR, "_handleReturnedImage called for row (%d) beyond valid range (< %d)", (uint8_t *)v7, 0xEu);

}

void __81__WDDisplayTypeDataSourcesTableViewController_tableView_didSelectRowAtIndexPath___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_1(&dword_215814000, v0, v1, "Error saving sharing state: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

@end
