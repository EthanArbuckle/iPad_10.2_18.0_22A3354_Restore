@implementation _NSHTTPAlternativeServicesStorage

- (id)HTTPServiceEntriesWithFilter:(id)a3
{
  id v4;
  void *v5;
  NSObject *workQueue;
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

  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__2748;
  v17 = __Block_byref_object_dispose__2749;
  v18 = (id)MEMORY[0x1E0C9AA60];
  v4 = a3;
  v5 = (void *)objc_msgSend(v4, "copy");
  workQueue = self->_workQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __66___NSHTTPAlternativeServicesStorage_HTTPServiceEntriesWithFilter___block_invoke;
  block[3] = &unk_1E14FD9A0;
  block[4] = self;
  v11 = v5;
  v12 = &v13;
  v7 = v5;
  dispatch_sync(workQueue, block);
  v8 = (id)v14[5];

  _Block_object_dispose(&v13, 8);
  return v8;
}

- (uint64_t)_onqueue_initializeDatabaseIfNotEmpty:(uint64_t)a1
{
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  NSObject *v17;
  dispatch_block_t v18;
  uint64_t v20;
  _QWORD block[5];
  uint8_t buf[4];
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  if (*(_BYTE *)(a1 + 25))
    return 1;
  if (*(_BYTE *)(a1 + 26) && (a2 & 1) != 0)
    return 0;
  v4 = *(void **)(a1 + 8);
  if (!*(_BYTE *)(a1 + 26) && !v4)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bundleIdentifier");
    v6 = objc_claimAutoreleasedReturnValue();

    v7 = (void *)v6;
    if (!v6)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", *(_QWORD *)_CFGetProgname(), 4);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "URLsForDirectory:inDomains:", 5, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "firstObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "URLByAppendingPathComponent:isDirectory:", CFSTR("HTTPStorages"), 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "URLByAppendingPathComponent:isDirectory:", v7, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v12, 1, 0, 0);

    objc_msgSend(v12, "setResourceValue:forKey:error:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0C999D8], 0);
    objc_msgSend(v12, "URLByAppendingPathComponent:isDirectory:", CFSTR("httpstorages.sqlite"), 0);
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = *(void **)(a1 + 8);
    *(_QWORD *)(a1 + 8) = v14;

    v4 = *(void **)(a1 + 8);
  }
  if ((-[_NSHTTPAlternativeServicesStorage _createDBSchemaForPath:](a1, v4) & 1) == 0)
  {
    if (CFNLog::onceToken != -1)
      dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4755);
    v16 = (id)CFNLog::logger;
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      v20 = *(_QWORD *)(a1 + 8);
      *(_DWORD *)buf = 138412290;
      v23 = v20;
      _os_log_debug_impl(&dword_183ECA000, v16, OS_LOG_TYPE_DEBUG, "Unable to create the Alternative Storage at location %@. Falling back to memory storage", buf, 0xCu);
    }

    -[_NSHTTPAlternativeServicesStorage _createDBSchemaForPath:](a1, 0);
  }
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 28));
  v3 = 1;
  *(_BYTE *)(a1 + 24) = 1;
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 28));
  v17 = *(NSObject **)(a1 + 16);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __75___NSHTTPAlternativeServicesStorage__onqueue_initializeDatabaseIfNotEmpty___block_invoke;
  block[3] = &unk_1E14FE118;
  block[4] = a1;
  v18 = dispatch_block_create_with_qos_class((dispatch_block_flags_t)0, QOS_CLASS_UTILITY, 0, block);
  dispatch_async(v17, v18);

  *(_BYTE *)(a1 + 25) = 1;
  return v3;
}

+ (id)sharedPersistentStore
{
  void *v2;

  v2 = (void *)sAltServiceSharedInstance;
  if (!sAltServiceSharedInstance)
  {
    if (+[_NSHTTPAlternativeServicesStorage sharedPersistentStore]::sOnce != -1)
      dispatch_once(&+[_NSHTTPAlternativeServicesStorage sharedPersistentStore]::sOnce, &__block_literal_global_2764);
    v2 = (void *)sAltServiceSharedInstance;
  }
  return v2;
}

