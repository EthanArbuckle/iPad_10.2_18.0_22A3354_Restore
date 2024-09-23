@implementation PhoneSettingsNetworksController

- (PhoneSettingsNetworksController)init
{
  PhoneSettingsNetworksController *v2;
  PhoneSettingsTelephony *v3;
  PhoneSettingsTelephony *telephonySettings;
  PHNetworkFetcher *v5;
  PHNetworkFetcher *fetcher;
  NSMutableArray *v7;
  NSMutableArray *networksSpecifiersArray;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  void *v15;
  objc_super v17;
  uint8_t buf[4];
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v17.receiver = self;
  v17.super_class = (Class)PhoneSettingsNetworksController;
  v2 = -[PhoneSettingsNetworksController init](&v17, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(PhoneSettingsTelephony);
    telephonySettings = v2->_telephonySettings;
    v2->_telephonySettings = v3;

    -[PhoneSettingsNetworksController _registerEventListeners](v2, "_registerEventListeners");
    v5 = objc_alloc_init(PHNetworkFetcher);
    fetcher = v2->_fetcher;
    v2->_fetcher = v5;

    v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    networksSpecifiersArray = v2->_networksSpecifiersArray;
    v2->_networksSpecifiersArray = v7;

    v9 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    -[PhoneSettingsNetworksController titleSpecifier](v2, "titleSpecifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObject:", v10);

    -[PhoneSettingsNetworksController automaticSpecifier](v2, "automaticSpecifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObject:", v11);

    v12 = (int)*MEMORY[0x24BE756E0];
    v13 = *(Class *)((char *)&v2->super.super.super.super.super.super.isa + v12);
    *(Class *)((char *)&v2->super.super.super.super.super.super.isa + v12) = (Class)v9;

    -[PhoneSettingsNetworksController _updateCachedMobileIdentity](v2, "_updateCachedMobileIdentity");
    PHDefaultLog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      -[PhoneSettingsNetworksController descriptionDictionary](v2, "descriptionDictionary");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v19 = v15;
      _os_log_impl(&dword_21ED2A000, v14, OS_LOG_TYPE_DEFAULT, "Initializing Phone Settings Network Controller: %@", buf, 0xCu);

    }
  }
  return v2;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)PhoneSettingsNetworksController;
  -[PSListItemsController dealloc](&v4, sel_dealloc);
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PhoneSettingsNetworksController;
  -[PSListItemsController viewDidLoad](&v6, sel_viewDidLoad);
  -[PhoneSettingsNetworksController navigationItem](self, "navigationItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Network Selection"), &stru_24E38CD10, CFSTR("Carrier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTitle:", v5);

}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PhoneSettingsNetworksController;
  -[PSListItemsController viewWillAppear:](&v4, sel_viewWillAppear_, a3);
  if (-[PhoneSettingsNetworksController _isInManualMode](self, "_isInManualMode"))
    -[PhoneSettingsNetworksController setShowNetworkList:](self, "setShowNetworkList:", 1);
}

- (BOOL)shouldReloadSpecifiersOnResume
{
  return 0;
}

- (void)listItemSelected:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  unsigned int v8;
  uint64_t v9;
  void *v10;
  void *v11;
  unint64_t v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  int v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  PHDefaultLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v17 = 138412290;
    v18 = v4;
    _os_log_impl(&dword_21ED2A000, v5, OS_LOG_TYPE_DEFAULT, "IndexPath selected: %@", (uint8_t *)&v17, 0xCu);
  }

  if (objc_msgSend(v4, "section") == 1)
  {
    v6 = objc_msgSend(v4, "row");
    -[PhoneSettingsNetworksController searchingSpecifier](self, "searchingSpecifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[PhoneSettingsNetworksController containsSpecifier:](self, "containsSpecifier:", v7);

    v9 = v6 - v8;
    if (v9 < 0
      || (-[PhoneSettingsNetworksController fetcher](self, "fetcher"),
          v10 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v10, "networks"),
          v11 = (void *)objc_claimAutoreleasedReturnValue(),
          v12 = objc_msgSend(v11, "count"),
          v11,
          v10,
          v9 >= v12))
    {
      PHDefaultLog();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        -[PhoneSettingsNetworksController listItemSelected:].cold.1(v9, v15);
    }
    else
    {
      -[PhoneSettingsNetworksController fetcher](self, "fetcher");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "networks");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "objectAtIndex:", v9);
      v15 = objc_claimAutoreleasedReturnValue();

      -[PhoneSettingsNetworksController fetcher](self, "fetcher");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "selectNetwork:", v15);

    }
  }

}

