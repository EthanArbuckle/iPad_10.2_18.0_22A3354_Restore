@implementation ULPersistenceManager

- (ULPersistenceManager)init
{
  void *v3;
  void *v4;
  ULPersistenceManager *v5;

  +[ULPersistenceManager defaultModelsDirectory](ULPersistenceManager, "defaultModelsDirectory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ULPersistenceManager _getDefaultStoresDirectory](self, "_getDefaultStoresDirectory");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[ULPersistenceManager initWithModelsDirectory:storesDirectory:useWal:](self, "initWithModelsDirectory:storesDirectory:useWal:", v3, v4, 1);

  return v5;
}

- (ULPersistenceManager)initWithModelsDirectory:(id)a3 storesDirectory:(id)a4 useWal:(BOOL)a5
{
  return -[ULPersistenceManager initWithModelsDirectory:storesDirectory:managedObjectModel:useWal:](self, "initWithModelsDirectory:storesDirectory:managedObjectModel:useWal:", a3, a4, 0, a5);
}

- (ULPersistenceManager)initWithModelsDirectory:(id)a3 storesDirectory:(id)a4 managedObjectModel:(id)a5 useWal:(BOOL)a6
{
  _BOOL8 v6;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  Class SAPathInfoClass;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  NSObject *v37;
  void *v38;
  void *v39;
  id v40;
  void *v41;
  void *v42;
  NSObject *v43;
  dispatch_queue_t v44;
  ULPersistenceManager *v45;
  _QWORD v47[5];
  objc_super v48;
  void *v49;
  uint8_t buf[4];
  _BYTE v51[14];
  __int16 v52;
  void *v53;
  __int16 v54;
  void *v55;
  uint64_t v56;

  v6 = a6;
  v56 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (!objc_msgSend(v10, "isFileURL") || !objc_msgSend(v11, "isFileURL"))
    goto LABEL_19;
  v48.receiver = self;
  v48.super_class = (Class)ULPersistenceManager;
  self = -[ULPersistenceManager init](&v48, sel_init);
  if (self)
  {
    v13 = (void *)MEMORY[0x24BDBCF48];
    objc_msgSend(v10, "path");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "fileURLWithPath:isDirectory:", v14, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[ULPersistenceManager setModelsDirectory:](self, "setModelsDirectory:", v15);

    v16 = (void *)MEMORY[0x24BDBCF48];
    objc_msgSend(v11, "path");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "fileURLWithPath:isDirectory:", v17, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[ULPersistenceManager setStoresDirectory:](self, "setStoresDirectory:", v18);

    -[ULPersistenceManager setUseWal:](self, "setUseWal:", v6);
    -[ULPersistenceManager _enableConcurrencyDebug](self, "_enableConcurrencyDebug");
    if (onceToken_MicroLocation_Default != -1)
      dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_124);
    v19 = (void *)logObject_MicroLocation_Default;
    if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
    {
      v20 = v19;
      -[ULPersistenceManager storesDirectory](self, "storesDirectory");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "path");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[ULPersistenceManager modelsDirectory](self, "modelsDirectory");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "path");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 68289539;
      *(_DWORD *)v51 = 0;
      *(_WORD *)&v51[4] = 2082;
      *(_QWORD *)&v51[6] = "";
      v52 = 2113;
      v53 = v22;
      v54 = 2113;
      v55 = v24;
      _os_log_impl(&dword_2419D9000, v20, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"Initializing database\", \"store directory\":%{private, location:escape_only}@, \"model directory\":%{private, location:escape_only}@}", buf, 0x26u);

    }
    -[objc_class defaultManager](getSAPathManagerClass(), "defaultManager");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[ULPersistenceManager storesDirectory](self, "storesDirectory");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "path");
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    SAPathInfoClass = getSAPathInfoClass();
    objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", v27);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[objc_class pathInfoWithURL:](SAPathInfoClass, "pathInfoWithURL:", v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = v30;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v49, 1);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v47[0] = MEMORY[0x24BDAC760];
    v47[1] = 3221225472;
    v47[2] = __90__ULPersistenceManager_initWithModelsDirectory_storesDirectory_managedObjectModel_useWal___block_invoke;
    v47[3] = &unk_2511DBFC0;
    v47[4] = v27;
    objc_msgSend(v25, "registerPaths:forBundleID:completionHandler:", v31, CFSTR("com.apple.milod"), v47);

    if (v12)
    {
      -[ULPersistenceManager setManagedObjectModel:](self, "setManagedObjectModel:", v12);
    }
    else
    {
      v32 = objc_alloc(MEMORY[0x24BDBB6B0]);
      -[ULPersistenceManager modelsDirectory](self, "modelsDirectory");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = (void *)objc_msgSend(v32, "initWithContentsOfURL:", v33);
      -[ULPersistenceManager setManagedObjectModel:](self, "setManagedObjectModel:", v34);

    }
    -[ULPersistenceManager managedObjectModel](self, "managedObjectModel");
    v35 = (void *)objc_claimAutoreleasedReturnValue();

    if (v35)
    {
      if (onceToken_MicroLocation_Default != -1)
        dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_124);
      v36 = (void *)logObject_MicroLocation_Default;
      if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
      {
        v37 = v36;
        -[ULPersistenceManager managedObjectModel](self, "managedObjectModel");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "versionIdentifiers");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)v51 = v39;
        _os_log_impl(&dword_2419D9000, v37, OS_LOG_TYPE_DEFAULT, "Loaded ManagedObjectModel Version: %@", buf, 0xCu);

      }
      v40 = objc_alloc(MEMORY[0x24BDBB738]);
      -[ULPersistenceManager managedObjectModel](self, "managedObjectModel");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = (void *)objc_msgSend(v40, "initWithManagedObjectModel:", v41);
      -[ULPersistenceManager setPersistentStoreCoordinator:](self, "setPersistentStoreCoordinator:", v42);

      dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      v43 = objc_claimAutoreleasedReturnValue();
      v44 = dispatch_queue_create("com.apple.milod.ULPersistenceManager", v43);
      -[ULPersistenceManager setQueue:](self, "setQueue:", v44);

      goto LABEL_17;
    }

