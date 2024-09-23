@implementation DPCoreDataStorage

void __71___DPCoreDataStorage_initWithDirectory_databaseName_modelURL_readOnly___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id *v4;
  id v5;
  id WeakRetained;

  v4 = (id *)(a1 + 32);
  v5 = a2;
  WeakRetained = objc_loadWeakRetained(v4);
  objc_msgSend(WeakRetained, "handleDataProtectionChangeFor:willBeAvailable:", v5, a3);

}

void __56___DPCoreDataStorage_invalidateManagedObjectContextFor___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  uint64_t v10;
  id v11;

  objc_msgSend(*(id *)(a1 + 32), "managedObjectContexts");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = (void *)os_transaction_create();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __56___DPCoreDataStorage_invalidateManagedObjectContextFor___block_invoke_2;
  v8[3] = &unk_1E95D9448;
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(a1 + 40);
  v9 = v3;
  v10 = v5;
  v11 = v6;
  v7 = v3;
  objc_msgSend(v7, "performWithOptions:andBlock:", 4, v8);

}

uint64_t __56___DPCoreDataStorage_invalidateManagedObjectContextFor___block_invoke_2(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "reset");
  objc_msgSend(*(id *)(a1 + 40), "managedObjectContexts");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeObjectForKey:", *(_QWORD *)(a1 + 48));

  return objc_msgSend(*(id *)(a1 + 40), "invalidatePersistentStoreCoordinatorFor:", *(_QWORD *)(a1 + 48));
}

void __62___DPCoreDataStorage_invalidatePersistentStoreCoordinatorFor___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "persistentStoreCoordinators");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v12 = 0u;
    v13 = 0u;
    v10 = 0u;
    v11 = 0u;
    objc_msgSend(v3, "persistentStores", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v11;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v11 != v7)
            objc_enumerationMutation(v4);
          objc_msgSend(v3, "removePersistentStore:error:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v8++), 0);
        }
        while (v6 != v8);
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      }
      while (v6);
    }

    objc_msgSend(*(id *)(a1 + 32), "persistentStoreCoordinators");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "removeObjectForKey:", *(_QWORD *)(a1 + 40));

  }
}

void __52___DPCoreDataStorage_persistentStoreCoordinatorFor___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  id v25;
  uint64_t v26;
  void *v27;
  NSObject *v28;
  NSObject *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  void *v33;
  NSObject *v34;
  NSObject *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  NSObject *v40;
  NSObject *v41;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  void *v45;
  void *v46;
  id v47;
  uint8_t buf[16];
  id v49;
  id v50;
  id v51;
  const __CFString *v52;
  _QWORD v53[2];

  v53[1] = *MEMORY[0x1E0C80C00];
  v2 = a1 + 32;
  objc_msgSend(*(id *)(a1 + 32), "persistentStoreCoordinators");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", *(_QWORD *)(v2 + 8));
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(v2 + 16) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

  v7 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v2 + 16) + 8) + 40);
  if (*(_BYTE *)(v2 + 32))
  {
    if (v7)
      return;
    v8 = objc_opt_class();
    objc_msgSend(*(id *)v2, "databaseDirectory");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = 0;
    LOBYTE(v8) = objc_msgSend((id)v8, "createDatabaseDirectory:error:", v9, &v51);
    v10 = v51;

    if ((v8 & 1) == 0 && objc_msgSend(v10, "code") != 516)
    {
      +[_DPLog framework](_DPLog, "framework");
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
        __52___DPCoreDataStorage_persistentStoreCoordinatorFor___block_invoke_cold_5((id *)v2, (uint64_t)v10, v29);

      v30 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v11 = *(void **)(v30 + 40);
      *(_QWORD *)(v30 + 40) = 0;
      goto LABEL_42;
    }
    objc_msgSend(*(id *)v2, "managedObjectModel");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v11)
    {
      +[_DPLog framework](_DPLog, "framework");
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
        __52___DPCoreDataStorage_persistentStoreCoordinatorFor___block_invoke_cold_1((id *)v2, v28);

      +[_DPCoreAnalyticsCollector sharedInstance](_DPCoreAnalyticsCollector, "sharedInstance");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v52 = CFSTR("nilMOM");
      v53[0] = MEMORY[0x1E0C9AAB0];
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v53, &v52, 1);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "reportMetricsForEvent:withMetrics:", CFSTR("com.apple.DifferentialPrivacy.CoreData"), v19);
      goto LABEL_41;
    }
    v12 = objc_msgSend(objc_alloc(MEMORY[0x1E0C97C00]), "initWithManagedObjectModel:", v11);
    v13 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v14 = *(void **)(v13 + 40);
    *(_QWORD *)(v13 + 40) = v12;

    v15 = (void *)MEMORY[0x1E0C99E98];
    objc_msgSend(*(id *)(a1 + 32), "paths");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "fileURLWithPath:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend((id)objc_opt_class(), "persistentStoreOptionsFor:readOnly:", *(_QWORD *)(a1 + 40), objc_msgSend(*(id *)(a1 + 32), "readOnly"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (void *)objc_msgSend(v19, "mutableCopy");
    objc_msgSend(v20, "removeObjectForKey:", *MEMORY[0x1E0C978D0]);
    v21 = (void *)objc_msgSend(v20, "copy");
    v22 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
    v23 = *MEMORY[0x1E0C979E8];
    v50 = v10;
    objc_msgSend(v22, "addPersistentStoreWithType:configuration:URL:options:error:", v23, 0, v18, v21, &v50);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = v50;

    if (v24)
    {
      v10 = v25;
LABEL_38:
      v44 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
      if (v44)
      {
        objc_msgSend(*(id *)(a1 + 32), "persistentStoreCoordinators");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "setObject:forKeyedSubscript:", v44, *(_QWORD *)(a1 + 40));

      }
