@implementation WDDocumentOverviewViewController

- (WDDocumentOverviewViewController)initWithDisplayTypes:(id)a3 profile:(id)a4 title:(id)a5 category:(id)a6 sidebarIdentifier:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  WDDocumentOverviewViewController *v15;
  WDDocumentOverviewViewController *v16;
  uint64_t v17;
  HKDisplayType *displayType;
  WDDocumentListDataProvider *v19;
  WDDocumentListDataProvider *dataProvider;
  objc_super v22;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a7;
  v22.receiver = self;
  v22.super_class = (Class)WDDocumentOverviewViewController;
  v15 = -[HKTableViewController initWithUsingInsetStyling:](&v22, sel_initWithUsingInsetStyling_, 1);
  v16 = v15;
  if (v15)
  {
    -[WDDocumentOverviewViewController setTitle:](v15, "setTitle:", v13);
    objc_msgSend(v11, "objectAtIndexedSubscript:", 0);
    v17 = objc_claimAutoreleasedReturnValue();
    displayType = v16->_displayType;
    v16->_displayType = (HKDisplayType *)v17;

    objc_storeStrong((id *)&v16->_profile, a4);
    objc_storeStrong((id *)&v16->_sidebarSelectionIdentifier, a7);
    v19 = -[WDSampleListDataProvider initWithDisplayType:profile:]([WDDocumentListDataProvider alloc], "initWithDisplayType:profile:", v16->_displayType, v16->_profile);
    dataProvider = v16->_dataProvider;
    v16->_dataProvider = v19;

    v16->_totalReportCount = 0;
    -[WDDocumentOverviewViewController _installSections](v16, "_installSections");
    -[WDDocumentOverviewViewController _reloadAllData](v16, "_reloadAllData");
  }

  return v16;
}

- (void)viewDidLoad
{
  WDDocumentListDataProvider *dataProvider;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t);
  void *v12;
  id v13;
  id location;
  objc_super v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x24BDAC8D0];
  v15.receiver = self;
  v15.super_class = (Class)WDDocumentOverviewViewController;
  -[HKTableViewController viewDidLoad](&v15, sel_viewDidLoad);
  objc_initWeak(&location, self);
  dataProvider = self->_dataProvider;
  v9 = MEMORY[0x24BDAC760];
  v10 = 3221225472;
  v11 = __47__WDDocumentOverviewViewController_viewDidLoad__block_invoke;
  v12 = &unk_24D38CFD8;
  objc_copyWeak(&v13, &location);
  -[WDSampleListDataProvider startCollectingDataWithUpdateHandler:](dataProvider, "startCollectingDataWithUpdateHandler:", &v9);
  -[WDDocumentOverviewViewController tableView](self, "tableView", v9, v10, v11, v12);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "registerClass:forCellReuseIdentifier:", objc_opt_class(), CFSTR("accessDataIdentifier"));
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObserver:selector:name:object:", self, sel__contentSizeCategoryDidChange_, *MEMORY[0x24BDF7670], 0);

  v16[0] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v16, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)-[WDDocumentOverviewViewController registerForTraitChanges:withTarget:action:](self, "registerForTraitChanges:withTarget:action:", v6, self, sel_widthDesignationDidChangeWithTraitEnvironment_previousTraitCollection_);

  -[WDDocumentOverviewViewController navigationItem](self, "navigationItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_setSupportsTwoLineLargeTitles:", 1);

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

void __47__WDDocumentOverviewViewController_viewDidLoad__block_invoke(uint64_t a1)
{
  _QWORD block[4];
  id v2;

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __47__WDDocumentOverviewViewController_viewDidLoad__block_invoke_2;
  block[3] = &unk_24D38CFD8;
  objc_copyWeak(&v2, (id *)(a1 + 32));
  dispatch_async(MEMORY[0x24BDAC9B8], block);
  objc_destroyWeak(&v2);
}

void __47__WDDocumentOverviewViewController_viewDidLoad__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_reloadAllData");

}

