@implementation _WKWebExtensionDeclarativeNetRequestSQLiteStore

- (_WKWebExtensionDeclarativeNetRequestSQLiteStore)initWithUniqueIdentifier:(id)a3 storageType:(BOOL)a4 directory:(id)a5 usesInMemoryDatabase:(BOOL)a6
{
  _BOOL8 v6;
  _BOOL4 v8;
  id v10;
  id v11;
  _WKWebExtensionDeclarativeNetRequestSQLiteStore *v12;
  _WKWebExtensionDeclarativeNetRequestSQLiteStore *v13;
  __CFString *v14;
  NSString **p_storageType;
  uint64_t v16;
  NSString *tableName;
  _WKWebExtensionDeclarativeNetRequestSQLiteStore *v18;
  objc_super v20;

  v6 = a6;
  v8 = a4;
  v10 = a3;
  v11 = a5;
  v20.receiver = self;
  v20.super_class = (Class)_WKWebExtensionDeclarativeNetRequestSQLiteStore;
  v12 = -[_WKWebExtensionSQLiteStore initWithUniqueIdentifier:directory:usesInMemoryDatabase:](&v20, sel_initWithUniqueIdentifier_directory_usesInMemoryDatabase_, v10, v11, v6);
  v13 = v12;
  if (v12)
  {
    if (v8)
      v14 = CFSTR("session");
    else
      v14 = CFSTR("dynamic");
    p_storageType = &v12->_storageType;
    objc_storeStrong((id *)&v12->_storageType, v14);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@_rules"), *p_storageType);
    v16 = objc_claimAutoreleasedReturnValue();
    tableName = v13->_tableName;
    v13->_tableName = (NSString *)v16;

    v18 = v13;
  }

  return v13;
}

- (void)updateRulesByRemovingIDs:(id)a3 addRules:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;
  id location;

  v8 = a4;
  v9 = a5;
  v10 = a3;
  objc_initWeak(&location, self);
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3321888768;
  v13[2] = __103___WKWebExtensionDeclarativeNetRequestSQLiteStore_updateRulesByRemovingIDs_addRules_completionHandler___block_invoke;
  v13[3] = &unk_1E34AADC0;
  objc_copyWeak(&v16, &location);
  v14 = v8;
  v15 = v9;
  v11 = v8;
  v12 = v9;
  -[_WKWebExtensionDeclarativeNetRequestSQLiteStore deleteRules:completionHandler:](self, "deleteRules:completionHandler:", v10, v13);

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
}

- (void)addRules:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *databaseQueue;
  _QWORD v9[4];
  id v10;
  id v11;
  id v12;
  id location;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "count"))
  {
    objc_initWeak(&location, self);
    databaseQueue = self->super._databaseQueue;
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3321888768;
    v9[2] = __78___WKWebExtensionDeclarativeNetRequestSQLiteStore_addRules_completionHandler___block_invoke;
    v9[3] = &unk_1E34AADF8;
    objc_copyWeak(&v12, &location);
    v11 = v7;
    v10 = v6;
    dispatch_async(databaseQueue, v9);

    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
  else
  {
    (*((void (**)(id, _QWORD))v7 + 2))(v7, 0);
  }

}

- (void)deleteRules:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *databaseQueue;
  _QWORD v9[4];
  id v10;
  id v11;
  id v12;
  id location;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "count"))
  {
    objc_initWeak(&location, self);
    databaseQueue = self->super._databaseQueue;
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3321888768;
    v9[2] = __81___WKWebExtensionDeclarativeNetRequestSQLiteStore_deleteRules_completionHandler___block_invoke;
    v9[3] = &unk_1E34AADF8;
    objc_copyWeak(&v12, &location);
    v11 = v7;
    v10 = v6;
    dispatch_async(databaseQueue, v9);

    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
  else
  {
    (*((void (**)(id, _QWORD))v7 + 2))(v7, 0);
  }

}

