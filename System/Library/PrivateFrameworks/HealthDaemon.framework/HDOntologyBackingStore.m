@implementation HDOntologyBackingStore

- (HDOntologyBackingStore)init
{
  void *v3;
  uint64_t v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99778];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("The -%@ method is not available on %@"), v5, objc_opt_class());

  return 0;
}

- (HDOntologyBackingStore)initWithDaemon:(id)a3
{
  id v4;
  void *v5;
  HDOntologyBackingStore *v6;

  v4 = a3;
  objc_msgSend(v4, "healthDirectoryURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[HDOntologyBackingStore _initWithDaemon:baseURL:](self, "_initWithDaemon:baseURL:", v4, v5);

  return v6;
}

- (id)_initWithDaemon:(id)a3 baseURL:(id)a4
{
  id v6;
  id v7;
  HDOntologyBackingStore *v8;
  HDOntologyBackingStore *v9;
  uint64_t v10;
  NSURL *ontologyURL;
  uint64_t v12;
  OS_dispatch_queue *queue;
  void *v14;
  objc_class *v15;
  void *v16;
  uint64_t v17;
  NSString *threadLocalTransactionKey;
  id v19;
  void *v20;
  uint64_t v21;
  HKObserverSet *observers;
  uint64_t v23;
  HDDatabaseConnectionPool *databaseConnectionPool;
  uint64_t v25;
  NSConditionLock *activeDatabaseConnectionLock;
  NSMutableSet *v27;
  NSMutableSet *activeDatabaseConnections;
  HDAssertionManager *v29;
  HDAssertionManager *protectedResourceAssertionManager;
  id WeakRetained;
  id v32;
  objc_super v34;

  v6 = a3;
  v7 = a4;
  v34.receiver = self;
  v34.super_class = (Class)HDOntologyBackingStore;
  v8 = -[HDOntologyBackingStore init](&v34, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_daemon, v6);
    +[HDOntologyBackingStore _ontologyURLWithBaseURL:]((uint64_t)HDOntologyBackingStore, v7);
    v10 = objc_claimAutoreleasedReturnValue();
    ontologyURL = v9->_ontologyURL;
    v9->_ontologyURL = (NSURL *)v10;

    atomic_store(0, (unsigned __int8 *)&v9->_invalidated);
    HKCreateSerialDispatchQueue();
    v12 = objc_claimAutoreleasedReturnValue();
    queue = v9->_queue;
    v9->_queue = (OS_dispatch_queue *)v12;

    v14 = (void *)MEMORY[0x1E0CB3940];
    v15 = (objc_class *)objc_opt_class();
    NSStringFromClass(v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "stringWithFormat:", CFSTR("%@.%p.transaction"), v16, v9);
    v17 = objc_claimAutoreleasedReturnValue();
    threadLocalTransactionKey = v9->_threadLocalTransactionKey;
    v9->_threadLocalTransactionKey = (NSString *)v17;

    v9->_available = 0;
    v9->_availabilityLock._os_unfair_lock_opaque = 0;
    v9->_observedContentProtectionState = 0;
    v19 = objc_alloc(MEMORY[0x1E0CB6988]);
    HKLogHealthOntology();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v19, "initWithName:loggingCategory:", CFSTR("HDOntologyBackingStoreObserver"), v20);
    observers = v9->_observers;
    v9->_observers = (HKObserverSet *)v21;

    v23 = objc_msgSend(objc_alloc(MEMORY[0x1E0D29828]), "initWithConcurrentReaderLimit:delegate:", 2, v9);
    databaseConnectionPool = v9->_databaseConnectionPool;
    v9->_databaseConnectionPool = (HDDatabaseConnectionPool *)v23;

    v25 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3538]), "initWithCondition:", 0);
    activeDatabaseConnectionLock = v9->_activeDatabaseConnectionLock;
    v9->_activeDatabaseConnectionLock = (NSConditionLock *)v25;

    v27 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    activeDatabaseConnections = v9->_activeDatabaseConnections;
    v9->_activeDatabaseConnections = v27;

    v29 = (HDAssertionManager *)objc_alloc_init(MEMORY[0x1E0D29808]);
    protectedResourceAssertionManager = v9->_protectedResourceAssertionManager;
    v9->_protectedResourceAssertionManager = v29;

    -[HDAssertionManager addObserver:forAssertionIdentifier:queue:](v9->_protectedResourceAssertionManager, "addObserver:forAssertionIdentifier:queue:", v9, CFSTR("OntologyDatabaseAccessibility"), v9->_queue);
    WeakRetained = objc_loadWeakRetained((id *)&v9->_daemon);
    objc_msgSend(WeakRetained, "registerProtectedResourceStoreProvider:", v9);

    v32 = objc_loadWeakRetained((id *)&v9->_daemon);
    objc_msgSend(v32, "registerDaemonReadyObserver:queue:", v9, v9->_queue);

  }
  return v9;
}

