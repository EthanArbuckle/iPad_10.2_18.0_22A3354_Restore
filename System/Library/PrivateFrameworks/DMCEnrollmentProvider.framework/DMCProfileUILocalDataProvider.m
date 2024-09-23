@implementation DMCProfileUILocalDataProvider

- (BOOL)isProvisionallyEnrolled
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isProvisionallyEnrolled");

  return v3;
}

- (BOOL)isPasscodeSet
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isPasscodeSet");

  return v3;
}

- (id)installedMDMProfileIdentifier
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "installedMDMProfileIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)installedProfileWithIdentifier:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BE63CB0];
  v4 = a3;
  objc_msgSend(v3, "sharedConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "installedProfileWithIdentifier:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)payloadsSummaryForProfile:(id)a3 showManagedPayloads:(BOOL)a4
{
  return +[DMCProfilePayloadsSummary summaryForProfile:showManagedPayloads:dataSource:](DMCProfilePayloadsSummary, "summaryForProfile:showManagedPayloads:dataSource:", a3, a4, 0);
}

- (id)managedAppsUninstalledOnMDMRemoval
{
  return (id)objc_msgSend(MEMORY[0x24BE60DA0], "managedAppsUninstalledOnMDMRemoval");
}

- (id)rmAccount
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x24BDB4398], "defaultStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dmc_visibleRemoteManagementAccounts");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)updateProfileWithIdentifier:(id)a3 interactionDelegate:(id)a4
{
  void *v5;
  id v6;
  id v7;
  id v8;

  v5 = (void *)MEMORY[0x24BE63CB0];
  v6 = a4;
  v7 = a3;
  objc_msgSend(v5, "sharedConnection");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "updateProfileWithIdentifier:interactionDelegate:", v7, v6);

}

- (void)unenrollWithCompletionBlock:(id)a3
{
  void *v3;
  id v4;
  id v5;

  v3 = (void *)MEMORY[0x24BE63CB0];
  v4 = a3;
  objc_msgSend(v3, "sharedConnection");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unenrollWithCompletionBlock:", v4);

}

- (id)rmSpecifierProviderForProfileIdentifier:(id)a3 scope:(int64_t)a4
{
  void *v4;
  RMConfigurationsLocalDataProvider *v5;
  RMConfigurationsSpecifierProvider *v6;
  void *v7;
  RMConfigurationsSpecifierProvider *v8;

  +[DMCProfileUILocalDataProvider localRMUIConfigurationInterfaceForProfileIdentifier:scope:initialLoad:](DMCProfileUILocalDataProvider, "localRMUIConfigurationInterfaceForProfileIdentifier:scope:initialLoad:", a3, a4, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = -[RMConfigurationsLocalDataProvider initWithRMUIConfigurationInterface:]([RMConfigurationsLocalDataProvider alloc], "initWithRMUIConfigurationInterface:", v4);
    v6 = [RMConfigurationsSpecifierProvider alloc];
    objc_msgSend(v4, "rmAccount");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[RMConfigurationsSpecifierProvider initWithAccount:rmDataProvider:](v6, "initWithAccount:rmDataProvider:", v7, v5);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (id)localRMUIConfigurationInterfaceForProfileIdentifier:(id)a3 scope:(int64_t)a4 initialLoad:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  void *v16;

  v5 = a5;
  v8 = a3;
  objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "unverifiedInstalledMDMProfileIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v8, "isEqualToString:", v10) & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDB4398], "defaultStore");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "dmc_visibleRemoteManagementAccounts");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "firstObject");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = objc_alloc(MEMORY[0x24BE7EC98]);
    if (v13)
      v15 = objc_msgSend(v14, "initWithAccount:scope:initialLoad:", v13, a4, v5);
    else
      v15 = objc_msgSend(v14, "initWithMDMProfileIdentifier:scope:initialLoad:", v10, a4, v5);
  }
  else
  {
    objc_msgSend(a1, "_declarationsPayloadIdentifiersForProfileIdentifier:", v8);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v13)
    {
      v16 = 0;
      goto LABEL_9;
    }
    v15 = objc_msgSend(objc_alloc(MEMORY[0x24BE7EC98]), "initWithDeclarationsPayloadIdentifiers:scope:initialLoad:", v13, a4, v5);
  }
  v16 = (void *)v15;
LABEL_9:

  return v16;
}

+ (id)_declarationsPayloadIdentifiersForProfileIdentifier:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "installedProfileWithIdentifier:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = (void *)objc_opt_new();
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    objc_msgSend(v5, "payloads", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v18;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v18 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * v11);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(v12, "identifier");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v6, "addObject:", v13);

          }
          ++v11;
        }
        while (v9 != v11);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v9);
    }

    if (objc_msgSend(v6, "count"))
      v14 = v6;
    else
      v14 = 0;
    v15 = v14;

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

@end
