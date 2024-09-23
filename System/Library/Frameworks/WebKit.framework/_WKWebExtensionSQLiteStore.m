@implementation _WKWebExtensionSQLiteStore

- (_WKWebExtensionSQLiteStore)initWithUniqueIdentifier:(id)a3 directory:(id)a4 usesInMemoryDatabase:(BOOL)a5
{
  id v8;
  id v9;
  _WKWebExtensionSQLiteStore *v10;
  uint64_t v11;
  NSString *uniqueIdentifier;
  uint64_t v13;
  NSURL *directory;
  id v15;
  dispatch_queue_t v16;
  OS_dispatch_queue *databaseQueue;
  _WKWebExtensionSQLiteStore *v18;
  objc_super v20;

  v8 = a3;
  v9 = a4;
  v20.receiver = self;
  v20.super_class = (Class)_WKWebExtensionSQLiteStore;
  v10 = -[_WKWebExtensionSQLiteStore init](&v20, sel_init);
  if (v10)
  {
    v11 = objc_msgSend(v8, "copy");
    uniqueIdentifier = v10->_uniqueIdentifier;
    v10->_uniqueIdentifier = (NSString *)v11;

    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v9);
    v13 = objc_claimAutoreleasedReturnValue();
    directory = v10->_directory;
    v10->_directory = (NSURL *)v13;

    v10->_useInMemoryDatabase = a5;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.WebKit.WKWebExtensionSQLiteStore.%@"), v10->_uniqueIdentifier);
    v15 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v16 = dispatch_queue_create((const char *)objc_msgSend(v15, "cStringUsingEncoding:", 4), 0);
    databaseQueue = v10->_databaseQueue;
    v10->_databaseQueue = (OS_dispatch_queue *)v16;

    v18 = v10;
  }

  return v10;
}

- (void)dealloc
{
  objc_super v3;

  -[_WKWebExtensionSQLiteStore close](self, "close");
  v3.receiver = self;
  v3.super_class = (Class)_WKWebExtensionSQLiteStore;
  -[_WKWebExtensionSQLiteStore dealloc](&v3, sel_dealloc);
}

- (void)close
{
  _WKWebExtensionSQLiteDatabase *database;
  _WKWebExtensionSQLiteDatabase *v4;
  int v5;
  NSObject *databaseQueue;
  _WKWebExtensionSQLiteDatabase *v7;
  _QWORD block[4];
  _WKWebExtensionSQLiteDatabase *v9;

  database = self->_database;
  if (database)
  {
    v7 = database;
    v4 = self->_database;
    self->_database = 0;

    v5 = objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread");
    databaseQueue = self->_databaseQueue;
    if (v5)
    {
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __35___WKWebExtensionSQLiteStore_close__block_invoke;
      block[3] = &unk_1E34AB170;
      v9 = v7;
      dispatch_sync(databaseQueue, block);

    }
    else
    {
      dispatch_assert_queue_V2(databaseQueue);
      -[_WKWebExtensionSQLiteDatabase close](v7, "close");
    }

  }
}

- (void)deleteDatabaseWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *databaseQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  databaseQueue = self->_databaseQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __66___WKWebExtensionSQLiteStore_deleteDatabaseWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E34AAB20;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(databaseQueue, v7);

}

- (BOOL)useInMemoryDatabase
{
  return self->_useInMemoryDatabase;
}

- (void)_vacuum
{
  int v3;
  int v4;
  NSObject *v5;
  NSString *uniqueIdentifier;
  void *v7;
  int v8;
  NSString *v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  int v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_databaseQueue);
  v3 = WebKit::_SQLiteDatabaseExecuteAndReturnError<>(self->_database, 0, CFSTR("VACUUM"));
  if (v3 != 101)
  {
    v4 = v3;
    v5 = (id)qword_1ECE710C8;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      uniqueIdentifier = self->_uniqueIdentifier;
      -[_WKWebExtensionSQLiteDatabase lastErrorMessage](self->_database, "lastErrorMessage");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 138478339;
      v9 = uniqueIdentifier;
      v10 = 2114;
      v11 = v7;
      v12 = 1024;
      v13 = v4;
      _os_log_error_impl(&dword_196BCC000, v5, OS_LOG_TYPE_ERROR, "Failed to vacuum database for extension %{private}@: %{public}@ (%d)", (uint8_t *)&v8, 0x1Cu);

    }
  }
}

