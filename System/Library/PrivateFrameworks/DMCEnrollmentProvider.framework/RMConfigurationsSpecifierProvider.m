@implementation RMConfigurationsSpecifierProvider

- (RMConfigurationsSpecifierProvider)initWithAccount:(id)a3 rmDataProvider:(id)a4
{
  id v7;
  uint64_t v8;
  RMConfigurationsSpecifierProvider *v9;
  RMConfigurationsSpecifierProvider *v10;
  uint64_t v11;
  NSMutableArray *sectionTitles;
  uint64_t v13;
  NSMutableArray *sectionedSpecifiers;
  objc_super v16;

  v7 = a4;
  v8 = *MEMORY[0x24BE7ECA0];
  v16.receiver = self;
  v16.super_class = (Class)RMConfigurationsSpecifierProvider;
  v9 = -[DMCSpecifierProvider initWithAccount:reloadNotification:isLocalNotification:reloadIfMissingRMAccount:](&v16, sel_initWithAccount_reloadNotification_isLocalNotification_reloadIfMissingRMAccount_, a3, v8, 0, 1);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_rmDataProvider, a4);
    v11 = objc_opt_new();
    sectionTitles = v10->_sectionTitles;
    v10->_sectionTitles = (NSMutableArray *)v11;

    v13 = objc_opt_new();
    sectionedSpecifiers = v10->_sectionedSpecifiers;
    v10->_sectionedSpecifiers = (NSMutableArray *)v13;

  }
  return v10;
}

- (id)specifiersReloadedNotificationName
{
  return CFSTR("RMConfigurationsSpecifiersDidChangeNotification");
}

- (id)specifiers
{
  void *v3;
  void *v5;
  NSMutableArray *v6;
  NSMutableArray *sectionTitles;
  NSMutableArray *v8;
  NSMutableArray *sectionedSpecifiers;
  void *v10;
  void *v11;
  void *v12;
  objc_super v13;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)RMConfigurationsSpecifierProvider;
  -[DMCSpecifierProvider specifiers](&v14, sel_specifiers);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v13.receiver = self;
    v13.super_class = (Class)RMConfigurationsSpecifierProvider;
    -[DMCSpecifierProvider specifiers](&v13, sel_specifiers);
    return (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = (void *)objc_opt_new();
    v6 = (NSMutableArray *)objc_opt_new();
    sectionTitles = self->_sectionTitles;
    self->_sectionTitles = v6;

    v8 = (NSMutableArray *)objc_opt_new();
    sectionedSpecifiers = self->_sectionedSpecifiers;
    self->_sectionedSpecifiers = v8;

    -[RMConfigurationsSpecifierProvider _profileSpecifiers](self, "_profileSpecifiers");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObjectsFromArray:", v10);

    -[RMConfigurationsSpecifierProvider _pluginSpecifiers](self, "_pluginSpecifiers");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObjectsFromArray:", v11);

    -[DMCSpecifierProvider cachedSpecifiers:](self, "cachedSpecifiers:", v5);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    return v12;
  }
}

- (id)tableSectionCellsForSpecifiersInTableView:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id obj;
  uint64_t v19;
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[RMConfigurationsSpecifierProvider specifiers](self, "specifiers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v20 = (id)objc_opt_new();
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    -[RMConfigurationsSpecifierProvider sectionedSpecifiers](self, "sectionedSpecifiers");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    if (v6)
    {
      v7 = v6;
      v19 = *(_QWORD *)v26;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v26 != v19)
            objc_enumerationMutation(obj);
          v9 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * v8);
          v10 = (void *)objc_opt_new();
          v21 = 0u;
          v22 = 0u;
          v23 = 0u;
          v24 = 0u;
          v11 = v9;
          v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
          if (v12)
          {
            v13 = v12;
            v14 = *(_QWORD *)v22;
            do
            {
              v15 = 0;
              do
              {
                if (*(_QWORD *)v22 != v14)
                  objc_enumerationMutation(v11);
                -[DMCSpecifierProvider cellForSpecifier:inTableView:](self, "cellForSpecifier:inTableView:", *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * v15), v4);
                v16 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v10, "addObject:", v16);

                ++v15;
              }
              while (v13 != v15);
              v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
            }
            while (v13);
          }

          objc_msgSend(v20, "addObject:", v10);
          ++v8;
        }
        while (v8 != v7);
        v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
      }
      while (v7);
    }

  }
  else
  {
    v20 = (id)MEMORY[0x24BDBD1A8];
  }

  return v20;
}

- (id)_profileSpecifiers
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  int v11;
  uint64_t v12;
  char *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSMutableArray *sectionTitles;
  void *v21;
  void *v23;
  uint64_t v24;
  id obj;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _QWORD v30[2];
  _QWORD v31[2];
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  -[RMConfigurationsSpecifierProvider rmDataProvider](self, "rmDataProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "profileViewModels");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v4, "count"))
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(v4, "count"));
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v23 = v4;
    obj = v4;
    v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v32, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v27;
      v24 = *MEMORY[0x24BE75AC8];
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v27 != v8)
            objc_enumerationMutation(obj);
          v10 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
          v11 = objc_msgSend(v10, "isInteractiveProfile");
          v12 = objc_opt_class();
          if (v11)
            v13 = sel__isActivatedProfileText_;
          else
            v13 = 0;
          v14 = (void *)MEMORY[0x24BE75590];
          objc_msgSend(v10, "title");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v15, self, 0, v13, v12, 2, 0);
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          if (objc_msgSend(v10, "symbol") == 1)
          {
            +[DMCIconFactory gearIcon](DMCIconFactory, "gearIcon");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "setProperty:forKey:", v17, v24);

          }
          v30[0] = CFSTR("RMConfigurationViewModelKey");
          v30[1] = CFSTR("RMConfigurationDataProviderKey");
          v31[0] = v10;
          -[RMConfigurationsSpecifierProvider rmDataProvider](self, "rmDataProvider");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v31[1] = v18;
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v31, v30, 2);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "setUserInfo:", v19);

          objc_msgSend(v5, "addObject:", v16);
        }
        v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v32, 16);
      }
      while (v7);
    }

    sectionTitles = self->_sectionTitles;
    DMCEnrollmentLocalizedString(CFSTR("DMC_CONFIGURATIONS_SECTION_PROFILES"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray addObject:](sectionTitles, "addObject:", v21);

    -[NSMutableArray addObject:](self->_sectionedSpecifiers, "addObject:", v5);
    v4 = v23;
  }
  else
  {
    v5 = (void *)MEMORY[0x24BDBD1A8];
  }

  return v5;
}