- (_NSHTTPAlternativeServiceEntry)_onqueue_convertSqlRowToHTTPAlternativeServiceEntry:(uint64_t)a1
{
  _NSHTTPAlternativeServiceEntry *v2;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v2 = 0;
  if (a1 && a2)
  {
    v2 = objc_alloc_init(_NSHTTPAlternativeServiceEntry);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", sqlite3_column_text(a2, 0));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[_NSHTTPAlternativeServiceEntry setPartition:](v2, "setPartition:", v4);

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", sqlite3_column_text(a2, 1));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[_NSHTTPAlternativeServiceEntry setHost:](v2, "setHost:", v5);

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", sqlite3_column_text(a2, 2));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[_NSHTTPAlternativeServiceEntry setAlternateHost:](v2, "setAlternateHost:", v6);

    -[_NSHTTPAlternativeServiceEntry setPort:](v2, "setPort:", sqlite3_column_int(a2, 3));
    -[_NSHTTPAlternativeServiceEntry setAlternatePort:](v2, "setAlternatePort:", sqlite3_column_int(a2, 4));
    -[_NSHTTPAlternativeServiceEntry setServiceType:](v2, "setServiceType:", sqlite3_column_int(a2, 5));
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:", (double)sqlite3_column_int64(a2, 7));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[_NSHTTPAlternativeServiceEntry setExpirationDate:](v2, "setExpirationDate:", v7);

  }
  return v2;
}

- (void)storeHTTPServiceEntry:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  NSObject *v12;
  int v13;
  char v14;
  NSMutableSet *clearEntries;
  void *v16;
  uint64_t v17;
  id v18;
  void *v19;
  NSObject *workQueue;
  dispatch_block_t v21;
  NSObject *v22;
  dispatch_block_t v23;
  _QWORD v24[5];
  _QWORD block[5];
  id v26;
  _QWORD v27[4];
  id v28;
  uint8_t buf[16];

  v4 = a3;
  os_unfair_lock_lock(&self->lock);
  -[NSMutableSet member:](self->memoryEntries, "member:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
    goto LABEL_10;
  objc_msgSend(v4, "expirationDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "timeIntervalSinceNow");
  if (v7 <= 0.0)
  {

    goto LABEL_10;
  }
  objc_msgSend(v4, "expirationDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "expirationDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "timeIntervalSinceDate:", v9);
  v11 = v10;

  if (v11 >= 30.0)
  {
LABEL_10:
    CFSetSetValue((CFMutableSetRef)self->memoryEntries, v4);
    if ((unint64_t)-[NSMutableSet count](self->memoryEntries, "count") < 0x1F5
      || self->_garbageCollectionDispatched)
    {
      v14 = 0;
      v13 = 0;
    }
    else
    {
      v14 = 0;
      v13 = 1;
      self->_garbageCollectionDispatched = 1;
    }
    goto LABEL_13;
  }
  if (CFNLog::onceToken != -1)
    dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4755);
  v12 = (id)CFNLog::logger;
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_183ECA000, v12, OS_LOG_TYPE_DEBUG, "Ignoring alt-svc entry", buf, 2u);
  }

  v13 = 0;
  v14 = 1;
LABEL_13:
  clearEntries = self->clearEntries;
  v16 = (void *)MEMORY[0x1E0CB3880];
  v17 = MEMORY[0x1E0C809B0];
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __59___NSHTTPAlternativeServicesStorage_storeHTTPServiceEntry___block_invoke;
  v27[3] = &unk_1E14F74C8;
  v18 = v4;
  v28 = v18;
  objc_msgSend(v16, "predicateWithBlock:", v27);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableSet filterUsingPredicate:](clearEntries, "filterUsingPredicate:", v19);

  os_unfair_lock_unlock(&self->lock);
  if ((v14 & 1) == 0)
  {
    workQueue = self->_workQueue;
    block[0] = v17;
    block[1] = 3221225472;
    block[2] = __59___NSHTTPAlternativeServicesStorage_storeHTTPServiceEntry___block_invoke_2;
    block[3] = &unk_1E14FDE88;
    block[4] = self;
    v26 = v18;
    v21 = dispatch_block_create_with_qos_class((dispatch_block_flags_t)0, QOS_CLASS_UTILITY, 0, block);
    dispatch_async(workQueue, v21);

  }
  if (v13)
  {
    v22 = self->_workQueue;
    v24[0] = v17;
    v24[1] = 3221225472;
    v24[2] = __59___NSHTTPAlternativeServicesStorage_storeHTTPServiceEntry___block_invoke_4;
    v24[3] = &unk_1E14FE118;
    v24[4] = self;
    v23 = dispatch_block_create_with_qos_class((dispatch_block_flags_t)0, QOS_CLASS_UTILITY, 0, v24);
    dispatch_async(v22, v23);

  }
}

