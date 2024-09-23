@implementation APTCCDisclosureController

- (APTCCDisclosureController)initWithApplication:(id)a3 TCCServices:(id)a4 includeDoneButton:(BOOL)a5 scrollViewAssistant:(id)a6
{
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  APTCCDisclosureController *v20;
  APSymbolBadgedAppIconView *v21;
  APSymbolBadgedAppIconView *v22;
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
  uint64_t v34;
  NSArray *services;
  uint64_t v36;
  OBBoldTrayButton *doneButton;
  OBBoldTrayButton *v38;
  void *v39;
  void *v40;
  void *v41;
  id v44;
  _BOOL4 v45;
  void *v46;
  void *v47;
  void *v48;
  APSymbolBadgedAppIconView *v49;
  id v50;
  void *v51;
  void *v52;
  id v53;
  void *v54;
  char v55[40];
  objc_super v56;
  _QWORD v57[4];

  v45 = a5;
  v57[2] = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v50 = a4;
  v44 = a6;
  v53 = a6;
  objc_msgSend(v9, "findApplicationRecordWithError:", 0);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "localizedName");
  v10 = objc_claimAutoreleasedReturnValue();
  APUIFrameworkBundle();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("TCC_ACCESS_HEADER_FMT"), &stru_2507A0B80, CFSTR("Localizable"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v51 = (void *)v10;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", v12, v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  APUIDataclassLocalizedName(v9);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)MEMORY[0x24BDD17C8];
  APGetPreferredAuthenticationMechanismLocKey();
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "stringWithFormat:", CFSTR("TCC_ACCESS_DETAIL_FMT_%@"), v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  APUILocStr(v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", v18, v14);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v56.receiver = self;
  v56.super_class = (Class)APTCCDisclosureController;
  v20 = -[OBTableWelcomeController initWithTitle:detailText:icon:adoptTableViewScrollView:](&v56, sel_initWithTitle_detailText_icon_adoptTableViewScrollView_, v13, v19, 0, 1);

  v21 = [APSymbolBadgedAppIconView alloc];
  +[APSymbolBadgedAppIconView metricsForEducation](APSymbolBadgedAppIconView, "metricsForEducation");
  v54 = v9;
  v22 = -[APSymbolBadgedAppIconView initWithApplication:symbolType:metrics:](v21, "initWithApplication:symbolType:metrics:", v9, CFSTR("com.apple.appprotection.lock.education"), v55);
  -[APSymbolBadgedAppIconView setTranslatesAutoresizingMaskIntoConstraints:](v22, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[APTCCDisclosureController headerView](v20, "headerView");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "customIconContainerView");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "addSubview:", v22);

  v46 = (void *)MEMORY[0x24BDD1628];
  -[APSymbolBadgedAppIconView centerXAnchor](v22, "centerXAnchor");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  -[APTCCDisclosureController headerView](v20, "headerView");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "customIconContainerView");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "centerXAnchor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "constraintEqualToAnchor:", v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v57[0] = v27;
  v49 = v22;
  -[APSymbolBadgedAppIconView centerYAnchor](v22, "centerYAnchor");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[APTCCDisclosureController headerView](v20, "headerView");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "customIconContainerView");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "centerYAnchor");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "constraintEqualToAnchor:", v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v57[1] = v32;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v57, 2);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "activateConstraints:", v33);

  if (v20)
  {
    objc_storeStrong((id *)&v20->_app, a3);
    v34 = objc_msgSend(v50, "copy");
    services = v20->_services;
    v20->_services = (NSArray *)v34;

    objc_storeStrong((id *)&v20->_scrollViewAssistant, v44);
    if (v45)
    {
      objc_msgSend(MEMORY[0x24BE6E3E8], "boldButton");
      v36 = objc_claimAutoreleasedReturnValue();
      doneButton = v20->_doneButton;
      v20->_doneButton = (OBBoldTrayButton *)v36;

      v38 = v20->_doneButton;
      APUIFrameworkBundle();
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "localizedStringForKey:value:table:", CFSTR("DONE"), &stru_2507A0B80, CFSTR("Localizable"));
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      -[OBBoldTrayButton setTitle:forState:](v38, "setTitle:forState:", v40, 0);

      -[APTCCDisclosureController buttonTray](v20, "buttonTray");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "addButton:", v20->_doneButton);

    }
  }

  return v20;
}

