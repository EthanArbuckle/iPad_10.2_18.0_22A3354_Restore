@implementation CKSettingsiMessageAppManager

- (CKSettingsiMessageAppManager)init
{
  CKSettingsiMessageAppManager *v2;
  CKSettingsiMessageAppManager *v3;
  uint64_t v4;
  id payloadProviderExtensionsMonitoringContext;
  uint64_t v6;
  id highMemoryPayloadProviderExtensionsMonitoringContext;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CKSettingsiMessageAppManager;
  v2 = -[CKSettingsiMessageAppManager init](&v9, sel_init);
  v3 = v2;
  if (v2)
  {
    -[CKSettingsiMessageAppManager _beginMonitoringExtensionPoint:](v2, "_beginMonitoringExtensionPoint:", *MEMORY[0x24BE50E68]);
    v4 = objc_claimAutoreleasedReturnValue();
    payloadProviderExtensionsMonitoringContext = v3->_payloadProviderExtensionsMonitoringContext;
    v3->_payloadProviderExtensionsMonitoringContext = (id)v4;

    -[CKSettingsiMessageAppManager _beginMonitoringExtensionPoint:](v3, "_beginMonitoringExtensionPoint:", *MEMORY[0x24BE50E70]);
    v6 = objc_claimAutoreleasedReturnValue();
    highMemoryPayloadProviderExtensionsMonitoringContext = v3->_highMemoryPayloadProviderExtensionsMonitoringContext;
    v3->_highMemoryPayloadProviderExtensionsMonitoringContext = (id)v6;

  }
  return v3;
}

- (NSArray)payloadProviderExtensions
{
  NSArray *payloadProviderExtensions;
  NSArray *v4;
  NSArray *v5;

  payloadProviderExtensions = self->_payloadProviderExtensions;
  if (!payloadProviderExtensions)
  {
    -[CKSettingsiMessageAppManager _loadiMessageAppsSyncronouslyForExtensionPoint:](self, "_loadiMessageAppsSyncronouslyForExtensionPoint:", *MEMORY[0x24BE50E68]);
    v4 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v5 = self->_payloadProviderExtensions;
    self->_payloadProviderExtensions = v4;

    payloadProviderExtensions = self->_payloadProviderExtensions;
  }
  return payloadProviderExtensions;
}

- (NSArray)highMemoryPayloadProviderExtensions
{
  NSArray *highMemoryPayloadProviderExtensions;
  NSArray *v4;
  NSArray *v5;

  highMemoryPayloadProviderExtensions = self->_highMemoryPayloadProviderExtensions;
  if (!highMemoryPayloadProviderExtensions)
  {
    -[CKSettingsiMessageAppManager _loadiMessageAppsSyncronouslyForExtensionPoint:](self, "_loadiMessageAppsSyncronouslyForExtensionPoint:", *MEMORY[0x24BE50E70]);
    v4 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v5 = self->_highMemoryPayloadProviderExtensions;
    self->_highMemoryPayloadProviderExtensions = v4;

    highMemoryPayloadProviderExtensions = self->_highMemoryPayloadProviderExtensions;
  }
  return highMemoryPayloadProviderExtensions;
}

- (NSArray)alliMessageApps
{
  NSArray *alliMessageApps;
  void *v4;
  void *v5;
  NSArray *v6;
  NSArray *v7;

  alliMessageApps = self->_alliMessageApps;
  if (!alliMessageApps)
  {
    -[CKSettingsiMessageAppManager payloadProviderExtensions](self, "payloadProviderExtensions");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKSettingsiMessageAppManager highMemoryPayloadProviderExtensions](self, "highMemoryPayloadProviderExtensions");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "arrayByAddingObjectsFromArray:", v5);
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_alliMessageApps;
    self->_alliMessageApps = v6;

    alliMessageApps = self->_alliMessageApps;
  }
  return alliMessageApps;
}