+ (id)_ontologyURLWithBaseURL:(uint64_t)a1
{
  id v2;
  void *v3;
  void *v4;

  v2 = a2;
  objc_opt_self();
  objc_msgSend(v2, "URLByAppendingPathComponent:isDirectory:", CFSTR("ontology"), 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "URLByAppendingPathComponent:isDirectory:", CFSTR("HealthOntology.db"), 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)performOntologyTransactionForWrite:(BOOL)a3 profile:(id)a4 databaseTransaction:(id)a5 error:(id *)a6 transactionHandler:(id)a7
{
  unsigned int v10;
  id v12;
  id v13;
  char v14;
  void *v15;
  void *v16;
  _QWORD v18[5];
  id v19;
  id v20;
  char v21;

  v10 = a3;
  v12 = a4;
  v13 = a7;
  if (a5)
  {
    v14 = -[HDOntologyBackingStore _performOntologyTransactionWithProfile:databaseTransaction:write:error:transactionHandler:]((uint64_t)self, v12, a5, v10, a6, v13);
  }
  else
  {
    objc_msgSend(v12, "database");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    +[HDDatabaseTransactionContext contextForReadingProtectedData](HDDatabaseTransactionContext, "contextForReadingProtectedData");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __114__HDOntologyBackingStore_performOntologyTransactionForWrite_profile_databaseTransaction_error_transactionHandler___block_invoke;
    v18[3] = &unk_1E6CEEA90;
    v18[4] = self;
    v19 = v12;
    v21 = v10;
    v20 = v13;
    v14 = objc_msgSend(v15, "performTransactionWithContext:error:block:inaccessibilityHandler:", v16, a6, v18, 0);

  }
  return v14;
}

- (uint64_t)_performOntologyTransactionWithProfile:(void *)a3 databaseTransaction:(unsigned int)a4 write:(_QWORD *)a5 error:(void *)a6 transactionHandler:
{
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  uint64_t (**v17)(id, void *, _QWORD *);
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t (**v24)(id, void *, _QWORD *);
  id WeakRetained;
  void *v26;
  int v27;
  uint64_t v28;
  void *v29;
  void *v30;
  id v32;
  void *v33;
  uint64_t (**v34)(id, void *, _QWORD *);
  id v35;
  id v36;
  id v37;
  id v38;
  unsigned int v39;
  id v40;
  _QWORD v41[4];
  id v42;
  id v43;
  id v44;
  uint64_t v45;
  uint64_t (**v46)(id, void *, _QWORD *);
  char v47;

  v11 = a2;
  v12 = a3;
  v13 = a6;
  if (!a1)
  {
    v23 = 0;
    goto LABEL_21;
  }
  objc_msgSend(v12, "ontologyDatabase");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    if (-[HDOntologyBackingStore _allowedToOpenDatabaseWithError:](a1, a5))
    {
      v39 = a4;
      v15 = v11;
      v16 = v12;
      v40 = v13;
      v17 = (uint64_t (**)(id, void *, _QWORD *))v13;
      objc_msgSend(MEMORY[0x1E0CB3978], "currentThread");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "threadDictionary");
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      v20 = v19;
      objc_msgSend(v19, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 32));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = v21;
      if (v21)
      {
        if ((objc_msgSend(v21, "isWriteTransaction") & 1) != 0 || !v39)
        {
          v23 = v17[2](v17, v22, a5);
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:format:", a5, 131, CFSTR("Cannot perform an ontology write transaction nested inside a read transaction"));
          v23 = 0;
        }
        v30 = v16;
      }
      else
      {
        v38 = v15;
        v35 = v16;
        v37 = v16;
        v33 = v20;
        v36 = v20;
        v34 = v17;
        v24 = v17;
        WeakRetained = objc_loadWeakRetained((id *)(a1 + 96));
        objc_msgSend(WeakRetained, "contentProtectionManager");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = objc_msgSend(v26, "isProtectedDataAvailable");

        if (v27)
          v28 = v39;
        else
          v28 = v39 | 4;
        objc_msgSend(*(id *)(a1 + 64), "checkOutConnectionWithOptions:error:", v28, a5);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        if (v29)
        {
          v41[0] = MEMORY[0x1E0C809B0];
          v41[1] = 3221225472;
          v41[2] = __133__HDOntologyBackingStore__performOutermostTransactionForWrite_profile_databaseTransaction_threadDictionary_error_transactionHandler___block_invoke;
          v41[3] = &unk_1E6D0C738;
          v42 = v38;
          v43 = v37;
          v47 = v39;
          v32 = v36;
          v44 = v32;
          v45 = a1;
          v46 = v24;
          v23 = objc_msgSend(v29, "performTransactionWithError:write:block:", a5, v39, v41);

          v22 = 0;
          objc_msgSend(v32, "removeObjectForKey:", *(_QWORD *)(a1 + 32));
          objc_msgSend(*(id *)(a1 + 64), "checkInConnection:flushImmediately:", v29, 0);
        }
        else
        {
          v23 = 0;
          v22 = 0;
        }
        v30 = v35;

        v20 = v33;
        v17 = v34;
      }

      v13 = v40;
      goto LABEL_20;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:format:", a5, 3, CFSTR("Ontology database is nil for transaction %@"), v12);
  }
  v23 = 0;
