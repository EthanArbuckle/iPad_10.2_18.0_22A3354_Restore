@implementation WDStoredDataByCategoryViewController

- (WDStoredDataByCategoryViewController)init
{
  return -[HKTableViewController initWithUsingInsetStyling:](self, "initWithUsingInsetStyling:", 1);
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  HKHealthServicesManager *v12;
  HKHealthServicesManager *healthServicesManager;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(uint64_t, uint64_t, void *, void *);
  void *v22;
  id v23;
  id location;
  objc_super v25;

  v25.receiver = self;
  v25.super_class = (Class)WDStoredDataByCategoryViewController;
  -[HKTableViewController viewDidLoad](&v25, sel_viewDidLoad);
  -[WDStoredDataByCategoryViewController storedDataDisplayName](self, "storedDataDisplayName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDStoredDataByCategoryViewController setTitle:](self, "setTitle:", v3);

  -[WDStoredDataByCategoryViewController bodyFont](self, "bodyFont");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_scaledValueForValue:", *MEMORY[0x24BE4A140]);
  v6 = v5;

  -[WDStoredDataByCategoryViewController tableView](self, "tableView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setEstimatedRowHeight:", v6);

  -[WDStoredDataByCategoryViewController tableView](self, "tableView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setEstimatedSectionHeaderHeight:", v6);

  objc_initWeak(&location, self);
  v9 = objc_alloc(MEMORY[0x24BDD3C30]);
  -[WDStoredDataByCategoryViewController profile](self, "profile");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "healthStore");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (HKHealthServicesManager *)objc_msgSend(v9, "initWithHealthStore:", v11);
  healthServicesManager = self->_healthServicesManager;
  self->_healthServicesManager = v12;

  v14 = objc_alloc(MEMORY[0x24BDD4240]);
  -[WDStoredDataByCategoryViewController storedDataPredicate](self, "storedDataPredicate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = MEMORY[0x24BDAC760];
  v20 = 3221225472;
  v21 = __51__WDStoredDataByCategoryViewController_viewDidLoad__block_invoke;
  v22 = &unk_24D38E350;
  objc_copyWeak(&v23, &location);
  v16 = (void *)objc_msgSend(v14, "initWithPredicate:resultsHandler:", v15, &v19);

  -[WDStoredDataByCategoryViewController profile](self, "profile", v19, v20, v21, v22);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "healthStore");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "executeQuery:", v16);

  objc_destroyWeak(&v23);
  objc_destroyWeak(&location);
}

void __51__WDStoredDataByCategoryViewController_viewDidLoad__block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD block[4];
  id v11;
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __51__WDStoredDataByCategoryViewController_viewDidLoad__block_invoke_2;
  block[3] = &unk_24D38E328;
  v11 = v7;
  v8 = v7;
  objc_copyWeak(&v13, (id *)(a1 + 32));
  v12 = v6;
  v9 = v6;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

  objc_destroyWeak(&v13);
}

void __51__WDStoredDataByCategoryViewController_viewDidLoad__block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id WeakRetained;

  v1 = a1 + 32;
  if (*(_QWORD *)(a1 + 32))
  {
    _HKInitializeLogging();
    v2 = *MEMORY[0x24BDD3070];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3070], OS_LOG_TYPE_ERROR))
      __51__WDStoredDataByCategoryViewController_viewDidLoad__block_invoke_2_cold_1(v1, v2, v3, v4, v5, v6, v7, v8);
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    objc_msgSend(WeakRetained, "handleSamplesQueryResults:", *(_QWORD *)(a1 + 40));

  }
}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)WDStoredDataByCategoryViewController;
  -[WDStoredDataByCategoryViewController viewWillAppear:](&v4, sel_viewWillAppear_, a3);
  -[WDStoredDataByCategoryViewController fetchEnabledStatusForPeripheral](self, "fetchEnabledStatusForPeripheral");
}

- (void)_displayTypeStringsChanged:(id)a3
{
  id v3;

  -[WDStoredDataByCategoryViewController tableView](self, "tableView", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "reloadData");

}

