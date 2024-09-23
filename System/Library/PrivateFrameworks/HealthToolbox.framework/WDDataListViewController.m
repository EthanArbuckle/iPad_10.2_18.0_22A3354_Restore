@implementation WDDataListViewController

- (WDDataListViewController)initWithDisplayType:(id)a3 profile:(id)a4 dataProvider:(id)a5 usingInsetStyling:(BOOL)a6
{
  _BOOL8 v6;
  id v11;
  id v12;
  id v13;
  WDDataListViewController *v14;
  WDDataListViewController *v15;
  NSDate *scrollToDate;
  id v17;
  void *v18;
  void *v19;
  uint64_t v20;
  UIBarButtonItem *deleteAllButtonItem;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  objc_super v29;

  v6 = a6;
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v29.receiver = self;
  v29.super_class = (Class)WDDataListViewController;
  v14 = -[HKTableViewController initWithUsingInsetStyling:](&v29, sel_initWithUsingInsetStyling_, v6);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_displayType, a3);
    objc_storeStrong((id *)&v15->_dataProvider, a5);
    objc_storeStrong((id *)&v15->_profile, a4);
    scrollToDate = v15->_scrollToDate;
    v15->_scrollToDate = 0;

    v17 = objc_alloc(MEMORY[0x24BDF6860]);
    WDBundle();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "localizedStringForKey:value:table:", CFSTR("DELETE_ALL_BUTTON_TITLE"), &stru_24D38E7C8, CFSTR("WellnessDashboard-Localizable"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v17, "initWithTitle:style:target:action:", v19, 0, v15, sel__deleteAllButtonTapped_);
    deleteAllButtonItem = v15->_deleteAllButtonItem;
    v15->_deleteAllButtonItem = (UIBarButtonItem *)v20;

    objc_msgSend(MEMORY[0x24BDD17C8], "healthAccessibilityIdentifier:suffix:", 0, CFSTR("DataListViewController.DeleteAllButton"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIBarButtonItem setAccessibilityIdentifier:](v15->_deleteAllButtonItem, "setAccessibilityIdentifier:", v22);

    objc_msgSend(MEMORY[0x24BDD17C8], "healthAccessibilityIdentifier:suffix:", 0, CFSTR("DataListViewController.EditButton"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[WDDataListViewController editButtonItem](v15, "editButtonItem");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setAccessibilityIdentifier:", v23);

    v15->_cellStyle = -[WDDataListViewControllerDataProvider cellStyle](v15->_dataProvider, "cellStyle");
    objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v15->_showOriginalAppProvenance = objc_msgSend(v25, "BOOLForKey:", CFSTR("ShowOriginalAppProvenance"));

    -[WDDataListViewController _updateNavigationTitle](v15, "_updateNavigationTitle");
    -[WDDataListViewController _updateRightBarButtonItems](v15, "_updateRightBarButtonItems");
    -[WDDataListViewController setModalPresentationStyle:](v15, "setModalPresentationStyle:", 2);
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "addObserver:selector:name:object:", v15, sel__localeDidChange_, *MEMORY[0x24BDBCA70], 0);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "addObserver:selector:name:object:", v15, sel__displayTypeStringsChanged_, *MEMORY[0x24BE4A020], 0);

  }
  return v15;
}

- (void)_updateNavigationTitle
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  -[WDProfile healthStore](self->_profile, "healthStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  WDGetProfileNameForHealthStore(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDDataListViewControllerDataProvider setProfileName:](self->_dataProvider, "setProfileName:", v4);

  -[WDDataListViewControllerDataProvider profileName](self->_dataProvider, "profileName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = (void *)MEMORY[0x24BDD17C8];
    WDBundle();
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("ALL_DATA_TITLE_%@"), &stru_24D38E7C8, CFSTR("WellnessDashboard-Localizable-Tinker"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[WDDataListViewControllerDataProvider profileName](self->_dataProvider, "profileName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localizedStringWithFormat:", v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[WDDataListViewController setTitle:](self, "setTitle:", v9);

  }
  else
  {
    WDBundle();
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("ALL_DATA_TITLE"), &stru_24D38E7C8, CFSTR("WellnessDashboard-Localizable"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[WDDataListViewController setTitle:](self, "setTitle:", v7);
  }

}

- (WDProfile)profile
{
  return self->_profile;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  -[WDDataListViewControllerDataProvider stopCollectingData](self->_dataProvider, "stopCollectingData");
  v4.receiver = self;
  v4.super_class = (Class)WDDataListViewController;
  -[WDDataListViewController dealloc](&v4, sel_dealloc);
}

- (BOOL)isEditEnabled
{
  void *v2;
  void *v3;
  void *v4;
  BOOL v5;

  -[WDDataListViewController profile](self, "profile");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "healthStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "profileIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "type") == 1;

  return v5;
}

- (id)_sampleTypesForDeleteAll
{
  uint64_t v3;
  HKDisplayType *displayType;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v12;
  _QWORD v13[3];
  _QWORD v14[3];

  v14[2] = *MEMORY[0x24BDAC8D0];
  v3 = -[HKDisplayType displayTypeIdentifier](self->_displayType, "displayTypeIdentifier");
  displayType = self->_displayType;
  if (v3 == 139)
  {
    -[HKDisplayType sampleType](displayType, "sampleType");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = v5;
    objc_msgSend(MEMORY[0x24BDD3F28], "heartbeatSeriesType");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v14[1] = v6;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v14, 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = -[HKDisplayType displayTypeIdentifier](displayType, "displayTypeIdentifier");
    -[HKDisplayType sampleType](self->_displayType, "sampleType");
    v9 = objc_claimAutoreleasedReturnValue();
    v5 = (void *)v9;
    if (v8 != 80)
    {
      v12 = v9;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v12, 1);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    }
    v13[0] = v9;
    objc_msgSend(MEMORY[0x24BDD3E80], "quantityTypeForIdentifier:", *MEMORY[0x24BDD33A0]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v13[1] = v6;
    objc_msgSend(MEMORY[0x24BDD3E80], "quantityTypeForIdentifier:", *MEMORY[0x24BDD33A8]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v13[2] = v10;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v13, 3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
LABEL_7:

  return v7;
}

- (void)_reloadAllDataScrolledToDate:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __57__WDDataListViewController__reloadAllDataScrolledToDate___block_invoke;
  v6[3] = &unk_24D38CEC0;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  dispatch_async(MEMORY[0x24BDAC9B8], v6);

}

void __57__WDDataListViewController__reloadAllDataScrolledToDate___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  double v8;
  double v9;
  double v10;
  id v11;

  if ((objc_msgSend(*(id *)(a1 + 32), "_dataProviderEnabled") & 1) != 0
    || (objc_opt_respondsToSelector() & 1) != 0
    && (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1080), "hasCompleteDataSet") & 1) == 0)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1056), "removeFromSuperview");
    v2 = 1;
  }
  else
  {
    if (objc_msgSend(*(id *)(a1 + 32), "isEditing"))
      objc_msgSend(*(id *)(a1 + 32), "setEditing:", 0);
    objc_msgSend(*(id *)(a1 + 32), "view");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addSubview:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1056));

    v2 = 0;
  }
  objc_msgSend(*(id *)(a1 + 32), "_updateRightBarButtonItems");
  objc_msgSend(*(id *)(a1 + 32), "tableView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setScrollEnabled:", v2);

  objc_msgSend(*(id *)(a1 + 32), "editButtonItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setEnabled:", v2);

  objc_msgSend(*(id *)(a1 + 32), "tableView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "reloadData");

  if (*(_QWORD *)(a1 + 40))
  {
    v7 = objc_msgSend(*(id *)(a1 + 32), "_closestRowToDate:");
    if (v7 < 1)
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1080), "viewControllerIsNearEndOfScreen");
    }
    else
    {
      v8 = (double)v7;
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1080), "customEstimatedCellHeight");
      v10 = v8 * v9 + -16.0;
      objc_msgSend(*(id *)(a1 + 32), "tableView");
      v11 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setContentOffset:animated:", 0, 0.0, v10);

    }
  }
}

