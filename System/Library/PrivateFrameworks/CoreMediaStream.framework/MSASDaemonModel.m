@implementation MSASDaemonModel

- (MSASDaemonModel)init
{
  void *v3;
  MSASDaemonModel *v4;
  objc_super v6;

  MSPathAlbumSharingDaemonPersistentStore();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6.receiver = self;
  v6.super_class = (Class)MSASDaemonModel;
  v4 = -[MSASModelBase initWithPersonID:databasePath:currentVersion:](&v6, sel_initWithPersonID_databasePath_currentVersion_, 0, v3, 2);

  return v4;
}

- (BOOL)dbQueueUpgradeFromDatabaseVersion:(int)a3 currentVersion:(int)a4
{
  BOOL v6;
  NSObject *v7;
  const char *v8;
  char *errmsg;
  objc_super v11;
  uint8_t buf[4];
  MSASDaemonModel *v13;
  __int16 v14;
  _WORD v15[9];

  *(_QWORD *)&v15[5] = *MEMORY[0x1E0C80C00];
  v11.receiver = self;
  v11.super_class = (Class)MSASDaemonModel;
  v6 = -[MSASModelBase dbQueueUpgradeFromDatabaseVersion:currentVersion:](&v11, sel_dbQueueUpgradeFromDatabaseVersion_currentVersion_, *(_QWORD *)&a3, *(_QWORD *)&a4);
  if (a3 < 0)
  {
    errmsg = 0;
    if (sqlite3_exec(-[MSASModelBase dbQueueDB](self, "dbQueueDB"), "create table if not exists NextActivity(\n   personID              text unique primary key,\n   nextActivity          float\n);",
           0,
           0,
           &errmsg))
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        v13 = self;
        v14 = 2082;
        *(_QWORD *)v15 = errmsg;
        v7 = MEMORY[0x1E0C81028];
        v8 = "%{public}@: Could not create daemon model tables. Error: %{public}s";
LABEL_12:
        _os_log_error_impl(&dword_1D3E94000, v7, OS_LOG_TYPE_ERROR, v8, buf, 0x16u);
      }
    }
    else
    {
      if (!sqlite3_exec(-[MSASModelBase dbQueueDB](self, "dbQueueDB"), "create index if not exists NextActivityByDate on NextActivity (nextActivity asc);",
              0,
              0,
              &errmsg))
      {
        if (!sqlite3_exec(-[MSASModelBase dbQueueDB](self, "dbQueueDB"), "analyze;", 0, 0, &errmsg))
          return 1;
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543618;
          v13 = self;
          v14 = 2082;
          *(_QWORD *)v15 = errmsg;
          _os_log_error_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%{public}@: Could not analyze database indexes. Ignoring. Error: %{public}s", buf, 0x16u);
        }
        v6 = 1;
        goto LABEL_17;
      }
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        v13 = self;
        v14 = 2082;
        *(_QWORD *)v15 = errmsg;
        v7 = MEMORY[0x1E0C81028];
        v8 = "%{public}@: Could not create index. Error: %{public}s";
        goto LABEL_12;
      }
    }
LABEL_17:
    sqlite3_free(errmsg);
    return v6;
  }
  if (a3 != 2)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543874;
      v13 = self;
      v14 = 1024;
      *(_DWORD *)v15 = a3;
      v15[2] = 1024;
      *(_DWORD *)&v15[3] = 2;
      _os_log_error_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%{public}@: Cannot upgrade from database version %d to %d. Recreating database.", buf, 0x18u);
    }
    return 0;
  }
  return v6;
}