LABEL_20:

LABEL_21:
  return v23;
}

uint64_t __114__HDOntologyBackingStore_performOntologyTransactionForWrite_profile_databaseTransaction_error_transactionHandler___block_invoke(uint64_t a1, void *a2, _QWORD *a3)
{
  return -[HDOntologyBackingStore _performOntologyTransactionWithProfile:databaseTransaction:write:error:transactionHandler:](*(_QWORD *)(a1 + 32), *(void **)(a1 + 40), a2, *(unsigned __int8 *)(a1 + 56), a3, *(void **)(a1 + 48));
}

- (void)registerOntologyDatabase:(id)a3
{
  -[HKObserverSet registerObserver:](self->_observers, "registerObserver:", a3);
}

- (BOOL)isAvailable
{
  HDOntologyBackingStore *v2;
  os_unfair_lock_s *p_availabilityLock;

  v2 = self;
  p_availabilityLock = &self->_availabilityLock;
  os_unfair_lock_lock(&self->_availabilityLock);
  LOBYTE(v2) = v2->_available;
  os_unfair_lock_unlock(p_availabilityLock);
  return (char)v2;
}

- (void)close
{
  -[HDOntologyBackingStore _flushConnectionsAndWait]((uint64_t)self);
  if (self)
  {
    -[NSConditionLock lockWhenCondition:](self->_activeDatabaseConnectionLock, "lockWhenCondition:", 0);
    -[NSConditionLock unlock](self->_activeDatabaseConnectionLock, "unlock");
  }
  -[HDOntologyBackingStore _updateAvailability]((uint64_t)self);
}

