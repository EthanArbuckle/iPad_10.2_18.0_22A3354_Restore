@implementation HDDatabase

- (void)contentProtectionStateChanged:(int64_t)a3 previousState:(int64_t)a4
{
  NSObject *protectedDataQueue;
  _QWORD block[7];

  protectedDataQueue = self->_protectedDataQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __58__HDDatabase_contentProtectionStateChanged_previousState___block_invoke;
  block[3] = &unk_1E6CF4190;
  block[4] = self;
  block[5] = a3;
  block[6] = a4;
  dispatch_sync(protectedDataQueue, block);
}

- (void)performAsynchronously:(id)a3
{
  -[NSOperationQueue addOperationWithBlock:](self->_asynchronousOperationQueue, "addOperationWithBlock:", a3);
}

- (BOOL)isProtectedDataAvailable
{
  -[HDDatabase _waitForContentProtectionObservationSetup]((uint64_t)self);
  return -[HDDatabase _protectedDataState]((uint64_t)self) != 2;
}

- (uint64_t)_protectedDataState
{
  os_unfair_lock_s *v2;
  uint64_t v3;

  if (!a1)
    return 0;
  v2 = (os_unfair_lock_s *)(a1 + 80);
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
  v3 = *(_QWORD *)(a1 + 96);
  os_unfair_lock_unlock(v2);
  if (v3 == 2)
    objc_msgSend(*(id *)(a1 + 400), "recheckContentProtectionState");
  return v3;
}

- (void)addProtectedDataObserver:(id)a3
{
  -[HKObserverSet registerObserver:](self->_protectedDataObservers, "registerObserver:", a3);
}

- (os_unfair_lock_s)_isDatabaseValidWithError:(os_unfair_lock_s *)result
{
  os_unfair_lock_s *v3;
  os_unfair_lock_s *v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  const __CFString *v8;
  int v9;
  os_unfair_lock_s *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v3 = result;
    v4 = result + 2;
    os_unfair_lock_lock(result + 2);
    v5 = *(_QWORD *)&v3[4]._os_unfair_lock_opaque;
    os_unfair_lock_unlock(v4);
    if (v5 == 5)
    {
      v7 = (void *)MEMORY[0x1E0CB35C8];
      v8 = CFSTR("Database invalidated");
LABEL_8:
      objc_msgSend(v7, "hk_assignError:code:description:", a2, 1500, v8);
      return 0;
    }
    if (!v5)
    {
      _HKInitializeLogging();
      v6 = *MEMORY[0x1E0CB52B0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_FAULT))
      {
        v9 = 138543362;
        v10 = v3;
        _os_log_fault_impl(&dword_1B7802000, v6, OS_LOG_TYPE_FAULT, "%{public}@: Attempt to access the database before calling its ready. This represents a bug in the caller; clie"
          "nts should wait on database availability before attempting to open transactions.",
          (uint8_t *)&v9,
          0xCu);
      }
      v7 = (void *)MEMORY[0x1E0CB35C8];
      v8 = CFSTR("Database not yet available");
      goto LABEL_8;
    }
    return (os_unfair_lock_s *)1;
  }
  return result;
}

- (void)removeProtectedDataObserver:(id)a3
{
  -[HKObserverSet unregisterObserver:](self->_protectedDataObservers, "unregisterObserver:", a3);
}

- (BOOL)isDataProtectedByFirstUnlockAvailable
{
  return -[HDContentProtectionManager deviceUnlockedSinceBoot](self->_contentProtectionManager, "deviceUnlockedSinceBoot");
}

- (BOOL)addJournalEntries:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  HDDatabaseJournal *v9;
  HDDatabaseJournal *v10;
  id WeakRetained;
  BOOL v12;

  v6 = a3;
  if (self
    && ((-[HDDatabase _threadLocalTransactionContext]((uint64_t)self),
         v7 = (void *)objc_claimAutoreleasedReturnValue(),
         (v8 = v7) == 0)
      ? (v9 = self->_journal)
      : (-[HDDatabase _journalForType:](self, "_journalForType:", objc_msgSend(v7, "journalType")),
         v9 = (HDDatabaseJournal *)objc_claimAutoreleasedReturnValue()),
        v10 = v9,
        v8,
        v10))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
    v12 = -[HDDatabaseJournal addJournalEntries:profile:error:](v10, "addJournalEntries:profile:error:", v6, WeakRetained, a4);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:format:", a4, 3, CFSTR("Attempt to add a journal entry when no journal is active."));
    v10 = 0;
    v12 = 0;
  }

  return v12;
}

- (BOOL)addJournalEntry:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v9[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a4) = -[HDDatabase addJournalEntries:error:](self, "addJournalEntries:error:", v7, a4);

  return (char)a4;
}

void __58__HDDatabase_contentProtectionStateChanged_previousState___block_invoke(uint64_t *a1)
{
  -[HDDatabase _protectedDataQueue_contentProtectionStateChanged:previousState:](a1[4], a1[5], a1[6]);
}

- (HDProfile)profile
{
  return (HDProfile *)objc_loadWeakRetained((id *)&self->_profile);
}

- (double)offsetTimeInterval
{
  return self->_offsetTimeInterval;
}

- (void)performWhenDataProtectedByFirstUnlockIsAvailable:(id)a3
{
  -[HDDatabase _performWhenDataProtectedByFirstUnlockIsAvailableOnQueue:block:]((uint64_t)self, 0, a3);
}

+ (id)allCurrentAndFutureEntityClasses
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;

  _EntityClasses();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  _FutureEntityClasses();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  if (v3)
    v5 = v3;
  else
    v5 = MEMORY[0x1E0C9AA60];
  objc_msgSend(v2, "arrayByAddingObjectsFromArray:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)allEntityClassesWithBehavior:(id)a3
{
  int v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;

  v3 = objc_msgSend(a3, "futureMigrationsEnabled");
  _EntityClasses();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    _FutureEntityClasses();
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)v5;
    if (v5)
      v7 = v5;
    else
      v7 = MEMORY[0x1E0C9AA60];
    objc_msgSend(v4, "arrayByAddingObjectsFromArray:", v7);
    v8 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v8;
  }
  return v4;
}

- (id)allEntityClassesWithProtectionClass:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[5];

  v5 = (void *)objc_opt_class();
  -[HDDatabase profile](self, "profile");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "daemon");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "behavior");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allEntityClassesWithBehavior:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __67__HDDatabase_BuiltInEntities__allEntityClassesWithProtectionClass___block_invoke;
  v12[3] = &__block_descriptor_40_e8_B16__0_8l;
  v12[4] = a3;
  objc_msgSend(v9, "hk_filter:", v12);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

BOOL __67__HDDatabase_BuiltInEntities__allEntityClassesWithProtectionClass___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "protectionClass") == *(_QWORD *)(a1 + 32);
}

- (id)allSeriesEntityClasses
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)objc_opt_class();
  -[HDDatabase profile](self, "profile");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "daemon");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "behavior");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allEntityClassesWithBehavior:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "hk_filter:", &__block_literal_global_230);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

uint64_t __53__HDDatabase_BuiltInEntities__allSeriesEntityClasses__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "conformsToProtocol:", &unk_1EF1D5860);
}

- (HDDatabase)initWithConfiguration:(id)a3 profile:(id)a4
{
  id v8;
  void *v9;
  HDDatabase *v10;
  HDDatabase *v11;
  id *p_configuration;
  void *v13;
  uint64_t v14;
  NSString *profileDirectoryPath;
  NSLock *v16;
  NSLock *schemaMigrationLock;
  uint64_t v18;
  NSConditionLock *activeDatabasesLock;
  NSMutableSet *v20;
  NSMutableSet *activeDatabases;
  uint64_t v22;
  NSHashTable *migratedDatabases;
  void *v24;
  objc_class *v25;
  void *v26;
  uint64_t v27;
  NSString *threadLocalTransactionKey;
  void *v29;
  objc_class *v30;
  void *v31;
  uint64_t v32;
  NSString *threadLocalTransactionContextStackKey;
  uint64_t v34;
  uint64_t v35;
  NSDictionary *databasePoolForType;
  void *v37;
  NSLock *v38;
  NSLock *writeLock;
  NSOperationQueue *v40;
  NSOperationQueue *asynchronousOperationQueue;
  uint64_t v42;
  OS_dispatch_queue *serialAsynchronousQueue;
  uint64_t v44;
  OS_dispatch_queue *protectedDataQueue;
  id v46;
  uint64_t *v47;
  uint64_t v48;
  HKObserverSet *protectedDataObservers;
  dispatch_group_t v50;
  OS_dispatch_group *contentProtectionObservationGroup;
  HDDatabaseJournal *v52;
  void *v53;
  uint64_t v54;
  HDDatabaseJournal *journal;
  HDDatabaseJournal *v56;
  void *v57;
  uint64_t v58;
  HDDatabaseJournal *cloudSyncJournal;
  id v60;
  xpc_object_t empty;
  uint64_t v62;
  id *v63;
  uint64_t v64;
  id v65;
  HDCoalescedTaskPoolQuota *v66;
  id v67;
  id v68;
  void *v69;
  void *v70;
  uint64_t v71;
  id v72;
  id v73;
  id v74;
  uint64_t v75;
  id v76;
  id v77;
  id v78;
  id v79;
  id v80;
  dispatch_group_t v81;
  id v82;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  id v89;
  _QWORD v90[4];
  id *v91;
  id v92;
  id location;
  objc_super v94;
  _QWORD v95[2];
  _QWORD v96[4];

  v96[2] = *MEMORY[0x1E0C80C00];
  v89 = a3;
  v8 = a4;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v84, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDDatabase.mm"), 195, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("profile != nil"));

  }
  objc_msgSend(v8, "directoryPath");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v85, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDDatabase.mm"), 196, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[profile directoryPath] != nil"));

  }
  if (!objc_msgSend(v89, "concurrentReaderLimit"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v86, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDDatabase.mm"), 197, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("configuration.concurrentReaderLimit > 0"));

  }
  v94.receiver = self;
  v94.super_class = (Class)HDDatabase;
  v10 = -[HDDatabase init](&v94, sel_init);
  v11 = v10;
  if (v10)
  {
    v10->_stateLock._os_unfair_lock_opaque = 0;
    v10->_state = 0;
    p_configuration = (id *)&v10->_configuration;
    objc_storeStrong((id *)&v10->_configuration, a3);
    objc_msgSend(v8, "directoryPath");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "copy");
    profileDirectoryPath = v11->_profileDirectoryPath;
    v11->_profileDirectoryPath = (NSString *)v14;

    objc_storeWeak((id *)&v11->_profile, v8);
    v16 = (NSLock *)objc_alloc_init(MEMORY[0x1E0CB3740]);
    schemaMigrationLock = v11->_schemaMigrationLock;
    v11->_schemaMigrationLock = v16;

    v18 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3538]), "initWithCondition:", 0);
    activeDatabasesLock = v11->_activeDatabasesLock;
    v11->_activeDatabasesLock = (NSConditionLock *)v18;

    v20 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    activeDatabases = v11->_activeDatabases;
    v11->_activeDatabases = v20;

    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v22 = objc_claimAutoreleasedReturnValue();
    migratedDatabases = v11->_migratedDatabases;
    v11->_migratedDatabases = (NSHashTable *)v22;

    v24 = (void *)MEMORY[0x1E0CB3940];
    v25 = (objc_class *)objc_opt_class();
    NSStringFromClass(v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "stringWithFormat:", CFSTR("%@.%p.transaction"), v26, v11);
    v27 = objc_claimAutoreleasedReturnValue();
    threadLocalTransactionKey = v11->_threadLocalTransactionKey;
    v11->_threadLocalTransactionKey = (NSString *)v27;

    v29 = (void *)MEMORY[0x1E0CB3940];
    v30 = (objc_class *)objc_opt_class();
    NSStringFromClass(v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "stringWithFormat:", CFSTR("%@.%p.transactionContextStack"), v31, v11);
    v32 = objc_claimAutoreleasedReturnValue();
    threadLocalTransactionContextStackKey = v11->_threadLocalTransactionContextStackKey;
    v11->_threadLocalTransactionContextStackKey = (NSString *)v32;

    v88 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D29828]), "initWithConcurrentReaderLimit:delegate:", objc_msgSend(*p_configuration, "concurrentReaderLimit"), v11);
    v34 = objc_msgSend(objc_alloc(MEMORY[0x1E0D29828]), "initWithConcurrentReaderLimit:delegate:", objc_msgSend(*p_configuration, "concurrentReaderLimit"), v11);
    v95[0] = &unk_1E6DFAE20;
    v95[1] = &unk_1E6DFAE38;
    v96[0] = v88;
    v96[1] = v34;
    v87 = (void *)v34;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v96, v95, 2);
    v35 = objc_claimAutoreleasedReturnValue();
    databasePoolForType = v11->_databasePoolForType;
    v11->_databasePoolForType = (NSDictionary *)v35;

    objc_msgSend(MEMORY[0x1E0D29830], "sharedDiagnosticManager");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "addObject:", v11);

    v38 = (NSLock *)objc_alloc_init(MEMORY[0x1E0CB3740]);
    writeLock = v11->_writeLock;
    v11->_writeLock = v38;

    v40 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E0CB3828]);
    asynchronousOperationQueue = v11->_asynchronousOperationQueue;
    v11->_asynchronousOperationQueue = v40;

    -[NSOperationQueue setQualityOfService:](v11->_asynchronousOperationQueue, "setQualityOfService:", -1);
    -[NSOperationQueue setMaxConcurrentOperationCount:](v11->_asynchronousOperationQueue, "setMaxConcurrentOperationCount:", -[HDDatabaseConfiguration concurrentReaderLimit](v11->_configuration, "concurrentReaderLimit"));
    HKCreateSerialDispatchQueue();
    v42 = objc_claimAutoreleasedReturnValue();
    serialAsynchronousQueue = v11->_serialAsynchronousQueue;
    v11->_serialAsynchronousQueue = (OS_dispatch_queue *)v42;

    HKCreateSerialDispatchQueue();
    v44 = objc_claimAutoreleasedReturnValue();
    protectedDataQueue = v11->_protectedDataQueue;
    v11->_protectedDataQueue = (OS_dispatch_queue *)v44;

    v11->_protectedDataLock._os_unfair_lock_opaque = 0;
    v46 = objc_alloc(MEMORY[0x1E0CB6988]);
    v47 = (uint64_t *)MEMORY[0x1E0CB52B0];
    v48 = objc_msgSend(v46, "initWithName:loggingCategory:", CFSTR("database-protected-data"), *MEMORY[0x1E0CB52B0]);
    protectedDataObservers = v11->_protectedDataObservers;
    v11->_protectedDataObservers = (HKObserverSet *)v48;

    v50 = dispatch_group_create();
    contentProtectionObservationGroup = v11->_contentProtectionObservationGroup;
    v11->_contentProtectionObservationGroup = (OS_dispatch_group *)v50;

    dispatch_group_enter((dispatch_group_t)v11->_contentProtectionObservationGroup);
    v52 = [HDDatabaseJournal alloc];
    -[NSString stringByAppendingPathComponent:](v11->_profileDirectoryPath, "stringByAppendingPathComponent:", CFSTR("Journals"));
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v54 = -[HDDatabaseJournal initWithType:path:](v52, "initWithType:path:", 1, v53);
    journal = v11->_journal;
    v11->_journal = (HDDatabaseJournal *)v54;

    -[HDDatabaseJournal setDelegate:](v11->_journal, "setDelegate:", v11);
    *(_OWORD *)&v11->_journalMergeEpoch = xmmword_1B7F3E600;
    v56 = [HDDatabaseJournal alloc];
    -[NSString stringByAppendingPathComponent:](v11->_profileDirectoryPath, "stringByAppendingPathComponent:", CFSTR("CloudSyncJournals"));
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    v58 = -[HDDatabaseJournal initWithType:path:](v56, "initWithType:path:", 2, v57);
    cloudSyncJournal = v11->_cloudSyncJournal;
    v11->_cloudSyncJournal = (HDDatabaseJournal *)v58;

    -[HDDatabaseJournal setDelegate:](v11->_cloudSyncJournal, "setDelegate:", v11);
    -[HDDatabaseJournal setMaximumJournalBytes:](v11->_cloudSyncJournal, "setMaximumJournalBytes:", &unk_1E6DFAE50);
    _HKInitializeLogging();
    objc_initWeak(&location, v11);
    v60 = objc_alloc(MEMORY[0x1E0D298F8]);
    empty = xpc_dictionary_create_empty();
    xpc_dictionary_set_BOOL(empty, (const char *)*MEMORY[0x1E0C808A8], 1);
    xpc_dictionary_set_string(empty, (const char *)*MEMORY[0x1E0C80878], (const char *)*MEMORY[0x1E0C80888]);
    v62 = *v47;
    v90[0] = MEMORY[0x1E0C809B0];
    v90[1] = 3221225472;
    v90[2] = __44__HDDatabase_initWithConfiguration_profile___block_invoke;
    v90[3] = &unk_1E6CF3F70;
    v63 = v11;
    v91 = v63;
    objc_copyWeak(&v92, &location);
    v64 = objc_msgSend(v60, "initWithName:criteria:loggingCategory:handler:", CFSTR("com.apple.healthd.database.journal.merge.secondary"), empty, v62, v90);
    v65 = v63[30];
    v63[30] = (id)v64;

    v66 = -[HDCoalescedTaskPoolQuota initWithAvailableQuota:maximumQuota:refillInterval:minimumInterval:lastTrigger:]([HDCoalescedTaskPoolQuota alloc], "initWithAvailableQuota:maximumQuota:refillInterval:minimumInterval:lastTrigger:", 5, 5, 1800.0, 60.0, 0.0);
    objc_msgSend(v63[30], "setQuota:", v66);

    v67 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v68 = v63[32];
    v63[32] = v67;

    v69 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB6988]), "initWithName:loggingCategory:", CFSTR("database-main-journal-observers"), *v47);
    objc_msgSend(v63[32], "setObject:forKeyedSubscript:", v69, &unk_1E6DFAE20);

    v70 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB6988]), "initWithName:loggingCategory:", CFSTR("database-cloudsync-journal-observers"), *v47);
    objc_msgSend(v63[32], "setObject:forKeyedSubscript:", v70, &unk_1E6DFAE68);

    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v71 = objc_claimAutoreleasedReturnValue();
    v72 = v63[33];
    v63[33] = (id)v71;

    *((_DWORD *)v63 + 68) = 0;
    *((_DWORD *)v63 + 12) = 0;
    v73 = objc_alloc_init(MEMORY[0x1E0D29808]);
    v74 = v63[42];
    v63[42] = v73;

    objc_msgSend(v63[42], "addObserver:forAssertionIdentifier:queue:", v63, CFSTR("DatabaseAccessibility"), v11->_protectedDataQueue);
    objc_msgSend(*p_configuration, "contentProtectionManager");
    v75 = objc_claimAutoreleasedReturnValue();
    v76 = v63[50];
    v63[50] = (id)v75;

    *((_OWORD *)v63 + 6) = xmmword_1B7F3E610;
    v63[52] = (id)0x4082C00000000000;
    v77 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v78 = v63[18];
    v63[18] = v77;

    v79 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v80 = v63[19];
    v63[19] = v79;

    *((_DWORD *)v63 + 40) = 0;
    v81 = dispatch_group_create();
    v82 = v63[21];
    v63[21] = v81;

    objc_destroyWeak(&v92);
    objc_destroyWeak(&location);

  }
  return v11;
}

void __44__HDDatabase_initWithConfiguration_profile___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id *v5;
  id v6;
  id v7;
  id WeakRetained;

  atomic_store(0, (unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 232));
  v5 = (id *)(a1 + 40);
  v6 = a4;
  v7 = a2;
  WeakRetained = objc_loadWeakRetained(v5);
  -[HDDatabase _mergeSecondaryJournalsWithActivity:completion:]((uint64_t)WeakRetained, v7, v6);

}

- (void)_mergeSecondaryJournalsWithActivity:(void *)a3 completion:
{
  id v5;
  NSObject *v6;
  id v7;
  _QWORD block[5];
  id v9;
  id v10;

  v7 = a2;
  v5 = a3;
  if (a1)
  {
    objc_msgSend(*(id *)(a1 + 304), "mergeQueue");
    v6 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __61__HDDatabase__mergeSecondaryJournalsWithActivity_completion___block_invoke;
    block[3] = &unk_1E6CF42A0;
    block[4] = a1;
    v9 = v7;
    v10 = v5;
    dispatch_sync(v6, block);

  }
}

- (void)dealloc
{
  objc_super v3;

  -[HDAssertionManager removeObserver:](self->_assertionManager, "removeObserver:", self);
  v3.receiver = self;
  v3.super_class = (Class)HDDatabase;
  -[HDDatabase dealloc](&v3, sel_dealloc);
}

+ (__CFString)_stateDebugName:(uint64_t)a1
{
  __CFString *v3;

  objc_opt_self();
  if (a2 >= 6)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("HDDatabaseState Unknown (%d)"), a2);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = off_1E6CF4410[a2];
  }
  return v3;
}

- (uint64_t)_transitionToState:(uint64_t)a1
{
  os_unfair_lock_s *v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  void *v14;
  int v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v4 = (os_unfair_lock_s *)(a1 + 8);
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 8));
  v5 = *(_QWORD *)(a1 + 16);
  if (v5 != a2)
  {
    switch(a2)
    {
      case 1uLL:
        if (!v5)
          goto LABEL_14;
        _HKInitializeLogging();
        v6 = (id)*MEMORY[0x1E0CB52B0];
        if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
        {
          +[HDDatabase _stateDebugName:]((uint64_t)HDDatabase, *(_QWORD *)(a1 + 16));
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = 138543362;
          v16 = v7;
          _os_log_fault_impl(&dword_1B7802000, v6, OS_LOG_TYPE_FAULT, "HDDatabase attempted to transition to HDDatabaseStateInitialized from %{public}@", (uint8_t *)&v15, 0xCu);

        }
        goto LABEL_22;
      case 2uLL:
        if (v5 == 1)
          goto LABEL_14;
        _HKInitializeLogging();
        v6 = (id)*MEMORY[0x1E0CB52B0];
        if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
        {
          +[HDDatabase _stateDebugName:]((uint64_t)HDDatabase, *(_QWORD *)(a1 + 16));
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = 138543362;
          v16 = v8;
          _os_log_fault_impl(&dword_1B7802000, v6, OS_LOG_TYPE_FAULT, "HDDatabase attempted to transition to HDDatabaseStateAddResources from %{public}@", (uint8_t *)&v15, 0xCu);

        }
        goto LABEL_22;
      case 3uLL:
        if ((unint64_t)(v5 - 1) < 2)
          goto LABEL_14;
        _HKInitializeLogging();
        v6 = (id)*MEMORY[0x1E0CB52B0];
        if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
        {
          +[HDDatabase _stateDebugName:]((uint64_t)HDDatabase, *(_QWORD *)(a1 + 16));
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = 138543362;
          v16 = v9;
          _os_log_fault_impl(&dword_1B7802000, v6, OS_LOG_TYPE_FAULT, "HDDatabase attempted to transition to HDDatabaseStateStart from %{public}@", (uint8_t *)&v15, 0xCu);

        }
        goto LABEL_22;
      case 4uLL:
        if (v5 == 3)
        {
LABEL_14:
          *(_QWORD *)(a1 + 16) = a2;
LABEL_16:
          +[HDDatabase _stateDebugName:]((uint64_t)HDDatabase, a2);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          os_unfair_lock_unlock(v4);
          if (v10)
          {
            _HKInitializeLogging();
            v11 = *MEMORY[0x1E0CB52B0];
            v12 = 1;
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_INFO))
            {
              v15 = 138543362;
              v16 = v10;
              _os_log_impl(&dword_1B7802000, v11, OS_LOG_TYPE_INFO, "HDDatabase transitioned to state %{public}@", (uint8_t *)&v15, 0xCu);
            }
          }
          else
          {
            v12 = 1;
          }
          goto LABEL_24;
        }
        _HKInitializeLogging();
        v6 = (id)*MEMORY[0x1E0CB52B0];
        if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
        {
          +[HDDatabase _stateDebugName:]((uint64_t)HDDatabase, *(_QWORD *)(a1 + 16));
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = 138543362;
          v16 = v14;
          _os_log_fault_impl(&dword_1B7802000, v6, OS_LOG_TYPE_FAULT, "HDDatabase attempted to transition to HDDatabaseStateRun from %{public}@", (uint8_t *)&v15, 0xCu);

        }