- (BOOL)_openDatabaseIfNecessaryReturningErrorMessage:(id *)a3
{
  return -[_WKWebExtensionSQLiteStore _openDatabaseIfNecessaryReturningErrorMessage:createIfNecessary:](self, "_openDatabaseIfNecessaryReturningErrorMessage:createIfNecessary:", a3, 1);
}

- (BOOL)_openDatabaseIfNecessaryReturningErrorMessage:(id *)a3 createIfNecessary:(BOOL)a4
{
  _BOOL4 v4;
  uint64_t v8;
  void *v9;

  v4 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_databaseQueue);
  if (-[_WKWebExtensionSQLiteStore _isDatabaseOpen](self, "_isDatabaseOpen"))
  {
    *a3 = 0;
    return 1;
  }
  else
  {
    if (v4)
      v8 = 2;
    else
      v8 = 1;
    -[_WKWebExtensionSQLiteStore _databaseURL](self, "_databaseURL");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[_WKWebExtensionSQLiteStore _openDatabase:withAccessType:deleteDatabaseFileOnError:](self, "_openDatabase:withAccessType:deleteDatabaseFileOnError:", v9, v8, 1);
    *a3 = (id)objc_claimAutoreleasedReturnValue();

    return -[_WKWebExtensionSQLiteStore _isDatabaseOpen](self, "_isDatabaseOpen");
  }
}

