@implementation AXSSCloudKitHelper

- (AXSSCloudKitHelper)initWithContainerIdentifier:(id)a3 zoneName:(id)a4
{
  id v7;
  id v8;
  AXSSCloudKitHelper *v9;
  dispatch_semaphore_t v10;
  OS_dispatch_semaphore *cloudKitQueueSemaphore;
  uint64_t v12;
  CKRecordZone *recordZone;
  id v14;
  void *v15;
  uint64_t v16;
  CKRecordZoneSubscription *zoneSubscription;
  void *v18;
  uint64_t v19;
  NSMutableArray *accumulatedQueuedData;
  id v21;
  objc_super v23;

  v7 = a3;
  v8 = a4;
  v23.receiver = self;
  v23.super_class = (Class)AXSSCloudKitHelper;
  v9 = -[AXSSCloudKitHelper init](&v23, sel_init);
  if (v9)
  {
    if (initWithContainerIdentifier_zoneName__onceToken != -1)
      dispatch_once(&initWithContainerIdentifier_zoneName__onceToken, &__block_literal_global_6);
    objc_storeStrong((id *)&v9->_containerIdentifier, a3);
    v10 = dispatch_semaphore_create(0);
    cloudKitQueueSemaphore = v9->_cloudKitQueueSemaphore;
    v9->_cloudKitQueueSemaphore = (OS_dispatch_semaphore *)v10;

    objc_storeStrong((id *)&v9->_cloudkitQueue, (id)__sharedQueue);
    v12 = objc_msgSend(objc_alloc(MEMORY[0x1E0C95088]), "initWithZoneName:", v8);
    recordZone = v9->_recordZone;
    v9->_recordZone = (CKRecordZone *)v12;

    v14 = objc_alloc(MEMORY[0x1E0C950B0]);
    -[CKRecordZone zoneID](v9->_recordZone, "zoneID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "initWithZoneID:subscriptionID:", v15, CFSTR("com.apple.accessibility.zone.subscription"));
    zoneSubscription = v9->_zoneSubscription;
    v9->_zoneSubscription = (CKRecordZoneSubscription *)v16;

    -[AXSSCloudKitHelper recordType](v9, "recordType");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKRecordZoneSubscription setRecordType:](v9->_zoneSubscription, "setRecordType:", v18);

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v19 = objc_claimAutoreleasedReturnValue();
    accumulatedQueuedData = v9->_accumulatedQueuedData;
    v9->_accumulatedQueuedData = (NSMutableArray *)v19;

    v21 = objc_alloc_init(MEMORY[0x1E0C94F50]);
    objc_msgSend(v21, "setShouldSendContentAvailable:", 1);
    -[CKRecordZoneSubscription setNotificationInfo:](v9->_zoneSubscription, "setNotificationInfo:", v21);

  }
  return v9;
}

void __59__AXSSCloudKitHelper_initWithContainerIdentifier_zoneName___block_invoke()
{
  dispatch_queue_t v0;
  void *v1;

  v0 = dispatch_queue_create("com.apple.coredata.cloudkit.queue", 0);
  v1 = (void *)__sharedQueue;
  __sharedQueue = (uint64_t)v0;

}

- (void)dealloc
{
  NSObject *v3;
  void *v4;
  objc_super v5;
  uint8_t buf[4];
  AXSSCloudKitHelper *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  AXLogPunctuationStorage();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v7 = self;
    _os_log_impl(&dword_1AF5CC000, v3, OS_LOG_TYPE_INFO, "Helper removed: %@", buf, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:", self);

  v5.receiver = self;
  v5.super_class = (Class)AXSSCloudKitHelper;
  -[AXSSCloudKitHelper dealloc](&v5, sel_dealloc);
}

- (Class)managedObjectClass
{
  return 0;
}

- (void)observeChangesForManagedContext:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id WeakRetained;
  _QWORD v11[5];

  v5 = a3;
  objc_storeStrong((id *)&self->_managedObjectContext, a3);
  objc_msgSend(v5, "persistentStoreCoordinator");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "persistentStores");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "persistentStoreCoordinator");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_observedStore);

  if (!WeakRetained)
  {
    objc_storeWeak((id *)&self->_observedStore, v8);
    objc_storeStrong((id *)&self->_observedCoordinator, v9);
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __54__AXSSCloudKitHelper_observeChangesForManagedContext___block_invoke;
    v11[3] = &unk_1E5F99200;
    v11[4] = self;
    -[AXSSCloudKitHelper openTransactionWithLabel:andExecuteWorkBlock:](self, "openTransactionWithLabel:andExecuteWorkBlock:", CFSTR("com.apple.axcloudkithelper.initialize"), v11);
  }

}

uint64_t __54__AXSSCloudKitHelper_observeChangesForManagedContext___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_initializeCloudkitForObservedStore");
}

- (void)_initializeCloudkitForObservedStore
{
  _BOOL4 v3;
  id v4;
  id v5;
  _BOOL4 v6;
  id v7;
  _BOOL4 v8;
  _BOOL4 v9;
  _BOOL4 v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;

  v16 = 0;
  v3 = -[AXSSCloudKitHelper _checkAccountStatus:](self, "_checkAccountStatus:", &v16);
  v4 = v16;
  v5 = v4;
  if (!v3)
    goto LABEL_8;
  v15 = v4;
  v6 = -[AXSSCloudKitHelper _createZoneIfNecessary:](self, "_createZoneIfNecessary:", &v15);
  v7 = v15;

  if (!v6)
    goto LABEL_7;
  v14 = v7;
  v8 = -[AXSSCloudKitHelper _setupZoneSubscriptionIfNecessary:](self, "_setupZoneSubscriptionIfNecessary:", &v14);
  v5 = v14;

  if (!v8)
  {
LABEL_8:
    objc_storeStrong((id *)&self->_lastInitializationError, v5);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("CloudKit integration setup failed with error:\n%@"), v5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXSSCloudKitHelper logMessage:](self, "logMessage:", v11);

    goto LABEL_9;
  }
  v13 = v5;
  v9 = -[AXSSCloudKitHelper _createSchemaIfNecessary:](self, "_createSchemaIfNecessary:", &v13);
  v7 = v13;

  if (!v9)
  {
LABEL_7:
    v5 = v7;
    goto LABEL_8;
  }
  v12 = v7;
  v10 = -[AXSSCloudKitHelper _setupPushConnection:](self, "_setupPushConnection:", &v12);
  v5 = v12;

  if (!v10)
    goto LABEL_8;
  -[AXSSCloudKitHelper beginWatchingForChanges](self, "beginWatchingForChanges");
  -[AXSSCloudKitHelper fetchChangesAndUpdateObservedStore](self, "fetchChangesAndUpdateObservedStore");
  -[AXSSCloudKitHelper logMessage:](self, "logMessage:", CFSTR("Successfully set up CloudKit integration."));
LABEL_9:

}