- (void)beginLoadUsers
{
  NSObject *v3;
  NSObject *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  id v12;
  NSArray *obj;
  _QWORD block[5];
  id v15;
  _QWORD v16[4];
  id v17;
  uint64_t v18;
  NSObject *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint8_t buf[8];
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  if (!self->_hasBegunLoadUsers)
  {
    self->_hasBegunLoadUsers = 1;
    APUIDefaultFrameworkLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2362EA000, v3, OS_LOG_TYPE_DEFAULT, "Begin load users", buf, 2u);
    }

    v4 = dispatch_group_create();
    v5 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    obj = self->_services;
    v6 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v21;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v21 != v8)
            objc_enumerationMutation(obj);
          v10 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i);
          dispatch_group_enter(v4);
          objc_msgSend(MEMORY[0x24BE04338], "sharedManager");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v16[0] = MEMORY[0x24BDAC760];
          v16[1] = 3221225472;
          v16[2] = __43__APTCCDisclosureController_beginLoadUsers__block_invoke;
          v16[3] = &unk_25079FEF0;
          v17 = v5;
          v18 = v10;
          v19 = v4;
          objc_msgSend(v11, "accessingRecordsForTCCService:completion:", v10, v16);

        }
        v7 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
      }
      while (v7);
    }

    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __43__APTCCDisclosureController_beginLoadUsers__block_invoke_37;
    block[3] = &unk_25079FF58;
    block[4] = self;
    v15 = v5;
    v12 = v5;
    dispatch_group_notify(v4, MEMORY[0x24BDAC9B8], block);

  }
}

void __43__APTCCDisclosureController_beginLoadUsers__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  void *v16;
  NSObject *v17;
  _QWORD v18[4];
  id v19;
  id v20;
  uint64_t v21;
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (v5)
  {
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v24;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v24 != v9)
            objc_enumerationMutation(v5);
          v11 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
          v12 = (id)objc_msgSend(v11, "bundleIdentifier");
          v13 = (id)objc_msgSend(v11, "localizedName");
          objc_msgSend(v11, "detach");
        }
        v8 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      }
      while (v8);
    }
    v18[0] = MEMORY[0x24BDAC760];
    v18[1] = 3221225472;
    v18[2] = __43__APTCCDisclosureController_beginLoadUsers__block_invoke_2;
    v18[3] = &unk_25079FEC8;
    v19 = v5;
    v14 = *(id *)(a1 + 32);
    v15 = *(_QWORD *)(a1 + 40);
    v16 = *(void **)(a1 + 48);
    v20 = v14;
    v21 = v15;
    v22 = v16;
    dispatch_async(MEMORY[0x24BDAC9B8], v18);

  }
  else
  {
    APUIDefaultFrameworkLog();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      __43__APTCCDisclosureController_beginLoadUsers__block_invoke_cold_1(a1, (uint64_t)v6, v17);

    dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
  }

}

void __43__APTCCDisclosureController_beginLoadUsers__block_invoke_2(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint8_t buf[4];
  uint64_t v18;
  __int16 v19;
  uint64_t v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v13, v21, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v14 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        objc_msgSend(v7, "bundleIdentifier", (_QWORD)v13);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 40), "objectForKey:", v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v9)
          objc_msgSend(*(id *)(a1 + 40), "setObject:forKey:", v7, v8);

      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v13, v21, 16);
    }
    while (v4);
  }

  APUIDefaultFrameworkLog();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = objc_msgSend(*(id *)(a1 + 32), "count");
    v12 = *(_QWORD *)(a1 + 48);
    *(_DWORD *)buf = 134218242;
    v18 = v11;
    v19 = 2112;
    v20 = v12;
    _os_log_impl(&dword_2362EA000, v10, OS_LOG_TYPE_DEFAULT, "%ld users for service %@", buf, 0x16u);
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));
}

