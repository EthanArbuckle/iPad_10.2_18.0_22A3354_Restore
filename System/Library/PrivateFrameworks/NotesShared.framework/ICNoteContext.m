@implementation ICNoteContext

+ (BOOL)legacyNotesDisabled
{
  void *v2;
  void *v3;
  void *v4;
  char v5;

  CPSharedResourcesDirectory();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAppendingString:", CFSTR("/Library/Notes/.DisableLegacyNotes"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "fileExistsAtPath:", v3);

  return v5;
}

void __47__ICNoteContext_startSharedContextWithOptions___block_invoke_2()
{
  void *v0;
  int v1;
  id v2;

  if ((objc_msgSend((id)sharedContext, "hasContextOptions:", 64) & 1) == 0
    && (objc_msgSend((id)sharedContext, "hasContextOptions:", 8) & 1) == 0)
  {
    if (ICIsSandboxModeEnabled())
    {
      objc_msgSend((id)sharedContext, "updateAccounts");
    }
    else if (objc_msgSend((id)sharedContext, "hasContextOptions:", 721457))
    {
      objc_msgSend((id)sharedContext, "addOrDeleteLocalAccountIfNecessary");
      objc_msgSend((id)sharedContext, "managedObjectContext");
      v0 = (void *)objc_claimAutoreleasedReturnValue();
      v1 = objc_msgSend(v0, "hasChanges");

      if (v1)
      {
        objc_msgSend((id)sharedContext, "managedObjectContext");
        v2 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v2, "ic_save");

      }
    }
  }
}

- (void)addOrDeleteLocalAccountIfNecessary
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_1(&dword_1BD918000, v0, v1, "Creating local account", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

- (ICAccountUtilities)accountUtilities
{
  return self->_accountUtilities;
}

- (NSManagedObjectContext)managedObjectContext
{
  return (NSManagedObjectContext *)objc_getProperty(self, a2, 32, 1);
}

- (BOOL)shouldEnsureLocalAccount
{
  return self->_shouldEnsureLocalAccount;
}

+ (ICNoteContext)sharedContext
{
  id v2;
  void *v3;
  NSObject *v4;
  void *v5;
  id v6;
  uint8_t v8[24];
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v2 = a1;
  objc_sync_enter(v2);
  v3 = (void *)sharedContext;
  if (!sharedContext)
  {
    v4 = os_log_create("com.apple.notes", "CoreData");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      +[ICNoteContext sharedContext].cold.1(v5, v8, v4);
    }

    v3 = (void *)sharedContext;
  }
  v6 = v3;
  objc_sync_exit(v2);

  return (ICNoteContext *)v6;
}

+ (BOOL)hasContextOptions:(unint64_t)a3
{
  BOOL result;

  result = sharedContext;
  if (sharedContext)
    return objc_msgSend((id)sharedContext, "hasContextOptions:", a3);
  return result;
}

+ (void)startSharedContextWithOptions:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_1(&dword_1BD918000, v0, v1, "Forcing SQL store", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

void __47__ICNoteContext_startSharedContextWithOptions___block_invoke(uint64_t a1)
{
  ICNoteContext *v1;
  void *v2;

  v1 = -[ICNoteContext initWithOptions:]([ICNoteContext alloc], "initWithOptions:", *(_QWORD *)(a1 + 32));
  v2 = (void *)sharedContext;
  sharedContext = (uint64_t)v1;

}

uint64_t __60__ICNoteContext_defaultPersistentStoreFromPersistentStores___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "URL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqual:", *(_QWORD *)(a1 + 32));

  return v4;
}

- (ICNotesCrossProcessChangeCoordinator)crossProcessChangeCoordinator
{
  return self->_crossProcessChangeCoordinator;
}

void __36__ICNoteContext_persistentContainer__block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  ICNoteMergePolicy *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  char v18;
  id v19;
  NSObject *v20;
  NSObject *v21;
  id *v22;
  void *v23;
  void *v24;
  _BOOL8 v25;
  int v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t i;
  uint64_t v35;
  id *v36;
  void *v37;
  id v38;
  id v39;
  void *v40;
  id v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  id v46;
  _QWORD aBlock[5];
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  if (!*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16))
  {
    v2 = (id)*MEMORY[0x1E0C979E8];
    objc_msgSend(MEMORY[0x1E0D64248], "standardStoreOptions");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (void *)objc_msgSend(v3, "mutableCopy");

    if ((objc_msgSend(*(id *)(a1 + 32), "hasContextOptions:", 0x200000) & 1) == 0)
    {
      ICDataStoreServiceBundleIdentifier();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, *MEMORY[0x1E0C97A60]);

      objc_msgSend(v4, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0C97A50]);
      v6 = (id)*MEMORY[0x1E0C97A70];

      v2 = v6;
    }
    if (objc_msgSend(*(id *)(a1 + 32), "hasContextOptions:", 2056))
    {
      v7 = *MEMORY[0x1E0C979E0];
      objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0C979E0]);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (void *)objc_msgSend(v8, "mutableCopy");

      if (!v9)
      {
        objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v9, "setObject:forKeyedSubscript:", CFSTR("0"), CFSTR("cache_spill"));
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v9, v7);

    }
    if (objc_msgSend(*(id *)(a1 + 32), "hasContextOptions:", 64))
      objc_msgSend(v4, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0C97998]);
    if (objc_msgSend(*(id *)(a1 + 32), "hasContextOptions:", 0x800000))
      objc_msgSend(v4, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAA0], *MEMORY[0x1E0C978D0]);
    if ((objc_msgSend(*(id *)(a1 + 32), "hasContextOptions:", 721457) & 1) == 0)
      objc_msgSend(v4, "setObject:forKeyedSubscript:", &unk_1E771A570, *MEMORY[0x1E0C97910]);
    objc_msgSend(MEMORY[0x1E0D64240], "persistentStoreURL");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      v11 = objc_alloc_init(ICNoteMergePolicy);
      v12 = objc_msgSend(objc_alloc(MEMORY[0x1E0D64248]), "initWithStoreURL:storeType:options:mergePolicy:", v10, v2, v4, v11);
      v13 = *(_QWORD *)(a1 + 32);
      v14 = *(void **)(v13 + 16);
      *(_QWORD *)(v13 + 16) = v12;

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "storeURL", "-[ICNoteContext persistentContainer]_block_invoke", 1, 1, CFSTR("Couldn't find store URL for persistent container"));
    }
    v15 = *(_QWORD *)(a1 + 32);
    if (*(_QWORD *)(v15 + 16))
    {
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 3221225472;
      aBlock[2] = __36__ICNoteContext_persistentContainer__block_invoke_2;
      aBlock[3] = &unk_1E76CB6C8;
      aBlock[4] = v15;
      v16 = _Block_copy(aBlock);
      v17 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
      v46 = 0;
      v18 = objc_msgSend(v17, "loadPersistentStore:storeCreatedHandler:", &v46, v16);
      v19 = v46;
      v20 = os_log_create("com.apple.notes", "CoreData");
      v21 = v20;
      if ((v18 & 1) != 0)
      {
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
          __36__ICNoteContext_persistentContainer__block_invoke_cold_1();

        v22 = *(id **)(a1 + 32);
        objc_msgSend(v22[2], "persistentStoreCoordinator");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "persistentStores");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "refreshPersistentStoresByAccountIdFromPersistentStores:", v24);

      }
      else
      {
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
          __36__ICNoteContext_persistentContainer__block_invoke_cold_2();

        objc_msgSend(*(id *)(a1 + 32), "setDatabaseOpenError:", v19);
        objc_msgSend(v19, "domain");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v23, "isEqualToString:", *MEMORY[0x1E0D63F58]))
          v25 = objc_msgSend(v19, "code") == 209;
        else
          v25 = 0;
        objc_msgSend(*(id *)(a1 + 32), "setDatabaseOpenFailedDueToLowDiskSpace:", v25);
      }

      v26 = objc_msgSend(*(id *)(a1 + 32), "hasContextOptions:", 2048);
      v27 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
      if (v26)
      {
        v28 = objc_msgSend(v27, "newBackgroundContext");
      }
      else
      {
        objc_msgSend(v27, "viewContext");
        v28 = objc_claimAutoreleasedReturnValue();
      }
      v29 = (void *)v28;
      objc_msgSend(*(id *)(a1 + 32), "setManagedObjectContext:", v28);

      if ((objc_msgSend(*(id *)(a1 + 32), "hasContextOptions:", 64) & 1) == 0)
      {
        v39 = v19;
        v40 = v16;
        v41 = v2;
        v44 = 0u;
        v45 = 0u;
        v42 = 0u;
        v43 = 0u;
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "persistentStoreDescriptions");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v42, v48, 16);
        if (v31)
        {
          v32 = v31;
          v33 = *(_QWORD *)v43;
          do
          {
            for (i = 0; i != v32; ++i)
            {
              if (*(_QWORD *)v43 != v33)
                objc_enumerationMutation(v30);
              v35 = *(_QWORD *)(*((_QWORD *)&v42 + 1) + 8 * i);
              v36 = *(id **)(a1 + 32);
              objc_msgSend(v36[2], "persistentStoreCoordinator");
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v36, "startIndexingWithCoreSpotlightDelegateForDescription:coordinator:", v35, v37);

            }
            v32 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v42, v48, 16);
          }
          while (v32);
        }

        v38 = (id)objc_msgSend((id)objc_opt_class(), "initializeSearchIndexerDataSourceWithPersistentContainer:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16));
        v16 = v40;
        v2 = v41;
        v19 = v39;
      }

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D63F58], 217, 0);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "setDatabaseOpenError:", v16);
    }

  }
}

- (BOOL)hasContextOptions:(unint64_t)a3
{
  return (a3 & ~-[ICNoteContext contextOptions](self, "contextOptions")) == 0;
}

- (unint64_t)contextOptions
{
  return self->_contextOptions;
}

void __36__ICNoteContext_persistentContainer__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_1(&dword_1BD918000, v0, v1, "Loaded persistent store", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

- (void)startIndexingWithCoreSpotlightDelegateForDescription:(id)a3 coordinator:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  v5 = a4;
  if (ICUseCoreDataCoreSpotlightIntegration())
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D641D0]), "initForStoreWithDescription:coordinator:indexingPriority:", v8, v5, 2);
    if (v6)
    {
      objc_msgSend(MEMORY[0x1E0D641B0], "sharedReindexer");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "registerCoreDataCoreSpotlightDelegate:", v6);

      objc_msgSend(v6, "startSpotlightIndexing");
    }

  }
}