- (void)_flushConnectionsAndWait
{
  NSObject *v1;

  if (a1)
  {
    objc_msgSend(*(id *)(a1 + 64), "flush");
    v1 = objc_claimAutoreleasedReturnValue();
    dispatch_group_wait(v1, 0xFFFFFFFFFFFFFFFFLL);

  }
}

- (void)_updateAvailability
{
  os_unfair_lock_s *v2;
  id WeakRetained;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;
  _QWORD v8[5];

  if (a1)
  {
    v2 = (os_unfair_lock_s *)(a1 + 40);
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 40));
    v7 = 0;
    if (-[HDOntologyBackingStore _allowedToOpenDatabaseWithError:](a1, &v7))
    {
      WeakRetained = objc_loadWeakRetained((id *)(a1 + 96));
      objc_msgSend(WeakRetained, "contentProtectionManager");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v4, "observedState") != 2 || objc_msgSend(*(id *)(a1 + 64), "count") > 0;

    }
    else
    {
      v5 = 0;
    }
    os_unfair_lock_assert_owner(v2);
    if (*(unsigned __int8 *)(a1 + 44) != v5)
    {
      *(_BYTE *)(a1 + 44) = v5;
      v6 = *(void **)(a1 + 56);
      v8[0] = MEMORY[0x1E0C809B0];
      v8[1] = 3221225472;
      v8[2] = __66__HDOntologyBackingStore__availabilityLock_handleNewAvailability___block_invoke;
      v8[3] = &unk_1E6D0C760;
      v8[4] = a1;
      objc_msgSend(v6, "notifyObservers:", v8);
    }
    os_unfair_lock_unlock(v2);
  }
}

- (void)invalidate
{
  BOOL *p_invalidated;
  unsigned __int8 v4;

  p_invalidated = &self->_invalidated;
  do
    v4 = __ldaxr((unsigned __int8 *)p_invalidated);
  while (__stlxr(1u, (unsigned __int8 *)p_invalidated));
  if ((v4 & 1) == 0)
  {
    os_unfair_lock_lock(&self->_availabilityLock);
    self->_available = 0;
    os_unfair_lock_unlock(&self->_availabilityLock);
    -[HDAssertionManager invalidate](self->_protectedResourceAssertionManager, "invalidate");
    -[HDOntologyBackingStore _flushConnectionsAndWait]((uint64_t)self);
LABEL_6:
    -[NSConditionLock lockWhenCondition:](self->_activeDatabaseConnectionLock, "lockWhenCondition:", 0);
    -[NSConditionLock unlock](self->_activeDatabaseConnectionLock, "unlock");
    goto LABEL_7;
  }
  if (self)
    goto LABEL_6;
LABEL_7:
  -[HDOntologyBackingStore _updateAvailability]((uint64_t)self);
}

- (void)obliterateWithReason:(id)a3
{
  BOOL v4;
  id v5;
  NSObject *v6;
  id v7;
  uint8_t buf[4];
  HDOntologyBackingStore *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0;
  v4 = -[HDOntologyBackingStore obliterateWithReason:error:](self, "obliterateWithReason:error:", a3, &v7);
  v5 = v7;
  if (!v4)
  {
    _HKInitializeLogging();
    HKLogHealthOntology();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v9 = self;
      v10 = 2114;
      v11 = v5;
      _os_log_error_impl(&dword_1B7802000, v6, OS_LOG_TYPE_ERROR, "%{public}@: unable to obliterate database: %{public}@", buf, 0x16u);
    }

  }
}