- (NSArray)deletableiMessageOnlyApps
{
  NSArray *deletableiMessageOnlyApps;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  NSArray *v11;
  NSArray *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  deletableiMessageOnlyApps = self->_deletableiMessageOnlyApps;
  if (!deletableiMessageOnlyApps)
  {
    v4 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    -[CKSettingsiMessageAppManager alliMessageApps](self, "alliMessageApps");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v15;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v15 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
          if (objc_msgSend(v10, "isDeletable") && objc_msgSend(v10, "isiMessageAppOnly"))
            objc_msgSend(v4, "addObject:", v10);
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v7);
    }
    objc_msgSend(v4, "sortedArrayUsingComparator:", &__block_literal_global_1);
    v11 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v12 = self->_deletableiMessageOnlyApps;
    self->_deletableiMessageOnlyApps = v11;

    deletableiMessageOnlyApps = self->_deletableiMessageOnlyApps;
  }
  return deletableiMessageOnlyApps;
}

uint64_t __57__CKSettingsiMessageAppManager_deletableiMessageOnlyApps__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "extensionDisplayName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "extensionDisplayName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "localizedCaseInsensitiveCompare:", v6);
  return v7;
}

- (NSArray)deletableAppsWithiMessageApp
{
  NSArray *deletableAppsWithiMessageApp;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  NSArray *v11;
  NSArray *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  deletableAppsWithiMessageApp = self->_deletableAppsWithiMessageApp;
  if (!deletableAppsWithiMessageApp)
  {
    v4 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    -[CKSettingsiMessageAppManager alliMessageApps](self, "alliMessageApps");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v15;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v15 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
          if (objc_msgSend(v10, "isDeletable") && (objc_msgSend(v10, "isiMessageAppOnly") & 1) == 0)
            objc_msgSend(v4, "addObject:", v10);
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v7);
    }
    objc_msgSend(v4, "sortedArrayUsingComparator:", &__block_literal_global_81);
    v11 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v12 = self->_deletableAppsWithiMessageApp;
    self->_deletableAppsWithiMessageApp = v11;

    deletableAppsWithiMessageApp = self->_deletableAppsWithiMessageApp;
  }
  return deletableAppsWithiMessageApp;
}

uint64_t __60__CKSettingsiMessageAppManager_deletableAppsWithiMessageApp__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "appDisplayName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appDisplayName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "localizedCaseInsensitiveCompare:", v6);
  return v7;
}

- (id)appWithBundleID:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[CKSettingsiMessageAppManager alliMessageApps](self, "alliMessageApps");
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (!v6)
  {
    v10 = 0;
    goto LABEL_15;
  }
  v7 = v6;
  v8 = *(_QWORD *)v17;
  while (2)
  {
    for (i = 0; i != v7; ++i)
    {
      if (*(_QWORD *)v17 != v8)
        objc_enumerationMutation(v5);
      v10 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
      objc_msgSend(v10, "extensionBundleID", (_QWORD)v16);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v4, "isEqualToString:", v11))
      {
        v13 = v10;
LABEL_14:

        goto LABEL_15;
      }
      objc_msgSend(v10, "appBundleID");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v4, "isEqualToString:", v12))
      {
        v14 = v10;

        goto LABEL_14;
      }

    }
    v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    v10 = 0;
    if (v7)
      continue;
    break;
  }
LABEL_15:

  return v10;
}

- (BOOL)haveDeletableApps
{
  void *v3;
  BOOL v4;
  void *v5;

  -[CKSettingsiMessageAppManager deletableAppsWithiMessageApp](self, "deletableAppsWithiMessageApp");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
  {
    v4 = 1;
  }
  else
  {
    -[CKSettingsiMessageAppManager deletableiMessageOnlyApps](self, "deletableiMessageOnlyApps");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v5, "count") != 0;

  }
  return v4;
}