LABEL_19:
    v45 = 0;
    goto LABEL_20;
  }
LABEL_17:
  self = self;
  v45 = self;
LABEL_20:

  return v45;
}

void __90__ULPersistenceManager_initWithModelsDirectory_storesDirectory_managedObjectModel_useWal___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  const char *v6;
  NSObject *v7;
  os_log_type_t v8;
  uint32_t v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (v3)
  {
    if (onceToken_MicroLocation_Default != -1)
      dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_124);
    v4 = logObject_MicroLocation_Default;
    if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_ERROR))
    {
      v5 = *(_QWORD *)(a1 + 32);
      v12 = 138412546;
      v13 = v5;
      v14 = 2112;
      v15 = v3;
      v6 = "Failed to set space attribution for %@. Error: %@";
      v7 = v4;
      v8 = OS_LOG_TYPE_ERROR;
      v9 = 22;
LABEL_10:
      _os_log_impl(&dword_2419D9000, v7, v8, v6, (uint8_t *)&v12, v9);
    }
  }
  else
  {
    if (onceToken_MicroLocation_Default != -1)
      dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_124);
    v10 = logObject_MicroLocation_Default;
    if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
    {
      v11 = *(_QWORD *)(a1 + 32);
      v12 = 138412290;
      v13 = v11;
      v6 = "Set space attribution for %@";
      v7 = v10;
      v8 = OS_LOG_TYPE_DEFAULT;
      v9 = 12;
      goto LABEL_10;
    }
  }

}