- (BOOL)_checkAccountStatus:(id *)a3
{
  CKContainer *v5;
  CKContainer *container;
  CKContainer *v7;
  void *v8;
  void *v9;
  void *v10;
  BOOL v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t *v17;
  CKDatabase *v18;
  CKDatabase *database;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  NSObject *v25;
  CKContainer *v26;
  CKContainer *v28;
  void *v29;
  _QWORD v30[7];
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  char v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t (*v38)(uint64_t, uint64_t);
  void (*v39)(uint64_t);
  id v40;
  uint8_t buf[4];
  CKContainer *v42;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  void *v46;
  uint64_t v47;
  _QWORD v48[2];

  v48[1] = *MEMORY[0x1E0C80C00];
  v35 = 0;
  v36 = &v35;
  v37 = 0x3032000000;
  v38 = __Block_byref_object_copy__4;
  v39 = __Block_byref_object_dispose__4;
  v40 = 0;
  if ((objc_msgSend(MEMORY[0x1E0C94C28], "currentProcessCanUseCloudKit") & 1) != 0)
  {
    v31 = 0;
    v32 = &v31;
    v33 = 0x2020000000;
    v34 = 0;
    objc_msgSend(MEMORY[0x1E0C94C28], "containerWithIdentifier:", self->_containerIdentifier);
    v5 = (CKContainer *)objc_claimAutoreleasedReturnValue();
    container = self->_container;
    self->_container = v5;

    v7 = self->_container;
    if (v7)
    {
      v30[0] = MEMORY[0x1E0C809B0];
      v30[1] = 3221225472;
      v30[2] = __42__AXSSCloudKitHelper__checkAccountStatus___block_invoke;
      v30[3] = &unk_1E5F99228;
      v30[5] = &v31;
      v30[6] = &v35;
      v30[4] = self;
      -[CKContainer accountStatusWithCompletionHandler:](v7, "accountStatusWithCompletionHandler:", v30);
      dispatch_semaphore_wait((dispatch_semaphore_t)self->_cloudKitQueueSemaphore, 0xFFFFFFFFFFFFFFFFLL);
    }
    else
    {
      v12 = (void *)MEMORY[0x1E0CB35C8];
      v45 = *MEMORY[0x1E0CB2D68];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to get a container back for the identifier: %@"), self->_containerIdentifier);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v46 = v13;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v46, &v45, 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "errorWithDomain:code:userInfo:", CFSTR("AXCloudKitErrorDomain"), 0, v14);
      v15 = objc_claimAutoreleasedReturnValue();
      v16 = (void *)v36[5];
      v36[5] = v15;

    }
    v17 = v32;
    if (*((_BYTE *)v32 + 24))
    {
      -[CKContainer privateCloudDatabase](self->_container, "privateCloudDatabase");
      v18 = (CKDatabase *)objc_claimAutoreleasedReturnValue();
      database = self->_database;
      self->_database = v18;

      v17 = v32;
      if (!self->_database)
      {
        *((_BYTE *)v32 + 24) = 0;
        v20 = (void *)MEMORY[0x1E0CB35C8];
        v43 = *MEMORY[0x1E0CB2D68];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to get a database back from -privateCloudDatabase for container: %@"), self->_container);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v44 = v21;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v44, &v43, 1);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "errorWithDomain:code:userInfo:", CFSTR("AXCloudKitErrorDomain"), 0, v22);
        v23 = objc_claimAutoreleasedReturnValue();
        v24 = (void *)v36[5];
        v36[5] = v23;

        v17 = v32;
      }
    }
    if (*((_BYTE *)v17 + 24))
    {
      AXLogPunctuationStorage();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
      {
        v26 = self->_container;
        *(_DWORD *)buf = 138412290;
        v42 = v26;
        _os_log_impl(&dword_1AF5CC000, v25, OS_LOG_TYPE_INFO, "Account status valid: %@", buf, 0xCu);
      }

    }
    else
    {
      v28 = self->_container;
      self->_container = 0;

      if (a3)
      {
        v29 = (void *)v36[5];
        if (v29)
          *a3 = objc_retainAutorelease(v29);
      }
    }
    v11 = *((_BYTE *)v32 + 24) != 0;
    _Block_object_dispose(&v31, 8);
  }
  else
  {
    v8 = (void *)MEMORY[0x1E0CB35C8];
    v47 = *MEMORY[0x1E0CB2D68];
    v48[0] = CFSTR("Current process can't use cloud kit");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v48, &v47, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "errorWithDomain:code:userInfo:", CFSTR("AXCloudKitErrorDomain"), 0, v9);
    *a3 = (id)objc_claimAutoreleasedReturnValue();

    v10 = (void *)v36[5];
    v11 = 0;
    if (v10)
      *a3 = objc_retainAutorelease(v10);
  }
  _Block_object_dispose(&v35, 8);

  return v11;
}

void __42__AXSSCloudKitHelper__checkAccountStatus___block_invoke(_QWORD *a1, uint64_t a2, void *a3)
{
  uint64_t v5;
  __CFString *v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;

  v13 = a3;
  v5 = *(_QWORD *)(a1[5] + 8);
  if (a2 == 1)
  {
    *(_BYTE *)(v5 + 24) = 1;
  }
  else
  {
    *(_BYTE *)(v5 + 24) = 0;
    if (a2)
    {
      if (a2 == 3)
      {
        v6 = CFSTR("Unable to initialize without an iCloud account (CKAccountStatusNoAccount).");
      }
      else if (a2 == 2)
      {
        v6 = CFSTR("Unable to initialize without a valid iCloud account (CKAccountStatusRestricted).");
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unknown account status: %d"), a2);
        v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      v6 = CFSTR("Unable to determine the status of the iCloud account (CKAccountStatusCouldNotDetermine).");
    }
    v7 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    objc_msgSend(v7, "setObject:forKey:", v6, *MEMORY[0x1E0CB2D68]);
    if (v13)
      objc_msgSend(v7, "setObject:forKey:", v13, *MEMORY[0x1E0CB3388]);
    v8 = (void *)MEMORY[0x1E0CB35C8];
    v9 = (void *)objc_msgSend(v7, "copy");
    objc_msgSend(v8, "errorWithDomain:code:userInfo:", CFSTR("AXCloudKitErrorDomain"), 0, v9);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = *(_QWORD *)(a1[6] + 8);
    v12 = *(void **)(v11 + 40);
    *(_QWORD *)(v11 + 40) = v10;

  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1[4] + 96));

}

- (id)zoneCreatedKey
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x1E0CB3940];
  -[CKRecordZone zoneID](self->_recordZone, "zoneID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "zoneName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("AXCloudKitZoneCreated-%@"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)zoneSubscriptionKey
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x1E0CB3940];
  -[CKRecordZone zoneID](self->_recordZone, "zoneID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "zoneName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("AXCloudKitSubscriptionCreated-%@"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)_createZoneIfNecessary:(id *)a3
{
  CKRecordZone *v5;
  NSObject *v6;
  CKRecordZone *recordZone;
  void *v8;
  void *v9;
  int v10;
  NSObject *v11;
  BOOL v12;
  id v13;
  void *v14;
  NSObject *v15;
  CKRecordZone *v16;
  void *v17;
  void *v18;
  void *v20;
  _QWORD v21[4];
  CKRecordZone *v22;
  AXSSCloudKitHelper *v23;
  uint64_t *v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  char v35;
  CKRecordZone *v36;
  uint8_t buf[4];
  CKRecordZone *v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v32 = 0;
  v33 = &v32;
  v34 = 0x2020000000;
  v35 = 0;
  v26 = 0;
  v27 = &v26;
  v28 = 0x3032000000;
  v29 = __Block_byref_object_copy__4;
  v30 = __Block_byref_object_dispose__4;
  v31 = 0;
  v5 = self->_recordZone;
  AXLogPunctuationStorage();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    recordZone = self->_recordZone;
    *(_DWORD *)buf = 138412290;
    v38 = recordZone;
    _os_log_impl(&dword_1AF5CC000, v6, OS_LOG_TYPE_INFO, "Creating zone: %@", buf, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXSSCloudKitHelper zoneCreatedKey](self, "zoneCreatedKey");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "BOOLForKey:", v9);

  if (v10)
  {
    AXLogPunctuationStorage();
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = 1;
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1AF5CC000, v11, OS_LOG_TYPE_INFO, "Already created zone", buf, 2u);
    }
  }
  else
  {
    v13 = objc_alloc(MEMORY[0x1E0C94EF0]);
    v36 = v5;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v36, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v13, "initWithRecordZonesToSave:recordZoneIDsToDelete:", v14, 0);

    -[NSObject setQueuePriority:](v11, "setQueuePriority:", 4);
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __45__AXSSCloudKitHelper__createZoneIfNecessary___block_invoke;
    v21[3] = &unk_1E5F99250;
    v24 = &v32;
    v25 = &v26;
    v22 = v5;
    v23 = self;
    -[NSObject setModifyRecordZonesCompletionBlock:](v11, "setModifyRecordZonesCompletionBlock:", v21);
    -[CKDatabase addOperation:](self->_database, "addOperation:", v11);
    dispatch_semaphore_wait((dispatch_semaphore_t)self->_cloudKitQueueSemaphore, 0xFFFFFFFFFFFFFFFFLL);
    if (*((_BYTE *)v33 + 24))
    {
      AXLogPunctuationStorage();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        v16 = self->_recordZone;
        *(_DWORD *)buf = 138412290;
        v38 = v16;
        _os_log_impl(&dword_1AF5CC000, v15, OS_LOG_TYPE_INFO, "Zone created: %@", buf, 0xCu);
      }

      objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[AXSSCloudKitHelper zoneCreatedKey](self, "zoneCreatedKey");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setBool:forKey:", 1, v18);

    }
    else if (a3)
    {
      v20 = (void *)v27[5];
      if (v20)
        *a3 = objc_retainAutorelease(v20);
    }
    v12 = *((_BYTE *)v33 + 24) != 0;

  }
  _Block_object_dispose(&v26, 8);

  _Block_object_dispose(&v32, 8);
  return v12;
}

void __45__AXSSCloudKitHelper__createZoneIfNecessary___block_invoke(_QWORD *a1, void *a2, uint64_t a3, void *a4)
{
  id v7;

  v7 = a4;
  if (objc_msgSend(a2, "containsObject:", a1[4]))
    *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = 1;
  else
    objc_storeStrong((id *)(*(_QWORD *)(a1[7] + 8) + 40), a4);
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1[5] + 96));

}

