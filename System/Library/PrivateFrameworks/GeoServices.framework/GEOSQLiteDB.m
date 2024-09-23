@implementation GEOSQLiteDB

uint64_t __41__GEOSQLiteDB_executeAsync_errorHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_execute:errorHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)_execute:(id)a3 errorHandler:(id)a4
{
  void (**v6)(id, NSError *);
  NSError *lastError;
  void (**v8)(void);

  v8 = (void (**)(void))a3;
  v6 = (void (**)(id, NSError *))a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  lastError = self->_lastError;
  self->_lastError = 0;

  if (-[GEOSQLiteDB setup](self, "setup"))
  {
    v8[2]();
  }
  else if (v6)
  {
    v6[2](v6, self->_lastError);
  }

}

- (BOOL)setup
{
  BOOL v3;
  NSObject *log;
  unsigned __int8 v5;
  void *v6;
  void *v7;
  NSObject *v8;
  id v9;
  NSError *v10;
  NSError *lastError;
  id v13;
  const __CFString *v14;
  uint8_t buf[4];
  GEOSQLiteDB *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (self->_db)
    return 1;
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    v16 = self;
    _os_log_impl(&dword_1885A9000, log, OS_LOG_TYPE_INFO, "Opening database file for %p.", buf, 0xCu);
  }
  v5 = atomic_load((unsigned __int8 *)&self->_didTearDown);
  v3 = (v5 & 1) == 0;
  if ((v5 & 1) != 0)
  {
    v8 = self->_log;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1885A9000, v8, OS_LOG_TYPE_ERROR, "DB can not be accessed once tearDown has been called.", buf, 2u);
    }
    v9 = (id)*MEMORY[0x1E0C9AFA8];
    v13 = v9;
    v14 = CFSTR("Database was torn down.");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v14, &v13, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB35C8], "GEOErrorWithCode:userInfo:", -17, v7);
    v10 = (NSError *)objc_claimAutoreleasedReturnValue();
    lastError = self->_lastError;
    self->_lastError = v10;

  }
  else
  {
    if (!-[GEOSQLiteDB _openAndConfigureWithRetryIfCorrupt](self, "_openAndConfigureWithRetryIfCorrupt"))
      return 0;
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObserver:selector:name:object:", self, sel__debug_unlockDB_, GEOUnlockSQLiteDBNotificationName, 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObserver:selector:name:object:", self, sel__debug_lockDB_, GEOLockSQLiteDBNotificationName, 0);
  }

  return v3;
}

- (BOOL)statementForKey:(id)a3 statementBlock:(id)a4
{
  id v6;
  uint64_t (**v7)(id, id);
  sqlite3_stmt *v8;
  sqlite3_stmt *v9;
  char v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *log;
  sqlite3 *db;
  NSObject *v16;
  _DWORD v17[2];
  __int16 v18;
  const char *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (uint64_t (**)(id, id))a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (self->_db && (v8 = -[NSMapTable objectForKey:](self->_preparedStatements, "objectForKey:", v6)) != 0)
  {
    v9 = v8;
    v10 = v7[2](v7, v8);
    v11 = sqlite3_reset(v9);
    if ((_DWORD)v11)
    {
      v12 = v11;
      log = self->_log;
      if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
      {
        db = self->_db;
        v16 = log;
        v17[0] = 67109378;
        v17[1] = v12;
        v18 = 2082;
        v19 = sqlite3_errmsg(db);
        _os_log_error_impl(&dword_1885A9000, v16, OS_LOG_TYPE_ERROR, "reset failure: %d %{public}s", (uint8_t *)v17, 0x12u);

      }
      -[GEOSQLiteDB _deleteAndReopenDatabaseIfCorrupt:](self, "_deleteAndReopenDatabaseIfCorrupt:", v12);
    }
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (BOOL)bindInt64Parameter:(const char *)a3 toValue:(int64_t)a4 inStatement:(sqlite3_stmt *)a5 error:(id *)a6
{
  _QWORD v7[6];

  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __60__GEOSQLiteDB_bindInt64Parameter_toValue_inStatement_error___block_invoke;
  v7[3] = &__block_descriptor_48_e8_i12__0i8l;
  v7[4] = a5;
  v7[5] = a4;
  return -[GEOSQLiteDB _bindParameter:inStatement:error:withBinder:](self, "_bindParameter:inStatement:error:withBinder:", a3, a5, a6, v7);
}

- (BOOL)bindIntParameter:(const char *)a3 toValue:(int)a4 inStatement:(sqlite3_stmt *)a5 error:(id *)a6
{
  _QWORD v7[5];
  int v8;

  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __58__GEOSQLiteDB_bindIntParameter_toValue_inStatement_error___block_invoke;
  v7[3] = &__block_descriptor_44_e8_i12__0i8l;
  v7[4] = a5;
  v8 = a4;
  return -[GEOSQLiteDB _bindParameter:inStatement:error:withBinder:](self, "_bindParameter:inStatement:error:withBinder:", a3, a5, a6, v7);
}

- (BOOL)_bindParameter:(const char *)a3 inStatement:(sqlite3_stmt *)a4 error:(id *)a5 withBinder:(id)a6
{
  uint64_t (**v10)(id, _QWORD);
  uint64_t v11;
  uint64_t v12;
  BOOL v13;

  v10 = (uint64_t (**)(id, _QWORD))a6;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (self->_db)
  {
    v11 = sqlite3_bind_parameter_index(a4, a3);
    v12 = v10[2](v10, v11);
    if (!(_DWORD)v12)
    {
      v13 = 1;
      goto LABEL_6;
    }
    -[GEOSQLiteDB reportSQLiteErrorCode:method:error:](self, "reportSQLiteErrorCode:method:error:", v12, CFSTR("bind"), a5);
  }
  v13 = 0;
LABEL_6:

  return v13;
}

uint64_t __58__GEOSQLiteDB_bindIntParameter_toValue_inStatement_error___block_invoke(uint64_t a1, int a2)
{
  return sqlite3_bind_int(*(sqlite3_stmt **)(a1 + 32), a2, *(_DWORD *)(a1 + 40));
}

- (int)intForColumn:(int)a3 inStatment:(sqlite3_stmt *)a4
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (self->_db)
    return sqlite3_column_int(a4, a3);
  else
    return 0;
}

- (int64_t)int64ForColumn:(int)a3 inStatment:(sqlite3_stmt *)a4
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (self->_db)
    return sqlite3_column_int64(a4, a3);
  else
    return 0;
}

uint64_t __60__GEOSQLiteDB_bindInt64Parameter_toValue_inStatement_error___block_invoke(uint64_t a1, int a2)
{
  return sqlite3_bind_int64(*(sqlite3_stmt **)(a1 + 32), a2, *(_QWORD *)(a1 + 40));
}

- (id)UUIDForColumn:(int)a3 inStatment:(sqlite3_stmt *)a4
{
  void *v4;
  void *v5;
  void *v6;

  -[GEOSQLiteDB noCopyBlobForColumn:inStatment:](self, "noCopyBlobForColumn:inStatment:", *(_QWORD *)&a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4 && objc_msgSend(v4, "length") == 16)
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDBytes:", objc_msgSend(objc_retainAutorelease(v5), "bytes"));
  else
    v6 = 0;

  return v6;
}

- (id)_blobForColumn:(int)a3 inStatment:(sqlite3_stmt *)a4 noCopy:(BOOL)a5
{
  _BOOL4 v5;
  const void *v9;
  int v10;
  void *v11;

  v5 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (self->_db)
  {
    v9 = sqlite3_column_blob(a4, a3);
    v10 = sqlite3_column_bytes(a4, a3);
    v11 = 0;
    if (v9 && v10 >= 1)
    {
      if (v5)
        objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:", v9, v10, 0);
      else
        objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v9, v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v11 = 0;
  }
  return v11;
}

- (id)stringForColumn:(int)a3 inStatment:(sqlite3_stmt *)a4
{
  void *v7;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (self->_db)
  {
    v7 = (void *)sqlite3_column_text(a4, a3);
    if (v7)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v7);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (id)noCopyBlobForColumn:(int)a3 inStatment:(sqlite3_stmt *)a4
{
  return -[GEOSQLiteDB _blobForColumn:inStatment:noCopy:](self, "_blobForColumn:inStatment:noCopy:", *(_QWORD *)&a3, a4, 1);
}

- (id)blobForColumn:(int)a3 inStatment:(sqlite3_stmt *)a4
{
  return -[GEOSQLiteDB _blobForColumn:inStatment:noCopy:](self, "_blobForColumn:inStatment:noCopy:", *(_QWORD *)&a3, a4, 0);
}

uint64_t __59__GEOSQLiteDB_bindTextParameter_toValue_inStatement_error___block_invoke(uint64_t a1, int a2)
{
  return sqlite3_bind_text(*(sqlite3_stmt **)(a1 + 40), a2, (const char *)objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 32)), "cStringUsingEncoding:", 4), -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
}

BOOL __36__GEOSQLiteDB_executeInTransaction___block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t j;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  if (sqlite3_step(a2) != 101)
    return 0;
  if (*(_BYTE *)(a1 + 48))
  {
    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    v3 = *(id *)(*(_QWORD *)(a1 + 32) + 136);
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v28;
      do
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v28 != v6)
            objc_enumerationMutation(v3);
          v8 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * i);
          objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "removeItemAtURL:error:", v8, 0);

        }
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
      }
      while (v5);
    }
  }
  else
  {
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    v3 = *(id *)(*(_QWORD *)(a1 + 32) + 128);
    v10 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v24;
      do
      {
        for (j = 0; j != v11; ++j)
        {
          if (*(_QWORD *)v24 != v12)
            objc_enumerationMutation(v3);
          v14 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * j);
          objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager", (_QWORD)v23);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "removeItemAtURL:error:", v14, 0);

        }
        v11 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
      }
      while (v11);
    }
  }

  v16 = *(_QWORD *)(a1 + 32);
  v17 = *(void **)(v16 + 128);
  *(_QWORD *)(v16 + 128) = 0;

  v18 = *(_QWORD *)(a1 + 32);
  v19 = *(void **)(v18 + 136);
  *(_QWORD *)(v18 + 136) = 0;

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 120) = 0;
  v20 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v21 = *(void **)(v20 + 40);
  *(_QWORD *)(v20 + 40) = 0;

  return *(_BYTE *)(a1 + 48) != 0;
}

uint64_t __36__GEOSQLiteDB_executeInTransaction___block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  int v3;
  const __CFString *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _QWORD v21[6];
  char v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  if (sqlite3_step(a2) != 101)
    return 0;
  v3 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  v4 = CFSTR("_rollback");
  if (v3)
  {
    v3 = objc_msgSend(*(id *)(a1 + 32), "_waitForAllTransactionExternalResources");
    if (v3)
      v4 = CFSTR("_commit");
  }
  v5 = *(void **)(a1 + 32);
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __36__GEOSQLiteDB_executeInTransaction___block_invoke_2;
  v21[3] = &unk_1E1C05628;
  v22 = v3;
  v6 = *(_QWORD *)(a1 + 48);
  v21[4] = v5;
  v21[5] = v6;
  v7 = objc_msgSend(v5, "statementForKey:statementBlock:", v4, v21);
  v8 = *(_QWORD *)(a1 + 32);
  if ((_DWORD)v7)
  {
    v9 = *(void **)(v8 + 144);
    if (v9)
    {
      v19 = 0u;
      v20 = 0u;
      v17 = 0u;
      v18 = 0u;
      v10 = v9;
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v23, 16);
      if (v11)
      {
        v12 = v11;
        v13 = *(_QWORD *)v18;
        do
        {
          v14 = 0;
          do
          {
            if (*(_QWORD *)v18 != v13)
              objc_enumerationMutation(v10);
            (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v14) + 16))(*(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v14));
            ++v14;
          }
          while (v12 != v14);
          v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v23, 16);
        }
        while (v12);
      }

      v8 = *(_QWORD *)(a1 + 32);
    }
  }
  v15 = *(void **)(v8 + 144);
  *(_QWORD *)(v8 + 144) = 0;

  return v7;
}

