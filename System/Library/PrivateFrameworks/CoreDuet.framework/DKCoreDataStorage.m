@implementation DKCoreDataStorage

void __146___DKCoreDataStorage_deleteObjectsInContext_entityName_predicate_sortDescriptors_fetchOffset_fetchLimit_includeSubentities_includePendingChanges___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  _BOOL4 v12;
  void *v13;
  void *v14;
  NSObject *v15;
  id v16;
  uint64_t v17;
  void *v18;
  id obj;
  uint8_t buf[24];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc_init(MEMORY[0x1E0C97B48]);
  objc_msgSend(MEMORY[0x1E0C97B20], "entityForName:inManagedObjectContext:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setEntity:", v3);

  objc_msgSend(v2, "setFetchLimit:", *(_QWORD *)(a1 + 80));
  objc_msgSend(v2, "setIncludesSubentities:", *(unsigned __int8 *)(a1 + 96));
  objc_msgSend(v2, "setIncludesPendingChanges:", *(unsigned __int8 *)(a1 + 97));
  objc_msgSend(v2, "setFetchOffset:", *(_QWORD *)(a1 + 88));
  if (*(_QWORD *)(a1 + 48))
    objc_msgSend(v2, "setPredicate:");
  v4 = *(void **)(a1 + 56);
  if (v4 && objc_msgSend(v4, "count"))
    objc_msgSend(v2, "setSortDescriptors:", *(_QWORD *)(a1 + 56));
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C97A90]), "initWithFetchRequest:", v2);
  objc_msgSend(v5, "setResultType:", 2);
  v6 = a1 + 64;
  v7 = *(void **)(a1 + 40);
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  obj = *(id *)(v8 + 40);
  objc_msgSend(v7, "executeRequest:error:", v5, &obj);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v8 + 40), obj);
  objc_msgSend(v9, "result");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = objc_msgSend(v10, "integerValue");

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40))
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      __146___DKCoreDataStorage_deleteObjectsInContext_entityName_predicate_sortDescriptors_fetchOffset_fetchLimit_includeSubentities_includePendingChanges___block_invoke_cold_4();
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)v6 + 8) + 40), "domain");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v11, "isEqualToString:", *MEMORY[0x1E0CB28A8]))
      goto LABEL_19;
    v12 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)v6 + 8) + 40), "code") == 256;

    if (v12)
    {
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)v6 + 8) + 40), "userInfo");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("NSUnderlyingException"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if ((objc_opt_respondsToSelector() & 1) != 0)
        objc_msgSend(v11, "reason");
      else
        objc_msgSend(v11, "description");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v14, "containsString:", CFSTR("Expression tree is too large")))
      {
        v15 = MEMORY[0x1E0C81028];
        v16 = MEMORY[0x1E0C81028];
        if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
        {
          v17 = *(_QWORD *)(a1 + 32);
          objc_msgSend(*(id *)(a1 + 48), "cd_sanitizeForLogging");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          __146___DKCoreDataStorage_deleteObjectsInContext_entityName_predicate_sortDescriptors_fetchOffset_fetchLimit_includeSubentities_includePendingChanges___block_invoke_cold_3(v17, v18, buf);
        }

      }
LABEL_19:

    }
  }
  objc_msgSend(*(id *)(a1 + 40), "reset");

}

void __86___DKCoreDataStorage_initWithDirectory_databaseName_modelURL_readOnly_localOnly_sync___block_invoke(uint64_t a1, void *a2, char a3)
{
  id *v4;
  id v5;
  id WeakRetained;

  v4 = (id *)(a1 + 32);
  v5 = a2;
  WeakRetained = objc_loadWeakRetained(v4);
  -[_DKCoreDataStorage handleDataProtectionChangeFor:willBeAvailable:](WeakRetained, v5, a3);

}

void __45___DKCoreDataStorage_handleClientCallForHelp__block_invoke(_QWORD *a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  id v10;

  v2 = (void *)MEMORY[0x1E0C97B48];
  v3 = (void *)a1[4];
  objc_msgSend(*(id *)(a1[5] + 8), "entities");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fetchRequestWithEntityName:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0;
  objc_msgSend(v3, "countForFetchRequest:error:", v7, &v10);
  v8 = v10;
  v9 = v10;

  if (v9)
    objc_storeStrong((id *)(*(_QWORD *)(a1[6] + 8) + 40), v8);

}

void __45___DKCoreDataStorage_handleClientCallForHelp__block_invoke_2(uint64_t a1)
{
  id obj;

  -[_DKCoreDataStorage _registerForClientHelpNotifications](*(_QWORD *)(a1 + 32));
  obj = *(id *)(a1 + 32);
  objc_sync_enter(obj);
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 66) = 0;
  objc_sync_exit(obj);

}

