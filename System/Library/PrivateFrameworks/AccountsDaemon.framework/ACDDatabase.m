@implementation ACDDatabase

- (id)createConnection
{
  ACDDatabaseConnection *v3;

  v3 = -[ACDDatabaseConnection initWithPersistentStoreCoordinator:]([ACDDatabaseConnection alloc], "initWithPersistentStoreCoordinator:", self->_persistentStoreCoordinator);
  -[ACDDatabaseConnection setDelegate:](v3, "setDelegate:", self);
  return v3;
}

+ (id)new
{
  objc_msgSend(a1, "doesNotRecognizeSelector:", a2);
  return 0;
}

- (ACDDatabase)init
{
  -[ACDDatabase doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

- (ACDDatabase)initWithDatabaseURL:(id)a3
{
  uint64_t v4;
  void *v5;
  id v6;
  void *v7;
  ACDDatabase *v8;
  _QWORD v10[3];
  _QWORD v11[4];

  v11[3] = *MEMORY[0x24BDAC8D0];
  v4 = *MEMORY[0x24BDBB488];
  v10[0] = *MEMORY[0x24BDBB420];
  v10[1] = v4;
  v11[0] = MEMORY[0x24BDBD1C8];
  v11[1] = MEMORY[0x24BDBD1C0];
  v10[2] = *MEMORY[0x24BDBB4F8];
  v11[2] = *MEMORY[0x24BDD0CF8];
  v5 = (void *)MEMORY[0x24BDBCE70];
  v6 = a3;
  objc_msgSend(v5, "dictionaryWithObjects:forKeys:count:", v11, v10, 3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[ACDDatabase initWithDatabaseURL:storeOptions:](self, "initWithDatabaseURL:storeOptions:", v6, v7);

  return v8;
}

- (ACDDatabase)initWithDatabaseURL:(id)a3 storeOptions:(id)a4
{
  id v8;
  id v9;
  ACDDatabase *v10;
  ACDDatabase *v11;
  uint64_t v12;
  NSDictionary *storeOptions;
  void *v14;
  uint64_t v15;
  NSPersistentStoreCoordinator *persistentStoreCoordinator;
  uint64_t v17;
  NSDictionary *v18;
  void *v19;
  id v20;
  NSObject *v21;
  NSObject *v22;
  _BOOL4 v23;
  void *v24;
  void *v25;
  NSPersistentStoreCoordinator *v26;
  void *v27;
  ACDDatabaseInitializer *v28;
  BOOL v29;
  id v30;
  uint64_t v31;
  void *v33;
  void *v34;
  NSObject *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  id v49;
  _QWORD v50[4];
  NSObject *v51;
  id v52;
  objc_super v53;

  v8 = a3;
  v9 = a4;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ACDDatabase.m"), 90, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("databaseURL"));

  }
  if ((objc_msgSend(v8, "isFileURL") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ACDDatabase.m"), 92, CFSTR("Attempt to initialize database with non-file URL!"));

  }
  v53.receiver = self;
  v53.super_class = (Class)ACDDatabase;
  v10 = -[ACDDatabase init](&v53, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_databaseURL, a3);
    v12 = objc_msgSend(v9, "copy");
    storeOptions = v11->_storeOptions;
    v11->_storeOptions = (NSDictionary *)v12;

    _ACDManagedObjectModel();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(objc_alloc(MEMORY[0x24BDBB738]), "initWithManagedObjectModel:", v14);
    persistentStoreCoordinator = v11->_persistentStoreCoordinator;
    v11->_persistentStoreCoordinator = (NSPersistentStoreCoordinator *)v15;

    v17 = *MEMORY[0x24BDBB580];
    v18 = v11->_storeOptions;
    v52 = 0;
    -[ACDDatabase _addPersistentStoreWithType:configuration:URL:options:error:](v11, "_addPersistentStoreWithType:configuration:URL:options:error:", v17, 0, v8, v18, &v52);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v52;
    _ACDLogSystem();
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = v21;
    if (v19)
    {
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
        -[ACDDatabase initWithDatabaseURL:storeOptions:].cold.4((uint64_t *)&v11->_storeOptions, v22);
    }
    else
    {
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        -[ACDDatabase initWithDatabaseURL:storeOptions:].cold.3((uint64_t *)&v11->_storeOptions, (uint64_t)v20, v22);

      v23 = -[ACDDatabase _shouldResetPersistentStoreAfterError:](v11, "_shouldResetPersistentStoreAfterError:", v20);
      if (v20)
      {
        +[ACDEventLedger sharedLedger](ACDEventLedger, "sharedLedger");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "description");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "recordEvent:", v25);

      }
      if (!v23)
      {
LABEL_16:
        if (objc_msgSend(v20, "ac_isDiskFullSQLError"))
        {
          _ACDLogSystem();
          v35 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
            -[ACDDatabase initWithDatabaseURL:storeOptions:].cold.1(v35, v36, v37, v38, v39, v40, v41, v42);
        }
        else
        {
          v49 = 0;
          -[ACDDatabase createConnection](v11, "createConnection");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v28 = -[ACDDatabaseInitializer initWithDatabaseConnection:]([ACDDatabaseInitializer alloc], "initWithDatabaseConnection:", v27);
          v29 = -[ACDDatabaseInitializer updateDefaultContentIfNecessary:](v28, "updateDefaultContentIfNecessary:", &v49);

          v30 = v49;
          v31 = (uint64_t)v30;
          if (v29)
          {

            goto LABEL_19;
          }
          _ACDLogSystem();
          v35 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
            -[ACDDatabase initWithDatabaseURL:storeOptions:].cold.2(v31, v35, v43, v44, v45, v46, v47, v48);
        }

        exit(0);
      }
      v26 = v11->_persistentStoreCoordinator;
      v50[0] = MEMORY[0x24BDAC760];
      v50[1] = 3221225472;
      v50[2] = __48__ACDDatabase_initWithDatabaseURL_storeOptions___block_invoke;
      v50[3] = &unk_24C7E2130;
      v51 = v11;
      -[NSPersistentStoreCoordinator performBlockAndWait:](v26, "performBlockAndWait:", v50);
      v22 = v51;
    }

    goto LABEL_16;
  }
LABEL_19:

  return v11;
}