- (void)viewDidAppear:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  -[WDDocumentOverviewViewController _updateActivityForViewDidAppear](self, "_updateActivityForViewDidAppear");
  v5.receiver = self;
  v5.super_class = (Class)WDDocumentOverviewViewController;
  -[WDDocumentOverviewViewController viewDidAppear:](&v5, sel_viewDidAppear_, v3);
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)WDDocumentOverviewViewController;
  -[WDDocumentOverviewViewController dealloc](&v4, sel_dealloc);
}

- (void)widthDesignationDidChangeWithTraitEnvironment:(id)a3 previousTraitCollection:(id)a4
{
  void *v5;
  uint64_t v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v23;
  void *v24;
  void *v25;
  id v26;

  objc_msgSend(a3, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "valueForNSIntegerTrait:", objc_opt_class());

  objc_msgSend(MEMORY[0x24BE4A578], "edgeInsetsForWidthDesignation:", v6);
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;
  -[WDDocumentOverviewViewController tableView](self, "tableView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "_setSectionContentInset:", 0.0, v10, 0.0, v14);

  -[WDDocumentOverviewViewController navigationItem](self, "navigationItem");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "largeTitleInsets");
  if (v10 == v20 && v8 == v17 && v14 == v19)
  {
    v23 = v18;

    if (v12 == v23)
      return;
  }
  else
  {

  }
  -[WDDocumentOverviewViewController navigationItem](self, "navigationItem");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setLargeTitleInsets:", v8, v10, v12, v14);

  -[WDDocumentOverviewViewController navigationController](self, "navigationController");
  v26 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "navigationBar");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setNeedsLayout");

}

- (void)_recomputeTotalReportCount
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
  WDDocumentOverviewViewController *v13;
  id v14;

  objc_msgSend(MEMORY[0x24BDD3DC0], "documentTypeForIdentifier:", *MEMORY[0x24BDD2BC0]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc(MEMORY[0x24BDD3EE0]);
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x24BDAC760];
  v10 = 3221225472;
  v11 = __62__WDDocumentOverviewViewController__recomputeTotalReportCount__block_invoke;
  v12 = &unk_24D38D050;
  v13 = self;
  v14 = v3;
  v6 = v3;
  v7 = (void *)objc_msgSend(v4, "initWithSampleTypes:predicate:resultsHandler:", v5, 0, &v9);

  -[WDProfile healthStore](self->_profile, "healthStore", v9, v10, v11, v12, v13);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "executeQuery:", v7);

}

void __62__WDDocumentOverviewViewController__recomputeTotalReportCount__block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
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
    v10[2] = __62__WDDocumentOverviewViewController__recomputeTotalReportCount__block_invoke_206;
    v10[3] = &unk_24D38D028;
    v10[4] = *(_QWORD *)(a1 + 32);
    v10[5] = v8;
    dispatch_async(MEMORY[0x24BDAC9B8], v10);
  }
  else
  {
    _HKInitializeLogging();
    v9 = (void *)*MEMORY[0x24BDD3070];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3070], OS_LOG_TYPE_ERROR))
      __62__WDDocumentOverviewViewController__recomputeTotalReportCount__block_invoke_cold_1(a1, v9, (uint64_t)v6);
  }

}

void __62__WDDocumentOverviewViewController__recomputeTotalReportCount__block_invoke_206(uint64_t a1)
{
  id v1;

  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1064) = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "tableView");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "reloadData");

}

- (void)_reloadAllData
{
  NSMutableArray *v3;
  uint64_t v4;
  uint64_t v5;
  NSMutableArray *reportRowTypes;
  id v7;

  v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v4 = -[WDSampleListDataProvider numberOfObjectsForSection:](self->_dataProvider, "numberOfObjectsForSection:", 0);
  if (v4 >= 1)
  {
    if (v4 >= 3)
      v5 = 3;
    else
      v5 = v4;
    do
    {
      -[NSMutableArray addObject:](v3, "addObject:", &unk_24D3A5DB0);
      --v5;
    }
    while (v5);
  }
  -[NSMutableArray addObject:](v3, "addObject:", &unk_24D3A5DC8);
  -[NSMutableArray addObject:](v3, "addObject:", &unk_24D3A5DE0);
  reportRowTypes = self->_reportRowTypes;
  self->_reportRowTypes = v3;

  -[WDDocumentOverviewViewController _recomputeTotalReportCount](self, "_recomputeTotalReportCount");
  -[WDDocumentOverviewViewController tableView](self, "tableView");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "reloadData");

}

