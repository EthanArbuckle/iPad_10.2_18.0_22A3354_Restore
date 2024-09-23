@implementation DSPublicResourceSharingController

+ (void)initialize
{
  os_log_t v2;
  void *v3;

  if ((id)objc_opt_class() == a1)
  {
    v2 = os_log_create("com.apple.DigitalSeparation", "DSPublicResourceSharingController");
    v3 = (void *)DSLogPublicResourceSharingController;
    DSLogPublicResourceSharingController = (uint64_t)v2;

  }
}

- (DSPublicResourceSharingController)init
{
  void *v3;
  void *v4;
  void *v5;
  DSPublicResourceSharingController *v6;
  uint64_t v7;
  NSMutableSet *selectedTypes;
  dispatch_queue_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  objc_super v15;

  DSUILocStringForKey(CFSTR("PUBLIC_SHARING_TITLE"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  DSUILocStringForKey(CFSTR("PUBLIC_SHARING_DETAIL"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD640], "imageNamed:", CFSTR("person.3.fill"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v15.receiver = self;
  v15.super_class = (Class)DSPublicResourceSharingController;
  v6 = -[DSTableWelcomeController initWithTitle:detailText:icon:shouldShowSearchBar:](&v15, sel_initWithTitle_detailText_icon_shouldShowSearchBar_, v3, v4, v5, 0);

  if (v6)
  {
    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v7 = objc_claimAutoreleasedReturnValue();
    selectedTypes = v6->_selectedTypes;
    v6->_selectedTypes = (NSMutableSet *)v7;

    v9 = dispatch_queue_create("PublicSharingPermissionsControllerWork", 0);
    -[DSPublicResourceSharingController setWorkQueue:](v6, "setWorkQueue:", v9);

    DSUILocStringForKey(CFSTR("SKIP"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[DSUIUtilities setUpBoldButtonForController:title:target:selector:](DSUIUtilities, "setUpBoldButtonForController:title:target:selector:", v6, v10, v6, sel__pushNextPane);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[DSTableWelcomeController setBoldButton:](v6, "setBoldButton:", v11);

    DSUILocStringForKey(CFSTR("STOP_ALL_SHARING"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[DSUIUtilities setUpLinkButtonForController:title:target:selector:](DSUIUtilities, "setUpLinkButtonForController:title:target:selector:", v6, v12, v6, sel_stopAllSharing);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[DSTableWelcomeController setLinkButton:](v6, "setLinkButton:", v13);

  }
  return v6;
}

- (BOOL)shouldShow
{
  void *v3;
  void *v4;
  void *v5;
  BOOL v6;

  -[DSPublicResourceSharingController delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v3, "fetchedSharingPermissions");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[DSPublicResourceSharingController setPermissions:](self, "setPermissions:", v4);

    -[DSPublicResourceSharingController permissions](self, "permissions");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "publicSharingTypesCount") > 0;

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)DSPublicResourceSharingController;
  -[OBTableWelcomeController viewWillAppear:](&v4, sel_viewWillAppear_, a3);
  -[DSPublicResourceSharingController reloadTableViewData](self, "reloadTableViewData");
}

- (void)_pushNextPane
{
  id v2;

  -[DSPublicResourceSharingController delegate](self, "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "pushNextPane");

}

- (void)stopSharingTypes:(id)a3 alertLabel:(id)a4 alertDetail:(id)a5
{
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(uint64_t);
  void *v21;
  DSPublicResourceSharingController *v22;
  id v23;

  v8 = a3;
  v9 = (void *)MEMORY[0x24BEBD3B0];
  v10 = a4;
  objc_msgSend(v9, "alertControllerWithTitle:message:preferredStyle:", 0, a5, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)MEMORY[0x24BEBD3A8];
  DSUILocStringForKey(CFSTR("CANCEL"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "actionWithTitle:style:handler:", v13, 1, &__block_literal_global_6);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = (void *)MEMORY[0x24BEBD3A8];
  v18 = MEMORY[0x24BDAC760];
  v19 = 3221225472;
  v20 = __77__DSPublicResourceSharingController_stopSharingTypes_alertLabel_alertDetail___block_invoke_2;
  v21 = &unk_24EFF3AA0;
  v22 = self;
  v23 = v8;
  v16 = v8;
  objc_msgSend(v15, "actionWithTitle:style:handler:", v10, 2, &v18);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "addAction:", v17, v18, v19, v20, v21, v22);
  objc_msgSend(v11, "addAction:", v14);
  -[DSPublicResourceSharingController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v11, 1, 0);

}

void __77__DSPublicResourceSharingController_stopSharingTypes_alertLabel_alertDetail___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  NSObject *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  __int128 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  id v22;
  __int128 v23;
  NSObject *v24;
  id obj;
  uint64_t v26;
  _QWORD block[5];
  id v28;
  _QWORD v29[5];
  id v30;
  id v31;
  NSObject *v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  uint8_t buf[4];
  void *v38;
  _BYTE v39[128];
  uint64_t v40;

  v1 = a1;
  v40 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "buttonTray");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "showButtonsBusy");

  v3 = dispatch_group_create();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(v1 + 32), "permissions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  obj = *(id *)(v1 + 40);
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v39, 16);
  v8 = MEMORY[0x24BDAC760];
  v26 = v6;
  if (v6)
  {
    v9 = *(_QWORD *)v34;
    *(_QWORD *)&v7 = 138543362;
    v23 = v7;
    v24 = v3;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v34 != v9)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * v10);
        dispatch_group_enter(v3);
        v12 = (void *)DSLogPublicResourceSharingController;
        if (os_log_type_enabled((os_log_t)DSLogPublicResourceSharingController, OS_LOG_TYPE_INFO))
        {
          v13 = v12;
          objc_msgSend(v11, "source");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "name");
          v15 = v9;
          v16 = v8;
          v17 = v4;
          v18 = v5;
          v19 = v1;
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = v23;
          v38 = v20;
          _os_log_impl(&dword_2278DF000, v13, OS_LOG_TYPE_INFO, "Stopping all public sharing for type %{public}@", buf, 0xCu);

          v1 = v19;
          v5 = v18;
          v4 = v17;
          v8 = v16;
          v9 = v15;
          v3 = v24;

        }
        objc_msgSend(*(id *)(v1 + 32), "workQueue", v23);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v29[0] = v8;
        v29[1] = 3221225472;
        v29[2] = __77__DSPublicResourceSharingController_stopSharingTypes_alertLabel_alertDetail___block_invoke_219;
        v29[3] = &unk_24EFF3A50;
        v29[4] = v11;
        v30 = v4;
        v31 = v5;
        v32 = v3;
        objc_msgSend(v11, "stopAllSharingOnQueue:completion:", v21, v29);

        ++v10;
      }
      while (v26 != v10);
      v26 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v39, 16);
    }
    while (v26);
  }

  block[0] = v8;
  block[1] = 3221225472;
  block[2] = __77__DSPublicResourceSharingController_stopSharingTypes_alertLabel_alertDetail___block_invoke_221;
  block[3] = &unk_24EFF3A78;
  block[4] = *(_QWORD *)(v1 + 32);
  v28 = v4;
  v22 = v4;
  dispatch_group_notify(v3, MEMORY[0x24BDAC9B8], block);

}