- (id)_openDatabase:(id)a3 withAccessType:(int64_t)a4 deleteDatabaseFileOnError:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  NSURL *v9;
  _BOOL4 useInMemoryDatabase;
  void *v11;
  _WKWebExtensionSQLiteDatabase *v12;
  _WKWebExtensionSQLiteDatabase *database;
  _WKWebExtensionSQLiteDatabase *v14;
  BOOL v15;
  _WKWebExtensionSQLiteDatabase *v16;
  _WKWebExtensionSQLiteDatabase *v17;
  _WKWebExtensionSQLiteDatabase *v18;
  BOOL v19;
  WebKit *v20;
  uint64_t v21;
  __CFString *v22;
  NSObject *v23;
  NSError *v24;
  _WKWebExtensionSQLiteDatabase *v25;
  NSObject *v26;
  NSError *v27;
  _WKWebExtensionSQLiteDatabase *v28;
  NSObject *v29;
  NSString *uniqueIdentifier;
  void *v32;
  NSString *v33;
  void *v34;
  NSString *v35;
  _WKWebExtensionSQLiteDatabase *v36;
  id v37;
  uint8_t buf[4];
  NSString *v39;
  __int16 v40;
  void *v41;
  uint64_t v42;

  v5 = a5;
  v42 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_databaseQueue);
  useInMemoryDatabase = self->_useInMemoryDatabase;
  if (self->_useInMemoryDatabase)
  {
LABEL_4:
    v12 = -[_WKWebExtensionSQLiteDatabase initWithURL:queue:]([_WKWebExtensionSQLiteDatabase alloc], "initWithURL:queue:", v8, self->_databaseQueue);
    database = self->_database;
    self->_database = v12;

    v14 = self->_database;
    v37 = 0;
    v15 = -[_WKWebExtensionSQLiteDatabase openWithAccessType:error:](v14, "openWithAccessType:error:", a4, &v37);
    v16 = (_WKWebExtensionSQLiteDatabase *)v37;
    v17 = v16;
    if (!v15)
    {
      if (a4 == 2 || v16)
      {
        v23 = (id)qword_1ECE710C8;
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        {
          uniqueIdentifier = self->_uniqueIdentifier;
          WebKit::privacyPreservingDescription((WebKit *)v17, v24);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138478083;
          v39 = uniqueIdentifier;
          v40 = 2114;
          v41 = v32;
          _os_log_error_impl(&dword_196BCC000, v23, OS_LOG_TYPE_ERROR, "Failed to open database for extension %{private}@: %{public}@", buf, 0x16u);

        }
        if (useInMemoryDatabase || !v5)
        {
          -[_WKWebExtensionSQLiteDatabase close](self->_database, "close");
          v25 = self->_database;
          self->_database = 0;

          v22 = CFSTR("Failed to open extension storage database.");
        }
        else
        {
          -[_WKWebExtensionSQLiteStore _deleteDatabaseFileAtURL:reopenDatabase:](self, "_deleteDatabaseFileAtURL:reopenDatabase:", v8, 1);
          v22 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
      }
      else
      {
        v22 = 0;
        v17 = self->_database;
        self->_database = 0;
      }
      goto LABEL_25;
    }
    v18 = self->_database;
    v36 = v17;
    v19 = -[_WKWebExtensionSQLiteDatabase enableWAL:](v18, "enableWAL:", &v36);
    v20 = v36;

    if (v19)
    {
      -[_WKWebExtensionSQLiteStore _handleSchemaVersioningWithDeleteDatabaseFileOnError:](self, "_handleSchemaVersioningWithDeleteDatabaseFileOnError:", v5);
      v21 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v26 = (id)qword_1ECE710C8;
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        v33 = self->_uniqueIdentifier;
        WebKit::privacyPreservingDescription(v20, v27);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138478083;
        v39 = v33;
        v40 = 2114;
        v41 = v34;
        _os_log_error_impl(&dword_196BCC000, v26, OS_LOG_TYPE_ERROR, "Failed to enable write-ahead logging on database for extension %{private}@: %{public}@", buf, 0x16u);

      }
      if (useInMemoryDatabase || !v5)
      {
        -[_WKWebExtensionSQLiteDatabase close](self->_database, "close");
        v28 = self->_database;
        self->_database = 0;

        v22 = CFSTR("Failed to open extension storage database.");
LABEL_24:
        v17 = (_WKWebExtensionSQLiteDatabase *)v20;
LABEL_25:

        goto LABEL_26;
      }
      -[_WKWebExtensionSQLiteStore _deleteDatabaseFileAtURL:reopenDatabase:](self, "_deleteDatabaseFileAtURL:reopenDatabase:", v8, 1);
      v21 = objc_claimAutoreleasedReturnValue();
    }
    v22 = (__CFString *)v21;
    goto LABEL_24;
  }
  WebKit::ensureDirectoryExists((WebKit *)self->_directory, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {

    goto LABEL_4;
  }
  v29 = qword_1ECE710C8;
  if (os_log_type_enabled((os_log_t)qword_1ECE710C8, OS_LOG_TYPE_ERROR))
  {
    v35 = self->_uniqueIdentifier;
    *(_DWORD *)buf = 138477827;
    v39 = v35;
    _os_log_error_impl(&dword_196BCC000, v29, OS_LOG_TYPE_ERROR, "Failed to create extension storage directory for extension %{private}@", buf, 0xCu);
  }
  v22 = CFSTR("Failed to create extension storage directory.");
LABEL_26:

  return v22;
}

- (BOOL)_isDatabaseOpen
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_databaseQueue);
  return self->_database != 0;
}