- (BOOL)connectToStore
{
  ULPersistenceManager *v2;
  NSObject *v3;
  NSObject *v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  char v10;

  v2 = self;
  -[ULPersistenceManager queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_not_V2(v3);

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 1;
  -[ULPersistenceManager queue](v2, "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __38__ULPersistenceManager_connectToStore__block_invoke;
  v6[3] = &unk_2511DBFE8;
  v6[4] = v2;
  v6[5] = &v7;
  dispatch_sync(v4, v6);

  LOBYTE(v2) = *((_BYTE *)v8 + 24);
  _Block_object_dispose(&v7, 8);
  return (char)v2;
}

void __38__ULPersistenceManager_connectToStore__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  void *v5;
  ULPersistenceStore *v6;
  void *v7;
  void *v8;
  char v9;
  id v10;
  NSObject *v11;
  int v12;
  id v13;
  uint8_t buf[4];
  int v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  if ((objc_msgSend(*(id *)(a1 + 32), "_isStoreConnected") & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "_getLocalStoreURL");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if (onceToken_MicroLocation_Default != -1)
      dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_124);
    v3 = (void *)logObject_MicroLocation_Default;
    if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
    {
      v4 = v3;
      objc_msgSend(v2, "path");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 68289283;
      v15 = 0;
      v16 = 2082;
      v17 = "";
      v18 = 2113;
      v19 = v5;
      _os_log_impl(&dword_2419D9000, v4, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"Connecting to store\", \"store path\":%{private, location:escape_only}@}", buf, 0x1Cu);

    }
    v6 = -[ULPersistenceStore initWithURL:useWal:]([ULPersistenceStore alloc], "initWithURL:useWal:", v2, objc_msgSend(*(id *)(a1 + 32), "useWal"));
    objc_msgSend(*(id *)(a1 + 32), "setPersistenceStore:", v6);

    objc_msgSend(*(id *)(a1 + 32), "persistenceStore");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "persistentStoreCoordinator");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 0;
    v9 = objc_msgSend(v7, "loadWithCoordinator:error:", v8, &v13);
    v10 = v13;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v9;

    if (onceToken_MicroLocation_Default != -1)
      dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_124);
    v11 = logObject_MicroLocation_Default;
    if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
    {
      v12 = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
      *(_DWORD *)buf = 67109120;
      v15 = v12;
      _os_log_impl(&dword_2419D9000, v11, OS_LOG_TYPE_DEFAULT, "Connect to store result: %d", buf, 8u);
    }
    if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
      objc_msgSend(*(id *)(a1 + 32), "_handleDatabaseError:", v10);

  }
}

- (BOOL)_disconnectFromStore
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  NSObject *v13;
  void *v14;
  _BOOL4 v15;
  NSObject *v16;
  id v18;
  uint8_t buf[4];
  _BYTE v20[24];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  if (-[ULPersistenceManager _isStoreConnected](self, "_isStoreConnected"))
  {
    -[ULPersistenceManager persistentStoreCoordinator](self, "persistentStoreCoordinator");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "persistentStores");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "firstObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (onceToken_MicroLocation_Default != -1)
      dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_124);
    v6 = (void *)logObject_MicroLocation_Default;
    if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
    {
      v7 = v6;
      objc_msgSend(v5, "URL");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "path");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 68289283;
      *(_DWORD *)v20 = 0;
      *(_WORD *)&v20[4] = 2082;
      *(_QWORD *)&v20[6] = "";
      *(_WORD *)&v20[14] = 2113;
      *(_QWORD *)&v20[16] = v9;
      _os_log_impl(&dword_2419D9000, v7, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"Disconnecting from store\", \"store path\":%{private, location:escape_only}@}", buf, 0x1Cu);

    }
    -[ULPersistenceManager persistentStoreCoordinator](self, "persistentStoreCoordinator");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 0;
    objc_msgSend(v10, "removePersistentStore:error:", v5, &v18);
    v11 = v18;

    if (v11)
    {
      if (onceToken_MicroLocation_Default != -1)
        dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_124);
      v12 = (void *)logObject_MicroLocation_Default;
      if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_ERROR))
      {
        v13 = v12;
        objc_msgSend(v5, "URL");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        *(_QWORD *)v20 = v14;
        *(_WORD *)&v20[8] = 2112;
        *(_QWORD *)&v20[10] = v11;
        _os_log_impl(&dword_2419D9000, v13, OS_LOG_TYPE_ERROR, "Failed to disconnect from store %@ with error %@", buf, 0x16u);

      }
    }
    v15 = !-[ULPersistenceManager _isStoreConnected](self, "_isStoreConnected");
    if (onceToken_MicroLocation_Default != -1)
      dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_124);
    v16 = logObject_MicroLocation_Default;
    if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)v20 = v15;
      _os_log_impl(&dword_2419D9000, v16, OS_LOG_TYPE_DEFAULT, "Disconnect from store result: %d", buf, 8u);
    }

  }
  else
  {
    LOBYTE(v15) = 1;
  }
  return v15;
}