- (void)handleSamplesQueryResults:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  -[WDStoredDataByCategoryViewController setCapturedSampleTypes:](self, "setCapturedSampleTypes:", a3);
  -[WDStoredDataByCategoryViewController capturedSampleTypes](self, "capturedSampleTypes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDStoredDataByCategoryViewController reduceCategoriesForCapturedSampleTypes:](self, "reduceCategoriesForCapturedSampleTypes:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDStoredDataByCategoryViewController setSavedCategories:](self, "setSavedCategories:", v5);

  -[WDStoredDataByCategoryViewController setQueryReturned:](self, "setQueryReturned:", 1);
  -[WDStoredDataByCategoryViewController tableView](self, "tableView");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "reloadData");

}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  UIFont *bodyFont;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WDStoredDataByCategoryViewController;
  -[WDStoredDataByCategoryViewController traitCollectionDidChange:](&v10, sel_traitCollectionDidChange_, v4);
  if (v4)
  {
    -[WDStoredDataByCategoryViewController traitCollection](self, "traitCollection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "preferredContentSizeCategory");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "preferredContentSizeCategory");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "isEqualToString:", v7);

    if ((v8 & 1) == 0)
    {
      bodyFont = self->_bodyFont;
      self->_bodyFont = 0;

    }
  }

}

- (id)reduceCategoriesForCapturedSampleTypes:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  WDStoredDataCategory *v24;
  uint64_t v25;
  uint64_t j;
  void *v27;
  void *v28;
  WDStoredDataCategory *v29;
  void *v30;
  id obj;
  uint64_t v33;
  uint64_t v35;
  uint64_t v36;
  id v37;
  uint64_t v38;
  id v39;
  id v40;
  uint64_t v41;
  uint64_t v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  _BYTE v59[128];
  _BYTE v60[128];
  _BYTE v61[128];
  _BYTE v62[128];
  uint64_t v63;

  v63 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v40 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v55 = 0u;
  v56 = 0u;
  v57 = 0u;
  v58 = 0u;
  objc_msgSend(MEMORY[0x24BE4A5C0], "sortedCategories");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v35 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v55, v62, 16);
  if (v35)
  {
    v33 = *(_QWORD *)v56;
    v37 = v3;
    do
    {
      v4 = 0;
      do
      {
        if (*(_QWORD *)v56 != v33)
          objc_enumerationMutation(obj);
        v36 = v4;
        v5 = *(void **)(*((_QWORD *)&v55 + 1) + 8 * v4);
        v51 = 0u;
        v52 = 0u;
        v53 = 0u;
        v54 = 0u;
        v6 = (void *)MEMORY[0x24BE4A5D8];
        -[WDStoredDataByCategoryViewController profile](self, "profile");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "healthStore");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "sharedInstanceForHealthStore:", v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "displayTypesForCategoryIdentifier:", objc_msgSend(v5, "categoryID"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        v39 = v10;
        v41 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v51, v61, 16);
        if (v41)
        {
          v11 = *(_QWORD *)v52;
          v38 = *(_QWORD *)v52;
          do
          {
            v12 = 0;
            do
            {
              if (*(_QWORD *)v52 != v11)
                objc_enumerationMutation(v39);
              v42 = v12;
              v13 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * v12);
              v47 = 0u;
              v48 = 0u;
              v49 = 0u;
              v50 = 0u;
              v14 = v3;
              v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v47, v60, 16);
              if (!v15)
                goto LABEL_34;
              v16 = v15;
              v17 = *(_QWORD *)v48;
              while (2)
              {
                for (i = 0; i != v16; ++i)
                {
                  if (*(_QWORD *)v48 != v17)
                    objc_enumerationMutation(v14);
                  v19 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * i);
                  objc_msgSend(v13, "sampleType");
                  v20 = (void *)objc_claimAutoreleasedReturnValue();

                  if (v19 == v20)
                  {
                    v45 = 0u;
                    v46 = 0u;
                    v43 = 0u;
                    v44 = 0u;
                    v21 = v40;
                    v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v43, v59, 16);
                    if (v22)
                    {
                      v23 = v22;
                      v24 = 0;
                      v25 = *(_QWORD *)v44;
                      do
                      {
                        for (j = 0; j != v23; ++j)
                        {
                          if (*(_QWORD *)v44 != v25)
                            objc_enumerationMutation(v21);
                          v27 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * j);
                          objc_msgSend(v27, "category");
                          v28 = (void *)objc_claimAutoreleasedReturnValue();

                          if (v28 == v5)
                          {
                            v29 = v27;

                            v24 = v29;
                          }
                        }
                        v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v43, v59, 16);
                      }
                      while (v23);

                      v3 = v37;
                      v11 = v38;
                      if (!v24)
                      {
LABEL_32:
                        v24 = objc_alloc_init(WDStoredDataCategory);
                        -[WDStoredDataCategory setCategory:](v24, "setCategory:", v5);
                        objc_msgSend(v21, "addObject:", v24);
                      }
                      -[WDStoredDataCategory displayTypes](v24, "displayTypes");
                      v30 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v30, "addObject:", v13);

                      goto LABEL_34;
                    }

                    goto LABEL_32;
                  }
                }
                v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v47, v60, 16);
                if (v16)
                  continue;
                break;
              }