- (void)_handleRadioOffErrorNotification:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  PHDefaultLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "name");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PhoneSettingsNetworksController descriptionDictionary](self, "descriptionDictionary");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138412546;
    v9 = v6;
    v10 = 2112;
    v11 = v7;
    _os_log_impl(&dword_21ED2A000, v5, OS_LOG_TYPE_DEFAULT, "%@: %@", (uint8_t *)&v8, 0x16u);

  }
  -[PhoneSettingsNetworksController popRecursivelyToRootController](self, "popRecursivelyToRootController");

}

- (void)_handleSimChangedNotification:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  int v10;
  void *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  PHDefaultLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "name");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PhoneSettingsNetworksController descriptionDictionary](self, "descriptionDictionary");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138412546;
    v11 = v6;
    v12 = 2112;
    v13 = v7;
    _os_log_impl(&dword_21ED2A000, v5, OS_LOG_TYPE_DEFAULT, "%@: %@", (uint8_t *)&v10, 0x16u);

  }
  -[PhoneSettingsNetworksController telephonySettings](self, "telephonySettings");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "simIsPresent");

  if ((v9 & 1) == 0)
    -[PhoneSettingsNetworksController popRecursivelyToRootController](self, "popRecursivelyToRootController");

}

- (void)_handleNetworkSettingsDisabledNotification:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  PHDefaultLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "name");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PhoneSettingsNetworksController descriptionDictionary](self, "descriptionDictionary");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138412546;
    v9 = v6;
    v10 = 2112;
    v11 = v7;
    _os_log_impl(&dword_21ED2A000, v5, OS_LOG_TYPE_DEFAULT, "%@: %@", (uint8_t *)&v8, 0x16u);

  }
  -[PhoneSettingsNetworksController popRecursivelyToRootController](self, "popRecursivelyToRootController");

}

- (void)_handleNetworksChangedNotification:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  PHDefaultLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "name");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138412290;
    v8 = v6;
    _os_log_impl(&dword_21ED2A000, v5, OS_LOG_TYPE_DEFAULT, "%@", (uint8_t *)&v7, 0xCu);

  }
  -[PhoneSettingsNetworksController updateNetworkListSpecifiers](self, "updateNetworkListSpecifiers");

}