LABEL_22:

        break;
      case 5uLL:
        *(_QWORD *)(a1 + 16) = 5;
        if (v5 == 5)
          break;
        goto LABEL_16;
      default:
        break;
    }
  }
  os_unfair_lock_unlock(v4);
  v12 = 0;
  v10 = 0;
LABEL_24:

  return v12;
}

- (void)enterStateInitialized
{
  if (-[HDDatabase _transitionToState:]((uint64_t)self, 1uLL))
    dispatch_group_enter((dispatch_group_t)self->_transactionStartGroup);
}

- (void)enterStateRun
{
  NSObject *protectedDataQueue;
  _QWORD block[5];

  protectedDataQueue = self->_protectedDataQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __27__HDDatabase_enterStateRun__block_invoke;
  block[3] = &unk_1E6CF3F98;
  block[4] = self;
  dispatch_sync(protectedDataQueue, block);
}

void __27__HDDatabase_enterStateRun__block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (-[HDDatabase _transitionToState:](*(_QWORD *)(a1 + 32), 3uLL))
  {
    if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 400), "deviceUnlockedSinceBoot"))
    {
      v2 = *(id *)(*(_QWORD *)(a1 + 32) + 176);
      v3 = *(_QWORD *)(a1 + 32);
      v4 = *(void **)(v3 + 176);
      *(_QWORD *)(v3 + 176) = 0;

      v12 = 0u;
      v13 = 0u;
      v10 = 0u;
      v11 = 0u;
      v5 = v2;
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v6)
      {
        v7 = *(_QWORD *)v11;
        do
        {
          v8 = 0;
          do
          {
            if (*(_QWORD *)v11 != v7)
              objc_enumerationMutation(v5);
            (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v8) + 16))(*(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v8));
            ++v8;
          }
          while (v6 != v8);
          v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
        }
        while (v6);
      }

    }
    v9 = *(_QWORD *)(a1 + 32);
    if (v9)
    {
      if (!*(_BYTE *)(v9 + 112))
      {
        *(_BYTE *)(v9 + 184) = 1;
        os_unfair_lock_lock((os_unfair_lock_t)(v9 + 80));
        *(_QWORD *)(v9 + 104) = 0;
        os_unfair_lock_unlock((os_unfair_lock_t)(v9 + 80));
        objc_msgSend(*(id *)(v9 + 400), "addSynchronousContentProtectionObserver:", v9);
        -[HDDatabase _protectedDataQueue_contentProtectionStateChanged:previousState:](v9, objc_msgSend(*(id *)(v9 + 400), "observedState"), 0);
        *(_BYTE *)(v9 + 112) = 1;
        dispatch_group_leave(*(dispatch_group_t *)(v9 + 120));
        v9 = *(_QWORD *)(a1 + 32);
      }
    }
    -[HDDatabase _transitionToState:](v9, 4uLL);
    dispatch_group_leave(*(dispatch_group_t *)(*(_QWORD *)(a1 + 32) + 168));
  }
}

- (void)enterStateAddResources
{
  -[HDDatabase _transitionToState:]((uint64_t)self, 2uLL);
}

- (void)addProtectedResourceStores:(id)a3
{
  id v4;
  int64_t state;
  NSObject *protectedDataQueue;
  NSObject *v7;
  _QWORD v8[4];
  id v9;
  HDDatabase *v10;
  uint8_t buf[16];

  v4 = a3;
  if (self
    && (os_unfair_lock_lock(&self->_stateLock),
        state = self->_state,
        os_unfair_lock_unlock(&self->_stateLock),
        state == 2)
    || (-[HDDatabase _transitionToState:]((uint64_t)self, 2uLL) & 1) != 0)
  {
    protectedDataQueue = self->_protectedDataQueue;
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __41__HDDatabase_addProtectedResourceStores___block_invoke;
    v8[3] = &unk_1E6CF3FC0;
    v9 = v4;
    v10 = self;
    dispatch_sync(protectedDataQueue, v8);

  }
  else
  {
    _HKInitializeLogging();
    v7 = *MEMORY[0x1E0CB52B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_1B7802000, v7, OS_LOG_TYPE_FAULT, "Unable to add protected resources", buf, 2u);
    }
  }

}

void __41__HDDatabase_addProtectedResourceStores___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  _BYTE v10[128];
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v6 = 0u;
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v7;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v7 != v4)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 264), "addObject:", *(_QWORD *)(*((_QWORD *)&v6 + 1) + 8 * v5++), (_QWORD)v6);
      }
      while (v3 != v5);
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
    }
    while (v3);
  }

}

- (_QWORD)_threadLocalTransaction
{
  _QWORD *v1;
  void *v2;
  void *v3;

  v1 = a1;
  if (a1)
  {
    objc_msgSend(MEMORY[0x1E0CB3978], "currentThread");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "threadDictionary");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKey:", v1[40]);
    v1 = (_QWORD *)objc_claimAutoreleasedReturnValue();

  }
  return v1;
}

- (id)_threadLocalTransactionContext
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  if (a1)
  {
    objc_msgSend(MEMORY[0x1E0CB3978], "currentThread");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "threadDictionary");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKey:", *(_QWORD *)(a1 + 328));
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "lastObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (off_t)_fileSizeForURL:(uint64_t)a3 error:
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  int *v9;
  off_t st_size;
  stat v12;

  v5 = a2;
  v6 = v5;
  if (a1)
  {
    v7 = objc_retainAutorelease(v5);
    if (stat((const char *)objc_msgSend(v7, "fileSystemRepresentation"), &v12))
    {
      if (*__error() != 2)
      {
        v8 = (void *)MEMORY[0x1E0CB35C8];
        v9 = __error();
        objc_msgSend(v8, "hk_assignError:code:format:", a3, 102, CFSTR("Failed to retrieve size for file at '%@': %s"), v7, strerror(*v9));
      }
      st_size = -1;
    }
    else
    {
      st_size = v12.st_size;
    }
  }
  else
  {
    st_size = 0;
  }

  return st_size;
}

void __62__HDDatabase__canAccessProtectedDatabaseForTransaction_error___block_invoke(uint64_t a1)
{
  -[HDDatabase _protectedDataQueue_mergeJournalWithPrimaryJournalMergeCompletion:](*(_QWORD *)(a1 + 32));
}

- (void)_protectedDataQueue_mergeJournalWithPrimaryJournalMergeCompletion:(uint64_t)a1
{
  NSObject *v2;
  _QWORD v3[5];
  id v4;

  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 72));
    objc_msgSend(*(id *)(a1 + 296), "mergeQueue");
    v2 = objc_claimAutoreleasedReturnValue();
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __80__HDDatabase__protectedDataQueue_mergeJournalWithPrimaryJournalMergeCompletion___block_invoke;
    v3[3] = &unk_1E6CF4038;
    v3[4] = a1;
    v4 = 0;
    dispatch_async(v2, v3);

  }
}

- (id)databasePoolForDatabaseType:(int64_t)a3
{
  NSDictionary *databasePoolForType;
  void *v7;
  void *v8;
  void *v10;
  void *v11;

  databasePoolForType = self->_databasePoolForType;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary objectForKeyedSubscript:](databasePoolForType, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    HDStringFromHDDatabaseType(a3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDDatabase.mm"), 508, CFSTR("Missing database pool for type %@"), v11);

  }
  return v8;
}

- (uint64_t)_performWithTransactionContext:(int)a3 merge:(_QWORD *)a4 error:(void *)a5 block:
{
  id v9;
  uint64_t (**v10)(id, _QWORD *);
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  NSObject *v18;
  id v19;
  NSObject *v20;
  char v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  int v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v9 = a2;
  v10 = a5;
  if (!a1)
  {
    v21 = 0;
    goto LABEL_28;
  }
  -[HDDatabase _threadLocalTransaction](a1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:description:", 100, CFSTR("Cannot set database transaction context inside transaction"));
    v12 = (id)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v12)
    {
      if (a4)
        *a4 = objc_retainAutorelease(v12);
      else
        _HKLogDroppedError();
    }

    _HKInitializeLogging();
    v20 = *MEMORY[0x1E0CB52B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_ERROR))
    {
      v27 = 138543362;
      v28 = v13;
      _os_log_error_impl(&dword_1B7802000, v20, OS_LOG_TYPE_ERROR, "Failed to set transaction context: %{public}@", (uint8_t *)&v27, 0xCu);
    }

    v21 = 0;
    goto LABEL_27;
  }
  objc_msgSend(MEMORY[0x1E0CB3978], "currentThread");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "threadDictionary");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "objectForKeyedSubscript:", a1[41]);
  v16 = (id)objc_claimAutoreleasedReturnValue();
  if (!v16)
  {
    v16 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    objc_msgSend(v15, "setObject:forKey:", v16, a1[41]);
  }
  v17 = v9;
  if ((objc_msgSend(v17, "requiresProtectedData") & 1) != 0 || objc_msgSend(v17, "requiresWrite"))
  {
    _HKInitializeLogging();
    v18 = *MEMORY[0x1E0CB52B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_FAULT))
    {
      v27 = 138543362;
      v28 = v17;
      _os_log_fault_impl(&dword_1B7802000, v18, OS_LOG_TYPE_FAULT, "Over-specified transaction context for performWithTransactionContext:error:block:. Contexts should not specify transaction properties like requiresProtectedData or requiresWrite. (%{public}@)", (uint8_t *)&v27, 0xCu);
    }
    v19 = (id)objc_msgSend(v17, "mutableCopy");
    objc_msgSend(v19, "setRequiresProtectedData:", 0);
    objc_msgSend(v19, "setRequiresWrite:", 0);
  }
  else
  {
    v19 = v17;
  }

  if (a3)
  {
    -[HDDatabase _threadLocalTransactionContext]((uint64_t)a1);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = v22;
    if (v22)
    {
      objc_msgSend(v22, "mergedContextWithContext:error:", v19, a4);
      v24 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v24 = objc_msgSend(v19, "copy");
    }
    v25 = (void *)v24;
    if (!v24)
    {

      v21 = 0;
      goto LABEL_26;
    }
    objc_msgSend(v16, "addObject:", v24);

  }
  else
  {
    objc_msgSend(v16, "addObject:", v19);
  }
  v21 = v10[2](v10, a4);
  objc_msgSend(v16, "removeLastObject");
LABEL_26:

LABEL_27:
LABEL_28:

  return v21 & 1;
}

- (BOOL)performWithTransactionContext:(id)a3 error:(id *)a4 block:(id)a5
{
  return -[HDDatabase _performWithTransactionContext:merge:error:block:](self, a3, 1, a4, a5);
}

- (BOOL)performTransactionWithContext:(id)a3 error:(id *)a4 block:(id)a5 inaccessibilityHandler:(id)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  char v14;
  id v15;
  HDDatabaseTransaction *v16;
  id v17;
  void *v18;
  void *v19;
  HDDatabaseTransactionContext *v20;
  NSObject *v21;
  HDDatabaseJournal *v22;
  HDDatabaseJournal *v23;
  char v24;
  void *v25;
  void *v26;
  id v27;
  int64_t state;
  void *v29;
  void *v30;
  void *v31;
  int v32;
  NSObject *v33;
  char v34;
  HDDatabaseJournal *v35;
  HDDatabaseTransactionContext *v36;
  HDDatabaseJournal *v37;
  char v38;
  id v39;
  id *p_firstUnprotectedWriteTransactionBlocks;
  os_unfair_lock_s *v41;
  id v42;
  NSMutableArray *firstProtectedWriteTransactionBlocks;
  HDDatabaseJournal *v44;
  _BOOL4 v45;
  void *v46;
  void *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t j;
  HDDatabaseTransactionContext *v51;
  os_unfair_lock_s *v52;
  id v53;
  NSMutableArray *v54;
  char v55;
  id *v56;
  id *v57;
  void *v58;
  NSObject *v59;
  id *v60;
  os_unfair_lock_s *p_transactionStartLock;
  HDDatabaseJournal *v62;
  BOOL v63;
  unint64_t journalMergeEpoch;
  int64_t protectedDataState;
  HDMutableDatabaseTransactionContext *v66;
  void *v67;
  void *v68;
  char v69;
  void *v70;
  void *v71;
  char v72;
  uint64_t (**v73)(_QWORD, id, id *);
  void *v74;
  void *v75;
  int v76;
  int v77;
  _BOOL4 v78;
  id v79;
  void *v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t k;
  void *v84;
  char v85;
  int v86;
  int v87;
  HDMutableDatabaseTransactionContext *v88;
  HDMutableDatabaseTransactionContext *v89;
  id v91;
  id WeakRetained;
  HDMutableDatabaseTransactionContext *v93;
  void *v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t i;
  HDMutableDatabaseTransactionContext *v98;
  HDMutableDatabaseTransactionContext *v99;
  HDMutableDatabaseTransactionContext *v100;
  HDMutableDatabaseTransactionContext *v101;
  id v102;
  NSObject *v103;
  HDMutableDatabaseTransactionContext *v104;
  unint64_t v105;
  int64_t v106;
  BOOL v107;
  char v108;
  id obj;
  id v110;
  os_unfair_lock_t v111;
  os_unfair_lock_t p_protectedDataLock;
  id *location;
  NSMutableArray *v114;
  id v115;
  id v116;
  id v117;
  os_unfair_lock *lock;
  id v119;
  HDMutableDatabaseTransactionContext *v120;
  HDDatabaseJournal *v121;
  int v122;
  void *v123;
  HDDatabaseTransaction *v124;
  void *v125;
  HDDatabaseTransaction *v126;
  id v127;
  __int128 v128;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  id v132;
  _QWORD aBlock[4];
  HDDatabaseJournal *v134;
  id v135;
  HDMutableDatabaseTransactionContext *v136;
  id v137;
  _QWORD v138[4];
  HDDatabaseJournal *v139;
  HDDatabase *v140;
  __int128 v141;
  __int128 v142;
  __int128 v143;
  __int128 v144;
  NSMutableArray *v145;
  __int128 v146;
  __int128 v147;
  __int128 v148;
  __int128 v149;
  id v150;
  uint8_t v151[128];
  uint8_t v152[4];
  HDMutableDatabaseTransactionContext *v153;
  uint8_t buf[4];
  void *v155;
  uint64_t v156;

  v156 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v127 = a5;
  v11 = a6;
  if ((-[HDDatabase _isDatabaseValidWithError:]((os_unfair_lock_s *)self, (uint64_t)a4) & 1) != 0)
  {
    if ((-[HDContentProtectionManager deviceUnlockedSinceBoot](self->_contentProtectionManager, "deviceUnlockedSinceBoot") & 1) != 0)
    {
      v125 = v11;
      objc_msgSend(MEMORY[0x1E0CB3978], "currentThread");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "threadDictionary");
      v123 = (void *)objc_claimAutoreleasedReturnValue();

      -[HDDatabase _threadLocalTransaction](self);
      v126 = (HDDatabaseTransaction *)objc_claimAutoreleasedReturnValue();
      v122 = objc_msgSend(v10, "requiresWrite");
      if (v126)
      {
        -[HDDatabaseTransaction rootContext](v126, "rootContext");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v137 = 0;
        v14 = objc_msgSend(v13, "containsContext:error:", v10, &v137);
        v15 = v137;

        if ((v14 & 1) == 0)
        {
          _HKInitializeLogging();
          v21 = (id)*MEMORY[0x1E0CB52B0];
          if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT))
          {
            objc_msgSend(v15, "localizedDescription");
            v58 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v155 = v58;
            _os_log_fault_impl(&dword_1B7802000, v21, OS_LOG_TYPE_FAULT, "Incompatible nested transaction context: %@", buf, 0xCu);

          }
          v22 = (HDDatabaseJournal *)v15;
          v23 = v22;
          if (v22)
          {
            if (a4)
            {
              v23 = objc_retainAutorelease(v22);
              v24 = 0;
              *a4 = v23;
            }
            else
            {
              _HKLogDroppedError();
              v24 = 0;
            }
            v121 = v23;
          }
          else
          {
            v121 = 0;
            v24 = 0;
          }
          goto LABEL_145;
        }

        v16 = v126;
      }
      else
      {
        -[HDDatabase _threadLocalTransactionContext]((uint64_t)self);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v19)
        {
          if (v10)
            v20 = (HDDatabaseTransactionContext *)v10;
          else
            v20 = objc_alloc_init(HDDatabaseTransactionContext);
          v19 = v20;
        }
        objc_msgSend(v19, "mergedContextWithContext:error:", v10, a4);
        v25 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v25)
        {
          v24 = 0;
LABEL_146:

          v11 = v125;
          goto LABEL_147;
        }
        v16 = -[HDDatabaseTransaction initWithDatabase:provider:rootContext:]([HDDatabaseTransaction alloc], "initWithDatabase:provider:rootContext:", self, self, v25);

      }
      -[HDDatabaseTransaction rootContext](v16, "rootContext");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v124 = v16;
      -[HDDatabase _journalForType:](self, "_journalForType:", objc_msgSend(v26, "journalType"));
      v121 = (HDDatabaseJournal *)objc_claimAutoreleasedReturnValue();

      if (v126)
      {
        LOBYTE(v122) = 0;
        v23 = 0;
        goto LABEL_111;
      }
      -[HDDatabaseTransaction rootContext](v16, "rootContext");
      v136 = 0;
      v27 = (id)objc_claimAutoreleasedReturnValue();
      os_unfair_lock_lock(&self->_stateLock);
      state = self->_state;
      os_unfair_lock_unlock(&self->_stateLock);
      v119 = v27;
      if (state != 4)
      {
        -[HDDatabase profile](self, "profile");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "daemon");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "behavior");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = objc_msgSend(v31, "isAppleInternalInstall");

        if (v32)
        {
          _HKInitializeLogging();
          v33 = *MEMORY[0x1E0CB52B0];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_FAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_fault_impl(&dword_1B7802000, v33, OS_LOG_TYPE_FAULT, "Detected transaction start before profileReady. Please delay access to the database until profileReady has been called for the profile; this is already mandatory for protected data transactions and will block all"
              " transactions in the future. Reach out to the HealthKit team with questions.",
              buf,
              2u);
          }
        }
      }
      if ((objc_msgSend(v27, "skipTransactionStartTasks") & 1) != 0)
      {
        v34 = 1;
        goto LABEL_89;
      }
      if (objc_msgSend(v27, "requiresProtectedData"))
      {
        -[HDDatabase _journalForType:](self, "_journalForType:", objc_msgSend(v27, "journalType"));
        v35 = (HDDatabaseJournal *)objc_claimAutoreleasedReturnValue();
        if (v35 != self->_journal && (objc_msgSend(v27, "skipJournalMerge") & 1) == 0)
        {
          v36 = objc_alloc_init(HDDatabaseTransactionContext);
          v138[0] = MEMORY[0x1E0C809B0];
          v138[1] = 3221225472;
          v138[2] = __68__HDDatabase__waitForTransactionStartTasksIfNeededForContext_error___block_invoke;
          v138[3] = &unk_1E6CF42C8;
          v37 = v35;
          v139 = v37;
          v140 = self;
          v38 = -[HDDatabase _performWithTransactionContext:merge:error:block:](self, v36, 0, &v136, v138);

          if ((v38 & 1) == 0)
          {

LABEL_87:
            v34 = 0;
            goto LABEL_88;
          }
        }
        dispatch_group_wait((dispatch_group_t)self->_transactionStartGroup, 0xFFFFFFFFFFFFFFFFLL);

      }
      os_unfair_lock_lock(&self->_transactionStartLock);
      v39 = v27;
      lock = &self->_transactionStartLock;
      os_unfair_lock_assert_owner(&self->_transactionStartLock);
      p_firstUnprotectedWriteTransactionBlocks = (id *)&self->_firstUnprotectedWriteTransactionBlocks;
      if (self->_firstUnprotectedWriteTransactionBlocks)
        goto LABEL_42;
      if ((objc_msgSend(v39, "requiresProtectedData") & 1) != 0)
      {
        if (self->_firstProtectedWriteTransactionBlocks || self->_journalMergeEpoch != self->_mergedJournalEpoch)
        {
LABEL_42:

LABEL_43:
          v116 = v39;
          os_unfair_lock_assert_owner(lock);
          obj = *p_firstUnprotectedWriteTransactionBlocks;
          v41 = (os_unfair_lock_s *)*p_firstUnprotectedWriteTransactionBlocks;
          v42 = *p_firstUnprotectedWriteTransactionBlocks;
          *p_firstUnprotectedWriteTransactionBlocks = 0;

          if (objc_msgSend(v116, "requiresProtectedData"))
          {
            v114 = self->_firstProtectedWriteTransactionBlocks;
            firstProtectedWriteTransactionBlocks = self->_firstProtectedWriteTransactionBlocks;
            self->_firstProtectedWriteTransactionBlocks = 0;

          }
          else
          {
            v114 = 0;
          }
          if (!-[os_unfair_lock_s count](v41, "count") && !-[NSMutableArray count](v114, "count"))
          {

            p_transactionStartLock = &self->_transactionStartLock;
            os_unfair_lock_unlock(lock);
LABEL_81:
            v117 = v116;
            if ((objc_msgSend(v117, "requiresProtectedData") & 1) == 0)
              goto LABEL_85;
            if (objc_msgSend(v117, "skipJournalMerge"))
            {
              -[HDDatabase _journalForType:](self, "_journalForType:", objc_msgSend(v117, "journalType"));
              v62 = (HDDatabaseJournal *)objc_claimAutoreleasedReturnValue();
              v63 = v62 == self->_journal;

              p_transactionStartLock = &self->_transactionStartLock;
              if (v63)
                goto LABEL_85;
            }
            os_unfair_lock_lock(p_transactionStartLock);
            os_unfair_lock_lock(&self->_protectedDataLock);
            journalMergeEpoch = self->_journalMergeEpoch;
            protectedDataState = self->_protectedDataState;
            os_unfair_lock_unlock(&self->_protectedDataLock);
            os_unfair_lock_unlock(p_transactionStartLock);
            if (protectedDataState)
            {
LABEL_85:
              v34 = 1;
LABEL_86:

              goto LABEL_88;
            }
            p_protectedDataLock = &self->_protectedDataLock;
            while (1)
            {
              v91 = v117;
              WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
              if (WeakRetained)
              {
                v93 = objc_alloc_init(HDMutableDatabaseTransactionContext);
                v115 = v91;
                -[HDMutableDatabaseTransactionContext setSkipTransactionStartTasks:](v93, "setSkipTransactionStartTasks:", 1);
                v143 = 0u;
                v144 = 0u;
                v141 = 0u;
                v142 = 0u;
                objc_msgSend(v91, "accessibilityAssertions");
                v94 = (void *)objc_claimAutoreleasedReturnValue();
                v95 = objc_msgSend(v94, "countByEnumeratingWithState:objects:count:", &v141, buf, 16);
                if (v95)
                {
                  v96 = *(_QWORD *)v142;
                  do
                  {
                    for (i = 0; i != v95; ++i)
                    {
                      if (*(_QWORD *)v142 != v96)
                        objc_enumerationMutation(v94);
                      -[HDMutableDatabaseTransactionContext addAccessibilityAssertion:](v93, "addAccessibilityAssertion:", *(_QWORD *)(*((_QWORD *)&v141 + 1) + 8 * i));
                    }
                    v95 = objc_msgSend(v94, "countByEnumeratingWithState:objects:count:", &v141, buf, 16);
                  }
                  while (v95);
                }

                v91 = v115;
                v150 = 0;
                *(_QWORD *)&v146 = MEMORY[0x1E0C809B0];
                *((_QWORD *)&v146 + 1) = 3221225472;
                *(_QWORD *)&v147 = __51__HDDatabase__mergePrimaryJournalForContext_error___block_invoke;
                *((_QWORD *)&v147 + 1) = &unk_1E6CF42C8;
                *(_QWORD *)&v148 = self;
                *((_QWORD *)&v148 + 1) = WeakRetained;
                v34 = -[HDDatabase _performWithTransactionContext:merge:error:block:](self, v93, 0, &v150, &v146);
                v98 = (HDMutableDatabaseTransactionContext *)v150;
                v99 = v98;
                if ((v34 & 1) == 0)
                {
                  if (-[HDMutableDatabaseTransactionContext hk_isDatabaseAccessibilityError](v98, "hk_isDatabaseAccessibilityError"))
                  {
                    v100 = v99;
                    if (v100)
                    {
                      v101 = objc_retainAutorelease(v100);
                      v136 = v101;
                    }
                    else
                    {
                      v101 = 0;
                    }
                  }
                  else
                  {
                    _HKInitializeLogging();
                    v103 = *MEMORY[0x1E0CB52B0];
                    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_ERROR))
                    {
                      *(_DWORD *)v152 = 138543362;
                      v153 = v99;
                      _os_log_error_impl(&dword_1B7802000, v103, OS_LOG_TYPE_ERROR, "Journal merge failed with non-accessibility error: %{public}@", v152, 0xCu);
                    }
                    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_protectedDataInaccessibilityError");
                    v104 = (HDMutableDatabaseTransactionContext *)(id)objc_claimAutoreleasedReturnValue();
                    v101 = v104;
                    if (v104)
                      v136 = objc_retainAutorelease(v104);

                  }
                }

              }
              else
              {
                objc_msgSend(MEMORY[0x1E0CB35C8], "hk_protectedDataInaccessibilityError");
                v102 = (id)objc_claimAutoreleasedReturnValue();
                if (v102)
                {
                  v99 = (HDMutableDatabaseTransactionContext *)objc_retainAutorelease(v102);
                  v34 = 0;
                  v136 = v99;
                  v93 = v99;
                }
                else
                {
                  v99 = 0;
                  v93 = 0;
                  v34 = 0;
                }
              }

              os_unfair_lock_lock(lock);
              os_unfair_lock_lock(p_protectedDataLock);
              v105 = self->_journalMergeEpoch;
              if ((v34 & 1) == 0)
                break;
              if (journalMergeEpoch == v105)
                self->_mergedJournalEpoch = journalMergeEpoch;
              else
                journalMergeEpoch = self->_mergedJournalEpoch;
              v106 = self->_protectedDataState;
              if (v105 != journalMergeEpoch || v106)
              {
                if (v105 != journalMergeEpoch)
                  goto LABEL_183;
LABEL_182:
                v107 = 0;
                goto LABEL_184;
              }
              v107 = 0;
              self->_protectedDataState = 1;
LABEL_184:
              os_unfair_lock_unlock(p_protectedDataLock);
              os_unfair_lock_unlock(lock);
              v108 = v34 & v107;
              journalMergeEpoch = v105;
              if ((v108 & 1) == 0)
                goto LABEL_86;
            }
            if (v105 != self->_mergedJournalEpoch)
            {
              v106 = self->_protectedDataState;
LABEL_183:
              v107 = v106 == 0;
              goto LABEL_184;
            }
            goto LABEL_182;
          }
          if (objc_msgSend(v116, "requiresProtectedData"))
            +[HDMutableDatabaseTransactionContext contextForWritingProtectedData](HDMutableDatabaseTransactionContext, "contextForWritingProtectedData");
          else
            +[HDMutableDatabaseTransactionContext contextForWriting](HDMutableDatabaseTransactionContext, "contextForWriting");
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          v111 = v41;
          objc_msgSend(v46, "setSkipTransactionStartTasks:", 1);
          objc_msgSend(v46, "setSkipJournalMerge:", 1);
          v148 = 0u;
          v149 = 0u;
          v146 = 0u;
          v147 = 0u;
          objc_msgSend(v116, "accessibilityAssertions");
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          v48 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v146, buf, 16);
          if (v48)
          {
            v49 = *(_QWORD *)v147;
            do
            {
              for (j = 0; j != v48; ++j)
              {
                if (*(_QWORD *)v147 != v49)
                  objc_enumerationMutation(v47);
                objc_msgSend(v46, "addAccessibilityAssertion:", *(_QWORD *)(*((_QWORD *)&v146 + 1) + 8 * j));
              }
              v48 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v146, buf, 16);
            }
            while (v48);
          }

          v51 = objc_alloc_init(HDDatabaseTransactionContext);
          v150 = 0;
          *(_QWORD *)&v141 = MEMORY[0x1E0C809B0];
          *((_QWORD *)&v141 + 1) = 3221225472;
          *(_QWORD *)&v142 = __86__HDDatabase__transactionStartLock_runFirstTransactionBlocksIfNeededForContext_error___block_invoke;
          *((_QWORD *)&v142 + 1) = &unk_1E6CF4318;
          *(_QWORD *)&v143 = self;
          v110 = v46;
          *((_QWORD *)&v143 + 1) = v110;
          v52 = v111;
          *(_QWORD *)&v144 = v52;
          v53 = v116;
          *((_QWORD *)&v144 + 1) = v53;
          v54 = v114;
          v145 = v54;
          v55 = -[HDDatabase _performWithTransactionContext:merge:error:block:](self, v51, 0, &v150, &v141);
          location = (id *)v150;

          if ((v55 & 1) == 0)
          {
            if (objc_msgSend(location, "hk_isDatabaseAccessibilityError"))
            {
              v56 = location;
              if (v56)
              {
                v57 = objc_retainAutorelease(v56);
                v136 = (HDMutableDatabaseTransactionContext *)v57;
              }
              else
              {
                v57 = 0;
              }
            }
            else
            {
              if ((HKIsUnitTesting() & 1) == 0)
              {
                _HKInitializeLogging();
                v59 = *MEMORY[0x1E0CB52B0];
                if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)v152 = 138543362;
                  v153 = (HDMutableDatabaseTransactionContext *)location;
                  _os_log_error_impl(&dword_1B7802000, v59, OS_LOG_TYPE_ERROR, "First transaction block failed with non-accessibility error: %{public}@", v152, 0xCu);
                }
              }
              objc_msgSend(MEMORY[0x1E0CB35C8], "hk_protectedDataInaccessibilityError");
              v60 = (id *)(id)objc_claimAutoreleasedReturnValue();
              v57 = v60;
              if (v60)
                v136 = objc_retainAutorelease(v60);

            }
            objc_storeStrong((id *)&self->_firstUnprotectedWriteTransactionBlocks, obj);
            if (objc_msgSend(v53, "requiresProtectedData"))
              objc_storeStrong((id *)&self->_firstProtectedWriteTransactionBlocks, v114);
          }

          p_transactionStartLock = &self->_transactionStartLock;
          os_unfair_lock_unlock(lock);
          if ((v55 & 1) != 0)
            goto LABEL_81;
          goto LABEL_87;
        }
        -[HDDatabase _journalForType:](self, "_journalForType:", objc_msgSend(v39, "journalType"));
        v44 = (HDDatabaseJournal *)objc_claimAutoreleasedReturnValue();
        v45 = v44 == self->_journal;

        if (!v45)
          goto LABEL_43;
      }
      else
      {

      }
      os_unfair_lock_unlock(lock);
      v34 = 1;
