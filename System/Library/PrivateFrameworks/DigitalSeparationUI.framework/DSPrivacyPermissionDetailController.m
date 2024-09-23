@implementation DSPrivacyPermissionDetailController

- (DSPrivacyPermissionDetailController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 permission:(id)a6 apps:(id)a7
{
  id v12;
  id v13;
  DSPrivacyPermissionDetailController *v14;
  void *v15;
  void *v16;
  void *v17;
  NSMutableArray *v18;
  NSMutableArray *selectedApps;
  void *v20;
  void *v21;
  uint64_t v22;
  NSArray *apps;
  objc_super v25;

  v12 = a6;
  v13 = a7;
  v25.receiver = self;
  v25.super_class = (Class)DSPrivacyPermissionDetailController;
  v14 = -[DSTableWelcomeController initWithTitle:detailText:icon:shouldShowSearchBar:](&v25, sel_initWithTitle_detailText_icon_shouldShowSearchBar_, a3, a4, 0, 0);
  v15 = (void *)MEMORY[0x24BE2CC48];
  objc_msgSend(v12, "tccPermission");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "iconForPermission:tableFormat:", v16, 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[DSTableWelcomeController addBorderedIcon:](v14, "addBorderedIcon:", v17);

  if (v14)
  {
    objc_storeStrong((id *)&v14->_permission, a6);
    v18 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    selectedApps = v14->_selectedApps;
    v14->_selectedApps = v18;

    v20 = (void *)MEMORY[0x24BE2CC48];
    objc_msgSend(v12, "tccPermission");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "appsWithPermission:fromAllApps:", v21, v13);
    v22 = objc_claimAutoreleasedReturnValue();
    apps = v14->_apps;
    v14->_apps = (NSArray *)v22;

  }
  return v14;
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
  void *v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)DSPrivacyPermissionDetailController;
  -[DSTableWelcomeController viewDidLoad](&v11, sel_viewDidLoad);
  DSUILocStringForKey(CFSTR("SKIP"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[DSUIUtilities setUpBoldButtonForController:title:target:selector:](DSUIUtilities, "setUpBoldButtonForController:title:target:selector:", self, v3, self, sel_back);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[DSTableWelcomeController setBoldButton:](self, "setBoldButton:", v4);

  v5 = (void *)MEMORY[0x24BDD17C8];
  DSUILocStringForKey(CFSTR("STOP_ALL_APP_SHARING"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[DSPrivacyPermissionDetailController permission](self, "permission");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringWithFormat:", v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[DSUIUtilities setUpLinkButtonForController:title:target:selector:](DSUIUtilities, "setUpLinkButtonForController:title:target:selector:", self, v9, self, sel_stopAllPressed);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[DSTableWelcomeController setLinkButton:](self, "setLinkButton:", v10);

}

- (void)returnFromDetailAndResetPermissionForSelectedApps
{
  void *v3;
  void *v4;
  id v5;

  -[DSPrivacyPermissionDetailController delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[DSPrivacyPermissionDetailController selectedApps](self, "selectedApps");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[DSPrivacyPermissionDetailController permission](self, "permission");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "returnFromDetailAndResetPermissionForSelectedApps:permission:", v3, v4);

}

- (void)returnFromDetailAndStopAllSharingForPermission
{
  void *v3;
  id v4;

  -[DSPrivacyPermissionDetailController delegate](self, "delegate");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[DSPrivacyPermissionDetailController permission](self, "permission");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "returnFromDetailAndStopAllSharingForPermission:", v3);

}

- (void)stopAllPressed
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
  _QWORD v16[5];

  v3 = (void *)MEMORY[0x24BE2CC48];
  -[DSPrivacyPermissionDetailController permission](self, "permission");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "tccPermission");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringKeyForPermission:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(CFSTR("RESET_ALL_CONFIRMATION_"), "stringByAppendingString:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  DSUILocStringForKey(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BEBD3B0], "alertControllerWithTitle:message:preferredStyle:", 0, v8, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)MEMORY[0x24BEBD3A8];
  DSUILocStringForKey(CFSTR("CANCEL"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "actionWithTitle:style:handler:", v11, 1, &__block_literal_global_15);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (void *)MEMORY[0x24BEBD3A8];
  DSUILocStringForKey(CFSTR("STOP_ALL_PERMISSION_ACCESS"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __53__DSPrivacyPermissionDetailController_stopAllPressed__block_invoke_2;
  v16[3] = &unk_24EFF3418;
  v16[4] = self;
  objc_msgSend(v13, "actionWithTitle:style:handler:", v14, 2, v16);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "addAction:", v15);
  objc_msgSend(v9, "addAction:", v12);
  -[DSPrivacyPermissionDetailController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v9, 1, 0);

}

uint64_t __53__DSPrivacyPermissionDetailController_stopAllPressed__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "returnFromDetailAndStopAllSharingForPermission");
}

- (void)back
{
  id v2;
  id v3;

  -[DSPrivacyPermissionDetailController navigationController](self, "navigationController");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v2 = (id)objc_msgSend(v3, "popViewControllerAnimated:", 1);

}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v5 = a4;
  -[DSPrivacyPermissionDetailController apps](self, "apps");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "row");

  objc_msgSend(v6, "objectAtIndexedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "appID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[DSUIUtilities appIconForAppID:format:](DSUIUtilities, "appIconForAppID:format:", v9, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[OBTableWelcomeController tableView](self, "tableView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "displayName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[DSIconTableViewCell iconTableViewCellFromTableView:withRightAlignedLabel:detail:icon:](DSIconTableViewCell, "iconTableViewCellFromTableView:withRightAlignedLabel:detail:icon:", v11, v12, &stru_24EFF4790, v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "setAccessoryType:", 0);
  return v13;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  void *v4;
  int64_t v5;

  -[DSPrivacyPermissionDetailController apps](self, "apps", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  return v5;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v5 = a4;
  -[DSPrivacyPermissionDetailController selectedApps](self, "selectedApps");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[DSPrivacyPermissionDetailController apps](self, "apps");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v5, "row");

  objc_msgSend(v7, "objectAtIndexedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v9);

  -[DSPrivacyPermissionDetailController _updateButton](self, "_updateButton");
}

- (void)tableView:(id)a3 didDeselectRowAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v5 = a4;
  -[DSPrivacyPermissionDetailController selectedApps](self, "selectedApps");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[DSPrivacyPermissionDetailController apps](self, "apps");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v5, "row");

  objc_msgSend(v7, "objectAtIndexedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeObject:", v9);

  -[DSPrivacyPermissionDetailController _updateButton](self, "_updateButton");
}

- (void)_updateButton
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  __CFString *v8;
  char **v9;
  void *v10;
  id v11;

  -[DSTableWelcomeController boldButton](self, "boldButton");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeTarget:action:forControlEvents:", 0, 0, 0xFFFFFFFFLL);

  -[OBTableWelcomeController tableView](self, "tableView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "indexPathsForSelectedRows");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  -[DSTableWelcomeController boldButton](self, "boldButton");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    v8 = CFSTR("STOP_ACCESS");
  else
    v8 = CFSTR("SKIP");
  if (v6)
    v9 = &selRef_returnFromDetailAndResetPermissionForSelectedApps;
  else
    v9 = &selRef_back;
  DSUILocStringForKey(v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTitle:forState:", v10, 0);

  -[DSTableWelcomeController boldButton](self, "boldButton");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addTarget:action:forControlEvents:", self, *v9, 64);

}

- (DSSensor)permission
{
  return self->_permission;
}

- (void)setPermission:(id)a3
{
  objc_storeStrong((id *)&self->_permission, a3);
}

- (NSMutableArray)selectedApps
{
  return self->_selectedApps;
}

- (void)setSelectedApps:(id)a3
{
  objc_storeStrong((id *)&self->_selectedApps, a3);
}

- (DSPrivacyPermissionsDelegate)delegate
{
  return (DSPrivacyPermissionsDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSArray)apps
{
  return self->_apps;
}

- (void)setApps:(id)a3
{
  objc_storeStrong((id *)&self->_apps, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_apps, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_selectedApps, 0);
  objc_storeStrong((id *)&self->_permission, 0);
}

@end
