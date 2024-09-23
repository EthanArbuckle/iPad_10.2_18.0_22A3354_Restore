@implementation NoteContext

- (void)enableChangeLogging:(BOOL)a3
{
  self->_logChanges = a3;
}

+ (id)sharedContext
{
  if (sharedContext_once != -1)
    dispatch_once(&sharedContext_once, &__block_literal_global_3);
  return (id)sharedContext_sharedContext;
}

void __33__NoteContext_managedObjectModel__block_invoke()
{
  id v0;
  void *v1;
  uint64_t v2;
  void *v3;
  NSObject *v4;
  id v5;

  NoteContextManagedObjectModelPath();
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v0 = objc_alloc(MEMORY[0x1E0C97B98]);
  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v5);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v0, "initWithContentsOfURL:", v1);
  v3 = (void *)managedObjectModel__defaultNotesModel;
  managedObjectModel__defaultNotesModel = v2;

  if (managedObjectModel__defaultNotesModel)
  {

  }
  else
  {
    v4 = os_log_create("com.apple.notes", "HTML");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
      __33__NoteContext_managedObjectModel__block_invoke_cold_1();

    __break(1u);
  }
}

- (void)setHasPriorityInSaveConflicts:(BOOL)a3
{
  _BOOL4 v3;
  void *v4;
  id v5;

  v3 = a3;
  self->_hasPriorityInSaveConflicts = a3;
  -[NoteContext managedObjectContext](self, "managedObjectContext");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    +[NoteResurrectionMergePolicy sharedNoteResurrectionMergePolicy](NoteResurrectionMergePolicy, "sharedNoteResurrectionMergePolicy");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setMergePolicy:", v4);

  }
  else
  {
    objc_msgSend(v5, "setMergePolicy:", *MEMORY[0x1E0C978C8]);
  }

}

void __38__NoteContext_searchIndexerDataSource__block_invoke()
{
  ICHTMLSearchIndexerDataSource *v0;
  void *v1;
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0D64258], "sharedIndexer");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v0 = objc_alloc_init(ICHTMLSearchIndexerDataSource);
  v1 = (void *)searchIndexerDataSource_sDataSource;
  searchIndexerDataSource_sDataSource = (uint64_t)v0;

  objc_msgSend(v4, "addDataSource:", searchIndexerDataSource_sDataSource);
  objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "processName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (((objc_msgSend(v3, "isEqualToString:", CFSTR("dataaccessd")) & 1) != 0
     || objc_msgSend(v3, "isEqualToString:", CFSTR("exchangesyncd")))
    && (objc_msgSend(v4, "isObservingChanges") & 1) == 0)
  {
    objc_msgSend(v4, "setDisabled:", 0);
    objc_msgSend(v4, "startObservingChanges");
  }

}

- (BOOL)save:(id *)a3
{
  __CFNotificationCenter *DarwinNotifyCenter;
  const __CFString *v6;
  BOOL v7;

  if (!-[NSManagedObjectContext hasChanges](self->_managedObjectContext, "hasChanges"))
    return 1;
  if (!-[NoteContext saveSilently:](self, "saveSilently:", a3))
    return 0;
  if (-[NoteContext shouldObserveDarwinNotifications](self, "shouldObserveDarwinNotifications"))
    ++self->_notificationCount;
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  if (self->_logChanges)
    v6 = CFSTR("NoteContextDarwinNotificationWithLoggedChanges");
  else
    v6 = CFSTR("NoteContextDarwinNotificationWithoutLoggedChanges");
  v7 = 1;
  CFNotificationCenterPostNotification(DarwinNotifyCenter, v6, 0, 0, 1u);
  return v7;
}

- (void)dealloc
{
  objc_super v3;

  -[NoteContext tearDownCoreDataStack](self, "tearDownCoreDataStack");
  v3.receiver = self;
  v3.super_class = (Class)NoteContext;
  -[NoteContext dealloc](&v3, sel_dealloc);
}

- (void)tearDownCoreDataStack
{
  void *v3;
  __CFNotificationCenter *DarwinNotifyCenter;
  NoteStoreObject *localStore;
  NoteAccountObject *localAccount;
  NSNumber *nextId;
  NSManagedObjectContext *nextIdContext;
  NSManagedObjectContext *managedObjectContext;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveEveryObserver(DarwinNotifyCenter, self);
  localStore = self->_localStore;
  self->_localStore = 0;

  localAccount = self->_localAccount;
  self->_localAccount = 0;

  nextId = self->_nextId;
  self->_nextId = 0;

  nextIdContext = self->_nextIdContext;
  self->_nextIdContext = 0;

  managedObjectContext = self->_managedObjectContext;
  self->_managedObjectContext = 0;

}

- (id)allAccounts
{
  return -[NoteContext allAccountsAsFaults:prefechedRelationshipKeyPaths:](self, "allAccountsAsFaults:prefechedRelationshipKeyPaths:", 1, 0);
}

- (id)allAccountsAsFaults:(BOOL)a3 prefechedRelationshipKeyPaths:(id)a4
{
  _BOOL8 v4;
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  id v10;
  NSObject *v11;
  void *v12;
  NSObject *v14;
  uint64_t v15;
  id v16;
  id v17;

  v4 = a3;
  v6 = a4;
  v7 = +[NoteContext newFetchRequestForAccounts](NoteContext, "newFetchRequestForAccounts");
  objc_msgSend(v7, "setReturnsObjectsAsFaults:", v4);
  if (v6)
    objc_msgSend(v7, "setRelationshipKeyPathsForPrefetching:", v6);
  -[NoteContext managedObjectContext](self, "managedObjectContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0;
  objc_msgSend(v8, "executeFetchRequest:error:", v7, &v17);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v17;

  if (v10)
  {
    v11 = os_log_create("com.apple.notes", "HTML");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
      -[NoteContext allAccountsAsFaults:prefechedRelationshipKeyPaths:].cold.2();
    v12 = v11;
  }
  else
  {
    if (-[NSObject count](v9, "count"))
      goto LABEL_9;
    v14 = os_log_create("com.apple.notes", "HTML");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
      -[NoteContext allAccountsAsFaults:prefechedRelationshipKeyPaths:].cold.1();

    -[NoteContext forceSetUpUniqueObjects](self, "forceSetUpUniqueObjects");
    -[NoteContext managedObjectContext](self, "managedObjectContext");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 0;
    objc_msgSend(v12, "executeFetchRequest:error:", v7, &v16);
    v15 = objc_claimAutoreleasedReturnValue();
    v10 = v16;
    v11 = v9;
    v9 = v15;
  }

LABEL_9:
  return v9;
}

void __43__NoteContext_SharedContext__sharedContext__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[NoteContext initForMainContext]([NoteContext alloc], "initForMainContext");
  v1 = (void *)sharedContext_sharedContext;
  sharedContext_sharedContext = (uint64_t)v0;

}

- (id)initForMainContext
{
  void *v3;
  NoteContext *v4;

  +[AccountUtilities sharedAccountUtilities](AccountUtilities, "sharedAccountUtilities");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[NoteContext initWithAccountUtilities:inMigrator:isMainContext:usePrivateQueue:](self, "initWithAccountUtilities:inMigrator:isMainContext:usePrivateQueue:", v3, 0, 1, 0);

  return v4;
}

- (NoteContext)initWithPrivateQueue
{
  void *v3;
  NoteContext *v4;

  +[AccountUtilities sharedAccountUtilities](AccountUtilities, "sharedAccountUtilities");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[NoteContext initWithAccountUtilities:inMigrator:isMainContext:usePrivateQueue:](self, "initWithAccountUtilities:inMigrator:isMainContext:usePrivateQueue:", v3, 0, 0, 1);

  return v4;
}

- (NoteContext)initWithAccountUtilities:(id)a3 inMigrator:(BOOL)a4
{
  return -[NoteContext initWithAccountUtilities:inMigrator:isMainContext:usePrivateQueue:](self, "initWithAccountUtilities:inMigrator:isMainContext:usePrivateQueue:", a3, a4, 0, 0);
}

- (NoteContext)initWithAccountUtilities:(id)a3
{
  return -[NoteContext initWithAccountUtilities:inMigrator:](self, "initWithAccountUtilities:inMigrator:", a3, 0);
}

- (id)newFRCForStoresWithDelegate:(id)a3
{
  id v4;
  id v5;
  id v6;

  v4 = a3;
  v5 = +[NoteContext newFetchRequestForStores](NoteContext, "newFetchRequestForStores");
  objc_msgSend(v5, "setFetchBatchSize:", 100);
  v6 = -[NoteContext newFRCForFetchRequest:delegate:performFetch:](self, "newFRCForFetchRequest:delegate:performFetch:", v5, v4, 1);

  return v6;
}

- (id)newFRCForAccountsWithDelegate:(id)a3
{
  id v4;
  id v5;
  id v6;

  v4 = a3;
  v5 = +[NoteContext newFetchRequestForAccounts](NoteContext, "newFetchRequestForAccounts");
  objc_msgSend(v5, "setFetchBatchSize:", 100);
  v6 = -[NoteContext newFRCForFetchRequest:delegate:performFetch:](self, "newFRCForFetchRequest:delegate:performFetch:", v5, v4, 1);

  return v6;
}

- (id)newFRCForFetchRequest:(id)a3 delegate:(id)a4 performFetch:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  void *v10;
  void *v11;
  _QWORD v13[4];
  id v14;

  v5 = a5;
  v8 = a4;
  v9 = a3;
  -[NoteContext managedObjectContext](self, "managedObjectContext");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C97B68]), "initWithFetchRequest:managedObjectContext:sectionNameKeyPath:cacheName:", v9, v10, 0, 0);

  objc_msgSend(v11, "setDelegate:", v8);
  if (v5)
  {
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __59__NoteContext_newFRCForFetchRequest_delegate_performFetch___block_invoke;
    v13[3] = &unk_1E81EAB90;
    v14 = v11;
    objc_msgSend(v10, "performBlockAndWait:", v13);

  }
  return v11;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_externalChangeNotificationDelayer, 0);
  objc_storeStrong((id *)&self->_mocUpdater, 0);
  objc_storeStrong((id *)&self->_notePropertyObjectsRealized, 0);
  objc_storeStrong((id *)&self->_objectCreationLock, 0);
  objc_storeStrong((id *)&self->_nextId, 0);
  objc_storeStrong((id *)&self->_nextIdLock, 0);
  objc_storeStrong((id *)&self->_nextIdContext, 0);
  objc_storeStrong((id *)&self->_accountUtilities, 0);
  objc_storeStrong((id *)&self->_localAccount, 0);
  objc_storeStrong((id *)&self->_localStore, 0);
  objc_storeStrong((id *)&self->_managedObjectContext, 0);
}