LABEL_41:

LABEL_42:
      return;
    }
    objc_msgSend(v25, "domain");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v31, "isEqualToString:", *MEMORY[0x1E0CB28A8]))
    {
      if (objc_msgSend(v25, "code") == 134020)
      {

LABEL_19:
        v32 = objc_msgSend(v19, "mutableCopy");
        objc_msgSend((id)v32, "setObject:forKey:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0C97948]);
        v33 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
        v49 = 0;
        v46 = (void *)v32;
        LOBYTE(v32) = objc_msgSend(v33, "destroyPersistentStoreAtURL:withType:options:error:", v18, v23, v32, &v49);
        v25 = v49;
        if ((v32 & 1) != 0)
          goto LABEL_23;
        +[_DPLog framework](_DPLog, "framework");
        v34 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
          __52___DPCoreDataStorage_persistentStoreCoordinatorFor___block_invoke_cold_4();

        objc_msgSend(v46, "setObject:forKey:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0C97990]);
        if (objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "destroyPersistentStoreAtURL:withType:options:error:", v18, v23, v46, 0))
        {
LABEL_23:
          +[_DPLog framework](_DPLog, "framework");
          v35 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1D3FAA000, v35, OS_LOG_TYPE_DEFAULT, "Deleted persistent store with old schema.", buf, 2u);
          }

          v36 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
          v47 = v25;
          objc_msgSend(v36, "addPersistentStoreWithType:configuration:URL:options:error:", v23, 0, v18, v19, &v47);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v10 = v47;

          if (v24)
            goto LABEL_38;
          goto LABEL_35;
        }
        +[_DPLog framework](_DPLog, "framework");
        v40 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
          __52___DPCoreDataStorage_persistentStoreCoordinatorFor___block_invoke_cold_3();

        v31 = v46;
        goto LABEL_33;
      }
      if (objc_msgSend(v25, "code") > 134099)
      {
        v37 = objc_msgSend(v25, "code");
        v38 = v31;
        v39 = v37;

        if (v39 >= 134171)
          goto LABEL_34;
        goto LABEL_19;
      }
    }
LABEL_33:

LABEL_34:
    v10 = v25;
LABEL_35:
    +[_DPLog framework](_DPLog, "framework");
    v41 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
      __52___DPCoreDataStorage_persistentStoreCoordinatorFor___block_invoke_cold_2();

    objc_msgSend(*(id *)(a1 + 32), "handleDatabaseErrors:forPSC:protectionClass:", v10, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), *(_QWORD *)(a1 + 40));
    v42 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v43 = *(void **)(v42 + 40);
    *(_QWORD *)(v42 + 40) = 0;

    v24 = 0;
    goto LABEL_38;
  }
  if (v7)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
    v26 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v27 = *(void **)(v26 + 40);
    *(_QWORD *)(v26 + 40) = 0;

  }
}

void __44___DPCoreDataStorage_mocForProtectionClass___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;

  objc_msgSend(*(id *)(a1 + 32), "managedObjectContexts");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = a1 + 40;
  objc_msgSend(v2, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

  v7 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
  if (*(_BYTE *)(a1 + 64))
  {
    if (v7)
      return;
    objc_msgSend(*(id *)(a1 + 32), "persistentStoreCoordinatorFor:", *(_QWORD *)(a1 + 40));
    v8 = objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v9 = objc_msgSend(objc_alloc(MEMORY[0x1E0C97B88]), "initWithConcurrencyType:", 1);
      v10 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v11 = *(void **)(v10 + 40);
      *(_QWORD *)(v10 + 40) = v9;

      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "setPersistentStoreCoordinator:", v8);
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "setMergePolicy:", *MEMORY[0x1E0C978C0]);
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "setUndoManager:", 0);
      v12 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
      objc_msgSend(*(id *)(a1 + 32), "managedObjectContexts");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setObject:forKeyedSubscript:", v12, *(_QWORD *)(a1 + 40));

    }
    else
    {
      +[_DPLog daemon](_DPLog, "daemon");
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        __44___DPCoreDataStorage_mocForProtectionClass___block_invoke_cold_2(v3, v22, v23, v24, v25, v26, v27, v28);

    }
  }
  else
  {
    if (v7)
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
      v14 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v15 = *(void **)(v14 + 40);
      *(_QWORD *)(v14 + 40) = 0;

    }
    +[_DPLog daemon](_DPLog, "daemon");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __44___DPCoreDataStorage_mocForProtectionClass___block_invoke_cold_1(a1 + 40, v8, v16, v17, v18, v19, v20, v21);
  }

}