LABEL_88:
      v27 = v119;
LABEL_89:

      v66 = v136;
      -[HDDatabaseTransaction rootContext](v124, "rootContext");
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v67, "requiresProtectedData"))
      {
        -[HDDatabaseTransaction rootContext](v124, "rootContext");
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        v69 = objc_msgSend(v68, "skipTransactionStartTasks");

        if ((v69 & 1) != 0)
          goto LABEL_94;
        v70 = _Block_copy(self->_unitTest_didWaitForJournalMergeHandler);
        v67 = v70;
        if (v70)
          (*((void (**)(void *, HDDatabase *))v70 + 2))(v70, self);
      }

LABEL_94:
      if (v122)
      {
        -[HDDatabaseTransaction rootContext](v124, "rootContext");
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        v72 = objc_msgSend(v71, "skipJournalMerge");

        v73 = (uint64_t (**)(_QWORD, id, id *))v125;
        if ((v72 & 1) == 0)
          -[HDDatabaseJournal lock](v121, "lock");
        if (v121 == self->_journal)
        {
          -[HDDatabaseJournal interruptJournalMerge](self->_cloudSyncJournal, "interruptJournalMerge");
          v23 = (HDDatabaseJournal *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
          -[HDDatabaseJournal addObject:](v23, "addObject:", self->_cloudSyncJournal);
        }
        else
        {
          v23 = 0;
        }
        -[NSLock lock](self->_writeLock, "lock");
        goto LABEL_109;
      }
      -[HDDatabaseTransaction rootContext](v124, "rootContext");
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v74, "requiresProtectedData"))
      {
        -[HDDatabaseTransaction rootContext](v124, "rootContext");
        v75 = (void *)objc_claimAutoreleasedReturnValue();
        v76 = objc_msgSend(v75, "allowsJournalingDuringProtectedRead");
        if (v125)
          v77 = v76;
        else
          v77 = 0;

        if (!v77)
          goto LABEL_106;
        aBlock[0] = MEMORY[0x1E0C809B0];
        aBlock[1] = 3221225472;
        aBlock[2] = __79__HDDatabase_performTransactionWithContext_error_block_inaccessibilityHandler___block_invoke;
        aBlock[3] = &unk_1E6CF3FE8;
        v134 = v121;
        v135 = v125;
        v125 = _Block_copy(aBlock);

        v74 = v134;
      }

LABEL_106:
      v23 = 0;
      v73 = (uint64_t (**)(_QWORD, id, id *))v125;
LABEL_109:
      objc_msgSend(v123, "setObject:forKeyedSubscript:", v124, self->_threadLocalTransactionKey);
      v125 = v73;
      if ((v34 & 1) == 0)
      {
        v86 = -[HDMutableDatabaseTransactionContext hk_isDatabaseAccessibilityError](v66, "hk_isDatabaseAccessibilityError");
        if (v73)
          v87 = v86;
        else
          v87 = 0;
        if (v87 == 1)
        {
          v24 = v73[2](v73, v66, a4);
        }
        else
        {
          v88 = v66;
          v89 = v88;
          if (v88)
          {
            v120 = v88;
            if (a4)
            {
              *a4 = objc_retainAutorelease(v88);
              v89 = v120;
            }
            else
            {
              v89 = v88;
              _HKLogDroppedError();
            }
          }

          v24 = 0;
        }

        v80 = 0;
        v78 = 0;
        if (!v122)
          goto LABEL_139;
        goto LABEL_116;
      }

LABEL_111:
      v132 = 0;
      v78 = -[HDDatabaseTransaction performWithContext:error:block:inaccessibilityHandler:](v124, "performWithContext:error:block:inaccessibilityHandler:", v10, &v132, v127, v125);
      v79 = v132;
      v80 = v79;
      if (v79)
      {
        if (a4)
          *a4 = objc_retainAutorelease(v79);
        else
          _HKLogDroppedError();
      }

      v24 = v78;
      if ((v122 & 1) == 0)
      {
LABEL_126:
        if (v126)
        {
LABEL_144:

          v126 = v124;
LABEL_145:

          goto LABEL_146;
        }
LABEL_139:
        objc_msgSend(v123, "removeObjectForKey:", self->_threadLocalTransactionKey);
        if (v78)
        {
          -[HDDatabaseTransaction transactionDidEndWithError:](v124, "transactionDidEndWithError:", 0);
        }
        else
        {
          if (!v80)
          {
            objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:format:", 124, CFSTR("Transaction failed with unknown error"));
            v80 = (void *)objc_claimAutoreleasedReturnValue();
          }
          -[HDDatabaseTransaction transactionDidEndWithError:](v124, "transactionDidEndWithError:", v80);
        }
        goto LABEL_144;
      }
LABEL_116:
      v130 = 0u;
      v131 = 0u;
      v128 = 0u;
      v129 = 0u;
      v23 = v23;
      v81 = -[HDDatabaseJournal countByEnumeratingWithState:objects:count:](v23, "countByEnumeratingWithState:objects:count:", &v128, v151, 16);
      if (v81)
      {
        v82 = *(_QWORD *)v129;
        do
        {
          for (k = 0; k != v81; ++k)
          {
            if (*(_QWORD *)v129 != v82)
              objc_enumerationMutation(v23);
            objc_msgSend(*(id *)(*((_QWORD *)&v128 + 1) + 8 * k), "resumeJournalMerge");
          }
          v81 = -[HDDatabaseJournal countByEnumeratingWithState:objects:count:](v23, "countByEnumeratingWithState:objects:count:", &v128, v151, 16);
        }
        while (v81);
      }

      -[HDDatabaseTransaction rootContext](v124, "rootContext");
      v84 = (void *)objc_claimAutoreleasedReturnValue();
      v85 = objc_msgSend(v84, "skipJournalMerge");

      if ((v85 & 1) == 0)
        -[HDDatabaseJournal unlock](v121, "unlock");
      -[NSLock unlock](self->_writeLock, "unlock");
      goto LABEL_126;
    }
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_databaseInaccessibleBeforeFirstUnlockError");
    v17 = (id)objc_claimAutoreleasedReturnValue();
    v18 = v17;
    if (v17)
    {
      if (a4)
        *a4 = objc_retainAutorelease(v17);
      else
        _HKLogDroppedError();
    }

  }
  v24 = 0;
LABEL_147:

  return v24;
}

uint64_t __79__HDDatabase_performTransactionWithContext_error_block_inaccessibilityHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "lock");
  v4 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  objc_msgSend(*(id *)(a1 + 32), "unlock");

  return v4;
}

- (BOOL)performHighPriorityTransactionsWithError:(id *)a3 block:(id)a4
{
  id v6;
  void *v7;

  v6 = a4;
  +[HDDatabaseTransactionContext highPriorityContext](HDDatabaseTransactionContext, "highPriorityContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a3) = -[HDDatabase performWithTransactionContext:error:block:](self, "performWithTransactionContext:error:block:", v7, a3, v6);

  return (char)a3;
}

- (void)_performWhenDataProtectedByFirstUnlockIsAvailableOnQueue:(void *)a3 block:
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t (**v9)(void);
  NSObject *v10;
  _QWORD block[5];
  uint64_t (**v12)(void);
  id v13;
  _QWORD v14[5];
  id v15;
  _QWORD aBlock[4];
  id v17;
  id v18;

  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (a1 && v6)
  {
    if (!v5)
    {
      dispatch_get_global_queue(21, 0);
      v5 = (id)objc_claimAutoreleasedReturnValue();
    }
    v8 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __77__HDDatabase__performWhenDataProtectedByFirstUnlockIsAvailableOnQueue_block___block_invoke;
    aBlock[3] = &unk_1E6CF4038;
    v5 = v5;
    v17 = v5;
    v18 = v7;
    v14[0] = v8;
    v14[1] = 3221225472;
    v14[2] = __77__HDDatabase__performWhenDataProtectedByFirstUnlockIsAvailableOnQueue_block___block_invoke_3;
    v14[3] = &unk_1E6CF4060;
    v14[4] = a1;
    v7 = _Block_copy(aBlock);
    v15 = v7;
    v9 = (uint64_t (**)(void))_Block_copy(v14);
    if ((v9[2]() & 1) == 0)
    {
      v10 = *(NSObject **)(a1 + 72);
      block[0] = v8;
      block[1] = 3221225472;
      block[2] = __77__HDDatabase__performWhenDataProtectedByFirstUnlockIsAvailableOnQueue_block___block_invoke_4;
      block[3] = &unk_1E6CF4088;
      block[4] = a1;
      v12 = v9;
      v13 = v7;
      dispatch_async(v10, block);

    }
  }

}

- (void)performWhenDataProtectedByFirstUnlockIsAvailableOnQueue:(id)a3 block:(id)a4
{
  -[HDDatabase _performWhenDataProtectedByFirstUnlockIsAvailableOnQueue:block:]((uint64_t)self, a3, a4);
}

void __77__HDDatabase__performWhenDataProtectedByFirstUnlockIsAvailableOnQueue_block___block_invoke(uint64_t a1)
{
  NSObject *v1;
  _QWORD block[4];
  id v3;

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __77__HDDatabase__performWhenDataProtectedByFirstUnlockIsAvailableOnQueue_block___block_invoke_2;
  block[3] = &unk_1E6CF4010;
  v1 = *(NSObject **)(a1 + 32);
  v3 = *(id *)(a1 + 40);
  dispatch_async(v1, block);

}

void __77__HDDatabase__performWhenDataProtectedByFirstUnlockIsAvailableOnQueue_block___block_invoke_2(uint64_t a1)
{
  void *v2;

  v2 = (void *)MEMORY[0x1BCCACAC4]();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  objc_autoreleasePoolPop(v2);
}

uint64_t __77__HDDatabase__performWhenDataProtectedByFirstUnlockIsAvailableOnQueue_block___block_invoke_3(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;
  os_unfair_lock_s *v4;
  uint64_t v5;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 400), "deviceUnlockedSinceBoot");
  if ((_DWORD)result)
  {
    v3 = *(_QWORD *)(a1 + 32);
    if (v3
      && (v4 = (os_unfair_lock_s *)(v3 + 8),
          os_unfair_lock_lock((os_unfair_lock_t)(v3 + 8)),
          v5 = *(_QWORD *)(v3 + 16),
          os_unfair_lock_unlock(v4),
          v5 == 4))
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
      return 1;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

void __77__HDDatabase__performWhenDataProtectedByFirstUnlockIsAvailableOnQueue_block___block_invoke_4(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  void *v5;
  id v6;

  if ((-[HDDatabase isInvalid](*(os_unfair_lock_s **)(a1 + 32)) & 1) == 0
    && ((*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))() & 1) == 0)
  {
    v2 = *(void **)(*(_QWORD *)(a1 + 32) + 176);
    if (!v2)
    {
      v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v4 = *(_QWORD *)(a1 + 32);
      v5 = *(void **)(v4 + 176);
      *(_QWORD *)(v4 + 176) = v3;

      v2 = *(void **)(*(_QWORD *)(a1 + 32) + 176);
    }
    v6 = _Block_copy(*(const void **)(a1 + 48));
    objc_msgSend(v2, "addObject:");

  }
}

- (os_unfair_lock_s)isInvalid
{
  os_unfair_lock_s *v1;
  os_unfair_lock_s *v2;
  uint64_t v3;

  if (result)
  {
    v1 = result;
    v2 = result + 2;
    os_unfair_lock_lock(result + 2);
    v3 = *(_QWORD *)&v1[4]._os_unfair_lock_opaque;
    os_unfair_lock_unlock(v2);
    return (os_unfair_lock_s *)(v3 == 5);
  }
  return result;
}

- (void)performAsynchronouslySerial:(id)a3
{
  dispatch_async((dispatch_queue_t)self->_serialAsynchronousQueue, a3);
}

- (BOOL)performWithJournalType:(int64_t)a3 error:(id *)a4 block:(id)a5
{
  id v8;
  HDMutableDatabaseTransactionContext *v9;

  v8 = a5;
  v9 = objc_alloc_init(HDMutableDatabaseTransactionContext);
  -[HDMutableDatabaseTransactionContext setJournalType:](v9, "setJournalType:", a3);
  LOBYTE(a4) = -[HDDatabase performWithTransactionContext:error:block:](self, "performWithTransactionContext:error:block:", v9, a4, v8);

  return (char)a4;
}

- (id)beginExtendedTransactionWithContext:(id)a3 transactionTimeout:(double)a4 continuationTimeout:(double)a5 error:(id *)a6
{
  id v10;
  HDExtendedDatabaseTransaction *v11;
  HDExtendedDatabaseTransaction *v12;
  NSObject *protectedDataQueue;
  _QWORD v15[5];
  HDExtendedDatabaseTransaction *v16;

  v10 = a3;
  v11 = -[HDExtendedDatabaseTransaction initWithDatabase:context:transactionTimeout:continuationTimeout:error:]([HDExtendedDatabaseTransaction alloc], "initWithDatabase:context:transactionTimeout:continuationTimeout:error:", self, v10, a6, a4, a5);
  v12 = v11;
  if (v11)
  {
    protectedDataQueue = self->_protectedDataQueue;
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __95__HDDatabase_beginExtendedTransactionWithContext_transactionTimeout_continuationTimeout_error___block_invoke;
    v15[3] = &unk_1E6CF3FC0;
    v15[4] = self;
    v16 = v11;
    dispatch_sync(protectedDataQueue, v15);

  }
  return v12;
}

void __95__HDDatabase_beginExtendedTransactionWithContext_transactionTimeout_continuationTimeout_error___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 384);
  if (!v2)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 384);
    *(_QWORD *)(v4 + 384) = v3;

    v2 = *(void **)(*(_QWORD *)(a1 + 32) + 384);
  }
  v6 = *(void **)(a1 + 40);
  objc_msgSend(v6, "transactionIdentifier");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v6);

}

- (id)extendedDatabaseTransactionForIdentifier:(id)a3
{
  id v5;
  NSObject *protectedDataQueue;
  id v7;
  id v8;
  void *v10;
  _QWORD block[5];
  id v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDDatabase.mm"), 873, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("transactionIdentifier != nil"));

  }
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__68;
  v18 = __Block_byref_object_dispose__68;
  v19 = 0;
  protectedDataQueue = self->_protectedDataQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __55__HDDatabase_extendedDatabaseTransactionForIdentifier___block_invoke;
  block[3] = &unk_1E6CF40B0;
  v12 = v5;
  v13 = &v14;
  block[4] = self;
  v7 = v5;
  dispatch_sync(protectedDataQueue, block);
  v8 = (id)v15[5];

  _Block_object_dispose(&v14, 8);
  return v8;
}

void __55__HDDatabase_extendedDatabaseTransactionForIdentifier___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1[4] + 384), "objectForKeyedSubscript:", a1[5]);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1[6] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)finalizeExtendedTransactionForIdentifier:(id)a3
{
  id v5;
  NSObject *protectedDataQueue;
  id v7;
  void *v8;
  _QWORD block[5];
  id v10;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDDatabase.mm"), 883, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("transactionIdentifier != nil"));

  }
  protectedDataQueue = self->_protectedDataQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __55__HDDatabase_finalizeExtendedTransactionForIdentifier___block_invoke;
  block[3] = &unk_1E6CF3FC0;
  block[4] = self;
  v10 = v5;
  v7 = v5;
  dispatch_async(protectedDataQueue, block);

}

uint64_t __55__HDDatabase_finalizeExtendedTransactionForIdentifier___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 384), "removeObjectForKey:", *(_QWORD *)(a1 + 40));
}