void __41__NoteContext_persistentStoreCoordinator__block_invoke(uint64_t a1)
{
  id *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  void *v13;
  NotesMigrationManager *v14;
  int v15;
  uint64_t v16;
  BOOL v17;
  id v18;
  void *v19;
  BOOL v20;
  id v21;
  void *v22;
  id v23;
  NSObject *v24;
  int v25;
  NSObject *v26;
  NSObject *v27;
  NSObject *v28;
  NSObject *v29;
  uint64_t v30;
  void *v31;
  id v32;
  NSObject *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  _QWORD v39[5];
  uint8_t v40[16];
  id v41;
  id v42;
  _QWORD v43[5];
  id v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  uint64_t v49;
  uint64_t *v50;
  uint64_t v51;
  char v52;
  uint8_t buf[32];
  _BYTE v54[128];
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v2 = (id *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 32), "urlForPersistentStore");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*v2, "managedObjectModel");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C97C00]), "initWithManagedObjectModel:", v36);
  objc_msgSend(*v2, "storeOptions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "mutableCopy");

  v49 = 0;
  v50 = &v49;
  v51 = 0x2020000000;
  v52 = 0;
  if (ICUseCoreDataCoreSpotlightIntegration())
  {
    objc_msgSend(MEMORY[0x1E0C97C08], "persistentStoreDescriptionWithURL:", v37);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setType:", *MEMORY[0x1E0C979E8]);
    v47 = 0u;
    v48 = 0u;
    v45 = 0u;
    v46 = 0u;
    objc_msgSend(v5, "allKeys");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v45, v54, 16);
    if (v8)
    {
      v9 = *(_QWORD *)v46;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v46 != v9)
            objc_enumerationMutation(v7);
          v11 = *(_QWORD *)(*((_QWORD *)&v45 + 1) + 8 * i);
          objc_msgSend(v5, "objectForKeyedSubscript:", v11, v36);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "setOption:forKey:", v12, v11);

        }
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v45, v54, 16);
      }
      while (v8);
    }

  }
  else
  {
    v6 = 0;
  }
  objc_opt_class();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v13);
  v14 = objc_alloc_init(NotesMigrationManager);
  v15 = ICUseCoreDataCoreSpotlightIntegration();
  v16 = *MEMORY[0x1E0C979E8];
  if (v15)
  {
    v44 = 0;
    v17 = -[NotesMigrationManager migrateNotesStoreAtURL:storeType:managedObjectModel:options:error:](v14, "migrateNotesStoreAtURL:storeType:managedObjectModel:options:error:", v37, v16, v36, v5, &v44);
    v18 = v44;
    *((_BYTE *)v50 + 24) = v17;
    if (v6)
    {
      v43[0] = MEMORY[0x1E0C809B0];
      v43[1] = 3221225472;
      v43[2] = __41__NoteContext_persistentStoreCoordinator__block_invoke_2;
      v43[3] = &unk_1E81EAC00;
      v43[4] = &v49;
      objc_msgSend(v3, "addPersistentStoreWithDescription:completionHandler:", v6, v43);
    }
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "managedObjectModel");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = 0;
    v20 = -[NotesMigrationManager migrateNotesStoreAtURL:storeType:managedObjectModel:options:error:](v14, "migrateNotesStoreAtURL:storeType:managedObjectModel:options:error:", v37, v16, v19, v5, &v42);
    v21 = v42;
    *((_BYTE *)v50 + 24) = v20;

    v41 = v21;
    objc_msgSend(v3, "addPersistentStoreWithType:configuration:URL:options:error:", v16, 0, v37, v5, &v41);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = v41;

    *((_BYTE *)v50 + 24) = v22 != 0;
    v18 = v23;
  }

  if (!*((_BYTE *)v50 + 24))
  {
    if (objc_msgSend(*(id *)(a1 + 32), "isTooLowOnDiskSpace"))
    {
      v24 = os_log_create("com.apple.notes", "HTML");
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        __41__NoteContext_persistentStoreCoordinator__block_invoke_cold_1();
    }
    else
    {
      v25 = objc_msgSend(*(id *)(a1 + 32), "isDataProtectionError:", v18);
      v26 = os_log_create("com.apple.notes", "HTML");
      v24 = v26;
      if (v25)
      {
        if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1C88D8000, v24, OS_LOG_TYPE_INFO, "Data protection prevented loading persistent store, because device has not been unlocked since boot", buf, 2u);
        }
      }
      else
      {
        v27 = v26;
        if (os_log_type_enabled(v27, OS_LOG_TYPE_FAULT))
        {
          objc_msgSend(v18, "userInfo");
          objc_claimAutoreleasedReturnValue();
          __41__NoteContext_persistentStoreCoordinator__block_invoke_cold_5();
        }

        objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "__objc_no", "+[NoteContext persistentStoreCoordinator]_block_invoke", 1, 1, CFSTR("Failed to open HTML notes database."));
        v28 = os_log_create("com.apple.notes", "HTML");
        if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)v40 = 0;
          _os_log_impl(&dword_1C88D8000, v28, OS_LOG_TYPE_INFO, "Destroying old persistent store and creating a new one", v40, 2u);
        }

        objc_msgSend(*(id *)(a1 + 32), "backupPersistentStore:", v3);
        v29 = os_log_create("com.apple.notes", "HTML");
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
          __41__NoteContext_persistentStoreCoordinator__block_invoke_cold_4();

        if (ICUseCoreDataCoreSpotlightIntegration())
        {
          if (v6)
          {
            v39[0] = MEMORY[0x1E0C809B0];
            v39[1] = 3221225472;
            v39[2] = __41__NoteContext_persistentStoreCoordinator__block_invoke_175;
            v39[3] = &unk_1E81EAC00;
            v39[4] = &v49;
            objc_msgSend(v3, "addPersistentStoreWithDescription:completionHandler:", v6, v39);
          }
        }
        else
        {
          v30 = *MEMORY[0x1E0C979E8];
          v38 = v18;
          objc_msgSend(v3, "addPersistentStoreWithType:configuration:URL:options:error:", v30, 0, v37, v5, &v38);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          v32 = v38;

          *((_BYTE *)v50 + 24) = v31 != 0;
          v18 = v32;
        }
        v33 = os_log_create("com.apple.notes", "HTML");
        v24 = v33;
        if (v18)
        {
          if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
            __41__NoteContext_persistentStoreCoordinator__block_invoke_cold_3();
        }
        else
        {
          if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
            __41__NoteContext_persistentStoreCoordinator__block_invoke_cold_2();
          v18 = 0;
        }
      }
    }

  }
  objc_sync_exit(v13);

  if (*((_BYTE *)v50 + 24))
  {
    objc_storeStrong((id *)&persistentStoreCoordinator__persistentStoreCoordinator, v3);
    if (ICUseCoreDataCoreSpotlightIntegration())
    {
      v34 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D641D0]), "initForStoreWithDescription:coordinator:indexingPriority:", v6, v3, 1);
      if (v34)
      {
        objc_msgSend(MEMORY[0x1E0D641B0], "sharedReindexer");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "registerCoreDataCoreSpotlightDelegate:", v34);

        objc_msgSend(v34, "startSpotlightIndexing");
      }

    }
  }

  _Block_object_dispose(&v49, 8);
}

uint64_t __33__NoteContext_setUpCoreDataStack__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setUpUniqueObjects");
  return objc_msgSend(*(id *)(a1 + 32), "handleMigration");
}

- (void)setUpUniqueObjects
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t *v5;
  NSObject *v6;

  OUTLINED_FUNCTION_15();
  OUTLINED_FUNCTION_4(v1, v2, v3, 5.778e-34);
  OUTLINED_FUNCTION_3(&dword_1C88D8000, v6, v4, "Error: Couldn't save newly created unique objects: %@, %@", v5);

  OUTLINED_FUNCTION_19();
}

+ (id)urlForPersistentStore
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0C99E98];
  objc_msgSend(a1, "pathForPersistentStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fileURLWithPath:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)setUpCoreDataStack
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void (**v7)(_QWORD);
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  __CFNotificationCenter *DarwinNotifyCenter;
  __CFNotificationCenter *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  _QWORD v23[5];

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "postNotificationName:object:", CFSTR("NoteContextWillSetUpCoreDataStackNotification"), self);

  objc_msgSend((id)objc_opt_class(), "removeConflictingSqliteAndIdxFiles");
  objc_msgSend((id)objc_opt_class(), "managedObjectModel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4
    && (objc_msgSend((id)objc_opt_class(), "persistentStoreCoordinator"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v5,
        v5)
    && (-[NoteContext managedObjectContext](self, "managedObjectContext"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v6,
        v6))
  {
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __33__NoteContext_setUpCoreDataStack__block_invoke;
    v23[3] = &unk_1E81EAB90;
    v23[4] = self;
    v7 = (void (**)(_QWORD))MEMORY[0x1CAA36838](v23);
    -[NoteContext managedObjectContext](self, "managedObjectContext");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "concurrencyType");

    if (v9)
    {
      -[NoteContext managedObjectContext](self, "managedObjectContext");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "performBlockAndWait:", v7);

    }
    else
    {
      v7[2](v7);
    }
    if (!self->_inMigrator)
    {
      if (-[NoteContext shouldObserveDarwinNotifications](self, "shouldObserveDarwinNotifications"))
      {
        DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
        CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)__ReceiveNotification, CFSTR("NoteContextDarwinNotificationWithLoggedChanges"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
        v14 = CFNotificationCenterGetDarwinNotifyCenter();
        CFNotificationCenterAddObserver(v14, self, (CFNotificationCallback)__ReceiveNotification, CFSTR("NoteContextDarwinNotificationWithoutLoggedChanges"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
      }
      v15 = objc_alloc(MEMORY[0x1E0D64220]);
      -[NoteContext managedObjectContext](self, "managedObjectContext");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = (void *)objc_msgSend(v15, "initWithStore:context:", 0, v16);
      -[NoteContext setMocUpdater:](self, "setMocUpdater:", v17);

      v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D64268]), "initWithTarget:selector:delay:waitToFireUntilRequestsStop:callOnMainThread:", self, sel_postNotesChangedExternally, 1, 1, 0.1);
      -[NoteContext setExternalChangeNotificationDelayer:](self, "setExternalChangeNotificationDelayer:", v18);

    }
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = *MEMORY[0x1E0C978B8];
    -[NoteContext managedObjectContext](self, "managedObjectContext");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "addObserver:selector:name:object:", self, sel_managedObjectContextWillSaveNotification_, v20, v21);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "postNotificationName:object:", CFSTR("NoteContextDidSetUpCoreDataStackNotification"), self);

    return 1;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "postNotificationName:object:", CFSTR("NoteContextDidSetUpCoreDataStackNotification"), self);

    return 0;
  }
}

- (NSManagedObjectContext)managedObjectContext
{
  NSManagedObjectContext *managedObjectContext;
  NSManagedObjectContext *v3;
  void *v5;
  id v6;
  uint64_t v7;
  NSManagedObjectContext *v8;
  NSManagedObjectContext *v9;
  id v10;
  NSObject *v11;

  managedObjectContext = self->_managedObjectContext;
  if (managedObjectContext)
  {
    v3 = managedObjectContext;
    return v3;
  }
  objc_msgSend((id)objc_opt_class(), "persistentStoreCoordinator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    if (-[NoteContext isMainContext](self, "isMainContext"))
    {
      v6 = objc_alloc(MEMORY[0x1E0C97B88]);
      v7 = 2;
    }
    else
    {
      if (!-[NoteContext usePrivateQueue](self, "usePrivateQueue"))
      {
        v8 = (NSManagedObjectContext *)objc_alloc_init(MEMORY[0x1E0C97B88]);
        goto LABEL_10;
      }
      v6 = objc_alloc(MEMORY[0x1E0C97B88]);
      v7 = 1;
    }
    v8 = (NSManagedObjectContext *)objc_msgSend(v6, "initWithConcurrencyType:", v7);
LABEL_10:
    v9 = self->_managedObjectContext;
    self->_managedObjectContext = v8;

    -[NSManagedObjectContext setPersistentStoreCoordinator:](self->_managedObjectContext, "setPersistentStoreCoordinator:", v5);
  }
  -[NSManagedObjectContext setUndoManager:](self->_managedObjectContext, "setUndoManager:", 0);
  -[NSManagedObjectContext setMergePolicy:](self->_managedObjectContext, "setMergePolicy:", *MEMORY[0x1E0C978C8]);
  -[NSManagedObjectContext setStalenessInterval:](self->_managedObjectContext, "setStalenessInterval:", 0.0);
  -[NSManagedObjectContext _setDelegate:](self->_managedObjectContext, "_setDelegate:", self);
  if (self->_managedObjectContext)
  {
    v10 = (id)objc_msgSend((id)objc_opt_class(), "searchIndexerDataSource");
  }
  else
  {
    v11 = os_log_create("com.apple.notes", "HTML");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
      -[NoteContext managedObjectContext].cold.1();

  }
  v3 = self->_managedObjectContext;

  return v3;
}

+ (id)persistentStoreCoordinator
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __41__NoteContext_persistentStoreCoordinator__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (persistentStoreCoordinator_onceToken != -1)
    dispatch_once(&persistentStoreCoordinator_onceToken, block);
  return (id)persistentStoreCoordinator__persistentStoreCoordinator;
}

+ (NSManagedObjectModel)managedObjectModel
{
  if (managedObjectModel_onceToken != -1)
    dispatch_once(&managedObjectModel_onceToken, &__block_literal_global);
  return (NSManagedObjectModel *)(id)managedObjectModel__defaultNotesModel;
}

- (BOOL)shouldObserveDarwinNotifications
{
  return objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread");
}

- (void)setMocUpdater:(id)a3
{
  objc_storeStrong((id *)&self->_mocUpdater, a3);
}

- (void)setExternalChangeNotificationDelayer:(id)a3
{
  objc_storeStrong((id *)&self->_externalChangeNotificationDelayer, a3);
}

- (BOOL)isMainContext
{
  return self->_isMainContext;
}

+ (id)searchIndexerDataSource
{
  if (searchIndexerDataSource_onceToken != -1)
    dispatch_once(&searchIndexerDataSource_onceToken, &__block_literal_global_178);
  return (id)searchIndexerDataSource_sDataSource;
}

- (void)handleMigration
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t *v5;
  NSObject *v6;

  OUTLINED_FUNCTION_15();
  OUTLINED_FUNCTION_4(v1, v2, v3, 5.778e-34);
  OUTLINED_FUNCTION_3(&dword_1C88D8000, v6, v4, "Error: Saving failed after migration: %@, %@", v5);

  OUTLINED_FUNCTION_19();
}

+ (void)removeConflictingSqliteAndIdxFiles
{
  void *v3;
  int v4;
  __CFString *v5;

  v5 = NoteStoreCopyPath();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "fileExistsAtPath:", v5);

  if (v4)
    objc_msgSend(a1, "removeSqliteAndIdxFiles");

}

- (NoteContext)initWithAccountUtilities:(id)a3 inMigrator:(BOOL)a4 isMainContext:(BOOL)a5 usePrivateQueue:(BOOL)a6
{
  id v11;
  NoteContext *v12;
  NoteContext *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  ICExclusiveLock *nextIdLock;
  uint64_t v18;
  ICExclusiveLock *objectCreationLock;
  objc_super v21;

  v11 = a3;
  v21.receiver = self;
  v21.super_class = (Class)NoteContext;
  v12 = -[NoteContext init](&v21, sel_init);
  v13 = v12;
  if (v12)
  {
    v12->_isMainContext = a5;
    v12->_inMigrator = a4;
    objc_storeStrong((id *)&v12->_accountUtilities, a3);
    v13->_usePrivateQueue = a6;
    *(_WORD *)&v13->_logChanges = 0;
    objc_msgSend((id)CPSharedResourcesDirectory(), "stringByAppendingPathComponent:", CFSTR("Library"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "stringByAppendingPathComponent:", CFSTR("Caches"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = objc_msgSend(objc_alloc(MEMORY[0x1E0D641F8]), "initWithName:cachePath:", CFSTR("com.apple.notes.autoincrement.lock"), v15);
    nextIdLock = v13->_nextIdLock;
    v13->_nextIdLock = (ICExclusiveLock *)v16;

    v18 = objc_msgSend(objc_alloc(MEMORY[0x1E0D641F8]), "initWithName:cachePath:", CFSTR("com.apple.notes.objectcreation.lock"), v15);
    objectCreationLock = v13->_objectCreationLock;
    v13->_objectCreationLock = (ICExclusiveLock *)v18;

    if (!-[NoteContext setUpCoreDataStack](v13, "setUpCoreDataStack"))
    {

      v13 = 0;
    }

  }
  return v13;
}

- (BOOL)usePrivateQueue
{
  return self->_usePrivateQueue;
}

+ (id)storeOptions
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  _QWORD v7[4];
  _QWORD v8[5];

  v8[4] = *MEMORY[0x1E0C80C00];
  v2 = MEMORY[0x1E0C9AAB0];
  v3 = *MEMORY[0x1E0C97868];
  v7[0] = *MEMORY[0x1E0C978D0];
  v7[1] = v3;
  v8[0] = MEMORY[0x1E0C9AAB0];
  v8[1] = MEMORY[0x1E0C9AAB0];
  v7[2] = *MEMORY[0x1E0C97940];
  objc_msgSend((id)objc_opt_class(), "fileProtectionOption");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[3] = *MEMORY[0x1E0C97900];
  v8[2] = v4;
  v8[3] = v2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)newFetchRequestForStores
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C97B48]), "initWithEntityName:", CFSTR("Store"));
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3928]), "initWithKey:ascending:", CFSTR("name"), 1);
  v6[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setSortDescriptors:", v4);

  return v2;
}

