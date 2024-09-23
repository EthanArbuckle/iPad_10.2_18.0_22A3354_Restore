@implementation _DKCoreDataStorage

+ (unint64_t)deleteObjectsInContext:(id)a3 entityName:(id)a4 predicate:(id)a5 sortDescriptors:(id)a6 fetchOffset:(unint64_t)a7 fetchLimit:(unint64_t)a8 includeSubentities:(BOOL)a9 includePendingChanges:(BOOL)a10
{
  id v15;
  id v16;
  id v17;
  id v18;
  unint64_t v19;
  _QWORD v21[4];
  id v22;
  id v23;
  id v24;
  id v25;
  uint64_t *v26;
  uint64_t *v27;
  unint64_t v28;
  unint64_t v29;
  BOOL v30;
  BOOL v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t (*v35)(uint64_t, uint64_t);
  void (*v36)(uint64_t);
  id v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t v41;

  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  if (v15)
  {
    v38 = 0;
    v39 = &v38;
    v40 = 0x2020000000;
    v41 = 0;
    v32 = 0;
    v33 = &v32;
    v34 = 0x3032000000;
    v35 = __Block_byref_object_copy__19;
    v36 = __Block_byref_object_dispose__19;
    v37 = 0;
    kdebug_trace();
    _cdknowledge_signpost_delete_begin(v16);
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __146___DKCoreDataStorage_deleteObjectsInContext_entityName_predicate_sortDescriptors_fetchOffset_fetchLimit_includeSubentities_includePendingChanges___block_invoke;
    v21[3] = &unk_1E26E5E10;
    v22 = v16;
    v23 = v15;
    v28 = a8;
    v29 = a7;
    v30 = a9;
    v31 = a10;
    v24 = v17;
    v25 = v18;
    v26 = &v32;
    v27 = &v38;
    objc_msgSend(v23, "performWithOptions:andBlock:", 4, v21);
    objc_msgSend((id)v33[5], "code");
    kdebug_trace();
    _cdknowledge_signpost_delete_end(v39[3], objc_msgSend((id)v33[5], "code"));
    v19 = v39[3];

    _Block_object_dispose(&v32, 8);
    _Block_object_dispose(&v38, 8);
  }
  else
  {
    v19 = 0;
  }

  return v19;
}

+ (unint64_t)deleteObjectsInContext:(id)a3 entityName:(id)a4 predicate:(id)a5 sortDescriptors:(id)a6 fetchLimit:(unint64_t)a7 includeSubentities:(BOOL)a8 includePendingChanges:(BOOL)a9
{
  uint64_t v10;

  BYTE1(v10) = a9;
  LOBYTE(v10) = a8;
  return objc_msgSend(a1, "deleteObjectsInContext:entityName:predicate:sortDescriptors:fetchOffset:fetchLimit:includeSubentities:includePendingChanges:", a3, a4, a5, a6, 0, a7, v10);
}

- (id)managedObjectContextFor:(id)a3
{
  return -[_DKCoreDataStorage managedObjectContextFor:identifier:](self, "managedObjectContextFor:identifier:", a3, 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_containerIdentifier, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_databaseName, 0);
  objc_storeStrong((id *)&self->_modelURL, 0);
  objc_storeStrong((id *)&self->_directory, 0);
  objc_storeStrong((id *)&self->_mirroringDelegate, 0);
  objc_storeStrong((id *)&self->_fm, 0);
  objc_storeStrong((id *)&self->_dataProtectionMonitor, 0);
  objc_storeStrong((id *)&self->_persistentStoreCoordinators, 0);
  objc_storeStrong((id *)&self->_managedObjectContexts, 0);
  objc_storeStrong((id *)&self->_paths, 0);
  objc_storeStrong((id *)&self->_managedObjectModel, 0);
}

- (id)privateManagedObjectContextFor:(id)a3
{
  id v4;
  _DKCoreDataStorage *v5;
  void *v6;
  void *v7;

  v4 = a3;
  if (-[_DKDataProtectionStateMonitor isDataAvailableFor:](self->_dataProtectionMonitor, "isDataAvailableFor:", v4))
  {
    v5 = self;
    objc_sync_enter(v5);
    -[_DKCoreDataStorage persistentStoreCoordinatorFor:](v5, "persistentStoreCoordinatorFor:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C97B88]), "initWithConcurrencyType:", 1);
      objc_msgSend(v7, "setPersistentStoreCoordinator:", v6);
      objc_msgSend(v7, "setMergePolicy:", *MEMORY[0x1E0C978C0]);
      objc_msgSend(v7, "setUndoManager:", 0);
    }
    else
    {
      v7 = 0;
    }

    objc_sync_exit(v5);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)managedObjectContextFor:(id)a3 identifier:(id)a4
{
  id v6;
  id v7;
  _BOOL4 v8;
  _DKCoreDataStorage *v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;
  int v14;
  int v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  _QWORD v21[3];

  v21[2] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = -[_DKDataProtectionStateMonitor isDataAvailableFor:](self->_dataProtectionMonitor, "isDataAvailableFor:", v6);
  v9 = self;
  objc_sync_enter(v9);
  if (v7)
  {
    v21[0] = v6;
    v21[1] = v7;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "componentsJoinedByString:", CFSTR(":"));
    v11 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11 = v6;
  }
  -[_DKCoreDataStorage managedObjectContextForKey:]((id *)&v9->super.isa, v11);
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)v12;
  if (!v8)
  {
    v16 = 0;
    if (!v12)
    {
      v14 = 0;
LABEL_12:
      v15 = 1;
      goto LABEL_13;
    }
LABEL_11:

    v14 = !v8;
    goto LABEL_12;
  }
  if (v12)
  {
    v14 = 0;
    v15 = 1;
    v16 = (void *)v12;
    goto LABEL_13;
  }
  -[_DKCoreDataStorage persistentStoreCoordinatorFor:](v9, "persistentStoreCoordinatorFor:", v6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C97B88]), "initWithConcurrencyType:", 1);
    objc_msgSend(v16, "setPersistentStoreCoordinator:", v13);
    objc_msgSend(v16, "setMergePolicy:", *MEMORY[0x1E0C978C0]);
    objc_msgSend(v16, "setUndoManager:", 0);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.coreduet.knowledge %@"), v11);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setName:", v17);

    v18 = (void *)os_transaction_create();
    objc_setAssociatedObject(v16, &managedObjectContextFor_identifier__mocAssociatedObjectKey, v18, (void *)1);

    -[_DKCoreDataStorage setManagedObjectContext:forKey:]((uint64_t)v9, v16, v11);
    goto LABEL_11;
  }
  v14 = 0;
  v16 = 0;
  v15 = 0;
LABEL_13:

  objc_sync_exit(v9);
  if (v15)
  {
    if (!v14)
    {
      v19 = v16;
      goto LABEL_18;
    }
    -[_DKCoreDataStorage invalidateManagedObjectContextAndPersistentStoreCoordinatorFor:](v9, v6);
  }
  v19 = 0;
LABEL_18:

  return v19;
}

- (id)persistentStoreCoordinatorFor:(id)a3
{
  id v4;
  BOOL v5;
  _DKCoreDataStorage *v6;
  void *v7;
  id v8;
  id *p_directory;
  int v10;
  id v11;
  NSObject *v12;
  id v13;
  int v14;
  NSObject *v15;
  id v16;
  int *v17;
  id v18;
  id v19;
  NSFileManager *v20;
  NSString *v21;
  BOOL v22;
  NSObject *v23;
  __CFNotificationCenter *DarwinNotifyCenter;
  const __CFString *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  char v33;
  int v34;
  void *v35;
  BOOL v37;
  NSObject *v38;
  id v39;
  NSFileManager *fm;
  NSString *directory;
  NSObject *v42;
  _BOOL4 v43;
  NSObject *v44;
  id v45;
  NSFileManager *v46;
  NSString *v47;
  BOOL v48;
  NSObject *v49;
  __CFNotificationCenter *v50;
  const __CFString *v51;
  id v52;
  id v53;
  id v54;
  id v55;
  id v56;
  id v57;
  uint8_t buf[4];
  id v59;
  uint64_t v60;

  v60 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[_DKDataProtectionStateMonitor isDataAvailableFor:](self->_dataProtectionMonitor, "isDataAvailableFor:", v4);
  v6 = self;
  objc_sync_enter(v6);
  -[NSMutableDictionary objectForKeyedSubscript:](v6->_persistentStoreCoordinators, "objectForKeyedSubscript:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v5)
  {
    if (v7)
      goto LABEL_53;
    p_directory = (id *)&v6->_directory;
    if (-[NSFileManager fileExistsAtPath:](v6->_fm, "fileExistsAtPath:", v6->_directory))
    {
      if (!v6->_isManagedDatabase)
        goto LABEL_34;
      v10 = -[_DKCoreDataStorage isDataVaulted]((uint64_t)v6);
      v11 = *p_directory;
      if (v10)
      {
        objc_msgSend(v11, "UTF8String");
        if (rootless_check_datavault_flag() == 1)
        {
          if (v6->_isDatabaseManager)
          {
            objc_msgSend(*p_directory, "UTF8String");
            rootless_convert_to_datavault();
            goto LABEL_34;
          }
          +[_CDLogging knowledgeChannel](_CDLogging, "knowledgeChannel");
          v23 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
            -[_DKCoreDataStorage persistentStoreCoordinatorFor:].cold.5();
LABEL_32:

          DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
          v25 = (const __CFString *)-[_DKCoreDataStorage clientNeedsHelpNotification]((id *)&v6->super.isa);
          CFNotificationCenterPostNotification(DarwinNotifyCenter, v25, 0, 0, 1u);
          v18 = 0;
          goto LABEL_35;
        }
LABEL_34:
        v18 = 0;
        goto LABEL_35;
      }
      objc_msgSend(v11, "UTF8String");
      if (rootless_check_datavault_flag())
        goto LABEL_34;
      if (!v6->_isDatabaseManager)
      {
        +[_CDLogging knowledgeChannel](_CDLogging, "knowledgeChannel");
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
          -[_DKCoreDataStorage persistentStoreCoordinatorFor:].cold.6();
        goto LABEL_32;
      }
      +[_CDLogging knowledgeChannel](_CDLogging, "knowledgeChannel");
      v38 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
      {
        v39 = *p_directory;
        *(_DWORD *)buf = 138412290;
        v59 = v39;
        _os_log_impl(&dword_18DDBE000, v38, OS_LOG_TYPE_DEFAULT, "Removing datavault directory %@", buf, 0xCu);
      }

      fm = v6->_fm;
      directory = v6->_directory;
      v56 = 0;
      -[NSFileManager removeItemAtPath:error:](fm, "removeItemAtPath:error:", directory, &v56);
      v18 = v56;
      if (v18)
      {
        +[_CDLogging knowledgeChannel](_CDLogging, "knowledgeChannel");
        v42 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
          -[_DKCoreDataStorage persistentStoreCoordinatorFor:].cold.8();

        goto LABEL_35;
      }
      +[_CDLogging knowledgeChannel](_CDLogging, "knowledgeChannel");
      v44 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18DDBE000, v44, OS_LOG_TYPE_DEFAULT, "Succesfully removed datavault directory.", buf, 2u);
      }

      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        v45 = *p_directory;
        *(_DWORD *)buf = 138412290;
        v59 = v45;
        _os_log_impl(&dword_18DDBE000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Creating directory at %@", buf, 0xCu);
      }
      v46 = v6->_fm;
      v47 = v6->_directory;
      v55 = 0;
      v48 = -[NSFileManager createDirectoryAtPath:withIntermediateDirectories:attributes:error:](v46, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v47, 1, 0, &v55);
      v18 = v55;
      if (!v48)
      {
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          -[_DKCoreDataStorage persistentStoreCoordinatorFor:].cold.7();
        -[_DKCoreDataStorage removePersistentStoresInCoordinator:]((uint64_t)v6, 0);
LABEL_29:

        goto LABEL_11;
      }
    }
    else
    {
      +[_CDLogging knowledgeChannel](_CDLogging, "knowledgeChannel");
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        -[_DKCoreDataStorage persistentStoreCoordinatorFor:].cold.12();

      if (!v6->_isDatabaseManager)
      {
        +[_CDLogging knowledgeChannel](_CDLogging, "knowledgeChannel");
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
          -[_DKCoreDataStorage persistentStoreCoordinatorFor:].cold.9();
        goto LABEL_32;
      }
      if (v6->_isManagedDatabase && -[_DKCoreDataStorage isDataVaulted]((uint64_t)v6))
      {
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
        {
          v13 = *p_directory;
          *(_DWORD *)buf = 138412290;
          v59 = v13;
          _os_log_impl(&dword_18DDBE000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Creating datavault at %@", buf, 0xCu);
        }
        objc_msgSend(*p_directory, "UTF8String");
        v14 = rootless_mkdir_datavault();
        if (!v14)
          goto LABEL_34;
        v15 = MEMORY[0x1E0C81028];
        v16 = MEMORY[0x1E0C81028];
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          v17 = __error();
          -[_DKCoreDataStorage persistentStoreCoordinatorFor:].cold.11(v17, buf, v14);
        }

        -[_DKCoreDataStorage removePersistentStoresInCoordinator:]((uint64_t)v6, 0);
        v18 = 0;
        goto LABEL_29;
      }
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        v19 = *p_directory;
        *(_DWORD *)buf = 138412290;
        v59 = v19;
        _os_log_impl(&dword_18DDBE000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Creating directory at %@", buf, 0xCu);
      }
      v20 = v6->_fm;
      v21 = v6->_directory;
      v57 = 0;
      v22 = -[NSFileManager createDirectoryAtPath:withIntermediateDirectories:attributes:error:](v20, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v21, 1, 0, &v57);
      v18 = v57;
      if (!v22)
      {
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          -[_DKCoreDataStorage persistentStoreCoordinatorFor:].cold.10();
        -[_DKCoreDataStorage removePersistentStoresInCoordinator:]((uint64_t)v6, 0);
        goto LABEL_29;
      }
    }
LABEL_35:
    -[_DKCoreDataStorage _defaultOptionsForStoreWithProtectionClass:](v6, v4);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = (void *)objc_msgSend(v26, "mutableCopy");

    -[_DKCoreDataStorage managedObjectModel](v6, "managedObjectModel");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v28)
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[_DKCoreDataStorage persistentStoreCoordinatorFor:].cold.1();
      v34 = 1;
      +[_CDDiagnosticDataReporter addValue:forScalarKey:](_CDDiagnosticDataReporter, "addValue:forScalarKey:", 1, CFSTR("com.apple.coreduet.coreData.failedToLoadMOM"));
      v8 = 0;