- (BOOL)_createSchemaIfNecessary:(id *)a3
{
  NSPersistentStore **p_observedStore;
  id WeakRetained;
  void *v7;
  void *v8;
  int v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  uint64_t v19;
  id v20;
  id v21;
  void *v22;
  void *v23;
  NSObject *v24;
  id v25;
  BOOL v26;
  void *v28;
  _QWORD v29[4];
  id v30;
  AXSSCloudKitHelper *v31;
  uint64_t *v32;
  uint64_t *v33;
  _QWORD v34[4];
  id v35;
  AXSSCloudKitHelper *v36;
  uint64_t *v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t *v40;
  uint64_t v41;
  uint64_t (*v42)(uint64_t, uint64_t);
  void (*v43)(uint64_t);
  id v44;
  uint64_t v45;
  uint64_t *v46;
  uint64_t v47;
  char v48;
  uint8_t buf[4];
  id v50;
  void *v51;
  _QWORD v52[3];

  v52[1] = *MEMORY[0x1E0C80C00];
  v45 = 0;
  v46 = &v45;
  v47 = 0x2020000000;
  v48 = 0;
  v39 = 0;
  v40 = &v39;
  v41 = 0x3032000000;
  v42 = __Block_byref_object_copy__4;
  v43 = __Block_byref_object_dispose__4;
  p_observedStore = &self->_observedStore;
  v44 = 0;
  WeakRetained = objc_loadWeakRetained((id *)&self->_observedStore);
  objc_msgSend(WeakRetained, "metadata");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", CFSTR("AXCloudKitFinishedSchemaCheckKey"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "BOOLValue");

  if (v9)
  {
    *((_BYTE *)v46 + 24) = 1;
    goto LABEL_7;
  }
  v10 = objc_alloc(MEMORY[0x1E0C95070]);
  v11 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stringWithFormat:", CFSTR("CD_FAKE_RECORD_%@"), v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v10, "initWithRecordName:", v13);

  -[AXSSCloudKitHelper testRecordForSchemaCreation:](self, "testRecordForSchemaCreation:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_alloc(MEMORY[0x1E0C94F10]);
  v52[0] = v15;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v52, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v16, "initWithRecordsToSave:recordIDsToDelete:", v17, 0);

  objc_msgSend(v18, "setQueuePriority:", 4);
  v19 = MEMORY[0x1E0C809B0];
  v34[0] = MEMORY[0x1E0C809B0];
  v34[1] = 3221225472;
  v34[2] = __47__AXSSCloudKitHelper__createSchemaIfNecessary___block_invoke;
  v34[3] = &unk_1E5F99250;
  v20 = v15;
  v37 = &v45;
  v38 = &v39;
  v35 = v20;
  v36 = self;
  objc_msgSend(v18, "setModifyRecordsCompletionBlock:", v34);
  -[CKDatabase addOperation:](self->_database, "addOperation:", v18);
  dispatch_semaphore_wait((dispatch_semaphore_t)self->_cloudKitQueueSemaphore, 0xFFFFFFFFFFFFFFFFLL);
  if (*((_BYTE *)v46 + 24))
  {
    v21 = objc_alloc(MEMORY[0x1E0C94F10]);
    v51 = v14;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v51, 1);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = (void *)objc_msgSend(v21, "initWithRecordsToSave:recordIDsToDelete:", 0, v22);

    v29[0] = v19;
    v29[1] = 3221225472;
    v29[2] = __47__AXSSCloudKitHelper__createSchemaIfNecessary___block_invoke_2;
    v29[3] = &unk_1E5F99278;
    v30 = v14;
    v31 = self;
    v32 = &v45;
    v33 = &v39;
    objc_msgSend(v23, "setModifyRecordsCompletionBlock:", v29);
    -[CKDatabase addOperation:](self->_database, "addOperation:", v23);
    dispatch_semaphore_wait((dispatch_semaphore_t)self->_cloudKitQueueSemaphore, 0xFFFFFFFFFFFFFFFFLL);

  }
  else
  {
    v23 = v18;
  }

  if (*((_BYTE *)v46 + 24))
  {
LABEL_7:
    AXLogPunctuationStorage();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      v25 = objc_loadWeakRetained((id *)p_observedStore);
      *(_DWORD *)buf = 138412290;
      v50 = v25;
      _os_log_impl(&dword_1AF5CC000, v24, OS_LOG_TYPE_INFO, "Schema created: %@", buf, 0xCu);

    }
    goto LABEL_10;
  }
  if (a3)
  {
    v28 = (void *)v40[5];
    if (v28)
      *a3 = objc_retainAutorelease(v28);
  }
LABEL_10:
  v26 = *((_BYTE *)v46 + 24) != 0;
  _Block_object_dispose(&v39, 8);

  _Block_object_dispose(&v45, 8);
  return v26;
}

void __47__AXSSCloudKitHelper__createSchemaIfNecessary___block_invoke(_QWORD *a1, void *a2, uint64_t a3, void *a4)
{
  id v7;

  v7 = a4;
  if (objc_msgSend(a2, "containsObject:", a1[4]))
    *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = 1;
  else
    objc_storeStrong((id *)(*(_QWORD *)(a1[7] + 8) + 40), a4);
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1[5] + 96));

}

void __47__AXSSCloudKitHelper__createSchemaIfNecessary___block_invoke_2(_QWORD *a1, uint64_t a2, void *a3, void *a4)
{
  int v6;
  uint64_t v7;
  id WeakRetained;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  id v13;
  id v14;

  v14 = a4;
  v6 = objc_msgSend(a3, "containsObject:", a1[4]);
  v7 = *(_QWORD *)(a1[6] + 8);
  if (v6)
  {
    *(_BYTE *)(v7 + 24) = 1;
    WeakRetained = objc_loadWeakRetained((id *)(a1[5] + 24));
    objc_msgSend(WeakRetained, "metadata");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v9, "mutableCopy");

    objc_msgSend(v10, "setObject:forKey:", MEMORY[0x1E0C9AAB0], CFSTR("AXCloudKitFinishedSchemaCheckKey"));
    v11 = objc_loadWeakRetained((id *)(a1[5] + 24));
    objc_msgSend(v11, "setMetadata:", v10);

  }
  else
  {
    *(_BYTE *)(v7 + 24) = 0;
    v12 = *(_QWORD *)(a1[7] + 8);
    v13 = v14;
    v10 = *(void **)(v12 + 40);
    *(_QWORD *)(v12 + 40) = v13;
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1[5] + 96));
}

- (BOOL)_setupZoneSubscriptionIfNecessary:(id *)a3
{
  void *v5;
  void *v6;
  int v7;
  NSObject *v8;
  BOOL v9;
  CKRecordZoneSubscription *v10;
  id v11;
  void *v12;
  void *v13;
  NSObject *v14;
  CKRecordZoneSubscription *zoneSubscription;
  void *v16;
  void *v17;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(_QWORD *, void *, uint64_t, void *);
  void *v23;
  NSObject *v24;
  AXSSCloudKitHelper *v25;
  uint64_t *v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  char v37;
  uint8_t buf[4];
  CKRecordZoneSubscription *v39;
  _QWORD v40[2];

  v40[1] = *MEMORY[0x1E0C80C00];
  v34 = 0;
  v35 = &v34;
  v36 = 0x2020000000;
  v37 = 0;
  v28 = 0;
  v29 = &v28;
  v30 = 0x3032000000;
  v31 = __Block_byref_object_copy__4;
  v32 = __Block_byref_object_dispose__4;
  v33 = 0;
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXSSCloudKitHelper zoneSubscriptionKey](self, "zoneSubscriptionKey");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "BOOLForKey:", v6);

  if (v7)
  {
    AXLogPunctuationStorage();
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = 1;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1AF5CC000, v8, OS_LOG_TYPE_INFO, "Already setup zone subcription", buf, 2u);
    }
  }
  else
  {
    v10 = self->_zoneSubscription;
    v11 = objc_alloc(MEMORY[0x1E0C94F28]);
    v40[0] = v10;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v40, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v11, "initWithSubscriptionsToSave:subscriptionIDsToDelete:", v12, 0);

    objc_msgSend(v13, "setQueuePriority:", 4);
    v20 = MEMORY[0x1E0C809B0];
    v21 = 3221225472;
    v22 = __56__AXSSCloudKitHelper__setupZoneSubscriptionIfNecessary___block_invoke;
    v23 = &unk_1E5F99250;
    v8 = v10;
    v26 = &v34;
    v27 = &v28;
    v24 = v8;
    v25 = self;
    objc_msgSend(v13, "setModifySubscriptionsCompletionBlock:", &v20);
    -[CKDatabase addOperation:](self->_database, "addOperation:", v13, v20, v21, v22, v23);
    dispatch_semaphore_wait((dispatch_semaphore_t)self->_cloudKitQueueSemaphore, 0xFFFFFFFFFFFFFFFFLL);
    if (*((_BYTE *)v35 + 24))
    {
      AXLogPunctuationStorage();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        zoneSubscription = self->_zoneSubscription;
        *(_DWORD *)buf = 138412290;
        v39 = zoneSubscription;
        _os_log_impl(&dword_1AF5CC000, v14, OS_LOG_TYPE_INFO, "Zone subscription created: %@", buf, 0xCu);
      }

      objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[AXSSCloudKitHelper zoneSubscriptionKey](self, "zoneSubscriptionKey");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setBool:forKey:", 1, v17);

    }
    else if (a3)
    {
      v19 = (void *)v29[5];
      if (v19)
        *a3 = objc_retainAutorelease(v19);
    }
    v9 = *((_BYTE *)v35 + 24) != 0;

  }
  _Block_object_dispose(&v28, 8);

  _Block_object_dispose(&v34, 8);
  return v9;
}

