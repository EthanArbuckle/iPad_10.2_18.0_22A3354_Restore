@implementation _WKWebExtensionStorageSQLiteStore

- (_WKWebExtensionStorageSQLiteStore)initWithUniqueIdentifier:(id)a3 storageType:(unsigned __int8)a4 directory:(id)a5 usesInMemoryDatabase:(BOOL)a6
{
  _WKWebExtensionStorageSQLiteStore *v7;
  _WKWebExtensionStorageSQLiteStore *v8;
  _WKWebExtensionStorageSQLiteStore *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)_WKWebExtensionStorageSQLiteStore;
  v7 = -[_WKWebExtensionSQLiteStore initWithUniqueIdentifier:directory:usesInMemoryDatabase:](&v11, sel_initWithUniqueIdentifier_directory_usesInMemoryDatabase_, a3, a5, a6);
  v8 = v7;
  if (v7)
  {
    *(&v7->super._useInMemoryDatabase + 1) = a4;
    v9 = v7;
  }

  return v8;
}

- (void)getValuesForKeys:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *databaseQueue;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  _WKWebExtensionStorageSQLiteStore *v13;
  id v14;
  id v15;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  databaseQueue = self->super._databaseQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3321888768;
  block[2] = __72___WKWebExtensionStorageSQLiteStore_getValuesForKeys_completionHandler___block_invoke;
  block[3] = &unk_1E34AB1F0;
  objc_copyWeak(&v15, &location);
  v12 = v6;
  v13 = self;
  v14 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(databaseQueue, block);

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

- (void)getStorageSizeForKeys:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *databaseQueue;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  _WKWebExtensionStorageSQLiteStore *v13;
  id v14;
  id v15;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  databaseQueue = self->super._databaseQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3321888768;
  block[2] = __77___WKWebExtensionStorageSQLiteStore_getStorageSizeForKeys_completionHandler___block_invoke;
  block[3] = &unk_1E34AB1F0;
  objc_copyWeak(&v15, &location);
  v12 = v6;
  v13 = self;
  v14 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(databaseQueue, block);

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

- (void)getStorageSizeForAllKeysIncludingKeyedData:(id)a3 withCompletionHandler:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __102___WKWebExtensionStorageSQLiteStore_getStorageSizeForAllKeysIncludingKeyedData_withCompletionHandler___block_invoke;
  v10[3] = &unk_1E34AB2B0;
  v11 = v6;
  v12 = v7;
  v10[4] = self;
  v8 = v6;
  v9 = v7;
  -[_WKWebExtensionStorageSQLiteStore getStorageSizeForKeys:completionHandler:](self, "getStorageSizeForKeys:completionHandler:", MEMORY[0x1E0C9AA60], v10);

}

- (void)setKeyedData:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *databaseQueue;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  _WKWebExtensionStorageSQLiteStore *v13;
  id v14;
  id v15;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  databaseQueue = self->super._databaseQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3321888768;
  block[2] = __68___WKWebExtensionStorageSQLiteStore_setKeyedData_completionHandler___block_invoke;
  block[3] = &unk_1E34AB1F0;
  objc_copyWeak(&v15, &location);
  v13 = self;
  v14 = v7;
  v12 = v6;
  v9 = v6;
  v10 = v7;
  dispatch_async(databaseQueue, block);

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

- (void)deleteValuesForKeys:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *databaseQueue;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  _WKWebExtensionStorageSQLiteStore *v13;
  id v14;
  id v15;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  databaseQueue = self->super._databaseQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3321888768;
  block[2] = __75___WKWebExtensionStorageSQLiteStore_deleteValuesForKeys_completionHandler___block_invoke;
  block[3] = &unk_1E34AB1F0;
  objc_copyWeak(&v15, &location);
  v13 = self;
  v14 = v7;
  v12 = v6;
  v9 = v6;
  v10 = v7;
  dispatch_async(databaseQueue, block);

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

