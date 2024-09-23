@implementation ICPersistentContainer

void __41__ICPersistentContainer_databaseOpenLock__block_invoke()
{
  ICExclusiveLock *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  id v4;

  v0 = [ICExclusiveLock alloc];
  +[ICPaths applicationDocumentsURL](ICPaths, "applicationDocumentsURL");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "path");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = -[ICExclusiveLock initWithName:cachePath:](v0, "initWithName:cachePath:", CFSTR("com.apple.notes.databaseopen.lock"), v1);
  v3 = (void *)databaseOpenLock__databaseOpenLock;
  databaseOpenLock__databaseOpenLock = v2;

}

+ (id)standardStoreOptions
{
  void *v2;
  uint64_t v3;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = MEMORY[0x1E0C9AAB0];
  objc_msgSend(v2, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0C97868]);
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v3, *MEMORY[0x1E0C978D0]);
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v3, *MEMORY[0x1E0C97970]);
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v3, *MEMORY[0x1E0C97900]);
  return v2;
}

- (ICPersistentContainer)initWithStoreURL:(id)a3 storeType:(id)a4 options:(id)a5 mergePolicy:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  ICPersistentContainer *v15;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  objc_msgSend((id)objc_opt_class(), "managedObjectModel");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[ICPersistentContainer initWithStoreURL:storeType:options:mergePolicy:managedObjectModel:](self, "initWithStoreURL:storeType:options:mergePolicy:managedObjectModel:", v13, v12, v11, v10, v14);

  return v15;
}

- (ICPersistentContainer)initWithStoreURL:(id)a3 storeType:(id)a4 options:(id)a5 mergePolicy:(id)a6 managedObjectModel:(id)a7
{
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  ICPersistentContainer *v18;
  id v20;
  id v21;
  objc_super v22;

  v13 = a3;
  v21 = a4;
  v20 = a5;
  v14 = a6;
  v15 = a7;
  objc_msgSend(v13, "lastPathComponent");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "stringByDeletingPathExtension");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v22.receiver = self;
  v22.super_class = (Class)ICPersistentContainer;
  v18 = -[NSPersistentContainer initWithName:managedObjectModel:](&v22, sel_initWithName_managedObjectModel_, v17, v15);

  if (v18)
  {
    objc_storeStrong((id *)&v18->_storeURL, a3);
    objc_storeStrong((id *)&v18->_storeType, a4);
    objc_storeStrong((id *)&v18->_storeOptions, a5);
    objc_storeStrong((id *)&v18->_mergePolicy, a6);
    -[ICPersistentContainer setupPersistentStoreDescriptions](v18, "setupPersistentStoreDescriptions", v20, v21);
  }

  return v18;
}

- (void)setupPersistentStoreDescriptions
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc(MEMORY[0x1E0C97C08]);
  -[ICPersistentContainer storeURL](self, "storeURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithURL:", v4);

  -[ICPersistentContainer storeType](self, "storeType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setType:", v6);

  -[ICPersistentContainer storeOptions](self, "storeOptions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __57__ICPersistentContainer_setupPersistentStoreDescriptions__block_invoke;
  v10[3] = &unk_1EA824870;
  v8 = v5;
  v11 = v8;
  objc_msgSend(v7, "enumerateKeysAndObjectsUsingBlock:", v10);

  if (v8)
  {
    v12[0] = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSPersistentContainer setPersistentStoreDescriptions:](self, "setPersistentStoreDescriptions:", v9);

  }
}

- (NSURL)storeURL
{
  return self->_storeURL;
}

- (NSString)storeType
{
  return self->_storeType;
}

