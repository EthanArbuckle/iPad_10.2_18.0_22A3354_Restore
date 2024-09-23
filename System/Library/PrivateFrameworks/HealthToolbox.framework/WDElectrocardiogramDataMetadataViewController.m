@implementation WDElectrocardiogramDataMetadataViewController

- (WDElectrocardiogramDataMetadataViewController)initWithSample:(id)a3 delegate:(id)a4 mode:(int64_t)a5 activeAlgorithmVersion:(id)a6
{
  id v11;
  id v12;
  id v13;
  WDElectrocardiogramDataMetadataViewController *v14;
  WDElectrocardiogramDataMetadataViewController *v15;
  NSMutableArray *v16;
  NSMutableArray *sections;
  void *v18;
  void *v19;
  WDElectrocardiogramReportDataSource *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  WDElectrocardiogramReportDataSource *reportDataSource;
  uint64_t v25;
  HRElectrocardiogramReportGenerator *reportGenerator;
  void *v27;
  void *v28;
  objc_super v30;

  v11 = a3;
  v12 = a4;
  v13 = a6;
  v30.receiver = self;
  v30.super_class = (Class)WDElectrocardiogramDataMetadataViewController;
  v14 = -[HKTableViewController initWithUsingInsetStyling:](&v30, sel_initWithUsingInsetStyling_, 1);
  v15 = v14;
  if (v14)
  {
    v14->_firstViewDidLayoutSubviews = 1;
    objc_storeStrong((id *)&v14->_sample, a3);
    objc_storeWeak((id *)&v15->_delegate, v12);
    v16 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    sections = v15->_sections;
    v15->_sections = v16;

    v15->_actionsEnabled = 1;
    v15->_mode = a5;
    if (v13)
    {
      v15->_activeAlgorithmVersion = objc_msgSend(v13, "integerValue");
    }
    else
    {
      -[WDElectrocardiogramDataMetadataViewController delegate](v15, "delegate");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "healthStore");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v15->_activeAlgorithmVersion = -[WDElectrocardiogramDataMetadataViewController _fetchActiveAlgorithmVersionWithHealthStore:](v15, "_fetchActiveAlgorithmVersionWithHealthStore:", v19);

    }
    v20 = [WDElectrocardiogramReportDataSource alloc];
    -[WDElectrocardiogramDataMetadataViewController delegate](v15, "delegate");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "healthStore");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = -[WDElectrocardiogramReportDataSource initWithSample:healthStore:activeAlgorithmVersion:](v20, "initWithSample:healthStore:activeAlgorithmVersion:", v11, v22, v15->_activeAlgorithmVersion);
    reportDataSource = v15->_reportDataSource;
    v15->_reportDataSource = (WDElectrocardiogramReportDataSource *)v23;

    v25 = objc_msgSend(objc_alloc(MEMORY[0x24BE4C0A8]), "initWithDataSource:", v15->_reportDataSource);
    reportGenerator = v15->_reportGenerator;
    v15->_reportGenerator = (HRElectrocardiogramReportGenerator *)v25;

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "addObserver:selector:name:object:", v15, sel__localeOrDisplayTypeChange_, *MEMORY[0x24BDBCA70], 0);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "addObserver:selector:name:object:", v15, sel__localeOrDisplayTypeChange_, *MEMORY[0x24BE4A020], 0);

  }
  return v15;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)WDElectrocardiogramDataMetadataViewController;
  -[WDElectrocardiogramDataMetadataViewController dealloc](&v4, sel_dealloc);
}

- (int64_t)_fetchActiveAlgorithmVersionWithHealthStore:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  BOOL v6;
  NSObject *v7;
  int64_t v8;
  id v10;

  v10 = 0;
  objc_msgSend(MEMORY[0x24BDD3B70], "versionWithHealthStore:error:", a3, &v10);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v10;
  v5 = v4;
  if (v3)
    v6 = v4 == 0;
  else
    v6 = 0;
  if (v6)
  {
    v8 = objc_msgSend(v3, "integerValue");
  }
  else
  {
    if (v4)
    {
      _HKInitializeLogging();
      v7 = *MEMORY[0x24BDD3010];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3010], OS_LOG_TYPE_ERROR))
        -[WDElectrocardiogramDataMetadataViewController _fetchActiveAlgorithmVersionWithHealthStore:].cold.1(v7);
    }
    v8 = *MEMORY[0x24BDD4290];
  }

  return v8;
}