+ (id)newFetchRequestForAccounts
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C97B48]), "initWithEntityName:", CFSTR("Account"));
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3928]), "initWithKey:ascending:", CFSTR("name"), 1);
  v6[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setSortDescriptors:", v4);

  return v2;
}

+ (id)fileProtectionOption
{
  return (id)*MEMORY[0x1E0CB2AC0];
}

void __59__NoteContext_newFRCForFetchRequest_delegate_performFetch___block_invoke(uint64_t a1)
{
  void *v1;
  char v2;
  id v3;
  NSObject *v4;
  id v5;

  v1 = *(void **)(a1 + 32);
  v5 = 0;
  v2 = objc_msgSend(v1, "performFetch:", &v5);
  v3 = v5;
  if ((v2 & 1) == 0)
  {
    v4 = os_log_create("com.apple.notes", "HTML");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
      __59__NoteContext_newFRCForFetchRequest_delegate_performFetch___block_invoke_cold_1();

  }
}

+ (BOOL)shouldLogIndexing
{
  void *v2;
  void *v3;
  char v4;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("ShouldLogIndexing"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

+ (BOOL)databaseIsCorrupt:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  char v6;
  void *v7;
  char v8;

  v3 = a3;
  objc_msgSend(v3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", *MEMORY[0x1E0C979C8]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    v6 = objc_msgSend(v5, "intValue") == 11;
  else
    v6 = 0;
  if (objc_msgSend(v3, "code") == 259)
  {
    objc_msgSend(v3, "domain");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isEqual:", *MEMORY[0x1E0CB28A8]);

    v6 |= v8;
  }

  return v6;
}

+ (void)setTestsNotesRootPath:(id)a3
{
  objc_storeStrong((id *)&s_testsNotesRootPath, a3);
}

+ (void)clearTestsNotesRootPath
{
  void *v2;

  v2 = (void *)s_testsNotesRootPath;
  s_testsNotesRootPath = 0;

}

+ (id)fileURLProtectionOption
{
  return (id)*MEMORY[0x1E0C99928];
}

+ (id)defaultNotesSortDescriptors
{
  return (id)objc_msgSend(MEMORY[0x1E0D64230], "sortDescriptorsForCurrentTypeIncludingPinnedNotes:", 0);
}

+ (id)generateGUID
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "UUIDString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)_createLocalAccount:(id *)a3 andStore:(id *)a4
{
  void *v7;
  void *v8;
  void *v9;
  id obj;

  -[NoteContext newlyAddedAccount](self, "newlyAddedAccount");
  obj = (id)objc_claimAutoreleasedReturnValue();
  -[NoteContext accountUtilities](self, "accountUtilities");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localAccountDisplayName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(obj, "setName:", v8);

  objc_msgSend(obj, "setAccountIdentifier:", CFSTR("local://local/account"));
  -[NoteContext newlyAddedStore](self, "newlyAddedStore");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setName:", CFSTR("LOCAL_NOTES_STORE"));
  objc_msgSend(v9, "setExternalIdentifier:", CFSTR("local://local/store"));
  objc_msgSend(v9, "setAccount:", obj);
  objc_msgSend(obj, "setDefaultStore:", v9);
  if (a3)
    objc_storeStrong(a3, obj);
  if (a4)
    objc_storeStrong(a4, v9);

}

- (BOOL)setUpLocalAccountAndStore
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  BOOL v11;
  NSObject *v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  char v17;
  uint64_t v18;
  uint64_t i;
  NoteAccountObject *localAccount;
  id *p_localAccount;
  NoteStoreObject *localStore;
  NoteStoreObject **p_localStore;
  uint64_t v24;
  id v25;
  uint64_t v26;
  NoteStoreObject *v27;
  id v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  id v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C97B48]);
  v4 = (void *)MEMORY[0x1E0C97B20];
  -[NoteContext managedObjectContext](self, "managedObjectContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "entityForName:inManagedObjectContext:", CFSTR("Account"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "setEntity:", v6);
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("accountIdentifier == %@"), CFSTR("local://local/account"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setPredicate:", v7);
  -[NoteContext managedObjectContext](self, "managedObjectContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = 0;
  objc_msgSend(v8, "executeFetchRequest:error:", v3, &v34);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v34;

  v11 = v10 == 0;
  if (v10)
  {
    v12 = os_log_create("com.apple.notes", "Accounts");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
      -[NoteContext setUpLocalAccountAndStore].cold.2();
    v13 = v12;
LABEL_18:

    goto LABEL_19;
  }
  if ((unint64_t)objc_msgSend(v9, "count") >= 2)
  {
    v14 = os_log_create("com.apple.notes", "Accounts");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
      -[NoteContext setUpLocalAccountAndStore].cold.1(v9, (char *)v14);

    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    v12 = v9;
    v15 = -[NSObject countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
    if (v15)
    {
      v16 = v15;
      v17 = 0;
      v18 = *(_QWORD *)v31;
      do
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v31 != v18)
            objc_enumerationMutation(v12);
          if ((v17 & 1) != 0)
            -[NoteContext forceDeleteAccount:](self, "forceDeleteAccount:", *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * i));
          v17 = 1;
        }
        v16 = -[NSObject countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
      }
      while (v16);
    }

    -[NoteContext managedObjectContext](self, "managedObjectContext");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = 0;
    objc_msgSend(v13, "executeFetchRequest:error:", v3, &v29);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v29;
    goto LABEL_18;
  }
  v10 = 0;
  v11 = 0;
LABEL_19:
  p_localAccount = (id *)&self->_localAccount;
  localAccount = self->_localAccount;
  self->_localAccount = 0;

  p_localStore = &self->_localStore;
  localStore = self->_localStore;
  self->_localStore = 0;

  if (objc_msgSend(v9, "count"))
  {
    objc_msgSend(v9, "lastObject");
    v24 = objc_claimAutoreleasedReturnValue();
    v25 = *p_localAccount;
    *p_localAccount = (id)v24;

    objc_msgSend(*p_localAccount, "defaultStore");
    v26 = objc_claimAutoreleasedReturnValue();
    v27 = *p_localStore;
    *p_localStore = (NoteStoreObject *)v26;

  }
  else
  {
    -[NoteContext _createLocalAccount:andStore:](self, "_createLocalAccount:andStore:", &self->_localAccount, &self->_localStore);
    v11 = 1;
  }

  return v11;
}

- (BOOL)setUpLastIndexTid
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  BOOL v11;
  NSObject *v12;
  unint64_t v14;
  BOOL v15;
  NSObject *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  char v20;
  uint64_t v21;
  uint64_t i;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  BOOL v28;
  BOOL v29;
  id v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  id v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C97B48]);
  v4 = (void *)MEMORY[0x1E0C97B20];
  -[NoteContext managedObjectContext](self, "managedObjectContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "entityForName:inManagedObjectContext:", CFSTR("Property"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "setEntity:", v6);
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("propertyKey == %@"), CFSTR("LastTransactionID"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setPredicate:", v7);
  -[NoteContext managedObjectContext](self, "managedObjectContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = 0;
  objc_msgSend(v8, "executeFetchRequest:error:", v3, &v35);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v35;

  v11 = v10 == 0;
  if (v10)
  {
    v12 = os_log_create("com.apple.notes", "HTML");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
      -[NoteContext setUpLastIndexTid].cold.2();

  }
  else
  {
    v14 = objc_msgSend(v9, "count");
    v15 = v14 > 1;
    if (v14 >= 2)
    {
      v28 = v14 > 1;
      v29 = v10 == 0;
      v16 = os_log_create("com.apple.notes", "HTML");
      if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
        -[NoteContext setUpLastIndexTid].cold.1(v9, (char *)v16);

      v33 = 0u;
      v34 = 0u;
      v31 = 0u;
      v32 = 0u;
      v17 = v9;
      v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
      if (v18)
      {
        v19 = v18;
        v20 = 0;
        v21 = *(_QWORD *)v32;
        do
        {
          for (i = 0; i != v19; ++i)
          {
            if (*(_QWORD *)v32 != v21)
              objc_enumerationMutation(v17);
            if ((v20 & 1) != 0)
            {
              v23 = *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * i);
              -[NoteContext managedObjectContext](self, "managedObjectContext");
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v24, "deleteObject:", v23);

            }
            v20 = 1;
          }
          v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
        }
        while (v19);
      }

      -[NoteContext managedObjectContext](self, "managedObjectContext");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = 0;
      objc_msgSend(v25, "executeFetchRequest:error:", v3, &v30);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v30;

      if (v10)
      {
        v11 = 1;
        goto LABEL_6;
      }
      v15 = v28;
      v11 = v29;
    }
    if (objc_msgSend(v9, "count"))
    {
      v10 = 0;
      v11 = v15;
      goto LABEL_6;
    }
    v26 = (void *)MEMORY[0x1E0C97B20];
    -[NoteContext managedObjectContext](self, "managedObjectContext");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "insertNewObjectForEntityForName:inManagedObjectContext:", CFSTR("Property"), v27);
    v12 = objc_claimAutoreleasedReturnValue();

    -[NSObject setPropertyKey:](v12, "setPropertyKey:", CFSTR("LastTransactionID"));
    v10 = 0;
  }

LABEL_6:
  return v11;
}

- (void)forceSetUpUniqueObjects
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  objc_msgSend((id)objc_opt_class(), "persistentStoreCoordinator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "urlForPersistentStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "persistentStoreForURL:", v4);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "metadata");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKey:", v7, CFSTR("LocalAccountAndStoreAlreadySetUp"));

  objc_msgSend(v8, "setMetadata:", v6);
  -[NoteContext setUpUniqueObjects](self, "setUpUniqueObjects");

}

+ (void)removeSqliteAndIdxFiles
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_17(&dword_1C88D8000, v0, v1, "Can't remove sqlite and idx files: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_9();
}

- (NoteContext)init
{
  void *v3;
  NoteContext *v4;

  +[AccountUtilities sharedAccountUtilities](AccountUtilities, "sharedAccountUtilities");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[NoteContext initWithAccountUtilities:inMigrator:](self, "initWithAccountUtilities:inMigrator:", v3, 0);

  return v4;
}

- (id)initForMigrator
{
  void *v3;
  NoteContext *v4;

  +[AccountUtilities sharedAccountUtilities](AccountUtilities, "sharedAccountUtilities");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[NoteContext initWithAccountUtilities:inMigrator:](self, "initWithAccountUtilities:inMigrator:", v3, 1);

  return v4;
}

- (NoteContext)initWithPrivateQueue:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  NoteContext *v6;

  v3 = a3;
  +[AccountUtilities sharedAccountUtilities](AccountUtilities, "sharedAccountUtilities");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[NoteContext initWithAccountUtilities:inMigrator:isMainContext:usePrivateQueue:](self, "initWithAccountUtilities:inMigrator:isMainContext:usePrivateQueue:", v5, 0, 0, v3);

  return v6;
}

- (id)visibleNotesPredicate
{
  return (id)objc_msgSend((id)objc_opt_class(), "visibleNotesPredicate");
}

+ (id)visibleNotesPredicate
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x1E0CB3880];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "predicateWithFormat:", CFSTR("((deletedFlag == %@) AND (body.content != nil) AND (isBookkeepingEntry == %@))"), v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)visibleNotesIncludingEmptyBodyContentPredicate
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x1E0CB3880];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "predicateWithFormat:", CFSTR("((deletedFlag == %@) AND (isBookkeepingEntry == %@))"), v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)liveNotesNeedingBodiesPredicate
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB3880];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "predicateWithFormat:", CFSTR("((body.content = nil) AND (isBookkeepingEntry == %@))"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)newFRCForCollection:(id)a3 delegate:(id)a4
{
  return -[NoteContext newFRCForCollection:delegate:performFetch:](self, "newFRCForCollection:delegate:performFetch:", a3, a4, 1);
}

- (id)newFRCForCollection:(id)a3 delegate:(id)a4 performFetch:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  id v10;
  void *v11;
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
  id v22;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  v10 = -[NoteContext newFetchRequestForNotes](self, "newFetchRequestForNotes");
  v11 = (void *)MEMORY[0x1E0CB3528];
  v12 = (void *)MEMORY[0x1E0C99D20];
  if (v8)
  {
    objc_msgSend(v8, "predicateForNotes");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[NoteContext visibleNotesPredicate](self, "visibleNotesPredicate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "arrayWithObjects:", v13, v14, 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "andPredicateWithSubpredicates:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("store != nil"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[NoteContext visibleNotesPredicate](self, "visibleNotesPredicate");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "arrayWithObjects:", v17, v18, 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "andPredicateWithSubpredicates:", v19);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "sortDescriptors");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v20, "mutableCopy");

    objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("store.name"), 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "ic_addNonNilObject:", v21);

    objc_msgSend(v10, "setSortDescriptors:", v13);
  }

  objc_msgSend(v10, "setPredicate:", v16);
  objc_msgSend(v10, "setFetchBatchSize:", 100);
  v22 = -[NoteContext newFRCForFetchRequest:delegate:performFetch:](self, "newFRCForFetchRequest:delegate:performFetch:", v10, v9, v5);

  return v22;
}

- (id)newFetchRequestForNotes
{
  return (id)objc_msgSend((id)objc_opt_class(), "newFetchRequestForNotes");
}

+ (NSFetchRequest)newFetchRequestForNotes
{
  NSFetchRequest *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0C97B48], "fetchRequestWithEntityName:", CFSTR("Note"));
  v3 = (NSFetchRequest *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "defaultNotesSortDescriptors");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSFetchRequest setSortDescriptors:](v3, "setSortDescriptors:", v4);

  return v3;
}

- (void)clearCaches
{
  objc_msgSend(MEMORY[0x1E0C97B68], "deleteCacheWithName:", 0);
}

- (void)sortNotes:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  objc_msgSend((id)objc_opt_class(), "defaultNotesSortDescriptors");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sortUsingDescriptors:", v4);

}