- (BOOL)obliterateWithReason:(id)a3 error:(id *)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSURL *v9;
  id v10;
  char v11;
  void *v12;
  void *v13;
  uint8_t buf[4];
  HDOntologyBackingStore *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (id)-[HDDatabaseConnectionPool flush](self->_databaseConnectionPool, "flush");
  -[NSConditionLock lockWhenCondition:](self->_activeDatabaseConnectionLock, "lockWhenCondition:", 0);
  _HKInitializeLogging();
  HKLogHealthOntology();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v16 = self;
    v17 = 2114;
    v18 = v6;
    _os_log_impl(&dword_1B7802000, v8, OS_LOG_TYPE_DEFAULT, "Obliterate %{public}@ for %{public}@", buf, 0x16u);
  }

  v9 = self->_ontologyURL;
  objc_opt_self();
  v10 = objc_alloc_init(MEMORY[0x1E0CB3620]);
  v11 = objc_msgSend(v10, "hd_removeSQLiteDatabaseAtURL:preserveCopy:", v9, 0);
  if ((v11 & 1) == 0)
  {
    v12 = (void *)MEMORY[0x1E0CB35C8];
    -[NSURL path](v9, "path");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "hk_assignError:code:format:", a4, 102, CFSTR("Unable to remove underlying database at '%@'"), v13);

  }
  -[NSConditionLock unlock](self->_activeDatabaseConnectionLock, "unlock");

  return v11;
}

- (id)sizeOfUnderlyingDatabaseInBytes
{
  void *v3;
  void *v4;
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
  uint64_t i;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v23;
  void *v24;
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint8_t buf[4];
  HDOntologyBackingStore *v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  void *v35;
  _BYTE v36[128];
  _QWORD v37[5];

  v37[3] = *MEMORY[0x1E0C80C00];
  -[NSURL lastPathComponent](self->_ontologyURL, "lastPathComponent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSURL URLByDeletingLastPathComponent](self->_ontologyURL, "URLByDeletingLastPathComponent");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v37[0] = self->_ontologyURL;
  objc_msgSend(v3, "stringByAppendingString:", CFSTR("-wal"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "URLByAppendingPathComponent:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v37[1] = v6;
  v24 = v3;
  objc_msgSend(v3, "stringByAppendingString:", CFSTR("-shm"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "URLByAppendingPathComponent:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v37[2] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v37, 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v10 = v9;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v26, v36, 16);
  if (v11)
  {
    v12 = v11;
    v13 = 0;
    v14 = *(_QWORD *)v27;
    while (2)
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v27 != v14)
          objc_enumerationMutation(v10);
        v16 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
        v25 = 0;
        objc_msgSend(v16, "hk_fileSizeWithError:", &v25);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = v25;
        v19 = v18;
        if (!v17 && (objc_msgSend(v18, "hk_isCocoaNoSuchFileError") & 1) == 0)
        {
          _HKInitializeLogging();
          HKLogHealthOntology();
          v20 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend(v16, "path");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543874;
            v31 = self;
            v32 = 2114;
            v33 = v23;
            v34 = 2114;
            v35 = v19;
            _os_log_error_impl(&dword_1B7802000, v20, OS_LOG_TYPE_ERROR, "%{public}@: error getting size of \"%{public}@\": %{public}@", buf, 0x20u);

          }
          v21 = 0;
          goto LABEL_16;
        }
        v13 += objc_msgSend(v17, "longLongValue");

      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v26, v36, 16);
      if (v12)
        continue;
      break;
    }
  }
  else
  {
    v13 = 0;
  }

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v13);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_16:

  return v21;
}

+ (id)unitTesting_ontologyURLWithBaseURL:(id)a3
{
  return +[HDOntologyBackingStore _ontologyURLWithBaseURL:]((uint64_t)a1, a3);
}

+ (id)unitTesting_ontologyBackingStoreForDaemon:(id)a3 baseURL:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "_initWithDaemon:baseURL:", v7, v6);

  return v8;
}