- (void)_clearCacheForDerivableiMessageAppLists
{
  NSArray *alliMessageApps;
  NSArray *deletableiMessageOnlyApps;
  NSArray *deletableAppsWithiMessageApp;

  alliMessageApps = self->_alliMessageApps;
  self->_alliMessageApps = 0;

  deletableiMessageOnlyApps = self->_deletableiMessageOnlyApps;
  self->_deletableiMessageOnlyApps = 0;

  deletableAppsWithiMessageApp = self->_deletableAppsWithiMessageApp;
  self->_deletableAppsWithiMessageApp = 0;

}

- (id)extensionAttributesForExtensionPoint:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  uint64_t v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x24BDAC8D0];
  v7 = *MEMORY[0x24BDD0C48];
  v8[0] = a3;
  v3 = (void *)MEMORY[0x24BDBCE70];
  v4 = a3;
  objc_msgSend(v3, "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_loadiMessageAppsSyncronouslyForExtensionPoint:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  CKSettingsiMessageApp *v15;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  id v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[CKSettingsiMessageAppManager extensionAttributesForExtensionPoint:](self, "extensionAttributesForExtensionPoint:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0;
  objc_msgSend(MEMORY[0x24BDD1550], "extensionsWithMatchingAttributes:error:", v5, &v22);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v22;
  if (v7)
  {
    csui_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[CKSettingsiMessageAppManager _loadiMessageAppsSyncronouslyForExtensionPoint:].cold.1((uint64_t)v4, v8);
    v9 = (id)MEMORY[0x24BDBD1A8];
  }
  else
  {
    v8 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v17 = v6;
    v10 = v6;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v19;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v19 != v13)
            objc_enumerationMutation(v10);
          v15 = -[CKSettingsiMessageApp initWithExtension:]([CKSettingsiMessageApp alloc], "initWithExtension:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i));
          if (v15)
            -[NSObject addObject:](v8, "addObject:", v15);

        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
      }
      while (v12);
    }

    v9 = -[NSObject copy](v8, "copy");
    v6 = v17;
  }

  return v9;
}

- (id)_beginMonitoringExtensionPoint:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;
  id v12;
  id location;

  v4 = a3;
  -[CKSettingsiMessageAppManager extensionAttributesForExtensionPoint:](self, "extensionAttributesForExtensionPoint:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  v6 = (void *)MEMORY[0x24BDD1550];
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __63__CKSettingsiMessageAppManager__beginMonitoringExtensionPoint___block_invoke;
  v10[3] = &unk_24D075528;
  objc_copyWeak(&v12, &location);
  v7 = v4;
  v11 = v7;
  objc_msgSend(v6, "beginMatchingExtensionsWithAttributes:completion:", v5, v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);

  return v8;
}

void __63__CKSettingsiMessageAppManager__beginMonitoringExtensionPoint___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  NSObject *v5;
  uint64_t v6;
  _QWORD block[4];
  id v8;
  id v9;
  id v10;
  uint8_t buf[4];
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  csui_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    v12 = v6;
    _os_log_impl(&dword_2138BA000, v5, OS_LOG_TYPE_DEFAULT, "Received updated extension list for extension point: %@", buf, 0xCu);
  }

  if (WeakRetained)
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __63__CKSettingsiMessageAppManager__beginMonitoringExtensionPoint___block_invoke_85;
    block[3] = &unk_24D075500;
    v8 = v3;
    v9 = *(id *)(a1 + 32);
    v10 = WeakRetained;
    dispatch_async(MEMORY[0x24BDAC9B8], block);

  }
}