- (id)earliestNextActivityDate
{
  NSObject *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;
  uint8_t buf[4];
  MSASDaemonModel *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__4668;
  v11 = __Block_byref_object_dispose__4669;
  v12 = 0;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138543362;
    v14 = self;
    _os_log_debug_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "%{public}@: Retrieving next activity date.", buf, 0xCu);
  }
  -[MSASModelBase dbQueue](self, "dbQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __43__MSASDaemonModel_earliestNextActivityDate__block_invoke;
  v6[3] = &unk_1E95BCEF8;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

- (id)nextActivityDateByPersonID
{
  NSObject *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__4668;
  v11 = __Block_byref_object_dispose__4669;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  -[MSASModelBase dbQueue](self, "dbQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __45__MSASDaemonModel_nextActivityDateByPersonID__block_invoke;
  v6[3] = &unk_1E95BCEF8;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

- (void)setNextActivityDate:(id)a3 forPersonID:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[MSASModelBase dbQueue](self, "dbQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __51__MSASDaemonModel_setNextActivityDate_forPersonID___block_invoke;
  block[3] = &unk_1E95BCE30;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

- (void)clearAllNextActivityDates
{
  NSObject *v3;
  _QWORD block[5];

  -[MSASModelBase dbQueue](self, "dbQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __44__MSASDaemonModel_clearAllNextActivityDates__block_invoke;
  block[3] = &unk_1E95BCED0;
  block[4] = self;
  dispatch_async(v3, block);

}

void __44__MSASDaemonModel_clearAllNextActivityDates__block_invoke(uint64_t a1)
{
  sqlite3_stmt *v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = 138543362;
    v7 = v5;
    _os_log_debug_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "%{public}@: Clearing out all next activity dates.", (uint8_t *)&v6, 0xCu);
  }
  v2 = (sqlite3_stmt *)objc_msgSend(*(id *)(a1 + 32), "statementForString:", CFSTR("delete from NextActivity;"));
  v3 = sqlite3_step(v2);
  v4 = v3;
  MSSqliteTrapForDBLockError(v3);
  if (v4 != 101)
    MSLogSqliteError((sqlite3 *)objc_msgSend(*(id *)(a1 + 32), "dbQueueDB"), *(_QWORD *)(a1 + 32), 163);
  if (v2)
    sqlite3_reset(v2);
}

uint64_t __51__MSASDaemonModel_setNextActivityDate_forPersonID___block_invoke(uint64_t a1)
{
  void *v2;
  sqlite3_stmt *v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  int v7;
  double v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  int v12;
  uint64_t v13;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  int v18;
  uint64_t v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    v15 = *(_QWORD *)(a1 + 32);
    v16 = *(_QWORD *)(a1 + 40);
    v17 = *(_QWORD *)(a1 + 48);
    v18 = 138543874;
    v19 = v15;
    v20 = 2114;
    v21 = v16;
    v22 = 2112;
    v23 = v17;
    _os_log_debug_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "%{public}@: Setting next activity date %{public}@ for personID %@.", (uint8_t *)&v18, 0x20u);
  }
  v2 = *(void **)(a1 + 32);
  if (*(_QWORD *)(a1 + 40))
  {
    v3 = (sqlite3_stmt *)objc_msgSend(v2, "statementForString:", CFSTR("insert or replace into NextActivity (personID, nextActivity) values (?, ?);"));
    v4 = sqlite3_reset(v3);
    v5 = v4;
    MSSqliteTrapForDBLockError(v4);
    if (v5)
      return sqlite3_reset(v3);
    v6 = sqlite3_bind_text(v3, 1, (const char *)objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 48)), "UTF8String"), -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
    v7 = v6;
    MSSqliteTrapForDBLockError(v6);
    if (v7)
      return sqlite3_reset(v3);
    objc_msgSend(*(id *)(a1 + 40), "timeIntervalSinceReferenceDate");
    v9 = sqlite3_bind_double(v3, 2, v8);
  }
  else
  {
    v3 = (sqlite3_stmt *)objc_msgSend(v2, "statementForString:", CFSTR("delete from NextActivity where personID = ?;"));
    v10 = sqlite3_reset(v3);
    v11 = v10;
    MSSqliteTrapForDBLockError(v10);
    if (v11)
      return sqlite3_reset(v3);
    v9 = sqlite3_bind_text(v3, 1, (const char *)objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 48)), "UTF8String"), -1, 0);
  }
  v12 = v9;
  MSSqliteTrapForDBLockError(v9);
  if (!v12)
  {
    v13 = sqlite3_step(v3);
    MSSqliteTrapForDBLockError(v13);
  }
  return sqlite3_reset(v3);
}