- (uint64_t)_onqueue_garbageCollect
{
  uint64_t v1;
  NSObject *v2;
  sqlite3_stmt *v3;
  sqlite3_stmt **v4;
  NSObject *v5;
  sqlite3_stmt *v6;
  sqlite3_stmt **v7;
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  id v11;
  const char *v12;
  const char *v13;
  const char *v14;
  uint8_t v15[8];
  _QWORD v16[2];
  void (*v17)(double, uint64_t);
  void *v18;
  uint64_t v19;
  _BYTE buf[24];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v1 = result;
    if (CFNLog::onceToken != -1)
      dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4755);
    v2 = (id)CFNLog::logger;
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_183ECA000, v2, OS_LOG_TYPE_DEFAULT, "Garbage collection for alternative services", buf, 2u);
    }

    os_unfair_lock_lock((os_unfair_lock_t)(v1 + 28));
    objc_msgSend(*(id *)(v1 + 32), "removeAllObjects");
    *(_BYTE *)(v1 + 24) = 0;
    os_unfair_lock_unlock((os_unfair_lock_t)(v1 + 28));
    if (!*(_BYTE *)(v1 + 26))
      __retainStorageAssertion(*(void **)(v1 + 16));
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v17 = __60___NSHTTPAlternativeServicesStorage__onqueue_garbageCollect__block_invoke;
    v18 = &unk_1E14FE118;
    v19 = v1;
    v4 = (sqlite3_stmt **)(v1 + 120);
    v3 = *(sqlite3_stmt **)(v1 + 120);
    if (!v3)
    {
      if (sqlite3_prepare_v2(*(sqlite3 **)(v1 + 48), "DELETE FROM alt_services WHERE expires_time < strftime('%s','now')", -1, (sqlite3_stmt **)(v1 + 120), 0))
      {
        if (CFNLog::onceToken != -1)
          dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4755);
        v10 = (id)CFNLog::logger;
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl(&dword_183ECA000, v10, OS_LOG_TYPE_ERROR, "Failed to init the deleteExpiredEntriesStmt statement for alt_services", buf, 2u);
        }
        goto LABEL_39;
      }
      v3 = *v4;
    }
    if (sqlite3_step(v3) != 101)
    {
      if (CFNLog::onceToken != -1)
        dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4755);
      v5 = (id)CFNLog::logger;
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        v13 = sqlite3_errmsg(*(sqlite3 **)(v1 + 48));
        *(_DWORD *)buf = 136315138;
        *(_QWORD *)&buf[4] = v13;
        _os_log_error_impl(&dword_183ECA000, v5, OS_LOG_TYPE_ERROR, "Failed to delete expired entries from alt_service db. Error= %s", buf, 0xCu);
      }

    }
    sqlite3_reset(*v4);
    v7 = (sqlite3_stmt **)(v1 + 128);
    v6 = *(sqlite3_stmt **)(v1 + 128);
    if (v6)
      goto LABEL_16;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("DELETE FROM alt_services WHERE ROWID in (SELECT ROWID FROM alt_services ORDER BY ROWID DESC LIMIT -1 OFFSET %ld)"), 1500);
    v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v12 = (const char *)objc_msgSend(v11, "UTF8String");

    if (!sqlite3_prepare_v2(*(sqlite3 **)(v1 + 48), v12, -1, (sqlite3_stmt **)(v1 + 128), 0))
    {
      v6 = *v7;
LABEL_16:
      if (sqlite3_step(v6) != 101)
      {
        if (CFNLog::onceToken != -1)
          dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4755);
        v8 = (id)CFNLog::logger;
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        {
          v14 = sqlite3_errmsg(*(sqlite3 **)(v1 + 48));
          *(_DWORD *)buf = 136315138;
          *(_QWORD *)&buf[4] = v14;
          _os_log_error_impl(&dword_183ECA000, v8, OS_LOG_TYPE_ERROR, "Failed to trim entries from alt_service db. Error= %s", buf, 0xCu);
        }

      }
      sqlite3_reset(*v7);
      *(_QWORD *)buf = 0;
      if (sqlite3_exec(*(sqlite3 **)(v1 + 48), "PRAGMA incremental_vacuum(10);", 0, 0, (char **)buf))
      {
        if (CFNLog::onceToken != -1)
          dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4755);
        v9 = (id)CFNLog::logger;
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)v15 = 0;
          _os_log_error_impl(&dword_183ECA000, v9, OS_LOG_TYPE_ERROR, "Failed to auto vacuum when garbage collecting alternative storages", v15, 2u);
        }

      }
      return ((uint64_t (*)(_QWORD *))v17)(v16);
    }
    if (CFNLog::onceToken != -1)
      dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4755);
    v10 = (id)CFNLog::logger;
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_183ECA000, v10, OS_LOG_TYPE_ERROR, "Failed to init the trimDbStmt statement for alt_services", buf, 2u);
    }