LABEL_51:

      if (v34)
        goto LABEL_52;
LABEL_53:
      objc_sync_exit(v6);

      v8 = v8;
      v35 = v8;
      goto LABEL_54;
    }
    v29 = (void *)MEMORY[0x1E0C99E98];
    -[NSMutableDictionary objectForKeyedSubscript:](v6->_paths, "objectForKeyedSubscript:", v4);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "fileURLWithPath:", v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    if (!-[_DKCoreDataStorage requiresManualMigration](v6, "requiresManualMigration") || v6->_readOnly)
    {
      v32 = v18;
      goto LABEL_39;
    }
    v54 = v18;
    v37 = -[_DKCoreDataStorage isManagedObjectModel:compatibleWithPersistentStoreAtURL:error:](v6, "isManagedObjectModel:compatibleWithPersistentStoreAtURL:error:", v28, v31, &v54);
    v32 = v54;

    if (v32)
    {
      if (+[_CDErrorUtilities isCoreDataFatalError:](_CDErrorUtilities, "isCoreDataFatalError:", v32))
      {
        -[_DKCoreDataStorage handleDatabaseErrors:forProtectionClass:](v6, v32, v4);
        -[_DKCoreDataStorage removePersistentStoresInCoordinator:]((uint64_t)v6, 0);
        goto LABEL_39;
      }

    }
    else if (!v37)
    {
      if (!v6->_isDatabaseManager)
      {
        +[_CDLogging knowledgeChannel](_CDLogging, "knowledgeChannel");
        v49 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
          -[_DKCoreDataStorage persistentStoreCoordinatorFor:].cold.3();

        v50 = CFNotificationCenterGetDarwinNotifyCenter();
        v51 = (const __CFString *)-[_DKCoreDataStorage clientNeedsHelpNotification]((id *)&v6->super.isa);
        v34 = 1;
        CFNotificationCenterPostNotification(v50, v51, 0, 0, 1u);
        v18 = 0;
        goto LABEL_49;
      }
      v53 = 0;
      v43 = -[_DKCoreDataStorage migratePersistentStoreAtURL:toManagedObjectModel:protectionClass:error:](v6, "migratePersistentStoreAtURL:toManagedObjectModel:protectionClass:error:", v31, v28, v4, &v53);
      v32 = v53;
      if (v43)
      {
        objc_msgSend(v27, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0C979C0]);
        objc_msgSend(v27, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0C979D0]);
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          -[_DKCoreDataStorage persistentStoreCoordinatorFor:].cold.4();
        +[_CDDiagnosticDataReporter addValue:forScalarKey:](_CDDiagnosticDataReporter, "addValue:forScalarKey:", 1, CFSTR("com.apple.coreduet.coreData.failedToMigrateDB"));
        -[_DKCoreDataStorage deleteStorageFor:](v6, "deleteStorageFor:", v4);
        -[_DKCoreDataStorage removePersistentStoresInCoordinator:]((uint64_t)v6, 0);
      }
LABEL_39:
      v8 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C97C00]), "initWithManagedObjectModel:", v28);

      v52 = 0;
      v33 = -[_DKCoreDataStorage _addStoresToCoordinator:protectionClass:error:]((uint64_t)v6, v8, v4, &v52);
      v18 = v52;
      if ((v33 & 1) != 0)
      {
        if (v8)
          -[NSMutableDictionary setObject:forKeyedSubscript:](v6->_persistentStoreCoordinators, "setObject:forKeyedSubscript:", v8, v4);
        v34 = 0;
        goto LABEL_50;
      }
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[_DKCoreDataStorage persistentStoreCoordinatorFor:].cold.2();
      -[_DKCoreDataStorage handleDatabaseErrors:forProtectionClass:](v6, v18, v4);
      -[_DKCoreDataStorage removePersistentStoresInCoordinator:]((uint64_t)v6, v8);

      v34 = 0;
LABEL_49:
      v8 = 0;
LABEL_50:

      goto LABEL_51;
    }
    v32 = 0;
    goto LABEL_39;
  }
  if (!v7)
    goto LABEL_53;

  -[_DKCoreDataStorage invalidateManagedObjectContextAndPersistentStoreCoordinatorFor:](v6, v4);
LABEL_11:
  v8 = 0;
LABEL_52:
  objc_sync_exit(v6);

  v35 = 0;
LABEL_54:

  return v35;
}

- (id)managedObjectContextForKey:(id *)a1
{
  id v3;
  id v4;

  v3 = a2;
  if (a1)
  {
    v4 = a1[3];
    objc_sync_enter(v4);
    objc_msgSend(a1[3], "objectForKey:", v3);
    a1 = (id *)objc_claimAutoreleasedReturnValue();
    objc_sync_exit(v4);

  }
  return a1;
}

- (void)setManagedObjectContext:(void *)a3 forKey:
{
  id v5;
  id v6;
  id v7;

  v7 = a2;
  v5 = a3;
  if (a1)
  {
    v6 = *(id *)(a1 + 24);
    objc_sync_enter(v6);
    objc_msgSend(*(id *)(a1 + 24), "setObject:forKey:", v7, v5);
    objc_sync_exit(v6);

  }
}

- (uint64_t)initWithDirectory:(void *)a3 databaseName:(void *)a4 modelURL:(char)a5 readOnly:(char)a6 localOnly:(char)a7 sync:
{
  id v14;
  id v15;
  id v16;
  id *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  _DKDataProtectionStateMonitor *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  NSObject *v39;
  _QWORD v40[4];
  id v41;
  id location;
  objc_super v43;

  v14 = a2;
  v15 = a3;
  v16 = a4;
  if (a1)
  {
    v43.receiver = (id)a1;
    v43.super_class = (Class)_DKCoreDataStorage;
    v17 = (id *)objc_msgSendSuper2(&v43, sel_init);
    a1 = (uint64_t)v17;
    if (v17)
    {
      objc_storeStrong(v17 + 9, a2);
      *(_BYTE *)(a1 + 67) = a5;
      *(_BYTE *)(a1 + 68) = a6;
      *(_BYTE *)(a1 + 69) = a7;
      objc_storeStrong((id *)(a1 + 88), a3);
      objc_storeStrong((id *)(a1 + 80), a4);
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v18 = objc_claimAutoreleasedReturnValue();
      v19 = *(void **)(a1 + 48);
      *(_QWORD *)(a1 + 48) = v18;

      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v20 = objc_claimAutoreleasedReturnValue();
      v21 = *(void **)(a1 + 16);
      *(_QWORD *)(a1 + 16) = v20;

      v22 = *(void **)(a1 + 8);
      *(_QWORD *)(a1 + 8) = 0;

      objc_msgSend(MEMORY[0x1E0CB3748], "mapTableWithKeyOptions:valueOptions:", 0, 5);
      v23 = objc_claimAutoreleasedReturnValue();
      v24 = *(void **)(a1 + 24);
      *(_QWORD *)(a1 + 24) = v23;

      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v25 = objc_claimAutoreleasedReturnValue();
      v26 = *(void **)(a1 + 32);
      *(_QWORD *)(a1 + 32) = v25;

      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@/%@"), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 88));
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@.db"), v27, CFSTR("A"));
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 16), "setObject:forKeyedSubscript:", v28, *MEMORY[0x1E0CB2AB0]);

      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@.db"), v27, CFSTR("C"));
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 16), "setObject:forKeyedSubscript:", v29, *MEMORY[0x1E0CB2AC0]);

      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@.db"), v27, CFSTR("D"));
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 16), "setObject:forKeyedSubscript:", v30, *MEMORY[0x1E0CB2AE0]);

      v31 = objc_alloc_init(_DKDataProtectionStateMonitor);
      v32 = *(void **)(a1 + 40);
      *(_QWORD *)(a1 + 40) = v31;

      objc_initWeak(&location, (id)a1);
      v40[0] = MEMORY[0x1E0C809B0];
      v40[1] = 3221225472;
      v40[2] = __86___DKCoreDataStorage_initWithDirectory_databaseName_modelURL_readOnly_localOnly_sync___block_invoke;
      v40[3] = &unk_1E26E2ED0;
      objc_copyWeak(&v41, &location);
      objc_msgSend(*(id *)(a1 + 40), "setChangeHandler:", v40);
      *(_BYTE *)(a1 + 66) = 0;
      -[_DKCoreDataStorage databaseManagerName]((id *)a1);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      *(_BYTE *)(a1 + 64) = v33 != 0;

      if (*(_BYTE *)(a1 + 64))
      {
        objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "processName");
        v35 = (void *)objc_claimAutoreleasedReturnValue();

        -[_DKCoreDataStorage databaseManagerName]((id *)a1);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        *(_BYTE *)(a1 + 65) = objc_msgSend(v35, "isEqualToString:", v36);

        if (*(_BYTE *)(a1 + 64) && -[_DKCoreDataStorage isDataVaulted](a1))
        {
          +[_CDEntitlementsUtilities entitlementValueForKey:](_CDEntitlementsUtilities, "entitlementValueForKey:", CFSTR("com.apple.rootless.storage.coreduet_knowledge_store"));
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_opt_respondsToSelector() & 1) == 0 || (objc_msgSend(v37, "BOOLValue") & 1) == 0)
          {
            +[_CDLogging knowledgeChannel](_CDLogging, "knowledgeChannel");
            v39 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v39, OS_LOG_TYPE_FAULT))
              -[_DKCoreDataStorage initWithDirectory:databaseName:modelURL:readOnly:localOnly:sync:].cold.1();

            objc_destroyWeak(&v41);
            objc_destroyWeak(&location);

            v27 = (void *)a1;
            a1 = 0;
            goto LABEL_13;
          }
          if (*(_BYTE *)(a1 + 65))
            -[_DKCoreDataStorage _registerForClientHelpNotifications]((id *)a1);

        }
      }
      else
      {
        *(_BYTE *)(a1 + 65) = 1;
      }
      objc_destroyWeak(&v41);
      objc_destroyWeak(&location);