void __56__AXSSCloudKitHelper__setupZoneSubscriptionIfNecessary___block_invoke(_QWORD *a1, void *a2, uint64_t a3, void *a4)
{
  id v7;

  v7 = a4;
  if (objc_msgSend(a2, "containsObject:", a1[4]))
    *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = 1;
  else
    objc_storeStrong((id *)(*(_QWORD *)(a1[7] + 8) + 40), a4);
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1[5] + 96));

}

- (void)beginWatchingForChanges
{
  NSObject *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  AXLogPunctuationStorage();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    -[AXSSCloudKitHelper managedObjectContext](self, "managedObjectContext");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138412290;
    v9 = v4;
    _os_log_impl(&dword_1AF5CC000, v3, OS_LOG_TYPE_INFO, "Watching for changes now on: %@", (uint8_t *)&v8, 0xCu);

  }
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *MEMORY[0x1E0C978B0];
  -[AXSSCloudKitHelper managedObjectContext](self, "managedObjectContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObserver:selector:name:object:", self, sel_managedObjectContextDidSave_, v6, v7);

}

- (void)openTransactionWithLabel:(id)a3 andExecuteWorkBlock:(id)a4
{
  id v6;
  void *v7;
  NSObject *cloudkitQueue;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v6 = a4;
  objc_msgSend(objc_retainAutorelease(a3), "cStringUsingEncoding:", 1);
  v7 = (void *)os_transaction_create();
  cloudkitQueue = self->_cloudkitQueue;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __67__AXSSCloudKitHelper_openTransactionWithLabel_andExecuteWorkBlock___block_invoke;
  v11[3] = &unk_1E5F992A0;
  v12 = v7;
  v13 = v6;
  v9 = v7;
  v10 = v6;
  dispatch_async(cloudkitQueue, v11);

}

uint64_t __67__AXSSCloudKitHelper_openTransactionWithLabel_andExecuteWorkBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (BOOL)shouldExportManagedObject:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  char isKindOfClass;
  int v9;

  v4 = a3;
  objc_msgSend(v4, "objectID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "persistentStore");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXSSCloudKitHelper observedStore](self, "observedStore");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v6, "isEqual:", v7))
  {

    goto LABEL_5;
  }
  -[AXSSCloudKitHelper managedObjectClass](self, "managedObjectClass");
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
LABEL_5:
    LOBYTE(v9) = 0;
    goto LABEL_6;
  }
  v9 = objc_msgSend(v4, "inCloud") ^ 1;
LABEL_6:

  return v9;
}

- (id)serverChangeTokenMetadataKey
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB3940];
  -[AXSSCloudKitHelper recordType](self, "recordType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("CloudKitServerChangeToken-%@"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)cloudKitPushTopic
{
  return CFSTR("com.apple.icloud-container.com.apple.accessibility.AccessibilityUIServer");
}

- (void)fetchChangesAndUpdateObservedStore
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __56__AXSSCloudKitHelper_fetchChangesAndUpdateObservedStore__block_invoke;
  v2[3] = &unk_1E5F99200;
  v2[4] = self;
  -[AXSSCloudKitHelper openTransactionWithLabel:andExecuteWorkBlock:](self, "openTransactionWithLabel:andExecuteWorkBlock:", CFSTR("com.apple.axcloudkithelper.import"), v2);
}

void __56__AXSSCloudKitHelper_fetchChangesAndUpdateObservedStore__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  uint64_t v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  _QWORD v24[5];
  id v25;
  id v26;
  id v27;
  _QWORD v28[5];
  id v29;
  _QWORD v30[5];
  id v31;
  void *v32;
  id v33;
  _QWORD v34[3];

  v34[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 24));
  objc_msgSend(WeakRetained, "metadata");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "serverChangeTokenMetadataKey");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v7, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_alloc_init(MEMORY[0x1E0C94DD8]);
  objc_msgSend(v9, "setPreviousServerChangeToken:", v8);
  v10 = objc_alloc(MEMORY[0x1E0C94DE8]);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "zoneID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v34[0] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v34, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "zoneID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = v13;
  v33 = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v33, &v32, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v10, "initWithRecordZoneIDs:configurationsByRecordZoneID:", v12, v14);

  v16 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v17 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v18 = MEMORY[0x1E0C809B0];
  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = __56__AXSSCloudKitHelper_fetchChangesAndUpdateObservedStore__block_invoke_2;
  v30[3] = &unk_1E5F992C8;
  v30[4] = *(_QWORD *)(a1 + 32);
  v19 = v16;
  v31 = v19;
  objc_msgSend(v15, "setRecordWasChangedBlock:", v30);
  v28[0] = v18;
  v28[1] = 3221225472;
  v28[2] = __56__AXSSCloudKitHelper_fetchChangesAndUpdateObservedStore__block_invoke_92;
  v28[3] = &unk_1E5F992F0;
  v28[4] = *(_QWORD *)(a1 + 32);
  v20 = v17;
  v29 = v20;
  objc_msgSend(v15, "setRecordWithIDWasDeletedBlock:", v28);
  v24[0] = v18;
  v24[1] = 3221225472;
  v24[2] = __56__AXSSCloudKitHelper_fetchChangesAndUpdateObservedStore__block_invoke_2_94;
  v24[3] = &unk_1E5F99340;
  v24[4] = *(_QWORD *)(a1 + 32);
  v25 = v19;
  v26 = v20;
  v27 = v3;
  v21 = v3;
  v22 = v20;
  v23 = v19;
  objc_msgSend(v15, "setRecordZoneFetchCompletionBlock:", v24);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "addOperation:", v15);

}

void __56__AXSSCloudKitHelper_fetchChangesAndUpdateObservedStore__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  NSObject *v8;

  v4 = a3;
  objc_msgSend(v4, "recordType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "recordType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isEqualToString:", v6);

  if (v7)
  {
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v4);
    AXLogPunctuationStorage();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      __56__AXSSCloudKitHelper_fetchChangesAndUpdateObservedStore__block_invoke_2_cold_1(v4, v8);

  }
}

void __56__AXSSCloudKitHelper_fetchChangesAndUpdateObservedStore__block_invoke_92(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  void *v7;
  int v8;
  id v9;

  v9 = a2;
  v5 = *(void **)(a1 + 32);
  v6 = a3;
  objc_msgSend(v5, "recordType");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "isEqualToString:", v7);

  if (v8)
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v9);

}

void __56__AXSSCloudKitHelper_fetchChangesAndUpdateObservedStore__block_invoke_2_94(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, char a5)
{
  id v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  _QWORD block[5];
  id v12;
  id v13;
  id v14;
  id v15;

  v7 = a3;
  v8 = v7;
  if ((a5 & 1) == 0)
  {
    v9 = *(_QWORD *)(a1 + 32);
    v10 = *(NSObject **)(v9 + 88);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __56__AXSSCloudKitHelper_fetchChangesAndUpdateObservedStore__block_invoke_3;
    block[3] = &unk_1E5F99318;
    block[4] = v9;
    v12 = v7;
    v13 = *(id *)(a1 + 40);
    v14 = *(id *)(a1 + 48);
    v15 = *(id *)(a1 + 56);
    dispatch_async(v10, block);

  }
}

uint64_t __56__AXSSCloudKitHelper_fetchChangesAndUpdateObservedStore__block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "processAccumulatedChangesForServerChangeToken:withAccumulatedUpdates:andDeletes:inTransaction:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
}

- (void)setIsProtectedDataAvailable:(BOOL)a3
{
  _BOOL4 isProtectedDataAvailable;
  _QWORD block[5];

  isProtectedDataAvailable = self->_isProtectedDataAvailable;
  self->_isProtectedDataAvailable = a3;
  if (!isProtectedDataAvailable && a3)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __50__AXSSCloudKitHelper_setIsProtectedDataAvailable___block_invoke;
    block[3] = &unk_1E5F98868;
    block[4] = self;
    dispatch_async(MEMORY[0x1E0C80D38], block);
  }
}

_BYTE *__50__AXSSCloudKitHelper_setIsProtectedDataAvailable___block_invoke(uint64_t a1)
{
  _BYTE *result;

  result = *(_BYTE **)(a1 + 32);
  if (result[17])
    return (_BYTE *)objc_msgSend(result, "_processAccumulatedQueueData");
  return result;
}