void __77__DSPublicResourceSharingController_stopSharingTypes_alertLabel_alertDetail___block_invoke_219(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (void *)DSLogPublicResourceSharingController;
  if (os_log_type_enabled((os_log_t)DSLogPublicResourceSharingController, OS_LOG_TYPE_INFO))
  {
    v5 = *(void **)(a1 + 32);
    v6 = v4;
    objc_msgSend(v5, "source");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "name");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138543362;
    v11 = v8;
    _os_log_impl(&dword_2278DF000, v6, OS_LOG_TYPE_INFO, "Finished stop all public sharing for type %{public}@", (uint8_t *)&v10, 0xCu);

  }
  if (v3)
  {
    v9 = (void *)DSLogPublicResourceSharingController;
    if (os_log_type_enabled((os_log_t)DSLogPublicResourceSharingController, OS_LOG_TYPE_ERROR))
      __77__DSPublicResourceSharingController_stopSharingTypes_alertLabel_alertDetail___block_invoke_219_cold_1(a1, v9, (uint64_t)v3);
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v3);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 48), "removePublicSharingType:", *(_QWORD *)(a1 + 32));
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));

}

void __77__DSPublicResourceSharingController_stopSharingTypes_alertLabel_alertDetail___block_invoke_221(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "buttonTray");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "showButtonsAvailable");

  if (objc_msgSend(*(id *)(a1 + 40), "count"))
  {
    objc_msgSend(MEMORY[0x24BE2CC68], "errorWithCode:underlyingErrors:", 2, *(_QWORD *)(a1 + 40));
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "stopSharingFailedWithError:", v3);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "_pushNextPane");
  }
}