- (void)daemonReady:(id)a3
{
  id WeakRetained;
  void *v5;
  id v6;
  void *v7;
  int64_t v8;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  WeakRetained = objc_loadWeakRetained((id *)&self->_daemon);
  objc_msgSend(WeakRetained, "contentProtectionManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addContentProtectionObserver:withQueue:", self, self->_queue);

  v6 = objc_loadWeakRetained((id *)&self->_daemon);
  objc_msgSend(v6, "contentProtectionManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "observedState");
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  os_unfair_lock_lock(&self->_availabilityLock);
  self->_observedContentProtectionState = v8;
  os_unfair_lock_unlock(&self->_availabilityLock);

  -[HDOntologyBackingStore _updateAvailability]((uint64_t)self);
}

- (NSString)protectedResourceIdentifier
{
  return (NSString *)CFSTR("OntologyDatabase");
}

- (id)requestProtectedResourceAccessAssertionForOwnerIdentifier:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *queue;
  id v8;
  void *v9;
  id v10;
  HDDatabaseConnectionPool *databaseConnectionPool;
  void *v12;
  id v13;
  id v14;
  void *v15;
  NSObject *v16;
  id v17;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(uint64_t);
  void *v22;
  HDOntologyBackingStore *v23;
  id v24;
  uint64_t *v25;
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
  uint64_t (*v37)(uint64_t, uint64_t);
  void (*v38)(uint64_t);
  id v39;
  uint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  uint64_t v43;
  id v44;
  uint8_t buf[4];
  id v46;
  __int16 v47;
  id v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v40 = 0;
  v41 = &v40;
  v42 = 0x2020000000;
  v43 = 0;
  v34 = 0;
  v35 = &v34;
  v36 = 0x3032000000;
  v37 = __Block_byref_object_copy__176;
  v38 = __Block_byref_object_dispose__176;
  v39 = 0;
  v28 = 0;
  v29 = &v28;
  v30 = 0x3032000000;
  v31 = __Block_byref_object_copy__176;
  v32 = __Block_byref_object_dispose__176;
  v33 = 0;
  queue = self->_queue;
  v19 = MEMORY[0x1E0C809B0];
  v20 = 3221225472;
  v21 = __90__HDOntologyBackingStore_requestProtectedResourceAccessAssertionForOwnerIdentifier_error___block_invoke;
  v22 = &unk_1E6D0C710;
  v23 = self;
  v25 = &v40;
  v26 = &v28;
  v27 = &v34;
  v8 = v6;
  v24 = v8;
  dispatch_sync(queue, &v19);
  v9 = (void *)v35[5];
  if (v9)
  {
    if (v41[3] >= 1)
    {
      v10 = v8;
      databaseConnectionPool = self->_databaseConnectionPool;
      v44 = 0;
      -[HDDatabaseConnectionPool checkOutConnectionWithOptions:error:](databaseConnectionPool, "checkOutConnectionWithOptions:error:", 10, &v44, v19, v20, v21, v22, v23);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v44;
      if (v12)
      {
        -[HDDatabaseConnectionPool checkInConnection:flushImmediately:](self->_databaseConnectionPool, "checkInConnection:flushImmediately:", v12, 0);
      }
      else
      {
        _HKInitializeLogging();
        HKLogHealthOntology();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543618;
          v46 = v10;
          v47 = 2114;
          v48 = v13;
          _os_log_impl(&dword_1B7802000, v16, OS_LOG_TYPE_DEFAULT, "Failed to pre-emptively check out ontology connection for accessibility assertion owner \"%{public}@\": %{public}@", buf, 0x16u);
        }

      }
      v9 = (void *)v35[5];
    }
    v17 = v9;
  }
  else
  {
    v14 = (id)v29[5];
    v15 = v14;
    if (v14)
    {
      if (a4)
        *a4 = objc_retainAutorelease(v14);
      else
        _HKLogDroppedError();
    }

    v17 = 0;
  }

  _Block_object_dispose(&v28, 8);
  _Block_object_dispose(&v34, 8);

  _Block_object_dispose(&v40, 8);
  return v17;
}