- (void)_processAccumulatedQueueData
{
  OUTLINED_FUNCTION_0(&dword_1AF5CC000, a1, a3, "Assertion failed: %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)processAccumulatedChangesForServerChangeToken:(id)a3 withAccumulatedUpdates:(id)a4 andDeletes:(id)a5 inTransaction:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  id v18;
  AXSSCloudKitHelperManagedObjectContext *v19;
  void *v20;
  AXSSCloudKitHelperManagedObjectContext *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  NSObject *v30;
  void *v31;
  NSObject *v32;
  _QWORD v33[5];
  id v34;
  AXSSCloudKitHelperManagedObjectContext *v35;
  uint64_t *v36;
  __int128 *p_buf;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  char v41;
  __int128 buf;
  uint64_t v43;
  uint64_t (*v44)(uint64_t, uint64_t);
  void (*v45)(uint64_t);
  id v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (-[AXSSCloudKitHelper isProtectedDataAvailable](self, "isProtectedDataAvailable"))
  {
    -[AXSSCloudKitHelper observedCoordinator](self, "observedCoordinator");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      -[AXSSCloudKitHelper observedCoordinator](self, "observedCoordinator");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "persistentStores");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "count");

      if (v17)
      {
        v38 = 0;
        v39 = &v38;
        v40 = 0x2020000000;
        v41 = 0;
        *(_QWORD *)&buf = 0;
        *((_QWORD *)&buf + 1) = &buf;
        v43 = 0x3032000000;
        v44 = __Block_byref_object_copy__4;
        v45 = __Block_byref_object_dispose__4;
        v46 = 0;
        v18 = v13;
        v19 = -[AXSSCloudKitHelperManagedObjectContext initWithConcurrencyType:]([AXSSCloudKitHelperManagedObjectContext alloc], "initWithConcurrencyType:", 1);
        -[AXSSCloudKitHelper observedCoordinator](self, "observedCoordinator");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        -[AXSSCloudKitHelperManagedObjectContext setPersistentStoreCoordinator:](v19, "setPersistentStoreCoordinator:", v20);

        v33[0] = MEMORY[0x1E0C809B0];
        v33[1] = 3221225472;
        v33[2] = __116__AXSSCloudKitHelper_processAccumulatedChangesForServerChangeToken_withAccumulatedUpdates_andDeletes_inTransaction___block_invoke;
        v33[3] = &unk_1E5F99368;
        v33[4] = self;
        v34 = v11;
        v21 = v19;
        v35 = v21;
        v36 = &v38;
        p_buf = &buf;
        -[AXSSCloudKitHelperManagedObjectContext performBlockAndWait:](v21, "performBlockAndWait:", v33);
        -[AXSSCloudKitHelper processRecordDeletionsFromServer:](self, "processRecordDeletionsFromServer:", v12);
        if (*((_BYTE *)v39 + 24))
        {
          -[AXSSCloudKitHelper observedStore](self, "observedStore");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "metadata");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = (void *)objc_msgSend(v23, "mutableCopy");

          if (!v24)
          {
            objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
          }
          objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v10, 1, 0);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          -[AXSSCloudKitHelper serverChangeTokenMetadataKey](self, "serverChangeTokenMetadataKey");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "setObject:forKey:", v25, v26);

          -[AXSSCloudKitHelper observedStore](self, "observedStore");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "setMetadata:", v24);

          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Finished importing changes for token: %@, metadata %@"), v10, v24);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          -[AXSSCloudKitHelper logMessage:](self, "logMessage:", v28);

          objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "postNotificationName:object:", CFSTR("AXSSVoiceOverPunctuationCloudKitUpdateNotification"), 0);

        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to process changes for token (%@):\n%@"), v10, *(_QWORD *)(*((_QWORD *)&buf + 1) + 40));
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          -[AXSSCloudKitHelper logMessage:](self, "logMessage:", v24);
        }

        -[AXSSCloudKitHelper processLocalChangesAndPush](self, "processLocalChangesAndPush");
        _Block_object_dispose(&buf, 8);

        _Block_object_dispose(&v38, 8);
        goto LABEL_19;
      }
      AXLogPunctuationStorage();
      v32 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
        -[AXSSCloudKitHelper processAccumulatedChangesForServerChangeToken:withAccumulatedUpdates:andDeletes:inTransaction:].cold.2();
    }
    else
    {
      AXLogPunctuationStorage();
      v32 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
        -[AXSSCloudKitHelper processAccumulatedChangesForServerChangeToken:withAccumulatedUpdates:andDeletes:inTransaction:].cold.1();
    }

    goto LABEL_19;
  }
  AXLogPunctuationStorage();
  v30 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
  {
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v10;
    _os_log_impl(&dword_1AF5CC000, v30, OS_LOG_TYPE_INFO, "Device is locked, queueing change: %@", (uint8_t *)&buf, 0xCu);
  }

  v31 = (void *)objc_opt_new();
  objc_msgSend(v31, "setServerChangeToken:", v10);
  objc_msgSend(v31, "setRecordsToUpdate:", v11);
  objc_msgSend(v31, "setRecordIDsToDelete:", v12);
  objc_msgSend(v31, "setOpenTransaction:", v13);
  -[NSMutableArray addObject:](self->_accumulatedQueuedData, "addObject:", v31);

LABEL_19:
}

void __116__AXSSCloudKitHelper_processAccumulatedChangesForServerChangeToken_withAccumulatedUpdates_andDeletes_inTransaction___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  uint64_t v4;
  char v5;
  id obj;

  v2 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(*(id *)(a1 + 32), "processServerUpdateChanges:moc:recordNameToManagedObject:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), v2);
  v3 = *(void **)(a1 + 48);
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  obj = *(id *)(v4 + 40);
  v5 = objc_msgSend(v3, "save:", &obj);
  objc_storeStrong((id *)(v4 + 40), obj);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = v5;

}

- (void)processLocalChangesAndPush
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __48__AXSSCloudKitHelper_processLocalChangesAndPush__block_invoke;
  v2[3] = &unk_1E5F99488;
  v2[4] = self;
  -[AXSSCloudKitHelper retrieveLocalChangesForCloud:](self, "retrieveLocalChangesForCloud:", v2);
}

void __48__AXSSCloudKitHelper_processLocalChangesAndPush__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  id v15;
  uint64_t v16;
  NSObject *v17;
  NSObject *v18;
  NSObject *v19;
  _QWORD v20[4];
  NSObject *v21;
  id v22;
  uint64_t v23;
  id v24;
  uint8_t buf[4];
  NSObject *v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (objc_msgSend(v7, "count") || objc_msgSend(v8, "count"))
  {
    v10 = *(void **)(a1 + 32);
    v11 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v10, "recordType");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringWithFormat:", CFSTR("com.apple.axcloudkithelper.export.%@"), v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __48__AXSSCloudKitHelper_processLocalChangesAndPush__block_invoke_107;
    v20[3] = &unk_1E5F99460;
    v14 = v7;
    v21 = v14;
    v15 = v8;
    v16 = *(_QWORD *)(a1 + 32);
    v22 = v15;
    v23 = v16;
    v24 = v9;
    objc_msgSend(v10, "openTransactionWithLabel:andExecuteWorkBlock:", v13, v20);

    AXLogPunctuationStorage();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      v26 = v14;
      v27 = 2112;
      v28 = v15;
      _os_log_impl(&dword_1AF5CC000, v17, OS_LOG_TYPE_INFO, "CloudKit: save %@, %@", buf, 0x16u);
    }

    v18 = v21;
  }
  else
  {
    AXLogPunctuationStorage();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      v19 = *(NSObject **)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      v26 = v19;
      _os_log_impl(&dword_1AF5CC000, v18, OS_LOG_TYPE_INFO, "No changes needed for cloud kit: %@", buf, 0xCu);
    }
  }

}

void __48__AXSSCloudKitHelper_processLocalChangesAndPush__block_invoke_107(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  int8x16_t v9;
  _QWORD v10[4];
  int8x16_t v11;
  _QWORD v12[5];
  id v13;
  uint8_t buf[4];
  void *v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C94F10]), "initWithRecordsToSave:recordIDsToDelete:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  objc_msgSend(v2, "setSavePolicy:", 1);
  objc_msgSend(v2, "setAtomic:", 0);
  objc_msgSend(v2, "setPerRecordDeleteBlock:", &__block_literal_global_109);
  v3 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __48__AXSSCloudKitHelper_processLocalChangesAndPush__block_invoke_110;
  v12[3] = &unk_1E5F993D0;
  v4 = *(void **)(a1 + 56);
  v12[4] = *(_QWORD *)(a1 + 48);
  v13 = v4;
  objc_msgSend(v2, "setPerRecordSaveBlock:", v12);
  objc_msgSend(v2, "setPerRecordProgressBlock:", &__block_literal_global_115);
  v10[0] = v3;
  v10[1] = 3221225472;
  v10[2] = __48__AXSSCloudKitHelper_processLocalChangesAndPush__block_invoke_116;
  v10[3] = &unk_1E5F99438;
  v9 = *(int8x16_t *)(a1 + 40);
  v5 = (id)v9.i64[0];
  v11 = vextq_s8(v9, v9, 8uLL);
  objc_msgSend(v2, "setModifyRecordsCompletionBlock:", v10);
  AXLogPunctuationStorage();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138412546;
    v15 = v2;
    v16 = 2112;
    v17 = v7;
    _os_log_impl(&dword_1AF5CC000, v6, OS_LOG_TYPE_INFO, "CloudKit: add operator for %@, %@", buf, 0x16u);
  }

  objc_msgSend(*(id *)(a1 + 48), "database");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addOperation:", v2);

}