- (BOOL)_waitForAllTransactionExternalResources
{
  NSObject *externalFilesQueue;
  BOOL v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  char v10;

  while (dispatch_group_wait((dispatch_group_t)self->_externalFilesGroup, 0xFFFFFFFFFFFFFFFFLL))
    ;
  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  externalFilesQueue = self->_externalFilesQueue;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __68__GEOSQLiteDB_ExternalFile___waitForAllTransactionExternalResources__block_invoke;
  v6[3] = &unk_1E1C00760;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(externalFilesQueue, v6);
  v4 = *((_BYTE *)v8 + 24) == 0;
  _Block_object_dispose(&v7, 8);
  return v4;
}

- (BOOL)executeInTransaction:(id)a3
{
  id v4;
  id v5;
  BOOL v6;
  uint64_t v8;
  _QWORD v9[5];
  id v10;
  _QWORD *v11;
  _QWORD v12[5];
  id v13;

  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (!self->_db || self->_isInTransaction)
  {
    v6 = 0;
  }
  else
  {
    self->_isInTransaction = 1;
    v12[0] = 0;
    v12[1] = v12;
    v12[2] = 0x3032000000;
    v12[3] = __Block_byref_object_copy__14;
    v12[4] = __Block_byref_object_dispose__14;
    -[NSURL lastPathComponent](self->_databaseFileURL, "lastPathComponent");
    v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v8 = objc_msgSend(v5, "UTF8String");
    _GEOCreateTransaction();
    v13 = (id)objc_claimAutoreleasedReturnValue();

    if (!-[NSMapTable objectForKey:](self->_preparedStatements, "objectForKey:", CFSTR("_begin"), v8))
    {
      -[GEOSQLiteDB prepareStatement:forKey:](self, "prepareStatement:forKey:", "BEGIN TRANSACTION;", CFSTR("_begin"));
      -[GEOSQLiteDB prepareStatement:forKey:](self, "prepareStatement:forKey:", "COMMIT TRANSACTION;", CFSTR("_commit"));
      -[GEOSQLiteDB prepareStatement:forKey:](self, "prepareStatement:forKey:", "ROLLBACK TRANSACTION;",
        CFSTR("_rollback"));
    }
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __36__GEOSQLiteDB_executeInTransaction___block_invoke;
    v9[3] = &unk_1E1C05650;
    v9[4] = self;
    v10 = v4;
    v11 = v12;
    v6 = -[GEOSQLiteDB statementForKey:statementBlock:](self, "statementForKey:statementBlock:", CFSTR("_begin"), v9);

    _Block_object_dispose(v12, 8);
  }

  return v6;
}

- (BOOL)executeStatement:(id)a3 statementBlock:(id)a4
{
  id v6;
  unsigned int (**v7)(id, id);
  sqlite3_stmt *v8;
  sqlite3_stmt *v9;
  uint64_t v10;
  id v11;
  BOOL v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *log;
  sqlite3 *db;
  NSObject *v18;
  const char *v19;
  id v20;
  uint8_t buf[4];
  int v22;
  __int16 v23;
  const char *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (unsigned int (**)(id, id))a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (!self->_db || (v8 = -[NSMapTable objectForKey:](self->_preparedStatements, "objectForKey:", v6)) == 0)
  {
    v12 = 0;
    goto LABEL_15;
  }
  v9 = v8;
  if (!v7[2](v7, v8))
  {
    v11 = 0;
LABEL_9:
    v12 = 0;
    goto LABEL_10;
  }
  v10 = sqlite3_step(v9);
  if ((_DWORD)v10 != 101)
  {
    v20 = 0;
    -[GEOSQLiteDB reportSQLiteErrorCode:method:error:](self, "reportSQLiteErrorCode:method:error:", v10, CFSTR("step"), &v20);
    v11 = v20;
    goto LABEL_9;
  }
  v11 = 0;
  v12 = 1;
LABEL_10:
  v13 = sqlite3_reset(v9);
  if ((_DWORD)v13)
  {
    v14 = v13;
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
    {
      db = self->_db;
      v18 = log;
      v19 = sqlite3_errmsg(db);
      *(_DWORD *)buf = 67109378;
      v22 = v14;
      v23 = 2082;
      v24 = v19;
      _os_log_error_impl(&dword_1885A9000, v18, OS_LOG_TYPE_ERROR, "reset failure: %d %{public}s", buf, 0x12u);

    }
    -[GEOSQLiteDB _deleteAndReopenDatabaseIfCorrupt:](self, "_deleteAndReopenDatabaseIfCorrupt:", v14);
    v12 = 0;
  }

LABEL_15:
  return v12;
}

- (BOOL)bindTextParameter:(const char *)a3 toValue:(id)a4 inStatement:(sqlite3_stmt *)a5 error:(id *)a6
{
  id v10;
  id v11;
  _QWORD v13[4];
  id v14;
  sqlite3_stmt *v15;

  v10 = a4;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __59__GEOSQLiteDB_bindTextParameter_toValue_inStatement_error___block_invoke;
  v13[3] = &unk_1E1C055A0;
  v14 = v10;
  v15 = a5;
  v11 = v10;
  LOBYTE(a6) = -[GEOSQLiteDB _bindParameter:inStatement:error:withBinder:](self, "_bindParameter:inStatement:error:withBinder:", a3, a5, a6, v13);

  return (char)a6;
}

- (OS_dispatch_queue)isolationQueue
{
  return self->_queue;
}

- (void)executeAsync:(id)a3 errorHandler:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  NSObject *queue;
  id v10;
  id v11;
  _QWORD block[5];
  id v13;
  id v14;

  v6 = a4;
  v7 = (void *)objc_msgSend(a3, "copy");
  v8 = (void *)objc_msgSend(v6, "copy");

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __41__GEOSQLiteDB_executeAsync_errorHandler___block_invoke;
  block[3] = &unk_1E1C05508;
  block[4] = self;
  v13 = v7;
  v14 = v8;
  v10 = v8;
  v11 = v7;
  dispatch_async(queue, block);

}

- (void)executeAsync:(id)a3
{
  -[GEOSQLiteDB executeAsync:errorHandler:](self, "executeAsync:errorHandler:", a3, 0);
}

uint64_t __40__GEOSQLiteDB_executeSync_errorHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_execute:errorHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

uint64_t __68__GEOSQLiteDB_ExternalFile___waitForAllTransactionExternalResources__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 40);
  *(_BYTE *)(*(_QWORD *)(result + 32) + 40) = 0;
  return result;
}

- (sqlite3)sqliteDB
{
  return self->_db;
}

- (void)executeSync:(id)a3 errorHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_queue);
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __40__GEOSQLiteDB_executeSync_errorHandler___block_invoke;
  block[3] = &unk_1E1C05508;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_sync(queue, block);

}

- (void)executeSync:(id)a3
{
  -[GEOSQLiteDB executeSync:errorHandler:](self, "executeSync:errorHandler:", a3, 0);
}

- (sqlite3_stmt)statementForKey:(id)a3
{
  id v4;
  sqlite3_stmt *v5;

  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (self->_db)
    v5 = -[NSMapTable objectForKey:](self->_preparedStatements, "objectForKey:", v4);
  else
    v5 = 0;

  return v5;
}

- (BOOL)prepareStatement:(const char *)a3 forKey:(id)a4
{
  id v6;
  BOOL v7;
  int v8;
  int v9;
  NSObject *log;
  sqlite3 *db;
  NSObject *v13;
  const char *v14;
  sqlite3_stmt *ppStmt;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  const char *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (!self->_db || !objc_msgSend(v6, "length"))
    goto LABEL_8;
  ppStmt = -[NSMapTable objectForKey:](self->_preparedStatements, "objectForKey:", v6);
  if (!ppStmt)
  {
    v8 = sqlite3_prepare_v2(self->_db, a3, -1, &ppStmt, 0);
    if (!v8)
    {
      -[NSMapTable setObject:forKey:](self->_preparedStatements, "setObject:forKey:", ppStmt, v6);
      goto LABEL_4;
    }
    v9 = v8;
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
    {
      db = self->_db;
      v13 = log;
      v14 = sqlite3_errmsg(db);
      *(_DWORD *)buf = 136446722;
      v17 = a3;
      v18 = 1024;
      v19 = v9;
      v20 = 2082;
      v21 = v14;
      _os_log_error_impl(&dword_1885A9000, v13, OS_LOG_TYPE_ERROR, "prepare failure for stmt ('%{public}s') %d %{public}s", buf, 0x1Cu);

    }
LABEL_8:
    v7 = 0;
    goto LABEL_9;
  }
LABEL_4:
  v7 = 1;
LABEL_9:

  return v7;
}

- (NSString)dbFilePath
{
  return -[NSURL path](self->_databaseFileURL, "path");
}

- (BOOL)isDBReady
{
  return self->_db != 0;
}

- (NSDictionary)pragmas
{
  NSDictionary *pragmas;
  NSDictionary *v3;
  int sqliteFlags;
  void *v5;

  pragmas = self->_pragmas;
  if (pragmas)
  {
    v3 = pragmas;
  }
  else
  {
    sqliteFlags = self->_sqliteFlags;
    v5 = (void *)objc_opt_class();
    if ((sqliteFlags & 1) != 0)
      objc_msgSend(v5, "defaultReadOnlyPragmas");
    else
      objc_msgSend(v5, "defaultPragmas");
    v3 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

+ (NSDictionary)defaultPragmas
{
  return (NSDictionary *)&unk_1E1E85AE0;
}

+ (NSDictionary)defaultReadOnlyPragmas
{
  return (NSDictionary *)&unk_1E1E85B08;
}

- (int64_t)user_version
{
  int64_t result;
  sqlite3 *db;
  int64_t v5;

  result = -1;
  v5 = -1;
  db = self->_db;
  if (db)
  {
    sqlite3_exec(db, "PRAGMA user_version", (int (__cdecl *)(void *, int, char **, char **))_getFirstColumnInt64_0, &v5, 0);
    return v5;
  }
  return result;
}

- (void)setUser_version:(int64_t)a3
{
  char __str[40];
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  if (self->_db)
  {
    snprintf(__str, 0x28uLL, "PRAGMA user_version = %lld", a3);
    sqlite3_exec(self->_db, __str, 0, 0, 0);
  }
}

- (int64_t)temporaryStoreMode
{
  int64_t result;
  int64_t v4;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  result = (int64_t)self->_db;
  if (result)
  {
    v4 = 0;
    sqlite3_exec((sqlite3 *)result, "PRAGMA temp_store", (int (__cdecl *)(void *, int, char **, char **))_getFirstColumnInt64_0, &v4, 0);
    return v4;
  }
  return result;
}

- (void)setTemporaryStoreMode:(int64_t)a3
{
  uint8_t __str[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (a3 >= 3)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)__str = 0;
      _os_log_fault_impl(&dword_1885A9000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Assertion failed: temporaryStoreMode <= GEOSQLiteDBTemporaryStoreModeMemory", __str, 2u);
    }
  }
  else if (self->_db)
  {
    snprintf((char *)__str, 0x16uLL, "PRAGMA temp_store = %lld", a3);
    sqlite3_exec(self->_db, (const char *)__str, 0, 0, 0);
  }
}

- (void)performWithTemporaryStoreMode:(int64_t)a3 block:(id)a4
{
  NSObject *queue;
  void (**v7)(_QWORD);
  int64_t v8;

  queue = self->_queue;
  v7 = (void (**)(_QWORD))a4;
  dispatch_assert_queue_V2(queue);
  v8 = -[GEOSQLiteDB temporaryStoreMode](self, "temporaryStoreMode");
  -[GEOSQLiteDB setTemporaryStoreMode:](self, "setTemporaryStoreMode:", a3);
  v7[2](v7);

  -[GEOSQLiteDB setTemporaryStoreMode:](self, "setTemporaryStoreMode:", v8);
}

- (GEOSQLiteDB)init
{
  GEOSQLiteDB *result;

  result = (GEOSQLiteDB *)objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("GEOMethodNotAvailableException"), CFSTR("This method is unavailable."));
  __break(1u);
  return result;
}

