@implementation CallHistoryDBHandle

- (id)updateManagedCallsWithPredicate:(id)a3 propertiesToUpdate:(id)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  uint64_t v16;
  void *v17;
  id obj;
  uint64_t v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  -[CallHistoryDBHandle fetchManagedCallsWithPredicate:sortDescriptors:limit:offset:batchSize:](self, "fetchManagedCallsWithPredicate:sortDescriptors:limit:offset:batchSize:", a3, 0, 0, 0, 0);
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
  if (v7)
  {
    v8 = v7;
    v20 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v26 != v20)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
        v21 = 0u;
        v22 = 0u;
        v23 = 0u;
        v24 = 0u;
        objc_msgSend(v6, "allKeys");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
        if (v12)
        {
          v13 = v12;
          v14 = *(_QWORD *)v22;
          do
          {
            for (j = 0; j != v13; ++j)
            {
              if (*(_QWORD *)v22 != v14)
                objc_enumerationMutation(v11);
              v16 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * j);
              objc_msgSend(v6, "objectForKeyedSubscript:", v16);
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v10, "setValue:forKey:", v17, v16);

            }
            v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
          }
          while (v13);
        }

      }
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    }
    while (v8);
  }

  return obj;
}

- (BOOL)save:(id *)a3
{
  void *v5;
  void *v6;
  uint64_t v7;
  NSObject *v9;
  NSObject *v10;
  uint8_t v11[16];

  -[NSManagedObjectContext persistentStoreCoordinator](self->fCallRecordContext, "persistentStoreCoordinator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "persistentStores");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  if (v7)
  {
    if (-[NSManagedObjectContext hasChanges](self->fCallRecordContext, "hasChanges"))
    {
      -[CallHistoryDBHandle updateCallDBProperties](self, "updateCallDBProperties");
      return -[CallHistoryDBHandle handleSaveForCallRecordContext:error:](self, "handleSaveForCallRecordContext:error:", self->fCallRecordContext, a3);
    }
    else
    {
      -[CHLogger logHandle](self, "logHandle");
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v11 = 0;
        _os_log_impl(&dword_1B3FA4000, v10, OS_LOG_TYPE_DEFAULT, "No changes in the data context to save", v11, 2u);
      }

      return 1;
    }
  }
  else
  {
    -[CHLogger logHandle](self, "logHandle");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[CallHistoryDBHandle save:].cold.1();

    return 0;
  }
}

- (unint64_t)fetchManagedCallCountWithPredicate:(id)a3 sortDescriptors:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  NSManagedObjectContext *fCallRecordContext;
  unint64_t v13;
  id v14;
  void *v15;
  NSObject *v17;
  id v19;
  uint8_t buf[4];
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = a3;
  +[CallRecord fetchRequest](CallRecord, "fetchRequest");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setPredicate:", v7);

  objc_msgSend(v8, "setSortDescriptors:", v6);
  objc_msgSend(v8, "setFetchLimit:", -[CallHistoryDBHandle callHistoryDBFetchLimit](self, "callHistoryDBFetchLimit"));
  ct_green_tea_logger_create_static();
  getCTGreenTeaOsLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9 && os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v8, "entityName");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v21 = v11;
    _os_log_impl(&dword_1B3FA4000, v10, OS_LOG_TYPE_INFO, "Count: %@", buf, 0xCu);

  }
  fCallRecordContext = self->fCallRecordContext;
  v19 = 0;
  v13 = -[NSManagedObjectContext countForFetchRequest:error:](fCallRecordContext, "countForFetchRequest:error:", v8, &v19);
  v14 = v19;
  v15 = v14;
  if (v13 == 0x7FFFFFFFFFFFFFFFLL && v14 != 0)
  {
    -[CHLogger logHandle](self, "logHandle");
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      -[CallHistoryDBHandle fetchManagedCallCountWithPredicate:sortDescriptors:].cold.1();

    v13 = 0;
  }

  return v13;
}

- (id)fetchManagedCallsWithPredicate:(id)a3 sortDescriptors:(id)a4 limit:(unint64_t)a5 offset:(unint64_t)a6 batchSize:(unint64_t)a7
{
  id v12;
  id v13;
  void *v14;
  void *v15;
  NSObject *v16;
  NSObject *v17;
  void *v18;
  NSManagedObjectContext *fCallRecordContext;
  void *v20;
  id v21;
  void *v22;
  NSObject *v23;
  id v25;
  uint8_t buf[4];
  void *v27;
  _QWORD v28[3];

  v28[2] = *MEMORY[0x1E0C80C00];
  v12 = a4;
  v13 = a3;
  +[CallRecord fetchRequest](CallRecord, "fetchRequest");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setFetchBatchSize:", a7);
  objc_msgSend(v14, "setFetchLimit:", a5);
  objc_msgSend(v14, "setFetchOffset:", a6);
  objc_msgSend(v14, "setPredicate:", v13);

  objc_msgSend(v14, "setReturnsObjectsAsFaults:", 0);
  objc_msgSend(v14, "setSortDescriptors:", v12);

  v28[0] = CFSTR("remoteParticipantHandles");
  v28[1] = CFSTR("emergencyMediaItems");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setRelationshipKeyPathsForPrefetching:", v15);

  ct_green_tea_logger_create_static();
  getCTGreenTeaOsLogHandle();
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if (v16 && os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v14, "entityName");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v27 = v18;
    _os_log_impl(&dword_1B3FA4000, v17, OS_LOG_TYPE_INFO, "Read: %@", buf, 0xCu);

  }
  fCallRecordContext = self->fCallRecordContext;
  v25 = 0;
  -[NSManagedObjectContext executeFetchRequest:error:](fCallRecordContext, "executeFetchRequest:error:", v14, &v25);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v25;
  v22 = v21;
  if (!v20 && v21)
  {
    -[CHLogger logHandle](self, "logHandle");
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      -[CallHistoryDBHandle fetchManagedCallsWithPredicate:sortDescriptors:limit:offset:batchSize:].cold.1();

  }
  return v20;
}

- (int64_t)callHistoryDBFetchLimit
{
  void *v2;
  int v3;
  int64_t *v4;
  int64_t v5;

  -[CallHistoryDBHandle featureFlags](self, "featureFlags");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "increaseCallHistoryEnabled");
  v4 = &kCallHistoryIncreasedFetchLimit;
  if (!v3)
    v4 = &kCallHistoryFetchLimit;
  v5 = *v4;

  return v5;
}

- (CHFeatureFlags)featureFlags
{
  return self->_featureFlags;
}

void __48__CallHistoryDBHandle_registerForNotifications___block_invoke_8(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    objc_msgSend(*(id *)(a1 + 32), "userInfo");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "handlePersistentStoreChangedNotification:", v2);

  }
}

+ (id)createForClient
{
  CallDBManagerClient *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;

  v2 = objc_alloc_init(CallDBManagerClient);
  if (!v2)
  {
    +[CHLogServer sharedInstance](CHLogServer, "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "logHandleForDomain:", "ch.dbhandle");
    v5 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      +[CallHistoryDBHandle createForClient].cold.1();
    goto LABEL_7;
  }
  +[CallHistoryDBHandle createWithDBManager:](CallHistoryDBHandle, "createWithDBManager:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    +[CHLogServer sharedInstance](CHLogServer, "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "logHandleForDomain:", "ch.dbhandle");
    v5 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      +[CallHistoryDBHandle createForClient].cold.2();
LABEL_7:

    v3 = 0;
  }

  return v3;
}