- (void)_reloadAllData
{
  -[WDDataListViewController _reloadAllDataScrolledToDate:](self, "_reloadAllDataScrolledToDate:", 0);
}

- (int64_t)_closestRowToDate:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  int64_t v7;
  int64_t v8;
  BOOL v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v4 = a3;
  -[WDDataListViewController dataProvider](self, "dataProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "numberOfObjectsForSection:", 0);

  v7 = v6 - 1;
  if (v6 >= 1)
  {
    v8 = 0;
    v9 = 1;
    while (1)
    {
      -[WDDataListViewController dataProvider](self, "dataProvider");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "objectAtIndex:forSection:", v8, 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "endDate");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "startOfDayForDate:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      LODWORD(v12) = objc_msgSend(v14, "hk_isBeforeOrEqualToDate:", v4);
      if ((_DWORD)v12)
        break;
      v9 = v6 > ++v8;
      if (v6 == v8)
      {
        v8 = v6;
        break;
      }
    }
    v7 = v6 - 1;
    if (v9)
      v7 = v8;
  }

  return v7;
}

- (BOOL)_dataProviderEnabled
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v3 = -[WDDataListViewControllerDataProvider numberOfSections](self->_dataProvider, "numberOfSections");
  if (v3 < 1)
    return 0;
  v4 = v3;
  if (-[WDDataListViewControllerDataProvider numberOfObjectsForSection:](self->_dataProvider, "numberOfObjectsForSection:", 0) > 0)return 1;
  v6 = 1;
  do
  {
    v7 = v6;
    if (v4 == v6)
      break;
    v8 = -[WDDataListViewControllerDataProvider numberOfObjectsForSection:](self->_dataProvider, "numberOfObjectsForSection:", v6);
    v6 = v7 + 1;
  }
  while (v8 < 1);
  return v4 > v7;
}

- (BOOL)_displayGuestModeAlert
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

  v3 = (void *)MEMORY[0x24BDF67F0];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("GUEST_MODE_DELETE_HEALTH_TITLE"), &stru_24D38E7C8, CFSTR("HealthUI-Localizable"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("GUEST_MODE_DELETE_HEALTH_DESCRIPTION"), &stru_24D38E7C8, CFSTR("HealthUI-Localizable"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "alertControllerWithTitle:message:preferredStyle:", v5, v7, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)MEMORY[0x24BDF67E8];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("SHARE_ALERT_OK"), &stru_24D38E7C8, CFSTR("HealthUI-Localizable"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "actionWithTitle:style:handler:", v11, 0, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "addAction:", v12);
  -[WDDataListViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v8, 1, 0);

  return 1;
}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)WDDataListViewController;
  -[WDDataListViewController viewDidAppear:](&v4, sel_viewDidAppear_, a3);
  -[WDDataListViewController _updateActivityForViewDidAppear](self, "_updateActivityForViewDidAppear");
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  _UIContentUnavailableView *v8;
  _UIContentUnavailableView *noContentView;
  WDDataListViewControllerDataProvider *dataProvider;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  UIActivityIndicatorView *v22;
  UIActivityIndicatorView *spinner;
  void *v24;
  void *v25;
  UITapGestureRecognizer *v26;
  UITapGestureRecognizer *navigationBarTapGestureRecognizer;
  void *v28;
  void *v29;
  WDDataListViewControllerDataProvider *v30;
  _QWORD v31[4];
  id v32;
  id location;
  objc_super v34;

  v34.receiver = self;
  v34.super_class = (Class)WDDataListViewController;
  -[HKTableViewController viewDidLoad](&v34, sel_viewDidLoad);
  objc_msgSend(MEMORY[0x24BDD17C8], "healthAccessibilityIdentifier:suffix:", 0, CFSTR("DataListViewController.View"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDDataListViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAccessibilityIdentifier:", v3);

  v5 = objc_alloc(MEMORY[0x24BDF7080]);
  WDBundle();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("CHART_NO_DATA"), &stru_24D38E7C8, CFSTR("WellnessDashboard-Localizable"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (_UIContentUnavailableView *)objc_msgSend(v5, "initWithFrame:title:style:", v7, 0, *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  noContentView = self->_noContentView;
  self->_noContentView = v8;

  if (-[WDDataListViewControllerDataProvider cellStyle](self->_dataProvider, "cellStyle") == 2)
  {
    dataProvider = self->_dataProvider;
    -[WDDataListViewController tableView](self, "tableView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[WDDataListViewControllerDataProvider customizeTableView:](dataProvider, "customizeTableView:", v11);

    -[WDDataListViewController tableView](self, "tableView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[WDDataListViewControllerDataProvider customEstimatedCellHeight](self->_dataProvider, "customEstimatedCellHeight");
    objc_msgSend(v12, "setEstimatedRowHeight:");

    -[WDDataListViewController tableView](self, "tableView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[WDDataListViewControllerDataProvider customCellHeight](self->_dataProvider, "customCellHeight");
    v15 = v13;
  }
  else
  {
    -[WDDataListViewController tableView](self, "tableView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setEstimatedRowHeight:", *MEMORY[0x24BE4A140]);

    -[WDDataListViewController tableView](self, "tableView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v15;
    v14 = *MEMORY[0x24BDF7DE0];
  }
  objc_msgSend(v15, "setRowHeight:", v14);

  -[WDDataListViewController tableView](self, "tableView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_opt_class();
  +[WDSpinnerTableViewCell defaultReuseIdentifier](WDSpinnerTableViewCell, "defaultReuseIdentifier");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "registerClass:forCellReuseIdentifier:", v18, v19);

  HKUIJoinStringsForAutomationIdentifier();
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDDataListViewController tableView](self, "tableView");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setAccessibilityIdentifier:", v20);

  v22 = (UIActivityIndicatorView *)objc_msgSend(objc_alloc(MEMORY[0x24BDF67D0]), "initWithActivityIndicatorStyle:", 100);
  spinner = self->_spinner;
  self->_spinner = v22;

  -[UIActivityIndicatorView setHidesWhenStopped:](self->_spinner, "setHidesWhenStopped:", 1);
  -[WDDataListViewController view](self, "view");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "addSubview:", self->_spinner);

  -[UIActivityIndicatorView startAnimating](self->_spinner, "startAnimating");
  objc_msgSend(MEMORY[0x24BDD4198], "sharedBehavior");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v21) = objc_msgSend(v25, "isAppleInternalInstall");

  if ((_DWORD)v21)
  {
    v26 = (UITapGestureRecognizer *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6E80]), "initWithTarget:action:", self, sel__tapGestureRecognizerAction_);
    navigationBarTapGestureRecognizer = self->_navigationBarTapGestureRecognizer;
    self->_navigationBarTapGestureRecognizer = v26;

    -[UITapGestureRecognizer setNumberOfTapsRequired:](self->_navigationBarTapGestureRecognizer, "setNumberOfTapsRequired:", 3);
    -[WDDataListViewController navigationController](self, "navigationController");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "navigationBar");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "addGestureRecognizer:", self->_navigationBarTapGestureRecognizer);

  }
  objc_initWeak(&location, self);
  v30 = self->_dataProvider;
  v31[0] = MEMORY[0x24BDAC760];
  v31[1] = 3221225472;
  v31[2] = __39__WDDataListViewController_viewDidLoad__block_invoke;
  v31[3] = &unk_24D38CFD8;
  objc_copyWeak(&v32, &location);
  -[WDDataListViewControllerDataProvider startCollectingDataWithUpdateHandler:](v30, "startCollectingDataWithUpdateHandler:", v31);
  objc_destroyWeak(&v32);
  objc_destroyWeak(&location);
}

void __39__WDDataListViewController_viewDidLoad__block_invoke(uint64_t a1)
{
  _QWORD block[4];
  id v2;

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __39__WDDataListViewController_viewDidLoad__block_invoke_2;
  block[3] = &unk_24D38CFD8;
  objc_copyWeak(&v2, (id *)(a1 + 32));
  dispatch_async(MEMORY[0x24BDAC9B8], block);
  objc_destroyWeak(&v2);
}

