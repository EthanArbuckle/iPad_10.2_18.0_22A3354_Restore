@implementation HCDatabaseManager

- (NSManagedObjectContext)managedObjectContext
{
  return self->_managedObjectContext;
}

- (HCDatabaseManager)init
{
  HCDatabaseManager *v2;
  HCDatabaseManager *v3;
  const char *v4;
  NSObject *v5;
  id v6;
  _QWORD v8[4];
  id v9;
  id location;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)HCDatabaseManager;
  v2 = -[HCDatabaseManager init](&v11, sel_init);
  v3 = v2;
  if (v2)
    -[HCDatabaseManager setupDatabase](v2, "setupDatabase");
  if (MKBDeviceFormattedForContentProtection())
  {
    objc_initWeak(&location, v3);
    v4 = (const char *)*MEMORY[0x1E0D4E600];
    v5 = MEMORY[0x1E0C80D38];
    v6 = MEMORY[0x1E0C80D38];
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __25__HCDatabaseManager_init__block_invoke;
    v8[3] = &unk_1E66CFE40;
    objc_copyWeak(&v9, &location);
    notify_register_dispatch(v4, &v3->_contentProtectionNotifyToken, v5, v8);

    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
  return v3;
}

void __25__HCDatabaseManager_init__block_invoke(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  id v3;
  id v4;

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "logMessage:", CFSTR("Auth changed"));

  v3 = objc_loadWeakRetained(v1);
  objc_msgSend(v3, "setupDatabase");

  v4 = objc_loadWeakRetained(v1);
  objc_msgSend(v4, "saveIfPossible");

}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  -[HCDatabaseManager setManagedObjectContext:](self, "setManagedObjectContext:", 0);
  v4.receiver = self;
  v4.super_class = (Class)HCDatabaseManager;
  -[HCDatabaseManager dealloc](&v4, sel_dealloc);
}

- (id)apsConnectionMachServiceName
{
  return CFSTR("com.apple.aps.heard");
}