- (BOOL)disconnectFromStore
{
  ULPersistenceManager *v2;
  NSObject *v3;
  NSObject *v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  char v10;

  v2 = self;
  -[ULPersistenceManager queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_not_V2(v3);

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 1;
  -[ULPersistenceManager queue](v2, "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __43__ULPersistenceManager_disconnectFromStore__block_invoke;
  v6[3] = &unk_2511D2E30;
  v6[4] = v2;
  v6[5] = &v7;
  dispatch_sync(v4, v6);

  LOBYTE(v2) = *((_BYTE *)v8 + 24);
  _Block_object_dispose(&v7, 8);
  return (char)v2;
}

uint64_t __43__ULPersistenceManager_disconnectFromStore__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_disconnectFromStore");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (id)createManagedObjectContext
{
  NSObject *v3;
  NSObject *v4;
  id v5;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  -[ULPersistenceManager queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_not_V2(v3);

  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__23;
  v12 = __Block_byref_object_dispose__23;
  v13 = 0;
  -[ULPersistenceManager queue](self, "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __50__ULPersistenceManager_createManagedObjectContext__block_invoke;
  v7[3] = &unk_2511DBFE8;
  v7[4] = self;
  v7[5] = &v8;
  dispatch_sync(v4, v7);

  v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v5;
}

uint64_t __50__ULPersistenceManager_createManagedObjectContext__block_invoke(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  result = objc_msgSend(*(id *)(a1 + 32), "_isStoreConnected");
  if ((_DWORD)result)
  {
    v3 = objc_msgSend(objc_alloc(MEMORY[0x24BDBB6A0]), "initWithConcurrencyType:", 1);
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v5 = *(void **)(v4 + 40);
    *(_QWORD *)(v4 + 40) = v3;

    objc_msgSend(MEMORY[0x24BDBB6C8], "errorMergePolicy");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "setMergePolicy:", v6);

    objc_msgSend(*(id *)(a1 + 32), "persistentStoreCoordinator");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "setPersistentStoreCoordinator:", v7);

    objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "processName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "setName:", v9);

    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "name");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "setTransactionAuthor:", v10);

    return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "setUndoManager:", 0);
  }
  return result;
}

+ (id)defaultModelsDirectory
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x24BDBCF48];
  objc_msgSend(MEMORY[0x24BDD1488], "ULFrameworkBundle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "pathForResource:ofType:", CFSTR("milo"), CFSTR("momd"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fileURLWithPath:isDirectory:", v4, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)defaultLocalStoreFilename
{
  return (id)objc_msgSend(CFSTR("milo"), "stringByAppendingPathExtension:", CFSTR("db"));
}

- (BOOL)_excludeDirectoryFromTimeMachineBackup:(id)a3
{
  return 1;
}

- (id)_getDefaultStoresDirectoryPathForCurrentPlatform
{
  void *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  uint8_t v7[16];

  objc_msgSend(MEMORY[0x24BDD1580], "userLibraryDirectoryPath");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "stringByAppendingPathComponent:", CFSTR("com.apple.milod"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (onceToken_MicroLocation_Default != -1)
      dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_124);
    v5 = logObject_MicroLocation_Default;
    if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_2419D9000, v5, OS_LOG_TYPE_ERROR, "Failed to resolve Cache Directory in User Space", v7, 2u);
    }
    v4 = 0;
  }

  return v4;
}