- (BOOL)allowsCoreDataMigration
{
  void *v2;
  void *v3;
  char v4;

  -[ICPersistentContainer storeOptions](self, "storeOptions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", *MEMORY[0x1E0C978D0]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    v4 = objc_msgSend(v3, "BOOLValue");
  else
    v4 = 1;

  return v4;
}

- (NSDictionary)storeOptions
{
  return self->_storeOptions;
}

+ (id)managedObjectModel
{
  if (managedObjectModel_onceToken != -1)
    dispatch_once(&managedObjectModel_onceToken, &__block_literal_global_7);
  return (id)managedObjectModel_managedObjectModel;
}

- (BOOL)loadPersistentStore:(id *)a3 storeCreatedHandler:(id)a4
{
  id v6;
  NSObject *v7;
  id v8;
  void *v9;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  id (*v14)(uint64_t);
  void *v15;
  ICPersistentContainer *v16;
  id v17;
  uint64_t *v18;
  _QWORD *v19;
  _QWORD *v20;
  _QWORD *v21;
  uint64_t *v22;
  _QWORD *v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  char v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  char v31;
  _QWORD v32[3];
  char v33;
  _QWORD v34[3];
  char v35;
  _QWORD v36[3];
  char v37;
  _QWORD v38[3];
  char v39;

  v6 = a4;
  v7 = os_log_create("com.apple.notes", "CoreData");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    -[ICPersistentContainer loadPersistentStore:storeCreatedHandler:].cold.2();

  v38[0] = 0;
  v38[1] = v38;
  v38[2] = 0x2020000000;
  v39 = 0;
  v36[0] = 0;
  v36[1] = v36;
  v36[2] = 0x2020000000;
  v37 = 0;
  v34[0] = 0;
  v34[1] = v34;
  v34[2] = 0x2020000000;
  v35 = 0;
  v32[0] = 0;
  v32[1] = v32;
  v32[2] = 0x2020000000;
  v33 = 0;
  v28 = 0;
  v29 = &v28;
  v30 = 0x2020000000;
  v31 = 0;
  v24 = 0;
  v25 = &v24;
  v26 = 0x2020000000;
  v27 = 0;
  v12 = MEMORY[0x1E0C809B0];
  v13 = 3221225472;
  v14 = __65__ICPersistentContainer_loadPersistentStore_storeCreatedHandler___block_invoke;
  v15 = &unk_1EA8248E8;
  v16 = self;
  v18 = &v28;
  v19 = v36;
  v20 = v34;
  v21 = v32;
  v22 = &v24;
  v23 = v38;
  v8 = v6;
  v17 = v8;
  -[ICPersistentContainer performBlockWithDatabaseOpenLock:](self, "performBlockWithDatabaseOpenLock:", &v12);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (*((_BYTE *)v29 + 24))
    -[ICPersistentContainer setupViewContext](self, "setupViewContext", v12, v13, v14, v15, v16);
  if (*((_BYTE *)v25 + 24))
  {
    v11 = os_log_create("com.apple.notes", "CoreData");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[ICPersistentContainer loadPersistentStore:storeCreatedHandler:].cold.1();

    exit(0);
  }
  if (a3)
    *a3 = objc_retainAutorelease(v9);

  _Block_object_dispose(&v24, 8);
  _Block_object_dispose(&v28, 8);
  _Block_object_dispose(v32, 8);
  _Block_object_dispose(v34, 8);
  _Block_object_dispose(v36, 8);
  _Block_object_dispose(v38, 8);

  return v9 == 0;
}

- (void)setupViewContext
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  -[ICPersistentContainer mergePolicy](self, "mergePolicy");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSPersistentContainer viewContext](self, "viewContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setMergePolicy:", v3);

  -[NSPersistentContainer viewContext](self, "viewContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setName:", CFSTR("ViewContext"));

  v6 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringWithFormat:", CFSTR("%d"), objc_msgSend(v7, "processIdentifier"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSPersistentContainer viewContext](self, "viewContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setTransactionAuthor:", v8);

  -[NSPersistentContainer viewContext](self, "viewContext");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setAutomaticallyMergesChangesFromParent:", 1);

  -[NSPersistentContainer viewContext](self, "viewContext");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setShouldDeleteInaccessibleFaults:", 1);

}

- (id)newBackgroundContext
{
  id v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ICPersistentContainer;
  v3 = -[NSPersistentContainer newBackgroundContext](&v6, sel_newBackgroundContext);
  -[ICPersistentContainer mergePolicy](self, "mergePolicy");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setMergePolicy:", v4);

  return v3;
}

- (NSMergePolicy)mergePolicy
{
  return self->_mergePolicy;
}

- (id)performBlockWithDatabaseOpenLock:(id)a3
{
  void (**v4)(_QWORD);
  void *v5;
  _BOOL4 v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = (void (**)(_QWORD))a3;
  objc_opt_class();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v5);
  v6 = -[ICPersistentContainer allowsCoreDataMigration](self, "allowsCoreDataMigration");
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "postNotificationName:object:", CFSTR("ICPersistentContainerWillLockDatabaseNotification"), self);

    objc_msgSend((id)objc_opt_class(), "databaseOpenLock");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "lock");

  }
  v4[2](v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend((id)objc_opt_class(), "databaseOpenLock");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "unlock");

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "postNotificationName:object:", CFSTR("ICPersistentContainerDidUnlockDatabaseNotification"), self);

  }
  objc_sync_exit(v5);

  return v9;
}

+ (ICExclusiveLock)databaseOpenLock
{
  if (databaseOpenLock_onceToken != -1)
    dispatch_once(&databaseOpenLock_onceToken, &__block_literal_global_16);
  return (ICExclusiveLock *)(id)databaseOpenLock__databaseOpenLock;
}