void __90__HDOntologyBackingStore_requestProtectedResourceAccessAssertionForOwnerIdentifier_error___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  id obj;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 96));
  objc_msgSend(WeakRetained, "contentProtectionManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "observedState");

  v5 = *(void **)(*(_QWORD *)(a1 + 32) + 64);
  if (v4 == 2)
  {
    if (!objc_msgSend(v5, "count"))
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "hk_protectedDataInaccessibilityError");
      v6 = objc_claimAutoreleasedReturnValue();
      v7 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
      v8 = *(void **)(v7 + 40);
      *(_QWORD *)(v7 + 40) = v6;

      return;
    }
  }
  else
  {
    v9 = objc_msgSend(v5, "cacheSize");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v9
                                                                - objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "count");
  }
  v10 = objc_msgSend(objc_alloc(MEMORY[0x1E0D29800]), "initWithAssertionIdentifier:ownerIdentifier:", CFSTR("OntologyDatabaseAccessibility"), *(_QWORD *)(a1 + 40));
  v11 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  v12 = *(void **)(v11 + 40);
  *(_QWORD *)(v11 + 40) = v10;

  if ((objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "takeAssertion:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40)) & 1) == 0)
  {
    v13 = (void *)MEMORY[0x1E0CB35C8];
    v14 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    obj = *(id *)(v14 + 40);
    objc_msgSend(*(id *)(a1 + 32), "protectedResourceIdentifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "hk_assignError:code:format:", &obj, 100, CFSTR("Unable to check out protected resource /'%@/' for owner %@"), v15, *(_QWORD *)(a1 + 40));
    objc_storeStrong((id *)(v14 + 40), obj);

    v16 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v17 = *(void **)(v16 + 40);
    *(_QWORD *)(v16 + 40) = 0;

  }
}

- (id)checkOutProtectedResourceWithAssertion:(id)a3 transaction:(id)a4 error:(id *)a5
{
  id v7;
  HDOntologyBackingStore *v8;
  void *v9;
  void *v10;

  v7 = a3;
  if ((-[HDAssertionManager hasActiveAssertion:](self->_protectedResourceAssertionManager, "hasActiveAssertion:", v7) & 1) != 0)
  {
    v8 = self;
  }
  else
  {
    v9 = (void *)MEMORY[0x1E0CB35C8];
    -[HDOntologyBackingStore protectedResourceIdentifier](self, "protectedResourceIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "hk_assignError:code:format:", a5, 3, CFSTR("Unable to check out protected resource /'%@/' with assertion %@"), v10, v7);

    v8 = 0;
  }

  return v8;
}

- (void)assertionManager:(id)a3 assertionInvalidated:(id)a4
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  -[HDOntologyBackingStore _queue_flushDatabaseConnectionsIfNecessary]((uint64_t)self);
}

- (void)_queue_flushDatabaseConnectionsIfNecessary
{
  uint64_t v2;
  id v3;

  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 24));
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 40));
    v2 = *(_QWORD *)(a1 + 48);
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 40));
    if (v2 == 2
      && (objc_msgSend(*(id *)(a1 + 88), "hasActiveAssertionForIdentifier:", CFSTR("OntologyDatabaseAccessibility")) & 1) == 0)
    {
      v3 = (id)objc_msgSend(*(id *)(a1 + 64), "flush");
    }
  }
}

- (void)contentProtectionStateChanged:(int64_t)a3 previousState:(int64_t)a4
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  os_unfair_lock_lock(&self->_availabilityLock);
  self->_observedContentProtectionState = a3;
  os_unfair_lock_unlock(&self->_availabilityLock);
  -[HDOntologyBackingStore _queue_flushDatabaseConnectionsIfNecessary]((uint64_t)self);
  -[HDOntologyBackingStore _updateAvailability]((uint64_t)self);
}