LABEL_13:

    }
  }

  return a1;
}

- (uint64_t)isDataVaulted
{
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;

  if (result)
  {
    objc_msgSend(*(id *)(result + 72), "stringByStandardizingPath");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    +[_CDPaths knowledgeDirectory](_CDPaths, "knowledgeDirectory");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "stringByStandardizingPath");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v1, "isEqualToString:", v3);

    return v4;
  }
  return result;
}

- (id)databaseManagerName
{
  id *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[2];
  _QWORD v10[3];

  v1 = a1;
  v10[2] = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    +[_CDPaths knowledgeDirectory](_CDPaths, "knowledgeDirectory");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "stringByStandardizingPath");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = v3;
    v10[0] = CFSTR("coreduetd");
    +[_CDPaths peopleDirectory](_CDPaths, "peopleDirectory");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringByStandardizingPath");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v9[1] = v5;
    v10[1] = CFSTR("coreduetd");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v1[9], "stringByStandardizingPath");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", v7);
    v1 = (id *)objc_claimAutoreleasedReturnValue();

  }
  return v1;
}

- (_DKCoreDataStorage)initWithDirectory:(id)a3 databaseName:(id)a4 modelURL:(id)a5 readOnly:(BOOL)a6 localOnly:(BOOL)a7
{
  return (_DKCoreDataStorage *)-[_DKCoreDataStorage initWithDirectory:databaseName:modelURL:readOnly:localOnly:sync:]((uint64_t)self, a3, a4, a5, a6, a7, 0);
}

- (void)dealloc
{
  objc_super v3;

  if (self->_isManagedDatabase && self->_isDatabaseManager)
    -[_DKCoreDataStorage _unregisterForClientHelpNotifications]((id *)&self->super.isa);
  v3.receiver = self;
  v3.super_class = (Class)_DKCoreDataStorage;
  -[_DKCoreDataStorage dealloc](&v3, sel_dealloc);
}

- (void)setRequiresManualMigration:(BOOL)a3
{
  self->_requiresManualMigration = a3;
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)isManagedObjectContextFor:(id)a3 equalToManagedObjectContext:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  -[_DKCoreDataStorage managedObjectContextForKey:]((id *)&self->super.isa, a3);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  return v7 == v6;
}

- (_DKCoreDataStorage)init
{

  return 0;
}

- (_DKCoreDataStorage)initWithDirectory:(id)a3 databaseName:(id)a4 modelURL:(id)a5 sync:(BOOL)a6
{
  return (_DKCoreDataStorage *)-[_DKCoreDataStorage initWithDirectory:databaseName:modelURL:readOnly:localOnly:sync:]((uint64_t)self, a3, a4, a5, 0, 0, a6);
}

- (void)handleDataProtectionChangeFor:(char)a3 willBeAvailable:
{
  id v5;

  v5 = a2;
  if (a1)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
    {
      -[_DKCoreDataStorage handleDataProtectionChangeFor:willBeAvailable:].cold.1();
      if ((a3 & 1) != 0)
        goto LABEL_5;
      goto LABEL_4;
    }
    if ((a3 & 1) == 0)
LABEL_4:
      -[_DKCoreDataStorage invalidateManagedObjectContextAndPersistentStoreCoordinatorFor:](a1, v5);
  }
LABEL_5:

}

- (void)_registerForClientHelpNotifications
{
  __CFNotificationCenter *DarwinNotifyCenter;
  const __CFString *v3;

  if (a1)
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    v3 = (const __CFString *)-[_DKCoreDataStorage clientNeedsHelpNotification](a1);
    CFNotificationCenterAddObserver(DarwinNotifyCenter, a1, (CFNotificationCallback)_clientNeedsHelpCallback, v3, 0, (CFNotificationSuspensionBehavior)0);
  }
}

- (void)_unregisterForClientHelpNotifications
{
  __CFNotificationCenter *DarwinNotifyCenter;
  const __CFString *v3;

  if (a1)
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    v3 = (const __CFString *)-[_DKCoreDataStorage clientNeedsHelpNotification](a1);
    CFNotificationCenterRemoveObserver(DarwinNotifyCenter, a1, v3, 0);
  }
}

- (id)clientNeedsHelpNotification
{
  void *v1;
  void *v2;

  if (a1)
  {
    -[_DKCoreDataStorage databaseManagerName](a1);
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@"), CFSTR("com.apple.coreduet.client-needs-help."), v1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (void)handleClientCallForHelp
{
  void *v1;
  void *v2;
  uint64_t v3;
  id v4;
  void *v5;
  dispatch_time_t v6;
  _BYTE *obj;
  _QWORD block[5];
  _QWORD v9[4];
  id v10;
  _BYTE *v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  if (a1)
  {
    obj = a1;
    objc_sync_enter(obj);
    if (obj[66])
    {
      objc_sync_exit(obj);

    }
    else
    {
      obj[66] = 1;
      objc_sync_exit(obj);

      -[_DKCoreDataStorage _unregisterForClientHelpNotifications]((id *)obj);
      v1 = (void *)*MEMORY[0x1E0CB2AC0];
      objc_msgSend(obj, "managedObjectContextFor:", *MEMORY[0x1E0CB2AC0]);
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 0;
      v14 = &v13;
      v15 = 0x3032000000;
      v16 = __Block_byref_object_copy__19;
      v17 = __Block_byref_object_dispose__19;
      v18 = 0;
      v3 = MEMORY[0x1E0C809B0];
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __45___DKCoreDataStorage_handleClientCallForHelp__block_invoke;
      v9[3] = &unk_1E26E47A8;
      v4 = v2;
      v10 = v4;
      v11 = obj;
      v12 = &v13;
      objc_msgSend(v4, "performWithOptions:andBlock:", 0, v9);
      v5 = (void *)v14[5];
      if (v5)
        -[_DKCoreDataStorage handleDatabaseErrors:forProtectionClass:](obj, v5, v1);
      v6 = dispatch_time(0, 60000000000);
      block[0] = v3;
      block[1] = 3221225472;
      block[2] = __45___DKCoreDataStorage_handleClientCallForHelp__block_invoke_2;
      block[3] = &unk_1E26E2F20;
      block[4] = obj;
      dispatch_after(v6, MEMORY[0x1E0C80D38], block);

      _Block_object_dispose(&v13, 8);
    }
  }
}

- (void)handleDatabaseErrors:(void *)a3 forProtectionClass:
{
  id v5;
  id v6;
  _BOOL8 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v5 = a2;
  v6 = a3;
  if (a1 && v5)
  {
    if (+[_CDErrorUtilities isCoreDataFatalError:](_CDErrorUtilities, "isCoreDataFatalError:", v5))
    {
      +[_CDDiagnosticDataReporter addValue:forScalarKey:](_CDDiagnosticDataReporter, "addValue:forScalarKey:", 1, CFSTR("com.apple.coreduet.deletedDB.couldNotOpen"));
      v7 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
      if (v7)
        -[_DKCoreDataStorage handleDatabaseErrors:forProtectionClass:].cold.1(v7, v8, v9, v10, v11, v12, v13, v14);
      objc_msgSend(a1, "deleteStorageFor:", v6);
    }
    else if (+[_CDErrorUtilities isCoreDataTemporaryError:](_CDErrorUtilities, "isCoreDataTemporaryError:", v5))
    {
      -[_DKCoreDataStorage invalidateManagedObjectContextAndPersistentStoreCoordinatorFor:](a1, v6);
    }
  }

}

- (void)invalidateManagedObjectContextAndPersistentStoreCoordinatorFor:(void *)a1
{
  id v3;
  id *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (a1)
  {
    v4 = a1;
    objc_sync_enter(v4);
    v13 = v3;
    objc_msgSend(v4[4], "objectForKeyedSubscript:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
      objc_msgSend(v4[4], "removeObjectForKey:", v13);
    -[_DKCoreDataStorage managedObjectContextIdentifierWithPrefix:](v4, v13);
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v6 = (id)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v17;
      v9 = MEMORY[0x1E0C809B0];
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v17 != v8)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
          -[_DKCoreDataStorage managedObjectContextForKey:](v4, v11);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          if (v12)
          {
            -[_DKCoreDataStorage removeManagedObjectContextForKey:]((uint64_t)v4, v11);
            v14[0] = v9;
            v14[1] = 3221225472;
            v14[2] = __85___DKCoreDataStorage_invalidateManagedObjectContextAndPersistentStoreCoordinatorFor___block_invoke;
            v14[3] = &unk_1E26E2F20;
            v15 = v12;
            objc_msgSend(v15, "performWithOptions:andBlock:", 4, v14);

          }
        }
        v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v7);
    }

    -[_DKCoreDataStorage removePersistentStoresInCoordinator:]((uint64_t)v4, v5);
    objc_sync_exit(v4);

    v3 = v13;
  }

}