id __65__ICPersistentContainer_loadPersistentStore_storeCreatedHandler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  void *v8;
  ICPersistentContainer *v9;
  void *v10;
  void *v11;
  ICPersistentContainer *v12;
  BOOL v13;
  id v14;
  NSObject *v15;
  NSObject *v16;
  uint64_t v17;
  id v18;
  NSObject *v19;
  void *v20;
  int v21;
  NSObject *v22;
  ICPersistentContainer *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  ICPersistentContainer *v27;
  id v28;
  NSObject *v29;
  os_log_t v30;
  char v31;
  NSObject *v32;
  NSObject *v33;
  void *v34;
  void *v35;
  void *v36;
  NSObject *v37;
  void *v38;
  id v39;
  _QWORD v41[6];
  id v42;
  id v43;
  uint8_t buf[16];
  _QWORD v45[7];
  __int128 v46;
  __int128 v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t *v50;
  uint64_t v51;
  uint64_t (*v52)(uint64_t, uint64_t);
  void (*v53)(uint64_t);
  id v54;

  v49 = 0;
  v50 = &v49;
  v51 = 0x3032000000;
  v52 = __Block_byref_object_copy__4;
  v53 = __Block_byref_object_dispose__4;
  v54 = 0;
  v2 = *(void **)(a1 + 32);
  v3 = MEMORY[0x1E0C809B0];
  v45[0] = MEMORY[0x1E0C809B0];
  v45[1] = 3221225472;
  v45[2] = __65__ICPersistentContainer_loadPersistentStore_storeCreatedHandler___block_invoke_21;
  v45[3] = &unk_1EA824898;
  v4 = *(_QWORD *)(a1 + 48);
  v45[4] = v2;
  v45[5] = v4;
  v46 = *(_OWORD *)(a1 + 56);
  v47 = *(_OWORD *)(a1 + 72);
  v5 = *(_QWORD *)(a1 + 88);
  v45[6] = &v49;
  v48 = v5;
  objc_msgSend(v2, "loadPersistentStoresWithCompletionHandler:", v45);
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24))
  {
    v6 = os_log_create("com.apple.notes", "CoreData");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DDAA5000, v6, OS_LOG_TYPE_INFO, "Persistent store does not exist and we're opening read only. Need to create persistent store.", buf, 2u);
    }

    objc_msgSend(*(id *)(a1 + 32), "storeOptions");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v7, "mutableCopy");

    objc_msgSend(v8, "removeObjectForKey:", *MEMORY[0x1E0C97998]);
    v9 = [ICPersistentContainer alloc];
    objc_msgSend(*(id *)(a1 + 32), "storeURL");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "mergePolicy");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[ICPersistentContainer initWithStoreURL:storeType:options:mergePolicy:](v9, "initWithStoreURL:storeType:options:mergePolicy:", v10, *MEMORY[0x1E0C979E8], v8, v11);

    v43 = 0;
    v13 = -[ICPersistentContainer loadPersistentStore:](v12, "loadPersistentStore:", &v43);
    v14 = v43;
    v15 = os_log_create("com.apple.notes", "CoreData");
    v16 = v15;
    if (v13)
    {
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
        __65__ICPersistentContainer_loadPersistentStore_storeCreatedHandler___block_invoke_cold_2();

      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 1;
      v17 = *(_QWORD *)(a1 + 40);
      if (v17)
      {
        v18 = -[ICPersistentContainer newBackgroundContext](v12, "newBackgroundContext");
        (*(void (**)(uint64_t, id))(v17 + 16))(v17, v18);

      }
    }
    else
    {
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        __65__ICPersistentContainer_loadPersistentStore_storeCreatedHandler___block_invoke_cold_5();

      if (+[ICPersistentContainer isDataProtectionError:](ICPersistentContainer, "isDataProtectionError:", v14))
      {
        v19 = os_log_create("com.apple.notes", "CoreData");
        if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1DDAA5000, v19, OS_LOG_TYPE_INFO, "Data protection prevented loading persistent store, because device has not been unlocked since boot", buf, 2u);
        }

        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 0;
      }
    }

  }
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
  {
    if ((objc_msgSend(*(id *)(a1 + 32), "isReadOnly") & 1) == 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "storeType");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "isEqualToString:", *MEMORY[0x1E0C97A70]);

      if (v21)
      {
        v22 = os_log_create("com.apple.notes", "CoreData");
        if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1DDAA5000, v22, OS_LOG_TYPE_INFO, "Failed to load persistent store, and we're using an XPC store. Possibly need to migrate the database", buf, 2u);
        }

        v23 = [ICPersistentContainer alloc];
        objc_msgSend(*(id *)(a1 + 32), "storeURL");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "storeOptions");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "mergePolicy");
        v26 = objc_claimAutoreleasedReturnValue();
        v27 = -[ICPersistentContainer initWithStoreURL:storeType:options:mergePolicy:](v23, "initWithStoreURL:storeType:options:mergePolicy:", v24, *MEMORY[0x1E0C979E8], v25, v26);

        v42 = 0;
        LOBYTE(v26) = -[ICPersistentContainer loadPersistentStore:](v27, "loadPersistentStore:", &v42);
        v28 = v42;
        v29 = os_log_create("com.apple.notes", "CoreData");
        v30 = v29;
        if ((v26 & 1) != 0)
        {
          if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
            __65__ICPersistentContainer_loadPersistentStore_storeCreatedHandler___block_invoke_cold_2();
          v31 = 1;
        }
        else
        {
          if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
            __65__ICPersistentContainer_loadPersistentStore_storeCreatedHandler___block_invoke_cold_3();

          if (!+[ICPersistentContainer isDataProtectionError:](ICPersistentContainer, "isDataProtectionError:", v28))goto LABEL_32;
          v30 = os_log_create("com.apple.notes", "CoreData");
          if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1DDAA5000, v30, OS_LOG_TYPE_INFO, "Data protection prevented loading persistent store, because device has not been unlocked since boot", buf, 2u);
          }
          v31 = 0;
        }

        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 0;
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = v31;
LABEL_32:

      }
    }
  }
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24)
    && (objc_msgSend(*(id *)(a1 + 32), "migrateFromOldDataModel") & 1) == 0)
  {
    +[ICTelemetryManager postBasicEvent:](ICTelemetryManager, "postBasicEvent:", 1);
    v32 = os_log_create("com.apple.notes", "CoreData");
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DDAA5000, v32, OS_LOG_TYPE_DEFAULT, "Failed to migrate from old data model. Backing up and replacing the store", buf, 2u);
    }

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
  }
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24)
    && (objc_msgSend(*(id *)(a1 + 32), "isReadOnly") & 1) == 0)
  {
    v33 = os_log_create("com.apple.notes", "CoreData");
    if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DDAA5000, v33, OS_LOG_TYPE_INFO, "Destroying old persistent store and creating a new one", buf, 2u);
    }

    objc_msgSend(*(id *)(a1 + 32), "backupPersistentStore");
    +[ICTelemetryManager postBasicEvent:](ICTelemetryManager, "postBasicEvent:", 0);
    if (objc_msgSend(*(id *)(a1 + 32), "abortAfterReplacingDatabase"))
    {
      +[ICTelemetryManager waitUntilAllPendingTelemetryHasBeenSent](ICTelemetryManager, "waitUntilAllPendingTelemetryHasBeenSent");
      v34 = (void *)MEMORY[0x1E0C99DA0];
      objc_msgSend(*(id *)(a1 + 32), "backupsDirectoryURL");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "absoluteString");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "raise:format:", *MEMORY[0x1E0C99750], CFSTR("Crashing intentionally after replacing up the database. Backups can be found at %@"), v36);

    }
  }
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24))
  {
    v37 = os_log_create("com.apple.notes", "CoreData");
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
      __65__ICPersistentContainer_loadPersistentStore_storeCreatedHandler___block_invoke_cold_1();

    v38 = *(void **)(a1 + 32);
    v41[0] = v3;
    v41[1] = 3221225472;
    v41[2] = __65__ICPersistentContainer_loadPersistentStore_storeCreatedHandler___block_invoke_31;
    v41[3] = &unk_1EA8248C0;
    v41[4] = *(_QWORD *)(a1 + 48);
    v41[5] = &v49;
    objc_msgSend(v38, "loadPersistentStoresWithCompletionHandler:", v41);
  }
  v39 = (id)v50[5];
  _Block_object_dispose(&v49, 8);

  return v39;
}