void __105___DPCoreDataStorage_deleteObjectsInContext_entityName_predicate_sortDescriptors_fetchOffset_fetchLimit___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = (id)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0C97B20], "entityForName:inManagedObjectContext:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setEntity:", v2);

  objc_msgSend(v7, "setFetchLimit:", *(_QWORD *)(a1 + 72));
  objc_msgSend(v7, "setIncludesSubentities:", 0);
  objc_msgSend(v7, "setIncludesPendingChanges:", 0);
  objc_msgSend(v7, "setFetchOffset:", *(_QWORD *)(a1 + 80));
  if (*(_QWORD *)(a1 + 48))
    objc_msgSend(v7, "setPredicate:");
  v3 = *(void **)(a1 + 56);
  if (v3 && objc_msgSend(v3, "count"))
    objc_msgSend(v7, "setSortDescriptors:", *(_QWORD *)(a1 + 56));
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C97A90]), "initWithFetchRequest:", v7);
  objc_msgSend(v4, "setResultType:", 2);
  objc_msgSend(*(id *)(a1 + 40), "executeRequest:error:", v4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "result");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = objc_msgSend(v6, "unsignedIntegerValue");

  objc_msgSend(*(id *)(a1 + 40), "reset");
}

void __65___DPCoreDataStorage_countObjectsInContext_entityName_predicate___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  v2 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0C97B20], "entityForName:inManagedObjectContext:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setEntity:", v3);
  objc_msgSend(v2, "setIncludesSubentities:", 0);
  objc_msgSend(v2, "setIncludesPendingChanges:", 0);
  if (*(_QWORD *)(a1 + 48))
    objc_msgSend(v2, "setPredicate:");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = objc_msgSend(*(id *)(a1 + 40), "countForFetchRequest:error:", v2, 0);

}

uint64_t __50___DPCoreDataStorage_deleteStorageFor_obliterate___block_invoke(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "invalidateManagedObjectContextFor:", *(_QWORD *)(a1 + 40));
  result = objc_msgSend(*(id *)(a1 + 32), "deleteDatabaseForPSC:protectionClass:obliterate:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 64));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = result;
  return result;
}

void __52___DPCoreDataStorage_persistentStoreCoordinatorFor___block_invoke_cold_1(id *a1, NSObject *a2)
{
  void *v3;
  uint8_t v4[24];
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*a1, "modelURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  _os_log_error_impl(&dword_1D3FAA000, a2, OS_LOG_TYPE_ERROR, "Failed to load Managed Object Model from %@", v4, 0xCu);

}

void __52___DPCoreDataStorage_persistentStoreCoordinatorFor___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1D3FAA000, v0, v1, "Failed to add persistent store: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __52___DPCoreDataStorage_persistentStoreCoordinatorFor___block_invoke_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1D3FAA000, v0, v1, "Failed to delete persistent store with old schema: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __52___DPCoreDataStorage_persistentStoreCoordinatorFor___block_invoke_cold_4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1D3FAA000, v0, v1, "Failed to delete persistent store with old schema, retrying with unlink: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __52___DPCoreDataStorage_persistentStoreCoordinatorFor___block_invoke_cold_5(id *a1, uint64_t a2, NSObject *a3)
{
  void *v5;
  uint8_t v6[12];
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*a1, "databaseDirectory");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  v7 = 2112;
  v8 = a2;
  _os_log_error_impl(&dword_1D3FAA000, a3, OS_LOG_TYPE_ERROR, "%@ : did not exist and could not be created: %@", v6, 0x16u);

}

void __44___DPCoreDataStorage_mocForProtectionClass___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1D3FAA000, a2, a3, "NSManagedObjectContext not available for protectionClass=%@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __44___DPCoreDataStorage_mocForProtectionClass___block_invoke_cold_2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1D3FAA000, a2, a3, "NSPersistentStoreCoordinator is nil for protectionClass=%@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __65___DPCoreDataStorage_countObjectsInContext_entityName_predicate___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1D3FAA000, v0, v1, "Caught %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

@end