- (void)_localeOrDisplayTypeChange:(id)a3
{
  id v4;

  -[WDElectrocardiogramDataMetadataViewController _loadSections](self, "_loadSections", a3);
  -[WDElectrocardiogramDataMetadataViewController tableView](self, "tableView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "reloadData");

}

- (id)identifierBundle
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "healthAccessibilityIdentifier:suffix:", 1, CFSTR("SessionDetails"));
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
  double v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  void *v15;
  void *v16;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)WDElectrocardiogramDataMetadataViewController;
  -[HKTableViewController viewDidLoad](&v17, sel_viewDidLoad);
  WDBundle();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("ECG_DETAIL"), &stru_24D38E7C8, CFSTR("WellnessDashboard-Localizable-Cinnamon"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  HKConditionallyRedactedHeartRhythmString();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDElectrocardiogramDataMetadataViewController setTitle:](self, "setTitle:", v5);

  if (-[WDElectrocardiogramDataMetadataViewController mode](self, "mode") != 2)
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6860]), "initWithBarButtonSystemItem:target:action:", 9, self, sel_shareButtonTapped_);
    -[WDElectrocardiogramDataMetadataViewController identifierBundle](self, "identifierBundle");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringByAppendingString:", CFSTR(".shareButton"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setAccessibilityIdentifier:", v8);

    -[WDElectrocardiogramDataMetadataViewController navigationItem](self, "navigationItem");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setRightBarButtonItem:", v6);

  }
  v10 = *MEMORY[0x24BDF7DE0];
  -[WDElectrocardiogramDataMetadataViewController tableView](self, "tableView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setRowHeight:", v10);

  -[WDElectrocardiogramDataMetadataViewController tableView](self, "tableView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setEstimatedRowHeight:", 64.0);

  -[WDElectrocardiogramDataMetadataViewController tableView](self, "tableView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "_setSectionContentInsetFollowsLayoutMargins:", 1);

  v14 = *MEMORY[0x24BE4A250];
  -[WDElectrocardiogramDataMetadataViewController tableView](self, "tableView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "_setSectionCornerRadius:", v14);

  -[WDElectrocardiogramDataMetadataViewController _loadSections](self, "_loadSections");
  -[WDElectrocardiogramDataMetadataViewController tableView](self, "tableView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "reloadData");

  -[WDElectrocardiogramDataMetadataViewController _reloadElectrocardiogramMetadataTableHeaderView](self, "_reloadElectrocardiogramMetadataTableHeaderView");
}

- (void)viewDidLayoutSubviews
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)WDElectrocardiogramDataMetadataViewController;
  -[WDElectrocardiogramDataMetadataViewController viewDidLayoutSubviews](&v6, sel_viewDidLayoutSubviews);
  if (-[WDElectrocardiogramDataMetadataViewController firstViewDidLayoutSubviews](self, "firstViewDidLayoutSubviews"))
  {
    -[WDElectrocardiogramDataMetadataViewController setFirstViewDidLayoutSubviews:](self, "setFirstViewDidLayoutSubviews:", 0);
    -[WDElectrocardiogramDataMetadataViewController tableView](self, "tableView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "tableHeaderView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[WDElectrocardiogramDataMetadataViewController tableView](self, "tableView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setTableHeaderView:", v4);

  }
}

- (unint64_t)supportedInterfaceOrientations
{
  return 2;
}

- (BOOL)_addSectionIfNonNull:(id)a3
{
  id v5;
  void *v6;

  if (a3)
  {
    v5 = a3;
    -[WDElectrocardiogramDataMetadataViewController sections](self, "sections");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v5);

  }
  return a3 != 0;
}