- (id)newConnectionForPool:(id)a3 error:(id *)a4
{
  id WeakRetained;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;

  if (!-[HDOntologyBackingStore _allowedToOpenDatabaseWithError:]((uint64_t)self, a4))
    return 0;
  -[NSConditionLock lock](self->_activeDatabaseConnectionLock, "lock");
  WeakRetained = objc_loadWeakRetained((id *)&self->_daemon);
  objc_msgSend(WeakRetained, "contentProtectionManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "observedState");

  if (v8 == 2)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_protectedDataInaccessibilityError");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      if (a4)
        *a4 = objc_retainAutorelease(v9);
      else
        _HKLogDroppedError();
    }

    v10 = 0;
  }
  else
  {
    +[HDSimpleGraphDatabase graphDatabaseWithURL:error:](HDSimpleGraphDatabase, "graphDatabaseWithURL:error:", self->_ontologyURL, a4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[NSMutableSet hk_addNonNilObject:](self->_activeDatabaseConnections, "hk_addNonNilObject:", v10);
  -[NSConditionLock unlockWithCondition:](self->_activeDatabaseConnectionLock, "unlockWithCondition:", -[NSMutableSet count](self->_activeDatabaseConnections, "count") != 0);
  return v10;
}

- (uint64_t)_allowedToOpenDatabaseWithError:(uint64_t)result
{
  unsigned __int8 v3;
  id WeakRetained;
  void *v5;
  char v6;
  id v7;

  if (result)
  {
    v3 = atomic_load((unsigned __int8 *)(result + 16));
    if ((v3 & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:format:", a2, 119, CFSTR("%@:%p is invalidated"), objc_opt_class(), result);
    }
    else
    {
      WeakRetained = objc_loadWeakRetained((id *)(result + 96));
      objc_msgSend(WeakRetained, "contentProtectionManager");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "deviceUnlockedSinceBoot");

      if ((v6 & 1) != 0)
        return 1;
      objc_msgSend(MEMORY[0x1E0CB35C8], "hk_databaseInaccessibleBeforeFirstUnlockError");
      v7 = (id)objc_claimAutoreleasedReturnValue();
      if (v7)
      {
        if (a2)
          *a2 = objc_retainAutorelease(v7);
        else
          _HKLogDroppedError();
      }

    }
    return 0;
  }
  return result;
}

- (void)databasePool:(id)a3 didFlushConnections:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  -[NSConditionLock lock](self->_activeDatabaseConnectionLock, "lock");
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
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
        v11 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        -[NSMutableSet removeObject:](self->_activeDatabaseConnections, "removeObject:", v11, (_QWORD)v12);
        objc_msgSend(v11, "close");
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v8);
  }

  -[NSConditionLock unlockWithCondition:](self->_activeDatabaseConnectionLock, "unlockWithCondition:", -[NSMutableSet count](self->_activeDatabaseConnections, "count") != 0);
  -[HDOntologyBackingStore _updateAvailability]((uint64_t)self);

}

uint64_t __133__HDOntologyBackingStore__performOutermostTransactionForWrite_profile_databaseTransaction_threadDictionary_error_transactionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  HDOntologyTransaction *v4;
  uint64_t v5;

  v3 = a2;
  v4 = -[HDOntologyTransaction initWithProfile:databaseTransaction:graphDatabase:isWriteTransaction:]([HDOntologyTransaction alloc], "initWithProfile:databaseTransaction:graphDatabase:isWriteTransaction:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), v3, *(unsigned __int8 *)(a1 + 72));

  objc_msgSend(*(id *)(a1 + 48), "setObject:forKeyedSubscript:", v4, *(_QWORD *)(*(_QWORD *)(a1 + 56) + 32));
  v5 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 64) + 16))();

  return v5;
}

uint64_t __66__HDOntologyBackingStore__availabilityLock_handleNewAvailability___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "ontologyBackingStore:didBecomeAvailable:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 44));
}

- (HDDaemon)daemon
{
  return (HDDaemon *)objc_loadWeakRetained((id *)&self->_daemon);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_daemon);
  objc_storeStrong((id *)&self->_protectedResourceAssertionManager, 0);
  objc_storeStrong((id *)&self->_activeDatabaseConnections, 0);
  objc_storeStrong((id *)&self->_activeDatabaseConnectionLock, 0);
  objc_storeStrong((id *)&self->_databaseConnectionPool, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_threadLocalTransactionKey, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_ontologyURL, 0);
}

@end
