@implementation _DPCoreDataStorage

- (_DPCoreDataStorage)init
{

  return 0;
}

+ (id)storageWithDirectory:(id)a3 databaseName:(id)a4 modelURL:(id)a5 readOnly:(BOOL)a6
{
  _BOOL8 v6;
  id v10;
  id v11;
  id v12;
  void *v13;

  v6 = a6;
  v10 = a5;
  v11 = a4;
  v12 = a3;
  v13 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithDirectory:databaseName:modelURL:readOnly:", v12, v11, v10, v6);

  return v13;
}

- (_DPCoreDataStorage)initWithDirectory:(id)a3 databaseName:(id)a4 modelURL:(id)a5 readOnly:(BOOL)a6
{
  _DPCoreDataStorage *v11;
  _DPCoreDataStorage *v12;
  NSString **p_databaseDirectory;
  NSObject *v14;
  dispatch_queue_t v15;
  OS_dispatch_queue *queueMOC;
  NSObject *v17;
  dispatch_queue_t v18;
  OS_dispatch_queue *queuePSC;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  NSDictionary *paths;
  NSManagedObjectModel *managedObjectModel;
  uint64_t v30;
  NSMutableDictionary *managedObjectContexts;
  uint64_t v32;
  NSMutableDictionary *persistentStoreCoordinators;
  uint64_t v34;
  _DPDataProtectionStateMonitor *dataProtectionMonitor;
  id v37;
  id v38;
  id v39;
  _QWORD v40[4];
  id v41;
  id location;
  objc_super v43;
  _QWORD v44[3];
  _QWORD v45[5];

  v45[3] = *MEMORY[0x1E0C80C00];
  v37 = a3;
  v38 = a4;
  v39 = a5;
  v43.receiver = self;
  v43.super_class = (Class)_DPCoreDataStorage;
  v11 = -[_DPCoreDataStorage init](&v43, sel_init);
  v12 = v11;
  if (v11)
  {
    p_databaseDirectory = &v11->_databaseDirectory;
    objc_storeStrong((id *)&v11->_databaseDirectory, a3);
    objc_storeStrong((id *)&v12->_databaseName, a4);
    objc_storeStrong((id *)&v12->_modelURL, a5);
    v12->_readOnly = a6;
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = dispatch_queue_create("_DPCoreDataStore.queueMOC", v14);
    queueMOC = v12->_queueMOC;
    v12->_queueMOC = (OS_dispatch_queue *)v15;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = dispatch_queue_create("_DPCoreDataStore.queuePSC", v17);
    queuePSC = v12->_queuePSC;
    v12->_queuePSC = (OS_dispatch_queue *)v18;

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@/%@"), *p_databaseDirectory, v12->_databaseName);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@.db"), v20, CFSTR("ClassA"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@.db"), v20, CFSTR("ClassC"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@.db"), v20, CFSTR("ClassD"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    +[_DPDataProtectionStateMonitor dataProtectionClassA](_DPDataProtectionStateMonitor, "dataProtectionClassA");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v44[0] = v24;
    v45[0] = v21;
    +[_DPDataProtectionStateMonitor dataProtectionClassC](_DPDataProtectionStateMonitor, "dataProtectionClassC");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v44[1] = v25;
    v45[1] = v22;
    +[_DPDataProtectionStateMonitor dataProtectionClassD](_DPDataProtectionStateMonitor, "dataProtectionClassD");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v44[2] = v26;
    v45[2] = v23;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v45, v44, 3);
    v27 = objc_claimAutoreleasedReturnValue();
    paths = v12->_paths;
    v12->_paths = (NSDictionary *)v27;

    managedObjectModel = v12->_managedObjectModel;
    v12->_managedObjectModel = 0;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v30 = objc_claimAutoreleasedReturnValue();
    managedObjectContexts = v12->_managedObjectContexts;
    v12->_managedObjectContexts = (NSMutableDictionary *)v30;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v32 = objc_claimAutoreleasedReturnValue();
    persistentStoreCoordinators = v12->_persistentStoreCoordinators;
    v12->_persistentStoreCoordinators = (NSMutableDictionary *)v32;

    v34 = objc_opt_new();
    dataProtectionMonitor = v12->_dataProtectionMonitor;
    v12->_dataProtectionMonitor = (_DPDataProtectionStateMonitor *)v34;

    objc_initWeak(&location, v12);
    v40[0] = MEMORY[0x1E0C809B0];
    v40[1] = 3221225472;
    v40[2] = __71___DPCoreDataStorage_initWithDirectory_databaseName_modelURL_readOnly___block_invoke;
    v40[3] = &unk_1E95D9420;
    objc_copyWeak(&v41, &location);
    -[_DPDataProtectionStateMonitor setChangeHandler:](v12->_dataProtectionMonitor, "setChangeHandler:", v40);
    objc_destroyWeak(&v41);
    objc_destroyWeak(&location);

  }
  return v12;
}