- (void)_handleNetworkFetcherStateChangedNotification:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  int v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  PHDefaultLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "name");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138412290;
    v15 = v6;
    _os_log_impl(&dword_21ED2A000, v5, OS_LOG_TYPE_DEFAULT, "%@", (uint8_t *)&v14, 0xCu);

  }
  -[PhoneSettingsNetworksController fetcher](self, "fetcher");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "state") == 1)
  {
    -[PhoneSettingsNetworksController searchingSpecifier](self, "searchingSpecifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[PhoneSettingsNetworksController containsSpecifier:](self, "containsSpecifier:", v8);

    if (v9)
    {
      -[PhoneSettingsNetworksController searchingSpecifier](self, "searchingSpecifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[PhoneSettingsNetworksController removeSpecifier:animated:](self, "removeSpecifier:animated:", v10, 1);
LABEL_11:

      goto LABEL_12;
    }
  }
  else
  {

  }
  -[PhoneSettingsNetworksController fetcher](self, "fetcher");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "state") != 2 || !-[PhoneSettingsNetworksController showNetworkList](self, "showNetworkList"))
    goto LABEL_11;
  -[PhoneSettingsNetworksController searchingSpecifier](self, "searchingSpecifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[PhoneSettingsNetworksController containsSpecifier:](self, "containsSpecifier:", v11);

  if ((v12 & 1) == 0)
  {
    -[PhoneSettingsNetworksController searchingSpecifier](self, "searchingSpecifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PhoneSettingsNetworksController networksGroupSpecifier](self, "networksGroupSpecifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[PhoneSettingsNetworksController insertSpecifier:afterSpecifier:](self, "insertSpecifier:afterSpecifier:", v10, v13);

    goto LABEL_11;
  }
LABEL_12:

}

- (void)_autoSwitchTurnedOn
{
  void *v3;

  if (!-[PhoneSettingsNetworksController _isInAutomaticMode](self, "_isInAutomaticMode"))
  {
    -[PhoneSettingsNetworksController telephonySettings](self, "telephonySettings");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "enableAutomaticNetworkSelection");

  }
  -[PhoneSettingsNetworksController setShowNetworkList:](self, "setShowNetworkList:", 0);
}

- (void)_autoSwitchTurnedOff
{
  -[PhoneSettingsNetworksController setShowNetworkList:](self, "setShowNetworkList:", 1);
}

- (void)setShowNetworkList:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  if (self->_showNetworkList != a3)
  {
    v3 = a3;
    if (a3)
    {
      -[PhoneSettingsNetworksController fetcher](self, "fetcher");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "fetchNetworkList");

    }
    -[PhoneSettingsNetworksController updateNetworkListSpecifiers](self, "updateNetworkListSpecifiers");
    -[PhoneSettingsNetworksController updateNetworkListSpecifierStates](self, "updateNetworkListSpecifierStates");
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v12 = (id)objc_claimAutoreleasedReturnValue();
    -[PhoneSettingsNetworksController networksGroupSpecifier](self, "networksGroupSpecifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addObject:", v6);

    -[PhoneSettingsNetworksController fetcher](self, "fetcher");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "state");

    if (v8 == 2)
    {
      -[PhoneSettingsNetworksController searchingSpecifier](self, "searchingSpecifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "addObject:", v9);

      -[PSSpecifier propertyForKey:](self->_searchingSpecifier, "propertyForKey:", *MEMORY[0x24BE75D18]);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setLoading:", 1);

    }
    -[PhoneSettingsNetworksController networksSpecifiersArray](self, "networksSpecifiersArray");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addObjectsFromArray:", v11);

    if (v3)
      -[PhoneSettingsNetworksController addSpecifiersFromArray:animated:](self, "addSpecifiersFromArray:animated:", v12, 1);
    else
      -[PhoneSettingsNetworksController removeContiguousSpecifiers:animated:](self, "removeContiguousSpecifiers:animated:", v12, 1);
    self->_showNetworkList = v3;

  }
}

- (void)updateNetworkListSpecifiers
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  PhoneSettingsNetworksController *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t buf[4];
  void *v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v18 = self;
  -[PhoneSettingsNetworksController fetcher](self, "fetcher");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "networks");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v25, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v20;
    v9 = *MEMORY[0x24BE75948];
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v20 != v8)
          objc_enumerationMutation(v5);
        v11 = (void *)MEMORY[0x24BE75590];
        objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * i), "displayName");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v12, 0, 0, 0, 0, 3, 0);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v13, "setProperty:forKey:", objc_opt_class(), v9);
        objc_msgSend(v3, "addObject:", v13);

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v25, 16);
    }
    while (v7);
  }

  PHDefaultLog();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v24 = v3;
    _os_log_impl(&dword_21ED2A000, v14, OS_LOG_TYPE_DEFAULT, "Updating Carrier Specifiers with list: %@", buf, 0xCu);
  }

  if (-[PhoneSettingsNetworksController showNetworkList](v18, "showNetworkList"))
  {
    -[PhoneSettingsNetworksController networksSpecifiersArray](v18, "networksSpecifiersArray");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "count");

    if (v16)
    {
      -[PhoneSettingsNetworksController networksSpecifiersArray](v18, "networksSpecifiersArray");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[PhoneSettingsNetworksController replaceContiguousSpecifiers:withSpecifiers:](v18, "replaceContiguousSpecifiers:withSpecifiers:", v17, v3);

    }
    else
    {
      -[PhoneSettingsNetworksController addSpecifiersFromArray:animated:](v18, "addSpecifiersFromArray:animated:", v3, 1);
    }
  }
  -[PhoneSettingsNetworksController setNetworksSpecifiersArray:](v18, "setNetworksSpecifiersArray:", v3);

}

