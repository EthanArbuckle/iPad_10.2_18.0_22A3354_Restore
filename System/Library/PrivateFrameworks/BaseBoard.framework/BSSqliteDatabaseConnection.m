@implementation BSSqliteDatabaseConnection

uint64_t __54__BSSqliteDatabaseConnection_performSyncWithDatabase___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16));
}

- (void)performSyncWithDatabase:(uint64_t)a1
{
  NSObject *v2;
  _QWORD v3[6];

  if (a1)
  {
    v2 = *(NSObject **)(a1 + 8);
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __54__BSSqliteDatabaseConnection_performSyncWithDatabase___block_invoke;
    v3[3] = &unk_1E1EBEE78;
    v3[4] = a1;
    v3[5] = a2;
    dispatch_sync(v2, v3);
  }
}

- (id)prepareStatement:(id)a3
{
  void *v5;
  void *v6;
  void *v9;

  if (!a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BSSqliteDatabaseConnection.m"), 72, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("query"));

  }
  -[NSCache objectForKey:](self->_queue_queryCache, "objectForKey:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    v5 = +[BSSqlitePreparedStatement _newPreparedStatementForDatabaseConnection:withSQLQuery:]((uint64_t)BSSqlitePreparedStatement, self, a3);
    if (v5)
    {
      v6 = (void *)objc_msgSend(a3, "copy");
      -[NSCache setObject:forKey:](self->_queue_queryCache, "setObject:forKey:", v5, v6);

    }
  }
  return v5;
}

- (BSSqliteDatabaseConnection)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BSSqliteDatabaseConnection.m"), 32, CFSTR("init is not allowed"));

  return (BSSqliteDatabaseConnection *)-[BSSqliteDatabaseConnection _initWithSqlitePath:dataProtectionClass:](self, 0, 2);
}

- (id)_initWithSqlitePath:(uint64_t)a3 dataProtectionClass:
{
  id v6;
  dispatch_queue_t Serial;
  void *v8;
  id v9;
  const char *v10;
  int v11;
  int v12;
  NSObject *v13;
  id v14;
  id v15;
  void *v16;
  void *v18;
  objc_super v19;
  uint8_t buf[4];
  id v21;
  __int16 v22;
  int v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    if (!a2)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", sel__initWithSqlitePath_dataProtectionClass_, a1, CFSTR("BSSqliteDatabaseConnection.m"), 46, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("path"));

    }
    v19.receiver = a1;
    v19.super_class = (Class)BSSqliteDatabaseConnection;
    v6 = objc_msgSendSuper2(&v19, sel_init);
    if (v6)
    {
      Serial = BSDispatchQueueCreateSerial(CFSTR("com.apple.baseboard.sqlite.database"));
      v8 = (void *)*((_QWORD *)v6 + 1);
      *((_QWORD *)v6 + 1) = Serial;

      objc_opt_self();
      v9 = objc_retainAutorelease(a2);
      v10 = (const char *)objc_msgSend(v9, "UTF8String");
      if ((unint64_t)(a3 - 1) >= 3)
        v11 = 1048582;
      else
        v11 = 4194310 - (((_DWORD)a3 - 1) << 20);
      v12 = sqlite3_open_v2(v10, (sqlite3 **)v6 + 2, v11, 0);
      if (v12)
      {
        BSLogCommon();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543618;
          v21 = v9;
          v22 = 1024;
          v23 = v12;
          _os_log_error_impl(&dword_18A184000, v13, OS_LOG_TYPE_ERROR, "Failed to open database %{public}@ due to result %d", buf, 0x12u);
        }

        -[BSSqliteDatabaseConnection _closeConnection]((uint64_t)v6);
        goto LABEL_12;
      }
      v15 = objc_alloc_init(MEMORY[0x1E0C99D38]);
      v16 = (void *)*((_QWORD *)v6 + 3);
      *((_QWORD *)v6 + 3) = v15;

    }
    v6 = v6;
    v14 = v6;
    goto LABEL_15;
  }
  v6 = 0;