LABEL_39:

    return ((uint64_t (*)(_QWORD *))v17)(v16);
  }
  return result;
}

- (uint64_t)_createDBSchemaForPath:(uint64_t)a1
{
  id v3;
  uint64_t v4;
  const char *v5;
  int v6;
  sqlite3 **v7;
  int v8;
  NSObject *v9;
  NSObject *v10;
  const char *v11;
  uint64_t v12;
  int v14;
  char value;
  char *errmsg;
  _QWORD v17[2];
  void (*v18)(double, uint64_t);
  void *v19;
  uint64_t v20;
  uint8_t buf[4];
  const char *v22;
  __int16 v23;
  int v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v3 = objc_retainAutorelease(a2);
  v4 = objc_msgSend(v3, "fileSystemRepresentation");
  if (v4)
    v5 = (const char *)v4;
  else
    v5 = ":memory:";
  if (!*(_BYTE *)(a1 + 26))
    __retainStorageAssertion(*(void **)(a1 + 16));
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v18 = __60___NSHTTPAlternativeServicesStorage__createDBSchemaForPath___block_invoke;
  v19 = &unk_1E14FE118;
  v20 = a1;
  if (volumeSupportsFileProtection(v5))
    v6 = 3145734;
  else
    v6 = 6;
  v7 = (sqlite3 **)(a1 + 48);
  if (!sqlite3_open_v2(v5, (sqlite3 **)(a1 + 48), v6, 0))
  {
    errmsg = 0;
    v8 = objc_msgSend((id)a1, "canSuspendLocked") ^ 1;
    if (!v3)
      LOBYTE(v8) = 1;
    if ((v8 & 1) == 0)
    {
      value = -1;
      if (setxattr(v5, "com.apple.runningboard.can-suspend-locked", &value, 1uLL, 0, 0) < 0)
      {
        if (CFNLog::onceToken != -1)
          dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4755);
        v9 = (id)CFNLog::logger;
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        {
          v14 = *__error();
          *(_DWORD *)buf = 136315394;
          v22 = v5;
          v23 = 1024;
          v24 = v14;
          _os_log_error_impl(&dword_183ECA000, v9, OS_LOG_TYPE_ERROR, "Failed to set can-suspend-locked at %s: %{errno}d", buf, 0x12u);
        }

      }
    }
    sqlite3_busy_timeout(*v7, 1000);
    if (sqlite3_exec(*v7, "PRAGMA auto_vacuum = 2;", 0, 0, &errmsg))
    {
      if (CFNLog::onceToken != -1)
        dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4755);
      v10 = (id)CFNLog::logger;
      if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        goto LABEL_36;
      *(_WORD *)buf = 0;
      v11 = "Failed to set auto_vacuum to incremental";
    }
    else if (sqlite3_exec(*v7, "PRAGMA journal_mode=WAL;", 0, 0, &errmsg))
    {
      if (CFNLog::onceToken != -1)
        dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4755);
      v10 = (id)CFNLog::logger;
      if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        goto LABEL_36;
      *(_WORD *)buf = 0;
      v11 = "Failed to set journal mode";
    }
    else
    {
      if (!sqlite3_exec(*v7, "CREATE TABLE IF NOT EXISTS alt_services(       partition text NOT NULL,        host text NOT NULL,        alternateHost text NOT NULL,        port int NOT NULL,        alternatePort int NOT NULL,        type int NOT NULL,        creation_time int,        expires_time int,        UNIQUE(partition, host, port, type)       );",
              0,
              0,
              &errmsg))
      {
        v12 = 1;
        goto LABEL_38;
      }
      if (CFNLog::onceToken != -1)
        dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4755);
      v10 = (id)CFNLog::logger;
      if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        goto LABEL_36;
      *(_WORD *)buf = 0;
      v11 = "Failed to create schema";
    }
    _os_log_error_impl(&dword_183ECA000, v10, OS_LOG_TYPE_ERROR, v11, buf, 2u);
