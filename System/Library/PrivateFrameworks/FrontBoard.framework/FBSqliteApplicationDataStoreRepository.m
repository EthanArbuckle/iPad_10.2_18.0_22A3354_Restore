@implementation FBSqliteApplicationDataStoreRepository

uint64_t __93__FBSqliteApplicationDataStoreRepository__dbQueue_notifyDelegateOfChangeForKeys_application___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "objectChangedForKeys:application:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

uint64_t __78__FBSqliteApplicationDataStoreRepository__dbQueue_containsKey_forApplication___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = 1;
  return result;
}

void __74__FBSqliteApplicationDataStoreRepository_setObject_forKey_forApplication___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;
  id v5;
  id v6;
  id v7;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __74__FBSqliteApplicationDataStoreRepository_setObject_forKey_forApplication___block_invoke_2;
  v3[3] = &unk_1E4A13490;
  v2 = *(void **)(a1 + 40);
  v4 = *(id *)(a1 + 32);
  v5 = v2;
  v6 = *(id *)(a1 + 48);
  v7 = *(id *)(a1 + 56);
  objc_msgSend(v4, "_dbQueue_performWithSavepoint:handler:", CFSTR("setObject"), v3);

}

void __76__FBSqliteApplicationDataStoreRepository_removeObjectForKey_forApplication___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  _QWORD v9[2];
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  v3 = (void *)a1[4];
  v2 = a1[5];
  v9[0] = CFSTR(":application_identifier");
  v9[1] = CFSTR(":key");
  v4 = a1[6];
  v10[0] = v2;
  v10[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_dbQueue_executeStatement:bindings:resultRowHandler:", CFSTR("DELETE FROM kvs WHERE     application_identifier IN (SELECT id FROM application_identifier_tab WHERE application_identifier = :application_identifier)     AND key IN (SELECT id FROM key_tab WHERE key = :key);"),
    v5,
    0);

  v6 = (void *)a1[4];
  v8 = a1[6];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v8, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_dbQueue_notifyDelegateOfChangeForKeys:application:", v7, a1[5]);

}

- (void)setObject:(id)a3 forKey:(id)a4 forApplication:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  uint64_t v13;
  NSObject *dbQueue;
  id v15;
  void *v16;
  _QWORD block[5];
  id v18;
  id v19;
  id v20;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = v10;
  if (!v8)
  {
    -[FBSqliteApplicationDataStoreRepository removeObjectForKey:forApplication:](self, "removeObjectForKey:forApplication:", v9, v10);
    goto LABEL_9;
  }
  if (!v9
    || !v10
    || !-[FBSqliteApplicationDataStoreRepository _isEligibleForSaving:](self, "_isEligibleForSaving:", v8))
  {
    goto LABEL_9;
  }
  v12 = v8;
  if (!objc_msgSend((id)objc_opt_class(), "_objectRequiresSerialization:", v12)
    || (objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", v12, 200, 0, 0),
        v13 = objc_claimAutoreleasedReturnValue(),
        v12,
        (v12 = (id)v13) != 0))
  {
    dbQueue = self->_dbQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __74__FBSqliteApplicationDataStoreRepository_setObject_forKey_forApplication___block_invoke;
    block[3] = &unk_1E4A12068;
    block[4] = self;
    v18 = v9;
    v19 = v11;
    v20 = v12;
    v15 = v12;
    dispatch_async(dbQueue, block);

LABEL_9:
    return;
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("objectToStore != nil"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    -[FBSqliteApplicationDataStoreRepository setObject:forKey:forApplication:].cold.1();
  objc_msgSend(objc_retainAutorelease(v16), "UTF8String");
  _bs_set_crash_log_message();
  __break(0);
}

- (BOOL)_isEligibleForSaving:(id)a3
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (_isEligibleForSaving__onceToken_0 != -1)
    dispatch_once(&_isEligibleForSaving__onceToken_0, &__block_literal_global_13);
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  v4 = (id)_isEligibleForSaving____eligibleClassTypes_0;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v10;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v4);
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          LOBYTE(v5) = 1;
          goto LABEL_13;
        }
      }
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      if (v5)
        continue;
      break;
    }
  }
LABEL_13:

  return v5;
}

+ (BOOL)_objectRequiresSerialization:(id)a3
{
  id v3;
  char v4;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = 0;
  }
  else
  {
    objc_opt_class();
    v4 = objc_opt_isKindOfClass() ^ 1;
  }

  return v4 & 1;
}

- (id)objectForKey:(id)a3 forApplication:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  NSObject *dbQueue;
  _QWORD v12[5];
  id v13;
  id v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  v9 = 0;
  if (v6 && v7)
  {
    v16 = 0;
    v17 = &v16;
    v18 = 0x3032000000;
    v19 = __Block_byref_object_copy__5;
    v20 = __Block_byref_object_dispose__5;
    v21 = 0;
    dbQueue = self->_dbQueue;
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __70__FBSqliteApplicationDataStoreRepository_objectForKey_forApplication___block_invoke;
    v12[3] = &unk_1E4A12CE8;
    v15 = &v16;
    v12[4] = self;
    v13 = v6;
    v14 = v8;
    dispatch_sync(dbQueue, v12);
    v9 = (id)v17[5];

    _Block_object_dispose(&v16, 8);
  }

  return v9;
}

void __70__FBSqliteApplicationDataStoreRepository_objectForKey_forApplication___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_dbQueue_objectForKey:forApplication:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)_dbQueue_objectForKey:(id)a3 forApplication:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v11;
  void *v12;
  _QWORD v13[6];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;
  _QWORD v20[2];
  _QWORD v21[3];

  v21[2] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dbQueue);
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("key"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBSqliteApplicationDataStoreRepository _dbQueue_objectForKey:forApplication:].cold.1();
    objc_msgSend(objc_retainAutorelease(v11), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A35A2FACLL);
  }
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("identifier"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBSqliteApplicationDataStoreRepository _dbQueue_objectForKey:forApplication:].cold.2();
    objc_msgSend(objc_retainAutorelease(v12), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A35A3010);
  }
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__5;
  v18 = __Block_byref_object_dispose__5;
  v19 = 0;
  v20[0] = CFSTR(":application_identifier");
  v20[1] = CFSTR(":key");
  v21[0] = v7;
  v21[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, v20, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __79__FBSqliteApplicationDataStoreRepository__dbQueue_objectForKey_forApplication___block_invoke;
  v13[3] = &unk_1E4A13530;
  v13[4] = self;
  v13[5] = &v14;
  -[FBSqliteApplicationDataStoreRepository _dbQueue_executeStatement:bindings:resultRowHandler:](self, "_dbQueue_executeStatement:bindings:resultRowHandler:", CFSTR("SELECT value FROM kvs, application_identifier_tab, key_tab WHERE    application_identifier_tab.application_identifier = :application_identifier    AND key_tab.key = :key    AND kvs.application_identifier = application_identifier_tab.id    AND kvs.key = key_tab.id;"),
    v8,
    v13);

  v9 = (id)v15[5];
  _Block_object_dispose(&v14, 8);

  return v9;
}

