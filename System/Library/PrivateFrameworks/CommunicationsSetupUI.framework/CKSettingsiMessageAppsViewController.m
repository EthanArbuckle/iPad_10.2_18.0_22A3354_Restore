@implementation CKSettingsiMessageAppsViewController

- (CKSettingsiMessageAppsViewController)initWithAppManager:(id)a3
{
  id v5;
  CKSettingsiMessageAppsViewController *v6;
  void *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CKSettingsiMessageAppsViewController;
  v6 = -[CKSettingsiMessageAppsViewController init](&v9, sel_init);
  if (v6)
  {
    MessagesSettingsLocalizedString(CFSTR("IMESSAGE_APPS_PAGE_TITLE"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKSettingsiMessageAppsViewController setTitle:](v6, "setTitle:", v7);
    objc_storeStrong((id *)&v6->_appManager, a3);

  }
  return v6;
}

- (void)viewDidLoad
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CKSettingsiMessageAppsViewController;
  -[CKSettingsiMessageAppsViewController viewDidLoad](&v4, sel_viewDidLoad);
  objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x24BE75700]), "setEditing:animated:", 1, 0);
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel_installediMessageAppsDidChange_, CFSTR("CKSettingsiMessageAppManagerInstalledAppsDidChange"), 0);

}

- (id)specifiers
{
  uint64_t v3;
  void *v4;
  objc_class *v5;
  void *v6;

  v3 = (int)*MEMORY[0x24BE756E0];
  v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  if (!v4)
  {
    -[CKSettingsiMessageAppsViewController _generateiMessageAppSpecifiers](self, "_generateiMessageAppSpecifiers");
    v5 = (objc_class *)objc_claimAutoreleasedReturnValue();
    v6 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
    *(Class *)((char *)&self->super.super.super.super.super.isa + v3) = v5;

    v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  }
  return v4;
}

- (id)_generateiMessageAppSpecifiers
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  -[CKSettingsiMessageAppsViewController _iMessageOnlyAppsSpecifiers](self, "_iMessageOnlyAppsSpecifiers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObjectsFromArray:", v4);
  -[CKSettingsiMessageAppsViewController _appsWithiMessageAppsSpecifiers](self, "_appsWithiMessageAppsSpecifiers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObjectsFromArray:", v5);
  v6 = (void *)objc_msgSend(v3, "copy");

  return v6;
}

- (id)_specifierForApp:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  v4 = a3;
  if ((objc_msgSend(v4, "isiMessageAppOnly") & 1) != 0)
  {
    objc_msgSend(v4, "extensionBundleID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "extensionDisplayName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = 4;
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE75590]), "initWithName:target:set:get:detail:cell:edit:", v6, 0, 0, 0, 0, 4, 0);
  }
  else
  {
    objc_msgSend(v4, "appBundleID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appDisplayName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE75590]), "initWithName:target:set:get:detail:cell:edit:", v6, self, sel_setIsMessagesAppShownInSendMenu_specifier_, sel_getIsMessagesAppShownInSendMenuForSpecifier_, 0, 6, 0);
    v7 = 0;
  }

  objc_msgSend(v8, "setIdentifier:", v5);
  objc_msgSend(v8, "setProperty:forKey:", v5, *MEMORY[0x24BE75B70]);
  objc_msgSend(v8, "setProperty:forKey:", CFSTR("YES"), *MEMORY[0x24BE75B88]);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setProperty:forKey:", v9, *MEMORY[0x24BE75AD8]);

  return v8;
}

- (id)_iMessageOnlyAppsSpecifiers
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  -[CKSettingsiMessageAppManager deletableiMessageOnlyApps](self->_appManager, "deletableiMessageOnlyApps");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count"))
  {
    MessagesSettingsLocalizedString(CFSTR("IMESSAGE_ONLY_APPS_SECTION_HEADER"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE75590], "groupSpecifierWithID:name:", CFSTR("IMESSAGE_ONLY_APPS"), v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v6);
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v7 = v4;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v16;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v16 != v10)
            objc_enumerationMutation(v7);
          -[CKSettingsiMessageAppsViewController _specifierForApp:](self, "_specifierForApp:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v11), (_QWORD)v15);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "addObject:", v12);

          ++v11;
        }
        while (v9 != v11);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v9);
    }

  }
  v13 = (void *)objc_msgSend(v3, "copy", (_QWORD)v15);

  return v13;
}

- (id)_appsWithiMessageAppsSpecifiers
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  -[CKSettingsiMessageAppManager deletableAppsWithiMessageApp](self->_appManager, "deletableAppsWithiMessageApp");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count"))
  {
    MessagesSettingsLocalizedString(CFSTR("APPS_WITH_IMESSAGE_APPS_SECTION_HEADER"));
    v5 = objc_claimAutoreleasedReturnValue();
    MessagesSettingsLocalizedString(CFSTR("APPS_WITH_IMESSAGE_APPS_SECTION_FOOTER"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)v5;
    objc_msgSend(MEMORY[0x24BE75590], "groupSpecifierWithID:name:", CFSTR("APPS_WITH_IMESSAGE_APPS"), v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setProperty:forKey:", v6, *MEMORY[0x24BE75A68]);
    objc_msgSend(v3, "addObject:", v7);
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v8 = v4;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v18;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v18 != v11)
            objc_enumerationMutation(v8);
          -[CKSettingsiMessageAppsViewController _specifierForApp:](self, "_specifierForApp:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v12));
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "addObject:", v13);

          ++v12;
        }
        while (v10 != v12);
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v10);
    }

  }
  v14 = (void *)objc_msgSend(v3, "copy");

  return v14;
}