- (GEOSQLiteDB)initWithQueueName:(const char *)a3 logFacility:(const char *)a4 dbFilePath:(id)a5 sqliteFlags:(int)a6 pragmas:(id)a7 setupBlock:(id)a8
{
  return -[GEOSQLiteDB initWithQueueName:logFacility:dbFilePath:sqliteFlags:pragmas:setupBlock:tearDownBlock:](self, "initWithQueueName:logFacility:dbFilePath:sqliteFlags:pragmas:setupBlock:tearDownBlock:", a3, a4, a5, *(_QWORD *)&a6, a7, a8, 0);
}

- (GEOSQLiteDB)initWithQueueName:(const char *)a3 logFacility:(const char *)a4 dbFilePath:(id)a5 sqliteFlags:(int)a6 pragmas:(id)a7 setupBlock:(id)a8 tearDownBlock:(id)a9
{
  uint64_t v11;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  GEOSQLiteDB *v21;

  v11 = *(_QWORD *)&a6;
  v15 = a5;
  v16 = a9;
  v17 = a8;
  v18 = a7;
  if ((objc_msgSend(v15, "isEqualToString:", CFSTR(":memory:")) & 1) != 0)
  {
    v19 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v15, 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
  }
  GEOFindOrCreateLog("com.apple.GeoServices", a4);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = -[GEOSQLiteDB initWithQueueName:log:databaseFileURL:sqliteFlags:pragmas:setupBlock:tearDownBlock:](self, "initWithQueueName:log:databaseFileURL:sqliteFlags:pragmas:setupBlock:tearDownBlock:", a3, v20, v19, v11, v18, v17, v16);

  return v21;
}

- (GEOSQLiteDB)initWithQueueName:(const char *)a3 log:(id)a4 databaseFileURL:(id)a5 sqliteFlags:(int)a6 pragmas:(id)a7 setupBlock:(id)a8
{
  return -[GEOSQLiteDB initWithQueueName:log:databaseFileURL:sqliteFlags:pragmas:setupBlock:tearDownBlock:](self, "initWithQueueName:log:databaseFileURL:sqliteFlags:pragmas:setupBlock:tearDownBlock:", a3, a4, a5, *(_QWORD *)&a6, a7, a8, 0);
}

- (GEOSQLiteDB)initWithQueueName:(const char *)a3 log:(id)a4 databaseFileURL:(id)a5 sqliteFlags:(int)a6 pragmas:(id)a7 setupBlock:(id)a8 tearDownBlock:(id)a9
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  GEOSQLiteDB *v21;
  uint64_t v22;
  OS_dispatch_queue *queue;
  id v24;
  uint64_t v25;
  OS_dispatch_queue *externalFilesQueue;
  dispatch_group_t v27;
  OS_dispatch_group *externalFilesGroup;
  uint64_t v29;
  NSDictionary *pragmas;
  uint64_t v31;
  id setupBlock;
  uint64_t v33;
  id tearDownBlock;
  objc_super v36;

  v16 = a4;
  v17 = a5;
  v18 = a7;
  v19 = a8;
  v20 = a9;
  v36.receiver = self;
  v36.super_class = (Class)GEOSQLiteDB;
  v21 = -[GEOSQLiteDB init](&v36, sel_init);
  if (v21)
  {
    v22 = geo_dispatch_queue_create();
    queue = v21->_queue;
    v21->_queue = (OS_dispatch_queue *)v22;

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s.externalFiles"), a3);
    v24 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v24, "UTF8String");
    v25 = geo_dispatch_queue_create();
    externalFilesQueue = v21->_externalFilesQueue;
    v21->_externalFilesQueue = (OS_dispatch_queue *)v25;

    v27 = dispatch_group_create();
    externalFilesGroup = v21->_externalFilesGroup;
    v21->_externalFilesGroup = (OS_dispatch_group *)v27;

    objc_storeStrong((id *)&v21->_log, a4);
    v21->_isTemporaryInMemoryDatabase = v17 == 0;
    objc_storeStrong((id *)&v21->_databaseFileURL, a5);
    if ((a6 & 3) != 0)
    {
      if ((a6 & 1) != 0 && (a6 & 2) != 0)
        a6 &= ~1u;
    }
    else
    {
      a6 |= 2u;
    }
    v21->_sqliteFlags = (2 * a6) & 4 | a6;
    v29 = objc_msgSend(v18, "copy");
    pragmas = v21->_pragmas;
    v21->_pragmas = (NSDictionary *)v29;

    v31 = objc_msgSend(v19, "copy");
    setupBlock = v21->_setupBlock;
    v21->_setupBlock = (id)v31;

    v33 = objc_msgSend(v20, "copy");
    tearDownBlock = v21->_tearDownBlock;
    v21->_tearDownBlock = (id)v33;

  }
  return v21;
}

- (id)description
{
  void *v3;
  void *v4;
  const __CFString *v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@: %p>"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (self->_isTemporaryInMemoryDatabase)
  {
    v5 = CFSTR(" in-memory");
  }
  else
  {
    v5 = CFSTR("'");
    objc_msgSend(v3, "appendString:", CFSTR("'"));
    -[NSURL absoluteURL](self->_databaseFileURL, "absoluteURL");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "path");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appendString:", v7);

  }
  objc_msgSend(v4, "appendString:", v5);
  return v4;
}

- (void)executeFromIsolationQueue:(id)a3
{
  -[GEOSQLiteDB executeFromIsolationQueue:errorHandler:](self, "executeFromIsolationQueue:errorHandler:", a3, 0);
}

- (void)executeFromIsolationQueue:(id)a3 errorHandler:(id)a4
{
  NSObject *queue;
  id v7;
  id v8;

  queue = self->_queue;
  v7 = a4;
  v8 = a3;
  dispatch_assert_queue_V2(queue);
  -[GEOSQLiteDB _execute:errorHandler:](self, "_execute:errorHandler:", v8, v7);

}

- (BOOL)_openAndConfigureWithRetryIfCorrupt
{
  char i;
  uint64_t v4;
  BOOL v5;
  char v6;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  for (i = 0; ; i = 1)
  {
    v4 = -[GEOSQLiteDB _openAndConfigure](self, "_openAndConfigure");
    if (!(_DWORD)v4)
      break;
    v5 = !-[GEOSQLiteDB _deleteAllDatabaseFilesIfCorrupt:](self, "_deleteAllDatabaseFilesIfCorrupt:", v4);
    v6 = i | v5;
    if ((v6 & 1) != 0)
      return !(_DWORD)v4 && v5;
  }
  v5 = 1;
  return !(_DWORD)v4 && v5;
}

- (int)_openAndConfigure
{
  char v3;
  int v4;
  int v5;
  int v6;
  int result;
  NSMapTable *v8;
  NSMapTable *preparedStatements;
  uint64_t (**setupBlock)(id, GEOSQLiteDB *);
  uint8_t v11[16];

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (self->_preparedStatements)
  {
    result = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
    if (result)
    {
      *(_WORD *)v11 = 0;
      _os_log_fault_impl(&dword_1885A9000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Assertion failed: _preparedStatements == nil", v11, 2u);
    }
    __break(1u);
  }
  else
  {
    v3 = 0;
    while (1)
    {
      v4 = -[GEOSQLiteDB _openDatabaseFile](self, "_openDatabaseFile");
      if (v4)
        return v4;
      v5 = -[GEOSQLiteDB _setPragmas](self, "_setPragmas");
      v6 = v5;
      if (v3 & 1 | (v5 != 8))
        break;
      v3 = 1;
      if (!-[GEOSQLiteDB _deleteAllDatabaseFilesIfCorrupt:](self, "_deleteAllDatabaseFilesIfCorrupt:", 8))
        goto LABEL_9;
    }
    if (v5)
    {
LABEL_9:
      -[GEOSQLiteDB _closeDB](self, "_closeDB");
      return v6;
    }
    objc_msgSend(MEMORY[0x1E0CB3748], "mapTableWithKeyOptions:valueOptions:", 0, 258);
    v8 = (NSMapTable *)objc_claimAutoreleasedReturnValue();
    preparedStatements = self->_preparedStatements;
    self->_preparedStatements = v8;

    setupBlock = (uint64_t (**)(id, GEOSQLiteDB *))self->_setupBlock;
    if (!setupBlock || (setupBlock[2](setupBlock, self) & 1) != 0)
      return 0;
    -[GEOSQLiteDB _closeDB](self, "_closeDB");
    return 1;
  }
  return result;
}

- (int)_openDatabaseFile
{
  const char *v3;
  unsigned int v4;
  uint64_t v5;
  NSObject *log;
  int sqliteFlags;
  sqlite3 **p_db;
  uint64_t v9;
  NSObject *v10;
  int v11;
  NSObject *v12;
  NSObject *v13;
  int v15;
  NSURL *databaseFileURL;
  sqlite3 *db;
  NSObject *v18;
  const char *v19;
  int v20;
  void *v21;
  __int16 v22;
  int v23;
  __int16 v24;
  const char *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  if (self->_isTemporaryInMemoryDatabase)
    v3 = ":memory:";
  else
    v3 = -[NSURL fileSystemRepresentation](self->_databaseFileURL, "fileSystemRepresentation");
  v4 = (self->_sqliteFlags & 0x700000) - 0x100000;
  if (v4 < 0x300000)
    v5 = (v4 >> 20) + 1;
  else
    v5 = 0;
  if (+[GEOKeyBagNotification canAccessFilesWithProtection:](GEOKeyBagNotification, "canAccessFilesWithProtection:", v5))
  {
    -[GEOSQLiteDB _createParentDirectory](self, "_createParentDirectory");
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
    {
      sqliteFlags = self->_sqliteFlags;
      v20 = 136315394;
      v21 = (void *)v3;
      v22 = 1024;
      v23 = sqliteFlags;
      _os_log_impl(&dword_1885A9000, log, OS_LOG_TYPE_INFO, "Opening database at %s with flags 0x%x", (uint8_t *)&v20, 0x12u);
    }
    p_db = &self->_db;
    v9 = sqlite3_open_v2(v3, &self->_db, self->_sqliteFlags, 0);
    if ((_DWORD)v9)
    {
      if (!-[GEOSQLiteDB _deleteAllDatabaseFilesIfCorrupt:](self, "_deleteAllDatabaseFilesIfCorrupt:", v9))
        goto LABEL_15;
      v10 = self->_log;
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        v11 = self->_sqliteFlags;
        v20 = 136315394;
        v21 = (void *)v3;
        v22 = 1024;
        v23 = v11;
        _os_log_impl(&dword_1885A9000, v10, OS_LOG_TYPE_INFO, "Re-opening database at %s with flags 0x%x", (uint8_t *)&v20, 0x12u);
      }
      LODWORD(v9) = sqlite3_open_v2(v3, &self->_db, self->_sqliteFlags, 0);
      if ((_DWORD)v9)
      {
LABEL_15:
        v12 = self->_log;
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          databaseFileURL = self->_databaseFileURL;
          db = self->_db;
          v18 = v12;
          v19 = sqlite3_errmsg(db);
          v20 = 138478339;
          v21 = databaseFileURL;
          v22 = 1024;
          v23 = v9;
          v24 = 2082;
          v25 = v19;
          _os_log_error_impl(&dword_1885A9000, v18, OS_LOG_TYPE_ERROR, "Can't open db at %{private}@ (%d : %{public}s)", (uint8_t *)&v20, 0x1Cu);

        }
        if (*p_db)
        {
          sqlite3_close_v2(*p_db);
          *p_db = 0;
        }
      }
    }
  }
  else
  {
    v13 = self->_log;
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v15 = self->_sqliteFlags;
      v20 = 136315394;
      v21 = (void *)v3;
      v22 = 1024;
      v23 = v15;
      _os_log_error_impl(&dword_1885A9000, v13, OS_LOG_TYPE_ERROR, "Refusing to open database at %s with flags 0x%x due to current device lock status", (uint8_t *)&v20, 0x12u);
    }
    LODWORD(v9) = 14;
  }
  return v9;
}