- (void)batchFaultNotes:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  id v11;

  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C97B48]), "initWithEntityName:", CFSTR("Note"));
    objc_msgSend(v5, "setReturnsObjectsAsFaults:", 0);
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("self IN %@"), v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setPredicate:", v6);

    -[NoteContext managedObjectContext](self, "managedObjectContext");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 0;
    objc_msgSend(v7, "executeFetchRequest:error:", v5, &v11);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v11;

    if (!v8)
    {
      v10 = os_log_create("com.apple.notes", "HTML");
      if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
        -[NoteContext batchFaultNotes:].cold.1();

    }
  }

}

- (id)newlyAddedNote
{
  void *v3;
  void *v4;

  +[NoteContext generateGUID](NoteContext, "generateGUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NoteContext newlyAddedNoteWithGUID:](self, "newlyAddedNoteWithGUID:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)newlyAddedNoteWithGUID:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = (void *)MEMORY[0x1E0C97B20];
  v5 = a3;
  -[NoteContext managedObjectContext](self, "managedObjectContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "insertNewObjectForEntityForName:inManagedObjectContext:", CFSTR("Note"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)MEMORY[0x1E0C97B20];
  -[NoteContext managedObjectContext](self, "managedObjectContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "insertNewObjectForEntityForName:inManagedObjectContext:", CFSTR("NoteBody"), v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setBody:", v10);

  -[NoteContext nextIndex](self, "nextIndex");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setIntegerId:", v11);

  objc_msgSend(v7, "setGuid:", v5);
  return v7;
}

- (id)newlyCreatedNoteFromDefaultStore
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[NoteContext newlyAddedNote](self, "newlyAddedNote");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setCreationDate:", v4);

  objc_msgSend(MEMORY[0x1E0C99D68], "ic_modificationDateForNoteBeingEdited");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setModificationDate:", v5);

  objc_msgSend(v3, "setContent:", &stru_1E81EB410);
  objc_msgSend(v3, "setTitle:", 0);
  -[NoteContext defaultStoreForNewNote](self, "defaultStoreForNewNote");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setStore:", v6);

  return v3;
}

- (id)newlyAddedAttachment
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_opt_class();
  -[NoteContext managedObjectContext](self, "managedObjectContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "newlyAddedAttachmentInContext:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)newlyAddedAttachmentInContext:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0C97B20], "insertNewObjectForEntityForName:inManagedObjectContext:", CFSTR("NoteAttachment"), a3);
}

- (id)collectionForObjectID:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  if (a3)
  {
    v4 = a3;
    -[NoteContext managedObjectContext](self, "managedObjectContext");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "existingObjectWithID:error:", v4, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (id)storeForObjectID:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  if (a3)
  {
    v4 = a3;
    -[NoteContext managedObjectContext](self, "managedObjectContext");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "existingObjectWithID:error:", v4, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (void)deleteNote:(id)a3
{
  id v4;
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
  char v15;
  NSObject *v16;
  void *v17;

  v4 = a3;
  objc_msgSend(v4, "objectID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[NoteContext managedObjectContext](self, "managedObjectContext");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "existingObjectWithID:error:", v5, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_msgSend(v4, "isInserted") & 1) == 0)
    {
      if (v7)
      {
        objc_msgSend(v7, "store");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "objectID");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[NoteContext storeForObjectID:](self, "storeForObjectID:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        if (v10)
        {
          -[NoteContext managedObjectContext](self, "managedObjectContext");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "account");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "objectID");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "existingObjectWithID:error:", v13, 0);
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          if (v14)
          {
            v15 = objc_msgSend(v14, "shouldMarkNotesAsDeleted");

            if ((v15 & 1) != 0)
            {
              objc_msgSend(v4, "markForDeletion");
LABEL_13:

              goto LABEL_14;
            }
          }
          else
          {
            -[NoteContext managedObjectContext](self, "managedObjectContext");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "deleteObject:", v10);

          }
        }
      }
    }
    -[NoteContext deleteNoteRegardlessOfConstraints:](self, "deleteNoteRegardlessOfConstraints:", v4);
    goto LABEL_13;
  }
  v16 = os_log_create("com.apple.notes", "HTML");
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    -[NoteContext deleteNote:].cold.1();

LABEL_14:
}

- (void)deleteNoteRegardlessOfConstraints:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[NoteContext managedObjectContext](self, "managedObjectContext");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "deleteObject:", v4);

}

- (void)deleteChanges:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v8);
        -[NoteContext managedObjectContext](self, "managedObjectContext");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "deleteObject:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

}

- (void)invalidate
{
  NoteStoreObject *localStore;
  NoteAccountObject *localAccount;
  NSMutableDictionary *notePropertyObjectsRealized;
  id v6;

  localStore = self->_localStore;
  self->_localStore = 0;

  localAccount = self->_localAccount;
  self->_localAccount = 0;

  notePropertyObjectsRealized = self->_notePropertyObjectsRealized;
  self->_notePropertyObjectsRealized = 0;

  -[NoteContext managedObjectContext](self, "managedObjectContext");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "reset");

}

