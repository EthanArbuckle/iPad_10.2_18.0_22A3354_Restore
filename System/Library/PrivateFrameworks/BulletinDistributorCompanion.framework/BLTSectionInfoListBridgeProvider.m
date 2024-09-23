@implementation BLTSectionInfoListBridgeProvider

- (BLTSectionInfoListBridgeProvider)initWithSectionConfiguration:(id)a3
{
  id v5;
  BLTSectionInfoListBridgeProvider *v6;
  BLTSectionInfoListBridgeProvider *v7;
  id v8;
  uint64_t v9;
  NPSDomainAccessor *npsDomainAccessor;
  __CFNotificationCenter *DarwinNotifyCenter;
  objc_super v13;

  v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)BLTSectionInfoListBridgeProvider;
  v6 = -[BLTSectionInfoListBridgeProvider init](&v13, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_sectionConfiguration, a3);
    v8 = objc_alloc(MEMORY[0x24BE6B2C0]);
    v9 = objc_msgSend(v8, "initWithDomain:", *MEMORY[0x24BE0FCE0]);
    npsDomainAccessor = v7->_npsDomainAccessor;
    v7->_npsDomainAccessor = (NPSDomainAccessor *)v9;

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v7, (CFNotificationCallback)BBSectionsChanged, (CFStringRef)*MEMORY[0x24BE0FCE8], 0, (CFNotificationSuspensionBehavior)0);
  }

  return v7;
}

- (void)reloadWithCompletion:(id)a3
{
  _opaque_pthread_mutex_t *p_lock;
  NSDate *v5;
  NSDate *lastKnownBridgeSettingsChangeDate;
  id v7;

  p_lock = &self->_lock;
  v7 = a3;
  pthread_mutex_lock(p_lock);
  objc_msgSend(MEMORY[0x24BDBCE60], "distantPast");
  v5 = (NSDate *)objc_claimAutoreleasedReturnValue();
  lastKnownBridgeSettingsChangeDate = self->_lastKnownBridgeSettingsChangeDate;
  self->_lastKnownBridgeSettingsChangeDate = v5;

  pthread_mutex_unlock(p_lock);
  -[BLTSectionInfoListBridgeProvider _reloadUpdatedOverridesWithCompletion:](self, "_reloadUpdatedOverridesWithCompletion:", v7);

}

- (void)dealloc
{
  __CFNotificationCenter *DarwinNotifyCenter;
  objc_super v4;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, (CFNotificationName)*MEMORY[0x24BE0FCE8], 0);
  v4.receiver = self;
  v4.super_class = (Class)BLTSectionInfoListBridgeProvider;
  -[BLTSectionInfoListBridgeProvider dealloc](&v4, sel_dealloc);
}

- (void)_reloadUpdatedOverrides
{
  void *v3;
  id v4;
  _QWORD v5[5];
  id v6;

  +[BLTTransaction transactionWithDescription:](BLTTransaction, "transactionWithDescription:", CFSTR("BLTSectionInfoListBridgeProvider _reloadUpdatedOverrides"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __59__BLTSectionInfoListBridgeProvider__reloadUpdatedOverrides__block_invoke;
  v5[3] = &unk_24D762700;
  v5[4] = self;
  v6 = v3;
  v4 = v3;
  -[BLTSectionInfoListBridgeProvider _reloadUpdatedOverridesWithCompletion:](self, "_reloadUpdatedOverridesWithCompletion:", v5);

}

void __59__BLTSectionInfoListBridgeProvider__reloadUpdatedOverrides__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  _QWORD v4[5];
  id v5;

  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __59__BLTSectionInfoListBridgeProvider__reloadUpdatedOverrides__block_invoke_2;
  v4[3] = &unk_24D7626D8;
  v3 = *(void **)(a1 + 40);
  v4[4] = *(_QWORD *)(a1 + 32);
  v5 = v3;
  objc_msgSend(a2, "enumerateKeysAndObjectsUsingBlock:", v4);

}

void __59__BLTSectionInfoListBridgeProvider__reloadUpdatedOverrides__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;

  v5 = a3;
  v6 = a2;
  BLTAnalyticsLogMirroredNotificationsOverrides(v6, v5);
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 88));
  objc_msgSend(WeakRetained, "updateOverrides:forSectionID:transaction:", v5, v6, *(_QWORD *)(a1 + 40));

}