- (void)handleDataProtectionChangeFor:(id)a3 willBeAvailable:(BOOL)a4
{
  id v5;

  if (!a4)
  {
    v5 = a3;
    -[_DPCoreDataStorage invalidateManagedObjectContextFor:](self, "invalidateManagedObjectContextFor:", v5);
    -[_DPCoreDataStorage invalidatePersistentStoreCoordinatorFor:](self, "invalidatePersistentStoreCoordinatorFor:", v5);

  }
}

- (void)invalidateManagedObjectContextFor:(id)a3
{
  id v4;
  NSObject *queueMOC;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  queueMOC = self->_queueMOC;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __56___DPCoreDataStorage_invalidateManagedObjectContextFor___block_invoke;
  block[3] = &unk_1E95D9470;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(queueMOC, block);

}

- (void)invalidatePersistentStoreCoordinatorFor:(id)a3
{
  id v4;
  NSObject *queuePSC;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  queuePSC = self->_queuePSC;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __62___DPCoreDataStorage_invalidatePersistentStoreCoordinatorFor___block_invoke;
  block[3] = &unk_1E95D9470;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(queuePSC, block);

}

- (NSManagedObjectModel)managedObjectModel
{
  NSManagedObjectModel *managedObjectModel;
  NSManagedObjectModel *v4;
  NSManagedObjectModel *v5;
  NSManagedObjectModel *v6;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  managedObjectModel = self->_managedObjectModel;
  if (managedObjectModel)
    goto LABEL_4;
  if (self->_modelURL)
  {
    v4 = (NSManagedObjectModel *)objc_msgSend(objc_alloc(MEMORY[0x1E0C97B98]), "initWithContentsOfURL:", self->_modelURL);
    v5 = self->_managedObjectModel;
    self->_managedObjectModel = v4;

    managedObjectModel = self->_managedObjectModel;
LABEL_4:
    v6 = managedObjectModel;
    return v6;
  }
  +[_DPLog framework](_DPLog, "framework");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    -[_DPCoreDataStorage managedObjectModel].cold.1(v8, v9, v10, v11, v12, v13, v14, v15);

  v6 = 0;
  return v6;
}