void __39__WDDataListViewController_viewDidLoad__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_dataProviderDidUpdate");

}

- (void)_dataProviderDidUpdate
{
  void *v3;

  -[UIActivityIndicatorView stopAnimating](self->_spinner, "stopAnimating");
  -[WDDataListViewController scrollToDate](self, "scrollToDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDDataListViewController _reloadAllDataScrolledToDate:](self, "_reloadAllDataScrolledToDate:", v3);

  -[WDDataListViewController setScrollToDate:](self, "setScrollToDate:", 0);
  -[WDDataListViewController _updateRightBarButtonItems](self, "_updateRightBarButtonItems");
}

- (void)viewWillLayoutSubviews
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  _UIContentUnavailableView *noContentView;
  void *v17;
  _UIContentUnavailableView *v18;
  void *v19;
  double v20;
  double v21;
  void *v22;
  double v23;
  double v24;
  void *v25;
  double v26;
  double v27;
  void *v28;
  double v29;
  objc_super v30;

  v30.receiver = self;
  v30.super_class = (Class)WDDataListViewController;
  -[WDDataListViewController viewWillLayoutSubviews](&v30, sel_viewWillLayoutSubviews);
  -[WDDataListViewController navigationController](self, "navigationController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "navigationBar");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "frame");
  v6 = v5;

  -[WDDataListViewController tabBarController](self, "tabBarController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "tabBar");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "frame");
  v10 = v9;

  -[WDDataListViewController view](self, "view");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "frame");
  v13 = v12;
  v15 = v14;

  -[UIActivityIndicatorView setCenter:](self->_spinner, "setCenter:", v13 * 0.5, (v15 - v6 - v10) * 0.5);
  noContentView = self->_noContentView;
  -[WDDataListViewController view](self, "view");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "bounds");
  -[_UIContentUnavailableView setFrame:](noContentView, "setFrame:");

  v18 = self->_noContentView;
  -[WDDataListViewController view](self, "view");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "center");
  v21 = v20;
  -[WDDataListViewController view](self, "view");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "center");
  v24 = v23;
  -[WDDataListViewController view](self, "view");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "safeAreaInsets");
  v27 = v26;
  -[WDDataListViewController view](self, "view");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "safeAreaInsets");
  -[_UIContentUnavailableView setCenter:](v18, "setCenter:", v21, v24 - (v27 + v29) * 0.5);

}

- (void)scrollViewDidScroll:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  void *v18;
  double Height;
  CGRect v20;
  CGRect v21;

  v4 = a3;
  objc_msgSend(v4, "contentOffset");
  v6 = v5;
  objc_msgSend(v4, "contentSize");
  v8 = v7;
  objc_msgSend(v4, "frame");
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;

  v20.origin.x = v10;
  v20.origin.y = v12;
  v20.size.width = v14;
  v20.size.height = v16;
  v17 = v8 - (v6 + CGRectGetHeight(v20));
  -[WDDataListViewController view](self, "view");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "bounds");
  Height = CGRectGetHeight(v21);

  if (v17 < Height)
    -[WDDataListViewControllerDataProvider viewControllerIsNearEndOfScreen](self->_dataProvider, "viewControllerIsNearEndOfScreen");
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return -[WDDataListViewControllerDataProvider numberOfSections](self->_dataProvider, "numberOfSections", a3);
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  void *v4;
  void *v5;

  objc_msgSend(a3, "dequeueReusableHeaderFooterViewWithIdentifier:", CFSTR("HeaderView"), a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "textLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setNumberOfLines:", 0);

  return v4;
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  return *MEMORY[0x24BDF7DE0];
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  return (id)-[WDDataListViewControllerDataProvider titleForSection:](self->_dataProvider, "titleForSection:", a4);
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  void *v6;
  uint64_t v7;

  -[WDDataListViewController dataProvider](self, "dataProvider", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "numberOfObjectsForSection:", a4);

  return v7 + -[WDDataListViewController _shouldShowSpinnerRowInSection:](self, "_shouldShowSpinnerRowInSection:", a4);
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  _BOOL4 v8;
  WDDataListViewControllerDataProvider *dataProvider;
  void *v10;
  void *v11;
  int64_t cellStyle;
  uint64_t v13;
  void *v14;

  v6 = a3;
  v7 = a4;
  v8 = -[WDDataListViewController _hasSpinnerRowRowAtIndexPath:](self, "_hasSpinnerRowRowAtIndexPath:", v7);
  dataProvider = self->_dataProvider;
  if (!v8)
  {
    v10 = (void *)objc_msgSend(v7, "row");
    -[WDDataListViewControllerDataProvider objectAtIndex:forSection:](dataProvider, "objectAtIndex:forSection:", v10, objc_msgSend(v7, "section"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    cellStyle = self->_cellStyle;
    if (cellStyle == 2)
    {
      -[WDDataListViewControllerDataProvider customCellForObject:indexPath:tableView:](self->_dataProvider, "customCellForObject:indexPath:tableView:", v11, v7, v6);
      v13 = objc_claimAutoreleasedReturnValue();
    }
    else if (cellStyle == 1)
    {
      -[WDDataListViewController _defaultCellForTableView:cellStyle:indexPath:object:](self, "_defaultCellForTableView:cellStyle:indexPath:object:", v6, 3, v7, v11);
      v13 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (cellStyle)
      {
LABEL_12:

        goto LABEL_13;
      }
      -[WDDataListViewController _quantityCellForTableView:dataObjectSource:](self, "_quantityCellForTableView:dataObjectSource:", v6, v11);
      v13 = objc_claimAutoreleasedReturnValue();
    }
    v10 = (void *)v13;
    goto LABEL_12;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[WDDataListViewControllerDataProvider customLoadingCellForRowAtIndexPath:tableView:](self->_dataProvider, "customLoadingCellForRowAtIndexPath:tableView:", v7, v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    +[WDSpinnerTableViewCell defaultReuseIdentifier](WDSpinnerTableViewCell, "defaultReuseIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "dequeueReusableCellWithIdentifier:", v14);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
LABEL_13:

  return v10;
}

- (void)_loadIconForSourceObject:(id)a3 onCell:(id)a4 ofTableView:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  char v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  id v29;
  char v30;
  id v31;
  _QWORD v32[4];
  id v33;
  id v34;
  id v35;
  id v36;
  _QWORD v37[4];
  id v38;
  id location;

  v8 = a3;
  v9 = a4;
  v31 = a5;
  objc_msgSend(v8, "sourceRevision");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "source");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[HKDisplayType displayTypeIdentifier](self->_displayType, "displayTypeIdentifier") != 5)
    goto LABEL_7;
  v12 = objc_msgSend(v11, "_isPreferredSource");
  v30 = objc_msgSend(v11, "_isApplication");
  objc_msgSend(v8, "device");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "localIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "bundleIdentifier");
  v15 = v9;
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "device");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "localIdentifier");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v16, "isEqualToString:", v18);

  v9 = v15;
  if (!v12)
    goto LABEL_7;
  if ((v30 & 1) == 0 && v14 && (v19 & 1) == 0)
  {
    HKBluetoothIcon();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "iconImageView");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setImage:", v20);
  }
  else
  {
LABEL_7:
    objc_msgSend(v8, "device");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "_isConnectedGymDevice");

    if (!v23)
    {
      objc_initWeak(&location, self);
      objc_msgSend(MEMORY[0x24BE4A2B0], "sharedImageManager");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = MEMORY[0x24BDAC760];
      v37[0] = MEMORY[0x24BDAC760];
      v37[1] = 3221225472;
      v37[2] = __72__WDDataListViewController__loadIconForSourceObject_onCell_ofTableView___block_invoke;
      v37[3] = &unk_24D38CF38;
      v29 = v9;
      v38 = v29;
      v32[0] = v28;
      v32[1] = 3221225472;
      v32[2] = __72__WDDataListViewController__loadIconForSourceObject_onCell_ofTableView___block_invoke_2;
      v32[3] = &unk_24D38CF88;
      objc_copyWeak(&v36, &location);
      v33 = v11;
      v34 = v29;
      v26 = v31;
      v35 = v31;
      objc_msgSend(v27, "loadIconForSource:syncHandler:asyncHandler:", v33, v37, v32);

      objc_destroyWeak(&v36);
      objc_destroyWeak(&location);
      goto LABEL_11;
    }
    objc_msgSend(MEMORY[0x24BE4A2B0], "sharedImageManager");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "device");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "iconForDevice:", v21);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "iconImageView");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setImage:", v24);

  }
  v26 = v31;