void __63__CKSettingsiMessageAppManager__beginMonitoringExtensionPoint___block_invoke_85(id *a1)
{
  id v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  CKSettingsiMessageApp *v9;
  CKSettingsiMessageApp *v10;
  uint64_t v11;
  _QWORD *v12;
  void *v13;
  uint64_t v14;
  _QWORD *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v2 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v3 = a1[4];
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v17;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v17 != v6)
          objc_enumerationMutation(v3);
        v8 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v7);
        v9 = [CKSettingsiMessageApp alloc];
        v10 = -[CKSettingsiMessageApp initWithExtension:](v9, "initWithExtension:", v8, (_QWORD)v16);
        if (v10)
          objc_msgSend(v2, "addObject:", v10);

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v5);
  }

  if (objc_msgSend(a1[5], "isEqualToString:", *MEMORY[0x24BE50E68]))
  {
    v11 = objc_msgSend(v2, "copy");
    v12 = a1[6];
    v13 = (void *)v12[1];
    v12[1] = v11;
LABEL_14:

    goto LABEL_15;
  }
  if (objc_msgSend(a1[5], "isEqualToString:", *MEMORY[0x24BE50E70]))
  {
    v14 = objc_msgSend(v2, "copy");
    v15 = a1[6];
    v13 = (void *)v15[2];
    v15[2] = v14;
    goto LABEL_14;
  }
LABEL_15:
  objc_msgSend(a1[6], "_clearCacheForDerivableiMessageAppLists", (_QWORD)v16);
  objc_msgSend(a1[6], "_notifyForInstalledAppChange");

}

- (void)_notifyForInstalledAppChange
{
  id v2;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:", CFSTR("CKSettingsiMessageAppManagerInstalledAppsDidChange"), 0);

}

- (void)_endMonitoringExtensionInstallation
{
  id payloadProviderExtensionsMonitoringContext;
  id highMemoryPayloadProviderExtensionsMonitoringContext;

  if (self->_payloadProviderExtensionsMonitoringContext)
  {
    objc_msgSend(MEMORY[0x24BDD1550], "endMatchingExtensions:");
    payloadProviderExtensionsMonitoringContext = self->_payloadProviderExtensionsMonitoringContext;
    self->_payloadProviderExtensionsMonitoringContext = 0;

  }
  if (self->_highMemoryPayloadProviderExtensionsMonitoringContext)
  {
    objc_msgSend(MEMORY[0x24BDD1550], "endMatchingExtensions:");
    highMemoryPayloadProviderExtensionsMonitoringContext = self->_highMemoryPayloadProviderExtensionsMonitoringContext;
    self->_highMemoryPayloadProviderExtensionsMonitoringContext = 0;

  }
}

- (void)dealloc
{
  objc_super v3;

  -[CKSettingsiMessageAppManager _endMonitoringExtensionInstallation](self, "_endMonitoringExtensionInstallation");
  v3.receiver = self;
  v3.super_class = (Class)CKSettingsiMessageAppManager;
  -[CKSettingsiMessageAppManager dealloc](&v3, sel_dealloc);
}

- (id)payloadProviderExtensionsMonitoringContext
{
  return self->_payloadProviderExtensionsMonitoringContext;
}

- (void)setPayloadProviderExtensionsMonitoringContext:(id)a3
{
  objc_storeStrong(&self->_payloadProviderExtensionsMonitoringContext, a3);
}

- (id)highMemoryPayloadProviderExtensionsMonitoringContext
{
  return self->_highMemoryPayloadProviderExtensionsMonitoringContext;
}

- (void)setHighMemoryPayloadProviderExtensionsMonitoringContext:(id)a3
{
  objc_storeStrong(&self->_highMemoryPayloadProviderExtensionsMonitoringContext, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_highMemoryPayloadProviderExtensionsMonitoringContext, 0);
  objc_storeStrong(&self->_payloadProviderExtensionsMonitoringContext, 0);
  objc_storeStrong((id *)&self->_deletableiMessageOnlyApps, 0);
  objc_storeStrong((id *)&self->_deletableAppsWithiMessageApp, 0);
  objc_storeStrong((id *)&self->_alliMessageApps, 0);
  objc_storeStrong((id *)&self->_highMemoryPayloadProviderExtensions, 0);
  objc_storeStrong((id *)&self->_payloadProviderExtensions, 0);
}

- (void)_loadiMessageAppsSyncronouslyForExtensionPoint:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_2138BA000, a2, OS_LOG_TYPE_ERROR, "Error loading extensions for extension point: %@", (uint8_t *)&v2, 0xCu);
}

@end