- (void)updateNetworkListSpecifierStates
{
  NSObject *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  __int128 v7;
  unint64_t v8;
  int *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  unsigned int v15;
  unint64_t v16;
  void *v17;
  _BOOL8 v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  unint64_t v23;
  __int128 v24;
  uint8_t buf[4];
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  PHDefaultLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21ED2A000, v3, OS_LOG_TYPE_DEFAULT, "Updating list specifier states", buf, 2u);
  }

  -[PhoneSettingsNetworksController fetcher](self, "fetcher");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "networks");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6)
  {
    v8 = 0;
    *(_QWORD *)&v7 = 138412290;
    v24 = v7;
    v9 = (int *)MEMORY[0x24BE75700];
    do
    {
      -[PhoneSettingsNetworksController fetcher](self, "fetcher", v24);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "networks");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "objectAtIndexedSubscript:", v8);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      PHDefaultLog();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = v24;
        v26 = v12;
        _os_log_impl(&dword_21ED2A000, v13, OS_LOG_TYPE_DEFAULT, "Updating list specifier for network: %@", buf, 0xCu);
      }

      -[PhoneSettingsNetworksController searchingSpecifier](self, "searchingSpecifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = -[PhoneSettingsNetworksController containsSpecifier:](self, "containsSpecifier:", v14);

      v16 = v8 + v15;
      v17 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + *v9);
      v18 = 1;
      objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForRow:inSection:", v16, 1);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "cellForRowAtIndexPath:", v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v12, "state") != 3)
        v18 = objc_msgSend(v12, "state") == 2;
      objc_msgSend(v20, "setReallyChecked:", v18);

      ++v8;
      -[PhoneSettingsNetworksController fetcher](self, "fetcher");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "networks");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v22, "count");

    }
    while (v23 > v8);
  }
}

- (void)_handleNetworkFetcherErrorNotification:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("LIST_LOAD_ERROR"), &stru_24E38CD10, CFSTR("Carrier"));
  v10 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDF67F0], "alertControllerWithTitle:message:preferredStyle:", v10, v10, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x24BDF67E8];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("OK"), &stru_24E38CD10, CFSTR("Carrier"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "actionWithTitle:style:handler:", v8, 0, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addAction:", v9);

  -[PhoneSettingsNetworksController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v5, 1, 0);
}

