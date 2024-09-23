@implementation FLLogger

- (void)_cancelStoreCacheTimer
{
  void *v3;
  NSObject *v4;

  -[FLLogger persistentStoreCacheTTLTimer](self, "persistentStoreCacheTTLTimer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[FLLogger persistentStoreCacheTTLTimer](self, "persistentStoreCacheTTLTimer");
    v4 = objc_claimAutoreleasedReturnValue();
    dispatch_source_cancel(v4);

    -[FLLogger setPersistentStoreCacheTTLTimer:](self, "setPersistentStoreCacheTTLTimer:", 0);
  }
}

- (void)_cleanPersistantStores
{
  void *v3;
  NSObject *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint8_t v21[16];

  -[FLLogger context](self, "context");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v4);

  -[FLLogger log](self, "log");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v21 = 0;
    _os_log_debug_impl(&dword_1B512E000, v5, OS_LOG_TYPE_DEBUG, "Closing all open database connections.", v21, 2u);
  }

  -[FLLogger persistentStores](self, "persistentStores");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "keyEnumerator");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "nextObject");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
    do
    {
      -[FLLogger persistentStores](self, "persistentStores");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "objectForKeyedSubscript:", v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v11, "currentBatchCreationDate");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "batchMaximumDuration");
      objc_msgSend(v12, "dateByAddingTimeInterval:");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "timeIntervalSinceNow");
      v15 = v14;

      if (v15 <= 0.0)
      {
        -[FLLogger persistentStores](self, "persistentStores");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "objectForKeyedSubscript:", v9);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "closeOpenBatch");

      }
      objc_msgSend(v7, "nextObject");
      v18 = objc_claimAutoreleasedReturnValue();

      v9 = (void *)v18;
    }
    while (v18);
  }
  -[FLLogger persistentStores](self, "persistentStores");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "removeAllObjects");

  -[FLLogger dbConnections](self, "dbConnections");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "removeAllObjects");

  -[FLLogger _cancelStoreCacheTimer](self, "_cancelStoreCacheTimer");
}

- (NSMutableDictionary)persistentStores
{
  return self->_persistentStores;
}

- (FLLoggingContext)context
{
  return self->_context;
}

- (OS_os_log)log
{
  return self->_log;
}

- (FLLogger)initWithContext:(id)a3
{
  id v5;
  FLLogger *v6;
  FLLogger *v7;
  NSMutableDictionary *v8;
  NSMutableDictionary *persistentStores;
  NSMutableDictionary *v10;
  NSMutableDictionary *dbConnections;
  uint64_t v12;
  OS_os_log *log;
  uint64_t v14;
  NSDistributedNotificationCenter *notificationCenter;
  objc_super v17;

  v5 = a3;
  v17.receiver = self;
  v17.super_class = (Class)FLLogger;
  v6 = -[FLLogger init](&v17, sel_init);
  v7 = v6;
  if (FLSignpostLoggingInit_onceToken != -1)
  {
    dispatch_once(&FLSignpostLoggingInit_onceToken, &__block_literal_global_638);
    if (!v7)
      goto LABEL_4;
    goto LABEL_3;
  }
  if (v6)
  {
LABEL_3:
    v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    persistentStores = v7->_persistentStores;
    v7->_persistentStores = v8;

    v10 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    dbConnections = v7->_dbConnections;
    v7->_dbConnections = v10;

    flLogForObject(v7);
    v12 = objc_claimAutoreleasedReturnValue();
    log = v7->_log;
    v7->_log = (OS_os_log *)v12;

    objc_storeStrong((id *)&v7->_context, a3);
    v7->_lock._os_unfair_lock_opaque = 0;
    v7->_writeTransactionTTL = 5;
    objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter");
    v14 = objc_claimAutoreleasedReturnValue();
    notificationCenter = v7->_notificationCenter;
    v7->_notificationCenter = (NSDistributedNotificationCenter *)v14;

    -[NSDistributedNotificationCenter addObserver:selector:name:object:](v7->_notificationCenter, "addObserver:selector:name:object:", v7, sel_closeOpenBatchesAndStores, CFSTR("FLCloseAllStores"), 0);
    -[NSDistributedNotificationCenter addObserver:selector:name:object:](v7->_notificationCenter, "addObserver:selector:name:object:", v7, sel_closeStoreForApplicationFromNotification_, CFSTR("FLCloseStore"), 0);
  }
LABEL_4:

  return v7;
}

- (void)dealloc
{
  objc_super v3;

  -[FLLogger _closeAllStores](self, "_closeAllStores");
  -[NSDistributedNotificationCenter removeObserver:](self->_notificationCenter, "removeObserver:", self);
  -[FLLogger _cancelStoreCacheTimer](self, "_cancelStoreCacheTimer");
  -[FLLogger cancelWriteTransactionTTLTimer](self, "cancelWriteTransactionTTLTimer");
  v3.receiver = self;
  v3.super_class = (Class)FLLogger;
  -[FLLogger dealloc](&v3, sel_dealloc);
}

- (FLLogger)initWithPersistenceConfiguration:(unint64_t)a3
{
  FLLoggingContext *v5;
  void *v6;
  FLLoggingContext *v7;
  FLLogger *v8;

  v5 = [FLLoggingContext alloc];
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[FLLoggingContext initWithFileManager:persistenceConfiguration:](v5, "initWithFileManager:persistenceConfiguration:", v6, a3);

  v8 = -[FLLogger initWithContext:](self, "initWithContext:", v7);
  return v8;
}

- (BOOL)_isHoldingWriteTransaction
{
  return self->_writeTransaction != 0;
}

- (void)_claimWriteTransaction
{
  FLWriteTransaction *v3;
  FLWriteTransaction *writeTransaction;

  v3 = objc_alloc_init(FLWriteTransaction);
  writeTransaction = self->_writeTransaction;
  self->_writeTransaction = v3;

}

- (void)_relinquishWriteTransaction
{
  FLWriteTransaction *writeTransaction;

  if (objc_msgSend((id)objc_opt_class(), "isManagedProcess"))
  {
    -[FLLogger _cancelStoreCacheTimer](self, "_cancelStoreCacheTimer");
    -[FLLogger _cleanPersistantStores](self, "_cleanPersistantStores");
  }
  writeTransaction = self->_writeTransaction;
  self->_writeTransaction = 0;

}

- (FLWriteTransaction)writeTransaction
{
  os_unfair_lock_s *p_lock;
  NSObject *v4;
  FLWriteTransaction *v5;
  uint8_t v7[16];

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (!-[FLLogger _isHoldingWriteTransaction](self, "_isHoldingWriteTransaction"))
  {
    -[FLLogger log](self, "log");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v7 = 0;
      _os_log_debug_impl(&dword_1B512E000, v4, OS_LOG_TYPE_DEBUG, "Initializing new write transaction.", v7, 2u);
    }

    -[FLLogger _claimWriteTransaction](self, "_claimWriteTransaction");
    -[FLLogger _setupWriteTransactionTTLTimer](self, "_setupWriteTransactionTTLTimer");
  }
  -[FLLogger _scheduleWriteTransactionTTLTimer](self, "_scheduleWriteTransactionTTLTimer");
  v5 = self->_writeTransaction;
  os_unfair_lock_unlock(p_lock);
  return v5;
}