+ (id)createWithDBManager:(id)a3
{
  id v3;
  CallHistoryDBHandle *v4;

  v3 = a3;
  v4 = -[CallHistoryDBHandle initWithDBManager:]([CallHistoryDBHandle alloc], "initWithDBManager:", v3);

  return v4;
}

- (void)handlePersistentStoreChangedNotification:(id)a3
{
  void *v4;
  NSObject *v5;
  void *v6;
  int v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  NotificationSender *v12;
  void *v13;
  const __CFString *v14;
  uint64_t v15;
  uint8_t buf[4];
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "objectForKey:", *MEMORY[0x1E0C97808]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count"))
  {
    -[CHLogger logHandle](self, "logHandle");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v17 = objc_msgSend(v4, "count");
      _os_log_impl(&dword_1B3FA4000, v5, OS_LOG_TYPE_DEFAULT, "Handling persistent store added notification, store count: %lu", buf, 0xCu);
    }

    if (-[NSManagedObjectContext hasChanges](self->fCallRecordContext, "hasChanges"))
      -[CallHistoryDBHandle save:](self, "save:", 0);
    -[CallHistoryDBHandle callDBManager](self, "callDBManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "notifyDataStoreChanged");

    if (v7)
    {
      -[CHLogger logHandle](self, "logHandle");
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        -[CallHistoryDBHandle callDBManager](self, "callDBManager");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        getCHNotifyDataStoreChangeReasonAsString(objc_msgSend(v9, "notifyDataStoreChangeReason"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v17 = (uint64_t)v10;
        _os_log_impl(&dword_1B3FA4000, v8, OS_LOG_TYPE_DEFAULT, "Sending out database change notification when data store is added, reason: %{public}@", buf, 0xCu);

      }
      v14 = CFSTR("kCallHistoryDatabaseInitializedKey");
      v15 = MEMORY[0x1E0C9AAB0];
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v15, &v14, 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = -[NotificationSender initWithName:]([NotificationSender alloc], "initWithName:", CFSTR("kCallHistoryDatabaseChangedNotification"));
      -[NotificationSender setUserInfo:](v12, "setUserInfo:", v11);
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "postNotificationName:object:userInfo:", CFSTR("kCallHistoryDatabaseChangedInternalNotification"), v12, v11);

    }
  }

}

- (CallDBManager)callDBManager
{
  return self->callDBManager;
}

- (void)registerForNotifications:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  NSManagedObjectContext *fCallRecordContext;
  uint64_t v8;
  id v9;
  void *v10;
  id observerCallRecordRef;
  void *v12;
  NSManagedObjectContext *fCallDBPropertiesContext;
  id v14;
  void *v15;
  id observerCallDBPropRef;
  void *v17;
  CallDBManager *callDBManager;
  id v19;
  void *v20;
  id moveCallRecordsFromTempStoreRef;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  id v27;
  void *v28;
  id dataStoreAddedRef;
  _QWORD v30[4];
  id v31;
  id v32;
  _QWORD v33[4];
  id v34;
  id v35;
  _QWORD v36[4];
  id v37;
  id v38;
  _QWORD v39[4];
  id v40;
  id v41;
  id location[2];

  v4 = a3;
  objc_initWeak(location, self);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *MEMORY[0x1E0C978A0];
  fCallRecordContext = self->fCallRecordContext;
  v8 = MEMORY[0x1E0C809B0];
  v39[0] = MEMORY[0x1E0C809B0];
  v39[1] = 3221225472;
  v39[2] = __48__CallHistoryDBHandle_registerForNotifications___block_invoke;
  v39[3] = &unk_1E6746410;
  v9 = v4;
  v40 = v9;
  objc_copyWeak(&v41, location);
  objc_msgSend(v5, "addObserverForName:object:queue:usingBlock:", v6, fCallRecordContext, 0, v39);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  observerCallRecordRef = self->_observerCallRecordRef;
  self->_observerCallRecordRef = v10;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  fCallDBPropertiesContext = self->fCallDBPropertiesContext;
  v36[0] = v8;
  v36[1] = 3221225472;
  v36[2] = __48__CallHistoryDBHandle_registerForNotifications___block_invoke_3;
  v36[3] = &unk_1E6746410;
  v14 = v9;
  v37 = v14;
  objc_copyWeak(&v38, location);
  objc_msgSend(v12, "addObserverForName:object:queue:usingBlock:", v6, fCallDBPropertiesContext, 0, v36);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  observerCallDBPropRef = self->_observerCallDBPropRef;
  self->_observerCallDBPropRef = v15;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  callDBManager = self->callDBManager;
  v33[0] = MEMORY[0x1E0C809B0];
  v33[1] = 3221225472;
  v33[2] = __48__CallHistoryDBHandle_registerForNotifications___block_invoke_5;
  v33[3] = &unk_1E6746410;
  v19 = v14;
  v34 = v19;
  objc_copyWeak(&v35, location);
  objc_msgSend(v17, "addObserverForName:object:queue:usingBlock:", CFSTR("kMoveCallRecordsFromTemporaryStoreNotitification"), callDBManager, 0, v33);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  moveCallRecordsFromTempStoreRef = self->_moveCallRecordsFromTempStoreRef;
  self->_moveCallRecordsFromTempStoreRef = v20;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[CallHistoryDBHandle callDBManager](self, "callDBManager");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "dbManager");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "fPersistentStoreCoordinator");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = *MEMORY[0x1E0C97920];
  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = __48__CallHistoryDBHandle_registerForNotifications___block_invoke_7;
  v30[3] = &unk_1E6746410;
  v27 = v19;
  v31 = v27;
  objc_copyWeak(&v32, location);
  objc_msgSend(v22, "addObserverForName:object:queue:usingBlock:", v26, v25, 0, v30);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  dataStoreAddedRef = self->_dataStoreAddedRef;
  self->_dataStoreAddedRef = v28;

  objc_destroyWeak(&v32);
  objc_destroyWeak(&v35);

  objc_destroyWeak(&v38);
  objc_destroyWeak(&v41);

  objc_destroyWeak(location);
}

- (CallHistoryDBHandle)initWithDBManager:(id)a3
{
  id v5;
  CallHistoryDBHandle *v6;
  CHFeatureFlags *v7;
  CHFeatureFlags *featureFlags;
  uint64_t v9;
  NSManagedObjectContext *fCallRecordContext;
  uint64_t v11;
  NSManagedObjectContext *fCallDBPropertiesContext;
  objc_super v14;

  v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)CallHistoryDBHandle;
  v6 = -[CHLogger initWithDomain:](&v14, sel_initWithDomain_, "ch.dbhandle");
  if (v6)
  {
    v7 = objc_alloc_init(CHFeatureFlags);
    featureFlags = v6->_featureFlags;
    v6->_featureFlags = v7;

    objc_msgSend(v5, "createManagedObjectContext");
    v9 = objc_claimAutoreleasedReturnValue();
    fCallRecordContext = v6->fCallRecordContext;
    v6->fCallRecordContext = (NSManagedObjectContext *)v9;

    objc_msgSend(v5, "createManagedObjectContext");
    v11 = objc_claimAutoreleasedReturnValue();
    fCallDBPropertiesContext = v6->fCallDBPropertiesContext;
    v6->fCallDBPropertiesContext = (NSManagedObjectContext *)v11;

    -[NSManagedObjectContext setMergePolicy:](v6->fCallRecordContext, "setMergePolicy:", *MEMORY[0x1E0C978C0]);
    -[NSManagedObjectContext setUndoManager:](v6->fCallDBPropertiesContext, "setUndoManager:", 0);
    -[NSManagedObjectContext setUndoManager:](v6->fCallRecordContext, "setUndoManager:", 0);
    objc_storeStrong((id *)&v6->callDBManager, a3);
  }

  return v6;
}