void __48__AXSSCloudKitHelper_processLocalChangesAndPush__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  NSObject *v6;
  int v7;
  id v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  v5 = a3;
  AXLogPunctuationStorage();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = 138412546;
    v8 = v4;
    v9 = 2112;
    v10 = v5;
    _os_log_impl(&dword_1AF5CC000, v6, OS_LOG_TYPE_INFO, "Delete record: %@, err: %@", (uint8_t *)&v7, 0x16u);
  }

}

void __48__AXSSCloudKitHelper_processLocalChangesAndPush__block_invoke_110(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  uint8_t buf[4];
  id v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  AXLogPunctuationStorage();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    v12 = v6;
    v13 = 2112;
    v14 = v7;
    _os_log_impl(&dword_1AF5CC000, v8, OS_LOG_TYPE_INFO, "Completion record: %@, err: %@", buf, 0x16u);
  }

  if (v7)
  {
    v9 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to write record: %@\n%@"), v6, v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "logMessage:", v10);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

void __48__AXSSCloudKitHelper_processLocalChangesAndPush__block_invoke_113(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v2 = a2;
  AXLogPunctuationStorage();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    __48__AXSSCloudKitHelper_processLocalChangesAndPush__block_invoke_113_cold_1((uint64_t)v2, v3, v4, v5, v6, v7, v8, v9);

}

void __48__AXSSCloudKitHelper_processLocalChangesAndPush__block_invoke_116(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  NSObject *v11;
  dispatch_time_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t);
  void *v18;
  uint64_t v19;
  id v20;
  uint8_t buf[4];
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  AXLogPunctuationStorage();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v9)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      __48__AXSSCloudKitHelper_processLocalChangesAndPush__block_invoke_116_cold_1();
  }
  else
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v22 = v7;
      _os_log_impl(&dword_1AF5CC000, v11, OS_LOG_TYPE_INFO, "CloudKit local changes complete: save: %@", buf, 0xCu);
    }

    AXLogPunctuationStorage();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v22 = v8;
      _os_log_impl(&dword_1AF5CC000, v11, OS_LOG_TYPE_INFO, "CloudKit local changes complete: delete: %@", buf, 0xCu);
    }
  }

  v12 = dispatch_time(0, 0);
  v15 = MEMORY[0x1E0C809B0];
  v16 = 3221225472;
  v17 = __48__AXSSCloudKitHelper_processLocalChangesAndPush__block_invoke_117;
  v18 = &unk_1E5F98988;
  v13 = *(void **)(a1 + 40);
  v19 = *(_QWORD *)(a1 + 32);
  v20 = v13;
  dispatch_after(v12, MEMORY[0x1E0C80D38], &v15);
  objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter", v15, v16, v17, v18, v19);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "postNotificationName:object:", CFSTR("AXSSVoiceOverPunctuationCloudKitUpdateNotification"), 0);

}

uint64_t __48__AXSSCloudKitHelper_processLocalChangesAndPush__block_invoke_117(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  AXLogPunctuationStorage();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __48__AXSSCloudKitHelper_processLocalChangesAndPush__block_invoke_117_cold_1(a1, v2, v3, v4, v5, v6, v7, v8);

  return objc_msgSend(*(id *)(a1 + 32), "clearRecordsForPurging:", *(_QWORD *)(a1 + 40));
}

- (void)logMessage:(id)a3
{
  id v3;
  NSObject *v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  AXLogPunctuationStorage();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_1AF5CC000, v4, OS_LOG_TYPE_DEFAULT, "%@", (uint8_t *)&v5, 0xCu);
  }

}

- (BOOL)_setupPushConnection:(id *)a3
{
  id v5;
  void *v6;
  APSConnection *v7;
  APSConnection *apsConnection;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  APSConnection *v13;
  id v14;
  BOOL v15;
  void *v16;
  void *v17;
  int v19;
  APSConnection *v20;
  uint64_t v21;
  const __CFString *v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  v5 = objc_alloc(MEMORY[0x1E0CFE148]);
  -[AXSSCloudKitHelper apsEnvironment](self, "apsEnvironment");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (APSConnection *)objc_msgSend(v5, "initWithEnvironmentName:namedDelegatePort:queue:", v6, *MEMORY[0x1E0CFE118], self->_cloudkitQueue);
  apsConnection = self->_apsConnection;
  self->_apsConnection = v7;

  if (self->_apsConnection
    && (-[AXSSCloudKitHelper cloudKitPushTopic](self, "cloudKitPushTopic"),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        v9,
        v9))
  {
    -[AXSSCloudKitHelper cloudKitPushTopic](self, "cloudKitPushTopic");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = v10;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[APSConnection _setEnabledTopics:](self->_apsConnection, "_setEnabledTopics:", v11);

    -[APSConnection setDelegate:](self->_apsConnection, "setDelegate:", self);
    AXLogPunctuationStorage();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      v13 = self->_apsConnection;
      v19 = 138412290;
      v20 = v13;
      _os_log_impl(&dword_1AF5CC000, v12, OS_LOG_TYPE_INFO, "Setup push connection: %@", (uint8_t *)&v19, 0xCu);
    }

    v14 = 0;
    v15 = 1;
  }
  else
  {
    v16 = (void *)MEMORY[0x1E0CB35C8];
    v21 = *MEMORY[0x1E0CB2D68];
    v22 = CFSTR("Failed to create APSConnection (got nil from init).");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v22, &v21, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "errorWithDomain:code:userInfo:", CFSTR("AXCloudKitErrorDomain"), 1, v17);
    v14 = (id)objc_claimAutoreleasedReturnValue();

    v15 = 0;
    if (a3 && v14)
    {
      v14 = objc_retainAutorelease(v14);
      v15 = 0;
      *a3 = v14;
    }
  }

  return v15;
}

- (void)connection:(id)a3 didReceivePublicToken:(id)a4
{
  id v5;

  if (self->_apsConnection == a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Connection:\n%@\nSent public token: %@"), a3, a4);
    v5 = (id)objc_claimAutoreleasedReturnValue();
    -[AXSSCloudKitHelper logMessage:](self, "logMessage:", v5);

  }
}

- (void)connection:(id)a3 didReceiveToken:(id)a4 forTopic:(id)a5 identifier:(id)a6
{
  void *v7;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Connection:\n%@\nSent token: %@\nFor topic: %@\nWith identifier: %@"), a3, a4, a5, a6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXSSCloudKitHelper logMessage:](self, "logMessage:", v7);

}

- (void)connection:(id)a3 didReceiveMessageForTopic:(id)a4 userInfo:(id)a5
{
  id v8;
  id v9;
  void *v10;
  APSConnection *v11;
  void *v12;
  APSConnection *apsConnection;
  void *v14;
  int v15;
  void *v16;
  NSObject *cloudkitQueue;
  _QWORD block[5];

  v8 = a4;
  v9 = a5;
  v10 = (void *)MEMORY[0x1E0CB3940];
  v11 = (APSConnection *)a3;
  objc_msgSend(v10, "stringWithFormat:", CFSTR("Connection:\n%@\nMessage for topic: %@\nuserInfo: %@"), v11, v8, v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXSSCloudKitHelper logMessage:](self, "logMessage:", v12);

  apsConnection = self->_apsConnection;
  if (apsConnection == v11)
  {
    -[AXSSCloudKitHelper cloudKitPushTopic](self, "cloudKitPushTopic");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v8, "isEqualToString:", v14);

    if (v15)
    {
      objc_msgSend(MEMORY[0x1E0C94F40], "notificationFromRemoteNotificationDictionary:", v9);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v16, "notificationType") == 2)
      {
        cloudkitQueue = self->_cloudkitQueue;
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __68__AXSSCloudKitHelper_connection_didReceiveMessageForTopic_userInfo___block_invoke;
        block[3] = &unk_1E5F98868;
        block[4] = self;
        dispatch_async(cloudkitQueue, block);
      }

    }
  }

}

uint64_t __68__AXSSCloudKitHelper_connection_didReceiveMessageForTopic_userInfo___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "fetchChangesAndUpdateObservedStore");
}