uint64_t __85___DKCoreDataStorage_invalidateManagedObjectContextAndPersistentStoreCoordinatorFor___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "reset");
}

void __40___DKCoreDataStorage_managedObjectModel__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3748], "strongToWeakObjectsMapTable");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)gManagedObjectModelCache;
  gManagedObjectModelCache = v0;

}

void __93___DKCoreDataStorage_migratePersistentStoreAtURL_toManagedObjectModel_protectionClass_error___block_invoke(_QWORD *a1)
{
  _BYTE *v2;
  void *v3;
  void *v4;
  void *v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  int v9;
  id obj;

  v2 = (_BYTE *)a1[4];
  v3 = (void *)a1[5];
  v4 = (void *)a1[6];
  v5 = (void *)a1[7];
  v6 = a1[10];
  v7 = a1[11];
  v8 = *(_QWORD *)(a1[8] + 8);
  obj = *(id *)(v8 + 40);
  v9 = -[_DKCoreDataStorage migratePersistentStoreAtURL:toManagedObjectModel:protectionClass:startVersion:endVersion:error:](v2, v3, v4, v5, v6, v7, &obj);
  objc_storeStrong((id *)(v8 + 40), obj);
  if (v9)
    *(_BYTE *)(*(_QWORD *)(a1[9] + 8) + 24) = 1;
}

void __68___DKCoreDataStorage__addStoresToCoordinator_protectionClass_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;

  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (!v5 || v6)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      __68___DKCoreDataStorage__addStoresToCoordinator_protectionClass_error___block_invoke_cold_1();
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a3);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

void __68___DKCoreDataStorage__addStoresToCoordinator_protectionClass_error___block_invoke_60(uint64_t a1, uint64_t a2, void *a3)
{
  id v6;
  void *v7;
  NSObject *v8;

  v6 = a3;
  v7 = v6;
  if (!a2 || v6)
  {
    +[_CDLogging syncChannel](_CDLogging, "syncChannel");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __68___DKCoreDataStorage__addStoresToCoordinator_protectionClass_error___block_invoke_60_cold_1();

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a3);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

void __106___DKCoreDataStorage_countObjectsInContext_entityName_predicate_includeSubentities_includePendingChanges___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  id obj;

  v2 = objc_alloc_init(MEMORY[0x1E0C97B48]);
  objc_msgSend(MEMORY[0x1E0C97B20], "entityForName:inManagedObjectContext:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setEntity:", v3);
  objc_msgSend(v2, "setIncludesSubentities:", *(unsigned __int8 *)(a1 + 72));
  objc_msgSend(v2, "setIncludesPendingChanges:", *(unsigned __int8 *)(a1 + 73));
  if (*(_QWORD *)(a1 + 48))
    objc_msgSend(v2, "setPredicate:");
  v4 = *(void **)(a1 + 40);
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  obj = *(id *)(v5 + 40);
  v6 = objc_msgSend(v4, "countForFetchRequest:error:", v2, &obj);
  objc_storeStrong((id *)(v5 + 40), obj);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = v6;

}

void __49___DKCoreDataStorage_copyStorageFor_toDirectory___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  id v13;

  if (objc_msgSend(*(id *)(a1 + 32), "hasChanges"))
    objc_msgSend(*(id *)(a1 + 32), "save:", 0);
  objc_msgSend(*(id *)(a1 + 32), "reset");
  -[_DKCoreDataStorage databasePathFor:](*(id **)(a1 + 40), *(_QWORD *)(a1 + 48));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  -[_DKCoreDataStorage databasePathFor:](*(id **)(a1 + 56), *(_QWORD *)(a1 + 48));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0;
  +[_DKCoreDataStorage forceCopyItemAtPath:toPath:error:]((uint64_t)_DKCoreDataStorage, v2, v3, (uint64_t)&v13);
  v4 = v13;
  if (v4)
  {
    v5 = v4;
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      __49___DKCoreDataStorage_copyStorageFor_toDirectory___block_invoke_cold_1();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-wal"), v2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-wal"), v3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 48), "fileExistsAtPath:", v6))
    {
      v12 = 0;
      +[_DKCoreDataStorage forceCopyItemAtPath:toPath:error:]((uint64_t)_DKCoreDataStorage, v6, v7, (uint64_t)&v12);
      v5 = v12;
    }
    else
    {
      v5 = 0;
    }
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-shm"), v2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-shm"), v3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 48), "fileExistsAtPath:", v8))
    {
      v11 = v5;
      +[_DKCoreDataStorage forceCopyItemAtPath:toPath:error:]((uint64_t)_DKCoreDataStorage, v8, v9, (uint64_t)&v11);
      v10 = v11;

      v5 = v10;
    }
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 1;

  }
}

