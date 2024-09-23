@implementation KSiCloudDeviceListMonitor

void __53___KSiCloudDeviceListMonitor_iCloudDeviceListMonitor__block_invoke()
{
  _KSiCloudDeviceListMonitor *v0;
  void *v1;

  v0 = objc_alloc_init(_KSiCloudDeviceListMonitor);
  v1 = (void *)iCloudDeviceListMonitor_sharedInstance;
  iCloudDeviceListMonitor_sharedInstance = (uint64_t)v0;

}

void __70___KSiCloudDeviceListMonitor_fetchCloudKitDevicesWithCompletionBlock___block_invoke(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = v6;
  if (!v6 || a4)
  {
    NSLog(CFSTR("CloudKit device list request failed, error: %@"), a4);
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    v8 = v6;
    KSCategory();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v8, "needUpgradeDeviceNames");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      v18 = "-[_KSiCloudDeviceListMonitor fetchCloudKitDevicesWithCompletionBlock:]_block_invoke";
      v19 = 2112;
      v20 = v10;
      _os_log_impl(&dword_21DFEB000, v9, OS_LOG_TYPE_INFO, "%s  cloudkit devices that needs upgrade: %@", buf, 0x16u);

    }
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __70___KSiCloudDeviceListMonitor_fetchCloudKitDevicesWithCompletionBlock___block_invoke_107;
    v14[3] = &unk_24E204878;
    v11 = *(void **)(a1 + 32);
    v12 = *(id *)(a1 + 40);
    v15 = v8;
    v16 = v12;
    v13 = v8;
    objc_msgSend(v11, "fetchICloudDevicesWithCompletionBlock:", v14);

  }
}

void __70___KSiCloudDeviceListMonitor_fetchCloudKitDevicesWithCompletionBlock___block_invoke_107(uint64_t a1, uint64_t a2, char a3)
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  void *v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  if ((a3 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithArray:", a2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    objc_msgSend(*(id *)(a1 + 32), "needUpgradeDeviceNames", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v20, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v13;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v13 != v8)
            objc_enumerationMutation(v5);
          +[_KSDeviceInfo ksDeviceWithName:needsUpgrade:](_KSDeviceInfo, "ksDeviceWithName:needsUpgrade:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v9), 1);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "addObject:", v10);

          ++v9;
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v20, 16);
      }
      while (v7);
    }

    KSCategory();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v17 = "-[_KSiCloudDeviceListMonitor fetchCloudKitDevicesWithCompletionBlock:]_block_invoke";
      v18 = 2112;
      v19 = v4;
      _os_log_impl(&dword_21DFEB000, v11, OS_LOG_TYPE_INFO, "%s  >>> devices that need to upgraded: %@", buf, 0x16u);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    (*(void (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), MEMORY[0x24BDBD1A8], 0);
  }
}

void __68___KSiCloudDeviceListMonitor_fetchICloudDevicesWithCompletionBlock___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint8_t buf[4];
  const char *v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(v4, "responseDictionary");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    NSLog(CFSTR(">>> icloud response dictionary: %@"), v6);
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("devices"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v20, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v15;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v15 != v10)
            objc_enumerationMutation(v7);
          +[_KSDeviceInfo ksDecviceWithiCloudDeviceInfo:](_KSDeviceInfo, "ksDecviceWithiCloudDeviceInfo:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v11));
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addObject:", v12);

          ++v11;
        }
        while (v9 != v11);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v20, 16);
      }
      while (v9);
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

  }
  else
  {
    KSCategory();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v19 = "-[_KSiCloudDeviceListMonitor fetchICloudDevicesWithCompletionBlock:]_block_invoke";
      _os_log_impl(&dword_21DFEB000, v13, OS_LOG_TYPE_INFO, "%s  couldn't fetch icloud device list", buf, 0xCu);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

void __49___KSiCloudDeviceListMonitor_queryMigrationState__block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;

  v0 = (void *)MEMORY[0x24BDD17C8];
  +[_KSTextReplacementHelper aggdPrefix](_KSTextReplacementHelper, "aggdPrefix");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "stringWithFormat:", CFSTR("%@.didMigrate"), v1);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)queryMigrationState_kAggdKeyDidMigrate;
  queryMigrationState_kAggdKeyDidMigrate = v2;

  v4 = (void *)MEMORY[0x24BDD17C8];
  +[_KSTextReplacementHelper aggdPrefix](_KSTextReplacementHelper, "aggdPrefix");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@.waitingMigration"), v7);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)queryMigrationState_kAggdKeyWaitingMigration;
  queryMigrationState_kAggdKeyWaitingMigration = v5;

}

void __49___KSiCloudDeviceListMonitor_queryMigrationState__block_invoke_2(uint64_t a1, uint64_t a2, int a3)
{
  NSObject *v4;
  void *v5;
  uint64_t *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  const char *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  if (a3)
  {
    KSCategory();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", a2);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 136315394;
      v14 = "-[_KSiCloudDeviceListMonitor queryMigrationState]_block_invoke_2";
      v15 = 2112;
      v16 = v5;
      _os_log_impl(&dword_21DFEB000, v4, OS_LOG_TYPE_INFO, "%s  >>> The device migration eligibility for 30day check is: %@", (uint8_t *)&v13, 0x16u);

    }
    v6 = &queryMigrationState_kAggdKeyWaitingMigration;
    if ((_DWORD)a2)
      v6 = &queryMigrationState_kAggdKeyDidMigrate;
    +[_KSAggdLogger addValue:forScalarKey:](_KSAggdLogger, "addValue:forScalarKey:", 1, *v6);
    v7 = objc_alloc(MEMORY[0x24BDBCF50]);
    +[_KSUtilities userDefaultsSuiteName](_KSUtilities, "userDefaultsSuiteName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v7, "initWithSuiteName:", v8);

    objc_msgSend(v9, "setBool:forKey:", a2, CFSTR("_KSTRCloudKitMigratable"));
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKey:", v10, CFSTR("_KSCKMigrationPreviousCheckDate"));

    if ((_DWORD)a2)
    {
      objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "postNotificationName:object:", CFSTR("_KSCloudKitDevicesMigrationStateDidChange"), v12);

    }
  }
}

void __87___KSiCloudDeviceListMonitor_isAccountCompatibleForCloudKitSyncingWithCompletionBlock___block_invoke(uint64_t a1, void *a2, int a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = v5;
  if (a3)
  {
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v14;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v14 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(a1 + 32);
          objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * i), "swVersion");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "isSWVersionCloudKitSyncCompatible:", v12);

        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v8);
    }
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

@end