- (void)_createParentDirectory
{
  void *v3;
  void *v4;
  BOOL v5;
  id v6;
  NSObject *log;
  id v8;
  NSObject *v9;
  uint64_t v10;
  id v11;
  uint8_t buf[4];
  uint64_t v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (!self->_isTemporaryInMemoryDatabase)
  {
    -[NSURL URLByDeletingLastPathComponent](self->_databaseFileURL, "URLByDeletingLastPathComponent");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "path");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 0;
    v5 = +[GEOFilePaths createDirectoryCopyingAttributesFromParent:error:](GEOFilePaths, "createDirectoryCopyingAttributesFromParent:error:", v4, &v11);
    v6 = v11;

    if (!v5)
    {
      log = self->_log;
      if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
      {
        v8 = objc_retainAutorelease(v3);
        v9 = log;
        v10 = objc_msgSend(v8, "fileSystemRepresentation");
        *(_DWORD *)buf = 136446466;
        v13 = v10;
        v14 = 2112;
        v15 = v6;
        _os_log_error_impl(&dword_1885A9000, v9, OS_LOG_TYPE_ERROR, "Unable to create parent directory at %{public}s: %@", buf, 0x16u);

      }
    }

  }
}

- (void)_deleteAndReopenDatabaseIfCorrupt:(int)a3
{
  uint64_t v3;
  BOOL v6;
  NSObject *log;
  uint8_t v8[16];

  v3 = *(_QWORD *)&a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v6 = (_DWORD)v3 != 26 && v3 != 11;
  if ((_DWORD)v3 != 8 && !v6)
  {
    if (self->_db)
      -[GEOSQLiteDB _closeDB](self, "_closeDB");
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v8 = 0;
      _os_log_error_impl(&dword_1885A9000, log, OS_LOG_TYPE_ERROR, "Detected database corruption. Will delete database file & re-open.", v8, 2u);
    }
    if (-[GEOSQLiteDB _deleteAllDatabaseFilesIfCorrupt:](self, "_deleteAllDatabaseFilesIfCorrupt:", v3))
      -[GEOSQLiteDB _openAndConfigureWithRetryIfCorrupt](self, "_openAndConfigureWithRetryIfCorrupt");
  }
}

- (BOOL)_deleteAllDatabaseFilesIfCorrupt:(int)a3
{
  BOOL v4;

  v4 = a3 != 26 && a3 != 11;
  return a3 != 8 && !v4 && -[GEOSQLiteDB _deleteAllDBFiles](self, "_deleteAllDBFiles");
}

+ (id)_findAllDBFilesForURL:(id)a3 error:(id *)a4
{
  id v5;
  int v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  id v22;
  id v23;
  id v24;
  uint64_t v25;
  void *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  id v31;
  _BYTE v32[128];
  _QWORD v33[3];

  v33[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v31 = 0;
  v6 = objc_msgSend(v5, "getResourceValue:forKey:error:", &v31, *MEMORY[0x1E0C99AA0], a4);
  v7 = v31;
  v24 = 0;
  if (v6)
  {
    v23 = v5;
    objc_msgSend(v5, "lastPathComponent");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = *MEMORY[0x1E0C99A90];
    v33[0] = *MEMORY[0x1E0C99A90];
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v33, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v7;
    objc_msgSend(v9, "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:", v7, v8, 1, &__block_literal_global_38);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 3);
    v24 = (id)objc_claimAutoreleasedReturnValue();
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v11 = v10;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v28;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v28 != v14)
            objc_enumerationMutation(v11);
          v16 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
          objc_msgSend(v16, "resourceValuesForKeys:error:", v8, a4);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = v17;
          if (v17)
          {
            objc_msgSend(v17, "objectForKeyedSubscript:", v25);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v20 = objc_msgSend(v19, "hasPrefix:", v26);

            if (v20)
              objc_msgSend(v24, "addObject:", v16);
          }

        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
      }
      while (v13);
    }

    v7 = v22;
    v5 = v23;
  }

  return v24;
}

uint64_t __43__GEOSQLiteDB__findAllDBFilesForURL_error___block_invoke()
{
  return 1;
}

- (BOOL)_deleteAllDBFiles
{
  NSObject *log;
  uint8_t v5[16];

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if ((self->_sqliteFlags & 1) == 0)
    return objc_msgSend((id)objc_opt_class(), "deleteAllDBFilesForURL:", self->_databaseFileURL);
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v5 = 0;
    _os_log_error_impl(&dword_1885A9000, log, OS_LOG_TYPE_ERROR, "Refusing to delete db, opened in readonly mode", v5, 2u);
  }
  return 0;
}

+ (BOOL)deleteAllDBFilesFor:(id)a3
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a1) = objc_msgSend(a1, "deleteAllDBFilesForURL:", v4);

  return (char)a1;
}

+ (BOOL)deleteAllDBFilesForURL:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  char v15;
  BOOL v16;
  void *v18;
  id v19;
  id obj;
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  id v26;
  uint8_t v27[128];
  uint8_t buf[4];
  uint64_t v29;
  __int16 v30;
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v26 = 0;
  +[GEOSQLiteDB _findAllDBFilesForURL:error:](GEOSQLiteDB, "_findAllDBFilesForURL:error:", v3, &v26);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v26;
  if (objc_msgSend(v4, "count"))
  {
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    obj = v4;
    v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    if (v6)
    {
      v7 = v6;
      v18 = v4;
      v19 = v3;
      v8 = *(_QWORD *)v23;
      v9 = MEMORY[0x1E0C81028];
      while (2)
      {
        v10 = 0;
        v11 = v5;
        do
        {
          if (*(_QWORD *)v23 != v8)
            objc_enumerationMutation(obj);
          v12 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * v10);
          if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
          {
            v13 = objc_msgSend(objc_retainAutorelease(v12), "fileSystemRepresentation");
            *(_DWORD *)buf = 136315138;
            v29 = v13;
            _os_log_impl(&dword_1885A9000, v9, OS_LOG_TYPE_INFO, "Deleting %s", buf, 0xCu);
          }
          objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager", v18, v19);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = v11;
          v15 = objc_msgSend(v14, "removeItemAtURL:error:", v12, &v21);
          v5 = v21;

          if ((v15 & 1) == 0)
          {
            if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412546;
              v29 = (uint64_t)v12;
              v30 = 2112;
              v31 = v5;
              _os_log_error_impl(&dword_1885A9000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Unable to unlink file at %@: %@", buf, 0x16u);
            }
            v16 = 0;
            goto LABEL_16;
          }
          ++v10;
          v11 = v5;
        }
        while (v7 != v10);
        v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
        if (v7)
          continue;
        break;
      }
      v16 = 1;
LABEL_16:
      v4 = v18;
      v3 = v19;
    }
    else
    {
      v16 = 1;
    }

  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v29 = (uint64_t)v3;
      v30 = 2112;
      v31 = v5;
      _os_log_error_impl(&dword_1885A9000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Unable to find any files for database %@: %@", buf, 0x16u);
    }
    v16 = 1;
  }

  return v16;
}

+ (BOOL)renameAllDBFilesFrom:(id)a3 to:(id)a4
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  BOOL v10;
  BOOL v11;
  void *v12;
  id v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  unint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  char v27;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  id obj;
  uint64_t v34;
  void *v35;
  id v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  id v41;
  uint8_t buf[4];
  void *v43;
  __int16 v44;
  id v45;
  __int16 v46;
  id v47;
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = v6;
  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v6);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  if (v7)
    v10 = v8 == 0;
  else
    v10 = 1;
  if (v10)
  {
    v11 = 0;
  }
  else
  {
    v41 = 0;
    +[GEOSQLiteDB _findAllDBFilesForURL:error:](GEOSQLiteDB, "_findAllDBFilesForURL:error:", v7, &v41);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v41;
    if (objc_msgSend(v12, "count"))
    {
      objc_msgSend(v5, "lastPathComponent");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = 0u;
      v38 = 0u;
      v39 = 0u;
      v40 = 0u;
      obj = v12;
      v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v48, 16);
      if (v15)
      {
        v16 = v15;
        v29 = v12;
        v30 = v9;
        v31 = v7;
        v32 = v5;
        v34 = *(_QWORD *)v38;
        while (2)
        {
          v17 = 0;
          v18 = v13;
          do
          {
            if (*(_QWORD *)v38 != v34)
              objc_enumerationMutation(obj);
            v19 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * v17);
            objc_msgSend(v19, "lastPathComponent", v29, v30, v31, v32);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            v21 = objc_msgSend(v20, "length");
            if (v21 <= objc_msgSend(v14, "length"))
            {
              objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v35);
              v25 = (void *)objc_claimAutoreleasedReturnValue();
            }
            else
            {
              objc_msgSend(v20, "substringFromIndex:", objc_msgSend(v14, "length"));
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              v23 = (void *)MEMORY[0x1E0C99E98];
              objc_msgSend(v35, "stringByAppendingString:", v22);
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v23, "fileURLWithPath:", v24);
              v25 = (void *)objc_claimAutoreleasedReturnValue();

            }
            objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            v36 = v18;
            v27 = objc_msgSend(v26, "moveItemAtURL:toURL:error:", v19, v25, &v36);
            v13 = v36;

            if ((v27 & 1) == 0)
            {
              if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412802;
                v43 = v19;
                v44 = 2112;
                v45 = v25;
                v46 = 2112;
                v47 = v13;
                _os_log_error_impl(&dword_1885A9000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Unable to move file at %@ to %@: %@", buf, 0x20u);
              }

              v11 = 0;
              goto LABEL_23;
            }

            ++v17;
            v18 = v13;
          }
          while (v16 != v17);
          v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v48, 16);
          if (v16)
            continue;
          break;
        }
        v11 = 1;
