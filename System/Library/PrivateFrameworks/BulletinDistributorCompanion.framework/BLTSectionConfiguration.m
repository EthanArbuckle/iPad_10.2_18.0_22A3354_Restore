@implementation BLTSectionConfiguration

- (BLTSectionConfiguration)initWithWatchKitAppList:(id)a3
{
  id v5;
  BLTSectionConfiguration *v6;
  BLTSectionConfiguration *v7;
  id *p_watchKitAppList;
  NSCondition *v9;
  NSCondition *watchKitAppListLoadedCondition;
  id v11;
  _QWORD v13[4];
  BLTSectionConfiguration *v14;
  objc_super v15;

  v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)BLTSectionConfiguration;
  v6 = -[BLTSectionConfigurationInternal init](&v15, sel_init);
  v7 = v6;
  if (v6)
  {
    p_watchKitAppList = (id *)&v6->_watchKitAppList;
    objc_storeStrong((id *)&v6->_watchKitAppList, a3);
    objc_msgSend(*p_watchKitAppList, "setDelegate:", v7);
    v9 = (NSCondition *)objc_alloc_init(MEMORY[0x24BDD14C8]);
    watchKitAppListLoadedCondition = v7->_watchKitAppListLoadedCondition;
    v7->_watchKitAppListLoadedCondition = v9;

    if ((objc_msgSend(*p_watchKitAppList, "isLoaded") & 1) == 0)
    {
      v11 = *p_watchKitAppList;
      v13[0] = MEMORY[0x24BDAC760];
      v13[1] = 3221225472;
      v13[2] = __51__BLTSectionConfiguration_initWithWatchKitAppList___block_invoke;
      v13[3] = &unk_24D761AD0;
      v14 = v7;
      objc_msgSend(v11, "fetchWatchKitInfoWithCompletion:", v13);

    }
  }

  return v7;
}

uint64_t __51__BLTSectionConfiguration_initWithWatchKitAppList___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "lock");
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 32) = 1;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "signal");
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "unlock");
}

- (void)_waitForWatchKitAppListLoaded
{
  *buf = 0;
  *a2 = 0;
  _os_log_error_impl(&dword_2173D9000, log, OS_LOG_TYPE_ERROR, "Timed out waiting for watchkit app list to load", buf, 2u);
}

- (void)watchKitAppList:(id)a3 added:(id)a4 removed:(id)a5
{
  BLTSectionConfigurationDelegate **p_delegate;
  id v8;
  id v9;
  id WeakRetained;

  p_delegate = &self->_delegate;
  v8 = a5;
  v9 = a4;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  objc_msgSend(WeakRetained, "sectionConfiguration:addedSectionIDs:removedSectionIDs:", self, v9, v8);

}

- (BOOL)shouldSectionIDSettingsAlwaysSync:(id)a3
{
  id v4;
  void *v5;
  BOOL v6;
  objc_super v8;

  v4 = a3;
  -[BLTSectionConfiguration _waitForWatchKitAppListLoaded](self, "_waitForWatchKitAppListLoaded");
  -[BLTWatchKitAppList watchKitAppDefinitionWithBundleID:](self->_watchKitAppList, "watchKitAppDefinitionWithBundleID:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "isInstalled") & 1) != 0)
  {
    v6 = 1;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)BLTSectionConfiguration;
    v6 = -[BLTSectionConfigurationInternal shouldSectionIDSettingsAlwaysSync:](&v8, sel_shouldSectionIDSettingsAlwaysSync_, v4);
  }

  return v6;
}

- (BOOL)override:(id)a3 appliesToConfigurationForSectionID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  void *v10;
  int v11;
  uint64_t v12;
  BOOL v13;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x24BE0FD20]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "BOOLValue");

  if (v9)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x24BE0FD18]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "BOOLValue");

    if (v11)
      v12 = 0;
    else
      v12 = 2;
    v13 = -[BLTSectionConfigurationInternal setCoordinationType:sectionID:](self, "setCoordinationType:sectionID:", v12, v7);
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (BLTSectionConfigurationDelegate)delegate
{
  return (BLTSectionConfigurationDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_watchKitAppListLoadedCondition, 0);
  objc_storeStrong((id *)&self->_watchKitAppList, 0);
}

@end