- (id)managedObjectContextIdentifierWithPrefix:(id *)a1
{
  id v3;
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (a1)
  {
    v4 = a1[3];
    objc_sync_enter(v4);
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v6 = a1[3];
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v13;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v13 != v8)
            objc_enumerationMutation(v6);
          v10 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
          if (objc_msgSend(v10, "hasPrefix:", v3, (_QWORD)v12))
            objc_msgSend(v5, "addObject:", v10);
        }
        v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v7);
    }

    a1 = (id *)objc_msgSend(v5, "copy");
    objc_sync_exit(v4);

  }
  return a1;
}

- (void)removeManagedObjectContextForKey:(uint64_t)a1
{
  id v3;
  id v4;

  v4 = a2;
  if (a1)
  {
    v3 = *(id *)(a1 + 24);
    objc_sync_enter(v3);
    objc_msgSend(*(id *)(a1 + 24), "removeObjectForKey:", v4);
    objc_sync_exit(v3);

  }
}

- (void)removePersistentStoresInCoordinator:(uint64_t)a1
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  id v13;
  void *v14;
  BOOL v15;
  id v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t v21[4];
  uint64_t v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = v3;
  if (a1)
  {
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    objc_msgSend(v3, "persistentStores");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v23, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v18;
      v9 = MEMORY[0x1E0C81028];
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v18 != v8)
            objc_enumerationMutation(v5);
          v11 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v10);
          v16 = 0;
          v12 = objc_msgSend(v4, "removePersistentStore:error:", v11, &v16);
          v13 = v16;
          v14 = v13;
          if (v12)
            v15 = v13 == 0;
          else
            v15 = 0;
          if (!v15 && os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
            -[_DKCoreDataStorage removePersistentStoresInCoordinator:].cold.1(v21, (uint64_t)v14, &v22);

          ++v10;
        }
        while (v7 != v10);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v23, 16);
      }
      while (v7);
    }

  }
}

- (void)closeStorageForProtectionClass:(id)a3
{
  -[_DKCoreDataStorage invalidateManagedObjectContextAndPersistentStoreCoordinatorFor:](self, a3);
}

- (id)managedObjectModel
{
  id v3;
  NSManagedObjectModel *v4;
  NSManagedObjectModel *managedObjectModel;
  NSManagedObjectModel *v6;
  NSManagedObjectModel *v7;
  NSManagedObjectModel *v8;
  _BOOL8 v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  if (self->_modelURL)
  {
    if (gManagedObjectModelCacheInitialized != -1)
      dispatch_once(&gManagedObjectModelCacheInitialized, &__block_literal_global_58);
    v3 = (id)gManagedObjectModelCache;
    objc_sync_enter(v3);
    if (!self->_managedObjectModel)
    {
      objc_msgSend((id)gManagedObjectModelCache, "objectForKey:", self->_modelURL);
      v4 = (NSManagedObjectModel *)objc_claimAutoreleasedReturnValue();
      managedObjectModel = self->_managedObjectModel;
      self->_managedObjectModel = v4;

      if (!self->_managedObjectModel)
      {
        v6 = (NSManagedObjectModel *)objc_msgSend(objc_alloc(MEMORY[0x1E0C97B98]), "initWithContentsOfURL:", self->_modelURL);
        v7 = self->_managedObjectModel;
        self->_managedObjectModel = v6;

        objc_msgSend((id)gManagedObjectModelCache, "setObject:forKey:", self->_managedObjectModel, self->_modelURL);
      }
    }
    objc_sync_exit(v3);

    v8 = self->_managedObjectModel;
  }
  else
  {
    v9 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
    if (v9)
      -[_DKCoreDataStorage managedObjectModel].cold.1(v9, v10, v11, v12, v13, v14, v15, v16);
    v8 = 0;
  }
  return v8;
}

- (void)setManagedObjectModel:(id)a3
{
  objc_storeStrong((id *)&self->_managedObjectModel, a3);
}

- (BOOL)isManagedObjectModel:(id)a3 compatibleWithPersistentStoreAtURL:(id)a4 error:(id *)a5
{
  id v7;
  uint64_t v8;
  void *v9;
  id v10;
  char v11;
  id v13;

  v7 = a3;
  v8 = *MEMORY[0x1E0C979E8];
  v13 = 0;
  objc_msgSend(MEMORY[0x1E0C97C00], "metadataForPersistentStoreOfType:URL:error:", v8, a4, &v13);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v13;
  if (!v9)
  {
    v11 = 0;
    if (!a5)
      goto LABEL_4;
    goto LABEL_3;
  }
  v11 = objc_msgSend(v7, "isConfiguration:compatibleWithStoreMetadata:", 0, v9);
  if (a5)
LABEL_3:
    *a5 = objc_retainAutorelease(v10);
LABEL_4:

  return v11;
}

- (unint64_t)managedObjectModelVersionCompatibleWithPersistentStoreAtURL:(_QWORD *)a3 error:
{
  id v5;
  unint64_t v6;
  void *v7;
  void *v8;
  char v9;
  id v10;
  void *v11;
  id v13;

  v5 = a2;
  if (a1)
  {
    v6 = 1;
    while (1)
    {
      v7 = (void *)MEMORY[0x193FEE914]();
      objc_msgSend(a1, "managedObjectModelForVersion:", v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v8)
      {
        v11 = 0;
LABEL_9:

        objc_autoreleasePoolPop(v7);
LABEL_10:
        v6 = 0;
        goto LABEL_11;
      }
      v13 = 0;
      v9 = objc_msgSend(a1, "isManagedObjectModel:compatibleWithPersistentStoreAtURL:error:", v8, v5, &v13);
      v10 = v13;
      v11 = v10;
      if ((v9 & 1) != 0)
        break;
      if (v10)
        goto LABEL_9;

      objc_autoreleasePoolPop(v7);
      if (++v6 == 9)
      {
        v11 = 0;
        goto LABEL_10;
      }
    }

    objc_autoreleasePoolPop(v7);
    if (v6 >= 9)
      goto LABEL_10;
LABEL_11:
    if (a3)
      *a3 = objc_retainAutorelease(v11);

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)managedObjectModelURLForVersion:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  -[_DKCoreDataStorage delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[_DKCoreDataStorage delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "coreDataStorage:needsManagedObjectModelNameForVersion:", self, a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      objc_msgSend(v7, "stringByAppendingPathExtension:", CFSTR("mom"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSURL URLByAppendingPathComponent:](self->_modelURL, "URLByAppendingPathComponent:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v9 = 0;
    }

  }
  else
  {
    v9 = 0;
  }
  return v9;
}

- (id)managedObjectModelForVersion:(unint64_t)a3
{
  void *v3;
  void *v4;

  -[_DKCoreDataStorage managedObjectModelURLForVersion:](self, "managedObjectModelURLForVersion:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
LABEL_5:
    v4 = 0;
    goto LABEL_6;
  }
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C97B98]), "initWithContentsOfURL:", v3);
  if (!v4)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
      -[_DKCoreDataStorage managedObjectModelForVersion:].cold.1();
    goto LABEL_5;
  }
LABEL_6:

  return v4;
}

- (int64_t)modelVersionForStoreAtURL:(id)a3 error:(id *)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  unint64_t v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  uint64_t v17;
  id v19;
  id v20;
  uint64_t v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = *MEMORY[0x1E0C979E8];
  v20 = 0;
  objc_msgSend(MEMORY[0x1E0C97C00], "metadataForPersistentStoreOfType:URL:error:", v7, v6, &v20);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v20;
  if (v8)
  {
    objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0C979F8]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "firstObject");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "length"))
    {
      v12 = objc_msgSend(v11, "integerValue");

      if (v12)
        goto LABEL_9;
    }
    else
    {

    }
  }
  -[_DKCoreDataStorage delegate](self, "delegate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v13
    || (v19 = v9,
        v12 = -[_DKCoreDataStorage managedObjectModelVersionCompatibleWithPersistentStoreAtURL:error:](self, v6, &v19),
        v14 = v19,
        v9,
        v9 = v14,
        !v12))
  {
    v15 = (void *)MEMORY[0x1E0CB35C8];
    v21 = *MEMORY[0x1E0CB2D50];
    v22[0] = CFSTR("Store version not found.");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, &v21, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "errorWithDomain:code:userInfo:", CFSTR("com.apple.coreduet.DKCoreDataStorage"), 2, v16);
    v17 = objc_claimAutoreleasedReturnValue();

    v12 = 0;
    v9 = (id)v17;
  }
LABEL_9:
  if (a4)
    *a4 = objc_retainAutorelease(v9);

  return v12;
}

- (BOOL)migratePersistentStoreAtURL:(id)a3 toManagedObjectModel:(id)a4 protectionClass:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  _DKCoreDataStorage *v13;
  id *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  unint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  NSObject *v24;
  NSObject *v25;
  id *v26;
  void *v27;
  char v28;
  id v30;
  _QWORD block[5];
  id v32;
  id v33;
  id v34;
  uint64_t *v35;
  uint64_t *v36;
  uint64_t v37;
  unint64_t v38;
  id obj;
  uint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  uint64_t (*v43)(uint64_t, uint64_t);
  void (*v44)(uint64_t);
  id v45;
  uint64_t v46;
  uint64_t *v47;
  uint64_t v48;
  char v49;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v46 = 0;
  v47 = &v46;
  v48 = 0x2020000000;
  v49 = 0;
  v40 = 0;
  v41 = &v40;
  v42 = 0x3032000000;
  v43 = __Block_byref_object_copy__19;
  v44 = __Block_byref_object_dispose__19;
  v45 = 0;
  v13 = self;
  objc_sync_enter(v13);
  v14 = (id *)(v41 + 5);
  obj = (id)v41[5];
  v15 = -[_DKCoreDataStorage modelVersionForStoreAtURL:error:](v13, "modelVersionForStoreAtURL:error:", v10, &obj);
  objc_storeStrong(v14, obj);
  if (v15)
  {
    objc_msgSend(v11, "versionIdentifiers");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "anyObject");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "integerValue");

    if (v15 < v18)
    {
      -[_DKCoreDataStorage delegate](v13, "delegate");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = v19;
      if (v19 && v15 > 0)
      {
        objc_msgSend(v11, "versionIdentifiers");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = objc_msgSend(v21, "count");

        if (v22)
        {
          v23 = v15 + 1;
          dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, -15);
          v24 = objc_claimAutoreleasedReturnValue();
          v25 = dispatch_queue_create("com.apple.coreduetd.Migration", v24);
          block[0] = MEMORY[0x1E0C809B0];
          block[1] = 3221225472;
          block[2] = __93___DKCoreDataStorage_migratePersistentStoreAtURL_toManagedObjectModel_protectionClass_error___block_invoke;
          block[3] = &unk_1E26E5DC0;
          block[4] = v13;
          v32 = v10;
          v33 = v11;
          v37 = v23;
          v38 = v18;
          v34 = v12;
          v35 = &v40;
          v36 = &v46;
          dispatch_async_and_wait(v25, block);

          goto LABEL_10;
        }
      }
      else
      {

      }
    }
    v26 = (id *)(v41 + 5);
    v30 = (id)v41[5];
    -[_DKCoreDataStorage autoMigratePersistentStoreAtURL:toManagedObjectModel:protectionClass:error:](v13, v10, v11, v12, &v30);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong(v26, v30);

    if (v27)
      *((_BYTE *)v47 + 24) = 1;
  }