- (void)_setupWriteTransactionTTLTimer
{
  void *v3;
  NSObject *v4;
  OS_dispatch_source *v5;
  OS_dispatch_source *writeTransactionTTLTimer;
  NSObject *v7;
  _QWORD handler[5];
  id v9;
  id location;

  -[FLLogger context](self, "context");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, v4);
  writeTransactionTTLTimer = self->_writeTransactionTTLTimer;
  self->_writeTransactionTTLTimer = v5;

  objc_initWeak(&location, self);
  -[FLLogger writeTransactionTTLTimer](self, "writeTransactionTTLTimer");
  v7 = objc_claimAutoreleasedReturnValue();
  handler[0] = MEMORY[0x1E0C809B0];
  handler[1] = 3221225472;
  handler[2] = __42__FLLogger__setupWriteTransactionTTLTimer__block_invoke;
  handler[3] = &unk_1E68A2DE0;
  handler[4] = self;
  objc_copyWeak(&v9, &location);
  dispatch_source_set_event_handler(v7, handler);

  dispatch_activate((dispatch_object_t)self->_writeTransactionTTLTimer);
  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)_scheduleWriteTransactionTTLTimer
{
  OS_dispatch_source *writeTransactionTTLTimer;
  NSObject *v4;
  NSObject *v5;
  NSObject *v6;
  dispatch_time_t v7;
  int v8;
  unint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  writeTransactionTTLTimer = self->_writeTransactionTTLTimer;
  -[FLLogger log](self, "log");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (writeTransactionTTLTimer)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      v8 = 134217984;
      v9 = -[FLLogger writeTransactionTTL](self, "writeTransactionTTL");
      _os_log_debug_impl(&dword_1B512E000, v5, OS_LOG_TYPE_DEBUG, "Scheduling the write transaction TTL timer for %lu seconds from now.", (uint8_t *)&v8, 0xCu);
    }

    v6 = self->_writeTransactionTTLTimer;
    v7 = dispatch_walltime(0, 1000000000 * -[FLLogger writeTransactionTTL](self, "writeTransactionTTL"));
    dispatch_source_set_timer(v6, v7, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v8) = 0;
      _os_log_error_impl(&dword_1B512E000, v5, OS_LOG_TYPE_ERROR, "TTL timer scheduling was requested, but no timer was found.", (uint8_t *)&v8, 2u);
    }

  }
}

- (void)_writeTransactionTTLTimerDidFire
{
  NSObject *v3;
  uint8_t v4[16];

  -[FLLogger log](self, "log");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v4 = 0;
    _os_log_debug_impl(&dword_1B512E000, v3, OS_LOG_TYPE_DEBUG, "Invalidating write transaction after TTL expiration.", v4, 2u);
  }

  os_unfair_lock_lock(&self->_lock);
  -[FLLogger _relinquishWriteTransaction](self, "_relinquishWriteTransaction");
  -[FLLogger _cancelWriteTransactionTTLTimer](self, "_cancelWriteTransactionTTLTimer");
  os_unfair_lock_unlock(&self->_lock);
}

- (void)_cancelWriteTransactionTTLTimer
{
  NSObject *v3;
  NSObject *v4;

  -[FLLogger writeTransactionTTLTimer](self, "writeTransactionTTLTimer");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = v3;
    dispatch_source_cancel(v3);
    -[FLLogger setWriteTransactionTTLTimer:](self, "setWriteTransactionTTLTimer:", 0);
    v3 = v4;
  }

}

- (void)cancelWriteTransactionTTLTimer
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[FLLogger _cancelWriteTransactionTTLTimer](self, "_cancelWriteTransactionTTLTimer");
  os_unfair_lock_unlock(p_lock);
}

- (id)__dispatched_databaseConnectionWithStorePath:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  id v7;
  void *v8;
  FLSQLiteDatabaseConnection *v9;
  void *v10;

  v4 = a3;
  -[FLLogger context](self, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "queue");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);

  if (v4)
  {
    v7 = v4;
    -[FLLogger dbConnections](self, "dbConnections");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", v7);
    v9 = (FLSQLiteDatabaseConnection *)objc_claimAutoreleasedReturnValue();

    if (!v9)
    {
      v9 = -[FLSQLiteDatabaseConnection initWithStorePath:]([FLSQLiteDatabaseConnection alloc], "initWithStorePath:", v7);
      -[FLLogger dbConnections](self, "dbConnections");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setObject:forKeyedSubscript:", v9, v7);

    }
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)__dispatched_persistentStoreWithId:(id)a3 category:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;

  v6 = a4;
  v7 = a3;
  -[FLLogger context](self, "context");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "queue");
  v9 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v9);

  -[FLLogger context](self, "context");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "pathForStore:", v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[FLLogger __dispatched_persistentStoreWithId:category:storePath:](self, "__dispatched_persistentStoreWithId:category:storePath:", v7, v6, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)__dispatched_persistentStoreWithId:(id)a3 category:(id)a4 storePath:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  NSObject *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  FLSQLitePersistence *v17;
  void *v18;
  FLSQLitePersistence *v19;
  void *v20;
  FLSQLitePersistence *v21;
  void *v22;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[FLLogger context](self, "context");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "queue");
  v12 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v12);

  if (v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-%@"), v8, v9);
    v13 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13 = v8;
  }
  v14 = v13;
  -[FLLogger persistentStores](self, "persistentStores");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "objectForKeyedSubscript:", v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  -[FLLogger _scheduleStoreCacheTimer](self, "_scheduleStoreCacheTimer");
  if (v16)
  {
    v17 = v16;
  }
  else
  {
    -[FLLogger __dispatched_databaseConnectionWithStorePath:](self, "__dispatched_databaseConnectionWithStorePath:", v10);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (v18)
    {
      v19 = [FLSQLitePersistence alloc];
      -[FLLogger context](self, "context");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = -[FLSQLitePersistence initWithStoreId:dbConnection:loggingContext:](v19, "initWithStoreId:dbConnection:loggingContext:", v8, v18, v20);

      -[FLLogger persistentStores](self, "persistentStores");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "setObject:forKeyedSubscript:", v21, v14);

      v17 = v21;
    }
    else
    {
      v17 = 0;
    }

  }
  return v17;
}

- (void)closeStoreForBundleID:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  FLLogger *v13;
  id v14;
  uint8_t buf[4];
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[FLLogger log](self, "log");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v16 = v4;
    _os_log_debug_impl(&dword_1B512E000, v5, OS_LOG_TYPE_DEBUG, "Received notification to close stores for %@", buf, 0xCu);
  }

  v6 = (void *)os_transaction_create();
  -[FLLogger context](self, "context");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __34__FLLogger_closeStoreForBundleID___block_invoke;
  block[3] = &unk_1E68A2E08;
  v12 = v4;
  v13 = self;
  v14 = v6;
  v9 = v6;
  v10 = v4;
  dispatch_async(v8, block);

}

- (void)closeStoreForApplicationFromNotification:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("bundleIdentifier"));
  v6 = (id)objc_claimAutoreleasedReturnValue();

  v5 = v6;
  if (v6)
  {
    -[FLLogger closeStoreForBundleID:](self, "closeStoreForBundleID:", v6);
    v5 = v6;
  }

}

- (id)_nextStoreCacheTimerFireDate
{
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  double v18;
  uint64_t v19;
  void *v20;

  -[FLLogger context](self, "context");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v4);

  -[FLLogger persistentStores](self, "persistentStores");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "keyEnumerator");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "nextObject");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
    while (1)
    {
      -[FLLogger persistentStores](self, "persistentStores");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "objectForKeyedSubscript:", v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v11, "currentBatchCreationDate");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v12;
      if (v12)
      {
        v14 = v12;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v14 = (id)objc_claimAutoreleasedReturnValue();
      }
      v15 = v14;

      objc_msgSend(v11, "batchMaximumDuration");
      objc_msgSend(v15, "dateByAddingTimeInterval:");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "earlierDate:", v7);
      v17 = (id)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v17, "timeIntervalSinceNow");
      if (v18 <= 0.0)
        break;

      objc_msgSend(v6, "nextObject");
      v19 = objc_claimAutoreleasedReturnValue();

      v9 = (void *)v19;
      v7 = v17;
      if (!v19)
        goto LABEL_10;
    }
    objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v17 = v7;
LABEL_10:
    v17 = v17;
    v20 = v17;
  }

  return v20;
}