- (void)_dbQueue_performWithSavepoint:(id)a3 handler:(id)a4
{
  void *v6;
  uint64_t (**v7)(_QWORD);
  id v8;
  void *v9;
  const __CFString *v10;
  id v11;

  v6 = (void *)MEMORY[0x1E0CB3940];
  v7 = (uint64_t (**)(_QWORD))a4;
  v8 = a3;
  objc_msgSend(v6, "stringWithFormat:", CFSTR("SAVEPOINT %@"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[FBSqliteApplicationDataStoreRepository _dbQueue_executeStatement:bindings:resultRowHandler:](self, "_dbQueue_executeStatement:bindings:resultRowHandler:", v9, 0, 0);

  LODWORD(v9) = v7[2](v7);
  if ((_DWORD)v9)
    v10 = CFSTR("RELEASE SAVEPOINT %@");
  else
    v10 = CFSTR("ROLLBACK TO SAVEPOINT %@");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", v10, v8);
  v11 = (id)objc_claimAutoreleasedReturnValue();

  -[FBSqliteApplicationDataStoreRepository _dbQueue_executeStatement:bindings:resultRowHandler:](self, "_dbQueue_executeStatement:bindings:resultRowHandler:", v11, 0, 0);
}

- (BOOL)_dbQueue_executeStatement:(id)a3 bindings:(id)a4 resultRowHandler:(id)a5
{
  id v8;
  id v9;
  BOOL v10;
  id v11;
  NSObject *v12;
  id v14;
  uint8_t buf[4];
  id v16;
  __int16 v17;
  id v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v14 = 0;
  v10 = -[FBSqliteApplicationDataStoreRepository _dbQueue_executeStatement:bindings:resultRowHandler:error:](self, "_dbQueue_executeStatement:bindings:resultRowHandler:error:", v8, v9, a5, &v14);
  v11 = v14;
  if (!v10)
  {
    FBLogAppDataStore();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543874;
      v16 = v11;
      v17 = 2114;
      v18 = v8;
      v19 = 2112;
      v20 = v9;
      _os_log_error_impl(&dword_1A359A000, v12, OS_LOG_TYPE_ERROR, "Received unexpected query error %{public}@ for query %{public}@ bindings %@", buf, 0x20u);
    }

  }
  return v10;
}

- (BOOL)_dbQueue_executeStatement:(id)a3 bindings:(id)a4 resultRowHandler:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  char v14;

  v10 = a4;
  v11 = a5;
  -[BSSqliteDatabaseConnection prepareStatement:](self->_dbQueue_dbConnection, "prepareStatement:", a3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v12)
    v14 = objc_msgSend(v12, "executeWithBindings:resultRowHandler:error:", v10, v11, a6);
  else
    v14 = 0;

  return v14;
}

uint64_t __74__FBSqliteApplicationDataStoreRepository_setObject_forKey_forApplication___block_invoke_2(uint64_t a1)
{
  const __CFString *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v10;
  _QWORD v11[3];
  _QWORD v12[4];

  v12[3] = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(a1 + 32), "_dbQueue_containsKey:forApplication:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48)))v2 = CFSTR("UPDATE kvs SET value = :value WHERE     application_identifier IN (SELECT id FROM application_identifier_tab WHERE application_identifier = :application_identifier)     AND key IN (SELECT id FROM key_tab WHERE key = :key);");
  else
    v2 = CFSTR("INSERT OR IGNORE INTO application_identifier_tab (application_identifier) VALUES (:application_identifier);INSERT OR IGNORE INTO key_tab (key) VALUES (:key);INSERT INTO kvs (application_identifier, key, value)    SELECT application_identifier_tab.id, key_tab.id, :value FROM application_identifier_tab, key_tab WHERE         application_identifier_tab.application_identifier = :application_identifier        AND key_tab.key = :key;");
  v11[0] = CFSTR(":application_identifier");
  v11[1] = CFSTR(":key");
  v4 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v5 = *(_QWORD *)(a1 + 56);
  v12[0] = *(_QWORD *)(a1 + 48);
  v12[1] = v3;
  v11[2] = CFSTR(":value");
  v12[2] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_dbQueue_executeStatement:bindings:resultRowHandler:", v2, v6, 0);

  v7 = *(void **)(a1 + 32);
  v10 = *(_QWORD *)(a1 + 40);
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v10, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_dbQueue_notifyDelegateOfChangeForKeys:application:", v8, *(_QWORD *)(a1 + 48));

  return 1;
}

- (void)_dbQueue_notifyDelegateOfChangeForKeys:(id)a3 application:(id)a4
{
  id v6;
  id v7;
  id WeakRetained;
  void *v9;
  NSObject *calloutQueue;
  _QWORD block[4];
  id v12;
  id v13;
  id v14;

  v6 = a3;
  v7 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v9 = WeakRetained;
  if (WeakRetained)
  {
    calloutQueue = self->_calloutQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __93__FBSqliteApplicationDataStoreRepository__dbQueue_notifyDelegateOfChangeForKeys_application___block_invoke;
    block[3] = &unk_1E4A120D0;
    v12 = WeakRetained;
    v13 = v6;
    v14 = v7;
    dispatch_async(calloutQueue, block);

  }
}

- (BOOL)_dbQueue_containsKey:(id)a3 forApplication:(id)a4
{
  id v6;
  id v7;
  void *v8;
  BOOL v9;
  void *v11;
  void *v12;
  _QWORD v13[5];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  char v17;
  _QWORD v18[2];
  _QWORD v19[3];

  v19[2] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dbQueue);
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("key"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBSqliteApplicationDataStoreRepository _dbQueue_containsKey:forApplication:].cold.1();
    objc_msgSend(objc_retainAutorelease(v11), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A35A377CLL);
  }
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("identifier"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBSqliteApplicationDataStoreRepository _dbQueue_containsKey:forApplication:].cold.2();
    objc_msgSend(objc_retainAutorelease(v12), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A35A37E0);
  }
  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 0;
  v18[0] = CFSTR(":application_identifier");
  v18[1] = CFSTR(":key");
  v19[0] = v7;
  v19[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, v18, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __78__FBSqliteApplicationDataStoreRepository__dbQueue_containsKey_forApplication___block_invoke;
  v13[3] = &unk_1E4A134B8;
  v13[4] = &v14;
  -[FBSqliteApplicationDataStoreRepository _dbQueue_executeStatement:bindings:resultRowHandler:](self, "_dbQueue_executeStatement:bindings:resultRowHandler:", CFSTR("SELECT 1 FROM kvs, application_identifier_tab, key_tab WHERE    application_identifier_tab.application_identifier = :application_identifier    AND key_tab.key = :key    AND kvs.application_identifier = application_identifier_tab.id    AND kvs.key = key_tab.id;"),
    v8,
    v13);

  v9 = *((_BYTE *)v15 + 24) != 0;
  _Block_object_dispose(&v14, 8);

  return v9;
}

void __79__FBSqliteApplicationDataStoreRepository__dbQueue_objectForKey_forApplication___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v3 = a2;
  objc_msgSend((id)objc_opt_class(), "_objectForResultRow:index:", v3, 0);
  v4 = objc_claimAutoreleasedReturnValue();

  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

}

+ (id)_objectForResultRow:(id)a3 index:(unint64_t)a4
{
  void *v4;
  id v5;
  void *v6;

  objc_msgSend(a3, "objectAtIndex:", a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", v4, 0, 0, 0);
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = v4;
  }
  v6 = v5;

  return v6;
}

- (void)removeObjectForKey:(id)a3 forApplication:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *dbQueue;
  _QWORD block[5];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v6 && v7)
  {
    dbQueue = self->_dbQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __76__FBSqliteApplicationDataStoreRepository_removeObjectForKey_forApplication___block_invoke;
    block[3] = &unk_1E4A120D0;
    block[4] = self;
    v11 = v7;
    v12 = v6;
    dispatch_async(dbQueue, block);

  }
}

uint64_t __60__FBSqliteApplicationDataStoreRepository_flushSynchronously__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_dbQueue_executeStatement:bindings:resultRowHandler:", CFSTR("PRAGMA wal_checkpoint(FULL);"),
           0,
           0);
}

- (void)flushSynchronously
{
  NSObject *dbQueue;
  _QWORD block[5];

  dbQueue = self->_dbQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __60__FBSqliteApplicationDataStoreRepository_flushSynchronously__block_invoke;
  block[3] = &unk_1E4A12348;
  block[4] = self;
  dispatch_sync(dbQueue, block);
}

- (FBSqliteApplicationDataStoreRepository)initWithStorePath:(id)a3
{
  id v5;
  FBSqliteApplicationDataStoreRepository *v6;
  FBSqliteApplicationDataStoreRepository *v7;
  uint64_t Serial;
  OS_dispatch_queue *dbQueue;
  uint64_t v10;
  OS_dispatch_queue *calloutQueue;
  NSObject *v12;
  _QWORD block[4];
  FBSqliteApplicationDataStoreRepository *v15;
  objc_super v16;

  v5 = a3;
  v16.receiver = self;
  v16.super_class = (Class)FBSqliteApplicationDataStoreRepository;
  v6 = -[FBSqliteApplicationDataStoreRepository init](&v16, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_storeURL, a3);
    Serial = BSDispatchQueueCreateSerial();
    dbQueue = v7->_dbQueue;
    v7->_dbQueue = (OS_dispatch_queue *)Serial;

    v10 = BSDispatchQueueCreateSerial();
    calloutQueue = v7->_calloutQueue;
    v7->_calloutQueue = (OS_dispatch_queue *)v10;

    v7->_dbQueue_firstUnlockToken = -1;
    v12 = v7->_dbQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __60__FBSqliteApplicationDataStoreRepository_initWithStorePath___block_invoke;
    block[3] = &unk_1E4A12348;
    v15 = v7;
    dispatch_async(v12, block);

  }
  return v7;
}