void __48__ACDDatabase_initWithDatabaseURL_storeOptions___block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  id v3;
  NSObject *v4;
  void *v5;
  id v6;
  uint8_t buf[4];
  void *v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v1 = *(void **)(a1 + 32);
  v6 = 0;
  v2 = objc_msgSend(v1, "_persistentStoreCoodinator_resetPersistentStoreCoordinatorWithError:", &v6);
  v3 = v6;
  _ACDLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v8 = v5;
    v9 = 2112;
    v10 = v3;
    _os_log_impl(&dword_20D8CB000, v4, OS_LOG_TYPE_DEFAULT, "\"Reset persistentStoreCoordinator, success: %@, error: %@\", buf, 0x16u);

  }
}

- (id)_backupURL
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  -[ACDDatabase databaseURL](self, "databaseURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lastPathComponent");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[ACDDatabase databaseURL](self, "databaseURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "URLByDeletingLastPathComponent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "URLByAppendingPathComponent:isDirectory:", CFSTR("VerifiedBackup"), 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "URLByAppendingPathComponent:isDirectory:", v4, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)_unverifiedBackupURL
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  -[ACDDatabase databaseURL](self, "databaseURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lastPathComponent");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[ACDDatabase databaseURL](self, "databaseURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "URLByDeletingLastPathComponent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "URLByAppendingPathComponent:isDirectory:", CFSTR("UnverifiedBackup"), 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "URLByAppendingPathComponent:isDirectory:", v4, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (BOOL)performBackupReturningError:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  id v10;
  void *v11;
  void *v12;
  char v13;
  id v14;
  BOOL v15;
  void *v16;
  id v18;
  id v19;

  -[ACDDatabase _backupURL](self, "_backupURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACDDatabase _unverifiedBackupURL](self, "_unverifiedBackupURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "URLByDeletingLastPathComponent");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0;
  v9 = objc_msgSend(v8, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v7, 1, 0, &v19);
  v10 = v19;

  if ((v9 & 1) != 0)
  {
    objc_msgSend(v6, "URLByDeletingLastPathComponent");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v10;
    v13 = objc_msgSend(v12, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v11, 1, 0, &v18);
    v14 = v18;

    if ((v13 & 1) != 0)
    {
      v15 = -[ACDDatabase _performBackupToURL:unverifiedBackupURL:error:](self, "_performBackupToURL:unverifiedBackupURL:error:", v5, v6, a3);
      objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "removeItemAtURL:error:", v11, 0);

    }
    else
    {
      v15 = 0;
      if (a3)
        *a3 = objc_retainAutorelease(v14);
    }

  }
  else if (a3)
  {
    v14 = objc_retainAutorelease(v10);
    v15 = 0;
    *a3 = v14;
  }
  else
  {
    v15 = 0;
    v14 = v10;
  }

  return v15;
}