- (void)_loadSections
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  _BOOL4 v15;
  int64_t v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  int64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  int64_t v46;
  void *v47;
  id v48;
  void *v49;
  void *v50;
  void *v51;
  _QWORD v52[2];
  _QWORD v53[3];

  v53[2] = *MEMORY[0x24BDAC8D0];
  -[WDElectrocardiogramDataMetadataViewController sections](self, "sections");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeAllObjects");

  -[WDElectrocardiogramDataMetadataViewController delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[WDElectrocardiogramDataMetadataViewController delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "displayTypeController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  -[WDElectrocardiogramDataMetadataViewController delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[WDElectrocardiogramDataMetadataViewController delegate](self, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "unitController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }

  -[WDElectrocardiogramDataMetadataViewController sections](self, "sections");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_alloc(MEMORY[0x24BE4A588]);
  -[WDElectrocardiogramDataMetadataViewController sample](self, "sample");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v11, "initWithSample:displayTypeController:unitController:", v12, v6, v9);
  objc_msgSend(v10, "addObject:", v13);

  objc_msgSend(MEMORY[0x24BDBCF50], "hk_heartRhythmDefaults");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (objc_msgSend(v14, "hk_hfeModeEnabled") & 1) == 0
     && -[WDElectrocardiogramDataMetadataViewController mode](self, "mode") != 2;

  v16 = -[WDElectrocardiogramDataMetadataViewController mode](self, "mode");
  if (v15)
  {
    v17 = objc_alloc(MEMORY[0x24BE4A590]);
    -[WDElectrocardiogramDataMetadataViewController sample](self, "sample");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (void *)objc_msgSend(v17, "initWithSample:", v18);

    -[WDElectrocardiogramDataMetadataViewController sample](self, "sample");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "sourceRevision");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "version");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    v23 = -[WDElectrocardiogramDataMetadataViewController sampleAlgorithmVersion](self, "sampleAlgorithmVersion");
    v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE4A618]), "initWithSourceVersion:algorithmVersion:", v22, v23);
    if (v24)
    {
      v46 = v16;
      v51 = v6;
      -[WDElectrocardiogramDataMetadataViewController sample](self, "sample");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "metadata");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "objectForKey:", *MEMORY[0x24BDD43F8]);
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      v49 = v22;
      v50 = v9;
      v47 = v27;
      if (v27)
      {
        v48 = v27;
        -[WDElectrocardiogramDataMetadataViewController featureVersionFromUpdateVersion:](self, "featureVersionFromUpdateVersion:");
      }
      else
      {
        objc_msgSend(v24, "updateVersion");
        v48 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "featureVersion");
      }
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      HKHealthKitFrameworkBundle();
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "localizedStringForKey:value:table:", CFSTR("SOURCE_FEATURE_VERSION_TITLE"), &stru_24D38E7C8, CFSTR("Localizable-Cinnamon"));
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      HKConditionallyRedactedHeartRhythmString();
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v53[0] = *MEMORY[0x24BDD42F8];
      v32 = v53[0];
      v53[1] = CFSTR("FeatureVersion");
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v53, 2);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      HKUIJoinStringsForAutomationIdentifier();
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "addText:detail:baseIdentifier:", v28, v31, v34);

      HKHealthKitFrameworkBundle();
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "localizedStringForKey:value:table:", CFSTR("SOURCE_UPDATE_VERSION_TITLE"), &stru_24D38E7C8, CFSTR("Localizable-Cinnamon"));
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      HKConditionallyRedactedHeartRhythmString();
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v52[0] = v32;
      v52[1] = CFSTR("UpdateVersion");
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v52, 2);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      HKUIJoinStringsForAutomationIdentifier();
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "addText:detail:baseIdentifier:", v48, v37, v39);

      v9 = v50;
      v6 = v51;
      v22 = v49;
      v16 = v46;
    }
    -[WDElectrocardiogramDataMetadataViewController _addSectionIfNonNull:](self, "_addSectionIfNonNull:", v19);

  }
  if (!v16)
  {
    v40 = objc_alloc(MEMORY[0x24BE4A580]);
    WDBundle();
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "localizedStringForKey:value:table:", CFSTR("DELETE_ECG_SAMPLE_CELL_TITLE"), &stru_24D38E7C8, CFSTR("WellnessDashboard-Localizable-Cinnamon"));
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    HKConditionallyRedactedHeartRhythmString();
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = (void *)objc_msgSend(v40, "initWithTitle:", v43);

    objc_msgSend(v44, "setDelegate:", self);
    -[WDElectrocardiogramDataMetadataViewController sections](self, "sections");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "addObject:", v44);

  }
}