- (void)managedObjectContextDidSave:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  uint64_t v20;
  void *v21;
  NSObject *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t k;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  NSObject *v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  void *v37;
  NSObject *v38;
  NSObject *v39;
  NSObject *v40;
  void *v41;
  id obj;
  id v43;
  id v44;
  _QWORD v45[4];
  id v46;
  id v47;
  AXSSCloudKitHelper *v48;
  _QWORD *v49;
  _QWORD v50[5];
  NSObject *v51;
  id v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  _QWORD v65[3];
  char v66;
  _BYTE v67[128];
  uint8_t v68[128];
  uint8_t buf[4];
  id v70;
  _BYTE v71[128];
  uint64_t v72;

  v72 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v41 = v4;
  if (self->_observeLocalDatabaseChanges)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[%@] Managed object context saved: %@"), self, v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXSSCloudKitHelper logMessage:](self, "logMessage:", v5);

    objc_msgSend(v41, "object");
    v40 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Responding to context save: %@"), v41);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[AXSSCloudKitHelper logMessage:](self, "logMessage:", v6);

      v44 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v65[0] = 0;
      v65[1] = v65;
      v65[2] = 0x2020000000;
      v66 = 0;
      v61 = 0u;
      v62 = 0u;
      v63 = 0u;
      v64 = 0u;
      objc_msgSend(v41, "userInfo");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectForKey:", *MEMORY[0x1E0C97878]);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v61, v71, 16);
      if (v9)
      {
        v10 = *(_QWORD *)v62;
        do
        {
          for (i = 0; i != v9; ++i)
          {
            if (*(_QWORD *)v62 != v10)
              objc_enumerationMutation(v8);
            v12 = *(_QWORD *)(*((_QWORD *)&v61 + 1) + 8 * i);
            if (-[AXSSCloudKitHelper shouldExportManagedObject:](self, "shouldExportManagedObject:", v12))
            {
              -[AXSSCloudKitHelper createCKRecordFromObject:](self, "createCKRecordFromObject:", v12);
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v44, "addObject:", v13);

            }
            AXLogPunctuationStorage();
            v14 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              v70 = v44;
              _os_log_debug_impl(&dword_1AF5CC000, v14, OS_LOG_TYPE_DEBUG, "Inserting: %@", buf, 0xCu);
            }

          }
          v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v61, v71, 16);
        }
        while (v9);
      }

      v59 = 0u;
      v60 = 0u;
      v57 = 0u;
      v58 = 0u;
      objc_msgSend(v41, "userInfo");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "objectForKey:", *MEMORY[0x1E0C97A20]);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v57, v68, 16);
      if (v17)
      {
        v18 = *(_QWORD *)v58;
        do
        {
          for (j = 0; j != v17; ++j)
          {
            if (*(_QWORD *)v58 != v18)
              objc_enumerationMutation(v16);
            v20 = *(_QWORD *)(*((_QWORD *)&v57 + 1) + 8 * j);
            if (-[AXSSCloudKitHelper shouldExportManagedObject:](self, "shouldExportManagedObject:", v20))
            {
              -[AXSSCloudKitHelper createCKRecordFromObject:](self, "createCKRecordFromObject:", v20);
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v44, "addObject:", v21);

            }
            AXLogPunctuationStorage();
            v22 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              v70 = v44;
              _os_log_debug_impl(&dword_1AF5CC000, v22, OS_LOG_TYPE_DEBUG, "Updating: %@", buf, 0xCu);
            }

          }
          v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v57, v68, 16);
        }
        while (v17);
      }

      v43 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v55 = 0u;
      v56 = 0u;
      v54 = 0u;
      v53 = 0u;
      objc_msgSend(v41, "userInfo");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "objectForKey:", *MEMORY[0x1E0C97840]);
      obj = (id)objc_claimAutoreleasedReturnValue();

      v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v53, v67, 16);
      if (v24)
      {
        v25 = *(_QWORD *)v54;
        do
        {
          for (k = 0; k != v24; ++k)
          {
            if (*(_QWORD *)v54 != v25)
              objc_enumerationMutation(obj);
            objc_msgSend(*(id *)(*((_QWORD *)&v53 + 1) + 8 * k), "valueForKey:", CFSTR("uuid"));
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            if (v27)
            {
              v28 = objc_alloc(MEMORY[0x1E0C95070]);
              objc_msgSend(v27, "UUIDString");
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              -[AXSSCloudKitHelper recordZone](self, "recordZone");
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v30, "zoneID");
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              v32 = (void *)objc_msgSend(v28, "initWithRecordName:zoneID:", v29, v31);

              objc_msgSend(v43, "addObject:", v32);
            }
            AXLogPunctuationStorage();
            v33 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              v70 = v43;
              _os_log_debug_impl(&dword_1AF5CC000, v33, OS_LOG_TYPE_DEBUG, "Deleting: %@", buf, 0xCu);
            }

          }
          v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v53, v67, 16);
        }
        while (v24);
      }

      v34 = objc_msgSend(v44, "count");
      v35 = MEMORY[0x1E0C809B0];
      if (!v34)
      {
        v50[0] = MEMORY[0x1E0C809B0];
        v50[1] = 3221225472;
        v50[2] = __50__AXSSCloudKitHelper_managedObjectContextDidSave___block_invoke;
        v50[3] = &unk_1E5F98840;
        v50[4] = self;
        v51 = v40;
        v52 = v44;
        -[NSObject performBlockAndWait:](v51, "performBlockAndWait:", v50);

      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Finished processing notification with records to save: %@"), v44);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      -[AXSSCloudKitHelper logMessage:](self, "logMessage:", v36);

      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Records to delete: %@"), v43);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      -[AXSSCloudKitHelper logMessage:](self, "logMessage:", v37);

      if (objc_msgSend(v44, "count") || objc_msgSend(v43, "count"))
      {
        v45[0] = v35;
        v45[1] = 3221225472;
        v45[2] = __50__AXSSCloudKitHelper_managedObjectContextDidSave___block_invoke_2;
        v45[3] = &unk_1E5F99500;
        v46 = v44;
        v48 = self;
        v49 = v65;
        v47 = v43;
        -[AXSSCloudKitHelper openTransactionWithLabel:andExecuteWorkBlock:](self, "openTransactionWithLabel:andExecuteWorkBlock:", CFSTR("com.apple.axcloudkithelper.export"), v45);

      }
      _Block_object_dispose(v65, 8);

    }
    v38 = v40;
  }
  else
  {
    AXLogPunctuationStorage();
    v39 = objc_claimAutoreleasedReturnValue();
    v38 = v39;
    if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG))
    {
      -[AXSSCloudKitHelper managedObjectContextDidSave:].cold.1(v39);
      v38 = v39;
    }
  }

}

void __50__AXSSCloudKitHelper_managedObjectContextDidSave___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  id v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "managedObjectClass"), "fetchRequest");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("inCloud == NO"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setPredicate:", v3);

  v4 = *(void **)(a1 + 40);
  v18 = 0;
  objc_msgSend(v4, "executeFetchRequest:error:", v2, &v18);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v18;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v15 != v10)
          objc_enumerationMutation(v7);
        v12 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i);
        if (objc_msgSend(*(id *)(a1 + 32), "shouldExportManagedObject:", v12, (_QWORD)v14))
        {
          objc_msgSend(*(id *)(a1 + 32), "createCKRecordFromObject:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 48), "addObject:", v13);

        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
    }
    while (v9);
  }

}

void __50__AXSSCloudKitHelper_managedObjectContextDidSave___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(id *, uint64_t, uint64_t, uint64_t);
  void *v12;
  id v13;
  uint64_t v14;
  id v15;
  _QWORD v16[5];

  v3 = a2;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C94F10]), "initWithRecordsToSave:recordIDsToDelete:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  objc_msgSend(v4, "setSavePolicy:", 1);
  v5 = MEMORY[0x1E0C809B0];
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
  {
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __50__AXSSCloudKitHelper_managedObjectContextDidSave___block_invoke_3;
    v16[3] = &unk_1E5F994B0;
    v16[4] = *(_QWORD *)(a1 + 48);
    objc_msgSend(v4, "setPerRecordSaveBlock:", v16);
  }
  v9 = v5;
  v10 = 3221225472;
  v11 = __50__AXSSCloudKitHelper_managedObjectContextDidSave___block_invoke_4;
  v12 = &unk_1E5F994D8;
  v6 = *(_QWORD *)(a1 + 48);
  v13 = v3;
  v14 = v6;
  v15 = *(id *)(a1 + 32);
  v7 = v3;
  objc_msgSend(v4, "setModifyRecordsCompletionBlock:", &v9);
  objc_msgSend(*(id *)(a1 + 48), "database", v9, v10, v11, v12);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addOperation:", v4);

}