- (BOOL)restoreFromBackupReturningError:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  char v8;
  NSPersistentStoreCoordinator *persistentStoreCoordinator;
  BOOL v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD v20[5];
  id v21;
  uint64_t *v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  char v33;

  -[ACDDatabase _backupURL](self, "_backupURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "path");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "fileExistsAtPath:", v7);

  if ((v8 & 1) != 0)
  {
    v30 = 0;
    v31 = &v30;
    v32 = 0x2020000000;
    v33 = 0;
    v24 = 0;
    v25 = &v24;
    v26 = 0x3032000000;
    v27 = __Block_byref_object_copy__2;
    v28 = __Block_byref_object_dispose__2;
    v29 = 0;
    persistentStoreCoordinator = self->_persistentStoreCoordinator;
    v20[0] = MEMORY[0x24BDAC760];
    v20[1] = 3221225472;
    v20[2] = __47__ACDDatabase_restoreFromBackupReturningError___block_invoke;
    v20[3] = &unk_24C7E2298;
    v22 = &v30;
    v20[4] = self;
    v21 = v5;
    v23 = &v24;
    -[NSPersistentStoreCoordinator performBlockAndWait:](persistentStoreCoordinator, "performBlockAndWait:", v20);
    if (a3)
      *a3 = objc_retainAutorelease((id)v25[5]);
    v10 = *((_BYTE *)v31 + 24) != 0;

    _Block_object_dispose(&v24, 8);
    _Block_object_dispose(&v30, 8);
  }
  else
  {
    _ACDLogSystem();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[ACDDatabase restoreFromBackupReturningError:].cold.1(v11, v12, v13, v14, v15, v16, v17, v18);

    v10 = 0;
  }

  return v10;
}

void __47__ACDDatabase_restoreFromBackupReturningError___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;
  id obj;

  v3 = (_QWORD *)a1[4];
  v2 = a1[5];
  v5 = v3[2];
  v4 = v3[3];
  v6 = (void *)v3[1];
  v7 = *MEMORY[0x24BDBB580];
  v8 = *(_QWORD *)(a1[7] + 8);
  obj = *(id *)(v8 + 40);
  v9 = objc_msgSend(v6, "replacePersistentStoreAtURL:destinationOptions:withPersistentStoreFromURL:sourceOptions:storeType:error:", v4, v5, v2, v5, v7, &obj);
  objc_storeStrong((id *)(v8 + 40), obj);
  *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = v9;
  if (*(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24))
  {
    v11 = a1[4];
    v10 = a1[5];
    v12 = *(void **)(v11 + 8);
    v13 = *(_QWORD *)(v11 + 16);
    v14 = *(_QWORD *)(a1[7] + 8);
    v16 = *(id *)(v14 + 40);
    objc_msgSend(v12, "addPersistentStoreWithType:configuration:URL:options:error:", v7, 0, v10, v13, &v16);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)(v14 + 40), v16);
    *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = v15 != 0;

  }
}

- (BOOL)resetReturningError:(id *)a3
{
  NSPersistentStoreCoordinator *persistentStoreCoordinator;
  char v5;
  _QWORD v7[7];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  char v17;

  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 0;
  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__2;
  v12 = __Block_byref_object_dispose__2;
  v13 = 0;
  persistentStoreCoordinator = self->_persistentStoreCoordinator;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __35__ACDDatabase_resetReturningError___block_invoke;
  v7[3] = &unk_24C7E22C0;
  v7[4] = self;
  v7[5] = &v14;
  v7[6] = &v8;
  -[NSPersistentStoreCoordinator performBlockAndWait:](persistentStoreCoordinator, "performBlockAndWait:", v7);
  if (a3)
    *a3 = objc_retainAutorelease((id)v9[5]);
  v5 = *((_BYTE *)v15 + 24);
  _Block_object_dispose(&v8, 8);

  _Block_object_dispose(&v14, 8);
  return v5;
}