LABEL_11:

}

void __72__WDDataListViewController__loadIconForSourceObject_onCell_ofTableView___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "iconImageView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setImage:", v3);

}

void __72__WDDataListViewController__loadIconForSourceObject_onCell_ofTableView___block_invoke_2(id *a1, void *a2, void *a3)
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
  v9[2] = __72__WDDataListViewController__loadIconForSourceObject_onCell_ofTableView___block_invoke_3;
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

void __72__WDDataListViewController__loadIconForSourceObject_onCell_ofTableView___block_invoke_3(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  objc_msgSend(WeakRetained, "_handleReturnedImage:forSource:cell:tableView:fetchError:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));

}

- (void)_handleReturnedImage:(id)a3 forSource:(id)a4 cell:(id)a5 tableView:(id)a6 fetchError:(id)a7
{
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;

  v20 = a3;
  v12 = a5;
  if (v20 && !a7)
  {
    v13 = a4;
    objc_msgSend(a6, "indexPathForCell:", v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[WDDataListViewController dataProvider](self, "dataProvider");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "objectAtIndex:forSection:", objc_msgSend(v14, "row"), objc_msgSend(v14, "section"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "sourceRevision");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "source");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    LODWORD(v15) = objc_msgSend(v18, "isEqual:", v13);
    if ((_DWORD)v15)
    {
      objc_msgSend(v12, "iconImageView");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setImage:", v20);

    }
  }

}

- (id)_quantityCellForTableView:(id)a3 dataObjectSource:(id)a4
{
  id v6;
  id v7;
  WDDataTableViewCell *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  WDDataTableViewCell *v23;
  id v24;
  id v25;
  WDDataTableViewCell *v26;
  WDDataTableViewCell *v27;
  WDDataTableViewCell *v28;
  _QWORD v30[4];
  id v31;
  WDDataTableViewCell *v32;
  id v33;
  _QWORD v34[4];
  WDDataTableViewCell *v35;
  WDDataListViewController *v36;
  id v37;
  id location;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "dequeueReusableCellWithIdentifier:", CFSTR("QuantityCell"));
  v8 = (WDDataTableViewCell *)objc_claimAutoreleasedReturnValue();
  if (!v8)
    v8 = -[WDDataTableViewCell initWithStyle:reuseIdentifier:]([WDDataTableViewCell alloc], "initWithStyle:reuseIdentifier:", 1, CFSTR("QuantityCell"));
  -[WDDataTableViewCell setAccessoryType:](v8, "setAccessoryType:", 1);
  -[WDDataListViewController dataProvider](self, "dataProvider");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "textForObject:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDDataTableViewCell setDisplayValue:](v8, "setDisplayValue:", v10);

  -[WDDataListViewController dataProvider](self, "dataProvider");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "secondaryTextForObject:", v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDDataTableViewCell setDateString:](v8, "setDateString:", v12);

  -[WDDataListViewController dataProvider](self, "dataProvider");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDDataTableViewCell setDisplayValueAdjustsFontSizeToFitWidth:](v8, "setDisplayValueAdjustsFontSizeToFitWidth:", objc_msgSend(v13, "textAdjustsFontSizeToFitWidth"));

  -[WDDataListViewController dataProvider](self, "dataProvider");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[WDDataListViewController dataProvider](self, "dataProvider");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "shouldHideSourceImageForObject:", v7);

    if ((v16 & 1) != 0)
      goto LABEL_8;
  }
  else
  {

  }
  objc_msgSend(v7, "sourceRevision");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "source");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  -[WDDataTableViewCell setSource:](v8, "setSource:", v18);
  objc_msgSend(v7, "sourceRevision");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "productType");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_initWeak(&location, self);
  objc_msgSend(MEMORY[0x24BE4A2B0], "sharedImageManager");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = MEMORY[0x24BDAC760];
  v34[0] = MEMORY[0x24BDAC760];
  v34[1] = 3221225472;
  v34[2] = __71__WDDataListViewController__quantityCellForTableView_dataObjectSource___block_invoke;
  v34[3] = &unk_24D38E1A8;
  v23 = v8;
  v35 = v23;
  v36 = self;
  v24 = v18;
  v37 = v24;
  v30[0] = v22;
  v30[1] = 3221225472;
  v30[2] = __71__WDDataListViewController__quantityCellForTableView_dataObjectSource___block_invoke_2;
  v30[3] = &unk_24D38E1F8;
  objc_copyWeak(&v33, &location);
  v25 = v24;
  v31 = v25;
  v26 = v23;
  v32 = v26;
  objc_msgSend(v21, "loadIconForSource:productType:syncHandler:asyncHandler:", v25, v20, v34, v30);

  v27 = v32;
  v28 = v26;

  objc_destroyWeak(&v33);
  objc_destroyWeak(&location);

LABEL_8:
  return v8;
}

void __71__WDDataListViewController__quantityCellForTableView_dataObjectSource___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;

  v3 = *(void **)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 48);
  v5 = a2;
  objc_msgSend(v3, "_overridenDisplayImageForSource:", v4);
  v6 = objc_claimAutoreleasedReturnValue();
  v9 = (id)v6;
  if (v6)
    v7 = (id)v6;
  else
    v7 = v5;
  objc_msgSend(*(id *)(a1 + 32), "imageView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setImage:", v7);

}

void __71__WDDataListViewController__quantityCellForTableView_dataObjectSource___block_invoke_2(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  _QWORD block[4];
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;

  v5 = a2;
  v6 = a3;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __71__WDDataListViewController__quantityCellForTableView_dataObjectSource___block_invoke_3;
  block[3] = &unk_24D38E1D0;
  objc_copyWeak(&v14, a1 + 6);
  v10 = v5;
  v11 = a1[4];
  v12 = a1[5];
  v13 = v6;
  v7 = v6;
  v8 = v5;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

  objc_destroyWeak(&v14);
}

void __71__WDDataListViewController__quantityCellForTableView_dataObjectSource___block_invoke_3(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  objc_msgSend(WeakRetained, "_handleReturnedImage:forSource:cell:fetchError:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));

}

- (void)_handleReturnedImage:(id)a3 forSource:(id)a4 cell:(id)a5 fetchError:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  int v14;
  void *v15;
  id v16;
  void *v17;
  id v18;

  v18 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  if (v18)
  {
    if (!v12)
    {
      objc_msgSend(v11, "source");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "isEqual:", v10);

      if (v14)
      {
        -[WDDataListViewController _overridenDisplayImageForSource:](self, "_overridenDisplayImageForSource:", v10);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (v15)
          v16 = v15;
        else
          v16 = v18;
        objc_msgSend(v11, "imageView");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "setImage:", v16);

      }
    }
  }

}

- (id)_defaultCellForTableView:(id)a3 cellStyle:(int64_t)a4 indexPath:(id)a5 object:(id)a6
{
  id v9;
  id v10;
  WDDataListViewControllerCell *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v9 = a6;
  v10 = a3;
  objc_msgSend(v10, "dequeueReusableCellWithIdentifier:", CFSTR("WDDataListViewControllerCell"));
  v11 = (WDDataListViewControllerCell *)objc_claimAutoreleasedReturnValue();
  if (!v11)
    v11 = -[WDDataListViewControllerCell initWithStyle:reuseIdentifier:]([WDDataListViewControllerCell alloc], "initWithStyle:reuseIdentifier:", a4, CFSTR("WDDataListViewControllerCell"));
  -[WDDataListViewControllerDataProvider textForObject:](self->_dataProvider, "textForObject:", v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDDataListViewControllerDataProvider secondaryTextForObject:](self->_dataProvider, "secondaryTextForObject:", v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDDataListViewControllerCell titleTextLabel](v11, "titleTextLabel");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setText:", v12);

  -[WDDataListViewControllerCell subtitleTextLabel](v11, "subtitleTextLabel");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setText:", v13);

  -[WDDataListViewController _loadIconForSourceObject:onCell:ofTableView:](self, "_loadIconForSourceObject:onCell:ofTableView:", v9, v11, v10);
  return v11;
}