- (void)stopAllSharing
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  -[DSPublicResourceSharingController permissions](self, "permissions");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "allPublicSharingTypes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "copy");
  DSUILocStringForKey(CFSTR("STOP_ALL_PUBLIC_SHARING_ALERT_LABEL"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  DSUILocStringForKey(CFSTR("STOP_ALL_PUBLIC_SHARING_ALERT_DETAIL"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[DSPublicResourceSharingController stopSharingTypes:alertLabel:alertDetail:](self, "stopSharingTypes:alertLabel:alertDetail:", v4, v5, v6);

}

- (void)stopSelectedSharing
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[DSPublicResourceSharingController selectedTypes](self, "selectedTypes");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "allObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  DSUILocStringForKey(CFSTR("STOP_ALL_PUBLIC_SHARING_ALERT_LABEL"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  DSUILocStringForKey(CFSTR("STOP_ALL_PUBLIC_SHARING_ALERT_DETAIL"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[DSPublicResourceSharingController stopSharingTypes:alertLabel:alertDetail:](self, "stopSharingTypes:alertLabel:alertDetail:", v3, v4, v5);

}

- (void)stopSharingFailedWithError:(id)a3
{
  id v4;

  objc_msgSend(MEMORY[0x24BEBD3B0], "ds_alertControllerWithStopSharingError:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[DSTableWelcomeController presentErrorAlertController:](self, "presentErrorAlertController:", v4);

}

- (void)_updateButton
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  __CFString *v9;
  void *v10;
  void *v11;

  -[DSPublicResourceSharingController selectedTypes](self, "selectedTypes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  -[DSTableWelcomeController boldButton](self, "boldButton");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeTarget:action:forControlEvents:", 0, 0, 0xFFFFFFFFLL);

  if (v4)
  {
    -[DSTableWelcomeController boldButton](self, "boldButton");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    DSUILocStringForKey(CFSTR("STOP_SHARING"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setTitle:forState:", v7, 0);

    -[DSTableWelcomeController boldButton](self, "boldButton");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addTarget:action:forControlEvents:", self, sel_stopSelectedSharing, 64);
  }
  else
  {
    if (-[DSTableWelcomeController isModelEmpty](self, "isModelEmpty"))
      v9 = CFSTR("CONTINUE");
    else
      v9 = CFSTR("SKIP");
    DSUILocStringForKey(v9);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[DSTableWelcomeController boldButton](self, "boldButton");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setTitle:forState:", v8, 0);

    -[DSTableWelcomeController boldButton](self, "boldButton");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addTarget:action:forControlEvents:", self, sel__pushNextPane, 64);

  }
  -[DSTableWelcomeController hideButtonsIfSearching](self, "hideButtonsIfSearching");
}

- (id)publicSharingTypeForIndexPath:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;

  v4 = a3;
  -[DSPublicResourceSharingController permissions](self, "permissions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "row");

  objc_msgSend(v5, "publicSharingType:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)reloadTableViewData
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[DSPublicResourceSharingController permissions](self, "permissions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sort");

  -[DSPublicResourceSharingController permissions](self, "permissions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[DSTableWelcomeController setIsModelEmpty:](self, "setIsModelEmpty:", objc_msgSend(v4, "publicSharingTypesCount") == 0);

  -[OBTableWelcomeController tableView](self, "tableView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD15E0], "indexSetWithIndex:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "reloadSections:withRowAnimation:", v6, 100);

  -[OBTableWelcomeController tableView](self, "tableView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "layoutIfNeeded");

  -[DSPublicResourceSharingController _updateButton](self, "_updateButton");
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;

  v5 = a4;
  -[DSPublicResourceSharingController publicSharingTypeForIndexPath:](self, "publicSharingTypeForIndexPath:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "displayName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedDetailText");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "iconForTable");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[DSPublicResourceSharingController selectedTypes](self, "selectedTypes");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "containsObject:", v6);

  if (v11)
  {
    -[OBTableWelcomeController tableView](self, "tableView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "selectRowAtIndexPath:animated:scrollPosition:", v5, 1, 0);

  }
  -[OBTableWelcomeController tableView](self, "tableView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[DSIconTableViewCell iconTableViewCellFromTableView:withText:detail:icon:](DSIconTableViewCell, "iconTableViewCellFromTableView:withText:detail:icon:", v13, v7, v8, v9);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "setAccessoryType:", 0);
  return v14;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  void *v5;
  int64_t v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  -[DSPublicResourceSharingController permissions](self, "permissions", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "publicSharingTypesCount");

  if (v6)
  {
    -[DSTableWelcomeController hideNoSharingView](self, "hideNoSharingView");
    -[DSTableWelcomeController setIsModelEmpty:](self, "setIsModelEmpty:", 0);
    -[DSPublicResourceSharingController _updateTitle](self, "_updateTitle");
    -[DSPublicResourceSharingController _updateButton](self, "_updateButton");
  }
  else
  {
    v7 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v23 = objc_alloc_init(MEMORY[0x24BE2CC88]);
    objc_msgSend(v23, "sources");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v25;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v25 != v11)
            objc_enumerationMutation(v8);
          v13 = (void *)MEMORY[0x24BE2CC80];
          objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * i), "name");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "sourceDescriptorForSource:", v14);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "localizedAppName");
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v7, "addObject:", v16);
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      }
      while (v10);
    }

    objc_msgSend(MEMORY[0x24BDD1640], "localizedStringByJoiningStrings:", v7);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)MEMORY[0x24BDD17C8];
    DSUILocStringForKey(CFSTR("NO_PUBLIC_SHARING_INFORMATION"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "localizedStringWithFormat:", v19, v17);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BEBD640], "systemImageNamed:", CFSTR("person.3.fill"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[DSTableWelcomeController showNoSharingViewWithText:image:](self, "showNoSharingViewWithText:image:", v20, v21);

    -[DSTableWelcomeController setIsModelEmpty:](self, "setIsModelEmpty:", 1);
    -[DSPublicResourceSharingController _updateButton](self, "_updateButton");

    return 0;
  }
  return v6;
}

- (void)_updateTitle
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[DSPublicResourceSharingController headerView](self, "headerView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  DSUILocStringForKey(CFSTR("PUBLIC_SHARING_TITLE"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTitle:", v4);

  -[DSPublicResourceSharingController headerView](self, "headerView");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  DSUILocStringForKey(CFSTR("PUBLIC_SHARING_DETAIL"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setDetailText:", v5);

}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  void *v7;

  v5 = a4;
  -[DSPublicResourceSharingController selectedTypes](self, "selectedTypes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[DSPublicResourceSharingController publicSharingTypeForIndexPath:](self, "publicSharingTypeForIndexPath:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "addObject:", v7);
  -[DSPublicResourceSharingController _updateButton](self, "_updateButton");
}

- (void)tableView:(id)a3 didDeselectRowAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  void *v7;

  v5 = a4;
  -[DSPublicResourceSharingController selectedTypes](self, "selectedTypes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[DSPublicResourceSharingController publicSharingTypeForIndexPath:](self, "publicSharingTypeForIndexPath:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "removeObject:", v7);
  -[DSPublicResourceSharingController _updateButton](self, "_updateButton");
}

- (DSNavigationDelegate)delegate
{
  return (DSNavigationDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (DSSharingPermissions)permissions
{
  return self->_permissions;
}

- (void)setPermissions:(id)a3
{
  objc_storeStrong((id *)&self->_permissions, a3);
}

- (NSMutableSet)selectedTypes
{
  return self->_selectedTypes;
}

- (void)setSelectedTypes:(id)a3
{
  objc_storeStrong((id *)&self->_selectedTypes, a3);
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (void)setWorkQueue:(id)a3
{
  objc_storeStrong((id *)&self->_workQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_selectedTypes, 0);
  objc_storeStrong((id *)&self->_permissions, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

void __77__DSPublicResourceSharingController_stopSharingTypes_alertLabel_alertDetail___block_invoke_219_cold_1(uint64_t a1, void *a2, uint64_t a3)
{
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v4 = *(void **)(a1 + 32);
  v5 = a2;
  objc_msgSend(v4, "source");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "name");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 138543618;
  v9 = v7;
  v10 = 2114;
  v11 = a3;
  _os_log_error_impl(&dword_2278DF000, v5, OS_LOG_TYPE_ERROR, "Failed to stop all public sharing for sharing type %{public}@ because %{public}@", (uint8_t *)&v8, 0x16u);

}

@end