LABEL_34:

              v12 = v42 + 1;
            }
            while (v42 + 1 != v41);
            v41 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v51, v61, 16);
          }
          while (v41);
        }

        v4 = v36 + 1;
      }
      while (v36 + 1 != v35);
      v35 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v55, v62, 16);
    }
    while (v35);
  }

  return v40;
}

- (void)presentDeleteConfirmation
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
  _QWORD v18[5];

  v3 = (void *)MEMORY[0x24BDF67F0];
  v4 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("PERMENANTLY_DELETE_ALL_DATA_FROM_%@"), &stru_24D38E7C8, CFSTR("HealthUI-Localizable"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDStoredDataByCategoryViewController storedDataDisplayName](self, "storedDataDisplayName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "alertControllerWithTitle:message:preferredStyle:", v8, 0, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)MEMORY[0x24BDF67E8];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("PERMENANTLY_DELETE_ALL_DATA_DELETE"), &stru_24D38E7C8, CFSTR("HealthUI-Localizable"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __65__WDStoredDataByCategoryViewController_presentDeleteConfirmation__block_invoke;
  v18[3] = &unk_24D38D350;
  v18[4] = self;
  objc_msgSend(v10, "actionWithTitle:style:handler:", v12, 2, v18);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addAction:", v13);

  v14 = (void *)MEMORY[0x24BDF67E8];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("PERMENANTLY_DELETE_ALL_DATA_CANCEL"), &stru_24D38E7C8, CFSTR("HealthUI-Localizable"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "actionWithTitle:style:handler:", v16, 0, 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addAction:", v17);

  -[WDStoredDataByCategoryViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v9, 1, 0);
}

uint64_t __65__WDStoredDataByCategoryViewController_presentDeleteConfirmation__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "navigationController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (id)objc_msgSend(v2, "popViewControllerAnimated:", 1);

  return objc_msgSend(*(id *)(a1 + 32), "deleteAllStoredData");
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

- (void)fetchEnabledStatusForPeripheral
{
  HKHealthServicesManager *healthServicesManager;
  NSUUID *deviceIdentifier;
  _QWORD v5[5];

  if (-[WDStoredDataByCategoryViewController isBluetoothDevice](self, "isBluetoothDevice"))
  {
    healthServicesManager = self->_healthServicesManager;
    deviceIdentifier = self->_deviceIdentifier;
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = __71__WDStoredDataByCategoryViewController_fetchEnabledStatusForPeripheral__block_invoke;
    v5[3] = &unk_24D38CFB0;
    v5[4] = self;
    -[HKHealthServicesManager getEnabledStatusForPeripheral:withCompletion:](healthServicesManager, "getEnabledStatusForPeripheral:withCompletion:", deviceIdentifier, v5);
  }
}

void __71__WDStoredDataByCategoryViewController_fetchEnabledStatusForPeripheral__block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char v13;
  _QWORD block[5];

  v5 = a3;
  if (v5)
  {
    _HKInitializeLogging();
    v6 = *MEMORY[0x24BDD2FE8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FE8], OS_LOG_TYPE_ERROR))
      __71__WDStoredDataByCategoryViewController_fetchEnabledStatusForPeripheral__block_invoke_cold_1((uint64_t)v5, v6, v7, v8, v9, v10, v11, v12);
  }
  if (v5)
    v13 = a2;
  else
    v13 = 1;
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 1033) = v13;
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 1032) = a2;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __71__WDStoredDataByCategoryViewController_fetchEnabledStatusForPeripheral__block_invoke_245;
  block[3] = &unk_24D38D000;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