+ (id)persistentStoreOptionsFor:(id)a3 readOnly:(BOOL)a4
{
  _BOOL8 v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  _QWORD v13[5];
  _QWORD v14[6];

  v4 = a4;
  v14[5] = *MEMORY[0x1E0C80C00];
  v5 = *MEMORY[0x1E0C97868];
  v13[0] = *MEMORY[0x1E0C978D0];
  v13[1] = v5;
  v14[0] = MEMORY[0x1E0C9AAB0];
  v14[1] = MEMORY[0x1E0C9AAB0];
  v13[2] = *MEMORY[0x1E0C97998];
  v6 = (void *)MEMORY[0x1E0CB37E8];
  v7 = a3;
  objc_msgSend(v6, "numberWithBool:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = *MEMORY[0x1E0C979E0];
  v14[2] = v8;
  v14[3] = &unk_1E9748C78;
  v10 = *MEMORY[0x1E0C97940];
  v13[3] = v9;
  v13[4] = v10;
  v14[4] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)persistentStoreCoordinatorFor:(id)a3
{
  id v4;
  BOOL v5;
  NSObject *queuePSC;
  id v7;
  id v8;
  _QWORD block[5];
  id v11;
  uint64_t *v12;
  uint64_t *v13;
  BOOL v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  char v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v4 = a3;
  v5 = -[_DPDataProtectionStateMonitor isDataAvailableFor:](self->_dataProtectionMonitor, "isDataAvailableFor:", v4);
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__2;
  v23 = __Block_byref_object_dispose__2;
  v24 = 0;
  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 0;
  queuePSC = self->_queuePSC;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __52___DPCoreDataStorage_persistentStoreCoordinatorFor___block_invoke;
  block[3] = &unk_1E95D9498;
  v12 = &v19;
  block[4] = self;
  v7 = v4;
  v14 = v5;
  v11 = v7;
  v13 = &v15;
  dispatch_sync(queuePSC, block);
  if (*((_BYTE *)v16 + 24))
  {
    -[_DPCoreDataStorage invalidatePersistentStoreCoordinatorFor:](self, "invalidatePersistentStoreCoordinatorFor:", v7);
    v8 = 0;
  }
  else
  {
    v8 = (id)v20[5];
  }

  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v19, 8);

  return v8;
}

- (void)handleDatabaseErrors:(id)a3 forPSC:(id)a4 protectionClass:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  const __CFString *v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (v8 && +[_DPErrorUtilities isCoreDataFatalError:](_DPErrorUtilities, "isCoreDataFatalError:", v8))
  {
    +[_DPCoreAnalyticsCollector sharedInstance](_DPCoreAnalyticsCollector, "sharedInstance");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = CFSTR("databaseCorrupt");
    v22[0] = MEMORY[0x1E0C9AAB0];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, &v21, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "reportMetricsForEvent:withMetrics:", CFSTR("com.apple.DifferentialPrivacy.CoreData"), v12);

    +[_DPLog framework](_DPLog, "framework");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[_DPCoreDataStorage handleDatabaseErrors:forPSC:protectionClass:].cold.1(v13, v14, v15, v16, v17, v18, v19, v20);

    -[_DPCoreDataStorage deleteDatabaseForPSC:protectionClass:obliterate:](self, "deleteDatabaseForPSC:protectionClass:obliterate:", v9, v10, 0);
  }

}

- (id)mocForProtectionClass:(id)a3
{
  id v4;
  BOOL v5;
  NSObject *queueMOC;
  id v7;
  id v8;
  _QWORD block[5];
  id v11;
  uint64_t *v12;
  uint64_t *v13;
  BOOL v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  char v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v4 = a3;
  v5 = -[_DPDataProtectionStateMonitor isDataAvailableFor:](self->_dataProtectionMonitor, "isDataAvailableFor:", v4);
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__2;
  v23 = __Block_byref_object_dispose__2;
  v24 = 0;
  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 0;
  queueMOC = self->_queueMOC;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __44___DPCoreDataStorage_mocForProtectionClass___block_invoke;
  block[3] = &unk_1E95D9498;
  v12 = &v19;
  block[4] = self;
  v7 = v4;
  v14 = v5;
  v11 = v7;
  v13 = &v15;
  dispatch_sync(queueMOC, block);
  if (*((_BYTE *)v16 + 24))
  {
    -[_DPCoreDataStorage invalidateManagedObjectContextFor:](self, "invalidateManagedObjectContextFor:", v7);
    v8 = 0;
  }
  else
  {
    v8 = (id)v20[5];
  }

  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v19, 8);

  return v8;
}