void __48__CallHistoryDBHandle_registerForNotifications___block_invoke_7(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v3 = a2;
  v4 = *(NSObject **)(a1 + 32);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __48__CallHistoryDBHandle_registerForNotifications___block_invoke_8;
  v6[3] = &unk_1E67463E8;
  objc_copyWeak(&v8, (id *)(a1 + 40));
  v7 = v3;
  v5 = v3;
  dispatch_async(v4, v6);

  objc_destroyWeak(&v8);
}

+ (NSString)objectId
{
  if (objectId_onceToken != -1)
    dispatch_once(&objectId_onceToken, &__block_literal_global_0);
  return (NSString *)(id)objectId_sObjectId;
}

void __31__CallHistoryDBHandle_objectId__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "bundleIdentifier");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = (void *)objc_msgSend(v0, "copy");
  v2 = v1;
  if (v1)
  {
    v3 = v1;
    v4 = (void *)objectId_sObjectId;
    objectId_sObjectId = (uint64_t)v3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "UUIDString");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "copy");
    v7 = (void *)objectId_sObjectId;
    objectId_sObjectId = v6;

  }
}

- (id)callDBProperties
{
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;

  -[CallHistoryDBHandle fetchWithPredicate:forEntity:](self, "fetchWithPredicate:forEntity:", 0, CFSTR("CallDBProperties"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3 && objc_msgSend(v3, "count"))
  {
    if ((unint64_t)objc_msgSend(v4, "count") < 2)
    {
      objc_msgSend(v4, "firstObject");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    }
    -[CHLogger logHandle](self, "logHandle");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[CallHistoryDBHandle callDBProperties].cold.2();
  }
  else
  {
    -[CHLogger logHandle](self, "logHandle");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[CallHistoryDBHandle callDBProperties].cold.1();
  }

  v6 = 0;
LABEL_9:

  return v6;
}

- (id)callRecordContext
{
  return self->fCallRecordContext;
}

+ (id)createForServer
{
  CallDBManagerServer *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;

  v2 = objc_alloc_init(CallDBManagerServer);
  if (!v2)
  {
    +[CHLogServer sharedInstance](CHLogServer, "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "logHandleForDomain:", "ch.dbhandle");
    v5 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      +[CallHistoryDBHandle createForClient].cold.1();
    goto LABEL_7;
  }
  +[CallHistoryDBHandle createWithDBManager:](CallHistoryDBHandle, "createWithDBManager:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    +[CHLogServer sharedInstance](CHLogServer, "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "logHandleForDomain:", "ch.dbhandle");
    v5 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      +[CallHistoryDBHandle createForClient].cold.2();
LABEL_7:

    v3 = 0;
  }

  return v3;
}

void __48__CallHistoryDBHandle_registerForNotifications___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v3 = a2;
  v4 = *(NSObject **)(a1 + 32);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __48__CallHistoryDBHandle_registerForNotifications___block_invoke_2;
  v6[3] = &unk_1E67463E8;
  objc_copyWeak(&v8, (id *)(a1 + 40));
  v7 = v3;
  v5 = v3;
  dispatch_async(v4, v6);

  objc_destroyWeak(&v8);
}

void __48__CallHistoryDBHandle_registerForNotifications___block_invoke_2(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    objc_msgSend(*(id *)(a1 + 32), "userInfo");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "handleCallRecordContextDidSaveNotification:", v2);

  }
}

void __48__CallHistoryDBHandle_registerForNotifications___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v3 = a2;
  v4 = *(NSObject **)(a1 + 32);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __48__CallHistoryDBHandle_registerForNotifications___block_invoke_4;
  v6[3] = &unk_1E67463E8;
  objc_copyWeak(&v8, (id *)(a1 + 40));
  v7 = v3;
  v5 = v3;
  dispatch_async(v4, v6);

  objc_destroyWeak(&v8);
}

void __48__CallHistoryDBHandle_registerForNotifications___block_invoke_4(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    objc_msgSend(*(id *)(a1 + 32), "userInfo");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "handleCallDBPropContextDidSaveNotification:", v2);

  }
}

void __48__CallHistoryDBHandle_registerForNotifications___block_invoke_5(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v3 = a2;
  v4 = *(NSObject **)(a1 + 32);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __48__CallHistoryDBHandle_registerForNotifications___block_invoke_6;
  v6[3] = &unk_1E6746438;
  v7 = v3;
  v5 = v3;
  objc_copyWeak(&v8, (id *)(a1 + 40));
  dispatch_async(v4, v6);
  objc_destroyWeak(&v8);

}

void __48__CallHistoryDBHandle_registerForNotifications___block_invoke_6(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v4 = WeakRetained;
    objc_msgSend(WeakRetained, "callDBManager");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "tempDBLocation:", 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "moveCallRecordsFromDatabaseAtURL:", v3);
    WeakRetained = v4;
  }

}

- (void)unRegisterForNotifications
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *MEMORY[0x1E0C978A0];
  objc_msgSend(v3, "removeObserver:name:object:", self->_observerCallRecordRef, *MEMORY[0x1E0C978A0], 0);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObserver:name:object:", self->_observerCallDBPropRef, v4, 0);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeObserver:name:object:", self->_moveCallRecordsFromTempStoreRef, CFSTR("kMoveCallRecordsFromTemporaryStoreNotitification"), 0);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeObserver:name:object:", self->_dataStoreAddedRef, *MEMORY[0x1E0C97920], 0);

}

