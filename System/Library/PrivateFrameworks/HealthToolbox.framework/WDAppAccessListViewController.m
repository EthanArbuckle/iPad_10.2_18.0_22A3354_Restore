@implementation WDAppAccessListViewController

- (WDAppAccessListViewController)initWithSample:(id)a3 healthStore:(id)a4
{
  id v7;
  id v8;
  WDAppAccessListViewController *v9;
  WDAppAccessListViewController *v10;
  uint64_t v11;
  HKAuthorizationStore *authorizationStore;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)WDAppAccessListViewController;
  v9 = -[HKTableViewController initWithUsingInsetStyling:](&v14, sel_initWithUsingInsetStyling_, 1);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_sample, a3);
    objc_storeStrong((id *)&v10->_healthStore, a4);
    v11 = objc_msgSend(objc_alloc(MEMORY[0x24BDD3958]), "initWithHealthStore:", v8);
    authorizationStore = v10->_authorizationStore;
    v10->_authorizationStore = (HKAuthorizationStore *)v11;

    -[WDAppAccessListViewController _refreshAppAuthorizationData](v10, "_refreshAppAuthorizationData");
  }

  return v10;
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

- (void)viewDidLoad
{
  double v3;
  void *v4;
  double v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)WDAppAccessListViewController;
  -[HKTableViewController viewDidLoad](&v7, sel_viewDidLoad);
  v3 = *MEMORY[0x24BE4A140];
  -[WDAppAccessListViewController tableView](self, "tableView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setEstimatedRowHeight:", v3);

  v5 = *MEMORY[0x24BDF7DE0];
  -[WDAppAccessListViewController tableView](self, "tableView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setRowHeight:", v5);

}

- (void)_refreshAppAuthorizationData
{
  HKAuthorizationStore *authorizationStore;
  HKSample *sample;
  _QWORD v4[5];

  authorizationStore = self->_authorizationStore;
  sample = self->_sample;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __61__WDAppAccessListViewController__refreshAppAuthorizationData__block_invoke;
  v4[3] = &unk_24D38CF10;
  v4[4] = self;
  -[HKAuthorizationStore fetchAuthorizationStatusesForSample:completion:](authorizationStore, "fetchAuthorizationStatusesForSample:completion:", sample, v4);
}

void __61__WDAppAccessListViewController__refreshAppAuthorizationData__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  uint64_t i;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  char v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  char v25;
  id v26;
  id v27;
  void *v28;
  void *v29;
  _QWORD v30[5];
  id v31;
  id v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _QWORD block[5];
  id v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (v6)
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __61__WDAppAccessListViewController__refreshAppAuthorizationData__block_invoke_2;
    block[3] = &unk_24D38CEC0;
    block[4] = *(_QWORD *)(a1 + 32);
    v38 = v6;
    dispatch_async(MEMORY[0x24BDAC9B8], block);

    goto LABEL_24;
  }
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  objc_msgSend(v5, "allKeys");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v33, v39, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v34;
    v12 = 1;
    while (1)
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v34 != v11)
          objc_enumerationMutation(v8);
        v14 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
        objc_msgSend(v5, "objectForKeyedSubscript:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "integerValue");

        if (v16 == 2)
        {
          v17 = v28;
          goto LABEL_12;
        }
        if (v16 == 1)
        {
          v17 = v29;
LABEL_12:
          objc_msgSend(v17, "addObject:", v14);
          continue;
        }
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1056), "sourceRevision");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "source");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v14, "isEqual:", v19);

        v12 &= v20 ^ 1;
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v33, v39, 16);
      if (!v10)
      {

        if ((v12 & 1) == 0)
          goto LABEL_23;
        goto LABEL_19;
      }
    }
  }

LABEL_19:
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1056), "sourceRevision");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "source");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v29, "containsObject:", v22) & 1) == 0)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1056), "sourceRevision");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "source");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v28, "containsObject:", v24);

    if ((v25 & 1) != 0)
      goto LABEL_23;
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1056), "sourceRevision");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "source");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "addObject:", v22);
  }