- (id)_databaseURL
{
  void *v2;
  int v3;
  const __CFString *v4;
  const __CFString *v5;

  if (self->super._useInMemoryDatabase)
  {
    +[_WKWebExtensionSQLiteDatabase inMemoryDatabaseURL](_WKWebExtensionSQLiteDatabase, "inMemoryDatabaseURL");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = *((unsigned __int8 *)&self->super._useInMemoryDatabase + 1);
    v4 = CFSTR("SyncStorage.db");
    if (v3 != 4)
      v4 = 0;
    if (v3 == 1)
      v5 = CFSTR("LocalStorage.db");
    else
      v5 = v4;
    -[NSURL URLByAppendingPathComponent:isDirectory:](self->super._directory, "URLByAppendingPathComponent:isDirectory:", v5, 0);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (id)_insertOrUpdateValue:(id)a3 forKey:(id)a4 inDatabase:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  __CFString *v12;
  _WKWebExtensionSQLiteStatement *v13;
  id v14;
  void *v15;
  _WKWebExtensionSQLiteStatement *v16;
  uint64_t v17;
  void *v18;
  NSObject *v19;
  NSString *uniqueIdentifier;
  _BYTE buf[12];
  __int16 v23;
  id v24;
  __int16 v25;
  NSString *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->super._databaseQueue);
  v11 = v10;
  v12 = CFSTR("INSERT OR REPLACE INTO extension_storage (key, value) VALUES (?, ?)");
  *(_QWORD *)buf = 0;
  v13 = -[_WKWebExtensionSQLiteStatement initWithDatabase:query:error:]([_WKWebExtensionSQLiteStatement alloc], "initWithDatabase:query:error:", v11, CFSTR("INSERT OR REPLACE INTO extension_storage (key, value) VALUES (?, ?)"), buf);
  v14 = *(id *)buf;
  v15 = v14;
  if (v13)
  {
    v16 = v13;
    -[_WKWebExtensionSQLiteStatement bindString:atParameterIndex:](v16, "bindString:atParameterIndex:", v9, 1);
    -[_WKWebExtensionSQLiteStatement bindString:atParameterIndex:](v16, "bindString:atParameterIndex:", v8, 2);

    v17 = -[_WKWebExtensionSQLiteStatement execute](v16, "execute");
    -[_WKWebExtensionSQLiteStatement invalidate](v16, "invalidate");
    if ((v17 - 100) >= 2 && (_DWORD)v17)
      objc_msgSend(v11, "reportErrorWithCode:statement:error:", v17, -[_WKWebExtensionSQLiteStatement handle](v16, "handle"), 0);
  }
  else
  {
    LODWORD(v17) = objc_msgSend(v14, "code");
  }

  if ((_DWORD)v17 == 101)
  {
    v18 = 0;
  }
  else
  {
    v19 = qword_1ECE710C8;
    if (os_log_type_enabled((os_log_t)qword_1ECE710C8, OS_LOG_TYPE_ERROR))
    {
      uniqueIdentifier = self->super._uniqueIdentifier;
      *(_DWORD *)buf = 138478339;
      *(_QWORD *)&buf[4] = v8;
      v23 = 2113;
      v24 = v9;
      v25 = 2113;
      v26 = uniqueIdentifier;
      _os_log_error_impl(&dword_196BCC000, v19, OS_LOG_TYPE_ERROR, "Failed to insert value %{private}@ for key %{private}@ for extension %{private}@.", buf, 0x20u);
    }
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to insert value %@ for key %@"), v8, v9);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v18;
}

- (id)_getValuesForAllKeysReturningErrorMessage:(id *)a3
{
  void *v5;
  void *v6;

  dispatch_assert_queue_V2((dispatch_queue_t)self->super._databaseQueue);
  if (-[_WKWebExtensionSQLiteStore _openDatabaseIfNecessaryReturningErrorMessage:createIfNecessary:](self, "_openDatabaseIfNecessaryReturningErrorMessage:createIfNecessary:", a3, 0))
  {
    WebKit::SQLiteDatabaseFetch<>(self->super._database, CFSTR("SELECT * FROM extension_storage"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[_WKWebExtensionStorageSQLiteStore _getKeysAndValuesFromRowEnumerator:](self, "_getKeysAndValuesFromRowEnumerator:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = (void *)MEMORY[0x1E0C9AA70];
  }
  return v6;
}

- (id)_getKeysAndValuesFromRowEnumerator:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        objc_msgSend(v9, "stringAtIndex:", 0, (_QWORD)v14);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "stringAtIndex:", 1);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "setObject:forKeyedSubscript:", v11, v10);

      }
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v6);
  }

  v12 = (void *)objc_msgSend(v4, "copy");
  return v12;
}

