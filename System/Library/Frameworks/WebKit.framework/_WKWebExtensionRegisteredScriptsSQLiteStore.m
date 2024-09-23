@implementation _WKWebExtensionRegisteredScriptsSQLiteStore

- (_WKWebExtensionRegisteredScriptsSQLiteStore)initWithUniqueIdentifier:(id)a3 directory:(id)a4 usesInMemoryDatabase:(BOOL)a5
{
  _WKWebExtensionRegisteredScriptsSQLiteStore *v5;
  _WKWebExtensionRegisteredScriptsSQLiteStore *v6;
  _WKWebExtensionRegisteredScriptsSQLiteStore *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)_WKWebExtensionRegisteredScriptsSQLiteStore;
  v5 = -[_WKWebExtensionSQLiteStore initWithUniqueIdentifier:directory:usesInMemoryDatabase:](&v9, sel_initWithUniqueIdentifier_directory_usesInMemoryDatabase_, a3, a4, a5);
  v6 = v5;
  if (v5)
    v7 = v5;

  return v6;
}

- (void)updateScripts:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  id location;

  v6 = a3;
  v7 = a4;
  WebKit::mapObjects<NSArray>(v6, &__block_literal_global_2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3321888768;
  v11[2] = __79___WKWebExtensionRegisteredScriptsSQLiteStore_updateScripts_completionHandler___block_invoke_2;
  v11[3] = &unk_1E34AB068;
  objc_copyWeak(&v14, &location);
  v9 = v7;
  v13 = v9;
  v10 = v6;
  v12 = v10;
  -[_WKWebExtensionRegisteredScriptsSQLiteStore deleteScriptsWithIDs:completionHandler:](self, "deleteScriptsWithIDs:completionHandler:", v8, v11);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);

}

- (void)deleteScriptsWithIDs:(id)a3 completionHandler:(id)a4
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
    v9[2] = __86___WKWebExtensionRegisteredScriptsSQLiteStore_deleteScriptsWithIDs_completionHandler___block_invoke;
    v9[3] = &unk_1E34AB0A0;
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

- (void)addScripts:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *databaseQueue;
  _QWORD v10[4];
  id v11;
  id v12;
  id v13;
  id location;

  v6 = a3;
  v7 = a4;
  WebKit::filterObjects<NSArray>(v6, &__block_literal_global_12);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v8, "count"))
  {
    objc_initWeak(&location, self);
    databaseQueue = self->super._databaseQueue;
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3321888768;
    v10[2] = __76___WKWebExtensionRegisteredScriptsSQLiteStore_addScripts_completionHandler___block_invoke_2;
    v10[3] = &unk_1E34AB0A0;
    objc_copyWeak(&v13, &location);
    v12 = v7;
    v11 = v8;
    dispatch_async(databaseQueue, v10);

    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }
  else
  {
    (*((void (**)(id, _QWORD))v7 + 2))(v7, 0);
  }

}

- (void)getScriptsWithCompletionHandler:(id)a3
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
  block[2] = __79___WKWebExtensionRegisteredScriptsSQLiteStore_getScriptsWithCompletionHandler___block_invoke;
  block[3] = &unk_1E34AB118;
  objc_copyWeak(&v9, &location);
  v8 = v4;
  v6 = v4;
  dispatch_async(databaseQueue, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (id)_getScriptsWithOutErrorMessage:(id *)a3
{
  void *v5;
  void *v6;

  dispatch_assert_queue_V2((dispatch_queue_t)self->super._databaseQueue);
  if (-[_WKWebExtensionSQLiteStore _openDatabaseIfNecessaryReturningErrorMessage:createIfNecessary:](self, "_openDatabaseIfNecessaryReturningErrorMessage:createIfNecessary:", a3, 0))
  {
    WebKit::SQLiteDatabaseFetch<>(self->super._database, CFSTR("SELECT * FROM registered_scripts"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[_WKWebExtensionRegisteredScriptsSQLiteStore _getKeysAndValuesFromRowEnumerator:](self, "_getKeysAndValuesFromRowEnumerator:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = (void *)MEMORY[0x1E0C9AA60];
  }
  return v6;
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
  id v18;
  id v20;
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint8_t buf[4];
  NSString *v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v18 = a3;
  if ((_MergedGlobals_37 & 1) == 0)
  {
    v15 = (void *)MEMORY[0x1E0C99E60];
    v16 = objc_opt_class();
    v17 = objc_opt_class();
    objc_msgSend(v15, "setWithObjects:", v16, v17, objc_opt_class(), 0, v18);
    qword_1ECE71D08 = objc_claimAutoreleasedReturnValue();
    _MergedGlobals_37 = 1;
  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v20 = (id)objc_claimAutoreleasedReturnValue();
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v3 = v18;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v22, v28, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v23 != v5)
          objc_enumerationMutation(v3);
        v7 = (void *)MEMORY[0x1E0CB3710];
        v8 = qword_1ECE71D08;
        objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * i), "dataAtIndex:", 1);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = 0;
        objc_msgSend(v7, "unarchivedObjectOfClasses:fromData:error:", v8, v9, &v21);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = v21;

        if (v11)
        {
          v12 = qword_1ECE710C8;
          if (os_log_type_enabled((os_log_t)qword_1ECE710C8, OS_LOG_TYPE_ERROR))
          {
            uniqueIdentifier = self->super._uniqueIdentifier;
            *(_DWORD *)buf = 138477827;
            v27 = uniqueIdentifier;
            _os_log_error_impl(&dword_196BCC000, v12, OS_LOG_TYPE_ERROR, "Failed to deserialize registered content script for extension %{private}@.", buf, 0xCu);
          }
        }
        else
        {
          objc_msgSend(v20, "addObject:", v10);
        }

      }
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v22, v28, 16);
    }
    while (v4);
  }

  return v20;
}