void __145___DKCoreDataStorage_updateObjectsInContext_entityName_predicate_sortDescriptors_batchFetchLimit_totalFetchLimit_includeSubentities_updateBlock___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  double v20;
  double v21;
  uint64_t v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  id v28;
  id v29;
  id v30;
  uint8_t buf[4];
  uint64_t v32;
  __int16 v33;
  double v34;
  __int16 v35;
  uint64_t v36;
  __int16 v37;
  void *v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "setUndoManager:", 0);
  v28 = objc_alloc_init(MEMORY[0x1E0C97B48]);
  objc_msgSend(MEMORY[0x1E0C97B20], "entityForName:inManagedObjectContext:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setEntity:", v27);
  objc_msgSend(v28, "setFetchLimit:", *(_QWORD *)(a1 + 80));
  objc_msgSend(v28, "setFetchBatchSize:", *(_QWORD *)(a1 + 88));
  objc_msgSend(v28, "setIncludesSubentities:", *(unsigned __int8 *)(a1 + 96));
  objc_msgSend(v28, "setIncludesPropertyValues:", 0);
  if (*(_QWORD *)(a1 + 48))
    objc_msgSend(v28, "setPredicate:");
  v2 = *(void **)(a1 + 56);
  if (v2 && objc_msgSend(v2, "count"))
    objc_msgSend(v28, "setSortDescriptors:", *(_QWORD *)(a1 + 56));
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(void **)(a1 + 32);
  v30 = 0;
  objc_msgSend(v3, "executeFetchRequest:error:", v28, &v30);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = v30;
  +[_CDLogging instrumentationChannel](_CDLogging, "instrumentationChannel");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v19 = objc_msgSend(v28, "fetchLimit");
    objc_msgSend(v26, "timeIntervalSinceNow");
    v21 = v20;
    v22 = objc_msgSend(v4, "count");
    objc_msgSend(v28, "predicate");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "cd_sanitizeForLogging");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218754;
    v32 = v19;
    v33 = 2048;
    v34 = -v21;
    v35 = 2048;
    v36 = v22;
    v37 = 2112;
    v38 = v24;
    _os_log_debug_impl(&dword_18DDBE000, v5, OS_LOG_TYPE_DEBUG, "updateObjectsInContext finished executeFetchRequest, fetchLimit %lu object(s),elapsed %f(sec), returned %lu object(s), Predicate: %@ ", buf, 0x2Au);

  }
  v6 = vcvtpd_u64_f64((double)(unint64_t)objc_msgSend(v4, "count") / (double)*(unint64_t *)(a1 + 88));
  if (v6)
  {
    v7 = 0;
    v8 = 1;
    do
    {
      v9 = (void *)MEMORY[0x193FEE914]();
      v10 = *(_QWORD *)(a1 + 88);
      v11 = objc_msgSend(v4, "count");
      v12 = v10 * v7;
      v13 = v10 * v7 + v10;
      if (v13 >= v11)
        v13 = v11;
      if (v12 < v13)
      {
        if (v11 >= v10 * v8)
          v14 = v10 * v8;
        else
          v14 = v11;
        do
        {
          v15 = *(_QWORD *)(a1 + 64);
          objc_msgSend(v4, "objectAtIndexedSubscript:", v12);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          LODWORD(v15) = (*(uint64_t (**)(uint64_t, void *))(v15 + 16))(v15, v16);

          if ((_DWORD)v15)
            ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24);
          ++v12;
        }
        while (v14 != v12);
      }
      if (objc_msgSend(*(id *)(a1 + 32), "hasChanges"))
      {
        v17 = *(void **)(a1 + 32);
        v29 = 0;
        objc_msgSend(v17, "save:", &v29);
        v18 = v29;
        if (v18 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          __145___DKCoreDataStorage_updateObjectsInContext_entityName_predicate_sortDescriptors_batchFetchLimit_totalFetchLimit_includeSubentities_updateBlock___block_invoke_cold_3(buf, (uint64_t)v18, &v32);

      }
      objc_msgSend(*(id *)(a1 + 32), "refreshAllObjects");
      objc_autoreleasePoolPop(v9);
      ++v7;
      ++v8;
    }
    while (v7 != v6);
  }

}