LABEL_23:
        v7 = v31;
        v5 = v32;
        v12 = v29;
        v9 = v30;
      }
      else
      {
        v11 = 1;
      }

    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v43 = v7;
        v44 = 2112;
        v45 = v13;
        _os_log_error_impl(&dword_1885A9000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Unable to find any files for database %@: %@", buf, 0x16u);
      }
      v11 = 0;
    }

  }
  return v11;
}

+ (BOOL)migrateAllDBFilesFrom:(id)a3 to:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  void *v10;
  int v11;
  char v12;
  BOOL v13;

  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "fileExistsAtPath:", v6);

  if (v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "fileExistsAtPath:", v7);

    if (v11)
      v12 = objc_msgSend(a1, "deleteAllDBFilesFor:", v6);
    else
      v12 = objc_msgSend(a1, "renameAllDBFilesFrom:to:", v6, v7);
    v13 = v12;
  }
  else
  {
    v13 = 1;
  }

  return v13;
}

- (int)_setPragmas
{
  GEOSQLiteDB *v2;
  void *v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  int v9;

  v2 = self;
  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  -[GEOSQLiteDB pragmas](self, "pragmas");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __26__GEOSQLiteDB__setPragmas__block_invoke;
  v5[3] = &unk_1E1C05550;
  v5[4] = v2;
  v5[5] = &v6;
  objc_msgSend(v3, "enumerateKeysAndObjectsUsingBlock:", v5);

  LODWORD(v2) = *((_DWORD *)v7 + 6);
  _Block_object_dispose(&v6, 8);
  return (int)v2;
}

void __26__GEOSQLiteDB__setPragmas__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  sqlite3 *v7;
  id v8;
  int v9;
  uint64_t v10;
  NSObject *v11;
  sqlite3 *v12;
  NSObject *v13;
  uint8_t buf[4];
  id v15;
  __int16 v16;
  int v17;
  __int16 v18;
  const char *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("PRAGMA %@ = %@;"), a2, a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *(sqlite3 **)(*(_QWORD *)(a1 + 32) + 48);
  v8 = objc_retainAutorelease(v6);
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = sqlite3_exec(v7, (const char *)objc_msgSend(v8, "UTF8String"), 0, 0, 0);
  v9 = *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  if (v9)
  {
    v10 = *(_QWORD *)(a1 + 32);
    v11 = *(NSObject **)(v10 + 8);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v12 = *(sqlite3 **)(v10 + 48);
      v13 = v11;
      *(_DWORD *)buf = 138543874;
      v15 = v8;
      v16 = 1024;
      v17 = v9;
      v18 = 2082;
      v19 = sqlite3_errmsg(v12);
      _os_log_error_impl(&dword_1885A9000, v13, OS_LOG_TYPE_ERROR, "'%{public}@' failed: %d %{public}s", buf, 0x1Cu);

    }
    *a4 = 1;
  }

}

- (BOOL)deleteAllDBFiles
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (self->_db)
    -[GEOSQLiteDB _closeDB](self, "_closeDB");
  return -[GEOSQLiteDB _deleteAllDBFiles](self, "_deleteAllDBFiles");
}

- (void)tearDown
{
  atomic_flag *p_didTearDown;
  unsigned __int8 v4;
  id setupBlock;
  void *v6;
  void *v7;
  void (**tearDownBlock)(id, GEOSQLiteDB *);

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  p_didTearDown = &self->_didTearDown;
  do
    v4 = __ldaxr((unsigned __int8 *)p_didTearDown);
  while (__stlxr(1u, (unsigned __int8 *)p_didTearDown));
  if ((v4 & 1) == 0)
  {
    setupBlock = self->_setupBlock;
    self->_setupBlock = 0;

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeObserver:name:object:", self, GEOUnlockSQLiteDBNotificationName, 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "removeObserver:name:object:", self, GEOLockSQLiteDBNotificationName, 0);

    tearDownBlock = (void (**)(id, GEOSQLiteDB *))self->_tearDownBlock;
    if (tearDownBlock)
      tearDownBlock[2](tearDownBlock, self);
    -[GEOSQLiteDB _closeDB](self, "_closeDB");
  }
}

- (void)_closeDB
{
  NSMapTable *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  NSMapTable *preparedStatements;
  sqlite3 *db;
  int v10;
  int v11;
  NSObject *log;
  sqlite3 *v13;
  NSObject *v14;
  const char *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t buf[4];
  int v21;
  __int16 v22;
  const char *v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v3 = self->_preparedStatements;
  v4 = -[NSMapTable countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v17 != v6)
          objc_enumerationMutation(v3);
        sqlite3_finalize((sqlite3_stmt *)-[NSMapTable objectForKey:](self->_preparedStatements, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i), (_QWORD)v16));
      }
      v5 = -[NSMapTable countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
    }
    while (v5);
  }

  preparedStatements = self->_preparedStatements;
  self->_preparedStatements = 0;

  db = self->_db;
  if (db)
  {
    v10 = sqlite3_close(db);
    if (v10)
    {
      v11 = v10;
      log = self->_log;
      if (os_log_type_enabled(log, OS_LOG_TYPE_DEBUG))
      {
        v13 = self->_db;
        v14 = log;
        v15 = sqlite3_errmsg(v13);
        *(_DWORD *)buf = 67109378;
        v21 = v11;
        v22 = 2082;
        v23 = v15;
        _os_log_debug_impl(&dword_1885A9000, v14, OS_LOG_TYPE_DEBUG, "Failed to close db %d %{public}s", buf, 0x12u);

      }
    }
    self->_db = 0;
  }
}

- (void)dealloc
{
  objc_super v2;

  atomic_load((unsigned __int8 *)&self->_didTearDown);
  v2.receiver = self;
  v2.super_class = (Class)GEOSQLiteDB;
  -[GEOSQLiteDB dealloc](&v2, sel_dealloc);
}

- (void)_debug_unlockDB:(id)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __31__GEOSQLiteDB__debug_unlockDB___block_invoke;
  v3[3] = &unk_1E1BFF6F8;
  v3[4] = self;
  -[GEOSQLiteDB executeAsync:](self, "executeAsync:", v3);
}

uint64_t __31__GEOSQLiteDB__debug_unlockDB___block_invoke(uint64_t a1)
{
  int v2;
  uint64_t v3;
  int v4;
  NSObject *v5;
  sqlite3 *v7;
  NSObject *v8;
  _DWORD v9[2];
  __int16 v10;
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v2 = sqlite3_exec(*(sqlite3 **)(*(_QWORD *)(a1 + 32) + 48), "PRAGMA locking_mode = NORMAL;", 0, 0, 0);
  v3 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
    v4 = v2;
    v5 = *(NSObject **)(v3 + 8);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      v7 = *(sqlite3 **)(v3 + 48);
      v8 = v5;
      v9[0] = 67109378;
      v9[1] = v4;
      v10 = 2082;
      v11 = sqlite3_errmsg(v7);
      _os_log_debug_impl(&dword_1885A9000, v8, OS_LOG_TYPE_DEBUG, "set locking_mode failure %d %{public}s", (uint8_t *)v9, 0x12u);

      v3 = *(_QWORD *)(a1 + 32);
    }
  }
  return sqlite3_exec(*(sqlite3 **)(v3 + 48), "SELECT name FROM sqlite_master WHERE type='table';", 0, 0, 0);
}

- (void)_debug_lockDB:(id)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __29__GEOSQLiteDB__debug_lockDB___block_invoke;
  v3[3] = &unk_1E1BFF6F8;
  v3[4] = self;
  -[GEOSQLiteDB executeAsync:](self, "executeAsync:", v3);
}

void __29__GEOSQLiteDB__debug_lockDB___block_invoke(uint64_t a1)
{
  int v2;
  int v3;
  uint64_t v4;
  NSObject *v5;
  sqlite3 *v6;
  NSObject *v7;
  _DWORD v8[2];
  __int16 v9;
  const char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v2 = sqlite3_exec(*(sqlite3 **)(*(_QWORD *)(a1 + 32) + 48), "PRAGMA locking_mode = EXCLUSIVE;", 0, 0, 0);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(NSObject **)(v4 + 8);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      v6 = *(sqlite3 **)(v4 + 48);
      v7 = v5;
      v8[0] = 67109378;
      v8[1] = v3;
      v9 = 2082;
      v10 = sqlite3_errmsg(v6);
      _os_log_debug_impl(&dword_1885A9000, v7, OS_LOG_TYPE_DEBUG, "set locking_mode failure %d %{public}s", (uint8_t *)v8, 0x12u);

    }
  }
}