LABEL_36:

    goto LABEL_37;
  }
  sqlite3_close(*v7);
LABEL_37:
  v12 = 0;
LABEL_38:
  ((void (*)(_QWORD *))v18)(v17);

  return v12;
}

- (BOOL)canSuspendLocked
{
  return self->_canSuspendLocked;
}

- (id)initInMemoryStore
{
  id result;

  result = -[_NSHTTPAlternativeServicesStorage init](self, "init");
  if (result)
    *((_BYTE *)result + 26) = 1;
  return result;
}

- (_NSHTTPAlternativeServicesStorage)init
{
  _NSHTTPAlternativeServicesStorage *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *workQueue;
  NSMutableSet *v5;
  NSMutableSet *memoryEntries;
  NSMutableSet *v7;
  NSMutableSet *clearEntries;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)_NSHTTPAlternativeServicesStorage;
  v2 = -[_NSHTTPAlternativeServicesStorage init](&v10, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("com.apple.cfnetwork.altservicesstorage", 0);
    workQueue = v2->_workQueue;
    v2->_workQueue = (OS_dispatch_queue *)v3;

    v5 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    memoryEntries = v2->memoryEntries;
    v2->memoryEntries = v5;

    v7 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    clearEntries = v2->clearEntries;
    v2->clearEntries = v7;

    v2->lock._os_unfair_lock_opaque = 0;
  }
  return v2;
}

- (void)setCanSuspendLocked:(BOOL)a3
{
  self->_canSuspendLocked = a3;
}

- (id)initPersistentStoreWithURL:(id)a3
{
  id v5;
  _NSHTTPAlternativeServicesStorage *v6;
  _NSHTTPAlternativeServicesStorage *v7;

  v5 = a3;
  v6 = -[_NSHTTPAlternativeServicesStorage init](self, "init");
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_path, a3);

  return v7;
}

- (void)dealloc
{
  objc_super v3;

  sqlite3_finalize(self->selectAllEntriesStmt);
  sqlite3_finalize(self->selectAllValidEntriesStmt);
  sqlite3_finalize(self->selectEntriesStmt);
  sqlite3_finalize(self->selectEntriesWithRegistrableDomainStmt);
  sqlite3_finalize(self->insertEntriesStmt);
  sqlite3_finalize(self->deleteWithTimeStmt);
  sqlite3_finalize(self->deleteWithHostAndPortStmt);
  sqlite3_finalize(self->deleteWithRegistrableDomainStmt);
  sqlite3_finalize(self->deleteExpiredEntriesStmt);
  sqlite3_finalize(self->trimDbStmt);
  sqlite3_close(self->dbConnection);
  v3.receiver = self;
  v3.super_class = (Class)_NSHTTPAlternativeServicesStorage;
  -[_NSHTTPAlternativeServicesStorage dealloc](&v3, sel_dealloc);
}

- (NSURL)path
{
  return self->_path;
}

- (id)HTTPServiceEntriesWithRegistrableDomain:(id)a3
{
  id v4;
  void *v5;
  NSObject *workQueue;
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

  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__2748;
  v17 = __Block_byref_object_dispose__2749;
  v18 = (id)MEMORY[0x1E0C9AA60];
  v4 = a3;
  v5 = (void *)objc_msgSend(v4, "copy");
  workQueue = self->_workQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __77___NSHTTPAlternativeServicesStorage_HTTPServiceEntriesWithRegistrableDomain___block_invoke;
  block[3] = &unk_1E14FD9A0;
  block[4] = self;
  v11 = v5;
  v12 = &v13;
  v7 = v5;
  dispatch_sync(workQueue, block);
  v8 = (id)v14[5];

  _Block_object_dispose(&v13, 8);
  return v8;
}

- (id)entries
{
  void *v3;
  NSObject *workQueue;
  id v5;
  void *v6;
  id v7;
  _QWORD v9[5];
  id v10;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  workQueue = self->_workQueue;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __44___NSHTTPAlternativeServicesStorage_entries__block_invoke;
  v9[3] = &unk_1E14FDE88;
  v9[4] = self;
  v5 = v3;
  v10 = v5;
  dispatch_sync(workQueue, v9);
  v6 = v10;
  v7 = v5;

  return v7;
}