LABEL_12:
  v14 = 0;
LABEL_15:

  return v14;
}

- (BSSqliteDatabaseConnection)initWithInMemoryDatabase
{
  return (BSSqliteDatabaseConnection *)-[BSSqliteDatabaseConnection _initWithSqlitePath:dataProtectionClass:](self, CFSTR(":memory:"), 2);
}

- (BSSqliteDatabaseConnection)initWithFileURL:(id)a3 dataProtectionClass:(unint64_t)a4
{
  void *v8;
  BSSqliteDatabaseConnection *v9;
  void *v11;

  if ((objc_msgSend(a3, "isFileURL") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BSSqliteDatabaseConnection.m"), 41, CFSTR("url must be a fileURL : url=%@"), a3);

  }
  objc_msgSend(a3, "path");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (BSSqliteDatabaseConnection *)-[BSSqliteDatabaseConnection _initWithSqlitePath:dataProtectionClass:](self, v8, a4);

  return v9;
}

- (void)_closeConnection
{
  sqlite3 *v2;
  int v3;
  int v4;
  NSObject *v5;
  const char *v6;
  uint64_t v7;
  int v8;
  const char *v9;
  __int16 v10;
  int v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v2 = *(sqlite3 **)(a1 + 16);
  if (v2)
  {
    v3 = sqlite3_close_v2(v2);
    if (v3)
    {
      v4 = v3;
      BSLogCommon();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        v6 = sqlite3_errstr(v4);
        v7 = *(_QWORD *)(a1 + 16);
        v8 = 136315906;
        v9 = "-[BSSqliteDatabaseConnection _closeConnection]";
        v10 = 1024;
        v11 = v4;
        v12 = 2082;
        v13 = v6;
        v14 = 2048;
        v15 = v7;
        _os_log_error_impl(&dword_18A184000, v5, OS_LOG_TYPE_ERROR, "%s: got error %d (%{public}s) closing database connection %p", (uint8_t *)&v8, 0x26u);
      }

    }
    *(_QWORD *)(a1 + 16) = 0;
  }
}

- (void)dealloc
{
  void *v4;
  void *v5;
  objc_super v6;

  if (self->_queue_dbConnection)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BSSqliteDatabaseConnection.m"), 65, CFSTR("database must be closed before dealloc"));

  }
  if (self->_queue_queryCache)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BSSqliteDatabaseConnection.m"), 66, CFSTR("database must be closed before dealloc"));

  }
  v6.receiver = self;
  v6.super_class = (Class)BSSqliteDatabaseConnection;
  -[BSSqliteDatabaseConnection dealloc](&v6, sel_dealloc);
}

- (BOOL)truncateDatabaseAndReturnError:(id *)a3
{
  char v4;
  _QWORD v6[7];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  char v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__2;
  v15 = __Block_byref_object_dispose__2;
  v16 = 0;
  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 1;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __61__BSSqliteDatabaseConnection_truncateDatabaseAndReturnError___block_invoke;
  v6[3] = &unk_1E1EBEE50;
  v6[4] = self;
  v6[5] = &v11;
  v6[6] = &v7;
  -[BSSqliteDatabaseConnection performSyncWithDatabase:]((uint64_t)self, (uint64_t)v6);
  if (a3)
    *a3 = objc_retainAutorelease((id)v12[5]);
  v4 = *((_BYTE *)v8 + 24);
  _Block_object_dispose(&v7, 8);
  _Block_object_dispose(&v11, 8);

  return v4;
}

void __61__BSSqliteDatabaseConnection_truncateDatabaseAndReturnError___block_invoke(_QWORD *a1, sqlite3 *a2)
{
  int v4;
  int v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;

  v4 = sqlite3_file_control(a2, 0, 101, 0);
  if (v4)
  {
    v5 = v4;
    v6 = a1[4];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", sqlite3_errmsg(a2));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", sqlite3_errstr(v5));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setObject:forKeyedSubscript:", v9, *MEMORY[0x1E0CB2D50]);

      if (v7)
        objc_msgSend(v8, "setObject:forKeyedSubscript:", v7, *MEMORY[0x1E0CB2D68]);
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.baseboard.bssqlite"), v5, v8);
      v10 = objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v10 = 0;
    }
    v11 = *(_QWORD *)(a1[5] + 8);
    v12 = *(void **)(v11 + 40);
    *(_QWORD *)(v11 + 40) = v10;

    *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = 0;
  }
}