uint64_t __60__FBSqliteApplicationDataStoreRepository_initWithStorePath___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_dbQueue_load");
}

- (void)dealloc
{
  BSSqliteDatabaseConnection *v3;
  NSObject *dbQueue;
  BSSqliteDatabaseConnection *v5;
  objc_super v6;
  _QWORD block[4];
  BSSqliteDatabaseConnection *v8;

  notify_cancel(self->_dbQueue_firstUnlockToken);
  v3 = self->_dbQueue_dbConnection;
  dbQueue = self->_dbQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __49__FBSqliteApplicationDataStoreRepository_dealloc__block_invoke;
  block[3] = &unk_1E4A12348;
  v8 = v3;
  v5 = v3;
  dispatch_async(dbQueue, block);

  v6.receiver = self;
  v6.super_class = (Class)FBSqliteApplicationDataStoreRepository;
  -[FBSqliteApplicationDataStoreRepository dealloc](&v6, sel_dealloc);
}

uint64_t __49__FBSqliteApplicationDataStoreRepository_dealloc__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "close");
}

- (FBApplicationDataStoreRepositoryDelegate)delegate
{
  NSObject *dbQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__5;
  v10 = __Block_byref_object_dispose__5;
  v11 = 0;
  dbQueue = self->_dbQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __50__FBSqliteApplicationDataStoreRepository_delegate__block_invoke;
  v5[3] = &unk_1E4A12C98;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dbQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (FBApplicationDataStoreRepositoryDelegate *)v3;
}

void __50__FBSqliteApplicationDataStoreRepository_delegate__block_invoke(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  void *v4;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 16));
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = WeakRetained;

}

- (void)setDelegate:(id)a3
{
  id v4;
  NSObject *dbQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  dbQueue = self->_dbQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __54__FBSqliteApplicationDataStoreRepository_setDelegate___block_invoke;
  v7[3] = &unk_1E4A11FD0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(dbQueue, v7);

}

id __54__FBSqliteApplicationDataStoreRepository_setDelegate___block_invoke(uint64_t a1)
{
  return objc_storeWeak((id *)(*(_QWORD *)(a1 + 32) + 16), *(id *)(a1 + 40));
}

- (id)applicationIdentifiersWithState
{
  NSObject *dbQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__5;
  v10 = __Block_byref_object_dispose__5;
  v11 = 0;
  dbQueue = self->_dbQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __73__FBSqliteApplicationDataStoreRepository_applicationIdentifiersWithState__block_invoke;
  v5[3] = &unk_1E4A12C98;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dbQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __73__FBSqliteApplicationDataStoreRepository_applicationIdentifiersWithState__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_dbQueue_applicationIdentifiersWithState");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)keysForApplication:(id)a3
{
  id v4;
  void *v5;
  NSObject *dbQueue;
  id v7;
  _QWORD block[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v12 = 0;
    v13 = &v12;
    v14 = 0x3032000000;
    v15 = __Block_byref_object_copy__5;
    v16 = __Block_byref_object_dispose__5;
    v17 = 0;
    dbQueue = self->_dbQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __61__FBSqliteApplicationDataStoreRepository_keysForApplication___block_invoke;
    block[3] = &unk_1E4A12D10;
    v11 = &v12;
    block[4] = self;
    v10 = v4;
    dispatch_sync(dbQueue, block);
    v7 = (id)v13[5];

    _Block_object_dispose(&v12, 8);
  }
  else
  {
    v7 = (id)MEMORY[0x1E0C9AA60];
  }

  return v7;
}

void __61__FBSqliteApplicationDataStoreRepository_keysForApplication___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_dbQueue_keysForApplication:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (BOOL)containsKey:(id)a3 forApplication:(id)a4
{
  id v6;
  id v7;
  void *v8;
  BOOL v9;
  NSObject *dbQueue;
  _QWORD v12[5];
  id v13;
  id v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  char v19;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  v9 = 0;
  if (v6 && v7)
  {
    v16 = 0;
    v17 = &v16;
    v18 = 0x2020000000;
    v19 = 0;
    dbQueue = self->_dbQueue;
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __69__FBSqliteApplicationDataStoreRepository_containsKey_forApplication___block_invoke;
    v12[3] = &unk_1E4A12CE8;
    v15 = &v16;
    v12[4] = self;
    v13 = v6;
    v14 = v8;
    dispatch_sync(dbQueue, v12);
    v9 = *((_BYTE *)v17 + 24) != 0;

    _Block_object_dispose(&v16, 8);
  }

  return v9;
}

uint64_t __69__FBSqliteApplicationDataStoreRepository_containsKey_forApplication___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_dbQueue_containsKey:forApplication:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = result;
  return result;
}

- (id)allObjectsForKeys:(id)a3
{
  id v4;
  NSObject *dbQueue;
  id v6;
  _QWORD block[5];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    v11 = 0;
    v12 = &v11;
    v13 = 0x3032000000;
    v14 = __Block_byref_object_copy__5;
    v15 = __Block_byref_object_dispose__5;
    v16 = 0;
    dbQueue = self->_dbQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __60__FBSqliteApplicationDataStoreRepository_allObjectsForKeys___block_invoke;
    block[3] = &unk_1E4A12D10;
    v10 = &v11;
    block[4] = self;
    v9 = v4;
    dispatch_sync(dbQueue, block);
    v6 = (id)v12[5];

    _Block_object_dispose(&v11, 8);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

void __60__FBSqliteApplicationDataStoreRepository_allObjectsForKeys___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_dbQueue_objectsForKeys:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)close
{
  NSObject *dbQueue;
  _QWORD block[5];

  dbQueue = self->_dbQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __47__FBSqliteApplicationDataStoreRepository_close__block_invoke;
  block[3] = &unk_1E4A12348;
  block[4] = self;
  dispatch_sync(dbQueue, block);
}

void __47__FBSqliteApplicationDataStoreRepository_close__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "close");
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 32);
  *(_QWORD *)(v2 + 32) = 0;

}

- (void)removeObjectsForKeys:(id)a3 forApplication:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  NSObject *dbQueue;
  _QWORD block[5];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v6, "count");
  if (v7 && v8)
  {
    dbQueue = self->_dbQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __78__FBSqliteApplicationDataStoreRepository_removeObjectsForKeys_forApplication___block_invoke;
    block[3] = &unk_1E4A120D0;
    block[4] = self;
    v11 = v6;
    v12 = v7;
    dispatch_async(dbQueue, block);

  }
}