- (void)getRulesWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *databaseQueue;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  databaseQueue = self->super._databaseQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3321888768;
  block[2] = __81___WKWebExtensionDeclarativeNetRequestSQLiteStore_getRulesWithCompletionHandler___block_invoke;
  block[3] = &unk_1E34AAE30;
  objc_copyWeak(&v9, &location);
  v8 = v4;
  v6 = v4;
  dispatch_async(databaseQueue, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (id)_getRulesWithOutErrorMessage:(id *)a3
{
  _WKWebExtensionSQLiteDatabase *database;
  void *v6;
  void *v7;
  void *v8;

  dispatch_assert_queue_V2((dispatch_queue_t)self->super._databaseQueue);
  if (-[_WKWebExtensionSQLiteStore _openDatabaseIfNecessaryReturningErrorMessage:createIfNecessary:](self, "_openDatabaseIfNecessaryReturningErrorMessage:createIfNecessary:", a3, 0))
  {
    database = self->super._database;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("SELECT * FROM %@"), self->_tableName);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    WebKit::SQLiteDatabaseFetch<>(database, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    -[_WKWebExtensionDeclarativeNetRequestSQLiteStore _getKeysAndValuesFromRowEnumerator:](self, "_getKeysAndValuesFromRowEnumerator:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = (void *)MEMORY[0x1E0C9AA60];
  }
  return v8;
}

- (id)_getKeysAndValuesFromRowEnumerator:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  NSString *uniqueIdentifier;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  id v21;
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint8_t buf[4];
  NSString *v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v19 = a3;
  if ((_MergedGlobals_14 & 1) == 0)
  {
    v15 = (void *)MEMORY[0x1E0C99E60];
    v16 = objc_opt_class();
    v17 = objc_opt_class();
    v18 = objc_opt_class();
    objc_msgSend(v15, "setWithObjects:", v16, v17, v18, objc_opt_class(), 0);
    qword_1ECE71CF8 = objc_claimAutoreleasedReturnValue();
    _MergedGlobals_14 = 1;
  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v21 = (id)objc_claimAutoreleasedReturnValue();
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v3 = v19;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v23, v29, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v24 != v5)
          objc_enumerationMutation(v3);
        v7 = (void *)MEMORY[0x1E0CB3710];
        v8 = qword_1ECE71CF8;
        objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * i), "dataAtIndex:", 1);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = 0;
        objc_msgSend(v7, "unarchivedObjectOfClasses:fromData:error:", v8, v9, &v22);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = v22;

        if (v11)
        {
          v12 = qword_1ECE710C8;
          if (os_log_type_enabled((os_log_t)qword_1ECE710C8, OS_LOG_TYPE_ERROR))
          {
            uniqueIdentifier = self->super._uniqueIdentifier;
            *(_DWORD *)buf = 138477827;
            v28 = uniqueIdentifier;
            _os_log_error_impl(&dword_196BCC000, v12, OS_LOG_TYPE_ERROR, "Failed to deserialize dynamic declarative net request rule for extension %{private}@.", buf, 0xCu);
          }
        }
        else
        {
          objc_msgSend(v21, "addObject:", v10);
        }

      }
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v23, v29, 16);
    }
    while (v4);
  }

  return v21;
}

- (id)_insertRule:(id)a3 inDatabase:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  _WKWebExtensionSQLiteStatement *v12;
  id v13;
  void *v14;
  _WKWebExtensionSQLiteStatement *v15;
  uint64_t v16;
  void *v17;
  NSObject *v18;
  NSString *uniqueIdentifier;
  id v21;
  void *v22;
  _BYTE buf[24];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v21 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->super._databaseQueue);
  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v6, 1, 0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  WebKit::objectForKey<NSNumber>(v6, (uint64_t)CFSTR("id"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("INSERT INTO %@ (id, rule) VALUES (?, ?)"), self->_tableName);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "integerValue");
  v10 = v21;
  v11 = v8;
  *(_QWORD *)buf = 0;
  v12 = -[_WKWebExtensionSQLiteStatement initWithDatabase:query:error:]([_WKWebExtensionSQLiteStatement alloc], "initWithDatabase:query:error:", v10, v11, buf);
  v13 = *(id *)buf;
  v14 = v13;
  if (v12)
  {
    v15 = v12;
    -[_WKWebExtensionSQLiteStatement bindInt64:atParameterIndex:](v15, "bindInt64:atParameterIndex:", v9, 1);
    -[_WKWebExtensionSQLiteStatement bindData:atParameterIndex:](v15, "bindData:atParameterIndex:", v22, 2);

    v16 = -[_WKWebExtensionSQLiteStatement execute](v15, "execute");
    -[_WKWebExtensionSQLiteStatement invalidate](v15, "invalidate");
    if ((v16 - 100) >= 2 && (_DWORD)v16)
      objc_msgSend(v10, "reportErrorWithCode:statement:error:", v16, -[_WKWebExtensionSQLiteStatement handle](v15, "handle"), 0);
  }
  else
  {
    LODWORD(v16) = objc_msgSend(v13, "code");
  }

  if ((_DWORD)v16 == 101)
  {
    v17 = 0;
  }
  else
  {
    v18 = qword_1ECE710C8;
    if (os_log_type_enabled((os_log_t)qword_1ECE710C8, OS_LOG_TYPE_ERROR))
    {
      uniqueIdentifier = self->super._uniqueIdentifier;
      *(_DWORD *)buf = 138477827;
      *(_QWORD *)&buf[4] = uniqueIdentifier;
      _os_log_error_impl(&dword_196BCC000, v18, OS_LOG_TYPE_ERROR, "Failed to insert dynamic declarative net request rule for extension %{private}@.", buf, 0xCu);
    }
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to add %@ rule."), self->_storageType);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v17;
}