- (void)_insertScript:(id)a3 inDatabase:(id)a4 errorMessage:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  __CFString *v13;
  _WKWebExtensionSQLiteStatement *v14;
  id v15;
  void *v16;
  _WKWebExtensionSQLiteStatement *v17;
  uint64_t v18;
  NSObject *v19;
  NSString *uniqueIdentifier;
  id *v21;
  _BYTE buf[24];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->super._databaseQueue);
  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v8, 1, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = a5;
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("id"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v9;
  v13 = CFSTR("INSERT INTO registered_scripts (key, script) VALUES (?, ?)");
  *(_QWORD *)buf = 0;
  v14 = -[_WKWebExtensionSQLiteStatement initWithDatabase:query:error:]([_WKWebExtensionSQLiteStatement alloc], "initWithDatabase:query:error:", v12, CFSTR("INSERT INTO registered_scripts (key, script) VALUES (?, ?)"), buf);
  v15 = *(id *)buf;
  v16 = v15;
  if (v14)
  {
    v17 = v14;
    -[_WKWebExtensionSQLiteStatement bindString:atParameterIndex:](v17, "bindString:atParameterIndex:", v11, 1);
    -[_WKWebExtensionSQLiteStatement bindData:atParameterIndex:](v17, "bindData:atParameterIndex:", v10, 2);

    v18 = -[_WKWebExtensionSQLiteStatement execute](v17, "execute");
    -[_WKWebExtensionSQLiteStatement invalidate](v17, "invalidate");
    if ((v18 - 100) >= 2 && (_DWORD)v18)
      objc_msgSend(v12, "reportErrorWithCode:statement:error:", v18, -[_WKWebExtensionSQLiteStatement handle](v17, "handle"), 0);
  }
  else
  {
    LODWORD(v18) = objc_msgSend(v15, "code");
  }

  if ((_DWORD)v18 != 101)
  {
    v19 = qword_1ECE710C8;
    if (os_log_type_enabled((os_log_t)qword_1ECE710C8, OS_LOG_TYPE_ERROR))
    {
      uniqueIdentifier = self->super._uniqueIdentifier;
      *(_DWORD *)buf = 138477827;
      *(_QWORD *)&buf[4] = uniqueIdentifier;
      _os_log_error_impl(&dword_196BCC000, v19, OS_LOG_TYPE_ERROR, "Failed to insert registered content script for extension %{private}@.", buf, 0xCu);
    }
    *v21 = CFSTR("Failed to add content script.");
  }

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
    -[NSURL URLByAppendingPathComponent:isDirectory:](self->super._directory, "URLByAppendingPathComponent:isDirectory:", CFSTR("RegisteredContentScripts.db"), 0);
  return (id)objc_claimAutoreleasedReturnValue();
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
  v3 = WebKit::_SQLiteDatabaseExecuteAndReturnError<>(self->super._database, 0, CFSTR("CREATE TABLE registered_scripts (key TEXT PRIMARY KEY NOT NULL, script BLOB NOT NULL)"));
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
      _os_log_error_impl(&dword_196BCC000, v4, OS_LOG_TYPE_ERROR, "Failed to create registered_scripts database for extension %{private}@: %{public}@ (%d)", (uint8_t *)&v8, 0x1Cu);

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
  v3 = WebKit::_SQLiteDatabaseExecuteAndReturnError<>(self->super._database, 0, CFSTR("DROP TABLE IF EXISTS registered_scripts"));
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
      _os_log_error_impl(&dword_196BCC000, v4, OS_LOG_TYPE_ERROR, "Failed to reset registered_scripts database schema for extension %{private}@: %{public}@ (%d)", (uint8_t *)&v8, 0x1Cu);

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
  WebKit::SQLiteDatabaseFetch<>(self->super._database, CFSTR("SELECT COUNT(*) FROM registered_scripts"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "nextObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "int64AtIndex:", 0) == 0;

  return v5;
}

@end