- (id)_deleteDatabaseFileAtURL:(id)a3 reopenDatabase:(BOOL)a4
{
  id v6;
  __CFString *v7;
  _WKWebExtensionSQLiteDatabase *database;
  void *v9;
  uint64_t i;
  WTF::StringImpl *v11;
  id result;
  const WTF::String *v13;
  WTF::StringImpl *v14;
  WTF::StringImpl *v15;
  WTF::StringImpl *v16;
  const WTF::String *v17;
  WTF::StringImpl *v18;
  _WKWebExtensionSQLiteDatabase *v19;
  NSObject *v20;
  WTF::StringImpl *v21;
  NSString *uniqueIdentifier;
  WTF::StringImpl *v23;
  WTF::StringImpl *v24;
  WTF::StringImpl *v25;
  uint64_t buf[3];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_databaseQueue);
  if (-[_WKWebExtensionSQLiteStore _isDatabaseOpen](self, "_isDatabaseOpen"))
  {
    if (-[_WKWebExtensionSQLiteDatabase close](self->_database, "close"))
      v7 = CFSTR("Failed to close extension storage database.");
    else
      v7 = 0;
    database = self->_database;
    self->_database = 0;

  }
  else
  {
    v7 = 0;
  }
  objc_msgSend(v6, "path");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x19AEABCC8](&v25, v9);

  for (i = 0; i != 2; ++i)
  {
    v11 = v25;
    if (v25)
      *(_DWORD *)v25 += 2;
    v23 = v11;
    *(_OWORD *)buf = -[_WKWebExtensionSQLiteStore _deleteDatabaseFileAtURL:reopenDatabase:]::databaseFileSuffixes[i];
    result = (id)WTF::tryMakeString<WTF::String,WTF::ASCIILiteral>((uint64_t *)&v23, buf, &v24);
    if (!v24)
    {
      __break(0xC471u);
      return result;
    }
    WTF::FileSystemImpl::deleteFile((WTF::FileSystemImpl *)&v24, v13);
    v15 = v24;
    v24 = 0;
    if (v15)
    {
      if (*(_DWORD *)v15 == 2)
        WTF::StringImpl::destroy(v15, v14);
      else
        *(_DWORD *)v15 -= 2;
    }
    v16 = v23;
    v23 = 0;
    if (v16)
    {
      if (*(_DWORD *)v16 == 2)
        WTF::StringImpl::destroy(v16, v14);
      else
        *(_DWORD *)v16 -= 2;
    }
  }
  if (WTF::FileSystemImpl::fileExists((WTF::FileSystemImpl *)&v25, v14)
    && (WTF::FileSystemImpl::deleteFile((WTF::FileSystemImpl *)&v25, v17) & 1) == 0)
  {
    v20 = qword_1ECE710C8;
    if (os_log_type_enabled((os_log_t)qword_1ECE710C8, OS_LOG_TYPE_ERROR))
    {
      uniqueIdentifier = self->_uniqueIdentifier;
      LODWORD(buf[0]) = 138477827;
      *(uint64_t *)((char *)buf + 4) = (uint64_t)uniqueIdentifier;
      _os_log_error_impl(&dword_196BCC000, v20, OS_LOG_TYPE_ERROR, "Failed to delete database for extension %{private}@", (uint8_t *)buf, 0xCu);
    }
    v7 = CFSTR("Failed to delete extension storage database file.");
  }
  else if (a4)
  {
    -[_WKWebExtensionSQLiteStore _openDatabase:withAccessType:deleteDatabaseFileOnError:](self, "_openDatabase:withAccessType:deleteDatabaseFileOnError:", v6, 2, 0);
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v19 = self->_database;
    self->_database = 0;

  }
  v21 = v25;
  v25 = 0;
  if (v21)
  {
    if (*(_DWORD *)v21 == 2)
      WTF::StringImpl::destroy(v21, v18);
    else
      *(_DWORD *)v21 -= 2;
  }

  return v7;
}

- (id)_deleteDatabaseIfEmpty
{
  void *v3;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_databaseQueue);
  if (-[_WKWebExtensionSQLiteStore _isDatabaseEmpty](self, "_isDatabaseEmpty"))
  {
    -[_WKWebExtensionSQLiteStore _deleteDatabase](self, "_deleteDatabase");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (id)_deleteDatabase
{
  NSObject *v3;
  __CFString *v4;
  _WKWebExtensionSQLiteDatabase *database;
  void *v6;
  __CFString *v7;
  __CFString *v8;
  NSString *uniqueIdentifier;
  int v11;
  NSString *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_databaseQueue);
  if (-[_WKWebExtensionSQLiteStore _isDatabaseOpen](self, "_isDatabaseOpen"))
  {
    if (-[_WKWebExtensionSQLiteDatabase close](self->_database, "close"))
    {
      v3 = qword_1ECE710C8;
      if (os_log_type_enabled((os_log_t)qword_1ECE710C8, OS_LOG_TYPE_ERROR))
      {
        uniqueIdentifier = self->_uniqueIdentifier;
        v11 = 138477827;
        v12 = uniqueIdentifier;
        _os_log_error_impl(&dword_196BCC000, v3, OS_LOG_TYPE_ERROR, "Failed to close storage database for extension %{private}@", (uint8_t *)&v11, 0xCu);
      }
      v4 = CFSTR("Failed to close extension storage database.");
    }
    else
    {
      v4 = 0;
    }
    database = self->_database;
    self->_database = 0;

  }
  else
  {
    v4 = 0;
  }
  if (!self->_useInMemoryDatabase)
  {
    -[_WKWebExtensionSQLiteStore _databaseURL](self, "_databaseURL");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[_WKWebExtensionSQLiteStore _deleteDatabaseFileAtURL:reopenDatabase:](self, "_deleteDatabaseFileAtURL:reopenDatabase:", v6, 0);
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();

    if (-[__CFString length](v4, "length"))
      v8 = v4;
    else
      v8 = v7;
    v4 = v8;

  }
  return v4;
}