- (id)_getDefaultStoresDirectory
{
  void *v2;
  void *v3;
  char v4;
  void *v5;
  int v6;
  id v7;
  BOOL v8;
  NSObject *v9;
  void *v10;
  id v12;
  uint8_t buf[4];
  void *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  -[ULPersistenceManager _getDefaultStoresDirectoryPathForCurrentPlatform](self, "_getDefaultStoresDirectoryPathForCurrentPlatform");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "fileExistsAtPath:", v2);

  if ((v4 & 1) != 0
    || ((objc_msgSend(MEMORY[0x24BDD1580], "defaultManager"),
         v5 = (void *)objc_claimAutoreleasedReturnValue(),
         v12 = 0,
         v6 = objc_msgSend(v5, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v2, 1, 0, &v12), v7 = v12, v5, v6)? (v8 = v7 == 0): (v8 = 0), v8))
  {
    objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:isDirectory:", v2, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (onceToken_MicroLocation_Default != -1)
      dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_124);
    v9 = logObject_MicroLocation_Default;
    if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v14 = v2;
      v15 = 2112;
      v16 = v7;
      _os_log_impl(&dword_2419D9000, v9, OS_LOG_TYPE_ERROR, "Failed to create %@, error, %@", buf, 0x16u);
    }

    v10 = 0;
  }

  return v10;
}

- (BOOL)_isStoreConnected
{
  void *v2;
  void *v3;
  BOOL v4;

  -[ULPersistenceManager persistentStoreCoordinator](self, "persistentStoreCoordinator");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "persistentStores");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count") != 0;

  return v4;
}

