@implementation IRCleanupManager

- (IRCleanupManager)initWithBackgroundActivitiesManager:(id)a3
{
  id v4;
  IRCleanupManager *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  IRCleanupManager *v9;
  _QWORD v11[4];
  IRCleanupManager *v12;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)IRCleanupManager;
  v5 = -[IRCleanupManager init](&v13, sel_init);
  if (v5)
  {
    +[IRPreferences shared](IRPreferences, "shared");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "cleanupXPCActivityInterval");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "longLongValue");
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __56__IRCleanupManager_initWithBackgroundActivitiesManager___block_invoke;
    v11[3] = &unk_251044310;
    v9 = v5;
    v12 = v9;
    objc_msgSend(v4, "registerForRepeatingBackgroundXPCActivityWithIdentifier:interval:isDiskIntensive:isMemoryIntensive:handler:", CFSTR("com.apple.intelligentroutingd.DBCleanupXPCActivityIdentifier"), v8, 1, 1, v11);

    -[IRCleanupManager setBackgroundActivitiesManager:](v9, "setBackgroundActivitiesManager:", v4);
  }

  return v5;
}

uint64_t __56__IRCleanupManager_initWithBackgroundActivitiesManager___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleCleanupXPCActivity");
}

- (void)_handleCleanupXPCActivity
{
  void *v3;
  void *v4;
  _QWORD v5[5];

  -[IRCleanupManager backgroundActivitiesManager](self, "backgroundActivitiesManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "server");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __45__IRCleanupManager__handleCleanupXPCActivity__block_invoke;
  v5[3] = &unk_251045890;
  v5[4] = self;
  objc_msgSend(v4, "performXPCActivityUnderServerContext:", v5);

}

void __45__IRCleanupManager__handleCleanupXPCActivity__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  os_log_t *v8;
  NSObject *v9;
  void *v10;
  os_log_t *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _BOOL4 v19;
  uint64_t v20;
  id v21;
  id v22;
  _BOOL4 v23;
  NSObject *v24;
  const __CFString *v25;
  void *v26;
  NSObject *v27;
  NSObject *v28;
  _QWORD v29[4];
  BOOL v30;
  _QWORD v31[4];
  id v32;
  id v33;
  _BYTE *v34;
  _QWORD block[6];
  uint8_t v36[4];
  const __CFString *v37;
  _BYTE buf[24];
  uint64_t (*v39)(uint64_t, uint64_t);
  void (*v40)(uint64_t);
  id v41;
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = (void *)os_transaction_create();
  v8 = (os_log_t *)MEMORY[0x24BE5B270];
  v9 = *MEMORY[0x24BE5B270];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE5B270], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_23FFBA000, v9, OS_LOG_TYPE_DEFAULT, "#db-cleanup-manager, Handling IRD cleanup", buf, 2u);
  }
  if ((objc_msgSend(v5, "connectToStore") & 1) != 0)
  {
    +[IRServiceStore fetchAllServicesWithPersistenceManager:](IRServiceStore, "fetchAllServicesWithPersistenceManager:", v5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      v11 = (os_log_t *)MEMORY[0x24BE5B278];
      v12 = (void *)*MEMORY[0x24BE5B278];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE5B278], OS_LOG_TYPE_DEFAULT))
      {
        v13 = (void *)MEMORY[0x24BDD16E0];
        v14 = v12;
        objc_msgSend(v13, "numberWithUnsignedInteger:", objc_msgSend(v10, "count"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = (void *)MEMORY[0x24BDD16E0];
        objc_msgSend(v6, "allKeys");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "numberWithUnsignedInteger:", objc_msgSend(v17, "count"));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        *(_QWORD *)&buf[4] = v15;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v18;
        _os_log_impl(&dword_23FFBA000, v14, OS_LOG_TYPE_DEFAULT, "#db-cleanup-manager, Number of services in DB: %@, number of active services: %@", buf, 0x16u);

      }
      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = buf;
      *(_QWORD *)&buf[16] = 0x3032000000;
      v39 = __Block_byref_object_copy__11;
      v40 = __Block_byref_object_dispose__11;
      v41 = 0;
      v19 = +[IRPlatformInfo isInternalInstall](IRPlatformInfo, "isInternalInstall");
      v20 = MEMORY[0x24BDAC760];
      if (v19)
      {
        block[0] = MEMORY[0x24BDAC760];
        block[1] = 3221225472;
        block[2] = __45__IRCleanupManager__handleCleanupXPCActivity__block_invoke_6;
        block[3] = &unk_251045820;
        block[4] = *(_QWORD *)(a1 + 32);
        block[5] = buf;
        if (cleanupXPCActivityIdentifier_block_invoke_onceToken != -1)
          dispatch_once(&cleanupXPCActivityIdentifier_block_invoke_onceToken, block);
      }
      v31[0] = v20;
      v31[1] = 3221225472;
      v31[2] = __45__IRCleanupManager__handleCleanupXPCActivity__block_invoke_2;
      v31[3] = &unk_251045848;
      v21 = v6;
      v32 = v21;
      v34 = buf;
      v22 = v5;
      v33 = v22;
      objc_msgSend(v10, "enumerateObjectsUsingBlock:", v31);
      v23 = +[IRSessionServer isGlobalLowLatencyMiLoWithPersistenceManager:](IRSessionServer, "isGlobalLowLatencyMiLoWithPersistenceManager:", v22);
      v24 = *v11;
      if (os_log_type_enabled(*v11, OS_LOG_TYPE_DEFAULT))
      {
        v25 = CFSTR("NO");
        if (v23)
          v25 = CFSTR("YES");
        *(_DWORD *)v36 = 138412290;
        v37 = v25;
        _os_log_impl(&dword_23FFBA000, v24, OS_LOG_TYPE_DEFAULT, "#db-cleanup-manager, Restarting isLowLatencyMiLo: %@", v36, 0xCu);
      }
      objc_msgSend(v21, "allValues");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v29[0] = v20;
      v29[1] = 3221225472;
      v29[2] = __45__IRCleanupManager__handleCleanupXPCActivity__block_invoke_20;
      v29[3] = &__block_descriptor_33_e35_v32__0__IRServiceContainer_8Q16_B24l;
      v30 = v23;
      objc_msgSend(v26, "enumerateObjectsUsingBlock:", v29);

      _Block_object_dispose(buf, 8);
    }
    else
    {
      v28 = *v8;
      if (os_log_type_enabled(*v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_23FFBA000, v28, OS_LOG_TYPE_DEFAULT, "#db-cleanup-manager, 0 services found during DB cleanup", buf, 2u);
      }
    }

  }
  else
  {
    v27 = *v8;
    if (os_log_type_enabled(*v8, OS_LOG_TYPE_ERROR))
      __45__IRCleanupManager__handleCleanupXPCActivity__block_invoke_cold_1(v27);
  }

}