LABEL_10:
  objc_sync_exit(v13);

  if (a6)
    *a6 = objc_retainAutorelease((id)v41[5]);
  v28 = *((_BYTE *)v47 + 24);
  _Block_object_dispose(&v40, 8);

  _Block_object_dispose(&v46, 8);
  return v28;
}

- (uint64_t)migratePersistentStoreAtURL:(void *)a3 toManagedObjectModel:(void *)a4 protectionClass:(unint64_t)a5 startVersion:(unint64_t)a6 endVersion:(_QWORD *)a7 error:
{
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  char v19;
  char v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  int v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  int v30;
  void *v31;
  uint64_t v32;
  id v33;
  void *v34;
  id v35;
  void *v36;
  void *v37;
  uint64_t v38;
  _QWORD *v40;
  id v41;
  void *v42;
  unint64_t v43;
  id v44;
  uint64_t v45;
  id v46;
  id v47;
  id v48;
  unsigned __int8 v49;
  uint64_t v50;
  void *v51;
  uint8_t v52[4];
  _DWORD v53[7];

  *(_QWORD *)&v53[5] = *MEMORY[0x1E0C80C00];
  v13 = a2;
  v14 = a3;
  v44 = a4;
  v42 = v13;
  if (!a1)
  {
    v38 = 0;
    goto LABEL_32;
  }
  if (a5 > a6)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unknown or illegal model version identifier(s): start:%lu end:%lu"), a5, a6);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)MEMORY[0x1E0CB35C8];
    v50 = *MEMORY[0x1E0CB2D50];
    v51 = v15;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v51, &v50, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "errorWithDomain:code:userInfo:", CFSTR("com.apple.coreduet.DKCoreDataStorage"), 1, v17);
    v18 = (id)objc_claimAutoreleasedReturnValue();

    v19 = 0;
    if (a7)
      goto LABEL_30;
    goto LABEL_31;
  }
  v40 = a7;
  v41 = v14;
  v20 = 0;
  v18 = 0;
  v21 = a5;
  v22 = a5;
  v43 = a6;
  while (1)
  {
    objc_msgSend(a1, "delegate");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "coreDataStorage:shouldCallDelegateAfterAutoMigrationToManagedObjectModelHavingVersion:", a1, v21);

    if (a6 != v21 && !v24)
      goto LABEL_21;
    objc_msgSend(a1, "managedObjectModelForVersion:", v21);
    v25 = objc_claimAutoreleasedReturnValue();
    if (!v25)
      break;
    v26 = (void *)v25;
    v27 = v13;
    objc_msgSend(a1, "delegate");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = v22;
    v30 = objc_msgSend(v28, "coreDataStorage:shouldCallDelegateBeforeAutoMigrationFromManagedObjectModelHavingVersion:", a1, v22);

    if (v30)
    {
      objc_msgSend(a1, "managedObjectModelForVersion:", v29);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = v29;
      if (!v31 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[_DKCoreDataStorage migratePersistentStoreAtURL:toManagedObjectModel:protectionClass:startVersion:endVersion:error:].cold.2(v52, v29, v53);
      v48 = v18;
      v13 = v27;
      -[_DKCoreDataStorage willAutoMigrateStoreAtURL:fromManagedObjectModel:havingVersion:error:](a1, v27, v31, v32, &v48);
      v33 = v48;

      v18 = v33;
      v45 = v21;
    }
    else
    {
      v45 = v29;
      v13 = v27;
    }
    v47 = v18;
    -[_DKCoreDataStorage autoMigratePersistentStoreAtURL:toManagedObjectModel:protectionClass:error:](a1, v13, v26, v44, &v47);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = v47;

    a6 = v43;
    if (!v34)
    {

      v18 = v35;
      goto LABEL_29;
    }
    if (v24)
    {
      objc_msgSend(v34, "persistentStores");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "firstObject");
      v37 = (void *)objc_claimAutoreleasedReturnValue();

      v46 = v35;
      LODWORD(v36) = -[_DKCoreDataStorage didAutoMigratePersistentStore:toManagedObjectModel:havingVersion:error:](a1, v37, v26, v21, &v46);
      v18 = v46;

      if (!(_DWORD)v36)
      {

        goto LABEL_29;
      }
      v13 = v42;
    }
    else
    {
      v18 = v35;
    }

    v22 = v45;
LABEL_21:
    if (a6 == v21)
      v20 = 1;
    if (++v21 > a6)
      goto LABEL_29;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    -[_DKCoreDataStorage migratePersistentStoreAtURL:toManagedObjectModel:protectionClass:startVersion:endVersion:error:].cold.1(v21);
LABEL_29:
  v19 = v20;
  a7 = v40;
  v14 = v41;
  if (v40)
LABEL_30:
    *a7 = objc_retainAutorelease(v18);
LABEL_31:
  v49 = v19;

  v38 = v49;
LABEL_32:

  return v38;
}

- (_BYTE)autoMigratePersistentStoreAtURL:(void *)a3 toManagedObjectModel:(void *)a4 protectionClass:(_QWORD *)a5 error:
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  _BYTE *v14;
  uint64_t v15;
  void *v16;
  id v17;
  id v19[7];

  v19[6] = *(id *)MEMORY[0x1E0C80C00];
  v9 = a2;
  v10 = a3;
  v11 = a4;
  if (a1)
  {
    v12 = (void *)MEMORY[0x193FEE914]();
    -[_DKCoreDataStorage _defaultOptionsForStoreWithProtectionClass:](a1, v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (_BYTE *)objc_msgSend(objc_alloc(MEMORY[0x1E0C97C00]), "initWithManagedObjectModel:", v10);
    a1 = v14;
    if (v14)
    {
      v15 = *MEMORY[0x1E0C979E8];
      v19[0] = 0;
      objc_msgSend(v14, "addPersistentStoreWithType:configuration:URL:options:error:", v15, 0, v9, v13, v19);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = v19[0];
      if (!v16)
      {

        v16 = 0;
        a1 = 0;
      }

    }
    else
    {
      v17 = 0;
    }

    objc_autoreleasePoolPop(v12);
    if (a5)
      *a5 = objc_retainAutorelease(v17);

  }
  return a1;
}

- (uint64_t)willAutoMigrateStoreAtURL:(void *)a3 fromManagedObjectModel:(uint64_t)a4 havingVersion:(_QWORD *)a5 error:
{
  id v9;
  id v10;
  id v11;
  _BOOL8 v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  id v23;
  _BOOL8 v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  id v33;

  v9 = a2;
  v10 = a3;
  if (a1)
  {
    v11 = a1;
    objc_sync_enter(v11);
    v12 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG);
    if (v12)
      -[_DKCoreDataStorage willAutoMigrateStoreAtURL:fromManagedObjectModel:havingVersion:error:].cold.3(v12, v13, v14, v15, v16, v17, v18, v19);
    v20 = (void *)MEMORY[0x193FEE914]();
    objc_msgSend(v11, "delegate");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = 0;
    v22 = objc_msgSend(v21, "coreDataStorage:willAutoMigrateStoreAtURL:fromManagedObjectModel:havingVersion:error:", v11, v9, v10, a4, &v33);
    v23 = v33;

    objc_autoreleasePoolPop(v20);
    if ((_DWORD)v22)
    {
      v24 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG);
      if (v24)
        -[_DKCoreDataStorage willAutoMigrateStoreAtURL:fromManagedObjectModel:havingVersion:error:].cold.1(v24, v25, v26, v27, v28, v29, v30, v31);
    }
    else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      -[_DKCoreDataStorage willAutoMigrateStoreAtURL:fromManagedObjectModel:havingVersion:error:].cold.2();
    }
    objc_sync_exit(v11);

    if (a5)
      *a5 = objc_retainAutorelease(v23);

  }
  else
  {
    v22 = 0;
  }

  return v22;
}

- (uint64_t)didAutoMigratePersistentStore:(void *)a3 toManagedObjectModel:(uint64_t)a4 havingVersion:(_QWORD *)a5 error:
{
  id v9;
  id v10;
  id v11;
  _BOOL8 v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  id v23;
  _BOOL8 v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  id v33;

  v9 = a2;
  v10 = a3;
  if (a1)
  {
    v11 = a1;
    objc_sync_enter(v11);
    v12 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG);
    if (v12)
      -[_DKCoreDataStorage didAutoMigratePersistentStore:toManagedObjectModel:havingVersion:error:].cold.3(v12, v13, v14, v15, v16, v17, v18, v19);
    v20 = (void *)MEMORY[0x193FEE914]();
    objc_msgSend(v11, "delegate");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = 0;
    v22 = objc_msgSend(v21, "coreDataStorage:didAutoMigratePersistentStore:toManagedObjectModel:havingVersion:error:", v11, v9, v10, a4, &v33);
    v23 = v33;

    objc_autoreleasePoolPop(v20);
    if ((_DWORD)v22)
    {
      v24 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG);
      if (v24)
        -[_DKCoreDataStorage didAutoMigratePersistentStore:toManagedObjectModel:havingVersion:error:].cold.1(v24, v25, v26, v27, v28, v29, v30, v31);
    }
    else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      -[_DKCoreDataStorage didAutoMigratePersistentStore:toManagedObjectModel:havingVersion:error:].cold.2();
    }
    objc_sync_exit(v11);

    if (a5)
      *a5 = objc_retainAutorelease(v23);

  }
  else
  {
    v22 = 0;
  }

  return v22;
}

- (_BYTE)_defaultOptionsForStoreWithProtectionClass:(_BYTE *)a1
{
  _BYTE *v2;
  void *v3;
  _BOOL8 v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  _QWORD v12[4];
  _QWORD v13[5];

  v2 = a1;
  v13[4] = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v12[0] = *MEMORY[0x1E0C978D0];
    v3 = (void *)MEMORY[0x1E0CB37E8];
    v4 = a1[67] == 0;
    v5 = a2;
    objc_msgSend(v3, "numberWithInt:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = v6;
    v12[1] = *MEMORY[0x1E0C97868];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v2[67] == 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = *MEMORY[0x1E0C97940];
    v13[1] = v7;
    v13[2] = v5;
    v9 = *MEMORY[0x1E0C97998];
    v12[2] = v8;
    v12[3] = v9;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v2[67]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v13[3] = v10;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 4);
    v2 = (_BYTE *)objc_claimAutoreleasedReturnValue();

  }
  return v2;
}