- (void)_setupStoreCacheTimer
{
  void *v3;
  NSObject *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  dispatch_source_t v9;
  NSObject *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t);
  void *v15;
  FLLogger *v16;
  id v17;
  id location[2];

  -[FLLogger context](self, "context");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v4);

  -[FLLogger persistentStoreCacheTTLTimer](self, "persistentStoreCacheTTLTimer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    -[FLLogger log](self, "log");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(location[0]) = 0;
      _os_log_debug_impl(&dword_1B512E000, v6, OS_LOG_TYPE_DEBUG, "Creating new store cache TTL timer", (uint8_t *)location, 2u);
    }

    -[FLLogger context](self, "context");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "queue");
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, v8);
    -[FLLogger setPersistentStoreCacheTTLTimer:](self, "setPersistentStoreCacheTTLTimer:", v9);

    objc_initWeak(location, self);
    -[FLLogger persistentStoreCacheTTLTimer](self, "persistentStoreCacheTTLTimer");
    v10 = objc_claimAutoreleasedReturnValue();
    v12 = MEMORY[0x1E0C809B0];
    v13 = 3221225472;
    v14 = __33__FLLogger__setupStoreCacheTimer__block_invoke;
    v15 = &unk_1E68A2DE0;
    v16 = self;
    objc_copyWeak(&v17, location);
    dispatch_source_set_event_handler(v10, &v12);

    -[FLLogger persistentStoreCacheTTLTimer](self, "persistentStoreCacheTTLTimer", v12, v13, v14, v15, v16);
    v11 = objc_claimAutoreleasedReturnValue();
    dispatch_activate(v11);

    objc_destroyWeak(&v17);
    objc_destroyWeak(location);
  }
}

- (void)_scheduleStoreCacheTimer
{
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  char v7;
  double v8;
  double v9;
  NSObject *v10;
  NSObject *v11;
  dispatch_time_t v12;
  void *v13;
  NSObject *v14;
  _QWORD v15[4];
  id v16;
  id location;
  uint8_t buf[4];
  double v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  -[FLLogger context](self, "context");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v4);

  -[FLLogger _setupStoreCacheTimer](self, "_setupStoreCacheTimer");
  -[FLLogger _nextStoreCacheTimerFireDate](self, "_nextStoreCacheTimerFireDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isEqualToDate:", v6);

  if ((v7 & 1) == 0)
  {
    objc_msgSend(v5, "timeIntervalSinceNow");
    v9 = v8;
    objc_initWeak(&location, self);
    if (v9 <= 0.0)
    {
      -[FLLogger context](self, "context");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "queue");
      v14 = objc_claimAutoreleasedReturnValue();
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __36__FLLogger__scheduleStoreCacheTimer__block_invoke;
      v15[3] = &unk_1E68A2E30;
      objc_copyWeak(&v16, &location);
      dispatch_async(v14, v15);

      objc_destroyWeak(&v16);
    }
    else
    {
      -[FLLogger log](self, "log");
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 134217984;
        v19 = v9;
        _os_log_debug_impl(&dword_1B512E000, v10, OS_LOG_TYPE_DEBUG, "Scheduling store cache TTL timer for %f seconds from now.", buf, 0xCu);
      }

      -[FLLogger persistentStoreCacheTTLTimer](self, "persistentStoreCacheTTLTimer");
      v11 = objc_claimAutoreleasedReturnValue();
      v12 = dispatch_walltime(0, (uint64_t)(v9 * 1000000000.0));
      dispatch_source_set_timer(v11, v12, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);

    }
    objc_destroyWeak(&location);
  }

}

- (void)closeAllStores
{
  void *v3;
  NSObject *v4;
  _QWORD block[5];

  -[FLLogger context](self, "context");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __26__FLLogger_closeAllStores__block_invoke;
  block[3] = &unk_1E68A30F8;
  block[4] = self;
  dispatch_async(v4, block);

}

- (void)closeOpenBatchesAndStores
{
  NSObject *v3;
  void *v4;
  NSObject *v5;
  _QWORD block[5];
  uint8_t buf[16];

  -[FLLogger log](self, "log");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B512E000, v3, OS_LOG_TYPE_INFO, "Received notification to close all stores and any open batches, closing", buf, 2u);
  }

  -[FLLogger context](self, "context");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __37__FLLogger_closeOpenBatchesAndStores__block_invoke;
  block[3] = &unk_1E68A30F8;
  block[4] = self;
  dispatch_async(v5, block);

}

- (void)_closeAllStores
{
  NSObject *v3;
  os_unfair_lock_s *p_lock;
  void *v5;
  void *v6;
  uint8_t v7[16];

  -[FLLogger log](self, "log");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v7 = 0;
    _os_log_debug_impl(&dword_1B512E000, v3, OS_LOG_TYPE_DEBUG, "Closing all stores", v7, 2u);
  }

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[FLLogger persistentStores](self, "persistentStores");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeAllObjects");

  -[FLLogger dbConnections](self, "dbConnections");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeAllObjects");

  os_unfair_lock_unlock(p_lock);
}

- (void)setValue:(id)a3 forUploadHeaderNamed:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  v6 = a4;
  -[FLLogger context](self, "context");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "userDefaults");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "objectForKey:", CFSTR("FLUploadHeaders"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    v11 = (void *)objc_msgSend(v9, "mutableCopy");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v12 = v11;
  if (v13)
    objc_msgSend(v11, "setObject:forKey:", v13, v6);
  else
    objc_msgSend(v11, "removeObjectForKey:", v6);
  objc_msgSend(v8, "setObject:forKey:", v12, CFSTR("FLUploadHeaders"));

}

- (id)uploadHeaders
{
  void *v2;
  void *v3;
  void *v4;

  -[FLLogger context](self, "context");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "userDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("FLUploadHeaders"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)scheduleImmediateUpload
{
  NSObject *v3;
  dispatch_time_t v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  _QWORD block[4];
  NSObject *v9;
  uint8_t buf[16];

  -[FLLogger log](self, "log");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B512E000, v3, OS_LOG_TYPE_INFO, "Immediate upload requested. Requesting stores be closed.", buf, 2u);
  }
  -[FLLogger closeAllStores](self, "closeAllStores");
  v4 = dispatch_time(0, 2000000000);
  -[FLLogger context](self, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "queue");
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __35__FLLogger_scheduleImmediateUpload__block_invoke;
  block[3] = &unk_1E68A30F8;
  v9 = v3;
  v7 = v3;
  dispatch_after(v4, v6, block);

}

- (void)write:(id)a3 store:(id)a4 preferredBatchSize:(unint64_t)a5 completion:(id)a6
{
  id v10;
  id v11;
  void (**v12)(id, void *);
  void *v13;
  char v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  NSObject *v19;
  NSObject *v20;
  void *v21;
  int v22;
  void *v23;
  __int16 v24;
  uint64_t v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = (void (**)(id, void *))a6;
  -[FLLogger context](self, "context");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "deviceUnlockedSinceBoot");

  if ((v14 & 1) != 0)
  {
    if (v11)
    {
      objc_msgSend(v11, "persist:preferredBatchSize:", v10, a5);
      v15 = objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    }
    v16 = (void *)MEMORY[0x1E0CB35C8];
    v17 = -8;
  }
  else
  {
    v16 = (void *)MEMORY[0x1E0CB35C8];
    v17 = -10;
  }
  objc_msgSend(v16, "errorWithDomain:code:userInfo:", CFSTR("FLErrorDomain"), v17, 0);
  v15 = objc_claimAutoreleasedReturnValue();