- (id)_getLocalStoreURL
{
  void *v2;
  void *v3;
  void *v4;

  -[ULPersistenceManager storesDirectory](self, "storesDirectory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[ULPersistenceManager defaultLocalStoreFilename](ULPersistenceManager, "defaultLocalStoreFilename");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLByAppendingPathComponent:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)isStoreConnected
{
  ULPersistenceManager *v2;
  NSObject *v3;
  NSObject *v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  char v10;

  v2 = self;
  -[ULPersistenceManager queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_not_V2(v3);

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  -[ULPersistenceManager queue](v2, "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __40__ULPersistenceManager_isStoreConnected__block_invoke;
  v6[3] = &unk_2511D2E30;
  v6[4] = v2;
  v6[5] = &v7;
  dispatch_sync(v4, v6);

  LOBYTE(v2) = *((_BYTE *)v8 + 24);
  _Block_object_dispose(&v7, 8);
  return (char)v2;
}

uint64_t __40__ULPersistenceManager_isStoreConnected__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_isStoreConnected");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (id)getLocalStoreURL
{
  NSObject *v3;
  NSObject *v4;
  id v5;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  -[ULPersistenceManager queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_not_V2(v3);

  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__23;
  v12 = __Block_byref_object_dispose__23;
  v13 = 0;
  -[ULPersistenceManager queue](self, "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __40__ULPersistenceManager_getLocalStoreURL__block_invoke;
  v7[3] = &unk_2511D2E30;
  v7[4] = self;
  v7[5] = &v8;
  dispatch_sync(v4, v7);

  v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v5;
}

void __40__ULPersistenceManager_getLocalStoreURL__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_getLocalStoreURL");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (BOOL)_isMainDatabase
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[ULPersistenceManager _getDefaultStoresDirectory](self, "_getDefaultStoresDirectory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[ULPersistenceManager defaultLocalStoreFilename](ULPersistenceManager, "defaultLocalStoreFilename");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "URLByAppendingPathComponent:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[ULPersistenceManager _getLocalStoreURL](self, "_getLocalStoreURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = objc_msgSend(v6, "isEqual:", v5);

  return (char)v3;
}

- (BOOL)isMainDatabase
{
  ULPersistenceManager *v2;
  NSObject *v3;
  NSObject *v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  char v10;

  v2 = self;
  -[ULPersistenceManager queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_not_V2(v3);

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  -[ULPersistenceManager queue](v2, "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __38__ULPersistenceManager_isMainDatabase__block_invoke;
  v6[3] = &unk_2511D2E30;
  v6[4] = v2;
  v6[5] = &v7;
  dispatch_sync(v4, v6);

  LOBYTE(v2) = *((_BYTE *)v8 + 24);
  _Block_object_dispose(&v7, 8);
  return (char)v2;
}

uint64_t __38__ULPersistenceManager_isMainDatabase__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_isMainDatabase");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (BOOL)destroyStore
{
  ULPersistenceManager *v2;
  NSObject *v3;
  NSObject *v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  char v10;

  v2 = self;
  -[ULPersistenceManager queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_not_V2(v3);

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  -[ULPersistenceManager queue](v2, "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __36__ULPersistenceManager_destroyStore__block_invoke;
  v6[3] = &unk_2511D2E30;
  v6[4] = v2;
  v6[5] = &v7;
  dispatch_sync(v4, v6);

  LOBYTE(v2) = *((_BYTE *)v8 + 24);
  _Block_object_dispose(&v7, 8);
  return (char)v2;
}

uint64_t __36__ULPersistenceManager_destroyStore__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_destroyStore");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (BOOL)_destroyStore
{
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  char v19;
  id v20;
  NSObject *v21;
  NSObject *v22;
  id v24;
  uint8_t buf[4];
  int v26;
  __int16 v27;
  const char *v28;
  __int16 v29;
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  -[ULPersistenceManager persistenceStore](self, "persistenceStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "storeDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (onceToken_MicroLocation_Default != -1)
    dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_124);
  v5 = (void *)logObject_MicroLocation_Default;
  if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_ERROR))
  {
    v6 = v5;
    objc_msgSend(v4, "URL");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "path");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 68289283;
    v26 = 0;
    v27 = 2082;
    v28 = "";
    v29 = 2113;
    v30 = v8;
    _os_log_impl(&dword_2419D9000, v6, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"Destroying local store\", \"store path\":%{private, location:escape_only}@}", buf, 0x1Cu);

  }
  if (onceToken_MicroLocation_Default != -1)
    dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_124);
  v9 = (void *)logObject_MicroLocation_Default;
  if (os_signpost_enabled((os_log_t)logObject_MicroLocation_Default))
  {
    v10 = v9;
    objc_msgSend(v4, "URL");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "path");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 68289283;
    v26 = 0;
    v27 = 2082;
    v28 = "";
    v29 = 2113;
    v30 = v12;
    _os_signpost_emit_with_name_impl(&dword_2419D9000, v10, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Destroying local store", "{\"msg%{public}.0s\":\"Destroying local store\", \"store path\":%{private, location:escape_only}@}", buf, 0x1Cu);

  }
  if (-[ULPersistenceManager _disconnectFromStore](self, "_disconnectFromStore"))
  {
    v13 = objc_alloc(MEMORY[0x24BDBB738]);
    -[ULPersistenceManager managedObjectModel](self, "managedObjectModel");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(v13, "initWithManagedObjectModel:", v14);

    objc_msgSend(v4, "URL");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "type");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "options");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = 0;
    v19 = objc_msgSend(v15, "destroyPersistentStoreAtURL:withType:options:error:", v16, v17, v18, &v24);
    v20 = v24;

    if ((v19 & 1) == 0)
    {
      if (onceToken_MicroLocation_Default != -1)
        dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_124);
      v21 = logObject_MicroLocation_Default;
      if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 68289282;
        v26 = 0;
        v27 = 2082;
        v28 = "";
        v29 = 2114;
        v30 = v20;
        _os_log_impl(&dword_2419D9000, v21, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"Destroy store failed with error\", \"error\":%{public, location:escape_only}@}", buf, 0x1Cu);
      }
      if (onceToken_MicroLocation_Default != -1)
        dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_124);
      v22 = logObject_MicroLocation_Default;
      if (os_signpost_enabled((os_log_t)logObject_MicroLocation_Default))
      {
        *(_DWORD *)buf = 68289282;
        v26 = 0;
        v27 = 2082;
        v28 = "";
        v29 = 2114;
        v30 = v20;
        _os_signpost_emit_with_name_impl(&dword_2419D9000, v22, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Destroy store failed with error", "{\"msg%{public}.0s\":\"Destroy store failed with error\", \"error\":%{public, location:escape_only}@}", buf, 0x1Cu);
      }
    }

  }
  else
  {
    v19 = 0;
  }

  return v19;
}

- (void)handleDatabaseError:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  id v7;
  _QWORD block[5];
  id v9;

  v4 = a3;
  -[ULPersistenceManager queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_not_V2(v5);

  -[ULPersistenceManager queue](self, "queue");
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __44__ULPersistenceManager_handleDatabaseError___block_invoke;
  block[3] = &unk_2511D2CA8;
  block[4] = self;
  v9 = v4;
  v7 = v4;
  dispatch_sync(v6, block);

}

uint64_t __44__ULPersistenceManager_handleDatabaseError___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleDatabaseError:", *(_QWORD *)(a1 + 40));
}

- (void)_handleDatabaseError:(id)a3
{
  _BOOL4 v4;
  void *v5;
  void *v6;
  uint64_t v7;
  int v8;
  void *v9;
  void *v10;
  int v11;
  id v13;

  v13 = a3;
  v4 = -[ULPersistenceManager _isMainDatabase](self, "_isMainDatabase");
  v5 = v13;
  if (v4)
  {
    objc_msgSend(v13, "domain");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *MEMORY[0x24BDBB568];
    v8 = objc_msgSend(v6, "isEqualToString:", *MEMORY[0x24BDBB568]);

    if (v8)
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v13, "code"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v13, "userInfo");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "objectForKeyedSubscript:", v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

    }
    v11 = objc_msgSend(v9, "intValue");
    if (v11 == 26 || v11 == 11)
    {
      -[ULPersistenceManager _handleCorruptedDatabase:](self, "_handleCorruptedDatabase:", v13);
      -[ULPersistenceManager _exitProcessWithFailureCode](self, "_exitProcessWithFailureCode");
    }

    v5 = v13;
  }

}