- (id)_descriptionForStoreWithURL:(void *)a3 protectionClass:(int)a4 sync:
{
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  if (a1)
  {
    objc_msgSend(MEMORY[0x1E0C97C08], "persistentStoreDescriptionWithURL:", a2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[_DKCoreDataStorage _defaultOptionsForStoreWithProtectionClass:]((_BYTE *)a1, v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v26;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v26 != v12)
            objc_enumerationMutation(v9);
          v14 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * i);
          objc_msgSend(v9, "objectForKeyedSubscript:", v14);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "setOption:forKey:", v15, v14);

        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
      }
      while (v11);
    }
    objc_msgSend(v8, "setType:", *MEMORY[0x1E0C979E8]);
    if (a4)
    {
      v16 = (void *)objc_opt_new();
      objc_msgSend(v16, "setUseZoneWidePCS:", 1);
      v17 = objc_alloc_init(MEMORY[0x1E0C97AD0]);
      objc_msgSend(v17, "setUseDeviceToDeviceEncryption:", 1);
      v18 = (void *)MEMORY[0x1E0CB37E8];
      +[_DKSyncPolicy policy](_DKSyncPolicy, "policy");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "numberWithUnsignedInteger:", objc_msgSend(v19, "assetThresholdInBytes"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setCkAssetThresholdBytes:", v20);

      +[_DKCloudUtilities containerIdentifier](_DKCloudUtilities, "containerIdentifier");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setContainerIdentifier:", v21);

      objc_msgSend(v17, "setContainerOptions:", v16);
      v22 = objc_msgSend(objc_alloc(MEMORY[0x1E0C97AC8]), "initWithOptions:", v17);
      v23 = *(void **)(a1 + 56);
      *(_QWORD *)(a1 + 56) = v22;

      objc_msgSend(v8, "setOption:forMirroringKey:", *(_QWORD *)(a1 + 56), *MEMORY[0x1E0C97950]);
      objc_msgSend(v8, "setConfiguration:", CFSTR("CloudKit"));

    }
    else
    {
      objc_msgSend(v8, "setConfiguration:", CFSTR("Local"));
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (uint64_t)_addStoresToCoordinator:(void *)a3 protectionClass:(_QWORD *)a4 error:
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;
  BOOL v16;
  NSObject *v17;
  NSObject *v18;
  void *v19;
  NSObject *v20;
  _BOOL8 v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  NSObject *v30;
  _BOOL8 v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  _BOOL8 v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  _BOOL8 v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  _BOOL8 v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  void *v65;
  _QWORD v67[4];
  NSObject *v68;
  uint64_t *v69;
  uint64_t *v70;
  _QWORD v71[4];
  NSObject *v72;
  uint64_t *v73;
  uint64_t *v74;
  uint64_t v75;
  uint64_t *v76;
  uint64_t v77;
  char v78;
  uint64_t v79;
  uint64_t *v80;
  uint64_t v81;
  uint64_t (*v82)(uint64_t, uint64_t);
  void (*v83)(uint64_t);
  id v84;
  id v85;
  uint64_t v86;
  _QWORD v87[2];

  v87[1] = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  if (a1)
  {
    v9 = (void *)MEMORY[0x1E0C99E98];
    objc_msgSend(*(id *)(a1 + 16), "objectForKeyedSubscript:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "fileURLWithPath:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (*(_BYTE *)(a1 + 68))
    {
      -[_DKCoreDataStorage _defaultOptionsForStoreWithProtectionClass:]((_BYTE *)a1, v8);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = *MEMORY[0x1E0C979E8];
      v85 = 0;
      objc_msgSend(v7, "addPersistentStoreWithType:configuration:URL:options:error:", v13, 0, v11, v12, &v85);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v85;

      if (v14)
        v16 = v15 == 0;
      else
        v16 = 0;
      a1 = v16;
      if (a4 && (a1 & 1) == 0)
        *a4 = objc_retainAutorelease(v15);

      goto LABEL_41;
    }
    v79 = 0;
    v80 = &v79;
    v81 = 0x3032000000;
    v82 = __Block_byref_object_copy__19;
    v83 = __Block_byref_object_dispose__19;
    v84 = 0;
    v75 = 0;
    v76 = &v75;
    v77 = 0x2020000000;
    v78 = 1;
    v17 = dispatch_group_create();
    if (*(_BYTE *)(a1 + 69))
    {
      if (v11)
      {
        +[_CDLogging syncChannel](_CDLogging, "syncChannel");
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
          -[_DKCoreDataStorage _addStoresToCoordinator:protectionClass:error:].cold.7();

        dispatch_group_enter(v17);
        -[_DKCoreDataStorage _descriptionForStoreWithURL:protectionClass:sync:](a1, (uint64_t)v11, v8, 1);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v67[0] = MEMORY[0x1E0C809B0];
        v67[1] = 3221225472;
        v67[2] = __68___DKCoreDataStorage__addStoresToCoordinator_protectionClass_error___block_invoke_60;
        v67[3] = &unk_1E26E5DE8;
        v69 = &v75;
        v70 = &v79;
        v68 = v17;
        objc_msgSend(v7, "addPersistentStoreWithDescription:completionHandler:", v19, v67);
        v20 = v68;
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          -[_DKCoreDataStorage _addStoresToCoordinator:protectionClass:error:].cold.6();
        *((_BYTE *)v76 + 24) = 0;
        v39 = (void *)MEMORY[0x1E0CB35C8];
        v86 = *MEMORY[0x1E0CB2D50];
        v87[0] = CFSTR("Unsupported protection class.");
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v87, &v86, 1);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "errorWithDomain:code:userInfo:", CFSTR("com.apple.coreduet"), 0, v19);
        v40 = objc_claimAutoreleasedReturnValue();
        v20 = v80[5];
        v80[5] = v40;
      }

      if (dispatch_group_wait(v17, 0xFFFFFFFFFFFFFFFFLL))
      {
        v41 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
        if (v41)
          -[_DKCoreDataStorage _addStoresToCoordinator:protectionClass:error:].cold.2(v41, v42, v43, v44, v45, v46, v47, v48);
LABEL_30:
        a1 = 0;
LABEL_40:

        _Block_object_dispose(&v75, 8);
        _Block_object_dispose(&v79, 8);

LABEL_41:
        goto LABEL_42;
      }
      v49 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG);
      if (v49)
        -[_DKCoreDataStorage _addStoresToCoordinator:protectionClass:error:].cold.4(v49, v50, v51, v52, v53, v54, v55, v56);
    }
    else
    {
      v21 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG);
      if (v21)
        -[_DKCoreDataStorage _addStoresToCoordinator:protectionClass:error:].cold.3(v21, v22, v23, v24, v25, v26, v27, v28);
      dispatch_group_enter(v17);
      -[_DKCoreDataStorage _descriptionForStoreWithURL:protectionClass:sync:](a1, (uint64_t)v11, v8, 0);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v71[0] = MEMORY[0x1E0C809B0];
      v71[1] = 3221225472;
      v71[2] = __68___DKCoreDataStorage__addStoresToCoordinator_protectionClass_error___block_invoke;
      v71[3] = &unk_1E26E5DE8;
      v73 = &v75;
      v74 = &v79;
      v30 = v17;
      v72 = v30;
      objc_msgSend(v7, "addPersistentStoreWithDescription:completionHandler:", v29, v71);
      if (dispatch_group_wait(v30, 0xFFFFFFFFFFFFFFFFLL))
      {
        v31 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
        if (v31)
          -[_DKCoreDataStorage _addStoresToCoordinator:protectionClass:error:].cold.2(v31, v32, v33, v34, v35, v36, v37, v38);

        goto LABEL_30;
      }
      v57 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG);
      if (v57)
        -[_DKCoreDataStorage _addStoresToCoordinator:protectionClass:error:].cold.1(v57, v58, v59, v60, v61, v62, v63, v64);

    }
    if (a4)
    {
      v65 = (void *)v80[5];
      if (v65)
        *a4 = objc_retainAutorelease(v65);
    }
    a1 = *((_BYTE *)v76 + 24) != 0;
    goto LABEL_40;
  }
LABEL_42:

  return a1;
}

- (BOOL)confirmDatabaseConnectionFor:(id)a3
{
  void *v3;
  BOOL v4;

  -[_DKCoreDataStorage managedObjectContextFor:](self, "managedObjectContextFor:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

+ (unint64_t)countObjectsInContext:(id)a3 entityName:(id)a4 predicate:(id)a5 includeSubentities:(BOOL)a6 includePendingChanges:(BOOL)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  unint64_t v17;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(uint64_t);
  void *v22;
  id v23;
  id v24;
  id v25;
  uint64_t *v26;
  uint64_t *v27;
  BOOL v28;
  BOOL v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t (*v33)(uint64_t, uint64_t);
  void (*v34)(uint64_t);
  id v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t v39;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v36 = 0;
  v37 = &v36;
  v38 = 0x2020000000;
  v39 = 0;
  v30 = 0;
  v31 = &v30;
  v32 = 0x3032000000;
  v33 = __Block_byref_object_copy__19;
  v34 = __Block_byref_object_dispose__19;
  v35 = 0;
  kdebug_trace();
  _cdknowledge_signpost_count_begin(v12);
  v19 = MEMORY[0x1E0C809B0];
  v20 = 3221225472;
  v21 = __106___DKCoreDataStorage_countObjectsInContext_entityName_predicate_includeSubentities_includePendingChanges___block_invoke;
  v22 = &unk_1E26E5E38;
  v14 = v12;
  v23 = v14;
  v15 = v11;
  v24 = v15;
  v28 = a6;
  v29 = a7;
  v16 = v13;
  v25 = v16;
  v26 = &v36;
  v27 = &v30;
  objc_msgSend(v15, "performWithOptions:andBlock:", 4, &v19);
  objc_msgSend((id)v31[5], "code", v19, v20, v21, v22);
  kdebug_trace();
  _cdknowledge_signpost_count_end(v37[3], objc_msgSend((id)v31[5], "code"));
  v17 = v37[3];

  _Block_object_dispose(&v30, 8);
  _Block_object_dispose(&v36, 8);

  return v17;
}

+ (unint64_t)deleteObjectsIfNeededToLimitTotal:(unint64_t)a3 context:(id)a4 entityName:(id)a5 predicate:(id)a6 sortDescriptors:(id)a7 fetchLimit:(unint64_t)a8 includeSubentities:(BOOL)a9 includePendingChanges:(BOOL)a10
{
  return +[_DKCoreDataStorage deleteObjectsInContext:entityName:predicate:sortDescriptors:fetchOffset:fetchLimit:includeSubentities:includePendingChanges:](_DKCoreDataStorage, "deleteObjectsInContext:entityName:predicate:sortDescriptors:fetchOffset:fetchLimit:includeSubentities:includePendingChanges:", a4, a5, a6, a7, a3, a8);
}

+ (unint64_t)deleteOrphanedEntitiesInContext:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  unint64_t v6;
  unint64_t v7;
  void *v8;
  unint64_t v9;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v3 = (void *)MEMORY[0x1E0CB3880];
  v4 = a3;
  objc_msgSend(v3, "predicateWithFormat:", CFSTR("ANY event == NULL"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v11) = 1;
  v6 = +[_DKCoreDataStorage deleteObjectsInContext:entityName:predicate:sortDescriptors:fetchLimit:includeSubentities:includePendingChanges:](_DKCoreDataStorage, "deleteObjectsInContext:entityName:predicate:sortDescriptors:fetchLimit:includeSubentities:includePendingChanges:", v4, CFSTR("StructuredMetadata"), v5, 0, 0, 0, v11);
  LOBYTE(v12) = 1;
  v7 = +[_DKCoreDataStorage deleteObjectsInContext:entityName:predicate:sortDescriptors:fetchLimit:includeSubentities:includePendingChanges:](_DKCoreDataStorage, "deleteObjectsInContext:entityName:predicate:sortDescriptors:fetchLimit:includeSubentities:includePendingChanges:", v4, CFSTR("CustomMetadata"), v5, 0, 0, 0, v12)+ v6;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("ANY product == NULL"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v13) = 1;
  v9 = +[_DKCoreDataStorage deleteObjectsInContext:entityName:predicate:sortDescriptors:fetchLimit:includeSubentities:includePendingChanges:](_DKCoreDataStorage, "deleteObjectsInContext:entityName:predicate:sortDescriptors:fetchLimit:includeSubentities:includePendingChanges:", v4, CFSTR("Source"), v8, 0, 0, 0, v13);

  return v7 + v9;
}

- (BOOL)_deleteDatabaseFiles:(uint64_t)a1
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  if (a1)
  {
    v3 = *(void **)(a1 + 48);
    v4 = a2;
    objc_msgSend(v3, "removeItemAtPath:error:", v4, 0);
    v5 = *(void **)(a1 + 48);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-wal"), v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeItemAtPath:error:", v6, 0);

    v7 = *(void **)(a1 + 48);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-shm"), v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "removeItemAtPath:error:", v8, 0);
  }
  return a1 != 0;
}