- (id)databaseSizeInBytesForTypeUnprotected:(BOOL)a3 WAL:(BOOL)a4
{
  _BOOL4 v4;
  _BOOL4 v5;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  off_t v13;
  id v14;
  void *v15;
  const __CFString *v16;
  const __CFString *v17;
  void *v18;
  NSObject *v19;
  id v21;
  id v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v4 = a4;
  v5 = a3;
  v27 = *MEMORY[0x1E0C80C00];
  if (a3)
    -[HDDatabase _mainDatabaseURL](self);
  else
    -[HDDatabase _protectedDatabaseURL](self);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v4)
  {
    v9 = v7;
    v10 = v9;
    if (self)
    {
      objc_msgSend(v9, "URLByDeletingPathExtension");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "URLByAppendingPathExtension:", CFSTR("sqlite-wal"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v12 = 0;
    }

    v22 = 0;
    v13 = -[HDDatabase _fileSizeForURL:error:]((uint64_t)self, v12, (uint64_t)&v22);
    v14 = v22;

    if ((v13 & 0x8000000000000000) == 0)
      goto LABEL_8;
  }
  else
  {
    v21 = 0;
    v13 = -[HDDatabase _fileSizeForURL:error:]((uint64_t)self, v7, (uint64_t)&v21);
    v14 = v21;
    if ((v13 & 0x8000000000000000) == 0)
    {
LABEL_8:
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v13);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_19;
    }
  }
  if (v14)
  {
    v16 = CFSTR("protected");
    if (v5)
      v16 = CFSTR("unprotected");
    v17 = &stru_1E6D11BB8;
    if (v4)
      v17 = CFSTR("WAL");
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@,%@"), v16, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    _HKInitializeLogging();
    v19 = *MEMORY[0x1E0CB52B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v24 = v18;
      v25 = 2114;
      v26 = v14;
      _os_log_error_impl(&dword_1B7802000, v19, OS_LOG_TYPE_ERROR, "Failed to get database size for %@ : %{public}@", buf, 0x16u);
    }

  }
  v15 = 0;
LABEL_19:

  return v15;
}

- (_QWORD)_mainDatabaseURL
{
  if (a1)
  {
    objc_msgSend(MEMORY[0x1E0D29850], "mainDatabaseURLWithProfileDirectoryPath:", a1[4]);
    a1 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

- (_QWORD)_protectedDatabaseURL
{
  if (a1)
  {
    objc_msgSend(MEMORY[0x1E0D29850], "protectedDatabaseURLWithProfileDirectoryPath:", a1[4]);
    a1 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

- (id)databaseSizeInBytes
{
  void *v3;
  void *v4;
  BOOL v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;

  -[HDDatabase databaseSizeInBytesForTypeUnprotected:WAL:](self, "databaseSizeInBytesForTypeUnprotected:WAL:", 1, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  v5 = v3 == 0;
  if (v3)
    v6 = objc_msgSend(v3, "longLongValue");
  else
    v6 = 0;
  -[HDDatabase databaseSizeInBytesForTypeUnprotected:WAL:](self, "databaseSizeInBytesForTypeUnprotected:WAL:", 1, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
    v6 += objc_msgSend(v7, "longLongValue");
  else
    v5 = 1;
  -[HDDatabase databaseSizeInBytesForTypeUnprotected:WAL:](self, "databaseSizeInBytesForTypeUnprotected:WAL:", 0, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
    v6 += objc_msgSend(v9, "longLongValue");
  else
    v5 = 1;
  -[HDDatabase databaseSizeInBytesForTypeUnprotected:WAL:](self, "databaseSizeInBytesForTypeUnprotected:WAL:", 0, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11 && (v13 = objc_msgSend(v11, "longLongValue"), !v5))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v13 + v6);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (void)_reportDatabaseMigrationStatus:(int64_t)a3 component:(int64_t)a4 schemaVersion:(int64_t)a5 error:(id)a6
{
  id v10;
  id WeakRetained;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  uint64_t v25;

  v10 = a6;
  v24 = -[HDDatabase _newCorruptionEventStore](self, "_newCorruptionEventStore");
  if (!v10)
    goto LABEL_7;
  v25 = 0;
  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  objc_msgSend(WeakRetained, "profileIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "mostRecentMigrationFailureEventForProfile:component:schemaVersion:", v12, a4, &v25);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v13
    || (objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", -86400.0),
        v14 = (void *)objc_claimAutoreleasedReturnValue(),
        v15 = objc_msgSend(v13, "compare:", v14),
        v16 = v25,
        v14,
        v15 != 1)
    || v16 != a5)
  {
    v17 = objc_loadWeakRetained((id *)&self->_profile);
    objc_msgSend(v17, "profileIdentifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "persistMigrationFailureEventForProfile:component:schemaVersion:", v18, a4, a5);

LABEL_7:
    HDStringFromDatabaseComponentIdentifier(a4);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDDatabase profile](self, "profile");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "daemon");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "analyticsSubmissionCoordinator");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_loadWeakRetained((id *)&self->_profile);
    objc_msgSend(v22, "database_reportDatabaseMigrationStatus:database:schemaVersion:error:profileType:", a3, v19, a5, v10, objc_msgSend(v23, "profileType"));

    goto LABEL_8;
  }

LABEL_8:
}

- (void)_reportSQLiteCorruption:(id)a3 forDatabase:(int64_t)a4 shouldPrompt:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  atomic_flag *p_hasFaultedForCorruptionError;
  unsigned __int8 v10;
  NSObject *v11;
  const char *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  _BOOL8 v25;
  void *v26;
  void *v27;
  id WeakRetained;
  void *v29;
  void *v30;
  uint64_t v31;
  id v32;
  void *v33;
  uint64_t v34;
  void *v35;
  const __CFString *v36;
  HDDatabaseCorruptionTTRPrompter *v37;
  void *v38;
  void *v39;
  void *v40;
  HDDatabaseCorruptionTTRPrompter *v41;
  void *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  const __CFString *v46;
  const char *v47;
  _BOOL4 v48;
  void *v49;
  id v50;
  id v51;
  id v52;
  uint8_t buf[4];
  const char *v54;
  __int16 v55;
  id v56;
  uint64_t v57;

  v5 = a5;
  v57 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  p_hasFaultedForCorruptionError = &self->_hasFaultedForCorruptionError;
  do
    v10 = __ldaxr((unsigned __int8 *)p_hasFaultedForCorruptionError);
  while (__stlxr(1u, (unsigned __int8 *)p_hasFaultedForCorruptionError));
  if ((v10 & 1) != 0)
  {
    _HKInitializeLogging();
    v13 = *MEMORY[0x1E0CB52B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_ERROR))
    {
      v47 = "protected";
      if (!a4)
        v47 = "unprotected";
      *(_DWORD *)buf = 136315394;
      v54 = v47;
      v55 = 2112;
      v56 = v8;
      _os_log_error_impl(&dword_1B7802000, v13, OS_LOG_TYPE_ERROR, "Corruption of the %s database detected:%@", buf, 0x16u);
    }
  }
  else
  {
    _HKInitializeLogging();
    v11 = *MEMORY[0x1E0CB52B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_FAULT))
    {
      v12 = "protected";
      if (!a4)
        v12 = "unprotected";
      *(_DWORD *)buf = 136315394;
      v54 = v12;
      v55 = 2112;
      v56 = v8;
      _os_log_fault_impl(&dword_1B7802000, v11, OS_LOG_TYPE_FAULT, "Corruption of the %s database detected:%@", buf, 0x16u);
    }
  }
  v51 = -[HDDatabase _newCorruptionEventStore](self, "_newCorruptionEventStore");
  v52 = 0;
  objc_msgSend(v51, "dateOfMostRecentObliteration:", &v52);
  v48 = v5;
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = v52;
  if (v49)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)MEMORY[0x1E0CB3940];
    -[HDDatabase _protectedDatabaseURL](self);
    v16 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v15, "stringWithUTF8String:", objc_msgSend(v16, "fileSystemRepresentation"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "attributesOfItemAtPath:error:", v17, 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "fileCreationDate");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    v20 = (void *)MEMORY[0x1E0CB3940];
    -[HDDatabase _mainDatabaseURL](self);
    v21 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v20, "stringWithUTF8String:", objc_msgSend(v21, "fileSystemRepresentation"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "attributesOfItemAtPath:error:", v22, 0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "fileCreationDate");
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    if (v19 && objc_msgSend(v49, "compare:", v19) == 1)
    {
      v25 = 1;
    }
    else if (v24)
    {
      v25 = objc_msgSend(v49, "compare:", v24) == 1;
    }
    else
    {
      v25 = 0;
    }

  }
  else
  {
    v25 = 0;
  }
  -[HDDatabase profile](self, "profile");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  +[HDDatabaseCorruptionEvent createForProfile:component:error:failedObliterationReason:](HDDatabaseCorruptionEvent, "createForProfile:component:error:failedObliterationReason:", v26, a4 != 0, v8, v50);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v51, "persistCorruptionEvent:", v27);
  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  objc_msgSend(WeakRetained, "daemon");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "analyticsSubmissionCoordinator");
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  v31 = objc_msgSend(v8, "hd_sqliteExtendedErrorCode");
  v32 = objc_loadWeakRetained((id *)&self->_profile);
  objc_msgSend(v8, "localizedDescription");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "hd_failingSQLStatement");
  v34 = objc_claimAutoreleasedReturnValue();
  v35 = (void *)v34;
  if (v34)
    v36 = (const __CFString *)v34;
  else
    v36 = &stru_1E6D11BB8;
  objc_msgSend(v30, "database_reportSQLiteCorruptionWithExtendedErrorCode:type:profile:description:sqlStatement:failedObliterationAttempt:", v31, a4, v32, v33, v36, v25);

  if (v48)
  {
    v37 = [HDDatabaseCorruptionTTRPrompter alloc];
    -[HDDatabase profile](self, "profile");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "daemon");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "behavior");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = -[HDDatabaseCorruptionTTRPrompter initWithStore:behavior:](v37, "initWithStore:behavior:", v51, v40);

    -[HDDatabaseCorruptionTTRPrompter promptForEvent:](v41, "promptForEvent:", v27);
  }
  -[HDDatabase profile](self, "profile");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "daemon");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "autoBugCaptureReporter");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = objc_msgSend(v8, "hd_sqliteExtendedErrorCode");
  if (a4)
    v46 = CFSTR("protected");
  else
    v46 = CFSTR("unprotected");
  objc_msgSend(v44, "reportCorruptionForDatabase:resultCode:", v46, v45);

}

- (NSDate)mostRecentObliterationDate
{
  id v2;
  void *v3;

  v2 = -[HDDatabase _newCorruptionEventStore](self, "_newCorruptionEventStore");
  objc_msgSend(v2, "dateOfMostRecentObliteration:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDate *)v3;
}

- (id)_newCorruptionEventStore
{
  return -[HDDatabaseCorruptionEventStore initWithDelegate:]([HDDatabaseCorruptionEventStore alloc], "initWithDelegate:", self);
}

- (id)_newTTRPromptControllerWithProfile:(id)a3 domainName:(id)a4 loggingCategory:(id)a5
{
  id v7;
  id v8;
  id v9;
  HDTTRPromptController *v10;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = -[HDTTRPromptController initWithProfile:domainName:loggingCategory:]([HDTTRPromptController alloc], "initWithProfile:domainName:loggingCategory:", v7, v8, v9);

  return v10;
}

- (void)store:(id)a3 setObject:(id)a4 forKey:(id)a5
{
  id v6;
  void *v7;
  id v8;

  v8 = a4;
  v6 = a5;
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKey:", v8, v6);

}

- (id)store:(id)a3 objectForKey:(id)a4
{
  id v4;
  void *v5;
  void *v6;

  v4 = a4;
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_newDatabaseConnectionWithURL:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D29850]), "initWithDatabaseURL:", v3);

  return v4;
}

- (id)_createAndVerifyDatabaseConnectionWithType:(_QWORD *)a3 error:
{
  uint64_t v6;
  void *v7;
  void *v8;
  _QWORD *v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  id v13;
  const __CFString *v14;
  NSObject *v15;
  id WeakRetained;
  void *v17;
  id v18;
  void *v19;
  void *v21;
  id v22;
  uint8_t buf[4];
  _DWORD v24[7];

  *(_QWORD *)&v24[5] = *MEMORY[0x1E0C80C00];
  v6 = *(_QWORD *)(a1 + 32);
  if (a2)
    objc_msgSend(MEMORY[0x1E0D29850], "protectedDatabaseURLWithProfileDirectoryPath:", v6);
  else
    objc_msgSend(MEMORY[0x1E0D29850], "mainDatabaseURLWithProfileDirectoryPath:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend((id)a1, "_newDatabaseConnectionWithURL:", v7);
  objc_msgSend(v8, "setDelegate:", a1);
  if (a2 == 1)
  {
    v9 = (_QWORD *)MEMORY[0x1E0CB2AB8];
  }
  else if (a2)
  {
    _HKInitializeLogging();
    v10 = *MEMORY[0x1E0CB52B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 134217984;
      *(_QWORD *)v24 = a2;
      _os_log_fault_impl(&dword_1B7802000, v10, OS_LOG_TYPE_FAULT, "Unexpected database type (%ld), defaulting to complete protection.", buf, 0xCu);
    }
    v9 = (_QWORD *)MEMORY[0x1E0CB2AB0];
  }
  else
  {
    v9 = (_QWORD *)MEMORY[0x1E0CB2AC0];
  }
  objc_msgSend(v8, "setFileProtectionType:", *v9);

  objc_msgSend(v8, "fileURL");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0;
  v12 = objc_msgSend(v8, "openWithError:", &v22);
  v13 = v22;
  if (!(_DWORD)v12)
  {
    v17 = v8;
    goto LABEL_23;
  }
  objc_msgSend(v8, "close");

  if ((_DWORD)v12 == 26)
  {
LABEL_15:
    objc_msgSend((id)a1, "_reportSQLiteCorruption:forDatabase:shouldPrompt:", v13, a2, 1);
    v14 = CFSTR("unprotected");
    if (a2 == 1)
      v14 = CFSTR("protected");
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Corrupt %@ database (%d)"), v14, v12);
    v15 = objc_claimAutoreleasedReturnValue();
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 312));
    objc_msgSend(WeakRetained, "obliterateAndTerminateWithOptions:reason:completion:", 2, v15, 0);

    goto LABEL_22;
  }
  if ((_DWORD)v12 != 13)
  {
    if ((_DWORD)v12 != 11)
    {
      _HKInitializeLogging();
      v15 = (id)*MEMORY[0x1E0CB52B0];
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v11, "path");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 67109378;
        v24[0] = v12;
        LOWORD(v24[1]) = 2114;
        *(_QWORD *)((char *)&v24[1] + 2) = v21;
        _os_log_error_impl(&dword_1B7802000, v15, OS_LOG_TYPE_ERROR, "Unable to open database: [%d, %{public}@]", buf, 0x12u);

      }
      goto LABEL_22;
    }
    goto LABEL_15;
  }
  v15 = objc_msgSend((id)a1, "_newCorruptionEventStore");
  -[NSObject persistDeviceOutOfSpaceEvent](v15, "persistDeviceOutOfSpaceEvent");
LABEL_22:

  v17 = 0;
LABEL_23:
  v18 = v13;
  v19 = v18;
  if (v18)
  {
    if (a3)
      *a3 = objc_retainAutorelease(v18);
    else
      _HKLogDroppedError();
  }

  return v17;
}

- (uint64_t)_performMigrationWithUnprotectedDatabase:(void *)a3 protectedDatabase:(_QWORD *)a4 error:
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  HDDatabaseMigrationTransaction *v14;
  void *v15;
  HDDatabaseMigrationTransaction *v16;
  uint64_t v17;
  id v18;
  NSObject *v19;
  void *v20;
  _BOOL8 v21;
  id v22;
  double v23;
  char v24;
  id v25;
  id v26;
  void *v27;
  NSObject *v29;
  int v30;
  uint64_t v31;
  void *v32;
  void *v33;
  id v35;
  void *v36;
  id v37;
  id v38;
  _BYTE buf[24];
  void *v40;
  uint64_t v41;
  double v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v35 = a2;
  v6 = a3;
  -[HDDatabase _threadLocalTransaction]((_QWORD *)a1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    if (v6)
    {
LABEL_3:
      objc_msgSend(v7, "protectedDatabase");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", sel__performMigrationWithUnprotectedDatabase_protectedDatabase_error_, a1, CFSTR("HDDatabase.mm"), 1305, CFSTR("Migration must be performed inside a database transaction"));

    if (v6)
      goto LABEL_3;
  }
  objc_msgSend(v7, "unprotectedDatabase");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_6:
  if (v36)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "handleFailureInMethod:object:file:lineNumber:description:", sel__performMigrationWithUnprotectedDatabase_protectedDatabase_error_, a1, CFSTR("HDDatabase.mm"), 1308, CFSTR("Transaction database connection must be nil before migration"));

  }
  objc_msgSend(v7, "setPerformingMigration:", 1);
  objc_msgSend((id)a1, "profile");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "daemon");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "pluginManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "pluginsConformingToProtocol:", &unk_1EF1ADB80);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "allValues");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = [HDDatabaseMigrationTransaction alloc];
  objc_msgSend(v10, "behavior");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[HDDatabaseMigrationTransaction initWithUnprotectedDatabase:protectedDatabase:schemaProviders:behavior:](v14, "initWithUnprotectedDatabase:protectedDatabase:schemaProviders:behavior:", v35, v6, v13, v15);

  -[HDDatabaseMigrationTransaction setDelegate:](v16, "setDelegate:", a1);
  v38 = 0;
  v17 = -[HDDatabaseMigrationTransaction migrateOrCreateSchemaWithError:](v16, "migrateOrCreateSchemaWithError:", &v38);
  v18 = v38;
  if (!v17)
  {
    objc_msgSend(v7, "protectedDatabase");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v20 == 0;

    if (v21)
    {
      v17 = 0;
      goto LABEL_23;
    }
    objc_msgSend(v7, "protectedDatabase");
    v37 = v18;
    v22 = (id)objc_claimAutoreleasedReturnValue();
    if (!v22)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "handleFailureInMethod:object:file:lineNumber:description:", sel__runPostMigrationUpdatesWithDatabase_error_, a1, CFSTR("HDDatabase.mm"), 1351, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("database != nil"));

    }
    objc_msgSend((id)a1, "offsetTimeInterval");
    if (v23 == 0.0 || *(_BYTE *)(a1 + 289))
    {
      v24 = 1;
    }
    else
    {
      *(_QWORD *)buf = MEMORY[0x1E0C809B0];
      *(_QWORD *)&buf[8] = 3221225472;
      *(_QWORD *)&buf[16] = __57__HDDatabase__runPostMigrationUpdatesWithDatabase_error___block_invoke;
      v40 = &unk_1E6CF4120;
      v41 = a1;
      v42 = v23;
      v30 = objc_msgSend(v22, "performTransactionWithType:error:usingBlock:", 1, &v37, buf);
      v24 = v30;
      if (v30)
        *(_BYTE *)(a1 + 289) = 1;
    }

    v25 = v37;
    if ((v24 & 1) != 0)
    {
      v17 = 0;
      v18 = v25;
      goto LABEL_23;
    }
    _HKInitializeLogging();
    v29 = *MEMORY[0x1E0CB52B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v25;
      _os_log_error_impl(&dword_1B7802000, v29, OS_LOG_TYPE_ERROR, "Failed to run post-migration updates: %{public}@", buf, 0xCu);
    }
    v17 = 1;
    v18 = v25;
  }
  if (objc_msgSend(v18, "hd_isCorruptionError"))
  {
    objc_msgSend((id)a1, "setCorruptedMigrationAttemptsCount:", objc_msgSend((id)a1, "corruptedMigrationAttemptsCount") + 1);
    if (objc_msgSend((id)a1, "corruptedMigrationAttemptsCount") >= 6)
    {
      _HKInitializeLogging();
      v19 = (id)*MEMORY[0x1E0CB52B0];
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        v31 = objc_msgSend((id)a1, "corruptedMigrationAttemptsCount");
        *(_DWORD *)buf = 138412546;
        *(_QWORD *)&buf[4] = a1;
        *(_WORD *)&buf[12] = 2048;
        *(_QWORD *)&buf[14] = v31;
        _os_log_error_impl(&dword_1B7802000, v19, OS_LOG_TYPE_ERROR, "%@ received database corruption errors from %ld migration attempts.", buf, 0x16u);
      }

      v17 = 2;
    }
  }
LABEL_23:
  v26 = v18;
  v27 = v26;
  if (v26)
  {
    if (a4)
      *a4 = objc_retainAutorelease(v26);
    else
      _HKLogDroppedError();
  }

  objc_msgSend(v7, "setPerformingMigration:", 0);
  return v17;
}

- (void)_reportMigrationResultIfNecessaryForStatus:(void *)a3 database:(unsigned int)a4 protectedDatabase:(void *)a5 error:
{
  id v9;
  id v10;
  void *v11;
  __CFString *v12;
  uint64_t v13;
  os_log_t *v14;
  NSObject *v15;
  __CFString *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  __CFString *v22;
  id v23;
  id v24;
  uint8_t buf[4];
  __CFString *v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a5;
  v11 = v10;
  if ((a2 > 4 || ((1 << a2) & 0x19) == 0) && (objc_msgSend(v10, "hk_isDatabaseSchemaRolledBackError") & 1) == 0)
  {
    v12 = CFSTR("unprotected");
    if (a4)
      v12 = CFSTR("protected");
    v22 = v12;
    HDDatabaseMigrationStatusToString(a2);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = 0;
    v13 = objc_msgSend(v9, "userVersionWithDatabaseName:error:", 0, &v24);
    v23 = v24;
    v14 = (os_log_t *)MEMORY[0x1E0CB52B0];
    if (v13 == -1)
    {
      _HKInitializeLogging();
      v15 = *v14;
      if (os_log_type_enabled(*v14, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        v26 = v22;
        v27 = 2114;
        v28 = v23;
        _os_log_error_impl(&dword_1B7802000, v15, OS_LOG_TYPE_ERROR, "Unable to get schema version for database %{public}@: %{public}@", buf, 0x16u);
      }
    }
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ %@ %lld"), v22, v21, v13);
    v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
    _HKInitializeLogging();
    v17 = *v14;
    if (os_log_type_enabled(*v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v26 = v16;
      v27 = 2114;
      v28 = v11;
      _os_log_error_impl(&dword_1B7802000, v17, OS_LOG_TYPE_ERROR, "Report %{public}@ database migration failure %{public}@", buf, 0x16u);
    }
    objc_msgSend(a1, "profile");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "daemon");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "autoBugCaptureReporter");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "reportDatabaseMigrationFailureWithContext:", v16);

    objc_msgSend(a1, "_reportDatabaseMigrationStatus:component:schemaVersion:error:", a2, a4, v13, v11);
  }

}

void __74__HDDatabase__migrateOrCreateProtectedSchemaInDatabase_transaction_error___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  unsigned __int8 v5;
  id obj;

  objc_msgSend(*(id *)(a1 + 32), "setRequiresWrite:", 1);
  objc_msgSend(*(id *)(a1 + 32), "setHighPriority:", 0);
  v3 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  obj = *(id *)(v4 + 40);
  v5 = objc_msgSend(v2, "performTransactionWithContext:error:block:inaccessibilityHandler:", v3, &obj, &__block_literal_global_70, 0);
  objc_storeStrong((id *)(v4 + 40), obj);
  atomic_store(v5, (unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24));
}

uint64_t __74__HDDatabase__migrateOrCreateProtectedSchemaInDatabase_transaction_error___block_invoke_2()
{
  return 1;
}

uint64_t __57__HDDatabase__runPostMigrationUpdatesWithDatabase_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  id v19;
  _QWORD v20[6];
  uint64_t v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = *(void **)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v19 = a2;
  if (v4)
  {
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    v6 = (void *)objc_opt_class();
    objc_msgSend(v4, "profile");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "daemon");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "behavior");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "allEntityClassesWithBehavior:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (v11)
    {
      v12 = *(_QWORD *)v23;
      v13 = MEMORY[0x1E0C809B0];
      do
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v23 != v12)
            objc_enumerationMutation(v10);
          v15 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * v14);
          v21 = 0;
          if (objc_msgSend(v15, "isSubclassOfClass:", objc_opt_class()))
          {
            objc_msgSend(v15, "updateSQLForTimeOffsetWithBindingCount:", &v21);
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            if (v16)
            {
              v20[0] = v13;
              v20[1] = 3221225472;
              v20[2] = __54__HDDatabase__applyOffsetTimeInterval_database_error___block_invoke;
              v20[3] = &__block_descriptor_48_e23_v16__0__sqlite3_stmt__8l;
              v20[4] = v21;
              v20[5] = v5;
              if ((objc_msgSend(v19, "executeUncachedSQL:error:bindingHandler:enumerationHandler:", v16, a3, v20, 0) & 1) == 0)
              {

                v17 = 0;
                goto LABEL_15;
              }
            }
          }
          else
          {
            v16 = 0;
          }

          ++v14;
        }
        while (v11 != v14);
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      }
      while (v11);
    }
    v17 = 1;