void __78__FBSqliteApplicationDataStoreRepository_removeObjectsForKeys_forApplication___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;
  id v6;

  v2 = (void *)objc_opt_class();
  v3 = *(_QWORD *)(a1 + 40);
  v6 = 0;
  objc_msgSend(v2, "_generateParameterizedQuery:forKeyList:outBindings:", CFSTR("DELETE FROM kvs WHERE     application_identifier IN (SELECT id FROM application_identifier_tab WHERE application_identifier = :application_identifier)     AND key IN (SELECT id FROM key_tab WHERE key IN (%@));"),
    v3,
    &v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v6;
  objc_msgSend(v5, "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 48), CFSTR(":application_identifier"));
  objc_msgSend(*(id *)(a1 + 32), "_dbQueue_executeStatement:bindings:resultRowHandler:", v4, v5, 0);
  objc_msgSend(*(id *)(a1 + 32), "_dbQueue_notifyDelegateOfChangeForKeys:application:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

- (void)removeAllObjectsForApplication:(id)a3
{
  id v4;
  void *v5;
  NSObject *dbQueue;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    dbQueue = self->_dbQueue;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __73__FBSqliteApplicationDataStoreRepository_removeAllObjectsForApplication___block_invoke;
    v7[3] = &unk_1E4A11FD0;
    v7[4] = self;
    v8 = v4;
    dispatch_async(dbQueue, v7);

  }
}

uint64_t __73__FBSqliteApplicationDataStoreRepository_removeAllObjectsForApplication___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  const __CFString *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v3 = *(void **)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  v6 = CFSTR(":application_identifier");
  v7[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_dbQueue_executeStatement:bindings:resultRowHandler:", CFSTR("DELETE FROM kvs WHERE     application_identifier IN (SELECT id FROM application_identifier_tab WHERE application_identifier = :application_identifier);"),
    v4,
    0);

  return objc_msgSend(*(id *)(a1 + 32), "_dbQueue_notifyDelegateOfStoreInvalidationForIdentifier:", *(_QWORD *)(a1 + 40));
}

- (void)beginBatchedUpdate
{
  NSObject *dbQueue;
  _QWORD block[5];

  dbQueue = self->_dbQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __60__FBSqliteApplicationDataStoreRepository_beginBatchedUpdate__block_invoke;
  block[3] = &unk_1E4A12348;
  block[4] = self;
  dispatch_async(dbQueue, block);
}

_QWORD *__60__FBSqliteApplicationDataStoreRepository_beginBatchedUpdate__block_invoke(uint64_t a1)
{
  _QWORD *result;
  uint64_t v3;

  result = *(_QWORD **)(a1 + 32);
  v3 = result[5];
  if (!v3)
  {
    objc_msgSend(result, "_dbQueue_executeStatement:bindings:resultRowHandler:", CFSTR("PRAGMA cache_size=2000;BEGIN TRANSACTION;"),
      0,
      0);
    result = *(_QWORD **)(a1 + 32);
    v3 = result[5];
  }
  result[5] = v3 + 1;
  return result;
}

- (void)endBatchedUpdate
{
  NSObject *dbQueue;
  _QWORD block[5];

  dbQueue = self->_dbQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __58__FBSqliteApplicationDataStoreRepository_endBatchedUpdate__block_invoke;
  block[3] = &unk_1E4A12348;
  block[4] = self;
  dispatch_async(dbQueue, block);
}

_QWORD *__58__FBSqliteApplicationDataStoreRepository_endBatchedUpdate__block_invoke(_QWORD *result)
{
  uint64_t v1;
  uint64_t v2;

  v1 = result[4];
  v2 = *(_QWORD *)(v1 + 40);
  if (v2)
  {
    *(_QWORD *)(v1 + 40) = v2 - 1;
    result = (_QWORD *)result[4];
    if (!result[5])
      return (_QWORD *)objc_msgSend(result, "_dbQueue_executeStatement:bindings:resultRowHandler:", CFSTR("COMMIT;PRAGMA cache_size=10;"),
                         0,
                         0);
  }
  return result;
}

- (id)migrateIdentifier:(id)a3 toIdentifier:(id)a4
{
  id v6;
  id v7;
  NSObject *dbQueue;
  id v9;
  id v10;
  id v11;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t);
  void *v16;
  FBSqliteApplicationDataStoreRepository *v17;
  id v18;
  id v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;

  v6 = a3;
  v7 = a4;
  -[FBSqliteApplicationDataStoreRepository beginBatchedUpdate](self, "beginBatchedUpdate");
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__5;
  v25 = __Block_byref_object_dispose__5;
  v26 = 0;
  dbQueue = self->_dbQueue;
  v13 = MEMORY[0x1E0C809B0];
  v14 = 3221225472;
  v15 = __73__FBSqliteApplicationDataStoreRepository_migrateIdentifier_toIdentifier___block_invoke;
  v16 = &unk_1E4A12DB0;
  v17 = self;
  v9 = v6;
  v18 = v9;
  v20 = &v21;
  v10 = v7;
  v19 = v10;
  dispatch_sync(dbQueue, &v13);
  -[FBSqliteApplicationDataStoreRepository endBatchedUpdate](self, "endBatchedUpdate", v13, v14, v15, v16, v17);
  v11 = (id)v22[5];

  _Block_object_dispose(&v21, 8);
  return v11;
}

void __73__FBSqliteApplicationDataStoreRepository_migrateIdentifier_toIdentifier___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id obj;
  _QWORD v27[5];
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _QWORD v38[4];
  id v39;
  _QWORD v40[4];
  id v41;
  id v42;
  const __CFString *v43;
  uint64_t v44;
  _QWORD v45[3];
  _QWORD v46[3];
  _QWORD v47[2];
  _QWORD v48[2];
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "_dbQueue_keysForApplication:", *(_QWORD *)(a1 + 40));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v25, "count"))
  {
    objc_msgSend(*(id *)(a1 + 32), "_dbQueue_keysForApplication:", *(_QWORD *)(a1 + 48));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v24, "count"))
    {
      v2 = (void *)MEMORY[0x1E0CB35C8];
      v38[0] = MEMORY[0x1E0C809B0];
      v38[1] = 3221225472;
      v38[2] = __73__FBSqliteApplicationDataStoreRepository_migrateIdentifier_toIdentifier___block_invoke_3;
      v38[3] = &unk_1E4A12D88;
      v39 = *(id *)(a1 + 48);
      objc_msgSend(v2, "bs_errorWithDomain:code:configuration:", CFSTR("FBApplicationDataStore"), 1, v38);
      v3 = objc_claimAutoreleasedReturnValue();
      v4 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
      v5 = *(void **)(v4 + 40);
      *(_QWORD *)(v4 + 40) = v3;

    }
    else
    {
      v36 = 0u;
      v37 = 0u;
      v34 = 0u;
      v35 = 0u;
      obj = v25;
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v49, 16);
      if (v10)
      {
        v11 = *(_QWORD *)v35;
        do
        {
          v12 = 0;
          do
          {
            if (*(_QWORD *)v35 != v11)
              objc_enumerationMutation(obj);
            v13 = *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * v12);
            v28 = 0;
            v29 = &v28;
            v30 = 0x3032000000;
            v31 = __Block_byref_object_copy__5;
            v32 = __Block_byref_object_dispose__5;
            v33 = 0;
            v15 = *(void **)(a1 + 32);
            v14 = *(_QWORD *)(a1 + 40);
            v47[0] = CFSTR(":application_identifier");
            v47[1] = CFSTR(":key");
            v48[0] = v14;
            v48[1] = v13;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v48, v47, 2);
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            v27[0] = MEMORY[0x1E0C809B0];
            v27[1] = 3221225472;
            v27[2] = __73__FBSqliteApplicationDataStoreRepository_migrateIdentifier_toIdentifier___block_invoke_4;
            v27[3] = &unk_1E4A134B8;
            v27[4] = &v28;
            objc_msgSend(v15, "_dbQueue_executeStatement:bindings:resultRowHandler:", CFSTR("SELECT value FROM kvs, application_identifier_tab, key_tab WHERE    application_identifier_tab.application_identifier = :application_identifier    AND key_tab.key = :key    AND kvs.application_identifier = application_identifier_tab.id    AND kvs.key = key_tab.id;"),
              v16,
              v27);

            v17 = *(void **)(a1 + 32);
            v18 = *(_QWORD *)(a1 + 48);
            v45[0] = CFSTR(":application_identifier");
            v45[1] = CFSTR(":key");
            v46[0] = v18;
            v46[1] = v13;
            v45[2] = CFSTR(":value");
            v46[2] = v29[5];
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v46, v45, 3);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "_dbQueue_executeStatement:bindings:resultRowHandler:", CFSTR("INSERT OR IGNORE INTO application_identifier_tab (application_identifier) VALUES (:application_identifier);INSERT OR IGNORE INTO key_tab (key) VALUES (:key);INSERT INTO kvs (application_identifier, key, value)    SELECT application_identifier_tab.id, key_tab.id, :value FROM application_identifier_tab, key_tab WHERE         application_identifier_tab.application_identifier = :application_identifier        AND key_tab.key = :key;"),
              v19,
              0);

            _Block_object_dispose(&v28, 8);
            ++v12;
          }
          while (v10 != v12);
          v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v49, 16);
        }
        while (v10);
      }

      v20 = *(void **)(a1 + 32);
      v43 = CFSTR(":application_identifier");
      v44 = *(_QWORD *)(a1 + 40);
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v44, &v43, 1);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "_dbQueue_executeStatement:bindings:resultRowHandler:", CFSTR("DELETE FROM kvs WHERE     application_identifier IN (SELECT id FROM application_identifier_tab WHERE application_identifier = :application_identifier);"),
        v21,
        0);

      v22 = *(void **)(a1 + 32);
      v42 = obj;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v42, 1);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "_dbQueue_notifyDelegateOfChangeForKeys:application:", v23, *(_QWORD *)(a1 + 48));

      objc_msgSend(*(id *)(a1 + 32), "_dbQueue_notifyDelegateOfStoreInvalidationForIdentifier:", *(_QWORD *)(a1 + 40));
    }

  }
  else
  {
    v6 = (void *)MEMORY[0x1E0CB35C8];
    v40[0] = MEMORY[0x1E0C809B0];
    v40[1] = 3221225472;
    v40[2] = __73__FBSqliteApplicationDataStoreRepository_migrateIdentifier_toIdentifier___block_invoke_2;
    v40[3] = &unk_1E4A12D88;
    v41 = *(id *)(a1 + 40);
    objc_msgSend(v6, "bs_errorWithDomain:code:configuration:", CFSTR("FBApplicationDataStore"), 1, v40);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v9 = *(void **)(v8 + 40);
    *(_QWORD *)(v8 + 40) = v7;

  }
}