void __71__WDStoredDataByCategoryViewController_fetchEnabledStatusForPeripheral__block_invoke_245(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "tableView");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "reloadData");

}

- (int64_t)firstSectionWithData
{
  return -[WDStoredDataByCategoryViewController isBluetoothDevice](self, "isBluetoothDevice");
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;

  if (!-[WDStoredDataByCategoryViewController queryReturned](self, "queryReturned", a3)
    && -[WDStoredDataByCategoryViewController isBluetoothDevice](self, "isBluetoothDevice"))
  {
    return 2;
  }
  if (!-[WDStoredDataByCategoryViewController queryReturned](self, "queryReturned"))
    return 1;
  -[WDStoredDataByCategoryViewController savedCategories](self, "savedCategories");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6)
  {
    -[WDStoredDataByCategoryViewController savedCategories](self, "savedCategories");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "count");

  }
  else
  {
    v8 = 1;
  }
  v9 = v8 + -[WDStoredDataByCategoryViewController isBluetoothDevice](self, "isBluetoothDevice");
  return v9
       + -[WDStoredDataByCategoryViewController shouldShowDeleteAllDataButton](self, "shouldShowDeleteAllDataButton");
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  BOOL v6;
  void *v7;
  unint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  int64_t v12;

  v6 = -[WDStoredDataByCategoryViewController isBluetoothDevice](self, "isBluetoothDevice", a3);
  if (!a4 && v6)
    return 1;
  -[WDStoredDataByCategoryViewController savedCategories](self, "savedCategories");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  if (v8 <= a4)
    return 1;
  -[WDStoredDataByCategoryViewController savedCategories](self, "savedCategories");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectAtIndexedSubscript:", a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "displayTypes");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "count");

  return v12;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  WDStoredDataCategoryTableViewCell *v9;
  _BOOL4 v10;
  unint64_t v11;
  void *v12;
  unint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
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

  v6 = a3;
  v7 = a4;
  if (!-[WDStoredDataByCategoryViewController isBluetoothDevice](self, "isBluetoothDevice")
    || objc_msgSend(v7, "section"))
  {
    if (-[WDStoredDataByCategoryViewController queryReturned](self, "queryReturned")
      || (v8 = objc_msgSend(v7, "section"),
          v8 != -[WDStoredDataByCategoryViewController firstSectionWithData](self, "firstSectionWithData")))
    {
      v10 = -[WDStoredDataByCategoryViewController isBluetoothDevice](self, "isBluetoothDevice");
      v11 = objc_msgSend(v7, "section") - v10;
      -[WDStoredDataByCategoryViewController savedCategories](self, "savedCategories");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "count");

      if (v13 > v11)
      {
        objc_msgSend(v6, "dequeueReusableCellWithIdentifier:", CFSTR("WDStoredDataByCategoryTableViewCell"));
        v9 = (WDStoredDataCategoryTableViewCell *)objc_claimAutoreleasedReturnValue();
        if (!v9)
          v9 = -[WDStoredDataCategoryTableViewCell initWithStyle:reuseIdentifier:]([WDStoredDataCategoryTableViewCell alloc], "initWithStyle:reuseIdentifier:", 0, CFSTR("WDStoredDataByCategoryTableViewCell"));
        -[WDStoredDataByCategoryViewController bodyFont](self, "bodyFont");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[WDStoredDataCategoryTableViewCell textLabel](v9, "textLabel");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "setFont:", v14);

        -[WDStoredDataCategoryTableViewCell textLabel](v9, "textLabel");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v17) = 1055286886;
        objc_msgSend(v16, "_setHyphenationFactor:", v17);

        -[WDStoredDataCategoryTableViewCell setAccessoryType:](v9, "setAccessoryType:", 1);
        -[WDStoredDataByCategoryViewController savedCategories](self, "savedCategories");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "objectAtIndexedSubscript:", v11);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "displayTypes");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "objectAtIndexedSubscript:", objc_msgSend(v7, "row"));
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        -[WDStoredDataCategoryTableViewCell setDisplayType:](v9, "setDisplayType:", v21);

        goto LABEL_23;
      }
      v22 = objc_msgSend(v7, "section");
      if (v22 == -[WDStoredDataByCategoryViewController firstSectionWithData](self, "firstSectionWithData"))
      {
        objc_msgSend(v6, "dequeueReusableCellWithIdentifier:", CFSTR("WDStoredDataByCategoryTableViewEmptyCell"));
        v9 = (WDStoredDataCategoryTableViewCell *)objc_claimAutoreleasedReturnValue();
        if (!v9)
          v9 = (WDStoredDataCategoryTableViewCell *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6E60]), "initWithStyle:reuseIdentifier:", 0, CFSTR("WDStoredDataByCategoryTableViewEmptyCell"));
        -[WDStoredDataCategoryTableViewCell setSelectionStyle:](v9, "setSelectionStyle:", 0);
        objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "localizedStringForKey:value:table:", CFSTR("NO_DATA_FOUND"), &stru_24D38E7C8, CFSTR("HealthUI-Localizable"));
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        -[WDStoredDataCategoryTableViewCell textLabel](v9, "textLabel");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "setText:", v24);

        objc_msgSend(MEMORY[0x24BDF6950], "lightGrayColor");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        -[WDStoredDataCategoryTableViewCell textLabel](v9, "textLabel");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "setTextColor:", v26);

      }
      else
      {
        objc_msgSend(v6, "dequeueReusableCellWithIdentifier:", CFSTR("WDStoredDataByCategoryTableViewDeleteAllCell"));
        v9 = (WDStoredDataCategoryTableViewCell *)objc_claimAutoreleasedReturnValue();
        if (!v9)
          v9 = (WDStoredDataCategoryTableViewCell *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6E60]), "initWithStyle:reuseIdentifier:", 0, CFSTR("WDStoredDataByCategoryTableViewDeleteAllCell"));
        objc_msgSend(MEMORY[0x24BDF6950], "systemRedColor");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        -[WDStoredDataCategoryTableViewCell textLabel](v9, "textLabel");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "setTextColor:", v31);

        v33 = (void *)MEMORY[0x24BDD17C8];
        objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "localizedStringForKey:value:table:", CFSTR("DELETE_ALL_DATA_FOR_SOURCE_%@"), &stru_24D38E7C8, CFSTR("HealthUI-Localizable"));
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        -[WDStoredDataByCategoryViewController storedDataDisplayName](self, "storedDataDisplayName");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "stringWithFormat:", v35, v36);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        -[WDStoredDataCategoryTableViewCell textLabel](v9, "textLabel");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "setText:", v37);

        -[WDStoredDataCategoryTableViewCell textLabel](v9, "textLabel");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "setNumberOfLines:", 0);
      }

    }
    else
    {
      objc_msgSend(v6, "dequeueReusableCellWithIdentifier:", CFSTR("WDStoredDataByCategoryTableViewWaitingCellIdentifier"));
      v9 = (WDStoredDataCategoryTableViewCell *)objc_claimAutoreleasedReturnValue();
      if (!v9)
        v9 = -[WDSpinnerTableViewCell initWithStyle:reuseIdentifier:]([WDSpinnerTableViewCell alloc], "initWithStyle:reuseIdentifier:", 0, CFSTR("WDStoredDataByCategoryTableViewWaitingCellIdentifier"));
    }
    -[WDStoredDataByCategoryViewController bodyFont](self, "bodyFont");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[WDStoredDataCategoryTableViewCell textLabel](v9, "textLabel");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setFont:", v18);