- (void)_reloadUpdatedOverridesWithCompletion:(id)a3
{
  void *v4;
  NSDate *v5;
  NSDate *v6;
  NSDate *lastKnownBridgeSettingsChangeDate;
  void *v8;
  void (**v9)(id, void *);

  v9 = (void (**)(id, void *))a3;
  pthread_mutex_lock(&self->_lock);
  v4 = (void *)MEMORY[0x24BDBCE60];
  v5 = self->_lastKnownBridgeSettingsChangeDate;
  objc_msgSend(v4, "date");
  v6 = (NSDate *)objc_claimAutoreleasedReturnValue();
  lastKnownBridgeSettingsChangeDate = self->_lastKnownBridgeSettingsChangeDate;
  self->_lastKnownBridgeSettingsChangeDate = v6;

  pthread_mutex_unlock(&self->_lock);
  -[BLTSectionInfoListBridgeProvider _loadOverridesChangedSince:](self, "_loadOverridesChangedSince:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
    v9[2](v9, v8);

}

- (id)_loadOverridesChangedSince:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  _BOOL4 v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t j;
  uint64_t v28;
  void *v30;
  uint64_t v31;
  BLTSectionInfoListBridgeProvider *v32;
  id v33;
  id obj;
  uint64_t v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];
  uint64_t v45;
  uint64_t v46;
  uint8_t v47[128];
  uint8_t buf[4];
  uint64_t v49;
  uint64_t v50;

  v50 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  blt_settings_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v49 = (uint64_t)v4;
    _os_log_impl(&dword_2173D9000, v5, OS_LOG_TYPE_DEFAULT, "Reloading Bridge settings changed after date: %@", buf, 0xCu);
  }

  v6 = (id)-[NPSDomainAccessor synchronize](self->_npsDomainAccessor, "synchronize");
  v7 = (void *)-[NPSDomainAccessor copyKeyList](self->_npsDomainAccessor, "copyKeyList");
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  blt_settings_log();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
  if (v7)
  {
    if (v10)
    {
      v11 = objc_msgSend(v7, "count");
      *(_DWORD *)buf = 134217984;
      v49 = v11;
      _os_log_impl(&dword_2173D9000, v9, OS_LOG_TYPE_DEFAULT, "Bridge settings found with count: %lu", buf, 0xCu);
    }

    v42 = 0u;
    v43 = 0u;
    v40 = 0u;
    v41 = 0u;
    v30 = v7;
    obj = v7;
    v35 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v47, 16);
    if (v35)
    {
      v12 = *(_QWORD *)v41;
      v13 = *MEMORY[0x24BE0FD48];
      v32 = self;
      v33 = v4;
      v31 = *MEMORY[0x24BE0FD48];
      do
      {
        for (i = 0; i != v35; ++i)
        {
          if (*(_QWORD *)v41 != v12)
            objc_enumerationMutation(obj);
          v15 = *(_QWORD *)(*((_QWORD *)&v40 + 1) + 8 * i);
          -[NPSDomainAccessor dictionaryForKey:](self->_npsDomainAccessor, "dictionaryForKey:", v15, v30);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "objectForKeyedSubscript:", v13);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "earlierDate:", v4);
          v18 = (id)objc_claimAutoreleasedReturnValue();

          if (v18 == v4)
          {
            -[BLTSectionInfoListBridgeProvider sectionConfiguration](self, "sectionConfiguration");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "additionalBridgeSectionIDsForSectionID:", v15);
            v20 = (void *)objc_claimAutoreleasedReturnValue();

            if (v20)
            {
              v46 = v15;
              objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v46, 1);
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v21, "arrayByAddingObjectsFromArray:", v20);
              v22 = (void *)objc_claimAutoreleasedReturnValue();

            }
            else
            {
              v45 = v15;
              objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v45, 1);
              v22 = (void *)objc_claimAutoreleasedReturnValue();
            }
            v38 = 0u;
            v39 = 0u;
            v36 = 0u;
            v37 = 0u;
            v23 = v22;
            v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
            if (v24)
            {
              v25 = v24;
              v26 = *(_QWORD *)v37;
              do
              {
                for (j = 0; j != v25; ++j)
                {
                  if (*(_QWORD *)v37 != v26)
                    objc_enumerationMutation(v23);
                  objc_msgSend(v8, "setObject:forKeyedSubscript:", v16, *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * j));
                }
                v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
              }
              while (v25);
            }

            self = v32;
            v4 = v33;
            v13 = v31;
          }

        }
        v35 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v47, 16);
      }
      while (v35);
    }

    blt_settings_log();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v28 = objc_msgSend(v8, "count");
      *(_DWORD *)buf = 134217984;
      v49 = v28;
      _os_log_impl(&dword_2173D9000, v9, OS_LOG_TYPE_DEFAULT, "Relevant Bridge setting count: %lu", buf, 0xCu);
    }
    v7 = v30;
  }
  else if (v10)
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2173D9000, v9, OS_LOG_TYPE_DEFAULT, "No Bridge settings could be found", buf, 2u);
  }

  return v8;
}