- (BOOL)registerVirtualTable:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  sqlite3 *db;
  id v8;
  NSObject *log;
  BOOL v10;
  void *v11;
  void *v12;
  void *v13;
  sqlite3 *v14;
  id v15;
  int v16;
  int v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  sqlite3 *v22;
  id v23;
  int v24;
  int v25;
  NSObject *v26;
  sqlite3 *v27;
  NSObject *v28;
  const char *v29;
  NSMapTable *virtualTables;
  NSMapTable *v31;
  NSMapTable *v32;
  NSObject *v34;
  void *v35;
  const char *v36;
  sqlite3 *v37;
  NSObject *v38;
  uint8_t buf[4];
  _BYTE v40[18];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (self->_db)
  {
    objc_msgSend(v4, "name");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringByAppendingString:", CFSTR("_module_"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    db = self->_db;
    v8 = objc_retainAutorelease(v6);
    if (sqlite3_create_module(db, (const char *)objc_msgSend(v8, "UTF8String"), (const sqlite3_module *)objc_msgSend(v4, "module"), v4))
    {
      log = self->_log;
      if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
      {
        v34 = log;
        objc_msgSend(v4, "name");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = sqlite3_errmsg(self->_db);
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)v40 = v35;
        *(_WORD *)&v40[8] = 2082;
        *(_QWORD *)&v40[10] = v36;
        _os_log_error_impl(&dword_1885A9000, v34, OS_LOG_TYPE_ERROR, "Error registering module for virtual table: %{public}@. %{public}s", buf, 0x16u);

      }
      v10 = 0;
    }
    else
    {
      v11 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v4, "name");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "stringWithFormat:", CFSTR("DROP TABLE IF EXISTS %@;"), v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      v14 = self->_db;
      v15 = objc_retainAutorelease(v13);
      v16 = sqlite3_exec(v14, (const char *)objc_msgSend(v15, "UTF8String"), 0, 0, 0);
      if (v16)
      {
        v17 = v16;
        v18 = self->_log;
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        {
          v37 = self->_db;
          v38 = v18;
          *(_DWORD *)buf = 67109378;
          *(_DWORD *)v40 = v17;
          *(_WORD *)&v40[4] = 2082;
          *(_QWORD *)&v40[6] = sqlite3_errmsg(v37);
          _os_log_error_impl(&dword_1885A9000, v38, OS_LOG_TYPE_ERROR, "table drop failure: %d %{public}s", buf, 0x12u);

        }
      }
      v19 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v4, "name");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "stringWithFormat:", CFSTR("CREATE VIRTUAL TABLE %@ USING %@;"), v20, v8);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      v22 = self->_db;
      v23 = objc_retainAutorelease(v21);
      v24 = sqlite3_exec(v22, (const char *)objc_msgSend(v23, "UTF8String"), 0, 0, 0);
      v10 = v24 == 0;
      if (v24)
      {
        v25 = v24;
        v26 = self->_log;
        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
        {
          v27 = self->_db;
          v28 = v26;
          v29 = sqlite3_errmsg(v27);
          *(_DWORD *)buf = 67109378;
          *(_DWORD *)v40 = v25;
          *(_WORD *)&v40[4] = 2082;
          *(_QWORD *)&v40[6] = v29;
          _os_log_error_impl(&dword_1885A9000, v28, OS_LOG_TYPE_ERROR, "table create failure: %d %{public}s", buf, 0x12u);

        }
      }
      else
      {
        virtualTables = self->_virtualTables;
        if (!virtualTables)
        {
          objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
          v31 = (NSMapTable *)objc_claimAutoreleasedReturnValue();
          v32 = self->_virtualTables;
          self->_virtualTables = v31;

          virtualTables = self->_virtualTables;
        }
        -[NSMapTable setObject:forKey:](virtualTables, "setObject:forKey:", v8, v4);
      }

    }
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (BOOL)unregisterVirtualTable:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  sqlite3 *db;
  id v9;
  int v10;
  BOOL v11;
  int v12;
  NSObject *log;
  sqlite3 *v15;
  NSObject *v16;
  uint8_t buf[4];
  int v18;
  __int16 v19;
  const char *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (self->_db)
  {
    -[NSMapTable removeObjectForKey:](self->_virtualTables, "removeObjectForKey:", v4);
    v5 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v4, "name");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringWithFormat:", CFSTR("DROP TABLE IF EXISTS %@;"), v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    db = self->_db;
    v9 = objc_retainAutorelease(v7);
    v10 = sqlite3_exec(db, (const char *)objc_msgSend(v9, "UTF8String"), 0, 0, 0);
    v11 = v10 == 0;
    if (v10)
    {
      v12 = v10;
      log = self->_log;
      if (os_log_type_enabled(log, OS_LOG_TYPE_DEBUG))
      {
        v15 = self->_db;
        v16 = log;
        *(_DWORD *)buf = 67109378;
        v18 = v12;
        v19 = 2082;
        v20 = sqlite3_errmsg(v15);
        _os_log_debug_impl(&dword_1885A9000, v16, OS_LOG_TYPE_DEBUG, "drop failure: %d %{public}s", buf, 0x12u);

      }
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (BOOL)createTable:(const char *)a3 withDrop:(const char *)a4
{
  sqlite3 *db;
  int v8;
  int v9;
  NSObject *log;
  int v11;
  int v12;
  NSObject *v13;
  sqlite3 *v14;
  NSObject *v15;
  const char *v16;
  sqlite3 *v17;
  NSObject *v18;
  int v20;
  int v21;
  __int16 v22;
  const char *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  db = self->_db;
  if (db)
  {
    if (a4)
    {
      v8 = sqlite3_exec(db, a4, 0, 0, 0);
      if (v8)
      {
        v9 = v8;
        log = self->_log;
        if (os_log_type_enabled(log, OS_LOG_TYPE_DEBUG))
        {
          v17 = self->_db;
          v18 = log;
          v20 = 67109378;
          v21 = v9;
          v22 = 2082;
          v23 = sqlite3_errmsg(v17);
          _os_log_debug_impl(&dword_1885A9000, v18, OS_LOG_TYPE_DEBUG, "drop before create failure: %d %{public}s", (uint8_t *)&v20, 0x12u);

        }
      }
    }
    v11 = sqlite3_exec(self->_db, a3, 0, 0, 0);
    if (v11)
    {
      v12 = v11;
      v13 = self->_log;
      LODWORD(db) = os_log_type_enabled(v13, OS_LOG_TYPE_ERROR);
      if ((_DWORD)db)
      {
        v14 = self->_db;
        v15 = v13;
        v16 = sqlite3_errmsg(v14);
        v20 = 67109378;
        v21 = v12;
        v22 = 2082;
        v23 = v16;
        _os_log_error_impl(&dword_1885A9000, v15, OS_LOG_TYPE_ERROR, "table create failure: %d %{public}s", (uint8_t *)&v20, 0x12u);

        LOBYTE(db) = 0;
      }
    }
    else
    {
      LOBYTE(db) = 1;
    }
  }
  return (char)db;
}

- (BOOL)createIndex:(const char *)a3
{
  return -[GEOSQLiteDB createTable:withDrop:](self, "createTable:withDrop:", a3, 0);
}

- (id)getAllTables
{
  return -[GEOSQLiteDB getTablesLike:](self, "getTablesLike:", &stru_1E1C241D0);
}

- (id)getTablesLike:(id)a3
{
  id v4;
  void *v5;
  __CFString *v6;
  sqlite3 *db;
  __CFString *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  sqlite3_stmt *ppStmt;

  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  ppStmt = 0;
  if (objc_msgSend(v4, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("SELECT name FROM sqlite_master WHERE type='table' AND (name LIKE '%@');"),
      v4);
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = CFSTR("SELECT name FROM sqlite_master WHERE type='table';");
  }
  db = self->_db;
  v8 = objc_retainAutorelease(v6);
  v9 = sqlite3_prepare_v2(db, (const char *)-[__CFString UTF8String](v8, "UTF8String"), -1, &ppStmt, 0);
  if ((_DWORD)v9)
  {
    -[GEOSQLiteDB reportSQLiteErrorCode:method:error:](self, "reportSQLiteErrorCode:method:error:", v9, CFSTR("getTablesLike:"), 0);
LABEL_12:
    sqlite3_finalize(ppStmt);
    v12 = 0;
    goto LABEL_13;
  }
  v10 = sqlite3_step(ppStmt);
  while ((_DWORD)v10 == 100)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", sqlite3_column_text(ppStmt, 0));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v11);
    v10 = sqlite3_step(ppStmt);

  }
  if ((_DWORD)v10 != 101)
  {
    -[GEOSQLiteDB reportSQLiteErrorCode:method:error:](self, "reportSQLiteErrorCode:method:error:", v10, CFSTR("getTablesLike:"), 0);
    objc_msgSend(v5, "removeAllObjects");
    goto LABEL_12;
  }
  sqlite3_finalize(ppStmt);
  v12 = (void *)objc_msgSend(v5, "copy");
LABEL_13:

  return v12;
}

- (BOOL)dropAllTables
{
  _BOOL4 v3;

  if (-[GEOSQLiteDB dropTablesLike:](self, "dropTablesLike:", &stru_1E1C241D0))
  {
    LOBYTE(v3) = 1;
  }
  else
  {
    v3 = -[GEOSQLiteDB deleteAllDBFiles](self, "deleteAllDBFiles");
    if (v3)
      LOBYTE(v3) = -[GEOSQLiteDB _openAndConfigure](self, "_openAndConfigure") == 0;
  }
  return v3;
}

- (BOOL)dropTablesLike:(id)a3
{
  id v4;
  void *v5;
  BOOL v6;
  _QWORD v8[4];
  id v9;
  GEOSQLiteDB *v10;

  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (self->_db)
  {
    -[GEOSQLiteDB getTablesLike:](self, "getTablesLike:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "count"))
    {
      v8[0] = MEMORY[0x1E0C809B0];
      v8[1] = 3221225472;
      v8[2] = __30__GEOSQLiteDB_dropTablesLike___block_invoke;
      v8[3] = &unk_1E1C05578;
      v9 = v5;
      v10 = self;
      v6 = -[GEOSQLiteDB executeInTransaction:](self, "executeInTransaction:", v8);

    }
    else
    {
      v6 = v5 != 0;
    }

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

uint64_t __30__GEOSQLiteDB_dropTablesLike___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  sqlite3 *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v14;
    while (2)
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v14 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("DROP TABLE %@;"),
          *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v6));
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = *(sqlite3 **)(*(_QWORD *)(a1 + 40) + 48);
        v9 = objc_retainAutorelease(v7);
        v10 = sqlite3_exec(v8, (const char *)objc_msgSend(v9, "UTF8String"), 0, 0, 0);
        if ((_DWORD)v10)
        {
          objc_msgSend(*(id *)(a1 + 40), "reportSQLiteErrorCode:method:error:", v10, CFSTR("dropTablesLike:"), 0);

          v11 = 0;
          goto LABEL_11;
        }

        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v4)
        continue;
      break;
    }
  }
  v11 = 1;
LABEL_11:

  return v11;
}

- (void)clearStatement:(id)a3
{
  sqlite3_stmt *v4;
  sqlite3_stmt *v5;
  id v6;

  v6 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (self->_db)
  {
    v4 = -[NSMapTable objectForKey:](self->_preparedStatements, "objectForKey:", v6);
    if (v4)
    {
      v5 = v4;
      -[NSMapTable removeObjectForKey:](self->_preparedStatements, "removeObjectForKey:", v6);
      sqlite3_finalize(v5);
    }
  }

}

- (BOOL)bindBlobParameter:(const char *)a3 toValue:(id)a4 inStatement:(sqlite3_stmt *)a5 error:(id *)a6
{
  id v10;
  id v11;
  _QWORD v13[4];
  id v14;
  sqlite3_stmt *v15;

  v10 = a4;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __59__GEOSQLiteDB_bindBlobParameter_toValue_inStatement_error___block_invoke;
  v13[3] = &unk_1E1C055A0;
  v14 = v10;
  v15 = a5;
  v11 = v10;
  LOBYTE(a6) = -[GEOSQLiteDB _bindParameter:inStatement:error:withBinder:](self, "_bindParameter:inStatement:error:withBinder:", a3, a5, a6, v13);

  return (char)a6;
}