- (id)_overridenDisplayImageForSource:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  void *v9;
  int v10;
  __CFString *v11;
  void *v12;
  void *v13;
  id v14;

  v4 = a3;
  if (-[HKDisplayType displayTypeIdentifier](self->_displayType, "displayTypeIdentifier") == 14
    && (objc_msgSend(v4, "bundleIdentifier"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.NanoOxygenSaturation.watchkitapp")),
        v5,
        v6)
    && !self->_showOriginalAppProvenance)
  {
    objc_msgSend(v4, "_productType");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "hasPrefix:", *MEMORY[0x24BDD3318]);

    if (v10)
    {
      objc_msgSend(v4, "_productType");
      v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v11 = CFSTR("Watch");
    }
    objc_msgSend(MEMORY[0x24BE4A900], "appleDeviceIconForHardwareVersion:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v12)
    {
      v14 = v12;
    }
    else
    {
      HKDeviceImage();
      v14 = (id)objc_claimAutoreleasedReturnValue();
    }
    v7 = v14;

  }
  else if (objc_msgSend(v4, "_isBTLEServer"))
  {
    HKBluetoothIcon();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v6 = a4;
  if (!-[WDDataListViewController _hasSpinnerRowRowAtIndexPath:](self, "_hasSpinnerRowRowAtIndexPath:", v6))
  {
    -[WDDataListViewControllerDataProvider viewControllerForItemAtIndexPath:](self->_dataProvider, "viewControllerForItemAtIndexPath:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[WDDataListViewController navigationController](self, "navigationController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "pushViewController:animated:", v7, 1);

    objc_msgSend(v9, "deselectRowAtIndexPath:animated:", v6, 1);
  }

}

- (id)_sampleAtIndexPath:(id)a3
{
  WDDataListViewControllerDataProvider *dataProvider;
  id v4;
  uint64_t v5;
  uint64_t v6;

  dataProvider = self->_dataProvider;
  v4 = a3;
  v5 = objc_msgSend(v4, "row");
  v6 = objc_msgSend(v4, "section");

  return (id)-[WDDataListViewControllerDataProvider objectAtIndex:forSection:](dataProvider, "objectAtIndex:forSection:", v5, v6);
}

- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4
{
  id v5;
  char v6;

  v5 = a4;
  if (-[WDDataListViewController isEditEnabled](self, "isEditEnabled"))
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v6 = -[WDDataListViewControllerDataProvider canEditRowAtIndexPath:](self->_dataProvider, "canEditRowAtIndexPath:", v5);
    else
      v6 = 1;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  void (**v13)(_QWORD, _QWORD);
  void *v14;
  void *v15;
  int v16;
  void *v17;
  _QWORD v18[5];
  id v19;
  id v20;

  v8 = a3;
  v9 = a5;
  v10 = v9;
  if (a4 == 1)
  {
    v18[0] = MEMORY[0x24BDAC760];
    v18[1] = 3221225472;
    v18[2] = __75__WDDataListViewController_tableView_commitEditingStyle_forRowAtIndexPath___block_invoke;
    v18[3] = &unk_24D38E220;
    v18[4] = self;
    v11 = v9;
    v19 = v11;
    v12 = v8;
    v20 = v12;
    v13 = (void (**)(_QWORD, _QWORD))MEMORY[0x2199E6E80](v18);
    objc_msgSend(v12, "cellForRowAtIndexPath:", v11);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKDisplayType behavior](self->_displayType, "behavior");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "supportsAssociatedSamples");

    if (v16)
    {
      if (-[HKDisplayType displayTypeIdentifier](self->_displayType, "displayTypeIdentifier") == 79)
      {
        -[WDDataListViewController _sampleAtIndexPath:](self, "_sampleAtIndexPath:", v11);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v17, "_activityMoveMode") == 2)
          -[WDDataListViewController _deleteWorkoutSamplesConfirmationPlural:sender:deleteBlock:](self, "_deleteWorkoutSamplesConfirmationPlural:sender:deleteBlock:", 0, v14, v13);
        else
          -[WDDataListViewController _deleteAssociatedSamplesConfirmationPlural:sender:deleteBlock:](self, "_deleteAssociatedSamplesConfirmationPlural:sender:deleteBlock:", 0, v14, v13);

      }
      else
      {
        -[WDDataListViewController _deleteAssociatedSamplesConfirmationPlural:sender:deleteBlock:](self, "_deleteAssociatedSamplesConfirmationPlural:sender:deleteBlock:", 0, v14, v13);
      }
    }
    else
    {
      v13[2](v13, 2);
    }

  }
}

void __75__WDDataListViewController_tableView_commitEditingStyle_forRowAtIndexPath___block_invoke(_QWORD *a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  _QWORD v11[5];
  _QWORD v12[2];

  v12[1] = *MEMORY[0x24BDAC8D0];
  v4 = a1[4];
  v5 = a1[5];
  v6 = *(void **)(v4 + 1080);
  objc_msgSend(*(id *)(v4 + 1024), "healthStore");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __75__WDDataListViewController_tableView_commitEditingStyle_forRowAtIndexPath___block_invoke_2;
  v11[3] = &unk_24D38CFB0;
  v11[4] = a1[4];
  objc_msgSend(v6, "deleteObjectsAtIndexPath:healthStore:options:completion:", v5, v7, a2, v11);

  v10 = 0;
  objc_msgSend(*(id *)(a1[4] + 1080), "removeObjectAtIndex:forSection:sectionRemoved:", objc_msgSend((id)a1[5], "row"), objc_msgSend((id)a1[5], "section"), &v10);
  v8 = (void *)a1[6];
  if (v10)
  {
    objc_msgSend(MEMORY[0x24BDD15E0], "indexSetWithIndex:", objc_msgSend((id)a1[5], "section"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "deleteSections:withRowAnimation:", v9, 0);
  }
  else
  {
    v12[0] = a1[5];
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v12, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "deleteRowsAtIndexPaths:withRowAnimation:", v9, 0);
  }

}

void __75__WDDataListViewController_tableView_commitEditingStyle_forRowAtIndexPath___block_invoke_2(uint64_t a1, int a2, void *a3)
{
  id v5;

  v5 = a3;
  if (!a2 || (objc_msgSend(*(id *)(a1 + 32), "_dataProviderEnabled") & 1) == 0)
    objc_msgSend(*(id *)(a1 + 32), "_reloadAllData");

}

- (void)monthViewController:(id)a3 didSelectDate:(id)a4
{
  -[WDDataListViewController resetDataAndScrollToDate:](self, "resetDataAndScrollToDate:", a4);
  -[WDDataListViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v5;
  void *v7;
  UIBarButtonItem *v8;
  UIBarButtonItem *deleteAllButtonItem;
  void *v10;
  void *v11;
  UIBarButtonItem *v12;
  void *v13;
  void *v14;
  objc_super v15;

  v4 = a4;
  v5 = a3;
  if (-[WDDataListViewController isEditEnabled](self, "isEditEnabled"))
  {
    v15.receiver = self;
    v15.super_class = (Class)WDDataListViewController;
    -[WDDataListViewController setEditing:animated:](&v15, sel_setEditing_animated_, v5, v4);
    if (v5)
    {
      -[WDDataListViewController navigationItem](self, "navigationItem");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "leftBarButtonItem");
      v8 = (UIBarButtonItem *)objc_claimAutoreleasedReturnValue();
      deleteAllButtonItem = self->_deleteAllButtonItem;

      if (v8 == deleteAllButtonItem)
        return;
      -[WDDataListViewController navigationItem](self, "navigationItem");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "leftBarButtonItem");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[WDDataListViewController setLeftBarButtonItemReference:](self, "setLeftBarButtonItemReference:", v11);

      v12 = self->_deleteAllButtonItem;
      -[WDDataListViewController navigationItem](self, "navigationItem");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setLeftBarButtonItem:", v12);
    }
    else
    {
      -[WDDataListViewController leftBarButtonItemReference](self, "leftBarButtonItemReference");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[WDDataListViewController navigationItem](self, "navigationItem");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setLeftBarButtonItem:", v13);

    }
  }
}