- (id)_handleSchemaVersioningWithDeleteDatabaseFileOnError:(BOOL)a3
{
  _BOOL4 v3;
  int v5;
  int v6;
  int v8;
  NSObject *v9;
  void *v10;
  __CFString *v11;
  _WKWebExtensionSQLiteDatabase **p_database;
  _WKWebExtensionSQLiteDatabase *database;
  NSString *uniqueIdentifier;
  _DWORD v15[2];
  __int16 v16;
  int v17;
  __int16 v18;
  NSString *v19;
  uint64_t v20;

  v3 = a3;
  v20 = *MEMORY[0x1E0C80C00];
  v5 = -[_WKWebExtensionSQLiteStore _currentDatabaseSchemaVersion](self, "_currentDatabaseSchemaVersion");
  v6 = -[_WKWebExtensionSQLiteStore _migrateToCurrentSchemaVersionIfNeeded](self, "_migrateToCurrentSchemaVersionIfNeeded");
  if (v6 == v5)
    return 0;
  v8 = v6;
  v9 = qword_1ECE710C8;
  if (os_log_type_enabled((os_log_t)qword_1ECE710C8, OS_LOG_TYPE_ERROR))
  {
    uniqueIdentifier = self->_uniqueIdentifier;
    v15[0] = 67109635;
    v15[1] = v8;
    v16 = 1024;
    v17 = v5;
    v18 = 2113;
    v19 = uniqueIdentifier;
    _os_log_error_impl(&dword_196BCC000, v9, OS_LOG_TYPE_ERROR, "Schema version (%d) does not match the supported schema version (%d) in database for extension %{private}@", (uint8_t *)v15, 0x18u);
  }
  if (self->_useInMemoryDatabase || !v3)
  {
    database = self->_database;
    p_database = &self->_database;
    -[_WKWebExtensionSQLiteDatabase close](database, "close");
    v10 = *p_database;
    *p_database = 0;
    v11 = CFSTR("Failed to open extension storage database because of an invalid schema version.");
  }
  else
  {
    -[_WKWebExtensionSQLiteStore _databaseURL](self, "_databaseURL");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[_WKWebExtensionSQLiteStore _deleteDatabaseFileAtURL:reopenDatabase:](self, "_deleteDatabaseFileAtURL:reopenDatabase:", v10, 1);
    v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

  return v11;
}

- (int)_migrateToCurrentSchemaVersionIfNeeded
{
  uint64_t v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  NSObject *v8;
  NSString *uniqueIdentifier;
  _DWORD v11[2];
  __int16 v12;
  int v13;
  __int16 v14;
  NSString *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_databaseQueue);
  v3 = -[_WKWebExtensionSQLiteStore _currentDatabaseSchemaVersion](self, "_currentDatabaseSchemaVersion");
  WebKit::SQLiteDatabaseFetch<>(self->_database, CFSTR("PRAGMA user_version"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "nextObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "intAtIndex:", 0);

  objc_msgSend(v4, "statement");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "invalidate");

  if (v6 != (_DWORD)v3)
  {
    if (v6)
    {
      v8 = qword_1ECE710C8;
      if (os_log_type_enabled((os_log_t)qword_1ECE710C8, OS_LOG_TYPE_INFO))
      {
        uniqueIdentifier = self->_uniqueIdentifier;
        v11[0] = 67109635;
        v11[1] = v6;
        v12 = 1024;
        v13 = v3;
        v14 = 2113;
        v15 = uniqueIdentifier;
        _os_log_impl(&dword_196BCC000, v8, OS_LOG_TYPE_INFO, "Schema version (%d) does not match our supported schema version (%d) in database for extension %{private}@, recreating database", (uint8_t *)v11, 0x18u);
      }
    }
    if (-[_WKWebExtensionSQLiteStore _resetDatabaseSchema](self, "_resetDatabaseSchema") == 101
      && -[_WKWebExtensionSQLiteStore _setDatabaseSchemaVersion:](self, "_setDatabaseSchemaVersion:", 0) == 101
      && (-[_WKWebExtensionSQLiteStore _vacuum](self, "_vacuum"),
          -[_WKWebExtensionSQLiteStore _createFreshDatabaseSchema](self, "_createFreshDatabaseSchema") == 101))
    {
      -[_WKWebExtensionSQLiteStore _setDatabaseSchemaVersion:](self, "_setDatabaseSchemaVersion:", v3);
    }
    else
    {
      LODWORD(v3) = 0;
    }
  }

  return v3;
}

- (int)_setDatabaseSchemaVersion:(int)a3
{
  uint64_t v3;
  _WKWebExtensionSQLiteDatabase *database;
  void *v6;
  int v7;
  NSObject *v8;
  NSString *uniqueIdentifier;
  void *v11;
  uint8_t buf[4];
  NSString *v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  int v17;
  uint64_t v18;

  v3 = *(_QWORD *)&a3;
  v18 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_databaseQueue);
  database = self->_database;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("PRAGMA user_version = %d"), v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = WebKit::_SQLiteDatabaseExecuteAndReturnError<>(database, 0, v6);

  if (v7 != 101)
  {
    v8 = (id)qword_1ECE710C8;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      uniqueIdentifier = self->_uniqueIdentifier;
      -[_WKWebExtensionSQLiteDatabase lastErrorMessage](self->_database, "lastErrorMessage");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138478339;
      v13 = uniqueIdentifier;
      v14 = 2114;
      v15 = v11;
      v16 = 1024;
      v17 = v7;
      _os_log_error_impl(&dword_196BCC000, v8, OS_LOG_TYPE_ERROR, "Failed to set database version for extension %{private}@: %{public}@ (%d)", buf, 0x1Cu);

    }
  }
  return v7;
}