LABEL_7:
  v18 = (void *)v15;
  -[FLLogger log](self, "log");
  v19 = objc_claimAutoreleasedReturnValue();
  v20 = v19;
  if (v18)
  {
    if (!os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      goto LABEL_11;
    objc_msgSend(v11, "storeIdentifier");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 138412802;
    v23 = v21;
    v24 = 2048;
    v25 = objc_msgSend(v10, "length");
    v26 = 2112;
    v27 = v18;
    _os_log_error_impl(&dword_1B512E000, v20, OS_LOG_TYPE_ERROR, "Persist request for store (%@) for %lu bytes failed with error %@.", (uint8_t *)&v22, 0x20u);
  }
  else
  {
    if (!os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      goto LABEL_11;
    objc_msgSend(v11, "storeIdentifier");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 138412546;
    v23 = v21;
    v24 = 2048;
    v25 = objc_msgSend(v10, "length");
    _os_log_debug_impl(&dword_1B512E000, v20, OS_LOG_TYPE_DEBUG, "Persist request for store (%@) for %lu bytes completed successfully.", (uint8_t *)&v22, 0x16u);
  }

LABEL_11:
  if (v12)
    v12[2](v12, v18);

}

- (void)write:(id)a3 category:(id)a4 toStoreWithID:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  NSObject *v15;
  void *v16;
  NSObject *v17;
  id v18;
  id v19;
  id v20;
  id v21;
  _QWORD v22[5];
  id v23;
  id v24;
  id v25;
  void *v26;
  id v27;
  uint8_t buf[4];
  id v29;
  __int16 v30;
  id v31;
  __int16 v32;
  uint64_t v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  -[FLLogger writeTransaction](self, "writeTransaction");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[FLLogger log](self, "log");
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412802;
    v29 = v12;
    v30 = 2112;
    v31 = v11;
    v32 = 2048;
    v33 = objc_msgSend(v10, "length");
    _os_log_debug_impl(&dword_1B512E000, v15, OS_LOG_TYPE_DEBUG, "Received persist request for store (%@, %@) for %lu bytes", buf, 0x20u);
  }

  -[FLLogger context](self, "context");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "queue");
  v17 = objc_claimAutoreleasedReturnValue();
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __52__FLLogger_write_category_toStoreWithID_completion___block_invoke;
  v22[3] = &unk_1E68A2E58;
  v22[4] = self;
  v23 = v12;
  v24 = v11;
  v25 = v10;
  v26 = v14;
  v27 = v13;
  v18 = v13;
  v19 = v10;
  v20 = v11;
  v21 = v12;
  dispatch_async(v17, v22);

}

- (id)parsecStoreId
{
  return CFSTR("com.apple.parsec.feedbackv2");
}

- (id)parsecCategoryForPayload:(id)a3
{
  return 0;
}

- (id)parsecPersistentStoreForBundleID:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  id v7;
  _QWORD v9[6];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  v4 = a3;
  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy_;
  v14 = __Block_byref_object_dispose_;
  v15 = 0;
  -[FLLogger context](self, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "queue");
  v6 = objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __45__FLLogger_parsecPersistentStoreForBundleID___block_invoke;
  v9[3] = &unk_1E68A2E80;
  v9[4] = self;
  v9[5] = &v10;
  dispatch_sync(v6, v9);

  v7 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return v7;
}

- (void)reportParsecFeedback:(id)a3 completion:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;

  v6 = a4;
  objc_msgSend(a3, "data");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[FLLogger parsecCategoryForPayload:](self, "parsecCategoryForPayload:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[FLLogger parsecStoreId](self, "parsecStoreId");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[FLLogger write:category:toStoreWithID:completion:](self, "write:category:toStoreWithID:completion:", v9, v7, v8, v6);

}

- (id)readSiriCategoryFrom:(id)a3 recursive:(BOOL)a4 autoBugCaptureBlock:(id)a5
{
  _BOOL8 v6;
  _BYTE *v7;
  void (**v8)(id, const __CFString *, _QWORD);
  uint64_t v9;
  const __CFString *v10;
  int *v11;
  int *v12;
  int *v13;
  int *v14;
  char v15;
  char v16;
  unsigned int v17;
  unint64_t v18;
  uint64_t v19;
  unint64_t v20;
  char v21;
  BOOL v22;
  char v23;
  unsigned int v24;
  uint64_t v25;
  unint64_t v26;
  char v27;
  _BOOL8 v29;
  const __CFString *v30;
  void (**v31)(id, const __CFString *, _QWORD);
  uint64_t v32;
  BOOL v33;
  const __CFString *v34;
  const __CFString *v35;
  _BYTE *v36;
  char v37;
  unsigned int v38;
  unint64_t v39;
  uint64_t v40;
  unint64_t v41;
  char v42;
  int v43;
  NSObject *v44;
  void *v45;
  const __CFString *v47;
  char v49;
  void *v50;
  char v51;
  uint8_t buf[8];
  uint64_t v53;

  v6 = a4;
  v7 = a3;
  v8 = (void (**)(id, const __CFString *, _QWORD))a5;
  v9 = 0;
  v50 = 0;
  v49 = 0;
  if (v6)
    v10 = CFSTR("AnyEventTypeFoundButValueSizeZero_recursive");
  else
    v10 = CFSTR("AnyEventTypeFoundButValueSizeZero_nonrecursive");
  v11 = (int *)MEMORY[0x1E0D82BF0];
  v12 = (int *)MEMORY[0x1E0D82BD8];
  v13 = (int *)MEMORY[0x1E0D82BC8];
  v14 = (int *)MEMORY[0x1E0D82BB8];
  v51 = 1;
  v15 = 1;
  do
  {
    if (*(_QWORD *)&v7[*v11] >= *(_QWORD *)&v7[*v12] || v7[*v13])
      break;
    v16 = 0;
    v17 = 0;
    v18 = 0;
    do
    {
      v19 = *v11;
      v20 = *(_QWORD *)&v7[v19];
      if (v20 == -1 || v20 >= *(_QWORD *)&v7[*v12])
      {
        v7[*v13] = 1;
LABEL_16:
        if (!v7[*v13])
          goto LABEL_17;
LABEL_46:
        if (v6)
          v34 = CFSTR("AnyEventTypeReaderHasError_recursive");
        else
          v34 = CFSTR("AnyEventTypeReaderHasError_nonrecursive");
        v8[2](v8, v34, 0);
        goto LABEL_50;
      }
      v21 = *(_BYTE *)(*(_QWORD *)&v7[*v14] + v20);
      *(_QWORD *)&v7[v19] = v20 + 1;
      v18 |= (unint64_t)(v21 & 0x7F) << v16;
      if ((v21 & 0x80) == 0)
        goto LABEL_16;
      v16 += 7;
      v22 = v17++ >= 9;
    }
    while (!v22);
    v18 = 0;
    if (v7[*v13])
      goto LABEL_46;
LABEL_17:
    if ((v18 & 7) == 4)
      break;
    if ((v18 >> 3) == 2)
    {
      if (!v6)
      {
        if ((PBReaderSkipValueWithTag() & 1) != 0)
          continue;
        v8[2](v8, CFSTR("PayloadFoundButValueSizeZero_nonrecursive"), 0);
LABEL_91:
        v45 = 0;
        goto LABEL_80;
      }
      v29 = v6;
      v30 = v10;
      v31 = v8;
      PBReaderReadData();
      v32 = objc_claimAutoreleasedReturnValue();

      if (!(_DWORD)v9)
        v31[2](v31, CFSTR("PayloadFoundButValueSizeZero_recursive"), 0);
      v51 = 0;
      v50 = (void *)v32;
      v8 = v31;
      v10 = v30;
      v6 = v29;
      v13 = (int *)MEMORY[0x1E0D82BC8];
    }
    else
    {
      if ((v18 >> 3) == 1)
      {
        v23 = 0;
        v24 = 0;
        v9 = 0;
        while (1)
        {
          v25 = *v11;
          v26 = *(_QWORD *)&v7[v25];
          if (v26 == -1 || v26 >= *(_QWORD *)&v7[*v12])
            break;
          v27 = *(_BYTE *)(*(_QWORD *)&v7[*v14] + v26);
          *(_QWORD *)&v7[v25] = v26 + 1;
          v9 |= (unint64_t)(v27 & 0x7F) << v23;
          if ((v27 & 0x80) == 0)
            goto LABEL_34;
          v23 += 7;
          if (v24++ > 8)
            goto LABEL_39;
        }
        v7[*v13] = 1;
LABEL_34:
        if (v7[*v13])
          v33 = 1;
        else
          v33 = (_DWORD)v9 == 0;
        if (v33)
        {
LABEL_39:
          v8[2](v8, v10, 0);
          v9 = 0;
        }
        if (v6)
        {
          v15 = 0;
          v49 = 1;
          continue;
        }
LABEL_79:
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v9, self);
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_80;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0)
      {
        if (v6)
          v47 = CFSTR("SkipTagButValueSizeZero_recursive");
        else
          v47 = CFSTR("SkipTagButValueSizeZero_nonrecursive");
        v8[2](v8, v47, 0);
        goto LABEL_91;
      }
    }
  }
  while ((v15 & 1) != 0 || (v51 & 1) != 0);