LABEL_23:
  v30[0] = MEMORY[0x24BDAC760];
  v30[1] = 3221225472;
  v30[2] = __61__WDAppAccessListViewController__refreshAppAuthorizationData__block_invoke_194;
  v30[3] = &unk_24D38CEE8;
  v30[4] = *(_QWORD *)(a1 + 32);
  v31 = v28;
  v32 = v29;
  v26 = v29;
  v27 = v28;
  dispatch_async(MEMORY[0x24BDAC9B8], v30);

  v7 = 0;
LABEL_24:

}

void __61__WDAppAccessListViewController__refreshAppAuthorizationData__block_invoke_2(uint64_t a1)
{
  void *v2;

  _HKInitializeLogging();
  v2 = (void *)*MEMORY[0x24BDD2FC0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FC0], OS_LOG_TYPE_ERROR))
    __61__WDAppAccessListViewController__refreshAppAuthorizationData__block_invoke_2_cold_1(a1, v2);
}

void __61__WDAppAccessListViewController__refreshAppAuthorizationData__block_invoke_194(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "setAllowedApps:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "setDisallowedApps:", *(_QWORD *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 32), "tableView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "reloadData");

}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 3;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v6;
  uint64_t v7;
  int64_t v8;
  unint64_t v9;

  v6 = a3;
  if (a4 == 2)
  {
    v8 = 1;
  }
  else
  {
    if (a4 == 1)
    {
      v7 = 1048;
    }
    else
    {
      if (a4)
      {
        v8 = 0;
        goto LABEL_11;
      }
      v7 = 1040;
    }
    v9 = objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa + v7), "count");
    if (v9 <= 1)
      v8 = 1;
    else
      v8 = v9;
  }
LABEL_11:

  return v8;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  id v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  void *v9;

  v5 = a3;
  if (a4 == 1)
  {
    WDBundle();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    v8 = CFSTR("CCD_NOT_SHARED_WITH_APP");
  }
  else
  {
    if (a4)
    {
      v9 = 0;
      goto LABEL_7;
    }
    WDBundle();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    v8 = CFSTR("CCD_SHARED_WITH_APP");
  }
  objc_msgSend(v6, "localizedStringForKey:value:table:", v8, &stru_24D38E7C8, CFSTR("WellnessDashboard-Localizable"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_7:
  return v9;
}

- (id)_identifierForCellInSection:(int64_t)a3
{
  uint64_t v3;
  uint64_t v5;
  __CFString *v6;

  if (a3 == 2)
    return CFSTR("WDAppAccessListResetAllCell");
  if (a3 == 1)
  {
    v3 = 1048;
  }
  else
  {
    if (a3)
      return 0;
    v3 = 1040;
  }
  v5 = objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa + v3), "count");
  v6 = CFSTR("WDAppAccessListAppCell");
  if (!v5)
    v6 = CFSTR("WDAppAccessListNoneCell");
  return v6;
}