- (void)removeHTTPAlternativeServiceEntriesWithHost:(id)a3 port:(int64_t)a4
{
  id v7;
  _NSHTTPAlternativeServicesClearEntry *v8;
  _NSHTTPAlternativeServicesClearEntry *v9;
  void *v10;
  NSObject *v11;
  NSMutableSet *memoryEntries;
  void *v13;
  uint64_t v14;
  id v15;
  void *v16;
  NSObject *workQueue;
  dispatch_block_t v18;
  _QWORD block[5];
  id v20;
  int64_t v21;
  _QWORD v22[4];
  id v23;
  int64_t v24;
  uint8_t buf[16];

  v7 = a3;
  if (v7)
  {
    os_unfair_lock_lock(&self->lock);
    v8 = objc_alloc_init(_NSHTTPAlternativeServicesClearEntry);
    v9 = v8;
    if (v8)
    {
      objc_storeStrong((id *)&v8->_host, a3);
      v9->_port = a4;
    }
    -[NSMutableSet member:](self->clearEntries, "member:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      if (CFNLog::onceToken != -1)
        dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4755);
      v11 = (id)CFNLog::logger;
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_debug_impl(&dword_183ECA000, v11, OS_LOG_TYPE_DEBUG, "Ignoring alt-svc clear", buf, 2u);
      }

    }
    else
    {
      -[NSMutableSet addObject:](self->clearEntries, "addObject:", v9);
    }
    memoryEntries = self->memoryEntries;
    v13 = (void *)MEMORY[0x1E0CB3880];
    v14 = MEMORY[0x1E0C809B0];
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __86___NSHTTPAlternativeServicesStorage_removeHTTPAlternativeServiceEntriesWithHost_port___block_invoke;
    v22[3] = &unk_1E14F74F0;
    v15 = v7;
    v23 = v15;
    v24 = a4;
    objc_msgSend(v13, "predicateWithBlock:", v22);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableSet filterUsingPredicate:](memoryEntries, "filterUsingPredicate:", v16);

    os_unfair_lock_unlock(&self->lock);
    if (!v10)
    {
      workQueue = self->_workQueue;
      block[0] = v14;
      block[1] = 3221225472;
      block[2] = __86___NSHTTPAlternativeServicesStorage_removeHTTPAlternativeServiceEntriesWithHost_port___block_invoke_2;
      block[3] = &unk_1E14FD950;
      block[4] = self;
      v20 = v15;
      v21 = a4;
      v18 = dispatch_block_create_with_qos_class((dispatch_block_flags_t)0, QOS_CLASS_UTILITY, 0, block);
      dispatch_async(workQueue, v18);

    }
  }

}

- (void)removeHTTPAlternativeServiceEntriesWithRegistrableDomain:(id)a3
{
  void *v4;
  NSObject *workQueue;
  id v6;
  id v7;
  _QWORD block[5];
  id v9;

  v7 = a3;
  v4 = (void *)objc_msgSend(v7, "copy");
  os_unfair_lock_lock(&self->lock);
  -[NSMutableSet removeAllObjects](self->memoryEntries, "removeAllObjects");
  os_unfair_lock_unlock(&self->lock);
  workQueue = self->_workQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __94___NSHTTPAlternativeServicesStorage_removeHTTPAlternativeServiceEntriesWithRegistrableDomain___block_invoke;
  block[3] = &unk_1E14FDE88;
  block[4] = self;
  v9 = v4;
  v6 = v4;
  dispatch_sync(workQueue, block);

}

- (void)removeHTTPAlternativeServiceEntriesCreatedAfterDate:(id)a3
{
  id v4;
  NSObject *workQueue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  os_unfair_lock_lock(&self->lock);
  -[NSMutableSet removeAllObjects](self->memoryEntries, "removeAllObjects");
  os_unfair_lock_unlock(&self->lock);
  workQueue = self->_workQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __89___NSHTTPAlternativeServicesStorage_removeHTTPAlternativeServiceEntriesCreatedAfterDate___block_invoke;
  block[3] = &unk_1E14FDE88;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(workQueue, block);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->clearEntries, 0);
  objc_storeStrong((id *)&self->memoryEntries, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_path, 0);
}

@end