- (void)setManagedObjectContext:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (void)refreshPersistentStoresByAccountIdFromPersistentStores:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  os_log_t v15;
  NSObject *v16;
  NSObject *v17;
  void *v18;
  id v19;
  void *v20;
  os_log_t v21;
  NSObject *v22;
  NSObject *v23;
  void *v24;
  os_log_t v25;
  os_log_t v26;
  NSObject *v27;
  void *v28;
  NSObject *v29;
  _BOOL4 v30;
  NSObject *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  ICNoteContext *v35;
  void *v36;
  void *v37;
  _QWORD v38[4];
  id v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  uint8_t buf[4];
  void *v45;
  __int16 v46;
  void *v47;
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v37 = (void *)objc_opt_new();
  -[ICNoteContext defaultPersistentStoreFromPersistentStores:](self, "defaultPersistentStoreFromPersistentStores:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = v4;
  -[ICNoteContext inMemoryPersistentStoreFromPersistentStores:](self, "inMemoryPersistentStoreFromPersistentStores:", v4);
  v33 = objc_claimAutoreleasedReturnValue();
  v35 = self;
  -[ICNoteContext accountUtilities](self, "accountUtilities");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "allICloudACAccounts");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  v8 = v7;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v40, v48, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v41;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v41 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * i);
        objc_msgSend(v13, "identifier");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v13, "ic_isNotesEnabled"))
        {
          if (objc_msgSend(v13, "ic_isPrimaryAppleAccount"))
          {
            v15 = os_log_create("com.apple.notes", "CoreData");
            v16 = v15;
            if (v5)
            {
              v17 = v15;
              if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
              {
                objc_msgSend(v5, "URL");
                v24 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138412546;
                v45 = v14;
                v46 = 2112;
                v47 = v24;
                _os_log_debug_impl(&dword_1BD918000, v17, OS_LOG_TYPE_DEBUG, "Found loaded persistent store for primary account %@: %@", buf, 0x16u);

              }
              objc_msgSend(v37, "setObject:forKeyedSubscript:", v5, v14);
            }
            else
            {
              if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138412290;
                v45 = v14;
                _os_log_debug_impl(&dword_1BD918000, v16, OS_LOG_TYPE_DEBUG, "Didn't find a loaded persistent store for primary account %@", buf, 0xCu);
              }

            }
          }
          else if (objc_msgSend(v13, "ic_shouldCreateSeparatePersistentStore"))
          {
            -[ICNoteContext storeFilenameForAccountIdentifier:](v35, "storeFilenameForAccountIdentifier:", v14);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v38[0] = MEMORY[0x1E0C809B0];
            v38[1] = 3221225472;
            v38[2] = __72__ICNoteContext_refreshPersistentStoresByAccountIdFromPersistentStores___block_invoke;
            v38[3] = &unk_1E76CB6F0;
            v39 = v18;
            v19 = v18;
            objc_msgSend(v36, "ic_objectPassingTest:", v38);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            v21 = os_log_create("com.apple.notes", "CoreData");
            v22 = v21;
            if (v20)
            {
              v23 = v21;
              if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
              {
                objc_msgSend(v20, "URL");
                v34 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138412546;
                v45 = v14;
                v46 = 2112;
                v47 = v34;
                _os_log_debug_impl(&dword_1BD918000, v23, OS_LOG_TYPE_DEBUG, "Found loaded persistent store for account %@: %@", buf, 0x16u);

              }
              objc_msgSend(v37, "setObject:forKeyedSubscript:", v20, v14);
            }
            else
            {
              if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138412290;
                v45 = v14;
                _os_log_debug_impl(&dword_1BD918000, v22, OS_LOG_TYPE_DEBUG, "Didn't find a loaded persistent store for account %@", buf, 0xCu);
              }

            }
          }
        }

      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v40, v48, 16);
    }
    while (v10);
  }

  v25 = os_log_create("com.apple.notes", "CoreData");
  v26 = v25;
  if (v5)
  {
    v27 = v25;
    v28 = (void *)v33;
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
      -[ICNoteContext refreshPersistentStoresByAccountIdFromPersistentStores:].cold.5(v5, v27);

    objc_msgSend(v37, "setObject:forKeyedSubscript:", v5, CFSTR("LocalAccount"));
  }
  else
  {
    v28 = (void *)v33;
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
      -[ICNoteContext refreshPersistentStoresByAccountIdFromPersistentStores:].cold.4();

  }
  v29 = os_log_create("com.apple.notes", "CoreData");
  v30 = os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG);
  if (v28)
  {
    if (v30)
      -[ICNoteContext refreshPersistentStoresByAccountIdFromPersistentStores:].cold.3();

    objc_msgSend(v37, "setObject:forKeyedSubscript:", v28, CFSTR("InMemoryAccount"));
  }
  else
  {
    if (v30)
      -[ICNoteContext refreshPersistentStoresByAccountIdFromPersistentStores:].cold.2();

  }
  v31 = os_log_create("com.apple.notes", "CoreData");
  if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
    -[ICNoteContext refreshPersistentStoresByAccountIdFromPersistentStores:].cold.1();

  v32 = (void *)objc_msgSend(v37, "copy");
  -[ICNoteContext setPersistentStoresByAccountId:](v35, "setPersistentStoresByAccountId:", v32);

}

- (void)refreshPersistentStoresByAccountIdFromPersistentStores:(void *)a1 .cold.5(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "URL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1_2(&dword_1BD918000, a2, v4, "Found loaded persistent store for local account: %@", v5);

  OUTLINED_FUNCTION_4_0();
}

- (void)refreshPersistentStoresByAccountIdFromPersistentStores:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_1(&dword_1BD918000, v0, v1, "Didn't find a loaded persistent store for in-memory account.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

- (void)refreshPersistentStoresByAccountIdFromPersistentStores:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1_2(&dword_1BD918000, v0, v1, "Loaded persistentStoresByAccountId: %@", v2);
  OUTLINED_FUNCTION_1_0();
}

- (ICNoteContext)initWithOptions:(unint64_t)a3
{
  ICNoteContext *v4;
  ICNoteContext *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  id v11;
  NSObject *v12;
  id v13;
  int v14;
  os_log_t v15;
  NSObject *v16;
  NSObject *v17;
  id v18;
  int v19;
  os_log_t v20;
  NSObject *v21;
  NSObject *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  uint64_t v32;
  ICNoteContext *v33;
  id v34;
  objc_super v35;
  uint8_t buf[4];
  void *v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v35.receiver = self;
  v35.super_class = (Class)ICNoteContext;
  v4 = -[ICNoteContext init](&v35, sel_init);
  v5 = v4;
  if (!v4)
    return v5;
  -[ICNoteContext setContextOptions:](v4, "setContextOptions:", a3);
  if (-[ICNoteContext hasAnyContextOptions:](v5, "hasAnyContextOptions:", 3))
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "registerDefaults:", &unk_1E771ACA0);

  }
  if (-[ICNoteContext hasContextOptions:](v5, "hasContextOptions:", 0x40000))
  {
    objc_msgSend(MEMORY[0x1E0D64240], "applicationDataContainerURL");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v7)
    {
      objc_msgSend(MEMORY[0x1E0D64240], "applicationDocumentsURL");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v7, "URLByAppendingPathComponent:isDirectory:", CFSTR("tmp"), 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = 0;
      v10 = objc_msgSend(v9, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v8, 1, 0, &v34);
      v11 = v34;

      if ((v10 & 1) == 0)
      {
        v12 = os_log_create("com.apple.notes", "Application");
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
          -[ICNoteContext initWithOptions:].cold.3();

      }
      if (!v7)
      {
LABEL_13:
        if (!v8)
        {
LABEL_30:

          goto LABEL_31;
        }
LABEL_23:
        objc_msgSend(v8, "path");
        v18 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v19 = setenv("TMPDIR", (const char *)objc_msgSend(v18, "fileSystemRepresentation"), 1);

        v20 = os_log_create("com.apple.notes", "Application");
        v21 = v20;
        if (v19)
        {
          v22 = v20;
          if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
            -[ICNoteContext initWithOptions:].cold.1();

        }
        else if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v37 = v8;
          _os_log_impl(&dword_1BD918000, v21, OS_LOG_TYPE_INFO, "setenv TMPDIR %@", buf, 0xCu);
        }

        goto LABEL_30;
      }
    }
    else
    {
      v11 = 0;
      if (!v7)
        goto LABEL_13;
    }
    objc_msgSend(v7, "path");
    v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v14 = setenv("HOME", (const char *)objc_msgSend(v13, "fileSystemRepresentation"), 1);

    v15 = os_log_create("com.apple.notes", "Application");
    v16 = v15;
    if (v14)
    {
      v17 = v15;
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        -[ICNoteContext initWithOptions:].cold.2();

    }
    else if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v37 = v7;
      _os_log_impl(&dword_1BD918000, v16, OS_LOG_TYPE_DEFAULT, "setenv HOME %@", buf, 0xCu);
    }

    if (!v8)
      goto LABEL_30;
    goto LABEL_23;
  }
LABEL_31:
  v23 = -[ICNoteContext hasContextOptions:](v5, "hasContextOptions:", 64);
  objc_msgSend(MEMORY[0x1E0D64240], "setIsReadOnlyPersistentStore:", v23);
  -[ICNoteContext startSearchIndexerChangeObservingIfNecessary](v5, "startSearchIndexerChangeObservingIfNecessary");
  if (!-[ICNoteContext hasContextOptions:](v5, "hasContextOptions:", 0x2000))
  {
    objc_msgSend(MEMORY[0x1E0D64180], "sharedInstance");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICNoteContext setAccountUtilities:](v5, "setAccountUtilities:", v24);

  }
  -[ICNoteContext setupCrossProcessChangeCoordinator](v5, "setupCrossProcessChangeCoordinator");
  -[ICNoteContext setPersistentStoresByAccountId:](v5, "setPersistentStoresByAccountId:", 0);
  -[ICNoteContext loadAdditionalPersistentStores](v5, "loadAdditionalPersistentStores");
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "addObserver:selector:name:object:", v5, sel_accountsDidChange_, CFSTR("ICAccountsDidChangeNotification"), 0);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "addObserver:selector:name:object:", v5, sel_managedObjectContextUpdaterDidMerge_, *MEMORY[0x1E0D640C0], 0);

  if (-[ICNoteContext hasContextOptions:](v5, "hasContextOptions:", 1))
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = *MEMORY[0x1E0C978A8];
    -[ICNoteContext persistentStoreCoordinator](v5, "persistentStoreCoordinator");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "addObserver:selector:name:object:", v5, sel_managedObjectContextDidSave_, v28, v29);

    v32 = MEMORY[0x1E0C809B0];
    v33 = v5;
    dispatchMainAfterDelay();
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter", v32, 3221225472, __33__ICNoteContext_initWithOptions___block_invoke, &unk_1E76C73F8);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "addObserver:selector:name:object:", v33, sel_cloudContextFetchRecordChangeOperationDidFinish_, CFSTR("ICCloudContextFetchRecordChangeOperationDidFinishNotification"), 0);

  }
  return v5;
}

- (void)setPersistentStoresByAccountId:(id)a3
{
  objc_storeStrong((id *)&self->_persistentStoresByAccountId, a3);
}

- (void)startSearchIndexerChangeObservingIfNecessary
{
  id v2;

  if (-[ICNoteContext hasContextOptions:](self, "hasContextOptions:", 0x10000))
  {
    objc_msgSend(MEMORY[0x1E0D64258], "sharedIndexer");
    v2 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setDisabled:", 0);
    if ((objc_msgSend(v2, "isObservingChanges") & 1) == 0)
      objc_msgSend(v2, "startObservingChanges");

  }
}

void __74__ICNoteContext_initializeSearchIndexerDataSourceWithPersistentContainer___block_invoke(uint64_t a1)
{
  ICModernSearchIndexerDataSource *v1;
  void *v2;
  id v3;

  v1 = -[ICModernSearchIndexerDataSource initWithPersistentContainer:]([ICModernSearchIndexerDataSource alloc], "initWithPersistentContainer:", *(_QWORD *)(a1 + 32));
  v2 = (void *)initializeSearchIndexerDataSourceWithPersistentContainer__sDataSource;
  initializeSearchIndexerDataSourceWithPersistentContainer__sDataSource = (uint64_t)v1;

  objc_msgSend(MEMORY[0x1E0D64258], "sharedIndexer");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addDataSource:", initializeSearchIndexerDataSourceWithPersistentContainer__sDataSource);

}

- (void)setupCrossProcessChangeCoordinator
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1_2(&dword_1BD918000, v0, v1, "Creating managed object context updater for %@", v2);
  OUTLINED_FUNCTION_1_0();
}

- (id)persistentStoreCoordinator
{
  void *v2;
  void *v3;

  -[ICNoteContext persistentContainer](self, "persistentContainer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "persistentStoreCoordinator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)workerManagedObjectContext
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_opt_class();
  -[ICNoteContext persistentContainer](self, "persistentContainer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "workerManagedObjectContextForContainer:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (ICPersistentContainer)persistentContainer
{
  NSObject *v3;
  void *v4;
  ICPersistentContainer *v5;
  _QWORD block[5];

  -[ICNoteContext persistentContainerQueue](self, "persistentContainerQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __36__ICNoteContext_persistentContainer__block_invoke;
  block[3] = &unk_1E76C73F8;
  block[4] = self;
  dispatch_sync(v3, block);
  -[ICNoteContext crossProcessChangeCoordinator](self, "crossProcessChangeCoordinator");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
    dispatchMainAfterDelay();
  v5 = self->_persistentContainer;

  return v5;
}

- (id)persistentContainerQueue
{
  if (persistentContainerQueue_onceToken != -1)
    dispatch_once(&persistentContainerQueue_onceToken, &__block_literal_global_190);
  return (id)persistentContainerQueue_persistentContainerQueue;
}

+ (id)workerManagedObjectContextForContainer:(id)a3
{
  void *v3;

  v3 = (void *)objc_msgSend(a3, "newBackgroundContext");
  objc_msgSend(v3, "setAutomaticallyMergesChangesFromParent:", 1);
  objc_msgSend(v3, "setShouldDeleteInaccessibleFaults:", 1);
  return v3;
}

- (void)setCrossProcessChangeCoordinator:(id)a3
{
  objc_storeStrong((id *)&self->_crossProcessChangeCoordinator, a3);
}

- (void)setContextUpdater:(id)a3
{
  objc_storeStrong((id *)&self->_contextUpdater, a3);
}

- (void)setContextOptions:(unint64_t)a3
{
  self->_contextOptions = a3;
}

- (void)setAccountUtilities:(id)a3
{
  objc_storeStrong((id *)&self->_accountUtilities, a3);
}

- (void)loadAdditionalPersistentStores
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  _QWORD v15[4];
  NSObject *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  -[ICNoteContext accountUtilities](self, "accountUtilities");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allICloudACAccounts");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v4, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v18 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        if (objc_msgSend(v11, "ic_shouldCreateSeparatePersistentStore")
          && objc_msgSend(v11, "ic_isNotesEnabled"))
        {
          objc_msgSend(v11, "identifier");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addObject:", v12);

        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v8);
  }

  if (objc_msgSend(v5, "count"))
  {
    v13 = dispatch_group_create();
    dispatch_group_enter(v13);
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __47__ICNoteContext_loadAdditionalPersistentStores__block_invoke;
    v15[3] = &unk_1E76C73F8;
    v16 = v13;
    v14 = v13;
    -[ICNoteContext createAdditionalPersistentStoresWithAccountIdentifiers:completionBlock:](self, "createAdditionalPersistentStoresWithAccountIdentifiers:completionBlock:", v5, v15);
    dispatch_group_wait(v14, 0xFFFFFFFFFFFFFFFFLL);

  }
}