- (void)loadPersistentStore:storeCreatedHandler:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_0_2(&dword_1DDAA5000, v0, v1, "Loading persistent store", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3_0();
}

uint64_t __57__ICPersistentContainer_setupPersistentStoreDescriptions__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "setOption:forKey:", a3, a2);
}

void __43__ICPersistentContainer_managedObjectModel__block_invoke()
{
  void *v0;
  NSObject *v1;
  NSObject *v2;
  uint64_t v3;

  +[ICPaths managedObjectModelURL](ICPaths, "managedObjectModelURL");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = os_log_create("com.apple.notes", "CoreData");
  v2 = v1;
  if (v0)
  {
    if (os_log_type_enabled(v1, OS_LOG_TYPE_DEBUG))
      __43__ICPersistentContainer_managedObjectModel__block_invoke_cold_2();

    v3 = objc_msgSend(objc_alloc(MEMORY[0x1E0C97B98]), "initWithContentsOfURL:", v0);
    v2 = managedObjectModel_managedObjectModel;
    managedObjectModel_managedObjectModel = v3;
  }
  else if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
  {
    __43__ICPersistentContainer_managedObjectModel__block_invoke_cold_1();
  }

}

void __43__ICPersistentContainer_managedObjectModel__block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0(&dword_1DDAA5000, v0, v1, "Initializing managed object model from %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

+ (id)oldManagedObjectModel
{
  void *v2;
  NSObject *v3;
  NSObject *v4;
  void *v5;

  +[ICPaths oldManagedObjectModelURL](ICPaths, "oldManagedObjectModelURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = os_log_create("com.apple.notes", "CoreData");
  v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
      +[ICPersistentContainer oldManagedObjectModel].cold.2();

    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C97B98]), "initWithContentsOfURL:", v2);
  }
  else
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      +[ICPersistentContainer oldManagedObjectModel].cold.1();

    v5 = 0;
  }

  return v5;
}