- (void)_reloadElectrocardiogramMetadataTableHeaderView
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

  -[WDElectrocardiogramDataMetadataViewController _electrocardiogramMetadataContainerView](self, "_electrocardiogramMetadataContainerView");
  v18 = (id)objc_claimAutoreleasedReturnValue();
  -[WDElectrocardiogramDataMetadataViewController tableView](self, "tableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTableHeaderView:", v18);

  objc_msgSend(v18, "widthAnchor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDElectrocardiogramDataMetadataViewController tableView](self, "tableView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "widthAnchor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "constraintEqualToAnchor:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setActive:", 1);

  objc_msgSend(v18, "centerXAnchor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDElectrocardiogramDataMetadataViewController tableView](self, "tableView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "centerXAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "constraintEqualToAnchor:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setActive:", 1);

  objc_msgSend(v18, "topAnchor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDElectrocardiogramDataMetadataViewController tableView](self, "tableView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "topAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "constraintEqualToAnchor:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setActive:", 1);

  -[WDElectrocardiogramDataMetadataViewController tableView](self, "tableView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "tableHeaderView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "layoutIfNeeded");

}

- (id)_electrocardiogramMetadataContainerView
{
  id v3;
  void *v4;
  int64_t v5;
  int64_t v6;
  void *v7;
  _BOOL8 v8;
  _BOOL8 v9;
  _BOOL8 v10;
  id v11;
  void *v12;

  v3 = objc_alloc(MEMORY[0x24BDF6F90]);
  v4 = (void *)objc_msgSend(v3, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  objc_msgSend(v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v5 = -[WDElectrocardiogramDataMetadataViewController activeAlgorithmVersion](self, "activeAlgorithmVersion");
  if (v5 == *MEMORY[0x24BDD4290]
    || (v6 = -[WDElectrocardiogramDataMetadataViewController activeAlgorithmVersion](self, "activeAlgorithmVersion"),
        v6 == *MEMORY[0x24BDD4288]))
  {
    v7 = 0;
  }
  else
  {
    v8 = -[WDElectrocardiogramDataMetadataViewController mode](self, "mode") != 2;
    v9 = -[WDElectrocardiogramDataMetadataViewController mode](self, "mode") != 2;
    v10 = -[WDElectrocardiogramDataMetadataViewController mode](self, "mode") != 0;
    v11 = objc_alloc(MEMORY[0x24BE4A600]);
    -[WDElectrocardiogramDataMetadataViewController sample](self, "sample");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v11, "initWithSample:activeAlgorithmVersion:displayGraph:allowExportToPDF:isSharedData:delegate:", v12, -[WDElectrocardiogramDataMetadataViewController activeAlgorithmVersion](self, "activeAlgorithmVersion"), v8, v9, v10, self);

  }
  objc_msgSend(v4, "addSubview:", v7);
  objc_msgSend(v7, "hk_alignConstraintsWithView:", v4);

  return v4;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  void *v3;
  int64_t v4;

  -[WDElectrocardiogramDataMetadataViewController sections](self, "sections", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  return v4;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  void *v5;
  void *v6;
  void *v7;

  -[WDElectrocardiogramDataMetadataViewController sections](self, "sections", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndexedSubscript:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "sectionTitle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4
{
  void *v5;
  void *v6;
  void *v7;

  -[WDElectrocardiogramDataMetadataViewController sections](self, "sections", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndexedSubscript:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "sectionFooter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  void *v5;
  void *v6;
  int64_t v7;

  -[WDElectrocardiogramDataMetadataViewController sections](self, "sections", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndexedSubscript:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "numberOfRowsInSection");
  return v7;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;

  v6 = a4;
  v7 = a3;
  -[WDElectrocardiogramDataMetadataViewController sections](self, "sections");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectAtIndexedSubscript:", objc_msgSend(v6, "section"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_msgSend(v6, "row");
  objc_msgSend(v9, "cellForIndex:tableView:", v10, v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;

  v6 = a4;
  objc_msgSend(a3, "deselectRowAtIndexPath:animated:", v6, 1);
  -[WDElectrocardiogramDataMetadataViewController sections](self, "sections");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectAtIndexedSubscript:", objc_msgSend(v6, "section"));
  v10 = (id)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v6, "row");
  -[WDElectrocardiogramDataMetadataViewController navigationController](self, "navigationController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "selectCellForIndex:navigationController:animated:", v8, v9, 1);

}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  id v13;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[WDElectrocardiogramDataMetadataViewController sections](self, "sections");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectAtIndexedSubscript:", objc_msgSend(v8, "section"));
  v13 = (id)objc_claimAutoreleasedReturnValue();

  v12 = objc_msgSend(v8, "row");
  objc_msgSend(v13, "willDisplayCell:forIndex:tableView:", v9, v12, v10);

}

- (void)deletionSectionDidSelectRow:(id)a3
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
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t);
  void *v22;
  WDElectrocardiogramDataMetadataViewController *v23;
  id v24;

  v4 = a3;
  if (-[WDElectrocardiogramDataMetadataViewController actionsEnabled](self, "actionsEnabled"))
  {
    v5 = (void *)MEMORY[0x24BDF67F0];
    WDBundle();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("DELETE_ECG_SAMPLE_ACTION_SHEET_TITLE"), &stru_24D38E7C8, CFSTR("WellnessDashboard-Localizable-Cinnamon"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    HKConditionallyRedactedHeartRhythmString();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "alertControllerWithTitle:message:preferredStyle:", v8, 0, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = (void *)MEMORY[0x24BDF67E8];
    WDBundle();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("CANCEL"), &stru_24D38E7C8, CFSTR("WellnessDashboard-Localizable"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "actionWithTitle:style:handler:", v12, 1, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addAction:", v13);

    v14 = (void *)MEMORY[0x24BDF67E8];
    WDBundle();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("DELETE_ECG_SAMPLE_BUTTON_TITLE"), &stru_24D38E7C8, CFSTR("WellnessDashboard-Localizable-Cinnamon"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    HKConditionallyRedactedHeartRhythmString();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = MEMORY[0x24BDAC760];
    v20 = 3221225472;
    v21 = __77__WDElectrocardiogramDataMetadataViewController_deletionSectionDidSelectRow___block_invoke;
    v22 = &unk_24D38D220;
    v23 = self;
    v24 = v4;
    objc_msgSend(v14, "actionWithTitle:style:handler:", v17, 2, &v19);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addAction:", v18, v19, v20, v21, v22, v23);

    -[WDElectrocardiogramDataMetadataViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v9, 1, 0);
  }

}

uint64_t __77__WDElectrocardiogramDataMetadataViewController_deletionSectionDidSelectRow___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "deleteSampleTriggeredBySection:", *(_QWORD *)(a1 + 40));
}

- (id)accessibilityIdentifier
{
  void *v2;
  void *v3;

  -[WDElectrocardiogramDataMetadataViewController identifierBundle](self, "identifierBundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAppendingString:", CFSTR(".DeleteRecordingButton"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)electrocardiogramMetadataViewDidTapDetailButton:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = (void *)MEMORY[0x24BE4C0A0];
  -[WDElectrocardiogramDataMetadataViewController sample](self, "sample", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDElectrocardiogramDataMetadataViewController reportDataSource](self, "reportDataSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "electrocardiogramPossibleResultsViewControllerForSample:forAlgorithmVersion:", v5, objc_msgSend(v6, "activeAlgorithmVersion"));
  v9 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "setLeftButtonType:", 3);
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE4A728]), "initWithRootViewController:", v9);
  -[WDElectrocardiogramDataMetadataViewController navigationController](self, "navigationController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "presentViewController:animated:completion:", v7, 1, 0);

}

- (id)electrocardiogramMetadataView:(id)a3 regulatedBodyTextForSample:(id)a4
{
  id v5;
  _BOOL8 v6;
  void *v7;
  void *v8;

  v5 = a4;
  v6 = -[WDElectrocardiogramDataMetadataViewController mode](self, "mode") != 0;
  -[WDElectrocardiogramDataMetadataViewController reportDataSource](self, "reportDataSource");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "hrui_classificationShortBodyTextWithActiveAlgorithmVersion:isSharedData:", objc_msgSend(v7, "activeAlgorithmVersion"), v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (BOOL)electrocardiogramMetadataViewShouldShowShareRow:(id)a3
{
  return 1;
}

- (void)setActionsEnabled:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  id v5;

  v3 = a3;
  self->_actionsEnabled = a3;
  -[WDElectrocardiogramDataMetadataViewController navigationItem](self, "navigationItem");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "rightBarButtonItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setEnabled:", v3);

}

- (void)shareButtonTapped:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  WDElectrocardiogramActivityItemSource *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  WDElectrocardiogramActivityItemSource *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[WDElectrocardiogramDataMetadataViewController reportGenerator](self, "reportGenerator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "generatePDF");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = [WDElectrocardiogramActivityItemSource alloc];
  -[WDElectrocardiogramDataMetadataViewController sample](self, "sample");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "startDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDElectrocardiogramDataMetadataViewController reportDataSource](self, "reportDataSource");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "firstName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDElectrocardiogramDataMetadataViewController reportDataSource](self, "reportDataSource");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "lastName");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[WDElectrocardiogramActivityItemSource initWithPDFData:sampleDate:firstName:lastName:provenance:](v7, "initWithPDFData:sampleDate:firstName:lastName:provenance:", v6, v9, v11, v13, 0);

  if (v14)
  {
    v15 = objc_alloc(MEMORY[0x24BDF67E0]);
    v21[0] = v14;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v21, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)objc_msgSend(v15, "initWithActivityItems:applicationActivities:", v16, 0);

    objc_msgSend(v17, "popoverPresentationController");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setSourceItem:", v4);

    v20 = *MEMORY[0x24BDF7490];
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v20, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setExcludedActivityTypes:", v19);

    -[WDElectrocardiogramDataMetadataViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v17, 1, 0);
  }

}

- (void)presentPDFViewController
{
  void *v3;
  WDElectrocardiogramPDFViewController *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  WDElectrocardiogramPDFViewController *v11;
  void *v12;
  void *v13;
  id v14;

  if (-[WDElectrocardiogramDataMetadataViewController actionsEnabled](self, "actionsEnabled"))
  {
    -[WDElectrocardiogramDataMetadataViewController reportGenerator](self, "reportGenerator");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "generatePDF");
    v14 = (id)objc_claimAutoreleasedReturnValue();

    v4 = [WDElectrocardiogramPDFViewController alloc];
    -[WDElectrocardiogramDataMetadataViewController sample](self, "sample");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "startDate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[WDElectrocardiogramDataMetadataViewController reportDataSource](self, "reportDataSource");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "firstName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[WDElectrocardiogramDataMetadataViewController reportDataSource](self, "reportDataSource");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "lastName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[WDElectrocardiogramPDFViewController initWithPDFData:sampleDate:firstName:lastName:](v4, "initWithPDFData:sampleDate:firstName:lastName:", v14, v6, v8, v10);

    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6BF8]), "initWithRootViewController:", v11);
    -[WDElectrocardiogramDataMetadataViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v12, 1, 0);
    objc_msgSend(MEMORY[0x24BE4C0C8], "sharedManager");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "trackElectrocardiogramPDFViewed");

  }
}