void __45__IRCleanupManager__handleCleanupXPCActivity__block_invoke_6(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_getDateIntervalOfBuildsToDiscard");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __45__IRCleanupManager__handleCleanupXPCActivity__block_invoke_2(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  NSObject *v16;
  id v17;
  void *v18;
  IRServiceStore *v19;
  IRServiceStore *v20;
  uint64_t v21;
  void *v22;
  _BOOL4 v23;
  void *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  const __CFString *v31;
  int v32;
  id v33;
  __int16 v34;
  uint64_t v35;
  __int16 v36;
  const __CFString *v37;
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (void *)a1[4];
  objc_msgSend(v3, "serviceIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = (void *)a1[4];
    objc_msgSend(v3, "serviceIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "dbCleanupWithDateIntervalOfMiLoPredictionsToDiscard:", *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40));

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "lastSeenDate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[IRPreferences shared](IRPreferences, "shared");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "dbCleanupXPCActivityDeleteServiceThreshold");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "doubleValue");
    objc_msgSend(v11, "dateByAddingTimeInterval:");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "isEarlierThan:", v10);

    if (v15)
    {
      v16 = *MEMORY[0x24BE5B270];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE5B270], OS_LOG_TYPE_DEFAULT))
      {
        v32 = 138412290;
        v33 = v3;
        _os_log_impl(&dword_23FFBA000, v16, OS_LOG_TYPE_DEFAULT, "#db-cleanup-manager, Deleting service: %@", (uint8_t *)&v32, 0xCu);
      }
      v17 = objc_alloc(MEMORY[0x24BE5B308]);
      objc_msgSend(v3, "serviceIdentifier");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = (IRServiceStore *)objc_msgSend(v17, "initWithServiceIdentifier:servicePackage:", v18, objc_msgSend(v3, "servicePackage"));

      +[IRServiceContainer deleteServiceWithToken:persistenceManager:](IRServiceContainer, "deleteServiceWithToken:persistenceManager:", v19, a1[5]);
    }
    else
    {
      v20 = [IRServiceStore alloc];
      v21 = a1[5];
      objc_msgSend(v3, "serviceIdentifier");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = -[IRServiceStore initWithPersistenceManager:serviceIdentifier:](v20, "initWithPersistenceManager:serviceIdentifier:", v21, v22);

      v23 = -[IRServiceStore cleanupWithDate:dateIntervalOfMiLoPredictionsToDiscard:](v19, "cleanupWithDate:dateIntervalOfMiLoPredictionsToDiscard:", v10, *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40));
      v24 = (void *)*MEMORY[0x24BE5B270];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE5B270], OS_LOG_TYPE_DEFAULT))
      {
        v25 = v24;
        objc_msgSend(v3, "clientIdentifier");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = (void *)MEMORY[0x24BDD16E0];
        objc_msgSend(MEMORY[0x24BDBCE60], "date");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "timeIntervalSinceDate:", v10);
        objc_msgSend(v27, "numberWithDouble:");
        v29 = objc_claimAutoreleasedReturnValue();
        v30 = (void *)v29;
        v31 = CFSTR("Fail");
        v32 = 138412802;
        v33 = v26;
        v34 = 2112;
        if (v23)
          v31 = CFSTR("Ok");
        v35 = v29;
        v36 = 2112;
        v37 = v31;
        _os_log_impl(&dword_23FFBA000, v25, OS_LOG_TYPE_DEFAULT, "#db-cleanup-manager, Finished DB cleanup for non active service: %@, in %@ seconds with status: %@", (uint8_t *)&v32, 0x20u);

      }
    }

  }
}

