@implementation DSPrivacyAppDetailController

- (DSPrivacyAppDetailController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 app:(id)a6
{
  id v10;
  DSPrivacyAppDetailController *v11;
  void *v12;
  void *v13;
  NSArray *v14;
  NSArray *sortedPermissions;
  NSMutableArray *v16;
  NSMutableArray *selectedPermissions;
  id v18;
  uint64_t v19;
  NSArray *v20;
  objc_super v22;

  v10 = a6;
  v22.receiver = self;
  v22.super_class = (Class)DSPrivacyAppDetailController;
  v11 = -[DSTableWelcomeController initWithTitle:detailText:icon:shouldShowSearchBar:](&v22, sel_initWithTitle_detailText_icon_shouldShowSearchBar_, a3, a4, 0, 0);
  objc_msgSend(v10, "appID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[DSUIUtilities appIconForAppID:format:](DSUIUtilities, "appIconForAppID:format:", v12, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[DSTableWelcomeController addBorderedIcon:](v11, "addBorderedIcon:", v13);

  if (v11)
  {
    objc_storeStrong((id *)&v11->_app, a6);
    v14 = (NSArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    sortedPermissions = v11->_sortedPermissions;
    v11->_sortedPermissions = v14;

    v16 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    selectedPermissions = v11->_selectedPermissions;
    v11->_selectedPermissions = v16;

    v18 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    objc_msgSend(MEMORY[0x24BE2CC48], "ensureApp:inSensorDict:", v11->_app, v18);
    objc_msgSend(MEMORY[0x24BE2CC48], "sortSensorDict:", v18);
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = v11->_sortedPermissions;
    v11->_sortedPermissions = (NSArray *)v19;

  }
  return v11;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)DSPrivacyAppDetailController;
  -[DSTableWelcomeController viewDidLoad](&v7, sel_viewDidLoad);
  DSUILocStringForKey(CFSTR("SKIP"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[DSUIUtilities setUpBoldButtonForController:title:target:selector:](DSUIUtilities, "setUpBoldButtonForController:title:target:selector:", self, v3, self, sel_back);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[DSTableWelcomeController setBoldButton:](self, "setBoldButton:", v4);

  DSUILocStringForKey(CFSTR("DELETE_APP"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[DSUIUtilities setUpLinkButtonForController:title:target:selector:](DSUIUtilities, "setUpLinkButtonForController:title:target:selector:", self, v5, self, sel_returnFromDetailAndDeleteApp);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[DSTableWelcomeController setLinkButton:](self, "setLinkButton:", v6);

}

- (void)returnFromDetailAndRevokeSelectedPermissions
{
  void *v3;
  void *v4;
  id v5;

  -[DSPrivacyAppDetailController delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[DSPrivacyAppDetailController selectedPermissions](self, "selectedPermissions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[DSPrivacyAppDetailController app](self, "app");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "returnFromDetailAndResetSelectedPermissions:forApp:", v3, v4);

}

- (void)returnFromDetailAndDeleteApp
{
  void *v3;
  id v4;

  -[DSPrivacyAppDetailController delegate](self, "delegate");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[DSPrivacyAppDetailController app](self, "app");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "returnFromDetailAndDeleteApp:", v3);

}

- (void)back
{
  id v2;
  id v3;

  -[DSPrivacyAppDetailController navigationController](self, "navigationController");
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
  int v11;
  void *v12;
  __CFString *v13;
  __CFString *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;

  v5 = a4;
  -[DSPrivacyAppDetailController sortedPermissions](self, "sortedPermissions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "row");

  objc_msgSend(v6, "objectAtIndexedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "tccPermission");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "isEqualToString:", CFSTR("DSLocationAlways")))
  {

  }
  else
  {
    objc_msgSend(v8, "tccPermission");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "isEqualToString:", CFSTR("DSLocationWhenInUse"));

    if (!v11)
    {
      v14 = &stru_24EFF4790;
      goto LABEL_9;
    }
  }
  objc_msgSend(v8, "tccPermission");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v12, "isEqualToString:", CFSTR("DSLocationAlways")))
    v13 = CFSTR("LOCATION_ALWAYS");
  else
    v13 = CFSTR("LOCATION_WHILE_USING");
  DSUILocStringForKey(v13);
  v14 = (__CFString *)objc_claimAutoreleasedReturnValue();

LABEL_9:
  v15 = (void *)MEMORY[0x24BE2CC48];
  objc_msgSend(v8, "tccPermission");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "iconForPermission:tableFormat:", v16, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  -[OBTableWelcomeController tableView](self, "tableView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localizedName");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  +[DSIconTableViewCell iconTableViewCellFromTableView:withRightAlignedLabel:detail:icon:](DSIconTableViewCell, "iconTableViewCellFromTableView:withRightAlignedLabel:detail:icon:", v18, v19, v14, v17);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v20, "setAccessoryType:", 0);
  return v20;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return -[NSArray count](self->_sortedPermissions, "count", a3, a4);
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v5 = a4;
  -[DSPrivacyAppDetailController selectedPermissions](self, "selectedPermissions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[DSPrivacyAppDetailController sortedPermissions](self, "sortedPermissions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v5, "row");

  objc_msgSend(v7, "objectAtIndexedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v9);

  -[DSPrivacyAppDetailController _updateButton](self, "_updateButton");
}

- (void)tableView:(id)a3 didDeselectRowAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v5 = a4;
  -[DSPrivacyAppDetailController selectedPermissions](self, "selectedPermissions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[DSPrivacyAppDetailController sortedPermissions](self, "sortedPermissions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v5, "row");

  objc_msgSend(v7, "objectAtIndexedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeObject:", v9);

  -[DSPrivacyAppDetailController _updateButton](self, "_updateButton");
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
    v9 = &selRef_returnFromDetailAndRevokeSelectedPermissions;
  else
    v9 = &selRef_back;
  DSUILocStringForKey(v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTitle:forState:", v10, 0);

  -[DSTableWelcomeController boldButton](self, "boldButton");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addTarget:action:forControlEvents:", self, *v9, 64);

}

- (DSApp)app
{
  return self->_app;
}

- (void)setApp:(id)a3
{
  objc_storeStrong((id *)&self->_app, a3);
}

- (NSMutableArray)selectedPermissions
{
  return self->_selectedPermissions;
}

- (void)setSelectedPermissions:(id)a3
{
  objc_storeStrong((id *)&self->_selectedPermissions, a3);
}

- (DSPrivacyPermissionsDelegate)delegate
{
  return (DSPrivacyPermissionsDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSArray)sortedPermissions
{
  return self->_sortedPermissions;
}

- (void)setSortedPermissions:(id)a3
{
  objc_storeStrong((id *)&self->_sortedPermissions, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sortedPermissions, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_selectedPermissions, 0);
  objc_storeStrong((id *)&self->_app, 0);
}

@end