- (BOOL)deleteStorageFor:(id)a3
{
  id v4;
  _DKCoreDataStorage *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  NSObject *v11;
  NSObject *v12;
  id v13;
  void *v14;
  uint64_t v15;
  char v16;
  id v17;
  NSObject *v18;
  NSObject *v19;
  __CFNotificationCenter *DarwinNotifyCenter;
  const __CFString *v21;
  id v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  id v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (self->_isDatabaseManager)
  {
    v5 = self;
    objc_sync_enter(v5);
    -[_DKCoreDataStorage databasePathFor:]((id *)&v5->super.isa, (uint64_t)v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "path");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v8, "fileExistsAtPath:", v9);

    if ((v10 & 1) != 0)
    {
      -[NSMutableDictionary objectForKeyedSubscript:](v5->_persistentStoreCoordinators, "objectForKeyedSubscript:", v4);
      v11 = objc_claimAutoreleasedReturnValue();
      if (!v11)
      {
        +[_CDLogging knowledgeChannel](_CDLogging, "knowledgeChannel");
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
          -[_DKCoreDataStorage deleteStorageFor:].cold.2();

        v13 = objc_alloc(MEMORY[0x1E0C97C00]);
        -[_DKCoreDataStorage managedObjectModel](v5, "managedObjectModel");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v13, "initWithManagedObjectModel:", v14);

      }
      v15 = *MEMORY[0x1E0C979E8];
      v23 = 0;
      v16 = -[NSObject destroyPersistentStoreAtURL:withType:options:error:](v11, "destroyPersistentStoreAtURL:withType:options:error:", v7, v15, 0, &v23);
      v17 = v23;
      if ((v16 & 1) != 0)
      {
        +[_CDLogging knowledgeChannel](_CDLogging, "knowledgeChannel");
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          v25 = v6;
          v26 = 2112;
          v27 = v4;
          _os_log_impl(&dword_18DDBE000, v18, OS_LOG_TYPE_DEFAULT, "Succesfully truncated data storage in %@ for protection class %@.", buf, 0x16u);
        }
      }
      else
      {
        +[_CDLogging knowledgeChannel](_CDLogging, "knowledgeChannel");
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 138412802;
          v25 = v6;
          v26 = 2112;
          v27 = v4;
          v28 = 2112;
          v29 = v17;
          _os_log_fault_impl(&dword_18DDBE000, v18, OS_LOG_TYPE_FAULT, "Failed to truncate data storage in %@ for protection class %@: %@", buf, 0x20u);
        }
      }

      -[_DKCoreDataStorage invalidateManagedObjectContextAndPersistentStoreCoordinatorFor:](v5, v4);
      if (v17)
        -[_DKCoreDataStorage _deleteDatabaseFiles:]((uint64_t)v5, v6);

    }
    else
    {
      +[_CDLogging knowledgeChannel](_CDLogging, "knowledgeChannel");
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18DDBE000, v11, OS_LOG_TYPE_DEFAULT, "-deleteStorageFor: called on non-existent storage.", buf, 2u);
      }
    }

    objc_sync_exit(v5);
  }
  else
  {
    +[_CDLogging knowledgeChannel](_CDLogging, "knowledgeChannel");
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      -[_DKCoreDataStorage deleteStorageFor:].cold.1();

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    v21 = (const __CFString *)-[_DKCoreDataStorage clientNeedsHelpNotification]((id *)&self->super.isa);
    CFNotificationCenterPostNotification(DarwinNotifyCenter, v21, 0, 0, 1u);
  }

  return 1;
}

- (id)databasePathFor:(id *)a1
{
  if (a1)
  {
    objc_msgSend(a1[2], "objectForKeyedSubscript:", a2);
    a1 = (id *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

+ (uint64_t)forceCopyItemAtPath:(void *)a3 toPath:(uint64_t)a4 error:
{
  id v6;
  id v7;
  void *v8;

  v6 = a2;
  v7 = a3;
  objc_opt_self();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "fileExistsAtPath:", v7))
    objc_msgSend(v8, "removeItemAtPath:error:", v7, 0);
  objc_msgSend(v8, "copyItemAtPath:toPath:error:", v6, v7, a4);

  return 1;
}

- (id)copyStorageFor:(id)a3 toDirectory:(id)a4
{
  id v6;
  id v7;
  void *v8;
  _DKCoreDataStorage *v9;
  void *v10;
  _DKCoreDataStorage *v11;
  _DKCoreDataStorage *v12;
  _DKCoreDataStorage *v13;
  _QWORD v15[4];
  id v16;
  _DKCoreDataStorage *v17;
  id v18;
  _DKCoreDataStorage *v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  char v24;

  v6 = a3;
  v7 = a4;
  -[_DKCoreDataStorage managedObjectContextFor:](self, "managedObjectContextFor:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = -[_DKCoreDataStorage initWithDirectory:databaseName:modelURL:readOnly:localOnly:]([_DKCoreDataStorage alloc], "initWithDirectory:databaseName:modelURL:readOnly:localOnly:", v7, self->_databaseName, self->_modelURL, 0, self->_localOnly);
    -[_DKCoreDataStorage managedObjectContextFor:](v9, "managedObjectContextFor:", v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      -[_DKCoreDataStorage invalidateManagedObjectContextAndPersistentStoreCoordinatorFor:](v9, v6);
      v21 = 0;
      v22 = &v21;
      v23 = 0x2020000000;
      v24 = 0;
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __49___DKCoreDataStorage_copyStorageFor_toDirectory___block_invoke;
      v15[3] = &unk_1E26E5E60;
      v16 = v8;
      v17 = self;
      v18 = v6;
      v11 = v9;
      v19 = v11;
      v20 = &v21;
      objc_msgSend(v16, "performWithOptions:andBlock:", 4, v15);
      if (*((_BYTE *)v22 + 24))
        v12 = v11;
      else
        v12 = 0;
      v13 = v12;

      _Block_object_dispose(&v21, 8);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[_DKCoreDataStorage copyStorageFor:toDirectory:].cold.1();
      v13 = 0;
    }

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

+ (unint64_t)updateObjectsInContext:(id)a3 entityName:(id)a4 predicate:(id)a5 sortDescriptors:(id)a6 batchFetchLimit:(unint64_t)a7 totalFetchLimit:(unint64_t)a8 includeSubentities:(BOOL)a9 updateBlock:(id)a10
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  unint64_t v25;
  _QWORD v27[4];
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  uint64_t *v33;
  unint64_t v34;
  unint64_t v35;
  BOOL v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t v40;

  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a10;
  v37 = 0;
  v38 = &v37;
  v39 = 0x2020000000;
  v40 = 0;
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __145___DKCoreDataStorage_updateObjectsInContext_entityName_predicate_sortDescriptors_batchFetchLimit_totalFetchLimit_includeSubentities_updateBlock___block_invoke;
  v27[3] = &unk_1E26E5E88;
  v20 = v15;
  v28 = v20;
  v21 = v16;
  v29 = v21;
  v34 = a8;
  v35 = a7;
  v36 = a9;
  v22 = v17;
  v30 = v22;
  v23 = v18;
  v31 = v23;
  v24 = v19;
  v32 = v24;
  v33 = &v37;
  objc_msgSend(v20, "performWithOptions:andBlock:", 4, v27);
  v25 = v38[3];

  _Block_object_dispose(&v37, 8);
  return v25;
}

+ (id)anonymizeString:(void *)a3 withSalt:
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  v5 = a2;
  objc_opt_self();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-%@"), v5, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v6, "hash"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", CFSTR("%@"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (unint64_t)anonymizeStringAttributesOfManagedObject:(id)a3 withSalt:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v29;
  void *v30;
  void *v31;
  unint64_t v32;
  id v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v34 = a4;
  objc_msgSend(v5, "entity");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "attributesByName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
  if (v7)
  {
    v8 = v7;
    v9 = 0;
    v10 = *(_QWORD *)v36;
    v30 = v5;
    while (1)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v36 != v10)
          objc_enumerationMutation(v6);
        v12 = *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * i);
        objc_msgSend(v6, "objectForKeyedSubscript:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "attributeValueClassName");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "isEqualToString:", CFSTR("NSString"));

        if (v15)
        {
          objc_msgSend(v5, "valueForKey:", v12);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = v16;
          if (v16 && objc_msgSend(v16, "length"))
          {
            +[_DKCoreDataStorage anonymizeString:withSalt:]((uint64_t)a1, v17, v34);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v5, "setValue:forKey:", v18, v12);

            ++v9;
          }
        }
        else
        {
          objc_msgSend(v13, "attributeValueClassName");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = objc_msgSend(v19, "isEqualToString:", CFSTR("NSURL"));

          if (!v20)
            goto LABEL_17;
          objc_msgSend(v5, "valueForKey:", v12);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = v21;
          if (v21)
          {
            objc_msgSend(v21, "absoluteString");
            v22 = objc_claimAutoreleasedReturnValue();
            if (v22)
            {
              v23 = (void *)v22;
              v32 = v9;
              objc_msgSend(v17, "absoluteString");
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              v25 = objc_msgSend(v24, "length");

              if (v25)
              {
                objc_msgSend(v17, "absoluteString");
                v31 = (void *)objc_claimAutoreleasedReturnValue();
                +[_DKCoreDataStorage anonymizeString:withSalt:]((uint64_t)a1, v31, v34);
                v26 = (void *)objc_claimAutoreleasedReturnValue();
                v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initWithString:", v26);
                v5 = v30;
                objc_msgSend(v30, "setValue:forKey:", v27, v12);

                v9 = v32 + 1;
              }
              else
              {
                v5 = v30;
                v9 = v32;
              }
            }
          }
        }

LABEL_17:
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
      if (!v8)
        goto LABEL_21;
    }
  }
  v9 = 0;
LABEL_21:

  return v9;
}