- (BOOL)moveCallRecordsFromDatabaseAtURL:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  BOOL v10;
  void *v11;
  void *v12;
  NSObject *v13;
  id v14;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  uint64_t v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
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
  void *v35;
  void *v36;
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
  void *v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  void *v57;
  void *v58;
  NSObject *v59;
  NSObject *v60;
  NSObject *v61;
  void *v62;
  NSObject *v63;
  NSObject *v64;
  id v65;
  void *v66;
  void *v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  id v72;
  uint8_t v73[128];
  uint8_t buf[4];
  uint64_t v75;
  __int16 v76;
  uint64_t v77;
  uint64_t v78;

  v78 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[CHLogger logHandle](self, "logHandle");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B3FA4000, v5, OS_LOG_TYPE_DEFAULT, "Moving records from temp to permanent database", buf, 2u);
  }

  if (v4)
  {
    v6 = +[DBManager versionForDBAtLocation:](DBManager, "versionForDBAtLocation:", v4);
    -[CHLogger logHandle](self, "logHandle");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v6 > 0)
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        v75 = (uint64_t)v4;
        v76 = 2048;
        v77 = v6;
        _os_log_impl(&dword_1B3FA4000, v8, OS_LOG_TYPE_DEFAULT, "Database at location %{public}@ has version %ld", buf, 0x16u);
      }

      +[CallDBManagerServer getDestinationModelForVersion:](CallDBManagerServer, "getDestinationModelForVersion:", v6);
      v8 = objc_claimAutoreleasedReturnValue();
      if (+[DBManager isDataStoreAtURLInitialized:withModelAtURL:](DBManager, "isDataStoreAtURLInitialized:withModelAtURL:", v4, v8))
      {
        -[CHLogger logHandle](self, "logHandle");
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1B3FA4000, v9, OS_LOG_TYPE_DEFAULT, "Input database not in use", buf, 2u);
        }
      }
      else
      {
        +[DBManager instanceWithModelURL:](DBManager, "instanceWithModelURL:", v8);
        v9 = objc_claimAutoreleasedReturnValue();
        if (-[NSObject addDataStoreAtLocation:isEncrypted:](v9, "addDataStoreAtLocation:isEncrypted:", v4, 0))
        {
          -[NSObject createManagedObjectContext](v9, "createManagedObjectContext");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          +[DBManager entityDescriptionHavingName:forContext:](DBManager, "entityDescriptionHavingName:forContext:", CFSTR("CallRecord"), v11);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          if (v12)
          {
            v13 = objc_alloc_init(MEMORY[0x1E0C97B48]);
            -[NSObject setEntity:](v13, "setEntity:", v12);
            v72 = 0;
            objc_msgSend(v11, "executeFetchRequest:error:", v13, &v72);
            v67 = (void *)objc_claimAutoreleasedReturnValue();
            v14 = v72;
            -[CHLogger logHandle](self, "logHandle");
            v15 = objc_claimAutoreleasedReturnValue();
            v16 = v15;
            v66 = v14;
            if (v14)
            {
              if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
                -[CallHistoryDBHandle moveCallRecordsFromDatabaseAtURL:].cold.4();

              v10 = 0;
              v17 = v67;
            }
            else
            {
              v61 = v13;
              v62 = v12;
              v63 = v9;
              v64 = v8;
              if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
              {
                v19 = objc_msgSend(v67, "count");
                *(_DWORD *)buf = 134218242;
                v75 = v19;
                v76 = 2114;
                v77 = (uint64_t)v4;
                _os_log_impl(&dword_1B3FA4000, v16, OS_LOG_TYPE_DEFAULT, "Moving %lu records from input database %{public}@ into permanent database", buf, 0x16u);
              }
              v65 = v4;

              v70 = 0u;
              v71 = 0u;
              v68 = 0u;
              v69 = 0u;
              v20 = v67;
              v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v68, v73, 16);
              if (v21)
              {
                v22 = v21;
                v23 = *(_QWORD *)v69;
                do
                {
                  for (i = 0; i != v22; ++i)
                  {
                    if (*(_QWORD *)v69 != v23)
                      objc_enumerationMutation(v20);
                    v25 = *(void **)(*((_QWORD *)&v68 + 1) + 8 * i);
                    -[CallHistoryDBHandle createCallRecord](self, "createCallRecord");
                    v26 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v25, "address");
                    v27 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v26, "setAddress:", v27);

                    objc_msgSend(v25, "answered");
                    v28 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v26, "setAnswered:", v28);

                    objc_msgSend(v25, "date");
                    v29 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v26, "setDate:", v29);

                    objc_msgSend(v25, "duration");
                    v30 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v26, "setDuration:", v30);

                    objc_msgSend(v25, "face_time_data");
                    v31 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v26, "setFace_time_data:", v31);

                    objc_msgSend(v25, "name");
                    v32 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v26, "setName:", v32);

                    objc_msgSend(v25, "read");
                    v33 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v26, "setRead:", v33);

                    objc_msgSend(v25, "unique_id");
                    v34 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v26, "setUnique_id:", v34);

                    objc_msgSend(v25, "calltype");
                    v35 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v26, "setCalltype:", v35);

                    objc_msgSend(v25, "originated");
                    v36 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v26, "setOriginated:", v36);

                    objc_msgSend(v25, "disconnected_cause");
                    v37 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v26, "setDisconnected_cause:", v37);

                    objc_msgSend(v25, "number_availability");
                    v38 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v26, "setNumber_availability:", v38);

                    objc_msgSend(v25, "iso_country_code");
                    v39 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v26, "setIso_country_code:", v39);

                    objc_msgSend(v26, "managedObjectContext");
                    v40 = (void *)objc_claimAutoreleasedReturnValue();
                    if (v40)
                    {
                      objc_msgSend(v25, "compositeCallCategoryForContext:", v40);
                      v41 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v26, "setCall_category:", v41);

                      objc_msgSend(v25, "compositeHandleTypeForContext:", v40);
                      v42 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v26, "setHandle_type:", v42);

                      if ((objc_msgSend(v25, "supportsImageURL") & 1) != 0)
                      {
                        objc_msgSend(v25, "imageURL");
                        v43 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v26, "setImageURL:", v43);

                      }
                      else
                      {
                        objc_msgSend(v26, "setImageURL:", 0);
                      }
                      objc_msgSend(v25, "compositeJunkConfidenceForContext:", v40);
                      v44 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v26, "setJunkConfidence:", v44);

                      objc_msgSend(v25, "compositeLocalParticipantUUIDForContext:", v40);
                      v45 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v26, "setLocalParticipantUUID:", v45);

                      objc_msgSend(v25, "compositeOutgoingLocalParticipantUUIDForContext:", v40);
                      v46 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v26, "setOutgoingLocalParticipantUUID:", v46);

                      objc_msgSend(v25, "compositeParticipantGroupUUIDForContext:", v40);
                      v47 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v26, "setParticipantGroupUUID:", v47);

                      objc_msgSend(v25, "compositeRemoteParticipantHandlesForContext:", v40);
                      v48 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v26, "setRemoteParticipantHandles:", v48);

                      objc_msgSend(v25, "compositeServiceProviderForContext:", v40);
                      v49 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v26, "setService_provider:", v49);

                      if ((objc_msgSend(v25, "supportsHasMessage") & 1) != 0)
                      {
                        objc_msgSend(v25, "hasMessage");
                        v50 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v26, "setHasMessage:", v50);

                      }
                      else
                      {
                        objc_msgSend(v26, "setHasMessage:", 0);
                      }
                      if ((objc_msgSend(v25, "supportsJunkIdentificationCategory") & 1) != 0)
                      {
                        objc_msgSend(v25, "junkIdentificationCategory");
                        v51 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v26, "setJunkIdentificationCategory:", v51);

                      }
                      else
                      {
                        objc_msgSend(v26, "setJunkIdentificationCategory:", 0);
                      }
                      if ((objc_msgSend(v25, "supportsAutoAnsweredReason") & 1) != 0)
                      {
                        objc_msgSend(v25, "autoAnsweredReason");
                        v52 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v26, "setAutoAnsweredReason:", v52);

                      }
                      else
                      {
                        objc_msgSend(v26, "setAutoAnsweredReason:", 0);
                      }
                      objc_msgSend(v25, "compositeEmergencyMediaItemsForContext:", v40);
                      v53 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v26, "setEmergencyMediaItems:", v53);

                      if (objc_msgSend(v25, "supportsEmergencyMedia"))
                        v54 = objc_msgSend(v25, "usedEmergencyVideoStreaming");
                      else
                        v54 = 0;
                      objc_msgSend(v26, "setUsedEmergencyVideoStreaming:", v54);
                      if (objc_msgSend(v25, "supportsEmergencyMedia"))
                        v55 = objc_msgSend(v25, "wasEmergencyCall");
                      else
                        v55 = 0;
                      objc_msgSend(v26, "setWasEmergencyCall:", v55);
                      if ((objc_msgSend(v25, "supportsBlockedBy") & 1) != 0)
                      {
                        objc_msgSend(v25, "blockedByExtension");
                        v56 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v26, "setBlockedByExtension:", v56);

                      }
                      else
                      {
                        objc_msgSend(v26, "setBlockedByExtension:", 0);
                      }
                      objc_msgSend(v25, "compositeCallDirectoryIdentityType:", v40);
                      v57 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v26, "setCallDirectoryIdentityType:", v57);

                      if ((objc_msgSend(v25, "supportsScreenSharingType") & 1) != 0)
                        objc_msgSend(v25, "screenSharingType");
                      else
                        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", 0);
                      v58 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v26, "setScreenSharingType:", v58);

                    }
                    objc_msgSend(v11, "deleteObject:", v25);

                  }
                  v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v68, v73, 16);
                }
                while (v22);
              }

              if (-[CallHistoryDBHandle save:](self, "save:", 0))
              {
                v8 = v64;
                v4 = v65;
                v12 = v62;
                v9 = v63;
                v13 = v61;
                v17 = v67;
                if (!-[CallHistoryDBHandle handleSaveForCallRecordContext:error:](self, "handleSaveForCallRecordContext:error:", v11, 0))
                {
                  -[CHLogger logHandle](self, "logHandle");
                  v59 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_WORD *)buf = 0;
                    _os_log_impl(&dword_1B3FA4000, v59, OS_LOG_TYPE_DEFAULT, "Failed to delete calls from the input database", buf, 2u);
                  }

                }
                -[NSObject removeDataStoreAtLocation:](v63, "removeDataStoreAtLocation:", v65);
                v10 = 1;
              }
              else
              {
                -[CHLogger logHandle](self, "logHandle");
                v60 = objc_claimAutoreleasedReturnValue();
                v8 = v64;
                v4 = v65;
                v12 = v62;
                v9 = v63;
                v13 = v61;
                v17 = v67;
                if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl(&dword_1B3FA4000, v60, OS_LOG_TYPE_DEFAULT, "Failed to save calls from input database to perm database", buf, 2u);
                }

                v10 = 0;
              }
            }

          }
          else
          {
            -[CHLogger logHandle](self, "logHandle");
            v13 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
              -[CallHistoryDBHandle moveCallRecordsFromDatabaseAtURL:].cold.3();
            v10 = 0;
          }

          goto LABEL_22;
        }
      }
      v10 = 0;