LABEL_50:
  if ((v49 & 1) == 0)
  {
    if (v6)
      v35 = CFSTR("AnyEventTypeNeverFound_recursive");
    else
      v35 = CFSTR("AnyEventTypeNeverFound_nonrecursive");
    v8[2](v8, v35, 0);
  }
  if (!v6 || (_DWORD)v9 != 6)
    goto LABEL_79;
  v36 = (_BYTE *)objc_msgSend((id)objc_opt_new(), "initWithData:", v50);
  while (1)
  {
    if (*(_QWORD *)&v36[*v11] >= *(_QWORD *)&v36[*v12] || v36[*v13])
      goto LABEL_78;
    v37 = 0;
    v38 = 0;
    v39 = 0;
    while (1)
    {
      v40 = *v11;
      v41 = *(_QWORD *)&v36[v40];
      if (v41 == -1 || v41 >= *(_QWORD *)&v36[*v12])
        break;
      v42 = *(_BYTE *)(*(_QWORD *)&v36[*v14] + v41);
      *(_QWORD *)&v36[v40] = v41 + 1;
      v39 |= (unint64_t)(v42 & 0x7F) << v37;
      if ((v42 & 0x80) == 0)
        goto LABEL_68;
      v37 += 7;
      v22 = v38++ >= 9;
      if (v22)
      {
        v39 = 0;
        v43 = v36[*v13];
        goto LABEL_70;
      }
    }
    v36[*v13] = 1;
LABEL_68:
    v43 = v36[*v13];
    if (v36[*v13])
      v39 = 0;
LABEL_70:
    if (v43)
    {
      -[FLLogger log](self, "log");
      v44 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1B512E000, v44, OS_LOG_TYPE_ERROR, "Error with PBReader with payload having outer event AnyOrderedEventType", buf, 2u);
      }

LABEL_78:
      v8[2](v8, CFSTR("InnerAnyEventTypeNeverFound"), 0);

      goto LABEL_79;
    }
    if ((v39 & 7) == 4)
      goto LABEL_78;
    if ((v39 >> 3) == 2)
      break;
    if ((PBReaderSkipValueWithTag() & 1) == 0)
    {
      v8[2](v8, CFSTR("InnerSkipTagButValueSizeZero"), 0);
      goto LABEL_88;
    }
  }
  *(_QWORD *)buf = 0;
  v53 = 0;
  if ((PBReaderPlaceMark() & 1) != 0)
  {
    -[FLLogger readSiriCategoryFrom:recursive:autoBugCaptureBlock:](self, "readSiriCategoryFrom:recursive:autoBugCaptureBlock:", v36, 0, v8);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_89;
  }
  v8[2](v8, CFSTR("InnerAnyEventTypeFoundButPlaceMarkError"), 0);
LABEL_88:
  v45 = 0;
LABEL_89:

LABEL_80:
  return v45;
}

- (id)categoryForSiriPayload:(id)a3 autoBugCaptureBlock:(id)a4
{
  void (**v6)(id, const __CFString *, _QWORD);
  id v7;
  void *v8;
  void *v9;

  v6 = (void (**)(id, const __CFString *, _QWORD))a4;
  v7 = a3;
  if (!objc_msgSend(v7, "length"))
    v6[2](v6, CFSTR("AnyEventTypePayloadSizeZero"), 0);
  v8 = (void *)objc_msgSend((id)objc_opt_new(), "initWithData:", v7);

  if (v8)
  {
    -[FLLogger readSiriCategoryFrom:recursive:autoBugCaptureBlock:](self, "readSiriCategoryFrom:recursive:autoBugCaptureBlock:", v8, 1, v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6[2](v6, CFSTR("AnyEventTypeReaderNil"), 0);
    v9 = 0;
  }

  return v9;
}

- (id)siriStoreIdForBundleId:(id)a3
{
  return a3;
}

- (id)siriWritingStoreForBundleID:(id)a3 category:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  id v10;
  id v11;
  id v12;
  _QWORD v14[5];
  id v15;
  id v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;

  v6 = a3;
  v7 = a4;
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy_;
  v22 = __Block_byref_object_dispose_;
  v23 = 0;
  -[FLLogger context](self, "context");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "queue");
  v9 = objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __49__FLLogger_siriWritingStoreForBundleID_category___block_invoke;
  v14[3] = &unk_1E68A2EA8;
  v14[4] = self;
  v15 = v6;
  v16 = v7;
  v17 = &v18;
  v10 = v7;
  v11 = v6;
  dispatch_sync(v9, v14);

  v12 = (id)v19[5];
  _Block_object_dispose(&v18, 8);

  return v12;
}

- (id)siriReadingStoreForBundleID:(id)a3 directoryPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  id v13;
  id v14;
  id v15;
  _QWORD block[5];
  id v18;
  id v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;
  _QWORD v27[3];

  v27[2] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy_;
  v25 = __Block_byref_object_dispose_;
  v26 = 0;
  v8 = (void *)MEMORY[0x1E0CB3940];
  v27[0] = v7;
  v27[1] = CFSTR("data.sqlite");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "pathWithComponents:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[FLLogger context](self, "context");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "queue");
  v12 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __54__FLLogger_siriReadingStoreForBundleID_directoryPath___block_invoke;
  block[3] = &unk_1E68A2EA8;
  block[4] = self;
  v18 = v6;
  v19 = v10;
  v20 = &v21;
  v13 = v10;
  v14 = v6;
  dispatch_sync(v12, block);

  v15 = (id)v22[5];
  _Block_object_dispose(&v21, 8);

  return v15;
}

- (id)siriReadingStoreForBundleID:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  id v7;
  id v8;
  _QWORD block[5];
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v4 = a3;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy_;
  v17 = __Block_byref_object_dispose_;
  v18 = 0;
  -[FLLogger context](self, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "queue");
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __40__FLLogger_siriReadingStoreForBundleID___block_invoke;
  block[3] = &unk_1E68A2ED0;
  v11 = v4;
  v12 = &v13;
  block[4] = self;
  v7 = v4;
  dispatch_sync(v6, block);

  v8 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  return v8;
}

- (void)reportSiriInstrumentationEvent:(id)a3 forBundleID:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(uint64_t, void *, void *);
  void *v21;
  id v22;
  id v23;
  id v24;
  id location;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)MEMORY[0x1B5E47614]();
  objc_msgSend(v8, "data");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  v18 = MEMORY[0x1E0C809B0];
  v19 = 3221225472;
  v20 = __66__FLLogger_reportSiriInstrumentationEvent_forBundleID_completion___block_invoke;
  v21 = &unk_1E68A2F78;
  objc_copyWeak(&v24, &location);
  v13 = v9;
  v22 = v13;
  v14 = v12;
  v23 = v14;
  v15 = _Block_copy(&v18);
  -[FLLogger categoryForSiriPayload:autoBugCaptureBlock:](self, "categoryForSiriPayload:autoBugCaptureBlock:", v14, v15, v18, v19, v20, v21);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[FLLogger siriStoreIdForBundleId:](self, "siriStoreIdForBundleId:", v13);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[FLLogger write:category:toStoreWithID:completion:](self, "write:category:toStoreWithID:completion:", v14, v16, v17, v10);

  objc_destroyWeak(&v24);
  objc_destroyWeak(&location);

  objc_autoreleasePoolPop(v11);
}