uint64_t __59__GEOSQLiteDB_bindBlobParameter_toValue_inStatement_error___block_invoke(uint64_t a1, int a2)
{
  void *v3;

  v3 = *(void **)(a1 + 32);
  if (v3)
    return sqlite3_bind_blob(*(sqlite3_stmt **)(a1 + 40), a2, (const void *)objc_msgSend(objc_retainAutorelease(v3), "bytes"), objc_msgSend(*(id *)(a1 + 32), "length"), (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
  else
    return sqlite3_bind_null(*(sqlite3_stmt **)(a1 + 40), a2);
}

- (BOOL)bindBlobNoCopyParameter:(const char *)a3 toValue:(id)a4 inStatement:(sqlite3_stmt *)a5 error:(id *)a6
{
  id v10;
  id v11;
  _QWORD v13[4];
  id v14;
  sqlite3_stmt *v15;

  v10 = a4;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __65__GEOSQLiteDB_bindBlobNoCopyParameter_toValue_inStatement_error___block_invoke;
  v13[3] = &unk_1E1C055A0;
  v14 = v10;
  v15 = a5;
  v11 = v10;
  LOBYTE(a6) = -[GEOSQLiteDB _bindParameter:inStatement:error:withBinder:](self, "_bindParameter:inStatement:error:withBinder:", a3, a5, a6, v13);

  return (char)a6;
}

uint64_t __65__GEOSQLiteDB_bindBlobNoCopyParameter_toValue_inStatement_error___block_invoke(uint64_t a1, int a2)
{
  void *v3;

  v3 = *(void **)(a1 + 32);
  if (v3)
    return sqlite3_bind_blob(*(sqlite3_stmt **)(a1 + 40), a2, (const void *)objc_msgSend(objc_retainAutorelease(v3), "bytes"), objc_msgSend(*(id *)(a1 + 32), "length"), 0);
  else
    return sqlite3_bind_null(*(sqlite3_stmt **)(a1 + 40), a2);
}

- (BOOL)bindZeroBlobParameter:(const char *)a3 length:(unint64_t)a4 inStatement:(sqlite3_stmt *)a5 error:(id *)a6
{
  _QWORD v7[6];

  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __62__GEOSQLiteDB_bindZeroBlobParameter_length_inStatement_error___block_invoke;
  v7[3] = &__block_descriptor_48_e8_i12__0i8l;
  v7[4] = a5;
  v7[5] = a4;
  return -[GEOSQLiteDB _bindParameter:inStatement:error:withBinder:](self, "_bindParameter:inStatement:error:withBinder:", a3, a5, a6, v7);
}

uint64_t __62__GEOSQLiteDB_bindZeroBlobParameter_length_inStatement_error___block_invoke(uint64_t a1, int a2)
{
  return sqlite3_bind_zeroblob64(*(sqlite3_stmt **)(a1 + 32), a2, *(_QWORD *)(a1 + 40));
}

- (BOOL)bindNullParameter:(const char *)a3 inStatement:(sqlite3_stmt *)a4 error:(id *)a5
{
  _QWORD v6[5];

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __51__GEOSQLiteDB_bindNullParameter_inStatement_error___block_invoke;
  v6[3] = &__block_descriptor_40_e8_i12__0i8l;
  v6[4] = a4;
  return -[GEOSQLiteDB _bindParameter:inStatement:error:withBinder:](self, "_bindParameter:inStatement:error:withBinder:", a3, a4, a5, v6);
}

uint64_t __51__GEOSQLiteDB_bindNullParameter_inStatement_error___block_invoke(uint64_t a1, int a2)
{
  return sqlite3_bind_null(*(sqlite3_stmt **)(a1 + 32), a2);
}

- (BOOL)bindRealParameter:(const char *)a3 toValue:(double)a4 inStatement:(sqlite3_stmt *)a5 error:(id *)a6
{
  _QWORD v7[6];

  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __59__GEOSQLiteDB_bindRealParameter_toValue_inStatement_error___block_invoke;
  v7[3] = &__block_descriptor_48_e8_i12__0i8l;
  v7[4] = a5;
  *(double *)&v7[5] = a4;
  return -[GEOSQLiteDB _bindParameter:inStatement:error:withBinder:](self, "_bindParameter:inStatement:error:withBinder:", a3, a5, a6, v7);
}

uint64_t __59__GEOSQLiteDB_bindRealParameter_toValue_inStatement_error___block_invoke(uint64_t a1, int a2)
{
  return sqlite3_bind_double(*(sqlite3_stmt **)(a1 + 32), a2, *(double *)(a1 + 40));
}

- (BOOL)executeStatement:(sqlite3_stmt *)a3 error:(id *)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *log;
  sqlite3 *db;
  NSObject *v13;
  _DWORD v14[2];
  __int16 v15;
  const char *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (!self->_db)
    return 0;
  v7 = sqlite3_step(a3);
  if ((_DWORD)v7 != 101)
  {
    -[GEOSQLiteDB reportSQLiteErrorCode:method:error:](self, "reportSQLiteErrorCode:method:error:", v7, CFSTR("step"), a4);
    return 0;
  }
  v8 = sqlite3_reset(a3);
  if ((_DWORD)v8)
  {
    v9 = v8;
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
    {
      db = self->_db;
      v13 = log;
      v14[0] = 67109378;
      v14[1] = v9;
      v15 = 2082;
      v16 = sqlite3_errmsg(db);
      _os_log_error_impl(&dword_1885A9000, v13, OS_LOG_TYPE_ERROR, "reset failure: %d %{public}s", (uint8_t *)v14, 0x12u);

    }
    -[GEOSQLiteDB _deleteAndReopenDatabaseIfCorrupt:](self, "_deleteAndReopenDatabaseIfCorrupt:", v9);
    return 0;
  }
  return 1;
}

- (BOOL)vacuum
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (!self->_db)
    return 0;
  if (!-[NSMapTable objectForKey:](self->_preparedStatements, "objectForKey:", CFSTR("_vacuum")))
    -[GEOSQLiteDB prepareStatement:forKey:](self, "prepareStatement:forKey:", "VACUUM", CFSTR("_vacuum"));
  return -[GEOSQLiteDB executeStatement:statementBlock:](self, "executeStatement:statementBlock:", CFSTR("_vacuum"), &__block_literal_global_112);
}

uint64_t __21__GEOSQLiteDB_vacuum__block_invoke()
{
  return 1;
}

- (BOOL)ensureInTransaction:(id)a3
{
  uint64_t (**v4)(_QWORD);
  char v5;
  BOOL v6;

  v4 = (uint64_t (**)(_QWORD))a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (self->_db)
  {
    if (self->_isInTransaction)
      v5 = v4[2](v4);
    else
      v5 = -[GEOSQLiteDB executeInTransaction:](self, "executeInTransaction:", v4);
    v6 = v5;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)addTransactionPostCommitAction:(id)a3
{
  NSMutableArray *currentTransactionPostCommitActions;
  NSMutableArray *v5;
  NSMutableArray *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (self->_db && self->_isInTransaction)
  {
    currentTransactionPostCommitActions = self->_currentTransactionPostCommitActions;
    if (!currentTransactionPostCommitActions)
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v5 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
      v6 = self->_currentTransactionPostCommitActions;
      self->_currentTransactionPostCommitActions = v5;

      currentTransactionPostCommitActions = self->_currentTransactionPostCommitActions;
    }
    v7 = (void *)objc_msgSend(v9, "copy");
    v8 = (void *)MEMORY[0x18D765024]();
    -[NSMutableArray addObject:](currentTransactionPostCommitActions, "addObject:", v8);

  }
}

- (double)doubleForColumn:(int)a3 inStatment:(sqlite3_stmt *)a4
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (self->_db)
    return sqlite3_column_double(a4, a3);
  else
    return 0.0;
}

- (BOOL)reportSQLiteErrorCode:(int)a3 method:(id)a4 error:(id *)a5
{
  uint64_t v6;
  id v8;
  sqlite3 *db;
  const char *v10;
  NSObject *log;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  NSError *v17;
  NSError *lastError;
  sqlite3 *v20;
  NSObject *v21;
  _QWORD v22[4];
  _QWORD v23[4];
  uint8_t buf[4];
  id v25;
  __int16 v26;
  const char *v27;
  __int16 v28;
  int v29;
  uint64_t v30;

  v6 = *(_QWORD *)&a3;
  v30 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  db = self->_db;
  if (db)
  {
    v10 = sqlite3_errmsg(db);
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
    {
      v20 = self->_db;
      v21 = log;
      *(_DWORD *)buf = 138412802;
      v25 = v8;
      v26 = 2080;
      v27 = v10;
      v28 = 1024;
      v29 = sqlite3_extended_errcode(v20);
      _os_log_error_impl(&dword_1885A9000, v21, OS_LOG_TYPE_ERROR, "%@ failure: %s (%d)", buf, 0x1Cu);

    }
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v10, 4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ failure: %s"), v8, v10);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (id)*MEMORY[0x1E0C9AFA8];
    v22[0] = v14;
    v22[1] = CFSTR("method");
    v23[0] = v13;
    v23[1] = v8;
    v22[2] = CFSTR("returnCode");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v6);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v22[3] = CFSTR("returnMessage");
    v23[2] = v15;
    v23[3] = v12;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, v22, 4);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB35C8], "GEOErrorWithCode:userInfo:", -17, v16);
    v17 = (NSError *)objc_claimAutoreleasedReturnValue();
    lastError = self->_lastError;
    self->_lastError = v17;

    if (a5)
      *a5 = objc_retainAutorelease(self->_lastError);

  }
  return 0;
}

- (BOOL)writeExternalResourceWithData:(id)a3 toURL:(id)a4 error:(id *)a5
{
  NSObject *queue;
  id v9;
  id v10;
  NSMutableArray *filesAddedDuringTransaction;
  NSMutableArray *v12;
  NSMutableArray *v13;
  char v14;
  unsigned int v15;
  unint64_t v16;

  queue = self->_queue;
  v9 = a4;
  v10 = a3;
  dispatch_assert_queue_V2(queue);
  if (self->_isInTransaction)
  {
    filesAddedDuringTransaction = self->_filesAddedDuringTransaction;
    if (!filesAddedDuringTransaction)
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v12 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
      v13 = self->_filesAddedDuringTransaction;
      self->_filesAddedDuringTransaction = v12;

      filesAddedDuringTransaction = self->_filesAddedDuringTransaction;
    }
    -[NSMutableArray addObject:](filesAddedDuringTransaction, "addObject:", v9);
    -[GEOSQLiteDB _writeTransactionExternalResourceWithData:toURL:](self, "_writeTransactionExternalResourceWithData:toURL:", v10, v9);
    v14 = 1;
  }
  else
  {
    v15 = (-[GEOSQLiteDB sqliteFlags](self, "sqliteFlags") & 0x700000) - 0x100000;
    if (v15 >= 0x300000)
      v16 = 0;
    else
      v16 = ((unint64_t)(v15 >> 20) << 28) + 0x20000000;
    v14 = objc_msgSend(v10, "writeToURL:options:error:", v9, v16, a5);
  }

  return v14;
}

- (BOOL)moveExternalResourceAtURL:(id)a3 toURL:(id)a4 error:(id *)a5
{
  NSObject *queue;
  id v8;
  id v9;
  NSMutableArray *filesAddedDuringTransaction;
  NSMutableArray *v11;
  NSMutableArray *v12;
  void *v13;
  char v14;

  queue = self->_queue;
  v8 = a4;
  v9 = a3;
  dispatch_assert_queue_V2(queue);
  if (self->_isInTransaction)
  {
    filesAddedDuringTransaction = self->_filesAddedDuringTransaction;
    if (!filesAddedDuringTransaction)
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v11 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
      v12 = self->_filesAddedDuringTransaction;
      self->_filesAddedDuringTransaction = v11;

      filesAddedDuringTransaction = self->_filesAddedDuringTransaction;
    }
    -[NSMutableArray addObject:](filesAddedDuringTransaction, "addObject:", v8);
  }
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "moveItemAtURL:toURL:error:", v9, v8, 0);

  return v14;
}

- (BOOL)deleteExternalResourceAtURL:(id)a3 error:(id *)a4
{
  id v6;
  NSMutableArray *filesDeletedDuringTransaction;
  NSMutableArray *v8;
  NSMutableArray *v9;
  char v10;
  void *v11;

  v6 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (self->_isInTransaction)
  {
    filesDeletedDuringTransaction = self->_filesDeletedDuringTransaction;
    if (!filesDeletedDuringTransaction)
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v8 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
      v9 = self->_filesDeletedDuringTransaction;
      self->_filesDeletedDuringTransaction = v8;

      filesDeletedDuringTransaction = self->_filesDeletedDuringTransaction;
    }
    -[NSMutableArray addObject:](filesDeletedDuringTransaction, "addObject:", v6);
    v10 = 1;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v11, "removeItemAtURL:error:", v6, a4);

  }
  return v10;
}

- (int64_t)lastInsertRowID
{
  return sqlite3_last_insert_rowid(-[GEOSQLiteDB sqliteDB](self, "sqliteDB"));
}