- (void)setNotificationsLevel:(int)a3 sectionID:(id)a4 forceCustom:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  char v17;
  NSObject *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  id v24;
  id WeakRetained;
  int v26;
  id v27;
  uint64_t v28;

  v5 = a5;
  v28 = *MEMORY[0x24BDAC8D0];
  v8 = a4;
  +[BLTTransaction transactionWithDescription:](BLTTransaction, "transactionWithDescription:", CFSTR("BLTSectionInfoListBridgeProvider setNotificationsLevel:sectionID:forceCustom:"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_alloc(MEMORY[0x24BE6B2C0]);
  v11 = (void *)objc_msgSend(v10, "initWithDomain:", *MEMORY[0x24BE0FCE0]);
  v12 = (id)objc_msgSend(v11, "synchronize");
  objc_msgSend(v11, "dictionaryForKey:", v8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v13, "mutableCopy");

  v15 = *MEMORY[0x24BE0FD20];
  objc_msgSend(v14, "objectForKeyedSubscript:", *MEMORY[0x24BE0FD20]);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "BOOLValue");

  if ((v17 & 1) != 0 || v5)
  {
    blt_settings_log();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      v26 = 138412290;
      v27 = v8;
      _os_log_impl(&dword_2173D9000, v18, OS_LOG_TYPE_INFO, "Disabling notification in bridge for %@", (uint8_t *)&v26, 0xCu);
    }

    if (!v14)
    {
      objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v14, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], v15);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", a3 == 2);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setObject:forKeyedSubscript:", v19, *MEMORY[0x24BE0FD18]);

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", a3 == 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setObject:forKeyedSubscript:", v20, *MEMORY[0x24BE0FD10]);

    v21 = *MEMORY[0x24BE0FD08];
    objc_msgSend(v14, "objectForKeyedSubscript:", *MEMORY[0x24BE0FD08]);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v22)
      objc_msgSend(v14, "setObject:forKeyedSubscript:", v8, v21);
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setObject:forKeyedSubscript:", v23, *MEMORY[0x24BE0FD48]);

    objc_msgSend(v11, "setObject:forKey:", v14, v8);
    v24 = (id)objc_msgSend(v11, "synchronize");
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "updateOverrides:forSectionID:transaction:", v14, v8, v9);

  }
}

- (void)setCustomSettingsWithSectionInfo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  NPSDomainAccessor *npsDomainAccessor;
  void *v8;
  id v9;
  id WeakRetained;
  void *v11;
  id v12;

  v12 = a3;
  +[BLTTransaction transactionWithDescription:](BLTTransaction, "transactionWithDescription:", CFSTR("BLTSectionInfoListBridgeProvider setCustomSettingsWithSectionInfo:"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "sectionID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[BLTSectionInfoListBridgeProvider _companionSetupNotificationSettingsDictionaryForSectionInfo:sectionID:](self, "_companionSetupNotificationSettingsDictionaryForSectionInfo:sectionID:", v12, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    npsDomainAccessor = self->_npsDomainAccessor;
    objc_msgSend(v12, "sectionID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NPSDomainAccessor setObject:forKey:](npsDomainAccessor, "setObject:forKey:", v6, v8);

    v9 = (id)-[NPSDomainAccessor synchronize](self->_npsDomainAccessor, "synchronize");
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v12, "sectionID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "updateOverrides:forSectionID:transaction:", v6, v11, v4);

  }
}

- (void)setCustomSettingsWithSectionInfo:(id)a3 watchSectionID:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  _QWORD block[5];
  id v11;
  id v12;

  v6 = a4;
  -[BLTSectionInfoListBridgeProvider _companionSetupNotificationSettingsDictionaryForSectionInfo:sectionID:](self, "_companionSetupNotificationSettingsDictionaryForSectionInfo:sectionID:", a3, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (a3 && v7)
  {
    objc_msgSend(v7, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C0], *MEMORY[0x24BE0FD20]);
    BLTWorkQueue();
    v9 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __84__BLTSectionInfoListBridgeProvider_setCustomSettingsWithSectionInfo_watchSectionID___block_invoke;
    block[3] = &unk_24D761D70;
    block[4] = self;
    v11 = v8;
    v12 = v6;
    dispatch_async(v9, block);

  }
}

id __84__BLTSectionInfoListBridgeProvider_setCustomSettingsWithSectionInfo_watchSectionID___block_invoke(_QWORD *a1)
{
  objc_msgSend(*(id *)(a1[4] + 80), "setObject:forKey:", a1[5], a1[6]);
  return (id)objc_msgSend(*(id *)(a1[4] + 80), "synchronize");
}