- (void)_installSections
{
  NSMutableArray *v3;
  NSMutableArray *sectionTypes;

  v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
  sectionTypes = self->_sectionTypes;
  self->_sectionTypes = v3;

  -[NSMutableArray addObject:](self->_sectionTypes, "addObject:", &unk_24D3A5DB0);
  -[NSMutableArray addObject:](self->_sectionTypes, "addObject:", &unk_24D3A5DC8);
}

- (UIFont)bodyFont
{
  UIFont *bodyFont;
  UIFont *v4;
  UIFont *v5;

  bodyFont = self->_bodyFont;
  if (!bodyFont)
  {
    objc_msgSend(MEMORY[0x24BDF6A70], "hk_preferredFontForTextStyle:", *MEMORY[0x24BDF77B0]);
    v4 = (UIFont *)objc_claimAutoreleasedReturnValue();
    v5 = self->_bodyFont;
    self->_bodyFont = v4;

    bodyFont = self->_bodyFont;
  }
  return bodyFont;
}

- (id)_reportShowAllCellForTableView:(id)a3 forIndexPath:(id)a4
{
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

  objc_msgSend(a3, "dequeueReusableCellWithIdentifier:", CFSTR("showAllDataIdentifier"), a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6E60]), "initWithStyle:reuseIdentifier:", 1, CFSTR("showAllDataIdentifier"));
    objc_msgSend(v5, "setAccessoryType:", 1);
  }
  objc_msgSend(v5, "textLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  WDBundle();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("SHOW_ALL_RECORDS"), &stru_24D38E7C8, CFSTR("WellnessDashboard-Localizable"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setText:", v8);

  objc_msgSend(v5, "textLabel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setAccessibilityIdentifier:", CFSTR("UIA.Health.CDA.ShowAllRecords"));

  if (self->_totalReportCount < 1)
  {
    objc_msgSend(v5, "detailTextLabel");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setText:", &stru_24D38E7C8);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    HKLocalizedStringForNumberWithTemplate();
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "detailTextLabel");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setText:", v11);

  }
  objc_msgSend(v5, "textLabel");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDDocumentOverviewViewController bodyFont](self, "bodyFont");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setFont:", v14);

  objc_msgSend(v5, "detailTextLabel");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDDocumentOverviewViewController bodyFont](self, "bodyFont");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setFont:", v16);

  return v5;
}

- (id)_reportAccessCellForTableView:(id)a3 forIndexPath:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  objc_msgSend(a3, "dequeueReusableCellWithIdentifier:forIndexPath:", CFSTR("accessDataIdentifier"), a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAccessoryType:", 1);
  objc_msgSend(v5, "textLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("SHARE_DATA_TITLE"), &stru_24D38E7C8, CFSTR("HealthUI-Localizable"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setText:", v8);

  objc_msgSend(v5, "textLabel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDDocumentOverviewViewController bodyFont](self, "bodyFont");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setFont:", v10);

  return v5;
}