- (int)_currentDatabaseSchemaVersion
{
  return 1;
}

- (id)_databaseURL
{
  if (self->super._useInMemoryDatabase)
    +[_WKWebExtensionSQLiteDatabase inMemoryDatabaseURL](_WKWebExtensionSQLiteDatabase, "inMemoryDatabaseURL");
  else
    -[NSURL URLByAppendingPathComponent:isDirectory:](self->super._directory, "URLByAppendingPathComponent:isDirectory:", CFSTR("DeclarativeNetRequestRules.db"), 0);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)_createFreshDatabaseSchema
{
  _WKWebExtensionSQLiteDatabase *database;
  void *v4;
  int v5;
  NSObject *v6;
  NSString *tableName;
  NSString *uniqueIdentifier;
  void *v10;
  uint8_t buf[4];
  NSString *v12;
  __int16 v13;
  NSString *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  int v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->super._databaseQueue);
  database = self->super._database;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("CREATE TABLE %@ (id INTEGER PRIMARY KEY NOT NULL, rule BLOB NOT NULL)"), self->_tableName);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = WebKit::_SQLiteDatabaseExecuteAndReturnError<>(database, 0, v4);

  if (v5 != 101)
  {
    v6 = (id)qword_1ECE710C8;
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      tableName = self->_tableName;
      uniqueIdentifier = self->super._uniqueIdentifier;
      -[_WKWebExtensionSQLiteDatabase lastErrorMessage](self->super._database, "lastErrorMessage");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413059;
      v12 = tableName;
      v13 = 2113;
      v14 = uniqueIdentifier;
      v15 = 2114;
      v16 = v10;
      v17 = 1024;
      v18 = v5;
      _os_log_error_impl(&dword_196BCC000, v6, OS_LOG_TYPE_ERROR, "Failed to create %@ database for extension %{private}@: %{public}@ (%d)", buf, 0x26u);

    }
  }
  return v5;
}

- (int)_resetDatabaseSchema
{
  _WKWebExtensionSQLiteDatabase *database;
  void *v4;
  int v5;
  NSObject *v6;
  NSString *tableName;
  NSString *uniqueIdentifier;
  void *v10;
  uint8_t buf[4];
  NSString *v12;
  __int16 v13;
  NSString *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  int v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->super._databaseQueue);
  database = self->super._database;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("DROP TABLE IF EXISTS %@"), self->_tableName);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = WebKit::_SQLiteDatabaseExecuteAndReturnError<>(database, 0, v4);

  if (v5 != 101)
  {
    v6 = (id)qword_1ECE710C8;
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      tableName = self->_tableName;
      uniqueIdentifier = self->super._uniqueIdentifier;
      -[_WKWebExtensionSQLiteDatabase lastErrorMessage](self->super._database, "lastErrorMessage");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413059;
      v12 = tableName;
      v13 = 2113;
      v14 = uniqueIdentifier;
      v15 = 2114;
      v16 = v10;
      v17 = 1024;
      v18 = v5;
      _os_log_error_impl(&dword_196BCC000, v6, OS_LOG_TYPE_ERROR, "Failed to reset %@ database schema for extension %{private}@: %{public}@ (%d)", buf, 0x26u);

    }
  }
  return v5;
}

- (BOOL)_isDatabaseEmpty
{
  _WKWebExtensionSQLiteDatabase *database;
  void *v4;
  void *v5;
  void *v6;

  dispatch_assert_queue_V2((dispatch_queue_t)self->super._databaseQueue);
  database = self->super._database;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("SELECT COUNT(*) FROM %@"), self->_tableName);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  WebKit::SQLiteDatabaseFetch<>(database, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "nextObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(database) = objc_msgSend(v6, "int64AtIndex:", 0) == 0;

  return (char)database;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tableName, 0);
  objc_storeStrong((id *)&self->_storageType, 0);
}

@end