- (id)registerSiriInstrumentationObserver:(id)a3 observer:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  uint8_t v12[16];

  v6 = a4;
  v7 = a3;
  -[FLLogger log](self, "log");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v12 = 0;
    _os_log_debug_impl(&dword_1B512E000, v8, OS_LOG_TYPE_DEBUG, "Registering new siri instrumentation observer", v12, 2u);
  }

  -[FLLogger siriReadingStoreForBundleID:](self, "siriReadingStoreForBundleID:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[FLLogger _cancelStoreCacheTimer](self, "_cancelStoreCacheTimer");
  objc_msgSend(v9, "registerInsertionObserver:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (void)removeSiriInstrumentationObserver:(id)a3
{
  NSObject *v4;
  NSObject *v5;
  uint8_t v6[16];

  v4 = a3;
  -[FLLogger log](self, "log");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v6 = 0;
    _os_log_debug_impl(&dword_1B512E000, v5, OS_LOG_TYPE_DEBUG, "Removing siri instrumentation observer", v6, 2u);
  }

  dispatch_source_cancel(v4);
}

- (id)dataUploadStoreIdForApplicationIdentifier:(id)a3
{
  return a3;
}

- (void)reportDataUploadEvent:(id)a3 application:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  NSObject *v15;
  id v16;
  id v17;
  id v18;
  id v19;
  _QWORD block[5];
  id v21;
  id v22;
  id v23;
  id v24;
  uint8_t buf[4];
  id v26;
  __int16 v27;
  uint64_t v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  v10 = a3;
  v11 = (void *)os_transaction_create();
  objc_msgSend(v10, "data");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[FLLogger log](self, "log");
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412546;
    v26 = v8;
    v27 = 2048;
    v28 = objc_msgSend(v12, "length");
    _os_log_debug_impl(&dword_1B512E000, v13, OS_LOG_TYPE_DEBUG, "Received persist data request for store (%@) for %lu bytes", buf, 0x16u);
  }

  -[FLLogger context](self, "context");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "queue");
  v15 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __57__FLLogger_reportDataUploadEvent_application_completion___block_invoke;
  block[3] = &unk_1E68A2EF8;
  block[4] = self;
  v21 = v8;
  v23 = v11;
  v24 = v9;
  v22 = v12;
  v16 = v11;
  v17 = v9;
  v18 = v12;
  v19 = v8;
  dispatch_async(v15, block);

}

- (void)reportDataPlatformBatchedEvent:(id)a3 forBundleID:(id)a4 ofSchema:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  _QWORD block[8];
  id v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  uint64_t v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (+[FLDPGBatchFactory allowDPGBundleID:](FLDPGBatchFactory, "allowDPGBundleID:", v11))
  {
    if ((unint64_t)objc_msgSend(v10, "length") < 0x80000)
    {
      +[FLDPGBatchFactory makeBatchWithPayload:bundleID:schema:](FLDPGBatchFactory, "makeBatchWithPayload:bundleID:schema:", v10, v11, v12);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "payload");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "bundleID");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[FLLogger siriStoreIdForBundleId:](self, "siriStoreIdForBundleId:", v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      -[FLLogger writeTransaction](self, "writeTransaction");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[FLLogger log](self, "log");
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412802;
        v27 = v18;
        v28 = 2112;
        v29 = &unk_1E68A6210;
        v30 = 2048;
        v31 = objc_msgSend(v16, "length");
        _os_log_debug_impl(&dword_1B512E000, v19, OS_LOG_TYPE_DEBUG, "Received persist request for store (%@, %@) for %lu bytes", buf, 0x20u);
      }

      -[FLLogger context](self, "context");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "queue");
      v21 = v16;
      v22 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __75__FLLogger_reportDataPlatformBatchedEvent_forBundleID_ofSchema_completion___block_invoke;
      block[3] = &unk_1E68A2EF8;
      block[4] = self;
      block[5] = v18;
      block[6] = v21;
      block[7] = v23;
      v25 = v13;
      dispatch_async(v22, block);

    }
    else
    {
      -[FLLogger reportDataPlatformSingleEvent:forBundleID:ofSchema:completion:](self, "reportDataPlatformSingleEvent:forBundleID:ofSchema:completion:", v10, v11, v12, v13);
    }
  }
  else
  {
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("FLErrorDomain"), -9, 0);
    (*((void (**)(id, void *))v13 + 2))(v13, v14);

  }
}

- (void)reportDataPlatformSingleEvent:(id)a3 forBundleID:(id)a4 ofSchema:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  void (**v13)(id, void *);
  id v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  NSObject *v23;
  id v24;
  id v25;
  id v26;
  void *v27;
  _QWORD block[5];
  id v29;
  id v30;
  id v31;
  void (**v32)(id, void *);
  uint8_t buf[4];
  void *v34;
  __int16 v35;
  uint64_t v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = (void (**)(id, void *))a6;
  if (!+[FLDPGBatchFactory allowDPGBundleID:](FLDPGBatchFactory, "allowDPGBundleID:", v11))
  {
    v14 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v15 = -9;
    goto LABEL_5;
  }
  if ((unint64_t)objc_msgSend(v10, "length") >= 0x1F0000)
  {
    v14 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v15 = -5;
LABEL_5:
    v16 = (void *)objc_msgSend(v14, "initWithDomain:code:userInfo:", CFSTR("FLErrorDomain"), v15, 0);
    v13[2](v13, v16);

    goto LABEL_9;
  }
  +[FLDPGBatchFactory makeBatchWithPayload:bundleID:schema:](FLDPGBatchFactory, "makeBatchWithPayload:bundleID:schema:", v10, v11, v12);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "bundleID");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = v17;
  objc_msgSend(v17, "payload");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)os_transaction_create();
  -[FLLogger log](self, "log");
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412546;
    v34 = v18;
    v35 = 2048;
    v36 = objc_msgSend(v19, "length");
    _os_log_debug_impl(&dword_1B512E000, v21, OS_LOG_TYPE_DEBUG, "Received persist data request for store (%@) for %lu bytes", buf, 0x16u);
  }

  -[FLLogger context](self, "context");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "queue");
  v23 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __74__FLLogger_reportDataPlatformSingleEvent_forBundleID_ofSchema_completion___block_invoke;
  block[3] = &unk_1E68A2EF8;
  block[4] = self;
  v29 = v18;
  v30 = v19;
  v31 = v20;
  v32 = v13;
  v24 = v20;
  v25 = v19;
  v26 = v18;
  dispatch_async(v23, block);

LABEL_9:
}

- (void)runOnStoreForBundleID:(id)a3 directoryPath:(id)a4 block:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  id v17;
  id v18;
  id v19;
  _QWORD block[5];
  id v21;
  id v22;
  id v23;
  _QWORD v24[3];

  v24[2] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  v10 = (void *)MEMORY[0x1E0CB3940];
  v24[0] = a4;
  v24[1] = CFSTR("data.sqlite");
  v11 = (void *)MEMORY[0x1E0C99D20];
  v12 = a4;
  objc_msgSend(v11, "arrayWithObjects:count:", v24, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "pathWithComponents:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  -[FLLogger context](self, "context");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "queue");
  v16 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __54__FLLogger_runOnStoreForBundleID_directoryPath_block___block_invoke;
  block[3] = &unk_1E68A2F20;
  block[4] = self;
  v21 = v8;
  v22 = v14;
  v23 = v9;
  v17 = v9;
  v18 = v14;
  v19 = v8;
  dispatch_sync(v16, block);

}