- (void)setupDatabase
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  NSObject *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  id v50;
  NSObject *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *context;
  _QWORD v61[5];
  void *v62;
  uint8_t buf[4];
  uint64_t v64;
  uint64_t v65;

  v65 = *MEMORY[0x1E0C80C00];
  v3 = +[HCUtilities isProtectedDataAvailable](HCUtilities, "isProtectedDataAvailable");
  HAInitializeLogging();
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Protected data is available: %@"), self);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[HCDatabaseManager setupDatabase]", 71, v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)HAEngineeringLog;
    if (os_log_type_enabled((os_log_t)HAEngineeringLog, OS_LOG_TYPE_DEFAULT))
    {
      v7 = objc_retainAutorelease(v5);
      v8 = v6;
      *(_DWORD *)buf = 136446210;
      v64 = objc_msgSend(v7, "UTF8String");
      _os_log_impl(&dword_1B3CA7000, v8, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

    }
    -[HCDatabaseManager managedObjectContext](self, "managedObjectContext");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9)
    {
      context = (void *)MEMORY[0x1B5E2E628]();
      -[HCDatabaseManager managedObjectModelName](self, "managedObjectModelName");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[HCDatabaseManager cloudKitContainer](self, "cloudKitContainer");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[HCDatabaseManager containerIdentifier](self, "containerIdentifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[HCDatabaseManager databaseFilePath](self, "databaseFilePath");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      HAInitializeLogging();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Setting up heard database: mom: %@, container: %@ identifier: %@ url: %@"), v10, v11, v12, v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[HCDatabaseManager setupDatabase]", 81, v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = (void *)HAEngineeringLog;
      if (os_log_type_enabled((os_log_t)HAEngineeringLog, OS_LOG_TYPE_DEFAULT))
      {
        v17 = v13;
        v18 = objc_retainAutorelease(v15);
        v19 = v16;
        v20 = v18;
        v13 = v17;
        v21 = objc_msgSend(v20, "UTF8String");
        *(_DWORD *)buf = 136446210;
        v64 = v21;
        _os_log_impl(&dword_1B3CA7000, v19, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

      }
      if (objc_msgSend(v10, "length")
        && objc_msgSend(v11, "length")
        && objc_msgSend(v12, "length")
        && (objc_msgSend(v13, "absoluteString"),
            v22 = (void *)objc_claimAutoreleasedReturnValue(),
            v23 = objc_msgSend(v22, "length"),
            v22,
            v23))
      {
        v24 = objc_alloc(MEMORY[0x1E0C97B98]);
        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "URLForResource:withExtension:", v10, CFSTR("momd"));
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = (void *)objc_msgSend(v24, "initWithContentsOfURL:", v26);

        v59 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C97BB8]), "initWithName:managedObjectModel:", v11, v27);
        v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C97C08]), "initWithURL:", v13);
        v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C97AD0]), "initWithContainerIdentifier:", v12);
        -[HCDatabaseManager apsConnectionMachServiceName](self, "apsConnectionMachServiceName");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v56 = v29;
        objc_msgSend(v29, "setApsConnectionMachServiceName:", v30);

        v55 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C97AC8]), "initWithOptions:", v29);
        objc_msgSend(v28, "setMirroringDelegate:", v55);
        objc_msgSend(v28, "setOption:forKey:", *MEMORY[0x1E0CB2AC0], *MEMORY[0x1E0C97940]);
        v53 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C97BC0]), "initWithContainerIdentifier:", v12);
        objc_msgSend(v53, "setUseDeviceToDeviceEncryption:", 1);
        -[HCDatabaseManager apsConnectionMachServiceName](self, "apsConnectionMachServiceName");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v53, "setApsConnectionMachServiceName:", v31);

        v54 = v28;
        objc_msgSend(v28, "setCloudKitContainerOptions:", v53);
        v62 = v28;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v62, 1);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v59, "setPersistentStoreDescriptions:", v32);

        v61[0] = MEMORY[0x1E0C809B0];
        v61[1] = 3221225472;
        v61[2] = __34__HCDatabaseManager_setupDatabase__block_invoke;
        v61[3] = &unk_1E66CFE68;
        v61[4] = self;
        objc_msgSend(v59, "loadPersistentStoresWithCompletionHandler:", v61);
        objc_msgSend(v59, "viewContext");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        -[HCDatabaseManager setManagedObjectContext:](self, "setManagedObjectContext:", v33);

        objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v57 = v13;
        v35 = *MEMORY[0x1E0C97928];
        -[HCDatabaseManager managedObjectContext](self, "managedObjectContext");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "persistentStoreCoordinator");
        v58 = v12;
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "addObserver:selector:name:object:", self, sel_storesWillChange_, v35, v37);

        objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v39 = *MEMORY[0x1E0C978A0];
        -[HCDatabaseManager managedObjectContext](self, "managedObjectContext");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = v58;
        objc_msgSend(v38, "addObserver:selector:name:object:", self, sel_contentDidUpdate_, v39, v40);

        v52 = (void *)MEMORY[0x1E0CB3940];
        -[HCDatabaseManager managedObjectContext](self, "managedObjectContext");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "persistentStoreCoordinator");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "persistentStores");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        v44 = objc_msgSend(v43, "count");
        -[HCDatabaseManager managedObjectContext](self, "managedObjectContext");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v52, "stringWithFormat:", CFSTR("Creating DB [%d] %@"), v44, v45);
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        -[HCDatabaseManager logMessage:](self, "logMessage:", v46);

        v13 = v57;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Missing mom or container %@, %@"), v10, v11);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        -[HCDatabaseManager logMessage:](self, "logMessage:", v27);
      }

      objc_autoreleasePoolPop(context);
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Protected state, will not create database: %@"), self);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[HCDatabaseManager setupDatabase]", 125, v47);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = (void *)HAEngineeringLog;
    if (os_log_type_enabled((os_log_t)HAEngineeringLog, OS_LOG_TYPE_DEFAULT))
    {
      v50 = objc_retainAutorelease(v48);
      v51 = v49;
      *(_DWORD *)buf = 136446210;
      v64 = objc_msgSend(v50, "UTF8String");
      _os_log_impl(&dword_1B3CA7000, v51, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

    }
  }
}

void __34__HCDatabaseManager_setupDatabase__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v3;
  id v4;

  v3 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Loaded stores %@"), a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "logMessage:", v4);

}