- (id)_pluginSpecifiers
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSMutableArray *sectionTitles;
  void *v24;
  void *v26;
  id obj;
  uint64_t v28;
  id v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _QWORD v41[2];
  _QWORD v42[2];
  _BYTE v43[128];
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  -[RMConfigurationsSpecifierProvider rmDataProvider](self, "rmDataProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "pluginSectionViewModels");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v4, "count"))
  {
    v29 = (id)objc_opt_new();
    v37 = 0u;
    v38 = 0u;
    v39 = 0u;
    v40 = 0u;
    v26 = v4;
    obj = v4;
    v30 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v44, 16);
    if (v30)
    {
      v28 = *(_QWORD *)v38;
      v5 = *MEMORY[0x24BE75AC8];
      do
      {
        v6 = 0;
        do
        {
          if (*(_QWORD *)v38 != v28)
            objc_enumerationMutation(obj);
          v32 = v6;
          v7 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * v6);
          v8 = (void *)MEMORY[0x24BDBCEB8];
          objc_msgSend(v7, "viewModels");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "arrayWithCapacity:", objc_msgSend(v9, "count"));
          v10 = (void *)objc_claimAutoreleasedReturnValue();

          v35 = 0u;
          v36 = 0u;
          v33 = 0u;
          v34 = 0u;
          v31 = v7;
          objc_msgSend(v7, "viewModels");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v33, v43, 16);
          if (v12)
          {
            v13 = v12;
            v14 = *(_QWORD *)v34;
            do
            {
              for (i = 0; i != v13; ++i)
              {
                if (*(_QWORD *)v34 != v14)
                  objc_enumerationMutation(v11);
                v16 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
                v17 = (void *)MEMORY[0x24BE75590];
                objc_msgSend(v16, "title");
                v18 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v17, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v18, self, 0, 0, objc_opt_class(), 2, 0);
                v19 = (void *)objc_claimAutoreleasedReturnValue();

                -[RMConfigurationsSpecifierProvider _iconForSymbol:](self, "_iconForSymbol:", objc_msgSend(v16, "symbol"));
                v20 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v19, "setProperty:forKey:", v20, v5);

                v41[0] = CFSTR("RMConfigurationViewModelKey");
                v41[1] = CFSTR("RMConfigurationDataProviderKey");
                v42[0] = v16;
                -[RMConfigurationsSpecifierProvider rmDataProvider](self, "rmDataProvider");
                v21 = (void *)objc_claimAutoreleasedReturnValue();
                v42[1] = v21;
                objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v42, v41, 2);
                v22 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v19, "setUserInfo:", v22);

                objc_msgSend(v10, "addObject:", v19);
              }
              v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v33, v43, 16);
            }
            while (v13);
          }

          objc_msgSend(v29, "addObjectsFromArray:", v10);
          sectionTitles = self->_sectionTitles;
          objc_msgSend(v31, "heading");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableArray addObject:](sectionTitles, "addObject:", v24);

          -[NSMutableArray addObject:](self->_sectionedSpecifiers, "addObject:", v10);
          v6 = v32 + 1;
        }
        while (v32 + 1 != v30);
        v30 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v44, 16);
      }
      while (v30);
    }

    v4 = v26;
  }
  else
  {
    v29 = (id)MEMORY[0x24BDBD1A8];
  }

  return v29;
}

- (id)_isActivatedProfileText:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a3, "userInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("RMConfigurationViewModelKey"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "value");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_iconForSymbol:(signed __int16)a3
{
  void *v3;

  switch(a3)
  {
    case 2:
      +[DMCIconFactory keyIcon](DMCIconFactory, "keyIcon");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 3:
      +[DMCIconFactory accountIcon](DMCIconFactory, "accountIcon");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 4:
      +[DMCIconFactory appIcon](DMCIconFactory, "appIcon");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    default:
      +[DMCIconFactory gearIcon](DMCIconFactory, "gearIcon");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
  }
  return v3;
}

- (NSMutableArray)sectionTitles
{
  return self->_sectionTitles;
}

- (void)setSectionTitles:(id)a3
{
  objc_storeStrong((id *)&self->_sectionTitles, a3);
}

- (NSMutableArray)sectionedSpecifiers
{
  return self->_sectionedSpecifiers;
}

- (void)setSectionedSpecifiers:(id)a3
{
  objc_storeStrong((id *)&self->_sectionedSpecifiers, a3);
}

- (RMConfigurationsDataProvider)rmDataProvider
{
  return self->_rmDataProvider;
}

- (void)setRmDataProvider:(id)a3
{
  objc_storeStrong((id *)&self->_rmDataProvider, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rmDataProvider, 0);
  objc_storeStrong((id *)&self->_sectionedSpecifiers, 0);
  objc_storeStrong((id *)&self->_sectionTitles, 0);
}

@end