uint64_t __45__IRCleanupManager__handleCleanupXPCActivity__block_invoke_20(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "restartLowLatencyMiLo:", *(unsigned __int8 *)(a1 + 32));
}

- (id)_getDateIntervalOfBuildsToDiscard
{
  void *v3;
  id *v4;
  NSObject *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  unint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  NSObject *v33;
  _QWORD v35[4];
  id v36;
  id v37;
  uint8_t *v38;
  uint8_t buf[8];
  uint8_t *v40;
  uint64_t v41;
  uint64_t v42;
  uint8_t v43[4];
  uint64_t v44;
  __int16 v45;
  uint64_t v46;
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  -[IRCleanupManager _getListOfBuildsToDiscard](self, "_getListOfBuildsToDiscard");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id *)MEMORY[0x24BE5B270];
  v5 = *MEMORY[0x24BE5B270];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE5B270], OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_23FFBA000, v5, OS_LOG_TYPE_INFO, "#db-cleanup-manager, Getting date range of events to discard from builds metadata", buf, 2u);
  }
  v6 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  -[IRCleanupManager backgroundActivitiesManager](self, "backgroundActivitiesManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "server");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "biomeProvider");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "fetchLatestEventsOfEventType:numEvents:", 3, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  *(_QWORD *)buf = 0;
  v40 = buf;
  v41 = 0x2020000000;
  v42 = 0;
  v35[0] = MEMORY[0x24BDAC760];
  v35[1] = 3221225472;
  v35[2] = __53__IRCleanupManager__getDateIntervalOfBuildsToDiscard__block_invoke;
  v35[3] = &unk_2510458B8;
  v11 = v3;
  v36 = v11;
  v12 = v6;
  v37 = v12;
  v38 = buf;
  objc_msgSend(v10, "enumerateObjectsUsingBlock:", v35);
  if (objc_msgSend(v12, "count"))
  {
    v13 = *((_QWORD *)v40 + 3);
    if (v13 < objc_msgSend(v10, "count") - 1)
    {
      v14 = (void *)MEMORY[0x24BDD16E0];
      objc_msgSend(v10, "objectAtIndex:", *((_QWORD *)v40 + 3) + 1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "timestamp");
      objc_msgSend(v14, "numberWithDouble:");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "addObject:", v16);

    }
    v17 = (void *)MEMORY[0x24BDBCEB8];
    objc_msgSend(v12, "sortedArrayUsingSelector:", sel_compare_);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "arrayWithArray:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    v20 = (void *)MEMORY[0x24BDBCE60];
    objc_msgSend(v19, "firstObject");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "doubleValue");
    objc_msgSend(v20, "dateWithTimeIntervalSinceReferenceDate:");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    v23 = (void *)MEMORY[0x24BDBCE60];
    objc_msgSend(v19, "lastObject");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "doubleValue");
    objc_msgSend(v23, "dateWithTimeIntervalSinceReferenceDate:");
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1508]), "initWithStartDate:endDate:", v22, v25);
    v27 = *v4;
    if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v19, "firstObject");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "doubleValue");
      v30 = v29;
      objc_msgSend(v19, "lastObject");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "doubleValue");
      *(_DWORD *)v43 = 134218240;
      v44 = v30;
      v45 = 2048;
      v46 = v32;
      _os_log_impl(&dword_23FFBA000, v27, OS_LOG_TYPE_INFO, "#db-cleanup-manager, Found matching builds for discarding events with date range: (%f, %f)", v43, 0x16u);

    }
  }
  else
  {
    v33 = *v4;
    if (os_log_type_enabled((os_log_t)*v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v43 = 0;
      _os_log_impl(&dword_23FFBA000, v33, OS_LOG_TYPE_INFO, "#db-cleanup-manager, Found no matching builds for which to discard events", v43, 2u);
    }
    v26 = 0;
    v19 = v12;
  }

  _Block_object_dispose(buf, 8);
  return v26;
}