- (void)storesWillChange:(id)a3
{
  void *v4;
  _QWORD v5[5];

  -[HCDatabaseManager managedObjectContext](self, "managedObjectContext", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __38__HCDatabaseManager_storesWillChange___block_invoke;
  v5[3] = &unk_1E66CFCE0;
  v5[4] = self;
  objc_msgSend(v4, "performBlock:", v5);

}

void __38__HCDatabaseManager_storesWillChange___block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hasChanges");

  v4 = *(void **)(a1 + 32);
  if (v3)
  {
    objc_msgSend(v4, "saveIfPossible");
  }
  else
  {
    objc_msgSend(v4, "managedObjectContext");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "reset");

  }
}

- (id)managedObjectModelName
{
  return 0;
}

- (id)cloudKitContainer
{
  return 0;
}

- (id)containerIdentifier
{
  return 0;
}

- (id)databaseFilePath
{
  void *v3;
  void *v4;
  __CFString *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, 1uLL, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lastObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByAppendingPathComponent:", CFSTR("Accessibility"));
  v5 = (__CFString *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bundleIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("com.apple.accessibility.HearingTestApp"));

  if (v8)
  {

    v5 = CFSTR("/var/mobile/Library/Accessibility");
  }
  -[HCDatabaseManager cloudKitContainer](self, "cloudKitContainer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[__CFString stringByAppendingPathComponent:](v5, "stringByAppendingPathComponent:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringByAppendingPathExtension:", CFSTR("sqlite"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (void)contentDidUpdate:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HCDatabaseManager managedObjectContext](self, "managedObjectContext");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "mergeChangesFromContextDidSaveNotification:", v4);

}

- (BOOL)saveIfPossible
{
  HCDatabaseManager *v2;
  void *v3;
  _QWORD v5[7];
  _QWORD v6[5];
  id v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  char v11;

  v2 = self;
  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0;
  v6[0] = 0;
  v6[1] = v6;
  v6[2] = 0x3032000000;
  v6[3] = __Block_byref_object_copy__0;
  v6[4] = __Block_byref_object_dispose__0;
  v7 = 0;
  -[HCDatabaseManager managedObjectContext](self, "managedObjectContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __35__HCDatabaseManager_saveIfPossible__block_invoke;
  v5[3] = &unk_1E66CFE90;
  v5[4] = v2;
  v5[5] = v6;
  v5[6] = &v8;
  objc_msgSend(v3, "performBlockAndWait:", v5);

  LOBYTE(v2) = *((_BYTE *)v9 + 24);
  _Block_object_dispose(v6, 8);

  _Block_object_dispose(&v8, 8);
  return (char)v2;
}

void __35__HCDatabaseManager_saveIfPossible__block_invoke(uint64_t a1)
{
  _BOOL4 v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id obj;

  v2 = +[HCUtilities isProtectedDataAvailable](HCUtilities, "isProtectedDataAvailable");
  v3 = *(void **)(a1 + 32);
  if (!v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Protected data state, not saving"));
    v19 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "logMessage:", v19);
LABEL_9:

    return;
  }
  objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "persistentStoreCoordinator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "persistentStores");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v6, "count"))
  {

    goto LABEL_8;
  }
  objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hasChanges");

  if (!v8)
  {
LABEL_8:
    v12 = *(void **)(a1 + 32);
    v13 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v12, "managedObjectContext");
    v19 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "persistentStoreCoordinator");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "persistentStores");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "stringWithFormat:", CFSTR("No persistent stores[%@], or changes:[%d]"), v15, objc_msgSend(v16, "hasChanges"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "logMessage:", v17);

    goto LABEL_9;
  }
  objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  obj = *(id *)(v10 + 40);
  objc_msgSend(v9, "save:", &obj);
  objc_storeStrong((id *)(v10 + 40), obj);

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) == 0;
  v11 = *(void **)(a1 + 32);
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Updated DB %@"), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
  else
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed DB save with err %@"), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "logMessage:", v18);

}

- (void)setManagedObjectContext:(id)a3
{
  objc_storeStrong((id *)&self->_managedObjectContext, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_managedObjectContext, 0);
}

@end