- (id)descriptionDictionary
{
  void *v3;
  __CFString *v4;
  void *v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  -[PhoneSettingsNetworksController telephonySettings](self, "telephonySettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "manuallySelectedNetworkDictionary");
  v4 = (__CFString *)objc_claimAutoreleasedReturnValue();

  v5 = (void *)MEMORY[0x24BDBCE70];
  if (v4)
    v6 = v4;
  else
    v6 = CFSTR("--Nil--");
  v7 = (void *)MEMORY[0x24BDD16E0];
  -[PhoneSettingsNetworksController telephonySettings](self, "telephonySettings");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "numberWithInt:", objc_msgSend(v8, "networkSelectionMode"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)CTRegistrationCopyLocalizedOperatorName();
  objc_msgSend(v5, "dictionaryWithObjectsAndKeys:", v6, CFSTR("ManuallySelectedNetworkDictionary"), v9, CFSTR("NetworkSelectionMode"), v10, CFSTR("CTRegistrationCopyLocalizedOperatorName"), CTRegistrationGetStatus(), CFSTR("CTRegistrationGetStatus"), 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dictionaryWithObject:forKey:", v11, CFSTR("PhoneSettingsNetworkState"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (void)_registerEventListeners
{
  id v3;

  -[PhoneSettingsTelephony startWatching](self->_telephonySettings, "startWatching");
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__handleRadioOffErrorNotification_, CFSTR("SettingsTelephonyRadioModuleOffErrorNotification"), self->_telephonySettings);
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__handleSimChangedNotification_, CFSTR("SettingsTelephonySIMRemoved"), self->_telephonySettings);
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__handleNetworkSettingsDisabledNotification_, CFSTR("SettingsTelephonyNetworkSettingsDisabledNotification"), self->_telephonySettings);
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__handleNetworksChangedNotification_, CFSTR("PHNetworkFetcherNetworksChangedNotification"), 0);
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__handleNetworkFetcherStateChangedNotification_, CFSTR("PHNetworkFetcherStateChangedNotification"), 0);
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__handleNetworkFetcherNetworkSelectionStateChangedNotification_, CFSTR("PHNetworkFetcherNetworkSelectionChangedNotification"), 0);
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__handleNetworkFetcherErrorNotification_, CFSTR("PHNetworkFetcherErrorNotification"), 0);
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__settingsResumed, *MEMORY[0x24BDF75D0], 0);

}

- (void)setAutomaticSwitchState:(id)a3 forSpecifier:(id)a4
{
  id v6;
  id v7;
  id v8;
  int v9;
  NSObject *v10;
  const __CFString *v11;
  int v12;
  const __CFString *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[PhoneSettingsNetworksController automaticSpecifier](self, "automaticSpecifier");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (v8 == v7)
  {
    v9 = objc_msgSend(v6, "BOOLValue");
    PHDefaultLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = CFSTR("NO");
      if (v9)
        v11 = CFSTR("YES");
      v12 = 138412290;
      v13 = v11;
      _os_log_impl(&dword_21ED2A000, v10, OS_LOG_TYPE_DEFAULT, "Setting automatic switch to %@", (uint8_t *)&v12, 0xCu);
    }

    if (v9)
      -[PhoneSettingsNetworksController _autoSwitchTurnedOn](self, "_autoSwitchTurnedOn");
    else
      -[PhoneSettingsNetworksController _autoSwitchTurnedOff](self, "_autoSwitchTurnedOff");
  }

}

- (id)getAutomaticSwitchStateForSpecifier:(id)a3
{
  id v4;
  id v5;
  _BOOL8 v6;
  void *v7;

  v4 = a3;
  -[PhoneSettingsNetworksController automaticSpecifier](self, "automaticSpecifier");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  v6 = v5 == v4 && -[PhoneSettingsNetworksController _isInAutomaticMode](self, "_isInAutomaticMode");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)_setAutomaticSwitchOn:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  const __CFString *v10;
  int v11;
  void *v12;
  __int16 v13;
  const __CFString *v14;
  uint64_t v15;

  v4 = a4;
  v5 = a3;
  v15 = *MEMORY[0x24BDAC8D0];
  -[PhoneSettingsNetworksController automaticSpecifier](self, "automaticSpecifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "propertyForKey:", *MEMORY[0x24BE75D18]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "control");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  PHDefaultLog();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = CFSTR("NO");
    if (v5)
      v10 = CFSTR("YES");
    v11 = 138412546;
    v12 = v8;
    v13 = 2112;
    v14 = v10;
    _os_log_impl(&dword_21ED2A000, v9, OS_LOG_TYPE_DEFAULT, "Updating automatic switch UI %@ to %@", (uint8_t *)&v11, 0x16u);
  }

  objc_msgSend(v8, "setOn:animated:", v5, v4);
}