- (unint64_t)deleteVersionMismatchRecords:(unint64_t)a3 entities:(id)a4 limit:(unint64_t)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v18;
  id obj;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  _QWORD v25[3];

  v25[1] = *MEMORY[0x1E0C80C00];
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("creationDate"), 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = v18;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[_DPDataProtectionStateMonitor dataProtectionClassC](_DPDataProtectionStateMonitor, "dataProtectionClassC");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[_DPCoreDataStorage mocForProtectionClass:](self, "mocForProtectionClass:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  +[_DPRecordQueryPredicates predicateForRecordsWithVersionMismatch](_DPRecordQueryPredicates, "predicateForRecordsWithVersionMismatch");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  obj = v7;
  v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v12)
  {
    v13 = v12;
    v14 = 0;
    v15 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v21 != v15)
          objc_enumerationMutation(obj);
        v14 += objc_msgSend((id)objc_opt_class(), "deleteObjectsInContext:entityName:predicate:sortDescriptors:fetchOffset:fetchLimit:", v10, *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i), v11, v8, 0, a5);
      }
      v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v13);
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (unint64_t)deleteSubmittedRecords:(unint64_t)a3 entities:(id)a4 limit:(unint64_t)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v18;
  id obj;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  _QWORD v25[3];

  v25[1] = *MEMORY[0x1E0C80C00];
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("creationDate"), 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = v18;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[_DPDataProtectionStateMonitor dataProtectionClassC](_DPDataProtectionStateMonitor, "dataProtectionClassC");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[_DPCoreDataStorage mocForProtectionClass:](self, "mocForProtectionClass:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  +[_DPRecordQueryPredicates predicateForRecordsSubmitted](_DPRecordQueryPredicates, "predicateForRecordsSubmitted");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  obj = v7;
  v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v12)
  {
    v13 = v12;
    v14 = 0;
    v15 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v21 != v15)
          objc_enumerationMutation(obj);
        v14 += objc_msgSend((id)objc_opt_class(), "deleteObjectsInContext:entityName:predicate:sortDescriptors:fetchOffset:fetchLimit:", v10, *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i), v11, v8, 0, a5);
      }
      v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v13);
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (unint64_t)deleteOldObjectsToLimitTotalNumber:(unint64_t)a3 entities:(id)a4 limit:(unint64_t)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v18;
  id obj;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  _QWORD v26[3];

  v26[1] = *MEMORY[0x1E0C80C00];
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("creationDate"), 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = v18;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[_DPDataProtectionStateMonitor dataProtectionClassC](_DPDataProtectionStateMonitor, "dataProtectionClassC");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[_DPCoreDataStorage mocForProtectionClass:](self, "mocForProtectionClass:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  +[_DPRecordQueryPredicates predicateForAllRecords](_DPRecordQueryPredicates, "predicateForAllRecords");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  obj = v7;
  v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v12)
  {
    v13 = v12;
    v14 = 0;
    v15 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v22 != v15)
          objc_enumerationMutation(obj);
        v14 += objc_msgSend((id)objc_opt_class(), "deleteObjectsInContext:entityName:predicate:sortDescriptors:fetchOffset:fetchLimit:", v10, *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * i), v11, v8, a3, a5);
      }
      v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v13);
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (unint64_t)deleteObjectsOlderThanDate:(id)a3 entities:(id)a4 limit:(unint64_t)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v20;
  id obj;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  _QWORD v27[3];

  v27[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("creationDate"), 1);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = v20;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[_DPDataProtectionStateMonitor dataProtectionClassC](_DPDataProtectionStateMonitor, "dataProtectionClassC");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[_DPCoreDataStorage mocForProtectionClass:](self, "mocForProtectionClass:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  +[_DPRecordQueryPredicates predicateForRecordsOlderThan:](_DPRecordQueryPredicates, "predicateForRecordsOlderThan:", v8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  obj = v9;
  v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v14)
  {
    v15 = v14;
    v16 = 0;
    v17 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v23 != v17)
          objc_enumerationMutation(obj);
        v16 += objc_msgSend((id)objc_opt_class(), "deleteObjectsInContext:entityName:predicate:sortDescriptors:fetchOffset:fetchLimit:", v12, *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * i), v13, v10, 0, a5);
      }
      v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v15);
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