- (void)resetDataAndScrollToDate:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  id v7;

  v7 = a3;
  -[WDDataListViewController setScrollToDate:](self, "setScrollToDate:");
  -[WDDataListViewController dataProvider](self, "dataProvider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[WDDataListViewController dataProvider](self, "dataProvider");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "viewControllerWantsDataIncludingDate:", v7);

    -[UIActivityIndicatorView startAnimating](self->_spinner, "startAnimating");
    -[WDDataListViewController _reloadAllData](self, "_reloadAllData");
  }

}

- (void)_calendarDateSelectorButtonTapped:(id)a3
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
  id v13;

  v4 = objc_alloc(MEMORY[0x24BE4A6D0]);
  -[WDProfile healthStore](self->_profile, "healthStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDProfile dateCache](self->_profile, "dateCache");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (id)objc_msgSend(v4, "initWithHealthStore:dateCache:date:", v5, v6, v7);

  -[HKDisplayType sampleType](self->_displayType, "sampleType");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setSampleType:", v8);

  -[HKDisplayType color](self->_displayType, "color");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setSampleColor:", v9);

  -[WDDataListViewController dataProvider](self, "dataProvider");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "defaultQueryPredicate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setAdditionalSamplePredicate:", v11);

  objc_msgSend(v13, "setDelegate:", self);
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE4A728]), "initWithRootViewController:", v13);
  -[WDDataListViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v12, 1, 0);

}

- (void)_deleteAllButtonTapped:(id)a3
{
  id v4;
  void *v5;
  int v6;
  WDDataListViewControllerDataProvider *v7;
  WDDataListViewControllerDataProvider *v8;
  void *v9;
  void *v10;
  int v11;
  id *v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;
  id location;

  v4 = a3;
  -[HKDisplayType behavior](self->_displayType, "behavior");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "supportsAssociatedSamples");

  objc_initWeak(&location, self);
  if (v6)
  {
    v7 = self->_dataProvider;
    v8 = v7;
    if (v7)
    {
      -[WDDataListViewControllerDataProvider samples](v7, "samples");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "allSamples");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "hk_containsObjectPassingTest:", &__block_literal_global_11);

      if (v11)
      {
        v15[0] = MEMORY[0x24BDAC760];
        v15[1] = 3221225472;
        v15[2] = __51__WDDataListViewController__deleteAllButtonTapped___block_invoke_2;
        v15[3] = &unk_24D38E288;
        v12 = &v16;
        objc_copyWeak(&v16, &location);
        -[WDDataListViewController _deleteAssociatedSamplesConfirmationPlural:sender:deleteBlock:](self, "_deleteAssociatedSamplesConfirmationPlural:sender:deleteBlock:", 1, v4, v15);
      }
      else
      {
        v13[0] = MEMORY[0x24BDAC760];
        v13[1] = 3221225472;
        v13[2] = __51__WDDataListViewController__deleteAllButtonTapped___block_invoke_3;
        v13[3] = &unk_24D38E288;
        v12 = &v14;
        objc_copyWeak(&v14, &location);
        -[WDDataListViewController _deleteWorkoutSamplesConfirmationPlural:sender:deleteBlock:](self, "_deleteWorkoutSamplesConfirmationPlural:sender:deleteBlock:", 1, v4, v13);
      }
      objc_destroyWeak(v12);
    }

  }
  else
  {
    -[WDDataListViewController presentDeleteConfirmation:](self, "presentDeleteConfirmation:", v4);
  }
  objc_destroyWeak(&location);

}

BOOL __51__WDDataListViewController__deleteAllButtonTapped___block_invoke(uint64_t a1, void *a2)
{
  return a2 && objc_msgSend(a2, "_activityMoveMode") != 2;
}

void __51__WDDataListViewController__deleteAllButtonTapped___block_invoke_2(uint64_t a1, uint64_t a2)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_deleteAllWithOptions:", a2);

}

void __51__WDDataListViewController__deleteAllButtonTapped___block_invoke_3(uint64_t a1, uint64_t a2)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_deleteAllWithOptions:", a2);

}