- (void)performWithDatabase:(uint64_t)a1
{
  NSObject *v2;
  _QWORD v3[6];

  if (a1)
  {
    v2 = *(NSObject **)(a1 + 8);
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __50__BSSqliteDatabaseConnection_performWithDatabase___block_invoke;
    v3[3] = &unk_1E1EBEE78;
    v3[4] = a1;
    v3[5] = a2;
    dispatch_async(v2, v3);
  }
}

uint64_t __50__BSSqliteDatabaseConnection_performWithDatabase___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16));
}

- (id)lastErrorMessage
{
  id v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t (*v7)(uint64_t, uint64_t);
  void (*v8)(uint64_t);
  id v9;

  if (!a1)
    return 0;
  v4 = 0;
  v5 = &v4;
  v6 = 0x3032000000;
  v7 = __Block_byref_object_copy__2;
  v8 = __Block_byref_object_dispose__2;
  v9 = 0;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __46__BSSqliteDatabaseConnection_lastErrorMessage__block_invoke;
  v3[3] = &unk_1E1EBEEA0;
  v3[4] = &v4;
  -[BSSqliteDatabaseConnection performSyncWithDatabase:](a1, (uint64_t)v3);
  v1 = (id)v5[5];
  _Block_object_dispose(&v4, 8);

  return v1;
}

void __46__BSSqliteDatabaseConnection_lastErrorMessage__block_invoke(uint64_t a1, sqlite3 *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", sqlite3_errmsg(a2));
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

- (void)close
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __35__BSSqliteDatabaseConnection_close__block_invoke;
  block[3] = &unk_1E1EBE890;
  block[4] = self;
  dispatch_sync(queue, block);
}

void __35__BSSqliteDatabaseConnection_close__block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(a1 + 32);
  if (v1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(v1 + 8));
    v11 = 0u;
    v12 = 0u;
    v9 = 0u;
    v10 = 0u;
    v2 = *(id *)(v1 + 32);
    v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    if (v3)
    {
      v4 = *(_QWORD *)v10;
      do
      {
        v5 = 0;
        do
        {
          if (*(_QWORD *)v10 != v4)
            objc_enumerationMutation(v2);
          v6 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * v5);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v6, "sqliteDatabaseConnectionWillClose:", v1, (_QWORD)v9);
          ++v5;
        }
        while (v3 != v5);
        v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      }
      while (v3);
    }

    v7 = *(void **)(v1 + 32);
    *(_QWORD *)(v1 + 32) = 0;

    objc_msgSend(*(id *)(v1 + 24), "removeAllObjects");
    v8 = *(void **)(v1 + 24);
    *(_QWORD *)(v1 + 24) = 0;

    -[BSSqliteDatabaseConnection _closeConnection](v1);
  }
}

- (void)addObserver:(uint64_t)a1
{
  NSObject *v2;
  _QWORD v3[6];

  if (a1)
  {
    v2 = *(NSObject **)(a1 + 8);
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __42__BSSqliteDatabaseConnection_addObserver___block_invoke;
    v3[3] = &unk_1E1EBE700;
    v3[4] = a1;
    v3[5] = a2;
    dispatch_async(v2, v3);
  }
}

uint64_t __42__BSSqliteDatabaseConnection_addObserver___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
  if (!v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 32);
    *(_QWORD *)(v4 + 32) = v3;

    v2 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
  }
  return objc_msgSend(v2, "addObject:", *(_QWORD *)(a1 + 40));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue_observers, 0);
  objc_storeStrong((id *)&self->_queue_queryCache, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