- (void)_deleteApp:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;

  objc_msgSend(a3, "appBundleID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)CUTWeakLinkClass();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __51__CKSettingsiMessageAppsViewController__deleteApp___block_invoke;
  v6[3] = &unk_24D075F00;
  v7 = v3;
  v5 = v3;
  objc_msgSend(v4, "uninstallAppWithBundleID:requestUserConfirmation:completion:", v5, 1, v6);

}

void __51__CKSettingsiMessageAppsViewController__deleteApp___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  csui_log();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __51__CKSettingsiMessageAppsViewController__deleteApp___block_invoke_cold_1(a1, (uint64_t)v3, v5);
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6 = *(_QWORD *)(a1 + 32);
    v7 = 138412290;
    v8 = v6;
    _os_log_impl(&dword_2138BA000, v5, OS_LOG_TYPE_DEFAULT, "Uninstalled app with bundleID: %@", (uint8_t *)&v7, 0xCu);
  }

}

- (void)installediMessageAppsDidChange:(id)a3
{
  NSObject *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  id v8;
  uint8_t v9[16];
  uint8_t buf[16];

  csui_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2138BA000, v4, OS_LOG_TYPE_DEFAULT, "iMessage Apps view controller notified of installed apps change", buf, 2u);
  }

  -[CKSettingsiMessageAppsViewController appManager](self, "appManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "haveDeletableApps") & 1) != 0)
  {
    -[CKSettingsiMessageAppsViewController _generateiMessageAppSpecifiers](self, "_generateiMessageAppSpecifiers");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKSettingsiMessageAppsViewController updateSpecifiers:withSpecifiers:](self, "updateSpecifiers:withSpecifiers:", *(Class *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x24BE756E0]), v6);
  }
  else
  {
    csui_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_2138BA000, v7, OS_LOG_TYPE_DEFAULT, "There are no deletable apps remaining, popping the user back to Messages settings.", v9, 2u);
    }

    -[CKSettingsiMessageAppsViewController navigationController](self, "navigationController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (id)objc_msgSend(v6, "popViewControllerAnimated:", 1);
  }

}

- (void)setIsMessagesAppShownInSendMenu:(id)a3 specifier:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v6 = a3;
  objc_msgSend(a4, "identifier");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[CKSettingsiMessageAppManager appWithBundleID:](self->_appManager, "appWithBundleID:", v8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(self) = objc_msgSend(v6, "BOOLValue");

  objc_msgSend(v7, "setHiddenInSendMenuByUserPreference:", self ^ 1);
}

- (id)getIsMessagesAppShownInSendMenuForSpecifier:(id)a3
{
  void *v4;
  void *v5;
  int v6;
  void *v7;

  objc_msgSend(a3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKSettingsiMessageAppManager appWithBundleID:](self->_appManager, "appWithBundleID:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isHiddenInSendMenuByUserPreference");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v6 ^ 1u);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BOOL)_canDeleteAppAtIndexPath:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  char v7;

  -[CKSettingsiMessageAppsViewController specifierAtIndexPath:](self, "specifierAtIndexPath:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKSettingsiMessageAppManager appWithBundleID:](self->_appManager, "appWithBundleID:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isiMessageAppOnly");

  return v7;
}

- (BOOL)tableView:(id)a3 canMoveRowAtIndexPath:(id)a4
{
  return 0;
}

- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4
{
  return -[CKSettingsiMessageAppsViewController _canDeleteAppAtIndexPath:](self, "_canDeleteAppAtIndexPath:", a4);
}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  return 0;
}

- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5
{
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  if (a4 == 1)
  {
    -[CKSettingsiMessageAppsViewController specifierAtIndexPath:](self, "specifierAtIndexPath:", a5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    csui_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v10 = 138412290;
      v11 = v7;
      _os_log_impl(&dword_2138BA000, v8, OS_LOG_TYPE_DEFAULT, "User requested uninstall of app with bundleID: %@", (uint8_t *)&v10, 0xCu);
    }

    -[CKSettingsiMessageAppManager appWithBundleID:](self->_appManager, "appWithBundleID:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKSettingsiMessageAppsViewController _deleteApp:](self, "_deleteApp:", v9);

  }
}

- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4
{
  return -[CKSettingsiMessageAppsViewController _canDeleteAppAtIndexPath:](self, "_canDeleteAppAtIndexPath:", a4);
}

- (BOOL)tableView:(id)a3 shouldIndentWhileEditingRowAtIndexPath:(id)a4
{
  return 0;
}

- (id)tableView:(id)a3 titleForDeleteConfirmationButtonForRowAtIndexPath:(id)a4
{
  return MessagesSettingsLocalizedString(CFSTR("IMESSAGE_APP_DELETE_CONFIRMATION_BUTTON_TITLE"));
}

- (CKSettingsiMessageAppManager)appManager
{
  return self->_appManager;
}

- (void)setAppManager:(id)a3
{
  objc_storeStrong((id *)&self->_appManager, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appManager, 0);
}

void __51__CKSettingsiMessageAppsViewController__deleteApp___block_invoke_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = *(_QWORD *)(a1 + 32);
  v4 = 138412546;
  v5 = v3;
  v6 = 2112;
  v7 = a2;
  _os_log_error_impl(&dword_2138BA000, log, OS_LOG_TYPE_ERROR, "Error uninstalling app: %@. Error: %@", (uint8_t *)&v4, 0x16u);
}

@end