LABEL_15:

  }
  else
  {
    v17 = 0;
  }

  return v17;
}

uint64_t __54__HDDatabase__applyOffsetTimeInterval_database_error___block_invoke(uint64_t result, sqlite3_stmt *a2)
{
  uint64_t v3;
  unint64_t v4;

  if (*(_QWORD *)(result + 32))
  {
    v3 = result;
    v4 = 0;
    do
      result = sqlite3_bind_double(a2, ++v4, *(double *)(v3 + 40));
    while (*(_QWORD *)(v3 + 32) > v4);
  }
  return result;
}

- (void)migrationTransaction:(id)a3 didCreateDatabasesWithIdentifier:(id)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  _HKInitializeLogging();
  v6 = *MEMORY[0x1E0CB52B0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_DEFAULT))
  {
    v13 = 138543362;
    v14 = v5;
    _os_log_impl(&dword_1B7802000, v6, OS_LOG_TYPE_DEFAULT, "Inserting identifier %{public}@ in user defaults", (uint8_t *)&v13, 0xCu);
  }
  -[HDDatabase profile](self, "profile");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "profileIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3A28], "hk_UUIDWithData:", v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "UUIDString");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  HDDatabaseIdentifierDefaultKeyForProfileIdentifier(v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKey:", v11, v12);

}

- (void)migrationTransaction:(id)a3 didEncounterDatabaseMismatchWithUnprotectedIdentifier:(id)a4 protectedIdentifier:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a4;
  v7 = a5;
  -[HDDatabase profile](self, "profile");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "daemon");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "analyticsSubmissionCoordinator");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "database_reportUnprotectedDatabaseIdentifier:doesNotMatchProtectedDatabaseIdentifier:", v11, v7);

}

- (void)migrationTransaction:(id)a3 reportHFDMigrationStatus:(int64_t)a4 schemaVersion:(int64_t)a5 error:(id)a6
{
  -[HDDatabase _reportDatabaseMigrationStatus:component:schemaVersion:error:](self, "_reportDatabaseMigrationStatus:component:schemaVersion:error:", a6 != 0, 2, a5);
}

- (id)migrationTransaction:(id)a3 entityClassesWithBehavior:(id)a4
{
  +[HDDatabase allEntityClassesWithBehavior:](HDDatabase, "allEntityClassesWithBehavior:", a4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)assertionManager:(id)a3 assertionInvalidated:(id)a4
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_protectedDataQueue);
  -[HDDatabase _protectedDataQueue_flushProtectedDataIfNecessary]((uint64_t)self);
}

- (void)_protectedDataQueue_flushProtectedDataIfNecessary
{
  uint64_t v2;
  void *v3;
  BOOL isProtectedDataFlushDeadline;
  __CFString *v5;
  NSObject *v6;
  const __CFString *v7;
  uint8_t buf[4];
  const __CFString *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 72));
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    v2 = *(_QWORD *)(a1 + 104);
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
    if (v2 == 2 && !*(_BYTE *)(a1 + 208))
    {
      objc_msgSend(*(id *)(a1 + 336), "activeAssertionsForIdentifier:", CFSTR("DatabaseAccessibility"));
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v3, "count"))
      {
        os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
        isProtectedDataFlushDeadline = -[HDDatabase _protectedDataLock_isProtectedDataFlushDeadlinePassed](a1);
        os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
        if (!isProtectedDataFlushDeadline)
        {
          v5 = 0;
LABEL_14:

          return;
        }
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(" with %lu active assertions"), objc_msgSend(v3, "count"));
        v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v5 = 0;
      }
      _HKInitializeLogging();
      v6 = *MEMORY[0x1E0CB52B0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_DEFAULT))
      {
        v7 = &stru_1E6D11BB8;
        if (v5)
          v7 = v5;
        *(_DWORD *)buf = 138543362;
        v9 = v7;
        _os_log_impl(&dword_1B7802000, v6, OS_LOG_TYPE_DEFAULT, "Flushing protected data%{public}@", buf, 0xCu);
      }
      -[HDDatabase _protectedDataQueue_flushProtectedData](a1);
      goto LABEL_14;
    }
  }
}

- (id)checkOutProtectedDatabase:(id)a3 error:(id *)a4
{
  -[HDDatabase _checkOutDatabaseForTransaction:databaseType:error:](self, a3, 1, a4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_checkOutDatabaseForTransaction:(uint64_t)a3 databaseType:(_QWORD *)a4 error:
{
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  char v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  id v26;
  __CFString *v27;
  unint64_t v28;
  void *v29;
  id v30;
  NSObject *v31;
  NSObject *v32;
  NSObject *v33;
  id WeakRetained;
  uint64_t v35;
  __CFString *v36;
  __CFString *v37;
  void *v38;
  void *v39;
  dispatch_block_t v40;
  dispatch_time_t v41;
  intptr_t v42;
  unsigned __int8 v43;
  NSObject *v44;
  id v45;
  void *v46;
  const __CFString *v48;
  void *v49;
  char v50;
  void *v51;
  void *v52;
  void *v53;
  id v54;
  id v55;
  id v56;
  uint64_t block;
  uint64_t v58;
  void (*v59)(uint64_t);
  void *v60;
  id v61;
  id v62;
  __int128 *p_buf;
  id *v64;
  id v65;
  id *v66;
  uint64_t v67;
  char v68;
  __int128 buf;
  uint64_t v70;
  uint64_t (*v71)(uint64_t, uint64_t);
  void (*v72)(uint64_t);
  id v73;
  uint64_t v74;

  v74 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  if (a1)
  {
    if ((-[HDDatabase _isDatabaseValidWithError:]((os_unfair_lock_s *)a1, (uint64_t)a4) & 1) != 0)
    {
      objc_msgSend(v7, "rootContext");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "requiresWrite");
      if ((_DWORD)v9)
      {
        if (objc_msgSend(v8, "highPriority"))
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v49, "handleFailureInMethod:object:file:lineNumber:description:", sel__checkOutDatabaseForTransaction_databaseType_error_, a1, CFSTR("HDDatabase.mm"), 1558, CFSTR("Transaction may not be both high priority and write"));

        }
        v10 = 1;
      }
      else if (objc_msgSend(v8, "highPriority"))
      {
        v10 = 2;
      }
      else
      {
        v10 = 0;
      }
      if (objc_msgSend(v8, "requiresNewDatabaseConnection"))
        v11 = v10 | 8;
      else
        v11 = v10;
      if (a3 == 1)
      {
        v12 = v7;
        v13 = -[HDDatabase _protectedDataState]((uint64_t)a1);
        if (v13)
        {
          if (v13 != 1)
          {
            if (v13 != 2)
            {
LABEL_68:

              a1 = 0;
LABEL_77:

              goto LABEL_78;
            }
            v55 = v12;
            objc_msgSend(v55, "rootContext");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "accessibilityAssertions");
            v15 = (void *)objc_claimAutoreleasedReturnValue();

            if (!objc_msgSend(v15, "count"))
              goto LABEL_21;
            os_unfair_lock_lock((os_unfair_lock_t)a1 + 20);
            if (-[HDDatabase _protectedDataLock_isProtectedDataFlushDeadlinePassed]((uint64_t)a1))
            {
              os_unfair_lock_unlock((os_unfair_lock_t)a1 + 20);
LABEL_21:

LABEL_22:
              objc_msgSend(MEMORY[0x1E0CB35C8], "hk_protectedDataInaccessibilityError");
              v16 = (id)objc_claimAutoreleasedReturnValue();
              v17 = v16;
              if (v16)
              {
                if (a4)
                  *a4 = objc_retainAutorelease(v16);
                else
                  _HKLogDroppedError();
              }

              goto LABEL_68;
            }
            objc_msgSend(*((id *)a1 + 42), "activeAssertionsForIdentifier:", CFSTR("DatabaseAccessibility"));
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            v50 = objc_msgSend(v52, "intersectsSet:", v15);

            os_unfair_lock_unlock((os_unfair_lock_t)a1 + 20);
            if ((v50 & 1) == 0)
              goto LABEL_22;
          }
        }
        else
        {
          objc_msgSend(v12, "rootContext");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = objc_msgSend(v18, "skipJournalMerge");

          if ((v19 & 1) == 0)
          {
            objc_msgSend(MEMORY[0x1E0CB35C8], "hk_protectedDataInaccessibilityError");
            v20 = (id)objc_claimAutoreleasedReturnValue();
            v21 = v20;
            if (v20)
            {
              if (a4)
                *a4 = objc_retainAutorelease(v20);
              else
                _HKLogDroppedError();
            }

            v44 = *((_QWORD *)a1 + 9);
            block = MEMORY[0x1E0C809B0];
            v58 = 3221225472;
            v59 = __62__HDDatabase__canAccessProtectedDatabaseForTransaction_error___block_invoke;
            v60 = &unk_1E6CF3F98;
            v61 = a1;
            dispatch_async(v44, &block);
            goto LABEL_68;
          }
        }

        if ((objc_msgSend(v8, "requiresNewDatabaseConnection") & 1) == 0
          && !objc_msgSend(*((id *)a1 + 50), "isProtectedDataAvailable"))
        {
          v11 |= 4uLL;
        }
      }
      objc_msgSend(a1, "databasePoolForDatabaseType:", a3);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "checkOutConnectionWithOptions:error:", v11, a4);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = v23;
      if (!v23)
        goto LABEL_65;
      objc_msgSend(v23, "setWriter:", v9);
      if (a3 == 1)
      {
        v25 = v24;
        v56 = v7;
        v26 = v25;
        objc_msgSend(*((id *)a1 + 43), "lock");
        if ((-[HDDatabase _isDatabaseValidWithError:]((os_unfair_lock_s *)a1, (uint64_t)a4) & 1) == 0)
        {
          objc_msgSend(*((id *)a1 + 43), "unlock");

          goto LABEL_64;
        }
        if ((objc_msgSend(*((id *)a1 + 46), "containsObject:", v26) & 1) != 0)
        {
          v27 = 0;
          v28 = 0;
        }
        else
        {
          -[HDDatabase _createAndVerifyDatabaseConnectionWithType:error:]((uint64_t)a1, 0, a4);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v30 = v26;
          v53 = v30;
          if (v29)
          {
            v65 = 0;
            v28 = -[HDDatabase _performMigrationWithUnprotectedDatabase:protectedDatabase:error:]((uint64_t)a1, v29, v30, &v65);
            v27 = (__CFString *)v65;
            objc_msgSend(v29, "close");

          }
          else
          {
            _HKInitializeLogging();
            v31 = *MEMORY[0x1E0CB52B0];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_ERROR))
            {
              LOWORD(buf) = 0;
              _os_log_error_impl(&dword_1B7802000, v31, OS_LOG_TYPE_ERROR, "Failed to open unprotected database to perform protected migration", (uint8_t *)&buf, 2u);
            }
            v27 = 0;
            v28 = 1;
          }
          -[HDDatabase _reportMigrationResultIfNecessaryForStatus:database:protectedDatabase:error:](a1, v28, v53, 1u, v27);
          if (v28 - 1 > 2)
          {
            if (!v28)
              objc_msgSend(*((id *)a1 + 46), "addObject:", v53);
          }
          else
          {
            _HKInitializeLogging();
            v32 = *MEMORY[0x1E0CB52B0];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_ERROR))
            {
              v48 = CFSTR("(intentional)");
              if (v27)
                v48 = v27;
              LODWORD(buf) = 138543362;
              *(_QWORD *)((char *)&buf + 4) = v48;
              _os_log_error_impl(&dword_1B7802000, v32, OS_LOG_TYPE_ERROR, "Failed to migrate schema for protected database: %{public}@", (uint8_t *)&buf, 0xCu);
            }
            if (v28 == 2)
            {
              _HKInitializeLogging();
              v33 = *MEMORY[0x1E0CB52B0];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_ERROR))
              {
                LOWORD(buf) = 0;
                _os_log_error_impl(&dword_1B7802000, v33, OS_LOG_TYPE_ERROR, "Destroying both databases - fatal error while accessing protected database", (uint8_t *)&buf, 2u);
              }
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Fatal migration failure accessing protected database: %@"), v27);
              v51 = (void *)objc_claimAutoreleasedReturnValue();
              WeakRetained = objc_loadWeakRetained((id *)a1 + 39);
              objc_msgSend(WeakRetained, "obliterateAndTerminateWithOptions:reason:completion:", 0, v51, 0);

              objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:description:", 100, CFSTR("Invalid database pair (removed)"));
              v35 = objc_claimAutoreleasedReturnValue();

              v27 = (__CFString *)v35;
            }
          }

        }
        objc_msgSend(*((id *)a1 + 43), "unlock");
        v36 = v27;
        v37 = v36;
        if (v36)
        {
          if (a4)
            *a4 = objc_retainAutorelease(v36);
          else
            _HKLogDroppedError();
        }

        if (v28 == 4)
        {
          v65 = 0;
          v66 = &v65;
          v67 = 0x2020000000;
          v68 = 0;
          *(_QWORD *)&buf = 0;
          *((_QWORD *)&buf + 1) = &buf;
          v70 = 0x3032000000;
          v71 = __Block_byref_object_copy__68;
          v72 = __Block_byref_object_dispose__68;
          v73 = 0;
          objc_msgSend(v56, "rootContext");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          v39 = (void *)objc_msgSend(v38, "mutableCopy");

          block = MEMORY[0x1E0C809B0];
          v58 = 3221225472;
          v59 = __74__HDDatabase__migrateOrCreateProtectedSchemaInDatabase_transaction_error___block_invoke;
          v60 = &unk_1E6CF40F8;
          v54 = v39;
          v61 = v54;
          v62 = a1;
          p_buf = &buf;
          v64 = &v65;
          v40 = dispatch_block_create(DISPATCH_BLOCK_INHERIT_QOS_CLASS, &block);
          HKDispatchAsyncOnGlobalConcurrentQueue();
          v41 = dispatch_time(0, 60000000000);
          v42 = dispatch_block_wait(v40, v41);
          v43 = atomic_load((unsigned __int8 *)v66 + 24);
          if ((v43 & 1) == 0)
          {
            if (v42)
            {
              objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:description:", a4, 103, CFSTR("Timed out waiting for protected database migration transaction."));
            }
            else
            {
              v45 = *(id *)(*((_QWORD *)&buf + 1) + 40);
              v46 = v45;
              if (v45)
              {
                if (a4)
                  *a4 = objc_retainAutorelease(v45);
                else
                  _HKLogDroppedError();
              }

            }
          }

          _Block_object_dispose(&buf, 8);
          _Block_object_dispose(&v65, 8);

          if ((v43 & 1) != 0)
            goto LABEL_75;
          goto LABEL_64;
        }

        if (v28)
        {
LABEL_64:
          -[HDDatabase _checkInDatabase:type:flushImmediately:](a1, v26, 1, 1);
LABEL_65:
          a1 = 0;
LABEL_76:

          goto LABEL_77;
        }
      }
LABEL_75:
      -[HDDatabase _updateInactivityFlushTimer]((uint64_t)a1);
      a1 = v24;
      goto LABEL_76;
    }
    a1 = 0;
  }
LABEL_78:

  return a1;
}

- (id)checkOutUnprotectedDatabase:(id)a3 error:(id *)a4
{
  -[HDDatabase _checkOutDatabaseForTransaction:databaseType:error:](self, a3, 0, a4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)checkOutProtectedResources:(id)a3 error:(id *)a4
{
  id v5;
  void *WeakRetained;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  NSMutableDictionary *protectedResourceAssertionsByIdentifier;
  NSMutableDictionary *v16;
  NSMutableDictionary *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  NSMutableDictionary *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  id v30;
  uint64_t v31;
  void *v32;
  id v33;
  char v35;
  NSHashTable *obj;
  id v38;
  uint64_t v39;
  uint64_t v40;
  id v41;
  void *v42;
  os_unfair_lock_t lock;
  id v44;
  id v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  uint8_t v50[128];
  uint8_t buf[4];
  void *v52;
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v41 = a3;
  v38 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v5 = objc_alloc(MEMORY[0x1E0CB3940]);
  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  objc_msgSend(WeakRetained, "profileIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = (void *)objc_msgSend(v5, "initWithFormat:", CFSTR("%@:%@"), CFSTR("HDDatabase"), v8);

  v48 = 0u;
  v49 = 0u;
  v46 = 0u;
  v47 = 0u;
  obj = self->_protectedResourceStores;
  v9 = -[NSHashTable countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v46, v50, 16);
  if (!v9)
  {

LABEL_36:
    v32 = (void *)objc_msgSend(v38, "copy");
    goto LABEL_47;
  }
  v39 = v9;
  v40 = *(_QWORD *)v47;
  lock = &self->_protectedResourceAssertionsLock;
  v35 = 1;
  do
  {
    v10 = 0;
    v11 = WeakRetained;
    do
    {
      if (*(_QWORD *)v47 != v40)
        objc_enumerationMutation(obj);
      v12 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * v10);
      v45 = 0;
      v13 = v12;
      v14 = v42;
      os_unfair_lock_lock(lock);
      protectedResourceAssertionsByIdentifier = self->_protectedResourceAssertionsByIdentifier;
      if (!protectedResourceAssertionsByIdentifier)
      {
        v16 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
        v17 = self->_protectedResourceAssertionsByIdentifier;
        self->_protectedResourceAssertionsByIdentifier = v16;

        protectedResourceAssertionsByIdentifier = self->_protectedResourceAssertionsByIdentifier;
      }
      objc_msgSend(v13, "protectedResourceIdentifier");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary objectForKeyedSubscript:](protectedResourceAssertionsByIdentifier, "objectForKeyedSubscript:", v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      if (v19 && objc_msgSend(v19, "state") != 3)
      {
        v22 = v19;
      }
      else
      {
        if (objc_msgSend(v19, "state") == 3)
        {
          _HKInitializeLogging();
          v20 = (id)*MEMORY[0x1E0CB52B0];
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v13, "protectedResourceIdentifier");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543362;
            v52 = v21;
            _os_log_impl(&dword_1B7802000, v20, OS_LOG_TYPE_DEFAULT, "Protected resource assertion for %{public}@ is unexpectedly invalid", buf, 0xCu);

          }
        }
        objc_msgSend(v13, "requestProtectedResourceAccessAssertionForOwnerIdentifier:error:", v14, &v45);
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        if (v22)
        {
          v23 = self->_protectedResourceAssertionsByIdentifier;
          objc_msgSend(v13, "protectedResourceIdentifier");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableDictionary setObject:forKeyedSubscript:](v23, "setObject:forKeyedSubscript:", v22, v24);

        }
      }
      os_unfair_lock_unlock(lock);

      v25 = v45;
      v26 = v25;
      if (!v22)
      {
        if (v25)
        {
          v33 = v25;
          goto LABEL_40;
        }
        objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:format:", 122, CFSTR("Protected data store %@ failed to acquire protected resource assertion without providing an error."), v13);
        v33 = (id)objc_claimAutoreleasedReturnValue();
        if (v33)
        {
LABEL_40:
          if (a4)
            *a4 = objc_retainAutorelease(v33);
          else
            _HKLogDroppedError();

          if (!v26)
            goto LABEL_44;
        }
        else
        {
LABEL_44:

        }
        goto LABEL_46;
      }
      v44 = 0;
      objc_msgSend(v13, "checkOutProtectedResourceWithAssertion:transaction:error:", v22, v41, &v44);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = v44;
      v29 = v28;
      if (v27)
      {
        objc_msgSend(v13, "protectedResourceIdentifier");
        WeakRetained = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "setObject:forKeyedSubscript:", v27, WeakRetained);
LABEL_20:

        WeakRetained = v11;
        goto LABEL_28;
      }
      if (v28)
      {
        v30 = v28;
        WeakRetained = v11;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:format:", 122, CFSTR("Protected data store %@ failed to check out a required protected resource without providing an error."), v13);
        v30 = (id)objc_claimAutoreleasedReturnValue();
        WeakRetained = v30;
        if (!v30)
        {
          v35 = 0;
          v11 = 0;
          goto LABEL_20;
        }
      }
      if (a4)
        *a4 = objc_retainAutorelease(v30);
      else
        _HKLogDroppedError();

      v35 = 0;
      v11 = WeakRetained;
      if (!v29)
        goto LABEL_20;
LABEL_28:

      if (!v27)
        goto LABEL_33;
      ++v10;
      v11 = WeakRetained;
    }
    while (v39 != v10);
    v31 = -[NSHashTable countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v46, v50, 16);
    v39 = v31;
  }
  while (v31);
LABEL_33:

  if ((v35 & 1) != 0)
    goto LABEL_36;
LABEL_46:
  -[HDDatabase _checkInProtectedResources:]((uint64_t)self, v38);
  v32 = 0;
LABEL_47:

  return v32;
}

- (void)_checkInProtectedResources:(uint64_t)a1
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (a1)
  {
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    v4 = *(id *)(a1 + 264);
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v5)
    {
      v6 = *(_QWORD *)v12;
      do
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v12 != v6)
            objc_enumerationMutation(v4);
          v8 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
          objc_msgSend(v8, "protectedResourceIdentifier", (_QWORD)v11);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "objectForKeyedSubscript:", v9);
          v10 = (void *)objc_claimAutoreleasedReturnValue();

          if (v10)
            objc_msgSend(v8, "checkInProtectedResource:", v10);

        }
        v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v5);
    }

  }
}

- (void)checkInDatabase:(id)a3 type:(int64_t)a4 protectedResources:(id)a5
{
  id v8;
  id v9;

  v9 = a3;
  v8 = a5;
  -[HDDatabase _checkInDatabase:type:flushImmediately:](self, v9, a4, 0);
  if (a4 == 1 && v8)
    -[HDDatabase _checkInProtectedResources:]((uint64_t)self, v8);
  -[HDDatabase _updateInactivityFlushTimer]((uint64_t)self);

}