void __35__ACDDatabase_resetReturningError___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  char v4;
  id obj;

  v2 = (void *)a1[4];
  v3 = *(_QWORD *)(a1[6] + 8);
  obj = *(id *)(v3 + 40);
  v4 = objc_msgSend(v2, "_persistentStoreCoodinator_resetPersistentStoreCoordinatorWithError:", &obj);
  objc_storeStrong((id *)(v3 + 40), obj);
  *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = v4;
}

- (id)_addPersistentStoreWithType:(id)a3 configuration:(id)a4 URL:(id)a5 options:(id)a6 error:(id *)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  -[NSPersistentStoreCoordinator addPersistentStoreWithType:configuration:URL:options:error:](self->_persistentStoreCoordinator, "addPersistentStoreWithType:configuration:URL:options:error:", v12, v13, v14, v15, a7);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (BOOL)_shouldResetPersistentStoreAfterError:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  int v7;
  NSObject *v8;
  NSObject *v9;
  BOOL v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  _BOOL4 v19;
  id v20;
  NSObject *v21;
  NSObject *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  id v30;
  uint64_t v31;
  uint8_t buf[16];

  v4 = a3;
  if (objc_msgSend(v4, "code") == 134100)
  {
    _ACDLogSystem();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20D8CB000, v5, OS_LOG_TYPE_DEFAULT, "\"Attempting to migrate persistentStore...\", buf, 2u);
    }

    v6 = -[ACDDatabaseMigrator initForDatabaseAtURL:persistentStoreCoordinator:storeOptions:]([ACDDatabaseMigrator alloc], "initForDatabaseAtURL:persistentStoreCoordinator:storeOptions:", self->_databaseURL, self->_persistentStoreCoordinator, self->_storeOptions);
    v31 = 0;
    v7 = objc_msgSend(v6, "runReturningError:", &v31);
    _ACDLogSystem();
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (!v7)
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        -[ACDDatabase _shouldResetPersistentStoreAfterError:].cold.2(v9, v11, v12, v13, v14, v15, v16, v17);

      goto LABEL_13;
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20D8CB000, v9, OS_LOG_TYPE_DEFAULT, "\"Successfully migrated existing persistentStore!\", buf, 2u);
    }

  }
  if (!objc_msgSend(v4, "ac_isUnrecoverableDatabaseError"))
  {
    v10 = 0;
    goto LABEL_21;
  }
LABEL_13:
  _ACDLogSystem();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_20D8CB000, v18, OS_LOG_TYPE_DEFAULT, "\"Attempting to restore persistentStore...\", buf, 2u);
  }

  v30 = 0;
  v19 = -[ACDDatabase restoreFromBackupReturningError:](self, "restoreFromBackupReturningError:", &v30);
  v20 = v30;
  _ACDLogSystem();
  v21 = objc_claimAutoreleasedReturnValue();
  v22 = v21;
  if (v19)
  {
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20D8CB000, v22, OS_LOG_TYPE_DEFAULT, "\"Successfully restored persistentStore!\", buf, 2u);
    }
  }
  else if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
  {
    -[ACDDatabase _shouldResetPersistentStoreAfterError:].cold.1((uint64_t)v20, v22, v23, v24, v25, v26, v27, v28);
  }

  v10 = !v19;
LABEL_21:

  return v10;
}