- (id)inMemoryPersistentStoreFromPersistentStores:(id)a3
{
  return (id)objc_msgSend(a3, "ic_objectPassingTest:", &__block_literal_global_211);
}

- (BOOL)hasAnyContextOptions:(unint64_t)a3
{
  return (-[ICNoteContext contextOptions](self, "contextOptions") & a3) != 0;
}

- (id)defaultPersistentStoreFromPersistentStores:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v3 = (void *)MEMORY[0x1E0D64240];
  v4 = a3;
  objc_msgSend(v3, "persistentStoreURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __60__ICNoteContext_defaultPersistentStoreFromPersistentStores___block_invoke;
  v9[3] = &unk_1E76CB6F0;
  v10 = v5;
  v6 = v5;
  objc_msgSend(v4, "ic_objectPassingTest:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (ICManagedObjectContextUpdater)contextUpdater
{
  return self->_contextUpdater;
}

+ (id)initializeSearchIndexerDataSourceWithPersistentContainer:(id)a3
{
  id v3;
  uint64_t v4;
  id v5;
  id v6;
  _QWORD block[4];
  id v9;

  v3 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __74__ICNoteContext_initializeSearchIndexerDataSourceWithPersistentContainer___block_invoke;
  block[3] = &unk_1E76C73F8;
  v9 = v3;
  v4 = initializeSearchIndexerDataSourceWithPersistentContainer__onceToken;
  v5 = v3;
  if (v4 != -1)
    dispatch_once(&initializeSearchIndexerDataSourceWithPersistentContainer__onceToken, block);
  v6 = (id)initializeSearchIndexerDataSourceWithPersistentContainer__sDataSource;

  return v6;
}

uint64_t __47__ICNoteContext_startSharedContextWithOptions___block_invoke_3()
{
  return objc_msgSend(MEMORY[0x1E0D64270], "setObject:forKey:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0D64398]);
}

BOOL __61__ICNoteContext_inMemoryPersistentStoreFromPersistentStores___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a2, "type");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 == (void *)*MEMORY[0x1E0C97860];

  return v3;
}

+ (void)startSharedContextWithOptions:(unint64_t)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  uint64_t v19;
  _QWORD v20[5];

  v4 = a1;
  objc_sync_enter(v4);
  if (!sharedContext)
  {
    +[ICCloudSyncingObjectActivityEvent registerWithICCRCoder](ICCloudSyncingObjectActivityEvent, "registerWithICCRCoder");
    +[ICRealtimeCollaborationSelectionState registerWithICCRCoder](ICRealtimeCollaborationSelectionState, "registerWithICCRCoder");
    +[ICTTAudioDocument registerWithICCRCoder](ICTTAudioDocument, "registerWithICCRCoder");
    +[ICTable registerWithICCRCoder](ICTable, "registerWithICCRCoder");
    if ((a3 & 0x200000) == 0)
    {
      v5 = os_log_create("com.apple.notes", "CoreData");
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
        +[ICNoteContext startSharedContextWithOptions:].cold.2();

      if ((objc_msgSend(MEMORY[0x1E0D64270], "BOOLForKey:", CFSTR("EnableXPCStore")) & 1) == 0)
      {
        v6 = os_log_create("com.apple.notes", "CoreData");
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
          +[ICNoteContext startSharedContextWithOptions:].cold.1();

        a3 |= 0x200000uLL;
      }
    }
    objc_msgSend(MEMORY[0x1E0D64210], "currentConfiguration");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "container");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(MEMORY[0x1E0D64210], "currentConfiguration");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "container");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      +[ICNoteContext useContainerNamed:](ICNoteContext, "useContainerNamed:", v10);

    }
    objc_msgSend(MEMORY[0x1E0D64210], "currentConfiguration");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "resetsState");

    if (v12)
      +[ICNoteContext resetAppState](ICNoteContext, "resetAppState");
    objc_msgSend(MEMORY[0x1E0D64210], "currentConfiguration");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "resetsContainer");

    if (v14)
      +[ICNoteContext resetAppContainer](ICNoteContext, "resetAppContainer");
    if ((a3 & 0x400000) == 0)
    {
      objc_msgSend(MEMORY[0x1E0D64180], "sharedInstance");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v20[0] = MEMORY[0x1E0C809B0];
      v20[1] = 3221225472;
      v20[2] = __47__ICNoteContext_startSharedContextWithOptions___block_invoke;
      v20[3] = &__block_descriptor_40_e5_v8__0l;
      v20[4] = a3;
      objc_msgSend(v15, "performBlockInPersonaContext:forAccountIdentifier:", v20, 0);

    }
    objc_msgSend((id)sharedContext, "managedObjectContext");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "performBlockAndWait:", &__block_literal_global_34);

    if ((objc_msgSend((id)sharedContext, "hasContextOptions:", 64) & 1) == 0)
    {
      if (objc_msgSend((id)sharedContext, "hasContextOptions:", 1))
      {
        dispatch_get_global_queue(-2, 0);
        v17 = objc_claimAutoreleasedReturnValue();
        dispatch_async(v17, &__block_literal_global_57);

      }
      else
      {
        objc_msgSend(MEMORY[0x1E0D64270], "setObject:forKey:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0D64398]);
      }
    }
    objc_msgSend(MEMORY[0x1E0D64210], "currentConfiguration");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "environment");

    if (v19 == 2)
      +[ICNoteContext enableLocalAccount](ICNoteContext, "enableLocalAccount");
  }
  objc_sync_exit(v4);

}

+ (void)startSharedContextWithOptions:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_1(&dword_1BD918000, v0, v1, "Note context options do not specify SQL store", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

void __41__ICNoteContext_persistentContainerQueue__block_invoke()
{
  dispatch_queue_t v0;
  void *v1;
  NSObject *v2;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v2 = objc_claimAutoreleasedReturnValue();
  v0 = dispatch_queue_create("com.apple.notes.persistent-container", v2);
  v1 = (void *)persistentContainerQueue_persistentContainerQueue;
  persistentContainerQueue_persistentContainerQueue = (uint64_t)v0;

}

- (void)setCurrentNote:(id)a3
{
  objc_storeStrong((id *)&self->_currentNote, a3);
}

+ (void)clearSharedContext
{
  void *v2;
  id obj;

  obj = a1;
  objc_sync_enter(obj);
  v2 = (void *)sharedContext;
  sharedContext = 0;

  objc_sync_exit(obj);
}

+ (BOOL)hasSharedContext
{
  return sharedContext != 0;
}

+ (void)useContainerNamed:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  int v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0D64240], "resetApplicationDocumentsURL");
  objc_msgSend(MEMORY[0x1E0D64240], "applicationDocumentsURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "URLByAppendingPathComponent:", CFSTR("Containers"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)MEMORY[0x1E0D64240];
  objc_msgSend(v3, "ic_sanitizedFilenameString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "URLByAppendingPathComponent:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setApplicationDocumentsURL:", v8);

  v9 = os_log_create("com.apple.notes", "CoreData");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v10 = 138412290;
    v11 = v3;
    _os_log_impl(&dword_1BD918000, v9, OS_LOG_TYPE_INFO, "Switched to container named '%@'", (uint8_t *)&v10, 0xCu);
  }

}

+ (void)enableLocalAccount
{
  NSObject *v2;
  const char *v3;
  uint8_t *v4;
  __int16 v5;
  uint8_t buf[2];

  if ((objc_msgSend(MEMORY[0x1E0D64270], "BOOLForKey:", CFSTR("LocalNotes")) & 1) != 0)
  {
    v2 = os_log_create("com.apple.notes", "CoreData");
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      v5 = 0;
      v3 = "Local account is already enabled";
      v4 = (uint8_t *)&v5;
LABEL_6:
      _os_log_impl(&dword_1BD918000, v2, OS_LOG_TYPE_INFO, v3, v4, 2u);
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D64270], "setBool:forKey:", 1, CFSTR("LocalNotes"));
    objc_msgSend(MEMORY[0x1E0D64270], "setBool:forKey:", 1, *MEMORY[0x1E0D643A0]);
    v2 = os_log_create("com.apple.notes", "CoreData");
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      v3 = "Enabled local account";
      v4 = buf;
      goto LABEL_6;
    }
  }

}

+ (void)resetAppState
{
  os_log_t v0;
  uint8_t v1[16];

  OUTLINED_FUNCTION_3();
  _os_log_fault_impl(&dword_1BD918000, v0, OS_LOG_TYPE_FAULT, "UI state reset not implemented for iOS — skipping", v1, 2u);
  OUTLINED_FUNCTION_2_0();
}

+ (void)resetAppContainer
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  __int128 v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  NSObject *v13;
  __int128 v14;
  id v15;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D64240], "applicationDocumentsURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:", v3, 0, 0, &__block_literal_global_78);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "nextObject");
  v5 = objc_claimAutoreleasedReturnValue();
  if (!v5)
    goto LABEL_9;
  v7 = (void *)v5;
  v8 = 0;
  *(_QWORD *)&v6 = 138412546;
  v14 = v6;
  do
  {
    v9 = v8;
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager", v14);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v8;
    objc_msgSend(v10, "removeItemAtURL:error:", v7, &v15);
    v8 = v15;

    if (v8)
    {
      v11 = os_log_create("com.apple.notes", "Application");
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = v14;
        v17 = v7;
        v18 = 2112;
        v19 = v8;
        _os_log_error_impl(&dword_1BD918000, v11, OS_LOG_TYPE_ERROR, "Cannot remove container item {url: %@, error: %@}", buf, 0x16u);
      }

    }
    objc_msgSend(v4, "nextObject");
    v12 = objc_claimAutoreleasedReturnValue();

    v7 = (void *)v12;
  }
  while (v12);
  if (!v8)
  {
LABEL_9:
    v13 = os_log_create("com.apple.notes", "Application");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BD918000, v13, OS_LOG_TYPE_INFO, "Successfully reset container", buf, 2u);
    }

    v8 = 0;
  }

}

uint64_t __34__ICNoteContext_resetAppContainer__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  NSObject *v6;

  v4 = a2;
  v5 = a3;
  v6 = os_log_create("com.apple.notes", "Application");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    __34__ICNoteContext_resetAppContainer__block_invoke_cold_1((uint64_t)v4);

  return 1;
}

uint64_t __33__ICNoteContext_initWithOptions___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setupTrashDeletionTimer");
}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  -[ICNoteContext trashDeletionTimer](self, "trashDeletionTimer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invalidate");

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:", self);

  objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:", self);
  v5.receiver = self;
  v5.super_class = (Class)ICNoteContext;
  -[ICNoteContext dealloc](&v5, sel_dealloc);
}

- (void)applicationWillTerminate
{
  void *v3;
  id v4;

  +[ICCloudSyncingObject resetAllDeletedByThisDeviceProperties](ICCloudSyncingObject, "resetAllDeletedByThisDeviceProperties");
  -[ICNoteContext managedObjectContext](self, "managedObjectContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICNoteContext purgeDeletedObjectsInManagedObjectContext:](self, "purgeDeletedObjectsInManagedObjectContext:", v3);

  -[ICNoteContext managedObjectContext](self, "managedObjectContext");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "ic_save");

}

- (void)purgeDeletedObjectsInManagedObjectContext:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  NSObject *v12;
  void *v13;
  id v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[16];
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[ICNoteContext hasContextOptions:](self, "hasContextOptions:", 64))
  {
    v5 = os_log_create("com.apple.notes", "CoreData");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[ICNoteContext purgeDeletedObjectsInManagedObjectContext:].cold.1();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("markedForDeletion == YES"));
    v5 = objc_claimAutoreleasedReturnValue();
    v14 = v4;
    +[ICCloudSyncingObject ic_objectsMatchingPredicate:context:](ICCloudSyncingObject, "ic_objectsMatchingPredicate:context:", v5, v4);
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v13, "copy");
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v16;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v16 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
          if (objc_msgSend(v11, "shouldBeDeletedFromLocalDatabase")
            && (objc_msgSend(v11, "isDeleted") & 1) == 0)
          {
            v12 = os_log_create("com.apple.notes", "Delete");
            if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
              -[ICNoteContext purgeDeletedObjectsInManagedObjectContext:].cold.2((uint64_t)v19, (uint64_t)v11);

            objc_msgSend(v11, "deleteFromLocalDatabase");
          }
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
      }
      while (v8);
    }

    v4 = v14;
  }

}