- (void)_checkInDatabase:(uint64_t)a3 type:(uint64_t)a4 flushImmediately:
{
  id v7;
  void *v8;
  char v9;
  id v10;
  NSObject *v11;
  char v12;
  id v13;
  void *v14;
  NSObject *v15;
  void *v16;
  BOOL v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  uint8_t buf[4];
  id v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = v7;
  if (a1)
  {
    if (objc_msgSend(v7, "checkpointRequired"))
    {
      v23 = 0;
      v9 = objc_msgSend(v8, "executeUncachedSQL:error:bindingHandler:enumerationHandler:", CFSTR("PRAGMA wal_checkpoint(truncate)"), &v23, 0, 0);
      v10 = v23;
      if ((v9 & 1) == 0)
      {
        _HKInitializeLogging();
        v11 = *MEMORY[0x1E0CB52B0];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          v25 = v10;
          _os_log_error_impl(&dword_1B7802000, v11, OS_LOG_TYPE_ERROR, "Failed to truncate the wal after a transaction requiring checkpointing: %{public}@", buf, 0xCu);
        }
      }
      objc_msgSend(v8, "setCheckpointRequired:", 0);

    }
    if (objc_msgSend(v8, "isWriter"))
    {
      v22 = 0;
      v12 = objc_msgSend(v8, "incrementalVacuumDatabaseIfNeeded:error:", 0, &v22);
      v13 = v22;
      if ((v12 & 1) == 0)
      {
        _HKInitializeLogging();
        v14 = (void *)*MEMORY[0x1E0CB52B0];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_DEBUG))
        {
          v15 = v14;
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
          {
            HDStringFromHDDatabaseType(a3);
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v25 = v13;
            v26 = 2114;
            v27 = v21;
            _os_log_debug_impl(&dword_1B7802000, v15, OS_LOG_TYPE_DEBUG, "Error vacuuming %{public}@ database: %{public}@", buf, 0x16u);

          }
        }
      }
      -[HDDatabase _mergeSecondaryJournals]((uint64_t)a1);

    }
    objc_msgSend(v8, "corruptionError");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v16 == 0;

    if (!v17)
    {
      objc_msgSend(v8, "corruptionError");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "_reportSQLiteCorruption:forDatabase:shouldPrompt:", v18, a3, 1);

      a4 = 1;
    }
    if (objc_msgSend(v8, "encounteredOutOfSpace"))
    {
      v19 = (void *)objc_msgSend(a1, "_newCorruptionEventStore");
      objc_msgSend(v19, "persistDeviceOutOfSpaceEvent");

      objc_msgSend(v8, "setEncounteredOutOfSpace:", 0);
    }
    objc_msgSend(a1, "databasePoolForDatabaseType:", a3);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "checkInConnection:flushImmediately:", v8, a4);

  }
}

- (void)_updateInactivityFlushTimer
{
  NSObject *v1;
  _QWORD block[5];

  if (a1)
  {
    v1 = *(NSObject **)(a1 + 72);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __41__HDDatabase__updateInactivityFlushTimer__block_invoke;
    block[3] = &unk_1E6CF3F98;
    block[4] = a1;
    dispatch_async(v1, block);
  }
}

- (void)_mergeSecondaryJournals
{
  unsigned __int8 *v2;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  NSObject *v8;
  _QWORD block[5];
  _QWORD v10[4];
  id v11;
  id location;

  if (a1)
  {
    v2 = (unsigned __int8 *)(a1 + 232);
    do
    {
      if (__ldaxr(v2))
      {
        __clrex();
        return;
      }
    }
    while (__stlxr(1u, v2));
    objc_msgSend(MEMORY[0x1E0CB6F18], "sharedBehavior");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "features");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "xpcGatedSecondaryJournalMerge");

    if (v6)
    {
      objc_initWeak(&location, (id)a1);
      v7 = *(void **)(a1 + 240);
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __37__HDDatabase__mergeSecondaryJournals__block_invoke;
      v10[3] = &unk_1E6CF4250;
      objc_copyWeak(&v11, &location);
      objc_msgSend(v7, "requestRunWithMaximumDelay:completion:", v10, 300.0);
      objc_destroyWeak(&v11);
      objc_destroyWeak(&location);
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 304), "mergeQueue");
      v8 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __37__HDDatabase__mergeSecondaryJournals__block_invoke_2;
      block[3] = &unk_1E6CF3F98;
      block[4] = a1;
      dispatch_async(v8, block);

    }
  }
}

- (id)newConnectionForPool:(id)a3 error:(id *)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  unint64_t v16;
  __CFString *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id WeakRetained;
  id v24;
  void *v25;
  const __CFString *v27;
  void *v28;
  id v29;
  id v30;
  uint8_t buf[4];
  const __CFString *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if ((-[HDDatabase _isDatabaseValidWithError:]((os_unfair_lock_s *)self, (uint64_t)a4) & 1) != 0)
  {
    -[NSConditionLock lock](self->_activeDatabasesLock, "lock");
    v7 = v6;
    -[HDDatabase databasePoolForDatabaseType:](self, "databasePoolForDatabaseType:", 0);
    v8 = (id)objc_claimAutoreleasedReturnValue();

    -[HDDatabase databasePoolForDatabaseType:](self, "databasePoolForDatabaseType:", 1);
    v9 = (id)objc_claimAutoreleasedReturnValue();

    if (v8 != v7 && v9 != v7)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "handleFailureInMethod:object:file:lineNumber:description:", sel__databaseTypeForDatabasePool_, self, CFSTR("HDDatabase.mm"), 516, CFSTR("Database pool %@ not created by %@"), v7, self);

    }
    if ((-[HDDatabase _isDatabaseValidWithError:]((os_unfair_lock_s *)self, (uint64_t)a4) & 1) == 0)
      goto LABEL_29;
    -[NSLock lock](self->_schemaMigrationLock, "lock");
    v30 = 0;
    -[HDDatabase _createAndVerifyDatabaseConnectionWithType:error:]((uint64_t)self, v8 != v7, &v30);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (uint64_t)v30;
    if (v10)
    {
      if (v8 == v7)
        v12 = (void *)v10;
      else
        v12 = 0;
      if (v8 == v7)
        v13 = 0;
      else
        v13 = (void *)v10;
      v14 = v12;
      v15 = v13;
      if (v8 == v7)
      {
        v29 = (id)v11;
        v16 = -[HDDatabase _performMigrationWithUnprotectedDatabase:protectedDatabase:error:]((uint64_t)self, (void *)v10, 0, &v29);
        v17 = (__CFString *)v29;

        v11 = (uint64_t)v17;
        -[HDDatabase _reportMigrationResultIfNecessaryForStatus:database:protectedDatabase:error:](self, v16, (void *)v10, 0, v17);
        if (v16)
        {
          _HKInitializeLogging();
          v18 = *MEMORY[0x1E0CB52B0];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_ERROR))
          {
            v27 = CFSTR("(intentional)");
            if (v17)
              v27 = v17;
            *(_DWORD *)buf = 138543362;
            v32 = v27;
            _os_log_error_impl(&dword_1B7802000, v18, OS_LOG_TYPE_ERROR, "Failed to migrate database: %{public}@", buf, 0xCu);
          }
          if (v16 == 2)
          {
            v19 = (void *)MEMORY[0x1E0CB3940];
            objc_msgSend((id)v10, "fileURL");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "path");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "stringWithFormat:", CFSTR("Failed migrations for %@, error: %@"), v21, v11);
            v22 = (void *)objc_claimAutoreleasedReturnValue();

            WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
            objc_msgSend(WeakRetained, "obliterateAndTerminateWithOptions:reason:completion:", 0, v22, 0);

          }
          objc_msgSend((id)v10, "close");

          v10 = 0;
        }
      }

    }
    -[NSLock unlock](self->_schemaMigrationLock, "unlock");
    if (!(v10 | v11))
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:description:", 100, CFSTR("Failed to open database"));
      v11 = objc_claimAutoreleasedReturnValue();
    }
    v24 = (id)v11;
    v25 = v24;
    if (v24)
    {
      if (a4)
        *a4 = objc_retainAutorelease(v24);
      else
        _HKLogDroppedError();
    }

    if (v10)
      -[NSMutableSet addObject:](self->_activeDatabases, "addObject:", v10);
    else
LABEL_29:
      v10 = 0;
    -[NSConditionLock unlockWithCondition:](self->_activeDatabasesLock, "unlockWithCondition:", -[NSMutableSet count](self->_activeDatabases, "count") != 0);
  }
  else
  {
    v10 = 0;
  }

  return (id)v10;
}

- (void)databasePool:(id)a3 didFlushConnections:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  -[NSConditionLock lock](self->_activeDatabasesLock, "lock");
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        -[NSMutableSet removeObject:](self->_activeDatabases, "removeObject:", v10, (_QWORD)v11);
        objc_msgSend(v10, "close");
      }
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

  -[NSConditionLock unlockWithCondition:](self->_activeDatabasesLock, "unlockWithCondition:", -[NSMutableSet count](self->_activeDatabases, "count") != 0);
}

void __41__HDDatabase__updateInactivityFlushTimer__block_invoke(uint64_t a1)
{
  -[HDDatabase _protectedDataQueue_updateInactivityFlushTimer](*(_QWORD *)(a1 + 32));
}

- (void)_protectedDataQueue_updateInactivityFlushTimer
{
  void *v2;
  uint64_t v3;
  NSObject *v4;
  void *v5;
  dispatch_source_t v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  dispatch_time_t v10;
  _QWORD v11[4];
  id v12;
  id location;

  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 72));
    objc_msgSend((id)a1, "databasePoolForDatabaseType:", 0);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v2, "checkedOutDatabaseCount");

    if (v3 || *(double *)(a1 + 424) <= 0.0 || *(_BYTE *)(a1 + 136))
    {
      v4 = *(NSObject **)(a1 + 128);
      if (v4)
      {
        dispatch_source_cancel(v4);
        v5 = *(void **)(a1 + 128);
        *(_QWORD *)(a1 + 128) = 0;

      }
      if (v3 >= 1)
        *(_BYTE *)(a1 + 136) = 0;
    }
    else if (!*(_QWORD *)(a1 + 128))
    {
      objc_initWeak(&location, (id)a1);
      v6 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, *(dispatch_queue_t *)(a1 + 72));
      v7 = *(void **)(a1 + 128);
      *(_QWORD *)(a1 + 128) = v6;

      v8 = *(NSObject **)(a1 + 128);
      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = __60__HDDatabase__protectedDataQueue_updateInactivityFlushTimer__block_invoke;
      v11[3] = &unk_1E6CF4148;
      objc_copyWeak(&v12, &location);
      dispatch_source_set_event_handler(v8, v11);
      v9 = *(NSObject **)(a1 + 128);
      v10 = dispatch_time(0, (uint64_t)(*(double *)(a1 + 424) * 1000000000.0));
      dispatch_source_set_timer(v9, v10, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
      dispatch_resume(*(dispatch_object_t *)(a1 + 128));
      objc_destroyWeak(&v12);
      objc_destroyWeak(&location);
    }
  }
}

void __60__HDDatabase__protectedDataQueue_updateInactivityFlushTimer__block_invoke(uint64_t a1)
{
  void *v1;
  BOOL isProtectedDataFlushDeadline;
  NSObject *v3;
  void *v4;
  id v5;
  id WeakRetained;
  uint8_t buf[4];
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    dispatch_assert_queue_V2(*((dispatch_queue_t *)WeakRetained + 9));
    objc_msgSend(*((id *)WeakRetained + 42), "activeAssertionsForIdentifier:", CFSTR("DatabaseAccessibility"));
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v1, "count")
      || (os_unfair_lock_lock((os_unfair_lock_t)WeakRetained + 20),
          isProtectedDataFlushDeadline = -[HDDatabase _protectedDataLock_isProtectedDataFlushDeadlinePassed]((uint64_t)WeakRetained),
          os_unfair_lock_unlock((os_unfair_lock_t)WeakRetained + 20),
          isProtectedDataFlushDeadline))
    {
      *((_BYTE *)WeakRetained + 136) = 1;
      _HKInitializeLogging();
      v3 = *MEMORY[0x1E0CB52B0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138543362;
        v8 = WeakRetained;
        _os_log_impl(&dword_1B7802000, v3, OS_LOG_TYPE_INFO, "%{public}@: Flushing connections due to inactivity.", buf, 0xCu);
      }
      objc_msgSend(WeakRetained, "databasePoolForDatabaseType:", 0);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = (id)objc_msgSend(v4, "flush");

      -[HDDatabase _protectedDataQueue_flushProtectedData]((uint64_t)WeakRetained);
      -[HDDatabase _protectedDataQueue_updateInactivityFlushTimer](WeakRetained);
    }

  }
}

- (BOOL)_protectedDataLock_isProtectedDataFlushDeadlinePassed
{
  void *v2;
  double v3;
  void *v5;

  os_unfair_lock_assert_owner((const os_unfair_lock *)(a1 + 80));
  if (*(_QWORD *)(a1 + 104) != 2)
    return 0;
  v2 = *(void **)(a1 + 192);
  if (!v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", sel__protectedDataLock_isProtectedDataFlushDeadlinePassed, a1, CFSTR("HDDatabase.mm"), 2176, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_protectedDataFlushDeadlineDate != nil"));

    v2 = *(void **)(a1 + 192);
  }
  objc_msgSend(v2, "timeIntervalSinceNow");
  return v3 <= 0.0;
}

- (void)_protectedDataQueue_flushProtectedData
{
  void *v2;
  NSObject *v3;
  NSObject *v4;
  _QWORD block[5];

  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 72));
  objc_msgSend(*(id *)(a1 + 392), "objectForKeyedSubscript:", &unk_1E6DFAE20);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "flush");
  v3 = objc_claimAutoreleasedReturnValue();

  v4 = *(NSObject **)(a1 + 72);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __52__HDDatabase__protectedDataQueue_flushProtectedData__block_invoke;
  block[3] = &unk_1E6CF3F98;
  block[4] = a1;
  dispatch_group_notify(v3, v4, block);
  *(_BYTE *)(a1 + 208) = 1;

}

- (void)setProtectedDataFlushInterval:(double)a3
{
  void *v6;

  if (a3 < 0.0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDDatabase.mm"), 1769, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("protectedDataFlushInterval >= 0.0"));

  }
  self->_protectedDataFlushInterval = a3;
}

- (void)_protectedDataQueue_contentProtectionStateChanged:(uint64_t)a3 previousState:
{
  int v6;
  int v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  const __CFString *v12;
  const __CFString *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  dispatch_source_t v21;
  void *v22;
  dispatch_time_t v23;
  NSObject *v24;
  NSObject *v25;
  void *v26;
  uint64_t v27;
  id v28;
  void *v29;
  int v30;
  NSObject *v31;
  uint64_t v32;
  const char *v33;
  void *v34;
  const char **v35;
  NSObject *v36;
  uint64_t v37;
  id v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _QWORD v46[5];
  char v47;
  _QWORD handler[4];
  id v49;
  uint8_t v50[128];
  uint8_t buf[4];
  uint64_t v52;
  __int16 v53;
  void *v54;
  __int16 v55;
  uint64_t v56;
  __int16 v57;
  const __CFString *v58;
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 72));
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    v6 = objc_msgSend(MEMORY[0x1E0D29818], "isProtectedDataAvailableWithState:", *(_QWORD *)(a1 + 104));
    v7 = objc_msgSend(MEMORY[0x1E0D29818], "isProtectedDataAvailableWithState:", a2);
    _HKInitializeLogging();
    v8 = (id)*MEMORY[0x1E0CB52B0];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      HDStringFromContentProtectionState();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      HDStringFromContentProtectionState();
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = (void *)v10;
      v12 = CFSTR("unavailable");
      *(_DWORD *)buf = 138544130;
      v52 = (uint64_t)v9;
      if (v6)
        v13 = CFSTR("available");
      else
        v13 = CFSTR("unavailable");
      v54 = (void *)v13;
      v53 = 2114;
      if (v7)
        v12 = CFSTR("available");
      v55 = 2114;
      v56 = v10;
      v57 = 2114;
      v58 = v12;
      _os_log_impl(&dword_1B7802000, v8, OS_LOG_TYPE_DEFAULT, "Got content protection state change notification %{public}@ (%{public}@) -> %{public}@ (%{public}@).", buf, 0x2Au);

    }
    if (*(_QWORD *)(a1 + 104) != a3)
    {
      _HKInitializeLogging();
      v14 = (id)*MEMORY[0x1E0CB52B0];
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        HDStringFromContentProtectionState();
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        HDStringFromContentProtectionState();
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v52 = (uint64_t)v15;
        v53 = 2114;
        v54 = v16;
        _os_log_impl(&dword_1B7802000, v14, OS_LOG_TYPE_DEFAULT, "Previous content protection state %{public}@ does not match observed content protection state %{public}@", buf, 0x16u);

      }
    }
    *(_QWORD *)(a1 + 104) = a2;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
    if (v7)
    {
      v17 = *(void **)(a1 + 192);
      *(_QWORD *)(a1 + 192) = 0;

      -[HDDatabase _protectedDataQueue_cancelProtectedDataFlushTimer](a1);
      objc_msgSend(*(id *)(a1 + 336), "suspendBudgetConsumption");
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 336), "resumeBudgetConsumption");
      if (!*(_QWORD *)(a1 + 192))
      {
        v18 = (void *)MEMORY[0x1E0C99D68];
        objc_msgSend((id)a1, "protectedDataFlushInterval");
        objc_msgSend(v18, "dateWithTimeIntervalSinceNow:");
        v19 = objc_claimAutoreleasedReturnValue();
        v20 = *(void **)(a1 + 192);
        *(_QWORD *)(a1 + 192) = v19;

        *(_BYTE *)(a1 + 208) = 0;
        if (*(double *)(a1 + 416) > 0.0)
        {
          -[HDDatabase _protectedDataQueue_cancelProtectedDataFlushTimer](a1);
          v21 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, *(dispatch_queue_t *)(a1 + 72));
          v22 = *(void **)(a1 + 200);
          *(_QWORD *)(a1 + 200) = v21;

          v23 = dispatch_walltime(0, (unint64_t)(*(double *)(a1 + 416) * 1000000000.0));
          dispatch_source_set_timer(*(dispatch_source_t *)(a1 + 200), v23, 0xFFFFFFFFFFFFFFFFLL, 0);
          objc_initWeak((id *)buf, (id)a1);
          v24 = *(NSObject **)(a1 + 200);
          handler[0] = MEMORY[0x1E0C809B0];
          handler[1] = 3221225472;
          handler[2] = __78__HDDatabase__protectedDataQueue_contentProtectionStateChanged_previousState___block_invoke;
          handler[3] = &unk_1E6CF4148;
          objc_copyWeak(&v49, (id *)buf);
          dispatch_source_set_event_handler(v24, handler);
          dispatch_activate(*(dispatch_object_t *)(a1 + 200));
          objc_destroyWeak(&v49);
          objc_destroyWeak((id *)buf);
        }
        _HKInitializeLogging();
        v25 = (id)*MEMORY[0x1E0CB52B0];
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
        {
          HKDiagnosticStringFromDate();
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v52 = (uint64_t)v26;
          _os_log_impl(&dword_1B7802000, v25, OS_LOG_TYPE_DEFAULT, "Started protected data flush timer with deadline %{public}@", buf, 0xCu);

        }
      }
    }
    -[HDDatabase _protectedDataQueue_flushProtectedDataIfNecessary](a1);
    if (v6 != v7)
    {
      os_unfair_lock_lock((os_unfair_lock_t)(a1 + 160));
      os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
      if (v7)
      {
        if (*(_BYTE *)(a1 + 184)
          && (os_unfair_lock_lock((os_unfair_lock_t)(a1 + 8)),
              v27 = *(_QWORD *)(a1 + 16),
              os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 8)),
              v27 == 4))
        {
          *(_BYTE *)(a1 + 184) = 0;
          v28 = *(id *)(a1 + 176);
          v29 = *(void **)(a1 + 176);
          *(_QWORD *)(a1 + 176) = 0;

          v30 = 1;
        }
        else
        {
          v28 = 0;
          v30 = 0;
        }
        *(_QWORD *)(a1 + 96) = 0;
        ++*(_QWORD *)(a1 + 216);
        -[HDDatabase _protectedDataQueue_mergeJournalWithPrimaryJournalMergeCompletion:](a1);
      }
      else
      {
        v28 = 0;
        v30 = 0;
        *(_QWORD *)(a1 + 96) = 2;
      }
      os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
      os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 160));
      _HKInitializeLogging();
      v31 = (id)*MEMORY[0x1E0CB52B0];
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        v32 = objc_msgSend(*(id *)(a1 + 88), "count");
        v33 = "unavailable";
        if (v7)
          v33 = "available";
        *(_DWORD *)buf = 134218242;
        v52 = v32;
        v53 = 2082;
        v54 = (void *)v33;
        _os_log_impl(&dword_1B7802000, v31, OS_LOG_TYPE_DEFAULT, "Notifying %lu observers of protected data availability change: %{public}s", buf, 0x16u);
      }

      v34 = *(void **)(a1 + 88);
      v46[0] = MEMORY[0x1E0C809B0];
      v46[1] = 3221225472;
      v46[2] = __78__HDDatabase__protectedDataQueue_contentProtectionStateChanged_previousState___block_invoke_361;
      v46[3] = &unk_1E6CF41B8;
      v46[4] = a1;
      v47 = v7;
      objc_msgSend(v34, "notifyObservers:", v46);
      v35 = (const char **)MEMORY[0x1E0CB5A20];
      if (!v7)
        v35 = (const char **)MEMORY[0x1E0CB5A28];
      notify_post(*v35);
      if (v30)
      {
        _HKInitializeLogging();
        v36 = (id)*MEMORY[0x1E0CB52B0];
        if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
        {
          v37 = objc_msgSend(v28, "count");
          *(_DWORD *)buf = 134217984;
          v52 = v37;
          _os_log_impl(&dword_1B7802000, v36, OS_LOG_TYPE_DEFAULT, "Running %lu first unlock blocks", buf, 0xCu);
        }

        v44 = 0u;
        v45 = 0u;
        v42 = 0u;
        v43 = 0u;
        v38 = v28;
        v39 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v42, v50, 16);
        if (v39)
        {
          v40 = *(_QWORD *)v43;
          do
          {
            v41 = 0;
            do
            {
              if (*(_QWORD *)v43 != v40)
                objc_enumerationMutation(v38);
              (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v42 + 1) + 8 * v41) + 16))(*(_QWORD *)(*((_QWORD *)&v42 + 1) + 8 * v41));
              ++v41;
            }
            while (v39 != v41);
            v39 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v42, v50, 16);
          }
          while (v39);
        }

      }
    }
  }
}

void __80__HDDatabase__protectedDataQueue_mergeJournalWithPrimaryJournalMergeCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  id v9;
  uint8_t buf[4];
  uint64_t v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  +[HDDatabaseTransactionContext contextForReadingProtectedData](HDDatabaseTransactionContext, "contextForReadingProtectedData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0;
  v4 = objc_msgSend(v2, "performTransactionWithContext:error:block:inaccessibilityHandler:", v3, &v9, &__block_literal_global_353, 0);
  v5 = v9;

  v6 = *(_QWORD *)(a1 + 40);
  if (v6)
    (*(void (**)(uint64_t, uint64_t, id))(v6 + 16))(v6, v4, v5);
  if ((_DWORD)v4)
  {
    -[HDDatabase _mergeSecondaryJournals](*(_QWORD *)(a1 + 32));
  }
  else
  {
    _HKInitializeLogging();
    v7 = *MEMORY[0x1E0CB52B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_ERROR))
    {
      v8 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      v11 = v8;
      v12 = 2114;
      v13 = v5;
      _os_log_error_impl(&dword_1B7802000, v7, OS_LOG_TYPE_ERROR, "%{public}@: Post-unlock journal merge trigger transaction failed: %{public}@", buf, 0x16u);
    }
  }

}

uint64_t __80__HDDatabase__protectedDataQueue_mergeJournalWithPrimaryJournalMergeCompletion___block_invoke_2()
{
  return 1;
}

- (void)_waitForContentProtectionObservationSetup
{
  os_unfair_lock_s *v2;
  uint64_t v3;
  NSObject *v4;
  uint8_t v5[16];

  if (a1)
  {
    v2 = (os_unfair_lock_s *)(a1 + 8);
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 8));
    v3 = *(_QWORD *)(a1 + 16);
    os_unfair_lock_unlock(v2);
    if (v3)
    {
      dispatch_group_wait(*(dispatch_group_t *)(a1 + 120), 0xFFFFFFFFFFFFFFFFLL);
    }
    else
    {
      _HKInitializeLogging();
      v4 = *MEMORY[0x1E0CB52B0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)v5 = 0;
        _os_log_fault_impl(&dword_1B7802000, v4, OS_LOG_TYPE_FAULT, "_waitForContentProtectionObservationSetup skipped", v5, 2u);
      }
    }
  }
}

- (BOOL)isInSession
{
  -[HDDatabase _waitForContentProtectionObservationSetup]((uint64_t)self);
  return -[HDContentProtectionManager isInSession](self->_contentProtectionManager, "isInSession");
}