uint64_t __73__FBSqliteApplicationDataStoreRepository_migrateIdentifier_toIdentifier___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setFailureReason:", CFSTR("No store exists for identifier \"%@\"), *(_QWORD *)(a1 + 32));
}

uint64_t __73__FBSqliteApplicationDataStoreRepository_migrateIdentifier_toIdentifier___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setFailureReason:", CFSTR("Store already exists with identifier \"%@\"), *(_QWORD *)(a1 + 32));
}

void __73__FBSqliteApplicationDataStoreRepository_migrateIdentifier_toIdentifier___block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(a2, "objectAtIndex:", 0);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

void __63__FBSqliteApplicationDataStoreRepository__isEligibleForSaving___block_invoke()
{
  id v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  v0 = objc_alloc(MEMORY[0x1E0C99D20]);
  v1 = objc_opt_class();
  v2 = objc_opt_class();
  v3 = objc_opt_class();
  v4 = objc_opt_class();
  v5 = objc_opt_class();
  v6 = objc_msgSend(v0, "initWithObjects:", v1, v2, v3, v4, v5, objc_opt_class(), 0);
  v7 = (void *)_isEligibleForSaving____eligibleClassTypes_0;
  _isEligibleForSaving____eligibleClassTypes_0 = v6;

}

- (void)_dbQueue_load
{
  _BOOL4 v3;
  NSObject *v4;
  _BOOL4 v5;
  NSObject *dbQueue;
  _QWORD v7[5];
  id v8;
  id buf[2];

  v3 = -[FBSqliteApplicationDataStoreRepository _dbQueue_loadDatabase](self, "_dbQueue_loadDatabase");
  FBLogAppDataStore();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_1A359A000, v4, OS_LOG_TYPE_DEFAULT, "Successfully loaded application data store.", (uint8_t *)buf, 2u);
    }

  }
  else
  {
    if (v5)
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_1A359A000, v4, OS_LOG_TYPE_DEFAULT, "Waiting to load application data store for first unlock.", (uint8_t *)buf, 2u);
    }

    objc_initWeak(buf, self);
    dbQueue = self->_dbQueue;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __55__FBSqliteApplicationDataStoreRepository__dbQueue_load__block_invoke;
    v7[3] = &unk_1E4A134E0;
    objc_copyWeak(&v8, buf);
    v7[4] = self;
    notify_register_dispatch("com.apple.mobile.keybagd.first_unlock", &self->_dbQueue_firstUnlockToken, dbQueue, v7);
    objc_destroyWeak(&v8);
    objc_destroyWeak(buf);
  }
}

void __55__FBSqliteApplicationDataStoreRepository__dbQueue_load__block_invoke(uint64_t a1, int a2)
{
  _DWORD *WeakRetained;
  int v5;
  NSObject *v6;
  NSObject *v7;
  uint8_t v8[16];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = objc_msgSend(WeakRetained, "_dbQueue_loadDatabase");
  FBLogAppDataStore();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_1A359A000, v7, OS_LOG_TYPE_DEFAULT, "Successfully loaded application data store after first unlock.", v8, 2u);
    }

    objc_msgSend(*(id *)(a1 + 32), "_dbQueue_notifyDelegateOfLateLoad");
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
      __55__FBSqliteApplicationDataStoreRepository__dbQueue_load__block_invoke_cold_1(v7);

  }
  WeakRetained[12] = -1;
  notify_cancel(a2);

}

- (BOOL)_dbQueue_databaseIntegrityCheck
{
  id v3;
  id v4;
  _BOOL4 v5;
  id v6;
  char v7;
  NSObject *v8;
  id v10;
  _QWORD v11[4];
  id v12;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_dbQueue);
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __73__FBSqliteApplicationDataStoreRepository__dbQueue_databaseIntegrityCheck__block_invoke;
  v11[3] = &unk_1E4A13508;
  v4 = v3;
  v12 = v4;
  v10 = 0;
  v5 = -[FBSqliteApplicationDataStoreRepository _dbQueue_executeStatement:bindings:resultRowHandler:error:](self, "_dbQueue_executeStatement:bindings:resultRowHandler:error:", CFSTR("PRAGMA quick_check;"),
         0,
         v11,
         &v10);
  v6 = v10;
  if (!v5)
  {
    FBLogAppDataStore();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[FBSqliteApplicationDataStoreRepository _dbQueue_databaseIntegrityCheck].cold.2();
    goto LABEL_8;
  }
  if ((objc_msgSend(v4, "isEqualToArray:", &unk_1E4A2DAC0) & 1) == 0)
  {
    FBLogAppDataStore();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[FBSqliteApplicationDataStoreRepository _dbQueue_databaseIntegrityCheck].cold.1();
LABEL_8:
    v7 = !v5;

    goto LABEL_9;
  }
  v7 = 1;
LABEL_9:

  return v7;
}

void __73__FBSqliteApplicationDataStoreRepository__dbQueue_databaseIntegrityCheck__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "stringAtIndex:", 0);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

- (id)_dbQueue_openDatabase
{
  NSURL **p_storeURL;
  NSURL *storeURL;
  id v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_dbQueue);
  storeURL = self->_storeURL;
  p_storeURL = &self->_storeURL;
  v5 = objc_alloc(MEMORY[0x1E0D23058]);
  if (storeURL)
    v6 = objc_msgSend(v5, "initWithFileURL:dataProtectionClass:", *p_storeURL, 1);
  else
    v6 = objc_msgSend(v5, "initWithInMemoryDatabase");
  v7 = (void *)v6;
  if (!v6)
  {
    FBLogAppDataStore();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[FBSqliteApplicationDataStoreRepository _dbQueue_openDatabase].cold.1((uint64_t)p_storeURL, v8, v9, v10, v11, v12, v13, v14);

  }
  return v7;
}