+ (unint64_t)deleteObjectsInContext:(id)a3 entityName:(id)a4 predicate:(id)a5 sortDescriptors:(id)a6 fetchOffset:(unint64_t)a7 fetchLimit:(unint64_t)a8
{
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  unint64_t v18;
  _QWORD v20[4];
  id v21;
  id v22;
  id v23;
  id v24;
  uint64_t *v25;
  unint64_t v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t v31;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  if (v13)
  {
    v17 = (void *)os_transaction_create();
    v28 = 0;
    v29 = &v28;
    v30 = 0x2020000000;
    v31 = 0;
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __105___DPCoreDataStorage_deleteObjectsInContext_entityName_predicate_sortDescriptors_fetchOffset_fetchLimit___block_invoke;
    v20[3] = &unk_1E95D94C0;
    v21 = v14;
    v22 = v13;
    v26 = a8;
    v27 = a7;
    v23 = v15;
    v24 = v16;
    v25 = &v28;
    objc_msgSend(v22, "performWithOptions:andBlock:", 4, v20);
    v18 = v29[3];

    _Block_object_dispose(&v28, 8);
  }
  else
  {
    v18 = 0;
  }

  return v18;
}

- (unint64_t)countObjectsForEntities:(id)a3 predicate:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t i;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  +[_DPDataProtectionStateMonitor dataProtectionClassC](_DPDataProtectionStateMonitor, "dataProtectionClassC");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[_DPCoreDataStorage mocForProtectionClass:](self, "mocForProtectionClass:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v10 = v6;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v11)
  {
    v12 = v11;
    v13 = 0;
    v14 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v18 != v14)
          objc_enumerationMutation(v10);
        v13 += objc_msgSend((id)objc_opt_class(), "countObjectsInContext:entityName:predicate:", v9, *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i), v7, (_QWORD)v17);
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v12);
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

+ (unint64_t)countObjectsInContext:(id)a3 entityName:(id)a4 predicate:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  unint64_t v11;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  if (v7)
  {
    v10 = (void *)os_transaction_create();
    v18 = 0;
    v19 = &v18;
    v20 = 0x2020000000;
    v21 = 0;
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __65___DPCoreDataStorage_countObjectsInContext_entityName_predicate___block_invoke;
    v13[3] = &unk_1E95D94E8;
    v14 = v8;
    v15 = v7;
    v16 = v9;
    v17 = &v18;
    objc_msgSend(v15, "performWithOptions:andBlock:", 4, v13);
    v11 = v19[3];

    _Block_object_dispose(&v18, 8);
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (BOOL)deleteDatabaseForPSC:(id)a3 protectionClass:(id)a4 obliterate:(BOOL)a5
{
  _BOOL4 readOnly;
  _BOOL4 v6;
  void *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t *v17;
  uint64_t *v18;
  uint64_t v19;
  void *v20;
  uint64_t v22;
  uint64_t v23;
  _QWORD v24[2];
  _QWORD v25[3];

  v25[2] = *MEMORY[0x1E0C80C00];
  readOnly = self->_readOnly;
  if (!self->_readOnly)
  {
    v6 = a5;
    v9 = (void *)MEMORY[0x1E0C99E98];
    v10 = a4;
    v11 = a3;
    -[_DPCoreDataStorage paths](self, "paths");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKeyedSubscript:", v10);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "fileURLWithPath:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      v15 = *MEMORY[0x1E0C97948];
      v24[0] = *MEMORY[0x1E0C97990];
      v24[1] = v15;
      v25[0] = MEMORY[0x1E0C9AAB0];
      v25[1] = MEMORY[0x1E0C9AAB0];
      v16 = (void *)MEMORY[0x1E0C99D80];
      v17 = v25;
      v18 = v24;
      v19 = 2;
    }
    else
    {
      v22 = *MEMORY[0x1E0C97990];
      v23 = MEMORY[0x1E0C9AAB0];
      v16 = (void *)MEMORY[0x1E0C99D80];
      v17 = &v23;
      v18 = &v22;
      v19 = 1;
    }
    objc_msgSend(v16, "dictionaryWithObjects:forKeys:count:", v17, v18, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "_destroyPersistentStoreAtURL:withType:options:error:", v14, *MEMORY[0x1E0C979E8], v20, 0);

  }
  return !readOnly;
}

