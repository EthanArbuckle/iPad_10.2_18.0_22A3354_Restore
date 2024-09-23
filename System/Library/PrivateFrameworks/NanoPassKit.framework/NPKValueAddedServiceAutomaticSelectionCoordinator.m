@implementation NPKValueAddedServiceAutomaticSelectionCoordinator

- (NPKValueAddedServiceAutomaticSelectionCoordinator)initWithDelegate:(id)a3 passesDataSource:(id)a4
{
  id v6;
  id v7;
  NPKValueAddedServiceAutomaticSelectionCoordinator *v8;
  NPKValueAddedServiceAutomaticSelectionCoordinator *v9;
  id v10;
  void *v11;
  objc_super v13;

  v6 = a3;
  v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)NPKValueAddedServiceAutomaticSelectionCoordinator;
  v8 = -[NPKValueAddedServiceAutomaticSelectionCoordinator init](&v13, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_delegate, v6);
    v10 = objc_storeWeak((id *)&v9->_dataSource, v7);
    objc_msgSend(v7, "registerObserver:", v9);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObserver:selector:name:object:", v9, sel__handleWalletPreferencesChanged_, *MEMORY[0x24BE6F7B8], 0);

  }
  return v9;
}

- (void)passesDataSourceDidReloadPasses:(id)a3
{
  NSObject *v4;
  _BOOL4 v5;
  NSObject *v6;
  uint8_t v7[16];

  pk_General_log();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);

  if (v5)
  {
    pk_General_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_213518000, v6, OS_LOG_TYPE_DEFAULT, "Notice: VAS automatic selection coordinator got reloaded passes", v7, 2u);
    }

  }
  -[NPKValueAddedServiceAutomaticSelectionCoordinator _updateAutomaticSelectionPasses](self, "_updateAutomaticSelectionPasses");
}

- (void)passesDataSource:(id)a3 didAddPasses:(id)a4
{
  NSObject *v5;
  _BOOL4 v6;
  NSObject *v7;
  uint8_t v8[16];

  pk_General_log();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    pk_General_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_213518000, v7, OS_LOG_TYPE_DEFAULT, "Notice: VAS automatic selection coordinator got added passes", v8, 2u);
    }

  }
  -[NPKValueAddedServiceAutomaticSelectionCoordinator _updateAutomaticSelectionPasses](self, "_updateAutomaticSelectionPasses");
}

- (void)passesDataSource:(id)a3 didUpdatePasses:(id)a4
{
  NSObject *v5;
  _BOOL4 v6;
  NSObject *v7;
  uint8_t v8[16];

  pk_General_log();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    pk_General_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_213518000, v7, OS_LOG_TYPE_DEFAULT, "Notice: VAS automatic selection coordinator got updated passes", v8, 2u);
    }

  }
  -[NPKValueAddedServiceAutomaticSelectionCoordinator _updateAutomaticSelectionPasses](self, "_updateAutomaticSelectionPasses");
}

- (void)passesDataSource:(id)a3 didRemovePasses:(id)a4
{
  NSObject *v5;
  _BOOL4 v6;
  NSObject *v7;
  uint8_t v8[16];

  pk_General_log();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    pk_General_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_213518000, v7, OS_LOG_TYPE_DEFAULT, "Notice: VAS automatic selection coordinator got removed passes", v8, 2u);
    }

  }
  -[NPKValueAddedServiceAutomaticSelectionCoordinator _updateAutomaticSelectionPasses](self, "_updateAutomaticSelectionPasses");
}

- (void)passesDataSourceDidReorderPasses:(id)a3
{
  NSObject *v4;
  _BOOL4 v5;
  NSObject *v6;
  uint8_t v7[16];

  pk_General_log();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);

  if (v5)
  {
    pk_General_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_213518000, v6, OS_LOG_TYPE_DEFAULT, "Notice: VAS automatic selection coordinator got reordered passes", v7, 2u);
    }

  }
  -[NPKValueAddedServiceAutomaticSelectionCoordinator _updateAutomaticSelectionPasses](self, "_updateAutomaticSelectionPasses");
}