- (BOOL)saveSilently:(id *)a3
{
  NSObject *v5;
  void *v6;
  char v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  id v12;

  v5 = os_log_create("com.apple.notes", "CoreData");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[NoteContext saveSilently:].cold.3();

  -[NoteContext managedObjectContext](self, "managedObjectContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0;
  v7 = objc_msgSend(v6, "save:", &v12);
  v8 = v12;

  if ((v7 & 1) == 0)
  {
    v9 = os_log_create("com.apple.notes", "CoreData");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      -[NoteContext saveSilently:].cold.2();

    if (+[NoteContext databaseIsCorrupt:](NoteContext, "databaseIsCorrupt:", v8))
    {
      v10 = os_log_create("com.apple.notes", "CoreData");
      if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
        -[NoteContext saveSilently:].cold.1();

    }
  }
  if (a3)
    *a3 = objc_retainAutorelease(v8);

  return v7;
}

- (id)allVisibleNotes
{
  return -[NoteContext allVisibleNotesMatchingPredicate:](self, "allVisibleNotesMatchingPredicate:", 0);
}

- (unint64_t)countOfVisibleNotes
{
  return -[NoteContext countOfVisibleNotesMatchingPredicate:](self, "countOfVisibleNotesMatchingPredicate:", 0);
}

- (id)allVisibleNotesInCollection:(id)a3
{
  return -[NoteContext allVisibleNotesInCollection:sorted:](self, "allVisibleNotesInCollection:sorted:", a3, 0);
}

- (id)allVisibleNotesInCollection:(id)a3 sorted:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  void *v7;

  v4 = a4;
  objc_msgSend(a3, "predicateForNotes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NoteContext allVisibleNotesMatchingPredicate:sorted:](self, "allVisibleNotesMatchingPredicate:sorted:", v6, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (unint64_t)countOfVisibleNotesInCollection:(id)a3
{
  void *v4;
  unint64_t v5;

  objc_msgSend(a3, "predicateForNotes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[NoteContext countOfVisibleNotesMatchingPredicate:](self, "countOfVisibleNotesMatchingPredicate:", v4);

  return v5;
}

+ (unint64_t)countOfVisibleNotesInCollectionIncludingNotesWithoutBodyContent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unint64_t v7;

  v4 = a3;
  objc_msgSend(v4, "predicateForNotes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "managedObjectContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(a1, "countOfVisibleNotesMatchingPredicate:includingNoteWithoutBodyContent:context:", v5, 1, v6);
  return v7;
}

+ (unint64_t)countOfVisibleNotesInCollection:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unint64_t v7;

  v4 = a3;
  objc_msgSend(v4, "predicateForNotes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "managedObjectContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(a1, "countOfVisibleNotesMatchingPredicate:context:", v5, v6);
  return v7;
}

- (id)allVisibleNotesMatchingPredicate:(id)a3
{
  return -[NoteContext allVisibleNotesMatchingPredicate:sorted:](self, "allVisibleNotesMatchingPredicate:sorted:", a3, 0);
}

- (id)allVisibleNotesMatchingPredicate:(id)a3 sorted:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a4;
  v6 = a3;
  v7 = (void *)objc_opt_class();
  -[NoteContext managedObjectContext](self, "managedObjectContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "allVisibleNotesMatchingPredicate:sorted:context:", v6, v4, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)allVisibleNotesMatchingPredicate:(id)a3 context:(id)a4
{
  return (id)objc_msgSend(a1, "allVisibleNotesMatchingPredicate:sorted:context:", a3, 0, a4);
}

+ (id)allVisibleNotesMatchingPredicate:(id)a3 sorted:(BOOL)a4 context:(id)a5
{
  _BOOL8 v5;
  id v7;
  id v8;
  void *v9;

  v5 = a4;
  v7 = a5;
  v8 = a3;
  objc_msgSend((id)objc_opt_class(), "allVisibleNotesMatchingPredicate:sorted:context:fetchLimit:", v8, v5, v7, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)allVisibleNotesMatchingPredicate:(id)a3 sorted:(BOOL)a4 context:(id)a5 fetchLimit:(unint64_t)a6
{
  _BOOL4 v8;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  v8 = a4;
  v10 = a3;
  v11 = a5;
  if (v10)
  {
    v12 = (void *)MEMORY[0x1E0CB3528];
    v13 = (void *)MEMORY[0x1E0C99D20];
    objc_msgSend(a1, "visibleNotesPredicate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "arrayWithObjects:", v14, v10, 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "andPredicateWithSubpredicates:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(a1, "visibleNotesPredicate");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v17 = (void *)objc_msgSend(a1, "newFetchRequestForNotes");
  objc_msgSend(v17, "setPredicate:", v16);
  if (v8)
  {
    objc_msgSend(a1, "defaultNotesSortDescriptors");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setSortDescriptors:", v18);

  }
  if (a6)
    objc_msgSend(v17, "setFetchLimit:", a6);
  objc_msgSend(v11, "executeFetchRequest:error:", v17, 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

- (unint64_t)countOfVisibleNotesMatchingPredicate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unint64_t v7;

  v4 = a3;
  v5 = (void *)objc_opt_class();
  -[NoteContext managedObjectContext](self, "managedObjectContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "countOfVisibleNotesMatchingPredicate:context:", v4, v6);

  return v7;
}

+ (unint64_t)countOfVisibleNotesMatchingPredicate:(id)a3 context:(id)a4
{
  return objc_msgSend(a1, "countOfVisibleNotesMatchingPredicate:includingNoteWithoutBodyContent:context:", a3, 0, a4);
}

+ (unint64_t)countOfVisibleNotesMatchingPredicate:(id)a3 includingNoteWithoutBodyContent:(BOOL)a4 context:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  uint64_t v16;
  unint64_t v17;

  v8 = a3;
  v9 = a5;
  if (a4)
    objc_msgSend(a1, "visibleNotesIncludingEmptyBodyContentPredicate");
  else
    objc_msgSend(a1, "visibleNotesPredicate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v8)
  {
    v12 = (void *)MEMORY[0x1E0CB3528];
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", v10, v8, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "andPredicateWithSubpredicates:", v13);
    v14 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v14 = v10;
  }
  v15 = (void *)objc_msgSend(a1, "newFetchRequestForNotes");
  objc_msgSend(v15, "setPredicate:", v14);
  v16 = objc_msgSend(v9, "countForFetchRequest:error:", v15, 0);
  if (v16 == 0x7FFFFFFFFFFFFFFFLL)
    v17 = 0;
  else
    v17 = v16;

  return v17;
}

- (id)visibleNoteForObjectID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;

  if (a3)
  {
    v4 = a3;
    objc_opt_class();
    -[NoteContext managedObjectContext](self, "managedObjectContext");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "existingObjectWithID:error:", v4, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    ICCheckedDynamicCast();
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = 0;
    if ((objc_msgSend(v7, "isMarkedForDeletion") & 1) == 0)
    {
      objc_msgSend(v7, "body");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "content");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (v10)
        v8 = v7;
      else
        v8 = 0;
    }

  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (id)visibleNotesForIntegerIds:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  NSObject *v15;
  id v17;

  v4 = a3;
  v5 = -[NoteContext newFetchRequestForNotes](self, "newFetchRequestForNotes");
  v6 = (void *)MEMORY[0x1E0CB3528];
  v7 = (void *)MEMORY[0x1E0C99D20];
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("(integerId IN %@)"), v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[NoteContext visibleNotesPredicate](self, "visibleNotesPredicate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "arrayWithObjects:", v8, v9, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "andPredicateWithSubpredicates:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setPredicate:", v11);
  -[NoteContext managedObjectContext](self, "managedObjectContext");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0;
  objc_msgSend(v12, "executeFetchRequest:error:", v5, &v17);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v17;

  if (v14)
  {
    v15 = os_log_create("com.apple.notes", "HTML");
    if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
      -[NoteContext visibleNotesForIntegerIds:].cold.1();

  }
  return v13;
}

- (id)mostRecentlyModifiedNoteInCollection:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  objc_msgSend(a3, "predicateForNotes");
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)v4;
    v6 = (void *)MEMORY[0x1E0CB3528];
    v7 = (void *)MEMORY[0x1E0C99D20];
    -[NoteContext visibleNotesPredicate](self, "visibleNotesPredicate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "arrayWithObjects:", v8, v5, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "andPredicateWithSubpredicates:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[NoteContext visibleNotesPredicate](self, "visibleNotesPredicate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v11 = -[NoteContext newFetchRequestForNotes](self, "newFetchRequestForNotes");
  objc_msgSend(v11, "setPredicate:", v10);
  objc_msgSend((id)objc_opt_class(), "defaultNotesSortDescriptors");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setSortDescriptors:", v12);

  objc_msgSend(v11, "setFetchLimit:", 1);
  -[NoteContext managedObjectContext](self, "managedObjectContext");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "executeFetchRequest:error:", v11, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "lastObject");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (id)allNotes
{
  id v3;
  void *v4;
  void *v5;

  v3 = -[NoteContext newFetchRequestForNotes](self, "newFetchRequestForNotes");
  -[NoteContext managedObjectContext](self, "managedObjectContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "executeFetchRequest:error:", v3, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (unint64_t)countOfNotes
{
  id v3;
  void *v4;
  uint64_t v5;
  unint64_t v6;

  v3 = -[NoteContext newFetchRequestForNotes](self, "newFetchRequestForNotes");
  -[NoteContext managedObjectContext](self, "managedObjectContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countForFetchRequest:error:", v3, 0);

  if (v5 == 0x7FFFFFFFFFFFFFFFLL)
    v6 = 0;
  else
    v6 = v5;

  return v6;
}

- (id)allNotesInCollection:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(a3, "predicateForNotes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NoteContext allNotesMatchingPredicate:](self, "allNotesMatchingPredicate:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (unint64_t)countOfNotesInCollection:(id)a3
{
  void *v4;
  unint64_t v5;

  objc_msgSend(a3, "predicateForNotes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[NoteContext countOfNotesMatchingPredicate:](self, "countOfNotesMatchingPredicate:", v4);

  return v5;
}

- (id)allNotesMatchingPredicate:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = -[NoteContext newFetchRequestForNotes](self, "newFetchRequestForNotes");
  objc_msgSend(v5, "setPredicate:", v4);

  -[NoteContext managedObjectContext](self, "managedObjectContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "executeFetchRequest:error:", v5, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (unint64_t)countOfNotesMatchingPredicate:(id)a3
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  unint64_t v8;

  v4 = a3;
  v5 = -[NoteContext newFetchRequestForNotes](self, "newFetchRequestForNotes");
  objc_msgSend(v5, "setPredicate:", v4);

  -[NoteContext managedObjectContext](self, "managedObjectContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countForFetchRequest:error:", v5, 0);

  if (v7 == 0x7FFFFFFFFFFFFFFFLL)
    v8 = 0;
  else
    v8 = v7;

  return v8;
}

- (id)noteForObjectID:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  if (a3)
  {
    v4 = a3;
    -[NoteContext managedObjectContext](self, "managedObjectContext");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "existingObjectWithID:error:", v4, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (id)notesForIntegerIds:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  id v12;

  v4 = a3;
  v5 = -[NoteContext newFetchRequestForNotes](self, "newFetchRequestForNotes");
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("(integerId IN %@)"), v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setPredicate:", v6);
  -[NoteContext managedObjectContext](self, "managedObjectContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0;
  objc_msgSend(v7, "executeFetchRequest:error:", v5, &v12);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v12;

  if (v9)
  {
    v10 = os_log_create("com.apple.notes", "HTML");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
      -[NoteContext visibleNotesForIntegerIds:].cold.1();

  }
  return v8;
}

- (id)noteForGUID:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  id v13;

  v4 = a3;
  v5 = -[NoteContext newFetchRequestForNotes](self, "newFetchRequestForNotes");
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("(guid ==[c] %@)"), v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPredicate:", v6);
  -[NoteContext managedObjectContext](self, "managedObjectContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0;
  objc_msgSend(v7, "executeFetchRequest:error:", v5, &v13);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v13;

  if (v9)
  {
    v10 = os_log_create("com.apple.notes", "HTML");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
      -[NoteContext noteForGUID:].cold.1();

  }
  objc_msgSend(v8, "firstObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)storeForExternalIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  id v13;

  v4 = a3;
  v5 = (void *)objc_msgSend((id)objc_opt_class(), "newFetchRequestForStores");
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("(externalIdentifier == %@)"), v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPredicate:", v6);
  -[NoteContext managedObjectContext](self, "managedObjectContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0;
  objc_msgSend(v7, "executeFetchRequest:error:", v5, &v13);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v13;

  if (v9)
  {
    v10 = os_log_create("com.apple.notes", "HTML");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
      -[NoteContext storeForExternalIdentifier:].cold.1();

  }
  objc_msgSend(v8, "firstObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)allNotesWithoutBodiesInCollection:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  NSObject *v15;
  id v17;

  v4 = a3;
  v5 = -[NoteContext newFetchRequestForNotes](self, "newFetchRequestForNotes");
  if (v4)
  {
    v6 = (void *)MEMORY[0x1E0CB3528];
    v7 = (void *)MEMORY[0x1E0C99D20];
    objc_msgSend(v4, "predicateForNotes");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NoteContext liveNotesNeedingBodiesPredicate](self, "liveNotesNeedingBodiesPredicate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "arrayWithObjects:", v8, v9, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "andPredicateWithSubpredicates:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[NoteContext liveNotesNeedingBodiesPredicate](self, "liveNotesNeedingBodiesPredicate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v5, "setPredicate:", v11);
  -[NoteContext managedObjectContext](self, "managedObjectContext");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0;
  objc_msgSend(v12, "executeFetchRequest:error:", v5, &v17);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v17;

  if (v14)
  {
    v15 = os_log_create("com.apple.notes", "HTML");
    if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
      -[NoteContext visibleNotesForIntegerIds:].cold.1();

  }
  return v13;
}

- (id)collectionForInfo:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  id v10;
  void *v11;

  v4 = a3;
  v5 = v4;
  if (v4
    && (objc_msgSend(v4, "objectForKey:", CFSTR("NoteCollectionPrimaryIdentifier")),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        -[NoteContext accountForAccountId:](self, "accountForAccountId:", v6),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v6,
        v7))
  {
    objc_msgSend(v5, "objectForKey:", CFSTR("NoteCollectionType"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("Account"));

    if (v9)
    {
      v10 = v7;
    }
    else
    {
      objc_msgSend(v5, "objectForKey:", CFSTR("NoteCollectionSecondaryIdentifier"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "storeForExternalId:", v11);
      v10 = (id)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)newlyAddedStore
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0C97B20];
  -[NoteContext managedObjectContext](self, "managedObjectContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "insertNewObjectForEntityForName:inManagedObjectContext:", CFSTR("Store"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)allStores
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  id v11;
  NSObject *v12;
  void *v13;
  NSObject *v15;
  uint64_t v16;
  id v17;
  id v18;

  v3 = objc_alloc_init(MEMORY[0x1E0C97B48]);
  v4 = (void *)MEMORY[0x1E0C97B20];
  -[NoteContext managedObjectContext](self, "managedObjectContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "entityForName:inManagedObjectContext:", CFSTR("Store"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setEntity:", v6);

  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3928]), "initWithKey:ascending:", CFSTR("name"), 1);
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setSortDescriptors:", v8);

  -[NoteContext managedObjectContext](self, "managedObjectContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0;
  objc_msgSend(v9, "executeFetchRequest:error:", v3, &v18);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v18;

  if (v11)
  {
    v12 = os_log_create("com.apple.notes", "HTML");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
      -[NoteContext allStores].cold.2();
    v13 = v12;
  }
  else
  {
    if (-[NSObject count](v10, "count"))
      goto LABEL_7;
    v15 = os_log_create("com.apple.notes", "HTML");
    if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
      -[NoteContext allStores].cold.1();

    -[NoteContext forceSetUpUniqueObjects](self, "forceSetUpUniqueObjects");
    -[NoteContext managedObjectContext](self, "managedObjectContext");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 0;
    objc_msgSend(v13, "executeFetchRequest:error:", v3, &v17);
    v16 = objc_claimAutoreleasedReturnValue();
    v11 = v17;
    v12 = v10;
    v10 = v16;
  }

LABEL_7:
  return v10;
}

- (id)storesInCollection:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  -[NoteContext allStores](self, "allStores");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __34__NoteContext_storesInCollection___block_invoke;
  v9[3] = &unk_1E81EABB8;
  v10 = v4;
  v6 = v4;
  objc_msgSend(v5, "ic_objectsPassingTest:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

BOOL __34__NoteContext_storesInCollection___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  char isKindOfClass;
  void *v5;
  void *v6;
  _BOOL8 v7;

  v3 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  objc_msgSend(v3, "parentStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if ((isKindOfClass & 1) != 0)
    v6 = 0;
  else
    v6 = *(void **)(a1 + 32);
  v7 = v5 == v6;

  return v7;
}

- (id)faultedInStoresForAccounts:(id)a3
{
  objc_class *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  NSObject *v12;
  id v14;

  v4 = (objc_class *)MEMORY[0x1E0C97B48];
  v5 = a3;
  v6 = (void *)objc_msgSend([v4 alloc], "initWithEntityName:", CFSTR("Store"));
  objc_msgSend(v6, "setReturnsObjectsAsFaults:", 0);
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K IN %@"), CFSTR("account"), v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setPredicate:", v7);
  -[NoteContext managedObjectContext](self, "managedObjectContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0;
  objc_msgSend(v8, "executeFetchRequest:error:", v6, &v14);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v14;

  if (v9)
  {
    v11 = v9;
  }
  else
  {
    v12 = os_log_create("com.apple.notes", "HTML");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
      -[NoteContext faultedInStoresForAccounts:].cold.1();

  }
  return v9;
}

- (unint64_t)countOfStores
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  NSObject *v10;
  unint64_t v11;
  NSObject *v13;
  id v14;
  id v15;

  v3 = objc_alloc_init(MEMORY[0x1E0C97B48]);
  v4 = (void *)MEMORY[0x1E0C97B20];
  -[NoteContext managedObjectContext](self, "managedObjectContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "entityForName:inManagedObjectContext:", CFSTR("Store"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setEntity:", v6);

  -[NoteContext managedObjectContext](self, "managedObjectContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0;
  v8 = objc_msgSend(v7, "countForFetchRequest:error:", v3, &v15);
  v9 = v15;

  if (v9)
  {
    v10 = os_log_create("com.apple.notes", "HTML");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
      -[NoteContext allStores].cold.2();

LABEL_5:
    goto LABEL_7;
  }
  if (!v8)
  {
    v13 = os_log_create("com.apple.notes", "HTML");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
      -[NoteContext countOfStores].cold.1();

    -[NoteContext forceSetUpUniqueObjects](self, "forceSetUpUniqueObjects");
    -[NoteContext managedObjectContext](self, "managedObjectContext");
    v10 = objc_claimAutoreleasedReturnValue();
    v14 = 0;
    v8 = -[NSObject countForFetchRequest:error:](v10, "countForFetchRequest:error:", v3, &v14);
    v9 = v14;
    goto LABEL_5;
  }
LABEL_7:
  if (v8 == 0x7FFFFFFFFFFFFFFFLL)
    v11 = 0;
  else
    v11 = v8;

  return v11;
}

- (id)newlyAddedAccount
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0C97B20];
  -[NoteContext managedObjectContext](self, "managedObjectContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "insertNewObjectForEntityForName:inManagedObjectContext:", CFSTR("Account"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)accountForAccountId:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  void *v14;
  id v16;

  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C97B48]);
  v6 = (void *)MEMORY[0x1E0C97B20];
  -[NoteContext managedObjectContext](self, "managedObjectContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "entityForName:inManagedObjectContext:", CFSTR("Account"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setEntity:", v8);

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("accountIdentifier == %@"), v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPredicate:", v9);

  -[NoteContext managedObjectContext](self, "managedObjectContext");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0;
  objc_msgSend(v10, "executeFetchRequest:error:", v5, &v16);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v16;

  if (v12)
  {
    v13 = os_log_create("com.apple.notes", "HTML");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
      -[NoteContext accountForAccountId:].cold.1();

  }
  objc_msgSend(v11, "lastObject");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (id)defaultStoreForNewNote
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  CFPreferencesAppSynchronize(CFSTR("com.apple.mobilenotes"));
  v3 = (void *)CFPreferencesCopyAppValue(CFSTR("DefaultNotesAccount"), CFSTR("com.apple.mobilenotes"));
  -[NoteContext accountUtilities](self, "accountUtilities");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "defaultStoreSyncIdWithDesiredSyncId:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[NoteContext accountForAccountId:](self, "accountForAccountId:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6 && !objc_msgSend(v6, "didChooseToMigrate"))
  {
LABEL_13:
    objc_msgSend(v7, "defaultStore");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_15;
  }

  -[NoteContext allAccounts](self, "allAccounts");
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v17;
LABEL_5:
    v12 = 0;
    while (1)
    {
      if (*(_QWORD *)v17 != v11)
        objc_enumerationMutation(v8);
      v13 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * v12);
      if (!objc_msgSend(v13, "didChooseToMigrate", (_QWORD)v16))
        break;
      if (v10 == ++v12)
      {
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
        if (v10)
          goto LABEL_5;
        goto LABEL_11;
      }
    }
    v7 = v13;

    if (!v7)
      goto LABEL_14;
    goto LABEL_13;
  }
LABEL_11:

LABEL_14:
  -[NoteContext localStore](self, "localStore", (_QWORD)v16);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_15:

  return v14;
}

- (id)localStore
{
  NoteStoreObject *localStore;
  void *v4;
  NoteStoreObject *v5;
  NoteStoreObject *v6;

  localStore = self->_localStore;
  if (!localStore)
  {
    -[NoteContext localAccount](self, "localAccount");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "defaultStore");
    v5 = (NoteStoreObject *)objc_claimAutoreleasedReturnValue();
    v6 = self->_localStore;
    self->_localStore = v5;

    localStore = self->_localStore;
  }
  return localStore;
}

- (id)localAccount
{
  NoteAccountObject *localAccount;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  NoteAccountObject *v13;
  NoteAccountObject *v14;
  NSObject *v15;
  id v17;

  localAccount = self->_localAccount;
  if (!localAccount)
  {
    v4 = objc_alloc_init(MEMORY[0x1E0C97B48]);
    v5 = (void *)MEMORY[0x1E0C97B20];
    -[NoteContext managedObjectContext](self, "managedObjectContext");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "entityForName:inManagedObjectContext:", CFSTR("Account"), v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "setEntity:", v7);
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("accountIdentifier == %@"), CFSTR("local://local/account"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setPredicate:", v8);
    -[NoteContext managedObjectContext](self, "managedObjectContext");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 0;
    objc_msgSend(v9, "executeFetchRequest:error:", v4, &v17);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v17;

    if (v11)
    {
      v12 = os_log_create("com.apple.notes", "HTML");
      if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
        -[NoteContext localAccount].cold.2();

    }
    else if (objc_msgSend(v10, "count") == 1)
    {
      objc_msgSend(v10, "lastObject");
      v13 = (NoteAccountObject *)objc_claimAutoreleasedReturnValue();
      v14 = self->_localAccount;
      self->_localAccount = v13;

    }
    else
    {
      v15 = os_log_create("com.apple.notes", "HTML");
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        -[NoteContext localAccount].cold.1(v10, (char *)v15);

      -[NoteContext forceSetUpUniqueObjects](self, "forceSetUpUniqueObjects");
    }

    localAccount = self->_localAccount;
  }
  return localAccount;
}

- (BOOL)forceDeleteAccount:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  NSObject *v18;
  char v19;
  NSObject *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  id v26;
  NSObject *v27;
  void *v28;
  void *v30;
  void *v31;
  NoteContext *v32;
  void *v33;
  void *v34;
  id obj;
  void *v36;
  id v37;
  id v38;
  id v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  id v44;
  uint8_t buf[4];
  id v46;
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C97B48]), "initWithEntityName:", CFSTR("NoteAttachment"));
  v34 = v4;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("note.store.account == %@"), v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPredicate:", v6);

  v33 = v5;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C97A90]), "initWithFetchRequest:", v5);
  objc_msgSend(v7, "setResultType:", 1);
  v32 = self;
  -[NoteContext managedObjectContext](self, "managedObjectContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = 0;
  v31 = v7;
  objc_msgSend(v8, "executeRequest:error:", v7, &v44);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v44;

  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  v30 = v9;
  objc_msgSend(v9, "result");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v47, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v41;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v41 != v13)
          objc_enumerationMutation(obj);
        v15 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * v14);
        v39 = v10;
        +[NoteAttachmentObject attachmentDirectoryURLForAttachmentObjectID:error:](NoteAttachmentObject, "attachmentDirectoryURLForAttachmentObjectID:error:", v15, &v39);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = v39;

        if (v17)
        {
          v18 = os_log_create("com.apple.notes", "HTML");
          if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = 138412290;
            v46 = v17;
            _os_log_fault_impl(&dword_1C88D8000, v18, OS_LOG_TYPE_FAULT, "Error getting file directory URL for attachment: %@", buf, 0xCu);
          }

        }
        if (v16)
        {
          v38 = v17;
          v19 = objc_msgSend(v36, "removeItemAtURL:error:", v16, &v38);
          v10 = v38;

          if ((v19 & 1) != 0)
            goto LABEL_18;
          v20 = os_log_create("com.apple.notes", "HTML");
          if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = 138412290;
            v46 = v10;
            _os_log_fault_impl(&dword_1C88D8000, v20, OS_LOG_TYPE_FAULT, "Error removing attachment file: %@", buf, 0xCu);
          }
        }
        else
        {
          v20 = os_log_create("com.apple.notes", "HTML");
          if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = 138412290;
            v46 = v15;
            _os_log_fault_impl(&dword_1C88D8000, v20, OS_LOG_TYPE_FAULT, "Failed to get attachment folder URL for object ID: %@", buf, 0xCu);
          }
          v10 = v17;
        }

LABEL_18:
        ++v14;
      }
      while (v12 != v14);
      v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v47, 16);
    }
    while (v12);
  }

  v21 = -[NoteContext newFetchRequestForNotes](v32, "newFetchRequestForNotes");
  objc_msgSend(v34, "predicateForNotes");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setPredicate:", v22);

  v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C97A90]), "initWithFetchRequest:", v21);
  -[NoteContext managedObjectContext](v32, "managedObjectContext");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = v10;
  v25 = (id)objc_msgSend(v24, "executeRequest:error:", v23, &v37);
  v26 = v37;

  if (v26)
  {
    v27 = os_log_create("com.apple.notes", "HTML");
    if (os_log_type_enabled(v27, OS_LOG_TYPE_FAULT))
      -[NoteContext forceDeleteAccount:].cold.1();

  }
  -[NoteContext managedObjectContext](v32, "managedObjectContext");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "deleteObject:", v34);

  return 1;
}