- (void)_exitProcessWithFailureCode
{
  exit(1);
}

- (void)_handleCorruptedDatabase:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  int v12;
  int v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  id v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[ULPersistenceManager _getLocalStoreURL](self, "_getLocalStoreURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (onceToken_MicroLocation_Default != -1)
    dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_124);
  v6 = (void *)logObject_MicroLocation_Default;
  if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_FAULT))
  {
    v7 = v6;
    objc_msgSend(v5, "path");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 68289539;
    v13 = 0;
    v14 = 2082;
    v15 = "";
    v16 = 2114;
    v17 = v4;
    v18 = 2113;
    v19 = v8;
    _os_log_impl(&dword_2419D9000, v7, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"Sqlite returned error indicating database corruption. deleting database and exiting\", \"error\":%{public, location:escape_only}@, \"store path\":%{private, location:escape_only}@}", (uint8_t *)&v12, 0x26u);

  }
  if (onceToken_MicroLocation_Default != -1)
    dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_124);
  v9 = (void *)logObject_MicroLocation_Default;
  if (os_signpost_enabled((os_log_t)logObject_MicroLocation_Default))
  {
    v10 = v9;
    objc_msgSend(v5, "path");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 68289539;
    v13 = 0;
    v14 = 2082;
    v15 = "";
    v16 = 2114;
    v17 = v4;
    v18 = 2113;
    v19 = v11;
    _os_signpost_emit_with_name_impl(&dword_2419D9000, v10, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Sqlite returned error indicating database corruption. deleting database and exiting", "{\"msg%{public}.0s\":\"Sqlite returned error indicating database corruption. deleting database and exiting\", \"error\":%{public, location:escape_only}@, \"store path\":%{private, location:escape_only}@}", (uint8_t *)&v12, 0x26u);

  }
  if (-[ULPersistenceManager _disconnectFromStore](self, "_disconnectFromStore")
    && !-[ULPersistenceManager _destroyStore](self, "_destroyStore"))
  {
    -[ULPersistenceManager _deleteDatabaseFilesAtPath:](self, "_deleteDatabaseFilesAtPath:", v5);
  }

}