- (void)setupTrashDeletionTimer
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t, void *);
  void *v12;
  id v13;
  id location;

  if (setupTrashDeletionTimer_onceToken != -1)
    dispatch_once(&setupTrashDeletionTimer_onceToken, &__block_literal_global_105_0);
  objc_msgSend(MEMORY[0x1E0D64188], "sharedAppGroupDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "doubleForKey:", CFSTR("TrashCleanupInterval"));
  v5 = v4;

  -[ICNoteContext trashDeletionTimer](self, "trashDeletionTimer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "invalidate");

  objc_initWeak(&location, self);
  v7 = (void *)MEMORY[0x1E0C99E88];
  v9 = MEMORY[0x1E0C809B0];
  v10 = 3221225472;
  v11 = __40__ICNoteContext_setupTrashDeletionTimer__block_invoke_110;
  v12 = &unk_1E76C9D70;
  objc_copyWeak(&v13, &location);
  objc_msgSend(v7, "scheduledTimerWithTimeInterval:repeats:block:", 1, &v9, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICNoteContext setTrashDeletionTimer:](self, "setTrashDeletionTimer:", v8, v9, v10, v11, v12);

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

void __40__ICNoteContext_setupTrashDeletionTimer__block_invoke()
{
  void *v0;
  void *v1;
  const __CFString *v2;
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D64188], "sharedAppGroupDefaults");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = CFSTR("TrashCleanupInterval");
  v3[0] = &unk_1E771A540;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v3, &v2, 1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "registerDefaults:", v1);

}

void __40__ICNoteContext_setupTrashDeletionTimer__block_invoke_110(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  _QWORD v5[4];
  id v6;

  v3 = a2;
  +[ICNoteContext sharedContext](ICNoteContext, "sharedContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __40__ICNoteContext_setupTrashDeletionTimer__block_invoke_2;
  v5[3] = &unk_1E76CB5B0;
  objc_copyWeak(&v6, (id *)(a1 + 32));
  objc_msgSend(v4, "performSnapshotBackgroundTask:", v5);

  objc_destroyWeak(&v6);
}

void __40__ICNoteContext_setupTrashDeletionTimer__block_invoke_2(uint64_t a1, void *a2)
{
  id WeakRetained;
  id v4;
  void *v5;
  id v6;

  v6 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v4 = (id)+[ICNoteContext performSelector:withObject:](ICNoteContext, "performSelector:withObject:", sel_beginBackgroundTaskNamed_, CFSTR("Mark Trash Notes For Deletion"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3B18], "value:withObjCType:", MEMORY[0x1E0DC4878], "Q");
      v4 = (id)objc_claimAutoreleasedReturnValue();
    }
    v5 = v4;
    +[ICNoteContext markOldTrashedNotesForDeletionInContext:](ICNoteContext, "markOldTrashedNotesForDeletionInContext:", v6);
    objc_msgSend(v6, "ic_save");
    if ((objc_opt_respondsToSelector() & 1) != 0)
      +[ICNoteContext performSelector:withObject:](ICNoteContext, "performSelector:withObject:", sel_endBackgroundTask_, v5);

  }
}

+ (void)markOldTrashedNotesForDeletionInContext:(id)a3
{
  id v3;
  void *v4;
  double v5;
  double v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  _UNKNOWN **v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint8_t buf[4];
  void *v33;
  __int16 v34;
  void *v35;
  _BYTE v36[128];
  _QWORD v37[5];

  v37[3] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (markOldTrashedNotesForDeletionInContext__onceToken != -1)
    dispatch_once(&markOldTrashedNotesForDeletionInContext__onceToken, &__block_literal_global_123);
  objc_msgSend(MEMORY[0x1E0D64188], "sharedAppGroupDefaults");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "doubleForKey:", CFSTR("TrashedNoteLifetime"));
  v6 = v5;

  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", -v6);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_log_create("com.apple.notes", "Delete");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    +[ICNoteContext markOldTrashedNotesForDeletionInContext:].cold.1();

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("folder.folderType == %d"), 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v37[0] = v9;
  v26 = (void *)v7;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("folderModificationDate < %@"), v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v37[1] = v10;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("markedForDeletion == NO"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v37[2] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v37, 3);
  v12 = objc_claimAutoreleasedReturnValue();

  v25 = (void *)v12;
  objc_msgSend(MEMORY[0x1E0CB3528], "andPredicateWithSubpredicates:", v12);
  v13 = &off_1E76C5000;
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = v3;
  +[ICNote notesMatchingPredicate:context:](ICNote, "notesMatchingPredicate:context:");
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v23, "copy");
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v29;
    do
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v29 != v17)
          objc_enumerationMutation(v14);
        v19 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
        v20 = os_log_create("com.apple.notes", "Delete");
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
        {
          objc_msgSend(v19, "identifier");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "folderModificationDate");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v33 = v21;
          v34 = 2112;
          v35 = v22;
          _os_log_debug_impl(&dword_1BD918000, v20, OS_LOG_TYPE_DEBUG, "Marking expired trashed note (%@) as deleted. Trashed %@", buf, 0x16u);

          v13 = &off_1E76C5000;
        }

        objc_msgSend(v13[465], "deleteNote:", v19);
      }
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
    }
    while (v16);
  }

}

void __57__ICNoteContext_markOldTrashedNotesForDeletionInContext___block_invoke()
{
  void *v0;
  void *v1;
  const __CFString *v2;
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D64188], "sharedAppGroupDefaults");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = CFSTR("TrashedNoteLifetime");
  v3[0] = &unk_1E771A558;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v3, &v2, 1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "registerDefaults:", v1);

}

- (BOOL)save:(id *)a3
{
  BOOL v5;
  void *v6;
  _QWORD v8[7];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  char v18;

  if (-[ICNoteContext hasContextOptions:](self, "hasContextOptions:", 64))
    return 1;
  if (ICInternalSettingsIsTracingEnabled())
    kdebug_trace();
  -[ICNoteContext setSaving:](self, "setSaving:", 1);
  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 1;
  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__27;
  v13 = __Block_byref_object_dispose__27;
  v14 = 0;
  -[ICNoteContext managedObjectContext](self, "managedObjectContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __22__ICNoteContext_save___block_invoke;
  v8[3] = &unk_1E76CB5F8;
  v8[4] = self;
  v8[5] = &v15;
  v8[6] = &v9;
  objc_msgSend(v6, "performBlockAndWait:", v8);

  if (a3)
    *a3 = objc_retainAutorelease((id)v10[5]);
  -[ICNoteContext setSaving:](self, "setSaving:", 0);
  if (ICInternalSettingsIsTracingEnabled())
    kdebug_trace();
  v5 = *((_BYTE *)v16 + 24) != 0;
  _Block_object_dispose(&v9, 8);

  _Block_object_dispose(&v15, 8);
  return v5;
}

void __22__ICNoteContext_save___block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  char v7;
  NSObject *v8;
  int v9;
  NSObject *v10;
  NSObject *v11;
  uint8_t v12[8];
  id obj;

  objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hasChanges");

  if (v3)
  {
    v4 = os_log_create("com.apple.notes", "CoreData");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      __22__ICNoteContext_save___block_invoke_cold_3();

    objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    obj = *(id *)(v6 + 40);
    v7 = objc_msgSend(v5, "save:", &obj);
    objc_storeStrong((id *)(v6 + 40), obj);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v7;

    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
    {
      v8 = os_log_create("com.apple.notes", "CoreData");
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        __22__ICNoteContext_save___block_invoke_cold_2();

    }
    if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24)
      && objc_msgSend(*(id *)(a1 + 32), "hasContextOptions:", 0x20000))
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "recoverFromSaveError");
      v9 = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
      v10 = os_log_create("com.apple.notes", "CoreData");
      v11 = v10;
      if (v9)
      {
        if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)v12 = 0;
          _os_log_impl(&dword_1BD918000, v11, OS_LOG_TYPE_INFO, "Successfully recovered from save error", v12, 2u);
        }
      }
      else if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        __22__ICNoteContext_save___block_invoke_cold_1();
      }

    }
  }
}

- (BOOL)saveImmediately
{
  return -[ICNoteContext save:](self, "save:", 0);
}

- (BOOL)save
{
  NSObject *v3;

  if (!-[ICNoteContext delaySaving](self, "delaySaving"))
    return -[ICNoteContext saveImmediately](self, "saveImmediately");
  v3 = os_log_create("com.apple.notes", "CoreData");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    -[ICNoteContext save].cold.1();

  objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel_save, 0);
  -[ICNoteContext performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel_save, 0, 10.0);
  return 1;
}

- (BOOL)recoverFromSaveError
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;
  id v8;
  id v10;

  v3 = os_log_create("com.apple.notes", "CoreData");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    -[ICNoteContext recoverFromSaveError].cold.1();

  -[ICNoteContext cleanupAdditionalPersistentStores](self, "cleanupAdditionalPersistentStores");
  -[ICNoteContext managedObjectContext](self, "managedObjectContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "refreshAllObjects");

  -[ICNoteContext managedObjectContext](self, "managedObjectContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "rollback");

  -[ICNoteContext managedObjectContext](self, "managedObjectContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0;
  v7 = objc_msgSend(v6, "save:", &v10);
  v8 = v10;

  if ((v7 & 1) == 0)
    abort();

  return 1;
}

- (id)predicateForSearchableAttachments
{
  void *v2;
  void *v3;

  -[ICNoteContext managedObjectContext](self, "managedObjectContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[ICAttachment predicateForSearchableAttachmentsInContext:](ICAttachment, "predicateForSearchableAttachmentsInContext:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)refreshAll
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_1(&dword_1BD918000, v0, v1, "refreshAll has changes, saving", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

void __27__ICNoteContext_refreshAll__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[16];
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "managedObjectContext", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "registeredObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v16, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v3);
        v8 = *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v7);
        v9 = os_log_create("com.apple.notes", "CoreData");
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
          __27__ICNoteContext_refreshAll__block_invoke_cold_1((uint64_t)v15, v8);

        objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "refreshObject:mergeChanges:", v8, *(unsigned __int8 *)(a1 + 40));

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v16, 16);
    }
    while (v5);
  }

}

+ (BOOL)updateSharedStateFile:(id)a3 toState:(BOOL)a4 error:(id *)a5
{
  _BOOL4 v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  id v12;
  id v13;

  v6 = a4;
  v7 = a3;
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0C99D50], "data");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 0;
    objc_msgSend(v8, "writeToFile:options:error:", v7, 0, &v13);
    v9 = v13;

    if (!v9 || objc_msgSend(v9, "code") != 516)
      goto LABEL_8;
LABEL_7:

    v9 = 0;
    goto LABEL_8;
  }
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0;
  objc_msgSend(v10, "removeItemAtPath:error:", v7, &v12);
  v9 = v12;

  if (v9 && objc_msgSend(v9, "code") == 4)
    goto LABEL_7;
LABEL_8:
  if (a5)
    *a5 = objc_retainAutorelease(v9);

  return v9 == 0;
}

+ (void)setLegacyNotesDisabled:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  char v7;
  id v8;
  NSObject *v9;
  id v10;

  v3 = a3;
  if (+[ICNoteContext legacyNotesDisabled](ICNoteContext, "legacyNotesDisabled") != a3)
  {
    CPSharedResourcesDirectory();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringByAppendingString:", CFSTR("/Library/Notes/.DisableLegacyNotes"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 0;
    v7 = objc_msgSend(a1, "updateSharedStateFile:toState:error:", v6, v3, &v10);
    v8 = v10;
    if ((v7 & 1) == 0)
    {
      v9 = os_log_create("com.apple.notes", "Application");
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        +[ICNoteContext setLegacyNotesDisabled:].cold.1(v3);

    }
  }
}

- (void)managedObjectContextDidSave:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[4];
  id v8;

  objc_msgSend(a3, "object");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_persistentContainer)
  {
    -[ICNoteContext managedObjectContext](self, "managedObjectContext");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4 != v5)
    {
      -[ICNoteContext managedObjectContext](self, "managedObjectContext");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7[0] = MEMORY[0x1E0C809B0];
      v7[1] = 3221225472;
      v7[2] = __45__ICNoteContext_managedObjectContextDidSave___block_invoke;
      v7[3] = &unk_1E76C73F8;
      v8 = v4;
      objc_msgSend(v6, "performBlock:", v7);

    }
  }

}

void __45__ICNoteContext_managedObjectContextDidSave___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:", CFSTR("ICNoteContextDidMergeChangesFromContextDidSaveNotification"), *(_QWORD *)(a1 + 32));

}

- (void)accountsDidChange:(id)a3
{
  void *v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;

  +[ICNoteContext setLegacyNotesDisabled:](ICNoteContext, "setLegacyNotesDisabled:", 0);
  -[ICNoteContext accountUtilities](self, "accountUtilities");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "invalidateCache");

  if (+[ICAccount clearAccountForAppleCloudKitTable](ICAccount, "clearAccountForAppleCloudKitTable"))
  {
    v5 = os_log_create("com.apple.notes", "Accounts");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      -[ICNoteContext accountsDidChange:].cold.1();

  }
  -[ICNoteContext loadAdditionalPersistentStores](self, "loadAdditionalPersistentStores");
  if (ICIsSandboxModeEnabled())
  {
    -[ICNoteContext updateAccounts](self, "updateAccounts");
  }
  else if (-[ICNoteContext hasContextOptions:](self, "hasContextOptions:", 721457))
  {
    -[ICNoteContext addOrDeleteLocalAccountIfNecessary](self, "addOrDeleteLocalAccountIfNecessary");
    -[ICNoteContext managedObjectContext](self, "managedObjectContext");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "hasChanges");

    if (v7)
    {
      -[ICNoteContext managedObjectContext](self, "managedObjectContext");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "ic_save");

    }
  }
}