- (BOOL)migrateFromOldDataModel
{
  NSObject *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  ICPersistentContainer *v7;
  void *v8;
  ICPersistentContainer *v9;
  _QWORD v11[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  char v15;
  _QWORD v16[2];
  _QWORD v17[3];

  v17[2] = *MEMORY[0x1E0C80C00];
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  v3 = os_log_create("com.apple.notes", "CoreData");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    -[ICPersistentContainer migrateFromOldDataModel].cold.1();

  v4 = *MEMORY[0x1E0C978D0];
  v16[0] = *MEMORY[0x1E0C97868];
  v16[1] = v4;
  v17[0] = MEMORY[0x1E0C9AAB0];
  v17[1] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "oldManagedObjectModel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = [ICPersistentContainer alloc];
  -[ICPersistentContainer storeURL](self, "storeURL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[ICPersistentContainer initWithStoreURL:storeType:options:mergePolicy:managedObjectModel:](v7, "initWithStoreURL:storeType:options:mergePolicy:managedObjectModel:", v8, *MEMORY[0x1E0C979E8], v5, 0, v6);

  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __48__ICPersistentContainer_migrateFromOldDataModel__block_invoke;
  v11[3] = &unk_1EA824848;
  v11[4] = &v12;
  -[NSPersistentContainer loadPersistentStoresWithCompletionHandler:](v9, "loadPersistentStoresWithCompletionHandler:", v11);
  LOBYTE(v8) = *((_BYTE *)v13 + 24) != 0;

  _Block_object_dispose(&v12, 8);
  return (char)v8;
}

void __48__ICPersistentContainer_migrateFromOldDataModel__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  char v7;

  v4 = a3;
  v5 = os_log_create("com.apple.notes", "CoreData");
  v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __48__ICPersistentContainer_migrateFromOldDataModel__block_invoke_cold_2();
    v7 = 0;
  }
  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      __48__ICPersistentContainer_migrateFromOldDataModel__block_invoke_cold_1();
    v7 = 1;
  }

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v7;
}

- (BOOL)loadPersistentStore:(id *)a3
{
  return -[ICPersistentContainer loadPersistentStore:storeCreatedHandler:](self, "loadPersistentStore:storeCreatedHandler:", a3, 0);
}

void __65__ICPersistentContainer_loadPersistentStore_storeCreatedHandler___block_invoke_21(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  NSObject *v16;
  uint64_t v17;
  uint8_t v18[16];
  uint8_t buf[16];

  v5 = a2;
  v6 = a3;
  v7 = os_log_create("com.apple.notes", "CoreData");
  v8 = v7;
  if (!v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      __65__ICPersistentContainer_loadPersistentStore_storeCreatedHandler___block_invoke_21_cold_1();

    v13 = *(_QWORD *)(a1 + 40);
    goto LABEL_11;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    __65__ICPersistentContainer_loadPersistentStore_storeCreatedHandler___block_invoke_21_cold_3();

  if (objc_msgSend(*(id *)(a1 + 32), "isTooLowOnDiskSpace"))
  {
    v9 = os_log_create("com.apple.notes", "CoreData");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DDAA5000, v9, OS_LOG_TYPE_INFO, "Low on disk space and unable to load persistent store", buf, 2u);
    }

    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.notes"), 209, 0);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v12 = *(void **)(v11 + 40);
    *(_QWORD *)(v11 + 40) = v10;

LABEL_17:
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 0;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 0;
    goto LABEL_18;
  }
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a3);
  if (+[ICPersistentContainer isDataProtectionError:](ICPersistentContainer, "isDataProtectionError:", v6))
  {
    v15 = os_log_create("com.apple.notes", "CoreData");
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v18 = 0;
      _os_log_impl(&dword_1DDAA5000, v15, OS_LOG_TYPE_INFO, "Data protection prevented loading persistent store, because device has not been unlocked since boot", v18, 2u);
    }

    goto LABEL_17;
  }
  if (objc_msgSend(v6, "code") == 134140)
  {
    if (objc_msgSend(*(id *)(a1 + 32), "allowsCoreDataMigration"))
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = 1;
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 0;
      v14 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
      goto LABEL_12;
    }
    v13 = *(_QWORD *)(a1 + 80);