- (void)deleteSampleTriggeredBySection:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[5];

  objc_msgSend(a3, "setEnabled:", 0);
  -[WDElectrocardiogramDataMetadataViewController setActionsEnabled:](self, "setActionsEnabled:", 0);
  -[WDElectrocardiogramDataMetadataViewController delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "healthStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDElectrocardiogramDataMetadataViewController sample](self, "sample");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __80__WDElectrocardiogramDataMetadataViewController_deleteSampleTriggeredBySection___block_invoke;
  v7[3] = &unk_24D38CFB0;
  v7[4] = self;
  objc_msgSend(v5, "deleteObject:options:withCompletion:", v6, 3, v7);

}

void __80__WDElectrocardiogramDataMetadataViewController_deleteSampleTriggeredBySection___block_invoke(uint64_t a1)
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __80__WDElectrocardiogramDataMetadataViewController_deleteSampleTriggeredBySection___block_invoke_2;
  block[3] = &unk_24D38D000;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

void __80__WDElectrocardiogramDataMetadataViewController_deleteSampleTriggeredBySection___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "navigationController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "presentingViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = *(void **)(a1 + 32);
  if (v3)
  {
    objc_msgSend(v4, "dismissViewControllerAnimated:completion:", 1, 0);
  }
  else
  {
    objc_msgSend(v4, "navigationController");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    v5 = (id)objc_msgSend(v6, "popViewControllerAnimated:", 1);

  }
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
  -[WDElectrocardiogramDataMetadataViewController traitCollection](self, "traitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "preferredContentSizeCategory");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "preferredContentSizeCategory");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isEqualToString:", v6);

  if ((v7 & 1) == 0)