- (void)runOnStoreForBundleID:(id)a3 block:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  _QWORD block[5];
  id v16;
  id v17;
  id v18;

  v6 = a3;
  v7 = a4;
  -[FLLogger context](self, "context");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "pathForStore:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[FLLogger context](self, "context");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "queue");
  v11 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __40__FLLogger_runOnStoreForBundleID_block___block_invoke;
  block[3] = &unk_1E68A2F20;
  block[4] = self;
  v16 = v6;
  v17 = v9;
  v18 = v7;
  v12 = v7;
  v13 = v9;
  v14 = v6;
  dispatch_sync(v11, block);

}

- (void)report:(id)a3 application:(id)a4
{
  -[FLLogger report:application:onComplete:](self, "report:application:onComplete:", a3, a4, 0);
}

- (void)report:(id)a3 application:(id)a4 onComplete:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t, void *, void *);
  void *v19;
  id v20;
  id v21;
  id v22;
  id location;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_initWeak(&location, self);
  v16 = MEMORY[0x1E0C809B0];
  v17 = 3221225472;
  v18 = __42__FLLogger_report_application_onComplete___block_invoke;
  v19 = &unk_1E68A2F78;
  objc_copyWeak(&v22, &location);
  v11 = v9;
  v20 = v11;
  v12 = v8;
  v21 = v12;
  v13 = _Block_copy(&v16);
  -[FLLogger categoryForSiriPayload:autoBugCaptureBlock:](self, "categoryForSiriPayload:autoBugCaptureBlock:", v12, v13, v16, v17, v18, v19);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[FLLogger siriStoreIdForBundleId:](self, "siriStoreIdForBundleId:", v11);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[FLLogger write:category:toStoreWithID:completion:](self, "write:category:toStoreWithID:completion:", v12, v14, v15, v10);

  objc_destroyWeak(&v22);
  objc_destroyWeak(&location);

}

- (NSMutableDictionary)dbConnections
{
  return self->_dbConnections;
}

- (void)setDbConnections:(id)a3
{
  objc_storeStrong((id *)&self->_dbConnections, a3);
}

- (void)setPersistentStores:(id)a3
{
  objc_storeStrong((id *)&self->_persistentStores, a3);
}

- (void)setContext:(id)a3
{
  objc_storeStrong((id *)&self->_context, a3);
}

- (void)setLog:(id)a3
{
  objc_storeStrong((id *)&self->_log, a3);
}

- (OS_dispatch_source)persistentStoreCacheTTLTimer
{
  return self->_persistentStoreCacheTTLTimer;
}

- (void)setPersistentStoreCacheTTLTimer:(id)a3
{
  objc_storeStrong((id *)&self->_persistentStoreCacheTTLTimer, a3);
}

- (NSDistributedNotificationCenter)notificationCenter
{
  return self->_notificationCenter;
}

- (void)setNotificationCenter:(id)a3
{
  objc_storeStrong((id *)&self->_notificationCenter, a3);
}

- (os_unfair_lock_s)lock
{
  return self->_lock;
}

- (BOOL)isHoldingWriteTransaction
{
  return self->_isHoldingWriteTransaction;
}

- (void)setWriteTransaction:(id)a3
{
  objc_storeStrong((id *)&self->_writeTransaction, a3);
}

- (unint64_t)writeTransactionTTL
{
  return self->_writeTransactionTTL;
}

- (void)setWriteTransactionTTL:(unint64_t)a3
{
  self->_writeTransactionTTL = a3;
}

- (OS_dispatch_source)writeTransactionTTLTimer
{
  return self->_writeTransactionTTLTimer;
}

- (void)setWriteTransactionTTLTimer:(id)a3
{
  objc_storeStrong((id *)&self->_writeTransactionTTLTimer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_writeTransactionTTLTimer, 0);
  objc_storeStrong((id *)&self->_writeTransaction, 0);
  objc_storeStrong((id *)&self->_notificationCenter, 0);
  objc_storeStrong((id *)&self->_persistentStoreCacheTTLTimer, 0);
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_persistentStores, 0);
  objc_storeStrong((id *)&self->_dbConnections, 0);
}

void __42__FLLogger_report_application_onComplete___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id WeakRetained;
  FLAutoBugHelper *v7;
  void *v8;
  void *v9;
  FLAutoBugHelper *v10;
  id v11;

  v11 = a3;
  v5 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v7 = [FLAutoBugHelper alloc];
  objc_msgSend(WeakRetained, "context");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "autoBugCapture");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[FLAutoBugHelper initWithAutoBugCapture:bundleID:eventValue:](v7, "initWithAutoBugCapture:bundleID:eventValue:", v9, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

  if (v11)
    -[FLAutoBugHelper triggerABCWithSubtype:additionalEventName:](v10, "triggerABCWithSubtype:additionalEventName:", v5, v11);
  else
    -[FLAutoBugHelper triggerABCWithSubtype:](v10, "triggerABCWithSubtype:", v5);

}

void __40__FLLogger_runOnStoreForBundleID_block___block_invoke(_QWORD *a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  v2 = (void *)a1[4];
  objc_msgSend(v2, "siriStoreIdForBundleId:", a1[5]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "__dispatched_persistentStoreWithId:category:storePath:", v3, 0, a1[6]);
  v5 = (id)objc_claimAutoreleasedReturnValue();

  v4 = v5;
  if (v5)
  {
    (*(void (**)(void))(a1[7] + 16))();
    v4 = v5;
  }

}

void __54__FLLogger_runOnStoreForBundleID_directoryPath_block___block_invoke(_QWORD *a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  v2 = (void *)a1[4];
  objc_msgSend(v2, "siriStoreIdForBundleId:", a1[5]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "__dispatched_persistentStoreWithId:category:storePath:", v3, 0, a1[6]);
  v5 = (id)objc_claimAutoreleasedReturnValue();

  v4 = v5;
  if (v5)
  {
    (*(void (**)(void))(a1[7] + 16))();
    v4 = v5;
  }

}

void __74__FLLogger_reportDataPlatformSingleEvent_forBundleID_ofSchema_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  const __CFString *v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  const __CFString *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "__dispatched_persistentStoreWithId:category:", *(_QWORD *)(a1 + 40), &unk_1E68A6210);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "persistUploadPayload:", *(_QWORD *)(a1 + 48));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "log");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v6 = *(_QWORD *)(a1 + 40);
    v7 = objc_msgSend(*(id *)(a1 + 48), "length");
    v8 = CFSTR("failed");
    v9 = 138412802;
    v10 = v6;
    if (!v3)
      v8 = CFSTR("completed successfully");
    v11 = 2048;
    v12 = v7;
    v13 = 2112;
    v14 = v8;
    _os_log_debug_impl(&dword_1B512E000, v4, OS_LOG_TYPE_DEBUG, "Persist data request for store (%@) for %lu bytes %@", (uint8_t *)&v9, 0x20u);
  }

  v5 = *(_QWORD *)(a1 + 64);
  if (v5)
    (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v3);

}

void __75__FLLogger_reportDataPlatformBatchedEvent_forBundleID_ofSchema_completion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "__dispatched_persistentStoreWithId:category:", *(_QWORD *)(a1 + 40), &unk_1E68A6210);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)(objc_msgSend(v3, "currentBatchEventCount") - 1000) < 0xFFFFFFFFFFFFFC17
    || (v2 = objc_msgSend(v3, "currentBatchPayloadSize"),
        (unint64_t)(objc_msgSend(*(id *)(a1 + 48), "length") + v2) >= 0x1F0000))
  {
    objc_msgSend(v3, "initializeNewBatch");
  }
  objc_msgSend(*(id *)(a1 + 32), "write:store:preferredBatchSize:completion:", *(_QWORD *)(a1 + 48), v3, 0x200000, *(_QWORD *)(a1 + 64));

}