- (id)_companionSetupNotificationSettingsDictionaryForSectionInfo:(id)a3 sectionID:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  int v30;
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (v7)
  {
    v8 = (id)-[NPSDomainAccessor synchronize](self->_npsDomainAccessor, "synchronize");
    -[NPSDomainAccessor dictionaryForKey:](self->_npsDomainAccessor, "dictionaryForKey:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v9, "mutableCopy");

    if (!v10)
    {
      blt_settings_log();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        v30 = 138412290;
        v31 = v7;
        _os_log_impl(&dword_2173D9000, v11, OS_LOG_TYPE_INFO, "Creating new settings for app %@", (uint8_t *)&v30, 0xCu);
      }

      objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v10, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BE0FD20]);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v6, "blt_overrideShowsAlerts"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v12, *MEMORY[0x24BE0FD18]);

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v6, "blt_overrideSendToNotificationCenter"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v13, *MEMORY[0x24BE0FD10]);

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", (objc_msgSend(v6, "pushSettings") >> 4) & 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v14, *MEMORY[0x24BE0FD30]);

    if (objc_msgSend(v6, "criticalAlertSetting"))
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", objc_msgSend(v6, "criticalAlertSetting") == 2);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setObject:forKeyedSubscript:", v15, *MEMORY[0x24BE0FD00]);

    }
    else
    {
      objc_msgSend(v10, "removeObjectForKey:", *MEMORY[0x24BE0FD00]);
    }
    v24 = objc_msgSend(v6, "bulletinGroupingSetting");
    v25 = &unk_24D786680;
    if (v24 == 1)
      v25 = &unk_24D786668;
    if (v24 == 2)
      v26 = &unk_24D786650;
    else
      v26 = v25;
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v26, *MEMORY[0x24BE0FCF8]);
    v27 = *MEMORY[0x24BE0FD08];
    objc_msgSend(v10, "objectForKeyedSubscript:", *MEMORY[0x24BE0FD08]);
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v28)
      objc_msgSend(v10, "setObject:forKeyedSubscript:", v7, v27);
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v16 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v16, *MEMORY[0x24BE0FD48]);
  }
  else
  {
    blt_settings_log();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      -[BLTSectionInfoListBridgeProvider _companionSetupNotificationSettingsDictionaryForSectionInfo:sectionID:].cold.1(v16, v17, v18, v19, v20, v21, v22, v23);
    v10 = 0;
  }

  return v10;
}

- (void)enableCustomSettingsForWatchSectionID:(id)a3
{
  id v4;
  id v5;
  void *v6;
  NSObject *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;

  v4 = a3;
  if (v4)
  {
    v5 = (id)-[NPSDomainAccessor synchronize](self->_npsDomainAccessor, "synchronize");
    -[NPSDomainAccessor dictionaryForKey:](self->_npsDomainAccessor, "dictionaryForKey:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "mutableCopy");

    if (v7)
    {
      -[NSObject setObject:forKeyedSubscript:](v7, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BE0FD20]);
      -[NPSDomainAccessor setObject:forKey:](self->_npsDomainAccessor, "setObject:forKey:", v7, v4);
      v8 = (id)-[NPSDomainAccessor synchronize](self->_npsDomainAccessor, "synchronize");
    }
    else
    {
      blt_settings_log();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        -[BLTSectionInfoListBridgeProvider enableCustomSettingsForWatchSectionID:].cold.2((uint64_t)v4, v16);

    }
  }
  else
  {
    blt_settings_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[BLTSectionInfoListBridgeProvider _companionSetupNotificationSettingsDictionaryForSectionInfo:sectionID:].cold.1(v7, v9, v10, v11, v12, v13, v14, v15);
  }

}

- (void)removeSectionWithSectionID:(id)a3
{
  NPSDomainAccessor *npsDomainAccessor;
  id v5;
  id v6;
  id v7;

  npsDomainAccessor = self->_npsDomainAccessor;
  v5 = a3;
  v6 = (id)-[NPSDomainAccessor synchronize](npsDomainAccessor, "synchronize");
  -[NPSDomainAccessor removeObjectForKey:](self->_npsDomainAccessor, "removeObjectForKey:", v5);

  v7 = (id)-[NPSDomainAccessor synchronize](self->_npsDomainAccessor, "synchronize");
}

- (BLTSectionInfoListProviderDelegate)delegate
{
  return (BLTSectionInfoListProviderDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BLTSectionConfiguration)sectionConfiguration
{
  return self->_sectionConfiguration;
}

- (void)setSectionConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_sectionConfiguration, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sectionConfiguration, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_npsDomainAccessor, 0);
  objc_storeStrong((id *)&self->_lastKnownBridgeSettingsChangeDate, 0);
}

- (void)_companionSetupNotificationSettingsDictionaryForSectionInfo:(uint64_t)a3 sectionID:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4(&dword_2173D9000, a1, a3, "Trying to set custom settings on undefined app", a5, a6, a7, a8, 0);
}

- (void)enableCustomSettingsForWatchSectionID:(uint64_t)a1 .cold.2(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_2173D9000, a2, OS_LOG_TYPE_ERROR, "Settings not found for app %@", (uint8_t *)&v2, 0xCu);
}

@end