- (BOOL)deleteStorageFor:(id)a3 obliterate:(BOOL)a4
{
  id v6;
  BOOL v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[5];
  id v13;
  id v14;
  uint64_t *v15;
  BOOL v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  char v20;

  v6 = a3;
  if (self->_readOnly)
  {
    v7 = 0;
  }
  else
  {
    -[_DPCoreDataStorage mocForProtectionClass:](self, "mocForProtectionClass:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      -[_DPCoreDataStorage persistentStoreCoordinatorFor:](self, "persistentStoreCoordinatorFor:", v6);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v9)
      {
        v10 = (void *)os_transaction_create();
        v17 = 0;
        v18 = &v17;
        v19 = 0x2020000000;
        v20 = 0;
        v12[0] = MEMORY[0x1E0C809B0];
        v12[1] = 3221225472;
        v12[2] = __50___DPCoreDataStorage_deleteStorageFor_obliterate___block_invoke;
        v12[3] = &unk_1E95D9510;
        v12[4] = self;
        v13 = v6;
        v15 = &v17;
        v14 = v9;
        v16 = a4;
        objc_msgSend(v8, "performWithOptions:andBlock:", 4, v12);
        v7 = *((_BYTE *)v18 + 24) != 0;

        _Block_object_dispose(&v17, 8);
      }
      else
      {
        v7 = 0;
      }

    }
    else
    {
      v7 = 0;
    }

  }
  return v7;
}

+ (BOOL)createDatabaseDirectory:(id)a3 error:(id *)a4
{
  void *v5;
  id v6;
  void *v7;
  void *v8;

  v5 = (void *)MEMORY[0x1E0CB3620];
  v6 = a3;
  objc_msgSend(v5, "defaultManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v6, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(a4) = objc_msgSend(v7, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v8, 1, 0, a4);
  return (char)a4;
}

- (NSString)databaseDirectory
{
  return self->_databaseDirectory;
}

- (NSString)databaseName
{
  return self->_databaseName;
}

- (NSURL)modelURL
{
  return self->_modelURL;
}

- (BOOL)readOnly
{
  return self->_readOnly;
}

- (NSDictionary)paths
{
  return self->_paths;
}

- (void)setManagedObjectModel:(id)a3
{
  objc_storeStrong((id *)&self->_managedObjectModel, a3);
}

- (NSMutableDictionary)managedObjectContexts
{
  return self->_managedObjectContexts;
}

- (NSMutableDictionary)persistentStoreCoordinators
{
  return self->_persistentStoreCoordinators;
}

- (OS_dispatch_queue)queueMOC
{
  return self->_queueMOC;
}

- (OS_dispatch_queue)queuePSC
{
  return self->_queuePSC;
}

- (_DPDataProtectionStateMonitor)dataProtectionMonitor
{
  return self->_dataProtectionMonitor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataProtectionMonitor, 0);
  objc_storeStrong((id *)&self->_queuePSC, 0);
  objc_storeStrong((id *)&self->_queueMOC, 0);
  objc_storeStrong((id *)&self->_persistentStoreCoordinators, 0);
  objc_storeStrong((id *)&self->_managedObjectContexts, 0);
  objc_storeStrong((id *)&self->_managedObjectModel, 0);
  objc_storeStrong((id *)&self->_paths, 0);
  objc_storeStrong((id *)&self->_modelURL, 0);
  objc_storeStrong((id *)&self->_databaseName, 0);
  objc_storeStrong((id *)&self->_databaseDirectory, 0);
}

- (void)managedObjectModel
{
  OUTLINED_FUNCTION_0_1(&dword_1D3FAA000, a1, a3, "Missing model URL!", a5, a6, a7, a8, 0);
}

- (void)handleDatabaseErrors:(uint64_t)a3 forPSC:(uint64_t)a4 protectionClass:(uint64_t)a5 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_1D3FAA000, a1, a3, "Attempting to delete corrupted database", a5, a6, a7, a8, 0);
}

@end