- (void)updateAccounts
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_1(&dword_1BD918000, v0, v1, "Updating accounts", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

void __31__ICNoteContext_updateAccounts__block_invoke(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __31__ICNoteContext_updateAccounts__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  int v5;
  void *v6;
  id v7;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v3 = a2;
  objc_msgSend(v3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "ic_isNotesEnabled");
  objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[ICAccount accountWithIdentifier:context:](ICAccount, "accountWithIdentifier:context:", v4, v6);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    if (!v7 && v4 != 0)
    {
      v9 = os_log_create("com.apple.notes", "Accounts");
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        __31__ICNoteContext_updateAccounts__block_invoke_2_cold_1();

      objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = +[ICAccount newAccountWithIdentifier:type:context:](ICAccount, "newAccountWithIdentifier:type:context:", v4, 1, v10);

      objc_msgSend(v7, "setNeedsToBeFetchedFromCloud:", 1);
      objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0D63E90]);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setDidChooseToMigrate:", objc_msgSend(v11, "BOOLValue"));

      objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0D63E98]);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setDidFinishMigration:", objc_msgSend(v12, "BOOLValue"));

      objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0D63EA0]);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setDidMigrateOnMac:", objc_msgSend(v13, "BOOLValue"));

      objc_msgSend(*(id *)(a1 + 40), "addObject:", v7);
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
    }
  }
  if (v7)
  {
    objc_msgSend(v3, "accountDescription");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      objc_msgSend(v3, "accountDescription");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setName:", v15);

    }
  }

}

void __31__ICNoteContext_updateAccounts__block_invoke_148()
{
  id v0;

  +[ICCloudContext sharedContext](ICCloudContext, "sharedContext");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "updateCloudContextState");

}

void __31__ICNoteContext_updateAccounts__block_invoke_2_150(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  id v4;

  v4 = a2;
  if (objc_msgSend(v4, "didFinishMigration"))
  {
    +[ICDeviceMigrationState currentDeviceMigrationStateForAccount:](ICDeviceMigrationState, "currentDeviceMigrationStateForAccount:", v4);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setState:", 7);
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setStateModificationDate:", v3);

  }
}

- (id)primaryICloudACAccount
{
  void *v2;
  void *v3;

  -[ICNoteContext accountUtilities](self, "accountUtilities");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "primaryICloudACAccount");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)allICloudACAccounts
{
  void *v2;
  void *v3;

  -[ICNoteContext accountUtilities](self, "accountUtilities");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allICloudACAccounts");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)ensureModernAccountExistsInContext:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  uint8_t v7[16];

  v4 = a3;
  if (!+[ICAccount hasModernAccountInContext:](ICAccount, "hasModernAccountInContext:", v4))
  {
    v5 = os_log_create("com.apple.notes", "Accounts");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      -[ICNoteContext ensureModernAccountExistsInContext:].cold.1();

    -[ICNoteContext setShouldEnsureLocalAccount:](self, "setShouldEnsureLocalAccount:", 1);
    -[ICNoteContext addOrDeleteLocalAccountIfNecessary](self, "addOrDeleteLocalAccountIfNecessary");
    if (+[ICAccount hasModernAccountInContext:](ICAccount, "hasModernAccountInContext:", v4))
    {
      v6 = os_log_create("com.apple.notes", "Accounts");
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v7 = 0;
        _os_log_impl(&dword_1BD918000, v6, OS_LOG_TYPE_INFO, "Successfully created local account.", v7, 2u);
      }

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "__objc_no", "-[ICNoteContext ensureModernAccountExistsInContext:]", 1, 0, CFSTR("Unable to create local account."));
    }
  }

}

- (BOOL)noteIsVisible:(id)a3
{
  id v4;
  void *v5;
  char v6;

  if (!a3)
    return 0;
  v4 = a3;
  -[ICNoteContext predicateForVisibleNotes](self, "predicateForVisibleNotes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "evaluateWithObject:", v4);

  return v6;
}

- (NSArray)visibleNotes
{
  void *v2;
  void *v3;

  -[ICNoteContext managedObjectContext](self, "managedObjectContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[ICNote visibleNotesInContext:](ICNote, "visibleNotesInContext:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (unint64_t)visibleNotesCount
{
  void *v2;
  unint64_t v3;

  -[ICNoteContext managedObjectContext](self, "managedObjectContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = +[ICNote countOfVisibleNotesInContext:](ICNote, "countOfVisibleNotesInContext:", v2);

  return v3;
}

- (id)predicateForVisibleNotes
{
  void *v2;
  void *v3;

  -[ICNoteContext managedObjectContext](self, "managedObjectContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[ICNote predicateForVisibleNotesInContext:](ICNote, "predicateForVisibleNotesInContext:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)predicateForPinnedNotes
{
  return +[ICNote predicateForPinnedNotes](ICNote, "predicateForPinnedNotes");
}

- (id)predicateForSearchableNotes
{
  void *v2;
  void *v3;

  -[ICNoteContext managedObjectContext](self, "managedObjectContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[ICNote predicateForSearchableNotesInContext:](ICNote, "predicateForSearchableNotesInContext:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (ICFolderCustomNoteSortType)customNoteSortType
{
  return 0;
}

- (id)newFetchedResultsControllerForAllAccounts
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C97B48], "fetchRequestWithEntityName:", CFSTR("ICAccount"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:selector:", CFSTR("name"), 1, sel_localizedCaseInsensitiveCompare_);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setSortDescriptors:", v5);

  -[ICNoteContext fetchedResultsControllerForFetchRequest:sectionNameKeyPath:](self, "fetchedResultsControllerForFetchRequest:sectionNameKeyPath:", v3, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)fetchedResultsControllerForFetchRequest:(id)a3 sectionNameKeyPath:(id)a4
{
  objc_class *v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  id v15;

  v6 = (objc_class *)MEMORY[0x1E0C97B68];
  v7 = a4;
  v8 = a3;
  v9 = [v6 alloc];
  -[ICNoteContext managedObjectContext](self, "managedObjectContext");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v9, "initWithFetchRequest:managedObjectContext:sectionNameKeyPath:cacheName:", v8, v10, v7, 0);

  v15 = 0;
  LOBYTE(v6) = objc_msgSend(v11, "performFetch:", &v15);
  v12 = v15;
  v13 = v12;
  if ((v6 & 1) == 0)
    NSLog(CFSTR("Error: Problem performing fetch for new NSFetchedResultsController: %@"), v12);

  return v11;
}

- (void)clearPersistentContainer
{
  NSObject *v3;
  _QWORD block[5];

  -[ICNoteContext persistentContainerQueue](self, "persistentContainerQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __41__ICNoteContext_clearPersistentContainer__block_invoke;
  block[3] = &unk_1E76C73F8;
  block[4] = self;
  dispatch_sync(v3, block);

}

uint64_t __41__ICNoteContext_clearPersistentContainer__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 16);
  *(_QWORD *)(v2 + 16) = 0;

  objc_msgSend(*(id *)(a1 + 32), "setPersistentStoresByAccountId:", 0);
  objc_msgSend(*(id *)(a1 + 32), "setManagedObjectContext:", 0);
  objc_msgSend(*(id *)(a1 + 32), "setCrossProcessChangeCoordinator:", 0);
  return objc_msgSend(*(id *)(a1 + 32), "setContextUpdater:", 0);
}

- (void)reloadPersistentContainer
{
  id v3;

  -[ICNoteContext clearPersistentContainer](self, "clearPersistentContainer");
  v3 = -[ICNoteContext persistentContainer](self, "persistentContainer");
}

void __36__ICNoteContext_persistentContainer__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;
  _QWORD v6[4];
  id v7;
  uint64_t v8;

  v3 = a2;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __36__ICNoteContext_persistentContainer__block_invoke_3;
  v6[3] = &unk_1E76C73B0;
  v4 = *(_QWORD *)(a1 + 32);
  v7 = v3;
  v8 = v4;
  v5 = v3;
  objc_msgSend(v5, "performBlock:", v6);

}

void __36__ICNoteContext_persistentContainer__block_invoke_3(uint64_t a1)
{
  id v2;
  NSObject *v3;
  uint8_t v4[16];

  +[ICAccount localAccountInContext:](ICAccount, "localAccountInContext:", *(_QWORD *)(a1 + 32));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    if ((objc_msgSend(*(id *)(a1 + 40), "hasContextOptions:", 64) & 1) != 0)
    {
      v2 = 0;
    }
    else
    {
      v3 = os_log_create("com.apple.notes", "Accounts");
      if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v4 = 0;
        _os_log_impl(&dword_1BD918000, v3, OS_LOG_TYPE_INFO, "Creating local account.", v4, 2u);
      }

      v2 = +[ICAccount newLocalAccountInContext:](ICAccount, "newLocalAccountInContext:", *(_QWORD *)(a1 + 32));
      if (v2)
        objc_msgSend(*(id *)(a1 + 32), "ic_save");
    }
  }

}

void __36__ICNoteContext_persistentContainer__block_invoke_204(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "crossProcessChangeCoordinator");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v2)
    objc_msgSend(*(id *)(a1 + 32), "setupCrossProcessChangeCoordinator");
}

void __47__ICNoteContext_loadAdditionalPersistentStores__block_invoke(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

- (void)createAdditionalPersistentStoresWithAccountIdentifiers:(id)a3 completionBlock:(id)a4
{
  id v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  id v10;
  id v11;
  id v12;
  void (**v13)(void);
  _QWORD v14[4];
  id v15;
  ICNoteContext *v16;
  _QWORD block[5];
  id v18;
  id v19;

  v6 = a3;
  v13 = (void (**)(void))a4;
  -[ICNoteContext persistentContainer](self, "persistentContainer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICNoteContext persistentContainerQueue](self, "persistentContainerQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __88__ICNoteContext_createAdditionalPersistentStoresWithAccountIdentifiers_completionBlock___block_invoke;
  block[3] = &unk_1E76C7708;
  block[4] = self;
  v18 = v6;
  v10 = v7;
  v19 = v10;
  v11 = v6;
  dispatch_sync(v8, block);
  v14[0] = v9;
  v14[1] = 3221225472;
  v14[2] = __88__ICNoteContext_createAdditionalPersistentStoresWithAccountIdentifiers_completionBlock___block_invoke_2;
  v14[3] = &unk_1E76C73B0;
  v15 = v10;
  v16 = self;
  v12 = v10;
  dispatch_sync(v8, v14);
  if (v13)
    v13[2]();

}

uint64_t __88__ICNoteContext_createAdditionalPersistentStoresWithAccountIdentifiers_completionBlock___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "createAdditionalPersistentStoresWithAccountIdentifiers:persistentContainer:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

void __88__ICNoteContext_createAdditionalPersistentStoresWithAccountIdentifiers_completionBlock___block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "persistentStoreCoordinator");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "persistentStores");
  v3 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "refreshPersistentStoresByAccountIdFromPersistentStores:", v3);
}

- (id)storeFilenameForAccountIdentifier:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.sqlite"), a3);
}

uint64_t __72__ICNoteContext_refreshPersistentStoresByAccountIdFromPersistentStores___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "URL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "absoluteString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "containsString:", *(_QWORD *)(a1 + 32));

  return v5;
}

- (void)createAdditionalPersistentStoresWithAccountIdentifiers:(id)a3 persistentContainer:(id)a4
{
  id v6;
  id v7;
  ICNoteContext *v8;
  id v9;
  id v10;
  void *v11;
  NSObject *v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  ICNoteContext *v16;
  id v17;
  _BYTE v18[24];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = self;
  objc_sync_enter(v8);
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __92__ICNoteContext_createAdditionalPersistentStoresWithAccountIdentifiers_persistentContainer___block_invoke;
  v14[3] = &unk_1E76CB780;
  v9 = v6;
  v15 = v9;
  v16 = v8;
  v10 = v7;
  v17 = v10;
  objc_msgSend(v10, "performBlockWithDatabaseOpenLock:", v14);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    v12 = os_log_create("com.apple.notes", "CoreData");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v11, "userInfo");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICNoteContext createAdditionalPersistentStoresWithAccountIdentifiers:persistentContainer:].cold.1((uint64_t)v11, v13, (uint64_t)v18, v12);
    }

  }
  objc_sync_exit(v8);

}