void __45__MSASDaemonModel_nextActivityDateByPersonID__block_invoke(uint64_t a1)
{
  sqlite3_stmt *v2;
  uint64_t v3;
  int v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  const char *v14;
  int v15;
  void *v16;
  __int16 v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    v12 = *(void **)(a1 + 32);
    v15 = 138543362;
    v16 = v12;
    _os_log_debug_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "%{public}@: Retrieving next activity date by personID.", (uint8_t *)&v15, 0xCu);
  }
  v2 = (sqlite3_stmt *)objc_msgSend(*(id *)(a1 + 32), "statementForString:", CFSTR("select personID, nextActivity from NextActivity;"));
  v3 = sqlite3_reset(v2);
  v4 = v3;
  MSSqliteTrapForDBLockError(v3);
  if (v4)
    goto LABEL_11;
  while (1)
  {
    v5 = sqlite3_step(v2);
    if (v5 != 100)
      break;
    MSSqliteStringFromStatementColumn(v2, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", sqlite3_column_double(v2, 1));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "setObject:forKey:", v7, v6);

  }
  if (v5 != 101)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v13 = *(void **)(a1 + 32);
      v14 = sqlite3_errmsg((sqlite3 *)objc_msgSend(v13, "dbQueueDB"));
      v15 = 138543618;
      v16 = v13;
      v17 = 2082;
      v18 = (uint64_t)v14;
      _os_log_error_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%{public}@: Error retrieving next activity date by personID. sqlite error: %{public}s", (uint8_t *)&v15, 0x16u);
    }
LABEL_11:
    sqlite3_reset(v2);
    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v11 = *(void **)(v10 + 40);
    *(_QWORD *)(v10 + 40) = 0;

    return;
  }
  sqlite3_reset(v2);
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    v8 = *(void **)(a1 + 32);
    v9 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "count");
    v15 = 138543618;
    v16 = v8;
    v17 = 2048;
    v18 = v9;
    _os_log_debug_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "%{public}@: ...retrieved %ld entries.", (uint8_t *)&v15, 0x16u);
  }
}

void __43__MSASDaemonModel_earliestNextActivityDate__block_invoke(uint64_t a1)
{
  sqlite3_stmt *v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  void *v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  const char *v13;
  int v14;
  void *v15;
  __int16 v16;
  const char *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v2 = (sqlite3_stmt *)objc_msgSend(*(id *)(a1 + 32), "statementForString:", CFSTR("select nextActivity from NextActivity order by nextActivity asc limit 1;"));
  v3 = sqlite3_reset(v2);
  v4 = v3;
  MSSqliteTrapForDBLockError(v3);
  if (v4)
  {
LABEL_2:
    sqlite3_reset(v2);
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v6 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = 0;

    return;
  }
  v7 = sqlite3_step(v2);
  if (v7 != 101)
  {
    if (v7 != 100)
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        v11 = *(void **)(a1 + 32);
        v14 = 138543618;
        v15 = v11;
        v16 = 2082;
        v17 = sqlite3_errmsg((sqlite3 *)objc_msgSend(v11, "dbQueueDB"));
        _os_log_error_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%{public}@: Cannot retrieve next activity date. sqlite error: %{public}s", (uint8_t *)&v14, 0x16u);
      }
      goto LABEL_2;
    }
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", sqlite3_column_double(v2, 0));
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v10 = *(void **)(v9 + 40);
    *(_QWORD *)(v9 + 40) = v8;

  }
  sqlite3_reset(v2);
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    v12 = *(void **)(a1 + 32);
    v13 = *(const char **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    v14 = 138543618;
    v15 = v12;
    v16 = 2114;
    v17 = v13;
    _os_log_debug_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "%{public}@: ...retrieved date: %{public}@", (uint8_t *)&v14, 0x16u);
  }
}

+ (id)defaultModel
{
  if (defaultModel_onceToken != -1)
    dispatch_once(&defaultModel_onceToken, &__block_literal_global_4694);
  return (id)defaultModel_model;
}

void __31__MSASDaemonModel_defaultModel__block_invoke()
{
  MSASDaemonModel *v0;
  void *v1;

  v0 = objc_alloc_init(MSASDaemonModel);
  v1 = (void *)defaultModel_model;
  defaultModel_model = (uint64_t)v0;

}

@end