void __43__APTCCDisclosureController_beginLoadUsers__block_invoke_37(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint8_t buf[4];
  uint64_t v19;
  __int16 v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 40), "allValues");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sortedArrayUsingComparator:", &__block_literal_global_40);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 1264);
  *(_QWORD *)(v4 + 1264) = v3;

  APUIDefaultFrameworkLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = *(_QWORD *)(a1 + 32);
    v8 = *(_QWORD *)(v7 + 1224);
    v9 = *(_QWORD *)(v7 + 1264);
    *(_DWORD *)buf = 138412546;
    v19 = v8;
    v20 = 2112;
    v21 = v9;
    _os_log_impl(&dword_2362EA000, v6, OS_LOG_TYPE_DEFAULT, "Users loaded for %@: %@", buf, 0x16u);
  }

  objc_msgSend(*(id *)(a1 + 32), "tableView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "reloadData");

  if (!objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1264), "count"))
  {
    objc_msgSend(*(id *)(a1 + 32), "headerView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    APUIDataclassLocalizedName(*(void **)(*(_QWORD *)(a1 + 32) + 1224));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)MEMORY[0x24BDD17C8];
    APGetPreferredAuthenticationMechanismLocKey();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "stringWithFormat:", CFSTR("TCC_ACCESS_DETAIL_NO_USERS_FMT_%@"), v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    APUILocStr(v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", v16, v12);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "setDetailText:", v17);
  }
}

uint64_t __43__APTCCDisclosureController_beginLoadUsers__block_invoke_2_38(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "compare:", v6);
  return v7;
}

- (void)addDoneButtonTarget:(id)a3 action:(SEL)a4
{
  -[OBBoldTrayButton addTarget:action:forControlEvents:](self->_doneButton, "addTarget:action:forControlEvents:", a3, a4, 0x2000);
}

- (void)viewDidLoad
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
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)APTCCDisclosureController;
  -[OBTableWelcomeController viewDidLoad](&v12, sel_viewDidLoad);
  v3 = objc_alloc(MEMORY[0x24BEBD9F0]);
  v4 = (void *)objc_msgSend(v3, "initWithFrame:style:", 2, *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  -[OBTableWelcomeController setTableView:](self, "setTableView:", v4);

  -[OBTableWelcomeController tableView](self, "tableView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "registerClass:forCellReuseIdentifier:", objc_opt_class(), CFSTR("APTCCDisclosureCell"));

  -[OBTableWelcomeController tableView](self, "tableView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setDataSource:", self);

  -[OBTableWelcomeController tableView](self, "tableView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setDelegate:", self);

  -[OBTableWelcomeController tableView](self, "tableView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setBackgroundColor:", v9);

  -[OBTableWelcomeController tableView](self, "tableView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setBackgroundView:", 0);

  -[OBTableWelcomeController tableView](self, "tableView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "reloadData");

}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  NSArray *users;
  uint64_t v9;
  void *v10;

  v5 = a4;
  -[OBTableWelcomeController tableView](self, "tableView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dequeueReusableCellWithIdentifier:", CFSTR("APTCCDisclosureCell"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  users = self->_users;
  v9 = objc_msgSend(v5, "row");

  -[NSArray objectAtIndex:](users, "objectAtIndex:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "configureForRecord:", v10);

  return v7;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  if (a4)
    return 0;
  else
    return -[NSArray count](self->_users, "count", a3);
}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  return 0;
}

- (void)setScrollContentInsets
{
  APButtonTrayScrollViewAssistant *scrollViewAssistant;
  id v3;

  scrollViewAssistant = self->_scrollViewAssistant;
  -[OBTableWelcomeController scrollView](self, "scrollView");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[APButtonTrayScrollViewAssistant performAdjustmentsForScrollView:](scrollViewAssistant, "performAdjustmentsForScrollView:", v3);

}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)APTCCDisclosureController;
  -[OBBaseWelcomeController viewDidAppear:](&v4, sel_viewDidAppear_, a3);
  -[APTCCDisclosureController setScrollContentInsets](self, "setScrollContentInsets");
}

- (void)viewDidLayoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)APTCCDisclosureController;
  -[OBTableWelcomeController viewDidLayoutSubviews](&v3, sel_viewDidLayoutSubviews);
  -[APTCCDisclosureController setScrollContentInsets](self, "setScrollContentInsets");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_users, 0);
  objc_storeStrong((id *)&self->_scrollViewAssistant, 0);
  objc_storeStrong((id *)&self->_doneButton, 0);
  objc_storeStrong((id *)&self->_bundleIdentifiersWithAccess, 0);
  objc_storeStrong((id *)&self->_services, 0);
  objc_storeStrong((id *)&self->_app, 0);
}

void __43__APTCCDisclosureController_beginLoadUsers__block_invoke_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = *(_QWORD *)(a1 + 40);
  v4 = 138412546;
  v5 = v3;
  v6 = 2112;
  v7 = a2;
  _os_log_error_impl(&dword_2362EA000, log, OS_LOG_TYPE_ERROR, "couldn't get records for %@: %@", (uint8_t *)&v4, 0x16u);
}

@end