LABEL_11:
    v14 = *(_QWORD *)(v13 + 8);
LABEL_12:
    *(_BYTE *)(v14 + 24) = 1;
    goto LABEL_18;
  }
  if (+[ICPersistentContainer isDatabaseMissingError:](ICPersistentContainer, "isDatabaseMissingError:", v6)&& objc_msgSend(*(id *)(a1 + 32), "isReadOnly"))
  {
    v13 = *(_QWORD *)(a1 + 88);
    goto LABEL_11;
  }
  v16 = os_log_create("com.apple.notes", "CoreData");
  if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
    __65__ICPersistentContainer_loadPersistentStore_storeCreatedHandler___block_invoke_21_cold_2(v6, v16);

  +[ICAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](ICAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "__objc_no", "-[ICPersistentContainer loadPersistentStore:storeCreatedHandler:]_block_invoke", 1, 1, CFSTR("Failed to open modern notes database."));
  if ((objc_msgSend(*(id *)(a1 + 32), "allowsCoreDataMigration") & 1) != 0)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
    v17 = *(_QWORD *)(a1 + 64);
  }
  else
  {
    v17 = *(_QWORD *)(a1 + 80);
  }
  *(_BYTE *)(*(_QWORD *)(v17 + 8) + 24) = 1;
LABEL_18:

}

void __65__ICPersistentContainer_loadPersistentStore_storeCreatedHandler___block_invoke_31(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  v5 = os_log_create("com.apple.notes", "CoreData");
  v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __65__ICPersistentContainer_loadPersistentStore_storeCreatedHandler___block_invoke_31_cold_2();

  }
  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      __65__ICPersistentContainer_loadPersistentStore_storeCreatedHandler___block_invoke_31_cold_1();

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
  }
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v4;

}