- (void)_protectedDataQueue_cancelProtectedDataFlushTimer
{
  NSObject *v2;
  void *v3;

  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 72));
    v2 = *(NSObject **)(a1 + 200);
    if (v2)
    {
      dispatch_source_cancel(v2);
      v3 = *(void **)(a1 + 200);
      *(_QWORD *)(a1 + 200) = 0;

    }
  }
}

void __78__HDDatabase__protectedDataQueue_contentProtectionStateChanged_previousState___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  -[HDDatabase _protectedDataQueue_flushProtectedDataIfNecessary]((uint64_t)WeakRetained);

}

uint64_t __78__HDDatabase__protectedDataQueue_contentProtectionStateChanged_previousState___block_invoke_361(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "database:protectedDataDidBecomeAvailable:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

- (void)addProtectedDataObserver:(id)a3 queue:(id)a4
{
  -[HKObserverSet registerObserver:queue:](self->_protectedDataObservers, "registerObserver:queue:", a3, a4);
}

- (id)takeAccessibilityAssertionWithOwnerIdentifier:(id)a3 timeout:(double)a4 error:(id *)a5
{
  -[HDDatabase takeAccessibilityAssertionWithOwnerIdentifier:shouldPerformTransaction:timeout:error:](self, "takeAccessibilityAssertionWithOwnerIdentifier:shouldPerformTransaction:timeout:error:", a3, 1, a5, a4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)takeAccessibilityAssertionWithOwnerIdentifier:(id)a3 shouldPerformTransaction:(BOOL)a4 timeout:(double)a5 error:(id *)a6
{
  _BOOL4 v8;
  id v10;
  NSObject *protectedDataQueue;
  id v12;
  void *v13;
  HDMutableDatabaseTransactionContext *v14;
  BOOL v15;
  id v16;
  NSObject *v17;
  id v18;
  id v19;
  void *v20;
  id v22;
  _QWORD block[5];
  id v24;
  uint64_t *v25;
  uint64_t *v26;
  uint64_t *v27;
  double v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  id v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t (*v38)(uint64_t, uint64_t);
  void (*v39)(uint64_t);
  id v40;
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  uint64_t v44;
  uint8_t buf[4];
  id v46;
  __int16 v47;
  id v48;
  uint64_t v49;

  v8 = a4;
  v49 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v41 = 0;
  v42 = &v41;
  v43 = 0x2020000000;
  v44 = 0;
  v35 = 0;
  v36 = &v35;
  v37 = 0x3032000000;
  v38 = __Block_byref_object_copy__68;
  v39 = __Block_byref_object_dispose__68;
  v40 = 0;
  v29 = 0;
  v30 = &v29;
  v31 = 0x3032000000;
  v32 = __Block_byref_object_copy__68;
  v33 = __Block_byref_object_dispose__68;
  v34 = 0;
  protectedDataQueue = self->_protectedDataQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __99__HDDatabase_takeAccessibilityAssertionWithOwnerIdentifier_shouldPerformTransaction_timeout_error___block_invoke;
  block[3] = &unk_1E6CF41E0;
  block[4] = self;
  v25 = &v41;
  v26 = &v29;
  v27 = &v35;
  v12 = v10;
  v24 = v12;
  v28 = a5;
  dispatch_sync(protectedDataQueue, block);
  v13 = (void *)v36[5];
  if (v13)
  {
    if (v8 && v42[3] >= 1)
    {
      v14 = objc_alloc_init(HDMutableDatabaseTransactionContext);
      -[HDMutableDatabaseTransactionContext addAccessibilityAssertion:](v14, "addAccessibilityAssertion:", v36[5]);
      -[HDMutableDatabaseTransactionContext setRequiresProtectedData:](v14, "setRequiresProtectedData:", 1);
      -[HDMutableDatabaseTransactionContext setRequiresNewDatabaseConnection:](v14, "setRequiresNewDatabaseConnection:", 1);
      -[HDMutableDatabaseTransactionContext setHighPriority:](v14, "setHighPriority:", 1);
      v22 = 0;
      v15 = -[HDDatabase performTransactionWithContext:error:block:inaccessibilityHandler:](self, "performTransactionWithContext:error:block:inaccessibilityHandler:", v14, &v22, &__block_literal_global_366, 0);
      v16 = v22;
      if (!v15)
      {
        _HKInitializeLogging();
        v17 = *MEMORY[0x1E0CB52B0];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543618;
          v46 = v12;
          v47 = 2114;
          v48 = v16;
          _os_log_impl(&dword_1B7802000, v17, OS_LOG_TYPE_DEFAULT, "Failed to pre-emptively check out database for accessibility assertion owner \"%{public}@\": %{public}@", buf, 0x16u);
        }
      }

      v13 = (void *)v36[5];
    }
    v18 = v13;
  }
  else
  {
    v19 = (id)v30[5];
    v20 = v19;
    if (v19)
    {
      if (a6)
        *a6 = objc_retainAutorelease(v19);
      else
        _HKLogDroppedError();
    }

    v18 = 0;
  }

  _Block_object_dispose(&v29, 8);
  _Block_object_dispose(&v35, 8);

  _Block_object_dispose(&v41, 8);
  return v18;
}

void __99__HDDatabase_takeAccessibilityAssertionWithOwnerIdentifier_shouldPerformTransaction_timeout_error___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  double v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  id v14;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 392), "objectForKeyedSubscript:", &unk_1E6DFAE20);
  v14 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 400), "observedState") == 2)
  {
    if (!objc_msgSend(v14, "count") || *(_BYTE *)(*(_QWORD *)(a1 + 32) + 209))
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "hk_protectedDataInaccessibilityError");
      v2 = objc_claimAutoreleasedReturnValue();
      v3 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
      v4 = *(void **)(v3 + 40);
      *(_QWORD *)(v3 + 40) = v2;
LABEL_10:

      goto LABEL_11;
    }
  }
  else
  {
    v5 = objc_msgSend(v14, "cacheSize");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v5 - objc_msgSend(v14, "count");
  }
  v6 = objc_msgSend(objc_alloc(MEMORY[0x1E0D29800]), "initWithAssertionIdentifier:ownerIdentifier:", CFSTR("DatabaseAccessibility"), *(_QWORD *)(a1 + 40));
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

  v9 = *(double *)(a1 + 72);
  if (v9 <= 0.0)
    v9 = 10.0;
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "setBudget:", v9);
  if ((objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 336), "takeAssertion:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40)) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:description:", 100, CFSTR("Failed to take database accessibility assertion"));
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v12 = *(void **)(v11 + 40);
    *(_QWORD *)(v11 + 40) = v10;

    v13 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v4 = *(void **)(v13 + 40);
    *(_QWORD *)(v13 + 40) = 0;
    goto LABEL_10;
  }
LABEL_11:

}

uint64_t __99__HDDatabase_takeAccessibilityAssertionWithOwnerIdentifier_shouldPerformTransaction_timeout_error___block_invoke_2()
{
  return 1;
}

- (id)cloneAccessibilityAssertion:(id)a3 ownerIdentifier:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  char v11;
  NSObject *protectedDataQueue;
  void *v13;
  id v14;
  void *v15;
  NSObject *v16;
  id v17;
  _QWORD block[7];
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;
  __int128 buf;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  objc_msgSend(v8, "assertionIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isEqualToString:", CFSTR("DatabaseAccessibility"));

  if ((v11 & 1) == 0)
  {
    _HKInitializeLogging();
    v16 = *MEMORY[0x1E0CB52B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_FAULT))
    {
      LODWORD(buf) = 138543362;
      *(_QWORD *)((char *)&buf + 4) = v8;
      _os_log_fault_impl(&dword_1B7802000, v16, OS_LOG_TYPE_FAULT, "Attempting to clone improper database accessibility assertion: %{public}@", (uint8_t *)&buf, 0xCu);
    }
    goto LABEL_10;
  }
  if (objc_msgSend(v8, "state") != 2)
  {
LABEL_10:
    v17 = 0;
    goto LABEL_16;
  }
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v27 = 0x3032000000;
  v28 = __Block_byref_object_copy__68;
  v29 = __Block_byref_object_dispose__68;
  objc_msgSend(v8, "cloneWithOwnerIdentifier:", v9);
  v30 = (id)objc_claimAutoreleasedReturnValue();
  if (*(_QWORD *)(*((_QWORD *)&buf + 1) + 40))
  {
    v20 = 0;
    v21 = &v20;
    v22 = 0x3032000000;
    v23 = __Block_byref_object_copy__68;
    v24 = __Block_byref_object_dispose__68;
    v25 = 0;
    protectedDataQueue = self->_protectedDataQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __64__HDDatabase_cloneAccessibilityAssertion_ownerIdentifier_error___block_invoke;
    block[3] = &unk_1E6CF4228;
    block[4] = self;
    block[5] = &buf;
    block[6] = &v20;
    dispatch_sync(protectedDataQueue, block);
    v13 = *(void **)(*((_QWORD *)&buf + 1) + 40);
    if (!v13)
    {
      v14 = (id)v21[5];
      v15 = v14;
      if (v14)
      {
        if (a5)
          *a5 = objc_retainAutorelease(v14);
        else
          _HKLogDroppedError();
      }

      v13 = *(void **)(*((_QWORD *)&buf + 1) + 40);
    }
    v17 = v13;
    _Block_object_dispose(&v20, 8);

  }
  else
  {
    v17 = 0;
  }
  _Block_object_dispose(&buf, 8);

LABEL_16:
  return v17;
}

void __64__HDDatabase_cloneAccessibilityAssertion_ownerIdentifier_error___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;

  if ((objc_msgSend(*(id *)(a1[4] + 336), "takeAssertion:", *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 40)) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:description:", 100, CFSTR("Failed to take cloned database accessibility assertion"));
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = *(_QWORD *)(a1[6] + 8);
    v4 = *(void **)(v3 + 40);
    *(_QWORD *)(v3 + 40) = v2;

    v5 = *(_QWORD *)(a1[5] + 8);
    v6 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = 0;

  }
}

uint64_t __52__HDDatabase__protectedDataQueue_flushProtectedData__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 352), "lock");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 392), "objectForKeyedSubscript:", &unk_1E6DFAE20);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "checkedOutDatabaseCount");

  if (!v3)
    -[HDDatabase _invalidateProtectedResourceAssertions](*(_QWORD *)(a1 + 32));
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 352), "unlock");
}

- (void)_invalidateProtectedResourceAssertions
{
  NSObject *v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  uint8_t v13[128];
  uint8_t buf[4];
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    _HKInitializeLogging();
    v2 = *MEMORY[0x1E0CB52B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543362;
      v15 = a1;
      _os_log_impl(&dword_1B7802000, v2, OS_LOG_TYPE_INFO, "%{public}@: Invalidate protected resource assertions", buf, 0xCu);
    }
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 272));
    objc_msgSend(*(id *)(a1 + 280), "allValues");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = *(void **)(a1 + 280);
    *(_QWORD *)(a1 + 280) = 0;

    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 272));
    v11 = 0u;
    v12 = 0u;
    v9 = 0u;
    v10 = 0u;
    v5 = v3;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    if (v6)
    {
      v7 = *(_QWORD *)v10;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v10 != v7)
            objc_enumerationMutation(v5);
          objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v8++), "invalidate", (_QWORD)v9);
        }
        while (v6 != v8);
        v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      }
      while (v6);
    }

  }
}

- (id)progressForJournalMergeWithType:(int64_t)a3
{
  void *v3;
  void *v4;

  -[HDDatabase _journalForType:](self, "_journalForType:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "progressForJournalMerge");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_journalForType:(int64_t)a3
{
  uint64_t v3;

  v3 = 296;
  if (a3 == 2)
    v3 = 304;
  return *(id *)((char *)&self->super.isa + v3);
}

void __37__HDDatabase__mergeSecondaryJournals__block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained;

  if (a2)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    -[HDDatabase _mergeSecondaryJournals]();

  }
}

void __37__HDDatabase__mergeSecondaryJournals__block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  id WeakRetained;

  atomic_store(0, (unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 232));
  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(v1 + 304);
  WeakRetained = objc_loadWeakRetained((id *)(v1 + 312));
  objc_msgSend(v2, "mergeWithProfile:shouldContinueHandler:");

}

void __61__HDDatabase__mergeSecondaryJournalsWithActivity_completion___block_invoke(uint64_t a1)
{
  os_log_t *v2;
  NSObject *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id WeakRetained;
  void *v9;
  char v10;
  void *v11;
  double v12;
  double v13;
  NSObject *v14;
  uint64_t v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  uint64_t v21;
  NSObject *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  _QWORD v29[4];
  id v30;
  uint8_t buf[4];
  uint64_t v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  _HKInitializeLogging();
  v2 = (os_log_t *)MEMORY[0x1E0CB52B0];
  v3 = *MEMORY[0x1E0CB52B0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_DEFAULT))
  {
    v4 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138543362;
    v32 = v4;
    _os_log_impl(&dword_1B7802000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@: Starting to merge secondary journals using activity", buf, 0xCu);
  }
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 304), "resetJournalMergeInterruptionsCount");
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(void **)(v6 + 304);
  WeakRetained = objc_loadWeakRetained((id *)(v6 + 312));
  v9 = *(void **)(a1 + 40);
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __61__HDDatabase__mergeSecondaryJournalsWithActivity_completion___block_invoke_380;
  v29[3] = &unk_1E6CF4278;
  v30 = v9;
  v10 = objc_msgSend(v7, "mergeWithProfile:activity:shouldContinueHandler:", WeakRetained, v30, v29);

  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "timeIntervalSinceDate:", v5);
  v13 = v12;

  if (objc_msgSend(*(id *)(a1 + 40), "shouldDefer"))
  {
    _HKInitializeLogging();
    v14 = *v2;
    if (os_log_type_enabled(*v2, OS_LOG_TYPE_DEFAULT))
    {
      v15 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138543362;
      v32 = v15;
      _os_log_impl(&dword_1B7802000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@: Journal merge activity deffered", buf, 0xCu);
    }
    v16 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 312));
    objc_msgSend(v16, "daemon");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "analyticsSubmissionCoordinator");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 304), "journalMergeInterruptions");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "database_reportJournalMergeActivityResult:duration:interruptions:error:", 2, v19, 0, v13);
LABEL_11:

    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    goto LABEL_15;
  }
  if ((v10 & 1) != 0)
  {
    _HKInitializeLogging();
    v20 = *v2;
    if (os_log_type_enabled(*v2, OS_LOG_TYPE_DEFAULT))
    {
      v21 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138543362;
      v32 = v21;
      _os_log_impl(&dword_1B7802000, v20, OS_LOG_TYPE_DEFAULT, "%{public}@: Completing journal merge activity successfully", buf, 0xCu);
    }
    v16 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 312));
    objc_msgSend(v16, "daemon");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "analyticsSubmissionCoordinator");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 304), "journalMergeInterruptions");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "database_reportJournalMergeActivityResult:duration:interruptions:error:", 0, v19, 0, v13);
    goto LABEL_11;
  }
  _HKInitializeLogging();
  v22 = *v2;
  if (os_log_type_enabled(*v2, OS_LOG_TYPE_ERROR))
  {
    v28 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138543362;
    v32 = v28;
    _os_log_error_impl(&dword_1B7802000, v22, OS_LOG_TYPE_ERROR, "%{public}@: Error merging secondary journal", buf, 0xCu);
  }
  objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:description:", 100, CFSTR("Error merging secondary journals"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 312));
  objc_msgSend(v24, "daemon");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "analyticsSubmissionCoordinator");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 304), "journalMergeInterruptions");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "database_reportJournalMergeActivityResult:duration:interruptions:error:", 1, v27, v23, v13);

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
LABEL_15:

}

uint64_t __61__HDDatabase__mergeSecondaryJournalsWithActivity_completion___block_invoke_380(uint64_t a1, uint64_t a2)
{
  int v3;

  v3 = objc_msgSend(*(id *)(a1 + 32), "shouldDefer");
  if (v3)
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:format:", a2, 708, CFSTR("Interrupting secondary journal merge activity due to activity deferral request."));
  return v3 ^ 1u;
}

- (unint64_t)journalChapterCountForType:(int64_t)a3
{
  void *v3;
  unint64_t v4;

  -[HDDatabase _journalForType:](self, "_journalForType:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "journalChapterCount");

  return v4;
}

- (void)performInFirstUnprotectedWriteTransaction:(id)a3
{
  os_unfair_lock_s *p_transactionStartLock;
  void *v6;
  NSMutableArray *firstUnprotectedWriteTransactionBlocks;
  NSMutableArray *v8;
  NSMutableArray *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  p_transactionStartLock = &self->_transactionStartLock;
  os_unfair_lock_lock(&self->_transactionStartLock);
  v6 = v13;
  firstUnprotectedWriteTransactionBlocks = self->_firstUnprotectedWriteTransactionBlocks;
  if (firstUnprotectedWriteTransactionBlocks
    || (v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]),
        v9 = self->_firstUnprotectedWriteTransactionBlocks,
        self->_firstUnprotectedWriteTransactionBlocks = v8,
        v9,
        firstUnprotectedWriteTransactionBlocks = self->_firstUnprotectedWriteTransactionBlocks,
        v6 = v13,
        firstUnprotectedWriteTransactionBlocks))
  {
    v10 = (void *)objc_msgSend(v6, "copy");
    v11 = _Block_copy(v10);
    -[NSMutableArray addObject:](firstUnprotectedWriteTransactionBlocks, "addObject:", v11);

    os_unfair_lock_unlock(p_transactionStartLock);
  }
  else
  {
    os_unfair_lock_unlock(&self->_transactionStartLock);
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDDatabase.mm"), 2348, CFSTR("Attempt to add a first unprotected write transaction block after blocks have already been run."));

  }
}

- (void)performInFirstProtectedWriteTransaction:(id)a3
{
  os_unfair_lock_s *p_transactionStartLock;
  NSMutableArray *firstProtectedWriteTransactionBlocks;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  p_transactionStartLock = &self->_transactionStartLock;
  os_unfair_lock_lock(&self->_transactionStartLock);
  firstProtectedWriteTransactionBlocks = self->_firstProtectedWriteTransactionBlocks;
  if (firstProtectedWriteTransactionBlocks)
  {
    v7 = (void *)objc_msgSend(v10, "copy");
    v8 = _Block_copy(v7);
    -[NSMutableArray addObject:](firstProtectedWriteTransactionBlocks, "addObject:", v8);

    os_unfair_lock_unlock(p_transactionStartLock);
  }
  else
  {
    os_unfair_lock_unlock(&self->_transactionStartLock);
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDDatabase.mm"), 2359, CFSTR("Attempt to add a first protected write transaction block after blocks have already been run."));

  }
}

uint64_t __68__HDDatabase__waitForTransactionStartTasksIfNeededForContext_error___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  id WeakRetained;
  uint64_t v5;

  v3 = *(void **)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 312));
  v5 = objc_msgSend(v3, "mergeWithProfile:shouldContinueHandler:", WeakRetained, 0);

  if ((v5 & 1) == 0)
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:format:", a2, 6, CFSTR("Failed to merge required journal."));
  return v5;
}

uint64_t __86__HDDatabase__transactionStartLock_runFirstTransactionBlocksIfNeededForContext_error___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD v8[4];
  id v9;
  id v10;
  id v11;

  v4 = *(void **)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __86__HDDatabase__transactionStartLock_runFirstTransactionBlocksIfNeededForContext_error___block_invoke_2;
  v8[3] = &unk_1E6CF42F0;
  v9 = *(id *)(a1 + 48);
  v10 = *(id *)(a1 + 56);
  v11 = *(id *)(a1 + 64);
  v6 = objc_msgSend(v4, "performTransactionWithContext:error:block:inaccessibilityHandler:", v5, a2, v8, 0);

  return v6;
}

uint64_t __86__HDDatabase__transactionStartLock_runFirstTransactionBlocksIfNeededForContext_error___block_invoke_2(id *a1, void *a2, _QWORD *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char v18;
  id v19;
  uint64_t v20;
  id v21;
  BOOL v22;
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  id v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v6 = a1[4];
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v31;
LABEL_3:
    v9 = 0;
    while (1)
    {
      if (*(_QWORD *)v31 != v8)
        objc_enumerationMutation(v6);
      v10 = *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * v9);
      v29 = 0;
      v11 = (*(uint64_t (**)(void))(v10 + 16))();
      v12 = v29;
      v13 = v12;
      if ((v11 & 1) == 0)
        break;

      if (v7 == ++v9)
      {
        v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
        if (v7)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
    if (v12)
    {
      v21 = v12;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:format:", 122, CFSTR("First unprotected transaction block failed without reporting an error."));
      v21 = (id)objc_claimAutoreleasedReturnValue();
      if (!v21)
        goto LABEL_28;
    }
    if (a3)
      *a3 = objc_retainAutorelease(v21);
    else
      _HKLogDroppedError();
    v22 = v13 == 0;

    goto LABEL_27;
  }
LABEL_9:

  if (objc_msgSend(a1[5], "requiresProtectedData"))
  {
    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    v6 = a1[6];
    v14 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v25, v34, 16);
    if (!v14)
    {
      v20 = 1;
LABEL_30:

      goto LABEL_31;
    }
    v15 = *(_QWORD *)v26;
LABEL_12:
    v16 = 0;
    while (1)
    {
      if (*(_QWORD *)v26 != v15)
        objc_enumerationMutation(v6);
      v17 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * v16);
      v24 = 0;
      v18 = (*(uint64_t (**)(void))(v17 + 16))();
      v19 = v24;
      v13 = v19;
      if ((v18 & 1) == 0)
        break;

      if (v14 == ++v16)
      {
        v14 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v25, v34, 16);
        v20 = 1;
        if (v14)
          goto LABEL_12;
        goto LABEL_30;
      }
    }
    if (v19)
    {
      v21 = v19;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:format:", 122, CFSTR("First protected transaction block failed without reporting an error."));
      v21 = (id)objc_claimAutoreleasedReturnValue();
      if (!v21)
        goto LABEL_28;
    }
    if (a3)
      *a3 = objc_retainAutorelease(v21);
    else
      _HKLogDroppedError();
    v22 = v13 == 0;

LABEL_27:
    if (v22)
    {
LABEL_28:

      v13 = 0;
    }

    v20 = 0;
    goto LABEL_30;
  }
  v20 = 1;
LABEL_31:

  return v20;
}

uint64_t __54__HDDatabase__performFirstJournalMergeCleanupIfNeeded__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  id WeakRetained;
  uint64_t v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "allEntityClassesWithProtectionClass:", 2, 0, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v6);
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          v10 = objc_opt_class();
          WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 312));
          LOBYTE(v10) = objc_msgSend((id)v10, "performPostFirstJournalMergeCleanupWithTransaction:profile:error:", v5, WeakRetained, a3);

          if ((v10 & 1) == 0)
          {
            v12 = 0;
            goto LABEL_12;
          }
        }
      }
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v7)
        continue;
      break;
    }
  }
  v12 = 1;
LABEL_12:

  return v12;
}