LABEL_23:

    goto LABEL_24;
  }
  -[WDStoredDataByCategoryViewController tableView](self, "tableView");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "dequeueReusableCellWithIdentifier:", CFSTR("WDStoredDataByCategoryTableViewDeviceSourceKillSwitch"));
  v9 = (WDStoredDataCategoryTableViewCell *)objc_claimAutoreleasedReturnValue();

  if (!v9)
    v9 = (WDStoredDataCategoryTableViewCell *)objc_msgSend(objc_alloc(MEMORY[0x24BE4A8A8]), "initWithStyle:reuseIdentifier:", 0, CFSTR("WDStoredDataByCategoryTableViewDeviceSourceKillSwitch"));
  -[WDStoredDataCategoryTableViewCell setDelegate:](v9, "setDelegate:", self);
  -[WDStoredDataCategoryTableViewCell setOn:](v9, "setOn:", self->_deviceEnabled);
  objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "localizedStringForKey:value:table:", CFSTR("UPDATE_HEALTH_DATA"), &stru_24D38E7C8, CFSTR("HealthUI-Localizable"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDStoredDataCategoryTableViewCell setDisplayText:](v9, "setDisplayText:", v30);

  -[WDStoredDataCategoryTableViewCell setEnabled:](v9, "setEnabled:", self->_deviceFound);