void __57__FLLogger_reportDataUploadEvent_application_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  const __CFString *v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  const __CFString *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "__dispatched_persistentStoreWithId:category:", *(_QWORD *)(a1 + 40), &unk_1E68A6210);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "persistUploadPayload:", *(_QWORD *)(a1 + 48));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "log");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v6 = *(_QWORD *)(a1 + 40);
    v7 = objc_msgSend(*(id *)(a1 + 48), "length");
    v8 = CFSTR("failed");
    v9 = 138412802;
    v10 = v6;
    if (!v3)
      v8 = CFSTR("completed successfully");
    v11 = 2048;
    v12 = v7;
    v13 = 2112;
    v14 = v8;
    _os_log_debug_impl(&dword_1B512E000, v4, OS_LOG_TYPE_DEBUG, "Persist data request for store (%@) for %lu bytes %@", (uint8_t *)&v9, 0x20u);
  }

  v5 = *(_QWORD *)(a1 + 64);
  if (v5)
    (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v3);

}

void __66__FLLogger_reportSiriInstrumentationEvent_forBundleID_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id WeakRetained;
  FLAutoBugHelper *v7;
  void *v8;
  void *v9;
  FLAutoBugHelper *v10;
  id v11;

  v11 = a3;
  v5 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v7 = [FLAutoBugHelper alloc];
  objc_msgSend(WeakRetained, "context");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "autoBugCapture");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[FLAutoBugHelper initWithAutoBugCapture:bundleID:eventValue:](v7, "initWithAutoBugCapture:bundleID:eventValue:", v9, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

  if (v11)
    -[FLAutoBugHelper triggerABCWithSubtype:additionalEventName:](v10, "triggerABCWithSubtype:additionalEventName:", v5, v11);
  else
    -[FLAutoBugHelper triggerABCWithSubtype:](v10, "triggerABCWithSubtype:", v5);

}

void __40__FLLogger_siriReadingStoreForBundleID___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  v2 = (void *)a1[4];
  objc_msgSend(v2, "siriStoreIdForBundleId:", a1[5]);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "__dispatched_persistentStoreWithId:category:", v6, 0);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1[6] + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

void __54__FLLogger_siriReadingStoreForBundleID_directoryPath___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  v2 = (void *)a1[4];
  objc_msgSend(v2, "siriStoreIdForBundleId:", a1[5]);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "__dispatched_persistentStoreWithId:category:storePath:", v6, 0, a1[6]);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1[7] + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

void __49__FLLogger_siriWritingStoreForBundleID_category___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  v2 = (void *)a1[4];
  objc_msgSend(v2, "siriStoreIdForBundleId:", a1[5]);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "__dispatched_persistentStoreWithId:category:", v6, a1[6]);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1[7] + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

void __45__FLLogger_parsecPersistentStoreForBundleID___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(v2, "parsecStoreId");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "__dispatched_persistentStoreWithId:category:", v6, 0);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

void __52__FLLogger_write_category_toStoreWithID_completion___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "__dispatched_persistentStoreWithId:category:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "write:store:preferredBatchSize:completion:", *(_QWORD *)(a1 + 56), v2, 0, *(_QWORD *)(a1 + 72));

}

uint64_t __35__FLLogger_scheduleImmediateUpload__block_invoke(uint64_t a1)
{
  NSObject *v1;
  uint8_t v3[16];

  v1 = *(NSObject **)(a1 + 32);
  if (os_log_type_enabled(v1, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_1B512E000, v1, OS_LOG_TYPE_INFO, "Telling FBF to upload immediately.", v3, 2u);
  }
  return notify_post((const char *)objc_msgSend(CFSTR("com.apple.parsec-fbf.FLUploadImmediately"), "UTF8String"));
}

void __37__FLLogger_closeOpenBatchesAndStores__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "persistentStores");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allValues");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  v4 = v3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v8++), "forceCloseOpenBatches", (_QWORD)v9);
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

  objc_msgSend(*(id *)(a1 + 32), "_closeAllStores");
}

uint64_t __26__FLLogger_closeAllStores__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_closeAllStores");
}

void __36__FLLogger__scheduleStoreCacheTimer__block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "_cleanPersistantStores");
    WeakRetained = v2;
  }

}

void __33__FLLogger__setupStoreCacheTimer__block_invoke(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;
  void *v4;
  NSObject *v5;
  uint8_t v6[16];
  uint8_t buf[16];

  objc_msgSend(*(id *)(a1 + 32), "log");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_1B512E000, v2, OS_LOG_TYPE_DEBUG, "Store cache TTL timer fired.", buf, 2u);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "log");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v6 = 0;
      _os_log_debug_impl(&dword_1B512E000, v5, OS_LOG_TYPE_DEBUG, "Purging persistent store cache after inactivity", v6, 2u);
    }

    objc_msgSend(v4, "_cancelStoreCacheTimer");
    objc_msgSend(v4, "_cleanPersistantStores");
  }

}

void __34__FLLogger_closeStoreForBundleID___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-"), *(_QWORD *)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "persistentStores");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allKeys");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        if (objc_msgSend(v10, "hasPrefix:", v2))
        {
          objc_msgSend(*(id *)(a1 + 40), "persistentStores");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "objectForKeyedSubscript:", v10);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "closeOpenBatch");

          objc_msgSend(*(id *)(a1 + 40), "persistentStores");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "removeObjectForKey:", v10);

        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }

}

void __42__FLLogger__setupWriteTransactionTTLTimer__block_invoke(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;
  void *v4;
  uint8_t v5[16];

  objc_msgSend(*(id *)(a1 + 32), "log");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v5 = 0;
    _os_log_debug_impl(&dword_1B512E000, v2, OS_LOG_TYPE_DEBUG, "Write transaction TTL timer fired.", v5, 2u);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v4 = WeakRetained;
  if (WeakRetained)
    objc_msgSend(WeakRetained, "_writeTransactionTTLTimerDidFire");

}

+ (BOOL)isManagedProcess
{
  if (isManagedProcess_onceToken != -1)
    dispatch_once(&isManagedProcess_onceToken, &__block_literal_global);
  return isManagedProcess__isManagedProcess;
}

+ (id)sharedLogger
{
  return (id)objc_msgSend(a1, "sharedLoggerWithPersistenceConfiguration:", 0);
}

+ (id)sharedLoggerWithPersistenceConfiguration:(unint64_t)a3
{
  void *v5;
  void *v6;

  if (sharedLoggerWithPersistenceConfiguration__onceToken != -1)
    dispatch_once(&sharedLoggerWithPersistenceConfiguration__onceToken, &__block_literal_global_22);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_lock((os_unfair_lock_t)&sharedLoggerWithPersistenceConfiguration__lock);
  objc_msgSend((id)sharedLoggerWithPersistenceConfiguration__sharedLoggersByConfiguration, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    v6 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithPersistenceConfiguration:", a3);
    objc_msgSend((id)sharedLoggerWithPersistenceConfiguration__sharedLoggersByConfiguration, "setObject:forKeyedSubscript:", v6, v5);
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&sharedLoggerWithPersistenceConfiguration__lock);

  return v6;
}

+ (id)fixedCategoryForBundleID:(id)a3
{
  if (+[FLDPGBatchFactory isDPGBundleID:](FLDPGBatchFactory, "isDPGBundleID:", a3))
    return &unk_1E68A6210;
  else
    return 0;
}

void __53__FLLogger_sharedLoggerWithPersistenceConfiguration___block_invoke()
{
  uint64_t v0;
  void *v1;

  sharedLoggerWithPersistenceConfiguration__lock = 0;
  v0 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 2);
  v1 = (void *)sharedLoggerWithPersistenceConfiguration__sharedLoggersByConfiguration;
  sharedLoggerWithPersistenceConfiguration__sharedLoggersByConfiguration = v0;

}

void __28__FLLogger_isManagedProcess__block_invoke()
{
  id v0;

  objc_msgSend(MEMORY[0x1E0D87D68], "currentProcess");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  isManagedProcess__isManagedProcess = objc_msgSend(v0, "isManaged");

}

@end