uint64_t __51__HDDatabase__mergePrimaryJournalForContext_error___block_invoke(uint64_t a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t v5;
  unsigned __int8 v6;
  void *v7;
  id WeakRetained;
  int v9;
  id v10;
  NSObject *v11;
  id v12;
  void *v13;
  NSObject *v14;
  _QWORD v16[5];
  id v17;
  uint8_t buf[4];
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 296), "mergeWithProfile:shouldContinueHandler:", *(_QWORD *)(a1 + 40), 0);
  if ((v4 & 1) != 0)
  {
    v5 = *(_QWORD *)(a1 + 32);
    if (v5)
    {
      v6 = atomic_load((unsigned __int8 *)(v5 + 248));
      if ((v6 & 1) == 0)
      {
        v7 = *(void **)(v5 + 296);
        WeakRetained = objc_loadWeakRetained((id *)(v5 + 312));
        v16[4] = v5;
        v17 = 0;
        v16[0] = MEMORY[0x1E0C809B0];
        v16[1] = 3221225472;
        v16[2] = __54__HDDatabase__performFirstJournalMergeCleanupIfNeeded__block_invoke;
        v16[3] = &unk_1E6CF4340;
        v9 = objc_msgSend(v7, "performMergeTransactionWithProfile:transactionContext:error:block:", WeakRetained, 0, &v17, v16);
        v10 = v17;

        if (v9)
        {
          atomic_store(1u, (unsigned __int8 *)(v5 + 248));
          _HKInitializeLogging();
          v11 = *MEMORY[0x1E0CB52B0];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1B7802000, v11, OS_LOG_TYPE_DEFAULT, "Finished first journal merge cleanup.", buf, 2u);
          }
        }
        else
        {
          _HKInitializeLogging();
          v14 = *MEMORY[0x1E0CB52B0];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543362;
            v19 = v10;
            _os_log_error_impl(&dword_1B7802000, v14, OS_LOG_TYPE_ERROR, "Failed to perform post-journal merge cleanup (will retry at next journal merge): %{public}@", buf, 0xCu);
          }
        }

      }
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_protectedDataInaccessibilityError");
    v12 = (id)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v12)
    {
      if (a2)
        *a2 = objc_retainAutorelease(v12);
      else
        _HKLogDroppedError();
    }

  }
  return v4;
}

- (id)diagnosticDescription
{
  void *v3;
  unint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  unint64_t protectedDataState;
  __CFString *v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  const char *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  void *v27;
  uint64_t v28;
  const __CFString *v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t j;
  NSDate *v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  id v44;
  _BYTE v45[128];
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  -[HDDatabase databaseSizeInBytes](self, "databaseSizeInBytes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "unsignedLongLongValue");

  os_unfair_lock_lock(&self->_protectedDataLock);
  v5 = (void *)MEMORY[0x1E0CB37A0];
  HDStringFromContentProtectionState();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("Observed content protection state: %@"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock(&self->_protectedDataLock);
  protectedDataState = self->_protectedDataState;
  if (protectedDataState >= 3)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("invalid (%ld)"), self->_protectedDataState);
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = off_1E6CF4460[protectedDataState];
  }
  objc_msgSend(v7, "appendFormat:", CFSTR("\nProtected data availability state: %@"), v9);

  v35 = self->_protectedDataFlushDeadlineDate;
  if (v35 && !self->_hasFlushedProtectedData)
  {
    -[NSDate timeIntervalSinceNow](v35, "timeIntervalSinceNow");
    if (v10 <= 0.0)
    {
      objc_msgSend(v7, "appendFormat:", CFSTR("\nProtected data flush required NOW"));
    }
    else
    {
      HKDiagnosticStringFromDate();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "appendFormat:", CFSTR("\nProtected data flush required by %@"), v11);

    }
  }
  objc_msgSend(v7, "appendFormat:", CFSTR("\nDatabase aggregate size: %.2f MB"), (double)v4 * 0.000000953674316);
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSString stringByAppendingPathComponent:](self->_profileDirectoryPath, "stringByAppendingPathComponent:", CFSTR("Journals"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = 0;
  objc_msgSend(v12, "contentsOfDirectoryAtPath:error:", v13, &v44);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v44;
  v16 = objc_msgSend(v14, "count");

  if (v16)
  {
    v17 = "s";
    if (v16 == 1)
      v17 = "";
    objc_msgSend(v7, "appendFormat:", CFSTR("\n  -- Includes %d journal chapter%s."), v16, v17);
  }
  -[HDAssertionManager activeAssertionsForIdentifier:](self->_assertionManager, "activeAssertionsForIdentifier:", CFSTR("DatabaseAccessibility"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v18, "count"))
  {
    objc_msgSend(v7, "appendFormat:", CFSTR("\n\nAccessibility Assertions (%lu):"), objc_msgSend(v18, "count"));
    v19 = objc_alloc(MEMORY[0x1E0CB3550]);
    objc_msgSend(v18, "allObjects");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "hk_map:", &__block_literal_global_417);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (void *)objc_msgSend(v19, "initWithArray:", v21);

    v42 = 0u;
    v43 = 0u;
    v40 = 0u;
    v41 = 0u;
    v23 = v22;
    v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v40, v46, 16);
    if (v24)
    {
      v25 = *(_QWORD *)v41;
      do
      {
        for (i = 0; i != v24; ++i)
        {
          if (*(_QWORD *)v41 != v25)
            objc_enumerationMutation(v23);
          objc_msgSend(v7, "appendFormat:", CFSTR("\n\t%@ (%lu)"), *(_QWORD *)(*((_QWORD *)&v40 + 1) + 8 * i), objc_msgSend(v23, "countForObject:", *(_QWORD *)(*((_QWORD *)&v40 + 1) + 8 * i)));
        }
        v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v40, v46, 16);
      }
      while (v24);
    }

  }
  -[HKObserverSet allObservers](self->_protectedDataObservers, "allObservers");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend(v27, "count");
  v29 = &stru_1E6D11BB8;
  if (!v28)
    v29 = CFSTR("none");
  objc_msgSend(v7, "appendFormat:", CFSTR("\n\nProtected Data Observers: %@"), v29);
  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  v30 = v27;
  v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v36, v45, 16);
  if (v31)
  {
    v32 = *(_QWORD *)v37;
    do
    {
      for (j = 0; j != v31; ++j)
      {
        if (*(_QWORD *)v37 != v32)
          objc_enumerationMutation(v30);
        objc_msgSend(v7, "appendFormat:", CFSTR("\n\t%@"), *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * j));
      }
      v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v36, v45, 16);
    }
    while (v31);
  }

  return v7;
}

id __35__HDDatabase_diagnosticDescription__block_invoke(uint64_t a1, void *a2)
{
  objc_msgSend(a2, "ownerIdentifier");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)addDatabaseJournalMergeObserver:(id)a3 journalType:(int64_t)a4 queue:(id)a5
{
  id v8;
  NSMutableDictionary *databaseJournalMergeObserverSetByType;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  v8 = a5;
  databaseJournalMergeObserverSetByType = self->_databaseJournalMergeObserverSetByType;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](databaseJournalMergeObserverSetByType, "objectForKeyedSubscript:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "registerObserver:queue:", v12, v8);

}

- (void)removeDatabaseJournalMergeObserver:(id)a3 journalType:(int64_t)a4
{
  NSMutableDictionary *databaseJournalMergeObserverSetByType;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  databaseJournalMergeObserverSetByType = self->_databaseJournalMergeObserverSetByType;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](databaseJournalMergeObserverSetByType, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "unregisterObserver:", v9);

}

- (void)databaseJournalMergeDidComplete:(id)a3
{
  id v4;
  NSMutableDictionary *databaseJournalMergeObserverSetByType;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[5];
  id v10;

  v4 = a3;
  databaseJournalMergeObserverSetByType = self->_databaseJournalMergeObserverSetByType;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v4, "type"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](databaseJournalMergeObserverSetByType, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __46__HDDatabase_databaseJournalMergeDidComplete___block_invoke;
  v9[3] = &unk_1E6CF43A8;
  v9[4] = self;
  v8 = v4;
  v10 = v8;
  objc_msgSend(v7, "notifyObservers:", v9);

}

void __46__HDDatabase_databaseJournalMergeDidComplete___block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;
  id v4;

  v4 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 312));
  objc_msgSend(v4, "databaseJournalMergeDidCompleteForProfile:type:", WeakRetained, objc_msgSend(*(id *)(a1 + 40), "type"));

}

- (void)invalidateAndWait
{
  NSObject *protectedDataQueue;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  id unitTest_didWaitForJournalMergeHandler;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _QWORD block[5];
  uint8_t buf[4];
  HDDatabase *v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  if (-[HDDatabase _transitionToState:]((uint64_t)self, 5uLL))
  {
    protectedDataQueue = self->_protectedDataQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __31__HDDatabase_invalidateAndWait__block_invoke;
    block[3] = &unk_1E6CF3F98;
    block[4] = self;
    dispatch_sync(protectedDataQueue, block);
    -[HDAssertionManager invalidate](self->_assertionManager, "invalidate");
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    -[NSDictionary allValues](self->_databasePoolForType, "allValues");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v21, 16);
    if (v6)
    {
      v7 = *(_QWORD *)v15;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v15 != v7)
            objc_enumerationMutation(v5);
          objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v8), "flush");
          v9 = objc_claimAutoreleasedReturnValue();
          dispatch_group_wait(v9, 0xFFFFFFFFFFFFFFFFLL);

          ++v8;
        }
        while (v6 != v8);
        v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v21, 16);
      }
      while (v6);
    }

    -[HDDatabase _invalidateProtectedResourceAssertions]((uint64_t)self);
    unitTest_didWaitForJournalMergeHandler = self->_unitTest_didWaitForJournalMergeHandler;
    self->_unitTest_didWaitForJournalMergeHandler = 0;

    -[HDDatabaseJournal invalidate](self->_journal, "invalidate");
    -[HDDatabaseJournal invalidate](self->_cloudSyncJournal, "invalidate");
    _HKInitializeLogging();
    v11 = *MEMORY[0x1E0CB52B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v20 = self;
      _os_log_impl(&dword_1B7802000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@: Health database invalidated", buf, 0xCu);
    }
  }
  -[NSConditionLock lockWhenCondition:](self->_activeDatabasesLock, "lockWhenCondition:", 0);
  v12 = -[NSMutableSet count](self->_activeDatabases, "count");
  -[NSConditionLock unlock](self->_activeDatabasesLock, "unlock");
  if (v12)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDDatabase.mm"), 2826, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("activeDatabaseCount == 0"));

  }
}

void __31__HDDatabase_invalidateAndWait__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 176), "removeAllObjects");
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 176);
  *(_QWORD *)(v2 + 176) = 0;

  -[HDDatabase _protectedDataQueue_cancelProtectedDataFlushTimer](*(_QWORD *)(a1 + 32));
}

- (void)obliterateWithReason:(id)a3 preserveCopy:(BOOL)a4
{
  _BOOL8 v4;
  void *v7;
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
  uint64_t v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  os_log_t *v22;
  uint64_t v23;
  void *v24;
  char v25;
  id v26;
  NSObject *v27;
  void *v28;
  BOOL v29;
  char v30;
  id v31;
  NSObject *v32;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  void *v39;
  void *v40;
  HDDatabase *v41;
  id v42;
  id v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _BYTE v48[128];
  _QWORD v49[2];
  _QWORD v50[2];
  uint8_t buf[4];
  void *v52;
  __int16 v53;
  id v54;
  uint64_t v55;

  v4 = a4;
  v55 = *MEMORY[0x1E0C80C00];
  v38 = a3;
  if ((-[HDDatabase isInvalid]((os_unfair_lock_s *)self) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDDatabase.mm"), 2830, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("self.isInvalid"));

  }
  -[NSConditionLock lockWhenCondition:](self->_activeDatabasesLock, "lockWhenCondition:", 0);
  v41 = self;
  v34 = -[HDDatabase _newCorruptionEventStore](self, "_newCorruptionEventStore");
  objc_msgSend(v34, "persistObliterationForReason:", v38);
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDDatabase profileDirectoryPath](v41, "profileDirectoryPath");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  if (!_HDIsUnitTesting)
  {
    _HKInitializeLogging();
    v8 = *MEMORY[0x1E0CB52B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412546;
      v52 = v39;
      v53 = 2112;
      v54 = v38;
      _os_log_fault_impl(&dword_1B7802000, v8, OS_LOG_TYPE_FAULT, "Deleting Health databases in \"%@\": %@", buf, 0x16u);
    }
  }
  objc_msgSend(MEMORY[0x1E0D29850], "mainDatabaseURLWithProfileDirectoryPath:", v39);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D29850], "protectedDatabaseURLWithProfileDirectoryPath:", v39);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D29850], "highFrequencyDatabaseURLWithProfileDirectoryPath:", v39);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "hd_removeSQLiteDatabaseAtURL:preserveCopy:", v35, v4);
  objc_msgSend(v7, "hd_removeSQLiteDatabaseAtURL:preserveCopy:", v36, v4);
  objc_msgSend(v7, "hd_removeHFDDatabaseAtURL:preserveCopy:", v37, v4);
  -[NSString stringByAppendingPathComponent:](v41->_profileDirectoryPath, "stringByAppendingPathComponent:", CFSTR("Journals"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v50[0] = v9;
  -[NSString stringByAppendingPathComponent:](v41->_profileDirectoryPath, "stringByAppendingPathComponent:", CFSTR("CloudSyncJournals"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v50[1] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v50, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[HDDatabase profile](v41, "profile");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "attachmentManager");
  v40 = (void *)objc_claimAutoreleasedReturnValue();

  if (v40)
  {
    objc_msgSend(v40, "filesDirectoryURL");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "path");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v49[0] = v14;
    objc_msgSend(v40, "unconfirmedFilesDirectoryURL");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "path");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v49[1] = v16;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v49, 2);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "arrayByAddingObjectsFromArray:", v17);
    v18 = objc_claimAutoreleasedReturnValue();

    v11 = (void *)v18;
  }
  v46 = 0u;
  v47 = 0u;
  v44 = 0u;
  v45 = 0u;
  v19 = v11;
  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v44, v48, 16);
  if (v20)
  {
    v21 = *(_QWORD *)v45;
    v22 = (os_log_t *)MEMORY[0x1E0CB52B0];
    do
    {
      v23 = 0;
      do
      {
        if (*(_QWORD *)v45 != v21)
          objc_enumerationMutation(v19);
        v24 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * v23);
        v43 = 0;
        v25 = objc_msgSend(v7, "hd_removeAllFilesAtDirectoryPath:error:", v24, &v43);
        v26 = v43;
        if ((v25 & 1) == 0)
        {
          _HKInitializeLogging();
          v27 = *v22;
          if (os_log_type_enabled(*v22, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543618;
            v52 = v24;
            v53 = 2114;
            v54 = v26;
            _os_log_error_impl(&dword_1B7802000, v27, OS_LOG_TYPE_ERROR, "Failed to delete all files in directory \"%{public}@\": %{public}@", buf, 0x16u);
          }
        }

        ++v23;
      }
      while (v20 != v23);
      v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v44, v48, 16);
    }
    while (v20);
  }

  -[HDDatabase profile](v41, "profile");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend(v28, "profileType") == 1;

  if (!v29)
  {
    v42 = 0;
    v30 = objc_msgSend(v7, "removeItemAtPath:error:", v39, &v42);
    v31 = v42;
    if ((v30 & 1) == 0)
    {
      _HKInitializeLogging();
      v32 = *MEMORY[0x1E0CB52B0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        v52 = v39;
        v53 = 2114;
        v54 = v31;
        _os_log_error_impl(&dword_1B7802000, v32, OS_LOG_TYPE_ERROR, "Failed to delete directory at path \"%{public}@\": %{public}@", buf, 0x16u);
      }
    }

  }
  -[NSConditionLock unlock](v41->_activeDatabasesLock, "unlock");

}

- (id)databaseUUIDWithError:(id *)a3
{
  os_unfair_lock_s *p_databaseUUIDLock;
  NSUUID *v6;
  NSUUID *v7;
  void *v8;
  _QWORD v10[6];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  p_databaseUUIDLock = &self->_databaseUUIDLock;
  os_unfair_lock_lock(&self->_databaseUUIDLock);
  v6 = self->_databaseUUID;
  os_unfair_lock_unlock(p_databaseUUIDLock);
  if (v6)
  {
    v7 = v6;
  }
  else
  {
    v11 = 0;
    v12 = &v11;
    v13 = 0x3032000000;
    v14 = __Block_byref_object_copy__68;
    v15 = __Block_byref_object_dispose__68;
    v16 = 0;
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __36__HDDatabase_databaseUUIDWithError___block_invoke;
    v10[3] = &unk_1E6CF43D0;
    v10[4] = self;
    v10[5] = &v11;
    -[HDDatabase performHighPriorityTransactionsWithError:block:](self, "performHighPriorityTransactionsWithError:block:", a3, v10);
    objc_msgSend(MEMORY[0x1E0CB3A28], "hk_UUIDWithData:", v12[5]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    os_unfair_lock_lock(p_databaseUUIDLock);
    if (!self->_databaseUUID)
      objc_storeStrong((id *)&self->_databaseUUID, v8);
    os_unfair_lock_unlock(p_databaseUUIDLock);
    v7 = v8;
    _Block_object_dispose(&v11, 8);

  }
  return v7;
}

BOOL __36__HDDatabase_databaseUUIDWithError___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  objc_msgSend(*(id *)(a1 + 32), "profile");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[HDKeyValueEntity retrieveDatabaseIdentifierFromProfile:error:](HDUnprotectedKeyValueEntity, "retrieveDatabaseIdentifierFromProfile:error:", v4, a2);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

  return *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) != 0;
}

- (void)unitTest_setContentProtectionStateAndWait:(int64_t)a3
{
  void *v5;

  -[HDDatabase contentProtectionManager](self, "contentProtectionManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setContentProtectionState:", a3);

  dispatch_sync((dispatch_queue_t)self->_protectedDataQueue, &__block_literal_global_432);
}

- (void)unitTest_clearFirstJournalMergeCleanupFlag
{
  atomic_store(0, (unsigned __int8 *)&self->_hasCompletedFirstJournalMergeCleanup);
}

- (void)unitTest_disableDatabaseAccessibilityAssertions
{
  NSObject *protectedDataQueue;
  _QWORD block[5];

  protectedDataQueue = self->_protectedDataQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __61__HDDatabase_unitTest_disableDatabaseAccessibilityAssertions__block_invoke;
  block[3] = &unk_1E6CF3F98;
  block[4] = self;
  dispatch_sync(protectedDataQueue, block);
}

void __61__HDDatabase_unitTest_disableDatabaseAccessibilityAssertions__block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  _BYTE v9[128];
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 209) = 1;
  v5 = 0u;
  v6 = 0u;
  v7 = 0u;
  v8 = 0u;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 336), "allAssertionsForIdentifier:", CFSTR("DatabaseAccessibility"), 0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v5, v9, 16);
  if (v2)
  {
    v3 = *(_QWORD *)v6;
    do
    {
      v4 = 0;
      do
      {
        if (*(_QWORD *)v6 != v3)
          objc_enumerationMutation(v1);
        objc_msgSend(*(id *)(*((_QWORD *)&v5 + 1) + 8 * v4++), "invalidate");
      }
      while (v2 != v4);
      v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v5, v9, 16);
    }
    while (v2);
  }

}

- (void)unitTest_enableDatabaseAccessibilityAssertions
{
  NSObject *protectedDataQueue;
  _QWORD block[5];

  protectedDataQueue = self->_protectedDataQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __60__HDDatabase_unitTest_enableDatabaseAccessibilityAssertions__block_invoke;
  block[3] = &unk_1E6CF3F98;
  block[4] = self;
  dispatch_sync(protectedDataQueue, block);
}

uint64_t __60__HDDatabase_unitTest_enableDatabaseAccessibilityAssertions__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 209) = 0;
  return result;
}

- (NSString)profileDirectoryPath
{
  return self->_profileDirectoryPath;
}

- (HKProfileIdentifier)profileIdentifier
{
  void *v2;
  void *v3;

  -[HDDatabase profile](self, "profile");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "profileIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (HKProfileIdentifier *)v3;
}

- (void)unitTest_mergeSecondaryJournalsWithActivity:(id)a3 completion:(id)a4
{
  -[HDDatabase _mergeSecondaryJournalsWithActivity:completion:]((uint64_t)self, a3, a4);
}

- (HDDatabaseJournal)journal
{
  return self->_journal;
}

- (HDDatabaseJournal)cloudSyncJournal
{
  return self->_cloudSyncJournal;
}

- (HDDatabaseConfiguration)configuration
{
  return self->_configuration;
}

- (void)setProfile:(id)a3
{
  objc_storeWeak((id *)&self->_profile, a3);
}

- (HDContentProtectionManager)contentProtectionManager
{
  return self->_contentProtectionManager;
}

- (void)setOffsetTimeInterval:(double)a3
{
  self->_offsetTimeInterval = a3;
}

- (double)protectedDataFlushInterval
{
  return self->_protectedDataFlushInterval;
}

- (double)inactivityFlushInterval
{
  return self->_inactivityFlushInterval;
}

- (void)setInactivityFlushInterval:(double)a3
{
  self->_inactivityFlushInterval = a3;
}

- (BOOL)didRunPostMigrationUpdates
{
  return self->_didRunPostMigrationUpdates;
}

- (void)setDidRunPostMigrationUpdates:(BOOL)a3
{
  self->_didRunPostMigrationUpdates = a3;
}

- (int64_t)corruptedMigrationAttemptsCount
{
  return self->_corruptedMigrationAttemptsCount;
}

- (void)setCorruptedMigrationAttemptsCount:(int64_t)a3
{
  self->_corruptedMigrationAttemptsCount = a3;
}

- (id)unitTest_didWaitForJournalMergeHandler
{
  return self->_unitTest_didWaitForJournalMergeHandler;
}

- (void)setUnitTest_didWaitForJournalMergeHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 440);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_unitTest_didWaitForJournalMergeHandler, 0);
  objc_storeStrong((id *)&self->_contentProtectionManager, 0);
  objc_storeStrong((id *)&self->_databasePoolForType, 0);
  objc_storeStrong((id *)&self->_extendedTransactions, 0);
  objc_storeStrong((id *)&self->_asynchronousOperationQueue, 0);
  objc_storeStrong((id *)&self->_migratedDatabases, 0);
  objc_storeStrong((id *)&self->_activeDatabases, 0);
  objc_storeStrong((id *)&self->_activeDatabasesLock, 0);
  objc_storeStrong((id *)&self->_schemaMigrationLock, 0);
  objc_storeStrong((id *)&self->_assertionManager, 0);
  objc_storeStrong((id *)&self->_threadLocalTransactionContextStackKey, 0);
  objc_storeStrong((id *)&self->_threadLocalTransactionKey, 0);
  objc_destroyWeak((id *)&self->_profile);
  objc_storeStrong((id *)&self->_cloudSyncJournal, 0);
  objc_storeStrong((id *)&self->_journal, 0);
  objc_storeStrong((id *)&self->_protectedResourceAssertionsByIdentifier, 0);
  objc_storeStrong((id *)&self->_protectedResourceStores, 0);
  objc_storeStrong((id *)&self->_databaseJournalMergeObserverSetByType, 0);
  objc_storeStrong((id *)&self->_secondaryJournalMergeActivity, 0);
  objc_storeStrong((id *)&self->_protectedDataFlushDeadlineTimer, 0);
  objc_storeStrong((id *)&self->_protectedDataFlushDeadlineDate, 0);
  objc_storeStrong((id *)&self->_firstUnlockBlocks, 0);
  objc_storeStrong((id *)&self->_transactionStartGroup, 0);
  objc_storeStrong((id *)&self->_firstProtectedWriteTransactionBlocks, 0);
  objc_storeStrong((id *)&self->_firstUnprotectedWriteTransactionBlocks, 0);
  objc_storeStrong((id *)&self->_inactivityFlushTimer, 0);
  objc_storeStrong((id *)&self->_contentProtectionObservationGroup, 0);
  objc_storeStrong((id *)&self->_protectedDataObservers, 0);
  objc_storeStrong((id *)&self->_protectedDataQueue, 0);
  objc_storeStrong((id *)&self->_writeLock, 0);
  objc_storeStrong((id *)&self->_serialAsynchronousQueue, 0);
  objc_storeStrong((id *)&self->_databaseUUID, 0);
  objc_storeStrong((id *)&self->_profileDirectoryPath, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
}

@end