LABEL_24:

  return v9;
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  return *MEMORY[0x24BDF7DE0];
}

- (void)switchCellValueChanged:(id)a3 value:(BOOL)a4
{
  id v5;
  uint64_t v6;
  HKHealthServicesManager *healthServicesManager;
  NSUUID *deviceIdentifier;
  _QWORD v9[4];
  id v10;
  char v11;
  id location;

  v5 = a3;
  v6 = objc_msgSend(v5, "isOn");
  objc_initWeak(&location, self);
  healthServicesManager = self->_healthServicesManager;
  deviceIdentifier = self->_deviceIdentifier;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __69__WDStoredDataByCategoryViewController_switchCellValueChanged_value___block_invoke;
  v9[3] = &unk_24D38E378;
  objc_copyWeak(&v10, &location);
  v11 = v6;
  -[HKHealthServicesManager setEnabledStatus:forPeripheral:withCompletion:](healthServicesManager, "setEnabledStatus:forPeripheral:withCompletion:", v6, deviceIdentifier, v9);
  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);

}

void __69__WDStoredDataByCategoryViewController_switchCellValueChanged_value___block_invoke(uint64_t a1, int a2)
{
  id WeakRetained;
  void *v5;
  void *v6;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    if (a2)
    {
      *((_BYTE *)WeakRetained + 1032) = *(_BYTE *)(a1 + 40);
    }
    else
    {
      _HKInitializeLogging();
      v6 = (void *)*MEMORY[0x24BDD3070];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3070], OS_LOG_TYPE_ERROR))
        __69__WDStoredDataByCategoryViewController_switchCellValueChanged_value___block_invoke_cold_1(v6, v5, a1);
    }
  }

}

- (void)_displayGuestModeAlertWithCompletion:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  _QWORD v16[4];
  id v17;

  v3 = a3;
  v4 = (void *)MEMORY[0x24BDF67F0];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("GUEST_MODE_CHANGE_AUTHORIZATION_TITLE"), &stru_24D38E7C8, CFSTR("HealthUI-Localizable"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("GUEST_MODE_CHANGE_AUTHORIZATION_DESCRIPTION"), &stru_24D38E7C8, CFSTR("HealthUI-Localizable"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "alertControllerWithTitle:message:preferredStyle:", v6, v8, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)MEMORY[0x24BDF67E8];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("SHARE_ALERT_OK"), &stru_24D38E7C8, CFSTR("HealthUI-Localizable"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __77__WDStoredDataByCategoryViewController__displayGuestModeAlertWithCompletion___block_invoke;
  v16[3] = &unk_24D38E2B0;
  v17 = v3;
  v13 = v3;
  objc_msgSend(v10, "actionWithTitle:style:handler:", v12, 0, v16);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "addAction:", v14);
  -[WDStoredDataByCategoryViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v9, 1, 0);

}

uint64_t __77__WDStoredDataByCategoryViewController__displayGuestModeAlertWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  BOOL v6;
  unint64_t v7;
  void *v8;
  unint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  __CFString *v13;

  if (-[WDStoredDataByCategoryViewController queryReturned](self, "queryReturned", a3))
  {
    v6 = -[WDStoredDataByCategoryViewController isBluetoothDevice](self, "isBluetoothDevice");
    if (!a4 && v6
      || (v7 = a4 - -[WDStoredDataByCategoryViewController isBluetoothDevice](self, "isBluetoothDevice"),
          -[WDStoredDataByCategoryViewController savedCategories](self, "savedCategories"),
          v8 = (void *)objc_claimAutoreleasedReturnValue(),
          v9 = objc_msgSend(v8, "count"),
          v8,
          v9 <= v7))
    {
      v13 = 0;
    }
    else
    {
      -[WDStoredDataByCategoryViewController savedCategories](self, "savedCategories");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "objectAtIndexedSubscript:", v7);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "category");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "displayName");
      v13 = (__CFString *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v13 = CFSTR(" ");
  }
  return v13;
}

- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4
{
  id v6;
  void *v7;
  WDStoredDataByCategoryViewController *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v15;
  uint64_t v16;

  v6 = a3;
  if (objc_msgSend(MEMORY[0x24BDD4198], "isAppleInternalInstall")
    && objc_msgSend(v6, "numberOfSections") - 1 == a4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = (void *)MEMORY[0x24BDD17C8];
      v8 = self;
      -[WDStoredDataByCategoryViewController source](v8, "source");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_7:
      v10 = v9;
      objc_msgSend(v9, "description");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "stringWithFormat:", CFSTR("INTERNAL ONLY: %@, %@, isBluetoothDevice:%d"), v8, v11, -[WDStoredDataByCategoryViewController isBluetoothDevice](v8, "isBluetoothDevice"));
      goto LABEL_12;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = (void *)MEMORY[0x24BDD17C8];
      v8 = self;
      -[WDStoredDataByCategoryViewController device](v8, "device");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    }
  }
  v12 = 0;
  if (-[WDStoredDataByCategoryViewController isBluetoothDevice](self, "isBluetoothDevice") && !a4)
  {
    if (!self->_deviceFound)
    {
      objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("DEVICE_NOT_PAIRED"), &stru_24D38E7C8, CFSTR("HealthUI-Localizable"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_14;
    }
    v13 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("ALLOW_DEVICE_DATA_UPDATES"), &stru_24D38E7C8, CFSTR("HealthUI-Localizable"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[WDStoredDataByCategoryViewController title](self, "title");
    v8 = (WDStoredDataByCategoryViewController *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "stringWithFormat:", v11, v8, v15, v16);
LABEL_12:
    v12 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_14:
  }

  return v12;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  int v11;
  id v12;

  v12 = a3;
  v6 = a4;
  objc_msgSend(v12, "cellForRowAtIndexPath:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "reuseIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("WDStoredDataByCategoryTableViewCell"));

  if (v9)
  {
    -[WDStoredDataByCategoryViewController selectSourceStoredDataTableViewCell:](self, "selectSourceStoredDataTableViewCell:", v7);
  }
  else
  {
    objc_msgSend(v7, "reuseIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "isEqualToString:", CFSTR("WDStoredDataByCategoryTableViewDeleteAllCell"));

    if (v11)
    {
      -[WDStoredDataByCategoryViewController presentDeleteConfirmation](self, "presentDeleteConfirmation");
      objc_msgSend(v12, "deselectRowAtIndexPath:animated:", v6, 1);
    }
  }

}

- (void)selectSourceStoredDataTableViewCell:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(a3, "displayType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDStoredDataByCategoryViewController _makeDataListViewControllerForDisplayType:](self, "_makeDataListViewControllerForDisplayType:", v4);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  -[WDStoredDataByCategoryViewController navigationController](self, "navigationController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "pushViewController:animated:", v6, 1);

}

- (id)_makeDataListViewControllerForDisplayType:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  WDDataListViewController *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  WDDataListViewController *v15;
  void *v16;

  v4 = a3;
  -[WDProfile healthStore](self->_profile, "healthStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDStoredDataByCategoryViewController storedDataPredicate](self, "storedDataPredicate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[HBXHealthAppPluginFactory makeDataListViewControllerForHealthStore:displayType:predicate:](HBXHealthAppPluginFactory, "makeDataListViewControllerForHealthStore:displayType:predicate:", v5, v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = v7;
  }
  else
  {
    -[WDStoredDataByCategoryViewController profile](self, "profile");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[WDStoredDataByCategoryViewController profile](self, "profile");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "unitController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "presentation");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "wd_listViewControllerDataProviderWithProfile:unitController:isHierarchical:", v9, v11, objc_msgSend(v12, "showAppDataHierarchically"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    -[WDStoredDataByCategoryViewController storedDataPredicate](self, "storedDataPredicate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setDefaultQueryPredicate:", v14);

    if (objc_msgSend(v4, "displayTypeIdentifier") == 298 || objc_msgSend(v4, "displayTypeIdentifier") == 304)
      objc_msgSend(v13, "setShouldDisplayAllSamples:", 1);
    v15 = [WDDataListViewController alloc];
    -[WDStoredDataByCategoryViewController profile](self, "profile");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[WDDataListViewController initWithDisplayType:profile:dataProvider:usingInsetStyling:](v15, "initWithDisplayType:profile:dataProvider:usingInsetStyling:", v4, v16, v13, 1);

  }
  return v8;
}

- (WDProfile)profile
{
  return self->_profile;
}

- (void)setProfile:(id)a3
{
  objc_storeStrong((id *)&self->_profile, a3);
}

- (void)setBodyFont:(id)a3
{
  objc_storeStrong((id *)&self->_bodyFont, a3);
}

- (NSArray)capturedSampleTypes
{
  return self->_capturedSampleTypes;
}

- (void)setCapturedSampleTypes:(id)a3
{
  objc_storeStrong((id *)&self->_capturedSampleTypes, a3);
}

- (BOOL)isBluetoothDevice
{
  return self->_isBluetoothDevice;
}

- (void)setIsBluetoothDevice:(BOOL)a3
{
  self->_isBluetoothDevice = a3;
}

- (NSUUID)deviceIdentifier
{
  return self->_deviceIdentifier;
}

- (void)setDeviceIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1064);
}