LABEL_22:

      goto LABEL_23;
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[CallHistoryDBHandle moveCallRecordsFromDatabaseAtURL:].cold.2();
  }
  else
  {
    -[CHLogger logHandle](self, "logHandle");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[CallHistoryDBHandle moveCallRecordsFromDatabaseAtURL:].cold.1();
  }
  v10 = 0;
LABEL_23:

  return v10;
}

- (void)handleCallRecordContextDidSaveNotification:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NotificationSender *v12;
  void *v13;
  uint8_t v14[16];

  v4 = a3;
  -[CHLogger logHandle](self, "logHandle");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v14 = 0;
    _os_log_impl(&dword_1B3FA4000, v5, OS_LOG_TYPE_DEFAULT, "handleCallRecordContextDidSaveNotification", v14, 2u);
  }

  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0C97878]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0C97A20]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0C97840]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)objc_opt_new();
  objc_msgSend(v9, "setObject:forKeyedSubscript:", CFSTR("External"), CFSTR("kNotificationReason"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", objc_msgSend(v7, "count") + objc_msgSend(v6, "count") + objc_msgSend(v8, "count"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v10, CFSTR("kNotificationChangeCount"));

  -[CallHistoryDBHandle setCallsDidChangeDarwinNotificationCount:](self, "setCallsDidChangeDarwinNotificationCount:", -[CallHistoryDBHandle callsDidChangeDarwinNotificationCount](self, "callsDidChangeDarwinNotificationCount") + 1);
  notify_post("com.apple.callhistory.notification.calls-changed");
  notify_post("com.apple.CallHistoryPluginHelper.launchnotification");
  if (objc_msgSend(v6, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "postNotificationName:object:userInfo:deliverImmediately:", CFSTR("kCallHistoryCallRecordInsertedNotification"), 0, 0, 1);

  }
  objc_msgSend(v9, "setObject:forKeyedSubscript:", CFSTR("Internal"), CFSTR("kNotificationReason"));
  v12 = -[NotificationSender initWithName:]([NotificationSender alloc], "initWithName:", CFSTR("kCallHistoryDatabaseChangedNotification"));
  -[NotificationSender setUserInfo:](v12, "setUserInfo:", v9);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "postNotificationName:object:userInfo:", CFSTR("kCallHistoryDatabaseChangedInternalNotification"), v12, v9);

}

- (void)handleCallDBPropContextDidSaveNotification:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "objectId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "postNotificationName:object:userInfo:", CFSTR("kCallHistoryTimersDistributedSaveNotification"), v5, 0);

  -[CallHistoryDBHandle postTimersChangedNotification](self, "postTimersChangedNotification");
}

- (void)postTimersChangedNotification
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[CallHistoryDBHandle callDBProperties](self, "callDBProperties");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = (void *)MEMORY[0x1E0C99D80];
  objc_msgSend(v7, "timer_incoming");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "timer_outgoing");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "timer_lifetime");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dictionaryWithObjectsAndKeys:", v3, CFSTR("kCHTimerIncomingKey"), v4, CFSTR("kCHTimerOutgoingKey"), v5, CFSTR("kCHTimerLifetimeKey"), 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  notifyClientsOfEvent(CFSTR("kCallHistoryTimersChangedNotification"), v6);
}

- (void)mergeCallRecordChangesFromRemoteAppSave
{
  NotificationSender *v3;
  void *v4;
  NSObject *v5;
  uint8_t v6[16];

  if (-[CallHistoryDBHandle callsDidChangeDarwinNotificationCount](self, "callsDidChangeDarwinNotificationCount"))
  {
    -[CallHistoryDBHandle setCallsDidChangeDarwinNotificationCount:](self, "setCallsDidChangeDarwinNotificationCount:", -[CallHistoryDBHandle callsDidChangeDarwinNotificationCount](self, "callsDidChangeDarwinNotificationCount") - 1);
  }
  else
  {
    -[NSManagedObjectContext reset](self->fCallRecordContext, "reset");
    v3 = -[NotificationSender initWithName:]([NotificationSender alloc], "initWithName:", CFSTR("kCallHistoryDatabaseChangedNotification"));
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "postNotificationName:object:userInfo:", CFSTR("kCallHistoryDatabaseChangedInternalNotification"), v3, 0);

    -[CHLogger logHandle](self, "logHandle");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_1B3FA4000, v5, OS_LOG_TYPE_DEFAULT, "Got call record save notification from other app", v6, 2u);
    }

  }
}

- (void)mergeCallDBPropChangesFromRemoteAppSave
{
  -[NSManagedObjectContext reset](self->fCallDBPropertiesContext, "reset");
}

- (id)fetchWithPredicate:(id)a3 forEntity:(id)a4
{
  return -[CallHistoryDBHandle fetchWithPredicate:forEntity:withLimit:](self, "fetchWithPredicate:forEntity:withLimit:", a3, a4, 1);
}