LABEL_3:
    -[WDElectrocardiogramDataMetadataViewController _reloadElectrocardiogramMetadataTableHeaderView](self, "_reloadElectrocardiogramMetadataTableHeaderView");

}

- (int64_t)sampleAlgorithmVersion
{
  void *v2;
  void *v3;
  int64_t v4;

  -[WDElectrocardiogramDataMetadataViewController sample](self, "sample");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_algorithmVersion");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    v4 = objc_msgSend(v3, "integerValue");
  else
    v4 = 1;

  return v4;
}

- (id)featureVersionFromUpdateVersion:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a3, "componentsSeparatedByString:", CFSTR("."));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  if ((unint64_t)objc_msgSend(v4, "count") >= 2)
    objc_msgSend(v4, "removeLastObject");
  objc_msgSend(v4, "componentsJoinedByString:", CFSTR("."));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)viewControllerWillEnterAdaptiveModal
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t);
  void *v13;
  id v14;
  id location;

  objc_initWeak(&location, self);
  v3 = objc_alloc(MEMORY[0x24BDF6860]);
  v4 = (void *)MEMORY[0x24BDF67B8];
  v10 = MEMORY[0x24BDAC760];
  v11 = 3221225472;
  v12 = __85__WDElectrocardiogramDataMetadataViewController_viewControllerWillEnterAdaptiveModal__block_invoke;
  v13 = &unk_24D38D0A0;
  objc_copyWeak(&v14, &location);
  objc_msgSend(v4, "actionWithHandler:", &v10);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithBarButtonSystemItem:primaryAction:", 0, v5, v10, v11, v12, v13);

  -[WDElectrocardiogramDataMetadataViewController identifierBundle](self, "identifierBundle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringByAppendingString:", CFSTR(".doneButton"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAccessibilityIdentifier:", v8);

  -[WDElectrocardiogramDataMetadataViewController navigationItem](self, "navigationItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setLeftBarButtonItem:", v6);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

void __85__WDElectrocardiogramDataMetadataViewController_viewControllerWillEnterAdaptiveModal__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "dismissViewControllerAnimated:completion:", 1, 0);

}