- (NSArray)savedCategories
{
  return (NSArray *)objc_getProperty(self, a2, 1072, 1);
}

- (void)setSavedCategories:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1072);
}

- (BOOL)queryReturned
{
  return self->_queryReturned;
}

- (void)setQueryReturned:(BOOL)a3
{
  self->_queryReturned = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_savedCategories, 0);
  objc_storeStrong((id *)&self->_deviceIdentifier, 0);
  objc_storeStrong((id *)&self->_capturedSampleTypes, 0);
  objc_storeStrong((id *)&self->_bodyFont, 0);
  objc_storeStrong((id *)&self->_profile, 0);
  objc_storeStrong((id *)&self->_healthServicesManager, 0);
}

- (NSPredicate)storedDataPredicate
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_3();
  return (NSPredicate *)objc_alloc_init(MEMORY[0x24BDD1758]);
}

- (NSString)storedDataDisplayName
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_3();
  return (NSString *)&stru_24D38E7C8;
}

- (BOOL)shouldShowDeleteAllDataButton
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_3();
  return 0;
}

- (void)deleteAllStoredData
{
  OUTLINED_FUNCTION_1_2();
  NSRequestConcreteImplementation();
}

void __51__WDStoredDataByCategoryViewController_viewDidLoad__block_invoke_2_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_215814000, a2, a3, "_HKSampleTypeQuery failed with error: %@", a5, a6, a7, a8, 2u);
}

void __71__WDStoredDataByCategoryViewController_fetchEnabledStatusForPeripheral__block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_215814000, a2, a3, "fetchEnabledStatusForPeripheral getEnabledStatusForPeripheral failed: %{public}@", a5, a6, a7, a8, 2u);
}

void __69__WDStoredDataByCategoryViewController_switchCellValueChanged_value___block_invoke_cold_1(void *a1, void *a2, uint64_t a3)
{
  NSObject *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  int v9;
  const __CFString *v10;
  int v11;
  void *v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  const __CFString *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v5 = a1;
  objc_msgSend(a2, "deviceIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "title");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  v9 = *(unsigned __int8 *)(a3 + 40);
  v11 = 138543874;
  v12 = v6;
  if (v9)
    v10 = CFSTR("ON");
  else
    v10 = CFSTR("OFF");
  v13 = 2114;
  v14 = v7;
  v15 = 2114;
  v16 = v10;
  _os_log_error_impl(&dword_215814000, v5, OS_LOG_TYPE_ERROR, "Could not set the enabled status of device %{public}@, '%{public}@', to %{public}@", (uint8_t *)&v11, 0x20u);

}

@end