- (id)fetchWithPredicate:(id)a3 forEntity:(id)a4 withLimit:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  NSObject *v10;
  NSObject *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSManagedObjectContext *fCallRecordContext;
  void *v18;
  NSObject *v19;
  NSManagedObjectContext *fCallDBPropertiesContext;
  NSObject *v21;
  NSObject *v22;
  id v24;
  id v25;
  void *v26;
  _QWORD v27[2];
  uint8_t buf[4];
  id v29;
  uint64_t v30;

  v5 = a5;
  v30 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  ct_green_tea_logger_create_static();
  getCTGreenTeaOsLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10 && os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    v29 = v9;
    _os_log_impl(&dword_1B3FA4000, v11, OS_LOG_TYPE_INFO, "Read: %{public}@", buf, 0xCu);
  }

  v12 = objc_alloc_init(MEMORY[0x1E0C97B48]);
  objc_msgSend(v12, "setReturnsObjectsAsFaults:", 0);
  if (v8)
    objc_msgSend(v12, "setPredicate:", v8);
  +[DBManager entityDescriptionHavingName:forContext:](DBManager, "entityDescriptionHavingName:forContext:", v9, self->fCallRecordContext);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v13)
  {
    -[CHLogger logHandle](self, "logHandle");
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      -[CallHistoryDBHandle fetchWithPredicate:forEntity:withLimit:].cold.1();
    goto LABEL_23;
  }
  objc_msgSend(v12, "setEntity:", v13);
  if (objc_msgSend(v9, "isEqualToString:", CFSTR("CallRecord")))
  {
    v27[0] = CFSTR("remoteParticipantHandles");
    v27[1] = CFSTR("emergencyMediaItems");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setRelationshipKeyPathsForPrefetching:", v14);

    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3928]), "initWithKey:ascending:", CFSTR("date"), 0);
    v26 = v15;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v26, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setSortDescriptors:", v16);

    if (v5)
      objc_msgSend(v12, "setFetchLimit:", -[CallHistoryDBHandle callHistoryDBFetchLimit](self, "callHistoryDBFetchLimit"));
    fCallRecordContext = self->fCallRecordContext;
    v25 = 0;
    -[NSManagedObjectContext executeFetchRequest:error:](fCallRecordContext, "executeFetchRequest:error:", v12, &v25);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v25;

  }
  else
  {
    if (!objc_msgSend(v9, "isEqualToString:", CFSTR("CallDBProperties")))
    {
      -[CHLogger logHandle](self, "logHandle");
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v29 = v9;
        _os_log_impl(&dword_1B3FA4000, v21, OS_LOG_TYPE_DEFAULT, "Context for given entity %{public}@ not created", buf, 0xCu);
      }

      v19 = 0;
      goto LABEL_20;
    }
    fCallDBPropertiesContext = self->fCallDBPropertiesContext;
    v24 = 0;
    -[NSManagedObjectContext executeFetchRequest:error:](fCallDBPropertiesContext, "executeFetchRequest:error:", v12, &v24);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v24;
  }
  if (!v18)
  {
LABEL_20:
    -[CHLogger logHandle](self, "logHandle");
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      -[CallHistoryDBHandle fetchWithPredicate:forEntity:withLimit:].cold.2();

LABEL_23:
    v18 = 0;
  }

  return v18;
}

- (int64_t)deleteManagedCallsWithPredicate:(id)a3
{
  void *v4;
  int64_t v5;

  -[CallHistoryDBHandle fetchManagedCallsWithPredicate:sortDescriptors:limit:offset:batchSize:](self, "fetchManagedCallsWithPredicate:sortDescriptors:limit:offset:batchSize:", a3, 0, 0, 0, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    v5 = -[CallHistoryDBHandle deleteManagedCalls:](self, "deleteManagedCalls:", v4);
  else
    v5 = 0;

  return v5;
}

- (int64_t)deleteManagedCalls:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int64_t v9;
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
        -[NSManagedObjectContext deleteObject:](self->fCallRecordContext, "deleteObject:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v8++));
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }
  v9 = objc_msgSend(v4, "count");

  return v9;
}

- (id)fetchManagedCallIdentifiersWithPredicate:(id)a3 sortDescriptors:(id)a4 limit:(unint64_t)a5 offset:(unint64_t)a6 batchSize:(unint64_t)a7
{
  id v12;
  id v13;
  void *v14;
  void *v15;
  NSObject *v16;
  NSObject *v17;
  void *v18;
  NSManagedObjectContext *fCallRecordContext;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  NSObject *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t i;
  void *v29;
  id v30;
  void *v31;
  void *v33;
  void *v34;
  id v35;
  id v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  id v41;
  uint8_t v42[128];
  uint8_t buf[4];
  void *v44;
  _QWORD v45[3];

  v45[1] = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  +[CallRecord fetchRequest](CallRecord, "fetchRequest");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setFetchBatchSize:", a7);
  objc_msgSend(v14, "setFetchLimit:", a5);
  objc_msgSend(v14, "setFetchOffset:", a6);
  objc_msgSend(v14, "setPredicate:", v12);
  v45[0] = CFSTR("unique_id");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v45, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setPropertiesToFetch:", v15);

  objc_msgSend(v14, "setResultType:", 2);
  objc_msgSend(v14, "setSortDescriptors:", v13);
  ct_green_tea_logger_create_static();
  getCTGreenTeaOsLogHandle();
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if (v16 && os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v14, "entityName");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v44 = v18;
    _os_log_impl(&dword_1B3FA4000, v17, OS_LOG_TYPE_INFO, "Read: %@", buf, 0xCu);

  }
  fCallRecordContext = self->fCallRecordContext;
  v41 = 0;
  -[NSManagedObjectContext executeFetchRequest:error:](fCallRecordContext, "executeFetchRequest:error:", v14, &v41);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v41;
  v22 = v21;
  if (v20)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v20, "count"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = 0u;
    v38 = 0u;
    v39 = 0u;
    v40 = 0u;
    v24 = v20;
    v25 = -[NSObject countByEnumeratingWithState:objects:count:](v24, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
    if (v25)
    {
      v26 = v25;
      v33 = v20;
      v34 = v22;
      v35 = v13;
      v36 = v12;
      v27 = *(_QWORD *)v38;
      do
      {
        for (i = 0; i != v26; ++i)
        {
          if (*(_QWORD *)v38 != v27)
            objc_enumerationMutation(v24);
          objc_msgSend(*(id *)(*((_QWORD *)&v37 + 1) + 8 * i), "objectForKeyedSubscript:", CFSTR("unique_id"), v33, v34, v35, v36, (_QWORD)v37);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v30 = v29;
            if (objc_msgSend(v30, "length"))
              objc_msgSend(v23, "addObject:", v30);

          }
        }
        v26 = -[NSObject countByEnumeratingWithState:objects:count:](v24, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
      }
      while (v26);
      v13 = v35;
      v12 = v36;
      v20 = v33;
      v22 = v34;
    }
  }
  else
  {
    if (!v21)
    {
      v23 = 0;
      goto LABEL_22;
    }
    -[CHLogger logHandle](self, "logHandle");
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      -[CallHistoryDBHandle fetchManagedCallIdentifiersWithPredicate:sortDescriptors:limit:offset:batchSize:].cold.1();
    v23 = 0;
  }

LABEL_22:
  v31 = (void *)objc_msgSend(v23, "copy");

  return v31;
}

- (id)fetchAll
{
  return -[CallHistoryDBHandle fetchWithPredicate:forEntity:](self, "fetchWithPredicate:forEntity:", 0, CFSTR("CallRecord"));
}

- (id)fetchAllNoLimit
{
  return -[CallHistoryDBHandle fetchWithPredicate:forEntity:withLimit:](self, "fetchWithPredicate:forEntity:withLimit:", 0, CFSTR("CallRecord"), 0);
}

- (id)createCallRecord
{
  void *v3;
  CallRecord *v4;
  NSObject *v5;

  +[DBManager entityDescriptionHavingName:forContext:](DBManager, "entityDescriptionHavingName:forContext:", CFSTR("CallRecord"), self->fCallRecordContext);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = -[CallRecord initWithEntity:insertIntoManagedObjectContext:]([CallRecord alloc], "initWithEntity:insertIntoManagedObjectContext:", v3, self->fCallRecordContext);
  }
  else
  {
    -[CHLogger logHandle](self, "logHandle");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[CallHistoryDBHandle createCallRecord].cold.1();

    v4 = 0;
  }

  return v4;
}