- (BOOL)isReadOnly
{
  void *v2;
  void *v3;
  char v4;

  -[ICPersistentContainer storeOptions](self, "storeOptions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", *MEMORY[0x1E0C97998]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (BOOL)isTooLowOnDiskSpace
{
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  unint64_t v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  int v15;
  id v16;
  id v17;
  uint64_t v18;
  NSObject *v19;
  int v20;
  id v21;
  id v22;
  NSObject *v23;
  unint64_t v24;
  NSObject *v25;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  uint8_t buf[4];
  unint64_t v33;
  __int16 v34;
  unint64_t v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  -[ICPersistentContainer storeURL](self, "storeURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "URLByDeletingPathExtension");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "URLByAppendingPathExtension:", CFSTR("sqlite-wal"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[ICPersistentContainer fakeFreeDiskSpace](self, "fakeFreeDiskSpace"))
  {
    v6 = os_log_create("com.apple.notes", "CoreData");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      -[ICPersistentContainer isTooLowOnDiskSpace].cold.4(self, v6);

    v7 = -[ICPersistentContainer fakeFreeDiskSpace](self, "fakeFreeDiskSpace");
    v8 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "URLByDeletingLastPathComponent");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "path");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = 0;
    objc_msgSend(v9, "attributesOfFileSystemForPath:error:", v11, &v31);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v31;

    if (v8)
    {
      v13 = os_log_create("com.apple.notes", "CoreData");
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        -[ICPersistentContainer isTooLowOnDiskSpace].cold.3(v3, (uint64_t)v8, v13);

      v7 = 0;
    }
    else
    {
      objc_msgSend(v12, "objectForKeyedSubscript:", *MEMORY[0x1E0CB2B00]);
      v13 = objc_claimAutoreleasedReturnValue();
      v7 = -[NSObject unsignedIntegerValue](v13, "unsignedIntegerValue");
    }

  }
  v30 = 0;
  v14 = *MEMORY[0x1E0C99998];
  v29 = 0;
  v15 = objc_msgSend(v3, "getResourceValue:forKey:error:", &v30, v14, &v29);
  v16 = v30;
  v17 = v29;

  if (v15)
  {
    v18 = objc_msgSend(v16, "unsignedIntegerValue");
  }
  else
  {
    v19 = os_log_create("com.apple.notes", "CoreData");
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      -[ICPersistentContainer isTooLowOnDiskSpace].cold.2();

    v18 = 0;
  }
  v27 = 0;
  v28 = 0;
  v20 = objc_msgSend(v5, "getResourceValue:forKey:error:", &v28, v14, &v27);
  v21 = v28;

  v22 = v27;
  if (v20)
  {
    v18 += objc_msgSend(v21, "unsignedIntegerValue");
  }
  else if (objc_msgSend(v22, "code") != 260)
  {
    v23 = os_log_create("com.apple.notes", "CoreData");
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      -[ICPersistentContainer isTooLowOnDiskSpace].cold.1();

  }
  v24 = 3 * v18 + 0x100000;
  v25 = os_log_create("com.apple.notes", "CoreData");
  if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134218240;
    v33 = v24;
    v34 = 2048;
    v35 = v7;
    _os_log_impl(&dword_1DDAA5000, v25, OS_LOG_TYPE_INFO, "Minimum free space to open database: %lu, current free space: %lu", buf, 0x16u);
  }

  return v7 < v24;
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

+ (BOOL)isDatabaseMissingError:(id)a3
{
  id v3;
  void *v4;
  BOOL v5;
  void *v6;

  v3 = a3;
  objc_msgSend(v3, "domain");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0CB2FE0]) && objc_msgSend(v3, "code") == 2)
  {
    v5 = 1;
  }
  else
  {
    objc_msgSend(v3, "domain");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0CB28A8]))
      v5 = objc_msgSend(v3, "code") == 260;
    else
      v5 = 0;

  }
  return v5;
}

- (NSURL)backupsDirectoryURL
{
  void *v2;
  void *v3;
  void *v4;

  -[ICPersistentContainer storeURL](self, "storeURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLByDeletingLastPathComponent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "URLByAppendingPathComponent:isDirectory:", CFSTR("Backups"), 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v4;
}

- (void)backupPersistentStore
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_0_2(&dword_1DDAA5000, v0, v1, "Backing up persistent store", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3_0();
}

- (void)vacuumStore
{
  -[ICPersistentContainer vacuumStoreWithCompletionHandler:](self, "vacuumStoreWithCompletionHandler:", 0);
}

- (void)vacuumStoreWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  id v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;

  v4 = a3;
  -[NSPersistentContainer viewContext](self, "viewContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICPersistentContainer storeURL](self, "storeURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = os_log_create("com.apple.notes", "CoreData");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    -[ICPersistentContainer vacuumStoreWithCompletionHandler:].cold.1();

  objc_msgSend(v5, "setShouldPerformSecureOperation:", 1);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __58__ICPersistentContainer_vacuumStoreWithCompletionHandler___block_invoke;
  v11[3] = &unk_1EA824910;
  v12 = v5;
  v13 = v6;
  v14 = v4;
  v8 = v4;
  v9 = v6;
  v10 = v5;
  objc_msgSend(v10, "performBlock:", v11);

}

uint64_t __58__ICPersistentContainer_vacuumStoreWithCompletionHandler___block_invoke(uint64_t a1)
{
  int v2;
  NSObject *v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t result;

  v2 = objc_msgSend(*(id *)(a1 + 32), "ic_save");
  v3 = os_log_create("com.apple.notes", "CoreData");
  v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
      __58__ICPersistentContainer_vacuumStoreWithCompletionHandler___block_invoke_cold_1(a1, v4, v5, v6, v7, v8, v9, v10);
  }
  else if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    __58__ICPersistentContainer_vacuumStoreWithCompletionHandler___block_invoke_cold_2(a1, v4, v11, v12, v13, v14, v15, v16);
  }

  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)setStoreOptions:(id)a3
{
  objc_storeStrong((id *)&self->_storeOptions, a3);
}

- (void)setStoreURL:(id)a3
{
  objc_storeStrong((id *)&self->_storeURL, a3);
}

- (void)setStoreType:(id)a3
{
  objc_storeStrong((id *)&self->_storeType, a3);
}

- (void)setMergePolicy:(id)a3
{
  objc_storeStrong((id *)&self->_mergePolicy, a3);
}

- (unint64_t)fakeFreeDiskSpace
{
  return self->_fakeFreeDiskSpace;
}