- (BOOL)_performBackupToURL:(id)a3 unverifiedBackupURL:(id)a4 error:(id *)a5
{
  id v9;
  id v10;
  void *v11;
  NSPersistentStoreCoordinator *persistentStoreCoordinator;
  uint64_t v13;
  id v14;
  id v15;
  int v16;
  id v17;
  BOOL v18;
  NSPersistentStoreCoordinator *v19;
  void *v21;
  void *v22;
  _QWORD v23[5];
  id v24;
  id v25;
  uint64_t *v26;
  uint64_t *v27;
  _QWORD v28[5];
  id v29;
  uint64_t *v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t (*v35)(uint64_t, uint64_t);
  void (*v36)(uint64_t);
  id v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  char v41;

  v9 = a3;
  v10 = a4;
  v11 = v10;
  if (v9)
  {
    if (v10)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ACDDatabase.m"), 300, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("backupURL"));

    if (v11)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ACDDatabase.m"), 301, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("unverifiedBackupURL"));

LABEL_3:
  v38 = 0;
  v39 = &v38;
  v40 = 0x2020000000;
  v41 = 0;
  v32 = 0;
  v33 = &v32;
  v34 = 0x3032000000;
  v35 = __Block_byref_object_copy__2;
  v36 = __Block_byref_object_dispose__2;
  v37 = 0;
  persistentStoreCoordinator = self->_persistentStoreCoordinator;
  v13 = MEMORY[0x24BDAC760];
  v28[0] = MEMORY[0x24BDAC760];
  v28[1] = 3221225472;
  v28[2] = __61__ACDDatabase__performBackupToURL_unverifiedBackupURL_error___block_invoke;
  v28[3] = &unk_24C7E2298;
  v30 = &v38;
  v28[4] = self;
  v14 = v11;
  v29 = v14;
  v31 = &v32;
  -[NSPersistentStoreCoordinator performBlockAndWait:](persistentStoreCoordinator, "performBlockAndWait:", v28);
  if (!*((_BYTE *)v39 + 24))
  {
    if (a5)
    {
      v17 = objc_retainAutorelease((id)v33[5]);
      goto LABEL_9;
    }
LABEL_10:
    v18 = 0;
    goto LABEL_15;
  }
  v15 = objc_retainAutorelease(v14);
  objc_msgSend(v15, "fileSystemRepresentation");
  v16 = _sqlite3_integrity_check();
  if (v16)
  {
    if (a5)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDB4200], v16, 0);
      v17 = (id)objc_claimAutoreleasedReturnValue();
LABEL_9:
      v18 = 0;
      *a5 = v17;
      goto LABEL_15;
    }
    goto LABEL_10;
  }
  v19 = self->_persistentStoreCoordinator;
  v23[0] = v13;
  v23[1] = 3221225472;
  v23[2] = __61__ACDDatabase__performBackupToURL_unverifiedBackupURL_error___block_invoke_2;
  v23[3] = &unk_24C7E22E8;
  v26 = &v38;
  v23[4] = self;
  v24 = v9;
  v25 = v15;
  v27 = &v32;
  -[NSPersistentStoreCoordinator performBlockAndWait:](v19, "performBlockAndWait:", v23);
  v18 = *((_BYTE *)v39 + 24) != 0;
  if (a5 && !*((_BYTE *)v39 + 24))
    *a5 = objc_retainAutorelease((id)v33[5]);

LABEL_15:
  _Block_object_dispose(&v32, 8);

  _Block_object_dispose(&v38, 8);
  return v18;
}

void __61__ACDDatabase__performBackupToURL_unverifiedBackupURL_error___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  _QWORD *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  id obj;

  v3 = (_QWORD *)a1[4];
  v2 = a1[5];
  v4 = (void *)v3[1];
  v5 = v3[2];
  v6 = v3[3];
  v7 = *MEMORY[0x24BDBB580];
  v8 = *(_QWORD *)(a1[7] + 8);
  obj = *(id *)(v8 + 40);
  v9 = objc_msgSend(v4, "replacePersistentStoreAtURL:destinationOptions:withPersistentStoreFromURL:sourceOptions:storeType:error:", v2, v5, v6, v5, v7, &obj);
  objc_storeStrong((id *)(v8 + 40), obj);
  *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = v9;
}