- (id)urlByAppendingString:(id)a3 toURL:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v5 = a4;
  v6 = a3;
  objc_msgSend(v5, "lastPathComponent");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "URLByDeletingLastPathComponent");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "stringByAppendingString:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "URLByAppendingPathComponent:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (BOOL)_preserveFileAtURL:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  int v6;
  id v7;
  void *v8;
  uint64_t v9;
  char v10;
  id v11;
  NSObject *v12;
  id v14;
  id v15;
  uint8_t buf[4];
  id v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (MEMORY[0x1A85907B4]("-[FBSqliteApplicationDataStoreRepository _preserveFileAtURL:]"))
  {
    objc_msgSend(v3, "URLByAppendingPathExtension:", CFSTR("damaged"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeItemAtURL:error:", v4, 0);
    v15 = 0;
    v6 = objc_msgSend(v5, "copyItemAtURL:toURL:error:", v3, v4, &v15);
    v7 = v15;
    v8 = v7;
    if (v6)
    {
      v9 = *MEMORY[0x1E0C999D8];
      v14 = v7;
      v10 = objc_msgSend(v4, "setResourceValue:forKey:error:", MEMORY[0x1E0C9AAB0], v9, &v14);
      v11 = v14;

      if ((v10 & 1) != 0)
      {
LABEL_11:

        goto LABEL_12;
      }
      FBLogAppDataStore();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        -[FBSqliteApplicationDataStoreRepository _preserveFileAtURL:].cold.1();
    }
    else
    {
      FBLogAppDataStore();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543874;
        v17 = v3;
        v18 = 2114;
        v19 = v4;
        v20 = 2114;
        v21 = v8;
        _os_log_error_impl(&dword_1A359A000, v12, OS_LOG_TYPE_ERROR, "Error copying damaged database file from URL %{public}@ to URL %{public}@: %{public}@", buf, 0x20u);
      }
      v11 = v8;
    }

    goto LABEL_11;
  }
  LOBYTE(v6) = 1;
LABEL_12:

  return v6;
}

- (BOOL)_dbQueue_tryPreserveDamagedDatabase
{
  void *v3;
  void *v4;
  _BOOL4 v5;
  _BOOL4 v6;
  _BOOL4 v7;

  if (self->_storeURL)
  {
    -[FBSqliteApplicationDataStoreRepository urlByAppendingString:toURL:](self, "urlByAppendingString:toURL:", CFSTR("-wal"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[FBSqliteApplicationDataStoreRepository urlByAppendingString:toURL:](self, "urlByAppendingString:toURL:", CFSTR("-shm"), self->_storeURL);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[FBSqliteApplicationDataStoreRepository _preserveFileAtURL:](self, "_preserveFileAtURL:", self->_storeURL);
    v6 = -[FBSqliteApplicationDataStoreRepository _preserveFileAtURL:](self, "_preserveFileAtURL:", v3);
    v7 = -[FBSqliteApplicationDataStoreRepository _preserveFileAtURL:](self, "_preserveFileAtURL:", v4) && v6 && v5;

  }
  else
  {
    LOBYTE(v7) = 1;
  }
  return v7;
}

- (BOOL)_dbQueue_truncateDamagedDatabase
{
  BSSqliteDatabaseConnection *dbQueue_dbConnection;
  char v3;
  id v4;
  NSObject *v5;
  id v7;

  dbQueue_dbConnection = self->_dbQueue_dbConnection;
  v7 = 0;
  v3 = -[BSSqliteDatabaseConnection truncateDatabaseAndReturnError:](dbQueue_dbConnection, "truncateDatabaseAndReturnError:", &v7);
  v4 = v7;
  if ((v3 & 1) == 0)
  {
    FBLogAppDataStore();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[FBSqliteApplicationDataStoreRepository _dbQueue_truncateDamagedDatabase].cold.1();

  }
  return v3;
}

- (BOOL)_dbQueue_loadDatabase
{
  BSSqliteDatabaseConnection *v3;
  BSSqliteDatabaseConnection *dbQueue_dbConnection;
  _BOOL4 v5;
  BSSqliteDatabaseConnection *v6;
  BSSqliteDatabaseConnection *v7;
  BSSqliteDatabaseConnection *v8;
  BOOL v9;
  NSObject *v10;
  NSObject *v11;
  _QWORD v13[5];
  uint8_t buf[16];

  dispatch_assert_queue_V2((dispatch_queue_t)self->_dbQueue);
  -[FBSqliteApplicationDataStoreRepository _dbQueue_openDatabase](self, "_dbQueue_openDatabase");
  v3 = (BSSqliteDatabaseConnection *)objc_claimAutoreleasedReturnValue();
  dbQueue_dbConnection = self->_dbQueue_dbConnection;
  self->_dbQueue_dbConnection = v3;

  if (!self->_dbQueue_dbConnection)
    goto LABEL_14;
  if (!-[FBSqliteApplicationDataStoreRepository _inAlternateSystemApp](self, "_inAlternateSystemApp")
    && !-[FBSqliteApplicationDataStoreRepository _dbQueue_databaseIntegrityCheck](self, "_dbQueue_databaseIntegrityCheck"))
  {
    ADClientAddValueForScalarKey();
    -[BSSqliteDatabaseConnection close](self->_dbQueue_dbConnection, "close");
    v6 = self->_dbQueue_dbConnection;
    self->_dbQueue_dbConnection = 0;

    -[FBSqliteApplicationDataStoreRepository _dbQueue_tryPreserveDamagedDatabase](self, "_dbQueue_tryPreserveDamagedDatabase");
    -[FBSqliteApplicationDataStoreRepository _dbQueue_openDatabase](self, "_dbQueue_openDatabase");
    v7 = (BSSqliteDatabaseConnection *)objc_claimAutoreleasedReturnValue();
    v8 = self->_dbQueue_dbConnection;
    self->_dbQueue_dbConnection = v7;

    if (self->_dbQueue_dbConnection)
    {
      v5 = -[FBSqliteApplicationDataStoreRepository _dbQueue_truncateDamagedDatabase](self, "_dbQueue_truncateDamagedDatabase");
      if (!v5)
        return v5;
      v9 = -[FBSqliteApplicationDataStoreRepository _dbQueue_databaseIntegrityCheck](self, "_dbQueue_databaseIntegrityCheck");
      FBLogAppDataStore();
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = v10;
      if (v9)
      {
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1A359A000, v11, OS_LOG_TYPE_DEFAULT, "Successfully truncated damaged database", buf, 2u);
        }

        ADClientAddValueForScalarKey();
        goto LABEL_4;
      }
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        -[FBSqliteApplicationDataStoreRepository _dbQueue_loadDatabase].cold.1(v11);

    }
LABEL_14:
    LOBYTE(v5) = 0;
    return v5;
  }
LABEL_4:
  -[FBSqliteApplicationDataStoreRepository _dbQueue_executeStatement:bindings:resultRowHandler:](self, "_dbQueue_executeStatement:bindings:resultRowHandler:", CFSTR("PRAGMA busy_timeout=1000000"), 0, 0);
  -[FBSqliteApplicationDataStoreRepository _dbQueue_executeStatement:bindings:resultRowHandler:](self, "_dbQueue_executeStatement:bindings:resultRowHandler:", CFSTR("PRAGMA journal_mode=WAL;"),
    0,
    0);
  -[FBSqliteApplicationDataStoreRepository _dbQueue_executeStatement:bindings:resultRowHandler:](self, "_dbQueue_executeStatement:bindings:resultRowHandler:", CFSTR("PRAGMA synchronous=NORMAL;"),
    0,
    0);
  -[FBSqliteApplicationDataStoreRepository _dbQueue_executeStatement:bindings:resultRowHandler:](self, "_dbQueue_executeStatement:bindings:resultRowHandler:", CFSTR("PRAGMA cache_size=10;"),
    0,
    0);
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __63__FBSqliteApplicationDataStoreRepository__dbQueue_loadDatabase__block_invoke;
  v13[3] = &unk_1E4A126E8;
  v13[4] = self;
  -[FBSqliteApplicationDataStoreRepository _dbQueue_performWithSavepoint:handler:](self, "_dbQueue_performWithSavepoint:handler:", CFSTR("schema"), v13);
  -[FBSqliteApplicationDataStoreRepository _dbQueue_executeStatement:bindings:resultRowHandler:](self, "_dbQueue_executeStatement:bindings:resultRowHandler:", CFSTR("PRAGMA foreign_keys=ON;"),
    0,
    0);
  -[FBSqliteApplicationDataStoreRepository _dbQueue_executeStatement:bindings:resultRowHandler:](self, "_dbQueue_executeStatement:bindings:resultRowHandler:", CFSTR("DELETE FROM application_identifier_tab WHERE application_identifier_tab.id NOT IN (SELECT DISTINCT application_identifier FROM kvs);DELETE FROM key_tab WHERE key_tab.id NOT IN (SELECT DISTINCT key FROM kvs);"),
    0,
    0);
  LOBYTE(v5) = 1;
  return v5;
}