id __92__ICNoteContext_createAdditionalPersistentStoresWithAccountIdentifiers_persistentContainer___block_invoke(id *a1)
{
  uint64_t v2;
  __int128 v3;
  uint64_t i;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  id v24;
  __int128 v26;
  uint64_t v27;
  NSObject *v28;
  uint64_t v29;
  id obj;
  void *v31;
  NSObject *log;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  NSObject *v37;
  void *v38;
  _QWORD v39[6];
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  id v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  uint64_t v49;
  uint64_t *v50;
  uint64_t v51;
  uint64_t (*v52)(uint64_t, uint64_t);
  void (*v53)(uint64_t);
  id v54;
  uint8_t v55[128];
  uint8_t buf[4];
  void *v57;
  __int16 v58;
  NSObject *v59;
  _BYTE v60[128];
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  v49 = 0;
  v50 = &v49;
  v51 = 0x3032000000;
  v52 = __Block_byref_object_copy__27;
  v53 = __Block_byref_object_dispose__27;
  v54 = 0;
  if (objc_msgSend(a1[4], "count"))
  {
    v28 = objc_opt_new();
    v47 = 0u;
    v48 = 0u;
    v45 = 0u;
    v46 = 0u;
    obj = a1[4];
    v2 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v60, 16);
    if (v2)
    {
      v34 = *(_QWORD *)v46;
      v29 = *MEMORY[0x1E0D63EE8];
      v27 = *MEMORY[0x1E0C97910];
      *(_QWORD *)&v3 = 138412546;
      v26 = v3;
      do
      {
        v35 = v2;
        for (i = 0; i != v35; ++i)
        {
          if (*(_QWORD *)v46 != v34)
            objc_enumerationMutation(obj);
          v38 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * i);
          v5 = os_log_create("com.apple.notes", "CoreData");
          if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v57 = v38;
            _os_log_debug_impl(&dword_1BD918000, v5, OS_LOG_TYPE_DEBUG, "Creating persistent store for %@", buf, 0xCu);
          }

          objc_msgSend(a1[5], "persistentStoresByAccountId");
          v6 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "objectForKeyedSubscript:", v38);
          v7 = (void *)objc_claimAutoreleasedReturnValue();

          if (v7)
          {
            v37 = os_log_create("com.apple.notes", "CoreData");
            if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              v57 = v38;
              _os_log_debug_impl(&dword_1BD918000, v37, OS_LOG_TYPE_DEBUG, "Already created persistent store for %@", buf, 0xCu);
            }
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0D64180], "sharedInstance");
            v8 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v8, "applicationDocumentsURLForAccountIdentifier:", v38);
            v37 = objc_claimAutoreleasedReturnValue();

            -[NSObject URLByAppendingPathComponent:isDirectory:](v37, "URLByAppendingPathComponent:isDirectory:", v29, 1);
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(a1[5], "storeFilenameForAccountIdentifier:", v38);
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v36, "URLByAppendingPathComponent:isDirectory:");
            v9 = objc_claimAutoreleasedReturnValue();
            v33 = (void *)v9;
            if (v9)
            {
              -[NSObject setObject:forKeyedSubscript:](v28, "setObject:forKeyedSubscript:", v9, v38);
              if ((objc_msgSend(v36, "checkResourceIsReachableAndReturnError:", 0) & 1) != 0
                || (objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"),
                    v10 = (void *)objc_claimAutoreleasedReturnValue(),
                    v44 = 0,
                    objc_msgSend(v10, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v36, 1, 0, &v44), log = v44, v10, !log))
              {
                log = 0;
              }
              else
              {
                v11 = os_log_create("com.apple.notes", "CoreData");
                if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = v26;
                  v57 = v36;
                  v58 = 2112;
                  v59 = log;
                  _os_log_error_impl(&dword_1BD918000, v11, OS_LOG_TYPE_ERROR, "unable to create directory for secondary database. URL: %@ error: %@", buf, 0x16u);
                }

              }
              objc_msgSend(MEMORY[0x1E0C97C08], "persistentStoreDescriptionWithURL:", v33, v26);
              v12 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v12, "setShouldAddStoreAsynchronously:", 0);
              if ((objc_msgSend(a1[5], "hasContextOptions:", 721457) & 1) == 0)
                objc_msgSend(v12, "setOption:forKey:", &unk_1E771A570, v27);
              v42 = 0u;
              v43 = 0u;
              v40 = 0u;
              v41 = 0u;
              objc_msgSend(a1[6], "storeOptions");
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v13, "allKeys");
              v14 = (void *)objc_claimAutoreleasedReturnValue();

              v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v40, v55, 16);
              if (v15)
              {
                v16 = *(_QWORD *)v41;
                do
                {
                  for (j = 0; j != v15; ++j)
                  {
                    if (*(_QWORD *)v41 != v16)
                      objc_enumerationMutation(v14);
                    v18 = *(_QWORD *)(*((_QWORD *)&v40 + 1) + 8 * j);
                    objc_msgSend(a1[6], "storeOptions");
                    v19 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v19, "objectForKeyedSubscript:", v18);
                    v20 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v12, "setOption:forKey:", v20, v18);

                  }
                  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v40, v55, 16);
                }
                while (v15);
              }

              objc_msgSend(a1[6], "persistentStoreCoordinator");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              v39[0] = MEMORY[0x1E0C809B0];
              v39[1] = 3221225472;
              v39[2] = __92__ICNoteContext_createAdditionalPersistentStoresWithAccountIdentifiers_persistentContainer___block_invoke_213;
              v39[3] = &unk_1E76CB758;
              v39[5] = &v49;
              v39[4] = v38;
              objc_msgSend(v21, "addPersistentStoreWithDescription:completionHandler:", v12, v39);

              if ((objc_msgSend(a1[5], "hasContextOptions:", 64) & 1) == 0)
              {
                v22 = a1[5];
                objc_msgSend(a1[6], "persistentStoreCoordinator");
                v23 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v22, "startIndexingWithCoreSpotlightDelegateForDescription:coordinator:", v12, v23);

              }
            }
            else
            {
              log = os_log_create("com.apple.notes", "CoreData");
              if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412290;
                v57 = v38;
                _os_log_error_impl(&dword_1BD918000, log, OS_LOG_TYPE_ERROR, "Couldn't obtain a store URL to add a persistent store for %@", buf, 0xCu);
              }
            }

          }
        }
        v2 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v60, 16);
      }
      while (v2);
    }

    v24 = (id)v50[5];
  }
  else
  {
    v28 = os_log_create("com.apple.notes", "CoreData");
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      __92__ICNoteContext_createAdditionalPersistentStoresWithAccountIdentifiers_persistentContainer___block_invoke_cold_1();
    v24 = 0;
  }

  _Block_object_dispose(&v49, 8);
  return v24;
}

void __92__ICNoteContext_createAdditionalPersistentStoresWithAccountIdentifiers_persistentContainer___block_invoke_213(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  id v10;

  v5 = a2;
  v6 = a3;
  v7 = os_log_create("com.apple.notes", "CoreData");
  v8 = v7;
  if (!v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      __92__ICNoteContext_createAdditionalPersistentStoresWithAccountIdentifiers_persistentContainer___block_invoke_213_cold_1(a1, v5, v8);

    goto LABEL_9;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    __92__ICNoteContext_createAdditionalPersistentStoresWithAccountIdentifiers_persistentContainer___block_invoke_213_cold_2();

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  if (!*(_QWORD *)(v9 + 40))
  {
    v10 = v6;
    v8 = *(NSObject **)(v9 + 40);
    *(_QWORD *)(v9 + 40) = v10;
LABEL_9:

  }
}

- (void)cleanupAdditionalPersistentStores
{
  *(_DWORD *)a2 = 138412290;
  *a3 = a1;
  OUTLINED_FUNCTION_1_2(&dword_1BD918000, a4, (uint64_t)a3, "Found a persistent store that doesn't belong to the account list: %@", a2);

  OUTLINED_FUNCTION_1_6();
}

void __50__ICNoteContext_cleanupAdditionalPersistentStores__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  int v7;
  id v8;

  objc_msgSend(*(id *)(a1 + 32), "storeFilenameForAccountIdentifier:", a2);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "absoluteString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "containsString:", v8);

  if (v7)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
    *a4 = 1;
  }

}

void __50__ICNoteContext_cleanupAdditionalPersistentStores__block_invoke_217(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  NSObject *v7;
  NSObject *v8;
  id v9;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v9 = 0;
  objc_msgSend(v4, "removePersistentStore:error:", v3, &v9);
  v5 = v9;
  v6 = os_log_create("com.apple.notes", "CoreData");
  v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __50__ICNoteContext_cleanupAdditionalPersistentStores__block_invoke_217_cold_2();
  }
  else
  {
    v8 = v6;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      __50__ICNoteContext_cleanupAdditionalPersistentStores__block_invoke_217_cold_1(v3, v8);

  }
}

+ (id)performBackgroundTaskSerialQueue
{
  if (performBackgroundTaskSerialQueue_onceToken != -1)
    dispatch_once(&performBackgroundTaskSerialQueue_onceToken, &__block_literal_global_219);
  return (id)performBackgroundTaskSerialQueue_queue;
}

void __49__ICNoteContext_performBackgroundTaskSerialQueue__block_invoke()
{
  dispatch_queue_t v0;
  void *v1;
  NSObject *v2;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v2 = objc_claimAutoreleasedReturnValue();
  v0 = dispatch_queue_create("com.apple.notes.noteContextBgTaskQueue", v2);
  v1 = (void *)performBackgroundTaskSerialQueue_queue;
  performBackgroundTaskSerialQueue_queue = (uint64_t)v0;

}

- (void)performBackgroundTask:(id)a3
{
  id v4;
  NSObject *v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  if (v4)
  {
    objc_msgSend((id)objc_opt_class(), "performBackgroundTaskSerialQueue");
    v5 = objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __39__ICNoteContext_performBackgroundTask___block_invoke;
    v6[3] = &unk_1E76C8430;
    v6[4] = self;
    v7 = v4;
    dispatch_async(v5, v6);

  }
}

void __39__ICNoteContext_performBackgroundTask___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "workerManagedObjectContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __39__ICNoteContext_performBackgroundTask___block_invoke_2;
  v5[3] = &unk_1E76C9218;
  v3 = *(id *)(a1 + 40);
  v6 = v2;
  v7 = v3;
  v4 = v2;
  objc_msgSend(v4, "performBlockAndWait:", v5);

}

uint64_t __39__ICNoteContext_performBackgroundTask___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

+ (id)snapshotManagedObjectContextForContainer:(id)a3
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  _QWORD v16[4];
  id v17;
  uint64_t *v18;
  uint64_t v19;
  _QWORD v20[4];
  id v21;

  v3 = a3;
  v4 = (void *)objc_msgSend(v3, "newBackgroundContext");
  objc_msgSend(v4, "setAutomaticallyMergesChangesFromParent:", 0);
  v19 = 0;
  v20[0] = &v19;
  v20[1] = 0x3032000000;
  v20[2] = __Block_byref_object_copy__27;
  v20[3] = __Block_byref_object_dispose__27;
  v21 = 0;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __58__ICNoteContext_snapshotManagedObjectContextForContainer___block_invoke;
  v16[3] = &unk_1E76C76B0;
  v5 = v4;
  v17 = v5;
  v18 = &v19;
  objc_msgSend(v5, "performBlockAndWait:", v16);
  if (*(_QWORD *)(v20[0] + 40))
  {
    v6 = os_log_create("com.apple.notes", "CoreData");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      +[ICNoteContext snapshotManagedObjectContextForContainer:].cold.1((uint64_t)v20, v6, v7, v8, v9, v10, v11, v12);

  }
  v13 = v17;
  v14 = v5;

  _Block_object_dispose(&v19, 8);
  return v14;
}

void __58__ICNoteContext_snapshotManagedObjectContextForContainer___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  id obj;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0C97C18], "currentQueryGenerationToken");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  obj = *(id *)(v4 + 40);
  objc_msgSend(v2, "setQueryGenerationFromToken:error:", v3, &obj);
  objc_storeStrong((id *)(v4 + 40), obj);

}

- (id)snapshotManagedObjectContext
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_opt_class();
  -[ICNoteContext persistentContainer](self, "persistentContainer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "snapshotManagedObjectContextForContainer:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)performSnapshotBackgroundTask:(id)a3
{
  id v4;
  NSObject *v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  if (v4)
  {
    objc_msgSend((id)objc_opt_class(), "performBackgroundTaskSerialQueue");
    v5 = objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __47__ICNoteContext_performSnapshotBackgroundTask___block_invoke;
    v6[3] = &unk_1E76C8430;
    v6[4] = self;
    v7 = v4;
    dispatch_async(v5, v6);

  }
}

void __47__ICNoteContext_performSnapshotBackgroundTask___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "snapshotManagedObjectContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __47__ICNoteContext_performSnapshotBackgroundTask___block_invoke_2;
  v5[3] = &unk_1E76C9218;
  v3 = *(id *)(a1 + 40);
  v6 = v2;
  v7 = v3;
  v4 = v2;
  objc_msgSend(v4, "performBlockAndWait:", v5);

}