void __61__ACDDatabase__performBackupToURL_unverifiedBackupURL_error___block_invoke_2(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  id obj;

  v3 = a1[4];
  v2 = a1[5];
  v4 = *(void **)(v3 + 8);
  v5 = *(_QWORD *)(v3 + 16);
  v6 = a1[6];
  v7 = *MEMORY[0x24BDBB580];
  v8 = *(_QWORD *)(a1[8] + 8);
  obj = *(id *)(v8 + 40);
  v9 = objc_msgSend(v4, "replacePersistentStoreAtURL:destinationOptions:withPersistentStoreFromURL:sourceOptions:storeType:error:", v2, v5, v6, v5, v7, &obj);
  objc_storeStrong((id *)(v8 + 40), obj);
  *(_BYTE *)(*(_QWORD *)(a1[7] + 8) + 24) = v9;
}

- (BOOL)_persistentStoreCoodinator_resetPersistentStoreCoordinatorWithError:(id *)a3
{
  NSURL *databaseURL;
  uint64_t v6;
  NSPersistentStoreCoordinator *persistentStoreCoordinator;
  NSDictionary *storeOptions;
  _BOOL4 v9;
  id v10;
  void *v11;
  NSURL *v12;
  NSDictionary *v13;
  void *v14;
  id v15;
  BOOL v16;
  id v18;
  id v19;

  databaseURL = self->_databaseURL;
  v6 = *MEMORY[0x24BDBB580];
  persistentStoreCoordinator = self->_persistentStoreCoordinator;
  storeOptions = self->_storeOptions;
  v19 = 0;
  v9 = -[NSPersistentStoreCoordinator destroyPersistentStoreAtURL:withType:options:error:](persistentStoreCoordinator, "destroyPersistentStoreAtURL:withType:options:error:", databaseURL, v6, storeOptions, &v19);
  v10 = v19;
  v11 = v10;
  if (v9)
  {
    v13 = self->_storeOptions;
    v12 = self->_databaseURL;
    v18 = v10;
    -[ACDDatabase _addPersistentStoreWithType:configuration:URL:options:error:](self, "_addPersistentStoreWithType:configuration:URL:options:error:", v6, 0, v12, v13, &v18);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v18;

    v16 = v14 != 0;
    v11 = v15;
    if (!a3)
      goto LABEL_6;
    goto LABEL_5;
  }
  v16 = 0;
  if (a3)
LABEL_5:
    *a3 = objc_retainAutorelease(v11);
LABEL_6:

  return v16;
}

- (NSString)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACDDatabase databaseURL](self, "databaseURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p { %@ }>"), v5, self, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (void)databaseConnection:(id)a3 encounteredUnrecoverableError:(id)a4
{
  id v7;
  id v8;
  id v9;
  NSPersistentStoreCoordinator *persistentStoreCoordinator;
  id v11;
  void *v12;
  void *v13;
  _QWORD v14[5];

  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (v7)
  {
    if (v8)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ACDDatabase.m"), 371, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("databaseConnection"));

    if (v9)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ACDDatabase.m"), 372, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("error"));

LABEL_3:
  persistentStoreCoordinator = self->_persistentStoreCoordinator;
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __64__ACDDatabase_databaseConnection_encounteredUnrecoverableError___block_invoke;
  v14[3] = &unk_24C7E2130;
  v14[4] = self;
  -[NSPersistentStoreCoordinator performBlockAndWait:](persistentStoreCoordinator, "performBlockAndWait:", v14);
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Fatal database error encountered: %@"), v9);
  objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB0], objc_claimAutoreleasedReturnValue(), 0);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v11);
}