void __50__AXSSCloudKitHelper_managedObjectContextDidSave___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  void *v4;
  id v5;

  if (a4)
  {
    v4 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to write record: %@\n%@"), a3, a4);
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "logMessage:", v5);

  }
}

void __50__AXSSCloudKitHelper_managedObjectContextDidSave___block_invoke_4(id *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  id v8;
  void *v9;
  id v10;
  void *v11;
  AXSSCloudKitHelperManagedObjectContext *v12;
  void *v13;
  id v14;
  id v15;
  AXSSCloudKitHelperManagedObjectContext *v16;
  _QWORD v17[4];
  id v18;
  id v19;
  AXSSCloudKitHelperManagedObjectContext *v20;

  v8 = a1[5];
  v9 = (void *)MEMORY[0x1E0CB3940];
  v10 = a1[4];
  objc_msgSend(v9, "stringWithFormat:", CFSTR("Modify records finished: %@\n%@\n%@"), a2, a3, a4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "logMessage:", v11);

  v12 = -[AXSSCloudKitHelperManagedObjectContext initWithConcurrencyType:]([AXSSCloudKitHelperManagedObjectContext alloc], "initWithConcurrencyType:", 1);
  objc_msgSend(a1[5], "observedCoordinator");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXSSCloudKitHelperManagedObjectContext setPersistentStoreCoordinator:](v12, "setPersistentStoreCoordinator:", v13);

  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __50__AXSSCloudKitHelper_managedObjectContextDidSave___block_invoke_5;
  v17[3] = &unk_1E5F98840;
  v14 = a1[6];
  v15 = a1[5];
  v18 = v14;
  v19 = v15;
  v20 = v12;
  v16 = v12;
  -[AXSSCloudKitHelperManagedObjectContext performBlockAndWait:](v16, "performBlockAndWait:", v17);

}

void __50__AXSSCloudKitHelper_managedObjectContextDidSave___block_invoke_5(uint64_t a1)
{
  id v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  void *v20;
  int v21;
  id v22;
  void *v23;
  void *v24;
  uint64_t v25;
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  id v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v3 = *(id *)(a1 + 32);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v33;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v33 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v32 + 1) + 8 * i), "recordID");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "recordName");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v2, "addObject:", v9);

      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
    }
    while (v5);
  }

  objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "managedObjectClass"), "fetchRequest");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("uuid IN (%@)"), v2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setPredicate:", v11);

  v12 = *(void **)(a1 + 48);
  v31 = 0;
  objc_msgSend(v12, "executeFetchRequest:error:", v10, &v31);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v31;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v15 = v13;
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v27, v36, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v28;
    do
    {
      for (j = 0; j != v17; ++j)
      {
        if (*(_QWORD *)v28 != v18)
          objc_enumerationMutation(v15);
        objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * j), "setInCloud:", 1);
      }
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v27, v36, 16);
    }
    while (v17);
  }

  v20 = *(void **)(a1 + 48);
  v26 = v14;
  v21 = objc_msgSend(v20, "save:", &v26);
  v22 = v26;

  v23 = *(void **)(a1 + 40);
  if (v21)
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Marked histories uploaded: %@"), v15, v25);
  else
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to mark histories uploaded:\n%@\n%@"), v15, v22);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "logMessage:", v24);

}

- (void)_setObservedStore:(id)a3 observedCoordinator:(id)a4
{
  NSPersistentStoreCoordinator *v6;
  NSPersistentStoreCoordinator *observedCoordinator;

  v6 = (NSPersistentStoreCoordinator *)a4;
  objc_storeWeak((id *)&self->_observedStore, a3);
  observedCoordinator = self->_observedCoordinator;
  self->_observedCoordinator = v6;

}

- (void)_setDatabase:(id)a3
{
  objc_storeStrong((id *)&self->_database, a3);
}

- (void)_setContainer:(id)a3
{
  objc_storeStrong((id *)&self->_container, a3);
}

- (void)_setApsConnection:(id)a3
{
  objc_storeStrong((id *)&self->_apsConnection, a3);
}

- (NSPersistentStore)observedStore
{
  return (NSPersistentStore *)objc_loadWeakRetained((id *)&self->_observedStore);
}

- (NSPersistentStoreCoordinator)observedCoordinator
{
  return self->_observedCoordinator;
}

- (NSManagedObjectContext)managedObjectContext
{
  return self->_managedObjectContext;
}

- (NSString)containerIdentifier
{
  return self->_containerIdentifier;
}

- (CKContainer)container
{
  return self->_container;
}

- (CKRecordZone)recordZone
{
  return self->_recordZone;
}

- (CKRecordZoneSubscription)zoneSubscription
{
  return self->_zoneSubscription;
}

- (CKDatabase)database
{
  return self->_database;
}

- (OS_dispatch_queue)cloudkitQueue
{
  return self->_cloudkitQueue;
}

- (OS_dispatch_semaphore)cloudKitQueueSemaphore
{
  return self->_cloudKitQueueSemaphore;
}

- (APSConnection)apsConnection
{
  return self->_apsConnection;
}

- (NSError)lastInitializationError
{
  return self->_lastInitializationError;
}

- (NSURL)largeBlobDirectoryURL
{
  return self->_largeBlobDirectoryURL;
}

- (BOOL)observeLocalDatabaseChanges
{
  return self->_observeLocalDatabaseChanges;
}

- (void)setObserveLocalDatabaseChanges:(BOOL)a3
{
  self->_observeLocalDatabaseChanges = a3;
}

- (BOOL)isProtectedDataAvailable
{
  return self->_isProtectedDataAvailable;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_largeBlobDirectoryURL, 0);
  objc_storeStrong((id *)&self->_lastInitializationError, 0);
  objc_storeStrong((id *)&self->_apsConnection, 0);
  objc_storeStrong((id *)&self->_cloudKitQueueSemaphore, 0);
  objc_storeStrong((id *)&self->_cloudkitQueue, 0);
  objc_storeStrong((id *)&self->_database, 0);
  objc_storeStrong((id *)&self->_zoneSubscription, 0);
  objc_storeStrong((id *)&self->_recordZone, 0);
  objc_storeStrong((id *)&self->_container, 0);
  objc_storeStrong((id *)&self->_containerIdentifier, 0);
  objc_storeStrong((id *)&self->_managedObjectContext, 0);
  objc_storeStrong((id *)&self->_observedCoordinator, 0);
  objc_destroyWeak((id *)&self->_observedStore);
  objc_storeStrong((id *)&self->_accumulatedQueuedData, 0);
}

- (id)recordType
{
  id result;

  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_7_0();
  return result;
}

- (id)testRecordForSchemaCreation:(id)a3
{
  id result;

  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_7_0();
  return result;
}

- (id)createCKRecordFromObject:(id)a3
{
  id result;

  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_7_0();
  return result;
}

- (void)processServerUpdateChanges:(id)a3 moc:(id)a4 recordNameToManagedObject:(id)a5
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_4_2();
  OUTLINED_FUNCTION_1_1();
}

- (void)processRecordDeletionsFromServer:(id)a3
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_4_2();
  OUTLINED_FUNCTION_1_1();
}

- (void)retrieveLocalChangesForCloud:(id)a3
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_4_2();
  OUTLINED_FUNCTION_1_1();
}

- (void)clearRecordsForPurging:(id)a3
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_4_2();
  OUTLINED_FUNCTION_1_1();
}

- (id)apsEnvironment
{
  id result;

  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_7_0();
  return result;
}

void __56__AXSSCloudKitHelper_fetchChangesAndUpdateObservedStore__block_invoke_2_cold_1(void *a1, NSObject *a2)
{
  void *v3;
  uint8_t v4[24];
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "recordType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_8();
  _os_log_debug_impl(&dword_1AF5CC000, a2, OS_LOG_TYPE_DEBUG, "recording remote change: %@", v4, 0xCu);

}

- (void)processAccumulatedChangesForServerChangeToken:withAccumulatedUpdates:andDeletes:inTransaction:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0(&dword_1AF5CC000, v0, v1, "No coordinator at this time: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)processAccumulatedChangesForServerChangeToken:withAccumulatedUpdates:andDeletes:inTransaction:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0(&dword_1AF5CC000, v0, v1, "The observed coordinator has no persistent stores: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __48__AXSSCloudKitHelper_processLocalChangesAndPush__block_invoke_113_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6_1(&dword_1AF5CC000, a2, a3, "Progress: %f, %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __48__AXSSCloudKitHelper_processLocalChangesAndPush__block_invoke_116_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0(&dword_1AF5CC000, v0, v1, "CloudKit local change push error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __48__AXSSCloudKitHelper_processLocalChangesAndPush__block_invoke_117_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6_1(&dword_1AF5CC000, a2, a3, "%@ Purged these records %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)managedObjectContextDidSave:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1AF5CC000, log, OS_LOG_TYPE_DEBUG, "Ignore local changes", v1, 2u);
}

@end