- (BOOL)deleteAccount:(id)a3
{
  id v4;
  id v5;
  BOOL v6;

  v4 = a3;
  -[NoteContext localAccount](self, "localAccount");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  v6 = v5 != v4 && -[NoteContext forceDeleteAccount:](self, "forceDeleteAccount:", v4);
  return v6;
}

- (BOOL)deleteStore:(id)a3
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[NoteContext localStore](self, "localStore");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 != v4)
  {
    -[NoteContext allNotesInCollection:](self, "allNotesInCollection:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v14;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v14 != v9)
            objc_enumerationMutation(v6);
          -[NoteContext deleteNoteRegardlessOfConstraints:](self, "deleteNoteRegardlessOfConstraints:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v10++));
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v8);
    }
    -[NoteContext managedObjectContext](self, "managedObjectContext");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "deleteObject:", v4);

  }
  return v5 != v4;
}

- (BOOL)shouldDisableLocalStore
{
  void *v3;
  BOOL v4;

  if (-[NoteContext countOfStores](self, "countOfStores") < 2)
    return 0;
  -[NoteContext localStore](self, "localStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[NoteContext countOfNotesInCollection:](self, "countOfNotesInCollection:", v3) == 0;

  return v4;
}

- (BOOL)hasMultipleEnabledStores
{
  unint64_t v3;
  BOOL v4;
  void *v5;

  v3 = -[NoteContext countOfStores](self, "countOfStores");
  if (v3 > 2)
    return 1;
  if (v3 != 2)
    return 0;
  -[NoteContext localStore](self, "localStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[NoteContext countOfNotesInCollection:](self, "countOfNotesInCollection:", v5) != 0;

  return v4;
}

- (id)_notePropertyObjectForKey:(id)a3
{
  id v4;
  NSMutableDictionary *notePropertyObjectsRealized;
  NSMutableDictionary *v6;
  NSMutableDictionary *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  NSObject *v19;
  id v21;

  v4 = a3;
  notePropertyObjectsRealized = self->_notePropertyObjectsRealized;
  if (!notePropertyObjectsRealized)
  {
    v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v7 = self->_notePropertyObjectsRealized;
    self->_notePropertyObjectsRealized = v6;

    notePropertyObjectsRealized = self->_notePropertyObjectsRealized;
  }
  -[NSMutableDictionary objectForKey:](notePropertyObjectsRealized, "objectForKey:", v4);
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
    -[NoteContext managedObjectContext](self, "managedObjectContext");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "refreshObject:mergeChanges:", v9, 1);

  }
  else
  {
    v11 = objc_alloc_init(MEMORY[0x1E0C97B48]);
    v12 = (void *)MEMORY[0x1E0C97B20];
    -[NoteContext managedObjectContext](self, "managedObjectContext");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "entityForName:inManagedObjectContext:", CFSTR("Property"), v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setEntity:", v14);

    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("propertyKey == %@"), v4);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setPredicate:", v15);
    objc_msgSend(v11, "setFetchLimit:", 1);
    -[NoteContext managedObjectContext](self, "managedObjectContext");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 0;
    objc_msgSend(v16, "executeFetchRequest:error:", v11, &v21);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v21;

    if (v18)
    {
      v19 = os_log_create("com.apple.notes", "HTML");
      if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
        -[NoteContext _notePropertyObjectForKey:].cold.1();

    }
    objc_msgSend(v17, "lastObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
      -[NSMutableDictionary setObject:forKey:](self->_notePropertyObjectsRealized, "setObject:forKey:", v9, v4);

  }
  return v9;
}

- (void)setPropertyValue:(id)a3 forKey:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  -[NoteContext _notePropertyObjectForKey:](self, "_notePropertyObjectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    v8 = (void *)MEMORY[0x1E0C97B20];
    -[NoteContext managedObjectContext](self, "managedObjectContext");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "insertNewObjectForEntityForName:inManagedObjectContext:", CFSTR("Property"), v9);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "setPropertyKey:", v6);
    -[NSMutableDictionary setObject:forKey:](self->_notePropertyObjectsRealized, "setObject:forKey:", v7, v6);
  }
  objc_msgSend(v7, "setPropertyValue:", v10);

}

- (id)propertyValueForKey:(id)a3
{
  void *v3;
  void *v4;

  -[NoteContext _notePropertyObjectForKey:](self, "_notePropertyObjectForKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "propertyValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)getNextIdObject
{
  void *v3;
  NSManagedObjectContext *v4;
  NSManagedObjectContext *nextIdContext;
  id v6;
  void *v7;
  NSManagedObjectContext *v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  unsigned int v29;
  unsigned int v30;
  uint64_t v31;
  void *v32;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  id v39;

  if (!self->_nextIdContext)
  {
    objc_msgSend((id)objc_opt_class(), "persistentStoreCoordinator");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      v4 = (NSManagedObjectContext *)objc_alloc_init(MEMORY[0x1E0C97B88]);
      nextIdContext = self->_nextIdContext;
      self->_nextIdContext = v4;

      -[NSManagedObjectContext setPersistentStoreCoordinator:](self->_nextIdContext, "setPersistentStoreCoordinator:", v3);
    }

  }
  v6 = objc_alloc_init(MEMORY[0x1E0C97B48]);
  objc_msgSend(MEMORY[0x1E0C97B20], "entityForName:inManagedObjectContext:", CFSTR("NextId"), self->_nextIdContext);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setEntity:", v7);
  v8 = self->_nextIdContext;
  v39 = 0;
  -[NSManagedObjectContext executeFetchRequest:error:](v8, "executeFetchRequest:error:", v6, &v39);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v39;
  if (v10)
  {
    v11 = os_log_create("com.apple.notes", "HTML");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
      -[NoteContext getNextIdObject].cold.2();

  }
  if (objc_msgSend(v9, "count"))
  {
    objc_msgSend(v9, "lastObject");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v10;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C97B20], "insertNewObjectForEntityForName:inManagedObjectContext:", CFSTR("NextId"), self->_nextIdContext);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_alloc_init(MEMORY[0x1E0C97B48]);
    v15 = (void *)MEMORY[0x1E0C97B20];
    -[NoteContext managedObjectContext](self, "managedObjectContext");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "entityForName:inManagedObjectContext:", CFSTR("Note"), v16);
    v17 = objc_claimAutoreleasedReturnValue();

    v36 = (void *)v17;
    objc_msgSend(v14, "setEntity:", v17);
    objc_msgSend(v14, "setResultType:", 2);
    objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForKeyPath:", CFSTR("integerId"));
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = (void *)MEMORY[0x1E0CB35D0];
    v35 = (void *)v18;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "expressionForFunction:arguments:", CFSTR("max:"), v20);
    v21 = objc_claimAutoreleasedReturnValue();

    v22 = objc_alloc_init(MEMORY[0x1E0C97B30]);
    objc_msgSend(v22, "setName:", CFSTR("maxId"));
    v34 = (void *)v21;
    objc_msgSend(v22, "setExpression:", v21);
    objc_msgSend(v22, "setExpressionResultType:", 200);
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setPropertiesToFetch:", v23);

    -[NoteContext managedObjectContext](self, "managedObjectContext");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = v10;
    objc_msgSend(v24, "executeFetchRequest:error:", v14, &v38);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v38;

    if (v13 || !v25 || !objc_msgSend(v25, "count"))
    {
      v26 = os_log_create("com.apple.notes", "HTML");
      if (os_log_type_enabled(v26, OS_LOG_TYPE_FAULT))
        -[NoteContext getNextIdObject].cold.1();

    }
    objc_msgSend(v25, "lastObject");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "valueForKey:", CFSTR("maxId"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v28, "unsignedIntValue");

    v30 = 10 * (v29 / 0xA) + 10;
    if (v30 > 0xFFFFFFF5)
      v30 = 0;
    if (v30)
      v31 = v30;
    else
      v31 = 10;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v37;
    objc_msgSend(v37, "setValue:forKey:", v32, CFSTR("counter"));

  }
  return v12;
}

- (id)nextIndex
{
  NSNumber *nextId;
  unint64_t v4;
  void *v5;
  void *v6;
  NSNumber *v7;
  NSNumber *v8;
  void *v9;
  NSManagedObjectContext *nextIdContext;
  BOOL v11;
  id v12;
  NSObject *v13;
  NSNumber **p_nextId;
  NSNumber *v15;
  void *v16;
  uint64_t v17;
  NSNumber *v18;
  id v20[5];

  v20[4] = *(id *)MEMORY[0x1E0C80C00];
  nextId = self->_nextId;
  if (!nextId
    || (HIDWORD(v4) = -858993459 * -[NSNumber unsignedIntValue](nextId, "unsignedIntValue"),
        LODWORD(v4) = HIDWORD(v4),
        (v4 >> 1) <= 0x19999999))
  {
    objc_opt_class();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_sync_enter(v5);
    -[ICExclusiveLock lock](self->_nextIdLock, "lock");
    -[NoteContext getNextIdObject](self, "getNextIdObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "valueForKey:", CFSTR("counter"));
    v7 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    v8 = self->_nextId;
    self->_nextId = v7;

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[NSNumber unsignedIntValue](self->_nextId, "unsignedIntValue") + 10);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setValue:forKey:", v9, CFSTR("counter"));

    nextIdContext = self->_nextIdContext;
    v20[0] = 0;
    v11 = -[NSManagedObjectContext save:](nextIdContext, "save:", v20);
    v12 = v20[0];
    if (!v11)
    {
      v13 = os_log_create("com.apple.notes", "HTML");
      if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
      {
        objc_msgSend(v12, "userInfo");
        objc_claimAutoreleasedReturnValue();
        -[NoteContext nextIndex].cold.1();
      }

    }
    -[NSManagedObjectContext reset](self->_nextIdContext, "reset");

    -[ICExclusiveLock unlock](self->_nextIdLock, "unlock");
    objc_sync_exit(v5);

  }
  v15 = self->_nextId;
  p_nextId = &self->_nextId;
  v16 = (void *)-[NSNumber copy](v15, "copy");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(v16, "unsignedIntValue") + 1);
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = *p_nextId;
  *p_nextId = (NSNumber *)v17;

  return v16;
}

