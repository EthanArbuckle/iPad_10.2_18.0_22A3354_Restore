@implementation WDClinicalSettingsViewAnalyticsDataViewController

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)WDClinicalSettingsViewAnalyticsDataViewController;
  -[WDClinicalSettingsViewAnalyticsDataViewController viewDidLoad](&v13, sel_viewDidLoad);
  HRLocalizedString(CFSTR("CLINICAL_ACCOUNTS_SETTINGS_VIEW_ANALYTICS_DATA_TITLE"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDClinicalSettingsViewAnalyticsDataViewController setTitle:](self, "setTitle:", v3);

  -[WDClinicalSettingsViewAnalyticsDataViewController tableView](self, "tableView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_class();
  +[WDClinicalSettingsViewAnalyticsDataViewControllerFileCell defaultReuseIdentifier](WDClinicalSettingsViewAnalyticsDataViewControllerFileCell, "defaultReuseIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "registerClass:forCellReuseIdentifier:", v5, v6);

  v7 = objc_alloc(MEMORY[0x1E0DC40B8]);
  HRLocalizedString(CFSTR("CLINICAL_ACCOUNTS_SETTINGS_VIEW_ANALYTICS_DATA_NO_DATA"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v7, "initWithFrame:title:style:", v8, 0, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  -[WDClinicalSettingsViewAnalyticsDataViewController setNoDataView:](self, "setNoDataView:", v9);

  -[WDClinicalSettingsViewAnalyticsDataViewController noDataView](self, "noDataView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setHidden:", 1);

  -[WDClinicalSettingsViewAnalyticsDataViewController noDataView](self, "noDataView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDClinicalSettingsViewAnalyticsDataViewController tableView](self, "tableView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setBackgroundView:", v11);

  -[WDClinicalSettingsViewAnalyticsDataViewController fetchClinicalOptInDataCollectionFilePaths](self, "fetchClinicalOptInDataCollectionFilePaths");
}

- (unint64_t)supportedInterfaceOrientations
{
  return 2;
}

- (void)fetchClinicalOptInDataCollectionFilePaths
{
  void *v3;
  _QWORD v4[5];
  id v5;
  id location;

  objc_initWeak(&location, self);
  -[WDClinicalSettingsViewAnalyticsDataViewController healthRecordsStore](self, "healthRecordsStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __94__WDClinicalSettingsViewAnalyticsDataViewController_fetchClinicalOptInDataCollectionFilePaths__block_invoke;
  v4[3] = &unk_1E74D1830;
  objc_copyWeak(&v5, &location);
  v4[4] = self;
  objc_msgSend(v3, "fetchClinicalOptInDataCollectionFilePathsWithCompletion:", v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __94__WDClinicalSettingsViewAnalyticsDataViewController_fetchClinicalOptInDataCollectionFilePaths__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  _QWORD v10[4];
  id v11;
  uint64_t v12;
  id v13;

  v5 = a2;
  v6 = a3;
  objc_msgSend(MEMORY[0x1E0CB3828], "mainQueue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __94__WDClinicalSettingsViewAnalyticsDataViewController_fetchClinicalOptInDataCollectionFilePaths__block_invoke_2;
  v10[3] = &unk_1E74D1440;
  objc_copyWeak(&v13, (id *)(a1 + 40));
  v8 = v5;
  v9 = *(_QWORD *)(a1 + 32);
  v11 = v8;
  v12 = v9;
  objc_msgSend(v7, "addOperationWithBlock:", v10);

  objc_destroyWeak(&v13);
}

void __94__WDClinicalSettingsViewAnalyticsDataViewController_fetchClinicalOptInDataCollectionFilePaths__block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  id WeakRetained;
  id v4;

  v2 = *(_QWORD *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "setFilePaths:", v2);

  objc_msgSend(*(id *)(a1 + 40), "tableView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "reloadData");

}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  void *v5;
  int64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;

  -[WDClinicalSettingsViewAnalyticsDataViewController filePaths](self, "filePaths", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  -[WDClinicalSettingsViewAnalyticsDataViewController tableView](self, "tableView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6)
  {
    objc_msgSend(v7, "setSeparatorStyle:", 1);

    -[WDClinicalSettingsViewAnalyticsDataViewController noDataView](self, "noDataView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    v11 = 1;
  }
  else
  {
    objc_msgSend(v7, "setSeparatorStyle:", 0);

    -[WDClinicalSettingsViewAnalyticsDataViewController noDataView](self, "noDataView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    v11 = 0;
  }
  objc_msgSend(v9, "setHidden:", v11);

  return v6;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;

  v6 = a4;
  v7 = a3;
  +[WDClinicalSettingsViewAnalyticsDataViewControllerFileCell defaultReuseIdentifier](WDClinicalSettingsViewAnalyticsDataViewControllerFileCell, "defaultReuseIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dequeueReusableCellWithIdentifier:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)MEMORY[0x1E0C99E98];
  -[WDClinicalSettingsViewAnalyticsDataViewController filePaths](self, "filePaths");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v6, "row");

  objc_msgSend(v11, "objectAtIndexedSubscript:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "fileURLWithPath:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setFileURL:", v14);

  return v9;
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
  id v12;

  objc_msgSend(a3, "cellForRowAtIndexPath:", a4);
  v12 = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_alloc_init(MEMORY[0x1E0D2F718]);
  objc_msgSend(v12, "fileURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "lastPathComponent");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTitle:", v7);

  v8 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v12, "fileURL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringWithContentsOfURL:encoding:error:", v9, 4, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDetailText:", v10);

  -[WDClinicalSettingsViewAnalyticsDataViewController navigationController](self, "navigationController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "pushViewController:animated:", v5, 1);

}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDClinicalSettingsViewAnalyticsDataViewController filePaths](self, "filePaths");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p %@>"), v5, self, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (HKHealthRecordsStore)healthRecordsStore
{
  return self->_healthRecordsStore;
}

- (void)setHealthRecordsStore:(id)a3
{
  objc_storeStrong((id *)&self->_healthRecordsStore, a3);
}

- (NSArray)filePaths
{
  return (NSArray *)objc_getProperty(self, a2, 1024, 1);
}

- (void)setFilePaths:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1024);
}

- (_UIContentUnavailableView)noDataView
{
  return (_UIContentUnavailableView *)objc_getProperty(self, a2, 1032, 1);
}

- (void)setNoDataView:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1032);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_noDataView, 0);
  objc_storeStrong((id *)&self->_filePaths, 0);
  objc_storeStrong((id *)&self->_healthRecordsStore, 0);
}

@end