- (void)viewControllerDidLeaveAdaptiveModal
{
  id v2;

  -[WDElectrocardiogramDataMetadataViewController navigationItem](self, "navigationItem");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setLeftBarButtonItem:", 0);

}

- (HKElectrocardiogram)sample
{
  return self->_sample;
}

- (void)setSample:(id)a3
{
  objc_storeStrong((id *)&self->_sample, a3);
}

- (BOOL)firstViewDidLayoutSubviews
{
  return self->_firstViewDidLayoutSubviews;
}

- (void)setFirstViewDidLayoutSubviews:(BOOL)a3
{
  self->_firstViewDidLayoutSubviews = a3;
}

- (int64_t)activeAlgorithmVersion
{
  return self->_activeAlgorithmVersion;
}

- (HKDataMetadataViewControllerDelegate)delegate
{
  return (HKDataMetadataViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSMutableArray)sections
{
  return self->_sections;
}

- (void)setSections:(id)a3
{
  objc_storeStrong((id *)&self->_sections, a3);
}

- (WDElectrocardiogramReportDataSource)reportDataSource
{
  return self->_reportDataSource;
}

- (void)setReportDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_reportDataSource, a3);
}

- (HRElectrocardiogramReportGenerator)reportGenerator
{
  return self->_reportGenerator;
}

- (void)setReportGenerator:(id)a3
{
  objc_storeStrong((id *)&self->_reportGenerator, a3);
}

- (int64_t)mode
{
  return self->_mode;
}

- (void)setMode:(int64_t)a3
{
  self->_mode = a3;
}

- (BOOL)actionsEnabled
{
  return self->_actionsEnabled;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reportGenerator, 0);
  objc_storeStrong((id *)&self->_reportDataSource, 0);
  objc_storeStrong((id *)&self->_sections, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_sample, 0);
}

- (void)_fetchActiveAlgorithmVersionWithHealthStore:(os_log_t)log .cold.1(os_log_t log)
{
  int v1;
  const char *v2;
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v1 = 136446210;
  v2 = "-[WDElectrocardiogramDataMetadataViewController _fetchActiveAlgorithmVersionWithHealthStore:]";
  _os_log_error_impl(&dword_215814000, log, OS_LOG_TYPE_ERROR, "%{public}s: Failed to fetch active algorithm version.", (uint8_t *)&v1, 0xCu);
}

@end