void __53__IRCleanupManager__getDateIntervalOfBuildsToDiscard__block_invoke(_QWORD *a1, void *a2, uint64_t a3)
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a2;
  objc_msgSend(v11, "eventBody");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)a1[4];
  objc_msgSend(v5, "build");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v6) = objc_msgSend(v6, "containsObject:", v7);

  if ((_DWORD)v6)
  {
    v8 = (void *)a1[5];
    v9 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(v11, "timestamp");
    objc_msgSend(v9, "numberWithDouble:");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObject:", v10);

    *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24) = a3;
  }

}

- (id)_getListOfBuildsToDiscard
{
  return &unk_25105EF90;
}

- (IRBackgroundActivitiesManager)backgroundActivitiesManager
{
  return (IRBackgroundActivitiesManager *)objc_loadWeakRetained((id *)&self->_backgroundActivitiesManager);
}

- (void)setBackgroundActivitiesManager:(id)a3
{
  objc_storeWeak((id *)&self->_backgroundActivitiesManager, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_backgroundActivitiesManager);
}

void __45__IRCleanupManager__handleCleanupXPCActivity__block_invoke_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_23FFBA000, log, OS_LOG_TYPE_ERROR, "#db-cleanup-manager, [ErrorId - DB access during cleanup] Could not connect to DB during DB cleanup", v1, 2u);
}

@end