- (id)getArrayForCallTypeMask:(unsigned int)a3
{
  id v4;
  uint64_t i;
  void *v6;
  _DWORD v8[5];
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v8[0] = 1;
  v8[1] = 2;
  v8[2] = 16;
  v8[3] = 8;
  v8[4] = 4;
  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  for (i = 0; i != 5; ++i)
  {
    if ((v8[i] & a3) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v6);

    }
  }
  return v4;
}

- (id)fetchWithCallTypes:(unsigned int)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = (void *)MEMORY[0x1E0CB3880];
  -[CallHistoryDBHandle getArrayForCallTypeMask:](self, "getArrayForCallTypeMask:", *(_QWORD *)&a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "predicateWithFormat:", CFSTR("calltype IN %@"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[CallHistoryDBHandle fetchWithPredicate:forEntity:](self, "fetchWithPredicate:forEntity:", v6, CFSTR("CallRecord"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)fetchAllObjectsWithUniqueId:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  uint8_t buf[4];
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("unique_id == %@"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CallHistoryDBHandle fetchWithPredicate:forEntity:](self, "fetchWithPredicate:forEntity:", v5, CFSTR("CallRecord"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v6, "count"))
  {
    -[CHLogger logHandle](self, "logHandle");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v10 = v4;
      _os_log_impl(&dword_1B3FA4000, v7, OS_LOG_TYPE_DEFAULT, "Database has no calls with %{public}@ UUID", buf, 0xCu);
    }

  }
  return v6;
}

- (id)fetchObjectWithUniqueId:(id)a3
{
  void *v4;
  NSObject *v5;
  void *v6;
  uint8_t v8[16];

  -[CallHistoryDBHandle fetchAllObjectsWithUniqueId:](self, "fetchAllObjectsWithUniqueId:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v4, "count") >= 2)
  {
    -[CHLogger logHandle](self, "logHandle");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_1B3FA4000, v5, OS_LOG_TYPE_DEFAULT, "Multiple object with same uniqueId found but only one requested. Returning last matched object.", v8, 2u);
    }

  }
  objc_msgSend(v4, "lastObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)fetchObjectsWithUniqueIds:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("unique_id IN %@"), a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CallHistoryDBHandle fetchWithPredicate:forEntity:](self, "fetchWithPredicate:forEntity:", v4, CFSTR("CallRecord"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)fetchObjectsWithPredicate:(id)a3
{
  return -[CallHistoryDBHandle fetchWithPredicate:forEntity:](self, "fetchWithPredicate:forEntity:", a3, CFSTR("CallRecord"));
}

- (void)deleteObjectWithUniqueId:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[CallHistoryDBHandle fetchObjectWithUniqueId:](self, "fetchObjectWithUniqueId:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[NSManagedObjectContext deleteObject:](self->fCallRecordContext, "deleteObject:", v5);
  }
  else
  {
    -[CHLogger logHandle](self, "logHandle");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = 138543362;
      v8 = v4;
      _os_log_impl(&dword_1B3FA4000, v6, OS_LOG_TYPE_DEFAULT, "Record with %{public}@ uniqueId does not exist", (uint8_t *)&v7, 0xCu);
    }

  }
}

- (void)deleteObjectsWithUniqueIds:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  NSObject *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint8_t buf[4];
  id v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[CallHistoryDBHandle fetchObjectsWithUniqueIds:](self, "fetchObjectsWithUniqueIds:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v18, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v13;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v13 != v9)
            objc_enumerationMutation(v6);
          -[NSManagedObjectContext deleteObject:](self->fCallRecordContext, "deleteObject:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i));
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v18, 16);
      }
      while (v8);
    }
  }
  else
  {
    -[CHLogger logHandle](self, "logHandle");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v17 = v4;
      _os_log_impl(&dword_1B3FA4000, v11, OS_LOG_TYPE_DEFAULT, "Record with %{public}@ uniqueIds does not exist", buf, 0xCu);
    }

  }
}

- (void)deleteAll
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  -[CallHistoryDBHandle fetchAllNoLimit](self, "fetchAllNoLimit");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        -[NSManagedObjectContext deleteObject:](self->fCallRecordContext, "deleteObject:", *(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * v7++));
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

}

- (BOOL)performSaveWithBackgroundTaskAssertion:(id)a3 error:(id *)a4
{
  id v5;
  const void *BackgroundTaskAssertion;
  char v7;

  v5 = a3;
  BackgroundTaskAssertion = (const void *)createBackgroundTaskAssertion();
  v7 = objc_msgSend(v5, "save:", a4);

  if (BackgroundTaskAssertion)
    CFRelease(BackgroundTaskAssertion);
  return v7;
}

- (void)updateCallDBProperties
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  int v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  int v19;
  void *v20;
  double v21;
  double v22;
  void *v23;
  void *v24;
  double v25;
  double v26;
  void *v27;
  double v28;
  double v29;
  void *v30;
  CallHistoryDBHandle *v31;
  id v32;
  _QWORD v33[5];
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  -[NSManagedObjectContext insertedObjects](self->fCallRecordContext, "insertedObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = self;
  -[CallHistoryDBHandle callDBProperties](self, "callDBProperties");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v35;
    v32 = v5;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v35 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v11 = v4;
          v12 = v10;
          objc_msgSend(v12, "calltype");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v13, "integerValue");

          if (v14 == 1)
          {
            objc_msgSend(v12, "duration");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "doubleValue");
            v17 = v16;

            if (v17 > 0.0)
            {
              objc_msgSend(v12, "originated");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              v19 = objc_msgSend(v18, "BOOLValue");

              if (v19)
              {
                objc_msgSend(v11, "timer_outgoing");
                v20 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v20, "doubleValue");
                v22 = v17 + v21;

                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", (double)(uint64_t)v22);
                v23 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v11, "setTimer_outgoing:", v23);
              }
              else
              {
                objc_msgSend(v11, "timer_incoming");
                v24 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v24, "doubleValue");
                v26 = v17 + v25;

                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", (double)(uint64_t)v26);
                v23 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v11, "setTimer_incoming:", v23);
              }

              objc_msgSend(v11, "timer_lifetime");
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v27, "doubleValue");
              v29 = v17 + v28;

              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", (double)(uint64_t)v29);
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v11, "setTimer_lifetime:", v30);

              v5 = v32;
            }
          }

          v4 = v11;
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
    }
    while (v7);
  }

  if (-[NSManagedObjectContext hasChanges](v31->fCallDBPropertiesContext, "hasChanges"))
  {
    v33[0] = MEMORY[0x1E0C809B0];
    v33[1] = 3221225472;
    v33[2] = __45__CallHistoryDBHandle_updateCallDBProperties__block_invoke;
    v33[3] = &unk_1E6746460;
    v33[4] = v31;
    -[CallHistoryDBHandle saveTimers:](v31, "saveTimers:", v33);
  }

}

uint64_t __45__CallHistoryDBHandle_updateCallDBProperties__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateCallDBProperties");
}

- (BOOL)handleSaveForCallRecordContext:(id)a3 error:(id *)a4
{
  _BOOL4 v6;
  id v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  uint8_t v12[8];
  id v13;

  v13 = 0;
  v6 = -[CallHistoryDBHandle performSaveWithBackgroundTaskAssertion:error:](self, "performSaveWithBackgroundTaskAssertion:error:", a3, &v13);
  v7 = v13;
  v8 = v7;
  if (a4)
    *a4 = objc_retainAutorelease(v7);
  -[CHLogger logHandle](self, "logHandle");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v6)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v12 = 0;
      _os_log_impl(&dword_1B3FA4000, v10, OS_LOG_TYPE_DEFAULT, "Save performed successfully", v12, 2u);
    }
  }
  else if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    -[CallHistoryDBHandle handleSaveForCallRecordContext:error:].cold.1();
  }

  return v6;
}