- (id)_getAllKeysReturningErrorMessage:(id *)a3
{
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->super._databaseQueue);
  if (-[_WKWebExtensionSQLiteStore _openDatabaseIfNecessaryReturningErrorMessage:createIfNecessary:](self, "_openDatabaseIfNecessaryReturningErrorMessage:createIfNecessary:", a3, 0))
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    WebKit::SQLiteDatabaseFetch<>(self->super._database, CFSTR("SELECT key FROM extension_storage"));
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v6 = (id)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v13;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v13 != v8)
            objc_enumerationMutation(v6);
          objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v9), "stringAtIndex:", 0, (_QWORD)v12);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addObject:", v10);

          ++v9;
        }
        while (v7 != v9);
        v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v7);
    }

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (id)_getValuesForKeys:(id)a3 outErrorMessage:(id *)a4
{
  id v6;
  _WKWebExtensionSQLiteDatabase *database;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v6 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->super._databaseQueue);
  if (-[_WKWebExtensionSQLiteStore _openDatabaseIfNecessaryReturningErrorMessage:createIfNecessary:](self, "_openDatabaseIfNecessaryReturningErrorMessage:createIfNecessary:", a4, 0))
  {
    database = self->super._database;
    v8 = (void *)MEMORY[0x1E0CB3940];
    rowFilterStringFromRowKeys(v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringWithFormat:", CFSTR("SELECT * FROM extension_storage WHERE key in (%@)"), v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    WebKit::SQLiteDatabaseFetch<>(database, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    -[_WKWebExtensionStorageSQLiteStore _getKeysAndValuesFromRowEnumerator:](self, "_getKeysAndValuesFromRowEnumerator:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v12 = (void *)MEMORY[0x1E0C9AA70];
  }

  return v12;
}

- (int)_currentDatabaseSchemaVersion
{
  return 1;
}

- (int)_createFreshDatabaseSchema
{
  int v3;
  NSObject *v4;
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
  dispatch_assert_queue_V2((dispatch_queue_t)self->super._databaseQueue);
  v3 = WebKit::_SQLiteDatabaseExecuteAndReturnError<>(self->super._database, 0, CFSTR("CREATE TABLE extension_storage (key TEXT PRIMARY KEY NOT NULL, value TEXT NOT NULL)"));
  if (v3 != 101)
  {
    v4 = (id)qword_1ECE710C8;
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      uniqueIdentifier = self->super._uniqueIdentifier;
      -[_WKWebExtensionSQLiteDatabase lastErrorMessage](self->super._database, "lastErrorMessage");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 138478339;
      v9 = uniqueIdentifier;
      v10 = 2114;
      v11 = v7;
      v12 = 1024;
      v13 = v3;
      _os_log_error_impl(&dword_196BCC000, v4, OS_LOG_TYPE_ERROR, "Failed to create the extension_storage table for extension %{private}@: %{public}@ (%d)", (uint8_t *)&v8, 0x1Cu);

    }
  }
  return v3;
}

- (int)_resetDatabaseSchema
{
  int v3;
  NSObject *v4;
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
  dispatch_assert_queue_V2((dispatch_queue_t)self->super._databaseQueue);
  v3 = WebKit::_SQLiteDatabaseExecuteAndReturnError<>(self->super._database, 0, CFSTR("DROP TABLE IF EXISTS extension_storage"));
  if (v3 != 101)
  {
    v4 = (id)qword_1ECE710C8;
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      uniqueIdentifier = self->super._uniqueIdentifier;
      -[_WKWebExtensionSQLiteDatabase lastErrorMessage](self->super._database, "lastErrorMessage");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 138478339;
      v9 = uniqueIdentifier;
      v10 = 2114;
      v11 = v7;
      v12 = 1024;
      v13 = v3;
      _os_log_error_impl(&dword_196BCC000, v4, OS_LOG_TYPE_ERROR, "Failed to reset database schema for extension %{private}@: %{public}@ (%d)", (uint8_t *)&v8, 0x1Cu);

    }
  }
  return v3;
}

- (BOOL)_isDatabaseEmpty
{
  void *v3;
  void *v4;
  BOOL v5;

  dispatch_assert_queue_V2((dispatch_queue_t)self->super._databaseQueue);
  WebKit::SQLiteDatabaseFetch<>(self->super._database, CFSTR("SELECT COUNT(*) FROM extension_storage"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "nextObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "int64AtIndex:", 0) == 0;

  return v5;
}

@end