void __64__ACDDatabase_databaseConnection_encounteredUnrecoverableError___block_invoke(uint64_t a1)
{
  void *v1;
  id *v2;
  int v3;
  id v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  id v8;
  id v9;
  int v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  const __CFString *v16;
  id v17;
  id v18;
  uint8_t buf[4];
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v2 = (id *)(a1 + 32);
  v1 = *(void **)(a1 + 32);
  v18 = 0;
  v3 = objc_msgSend(v1, "restoreFromBackupReturningError:", &v18);
  v4 = v18;
  _ACDLogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v3)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*v2, "_backupURL");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v20 = v7;
      _os_log_impl(&dword_20D8CB000, v6, OS_LOG_TYPE_DEFAULT, "\"Successfully restored with backup at URL: %@\", buf, 0xCu);

    }
    +[ACDEventLedger sharedLedger](ACDEventLedger, "sharedLedger");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "recordEvent:", CFSTR("Restored database from backup"));
  }
  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __64__ACDDatabase_databaseConnection_encounteredUnrecoverableError___block_invoke_cold_2(v2, (uint64_t)v4, v6);

    v9 = *v2;
    v17 = 0;
    v10 = objc_msgSend(v9, "_persistentStoreCoodinator_resetPersistentStoreCoordinatorWithError:", &v17);
    v8 = v17;
    _ACDLogSystem();
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v10)
    {
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(*v2, "databaseURL");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v20 = v13;
        _os_log_impl(&dword_20D8CB000, v12, OS_LOG_TYPE_DEFAULT, "\"Successfully reset the database at URL: %@\", buf, 0xCu);

      }
      +[ACDEventLedger sharedLedger](ACDEventLedger, "sharedLedger");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v14;
      v16 = CFSTR("Reset database");
    }
    else
    {
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        __64__ACDDatabase_databaseConnection_encounteredUnrecoverableError___block_invoke_cold_1(v2, (uint64_t)v8, v12);

      +[ACDEventLedger sharedLedger](ACDEventLedger, "sharedLedger");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v14;
      v16 = CFSTR("Failed to reset database");
    }
    objc_msgSend(v14, "recordEvent:", v16);

  }
}

- (NSURL)databaseURL
{
  return self->_databaseURL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_databaseURL, 0);
  objc_storeStrong((id *)&self->_storeOptions, 0);
  objc_storeStrong((id *)&self->_persistentStoreCoordinator, 0);
}

- (void)initWithDatabaseURL:(uint64_t)a3 storeOptions:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_20D8CB000, a1, a3, "\"Disk is full. Not initializing the database, and exiting.\", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_1();
}

- (void)initWithDatabaseURL:(uint64_t)a3 storeOptions:(uint64_t)a4 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_9(&dword_20D8CB000, a2, a3, "\"Unable to initialize the database: %@. Exiting.\", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)initWithDatabaseURL:(NSObject *)a3 storeOptions:.cold.3(uint64_t *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = *a1;
  v4 = 138478083;
  v5 = v3;
  v6 = 2112;
  v7 = a2;
  OUTLINED_FUNCTION_6(&dword_20D8CB000, a3, (uint64_t)a3, "\"Failed to add persistentStore with options: %{private}@, error: %@\", (uint8_t *)&v4);
  OUTLINED_FUNCTION_2();
}

- (void)initWithDatabaseURL:(uint64_t *)a1 storeOptions:(NSObject *)a2 .cold.4(uint64_t *a1, NSObject *a2)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v2 = *a1;
  v3 = 138477827;
  v4 = v2;
  _os_log_debug_impl(&dword_20D8CB000, a2, OS_LOG_TYPE_DEBUG, "\"Successfully added persistentStore with options: %{private}@\", (uint8_t *)&v3, 0xCu);
  OUTLINED_FUNCTION_2();
}

- (void)restoreFromBackupReturningError:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_20D8CB000, a1, a3, "\"Attempt to restore from backup that doesn't exist!\", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_1();
}

- (void)_shouldResetPersistentStoreAfterError:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_9(&dword_20D8CB000, a2, a3, "\"Failed to restore persistentStore, error: %@\", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)_shouldResetPersistentStoreAfterError:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_20D8CB000, a1, a3, "\"Failed to migrate existing persistentStore!\", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_1();
}

void __64__ACDDatabase_databaseConnection_encounteredUnrecoverableError___block_invoke_cold_1(id *a1, uint64_t a2, NSObject *a3)
{
  void *v4;
  uint64_t v5;
  uint8_t v6[24];
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*a1, "databaseURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_6(&dword_20D8CB000, a3, v5, "\"Failed to reset the database at URL: %@, error: %@\", v6);

  OUTLINED_FUNCTION_3();
}

void __64__ACDDatabase_databaseConnection_encounteredUnrecoverableError___block_invoke_cold_2(id *a1, uint64_t a2, NSObject *a3)
{
  void *v4;
  uint64_t v5;
  uint8_t v6[24];
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*a1, "_backupURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_6(&dword_20D8CB000, a3, v5, "\"Failed to restore with backup at URL: %@, error: %@\", v6);

  OUTLINED_FUNCTION_3();
}

@end