+ (id)backupsDirectoryURL
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a1, "urlForPersistentStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLByDeletingLastPathComponent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "URLByAppendingPathComponent:isDirectory:", CFSTR("Backups"), 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (void)backupPersistentStore:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  NSObject *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  char v23;
  id v24;
  NSObject *v25;
  NSObject *v26;
  int v27;
  id v28;
  _BOOL4 v29;
  void *v30;
  void *v31;
  int v32;
  NSObject *v33;
  void *v34;
  void *v35;
  NSObject *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  id v53;
  id v54;
  id v55;
  id v56;
  uint8_t buf[4];
  void *v58;
  __int16 v59;
  void *v60;
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = os_log_create("com.apple.notes", "HTML");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    +[NoteContext backupPersistentStore:].cold.8();

  objc_msgSend(a1, "urlForPersistentStore");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  objc_msgSend(v7, "setDateFormat:", CFSTR("yyyy-MM-dd_HH-mm-ss"));
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringFromDate:", v8);
  v9 = objc_claimAutoreleasedReturnValue();

  v10 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v11 = objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v11, "UUIDString");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = (void *)v9;
  objc_msgSend(v10, "stringWithFormat:", CFSTR("Backup-%@-%@"), v9, v12);
  v13 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "backupsDirectoryURL");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = (void *)v13;
  objc_msgSend(v14, "URLByAppendingPathComponent:isDirectory:", v13, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "lastPathComponent");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "URLByAppendingPathComponent:isDirectory:", v16, 0);
  v52 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v56 = 0;
  LOBYTE(v11) = objc_msgSend(v17, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v15, 1, 0, &v56);
  v18 = v56;

  if ((v11 & 1) == 0)
  {
    v19 = os_log_create("com.apple.notes", "HTML");
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      +[NoteContext backupPersistentStore:].cold.7();

    v18 = 0;
  }
  objc_msgSend(a1, "storeOptions");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "storeOptions");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = *MEMORY[0x1E0C979E8];
  v55 = v18;
  v51 = v4;
  v23 = objc_msgSend(v4, "replacePersistentStoreAtURL:destinationOptions:withPersistentStoreFromURL:sourceOptions:storeType:error:", v52, v20, v6, v21, v22, &v55);
  v24 = v55;

  v25 = os_log_create("com.apple.notes", "HTML");
  v26 = v25;
  if ((v23 & 1) == 0)
  {
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      +[NoteContext backupPersistentStore:].cold.6();
    goto LABEL_27;
  }
  if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    v58 = v6;
    v59 = 2112;
    v60 = v52;
    _os_log_impl(&dword_1C88D8000, v26, OS_LOG_TYPE_INFO, "Backed up old persistent store from %@ to %@", buf, 0x16u);
  }

  v54 = v24;
  v27 = objc_msgSend(v6, "checkResourceIsReachableAndReturnError:", &v54);
  v28 = v54;

  v26 = os_log_create("com.apple.notes", "HTML");
  v29 = os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG);
  v30 = v51;
  if (!v27)
  {
    if (v29)
      +[NoteContext backupPersistentStore:].cold.5();
    v24 = v28;
    goto LABEL_28;
  }
  if (v29)
    +[NoteContext backupPersistentStore:].cold.4();

  objc_msgSend(a1, "storeOptions");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v53 = v28;
  v32 = objc_msgSend(v51, "destroyPersistentStoreAtURL:withType:options:error:", v6, v22, v31, &v53);
  v24 = v53;

  v33 = os_log_create("com.apple.notes", "HTML");
  v26 = v33;
  if (!v32)
  {
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      +[NoteContext backupPersistentStore:].cold.3();

    v36 = os_log_create("com.apple.notes", "HTML");
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
      +[NoteContext backupPersistentStore:].cold.2();

    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "removeItemAtURL:error:", v6, 0);

    objc_msgSend(v6, "lastPathComponent");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "stringByDeletingPathExtension");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "stringByAppendingPathExtension:", CFSTR("sqlite-wal"));
    v26 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "URLByDeletingLastPathComponent");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "URLByAppendingPathComponent:isDirectory:", v26, 0);
    v41 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "removeItemAtURL:error:", v41, 0);

    objc_msgSend(v6, "lastPathComponent");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "stringByDeletingPathExtension");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "stringByAppendingPathExtension:", CFSTR("sqlite-shm"));
    v45 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "URLByDeletingLastPathComponent");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "URLByAppendingPathComponent:isDirectory:", v45, 0);
    v47 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "removeItemAtURL:error:", v47, 0);

LABEL_27:
    v30 = v51;
LABEL_28:
    v35 = v49;
    v34 = v50;
    goto LABEL_29;
  }
  v34 = v50;
  if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
    +[NoteContext backupPersistentStore:].cold.1();
  v35 = v49;
LABEL_29:

}

+ (BOOL)isTooLowOnDiskSpace
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  unint64_t v11;
  uint64_t v12;
  int v13;
  id v14;
  id v15;
  uint64_t v16;
  NSObject *v17;
  int v18;
  id v19;
  id v20;
  NSObject *v21;
  unint64_t v22;
  NSObject *v23;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  uint8_t buf[4];
  unint64_t v31;
  __int16 v32;
  unint64_t v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "urlForPersistentStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLByDeletingPathExtension");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "URLByAppendingPathExtension:", CFSTR("sqlite-wal"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLByDeletingLastPathComponent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "path");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = 0;
  objc_msgSend(v5, "attributesOfFileSystemForPath:error:", v7, &v29);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v29;

  if (v9)
  {
    v10 = os_log_create("com.apple.notes", "HTML");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      +[NoteContext isTooLowOnDiskSpace].cold.3(v2, (uint64_t)v9, v10);

    v11 = 0;
  }
  else
  {
    objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0CB2B00]);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = -[NSObject unsignedIntegerValue](v10, "unsignedIntegerValue");
  }

  v28 = 0;
  v12 = *MEMORY[0x1E0C99998];
  v27 = 0;
  v13 = objc_msgSend(v2, "getResourceValue:forKey:error:", &v28, v12, &v27);
  v14 = v28;
  v15 = v27;

  if (v13)
  {
    v16 = objc_msgSend(v14, "unsignedIntegerValue");
  }
  else
  {
    v17 = os_log_create("com.apple.notes", "HTML");
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      +[NoteContext isTooLowOnDiskSpace].cold.2();

    v16 = 0;
  }
  v25 = 0;
  v26 = 0;
  v18 = objc_msgSend(v4, "getResourceValue:forKey:error:", &v26, v12, &v25);
  v19 = v26;

  v20 = v25;
  if (v18)
  {
    v16 += objc_msgSend(v19, "unsignedIntegerValue");
  }
  else if (objc_msgSend(v20, "code") != 260)
  {
    v21 = os_log_create("com.apple.notes", "HTML");
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      +[NoteContext isTooLowOnDiskSpace].cold.1();

  }
  v22 = 3 * v16 + 0x100000;
  v23 = os_log_create("com.apple.notes", "HTML");
  if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134218240;
    v31 = v22;
    v32 = 2048;
    v33 = v11;
    _os_log_impl(&dword_1C88D8000, v23, OS_LOG_TYPE_INFO, "Minimum free space to open database: %lu, current free space: %lu", buf, 0x16u);
  }

  return v11 < v22;
}

+ (BOOL)isDataProtectionError:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  BOOL v12;

  v3 = a3;
  v4 = objc_msgSend(v3, "code");
  objc_msgSend(v3, "domain");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *MEMORY[0x1E0C979C8];
  if (objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0C979C8]))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v3, "userInfo");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v9 = *MEMORY[0x1E0CB2FE0];
  if (objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0CB2FE0]))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v3, "userInfo");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKeyedSubscript:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v12 = objc_msgSend(v7, "intValue") == 23 || objc_msgSend(v10, "intValue") == 1;

  return v12;
}

- (NSPersistentStoreCoordinator)persistentStoreCoordinator
{
  return (NSPersistentStoreCoordinator *)objc_msgSend((id)objc_opt_class(), "persistentStoreCoordinator");
}

uint64_t __41__NoteContext_persistentStoreCoordinator__block_invoke_2(uint64_t result, uint64_t a2, uint64_t a3)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a3 == 0;
  return result;
}

uint64_t __41__NoteContext_persistentStoreCoordinator__block_invoke_175(uint64_t result, uint64_t a2, uint64_t a3)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a3 == 0;
  return result;
}

+ (id)newManagedObjectContext
{
  void *v3;
  void *v4;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C97B88]), "initWithConcurrencyType:", 1);
  objc_msgSend(a1, "persistentStoreCoordinator");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setPersistentStoreCoordinator:", v4);

  objc_msgSend(v3, "setMergePolicy:", *MEMORY[0x1E0C978C0]);
  objc_msgSend(v3, "setUndoManager:", 0);
  return v3;
}

- (void)receiveDarwinNotificationWithChangeLogging:(BOOL)a3
{
  unint64_t notificationCount;
  id v4;

  notificationCount = self->_notificationCount;
  if (notificationCount)
  {
    self->_notificationCount = notificationCount - 1;
  }
  else
  {
    -[NoteContext mocUpdater](self, "mocUpdater", a3);
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "requestUpdate");

  }
}

- (void)resetNotificationCount
{
  self->_notificationCount = 0;
}

- (id)noteChangeWithType:(int)a3 store:(id)a4
{
  uint64_t v4;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v4 = *(_QWORD *)&a3;
  v6 = (void *)MEMORY[0x1E0C97B20];
  v7 = a4;
  -[NoteContext managedObjectContext](self, "managedObjectContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "insertNewObjectForEntityForName:inManagedObjectContext:", CFSTR("NoteChange"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "setStore:", v7);
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setNoteIntegerIds:", v10);

  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setNoteServerIds:", v11);

  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setNoteServerIntIds:", v12);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setChangeType:", v13);

  return v9;
}

- (void)managedObjectContextWillSaveNotification:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "postNotificationName:object:userInfo:", CFSTR("NoteContextWillSaveNotification"), self, v5);

  if (self->_logChanges)
    -[NoteContext trackChanges:](self, "trackChanges:", v6);

}

- (void)trackChanges:(id)a3
{
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
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  int v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t j;
  void *v33;
  void *v34;
  int v35;
  id v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  id v44;
  id v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t k;
  void *v50;
  void *v51;
  int v52;
  id v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  id v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t m;
  void *v73;
  void *v74;
  int v75;
  id v76;
  void *v77;
  void *v78;
  void *v79;
  uint64_t v80;
  void *v81;
  void *v82;
  char v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  id v97;
  id v98;
  NoteContext *v99;
  void *v100;
  id v101;
  id v102;
  void *v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  _BYTE v120[128];
  _BYTE v121[128];
  _BYTE v122[128];
  _BYTE v123[128];
  uint64_t v124;

  v124 = *MEMORY[0x1E0C80C00];
  -[NoteContext managedObjectContext](self, "managedObjectContext", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "deletedObjects");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v96 = (void *)objc_msgSend(v5, "mutableCopy");

  -[NoteContext managedObjectContext](self, "managedObjectContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "updatedObjects");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "mutableCopy");

  -[NoteContext managedObjectContext](self, "managedObjectContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "insertedObjects");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v94 = (void *)objc_msgSend(v10, "mutableCopy");

  v11 = (void *)MEMORY[0x1E0C97B20];
  v99 = self;
  -[NoteContext managedObjectContext](self, "managedObjectContext");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "entityForName:inManagedObjectContext:", CFSTR("Note"), v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  v116 = 0u;
  v117 = 0u;
  v118 = 0u;
  v119 = 0u;
  v14 = v8;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v116, v123, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v117;
    do
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v117 != v17)
          objc_enumerationMutation(v14);
        v19 = *(void **)(*((_QWORD *)&v116 + 1) + 8 * i);
        objc_msgSend(v19, "entity", v94);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(v20, "isEqual:", v13);

        if (v21)
        {
          v22 = v19;
          if (objc_msgSend(v22, "isMarkedForDeletion"))
            objc_msgSend(v100, "addObject:", v22);
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", CFSTR("store"));
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "committedValuesForKeys:", v23);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "objectForKey:", CFSTR("store"));
          v25 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v22, "store");
          v26 = (void *)objc_claimAutoreleasedReturnValue();

          if (v25 != v26)
            objc_msgSend(v103, "addObject:", v22);

        }
      }
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v116, v123, 16);
    }
    while (v16);
  }

  objc_msgSend(v14, "minusSet:", v100);
  v27 = v96;
  objc_msgSend(v96, "unionSet:", v100);
  objc_msgSend(v14, "minusSet:", v103);
  objc_msgSend(v96, "unionSet:", v103);
  objc_msgSend(v94, "unionSet:", v103);
  v98 = v14;
  if (objc_msgSend(v94, "count"))
  {
    v101 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v112 = 0u;
    v113 = 0u;
    v114 = 0u;
    v115 = 0u;
    v28 = v94;
    v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v112, v122, 16);
    if (v29)
    {
      v30 = v29;
      v31 = *(_QWORD *)v113;
      do
      {
        for (j = 0; j != v30; ++j)
        {
          if (*(_QWORD *)v113 != v31)
            objc_enumerationMutation(v28);
          v33 = *(void **)(*((_QWORD *)&v112 + 1) + 8 * j);
          objc_msgSend(v33, "entity", v94);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          v35 = objc_msgSend(v34, "isEqual:", v13);

          if (v35)
          {
            v36 = v33;
            objc_msgSend(v36, "store");
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            v38 = v37;
            if (v37)
            {
              objc_msgSend(v37, "objectID");
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v101, "objectForKey:", v39);
              v40 = (void *)objc_claimAutoreleasedReturnValue();

              if (!v40)
              {
                -[NoteContext noteChangeWithType:store:](v99, "noteChangeWithType:store:", 0, v38);
                v40 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v38, "objectID");
                v41 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v101, "setObject:forKey:", v40, v41);

              }
              objc_msgSend(v40, "noteIntegerIds");
              v42 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v36, "integerId");
              v43 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v42, "addObject:", v43);

              v14 = v98;
            }

          }
        }
        v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v112, v122, 16);
      }
      while (v30);
    }

    v27 = v96;
  }
  if (objc_msgSend(v14, "count", v94))
  {
    v44 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v108 = 0u;
    v109 = 0u;
    v110 = 0u;
    v111 = 0u;
    v45 = v14;
    v46 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v108, v121, 16);
    if (v46)
    {
      v47 = v46;
      v48 = *(_QWORD *)v109;
      do
      {
        for (k = 0; k != v47; ++k)
        {
          if (*(_QWORD *)v109 != v48)
            objc_enumerationMutation(v45);
          v50 = *(void **)(*((_QWORD *)&v108 + 1) + 8 * k);
          objc_msgSend(v50, "entity");
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          v52 = objc_msgSend(v51, "isEqual:", v13);

          if (v52)
          {
            v53 = v50;
            objc_msgSend(v53, "store");
            v54 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v54, "objectID");
            v55 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v44, "objectForKey:", v55);
            v56 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v56)
            {
              objc_msgSend(v53, "store");
              v57 = (void *)objc_claimAutoreleasedReturnValue();
              -[NoteContext noteChangeWithType:store:](v99, "noteChangeWithType:store:", 1, v57);
              v56 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v56, "store");
              v58 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v58, "objectID");
              v59 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v44, "setObject:forKey:", v56, v59);

            }
            objc_msgSend(v56, "noteIntegerIds");
            v60 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v53, "integerId");
            v61 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v60, "addObject:", v61);

            objc_msgSend(v53, "serverId");
            v62 = (void *)objc_claimAutoreleasedReturnValue();

            if (v62)
            {
              objc_msgSend(v56, "noteServerIds");
              v63 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v53, "serverId");
              v64 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v63, "addObject:", v64);

            }
            if (objc_msgSend(v53, "serverIntId"))
            {
              objc_msgSend(v56, "noteServerIntIds");
              v65 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v53, "serverIntId"));
              v66 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v65, "addObject:", v66);

            }
          }
        }
        v47 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v108, v121, 16);
      }
      while (v47);
    }

    v27 = v96;
    v14 = v98;
  }
  if (objc_msgSend(v27, "count"))
  {
    v102 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v67, "postNotificationName:object:", CFSTR("NoteContextDeletedNotesNotification"), v27);

    v106 = 0u;
    v107 = 0u;
    v104 = 0u;
    v105 = 0u;
    v68 = v27;
    v69 = objc_msgSend(v68, "countByEnumeratingWithState:objects:count:", &v104, v120, 16);
    if (!v69)
      goto LABEL_67;
    v70 = v69;
    v71 = *(_QWORD *)v105;
    v97 = v68;
    while (1)
    {
      for (m = 0; m != v70; ++m)
      {
        if (*(_QWORD *)v105 != v71)
          objc_enumerationMutation(v68);
        v73 = *(void **)(*((_QWORD *)&v104 + 1) + 8 * m);
        objc_msgSend(v73, "entity");
        v74 = (void *)objc_claimAutoreleasedReturnValue();
        v75 = objc_msgSend(v74, "isEqual:", v13);

        if (v75)
        {
          v76 = v73;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", CFSTR("store"));
          v77 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v76, "committedValuesForKeys:", v77);
          v78 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v78, "objectForKey:", CFSTR("store"));
          v79 = (void *)objc_claimAutoreleasedReturnValue();
          if (v79)
          {
            objc_msgSend(MEMORY[0x1E0C99E38], "null");
            v80 = objc_claimAutoreleasedReturnValue();
            v81 = v79;
            if (v79 == (void *)v80)
              goto LABEL_63;
            v82 = (void *)v80;
            v83 = objc_msgSend(v68, "containsObject:", v79);

            if ((v83 & 1) == 0)
            {
              objc_msgSend(v79, "objectID");
              v84 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v102, "objectForKey:", v84);
              v81 = (void *)objc_claimAutoreleasedReturnValue();

              if (!v81)
              {
                -[NoteContext noteChangeWithType:store:](v99, "noteChangeWithType:store:", 2, v79);
                v81 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v81, "store");
                v85 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v85, "objectID");
                v86 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v102, "setObject:forKey:", v81, v86);

              }
              objc_msgSend(v81, "noteIntegerIds");
              v87 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v76, "integerId");
              v88 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v87, "addObject:", v88);

              objc_msgSend(v76, "serverId");
              v89 = (void *)objc_claimAutoreleasedReturnValue();

              if (v89)
              {
                objc_msgSend(v81, "noteServerIds");
                v90 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v76, "serverId");
                v91 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v90, "addObject:", v91);

              }
              if (objc_msgSend(v76, "serverIntId"))
              {
                objc_msgSend(v81, "noteServerIntIds");
                v92 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v76, "serverIntId"));
                v93 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v92, "addObject:", v93);

              }
              v68 = v97;