- (void)setFakeFreeDiskSpace:(unint64_t)a3
{
  self->_fakeFreeDiskSpace = a3;
}

- (BOOL)abortAfterReplacingDatabase
{
  return self->_abortAfterReplacingDatabase;
}

- (void)setAbortAfterReplacingDatabase:(BOOL)a3
{
  self->_abortAfterReplacingDatabase = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mergePolicy, 0);
  objc_storeStrong((id *)&self->_storeType, 0);
  objc_storeStrong((id *)&self->_storeURL, 0);
  objc_storeStrong((id *)&self->_storeOptions, 0);
}

void __43__ICPersistentContainer_managedObjectModel__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_0_4(&dword_1DDAA5000, v0, v1, "Could not find URL for managed object model", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3_0();
}

+ (void)oldManagedObjectModel
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0(&dword_1DDAA5000, v0, v1, "Initializing old managed object model from %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)migrateFromOldDataModel
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_0_2(&dword_1DDAA5000, v0, v1, "Trying to migrate using the old data model", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3_0();
}

void __48__ICPersistentContainer_migrateFromOldDataModel__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_0_2(&dword_1DDAA5000, v0, v1, "Successfully loaded persistent store using old data model", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3_0();
}

void __48__ICPersistentContainer_migrateFromOldDataModel__block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1DDAA5000, v0, v1, "Error loading persistent store using old data model: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)loadPersistentStore:storeCreatedHandler:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1DDAA5000, v0, v1, "Exiting due to failure to open the database: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __65__ICPersistentContainer_loadPersistentStore_storeCreatedHandler___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_0_2(&dword_1DDAA5000, v0, v1, "Trying to load persistent store again", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3_0();
}

void __65__ICPersistentContainer_loadPersistentStore_storeCreatedHandler___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_0_2(&dword_1DDAA5000, v0, v1, "Successfully loaded store in-process", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3_0();
}

void __65__ICPersistentContainer_loadPersistentStore_storeCreatedHandler___block_invoke_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1DDAA5000, v0, v1, "Error loading persistent store in-process with SQLite: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __65__ICPersistentContainer_loadPersistentStore_storeCreatedHandler___block_invoke_cold_5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1DDAA5000, v0, v1, "Error creating persistent store: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __65__ICPersistentContainer_loadPersistentStore_storeCreatedHandler___block_invoke_21_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0(&dword_1DDAA5000, v0, v1, "Loaded persistent store %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __65__ICPersistentContainer_loadPersistentStore_storeCreatedHandler___block_invoke_21_cold_2(void *a1, NSObject *a2)
{
  void *v4;
  int v5;
  void *v6;
  __int16 v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138412546;
  v6 = a1;
  v7 = 2112;
  v8 = v4;
  _os_log_fault_impl(&dword_1DDAA5000, a2, OS_LOG_TYPE_FAULT, "Unexpected error while opening database %@, %@", (uint8_t *)&v5, 0x16u);

  OUTLINED_FUNCTION_11();
}

void __65__ICPersistentContainer_loadPersistentStore_storeCreatedHandler___block_invoke_21_cold_3()
{
  uint64_t v0;
  NSObject *v1;
  uint8_t v2[14];
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_10_0();
  v3 = v0;
  OUTLINED_FUNCTION_9_0(&dword_1DDAA5000, v1, (uint64_t)v1, "Error loading persistent store %@: %@", v2);
  OUTLINED_FUNCTION_1();
}

void __65__ICPersistentContainer_loadPersistentStore_storeCreatedHandler___block_invoke_31_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_0_2(&dword_1DDAA5000, v0, v1, "Successfully loaded persistent store on the second try", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3_0();
}

void __65__ICPersistentContainer_loadPersistentStore_storeCreatedHandler___block_invoke_31_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1DDAA5000, v0, v1, "Error trying to load persistent store again: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)isTooLowOnDiskSpace
{
  uint8_t v3[24];
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "fakeFreeDiskSpace");
  OUTLINED_FUNCTION_1_0();
  _os_log_debug_impl(&dword_1DDAA5000, a2, OS_LOG_TYPE_DEBUG, "Using fake free disk space: %lu", v3, 0xCu);
}

- (void)vacuumStoreWithCompletionHandler:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0(&dword_1DDAA5000, v0, v1, "Vaccuming persistent store at %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __58__ICPersistentContainer_vacuumStoreWithCompletionHandler___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1DDAA5000, a2, a3, "Vacuumed persistent store at %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __58__ICPersistentContainer_vacuumStoreWithCompletionHandler___block_invoke_cold_2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1DDAA5000, a2, a3, "Error vaccuming store at %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

@end