- (id)_deleteAllDataAlertMessage
{
  id v2;
  void *v3;
  int v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  void *v10;

  if (-[HKDisplayType displayTypeIdentifier](self->_displayType, "displayTypeIdentifier") == 173)
  {
    v2 = objc_alloc_init(MEMORY[0x24BE0A230]);
    objc_msgSend(v2, "getPreferenceFor:", *MEMORY[0x24BE0A1E0]);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "BOOLValue");

    objc_msgSend(v2, "getPreferenceFor:", *MEMORY[0x24BE0A1E8]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "BOOLValue");

    LODWORD(v5) = v4 | v6;
    WDBundle();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if ((_DWORD)v5)
      v9 = CFSTR("DELETE_ALL_HEADPHONE_DATA_CONFIRMATION_TITLE");
    else
      v9 = CFSTR("DELETE_ALL_CONFIRMATION_TITLE");
    objc_msgSend(v7, "localizedStringForKey:value:table:", v9, &stru_24D38E7C8, CFSTR("WellnessDashboard-Localizable"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    WDBundle();
    v2 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("DELETE_ALL_CONFIRMATION_TITLE"), &stru_24D38E7C8, CFSTR("WellnessDashboard-Localizable"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v10;
}

- (void)presentDeleteConfirmation:(id)a3
{
  void *v4;
  id v5;
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
  _QWORD v17[5];

  v4 = (void *)MEMORY[0x24BDF67F0];
  v5 = a3;
  -[WDDataListViewController _deleteAllDataAlertMessage](self, "_deleteAllDataAlertMessage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "alertControllerWithTitle:message:preferredStyle:", v6, 0, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "popoverPresentationController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setSourceItem:", v5);

  v9 = (void *)MEMORY[0x24BDF67E8];
  WDBundle();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("CANCEL"), &stru_24D38E7C8, CFSTR("WellnessDashboard-Localizable"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "actionWithTitle:style:handler:", v11, 0, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addAction:", v12);

  v13 = (void *)MEMORY[0x24BDF67E8];
  WDBundle();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("DELETE_ALL_BUTTON_TITLE"), &stru_24D38E7C8, CFSTR("WellnessDashboard-Localizable"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __54__WDDataListViewController_presentDeleteConfirmation___block_invoke;
  v17[3] = &unk_24D38D350;
  v17[4] = self;
  objc_msgSend(v13, "actionWithTitle:style:handler:", v15, 2, v17);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addAction:", v16);

  -[WDDataListViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v7, 1, 0);
}

uint64_t __54__WDDataListViewController_presentDeleteConfirmation___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_deleteAllWithOptions:", 2);
}

- (void)_deleteAssociatedSamplesConfirmationPlural:(BOOL)a3 sender:(id)a4 deleteBlock:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  const __CFString *v15;
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
  uint64_t v28;
  id v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  uint64_t v34;
  void *v35;
  _QWORD v37[4];
  id v38;
  _QWORD v39[4];
  id v40;

  v7 = a5;
  v8 = a4;
  WDBundle();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (a3)
  {
    objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("DELETE_ALL_ASSOCIATED_MESSAGE_PLURAL"), &stru_24D38E7C8, CFSTR("WellnessDashboard-Localizable"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    WDBundle();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("DELETE_ALL_ASSOCIATED_YES_PLURAL"), &stru_24D38E7C8, CFSTR("WellnessDashboard-Localizable"));
    v34 = objc_claimAutoreleasedReturnValue();

    WDBundle();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    v15 = CFSTR("DELETE_ALL_ASSOCIATED_NO_PLURAL");
  }
  else
  {
    objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("DELETE_ALL_ASSOCIATED_MESSAGE"), &stru_24D38E7C8, CFSTR("WellnessDashboard-Localizable"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    WDBundle();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("DELETE_ALL_ASSOCIATED_YES"), &stru_24D38E7C8, CFSTR("WellnessDashboard-Localizable"));
    v34 = objc_claimAutoreleasedReturnValue();

    WDBundle();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    v15 = CFSTR("DELETE_ALL_ASSOCIATED_NO");
  }
  objc_msgSend(v13, "localizedStringForKey:value:table:", v15, &stru_24D38E7C8, CFSTR("WellnessDashboard-Localizable"), v34);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = (void *)MEMORY[0x24BDF67F0];
  WDBundle();
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "localizedStringForKey:value:table:", CFSTR("DELETE_ALL_ASSOCIATED_TITLE"), &stru_24D38E7C8, CFSTR("WellnessDashboard-Localizable"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "alertControllerWithTitle:message:preferredStyle:", v20, v11, 0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v21, "popoverPresentationController");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setSourceItem:", v8);

  v23 = (void *)MEMORY[0x24BDF67E8];
  WDBundle();
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "localizedStringForKey:value:table:", CFSTR("CANCEL"), &stru_24D38E7C8, CFSTR("WellnessDashboard-Localizable"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "actionWithTitle:style:handler:", v25, 0, 0);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "addAction:", v26);

  v27 = (void *)MEMORY[0x24BDF67E8];
  v28 = MEMORY[0x24BDAC760];
  v39[0] = MEMORY[0x24BDAC760];
  v39[1] = 3221225472;
  v39[2] = __90__WDDataListViewController__deleteAssociatedSamplesConfirmationPlural_sender_deleteBlock___block_invoke;
  v39[3] = &unk_24D38E2B0;
  v29 = v7;
  v40 = v29;
  objc_msgSend(v27, "actionWithTitle:style:handler:", v35, 2, v39);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "addAction:", v30);

  v31 = (void *)MEMORY[0x24BDF67E8];
  v37[0] = v28;
  v37[1] = 3221225472;
  v37[2] = __90__WDDataListViewController__deleteAssociatedSamplesConfirmationPlural_sender_deleteBlock___block_invoke_2;
  v37[3] = &unk_24D38E2B0;
  v38 = v29;
  v32 = v29;
  objc_msgSend(v31, "actionWithTitle:style:handler:", v17, 0, v37);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "addAction:", v33);

  -[WDDataListViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v21, 1, 0);
}

uint64_t __90__WDDataListViewController__deleteAssociatedSamplesConfirmationPlural_sender_deleteBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __90__WDDataListViewController__deleteAssociatedSamplesConfirmationPlural_sender_deleteBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_deleteWorkoutSamplesConfirmationPlural:(BOOL)a3 sender:(id)a4 deleteBlock:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  const __CFString *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  _QWORD v29[4];
  id v30;

  v8 = a5;
  v9 = a4;
  WDBundle();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (a3)
  {
    objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("DELETE_WORKOUT_PLURAL_ALERT_TITLE_FITNESS_JR"), &stru_24D38E7C8, CFSTR("WellnessDashboard-Localizable-Tinker"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    WDBundle();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("DELETE_WORKOUT_PLURAL_ALERT_DESCRIPTION_FITNESS_JR"), &stru_24D38E7C8, CFSTR("WellnessDashboard-Localizable-Tinker"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    WDBundle();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    v17 = CFSTR("DELETE_WORKOUT_PLURAL_ALERT_YES_FITNESS_JR");
  }
  else
  {
    objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("DELETE_WORKOUT_ALERT_TITLE_FITNESS_JR"), &stru_24D38E7C8, CFSTR("WellnessDashboard-Localizable-Tinker"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    WDBundle();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "localizedStringForKey:value:table:", CFSTR("DELETE_WORKOUT_ALERT_DESCRIPTION_FITNESS_JR"), &stru_24D38E7C8, CFSTR("WellnessDashboard-Localizable-Tinker"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    WDBundle();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    v17 = CFSTR("DELETE_WORKOUT_ALERT_YES_FITNESS_JR");
  }
  objc_msgSend(v15, "localizedStringForKey:value:table:", v17, &stru_24D38E7C8, CFSTR("WellnessDashboard-Localizable-Tinker"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDF67F0], "alertControllerWithTitle:message:preferredStyle:", v12, v14, 0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "popoverPresentationController");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setSourceItem:", v9);

  v22 = (void *)MEMORY[0x24BDF67E8];
  WDBundle();
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "localizedStringForKey:value:table:", CFSTR("CANCEL"), &stru_24D38E7C8, CFSTR("WellnessDashboard-Localizable"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "actionWithTitle:style:handler:", v24, 0, 0);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "addAction:", v25);

  v26 = (void *)MEMORY[0x24BDF67E8];
  v29[0] = MEMORY[0x24BDAC760];
  v29[1] = 3221225472;
  v29[2] = __87__WDDataListViewController__deleteWorkoutSamplesConfirmationPlural_sender_deleteBlock___block_invoke;
  v29[3] = &unk_24D38E2B0;
  v30 = v8;
  v27 = v8;
  objc_msgSend(v26, "actionWithTitle:style:handler:", v19, 0, v29);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "addAction:", v28);

  -[WDDataListViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v20, 1, 0);
}

uint64_t __87__WDDataListViewController__deleteWorkoutSamplesConfirmationPlural_sender_deleteBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_deleteAllWithOptions:(unint64_t)a3
{
  unint64_t v4;
  void *v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  _QWORD v18[4];
  id v19;
  WDDataListViewController *v20;
  _QWORD v21[5];
  id v22;
  WDDataListViewController *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v4 = a3 & 2;
  -[WDDataListViewController _sampleTypesForDeleteAll](self, "_sampleTypesForDeleteAll");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 1080;
  -[WDDataListViewControllerDataProvider defaultQueryPredicate](self->_dataProvider, "defaultQueryPredicate");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    v7 = v5;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    if (v8)
    {
      v9 = v8;
      v15 = 1080;
      v16 = v5;
      v10 = *(_QWORD *)v25;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v25 != v10)
            objc_enumerationMutation(v7);
          v12 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * i);
          -[WDProfile healthStore](self->_profile, "healthStore", v15, v16);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v21[0] = MEMORY[0x24BDAC760];
          v21[1] = 3221225472;
          v21[2] = __50__WDDataListViewController__deleteAllWithOptions___block_invoke;
          v21[3] = &unk_24D38E2D8;
          v21[4] = v12;
          v22 = v17;
          v23 = self;
          objc_msgSend(v13, "deleteObjectsOfType:predicate:options:withCompletion:", v12, v22, v4, v21);

        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      }
      while (v9);
      v6 = v15;
      v5 = v16;
    }
  }
  else
  {
    -[WDProfile healthStore](self->_profile, "healthStore");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x24BDAC760];
    v18[1] = 3221225472;
    v18[2] = __50__WDDataListViewController__deleteAllWithOptions___block_invoke_415;
    v18[3] = &unk_24D38DA38;
    v19 = v5;
    v20 = self;
    objc_msgSend(v14, "deleteAllSamplesWithTypes:sourceBundleIdentifier:options:completion:", v19, 0, v4, v18);

    v7 = v19;
  }

  objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa + v6), "deleteAllData");
  -[WDDataListViewController setEditing:animated:](self, "setEditing:animated:", 0, 1);
  -[WDDataListViewController _reloadAllData](self, "_reloadAllData");

}

void __50__WDDataListViewController__deleteAllWithOptions___block_invoke(uint64_t a1, char a2, uint64_t a3, void *a4)
{
  id v6;

  v6 = a4;
  if ((a2 & 1) == 0)
  {
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3070], OS_LOG_TYPE_ERROR))
      __50__WDDataListViewController__deleteAllWithOptions___block_invoke_cold_1();
    objc_msgSend(*(id *)(a1 + 48), "_reloadAllData");
  }

}