- (void)_deleteDatabaseFilesAtPath:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  char v19;
  id v20;
  NSObject *v21;
  NSObject *v22;
  void *v23;
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint8_t buf[4];
  int v30;
  __int16 v31;
  const char *v32;
  __int16 v33;
  void *v34;
  __int16 v35;
  id v36;
  _BYTE v37[128];
  _QWORD v38[5];

  v38[3] = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "path");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v38[0] = v5;
  objc_msgSend(v3, "path");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringByAppendingString:", CFSTR("-wal"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v38[1] = v7;
  v23 = v3;
  objc_msgSend(v3, "path");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringByAppendingString:", CFSTR("-shm"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v38[2] = v9;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v38, 3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (onceToken_MicroLocation_Default != -1)
    dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_124);
  v11 = logObject_MicroLocation_Default;
  if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 68289283;
    v30 = 0;
    v31 = 2082;
    v32 = "";
    v33 = 2113;
    v34 = v10;
    _os_log_impl(&dword_2419D9000, v11, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"Deleting store files\", \"store files\":%{private, location:escape_only}@}", buf, 0x1Cu);
  }
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v12 = v10;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v25, v37, 16);
  if (v13)
  {
    v14 = v13;
    v15 = 0;
    v16 = *(_QWORD *)v26;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v26 != v16)
          objc_enumerationMutation(v12);
        v18 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * v17);
        if (objc_msgSend(v4, "fileExistsAtPath:", v18))
        {
          v24 = v15;
          v19 = objc_msgSend(v4, "removeItemAtPath:error:", v18, &v24);
          v20 = v24;

          if ((v19 & 1) == 0)
          {
            if (onceToken_MicroLocation_Default != -1)
              dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_124);
            v21 = logObject_MicroLocation_Default;
            if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 68289539;
              v30 = 0;
              v31 = 2082;
              v32 = "";
              v33 = 2113;
              v34 = v18;
              v35 = 2114;
              v36 = v20;
              _os_log_impl(&dword_2419D9000, v21, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"Failed to delete file\", \"filePath\":%{private, location:escape_only}@, \"error\":%{public, location:escape_only}@}", buf, 0x26u);
            }
            if (onceToken_MicroLocation_Default != -1)
              dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_124);
            v22 = logObject_MicroLocation_Default;
            if (os_signpost_enabled((os_log_t)logObject_MicroLocation_Default))
            {
              *(_DWORD *)buf = 68289539;
              v30 = 0;
              v31 = 2082;
              v32 = "";
              v33 = 2113;
              v34 = v18;
              v35 = 2114;
              v36 = v20;
              _os_signpost_emit_with_name_impl(&dword_2419D9000, v22, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Failed to delete file", "{\"msg%{public}.0s\":\"Failed to delete file\", \"filePath\":%{private, location:escape_only}@, \"error\":%{public, location:escape_only}@}", buf, 0x26u);
            }
          }
          v15 = v20;
        }
        ++v17;
      }
      while (v14 != v17);
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v25, v37, 16);
    }
    while (v14);
  }
  else
  {
    v15 = 0;
  }

}

- (NSURL)modelsDirectory
{
  return self->_modelsDirectory;
}

- (void)setModelsDirectory:(id)a3
{
  objc_storeStrong((id *)&self->_modelsDirectory, a3);
}

- (NSURL)storesDirectory
{
  return self->_storesDirectory;
}

- (void)setStoresDirectory:(id)a3
{
  objc_storeStrong((id *)&self->_storesDirectory, a3);
}

- (BOOL)useWal
{
  return self->_useWal;
}

- (void)setUseWal:(BOOL)a3
{
  self->_useWal = a3;
}

- (NSManagedObjectModel)managedObjectModel
{
  return self->_managedObjectModel;
}

- (void)setManagedObjectModel:(id)a3
{
  objc_storeStrong((id *)&self->_managedObjectModel, a3);
}

- (NSPersistentStoreCoordinator)persistentStoreCoordinator
{
  return self->_persistentStoreCoordinator;
}

- (void)setPersistentStoreCoordinator:(id)a3
{
  objc_storeStrong((id *)&self->_persistentStoreCoordinator, a3);
}

- (ULPersistenceStore)persistenceStore
{
  return self->_persistenceStore;
}

- (void)setPersistenceStore:(id)a3
{
  objc_storeStrong((id *)&self->_persistenceStore, a3);
}

- (ULDataContainer)dataContainer
{
  return self->_dataContainer;
}

- (void)setDataContainer:(id)a3
{
  objc_storeStrong((id *)&self->_dataContainer, a3);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_dataContainer, 0);
  objc_storeStrong((id *)&self->_persistenceStore, 0);
  objc_storeStrong((id *)&self->_persistentStoreCoordinator, 0);
  objc_storeStrong((id *)&self->_managedObjectModel, 0);
  objc_storeStrong((id *)&self->_storesDirectory, 0);
  objc_storeStrong((id *)&self->_modelsDirectory, 0);
}

@end