uint64_t __47__ICNoteContext_performSnapshotBackgroundTask___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (id)persistentStoreForAccountID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;

  v4 = a3;
  -[ICNoteContext persistentStoresByAccountId](self, "persistentStoresByAccountId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    if (!v4)
      goto LABEL_8;
  }
  else
  {
    -[ICNoteContext persistentStoreCoordinator](self, "persistentStoreCoordinator");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "persistentStores");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICNoteContext refreshPersistentStoresByAccountIdFromPersistentStores:](self, "refreshPersistentStoresByAccountIdFromPersistentStores:", v7);

    if (!v4)
    {
LABEL_8:
      v11 = os_log_create("com.apple.notes", "CoreData");
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
        -[ICNoteContext persistentStoreForAccountID:].cold.1();

      -[ICNoteContext persistentStoreCoordinator](self, "persistentStoreCoordinator");
      v10 = objc_claimAutoreleasedReturnValue();
      -[NSObject persistentStores](v10, "persistentStores");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICNoteContext defaultPersistentStoreFromPersistentStores:](self, "defaultPersistentStoreFromPersistentStores:", v12);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_11;
    }
  }
  -[ICNoteContext persistentStoresByAccountId](self, "persistentStoresByAccountId");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
    goto LABEL_8;
  v10 = os_log_create("com.apple.notes", "CoreData");
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    -[ICNoteContext persistentStoreForAccountID:].cold.2((uint64_t)v4);
LABEL_11:

  return v9;
}

- (void)destroyPersistentStore
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_1(&dword_1BD918000, v0, v1, "error destroying persistent store: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)purgeEverything
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  void *v13;
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
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t j;
  void *v30;
  void *v31;
  id v32;
  id v33;
  NSObject *v34;
  void *v35;
  void *v36;
  ICNoteContext *v37;
  id v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _BYTE v47[128];
  _QWORD v48[9];
  uint8_t v49[128];
  uint8_t buf[4];
  id v51;
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v3 = os_log_create("com.apple.notes", "CoreData");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    -[ICNoteContext className](self, "className");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v51 = v4;
    _os_log_impl(&dword_1BD918000, v3, OS_LOG_TYPE_DEFAULT, "Purging everything from %@", buf, 0xCu);

  }
  v45 = 0u;
  v46 = 0u;
  v43 = 0u;
  v44 = 0u;
  v37 = self;
  -[ICNoteContext managedObjectContext](self, "managedObjectContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[ICAccount allAccountsInContext:](ICAccount, "allAccountsInContext:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v43, v49, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v44;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v44 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v43 + 1) + 8 * i);
        +[ICMedia mediaIdentifiersForAccount:](ICMedia, "mediaIdentifiersForAccount:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        +[ICMedia purgeMediaFilesForIdentifiers:account:](ICMedia, "purgeMediaFilesForIdentifiers:account:", v12, v11);

        +[ICAttachmentPreviewImage attachmentPreviewImageIdentifiersForAccount:](ICAttachmentPreviewImage, "attachmentPreviewImageIdentifiersForAccount:", v11);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        +[ICAttachmentPreviewImage purgePreviewImageFilesForIdentifiers:account:](ICAttachmentPreviewImage, "purgePreviewImageFilesForIdentifiers:account:", v13, v11);

        +[ICAttachment attachmentIdentifiersForAccount:](ICAttachment, "attachmentIdentifiersForAccount:", v11);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        +[ICAttachment purgeAttachmentFilesForIdentifiers:account:](ICAttachment, "purgeAttachmentFilesForIdentifiers:account:", v14, v11);

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v43, v49, 16);
    }
    while (v8);
  }

  +[ICHashtag fetchRequest](ICHashtag, "fetchRequest");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v48[0] = v15;
  +[ICAttachmentPreviewImage fetchRequest](ICAttachmentPreviewImage, "fetchRequest");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v48[1] = v16;
  +[ICMedia fetchRequest](ICMedia, "fetchRequest");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v48[2] = v17;
  +[ICInlineAttachment fetchRequest](ICInlineAttachment, "fetchRequest");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v48[3] = v18;
  +[ICAttachment fetchRequest](ICAttachment, "fetchRequest");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v48[4] = v19;
  +[ICNote fetchRequest](ICNote, "fetchRequest");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v48[5] = v20;
  +[ICLegacyTombstone fetchRequest](ICLegacyTombstone, "fetchRequest");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v48[6] = v21;
  +[ICFolder purgableFoldersFetchRequest](ICFolder, "purgableFoldersFetchRequest");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v48[7] = v22;
  +[ICInvitation fetchRequest](ICInvitation, "fetchRequest");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v48[8] = v23;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v48, 9);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  v25 = v24;
  v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v39, v47, 16);
  if (v26)
  {
    v27 = v26;
    v28 = *(_QWORD *)v40;
    do
    {
      for (j = 0; j != v27; ++j)
      {
        if (*(_QWORD *)v40 != v28)
          objc_enumerationMutation(v25);
        v30 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C97A90]), "initWithFetchRequest:", *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * j));
        -[ICNoteContext managedObjectContext](v37, "managedObjectContext");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v38 = 0;
        v32 = (id)objc_msgSend(v31, "executeRequest:error:", v30, &v38);
        v33 = v38;

        if (v33)
        {
          v34 = os_log_create("com.apple.notes", "CoreData");
          if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v51 = v33;
            _os_log_error_impl(&dword_1BD918000, v34, OS_LOG_TYPE_ERROR, "Error purging data: %@", buf, 0xCu);
          }

        }
      }
      v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v39, v47, 16);
    }
    while (v27);
  }

  +[ICCloudContext sharedContext](ICCloudContext, "sharedContext");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "deleteAllServerChangeTokens");

  -[ICNoteContext managedObjectContext](v37, "managedObjectContext");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "ic_save");

}

- (void)deleteEverything
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint8_t v19[128];
  uint8_t buf[4];
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = os_log_create("com.apple.notes", "CoreData");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    -[ICNoteContext className](self, "className");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v21 = v4;
    _os_log_impl(&dword_1BD918000, v3, OS_LOG_TYPE_INFO, "Deleting everything from %@", buf, 0xCu);

  }
  -[ICNoteContext managedObjectContext](self, "managedObjectContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[ICCloudSyncingObject ic_objectsMatchingPredicate:context:](ICCloudSyncingObject, "ic_objectsMatchingPredicate:context:", 0, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copy");

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v8 = v7;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v16;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v16 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * v12);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0 || objc_msgSend(v13, "isDeletable", (_QWORD)v15))
              objc_msgSend(v13, "markForDeletion", (_QWORD)v15);
          }
        }
        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v10);
  }

  +[ICCloudSyncingObject resetAllDeletedByThisDeviceProperties](ICCloudSyncingObject, "resetAllDeletedByThisDeviceProperties");
  -[ICNoteContext managedObjectContext](self, "managedObjectContext");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICNoteContext purgeDeletedObjectsInManagedObjectContext:](self, "purgeDeletedObjectsInManagedObjectContext:", v14);

  -[ICNoteContext saveImmediately](self, "saveImmediately");
}

+ (id)filenameFromFileWrapper:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;

  v3 = a3;
  objc_msgSend(v3, "preferredFilename");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v3, "preferredFilename");
    v5 = objc_claimAutoreleasedReturnValue();
LABEL_5:
    v6 = (void *)v5;
    goto LABEL_6;
  }
  objc_msgSend(v3, "filename");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v3, "filename");
    v5 = objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
LABEL_6:

  return v6;
}

- (id)objectID
{
  objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "__objc_no", "-[ICNoteContext objectID]", 1, 0, CFSTR("Note context does not have an object ID"));
  return objc_alloc_init(MEMORY[0x1E0C97B90]);
}

- (id)customNoteSortTypeValue
{
  return 0;
}

- (BOOL)supportsVisibilityTestingType:(int64_t)a3
{
  return a3 == 1;
}

- (ICAccount)noteContainerAccount
{
  return 0;
}

- (NSString)accountName
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("All Accounts"), CFSTR("All Accounts"), 0, 1);
}

- (NSString)titleForNavigationBar
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("All Notes"), CFSTR("All Notes"), 0, 1);
}

- (BOOL)supportsEditingNotes
{
  return 1;
}

- (id)noteVisibilityTestingForSearchingAccount
{
  return +[ICNoteAllAccountVisibilityTesting sharedInstance](ICNoteAllAccountVisibilityTesting, "sharedInstance");
}

- (BOOL)isDeleted
{
  return 0;
}

- (BOOL)isSharedViaICloud
{
  return 0;
}

- (BOOL)canBeSharedViaICloud
{
  return 0;
}

- (BOOL)isSharedReadOnly
{
  return 0;
}

- (BOOL)isAllNotesContainer
{
  return 0;
}

- (BOOL)isModernCustomFolder
{
  return 0;
}

- (BOOL)isTrashFolder
{
  return 0;
}

- (NSString)containerIdentifier
{
  return 0;
}

- (NSArray)visibleSubFolders
{
  return (NSArray *)MEMORY[0x1E0C9AA60];
}

- (NSData)subFolderOrderMergeableData
{
  return 0;
}

- (BOOL)mergeWithSubFolderMergeableData:(id)a3
{
  return 0;
}

- (BOOL)supportsDateHeaders
{
  return 0;
}

- (int)dateHeadersType
{
  return 1;
}

- (BOOL)isShowingDateHeaders
{
  return 0;
}

- (OS_dispatch_queue)backgroundTaskQueue
{
  ICNoteContext *v2;
  OS_dispatch_queue *backgroundTaskQueue;
  NSObject *v4;
  dispatch_queue_t v5;
  OS_dispatch_queue *v6;
  OS_dispatch_queue *v7;

  v2 = self;
  objc_sync_enter(v2);
  backgroundTaskQueue = v2->_backgroundTaskQueue;
  if (!backgroundTaskQueue)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = dispatch_queue_create("com.apple.notes.BackgroundTask", v4);
    v6 = v2->_backgroundTaskQueue;
    v2->_backgroundTaskQueue = (OS_dispatch_queue *)v5;

    backgroundTaskQueue = v2->_backgroundTaskQueue;
  }
  v7 = backgroundTaskQueue;
  objc_sync_exit(v2);

  return v7;
}

+ (void)crashThisApp
{
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99750], CFSTR("You crashed the app on purpose."));
}

- (BOOL)isSharedContext
{
  return sharedContext == (_QWORD)self;
}

- (void)cloudContextFetchRecordChangeOperationDidFinish:(id)a3
{
  NSObject *v4;
  _QWORD block[5];

  -[ICNoteContext backgroundTaskQueue](self, "backgroundTaskQueue", a3);
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __65__ICNoteContext_cloudContextFetchRecordChangeOperationDidFinish___block_invoke;
  block[3] = &unk_1E76C73F8;
  block[4] = self;
  dispatch_async(v4, block);

}

void __65__ICNoteContext_cloudContextFetchRecordChangeOperationDidFinish___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id v4;
  _QWORD v5[4];
  id v6;
  uint64_t v7;

  objc_msgSend(*(id *)(a1 + 32), "workerManagedObjectContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __65__ICNoteContext_cloudContextFetchRecordChangeOperationDidFinish___block_invoke_2;
  v5[3] = &unk_1E76C73B0;
  v3 = *(_QWORD *)(a1 + 32);
  v6 = v2;
  v7 = v3;
  v4 = v2;
  objc_msgSend(v4, "performBlock:", v5);

}

void __65__ICNoteContext_cloudContextFetchRecordChangeOperationDidFinish___block_invoke_2(uint64_t a1)
{
  void *v2;
  char v3;
  id v4;
  NSObject *v5;
  id v6;

  +[ICAttachmentPreviewImage deleteStrandedAttachmentPreviewImagesInContext:](ICAttachmentPreviewImage, "deleteStrandedAttachmentPreviewImagesInContext:", *(_QWORD *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 40), "purgeDeletedObjectsInManagedObjectContext:", *(_QWORD *)(a1 + 32));
  v2 = *(void **)(a1 + 32);
  v6 = 0;
  v3 = objc_msgSend(v2, "save:", &v6);
  v4 = v6;
  if ((v3 & 1) == 0)
  {
    v5 = os_log_create("com.apple.notes", "CoreData");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __65__ICNoteContext_cloudContextFetchRecordChangeOperationDidFinish___block_invoke_2_cold_1();

  }
}

- (void)managedObjectContextUpdaterDidMerge:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_opt_class();
  objc_msgSend(v4, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0D640B8]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  ICCheckedDynamicCast();
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  objc_msgSend(v7, "objectForKey:", *MEMORY[0x1E0C97A18]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v23;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v23 != v11)
          objc_enumerationMutation(v8);
        -[ICNoteContext managedObjectContextUpdaterDidChangeObjectWithID:](self, "managedObjectContextUpdaterDidChangeObjectWithID:", *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * v12++));
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    }
    while (v10);
  }

  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  objc_msgSend(v7, "objectForKey:", *MEMORY[0x1E0C97870], 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v19;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v19 != v16)
          objc_enumerationMutation(v13);
        -[ICNoteContext managedObjectContextUpdaterDidChangeObjectWithID:](self, "managedObjectContextUpdaterDidChangeObjectWithID:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v17++));
      }
      while (v15 != v17);
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
    }
    while (v15);
  }

}