- (BOOL)_isInAutomaticMode
{
  void *v2;
  int v3;

  -[PhoneSettingsNetworksController telephonySettings](self, "telephonySettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "networkSelectionMode");

  return v3 == 0;
}

- (BOOL)_isInManualMode
{
  void *v2;
  int v3;

  -[PhoneSettingsNetworksController telephonySettings](self, "telephonySettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "networkSelectionMode");

  return v3 == 1;
}

- (int)_currentNetworkSelectionState
{
  void *v2;
  int v3;

  -[PhoneSettingsNetworksController telephonySettings](self, "telephonySettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "currentNetworkSelectionState");

  return v3;
}

- (void)_settingsResumed
{
  void *v3;
  char v4;
  int v5;
  void *v6;

  v6 = (void *)-[NSString copy](self->_cachedMobileIdentity, "copy");
  -[PhoneSettingsNetworksController _updateCachedMobileIdentity](self, "_updateCachedMobileIdentity");
  v3 = v6;
  if (v6)
  {
    v4 = objc_msgSend(v6, "isEqualToString:", self->_cachedMobileIdentity);
    v3 = v6;
    if ((v4 & 1) == 0)
    {
      v5 = -[PhoneSettingsNetworksController isViewLoaded](self, "isViewLoaded");
      v3 = v6;
      if (v5)
      {
        -[PhoneSettingsNetworksController popRecursivelyToRootController](self, "popRecursivelyToRootController");
        v3 = v6;
      }
    }
  }

}

- (void)_updateCachedMobileIdentity
{
  const void *v3;
  NSString *cachedMobileIdentity;

  v3 = (const void *)_CTServerConnectionCreate();
  cachedMobileIdentity = self->_cachedMobileIdentity;
  self->_cachedMobileIdentity = 0;

  if (v3)
  {
    _CTServerConnectionCopyMobileEquipmentInfo();
    CFRelease(v3);

  }
}

- (PSSpecifier)titleSpecifier
{
  PSSpecifier *titleSpecifier;
  void *v4;
  void *v5;
  void *v6;
  PSSpecifier *v7;
  PSSpecifier *v8;

  titleSpecifier = self->_titleSpecifier;
  if (!titleSpecifier)
  {
    v4 = (void *)MEMORY[0x24BE75590];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("CARRIER_LIST_TITLE"), &stru_24E38CD10, CFSTR("Carrier"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "groupSpecifierWithName:", v6);
    v7 = (PSSpecifier *)objc_claimAutoreleasedReturnValue();
    v8 = self->_titleSpecifier;
    self->_titleSpecifier = v7;

    -[PSSpecifier setProperty:forKey:](self->_titleSpecifier, "setProperty:forKey:", objc_opt_class(), *MEMORY[0x24BE75948]);
    titleSpecifier = self->_titleSpecifier;
  }
  return titleSpecifier;
}

- (PSSpecifier)automaticSpecifier
{
  PSSpecifier *automaticSpecifier;
  void *v4;
  void *v5;
  void *v6;
  PSSpecifier *v7;
  PSSpecifier *v8;

  automaticSpecifier = self->_automaticSpecifier;
  if (!automaticSpecifier)
  {
    v4 = (void *)MEMORY[0x24BE75590];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("Automatic"), &stru_24E38CD10, CFSTR("Carrier"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v6, self, sel_setAutomaticSwitchState_forSpecifier_, sel_getAutomaticSwitchStateForSpecifier_, 0, 6, 0);
    v7 = (PSSpecifier *)objc_claimAutoreleasedReturnValue();
    v8 = self->_automaticSpecifier;
    self->_automaticSpecifier = v7;

    automaticSpecifier = self->_automaticSpecifier;
  }
  return automaticSpecifier;
}

- (PSSpecifier)searchingSpecifier
{
  PSSpecifier *searchingSpecifier;
  void *v4;
  void *v5;
  void *v6;
  PSSpecifier *v7;
  PSSpecifier *v8;

  searchingSpecifier = self->_searchingSpecifier;
  if (!searchingSpecifier)
  {
    v4 = (void *)MEMORY[0x24BE75590];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("SEARCHING"), &stru_24E38CD10, CFSTR("Carrier"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v6, self, 0, 0, 0, 4, 0);
    v7 = (PSSpecifier *)objc_claimAutoreleasedReturnValue();
    v8 = self->_searchingSpecifier;
    self->_searchingSpecifier = v7;

    -[PSSpecifier setProperty:forKey:](self->_searchingSpecifier, "setProperty:forKey:", *MEMORY[0x24BDBD268], *MEMORY[0x24BE75A18]);
    -[PSSpecifier setProperty:forKey:](self->_searchingSpecifier, "setProperty:forKey:", objc_opt_class(), *MEMORY[0x24BE75948]);
    searchingSpecifier = self->_searchingSpecifier;
  }
  return searchingSpecifier;
}

- (PSSpecifier)networksGroupSpecifier
{
  PSSpecifier *networksGroupSpecifier;
  PSSpecifier *v4;
  PSSpecifier *v5;

  networksGroupSpecifier = self->_networksGroupSpecifier;
  if (!networksGroupSpecifier)
  {
    objc_msgSend(MEMORY[0x24BE75590], "emptyGroupSpecifier");
    v4 = (PSSpecifier *)objc_claimAutoreleasedReturnValue();
    v5 = self->_networksGroupSpecifier;
    self->_networksGroupSpecifier = v4;

    networksGroupSpecifier = self->_networksGroupSpecifier;
  }
  return networksGroupSpecifier;
}

- (PhoneSettingsTelephony)telephonySettings
{
  return self->_telephonySettings;
}

- (PHNetworkFetcher)fetcher
{
  return (PHNetworkFetcher *)objc_getProperty(self, a2, 1424, 1);
}

- (void)setFetcher:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1424);
}

- (BOOL)showNetworkList
{
  return self->_showNetworkList;
}

- (void)setTitleSpecifier:(id)a3
{
  objc_storeStrong((id *)&self->_titleSpecifier, a3);
}

- (void)setAutomaticSpecifier:(id)a3
{
  objc_storeStrong((id *)&self->_automaticSpecifier, a3);
}

- (void)setNetworksGroupSpecifier:(id)a3
{
  objc_storeStrong((id *)&self->_networksGroupSpecifier, a3);
}

- (void)setSearchingSpecifier:(id)a3
{
  objc_storeStrong((id *)&self->_searchingSpecifier, a3);
}

- (NSMutableArray)networksSpecifiersArray
{
  return (NSMutableArray *)objc_getProperty(self, a2, 1464, 1);
}

- (void)setNetworksSpecifiersArray:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1464);
}

- (NSString)cachedMobileIdentity
{
  return (NSString *)objc_getProperty(self, a2, 1472, 1);
}

- (void)setCachedMobileIdentity:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1472);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedMobileIdentity, 0);
  objc_storeStrong((id *)&self->_networksSpecifiersArray, 0);
  objc_storeStrong((id *)&self->_searchingSpecifier, 0);
  objc_storeStrong((id *)&self->_networksGroupSpecifier, 0);
  objc_storeStrong((id *)&self->_automaticSpecifier, 0);
  objc_storeStrong((id *)&self->_titleSpecifier, 0);
  objc_storeStrong((id *)&self->_fetcher, 0);
  objc_storeStrong((id *)&self->_telephonySettings, 0);
}

- (void)listItemSelected:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 134217984;
  v3 = a1;
  _os_log_error_impl(&dword_21ED2A000, a2, OS_LOG_TYPE_ERROR, "No network found at index %ld", (uint8_t *)&v2, 0xCu);
}

@end