LABEL_63:

            }
          }

          continue;
        }
      }
      v70 = objc_msgSend(v68, "countByEnumeratingWithState:objects:count:", &v104, v120, 16);
      if (!v70)
      {
LABEL_67:

        v27 = v96;
        v14 = v98;
        break;
      }
    }
  }

}

- (void)cleanUpLocks
{
  id v3;

  -[ICExclusiveLock unlock](self->_nextIdLock, "unlock");
  -[ICExclusiveLock unlock](self->_objectCreationLock, "unlock");
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "postNotificationName:object:", CFSTR("NoteContextDidUnlockObjectCreationNotification"), self);

}

- (void)updateForRecentChanges
{
  id v2;

  -[NoteContext mocUpdater](self, "mocUpdater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "requestUpdate");

}

- (void)postNotesChangedExternally
{
  id v3;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "postNotificationName:object:userInfo:", CFSTR("NoteContextChangedElsewhereNotification"), self, 0);

}

- (int64_t)context:(id)a3 shouldHandleInaccessibleFault:(id)a4 forObjectID:(id)a5 andTrigger:(id)a6
{
  return 2;
}

- (AccountUtilities)accountUtilities
{
  return self->_accountUtilities;
}

- (void)setAccountUtilities:(id)a3
{
  objc_storeStrong((id *)&self->_accountUtilities, a3);
}

- (void)setIsMainContext:(BOOL)a3
{
  self->_isMainContext = a3;
}

- (void)setUsePrivateQueue:(BOOL)a3
{
  self->_usePrivateQueue = a3;
}

- (ICManagedObjectContextUpdater)mocUpdater
{
  return self->_mocUpdater;
}

- (ICSelectorDelayer)externalChangeNotificationDelayer
{
  return self->_externalChangeNotificationDelayer;
}

+ (id)mainContextObjectFromObject:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;

  v4 = a3;
  if (v4)
  {
    objc_msgSend(a1, "sharedContext");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "managedObjectContext");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "managedObjectContext");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = v4;
    if (v7 != v6)
    {
      objc_msgSend(v4, "objectID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "existingObjectWithID:error:", v9, 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v8, "managedObjectContext");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (v10 != v6)
      {
        v11 = os_log_create("com.apple.notes", "HTML");
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
          +[NoteContext(SharedContext) mainContextObjectFromObject:].cold.1(v4, v11);

        v8 = 0;
      }
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)setUpLocalAccountAndStore
{
  id v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_13();
  objc_msgSend(v0, "userInfo");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1C88D8000, v2, v3, "Error getting local account: %@, %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2();
}

- (void)setUpLastIndexTid
{
  id v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_13();
  objc_msgSend(v0, "userInfo");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1C88D8000, v2, v3, "Error fetching last transaction ID: %@, %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2();
}

void __59__NoteContext_newFRCForFetchRequest_delegate_performFetch___block_invoke_cold_1()
{
  id v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_13();
  objc_msgSend(v0, "userInfo");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1C88D8000, v2, v3, "Error: Problem performing fetch for NotesListController: %@, %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2();
}

- (void)batchFaultNotes:.cold.1()
{
  uint64_t v0;
  NSObject *v1;
  uint8_t v2[14];
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_22();
  v3 = v0;
  OUTLINED_FUNCTION_3(&dword_1C88D8000, v1, (uint64_t)v1, "Can't batch fault objects: %@, with error: %@", v2);
  OUTLINED_FUNCTION_9();
}

- (void)deleteNote:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_5(&dword_1C88D8000, v0, v1, "Trying to delete an object from an HTML account, but the object has a nil object ID: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_9();
}

- (void)saveSilently:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_6(&dword_1C88D8000, v0, v1, "Database is corrupt", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_10();
}

- (void)saveSilently:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_14(&dword_1C88D8000, v0, v1, "Error saving silently: %@", v2);
  OUTLINED_FUNCTION_9();
}

- (void)saveSilently:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_7(&dword_1C88D8000, v0, v1, "Saving legacy context", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_10();
}

- (void)visibleNotesForIntegerIds:.cold.1()
{
  id v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_13();
  objc_msgSend(v0, "userInfo");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1C88D8000, v2, v3, "Error getting notes with integer IDs: %@, %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2();
}

- (void)noteForGUID:.cold.1()
{
  id v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_21();
  objc_msgSend(v0, "userInfo");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_16(&dword_1C88D8000, v2, v3, "Error getting note with guid (%@):  %@, %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_18();
}

- (void)storeForExternalIdentifier:.cold.1()
{
  id v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_21();
  objc_msgSend(v0, "userInfo");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_16(&dword_1C88D8000, v2, v3, "Error getting folder with external identifier (%@):  %@, %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_18();
}

- (void)allStores
{
  id v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_13();
  objc_msgSend(v0, "userInfo");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1C88D8000, v2, v3, "Error getting list of all stores: %@, %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2();
}

- (void)faultedInStoresForAccounts:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_14(&dword_1C88D8000, v0, v1, "Error fetching stores: %@", v2);
  OUTLINED_FUNCTION_9();
}

- (void)countOfStores
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_6(&dword_1C88D8000, v0, v1, "Found no stores in [NoteContext countOfStores].  Will attempt to recover.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_10();
}

- (void)allAccountsAsFaults:prefechedRelationshipKeyPaths:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_6(&dword_1C88D8000, v0, v1, "Found no accounts in [NoteContext allAccounts].  Will attempt to recover.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_10();
}

- (void)allAccountsAsFaults:prefechedRelationshipKeyPaths:.cold.2()
{
  id v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_13();
  objc_msgSend(v0, "userInfo");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1C88D8000, v2, v3, "Error getting list of all accounts: %@, %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2();
}

- (void)accountForAccountId:.cold.1()
{
  id v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_21();
  objc_msgSend(v0, "userInfo");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_16(&dword_1C88D8000, v2, v3, "Error getting account for account identifier %@: %@, %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_18();
}

- (void)localAccount
{
  id v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_13();
  objc_msgSend(v0, "userInfo");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1C88D8000, v2, v3, "Error getting default account: %@, %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2();
}

- (void)forceDeleteAccount:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_14(&dword_1C88D8000, v0, v1, "Error batch deleting notes whil deleting account: %@", v2);
  OUTLINED_FUNCTION_9();
}

- (void)_notePropertyObjectForKey:.cold.1()
{
  id v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_13();
  objc_msgSend(v0, "userInfo");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1C88D8000, v2, v3, "Error fetching property: %@, %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2();
}

- (void)getNextIdObject
{
  id v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_13();
  objc_msgSend(v0, "userInfo");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1C88D8000, v2, v3, "Error: Couldn't fetch next ID: %@, %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2();
}

- (void)nextIndex
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t *v5;
  NSObject *v6;

  OUTLINED_FUNCTION_15();
  OUTLINED_FUNCTION_4(v1, v2, v3, 5.778e-34);
  OUTLINED_FUNCTION_3(&dword_1C88D8000, v6, v4, "Error: Couldn't save next ID: %@, %@", v5);

  OUTLINED_FUNCTION_19();
}

+ (void)backupPersistentStore:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_17(&dword_1C88D8000, v0, v1, "Destroyed persistent store at %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_9();
}

+ (void)backupPersistentStore:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_7(&dword_1C88D8000, v0, v1, "Falling back to just removing the database file", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_10();
}

+ (void)backupPersistentStore:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_5(&dword_1C88D8000, v0, v1, "Error destroying persistent store: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_9();
}

+ (void)backupPersistentStore:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_17(&dword_1C88D8000, v0, v1, "Destroying old persistent store at %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_9();
}

+ (void)backupPersistentStore:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_7(&dword_1C88D8000, v0, v1, "Backed up store and the old one is gone", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_10();
}

+ (void)backupPersistentStore:.cold.6()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_5(&dword_1C88D8000, v0, v1, "Error backing up old persistent store: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_9();
}

+ (void)backupPersistentStore:.cold.7()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_5(&dword_1C88D8000, v0, v1, "Failed to create database backup directory: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_9();
}

+ (void)backupPersistentStore:.cold.8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_7(&dword_1C88D8000, v0, v1, "Backing up persistent store", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_10();
}

+ (void)isTooLowOnDiskSpace
{
  void *v5;
  uint8_t v6[14];
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "path");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_22();
  v7 = a2;
  _os_log_error_impl(&dword_1C88D8000, a3, OS_LOG_TYPE_ERROR, "Error getting free space for filesystem at path: %@, error: %@", v6, 0x16u);

  OUTLINED_FUNCTION_2();
}

- (void)managedObjectContext
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_6(&dword_1C88D8000, v0, v1, "Failed to create managed object context for legacy notes", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_10();
}

void __33__NoteContext_managedObjectModel__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_14(&dword_1C88D8000, v0, v1, "Failed to load MobileNotes schema at %@", v2);
  OUTLINED_FUNCTION_9();
}

void __41__NoteContext_persistentStoreCoordinator__block_invoke_cold_1()
{
  os_log_t v0;
  uint8_t v1[16];

  OUTLINED_FUNCTION_11();
  _os_log_error_impl(&dword_1C88D8000, v0, OS_LOG_TYPE_ERROR, "Low on disk space and unable to load persistent store", v1, 2u);
  OUTLINED_FUNCTION_10();
}

void __41__NoteContext_persistentStoreCoordinator__block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_7(&dword_1C88D8000, v0, v1, "Successfully loaded persistent store on the second try", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_10();
}

void __41__NoteContext_persistentStoreCoordinator__block_invoke_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_5(&dword_1C88D8000, v0, v1, "Error trying to load persistent store again: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_9();
}

void __41__NoteContext_persistentStoreCoordinator__block_invoke_cold_4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_7(&dword_1C88D8000, v0, v1, "Trying to load persistent store again", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_10();
}

void __41__NoteContext_persistentStoreCoordinator__block_invoke_cold_5()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t *v5;
  NSObject *v6;

  OUTLINED_FUNCTION_15();
  OUTLINED_FUNCTION_4(v1, v2, v3, 5.778e-34);
  OUTLINED_FUNCTION_3(&dword_1C88D8000, v6, v4, "Unexpected error while opening database %@, %@", v5);

  OUTLINED_FUNCTION_19();
}

@end