- (id)_sourceForIndexPath:(id)a3
{
  id v4;
  int *v5;
  id v6;
  unint64_t v7;
  void *v8;

  v4 = a3;
  if (!objc_msgSend(v4, "section"))
  {
    v5 = &OBJC_IVAR___WDAppAccessListViewController__allowedApps;
    goto LABEL_5;
  }
  if (objc_msgSend(v4, "section") == 1)
  {
    v5 = &OBJC_IVAR___WDAppAccessListViewController__disallowedApps;
LABEL_5:
    v6 = *(id *)((char *)&self->super.super.super.super.super.isa + *v5);
    goto LABEL_7;
  }
  v6 = 0;
LABEL_7:
  v7 = objc_msgSend(v4, "row");
  if (v7 >= objc_msgSend(v6, "count"))
  {
    v8 = 0;
  }
  else
  {
    objc_msgSend(v6, "objectAtIndexedSubscript:", objc_msgSend(v4, "row"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

- (void)_loadIconForSource:(id)a3 onCell:(id)a4 ofTableView:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  id v13;
  id v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;
  id v21;
  _QWORD v22[4];
  id v23;
  id location;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_initWeak(&location, self);
  objc_msgSend(MEMORY[0x24BE4A2B0], "sharedImageManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = MEMORY[0x24BDAC760];
  v22[0] = MEMORY[0x24BDAC760];
  v22[1] = 3221225472;
  v22[2] = __71__WDAppAccessListViewController__loadIconForSource_onCell_ofTableView___block_invoke;
  v22[3] = &unk_24D38CF38;
  v13 = v9;
  v23 = v13;
  v17[0] = v12;
  v17[1] = 3221225472;
  v17[2] = __71__WDAppAccessListViewController__loadIconForSource_onCell_ofTableView___block_invoke_2;
  v17[3] = &unk_24D38CF88;
  objc_copyWeak(&v21, &location);
  v14 = v8;
  v18 = v14;
  v15 = v13;
  v19 = v15;
  v16 = v10;
  v20 = v16;
  objc_msgSend(v11, "loadIconForSource:syncHandler:asyncHandler:", v14, v22, v17);

  objc_destroyWeak(&v21);
  objc_destroyWeak(&location);

}

void __71__WDAppAccessListViewController__loadIconForSource_onCell_ofTableView___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "imageView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setImage:", v3);

}

void __71__WDAppAccessListViewController__loadIconForSource_onCell_ofTableView___block_invoke_2(id *a1, void *a2, void *a3)
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
  v9[2] = __71__WDAppAccessListViewController__loadIconForSource_onCell_ofTableView___block_invoke_3;
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

void __71__WDAppAccessListViewController__loadIconForSource_onCell_ofTableView___block_invoke_3(uint64_t a1)
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
  int v16;
  void *v17;
  id v18;

  v18 = a3;
  v12 = a5;
  if (v18 && !a7)
  {
    v13 = a4;
    objc_msgSend(a6, "indexPathForCell:", v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[WDAppAccessListViewController _sourceForIndexPath:](self, "_sourceForIndexPath:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "isEqual:", v13);

    if (v16)
    {
      objc_msgSend(v12, "imageView");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setImage:", v18);

    }
  }

}

- (id)_textForCellAtIndexPath:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  int *v8;
  void *v9;

  v4 = a3;
  v5 = objc_msgSend(v4, "section");
  switch(v5)
  {
    case 0:
      v8 = &OBJC_IVAR___WDAppAccessListViewController__allowedApps;
LABEL_7:
      v6 = *(id *)((char *)&self->super.super.super.super.super.isa + *v8);
      goto LABEL_9;
    case 1:
      v8 = &OBJC_IVAR___WDAppAccessListViewController__disallowedApps;
      goto LABEL_7;
    case 2:
      WDBundle();
      v6 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("RESET_SHARING"), &stru_24D38E7C8, CFSTR("WellnessDashboard-Localizable"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_13;
  }
  v6 = 0;
LABEL_9:
  if (objc_msgSend(v6, "count"))
  {
    objc_msgSend(v6, "objectAtIndexedSubscript:", objc_msgSend(v4, "row"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "name");
  }
  else
  {
    WDBundle();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("NO_APPS_TO_SHOW"), &stru_24D38E7C8, CFSTR("WellnessDashboard-Localizable"));
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_13:
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
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v6 = a3;
  v7 = a4;
  -[WDAppAccessListViewController _identifierForCellInSection:](self, "_identifierForCellInSection:", objc_msgSend(v7, "section"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dequeueReusableCellWithIdentifier:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6E60]), "initWithStyle:reuseIdentifier:", 0, v8);
  if (objc_msgSend(v7, "section") == 2)
    v10 = 3;
  else
    v10 = 0;
  objc_msgSend(v9, "setSelectionStyle:", v10);
  -[WDAppAccessListViewController _textForCellAtIndexPath:](self, "_textForCellAtIndexPath:", v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "textLabel");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setText:", v11);

  -[WDAppAccessListViewController bodyFont](self, "bodyFont");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "textLabel");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setFont:", v13);

  -[WDAppAccessListViewController _sourceForIndexPath:](self, "_sourceForIndexPath:", v7);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDAppAccessListViewController _loadIconForSource:onCell:ofTableView:](self, "_loadIconForSource:onCell:ofTableView:", v15, v9, v6);

  return v9;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  id v7;

  v7 = a3;
  v6 = a4;
  if (objc_msgSend(v6, "section") == 2)
    -[WDAppAccessListViewController resetAccess](self, "resetAccess");
  objc_msgSend(v7, "deselectRowAtIndexPath:animated:", v6, 1);

}

- (void)resetAccess
{
  HKAuthorizationStore *authorizationStore;
  void *v4;
  _QWORD v5[5];
  _QWORD v6[2];

  v6[1] = *MEMORY[0x24BDAC8D0];
  authorizationStore = self->_authorizationStore;
  v6[0] = self->_sample;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __44__WDAppAccessListViewController_resetAccess__block_invoke;
  v5[3] = &unk_24D38CFB0;
  v5[4] = self;
  -[HKAuthorizationStore resetAuthorizationStatusesForObjects:completion:](authorizationStore, "resetAuthorizationStatusesForObjects:completion:", v4, v5);

}

void __44__WDAppAccessListViewController_resetAccess__block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  void *v6;

  v5 = a3;
  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "_refreshAppAuthorizationData");
  }
  else
  {
    _HKInitializeLogging();
    v6 = (void *)*MEMORY[0x24BDD2FC0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FC0], OS_LOG_TYPE_ERROR))
      __44__WDAppAccessListViewController_resetAccess__block_invoke_cold_1(a1, v6);
  }

}