- (id)_savepointNameFromUUID:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a3, "UUIDString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByReplacingOccurrencesOfString:withString:", CFSTR("-"), &stru_1E351F1B8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(CFSTR("S"), "stringByAppendingString:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)createSavepointWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  NSObject *databaseQueue;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id v12;
  id location;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  databaseQueue = self->_databaseQueue;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3321888768;
  v9[2] = __67___WKWebExtensionSQLiteStore_createSavepointWithCompletionHandler___block_invoke;
  v9[3] = &unk_1E34AB1B8;
  objc_copyWeak(&v12, &location);
  v10 = v5;
  v11 = v4;
  v7 = v5;
  v8 = v4;
  dispatch_async(databaseQueue, v9);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

- (void)commitSavepoint:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *databaseQueue;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  databaseQueue = self->_databaseQueue;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3321888768;
  v11[2] = __64___WKWebExtensionSQLiteStore_commitSavepoint_completionHandler___block_invoke;
  v11[3] = &unk_1E34AB1B8;
  objc_copyWeak(&v14, &location);
  v12 = v6;
  v13 = v7;
  v9 = v6;
  v10 = v7;
  dispatch_async(databaseQueue, v11);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

- (void)rollbackToSavepoint:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *databaseQueue;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  databaseQueue = self->_databaseQueue;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3321888768;
  v11[2] = __68___WKWebExtensionSQLiteStore_rollbackToSavepoint_completionHandler___block_invoke;
  v11[3] = &unk_1E34AB1B8;
  objc_copyWeak(&v14, &location);
  v12 = v6;
  v13 = v7;
  v9 = v6;
  v10 = v7;
  dispatch_async(databaseQueue, v11);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

- (int)_currentDatabaseSchemaVersion
{
  return 0;
}

- (id)_databaseURL
{
  return 0;
}

- (int)_createFreshDatabaseSchema
{
  return 0;
}

- (int)_resetDatabaseSchema
{
  return 0;
}

- (BOOL)_isDatabaseEmpty
{
  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_databaseQueue, 0);
  objc_storeStrong((id *)&self->_database, 0);
  objc_storeStrong((id *)&self->_directory, 0);
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
}

@end