- (BOOL)writeBlobData:(id)a3 toTable:(const char *)a4 column:(const char *)a5 rowID:(int64_t)a6 error:(id *)a7
{
  id v12;
  uint64_t v13;
  BOOL v14;
  uint64_t v15;
  _QWORD v17[8];
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  char v21;
  sqlite3_blob *ppBlob;

  v12 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  ppBlob = 0;
  v13 = sqlite3_blob_open(-[GEOSQLiteDB sqliteDB](self, "sqliteDB"), "main", a4, a5, a6, 1, &ppBlob);
  if ((_DWORD)v13)
  {
    -[GEOSQLiteDB reportSQLiteErrorCode:method:error:](self, "reportSQLiteErrorCode:method:error:", v13, CFSTR("blob_open"), a7);
    v14 = 0;
  }
  else
  {
    v18 = 0;
    v19 = &v18;
    v20 = 0x2020000000;
    v21 = 1;
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __56__GEOSQLiteDB_writeBlobData_toTable_column_rowID_error___block_invoke;
    v17[3] = &unk_1E1C05678;
    v17[6] = ppBlob;
    v17[7] = a7;
    v17[4] = self;
    v17[5] = &v18;
    objc_msgSend(v12, "enumerateByteRangesUsingBlock:", v17);
    v15 = sqlite3_blob_close(ppBlob);
    v14 = *((_BYTE *)v19 + 24) != 0;
    if (*((_BYTE *)v19 + 24) && (_DWORD)v15)
    {
      -[GEOSQLiteDB reportSQLiteErrorCode:method:error:](self, "reportSQLiteErrorCode:method:error:", v15, CFSTR("blob_close"), a7);
      v14 = 0;
    }
    _Block_object_dispose(&v18, 8);
  }

  return v14;
}

uint64_t __56__GEOSQLiteDB_writeBlobData_toTable_column_rowID_error___block_invoke(uint64_t a1, const void *a2, int iOffset, int n, _BYTE *a5)
{
  uint64_t result;

  result = sqlite3_blob_write(*(sqlite3_blob **)(a1 + 48), a2, n, iOffset);
  if ((_DWORD)result)
  {
    result = objc_msgSend(*(id *)(a1 + 32), "reportSQLiteErrorCode:method:error:", result, CFSTR("blob_write"), *(_QWORD *)(a1 + 56));
    *a5 = 1;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
  }
  return result;
}

- (NSURL)databaseFileURL
{
  return self->_databaseFileURL;
}

- (int)sqliteFlags
{
  return self->_sqliteFlags;
}

- (NSError)lastError
{
  return self->_lastError;
}

- (OS_os_log)log
{
  return self->_log;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_virtualTables, 0);
  objc_storeStrong((id *)&self->_currentTransactionPostCommitActions, 0);
  objc_storeStrong((id *)&self->_filesDeletedDuringTransaction, 0);
  objc_storeStrong((id *)&self->_filesAddedDuringTransaction, 0);
  objc_storeStrong((id *)&self->_preparedStatements, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong(&self->_tearDownBlock, 0);
  objc_storeStrong(&self->_setupBlock, 0);
  objc_storeStrong((id *)&self->_pragmas, 0);
  objc_storeStrong((id *)&self->_databaseFileURL, 0);
  objc_storeStrong((id *)&self->_lastError, 0);
  objc_storeStrong((id *)&self->_externalFilesActiveChannels, 0);
  objc_storeStrong((id *)&self->_externalFilesGroup, 0);
  objc_storeStrong((id *)&self->_externalFilesQueue, 0);
  objc_storeStrong((id *)&self->_log, 0);
}

- (BOOL)bindUUIDParameter:(const char *)a3 toValue:(id)a4 inStatement:(sqlite3_stmt *)a5 error:(id *)a6
{
  id v10;
  id v11;
  BOOL v12;

  v10 = a4;
  if (v10)
  {
    objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithLength:", 16);
    v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v10, "getUUIDBytes:", objc_msgSend(v11, "mutableBytes"));
    v12 = -[GEOSQLiteDB bindBlobParameter:toValue:inStatement:error:](self, "bindBlobParameter:toValue:inStatement:error:", a3, v11, a5, a6);

  }
  else
  {
    v12 = -[GEOSQLiteDB bindBlobParameter:toValue:inStatement:error:](self, "bindBlobParameter:toValue:inStatement:error:", a3, 0, a5, a6);
  }

  return v12;
}

- (void)_writeTransactionExternalResourceWithData:(id)a3 toURL:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  const char *v10;
  uint64_t v11;
  NSObject *externalFilesQueue;
  dispatch_io_t v13;
  uint64_t v14;
  id *v15;
  unsigned int v16;
  id *v17;
  id v18;
  NSObject *v19;
  NSObject *v20;
  NSObject *v21;
  NSObject *v22;
  NSObject *v23;
  NSObject *log;
  _QWORD v25[5];
  dispatch_io_t v26;
  _QWORD block[5];
  NSObject *v28;
  _QWORD barrier[4];
  dispatch_io_t v30;
  id v31;
  id v32;
  GEOSQLiteDB *v33;
  uint8_t buf[16];
  _QWORD v35[5];
  _QWORD cleanup_handler[5];

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v6 && v7)
  {
    dispatch_group_enter((dispatch_group_t)self->_externalFilesGroup);
    v9 = objc_retainAutorelease(v8);
    v10 = (const char *)objc_msgSend(v9, "fileSystemRepresentation");
    v11 = MEMORY[0x1E0C809B0];
    externalFilesQueue = self->_externalFilesQueue;
    cleanup_handler[0] = MEMORY[0x1E0C809B0];
    cleanup_handler[1] = 3221225472;
    cleanup_handler[2] = __77__GEOSQLiteDB_ExternalFile___writeTransactionExternalResourceWithData_toURL___block_invoke;
    cleanup_handler[3] = &unk_1E1C0A260;
    cleanup_handler[4] = self;
    v13 = dispatch_io_create_with_path(1uLL, v10, 2561, 0x1A0u, externalFilesQueue, cleanup_handler);
    if (v13)
    {
      v14 = -[GEOSQLiteDB sqliteFlags](self, "sqliteFlags");
      v15 = (id *)MEMORY[0x1E0C99940];
      v16 = ((v14 & 0x700000) - 0x100000) >> 20;
      v17 = (id *)MEMORY[0x1E0C99940];
      if (v16 <= 2)
        v17 = (id *)qword_1E1C21D68[v16];
      v18 = *v17;
      if (v18 != *v15)
      {
        barrier[0] = v11;
        barrier[1] = 3221225472;
        barrier[2] = __77__GEOSQLiteDB_ExternalFile___writeTransactionExternalResourceWithData_toURL___block_invoke_2;
        barrier[3] = &unk_1E1C00898;
        v30 = v13;
        v31 = v9;
        v32 = v18;
        v33 = self;
        dispatch_io_barrier(v30, barrier);

      }
      v19 = self->_externalFilesQueue;
      block[0] = v11;
      block[1] = 3221225472;
      block[2] = __77__GEOSQLiteDB_ExternalFile___writeTransactionExternalResourceWithData_toURL___block_invoke_3;
      block[3] = &unk_1E1C00738;
      block[4] = self;
      v20 = v13;
      v28 = v20;
      dispatch_sync(v19, block);
      objc_msgSend(v6, "_GEOCreateDispatchData");
      v21 = objc_claimAutoreleasedReturnValue();
      dispatch_group_enter((dispatch_group_t)self->_externalFilesGroup);
      v22 = self->_externalFilesQueue;
      v25[0] = v11;
      v25[1] = 3221225472;
      v25[2] = __77__GEOSQLiteDB_ExternalFile___writeTransactionExternalResourceWithData_toURL___block_invoke_2_4;
      v25[3] = &unk_1E1C21D48;
      v25[4] = self;
      v26 = v20;
      dispatch_io_write(v26, 0, v21, v22, v25);

    }
    else
    {
      v23 = self->_externalFilesQueue;
      v35[0] = v11;
      v35[1] = 3221225472;
      v35[2] = __77__GEOSQLiteDB_ExternalFile___writeTransactionExternalResourceWithData_toURL___block_invoke_2;
      v35[3] = &unk_1E1BFF6F8;
      v35[4] = self;
      dispatch_sync(v23, v35);
      log = self->_log;
      if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1885A9000, log, OS_LOG_TYPE_ERROR, "Unable to create channel for external resource.", buf, 2u);
      }
      dispatch_group_leave((dispatch_group_t)self->_externalFilesGroup);
    }

  }
}

void __77__GEOSQLiteDB_ExternalFile___writeTransactionExternalResourceWithData_toURL___block_invoke(uint64_t a1, uint64_t a2)
{
  if ((_DWORD)a2)
    objc_msgSend(*(id *)(a1 + 32), "_channelCleanupFailedWithError:", a2);
  dispatch_group_leave(*(dispatch_group_t *)(*(_QWORD *)(a1 + 32) + 24));
}

uint64_t __77__GEOSQLiteDB_ExternalFile___writeTransactionExternalResourceWithData_toURL___block_invoke_2(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 40) = 1;
  return result;
}

void __77__GEOSQLiteDB_ExternalFile___writeTransactionExternalResourceWithData_toURL___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  NSObject *v6;
  uint64_t v7;
  id v8;
  uint8_t buf[4];
  uint64_t v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  dispatch_io_get_descriptor(*(dispatch_io_t *)(a1 + 32));
  v2 = *(void **)(a1 + 40);
  v3 = *(_QWORD *)(a1 + 48);
  v4 = *MEMORY[0x1E0C99938];
  v8 = 0;
  objc_msgSend(v2, "setResourceValue:forKey:error:", v3, v4, &v8);
  v5 = v8;
  if (v5)
  {
    v6 = *(NSObject **)(*(_QWORD *)(a1 + 56) + 8);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138412546;
      v10 = v7;
      v11 = 2112;
      v12 = v5;
      _os_log_error_impl(&dword_1885A9000, v6, OS_LOG_TYPE_ERROR, "Error setting file protection on \"%@\": %@", buf, 0x16u);
    }
  }

}

void __77__GEOSQLiteDB_ExternalFile___writeTransactionExternalResourceWithData_toURL___block_invoke_3(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
  if (v2)
  {
    objc_msgSend(v2, "addObject:", *(_QWORD *)(a1 + 40));
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObject:", *(_QWORD *)(a1 + 40));
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 32);
    *(_QWORD *)(v4 + 32) = v3;

  }
}

void __77__GEOSQLiteDB_ExternalFile___writeTransactionExternalResourceWithData_toURL___block_invoke_2_4(uint64_t a1, int a2, void *a3, uint64_t a4)
{
  id v7;

  v7 = a3;
  if ((_DWORD)a4)
    objc_msgSend(*(id *)(a1 + 32), "_channelEncounteredError:", a4);
  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "_doneWritingToChannel:", *(_QWORD *)(a1 + 40));
    dispatch_group_leave(*(dispatch_group_t *)(*(_QWORD *)(a1 + 32) + 24));
  }

}

- (void)_doneWritingToChannel:(id)a3
{
  NSObject *v4;

  v4 = a3;
  dispatch_io_close(v4, 0);
  -[NSMutableArray removeObject:](self->_externalFilesActiveChannels, "removeObject:", v4);

}

- (void)_channelCleanupFailedWithError:(int)a3
{
  NSObject *log;
  _DWORD v5[2];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  self->_didEncounterExternalResourceErrorInTransaction = 1;
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
  {
    v5[0] = 67109120;
    v5[1] = a3;
    _os_log_error_impl(&dword_1885A9000, log, OS_LOG_TYPE_ERROR, "Error during channel cleanup for external resource: %{errno}d", (uint8_t *)v5, 8u);
  }
}

- (void)_channelEncounteredError:(int)a3
{
  NSObject *log;
  _DWORD v5[2];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  self->_didEncounterExternalResourceErrorInTransaction = 1;
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
  {
    v5[0] = 67109120;
    v5[1] = a3;
    _os_log_error_impl(&dword_1885A9000, log, OS_LOG_TYPE_ERROR, "Error while writing to channel for external resource: %{errno}d", (uint8_t *)v5, 8u);
  }
}

@end