- (void)_displayGuestModeAlert
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
  id v12;

  v3 = (void *)MEMORY[0x24BDF67F0];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("GUEST_MODE_CHANGE_AUTHORIZATION_TITLE"), &stru_24D38E7C8, CFSTR("HealthUI-Localizable"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("GUEST_MODE_CHANGE_AUTHORIZATION_DESCRIPTION"), &stru_24D38E7C8, CFSTR("HealthUI-Localizable"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "alertControllerWithTitle:message:preferredStyle:", v5, v7, 1);
  v12 = (id)objc_claimAutoreleasedReturnValue();

  v8 = (void *)MEMORY[0x24BDF67E8];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("SHARE_ALERT_OK"), &stru_24D38E7C8, CFSTR("HealthUI-Localizable"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "actionWithTitle:style:handler:", v10, 0, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "addAction:", v11);
  -[WDAppAccessListViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v12, 1, 0);

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
  v10.super_class = (Class)WDAppAccessListViewController;
  -[WDAppAccessListViewController traitCollectionDidChange:](&v10, sel_traitCollectionDidChange_, v4);
  if (v4)
  {
    -[WDAppAccessListViewController traitCollection](self, "traitCollection");
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

- (NSArray)allowedApps
{
  return self->_allowedApps;
}

- (void)setAllowedApps:(id)a3
{
  objc_storeStrong((id *)&self->_allowedApps, a3);
}

- (NSArray)disallowedApps
{
  return self->_disallowedApps;
}

- (void)setDisallowedApps:(id)a3
{
  objc_storeStrong((id *)&self->_disallowedApps, a3);
}

- (HKSample)sample
{
  return self->_sample;
}

- (void)setSample:(id)a3
{
  objc_storeStrong((id *)&self->_sample, a3);
}

- (void)setBodyFont:(id)a3
{
  objc_storeStrong((id *)&self->_bodyFont, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bodyFont, 0);
  objc_storeStrong((id *)&self->_sample, 0);
  objc_storeStrong((id *)&self->_disallowedApps, 0);
  objc_storeStrong((id *)&self->_allowedApps, 0);
  objc_storeStrong((id *)&self->_authorizationStore, 0);
  objc_storeStrong((id *)&self->_healthStore, 0);
}

void __61__WDAppAccessListViewController__refreshAppAuthorizationData__block_invoke_2_cold_1(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v3 = OUTLINED_FUNCTION_2_0(a1, a2);
  objc_msgSend(v2, "sample");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0(&dword_215814000, v5, v6, "Failed to retrieve authorization records for sample: %@ with error: %@", v7, v8, v9, v10, 2u);

  OUTLINED_FUNCTION_1();
}

void __44__WDAppAccessListViewController_resetAccess__block_invoke_cold_1(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v3 = OUTLINED_FUNCTION_2_0(a1, a2);
  objc_msgSend(v2, "sample");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "UUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0(&dword_215814000, v6, v7, "Failed to reset authorization for sample: %@ with error: %@", v8, v9, v10, v11, 2u);

  OUTLINED_FUNCTION_1();
}

@end