uint64_t __63__FBSqliteApplicationDataStoreRepository__dbQueue_loadDatabase__block_invoke(uint64_t a1)
{
  if (objc_msgSend(*(id *)(a1 + 32), "_dbQueue_databaseVersion") <= 0)
    objc_msgSend(*(id *)(a1 + 32), "_dbQueue_createTables");
  return 1;
}

- (id)_dbQueue_applicationIdentifiersWithState
{
  id v3;
  id v4;
  void *v5;
  _QWORD v7[4];
  id v8;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_dbQueue);
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __82__FBSqliteApplicationDataStoreRepository__dbQueue_applicationIdentifiersWithState__block_invoke;
  v7[3] = &unk_1E4A13508;
  v8 = v3;
  v4 = v3;
  -[FBSqliteApplicationDataStoreRepository _dbQueue_executeStatement:bindings:resultRowHandler:](self, "_dbQueue_executeStatement:bindings:resultRowHandler:", CFSTR("SELECT application_identifier_tab.application_identifier FROM application_identifier_tab WHERE    application_identifier_tab.id IN (SELECT DISTINCT application_identifier FROM kvs)"), 0, v7);
  v5 = (void *)objc_msgSend(v4, "copy");

  return v5;
}

void __82__FBSqliteApplicationDataStoreRepository__dbQueue_applicationIdentifiersWithState__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "stringAtIndex:", 0);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

- (id)_dbQueue_keysForApplication:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v10;
  _QWORD v11[4];
  id v12;
  const __CFString *v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dbQueue);
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("identifier"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBSqliteApplicationDataStoreRepository _dbQueue_keysForApplication:].cold.1();
    objc_msgSend(objc_retainAutorelease(v10), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A35E19C0);
  }
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v13 = CFSTR(":application_identifier");
  v14[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __70__FBSqliteApplicationDataStoreRepository__dbQueue_keysForApplication___block_invoke;
  v11[3] = &unk_1E4A13508;
  v12 = v5;
  v7 = v5;
  -[FBSqliteApplicationDataStoreRepository _dbQueue_executeStatement:bindings:resultRowHandler:](self, "_dbQueue_executeStatement:bindings:resultRowHandler:", CFSTR("SELECT key_tab.key FROM kvs,key_tab,application_identifier_tab WHERE    application_identifier_tab.application_identifier = :application_identifier    AND kvs.application_identifier = application_identifier_tab.id    AND kvs.key = key_tab.id;"),
    v6,
    v11);

  v8 = (void *)objc_msgSend(v7, "copy");
  return v8;
}

void __70__FBSqliteApplicationDataStoreRepository__dbQueue_keysForApplication___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "stringAtIndex:", 0);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

+ (id)_generateParameterizedQuery:(id)a3 forKeyList:(id)a4 outBindings:(id *)a5
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v25;
  void *v26;
  void *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (!a5)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("outBindings"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      +[FBSqliteApplicationDataStoreRepository _generateParameterizedQuery:forKeyList:outBindings:].cold.1();
    objc_msgSend(objc_retainAutorelease(v25), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A35E1C60);
  }
  v9 = v8;
  if (!objc_msgSend(v8, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("key list must contain at least one key"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      +[FBSqliteApplicationDataStoreRepository _generateParameterizedQuery:forKeyList:outBindings:].cold.2();
    objc_msgSend(objc_retainAutorelease(v26), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A35E1CB8);
  }
  v27 = v7;
  v10 = objc_msgSend(v9, "count");
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", v10);
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v12 = v9;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
  if (v13)
  {
    v14 = v13;
    v15 = 0;
    v16 = *(_QWORD *)v29;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v29 != v16)
          objc_enumerationMutation(v12);
        v18 = *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * i);
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(":k%lu"), v15 + i);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setObject:forKeyedSubscript:", v18, v19);

      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
      v15 += i;
    }
    while (v14);
  }

  objc_msgSend(v11, "allKeys");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "componentsJoinedByString:", CFSTR(","));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "stringByReplacingOccurrencesOfString:withString:", CFSTR("%@"), v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = objc_retainAutorelease(v11);
  *a5 = v23;

  return v22;
}

- (id)_dbQueue_objectsForKeys:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  id result;
  void *v13;
  _QWORD v14[5];
  id v15;
  id v16;
  id v17;

  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dbQueue);
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "sharedKeySetForKeys:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 0;
    objc_msgSend((id)objc_opt_class(), "_generateParameterizedQuery:forKeyList:outBindings:", CFSTR("SELECT application_identifier_tab.application_identifier, key_tab.key, kvs.value FROM kvs, application_identifier_tab, key_tab WHERE    key_tab.key IN (%@)    AND kvs.application_identifier = application_identifier_tab.id    AND kvs.key = key_tab.id;"),
      v4,
      &v17);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v17;
    v8 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __66__FBSqliteApplicationDataStoreRepository__dbQueue_objectsForKeys___block_invoke;
    v14[3] = &unk_1E4A13558;
    v14[4] = self;
    v15 = v8;
    v16 = v5;
    v9 = v5;
    v10 = v8;
    -[FBSqliteApplicationDataStoreRepository _dbQueue_executeStatement:bindings:resultRowHandler:](self, "_dbQueue_executeStatement:bindings:resultRowHandler:", v6, v7, v14);
    v11 = (void *)objc_msgSend(v10, "copy");

    return v11;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("keys"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBSqliteApplicationDataStoreRepository _dbQueue_objectsForKeys:].cold.1();
    objc_msgSend(objc_retainAutorelease(v13), "UTF8String");
    result = (id)_bs_set_crash_log_message();
    __break(0);
  }
  return result;
}

void __66__FBSqliteApplicationDataStoreRepository__dbQueue_objectsForKeys___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  BOOL v6;
  void *v8;
  id v9;

  v3 = a2;
  objc_msgSend(v3, "stringAtIndex:", 0);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringAtIndex:", 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "_objectForResultRow:index:", v3, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    v6 = v4 == 0;
  else
    v6 = 1;
  if (!v6 && v9 != 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", v9);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v8)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithSharedKeySet:", *(_QWORD *)(a1 + 48));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v8, v9);
    }
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v5, v4);

  }
}

- (void)_dbQueue_notifyDelegateOfStoreInvalidationForIdentifier:(id)a3
{
  id v4;
  id WeakRetained;
  void *v6;
  NSObject *calloutQueue;
  _QWORD v8[4];
  id v9;
  id v10;

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v6 = WeakRetained;
  if (WeakRetained)
  {
    calloutQueue = self->_calloutQueue;
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __98__FBSqliteApplicationDataStoreRepository__dbQueue_notifyDelegateOfStoreInvalidationForIdentifier___block_invoke;
    v8[3] = &unk_1E4A11FD0;
    v9 = WeakRetained;
    v10 = v4;
    dispatch_async(calloutQueue, v8);

  }
}

uint64_t __98__FBSqliteApplicationDataStoreRepository__dbQueue_notifyDelegateOfStoreInvalidationForIdentifier___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "storeInvalidatedForIdentifier:", *(_QWORD *)(a1 + 40));
}

- (void)_dbQueue_notifyDelegateOfLateLoad
{
  id WeakRetained;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  void *v9;
  NSObject *calloutQueue;
  id v11;
  id obj;
  _QWORD block[4];
  id v14;
  id v15;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained)
  {
    -[FBSqliteApplicationDataStoreRepository _dbQueue_applicationIdentifiersWithState](self, "_dbQueue_applicationIdentifiersWithState");
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    obj = (id)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v18;
      do
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v18 != v6)
            objc_enumerationMutation(obj);
          v8 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i);
          -[FBSqliteApplicationDataStoreRepository _dbQueue_keysForApplication:](self, "_dbQueue_keysForApplication:", v8);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          calloutQueue = self->_calloutQueue;
          block[0] = MEMORY[0x1E0C809B0];
          block[1] = 3221225472;
          block[2] = __75__FBSqliteApplicationDataStoreRepository__dbQueue_notifyDelegateOfLateLoad__block_invoke;
          block[3] = &unk_1E4A120D0;
          v14 = WeakRetained;
          v15 = v9;
          v16 = v8;
          v11 = v9;
          dispatch_async(calloutQueue, block);

        }
        v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v5);
    }

  }
}