- (id)_reportItemCellForTableView:(id)a3 row:(int64_t)a4
{
  WDDocumentListDataProvider *dataProvider;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  dataProvider = self->_dataProvider;
  v7 = a3;
  -[WDSampleListDataProvider objectAtIndex:forSection:](dataProvider, "objectAtIndex:forSection:", a4, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForRow:inSection:", a4, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDDocumentListDataProvider customCellForObject:indexPath:tableView:](self->_dataProvider, "customCellForObject:indexPath:tableView:", v8, v9, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)_reportSectionCellForTableView:(id)a3 forIndexPath:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;

  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v7, "row");
  -[NSMutableArray objectAtIndexedSubscript:](self->_reportRowTypes, "objectAtIndexedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "integerValue");
  if (v10 == 2)
  {
    -[WDDocumentOverviewViewController _reportAccessCellForTableView:forIndexPath:](self, "_reportAccessCellForTableView:forIndexPath:", v6, v7);
    v11 = objc_claimAutoreleasedReturnValue();
  }
  else if (v10 == 1)
  {
    -[WDDocumentOverviewViewController _reportShowAllCellForTableView:forIndexPath:](self, "_reportShowAllCellForTableView:forIndexPath:", v6, v7);
    v11 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (v10)
    {
      v12 = 0;
      goto LABEL_9;
    }
    -[WDDocumentOverviewViewController _reportItemCellForTableView:row:](self, "_reportItemCellForTableView:row:", v6, v8);
    v11 = objc_claimAutoreleasedReturnValue();
  }
  v12 = (void *)v11;
LABEL_9:

  return v12;
}

- (id)_descriptionSectionCellForTableView:(id)a3 row:(int64_t)a4
{
  return -[WDDisplayTypeDescriptionTableViewCell initWithDisplayType:showAttributionText:reuseIdentifier:]([WDDisplayTypeDescriptionTableViewCell alloc], "initWithDisplayType:showAttributionText:reuseIdentifier:", self->_displayType, 1, CFSTR("descriptionCellReuse"));
}

- (void)_pushReportDetailViewControllerForIndexPath:(id)a3
{
  void *v4;
  id v5;

  -[WDSampleListDataProvider viewControllerForItemAtIndexPath:](self->_dataProvider, "viewControllerForItemAtIndexPath:", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "navigationItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setLargeTitleDisplayMode:", 2);

  -[WDDocumentOverviewViewController showAdaptively:sender:](self, "showAdaptively:sender:", v5, self);
}

- (void)_pushShowAllViewController
{
  HKDisplayType *displayType;
  WDProfile *profile;
  void *v5;
  WDDataListViewController *v6;
  void *v7;
  id v8;

  displayType = self->_displayType;
  profile = self->_profile;
  -[WDProfile unitController](profile, "unitController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKDisplayType wd_listViewControllerDataProviderWithProfile:unitController:](displayType, "wd_listViewControllerDataProviderWithProfile:unitController:", profile, v5);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  v6 = -[WDDataListViewController initWithDisplayType:profile:dataProvider:usingInsetStyling:]([WDDataListViewController alloc], "initWithDisplayType:profile:dataProvider:usingInsetStyling:", self->_displayType, self->_profile, v8, 1);
  -[WDDataListViewController navigationItem](v6, "navigationItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setLargeTitleDisplayMode:", 2);

  -[WDDocumentOverviewViewController showAdaptively:sender:](self, "showAdaptively:sender:", v6, self);
}

- (void)_pushAccessViewController
{
  WDDisplayTypeDataSourcesTableViewController *v3;
  HKDisplayType *displayType;
  void *v5;
  WDDisplayTypeDataSourcesTableViewController *v6;
  void *v7;
  id v8;

  objc_msgSend(MEMORY[0x24BE4A5C0], "categoryWithID:", -[HKDisplayType categoryIdentifier](self->_displayType, "categoryIdentifier"));
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v3 = [WDDisplayTypeDataSourcesTableViewController alloc];
  displayType = self->_displayType;
  -[WDProfile sourceOrderController](self->_profile, "sourceOrderController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[WDDisplayTypeDataSourcesTableViewController initWithDisplayType:displayCategory:sourceOrderController:profile:](v3, "initWithDisplayType:displayCategory:sourceOrderController:profile:", displayType, v8, v5, self->_profile);

  -[WDDisplayTypeDataSourcesTableViewController navigationItem](v6, "navigationItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setLargeTitleDisplayMode:", 2);

  -[WDDocumentOverviewViewController showAdaptively:sender:](self, "showAdaptively:sender:", v6, self);
}

- (void)_selectReportRowForIndexPath:(id)a3
{
  void *v4;
  uint64_t v5;
  id v6;

  v6 = a3;
  -[NSMutableArray objectAtIndexedSubscript:](self->_reportRowTypes, "objectAtIndexedSubscript:", objc_msgSend(v6, "row"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "integerValue");
  switch(v5)
  {
    case 2:
      -[WDDocumentOverviewViewController _pushAccessViewController](self, "_pushAccessViewController");
      break;
    case 1:
      -[WDDocumentOverviewViewController _pushShowAllViewController](self, "_pushShowAllViewController");
      break;
    case 0:
      -[WDDocumentOverviewViewController _pushReportDetailViewControllerForIndexPath:](self, "_pushReportDetailViewControllerForIndexPath:", v6);
      break;
  }

}

- (double)_reportSectionRowHeight:(int64_t)a3
{
  void *v4;
  uint64_t v5;
  double v6;
  double v7;

  -[NSMutableArray objectAtIndexedSubscript:](self->_reportRowTypes, "objectAtIndexedSubscript:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "integerValue");
  if (v5 == 2 || v5 == 1)
  {
    v6 = *MEMORY[0x24BDF7DE0];
  }
  else
  {
    v6 = 0.0;
    if (!v5)
    {
      -[WDDocumentListDataProvider customCellHeight](self->_dataProvider, "customCellHeight");
      v6 = v7;
    }
  }

  return v6;
}

- (double)_reportSectionEstimatedRowHeight:(int64_t)a3
{
  void *v4;
  uint64_t v5;
  double v6;
  double v7;

  -[NSMutableArray objectAtIndexedSubscript:](self->_reportRowTypes, "objectAtIndexedSubscript:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "integerValue");
  if (v5 == 2 || v5 == 1)
  {
    v6 = 44.0;
  }
  else
  {
    v6 = 0.0;
    if (!v5)
    {
      -[WDDocumentListDataProvider customEstimatedCellHeight](self->_dataProvider, "customEstimatedCellHeight");
      v6 = v7;
    }
  }

  return v6;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return -[NSMutableArray count](self->_sectionTypes, "count", a3);
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  void *v4;
  uint64_t v5;
  double v6;
  double v7;

  -[NSMutableArray objectAtIndexedSubscript:](self->_sectionTypes, "objectAtIndexedSubscript:", a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "integerValue");
  if (v5 == 1)
  {
    v6 = *MEMORY[0x24BDF7DE0];
  }
  else
  {
    v6 = 0.0;
    if (!v5)
    {
      HKUIOnePixel();
      v6 = v7;
    }
  }

  return v6;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  void *v5;
  uint64_t v6;
  int64_t v7;

  -[NSMutableArray objectAtIndexedSubscript:](self->_sectionTypes, "objectAtIndexedSubscript:", a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "integerValue");
  if (v6 == 1)
  {
    v7 = 1;
  }
  else if (v6)
  {
    v7 = 0;
  }
  else
  {
    v7 = -[NSMutableArray count](self->_reportRowTypes, "count");
  }

  return v7;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;

  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v7, "section");
  v9 = objc_msgSend(v7, "row");
  -[NSMutableArray objectAtIndexedSubscript:](self->_sectionTypes, "objectAtIndexedSubscript:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "integerValue");
  if (v11 == 1)
  {
    -[WDDocumentOverviewViewController _descriptionSectionCellForTableView:row:](self, "_descriptionSectionCellForTableView:row:", v6, v9);
    v12 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (v11)
    {
      v13 = 0;
      goto LABEL_7;
    }
    -[WDDocumentOverviewViewController _reportSectionCellForTableView:forIndexPath:](self, "_reportSectionCellForTableView:forIndexPath:", v6, v7);
    v12 = objc_claimAutoreleasedReturnValue();
  }
  v13 = (void *)v12;
LABEL_7:

  return v13;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v8 = a3;
  v6 = a4;
  -[NSMutableArray objectAtIndexedSubscript:](self->_sectionTypes, "objectAtIndexedSubscript:", objc_msgSend(v6, "section"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v7, "integerValue"))
    -[WDDocumentOverviewViewController _selectReportRowForIndexPath:](self, "_selectReportRowForIndexPath:", v6);
  objc_msgSend(v8, "deselectRowAtIndexPath:animated:", v6, 1);

}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  double v10;
  double v11;

  v5 = a4;
  v6 = objc_msgSend(v5, "section");
  v7 = objc_msgSend(v5, "row");

  -[NSMutableArray objectAtIndexedSubscript:](self->_sectionTypes, "objectAtIndexedSubscript:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "integerValue");
  if (v9 == 1)
  {
    v10 = *MEMORY[0x24BDF7DE0];
  }
  else
  {
    v10 = 0.0;
    if (!v9)
    {
      -[WDDocumentOverviewViewController _reportSectionRowHeight:](self, "_reportSectionRowHeight:", v7);
      v10 = v11;
    }
  }

  return v10;
}

- (double)tableView:(id)a3 estimatedHeightForRowAtIndexPath:(id)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  double v10;
  double v11;

  v5 = a4;
  v6 = objc_msgSend(v5, "section");
  v7 = objc_msgSend(v5, "row");

  -[NSMutableArray objectAtIndexedSubscript:](self->_sectionTypes, "objectAtIndexedSubscript:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "integerValue");
  if (v9 == 1)
  {
    +[WDDisplayTypeDescriptionTableViewCell minimumHeight](WDDisplayTypeDescriptionTableViewCell, "minimumHeight");
    goto LABEL_5;
  }
  v10 = 0.0;
  if (!v9)
  {
    -[WDDocumentOverviewViewController _reportSectionEstimatedRowHeight:](self, "_reportSectionEstimatedRowHeight:", v7);
LABEL_5:
    v10 = v11;
  }

  return v10;
}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  void *v4;
  BOOL v5;

  -[NSMutableArray objectAtIndexedSubscript:](self->_sectionTypes, "objectAtIndexedSubscript:", objc_msgSend(a4, "section", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "integerValue") == 0;

  return v5;
}

- (void)_updateActivityForViewDidAppear
{
  void *v3;
  id v4;

  -[WDProfile userActivityManager](self->_profile, "userActivityManager");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[WDDocumentOverviewViewController title](self, "title");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "changeActivityForResponder:activityDictionary:title:keywords:", self, 0, v3, 0);

}

- (void)_contentSizeCategoryDidChange:(id)a3
{
  UIFont *bodyFont;
  id v5;

  bodyFont = self->_bodyFont;
  self->_bodyFont = 0;

  -[WDDocumentOverviewViewController tableView](self, "tableView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "reloadData");

}

- (HKDisplayType)displayType
{
  return self->_displayType;
}

- (WDProfile)profile
{
  return self->_profile;
}

- (WDDocumentListDataProvider)dataProvider
{
  return self->_dataProvider;
}

- (NSMutableArray)sectionTypes
{
  return self->_sectionTypes;
}

- (void)setSectionTypes:(id)a3
{
  objc_storeStrong((id *)&self->_sectionTypes, a3);
}

- (NSMutableArray)reportRowTypes
{
  return self->_reportRowTypes;
}

- (void)setReportRowTypes:(id)a3
{
  objc_storeStrong((id *)&self->_reportRowTypes, a3);
}

- (int64_t)totalReportCount
{
  return self->_totalReportCount;
}

- (void)setTotalReportCount:(int64_t)a3
{
  self->_totalReportCount = a3;
}

- (void)setBodyFont:(id)a3
{
  objc_storeStrong((id *)&self->_bodyFont, a3);
}

- (NSString)sidebarSelectionIdentifier
{
  return self->_sidebarSelectionIdentifier;
}

- (void)setSidebarSelectionIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1080);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sidebarSelectionIdentifier, 0);
  objc_storeStrong((id *)&self->_bodyFont, 0);
  objc_storeStrong((id *)&self->_reportRowTypes, 0);
  objc_storeStrong((id *)&self->_sectionTypes, 0);
  objc_storeStrong((id *)&self->_dataProvider, 0);
  objc_storeStrong((id *)&self->_profile, 0);
  objc_storeStrong((id *)&self->_displayType, 0);
}

void __62__WDDocumentOverviewViewController__recomputeTotalReportCount__block_invoke_cold_1(uint64_t a1, void *a2, uint64_t a3)
{
  NSObject *v4;
  id v5;
  int v6;
  id v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v4 = a2;
  v6 = 138543618;
  v7 = (id)objc_opt_class();
  v8 = 2114;
  v9 = a3;
  v5 = v7;
  _os_log_error_impl(&dword_215814000, v4, OS_LOG_TYPE_ERROR, "%{public}@: Error counting document samples: %{public}@", (uint8_t *)&v6, 0x16u);

}

@end