+ (unint64_t)anonymizeObjectStringsInContext:(id)a3 entityName:(id)a4 predicate:(id)a5 sortDescriptors:(id)a6 batchFetchLimit:(unint64_t)a7 totalFetchLimit:(unint64_t)a8 includeSubentities:(BOOL)a9 salt:(id)a10
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  unint64_t v23;
  uint64_t v25;
  _QWORD v26[4];
  id v27;

  v16 = a10;
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __147___DKCoreDataStorage_anonymizeObjectStringsInContext_entityName_predicate_sortDescriptors_batchFetchLimit_totalFetchLimit_includeSubentities_salt___block_invoke;
  v26[3] = &unk_1E26E5EB0;
  v27 = v16;
  v17 = v16;
  v18 = a6;
  v19 = a5;
  v20 = a4;
  v21 = a3;
  v22 = (void *)MEMORY[0x193FEEAF4](v26);
  LOBYTE(v25) = a9;
  v23 = +[_DKCoreDataStorage updateObjectsInContext:entityName:predicate:sortDescriptors:batchFetchLimit:totalFetchLimit:includeSubentities:updateBlock:](_DKCoreDataStorage, "updateObjectsInContext:entityName:predicate:sortDescriptors:batchFetchLimit:totalFetchLimit:includeSubentities:updateBlock:", v21, v20, v19, v18, a7, a8, v25, v22);

  return v23;
}

- (NSString)directory
{
  return (NSString *)objc_getProperty(self, a2, 72, 1);
}

- (BOOL)readOnly
{
  return self->_readOnly;
}

- (BOOL)localOnly
{
  return self->_localOnly;
}

- (BOOL)sync
{
  return self->_sync;
}

- (NSURL)modelURL
{
  return (NSURL *)objc_getProperty(self, a2, 80, 1);
}

- (NSString)databaseName
{
  return (NSString *)objc_getProperty(self, a2, 88, 1);
}

- (_DKCoreDataStorageDelegate)delegate
{
  return (_DKCoreDataStorageDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (NSCloudKitMirroringDelegate)mirroringDelegate
{
  return (NSCloudKitMirroringDelegate *)objc_getProperty(self, a2, 56, 1);
}

- (NSString)containerIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 104, 1);
}

- (BOOL)requiresManualMigration
{
  return self->_requiresManualMigration;
}

- (void)initWithDirectory:databaseName:modelURL:readOnly:localOnly:sync:.cold.1()
{
  os_log_t v0;
  uint8_t v1[16];

  OUTLINED_FUNCTION_6();
  _os_log_fault_impl(&dword_18DDBE000, v0, OS_LOG_TYPE_FAULT, "Client is not entitled for direct CoreDuet database access.", v1, 2u);
  OUTLINED_FUNCTION_4();
}

- (void)handleDataProtectionChangeFor:willBeAvailable:.cold.1()
{
  int v0;
  uint8_t v1[12];
  __int16 v2;
  int v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_3();
  v2 = 1024;
  v3 = v0;
  _os_log_debug_impl(&dword_18DDBE000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "Data protection availability changed for %@ to %d", v1, 0x12u);
  OUTLINED_FUNCTION_5();
}

- (void)handleDatabaseErrors:(uint64_t)a3 forProtectionClass:(uint64_t)a4 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_18DDBE000, MEMORY[0x1E0C81028], a3, "Attempting to delete database in case it is corrupt", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_4();
}

- (void)removePersistentStoresInCoordinator:(_QWORD *)a3 .cold.1(uint8_t *a1, uint64_t a2, _QWORD *a3)
{
  *(_DWORD *)a1 = 138412290;
  *a3 = a2;
  OUTLINED_FUNCTION_1_1(&dword_18DDBE000, MEMORY[0x1E0C81028], (uint64_t)a3, "Error removing persistent store: %@", a1);
}

- (void)managedObjectModel
{
  OUTLINED_FUNCTION_0_1(&dword_18DDBE000, MEMORY[0x1E0C81028], a3, "Missing model URL...", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_4();
}

- (void)managedObjectModelForVersion:.cold.1()
{
  uint8_t v0[24];
  uint64_t v1;

  v1 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_3();
  _os_log_debug_impl(&dword_18DDBE000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "Unable to load model: '%@'", v0, 0xCu);
  OUTLINED_FUNCTION_5();
}

- (void)migratePersistentStoreAtURL:(uint64_t)a1 toManagedObjectModel:protectionClass:startVersion:endVersion:error:.cold.1(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_18DDBE000, MEMORY[0x1E0C81028], v2, "Failed to find model version %@, unable to migrate", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_1();
}

- (void)migratePersistentStoreAtURL:(_QWORD *)a3 toManagedObjectModel:protectionClass:startVersion:endVersion:error:.cold.2(uint8_t *a1, uint64_t a2, _QWORD *a3)
{
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)a1 = 138412290;
  *a3 = v5;
  _os_log_error_impl(&dword_18DDBE000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed to find model version %@, will attempt to recover...", a1, 0xCu);

}

- (void)autoMigratePersistentStoreAtURL:(void *)a1 toManagedObjectModel:(uint8_t *)buf protectionClass:error:.cold.1(void *a1, uint8_t *buf)
{
  *(_DWORD *)buf = 138412290;
  *(_QWORD *)(buf + 4) = a1;
  _os_log_fault_impl(&dword_18DDBE000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Caught exception during migration: %@", buf, 0xCu);

}

- (void)willAutoMigrateStoreAtURL:(uint64_t)a3 fromManagedObjectModel:(uint64_t)a4 havingVersion:(uint64_t)a5 error:(uint64_t)a6 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_8(&dword_18DDBE000, MEMORY[0x1E0C81028], a3, "Done setting up database for migration", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_4();
}

- (void)willAutoMigrateStoreAtURL:fromManagedObjectModel:havingVersion:error:.cold.2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_18DDBE000, MEMORY[0x1E0C81028], v0, "Failed to set up database for migration: %@", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_5();
}

- (void)willAutoMigrateStoreAtURL:(uint64_t)a3 fromManagedObjectModel:(uint64_t)a4 havingVersion:(uint64_t)a5 error:(uint64_t)a6 .cold.3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_8(&dword_18DDBE000, MEMORY[0x1E0C81028], a3, "Setting up database for migration", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_4();
}

- (void)didAutoMigratePersistentStore:(uint64_t)a3 toManagedObjectModel:(uint64_t)a4 havingVersion:(uint64_t)a5 error:(uint64_t)a6 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_8(&dword_18DDBE000, MEMORY[0x1E0C81028], a3, "Done migrating database", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_4();
}

- (void)didAutoMigratePersistentStore:toManagedObjectModel:havingVersion:error:.cold.2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_18DDBE000, MEMORY[0x1E0C81028], v0, "Failed to migrate database: %@", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_5();
}

- (void)didAutoMigratePersistentStore:(uint64_t)a3 toManagedObjectModel:(uint64_t)a4 havingVersion:(uint64_t)a5 error:(uint64_t)a6 .cold.3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_8(&dword_18DDBE000, MEMORY[0x1E0C81028], a3, "Migrating database", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_4();
}

- (void)_addStoresToCoordinator:(uint64_t)a3 protectionClass:(uint64_t)a4 error:(uint64_t)a5 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_8(&dword_18DDBE000, MEMORY[0x1E0C81028], a3, "Finished local store setup.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_4();
}

- (void)_addStoresToCoordinator:(uint64_t)a3 protectionClass:(uint64_t)a4 error:(uint64_t)a5 .cold.2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_18DDBE000, MEMORY[0x1E0C81028], a3, "_addStoresToCoordinator timed out", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_4();
}

- (void)_addStoresToCoordinator:(uint64_t)a3 protectionClass:(uint64_t)a4 error:(uint64_t)a5 .cold.3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_8(&dword_18DDBE000, MEMORY[0x1E0C81028], a3, "Starting local store setup.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_4();
}

- (void)_addStoresToCoordinator:(uint64_t)a3 protectionClass:(uint64_t)a4 error:(uint64_t)a5 .cold.4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_8(&dword_18DDBE000, MEMORY[0x1E0C81028], a3, "Finished sync store setup.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_4();
}

- (void)_addStoresToCoordinator:protectionClass:error:.cold.6()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_18DDBE000, MEMORY[0x1E0C81028], v0, "Unsupported protection class: %@", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_5();
}

- (void)_addStoresToCoordinator:protectionClass:error:.cold.7()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_8(&dword_18DDBE000, v0, v1, "Starting sync store setup.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)persistentStoreCoordinatorFor:.cold.1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_12_3();
  OUTLINED_FUNCTION_0(&dword_18DDBE000, MEMORY[0x1E0C81028], v0, "Failed to load Managed Object Model from %@", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_5();
}

- (void)persistentStoreCoordinatorFor:.cold.2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_18DDBE000, MEMORY[0x1E0C81028], v0, "Failed to add persistent stores: %@", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_5();
}

- (void)persistentStoreCoordinatorFor:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_1(&dword_18DDBE000, v0, v1, "Non-priveleged client found un-migrated database.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)persistentStoreCoordinatorFor:.cold.4()
{
  uint64_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_10(&dword_18DDBE000, MEMORY[0x1E0C81028], v0, "Failure migrating store %@: %@. Attempting to delete to recover.", v1);
  OUTLINED_FUNCTION_5();
}

- (void)persistentStoreCoordinatorFor:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_1(&dword_18DDBE000, v0, v1, "Non-priveleged client encountered knowledge directory without data vault, calling out for help.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)persistentStoreCoordinatorFor:.cold.6()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_1(&dword_18DDBE000, v0, v1, "Non-priveleged client encountered knowledge directory with data vault where it shouldn't be, calling out for help.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)persistentStoreCoordinatorFor:.cold.7()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_18DDBE000, MEMORY[0x1E0C81028], v0, "Directory could not be created: %@", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_5();
}

- (void)persistentStoreCoordinatorFor:.cold.8()
{
  uint64_t v0;
  NSObject *v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_12_3();
  v3 = 2112;
  v4 = v0;
  OUTLINED_FUNCTION_10(&dword_18DDBE000, v1, (uint64_t)v1, "Error trying to delete datavault at %@: %@", v2);
  OUTLINED_FUNCTION_5();
}

- (void)persistentStoreCoordinatorFor:.cold.9()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_1(&dword_18DDBE000, v0, v1, "Non-priveleged client unable to find knowledge directory, calling out for help.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)persistentStoreCoordinatorFor:.cold.10()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_18DDBE000, MEMORY[0x1E0C81028], v0, "Directory does not exist and could not be created: %@", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_5();
}

- (void)persistentStoreCoordinatorFor:(int)a3 .cold.11(int *a1, uint8_t *buf, int a3)
{
  int v3;

  v3 = *a1;
  *(_DWORD *)buf = 67109376;
  *((_DWORD *)buf + 1) = a3;
  *((_WORD *)buf + 4) = 1024;
  *(_DWORD *)(buf + 10) = v3;
  _os_log_error_impl(&dword_18DDBE000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Datavault does not exist and could not be created. Status: %d; errno: %d",
    buf,
    0xEu);
}

- (void)persistentStoreCoordinatorFor:.cold.12()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_12_3();
  OUTLINED_FUNCTION_0(&dword_18DDBE000, v0, v1, "Storage directory %@ does not appear to exist.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)deleteStorageFor:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_1(&dword_18DDBE000, v0, v1, "Non-priveleged client encountered fatal database error.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)deleteStorageFor:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_8(&dword_18DDBE000, v0, v1, "Creating shell PSC to truncate storage.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)copyStorageFor:toDirectory:.cold.1()
{
  uint64_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_10(&dword_18DDBE000, MEMORY[0x1E0C81028], v0, "Failed to create data storage in %@ for protection class %@\n", v1);
  OUTLINED_FUNCTION_5();
}

@end