- (id)timerIncoming
{
  void *v2;
  void *v3;

  -[CallHistoryDBHandle callDBProperties](self, "callDBProperties");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "timer_incoming");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)timerOutgoing
{
  void *v2;
  void *v3;

  -[CallHistoryDBHandle callDBProperties](self, "callDBProperties");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "timer_outgoing");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)timerLifetime
{
  void *v2;
  void *v3;

  -[CallHistoryDBHandle callDBProperties](self, "callDBProperties");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "timer_lifetime");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)timerLastReset
{
  return +[DBManager getPropertyValueForKey:forContext:](DBManager, "getPropertyValueForKey:forContext:", CFSTR("timer_last_reset"), self->fCallDBPropertiesContext);
}

- (BOOL)saveTimers:(id)a3
{
  void (**v4)(_QWORD);
  void *v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  NSManagedObjectContext *fCallDBPropertiesContext;
  BOOL v10;
  id v11;
  void *v12;
  BOOL v13;
  NSObject *v14;
  id v16;

  v4 = (void (**)(_QWORD))a3;
  -[NSManagedObjectContext persistentStoreCoordinator](self->fCallDBPropertiesContext, "persistentStoreCoordinator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "persistentStores");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  if (v7)
  {
    -[CallHistoryDBHandle callDBProperties](self, "callDBProperties");
    v8 = objc_claimAutoreleasedReturnValue();
    fCallDBPropertiesContext = self->fCallDBPropertiesContext;
    v16 = 0;
    v10 = -[CallHistoryDBHandle performSaveWithBackgroundTaskAssertion:error:](self, "performSaveWithBackgroundTaskAssertion:error:", fCallDBPropertiesContext, &v16);
    v11 = v16;
    v12 = v11;
    if (!v10)
    {
      if (objc_msgSend(v11, "code") != 133020)
      {
        -[CHLogger logHandle](self, "logHandle");
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          -[CallHistoryDBHandle saveTimers:].cold.2();

        v13 = 0;
        goto LABEL_12;
      }
      -[NSManagedObjectContext refreshObject:mergeChanges:](self->fCallDBPropertiesContext, "refreshObject:mergeChanges:", v8, 0);
      v4[2](v4);
    }
    v13 = 1;
LABEL_12:

    goto LABEL_13;
  }
  -[CHLogger logHandle](self, "logHandle");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    -[CallHistoryDBHandle save:].cold.1();
  v13 = 0;
LABEL_13:

  return v13;
}

- (void)resetTimers
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[5];

  -[CallHistoryDBHandle callDBProperties](self, "callDBProperties");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", 0.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTimer_incoming:", v4);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", 0.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTimer_outgoing:", v5);

  v6 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "timeIntervalSinceReferenceDate");
  objc_msgSend(v6, "numberWithDouble:");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  +[DBManager setPropertyValue:forKey:forContext:](DBManager, "setPropertyValue:forKey:forContext:", v8, CFSTR("timer_last_reset"), self->fCallDBPropertiesContext);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __34__CallHistoryDBHandle_resetTimers__block_invoke;
  v9[3] = &unk_1E6746460;
  v9[4] = self;
  -[CallHistoryDBHandle saveTimers:](self, "saveTimers:", v9);

}

uint64_t __34__CallHistoryDBHandle_resetTimers__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "resetTimers");
}

- (BOOL)resetAllTimers
{
  CallHistoryDBHandle *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[5];

  v2 = self;
  -[CallHistoryDBHandle callDBProperties](self, "callDBProperties");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", 0.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTimer_all:", v4);
  objc_msgSend(v3, "setTimer_incoming:", v4);
  objc_msgSend(v3, "setTimer_outgoing:", v4);
  objc_msgSend(v3, "setTimer_lifetime:", v4);
  v5 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "timeIntervalSinceReferenceDate");
  objc_msgSend(v5, "numberWithDouble:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  +[DBManager setPropertyValue:forKey:forContext:](DBManager, "setPropertyValue:forKey:forContext:", v7, CFSTR("timer_last_reset"), v2->fCallDBPropertiesContext);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __37__CallHistoryDBHandle_resetAllTimers__block_invoke;
  v9[3] = &unk_1E6746460;
  v9[4] = v2;
  LOBYTE(v2) = -[CallHistoryDBHandle saveTimers:](v2, "saveTimers:", v9);

  return (char)v2;
}

uint64_t __37__CallHistoryDBHandle_resetAllTimers__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "resetAllTimers");
}

- (void)dealloc
{
  objc_super v3;

  -[CallHistoryDBHandle unRegisterForNotifications](self, "unRegisterForNotifications");
  v3.receiver = self;
  v3.super_class = (Class)CallHistoryDBHandle;
  -[CallHistoryDBHandle dealloc](&v3, sel_dealloc);
}

- (int64_t)callsDidChangeDarwinNotificationCount
{
  return self->_callsDidChangeDarwinNotificationCount;
}

- (void)setCallsDidChangeDarwinNotificationCount:(int64_t)a3
{
  self->_callsDidChangeDarwinNotificationCount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_featureFlags, 0);
  objc_storeStrong(&self->_dataStoreAddedRef, 0);
  objc_storeStrong(&self->_moveCallRecordsFromTempStoreRef, 0);
  objc_storeStrong(&self->_observerCallDBPropRef, 0);
  objc_storeStrong(&self->_observerCallRecordRef, 0);
  objc_storeStrong((id *)&self->callDBManager, 0);
  objc_storeStrong((id *)&self->fCallDBPropertiesContext, 0);
  objc_storeStrong((id *)&self->fCallRecordContext, 0);
}

- (void)callDBProperties
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1B3FA4000, v0, v1, "Multiple call db properties object found", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

+ (void)createForClient
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1B3FA4000, v0, v1, "Failed to created the handle", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)moveCallRecordsFromDatabaseAtURL:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1B3FA4000, v0, v1, "Input database URL is nil", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)moveCallRecordsFromDatabaseAtURL:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1B3FA4000, v0, v1, "Unable to query version of the database at location: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)moveCallRecordsFromDatabaseAtURL:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1B3FA4000, v0, v1, "Failed to look up entity: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)moveCallRecordsFromDatabaseAtURL:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1B3FA4000, v0, v1, "Failed to execute fetch on input database", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)fetchWithPredicate:forEntity:withLimit:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1B3FA4000, v0, v1, "Entity %{public}@ not found", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)fetchWithPredicate:forEntity:withLimit:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1B3FA4000, v0, v1, "Fetch request failed with error: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)fetchManagedCallCountWithPredicate:sortDescriptors:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1B3FA4000, v0, v1, "Count calls request failed with error %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)fetchManagedCallsWithPredicate:sortDescriptors:limit:offset:batchSize:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1B3FA4000, v0, v1, "Fetch calls request failed with error %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)fetchManagedCallIdentifiersWithPredicate:sortDescriptors:limit:offset:batchSize:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1B3FA4000, v0, v1, "Fetch call identifiers request failed with error %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)createCallRecord
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1B3FA4000, v0, v1, "While creating call record entity %{public}@ not found", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)handleSaveForCallRecordContext:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1B3FA4000, v0, v1, "Failed to save changes to persistent store error: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)save:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1B3FA4000, v0, v1, "No persistent stores. Not performing save.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)saveTimers:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1B3FA4000, v0, v1, "Failed to save call db properties to persistent store: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

@end