uint64_t __75__FBSqliteApplicationDataStoreRepository__dbQueue_notifyDelegateOfLateLoad__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "objectChangedForKeys:application:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (int64_t)_dbQueue_databaseVersion
{
  int64_t v2;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = -1;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __66__FBSqliteApplicationDataStoreRepository__dbQueue_databaseVersion__block_invoke;
  v4[3] = &unk_1E4A134B8;
  v4[4] = &v5;
  -[FBSqliteApplicationDataStoreRepository _dbQueue_executeStatement:bindings:resultRowHandler:error:](self, "_dbQueue_executeStatement:bindings:resultRowHandler:error:", CFSTR("SELECT version FROM schema"), 0, v4, 0);
  v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t __66__FBSqliteApplicationDataStoreRepository__dbQueue_databaseVersion__block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;

  result = objc_msgSend(a2, "integerAtIndex:", 0);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

- (void)_dbQueue_createTables
{
  NSObject *v3;
  _QWORD v4[5];
  uint8_t buf[16];

  FBLogAppDataStore();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A359A000, v3, OS_LOG_TYPE_DEFAULT, "Creating new database tables.", buf, 2u);
  }

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __63__FBSqliteApplicationDataStoreRepository__dbQueue_createTables__block_invoke;
  v4[3] = &unk_1E4A126E8;
  v4[4] = self;
  -[FBSqliteApplicationDataStoreRepository _dbQueue_performWithSavepoint:handler:](self, "_dbQueue_performWithSavepoint:handler:", CFSTR("createTables"), v4);
}

uint64_t __63__FBSqliteApplicationDataStoreRepository__dbQueue_createTables__block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  id v3;
  NSObject *v4;
  id v6;

  v1 = *(void **)(a1 + 32);
  v6 = 0;
  v2 = objc_msgSend(v1, "_dbQueue_executeStatement:bindings:resultRowHandler:error:", CFSTR("CREATE TABLE schema(version INT NOT NULL);INSERT INTO schema (version) VALUES (1);CREATE TABLE key_tab (id INTEGER PRIMARY KEY, key TEXT NOT NULL, UNIQUE(key));CREATE TABLE application_identifier_tab (id INTEGER PRIMARY KEY, application_identifier TEXT NOT NULL, UNIQUE(application_identifier));CREATE TABLE kvs(   id INTEGER PRIMARY KEY,    application_identifier INT REFERENCES application_identifier_tab(id),    key INT REFERENCES key_tab(id),    value BLOB,    UNIQUE(application_identifier, key));CREATE INDEX kvs_keys ON kvs(key);CREATE INDEX kvs_application_identifiers ON kvs(application_identifier);CREATE VIEW kvs_debug AS     SELECT application_identifier_tab.application_identifier, key_tab.key, value FROM application_identifier_tab, key_tab, kvs WHERE         kvs.application_identifier=application_identifier_tab.id         AND kvs.key=key_tab.id;"),
         0,
         0,
         &v6);
  v3 = v6;
  if ((v2 & 1) == 0)
  {
    FBLogAppDataStore();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __63__FBSqliteApplicationDataStoreRepository__dbQueue_createTables__block_invoke_cold_1((uint64_t)v3, v4);

  }
  return v2;
}

- (BOOL)_inAlternateSystemApp
{
  if (_inAlternateSystemApp_onceToken != -1)
    dispatch_once(&_inAlternateSystemApp_onceToken, &__block_literal_global_124);
  return _inAlternateSystemApp_inAlternateSystemApp;
}

void __63__FBSqliteApplicationDataStoreRepository__inAlternateSystemApp__block_invoke()
{
  void *v0;
  void *v1;
  id v2;

  objc_msgSend(MEMORY[0x1E0D23018], "defaultShellMachName");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D22FD8], "environmentAliases");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "resolveMachService:", v2);
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  _inAlternateSystemApp_inAlternateSystemApp = objc_msgSend(v2, "isEqualToString:", v1) ^ 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_calloutQueue, 0);
  objc_storeStrong((id *)&self->_dbQueue_dbConnection, 0);
  objc_storeStrong((id *)&self->_dbQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_storeURL, 0);
}

- (void)setObject:forKey:forApplication:.cold.1()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_6_0();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_4();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1A359A000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_1_0();
}

void __55__FBSqliteApplicationDataStoreRepository__dbQueue_load__block_invoke_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_1A359A000, log, OS_LOG_TYPE_FAULT, "Attempt to open database after first unlock failed.", v1, 2u);
}

- (void)_dbQueue_databaseIntegrityCheck
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_6(&dword_1A359A000, v0, v1, "Database failed to perform integrity check with error: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_12();
}

- (void)_dbQueue_openDatabase
{
  OUTLINED_FUNCTION_6(&dword_1A359A000, a2, a3, "Failed to open application data store %{public}@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_12();
}

- (void)_preserveFileAtURL:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_9_0();
  v3 = 2114;
  v4 = v0;
  _os_log_error_impl(&dword_1A359A000, v1, OS_LOG_TYPE_ERROR, "Error marking URL %{public}@ as excluded from backup %{public}@", v2, 0x16u);
  OUTLINED_FUNCTION_12();
}

- (void)_dbQueue_truncateDamagedDatabase
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_6(&dword_1A359A000, v0, v1, "Error truncating databse file: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_12();
}

- (void)_dbQueue_loadDatabase
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1A359A000, log, OS_LOG_TYPE_ERROR, "Database integrity check failed after starting fresh", v1, 2u);
}

- (void)_dbQueue_objectForKey:forApplication:.cold.1()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_13_0();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_8();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1A359A000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_1_0();
}

- (void)_dbQueue_objectForKey:forApplication:.cold.2()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_13_0();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_8();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1A359A000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_1_0();
}

- (void)_dbQueue_containsKey:forApplication:.cold.1()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_13_0();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_8();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1A359A000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_1_0();
}

- (void)_dbQueue_containsKey:forApplication:.cold.2()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_13_0();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_8();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1A359A000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_1_0();
}

- (void)_dbQueue_keysForApplication:.cold.1()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_6_0();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_4();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1A359A000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_1_0();
}

+ (void)_generateParameterizedQuery:forKeyList:outBindings:.cold.1()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_6_0();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_4();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1A359A000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_1_0();
}

+ (void)_generateParameterizedQuery:forKeyList:outBindings:.cold.2()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_6_0();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_4();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1A359A000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_1_0();
}

- (void)_dbQueue_objectsForKeys:.cold.1()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_6_0();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_4();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1A359A000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_1_0();
}

void __63__FBSqliteApplicationDataStoreRepository__dbQueue_createTables__block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  const char *v3;
  __int16 v4;
  uint64_t v5;
  __int16 v6;
  const __CFString *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = 136315650;
  v3 = "-[FBSqliteApplicationDataStoreRepository _dbQueue_createTables]_block_invoke";
  v4 = 2114;
  v5 = a1;
  v6 = 2114;
  v7 = CFSTR("CREATE TABLE schema(version INT NOT NULL);INSERT INTO schema (version) VALUES (1);CREATE TABLE key_tab (id INTEGER PRIMARY KEY, key TEXT NOT NULL, UNIQUE(key));CREATE TABLE application_identifier_tab (id INTEGER PRIMARY KEY, application_identifier TEXT NOT NULL, UNIQUE(application_identifier));CREATE TABLE kvs(   id INTEGER PRIMARY KEY,    application_identifier INT REFERENCES application_identifier_tab(id),    key INT REFERENCES key_tab(id),    value BLOB,    UNIQUE(application_identifier, key));CREATE INDEX kvs_keys ON kvs(key);CREATE INDEX kvs_application_identifiers ON kvs(application_identifier);CREATE VIEW kvs_debug AS     SELECT application_identifier_tab.application_identifier, key_tab.key, value FROM application_identifier_tab, key_tab, kvs WHERE         kvs.application_identifier=application_identifier_tab.id         AND kvs.key=key_tab.id;");
  _os_log_error_impl(&dword_1A359A000, a2, OS_LOG_TYPE_ERROR, "%s: received error %{public}@ creating tables (query = %{public}@)", (uint8_t *)&v2, 0x20u);
}

@end