void __50__WDDataListViewController__deleteAllWithOptions___block_invoke_415(uint64_t a1, char a2, void *a3)
{
  id v5;

  v5 = a3;
  if ((a2 & 1) == 0)
  {
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3070], OS_LOG_TYPE_ERROR))
      __50__WDDataListViewController__deleteAllWithOptions___block_invoke_415_cold_1();
    objc_msgSend(*(id *)(a1 + 40), "_reloadAllData");
  }

}

- (id)_rightBarButtonItems
{
  void *v3;
  void *v4;
  char v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void **v11;
  void *v12;
  void *v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x24BDAC8D0];
  -[WDDataListViewController dataProvider](self, "dataProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[WDDataListViewController dataProvider](self, "dataProvider");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "calendarDateSelectorVisible");

    if ((v5 & 1) != 0)
    {
      v6 = objc_alloc(MEMORY[0x24BDF6860]);
      WDBundle();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("CALENDAR"), &stru_24D38E7C8, CFSTR("WellnessDashboard-Localizable"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (void *)objc_msgSend(v6, "initWithTitle:style:target:action:", v8, 0, self, sel__calendarDateSelectorButtonTapped_);

      objc_msgSend(v9, "setEnabled:", -[WDDataListViewController _dataProviderEnabled](self, "_dataProviderEnabled"));
      objc_msgSend(MEMORY[0x24BDD17C8], "healthAccessibilityIdentifier:suffix:", 0, CFSTR("DataList.Calendar"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setAccessibilityIdentifier:", v10);

      v14 = v9;
      v11 = &v14;
LABEL_7:
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v11, 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      return v12;
    }
  }
  else
  {

  }
  if (-[WDDataListViewController isEditEnabled](self, "isEditEnabled"))
  {
    -[WDDataListViewController editButtonItem](self, "editButtonItem");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = v9;
    v11 = (void **)v15;
    goto LABEL_7;
  }
  return MEMORY[0x24BDBD1A8];
}

- (void)_updateRightBarButtonItems
{
  void *v3;
  id v4;

  -[WDDataListViewController _rightBarButtonItems](self, "_rightBarButtonItems");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[WDDataListViewController navigationItem](self, "navigationItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setRightBarButtonItems:", v4);

}

- (BOOL)_shouldShowSpinnerRowInSection:(int64_t)a3
{
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  char v10;
  void *v11;
  int v12;

  -[WDDataListViewController dataProvider](self, "dataProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "numberOfSections") - 1;

  if (v6 != a3)
    goto LABEL_5;
  -[WDDataListViewController dataProvider](self, "dataProvider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "numberOfObjectsForSection:", a3);

  if (!v8)
    goto LABEL_5;
  -[WDDataListViewController dataProvider](self, "dataProvider");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_opt_respondsToSelector();

  if ((v10 & 1) != 0)
  {
    -[WDDataListViewController dataProvider](self, "dataProvider");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "hasCompleteDataSet") ^ 1;

  }
  else
  {
LABEL_5:
    LOBYTE(v12) = 0;
  }
  return v12;
}

- (BOOL)_hasSpinnerRowRowAtIndexPath:(id)a3
{
  id v4;
  unint64_t v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  v5 = objc_msgSend(v4, "row");
  -[WDDataListViewController dataProvider](self, "dataProvider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "section");

  LOBYTE(v4) = v5 >= objc_msgSend(v6, "numberOfObjectsForSection:", v7);
  return (char)v4;
}

- (void)_tapGestureRecognizerAction:(id)a3
{
  void *v4;
  id v5;

  self->_showOriginalAppProvenance ^= 1u;
  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBool:forKey:", self->_showOriginalAppProvenance, CFSTR("ShowOriginalAppProvenance"));

  -[WDDataListViewController tableView](self, "tableView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "reloadData");

}

- (void)_updateActivityForViewDidAppear
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  -[WDProfile userActivityManager](self->_profile, "userActivityManager");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x24BDD17C8];
  WDBundle();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("SHOW_ALL_DATA_UA_FORMAT"), &stru_24D38E7C8, CFSTR("WellnessDashboard-Localizable"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKDisplayType localization](self->_displayType, "localization");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "displayName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "changeActivityForResponder:activityDictionary:title:keywords:", self, 0, v8, 0);
}

- (void)viewControllerWillEnterAdaptiveModal
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t);
  void *v12;
  id v13;
  id location;

  objc_initWeak(&location, self);
  v3 = objc_alloc(MEMORY[0x24BDF6860]);
  v4 = (void *)MEMORY[0x24BDF67B8];
  v9 = MEMORY[0x24BDAC760];
  v10 = 3221225472;
  v11 = __64__WDDataListViewController_viewControllerWillEnterAdaptiveModal__block_invoke;
  v12 = &unk_24D38D0A0;
  objc_copyWeak(&v13, &location);
  objc_msgSend(v4, "actionWithHandler:", &v9);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithBarButtonSystemItem:primaryAction:", 0, v5, v9, v10, v11, v12);

  objc_msgSend(MEMORY[0x24BDD17C8], "healthAccessibilityIdentifier:suffix:", 0, CFSTR("DataListViewController.DoneButton"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAccessibilityIdentifier:", v7);

  if (-[WDDataListViewController isEditing](self, "isEditing"))
  {
    -[WDDataListViewController setLeftBarButtonItemReference:](self, "setLeftBarButtonItemReference:", v6);
  }
  else
  {
    -[WDDataListViewController navigationItem](self, "navigationItem");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setLeftBarButtonItem:", v6);

  }
  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

void __64__WDDataListViewController_viewControllerWillEnterAdaptiveModal__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "dismissViewControllerAnimated:completion:", 1, 0);

}

- (void)viewControllerDidLeaveAdaptiveModal
{
  id v3;

  if (-[WDDataListViewController isEditing](self, "isEditing"))
  {
    -[WDDataListViewController setLeftBarButtonItemReference:](self, "setLeftBarButtonItemReference:", 0);
  }
  else
  {
    -[WDDataListViewController navigationItem](self, "navigationItem");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setLeftBarButtonItem:", 0);

  }
}

- (WDDataListViewControllerDataProvider)dataProvider
{
  return self->_dataProvider;
}

- (HKDisplayType)displayType
{
  return self->_displayType;
}

- (NSDate)scrollToDate
{
  return self->_scrollToDate;
}

- (void)setScrollToDate:(id)a3
{
  objc_storeStrong((id *)&self->_scrollToDate, a3);
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
  objc_storeStrong((id *)&self->_scrollToDate, 0);
  objc_storeStrong((id *)&self->_displayType, 0);
  objc_storeStrong((id *)&self->_dataProvider, 0);
  objc_storeStrong((id *)&self->_navigationBarTapGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_noContentView, 0);
  objc_storeStrong((id *)&self->_spinner, 0);
  objc_storeStrong((id *)&self->_deleteAllButtonItem, 0);
  objc_storeStrong((id *)&self->_profile, 0);
}

void __50__WDDataListViewController__deleteAllWithOptions___block_invoke_cold_1()
{
  uint64_t v0;
  __int16 v1;
  uint64_t v2;
  os_log_t v3;
  uint8_t v4[14];
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_0_2();
  v5 = v0;
  v6 = v1;
  v7 = v2;
  _os_log_error_impl(&dword_215814000, v3, OS_LOG_TYPE_ERROR, "Error deleting samples of type %{public}@ with predicate %{public}@: %{public}@", v4, 0x20u);
}

void __50__WDDataListViewController__deleteAllWithOptions___block_invoke_415_cold_1()
{
  uint64_t v0;
  os_log_t v1;
  uint8_t v2[14];
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_0_2();
  v3 = v0;
  _os_log_error_impl(&dword_215814000, v1, OS_LOG_TYPE_ERROR, "Error deleting samples of types %{public}@: %{public}@", v2, 0x16u);
}

@end