- (void)passesDataSource:(id)a3 didUpdateSettingsForPass:(id)a4
{
  id v5;
  NSObject *v6;
  _BOOL4 v7;
  NSObject *v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  pk_General_log();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);

  if (v7)
  {
    pk_General_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v5, "uniqueID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138412290;
      v11 = v9;
      _os_log_impl(&dword_213518000, v8, OS_LOG_TYPE_DEFAULT, "Notice: VAS automatic selection coordinator got updated settings for pass %@", (uint8_t *)&v10, 0xCu);

    }
  }
  -[NPKValueAddedServiceAutomaticSelectionCoordinator _updateAutomaticSelectionPasses](self, "_updateAutomaticSelectionPasses");

}

- (void)_handleWalletPreferencesChanged:(id)a3
{
  NSObject *v4;
  _BOOL4 v5;
  NSObject *v6;
  uint8_t v7[16];

  pk_Payment_log();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);

  if (v5)
  {
    pk_Payment_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_213518000, v6, OS_LOG_TYPE_DEFAULT, "Notice: Wallet preferences changed", v7, 2u);
    }

  }
  -[NPKValueAddedServiceAutomaticSelectionCoordinator _updateAutomaticSelectionPasses](self, "_updateAutomaticSelectionPasses");
}

- (void)_updateAutomaticSelectionPasses
{
  id WeakRetained;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  NSObject *v20;
  _BOOL4 v21;
  NSObject *v22;
  int v23;
  id v24;
  NPKValueAddedServiceAutomaticSelectionCoordinator *v25;
  void *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint8_t buf[4];
  int v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v25 = self;
  WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  objc_msgSend(WeakRetained, "passes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v27, v33, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v28 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
        if (NPKIsValidVASPass(v10)
          && (objc_msgSend(v10, "hasStoredValue") & 1) == 0
          && (objc_msgSend(v10, "settings") & 0x10) != 0)
        {
          objc_msgSend(v10, "passTypeIdentifier");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "objectForKeyedSubscript:", v11);
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v12)
            goto LABEL_12;
          objc_msgSend(v10, "passTypeIdentifier");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "objectForKeyedSubscript:", v13);
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v14, "ingestedDate");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "ingestedDate");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = objc_msgSend(v15, "compare:", v16);

          if (v17 == 1)
          {
            objc_msgSend(v10, "uniqueID");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "removeObjectForKey:", v18);

LABEL_12:
            objc_msgSend(v10, "passTypeIdentifier", v25);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "setObject:forKeyedSubscript:", v10, v19);

            objc_msgSend(v10, "uniqueID");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "setObject:forKey:", v10, v14);
          }

          continue;
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v27, v33, 16);
    }
    while (v7);
  }

  pk_General_log();
  v20 = objc_claimAutoreleasedReturnValue();
  v21 = os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT);

  if (v21)
  {
    pk_General_log();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      v23 = objc_msgSend(v26, "count");
      *(_DWORD *)buf = 67109120;
      v32 = v23;
      _os_log_impl(&dword_213518000, v22, OS_LOG_TYPE_DEFAULT, "Notice: Found %d VAS passes for automatic selection", buf, 8u);
    }

  }
  v24 = objc_loadWeakRetained((id *)&v25->_delegate);
  objc_msgSend(v24, "valueAddedServiceAutomaticSelectionCoordinator:didUpdatePasses:", v25, v26);

}

- (NPKValueAddedServiceAutomaticSelectionCoordinatorDelegate)delegate
{
  return (NPKValueAddedServiceAutomaticSelectionCoordinatorDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NPKPassesDataSource)dataSource
{
  return (NPKPassesDataSource *)objc_loadWeakRetained((id *)&self->_dataSource);
}

- (void)setDataSource:(id)a3
{
  objc_storeWeak((id *)&self->_dataSource, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_dataSource);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