BOOL __147___DKCoreDataStorage_anonymizeObjectStringsInContext_entityName_predicate_sortDescriptors_batchFetchLimit_totalFetchLimit_includeSubentities_salt___block_invoke(uint64_t a1, uint64_t a2)
{
  return +[_DKCoreDataStorage anonymizeStringAttributesOfManagedObject:withSalt:](_DKCoreDataStorage, "anonymizeStringAttributesOfManagedObject:withSalt:", a2, *(_QWORD *)(a1 + 32)) != 0;
}

void __68___DKCoreDataStorage__addStoresToCoordinator_protectionClass_error___block_invoke_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_18DDBE000, MEMORY[0x1E0C81028], v0, "Failed to add local store to coordinator: %@", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_5();
}

void __68___DKCoreDataStorage__addStoresToCoordinator_protectionClass_error___block_invoke_60_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_18DDBE000, v0, v1, "Failed to add sync store to coordinator: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void __146___DKCoreDataStorage_deleteObjectsInContext_entityName_predicate_sortDescriptors_fetchOffset_fetchLimit_includeSubentities_includePendingChanges___block_invoke_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_5(&dword_18DDBE000, MEMORY[0x1E0C81028], v0, "Ignoring %@", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_5();
}

void __146___DKCoreDataStorage_deleteObjectsInContext_entityName_predicate_sortDescriptors_fetchOffset_fetchLimit_includeSubentities_includePendingChanges___block_invoke_cold_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_5(&dword_18DDBE000, MEMORY[0x1E0C81028], v0, "Encountered exception while deleting objects: %@", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_5();
}

void __146___DKCoreDataStorage_deleteObjectsInContext_entityName_predicate_sortDescriptors_fetchOffset_fetchLimit_includeSubentities_includePendingChanges___block_invoke_cold_3(uint64_t a1, void *a2, uint8_t *buf)
{
  *(_DWORD *)buf = 138412546;
  *(_QWORD *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2112;
  *(_QWORD *)(buf + 14) = a2;
  _os_log_fault_impl(&dword_18DDBE000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Invalid predicate on %@: %@", buf, 0x16u);

}

void __146___DKCoreDataStorage_deleteObjectsInContext_entityName_predicate_sortDescriptors_fetchOffset_fetchLimit_includeSubentities_includePendingChanges___block_invoke_cold_4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_12_3();
  OUTLINED_FUNCTION_0(&dword_18DDBE000, MEMORY[0x1E0C81028], v0, "Caught error: %@", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_5();
}

void __106___DKCoreDataStorage_countObjectsInContext_entityName_predicate_includeSubentities_includePendingChanges___block_invoke_cold_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_5(&dword_18DDBE000, MEMORY[0x1E0C81028], v0, "Encountered exception while counting objects: %@", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_5();
}

void __106___DKCoreDataStorage_countObjectsInContext_entityName_predicate_includeSubentities_includePendingChanges___block_invoke_cold_3(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  objc_begin_catch(a1);
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
    OUTLINED_FUNCTION_0_5(&dword_18DDBE000, MEMORY[0x1E0C81028], v1, "Caught %@", v2, v3, v4, v5, 2u);
  objc_end_catch();
  OUTLINED_FUNCTION_1();
}

void __49___DKCoreDataStorage_copyStorageFor_toDirectory___block_invoke_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_18DDBE000, MEMORY[0x1E0C81028], v0, "Failed copy: %@", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_5();
}

void __145___DKCoreDataStorage_updateObjectsInContext_entityName_predicate_sortDescriptors_batchFetchLimit_totalFetchLimit_includeSubentities_updateBlock___block_invoke_cold_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_5(&dword_18DDBE000, MEMORY[0x1E0C81028], v0, "Encountered exception while updating objects: %@", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_5();
}

void __145___DKCoreDataStorage_updateObjectsInContext_entityName_predicate_sortDescriptors_batchFetchLimit_totalFetchLimit_includeSubentities_updateBlock___block_invoke_cold_3(uint8_t *a1, uint64_t a2, _QWORD *a3)
{
  *(_DWORD *)a1 = 138412290;
  *a3 = a2;
  OUTLINED_FUNCTION_1_1(&dword_18DDBE000, MEMORY[0x1E0C81028], (uint64_t)a3, "Update commit failure: %@", a1);
}

void __145___DKCoreDataStorage_updateObjectsInContext_entityName_predicate_sortDescriptors_batchFetchLimit_totalFetchLimit_includeSubentities_updateBlock___block_invoke_cold_4(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  objc_begin_catch(a1);
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
    OUTLINED_FUNCTION_0_5(&dword_18DDBE000, MEMORY[0x1E0C81028], v1, "updateObjectsInContext: %@", v2, v3, v4, v5, 2u);
  objc_end_catch();
  OUTLINED_FUNCTION_1();
}

@end