- (void)managedObjectContextUpdaterDidChangeObjectWithID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  _QWORD v10[5];
  id v11;

  v4 = a3;
  -[ICNoteContext persistentStoreCoordinator](self, "persistentStoreCoordinator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "persistentStores");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "persistentStore");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "containsObject:", v7);

  if (v8)
  {
    -[ICNoteContext managedObjectContext](self, "managedObjectContext");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __66__ICNoteContext_managedObjectContextUpdaterDidChangeObjectWithID___block_invoke;
    v10[3] = &unk_1E76C73B0;
    v10[4] = self;
    v11 = v4;
    objc_msgSend(v9, "performBlock:", v10);

  }
}

void __66__ICNoteContext_managedObjectContextUpdaterDidChangeObjectWithID___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectWithID:", *(_QWORD *)(a1 + 40));
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  ICDynamicCast();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "attachment");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "ic_postNotificationOnMainThreadWithName:", CFSTR("ICAttachmentPreviewImagesDidUpdateNotification"));

  }
}

+ (BOOL)isActive
{
  return 1;
}

- (BOOL)delaySaving
{
  return self->_delaySaving;
}

- (void)setDelaySaving:(BOOL)a3
{
  self->_delaySaving = a3;
}

- (ICNote)currentNote
{
  return self->_currentNote;
}

- (NSError)databaseOpenError
{
  return self->_databaseOpenError;
}

- (void)setDatabaseOpenError:(id)a3
{
  objc_storeStrong((id *)&self->_databaseOpenError, a3);
}

- (BOOL)databaseOpenFailedDueToLowDiskSpace
{
  return self->_databaseOpenFailedDueToLowDiskSpace;
}

- (void)setDatabaseOpenFailedDueToLowDiskSpace:(BOOL)a3
{
  self->_databaseOpenFailedDueToLowDiskSpace = a3;
}

- (NSTimer)updateAttachmentLocationsTimer
{
  return self->_updateAttachmentLocationsTimer;
}

- (void)setUpdateAttachmentLocationsTimer:(id)a3
{
  objc_storeStrong((id *)&self->_updateAttachmentLocationsTimer, a3);
}

- (BOOL)isSaving
{
  return self->_saving;
}

- (void)setSaving:(BOOL)a3
{
  self->_saving = a3;
}

- (NSTimer)trashDeletionTimer
{
  return self->_trashDeletionTimer;
}

- (void)setTrashDeletionTimer:(id)a3
{
  objc_storeStrong((id *)&self->_trashDeletionTimer, a3);
}

- (void)setBackgroundTaskQueue:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundTaskQueue, a3);
}

- (void)setShouldEnsureLocalAccount:(BOOL)a3
{
  self->_shouldEnsureLocalAccount = a3;
}

- (NSDictionary)persistentStoresByAccountId
{
  return self->_persistentStoresByAccountId;
}

- (unint64_t)countOfPerformBackgroundTask
{
  return self->_countOfPerformBackgroundTask;
}

- (void)setCountOfPerformBackgroundTask:(unint64_t)a3
{
  self->_countOfPerformBackgroundTask = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_persistentStoresByAccountId, 0);
  objc_storeStrong((id *)&self->_backgroundTaskQueue, 0);
  objc_storeStrong((id *)&self->_trashDeletionTimer, 0);
  objc_storeStrong((id *)&self->_accountUtilities, 0);
  objc_storeStrong((id *)&self->_contextUpdater, 0);
  objc_storeStrong((id *)&self->_updateAttachmentLocationsTimer, 0);
  objc_storeStrong((id *)&self->_databaseOpenError, 0);
  objc_storeStrong((id *)&self->_currentNote, 0);
  objc_storeStrong((id *)&self->_managedObjectContext, 0);
  objc_storeStrong((id *)&self->_crossProcessChangeCoordinator, 0);
  objc_storeStrong((id *)&self->_persistentContainer, 0);
}

+ (void)sharedContext
{
  *(_DWORD *)buf = 138412290;
  *(_QWORD *)(buf + 4) = a1;
  _os_log_error_impl(&dword_1BD918000, log, OS_LOG_TYPE_ERROR, "No shared context: %@", buf, 0xCu);

  OUTLINED_FUNCTION_1_6();
}

void __34__ICNoteContext_resetAppContainer__block_invoke_cold_1(uint64_t a1)
{
  NSObject *v1;
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412546;
  v3 = a1;
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_10(&dword_1BD918000, v1, (uint64_t)v1, "Cannot remove container item {url: %@, error: %@}", (uint8_t *)&v2);
  OUTLINED_FUNCTION_1_0();
}

- (void)initWithOptions:.cold.1()
{
  NSObject *v0;
  int *v1;
  uint64_t v2;
  uint8_t v3[24];
  uint64_t v4;

  OUTLINED_FUNCTION_6_0();
  v4 = *MEMORY[0x1E0C80C00];
  v1 = __error();
  strerror(*v1);
  OUTLINED_FUNCTION_13_2();
  OUTLINED_FUNCTION_10(&dword_1BD918000, v0, v2, "setenv TMPDIR %@ failed because %s", v3);
  OUTLINED_FUNCTION_4_0();
}

- (void)initWithOptions:.cold.2()
{
  NSObject *v0;
  int *v1;
  uint64_t v2;
  uint8_t v3[24];
  uint64_t v4;

  OUTLINED_FUNCTION_6_0();
  v4 = *MEMORY[0x1E0C80C00];
  v1 = __error();
  strerror(*v1);
  OUTLINED_FUNCTION_13_2();
  OUTLINED_FUNCTION_10(&dword_1BD918000, v0, v2, "setenv HOME %@ failed because %s", v3);
  OUTLINED_FUNCTION_4_0();
}

- (void)initWithOptions:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_1(&dword_1BD918000, v0, v1, "Error creating temporary directory SQL: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)purgeDeletedObjectsInManagedObjectContext:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_3(&dword_1BD918000, v0, v1, "Trying to delete objects with a read only persistent store", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

- (void)purgeDeletedObjectsInManagedObjectContext:(uint64_t)a1 .cold.2(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  _DWORD *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;

  objc_msgSend((id)OUTLINED_FUNCTION_18_1(a1, a2), "shortLoggingDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  *v3 = 138412290;
  *v2 = v4;
  OUTLINED_FUNCTION_10_1(&dword_1BD918000, v5, v6, "Deleting object from database because it's marked for deletion and its deletion has synced: %@");

  OUTLINED_FUNCTION_16();
}

+ (void)markOldTrashedNotesForDeletionInContext:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1_2(&dword_1BD918000, v0, v1, "Marking expired trashed notes as deleted. Cutoff date is %@", v2);
  OUTLINED_FUNCTION_1_0();
}

void __22__ICNoteContext_save___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_3(&dword_1BD918000, v0, v1, "Failed to recover from save error", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

void __22__ICNoteContext_save___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  void *v7;
  __int16 v8;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  OUTLINED_FUNCTION_6_0();
  v12 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)v2 + 8) + 40), "domain");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)v1 + 8) + 40), "code");
  v5 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)v1 + 8) + 40);
  v6 = 138412802;
  v7 = v3;
  v8 = 2048;
  v9 = v4;
  v10 = 2112;
  v11 = v5;
  _os_log_error_impl(&dword_1BD918000, v0, OS_LOG_TYPE_ERROR, "Error saving main managedObjectContext: Domain=%@ Code=%ld \"%@\", (uint8_t *)&v6, 0x20u);

}

void __22__ICNoteContext_save___block_invoke_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_1(&dword_1BD918000, v0, v1, "Saving main managedObjectContext", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

- (void)save
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_1(&dword_1BD918000, v0, v1, "Delayed ICNoteContext save.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

- (void)recoverFromSaveError
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_1(&dword_1BD918000, v0, v1, "Error saving context. Rolling back.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

void __27__ICNoteContext_refreshAll__block_invoke_cold_1(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  _DWORD *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;

  objc_msgSend((id)OUTLINED_FUNCTION_18_1(a1, a2), "objectID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  *v3 = 138412290;
  *v2 = v4;
  OUTLINED_FUNCTION_10_1(&dword_1BD918000, v5, v6, "refreshing objectID %@");

  OUTLINED_FUNCTION_16();
}

+ (void)setLegacyNotesDisabled:(char)a1 .cold.1(char a1)
{
  const __CFString *v1;
  NSObject *v2;
  int v3;
  const __CFString *v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v1 = CFSTR("disabling");
  if ((a1 & 1) == 0)
    v1 = CFSTR("enabling");
  v3 = 138412546;
  v4 = v1;
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_10(&dword_1BD918000, v2, (uint64_t)v2, "Error %@ legacy notes: %@", (uint8_t *)&v3);
  OUTLINED_FUNCTION_1_0();
}

- (void)accountsDidChange:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_1(&dword_1BD918000, v0, v1, "Released the cached CloudKit account", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

void __31__ICNoteContext_updateAccounts__block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1_2(&dword_1BD918000, v0, v1, "Creating account: %@", v2);
  OUTLINED_FUNCTION_1_0();
}

- (void)ensureModernAccountExistsInContext:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_1(&dword_1BD918000, v0, v1, "No modern accounts were found in hosted scene, trying to create a blank modern local account as a fallback.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

void __36__ICNoteContext_persistentContainer__block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_1(&dword_1BD918000, v0, v1, "Error loading persistent store: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)refreshPersistentStoresByAccountIdFromPersistentStores:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1_2(&dword_1BD918000, v0, v1, "Found loaded persistent store for in-memory account: %@", v2);
  OUTLINED_FUNCTION_1_0();
}

- (void)refreshPersistentStoresByAccountIdFromPersistentStores:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_1(&dword_1BD918000, v0, v1, "Didn't find a loaded persistent store for local account.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

- (void)createAdditionalPersistentStoresWithAccountIdentifiers:(uint64_t)a3 persistentContainer:(NSObject *)a4 .cold.1(uint64_t a1, void *a2, uint64_t a3, NSObject *a4)
{
  *(_DWORD *)a3 = 138412546;
  *(_QWORD *)(a3 + 4) = a1;
  *(_WORD *)(a3 + 12) = 2112;
  *(_QWORD *)(a3 + 14) = a2;
  OUTLINED_FUNCTION_10(&dword_1BD918000, a4, a3, "Returned error while creating additional persistent stores: %@, %@", (uint8_t *)a3);

  OUTLINED_FUNCTION_1_6();
}

void __92__ICNoteContext_createAdditionalPersistentStoresWithAccountIdentifiers_persistentContainer___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_3(&dword_1BD918000, v0, v1, "No identifiers to create persistent stores.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

void __92__ICNoteContext_createAdditionalPersistentStoresWithAccountIdentifiers_persistentContainer___block_invoke_213_cold_1(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v4;
  void *v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = *(_QWORD *)(a1 + 32);
  objc_msgSend(a2, "URL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 138412546;
  v8 = v4;
  v9 = 2112;
  v10 = v5;
  OUTLINED_FUNCTION_9(&dword_1BD918000, a3, v6, "Added persistent store for account %@: %@", (uint8_t *)&v7);

  OUTLINED_FUNCTION_2();
}

void __92__ICNoteContext_createAdditionalPersistentStoresWithAccountIdentifiers_persistentContainer___block_invoke_213_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  id v2;
  void *v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  void *v8;
  uint64_t v9;

  OUTLINED_FUNCTION_6_0();
  v9 = *MEMORY[0x1E0C80C00];
  objc_msgSend(v2, "userInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138412546;
  v6 = v1;
  v7 = 2112;
  v8 = v3;
  OUTLINED_FUNCTION_10(&dword_1BD918000, v0, v4, "Error while adding persistent store: %@, %@", (uint8_t *)&v5);

  OUTLINED_FUNCTION_2();
}

void __50__ICNoteContext_cleanupAdditionalPersistentStores__block_invoke_217_cold_1(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "URL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1_2(&dword_1BD918000, a2, v4, "Removed persistent store: %@", v5);

  OUTLINED_FUNCTION_4_0();
}

void __50__ICNoteContext_cleanupAdditionalPersistentStores__block_invoke_217_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_1(&dword_1BD918000, v0, v1, "Error removing persistent store: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

+ (void)snapshotManagedObjectContextForContainer:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_1BD918000, a2, a3, "Error pinning context to current query generation: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

- (void)persistentStoreForAccountID:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1_2(&dword_1BD918000, v0, v1, "No persistent store for account ID %@, assuming default persistent store", v2);
  OUTLINED_FUNCTION_1_0();
}

- (void)persistentStoreForAccountID:(uint64_t)a1 .cold.2(uint64_t a1)
{
  NSObject *v1;
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412546;
  v3 = a1;
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_9(&dword_1BD918000, v1, (uint64_t)v1, "Found persistent store for account ID %@: %@", (uint8_t *)&v2);
  OUTLINED_FUNCTION_1_0();
}

void __65__ICNoteContext_cloudContextFetchRecordChangeOperationDidFinish___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_1(&dword_1BD918000, v0, v1, "Failed to save after doing background tasks: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

@end
