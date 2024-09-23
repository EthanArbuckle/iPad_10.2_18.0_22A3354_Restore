@implementation NPKGizmoDatabase

+ (id)sharedDatabase
{
  if (sharedDatabase_onceToken != -1)
    dispatch_once(&sharedDatabase_onceToken, &__block_literal_global_18);
  return (id)sharedDatabase_sharedDatabase;
}

void __34__NPKGizmoDatabase_sharedDatabase__block_invoke()
{
  NPKGizmoDatabase *v0;
  void *v1;

  v0 = objc_alloc_init(NPKGizmoDatabase);
  v1 = (void *)sharedDatabase_sharedDatabase;
  sharedDatabase_sharedDatabase = (uint64_t)v0;

}

+ (int64_t)maxDatabaseVersion
{
  return 60;
}

+ (id)_migrationDelegateQueue
{
  if (_migrationDelegateQueue_onceToken != -1)
    dispatch_once(&_migrationDelegateQueue_onceToken, &__block_literal_global_154);
  return (id)_migrationDelegateQueue_queue;
}

void __43__NPKGizmoDatabase__migrationDelegateQueue__block_invoke()
{
  dispatch_queue_t v0;
  void *v1;

  v0 = dispatch_queue_create("NPKGizmoDatabaseMigrationDelegateQueue", 0);
  v1 = (void *)_migrationDelegateQueue_queue;
  _migrationDelegateQueue_queue = (uint64_t)v0;

}

+ (id)_migrationDataSource
{
  NSObject *v2;
  id v3;
  _QWORD block[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__14;
  v10 = __Block_byref_object_dispose__14;
  v11 = 0;
  objc_msgSend(a1, "_migrationDelegateQueue");
  v2 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __40__NPKGizmoDatabase__migrationDataSource__block_invoke;
  block[3] = &unk_24CFE81D0;
  block[4] = &v6;
  dispatch_sync(v2, block);

  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __40__NPKGizmoDatabase__migrationDataSource__block_invoke(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  void *v4;

  WeakRetained = objc_loadWeakRetained(&__MigrationDataSource);
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = WeakRetained;

}

+ (void)setMigrationDataSource:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  id (*v10)(uint64_t);
  void *v11;
  id v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  char v17;

  v4 = a3;
  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 0;
  objc_msgSend(a1, "_migrationDelegateQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x24BDAC760];
  v9 = 3221225472;
  v10 = __43__NPKGizmoDatabase_setMigrationDataSource___block_invoke;
  v11 = &unk_24CFE8318;
  v13 = &v14;
  v6 = v4;
  v12 = v6;
  dispatch_sync(v5, &v8);

  if (v6 && !*((_BYTE *)v15 + 24))
  {
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter", v8, v9, v10, v11);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "postNotificationName:object:", CFSTR("NPKGizmoDatabaseMigrationDataSourceSetNotification"), 0);

  }
  _Block_object_dispose(&v14, 8);

}

id __43__NPKGizmoDatabase_setMigrationDataSource___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained(&__MigrationDataSource);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = WeakRetained != 0;

  return objc_storeWeak(&__MigrationDataSource, *(id *)(a1 + 32));
}

- (NPKGizmoDatabase)init
{
  NPKGizmoDatabase *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *dbQueue;
  __CFNotificationCenter *DarwinNotifyCenter;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)NPKGizmoDatabase;
  v2 = -[NPKGizmoDatabase init](&v8, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("com.apple.NanoPassbook.NPKGizmoDatabase", 0);
    dbQueue = v2->_dbQueue;
    v2->_dbQueue = (OS_dispatch_queue *)v3;

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v2, (CFNotificationCallback)_NPKGizmoDatabaseChangedExternally, (CFStringRef)_NPKGizmoDatabaseExternallyChangedNotificationName, 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v2, (CFNotificationCallback)_NPKGizmoDatabaseKeybagFirstUnlock, CFSTR("com.apple.mobile.keybagd.first_unlock"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObserver:selector:name:object:", v2, sel__handleHasMigrationDataSource, CFSTR("NPKGizmoDatabaseMigrationDataSourceSetNotification"), 0);
    -[NPKGizmoDatabase setPassDBIsAvailable:](v2, "setPassDBIsAvailable:", 0);

  }
  return v2;
}

- (void)dealloc
{
  __CFNotificationCenter *DarwinNotifyCenter;
  void *v4;
  objc_super v5;

  sqlite3_finalize(self->_deleteStatement);
  sqlite3_finalize(self->_insertStatement);
  sqlite3_finalize(self->_insertDiffStatement);
  sqlite3_finalize(self->_selectPassDataStatement);
  sqlite3_finalize(self->_selectPassAndImageSetsDataStatement);
  sqlite3_finalize(self->_selectPassDiffStatement);
  sqlite3_finalize(self->_updateDeletePendingStatement);
  sqlite3_finalize(self->_selectDeletePendingStatement);
  sqlite3_finalize(self->_updatePreferredAIDStatement);
  sqlite3_finalize(self->_selectPreferredAIDStatement);
  sqlite3_finalize(self->_insertTransactionStatement);
  sqlite3_finalize(self->_removeTransactionStatement);
  sqlite3_finalize(self->_removeTransactionWithServiceIdentifier);
  sqlite3_finalize(self->_selectTransactionsStatement);
  sqlite3_finalize(self->_selectTransactionsStatementWithSource);
  sqlite3_finalize(self->_selectTransactionsStatementWithoutSource);
  sqlite3_finalize(self->_selectTransactionWithIdentifierStatement);
  sqlite3_finalize(self->_selectTransactionWithServiceIdentifierStatement);
  sqlite3_finalize(self->_insertTransactionSourceIdentifierForPassStatement);
  sqlite3_finalize(self->_selectTransactionSourceIdentifierForTransactionWithIdentifierStatement);
  sqlite3_finalize(self->_selectTransactionSourceIdentifierForTransactionWithServiceIdentifierStatement);
  sqlite3_finalize(self->_selectTransactionSourceIdentifierForPassUniqueIdentifierStatement);
  sqlite3_finalize(self->_selectPassUniqueIdentifierForTransactionSourceIdentifierStatement);
  sqlite3_finalize(self->_deleteTransactionSourceIdentifierForPassStatement);
  sqlite3_finalize(self->_deleteTransactionsForTransactionSourceStatement);
  sqlite3_finalize(self->_trimTransactionsForTransactionSourceStatement);
  sqlite3_finalize(self->_selectTransitAppletStateForPassStatement);
  sqlite3_finalize(self->_updateTransitAppletStateForPassStatement);
  sqlite3_finalize(self->_insertEphemeralTransactionStatement);
  sqlite3_finalize(self->_deleteEphemeralTransactionByTransactionSourceIdentifierStatement);
  sqlite3_finalize(self->_currentEphemeralTransactionIdentifierStatement);
  sqlite3_finalize(self->_selectLastAddValueAmountForPassStatement);
  sqlite3_finalize(self->_updateLastAddValueAmountForPassStatement);
  sqlite3_finalize(self->_selectPendingAddValueDateForPassStatement);
  sqlite3_finalize(self->_updatePendingAddValueDateForPassStatement);
  sqlite3_finalize(self->_selectBalancesForPassStatement);
  sqlite3_finalize(self->_updateBalancesForPassStatement);
  sqlite3_finalize(self->_selectSubcredentialsForPassStatement);
  sqlite3_finalize(self->_updateSubcredentialsForPassStatement);
  sqlite3_close(self->_database);
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveEveryObserver(DarwinNotifyCenter, self);
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:", self);

  v5.receiver = self;
  v5.super_class = (Class)NPKGizmoDatabase;
  -[NPKGizmoDatabase dealloc](&v5, sel_dealloc);
}

- (BOOL)_executeSQL:(id)a3
{
  id v4;
  sqlite3 *v5;
  id v6;
  int v7;
  void *v8;
  NSObject *v9;
  _BOOL4 v10;
  NSObject *v11;
  void *v12;
  id v13;
  char *errmsg;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  id v19;
  __int16 v20;
  int v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  errmsg = 0;
  v5 = -[NPKGizmoDatabase database](self, "database");
  v6 = objc_retainAutorelease(v4);
  v7 = sqlite3_exec(v5, (const char *)objc_msgSend(v6, "UTF8String"), 0, 0, &errmsg);
  if (v7)
  {
    v8 = errmsg;
    if (!errmsg)
      v8 = (void *)sqlite3_errmsg(-[NPKGizmoDatabase database](self, "database"));
    pk_General_log();
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = os_log_type_enabled(v9, OS_LOG_TYPE_ERROR);

    if (v10)
    {
      pk_General_log();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        v12 = (void *)objc_opt_class();
        *(_DWORD *)buf = 138413058;
        v17 = v12;
        v18 = 2112;
        v19 = v6;
        v20 = 1024;
        v21 = v7;
        v22 = 2080;
        v23 = v8;
        v13 = v12;
        _os_log_impl(&dword_213518000, v11, OS_LOG_TYPE_ERROR, "Error: %@: Could not execute SQL: %@: [%d, %s]", buf, 0x26u);

      }
    }
  }

  return v7 == 0;
}

- (void)_executeSQLQuery:(id)a3 processResultsBlock:(id)a4
{
  id v6;
  void (**v7)(id, uint64_t, sqlite3_stmt *);
  sqlite3 *v8;
  id v9;
  NSObject *v10;
  _BOOL4 v11;
  NSObject *v12;
  sqlite3_stmt *ppStmt;
  uint8_t buf[4];
  const char *v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void (**)(id, uint64_t, sqlite3_stmt *))a4;
  ppStmt = 0;
  v8 = -[NPKGizmoDatabase database](self, "database");
  v9 = objc_retainAutorelease(v6);
  if (sqlite3_prepare_v2(v8, (const char *)objc_msgSend(v9, "UTF8String"), -1, &ppStmt, 0))
  {
    pk_General_log();
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = os_log_type_enabled(v10, OS_LOG_TYPE_ERROR);

    if (v11)
    {
      pk_General_log();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446978;
        v15 = "-[NPKGizmoDatabase _executeSQLQuery:processResultsBlock:]";
        v16 = 2082;
        v17 = "/Library/Caches/com.apple.xbs/Sources/NanoPassbook_Frameworks/NanoPassKit/NPKGizmoDatabase.m";
        v18 = 2048;
        v19 = 437;
        v20 = 2112;
        v21 = v9;
        _os_log_impl(&dword_213518000, v12, OS_LOG_TYPE_ERROR, "Error: *** NPKAssertion failure in %{public}s, %{public}s:%ld (reason: Unable to prepare \"%@\" statement)", buf, 0x2Au);
      }

    }
    _NPKAssertAbort();
  }
  v7[2](v7, 1, ppStmt);
  sqlite3_reset(ppStmt);
  sqlite3_finalize(ppStmt);

}

- (sqlite3)database
{
  sqlite3 **p_database;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  int v10;
  int v11;
  NSObject *v12;
  _BOOL4 v13;
  NSObject *v14;
  NSObject *v15;
  _BOOL4 v16;
  NSObject *v17;
  char v18;
  NSObject *v19;
  _BOOL4 v20;
  NSObject *v21;
  int v22;
  int v23;
  NSObject *v24;
  _BOOL4 v25;
  NSObject *v26;
  NSObject *v27;
  _BOOL4 v28;
  NSObject *v29;
  void *v30;
  id v31;
  void *v32;
  id v33;
  void *v34;
  id v35;
  NSObject *v36;
  _BOOL4 v37;
  NSObject *v38;
  sqlite3 *v39;
  NSObject *v40;
  _BOOL4 v41;
  NSObject *v42;
  int v43;
  id v44;
  id v45;
  id v46;
  _QWORD v47[5];
  uint8_t buf[4];
  const char *v49;
  __int16 v50;
  const char *v51;
  __int16 v52;
  uint64_t v53;
  __int16 v54;
  id v55;
  __int16 v56;
  int v57;
  uint64_t v58;

  v58 = *MEMORY[0x24BDAC8D0];
  p_database = &self->_database;
  if (self->_database)
    return *p_database;
  v43 = 0;
  while (-[NPKGizmoDatabase _preconditionsMetForDatabaseOpen](self, "_preconditionsMetForDatabaseOpen"))
  {
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    NPKHomeDirectoryPath();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v5, "fileExistsAtPath:", v6) & 1) == 0)
      objc_msgSend(v5, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v6, 1, 0, 0);
    NPKHomeDirectoryPath();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringByAppendingPathComponent:", CFSTR("nanopasses.sqlite3"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = objc_retainAutorelease(v8);
    v10 = sqlite3_open_v2((const char *)objc_msgSend(v9, "UTF8String"), p_database, 3145734, 0);
    if (!v10)
    {
      while (1)
      {
        v22 = sqlite3_exec(*p_database, "PRAGMA journal_mode = WAL;", 0, 0, 0);
        if (v22 != 5)
          break;
        usleep(0x14u);
      }
      v23 = v22;
      if (v22)
      {
        pk_General_log();
        v24 = objc_claimAutoreleasedReturnValue();
        v25 = os_log_type_enabled(v24, OS_LOG_TYPE_ERROR);

        if (v25)
        {
          pk_General_log();
          v26 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 67109120;
            LODWORD(v49) = v23;
            _os_log_impl(&dword_213518000, v26, OS_LOG_TYPE_ERROR, "Error: Couldn't set journal mode on database (result %d)", buf, 8u);
          }

        }
      }
      else
      {
        v47[0] = MEMORY[0x24BDAC760];
        v47[1] = 3221225472;
        v47[2] = __28__NPKGizmoDatabase_database__block_invoke;
        v47[3] = &unk_24CFEB0A8;
        v47[4] = self;
        if (-[NPKGizmoDatabase _migrateDatabase:](self, "_migrateDatabase:", v47))
        {
LABEL_40:
          -[NPKGizmoDatabase setPassDBIsAvailable:](self, "setPassDBIsAvailable:", 1);
          pk_General_log();
          v36 = objc_claimAutoreleasedReturnValue();
          v37 = os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT);

          if (v37)
          {
            pk_General_log();
            v38 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
            {
              v39 = *p_database;
              *(_DWORD *)buf = 134218242;
              v49 = (const char *)v39;
              v50 = 2112;
              v51 = (const char *)v9;
              _os_log_impl(&dword_213518000, v38, OS_LOG_TYPE_DEFAULT, "Notice: Gizmo database %p opened! at:%@ Broadcasting database changed notification", buf, 0x16u);
            }

          }
          -[NPKGizmoDatabase _notifyForFirstUnlock](self, "_notifyForFirstUnlock");
          v18 = 0;
          goto LABEL_45;
        }
      }
      pk_General_log();
      v27 = objc_claimAutoreleasedReturnValue();
      v28 = os_log_type_enabled(v27, OS_LOG_TYPE_ERROR);

      if (v28)
      {
        pk_General_log();
        v29 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_213518000, v29, OS_LOG_TYPE_ERROR, "Error: Database is in a bad state; deleting and recreating",
            buf,
            2u);
        }

      }
      sqlite3_close_v2(self->_database);
      self->_database = 0;
      objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v46 = 0;
      objc_msgSend(v30, "removeItemAtPath:error:", v9, &v46);
      v31 = v46;
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@-shm"), v9);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = v31;
      objc_msgSend(v30, "removeItemAtPath:error:", v32, &v45);
      v33 = v45;

      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@-wal"), v9);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = v33;
      objc_msgSend(v30, "removeItemAtPath:error:", v34, &v44);
      v35 = v44;

      -[NPKGizmoDatabase _notifyDatabaseChangedExternally](self, "_notifyDatabaseChangedExternally");
      ++v43;

      goto LABEL_40;
    }
    v11 = v10;
    if (v10 != 23 && v10 != 14)
    {
      pk_General_log();
      v19 = objc_claimAutoreleasedReturnValue();
      v20 = os_log_type_enabled(v19, OS_LOG_TYPE_ERROR);

      if (v20)
      {
        pk_General_log();
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136447234;
          v49 = "-[NPKGizmoDatabase database]";
          v50 = 2082;
          v51 = "/Library/Caches/com.apple.xbs/Sources/NanoPassbook_Frameworks/NanoPassKit/NPKGizmoDatabase.m";
          v52 = 2048;
          v53 = 482;
          v54 = 2112;
          v55 = v9;
          v56 = 1024;
          v57 = v11;
          _os_log_impl(&dword_213518000, v21, OS_LOG_TYPE_ERROR, "Error: *** NPKAssertion failure in %{public}s, %{public}s:%ld (reason: Couldn't open %@ (result %d))", buf, 0x30u);
        }

      }
      _NPKAssertAbort();
    }
    pk_General_log();
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);

    if (v13)
    {
      pk_General_log();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v49 = (const char *)v9;
        _os_log_impl(&dword_213518000, v14, OS_LOG_TYPE_DEFAULT, "Notice: Authorization denied to pass database: %@", buf, 0xCu);
      }

    }
    if (NPKProtectedDataAvailable())
    {
      pk_General_log();
      v15 = objc_claimAutoreleasedReturnValue();
      v16 = os_log_type_enabled(v15, OS_LOG_TYPE_ERROR);

      if (v16)
      {
        pk_General_log();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136447234;
          v49 = "-[NPKGizmoDatabase database]";
          v50 = 2082;
          v51 = "/Library/Caches/com.apple.xbs/Sources/NanoPassbook_Frameworks/NanoPassKit/NPKGizmoDatabase.m";
          v52 = 2048;
          v53 = 474;
          v54 = 2112;
          v55 = v9;
          v56 = 1024;
          v57 = v11;
          _os_log_impl(&dword_213518000, v17, OS_LOG_TYPE_ERROR, "Error: *** NPKAssertion failure in %{public}s, %{public}s:%ld (reason: Couldn't open %@ (result %d), and NPKProtectedDataAvailable = YES)", buf, 0x30u);
        }

      }
      _NPKAssertAbort();
    }
    *p_database = 0;
    v18 = 1;
LABEL_45:

    if (*p_database || (v18 & 1) != 0 || v43 >= 5)
      return *p_database;
  }
  pk_Payment_log();
  v40 = objc_claimAutoreleasedReturnValue();
  v41 = os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT);

  if (v41)
  {
    pk_Payment_log();
    v42 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_213518000, v42, OS_LOG_TYPE_DEFAULT, "Notice: Not opening database because we don't have what we need to migrate it", buf, 2u);
    }

  }
  return *p_database;
}

uint64_t __28__NPKGizmoDatabase_database__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unsigned int v6;
  _BOOL4 v7;
  _BOOL4 v8;
  BOOL v9;
  uint64_t v10;
  _BOOL4 v11;
  _BOOL4 v12;
  _BOOL4 v13;
  NSObject *v14;
  _BOOL4 v15;
  NSObject *v16;
  char v17;
  int v18;
  _BOOL4 v20;
  NSObject *v21;
  _BOOL4 v22;
  NSObject *v23;
  char v24;
  NSObject *v25;
  _BOOL4 v26;
  NSObject *v27;
  void *v28;
  char v29;
  NSObject *v30;
  _BOOL4 v31;
  NSObject *v32;
  int v34;
  _BOOL4 v35;
  _BOOL4 v36;
  _BOOL4 v37;
  _BOOL4 v38;
  _BOOL4 v39;
  _BOOL4 v40;
  _BOOL4 v41;
  _BOOL4 v42;
  _BOOL4 v43;
  _BOOL4 v44;
  uint8_t v45[8];
  _QWORD v46[7];
  uint8_t buf[8];
  uint8_t *v48;
  uint64_t v49;
  uint64_t (*v50)(uint64_t, uint64_t);
  void (*v51)(uint64_t);
  id v52;
  uint64_t v53;

  v53 = *MEMORY[0x24BDAC8D0];
  v6 = 1;
  if (a2 < 1 && a3 >= 1)
  {
    if (!objc_msgSend(*(id *)(a1 + 32), "_executeSQL:", CFSTR("CREATE TABLE IF NOT EXISTS pass (unique_id TEXT NOT NULL, type_id TEXT NOT NULL, style INTEGER, hash BLOB NOT NULL, encoded_pass BLOB NOT NULL, encoded_diff BLOB, logo_text TEXT, logo_image BLOB, background_color BLOB, label_color BLOB, foreground_color BLOB, delete_pending INTEGER DEFAULT 0, background_image BLOB);")))
    {
      v10 = 0;
      v8 = 1;
      v7 = 1;
      goto LABEL_26;
    }
    v6 = objc_msgSend(*(id *)(a1 + 32), "_executeSQL:", CFSTR("CREATE UNIQUE INDEX IF NOT EXISTS pass_unique_id_idx ON pass(unique_id)"));
  }
  if (a2 < 2 && a3 >= 2 && v6)
    v6 = objc_msgSend(*(id *)(a1 + 32), "_executeSQL:", CFSTR("ALTER TABLE pass ADD preferred_aid TEXT;"));
  v7 = a2 < 3;
  if (a2 <= 2 && a3 >= 3 && v6)
  {
    v6 = objc_msgSend(*(id *)(a1 + 32), "_executeSQL:", CFSTR("ALTER TABLE pass ADD nfc_payload BLOB;"));
    v7 = 1;
  }
  v8 = a2 < 4;
  v9 = a2 > 3 || a3 < 4;
  if (v9)
    v10 = v6;
  else
    v10 = 0;
  if (!v9 && v6)
  {
    if (objc_msgSend(*(id *)(a1 + 32), "_executeSQL:", CFSTR("ALTER TABLE pass ADD private_label INTEGER DEFAULT 0;")))
      v10 = objc_msgSend(*(id *)(a1 + 32), "_executeSQL:", CFSTR("ALTER TABLE pass ADD cobranded INTEGER DEFAULT 0;"));
    else
      v10 = 0;
    v8 = 1;
  }
LABEL_26:
  v43 = v8;
  v44 = v7;
  if (a2 < 5 && a3 >= 5)
  {
    if ((_DWORD)v10)
    {
      if (objc_msgSend(*(id *)(a1 + 32), "_executeSQL:", CFSTR("ALTER TABLE pass ADD device_primary_payment_application BLOB;")))
      {
        v10 = objc_msgSend(*(id *)(a1 + 32), "_executeSQL:", CFSTR("ALTER TABLE pass ADD preferred_payment_application BLOB;"));
        goto LABEL_31;
      }
      v10 = 0;
    }
    v12 = 1;
    v39 = 1;
    v40 = 1;
    v41 = 1;
    v42 = 1;
    v38 = 1;
    goto LABEL_70;
  }
LABEL_31:
  if (a2 < 6 && a3 >= 6 && (_DWORD)v10)
    v10 = objc_msgSend(*(id *)(a1 + 32), "_executeSQL:", CFSTR("ALTER TABLE pass ADD ingested_date INTEGER;"));
  if (a2 < 7 && a3 >= 7 && (_DWORD)v10)
    v10 = objc_msgSend(*(id *)(a1 + 32), "_executeSQL:", CFSTR("ALTER TABLE pass ADD complete_hash BLOB"));
  v41 = a2 < 8;
  if (a2 < 8 && a3 >= 8 && (_DWORD)v10)
    v10 = objc_msgSend(*(id *)(a1 + 32), "_executeSQL:", CFSTR("ALTER TABLE pass ADD effective_payment_application_state INTEGER DEFAULT 0"));
  v40 = a2 < 9;
  v42 = a2 < 6;
  if (a2 <= 8 && a3 >= 9 && (_DWORD)v10)
    v10 = objc_msgSend(*(id *)(a1 + 32), "_executeSQL:", CFSTR("ALTER TABLE pass ADD has_user_selectable_payment_applications INTEGER DEFAULT 0"));
  if (a2 < 11 && a3 >= 11 && (_DWORD)v10)
    v10 = objc_msgSend(*(id *)(a1 + 32), "_executeSQL:", CFSTR("ALTER TABLE pass ADD has_stored_value INTEGER DEFAULT 0"));
  v38 = a2 < 12;
  if (a2 < 12 && a3 >= 12 && (_DWORD)v10)
    v10 = objc_msgSend(*(id *)(a1 + 32), "_executeSQL:", CFSTR("ALTER TABLE pass ADD settings INTEGER DEFAULT 0"));
  v39 = a2 < 11;
  if (a2 <= 12 && a3 >= 13 && (_DWORD)v10)
    v10 = objc_msgSend(*(id *)(a1 + 32), "_executeSQL:", CFSTR("ALTER TABLE pass ADD complete_hashes BLOB"));
  v11 = a2 < 45;
  if (a2 <= 44 && a3 >= 45 && (_DWORD)v10)
  {
    objc_msgSend(*(id *)(a1 + 32), "_executeSQL:", CFSTR("ALTER TABLE pass ADD available_actions BLOB"));
    objc_msgSend(*(id *)(a1 + 32), "_executeSQL:", CFSTR("CREATE TABLE IF NOT EXISTS transactions (pass_unique_id TEXT NOT NULL, transaction_id TEXT NOT NULL UNIQUE ON CONFLICT REPLACE, transaction_date INTEGER, transaction_sources INTEGER, encoded_transaction BLOB NOT NULL);"));
    objc_msgSend(*(id *)(a1 + 32), "_executeSQL:", CFSTR("CREATE INDEX IF NOT EXISTS transactions_pass_unique_id_index ON transactions(pass_unique_id)"));
    objc_msgSend(*(id *)(a1 + 32), "_executeSQL:", CFSTR("ALTER TABLE pass ADD organization_name TEXT"));
    objc_msgSend(*(id *)(a1 + 32), "_executeSQL:", CFSTR("ALTER TABLE transactions ADD transaction_source INTEGER"));
    objc_msgSend(*(id *)(a1 + 32), "_executeSQL:", CFSTR("ALTER TABLE transactions ADD has_notification_service_data INTEGER"));
    objc_msgSend(*(id *)(a1 + 32), "_executeSQL:", CFSTR("ALTER TABLE pass ADD felica_transit_applet_state BLOB"));
    objc_msgSend(*(id *)(a1 + 32), "_executeSQL:", CFSTR("ALTER TABLE pass ADD front_field_buckets BLOB"));
    objc_msgSend(*(id *)(a1 + 32), "_executeSQL:", CFSTR("ALTER TABLE pass ADD back_field_buckets BLOB"));
    objc_msgSend(*(id *)(a1 + 32), "_executeSQL:", CFSTR("ALTER TABLE transactions ADD transaction_type INTEGER"));
    objc_msgSend(*(id *)(a1 + 32), "_executeSQL:", CFSTR("CREATE TABLE IF NOT EXISTS ephemeral_transactions (pass_unique_id TEXT NOT NULL UNIQUE ON CONFLICT REPLACE, transaction_id TEXT NOT NULL);"));
    objc_msgSend(*(id *)(a1 + 32), "_executeSQL:", CFSTR("CREATE INDEX IF NOT EXISTS ephemeral_transactions_pass_index ON ephemeral_transactions(pass_unique_id)"));
    objc_msgSend(*(id *)(a1 + 32), "_executeSQL:", CFSTR("ALTER TABLE pass ADD last_add_value_amount TEXT"));
    objc_msgSend(*(id *)(a1 + 32), "_executeSQL:", CFSTR("ALTER TABLE pass ADD localized_description TEXT"));
    objc_msgSend(*(id *)(a1 + 32), "_executeSQL:", CFSTR("ALTER TABLE pass ADD pending_add_value_date INTEGER"));
  }
  v12 = a2 < 28;
  v13 = a3 > 27 && a2 < 28;
  if ((v13 & v10) == 1)
  {
    v10 = objc_msgSend(*(id *)(a1 + 32), "_executeSQL:", CFSTR("ALTER TABLE pass ADD device_payment_applications BLOB"));
    v12 = 1;
LABEL_70:
    v11 = 1;
  }
  if (a2 > 33 || a3 < 34)
    goto LABEL_76;
  if (!(_DWORD)v10)
  {
    v34 = 0;
LABEL_104:
    v35 = 1;
    v36 = 1;
    v37 = 1;
    goto LABEL_105;
  }
  if (!objc_msgSend(*(id *)(a1 + 32), "_executeSQL:", CFSTR("ALTER TABLE pass ADD device_primary_contactless_payment_application BLOB;")))
  {
    v34 = 0;
    v10 = 0;
    goto LABEL_104;
  }
  v10 = objc_msgSend(*(id *)(a1 + 32), "_executeSQL:", CFSTR("ALTER TABLE pass ADD device_primary_in_app_payment_application BLOB;"));
LABEL_76:
  v37 = a2 < 44;
  if (a2 <= 43 && a3 >= 44 && (_DWORD)v10)
    v10 = objc_msgSend(*(id *)(a1 + 32), "_executeSQL:", CFSTR("ALTER TABLE pass ADD encoded_image_sets BLOB"));
  v36 = a2 < 47;
  if (a2 < 47 && a3 >= 47 && (_DWORD)v10)
    v10 = objc_msgSend(*(id *)(a1 + 32), "_executeSQL:", CFSTR("ALTER TABLE pass ADD issuer_country_code BLOB"));
  v35 = a2 < 48;
  if (a2 <= 47 && a3 >= 48 && (_DWORD)v10)
    v10 = objc_msgSend(*(id *)(a1 + 32), "_executeSQL:", CFSTR("ALTER TABLE pass ADD express_pass_types_mask INTEGER DEFAULT 0"));
  if (a2 <= 49 && a3 >= 50 && (_DWORD)v10)
    v10 = objc_msgSend(*(id *)(a1 + 32), "_executeSQL:", CFSTR("ALTER TABLE pass ADD complete_remote_hashes BLOB"));
  if ((unint64_t)(a2 - 48) > 2)
  {
    v34 = 0;
  }
  else
  {
    if ((objc_msgSend(*(id *)(a1 + 32), "_table:containsColumn:", CFSTR("pass"), CFSTR("issuer_country_code")) & 1) == 0)
    {
      pk_General_log();
      v14 = objc_claimAutoreleasedReturnValue();
      v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);

      if (v15)
      {
        pk_General_log();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_213518000, v16, OS_LOG_TYPE_DEFAULT, "Notice: Solving DB corruption cause by DB v48", buf, 2u);
        }

      }
      if ((_DWORD)v10)
        v10 = objc_msgSend(*(id *)(a1 + 32), "_executeSQL:", CFSTR("ALTER TABLE pass ADD issuer_country_code BLOB"));
    }
    v34 = 1;
  }
LABEL_105:
  if (a2 < 53 && a3 >= 53)
  {
    if (!(_DWORD)v10)
      goto LABEL_123;
    if (!objc_msgSend(*(id *)(a1 + 32), "_executeSQL:", CFSTR("ALTER TABLE transactions ADD cloudkit_archived INTEGER")))
    {
      v10 = 0;
      goto LABEL_123;
    }
    v10 = objc_msgSend(*(id *)(a1 + 32), "_executeSQL:", CFSTR("ALTER TABLE pass ADD supports_pp INTEGER"));
  }
  if (a2 <= 53 && a3 >= 54 && (_DWORD)v10)
    v10 = objc_msgSend(*(id *)(a1 + 32), "_executeSQL:", CFSTR("ALTER TABLE transactions ADD service_identifier TEXT"));
  if (a2 < 56 && a3 >= 56 && (_DWORD)v10)
    v10 = objc_msgSend(*(id *)(a1 + 32), "_executeSQL:", CFSTR("ALTER TABLE pass ADD balances BLOB"));
  if (a2 < 57 && a3 >= 57 && (_DWORD)v10)
    v10 = objc_msgSend(*(id *)(a1 + 32), "_executeSQL:", CFSTR("ALTER TABLE pass ADD subcredentials BLOB"));
LABEL_123:
  v17 = 0;
  if (a2 < 58 && a3 >= 58)
  {
    v18 = objc_msgSend(*(id *)(a1 + 32), "_table:containsColumn:", CFSTR("transactions"), CFSTR("transaction_source_identifier"));
    if (((v18 | v10 ^ 1) & 1) != 0)
    {
      v10 = v18 & v10;
      v17 = v18 ^ 1;
    }
    else
    {
      if (objc_msgSend(*(id *)(a1 + 32), "_executeSQL:", CFSTR("ALTER TABLE transactions ADD transaction_source_identifier TEXT"))&& objc_msgSend(*(id *)(a1 + 32), "_executeSQL:", CFSTR("ALTER TABLE ephemeral_transactions ADD transaction_source_identifier TEXT"))&& objc_msgSend(*(id *)(a1 + 32), "_executeSQL:", CFSTR("CREATE TABLE IF NOT EXISTS transaction_source (transaction_source_identifier TEXT NOT NULL UNIQUE ON CONFLICT REPLACE, type INTEGER DEFAULT 0, pass_unique_id TEXT);")))
      {
        v10 = objc_msgSend(*(id *)(a1 + 32), "_executeSQL:", CFSTR("CREATE INDEX IF NOT EXISTS transaction_source_index ON transactions(transaction_source_identifier)"));
      }
      else
      {
        v10 = 0;
      }
      v17 = 1;
    }
  }
  if (a2 <= 58
    && a3 >= 59
    && ((objc_msgSend(*(id *)(a1 + 32), "_table:containsColumn:", CFSTR("pass"), CFSTR("subcredentials")) | v10 ^ 1) & 1) == 0)
  {
    v10 = objc_msgSend(*(id *)(a1 + 32), "_executeSQL:", CFSTR("ALTER TABLE pass ADD subcredentials BLOB"));
  }
  v20 = a2 < 60 && a3 > 59;
  pk_General_log();
  v21 = objc_claimAutoreleasedReturnValue();
  v22 = os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT);

  if (v22)
  {
    pk_General_log();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&buf[4] = v10;
      _os_log_impl(&dword_213518000, v23, OS_LOG_TYPE_DEFAULT, "Notice: NPKGizmoDatabase: schema applied successfully: %d", buf, 8u);
    }

  }
  v24 = v10 ^ 1;
  if (a3 <= a2)
    v24 = 1;
  if ((v24 & 1) == 0)
  {
    pk_General_log();
    v25 = objc_claimAutoreleasedReturnValue();
    v26 = os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT);

    if (v26)
    {
      pk_General_log();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_213518000, v27, OS_LOG_TYPE_DEFAULT, "Notice: Generating potentially-missing description fields", buf, 2u);
      }

    }
    *(_QWORD *)buf = 0;
    v48 = buf;
    v49 = 0x3032000000;
    v50 = __Block_byref_object_copy__14;
    v51 = __Block_byref_object_dispose__14;
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v52 = (id)objc_claimAutoreleasedReturnValue();
    v28 = *(void **)(a1 + 32);
    v46[0] = MEMORY[0x24BDAC760];
    v46[1] = 3221225472;
    v46[2] = __28__NPKGizmoDatabase_database__block_invoke_181;
    v46[3] = &unk_24CFEB080;
    v46[5] = buf;
    v46[6] = a2;
    v46[4] = v28;
    objc_msgSend(v28, "_enumerateAllPassesForMigration:", v46);
    if (objc_msgSend(*((id *)v48 + 5), "count"))
    {
      if (v44)
        v10 = objc_msgSend(*(id *)(a1 + 32), "_updateNFCPayloadDuringMigration:", *((_QWORD *)v48 + 5));
      else
        v10 = 1;
      if ((v43 & v10) == 1)
        v10 = objc_msgSend(*(id *)(a1 + 32), "_updatePrivateLabelAndCobrandDuringMigration:", *((_QWORD *)v48 + 5));
      if (a2 <= 4 && (_DWORD)v10)
        v10 = objc_msgSend(*(id *)(a1 + 32), "_updateDeviceAndPreferredPaymentApplicationsDuringMigration:", *((_QWORD *)v48 + 5));
      if ((v42 & v10) == 1)
        v10 = objc_msgSend(*(id *)(a1 + 32), "_updateIngestedDatesDuringMigration:", *((_QWORD *)v48 + 5));
      if ((v41 & v10) == 1)
        v10 = objc_msgSend(*(id *)(a1 + 32), "_updateEffectivePaymentApplicationStateDuringMigration:", *((_QWORD *)v48 + 5));
      if ((v40 & v10) == 1)
        v10 = objc_msgSend(*(id *)(a1 + 32), "_updateHasUserSelectableContactlessPaymentApplications:", *((_QWORD *)v48 + 5));
      if (a2 <= 9 && (_DWORD)v10)
        v10 = objc_msgSend(*(id *)(a1 + 32), "_updateEncodedPaymentPassDuringMigration:", *((_QWORD *)v48 + 5));
      if (a2 <= 9 && (_DWORD)v10)
        v10 = objc_msgSend(*(id *)(a1 + 32), "_updateEffectivePaymentApplicationStateDuringMigration:", *((_QWORD *)v48 + 5));
      if (a2 <= 9 && (_DWORD)v10)
        v10 = objc_msgSend(*(id *)(a1 + 32), "_updateHasUserSelectableContactlessPaymentApplications:", *((_QWORD *)v48 + 5));
      if ((v39 & v10) == 1)
        v10 = objc_msgSend(*(id *)(a1 + 32), "_updateHasStoredValueDuringMigration:", *((_QWORD *)v48 + 5));
      if ((v38 & v10) == 1)
        v10 = objc_msgSend(*(id *)(a1 + 32), "_updateSettingsDuringMigration:", *((_QWORD *)v48 + 5));
      if (a2 <= 13 && (_DWORD)v10)
        v10 = objc_msgSend(*(id *)(a1 + 32), "_updateCompleteLocalHashesDuringMigration:", *((_QWORD *)v48 + 5));
      if ((v11 & v10) == 1)
        v10 = objc_msgSend(*(id *)(a1 + 32), "_updateAvailableActionsDuringMigration:", *((_QWORD *)v48 + 5));
      if ((v11 & v10) == 1)
        v10 = objc_msgSend(*(id *)(a1 + 32), "_updateOrganizationNamesDuringMigration:", *((_QWORD *)v48 + 5));
      if ((v11 & v10) == 1)
        v10 = objc_msgSend(*(id *)(a1 + 32), "_updateFrontAndBackFieldBucketsDuringMigration:", *((_QWORD *)v48 + 5));
      if ((v11 & v10) == 1)
        v10 = objc_msgSend(*(id *)(a1 + 32), "_updateLocalizedDescriptionDuringMigration:", *((_QWORD *)v48 + 5));
      if ((v11 & v10) == 1)
        v10 = objc_msgSend(*(id *)(a1 + 32), "_updateLocalizedDescriptionDuringMigration:", *((_QWORD *)v48 + 5));
      if ((v12 & v10) == 1)
        v10 = objc_msgSend(*(id *)(a1 + 32), "_updateDevicePaymentApplicationsDuringMigration:", *((_QWORD *)v48 + 5));
      if (a2 <= 33 && (_DWORD)v10)
        v10 = objc_msgSend(*(id *)(a1 + 32), "_updatePrimaryContactlessAndInAppPaymentApplicationsDuringMigration:", *((_QWORD *)v48 + 5));
      if ((v37 & v10) == 1)
        v10 = objc_msgSend(*(id *)(a1 + 32), "_updateEncodedImageSetsDuringMigration:", *((_QWORD *)v48 + 5));
      if (a2 <= 45 && (_DWORD)v10)
        v10 = objc_msgSend(*(id *)(a1 + 32), "_repairEncodedImagesDuringMigration:", *((_QWORD *)v48 + 5));
      if ((v36 & v10) == 1)
        v10 = objc_msgSend(*(id *)(a1 + 32), "_updateIssuerCountryCodesDuringMigration:", *((_QWORD *)v48 + 5));
      if ((v35 & v10) == 1)
        v10 = objc_msgSend(*(id *)(a1 + 32), "_updateExpressPassTypesMaskDuringMigration:", *((_QWORD *)v48 + 5));
      if ((v34 & v10) == 1)
      {
        if ((objc_msgSend(*(id *)(a1 + 32), "_table:containsColumn:", CFSTR("pass"), CFSTR("issuer_country_code")) & 1) != 0)
          v10 = 1;
        else
          v10 = objc_msgSend(*(id *)(a1 + 32), "_updateIssuerCountryCodesDuringMigration:", *((_QWORD *)v48 + 5));
      }
      if (a2 <= 54 && (_DWORD)v10)
        v10 = objc_msgSend(*(id *)(a1 + 32), "_updateCompleteRemoteHashesDuringMigration");
      v29 = v17 ^ 1;
      if (a2 > 57)
        v29 = 1;
      if ((v29 & 1) == 0 && (_DWORD)v10)
        v10 = objc_msgSend(*(id *)(a1 + 32), "_updateTransactionSourceIdentifiersDuringMigration:", *((_QWORD *)v48 + 5));
    }
    else
    {
      v10 = 1;
    }
    if (v20)
    {
      pk_General_log();
      v30 = objc_claimAutoreleasedReturnValue();
      v31 = os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT);

      if (v31)
      {
        pk_General_log();
        v32 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v45 = 0;
          _os_log_impl(&dword_213518000, v32, OS_LOG_TYPE_DEFAULT, "Notice: NPKGizmoDatabase: Re-encoding payment passes migration step needed", v45, 2u);
        }

      }
      objc_msgSend(*(id *)(a1 + 32), "_rebuildDatabaseWithPassesFromCompanionPasses");
    }
    _Block_object_dispose(buf, 8);

  }
  return v10;
}

void __28__NPKGizmoDatabase_database__block_invoke_181(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  unint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  uint64_t v47;
  void *v48;
  void *v49;
  void *v50;
  id v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  id v72;
  _QWORD v73[4];
  id v74;
  id v75;

  v72 = a2;
  v5 = a3;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(a1 + 48);
  if (v7 < 3)
  {
    objc_msgSend(v72, "nfcPayload");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(v72, "nfcPayload");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setObject:forKeyedSubscript:", v9, CFSTR("nfcPayload"));

    }
    v7 = *(_QWORD *)(a1 + 48);
  }
  if (v7 <= 3)
  {
    v10 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(v72, "paymentPass");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "numberWithBool:", objc_msgSend(v11, "isPrivateLabel"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v12, CFSTR("privateLabel"));

    v13 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(v72, "paymentPass");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "numberWithBool:", objc_msgSend(v14, "isCobranded"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v15, CFSTR("cobranded"));

    v7 = *(_QWORD *)(a1 + 48);
  }
  v16 = v72;
  if (v7 < 10)
  {
    objc_msgSend(v72, "paymentPass");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "_migrationDataSource");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "secureElementIdentifiers");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (v19)
      objc_msgSend(v17, "updateDevicePaymentApplicationsWithSecureElementIdentifiers:", v19);
    if (v17)
    {
      objc_msgSend(v17, "devicePrimaryPaymentApplication");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setObject:forKeyedSubscript:", v20, CFSTR("devicePrimaryPaymentApplication"));

      if (v5)
      {
        objc_msgSend(v17, "devicePaymentApplications");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v73[0] = MEMORY[0x24BDAC760];
        v73[1] = 3221225472;
        v73[2] = __28__NPKGizmoDatabase_database__block_invoke_2;
        v73[3] = &unk_24CFEB058;
        v74 = v5;
        v75 = v6;
        objc_msgSend(v21, "enumerateObjectsUsingBlock:", v73);

      }
      NPKSecureArchiveObject(v17);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setObject:forKeyedSubscript:", v22, CFSTR("encodedPass"));

    }
    v7 = *(_QWORD *)(a1 + 48);
    v16 = v72;
    if (v7 <= 5)
    {
      objc_msgSend(v72, "ingestedDate");
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      if (v23)
      {
        objc_msgSend(v72, "ingestedDate");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "setObject:forKeyedSubscript:", v24, CFSTR("ingestedDate"));

      }
      v7 = *(_QWORD *)(a1 + 48);
      v16 = v72;
    }
    if (v7 < 10)
    {
      objc_msgSend(v16, "paymentPass");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = v25;
      if (v25)
      {
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v25, "effectiveContactlessPaymentApplicationState"));
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "setObject:forKeyedSubscript:", v27, CFSTR("effectivePaymentApplicationState"));

      }
      v7 = *(_QWORD *)(a1 + 48);
      v16 = v72;
      if (v7 < 10)
      {
        objc_msgSend(v72, "paymentPass");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = v28;
        if (v28)
        {
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v28, "npkHasUserSelectableContactlessPaymentApplications"));
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "setObject:forKeyedSubscript:", v30, CFSTR("hasUserSelectableContactlessPaymentApplications"));

        }
        v7 = *(_QWORD *)(a1 + 48);
        v16 = v72;
      }
    }
  }
  if (v7 < 11)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v72, "hasStoredValue"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v31, CFSTR("hasStoredValue"));

    v16 = v72;
    v7 = *(_QWORD *)(a1 + 48);
  }
  if (v7 <= 11)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v72, "settings"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v32, CFSTR("settings"));

    v16 = v72;
    v7 = *(_QWORD *)(a1 + 48);
  }
  if (v7 <= 13)
  {
    objc_msgSend(v16, "npkCompleteHash");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v33, CFSTR("completeHash"));

    v34 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend((id)objc_opt_class(), "latestWatchOSMajorVersion"));
    if (objc_msgSend((id)objc_opt_class(), "latestWatchOSMajorVersion"))
    {
      v35 = 0;
      do
      {
        objc_msgSend(v72, "npkCompleteHashForWatchOSVersion:", v35 + 1);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "setObject:atIndexedSubscript:", v36, v35);

        ++v35;
      }
      while (v35 < objc_msgSend((id)objc_opt_class(), "latestWatchOSMajorVersion"));
    }
    v37 = (void *)objc_msgSend(v34, "copy");
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v37, CFSTR("completeLocalHashes"));

    v7 = *(_QWORD *)(a1 + 48);
    v16 = v72;
  }
  if (v7 <= 44)
  {
    objc_msgSend(v72, "paymentPass");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "availableActions");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v39, CFSTR("availableActions"));

    v16 = v72;
    if (*(uint64_t *)(a1 + 48) <= 44)
    {
      objc_msgSend(v72, "organizationName");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setObject:forKeyedSubscript:", v40, CFSTR("organizationName"));

      v16 = v72;
      if (*(uint64_t *)(a1 + 48) <= 44)
      {
        objc_msgSend(v72, "frontFieldBuckets");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "setObject:forKeyedSubscript:", v41, CFSTR("frontFieldBuckets"));

        objc_msgSend(v72, "backFieldBuckets");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "setObject:forKeyedSubscript:", v42, CFSTR("backFieldBuckets"));

        v16 = v72;
        if (*(uint64_t *)(a1 + 48) <= 44)
        {
          objc_msgSend(v72, "localizedDescription");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "setObject:forKeyedSubscript:", v43, CFSTR("localizedDescription"));

          v16 = v72;
        }
      }
    }
  }
  objc_msgSend(v16, "paymentPass");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  if (v44)
  {
    objc_msgSend((id)objc_opt_class(), "_migrationDataSource");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "secureElementIdentifiers");
    v46 = (void *)objc_claimAutoreleasedReturnValue();

    if (v46)
      objc_msgSend(v44, "updateDevicePaymentApplicationsWithSecureElementIdentifiers:", v46);

  }
  v47 = *(_QWORD *)(a1 + 48);
  if (v47 <= 27)
  {
    objc_msgSend(v44, "devicePaymentApplications");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v48, CFSTR("devicePaymentApplications"));

    v47 = *(_QWORD *)(a1 + 48);
  }
  if (v47 <= 33)
  {
    objc_msgSend(v44, "devicePrimaryContactlessPaymentApplication");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v49, CFSTR("devicePrimaryContactlessPaymentApplication"));

    objc_msgSend(v44, "devicePrimaryInAppPaymentApplication");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v50, CFSTR("devicePrimaryInAppPaymentApplication"));

    v47 = *(_QWORD *)(a1 + 48);
  }
  if (v47 <= 43)
  {
    v51 = objc_alloc(MEMORY[0x24BE6EBC0]);
    v52 = (void *)objc_msgSend(v51, "initWithDictionary:bundle:", MEMORY[0x24BDBD1B8], 0);
    if (v52)
    {
      v53 = (void *)objc_msgSend(v72, "copy");
      objc_msgSend(v52, "setMissingImageSetsFromObject:", v53);
      objc_msgSend(v53, "flushLoadedImageSets");
      NPKSecureArchiveObject(v52);
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setObject:forKeyedSubscript:", v54, CFSTR("encodedImageSets"));

      NPKSecureArchiveObject(v53);
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setObject:forKeyedSubscript:", v55, CFSTR("encodedPassWithoutImageSets"));

    }
    v47 = *(_QWORD *)(a1 + 48);
  }
  if (v47 < 46)
  {
    objc_msgSend(v72, "logoImage");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v57 = v56;
    if (v56)
    {
      NPKSecureArchiveObject(v56);
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      if (v58)
        objc_msgSend(v6, "setObject:forKeyedSubscript:", v58, CFSTR("encodedLogoImageData"));

    }
    objc_msgSend(v72, "backgroundImage");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v59)
      goto LABEL_63;
    if (objc_msgSend(v72, "style") == 2)
    {
      v60 = (void *)MEMORY[0x24BE6EB68];
      objc_msgSend(v72, "backgroundImage");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v61, "size");
      objc_msgSend(v60, "constraintsWithFixedSize:");
      v62 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v72, "backgroundImage");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v63, "blurredImageWithRadius:constraints:", 27, v62);
      v64 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v64)
        goto LABEL_62;
    }
    else
    {
      objc_msgSend(v72, "backgroundImage");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v64)
      {
LABEL_62:

LABEL_63:
        v47 = *(_QWORD *)(a1 + 48);
        goto LABEL_64;
      }
    }
    NPKSecureArchiveObject(v64);
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v65, CFSTR("encodedBackgroundImageData"));

    goto LABEL_62;
  }
LABEL_64:
  if (v47 < 47)
  {
    objc_msgSend(v44, "issuerCountryCode");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v66, CFSTR("issuerCountryCode"));

    v47 = *(_QWORD *)(a1 + 48);
  }
  if (v47 <= 47)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", NPKPassDescriptionExpressTypesMaskWithPass(v72));
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v67, CFSTR("expressPassTypesMask"));

    v47 = *(_QWORD *)(a1 + 48);
  }
  if ((unint64_t)(v47 - 48) <= 2)
  {
    if ((objc_msgSend(*(id *)(a1 + 32), "_table:containsColumn:", CFSTR("pass"), CFSTR("issuer_country_code")) & 1) == 0)
    {
      objc_msgSend(v44, "issuerCountryCode");
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setObject:forKeyedSubscript:", v68, CFSTR("issuerCountryCode"));

    }
    v47 = *(_QWORD *)(a1 + 48);
  }
  if (v47 <= 54)
  {
    objc_msgSend(v6, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], CFSTR("migrateCompleteHashes"));
    v47 = *(_QWORD *)(a1 + 48);
  }
  if (v44 && v47 <= 57)
  {
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v69, "UUIDString");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v70, CFSTR("transactionSourceIdentifier"));

  }
  if (objc_msgSend(v6, "count"))
  {
    objc_msgSend(v72, "uniqueID");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v71, CFSTR("uniqueID"));

    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "addObject:", v6);
  }

}

void __28__NPKGizmoDatabase_database__block_invoke_2(uint64_t a1, void *a2, _BYTE *a3)
{
  void *v5;
  int v6;
  id v7;

  v7 = a2;
  objc_msgSend(v7, "applicationIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", *(_QWORD *)(a1 + 32));

  if (v6)
  {
    objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v7, CFSTR("preferredPaymentApplication"));
    *a3 = 1;
  }

}

- (sqlite3_stmt)deleteStatement
{
  sqlite3_stmt **p_deleteStatement;
  NSObject *v3;
  _BOOL4 v4;
  NSObject *v5;
  int v7;
  const char *v8;
  __int16 v9;
  const char *v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  p_deleteStatement = &self->_deleteStatement;
  if (!self->_deleteStatement
    && sqlite3_prepare_v2(-[NPKGizmoDatabase database](self, "database"), "DELETE FROM pass WHERE unique_id = ?", -1, p_deleteStatement, 0))
  {
    pk_General_log();
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = os_log_type_enabled(v3, OS_LOG_TYPE_ERROR);

    if (v4)
    {
      pk_General_log();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        v7 = 136446722;
        v8 = "-[NPKGizmoDatabase deleteStatement]";
        v9 = 2082;
        v10 = "/Library/Caches/com.apple.xbs/Sources/NanoPassbook_Frameworks/NanoPassKit/NPKGizmoDatabase.m";
        v11 = 2048;
        v12 = 1034;
        _os_log_impl(&dword_213518000, v5, OS_LOG_TYPE_ERROR, "Error: *** NPKAssertion failure in %{public}s, %{public}s:%ld (reason: Unable to prepare deletion statement)", (uint8_t *)&v7, 0x20u);
      }

    }
    _NPKAssertAbort();
  }
  return *p_deleteStatement;
}

- (sqlite3_stmt)insertStatement
{
  sqlite3_stmt **p_insertStatement;
  NSObject *v3;
  _BOOL4 v4;
  NSObject *v5;
  int v7;
  const char *v8;
  __int16 v9;
  const char *v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  p_insertStatement = &self->_insertStatement;
  if (!self->_insertStatement
    && sqlite3_prepare_v2(-[NPKGizmoDatabase database](self, "database"), "INSERT INTO pass (unique_id, type_id, style, hash, encoded_pass, encoded_image_sets, encoded_diff, logo_text, logo_image, background_color, label_color, foreground_color, background_image, nfc_payload, private_label, cobranded, device_payment_applications, device_primary_payment_application, device_primary_contactless_payment_application, device_primary_in_app_payment_application, preferred_aid, preferred_payment_application, ingested_date, complete_hash, delete_pending, effective_payment_application_state, has_user_selectable_payment_applications, has_stored_value, settings, complete_hashes, issuer_country_code, available_actions, organization_name, felica_transit_applet_state, front_field_buckets, back_field_buckets, last_add_value_amount, localized_description, pending_add_value_date, express_pass_types_mask, complete_remote_hashes, supports_pp, balances, subcredentials) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", -1, p_insertStatement, 0))
  {
    pk_General_log();
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = os_log_type_enabled(v3, OS_LOG_TYPE_ERROR);

    if (v4)
    {
      pk_General_log();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        v7 = 136446722;
        v8 = "-[NPKGizmoDatabase insertStatement]";
        v9 = 2082;
        v10 = "/Library/Caches/com.apple.xbs/Sources/NanoPassbook_Frameworks/NanoPassKit/NPKGizmoDatabase.m";
        v11 = 2048;
        v12 = 1044;
        _os_log_impl(&dword_213518000, v5, OS_LOG_TYPE_ERROR, "Error: *** NPKAssertion failure in %{public}s, %{public}s:%ld (reason: Unable to prepare pass insertion statement)", (uint8_t *)&v7, 0x20u);
      }

    }
    _NPKAssertAbort();
  }
  return *p_insertStatement;
}

- (sqlite3_stmt)insertDiffStatement
{
  sqlite3_stmt **p_insertDiffStatement;
  NSObject *v3;
  _BOOL4 v4;
  NSObject *v5;
  int v7;
  const char *v8;
  __int16 v9;
  const char *v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  p_insertDiffStatement = &self->_insertDiffStatement;
  if (!self->_insertDiffStatement
    && sqlite3_prepare_v2(-[NPKGizmoDatabase database](self, "database"), "UPDATE pass SET encoded_diff = ? WHERE unique_id = ?", -1, p_insertDiffStatement, 0))
  {
    pk_General_log();
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = os_log_type_enabled(v3, OS_LOG_TYPE_ERROR);

    if (v4)
    {
      pk_General_log();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        v7 = 136446722;
        v8 = "-[NPKGizmoDatabase insertDiffStatement]";
        v9 = 2082;
        v10 = "/Library/Caches/com.apple.xbs/Sources/NanoPassbook_Frameworks/NanoPassKit/NPKGizmoDatabase.m";
        v11 = 2048;
        v12 = 1054;
        _os_log_impl(&dword_213518000, v5, OS_LOG_TYPE_ERROR, "Error: *** NPKAssertion failure in %{public}s, %{public}s:%ld (reason: Unable to prepare diff insertion statement)", (uint8_t *)&v7, 0x20u);
      }

    }
    _NPKAssertAbort();
  }
  return *p_insertDiffStatement;
}

- (sqlite3_stmt)updateDeletePendingStatement
{
  sqlite3_stmt **p_updateDeletePendingStatement;
  NSObject *v3;
  _BOOL4 v4;
  NSObject *v5;
  int v7;
  const char *v8;
  __int16 v9;
  const char *v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  p_updateDeletePendingStatement = &self->_updateDeletePendingStatement;
  if (!self->_updateDeletePendingStatement
    && sqlite3_prepare_v2(-[NPKGizmoDatabase database](self, "database"), "UPDATE pass SET delete_pending = ? WHERE unique_id = ?", -1, p_updateDeletePendingStatement, 0))
  {
    pk_General_log();
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = os_log_type_enabled(v3, OS_LOG_TYPE_ERROR);

    if (v4)
    {
      pk_General_log();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        v7 = 136446722;
        v8 = "-[NPKGizmoDatabase updateDeletePendingStatement]";
        v9 = 2082;
        v10 = "/Library/Caches/com.apple.xbs/Sources/NanoPassbook_Frameworks/NanoPassKit/NPKGizmoDatabase.m";
        v11 = 2048;
        v12 = 1064;
        _os_log_impl(&dword_213518000, v5, OS_LOG_TYPE_ERROR, "Error: *** NPKAssertion failure in %{public}s, %{public}s:%ld (reason: Unable to prepare \"update delete pending\" statement)", (uint8_t *)&v7, 0x20u);
      }

    }
    _NPKAssertAbort();
  }
  return *p_updateDeletePendingStatement;
}

- (sqlite3_stmt)selectDeletePendingStatement
{
  sqlite3_stmt **p_selectDeletePendingStatement;
  NSObject *v3;
  _BOOL4 v4;
  NSObject *v5;
  int v7;
  const char *v8;
  __int16 v9;
  const char *v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  p_selectDeletePendingStatement = &self->_selectDeletePendingStatement;
  if (!self->_selectDeletePendingStatement
    && sqlite3_prepare_v2(-[NPKGizmoDatabase database](self, "database"), "SELECT delete_pending FROM pass WHERE unique_id = ?", -1, p_selectDeletePendingStatement, 0))
  {
    pk_General_log();
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = os_log_type_enabled(v3, OS_LOG_TYPE_ERROR);

    if (v4)
    {
      pk_General_log();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        v7 = 136446722;
        v8 = "-[NPKGizmoDatabase selectDeletePendingStatement]";
        v9 = 2082;
        v10 = "/Library/Caches/com.apple.xbs/Sources/NanoPassbook_Frameworks/NanoPassKit/NPKGizmoDatabase.m";
        v11 = 2048;
        v12 = 1073;
        _os_log_impl(&dword_213518000, v5, OS_LOG_TYPE_ERROR, "Error: *** NPKAssertion failure in %{public}s, %{public}s:%ld (reason: Unable to prepare \"select pass diff\" statement)", (uint8_t *)&v7, 0x20u);
      }

    }
    _NPKAssertAbort();
  }
  return *p_selectDeletePendingStatement;
}

- (sqlite3_stmt)updatePreferredAIDStatement
{
  sqlite3_stmt **p_updatePreferredAIDStatement;
  NSObject *v3;
  _BOOL4 v4;
  NSObject *v5;
  int v7;
  const char *v8;
  __int16 v9;
  const char *v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  p_updatePreferredAIDStatement = &self->_updatePreferredAIDStatement;
  if (!self->_updatePreferredAIDStatement
    && sqlite3_prepare_v2(-[NPKGizmoDatabase database](self, "database"), "UPDATE pass SET preferred_aid = ?, preferred_payment_application = ? WHERE unique_id = ?", -1, p_updatePreferredAIDStatement, 0))
  {
    pk_General_log();
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = os_log_type_enabled(v3, OS_LOG_TYPE_ERROR);

    if (v4)
    {
      pk_General_log();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        v7 = 136446722;
        v8 = "-[NPKGizmoDatabase updatePreferredAIDStatement]";
        v9 = 2082;
        v10 = "/Library/Caches/com.apple.xbs/Sources/NanoPassbook_Frameworks/NanoPassKit/NPKGizmoDatabase.m";
        v11 = 2048;
        v12 = 1083;
        _os_log_impl(&dword_213518000, v5, OS_LOG_TYPE_ERROR, "Error: *** NPKAssertion failure in %{public}s, %{public}s:%ld (reason: Unable to prepare \"update delete pending\" statement)", (uint8_t *)&v7, 0x20u);
      }

    }
    _NPKAssertAbort();
  }
  return *p_updatePreferredAIDStatement;
}

- (sqlite3_stmt)selectPreferredAIDStatement
{
  sqlite3_stmt **p_selectPreferredAIDStatement;
  NSObject *v3;
  _BOOL4 v4;
  NSObject *v5;
  int v7;
  const char *v8;
  __int16 v9;
  const char *v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  p_selectPreferredAIDStatement = &self->_selectPreferredAIDStatement;
  if (!self->_selectPreferredAIDStatement
    && sqlite3_prepare_v2(-[NPKGizmoDatabase database](self, "database"), "SELECT preferred_aid FROM pass WHERE unique_id = ?", -1, p_selectPreferredAIDStatement, 0))
  {
    pk_General_log();
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = os_log_type_enabled(v3, OS_LOG_TYPE_ERROR);

    if (v4)
    {
      pk_General_log();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        v7 = 136446722;
        v8 = "-[NPKGizmoDatabase selectPreferredAIDStatement]";
        v9 = 2082;
        v10 = "/Library/Caches/com.apple.xbs/Sources/NanoPassbook_Frameworks/NanoPassKit/NPKGizmoDatabase.m";
        v11 = 2048;
        v12 = 1092;
        _os_log_impl(&dword_213518000, v5, OS_LOG_TYPE_ERROR, "Error: *** NPKAssertion failure in %{public}s, %{public}s:%ld (reason: Unable to prepare \"select pass diff\" statement)", (uint8_t *)&v7, 0x20u);
      }

    }
    _NPKAssertAbort();
  }
  return *p_selectPreferredAIDStatement;
}

- (sqlite3_stmt)selectPassDataStatement
{
  sqlite3_stmt **p_selectPassDataStatement;
  NSObject *v3;
  _BOOL4 v4;
  NSObject *v5;
  int v7;
  const char *v8;
  __int16 v9;
  const char *v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  p_selectPassDataStatement = &self->_selectPassDataStatement;
  if (!self->_selectPassDataStatement
    && sqlite3_prepare_v2(-[NPKGizmoDatabase database](self, "database"), "SELECT encoded_pass FROM pass WHERE unique_id = ?", -1, p_selectPassDataStatement, 0))
  {
    pk_General_log();
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = os_log_type_enabled(v3, OS_LOG_TYPE_ERROR);

    if (v4)
    {
      pk_General_log();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        v7 = 136446722;
        v8 = "-[NPKGizmoDatabase selectPassDataStatement]";
        v9 = 2082;
        v10 = "/Library/Caches/com.apple.xbs/Sources/NanoPassbook_Frameworks/NanoPassKit/NPKGizmoDatabase.m";
        v11 = 2048;
        v12 = 1101;
        _os_log_impl(&dword_213518000, v5, OS_LOG_TYPE_ERROR, "Error: *** NPKAssertion failure in %{public}s, %{public}s:%ld (reason: Unable to prepare \"select pass data\" statement)", (uint8_t *)&v7, 0x20u);
      }

    }
    _NPKAssertAbort();
  }
  return *p_selectPassDataStatement;
}

- (sqlite3_stmt)selectPassAndImageSetsDataStatement
{
  sqlite3_stmt **p_selectPassAndImageSetsDataStatement;
  NSObject *v3;
  _BOOL4 v4;
  NSObject *v5;
  int v7;
  const char *v8;
  __int16 v9;
  const char *v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  p_selectPassAndImageSetsDataStatement = &self->_selectPassAndImageSetsDataStatement;
  if (!self->_selectPassAndImageSetsDataStatement
    && sqlite3_prepare_v2(-[NPKGizmoDatabase database](self, "database"), "SELECT encoded_pass, encoded_image_sets FROM pass WHERE unique_id = ?", -1, p_selectPassAndImageSetsDataStatement, 0))
  {
    pk_General_log();
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = os_log_type_enabled(v3, OS_LOG_TYPE_ERROR);

    if (v4)
    {
      pk_General_log();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        v7 = 136446722;
        v8 = "-[NPKGizmoDatabase selectPassAndImageSetsDataStatement]";
        v9 = 2082;
        v10 = "/Library/Caches/com.apple.xbs/Sources/NanoPassbook_Frameworks/NanoPassKit/NPKGizmoDatabase.m";
        v11 = 2048;
        v12 = 1112;
        _os_log_impl(&dword_213518000, v5, OS_LOG_TYPE_ERROR, "Error: *** NPKAssertion failure in %{public}s, %{public}s:%ld (reason: Unable to prepare \"select pass data\" statement)", (uint8_t *)&v7, 0x20u);
      }

    }
    _NPKAssertAbort();
  }
  return *p_selectPassAndImageSetsDataStatement;
}

- (sqlite3_stmt)selectPassDiffStatement
{
  sqlite3_stmt **p_selectPassDiffStatement;
  NSObject *v3;
  _BOOL4 v4;
  NSObject *v5;
  int v7;
  const char *v8;
  __int16 v9;
  const char *v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  p_selectPassDiffStatement = &self->_selectPassDiffStatement;
  if (!self->_selectPassDiffStatement
    && sqlite3_prepare_v2(-[NPKGizmoDatabase database](self, "database"), "SELECT encoded_diff FROM pass WHERE unique_id = ?", -1, p_selectPassDiffStatement, 0))
  {
    pk_General_log();
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = os_log_type_enabled(v3, OS_LOG_TYPE_ERROR);

    if (v4)
    {
      pk_General_log();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        v7 = 136446722;
        v8 = "-[NPKGizmoDatabase selectPassDiffStatement]";
        v9 = 2082;
        v10 = "/Library/Caches/com.apple.xbs/Sources/NanoPassbook_Frameworks/NanoPassKit/NPKGizmoDatabase.m";
        v11 = 2048;
        v12 = 1121;
        _os_log_impl(&dword_213518000, v5, OS_LOG_TYPE_ERROR, "Error: *** NPKAssertion failure in %{public}s, %{public}s:%ld (reason: Unable to prepare \"select pass diff\" statement)", (uint8_t *)&v7, 0x20u);
      }

    }
    _NPKAssertAbort();
  }
  return *p_selectPassDiffStatement;
}

- (sqlite3_stmt)insertTransactionStatement
{
  sqlite3_stmt **p_insertTransactionStatement;
  NSObject *v3;
  _BOOL4 v4;
  NSObject *v5;
  int v7;
  const char *v8;
  __int16 v9;
  const char *v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  p_insertTransactionStatement = &self->_insertTransactionStatement;
  if (!self->_insertTransactionStatement
    && sqlite3_prepare_v2(-[NPKGizmoDatabase database](self, "database"), "INSERT INTO transactions (transaction_source_identifier, pass_unique_id, transaction_id, transaction_date, transaction_source, transaction_type, has_notification_service_data, encoded_transaction, cloudkit_archived, service_identifier) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", -1, p_insertTransactionStatement, 0))
  {
    pk_General_log();
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = os_log_type_enabled(v3, OS_LOG_TYPE_ERROR);

    if (v4)
    {
      pk_General_log();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        v7 = 136446722;
        v8 = "-[NPKGizmoDatabase insertTransactionStatement]";
        v9 = 2082;
        v10 = "/Library/Caches/com.apple.xbs/Sources/NanoPassbook_Frameworks/NanoPassKit/NPKGizmoDatabase.m";
        v11 = 2048;
        v12 = 1130;
        _os_log_impl(&dword_213518000, v5, OS_LOG_TYPE_ERROR, "Error: *** NPKAssertion failure in %{public}s, %{public}s:%ld (reason: Unable to prepare \"insert transaction\" statement)", (uint8_t *)&v7, 0x20u);
      }

    }
    _NPKAssertAbort();
  }
  return *p_insertTransactionStatement;
}

- (sqlite3_stmt)removeTransactionStatement
{
  sqlite3_stmt **p_removeTransactionStatement;
  NSObject *v3;
  _BOOL4 v4;
  NSObject *v5;
  int v7;
  const char *v8;
  __int16 v9;
  const char *v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  p_removeTransactionStatement = &self->_removeTransactionStatement;
  if (!self->_removeTransactionStatement
    && sqlite3_prepare_v2(-[NPKGizmoDatabase database](self, "database"), "DELETE FROM transactions WHERE transaction_id = ?", -1, p_removeTransactionStatement, 0))
  {
    pk_General_log();
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = os_log_type_enabled(v3, OS_LOG_TYPE_ERROR);

    if (v4)
    {
      pk_General_log();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        v7 = 136446722;
        v8 = "-[NPKGizmoDatabase removeTransactionStatement]";
        v9 = 2082;
        v10 = "/Library/Caches/com.apple.xbs/Sources/NanoPassbook_Frameworks/NanoPassKit/NPKGizmoDatabase.m";
        v11 = 2048;
        v12 = 1138;
        _os_log_impl(&dword_213518000, v5, OS_LOG_TYPE_ERROR, "Error: *** NPKAssertion failure in %{public}s, %{public}s:%ld (reason: Unable to prepare \"remove transaction\" statement)", (uint8_t *)&v7, 0x20u);
      }

    }
    _NPKAssertAbort();
  }
  return *p_removeTransactionStatement;
}

- (sqlite3_stmt)removeTransactionWithServiceIdentifierStatement
{
  sqlite3_stmt **p_removeTransactionWithServiceIdentifier;
  NSObject *v3;
  _BOOL4 v4;
  NSObject *v5;
  int v7;
  const char *v8;
  __int16 v9;
  const char *v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  p_removeTransactionWithServiceIdentifier = &self->_removeTransactionWithServiceIdentifier;
  if (!self->_removeTransactionWithServiceIdentifier
    && sqlite3_prepare_v2(-[NPKGizmoDatabase database](self, "database"), "DELETE FROM transactions WHERE transaction_source_identifier = ? AND service_identifier = ?", -1, p_removeTransactionWithServiceIdentifier, 0))
  {
    pk_General_log();
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = os_log_type_enabled(v3, OS_LOG_TYPE_ERROR);

    if (v4)
    {
      pk_General_log();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        v7 = 136446722;
        v8 = "-[NPKGizmoDatabase removeTransactionWithServiceIdentifierStatement]";
        v9 = 2082;
        v10 = "/Library/Caches/com.apple.xbs/Sources/NanoPassbook_Frameworks/NanoPassKit/NPKGizmoDatabase.m";
        v11 = 2048;
        v12 = 1146;
        _os_log_impl(&dword_213518000, v5, OS_LOG_TYPE_ERROR, "Error: *** NPKAssertion failure in %{public}s, %{public}s:%ld (reason: Unable to prepare \"remove transaction with service identifier\" statement)", (uint8_t *)&v7, 0x20u);
      }

    }
    _NPKAssertAbort();
  }
  return *p_removeTransactionWithServiceIdentifier;
}

- (sqlite3_stmt)selectTransactionsStatementWithTransactionSource:(unint64_t)a3 orderByDate:(int64_t)a4 limit:(unint64_t)a5
{
  __CFString *v8;
  void *v9;
  void *v10;
  id v11;
  sqlite3_stmt **p_selectTransactionsStatementWithoutSource;
  sqlite3 *v13;
  NSObject *v14;
  _BOOL4 v15;
  NSObject *v16;
  const char *v17;
  sqlite3 *v18;
  NSObject *v19;
  _BOOL4 v20;
  sqlite3 *v21;
  NSObject *v22;
  _BOOL4 v23;
  sqlite3_stmt *v24;
  uint8_t buf[4];
  const char *v27;
  __int16 v28;
  const char *v29;
  __int16 v30;
  uint64_t v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  if (a4 == -1)
    v8 = CFSTR("ORDER BY transaction_date ASC");
  else
    v8 = CFSTR("ORDER BY transaction_date DESC");
  v9 = (void *)-[__CFString mutableCopy](v8, "mutableCopy");
  v10 = v9;
  if (a5)
    objc_msgSend(v9, "appendString:", CFSTR(" LIMIT ?"));
  if (a3 == 2)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ AND transaction_source == 0 %@"), CFSTR("SELECT encoded_transaction FROM transactions WHERE transaction_source_identifier = ? AND ((? OR has_notification_service_data == ?) OR ((? OR transaction_type == ?) AND (? OR transaction_type != ?))) AND transaction_date >= ? AND transaction_date <= ?"), v10);
    v11 = (id)objc_claimAutoreleasedReturnValue();
    p_selectTransactionsStatementWithoutSource = &self->_selectTransactionsStatementWithoutSource;
    if (self->_selectTransactionsStatementWithoutSource)
      goto LABEL_27;
    v18 = -[NPKGizmoDatabase database](self, "database");
    v11 = objc_retainAutorelease(v11);
    if (!sqlite3_prepare_v2(v18, (const char *)objc_msgSend(v11, "UTF8String"), -1, p_selectTransactionsStatementWithoutSource, 0))goto LABEL_27;
    pk_General_log();
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = os_log_type_enabled(v19, OS_LOG_TYPE_ERROR);

    if (!v20)
      goto LABEL_26;
    pk_General_log();
    v16 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      goto LABEL_25;
    *(_DWORD *)buf = 136446722;
    v27 = "-[NPKGizmoDatabase selectTransactionsStatementWithTransactionSource:orderByDate:limit:]";
    v28 = 2082;
    v29 = "/Library/Caches/com.apple.xbs/Sources/NanoPassbook_Frameworks/NanoPassKit/NPKGizmoDatabase.m";
    v30 = 2048;
    v31 = 1191;
    v17 = "Error: *** NPKAssertion failure in %{public}s, %{public}s:%ld (reason: Unable to prepare \"select transactions"
          " without source for pass\" statement)";
    goto LABEL_24;
  }
  if (a3 == 1)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ AND transaction_source != 0 %@"), CFSTR("SELECT encoded_transaction FROM transactions WHERE transaction_source_identifier = ? AND ((? OR has_notification_service_data == ?) OR ((? OR transaction_type == ?) AND (? OR transaction_type != ?))) AND transaction_date >= ? AND transaction_date <= ?"), v10);
    v11 = (id)objc_claimAutoreleasedReturnValue();
    p_selectTransactionsStatementWithoutSource = &self->_selectTransactionsStatementWithSource;
    if (self->_selectTransactionsStatementWithSource)
      goto LABEL_27;
    v21 = -[NPKGizmoDatabase database](self, "database");
    v11 = objc_retainAutorelease(v11);
    if (!sqlite3_prepare_v2(v21, (const char *)objc_msgSend(v11, "UTF8String"), -1, p_selectTransactionsStatementWithoutSource, 0))goto LABEL_27;
    pk_General_log();
    v22 = objc_claimAutoreleasedReturnValue();
    v23 = os_log_type_enabled(v22, OS_LOG_TYPE_ERROR);

    if (!v23)
      goto LABEL_26;
    pk_General_log();
    v16 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
LABEL_25:

LABEL_26:
      _NPKAssertAbort();
    }
    *(_DWORD *)buf = 136446722;
    v27 = "-[NPKGizmoDatabase selectTransactionsStatementWithTransactionSource:orderByDate:limit:]";
    v28 = 2082;
    v29 = "/Library/Caches/com.apple.xbs/Sources/NanoPassbook_Frameworks/NanoPassKit/NPKGizmoDatabase.m";
    v30 = 2048;
    v31 = 1184;
    v17 = "Error: *** NPKAssertion failure in %{public}s, %{public}s:%ld (reason: Unable to prepare \"select transactions"
          " with source for pass\" statement)";
LABEL_24:
    _os_log_impl(&dword_213518000, v16, OS_LOG_TYPE_ERROR, v17, buf, 0x20u);
    goto LABEL_25;
  }
  if (a3)
  {
    v24 = 0;
    goto LABEL_29;
  }
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), CFSTR("SELECT encoded_transaction FROM transactions WHERE transaction_source_identifier = ? AND ((? OR has_notification_service_data == ?) OR ((? OR transaction_type == ?) AND (? OR transaction_type != ?))) AND transaction_date >= ? AND transaction_date <= ?"), v10);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  p_selectTransactionsStatementWithoutSource = &self->_selectTransactionsStatement;
  if (!self->_selectTransactionsStatement)
  {
    v13 = -[NPKGizmoDatabase database](self, "database");
    v11 = objc_retainAutorelease(v11);
    if (sqlite3_prepare_v2(v13, (const char *)objc_msgSend(v11, "UTF8String"), -1, p_selectTransactionsStatementWithoutSource, 0))
    {
      pk_General_log();
      v14 = objc_claimAutoreleasedReturnValue();
      v15 = os_log_type_enabled(v14, OS_LOG_TYPE_ERROR);

      if (!v15)
        goto LABEL_26;
      pk_General_log();
      v16 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        goto LABEL_25;
      *(_DWORD *)buf = 136446722;
      v27 = "-[NPKGizmoDatabase selectTransactionsStatementWithTransactionSource:orderByDate:limit:]";
      v28 = 2082;
      v29 = "/Library/Caches/com.apple.xbs/Sources/NanoPassbook_Frameworks/NanoPassKit/NPKGizmoDatabase.m";
      v30 = 2048;
      v31 = 1177;
      v17 = "Error: *** NPKAssertion failure in %{public}s, %{public}s:%ld (reason: Unable to prepare \"select transactio"
            "ns for pass\" statement)";
      goto LABEL_24;
    }
  }
LABEL_27:
  v24 = *p_selectTransactionsStatementWithoutSource;

LABEL_29:
  return v24;
}

- (sqlite3_stmt)selectTransactionWithIdentifierStatement
{
  sqlite3_stmt **p_selectTransactionWithIdentifierStatement;
  NSObject *v3;
  _BOOL4 v4;
  NSObject *v5;
  int v7;
  const char *v8;
  __int16 v9;
  const char *v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  p_selectTransactionWithIdentifierStatement = &self->_selectTransactionWithIdentifierStatement;
  if (!self->_selectTransactionWithIdentifierStatement
    && sqlite3_prepare_v2(-[NPKGizmoDatabase database](self, "database"), "SELECT encoded_transaction FROM transactions WHERE transaction_id = ?", -1, p_selectTransactionWithIdentifierStatement, 0))
  {
    pk_General_log();
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = os_log_type_enabled(v3, OS_LOG_TYPE_ERROR);

    if (v4)
    {
      pk_General_log();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        v7 = 136446722;
        v8 = "-[NPKGizmoDatabase selectTransactionWithIdentifierStatement]";
        v9 = 2082;
        v10 = "/Library/Caches/com.apple.xbs/Sources/NanoPassbook_Frameworks/NanoPassKit/NPKGizmoDatabase.m";
        v11 = 2048;
        v12 = 1203;
        _os_log_impl(&dword_213518000, v5, OS_LOG_TYPE_ERROR, "Error: *** NPKAssertion failure in %{public}s, %{public}s:%ld (reason: Unable to prepare \"select transaction\" statement)", (uint8_t *)&v7, 0x20u);
      }

    }
    _NPKAssertAbort();
  }
  return *p_selectTransactionWithIdentifierStatement;
}

- (sqlite3_stmt)selectTransactionWithServiceIdentifierStatement
{
  sqlite3_stmt **p_selectTransactionWithIdentifierStatement;
  NSObject *v3;
  _BOOL4 v4;
  NSObject *v5;
  int v7;
  const char *v8;
  __int16 v9;
  const char *v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  p_selectTransactionWithIdentifierStatement = &self->_selectTransactionWithIdentifierStatement;
  if (!self->_selectTransactionWithIdentifierStatement
    && sqlite3_prepare_v2(-[NPKGizmoDatabase database](self, "database"), "SELECT encoded_transaction FROM transactions WHERE service_identifier = ?", -1, p_selectTransactionWithIdentifierStatement, 0))
  {
    pk_General_log();
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = os_log_type_enabled(v3, OS_LOG_TYPE_ERROR);

    if (v4)
    {
      pk_General_log();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        v7 = 136446722;
        v8 = "-[NPKGizmoDatabase selectTransactionWithServiceIdentifierStatement]";
        v9 = 2082;
        v10 = "/Library/Caches/com.apple.xbs/Sources/NanoPassbook_Frameworks/NanoPassKit/NPKGizmoDatabase.m";
        v11 = 2048;
        v12 = 1211;
        _os_log_impl(&dword_213518000, v5, OS_LOG_TYPE_ERROR, "Error: *** NPKAssertion failure in %{public}s, %{public}s:%ld (reason: Unable to prepare \"select transaction with service identifier\" statement)", (uint8_t *)&v7, 0x20u);
      }

    }
    _NPKAssertAbort();
  }
  return *p_selectTransactionWithIdentifierStatement;
}

- (sqlite3_stmt)insertTransactionSourceIdentifierForPassStatement
{
  sqlite3_stmt **p_insertTransactionSourceIdentifierForPassStatement;
  NSObject *v3;
  _BOOL4 v4;
  NSObject *v5;
  int v7;
  const char *v8;
  __int16 v9;
  const char *v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  p_insertTransactionSourceIdentifierForPassStatement = &self->_insertTransactionSourceIdentifierForPassStatement;
  if (!self->_insertTransactionSourceIdentifierForPassStatement
    && sqlite3_prepare_v2(-[NPKGizmoDatabase database](self, "database"), "INSERT INTO transaction_source (transaction_source_identifier, type, pass_unique_id) VALUES (?, ?, ?)", -1, p_insertTransactionSourceIdentifierForPassStatement, 0))
  {
    pk_General_log();
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = os_log_type_enabled(v3, OS_LOG_TYPE_ERROR);

    if (v4)
    {
      pk_General_log();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        v7 = 136446722;
        v8 = "-[NPKGizmoDatabase insertTransactionSourceIdentifierForPassStatement]";
        v9 = 2082;
        v10 = "/Library/Caches/com.apple.xbs/Sources/NanoPassbook_Frameworks/NanoPassKit/NPKGizmoDatabase.m";
        v11 = 2048;
        v12 = 1219;
        _os_log_impl(&dword_213518000, v5, OS_LOG_TYPE_ERROR, "Error: *** NPKAssertion failure in %{public}s, %{public}s:%ld (reason: Unable to prepare \"insert transaction source identifier for pass\" statement)", (uint8_t *)&v7, 0x20u);
      }

    }
    _NPKAssertAbort();
  }
  return *p_insertTransactionSourceIdentifierForPassStatement;
}

- (sqlite3_stmt)selectTransactionSourceIdentifierForTransactionWithIdentifierStatement
{
  sqlite3_stmt **p_selectTransactionSourceIdentifierForTransactionWithIdentifierStatement;
  NSObject *v3;
  _BOOL4 v4;
  NSObject *v5;
  int v7;
  const char *v8;
  __int16 v9;
  const char *v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  p_selectTransactionSourceIdentifierForTransactionWithIdentifierStatement = &self->_selectTransactionSourceIdentifierForTransactionWithIdentifierStatement;
  if (!self->_selectTransactionSourceIdentifierForTransactionWithIdentifierStatement
    && sqlite3_prepare_v2(-[NPKGizmoDatabase database](self, "database"), "SELECT transaction_source_identifier FROM transactions WHERE transaction_id = ?", -1, p_selectTransactionSourceIdentifierForTransactionWithIdentifierStatement, 0))
  {
    pk_General_log();
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = os_log_type_enabled(v3, OS_LOG_TYPE_ERROR);

    if (v4)
    {
      pk_General_log();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        v7 = 136446722;
        v8 = "-[NPKGizmoDatabase selectTransactionSourceIdentifierForTransactionWithIdentifierStatement]";
        v9 = 2082;
        v10 = "/Library/Caches/com.apple.xbs/Sources/NanoPassbook_Frameworks/NanoPassKit/NPKGizmoDatabase.m";
        v11 = 2048;
        v12 = 1227;
        _os_log_impl(&dword_213518000, v5, OS_LOG_TYPE_ERROR, "Error: *** NPKAssertion failure in %{public}s, %{public}s:%ld (reason: Unable to prepare \"select transaction source identifier for transaction identifier\" statement)", (uint8_t *)&v7, 0x20u);
      }

    }
    _NPKAssertAbort();
  }
  return *p_selectTransactionSourceIdentifierForTransactionWithIdentifierStatement;
}

- (sqlite3_stmt)selectTransactionSourceIdentifierForTransactionWithServiceIdentifierStatement
{
  NSObject *v3;
  _BOOL4 v4;
  NSObject *v5;
  int v7;
  const char *v8;
  __int16 v9;
  const char *v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  if (!self->_selectTransactionSourceIdentifierForTransactionWithServiceIdentifierStatement
    && sqlite3_prepare_v2(-[NPKGizmoDatabase database](self, "database"), "SELECT transaction_source_identifier FROM transactions WHERE service_identifier = ?", -1, &self->_selectTransactionSourceIdentifierForTransactionWithServiceIdentifierStatement, 0))
  {
    pk_General_log();
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = os_log_type_enabled(v3, OS_LOG_TYPE_ERROR);

    if (v4)
    {
      pk_General_log();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        v7 = 136446722;
        v8 = "-[NPKGizmoDatabase selectTransactionSourceIdentifierForTransactionWithServiceIdentifierStatement]";
        v9 = 2082;
        v10 = "/Library/Caches/com.apple.xbs/Sources/NanoPassbook_Frameworks/NanoPassKit/NPKGizmoDatabase.m";
        v11 = 2048;
        v12 = 1235;
        _os_log_impl(&dword_213518000, v5, OS_LOG_TYPE_ERROR, "Error: *** NPKAssertion failure in %{public}s, %{public}s:%ld (reason: Unable to prepare \"select transaction source identifier for transaction service identifier\" statement)", (uint8_t *)&v7, 0x20u);
      }

    }
    _NPKAssertAbort();
  }
  return self->_selectTransactionSourceIdentifierForTransactionWithIdentifierStatement;
}

- (sqlite3_stmt)selectTransactionSourceIdentifierForPassUniqueIdentifierStatement
{
  sqlite3_stmt **p_selectTransactionSourceIdentifierForPassUniqueIdentifierStatement;
  NSObject *v3;
  _BOOL4 v4;
  NSObject *v5;
  int v7;
  const char *v8;
  __int16 v9;
  const char *v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  p_selectTransactionSourceIdentifierForPassUniqueIdentifierStatement = &self->_selectTransactionSourceIdentifierForPassUniqueIdentifierStatement;
  if (!self->_selectTransactionSourceIdentifierForPassUniqueIdentifierStatement
    && sqlite3_prepare_v2(-[NPKGizmoDatabase database](self, "database"), "SELECT transaction_source_identifier FROM transaction_source WHERE pass_unique_id = ?", -1, p_selectTransactionSourceIdentifierForPassUniqueIdentifierStatement, 0))
  {
    pk_General_log();
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = os_log_type_enabled(v3, OS_LOG_TYPE_ERROR);

    if (v4)
    {
      pk_General_log();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        v7 = 136446722;
        v8 = "-[NPKGizmoDatabase selectTransactionSourceIdentifierForPassUniqueIdentifierStatement]";
        v9 = 2082;
        v10 = "/Library/Caches/com.apple.xbs/Sources/NanoPassbook_Frameworks/NanoPassKit/NPKGizmoDatabase.m";
        v11 = 2048;
        v12 = 1243;
        _os_log_impl(&dword_213518000, v5, OS_LOG_TYPE_ERROR, "Error: *** NPKAssertion failure in %{public}s, %{public}s:%ld (reason: Unable to prepare \"select transaction source identifier for transaction service identifier\" statement)", (uint8_t *)&v7, 0x20u);
      }

    }
    _NPKAssertAbort();
  }
  return *p_selectTransactionSourceIdentifierForPassUniqueIdentifierStatement;
}

- (sqlite3_stmt)selectPassUniqueIdentifierForTransactionSourceIdentifierStatement
{
  sqlite3_stmt **p_selectPassUniqueIdentifierForTransactionSourceIdentifierStatement;
  NSObject *v3;
  _BOOL4 v4;
  NSObject *v5;
  int v7;
  const char *v8;
  __int16 v9;
  const char *v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  p_selectPassUniqueIdentifierForTransactionSourceIdentifierStatement = &self->_selectPassUniqueIdentifierForTransactionSourceIdentifierStatement;
  if (!self->_selectPassUniqueIdentifierForTransactionSourceIdentifierStatement
    && sqlite3_prepare_v2(-[NPKGizmoDatabase database](self, "database"), "SELECT pass_unique_id FROM transaction_source WHERE transaction_source_identifier = ?", -1, p_selectPassUniqueIdentifierForTransactionSourceIdentifierStatement, 0))
  {
    pk_General_log();
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = os_log_type_enabled(v3, OS_LOG_TYPE_ERROR);

    if (v4)
    {
      pk_General_log();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        v7 = 136446722;
        v8 = "-[NPKGizmoDatabase selectPassUniqueIdentifierForTransactionSourceIdentifierStatement]";
        v9 = 2082;
        v10 = "/Library/Caches/com.apple.xbs/Sources/NanoPassbook_Frameworks/NanoPassKit/NPKGizmoDatabase.m";
        v11 = 2048;
        v12 = 1251;
        _os_log_impl(&dword_213518000, v5, OS_LOG_TYPE_ERROR, "Error: *** NPKAssertion failure in %{public}s, %{public}s:%ld (reason: Unable to prepare \"select transaction source identifier for transaction service identifier\" statement)", (uint8_t *)&v7, 0x20u);
      }

    }
    _NPKAssertAbort();
  }
  return *p_selectPassUniqueIdentifierForTransactionSourceIdentifierStatement;
}

- (sqlite3_stmt)deleteTransactionSourceIdentifierForPassStatement
{
  sqlite3_stmt **p_deleteTransactionSourceIdentifierForPassStatement;
  NSObject *v3;
  _BOOL4 v4;
  NSObject *v5;
  int v7;
  const char *v8;
  __int16 v9;
  const char *v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  p_deleteTransactionSourceIdentifierForPassStatement = &self->_deleteTransactionSourceIdentifierForPassStatement;
  if (!self->_deleteTransactionSourceIdentifierForPassStatement
    && sqlite3_prepare_v2(-[NPKGizmoDatabase database](self, "database"), "DELETE FROM transaction_source WHERE pass_unique_id = ?", -1, p_deleteTransactionSourceIdentifierForPassStatement, 0))
  {
    pk_General_log();
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = os_log_type_enabled(v3, OS_LOG_TYPE_ERROR);

    if (v4)
    {
      pk_General_log();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        v7 = 136446722;
        v8 = "-[NPKGizmoDatabase deleteTransactionSourceIdentifierForPassStatement]";
        v9 = 2082;
        v10 = "/Library/Caches/com.apple.xbs/Sources/NanoPassbook_Frameworks/NanoPassKit/NPKGizmoDatabase.m";
        v11 = 2048;
        v12 = 1259;
        _os_log_impl(&dword_213518000, v5, OS_LOG_TYPE_ERROR, "Error: *** NPKAssertion failure in %{public}s, %{public}s:%ld (reason: Unable to prepare \"delete transaction source identifier for pass\" statement)", (uint8_t *)&v7, 0x20u);
      }

    }
    _NPKAssertAbort();
  }
  return *p_deleteTransactionSourceIdentifierForPassStatement;
}

- (sqlite3_stmt)deleteTransactionsForTransactionSourceStatement
{
  sqlite3_stmt **p_deleteTransactionsForTransactionSourceStatement;
  NSObject *v3;
  _BOOL4 v4;
  NSObject *v5;
  int v7;
  const char *v8;
  __int16 v9;
  const char *v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  p_deleteTransactionsForTransactionSourceStatement = &self->_deleteTransactionsForTransactionSourceStatement;
  if (!self->_deleteTransactionsForTransactionSourceStatement
    && sqlite3_prepare_v2(-[NPKGizmoDatabase database](self, "database"), "DELETE FROM transactions WHERE transaction_source_identifier = ?", -1, p_deleteTransactionsForTransactionSourceStatement, 0))
  {
    pk_General_log();
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = os_log_type_enabled(v3, OS_LOG_TYPE_ERROR);

    if (v4)
    {
      pk_General_log();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        v7 = 136446722;
        v8 = "-[NPKGizmoDatabase deleteTransactionsForTransactionSourceStatement]";
        v9 = 2082;
        v10 = "/Library/Caches/com.apple.xbs/Sources/NanoPassbook_Frameworks/NanoPassKit/NPKGizmoDatabase.m";
        v11 = 2048;
        v12 = 1267;
        _os_log_impl(&dword_213518000, v5, OS_LOG_TYPE_ERROR, "Error: *** NPKAssertion failure in %{public}s, %{public}s:%ld (reason: Unable to prepare \"delete transactions for transaction source\" statement)", (uint8_t *)&v7, 0x20u);
      }

    }
    _NPKAssertAbort();
  }
  return *p_deleteTransactionsForTransactionSourceStatement;
}

- (sqlite3_stmt)trimTransactionsForTransactionSourceStatement
{
  sqlite3_stmt **p_trimTransactionsForTransactionSourceStatement;
  NSObject *v3;
  _BOOL4 v4;
  NSObject *v5;
  int v7;
  const char *v8;
  __int16 v9;
  const char *v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  p_trimTransactionsForTransactionSourceStatement = &self->_trimTransactionsForTransactionSourceStatement;
  if (!self->_trimTransactionsForTransactionSourceStatement
    && sqlite3_prepare_v2(-[NPKGizmoDatabase database](self, "database"), "DELETE FROM transactions WHERE transaction_source_identifier = ? AND transaction_id NOT IN (SELECT transaction_id FROM transactions WHERE transaction_source_identifier = ? ORDER BY transaction_date DESC LIMIT ?)", -1, p_trimTransactionsForTransactionSourceStatement, 0))
  {
    pk_General_log();
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = os_log_type_enabled(v3, OS_LOG_TYPE_ERROR);

    if (v4)
    {
      pk_General_log();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        v7 = 136446722;
        v8 = "-[NPKGizmoDatabase trimTransactionsForTransactionSourceStatement]";
        v9 = 2082;
        v10 = "/Library/Caches/com.apple.xbs/Sources/NanoPassbook_Frameworks/NanoPassKit/NPKGizmoDatabase.m";
        v11 = 2048;
        v12 = 1275;
        _os_log_impl(&dword_213518000, v5, OS_LOG_TYPE_ERROR, "Error: *** NPKAssertion failure in %{public}s, %{public}s:%ld (reason: Unable to prepare \"trim transactions for transaction source\" statement)", (uint8_t *)&v7, 0x20u);
      }

    }
    _NPKAssertAbort();
  }
  return *p_trimTransactionsForTransactionSourceStatement;
}

- (sqlite3_stmt)selectTransitAppletStateForPassStatement
{
  sqlite3_stmt **p_selectTransitAppletStateForPassStatement;
  NSObject *v3;
  _BOOL4 v4;
  NSObject *v5;
  int v7;
  const char *v8;
  __int16 v9;
  const char *v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  p_selectTransitAppletStateForPassStatement = &self->_selectTransitAppletStateForPassStatement;
  if (!self->_selectTransitAppletStateForPassStatement
    && sqlite3_prepare_v2(-[NPKGizmoDatabase database](self, "database"), "SELECT felica_transit_applet_state FROM pass WHERE unique_id = ?", -1, p_selectTransitAppletStateForPassStatement, 0))
  {
    pk_General_log();
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = os_log_type_enabled(v3, OS_LOG_TYPE_ERROR);

    if (v4)
    {
      pk_General_log();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        v7 = 136446722;
        v8 = "-[NPKGizmoDatabase selectTransitAppletStateForPassStatement]";
        v9 = 2082;
        v10 = "/Library/Caches/com.apple.xbs/Sources/NanoPassbook_Frameworks/NanoPassKit/NPKGizmoDatabase.m";
        v11 = 2048;
        v12 = 1288;
        _os_log_impl(&dword_213518000, v5, OS_LOG_TYPE_ERROR, "Error: *** NPKAssertion failure in %{public}s, %{public}s:%ld (reason: Unable to prepare \"select transit applet state\" statement)", (uint8_t *)&v7, 0x20u);
      }

    }
    _NPKAssertAbort();
  }
  return *p_selectTransitAppletStateForPassStatement;
}

- (sqlite3_stmt)updateTransitAppletStateForPassStatement
{
  sqlite3_stmt **p_updateTransitAppletStateForPassStatement;
  NSObject *v3;
  _BOOL4 v4;
  NSObject *v5;
  int v7;
  const char *v8;
  __int16 v9;
  const char *v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  p_updateTransitAppletStateForPassStatement = &self->_updateTransitAppletStateForPassStatement;
  if (!self->_updateTransitAppletStateForPassStatement
    && sqlite3_prepare_v2(-[NPKGizmoDatabase database](self, "database"), "UPDATE pass SET felica_transit_applet_state = ? WHERE unique_id = ?", -1, p_updateTransitAppletStateForPassStatement, 0))
  {
    pk_General_log();
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = os_log_type_enabled(v3, OS_LOG_TYPE_ERROR);

    if (v4)
    {
      pk_General_log();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        v7 = 136446722;
        v8 = "-[NPKGizmoDatabase updateTransitAppletStateForPassStatement]";
        v9 = 2082;
        v10 = "/Library/Caches/com.apple.xbs/Sources/NanoPassbook_Frameworks/NanoPassKit/NPKGizmoDatabase.m";
        v11 = 2048;
        v12 = 1302;
        _os_log_impl(&dword_213518000, v5, OS_LOG_TYPE_ERROR, "Error: *** NPKAssertion failure in %{public}s, %{public}s:%ld (reason: Unable to prepare \"update transit applet state\" statement)", (uint8_t *)&v7, 0x20u);
      }

    }
    _NPKAssertAbort();
  }
  return *p_updateTransitAppletStateForPassStatement;
}

- (sqlite3_stmt)insertEphemeralTransactionStatement
{
  sqlite3_stmt **p_insertEphemeralTransactionStatement;
  NSObject *v3;
  _BOOL4 v4;
  NSObject *v5;
  int v7;
  const char *v8;
  __int16 v9;
  const char *v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  p_insertEphemeralTransactionStatement = &self->_insertEphemeralTransactionStatement;
  if (!self->_insertEphemeralTransactionStatement
    && sqlite3_prepare_v2(-[NPKGizmoDatabase database](self, "database"), "INSERT INTO ephemeral_transactions (transaction_source_identifier, transaction_id) VALUES (?, ?)", -1, p_insertEphemeralTransactionStatement, 0))
  {
    pk_General_log();
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = os_log_type_enabled(v3, OS_LOG_TYPE_ERROR);

    if (v4)
    {
      pk_General_log();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        v7 = 136446722;
        v8 = "-[NPKGizmoDatabase insertEphemeralTransactionStatement]";
        v9 = 2082;
        v10 = "/Library/Caches/com.apple.xbs/Sources/NanoPassbook_Frameworks/NanoPassKit/NPKGizmoDatabase.m";
        v11 = 2048;
        v12 = 1311;
        _os_log_impl(&dword_213518000, v5, OS_LOG_TYPE_ERROR, "Error: *** NPKAssertion failure in %{public}s, %{public}s:%ld (reason: Unable to prepare \"insert ephemeral transaction\" statement)", (uint8_t *)&v7, 0x20u);
      }

    }
    _NPKAssertAbort();
  }
  return *p_insertEphemeralTransactionStatement;
}

- (sqlite3_stmt)deleteEphemeralTransactionByTransactionSourceIdentifierStatement
{
  sqlite3_stmt **p_deleteEphemeralTransactionByTransactionSourceIdentifierStatement;
  NSObject *v3;
  _BOOL4 v4;
  NSObject *v5;
  int v7;
  const char *v8;
  __int16 v9;
  const char *v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  p_deleteEphemeralTransactionByTransactionSourceIdentifierStatement = &self->_deleteEphemeralTransactionByTransactionSourceIdentifierStatement;
  if (!self->_deleteEphemeralTransactionByTransactionSourceIdentifierStatement
    && sqlite3_prepare_v2(-[NPKGizmoDatabase database](self, "database"), "DELETE FROM ephemeral_transactions WHERE transaction_source_identifier = ?", -1, p_deleteEphemeralTransactionByTransactionSourceIdentifierStatement, 0))
  {
    pk_General_log();
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = os_log_type_enabled(v3, OS_LOG_TYPE_ERROR);

    if (v4)
    {
      pk_General_log();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        v7 = 136446722;
        v8 = "-[NPKGizmoDatabase deleteEphemeralTransactionByTransactionSourceIdentifierStatement]";
        v9 = 2082;
        v10 = "/Library/Caches/com.apple.xbs/Sources/NanoPassbook_Frameworks/NanoPassKit/NPKGizmoDatabase.m";
        v11 = 2048;
        v12 = 1320;
        _os_log_impl(&dword_213518000, v5, OS_LOG_TYPE_ERROR, "Error: *** NPKAssertion failure in %{public}s, %{public}s:%ld (reason: Unable to prepare \"delete ephemeral transaction\" statement)", (uint8_t *)&v7, 0x20u);
      }

    }
    _NPKAssertAbort();
  }
  return *p_deleteEphemeralTransactionByTransactionSourceIdentifierStatement;
}

- (sqlite3_stmt)currentEphemeralTransactionIdentifierStatement
{
  sqlite3_stmt **p_currentEphemeralTransactionIdentifierStatement;
  NSObject *v3;
  _BOOL4 v4;
  NSObject *v5;
  int v7;
  const char *v8;
  __int16 v9;
  const char *v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  p_currentEphemeralTransactionIdentifierStatement = &self->_currentEphemeralTransactionIdentifierStatement;
  if (!self->_currentEphemeralTransactionIdentifierStatement
    && sqlite3_prepare_v2(-[NPKGizmoDatabase database](self, "database"), "SELECT transaction_id FROM ephemeral_transactions WHERE transaction_source_identifier = ? LIMIT 1", -1, p_currentEphemeralTransactionIdentifierStatement, 0))
  {
    pk_General_log();
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = os_log_type_enabled(v3, OS_LOG_TYPE_ERROR);

    if (v4)
    {
      pk_General_log();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        v7 = 136446722;
        v8 = "-[NPKGizmoDatabase currentEphemeralTransactionIdentifierStatement]";
        v9 = 2082;
        v10 = "/Library/Caches/com.apple.xbs/Sources/NanoPassbook_Frameworks/NanoPassKit/NPKGizmoDatabase.m";
        v11 = 2048;
        v12 = 1328;
        _os_log_impl(&dword_213518000, v5, OS_LOG_TYPE_ERROR, "Error: *** NPKAssertion failure in %{public}s, %{public}s:%ld (reason: Unable to prepare \"current ephemeral transaction\" statement)", (uint8_t *)&v7, 0x20u);
      }

    }
    _NPKAssertAbort();
  }
  return *p_currentEphemeralTransactionIdentifierStatement;
}

- (sqlite3_stmt)selectLastAddValueAmountForPassStatement
{
  sqlite3_stmt **p_selectLastAddValueAmountForPassStatement;
  NSObject *v3;
  _BOOL4 v4;
  NSObject *v5;
  int v7;
  const char *v8;
  __int16 v9;
  const char *v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  p_selectLastAddValueAmountForPassStatement = &self->_selectLastAddValueAmountForPassStatement;
  if (!self->_selectLastAddValueAmountForPassStatement
    && sqlite3_prepare_v2(-[NPKGizmoDatabase database](self, "database"), "SELECT last_add_value_amount FROM pass WHERE unique_id = ?", -1, p_selectLastAddValueAmountForPassStatement, 0))
  {
    pk_General_log();
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = os_log_type_enabled(v3, OS_LOG_TYPE_ERROR);

    if (v4)
    {
      pk_General_log();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        v7 = 136446722;
        v8 = "-[NPKGizmoDatabase selectLastAddValueAmountForPassStatement]";
        v9 = 2082;
        v10 = "/Library/Caches/com.apple.xbs/Sources/NanoPassbook_Frameworks/NanoPassKit/NPKGizmoDatabase.m";
        v11 = 2048;
        v12 = 1337;
        _os_log_impl(&dword_213518000, v5, OS_LOG_TYPE_ERROR, "Error: *** NPKAssertion failure in %{public}s, %{public}s:%ld (reason: Unable to prepare \"select last add value amount\" statement)", (uint8_t *)&v7, 0x20u);
      }

    }
    _NPKAssertAbort();
  }
  return *p_selectLastAddValueAmountForPassStatement;
}

- (sqlite3_stmt)updateLastAddValueAmountForPassStatement
{
  sqlite3_stmt **p_updateLastAddValueAmountForPassStatement;
  NSObject *v3;
  _BOOL4 v4;
  NSObject *v5;
  int v7;
  const char *v8;
  __int16 v9;
  const char *v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  p_updateLastAddValueAmountForPassStatement = &self->_updateLastAddValueAmountForPassStatement;
  if (!self->_updateLastAddValueAmountForPassStatement
    && sqlite3_prepare_v2(-[NPKGizmoDatabase database](self, "database"), "UPDATE pass SET last_add_value_amount = ? WHERE unique_id = ?", -1, p_updateLastAddValueAmountForPassStatement, 0))
  {
    pk_General_log();
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = os_log_type_enabled(v3, OS_LOG_TYPE_ERROR);

    if (v4)
    {
      pk_General_log();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        v7 = 136446722;
        v8 = "-[NPKGizmoDatabase updateLastAddValueAmountForPassStatement]";
        v9 = 2082;
        v10 = "/Library/Caches/com.apple.xbs/Sources/NanoPassbook_Frameworks/NanoPassKit/NPKGizmoDatabase.m";
        v11 = 2048;
        v12 = 1346;
        _os_log_impl(&dword_213518000, v5, OS_LOG_TYPE_ERROR, "Error: *** NPKAssertion failure in %{public}s, %{public}s:%ld (reason: Unable to prepare \"update last add value amount\" statement)", (uint8_t *)&v7, 0x20u);
      }

    }
    _NPKAssertAbort();
  }
  return *p_updateLastAddValueAmountForPassStatement;
}

- (sqlite3_stmt)selectPendingAddValueDateForPassStatement
{
  sqlite3_stmt **p_selectPendingAddValueDateForPassStatement;
  NSObject *v3;
  _BOOL4 v4;
  NSObject *v5;
  int v7;
  const char *v8;
  __int16 v9;
  const char *v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  p_selectPendingAddValueDateForPassStatement = &self->_selectPendingAddValueDateForPassStatement;
  if (!self->_selectPendingAddValueDateForPassStatement
    && sqlite3_prepare_v2(-[NPKGizmoDatabase database](self, "database"), "SELECT pending_add_value_date FROM pass WHERE unique_id = ?", -1, p_selectPendingAddValueDateForPassStatement, 0))
  {
    pk_General_log();
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = os_log_type_enabled(v3, OS_LOG_TYPE_ERROR);

    if (v4)
    {
      pk_General_log();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        v7 = 136446722;
        v8 = "-[NPKGizmoDatabase selectPendingAddValueDateForPassStatement]";
        v9 = 2082;
        v10 = "/Library/Caches/com.apple.xbs/Sources/NanoPassbook_Frameworks/NanoPassKit/NPKGizmoDatabase.m";
        v11 = 2048;
        v12 = 1355;
        _os_log_impl(&dword_213518000, v5, OS_LOG_TYPE_ERROR, "Error: *** NPKAssertion failure in %{public}s, %{public}s:%ld (reason: Unable to prepare \"select pending add value date\" statement)", (uint8_t *)&v7, 0x20u);
      }

    }
    _NPKAssertAbort();
  }
  return *p_selectPendingAddValueDateForPassStatement;
}

- (sqlite3_stmt)updatePendingAddValueDateForPassStatement
{
  sqlite3_stmt **p_updatePendingAddValueDateForPassStatement;
  NSObject *v3;
  _BOOL4 v4;
  NSObject *v5;
  int v7;
  const char *v8;
  __int16 v9;
  const char *v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  p_updatePendingAddValueDateForPassStatement = &self->_updatePendingAddValueDateForPassStatement;
  if (!self->_updatePendingAddValueDateForPassStatement
    && sqlite3_prepare_v2(-[NPKGizmoDatabase database](self, "database"), "UPDATE pass SET pending_add_value_date = ? WHERE unique_id = ?", -1, p_updatePendingAddValueDateForPassStatement, 0))
  {
    pk_General_log();
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = os_log_type_enabled(v3, OS_LOG_TYPE_ERROR);

    if (v4)
    {
      pk_General_log();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        v7 = 136446722;
        v8 = "-[NPKGizmoDatabase updatePendingAddValueDateForPassStatement]";
        v9 = 2082;
        v10 = "/Library/Caches/com.apple.xbs/Sources/NanoPassbook_Frameworks/NanoPassKit/NPKGizmoDatabase.m";
        v11 = 2048;
        v12 = 1364;
        _os_log_impl(&dword_213518000, v5, OS_LOG_TYPE_ERROR, "Error: *** NPKAssertion failure in %{public}s, %{public}s:%ld (reason: Unable to prepare \"update pending add value date\" statement)", (uint8_t *)&v7, 0x20u);
      }

    }
    _NPKAssertAbort();
  }
  return *p_updatePendingAddValueDateForPassStatement;
}

- (sqlite3_stmt)selectBalancesForPassStatement
{
  sqlite3_stmt **p_selectBalancesForPassStatement;
  NSObject *v3;
  _BOOL4 v4;
  NSObject *v5;
  int v7;
  const char *v8;
  __int16 v9;
  const char *v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  p_selectBalancesForPassStatement = &self->_selectBalancesForPassStatement;
  if (!self->_selectBalancesForPassStatement
    && sqlite3_prepare_v2(-[NPKGizmoDatabase database](self, "database"), "SELECT balances FROM pass WHERE unique_id = ?", -1, p_selectBalancesForPassStatement, 0))
  {
    pk_General_log();
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = os_log_type_enabled(v3, OS_LOG_TYPE_ERROR);

    if (v4)
    {
      pk_General_log();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        v7 = 136446722;
        v8 = "-[NPKGizmoDatabase selectBalancesForPassStatement]";
        v9 = 2082;
        v10 = "/Library/Caches/com.apple.xbs/Sources/NanoPassbook_Frameworks/NanoPassKit/NPKGizmoDatabase.m";
        v11 = 2048;
        v12 = 1373;
        _os_log_impl(&dword_213518000, v5, OS_LOG_TYPE_ERROR, "Error: *** NPKAssertion failure in %{public}s, %{public}s:%ld (reason: Unable to prepare \"select balances state\" statement)", (uint8_t *)&v7, 0x20u);
      }

    }
    _NPKAssertAbort();
  }
  return *p_selectBalancesForPassStatement;
}

- (sqlite3_stmt)updateBalancesForPassStatement
{
  sqlite3_stmt **p_updateBalancesForPassStatement;
  NSObject *v3;
  _BOOL4 v4;
  NSObject *v5;
  int v7;
  const char *v8;
  __int16 v9;
  const char *v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  p_updateBalancesForPassStatement = &self->_updateBalancesForPassStatement;
  if (!self->_updateBalancesForPassStatement
    && sqlite3_prepare_v2(-[NPKGizmoDatabase database](self, "database"), "UPDATE pass SET balances = ? WHERE unique_id = ?", -1, p_updateBalancesForPassStatement, 0))
  {
    pk_General_log();
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = os_log_type_enabled(v3, OS_LOG_TYPE_ERROR);

    if (v4)
    {
      pk_General_log();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        v7 = 136446722;
        v8 = "-[NPKGizmoDatabase updateBalancesForPassStatement]";
        v9 = 2082;
        v10 = "/Library/Caches/com.apple.xbs/Sources/NanoPassbook_Frameworks/NanoPassKit/NPKGizmoDatabase.m";
        v11 = 2048;
        v12 = 1382;
        _os_log_impl(&dword_213518000, v5, OS_LOG_TYPE_ERROR, "Error: *** NPKAssertion failure in %{public}s, %{public}s:%ld (reason: Unable to prepare \"update balances state\" statement)", (uint8_t *)&v7, 0x20u);
      }

    }
    _NPKAssertAbort();
  }
  return *p_updateBalancesForPassStatement;
}

- (sqlite3_stmt)selectSubcredentialsForPassStatement
{
  sqlite3_stmt **p_selectSubcredentialsForPassStatement;
  NSObject *v3;
  _BOOL4 v4;
  NSObject *v5;
  int v7;
  const char *v8;
  __int16 v9;
  const char *v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  p_selectSubcredentialsForPassStatement = &self->_selectSubcredentialsForPassStatement;
  if (!self->_selectSubcredentialsForPassStatement
    && sqlite3_prepare_v2(-[NPKGizmoDatabase database](self, "database"), "SELECT subcredentials FROM pass WHERE unique_id = ?", -1, p_selectSubcredentialsForPassStatement, 0))
  {
    pk_General_log();
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = os_log_type_enabled(v3, OS_LOG_TYPE_ERROR);

    if (v4)
    {
      pk_General_log();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        v7 = 136446722;
        v8 = "-[NPKGizmoDatabase selectSubcredentialsForPassStatement]";
        v9 = 2082;
        v10 = "/Library/Caches/com.apple.xbs/Sources/NanoPassbook_Frameworks/NanoPassKit/NPKGizmoDatabase.m";
        v11 = 2048;
        v12 = 1391;
        _os_log_impl(&dword_213518000, v5, OS_LOG_TYPE_ERROR, "Error: *** NPKAssertion failure in %{public}s, %{public}s:%ld (reason: Unable to prepare \"select subcredentials state\" statement)", (uint8_t *)&v7, 0x20u);
      }

    }
    _NPKAssertAbort();
  }
  return *p_selectSubcredentialsForPassStatement;
}

- (sqlite3_stmt)updateSubcredentialsForPassStatement
{
  sqlite3_stmt **p_updateSubcredentialsForPassStatement;
  NSObject *v3;
  _BOOL4 v4;
  NSObject *v5;
  int v7;
  const char *v8;
  __int16 v9;
  const char *v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  p_updateSubcredentialsForPassStatement = &self->_updateSubcredentialsForPassStatement;
  if (!self->_updateSubcredentialsForPassStatement
    && sqlite3_prepare_v2(-[NPKGizmoDatabase database](self, "database"), "UPDATE pass SET subcredentials = ? WHERE unique_id = ?", -1, p_updateSubcredentialsForPassStatement, 0))
  {
    pk_General_log();
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = os_log_type_enabled(v3, OS_LOG_TYPE_ERROR);

    if (v4)
    {
      pk_General_log();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        v7 = 136446722;
        v8 = "-[NPKGizmoDatabase updateSubcredentialsForPassStatement]";
        v9 = 2082;
        v10 = "/Library/Caches/com.apple.xbs/Sources/NanoPassbook_Frameworks/NanoPassKit/NPKGizmoDatabase.m";
        v11 = 2048;
        v12 = 1400;
        _os_log_impl(&dword_213518000, v5, OS_LOG_TYPE_ERROR, "Error: *** NPKAssertion failure in %{public}s, %{public}s:%ld (reason: Unable to prepare \"update subcredentials state\" statement)", (uint8_t *)&v7, 0x20u);
      }

    }
    _NPKAssertAbort();
  }
  return *p_updateSubcredentialsForPassStatement;
}

- (void)_loadInitialManifestLocked
{
  NSObject *v3;
  _BOOL4 v4;
  NSObject *v5;
  NSMutableDictionary *v6;
  NSMutableDictionary *manifest;
  NSMutableArray *v8;
  NSMutableArray *passDescriptions;
  NSObject *v10;
  _BOOL4 v11;
  NSObject *v12;
  void *v13;
  NSMutableDictionary *v14;
  void *v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  int v20;
  const void *v21;
  uint64_t v22;
  const unsigned __int8 *v23;
  const void *v24;
  int v25;
  uint64_t v26;
  const void *v27;
  int v28;
  void *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  const void *v34;
  int v35;
  sqlite3_int64 v36;
  void *v37;
  uint64_t v38;
  void *v39;
  const unsigned __int8 *v40;
  void *v41;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  const unsigned __int8 *v45;
  void *v46;
  uint64_t v47;
  void *v48;
  void *v49;
  uint64_t v50;
  void *v51;
  const unsigned __int8 *v52;
  int v53;
  int v54;
  void *v55;
  const unsigned __int8 *v56;
  int v57;
  void *v58;
  uint64_t v59;
  void *v60;
  void *v61;
  void *v62;
  NSObject *v63;
  _BOOL4 v64;
  NSObject *v65;
  NPKPassDescription *v66;
  NSObject *v67;
  _BOOL4 v68;
  NSMutableDictionary *v69;
  void *v70;
  NPKGizmoDatabaseManifestEntry *v71;
  int v72;
  void *v73;
  sqlite3_int64 v74;
  void *v75;
  void *v76;
  void *v77;
  int v78;
  void *v79;
  int v80;
  int v81;
  int v82;
  void *v83;
  int v84;
  int v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  NSMutableDictionary *v106;
  sqlite3_stmt *ppStmt;
  uint8_t buf[4];
  NSMutableDictionary *v109;
  __int16 v110;
  void *v111;
  __int16 v112;
  void *v113;
  uint64_t v114;

  v114 = *MEMORY[0x24BDAC8D0];
  if ((!self->_manifest || !self->_passDescriptions) && -[NPKGizmoDatabase database](self, "database"))
  {
    pk_General_log();
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);

    if (v4)
    {
      pk_General_log();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_213518000, v5, OS_LOG_TYPE_DEFAULT, "Notice: Lazily loading initial manifest", buf, 2u);
      }

    }
    v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    manifest = self->_manifest;
    self->_manifest = v6;

    v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    passDescriptions = self->_passDescriptions;
    self->_passDescriptions = v8;

    ppStmt = 0;
    if (sqlite3_prepare_v2(-[NPKGizmoDatabase database](self, "database"), "SELECT unique_id, type_id, style, hash, logo_text, logo_image, background_color, label_color, foreground_color, delete_pending, background_image, nfc_payload, private_label, cobranded, device_payment_applications, device_primary_payment_application, device_primary_contactless_payment_application, device_primary_in_app_payment_application, preferred_payment_application, ingested_date, complete_hash, effective_payment_application_state, has_user_selectable_payment_applications, has_stored_value, settings, complete_hashes, issuer_country_code, available_actions, organization_name, felica_transit_applet_state, front_field_buckets, back_field_buckets, last_add_value_amount, localized_description, pending_add_value_date, express_pass_types_mask, complete_remote_hashes, supports_pp, subcredentials FROM pass", -1, &ppStmt, 0))
    {
      pk_General_log();
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = os_log_type_enabled(v10, OS_LOG_TYPE_ERROR);

      if (!v11)
        return;
      pk_General_log();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        NPKHomeDirectoryPath();
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "stringByAppendingPathComponent:", CFSTR("nanopasses.sqlite3"));
        v14 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
        NPKGetMyProcessName();
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v109 = v14;
        v110 = 2112;
        v111 = v15;
        _os_log_impl(&dword_213518000, v12, OS_LOG_TYPE_ERROR, "Error: *** CORRUPTED / INVALID PASS DATABASE: Unable to prepare \"select pass descriptions\" statement; this m"
          "ost likely means you need to delete the database at \"%@\" and kill %@",
          buf,
          0x16u);

      }
      goto LABEL_51;
    }
    if (sqlite3_step(ppStmt) == 100)
    {
      v16 = 0x24BDD1000uLL;
      v17 = 0x24BDBC000uLL;
      v18 = 0x24BDBC000uLL;
      do
      {
        objc_msgSend(*(id *)(v16 + 1992), "stringWithUTF8String:", sqlite3_column_text(ppStmt, 0));
        v106 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(v16 + 1992), "stringWithUTF8String:", sqlite3_column_text(ppStmt, 1));
        v19 = objc_claimAutoreleasedReturnValue();
        v20 = sqlite3_column_int(ppStmt, 2);
        v21 = sqlite3_column_blob(ppStmt, 3);
        objc_msgSend(*(id *)(v17 + 3664), "dataWithBytes:length:", v21, sqlite3_column_bytes(ppStmt, 3));
        v22 = objc_claimAutoreleasedReturnValue();
        v23 = sqlite3_column_text(ppStmt, 4);
        v92 = (void *)v22;
        if (v23)
        {
          objc_msgSend(*(id *)(v16 + 1992), "stringWithUTF8String:", v23);
          v103 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v103 = 0;
        }
        v24 = sqlite3_column_blob(ppStmt, 5);
        v25 = sqlite3_column_bytes(ppStmt, 5);
        if (v25 < 1)
        {
          v102 = 0;
        }
        else
        {
          objc_msgSend(*(id *)(v17 + 3664), "dataWithBytes:length:", v24, v25);
          v102 = (void *)objc_claimAutoreleasedReturnValue();
        }
        -[NPKGizmoDatabase _decodeObjectOfClass:fromStatement:column:](self, "_decodeObjectOfClass:fromStatement:column:", objc_opt_class(), ppStmt, 6);
        v26 = objc_claimAutoreleasedReturnValue();
        -[NPKGizmoDatabase _decodeObjectOfClass:fromStatement:column:](self, "_decodeObjectOfClass:fromStatement:column:", objc_opt_class(), ppStmt, 7);
        v100 = (void *)objc_claimAutoreleasedReturnValue();
        -[NPKGizmoDatabase _decodeObjectOfClass:fromStatement:column:](self, "_decodeObjectOfClass:fromStatement:column:", objc_opt_class(), ppStmt, 8);
        v99 = (void *)objc_claimAutoreleasedReturnValue();
        v82 = sqlite3_column_int(ppStmt, 9);
        v27 = sqlite3_column_blob(ppStmt, 10);
        v28 = sqlite3_column_bytes(ppStmt, 10);
        v104 = (void *)v19;
        v101 = (void *)v26;
        if (v28 < 1)
        {
          v98 = 0;
        }
        else
        {
          objc_msgSend(*(id *)(v17 + 3664), "dataWithBytes:length:", v27, v28);
          v98 = (void *)objc_claimAutoreleasedReturnValue();
        }
        -[NPKGizmoDatabase _decodeObjectOfClass:fromStatement:column:](self, "_decodeObjectOfClass:fromStatement:column:", objc_opt_class(), ppStmt, 11);
        v97 = (void *)objc_claimAutoreleasedReturnValue();
        v85 = sqlite3_column_int(ppStmt, 12);
        v84 = sqlite3_column_int(ppStmt, 13);
        v29 = *(void **)(v18 + 3872);
        v30 = objc_opt_class();
        objc_msgSend(v29, "setWithObjects:", v30, objc_opt_class(), 0);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        -[NPKGizmoDatabase _decodeObjectOfClasses:fromStatement:column:](self, "_decodeObjectOfClasses:fromStatement:column:", v31, ppStmt, 14);
        v32 = objc_claimAutoreleasedReturnValue();

        -[NPKGizmoDatabase _decodeObjectOfClass:fromStatement:column:](self, "_decodeObjectOfClass:fromStatement:column:", objc_opt_class(), ppStmt, 15);
        v95 = (void *)objc_claimAutoreleasedReturnValue();
        -[NPKGizmoDatabase _decodeObjectOfClass:fromStatement:column:](self, "_decodeObjectOfClass:fromStatement:column:", objc_opt_class(), ppStmt, 16);
        v94 = (void *)objc_claimAutoreleasedReturnValue();
        -[NPKGizmoDatabase _decodeObjectOfClass:fromStatement:column:](self, "_decodeObjectOfClass:fromStatement:column:", objc_opt_class(), ppStmt, 17);
        v93 = (void *)objc_claimAutoreleasedReturnValue();
        -[NPKGizmoDatabase _decodeObjectOfClass:fromStatement:column:](self, "_decodeObjectOfClass:fromStatement:column:", objc_opt_class(), ppStmt, 18);
        v33 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSinceReferenceDate:", (double)sqlite3_column_int(ppStmt, 19));
        v91 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = sqlite3_column_blob(ppStmt, 20);
        v35 = sqlite3_column_bytes(ppStmt, 20);
        v96 = (void *)v32;
        if (v35 < 1)
        {
          v90 = 0;
        }
        else
        {
          objc_msgSend(*(id *)(v17 + 3664), "dataWithBytes:length:", v34, v35);
          v90 = (void *)objc_claimAutoreleasedReturnValue();
        }
        v78 = sqlite3_column_int(ppStmt, 21);
        v81 = sqlite3_column_int(ppStmt, 22);
        v80 = sqlite3_column_int(ppStmt, 23);
        v36 = sqlite3_column_int64(ppStmt, 24);
        v37 = *(void **)(v18 + 3872);
        v38 = objc_opt_class();
        objc_msgSend(v37, "setWithObjects:", v38, objc_opt_class(), 0);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        -[NPKGizmoDatabase _decodeObjectOfClasses:fromStatement:column:](self, "_decodeObjectOfClasses:fromStatement:column:", v39, ppStmt, 25);
        v105 = (void *)objc_claimAutoreleasedReturnValue();

        v40 = sqlite3_column_text(ppStmt, 26);
        if (v40)
        {
          objc_msgSend(*(id *)(v16 + 1992), "stringWithUTF8String:", v40);
          v88 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v88 = 0;
        }
        v41 = *(void **)(v18 + 3872);
        v42 = objc_opt_class();
        objc_msgSend(v41, "setWithObjects:", v42, objc_opt_class(), 0);
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        -[NPKGizmoDatabase _decodeObjectOfClasses:fromStatement:column:](self, "_decodeObjectOfClasses:fromStatement:column:", v43, ppStmt, 27);
        v44 = objc_claimAutoreleasedReturnValue();

        v45 = sqlite3_column_text(ppStmt, 28);
        v89 = (void *)v33;
        v87 = (void *)v44;
        if (v45)
        {
          objc_msgSend(*(id *)(v16 + 1992), "stringWithUTF8String:", v45);
          v79 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v79 = 0;
        }
        -[NPKGizmoDatabase _decodeObjectOfClass:fromStatement:column:](self, "_decodeObjectOfClass:fromStatement:column:", objc_opt_class(), ppStmt, 29);
        v77 = (void *)objc_claimAutoreleasedReturnValue();
        v46 = *(void **)(v18 + 3872);
        v47 = objc_opt_class();
        objc_msgSend(v46, "setWithObjects:", v47, objc_opt_class(), 0);
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        -[NPKGizmoDatabase _decodeObjectOfClasses:fromStatement:column:](self, "_decodeObjectOfClasses:fromStatement:column:", v48, ppStmt, 30);
        v76 = (void *)objc_claimAutoreleasedReturnValue();

        v49 = *(void **)(v18 + 3872);
        v50 = objc_opt_class();
        objc_msgSend(v49, "setWithObjects:", v50, objc_opt_class(), 0);
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        -[NPKGizmoDatabase _decodeObjectOfClasses:fromStatement:column:](self, "_decodeObjectOfClasses:fromStatement:column:", v51, ppStmt, 31);
        v75 = (void *)objc_claimAutoreleasedReturnValue();

        v52 = sqlite3_column_text(ppStmt, 32);
        if (v52)
        {
          v53 = v82;
          v54 = v85;
          if (*v52)
          {
            objc_msgSend(*(id *)(v16 + 1992), "stringWithUTF8String:", v52);
            v55 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x24BDD1518], "decimalNumberWithString:", v55);
            v70 = (void *)objc_claimAutoreleasedReturnValue();

          }
          else
          {
            v70 = 0;
          }
        }
        else
        {
          v70 = 0;
          v53 = v82;
          v54 = v85;
        }
        v56 = sqlite3_column_text(ppStmt, 33);
        if (v56)
        {
          objc_msgSend(*(id *)(v16 + 1992), "stringWithUTF8String:", v56);
          v86 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v86 = 0;
        }
        v57 = sqlite3_column_int(ppStmt, 34);
        if (v57)
        {
          objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSinceReferenceDate:", (double)v57);
          v83 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v83 = 0;
        }
        v74 = sqlite3_column_int64(ppStmt, 35);
        v58 = *(void **)(v18 + 3872);
        v59 = objc_opt_class();
        objc_msgSend(v58, "setWithObjects:", v59, objc_opt_class(), 0);
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        -[NPKGizmoDatabase _decodeObjectOfClasses:fromStatement:column:](self, "_decodeObjectOfClasses:fromStatement:column:", v60, ppStmt, 36);
        v61 = (void *)objc_claimAutoreleasedReturnValue();

        v72 = sqlite3_column_int(ppStmt, 37);
        objc_msgSend(*(id *)(v18 + 3872), "setWithObjects:", objc_opt_class(), 0);
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        -[NPKGizmoDatabase _decodeObjectOfClasses:fromStatement:column:](self, "_decodeObjectOfClasses:fromStatement:column:", v62, ppStmt, 38);
        v73 = (void *)objc_claimAutoreleasedReturnValue();

        pk_General_log();
        v63 = objc_claimAutoreleasedReturnValue();
        v64 = os_log_type_enabled(v63, OS_LOG_TYPE_DEFAULT);

        if (v64)
        {
          pk_General_log();
          v65 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412802;
            v109 = v106;
            v110 = 2112;
            v111 = v105;
            v112 = 2112;
            v113 = v61;
            _os_log_impl(&dword_213518000, v65, OS_LOG_TYPE_DEFAULT, "Notice: Initial manifest encountered key %@ local %@ remote %@", buf, 0x20u);
          }

        }
        v71 = objc_alloc_init(NPKGizmoDatabaseManifestEntry);
        -[NPKGizmoDatabaseManifestEntry setUniqueID:](v71, "setUniqueID:", v106);
        -[NPKGizmoDatabaseManifestEntry setLocalManifestHashes:](v71, "setLocalManifestHashes:", v105);
        -[NPKGizmoDatabaseManifestEntry setRemoteManifestHashes:](v71, "setRemoteManifestHashes:", v61);
        -[NSMutableDictionary setObject:forKeyedSubscript:](self->_manifest, "setObject:forKeyedSubscript:", v71, v106);
        v66 = objc_alloc_init(NPKPassDescription);
        -[NPKPassDescription setUniqueID:](v66, "setUniqueID:", v106);
        -[NPKPassDescription setPassTypeIdentifier:](v66, "setPassTypeIdentifier:", v104);
        -[NPKPassDescription setStyle:](v66, "setStyle:", v20);
        -[NPKPassDescription setManifestHash:](v66, "setManifestHash:", v92);
        -[NPKPassDescription setLogoText:](v66, "setLogoText:", v103);
        -[NPKPassDescription setLogoImageEncoded:](v66, "setLogoImageEncoded:", v102);
        -[NPKPassDescription setBackgroundColor:](v66, "setBackgroundColor:", v101);
        -[NPKPassDescription setLabelColor:](v66, "setLabelColor:", v100);
        -[NPKPassDescription setForegroundColor:](v66, "setForegroundColor:", v99);
        -[NPKPassDescription setDeletePending:](v66, "setDeletePending:", v53 != 0);
        -[NPKPassDescription setBackgroundImageEncoded:](v66, "setBackgroundImageEncoded:", v98);
        -[NPKPassDescription setNfcPayload:](v66, "setNfcPayload:", v97);
        -[NPKPassDescription setPrivateLabel:](v66, "setPrivateLabel:", v54 != 0);
        -[NPKPassDescription setCobranded:](v66, "setCobranded:", v84 != 0);
        -[NPKPassDescription setDevicePaymentApplications:](v66, "setDevicePaymentApplications:", v96);
        -[NPKPassDescription setDevicePrimaryPaymentApplication:](v66, "setDevicePrimaryPaymentApplication:", v95);
        -[NPKPassDescription setDevicePrimaryContactlessPaymentApplication:](v66, "setDevicePrimaryContactlessPaymentApplication:", v94);
        -[NPKPassDescription setDevicePrimaryInAppPaymentApplication:](v66, "setDevicePrimaryInAppPaymentApplication:", v93);
        -[NPKPassDescription setPreferredPaymentApplication:](v66, "setPreferredPaymentApplication:", v89);
        -[NPKPassDescription setEffectivePaymentApplicationState:](v66, "setEffectivePaymentApplicationState:", v78);
        -[NPKPassDescription setIngestionDate:](v66, "setIngestionDate:", v91);
        -[NPKPassDescription setCompleteHash:](v66, "setCompleteHash:", v90);
        -[NPKPassDescription setHasUserSelectableContactlessPaymentApplications:](v66, "setHasUserSelectableContactlessPaymentApplications:", v81 != 0);
        -[NPKPassDescription setHasStoredValue:](v66, "setHasStoredValue:", v80 != 0);
        -[NPKPassDescription setSettings:](v66, "setSettings:", v36);
        -[NPKPassDescription setIssuerCountryCode:](v66, "setIssuerCountryCode:", v88);
        -[NPKPassDescription setAvailableActions:](v66, "setAvailableActions:", v87);
        -[NPKPassDescription setOrganizationName:](v66, "setOrganizationName:", v79);
        -[NPKPassDescription setTransitAppletState:](v66, "setTransitAppletState:", v77);
        -[NPKPassDescription setFrontFieldBuckets:](v66, "setFrontFieldBuckets:", v76);
        -[NPKPassDescription setBackFieldBuckets:](v66, "setBackFieldBuckets:", v75);
        -[NPKPassDescription setLastAddValueAmount:](v66, "setLastAddValueAmount:", v70);
        -[NPKPassDescription setLocalizedDescription:](v66, "setLocalizedDescription:", v86);
        -[NPKPassDescription setPendingAddValueDate:](v66, "setPendingAddValueDate:", v83);
        -[NPKPassDescription setExpressPassTypesMask:](v66, "setExpressPassTypesMask:", v74);
        -[NPKPassDescription setHasAssociatedPeerPaymentAccount:](v66, "setHasAssociatedPeerPaymentAccount:", v72 != 0);
        -[NPKPassDescription setSubcredentials:](v66, "setSubcredentials:", v73);
        -[NSMutableArray addObject:](self->_passDescriptions, "addObject:", v66);

        v16 = 0x24BDD1000;
        v17 = 0x24BDBC000;
        v18 = 0x24BDBC000;
      }
      while (sqlite3_step(ppStmt) == 100);
    }
    sqlite3_clear_bindings(ppStmt);
    sqlite3_reset(ppStmt);
    sqlite3_finalize(ppStmt);
    pk_General_log();
    v67 = objc_claimAutoreleasedReturnValue();
    v68 = os_log_type_enabled(v67, OS_LOG_TYPE_DEFAULT);

    if (v68)
    {
      pk_General_log();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        v69 = self->_manifest;
        *(_DWORD *)buf = 138412290;
        v109 = v69;
        _os_log_impl(&dword_213518000, v12, OS_LOG_TYPE_DEFAULT, "Notice: Loaded initial manifest: %@", buf, 0xCu);
      }
LABEL_51:

    }
  }
}

- (void)_performTransactionWithBlock:(id)a3
{
  uint64_t (**v4)(_QWORD);
  _BOOL4 isInTransaction;
  _BOOL4 v6;
  int v7;
  NSObject *v8;
  _BOOL4 v9;
  NSObject *v10;
  uint8_t v11[16];

  v4 = (uint64_t (**)(_QWORD))a3;
  isInTransaction = self->_isInTransaction;
  if (self->_isInTransaction
    || (v6 = -[NPKGizmoDatabase _executeSQL:](self, "_executeSQL:", CFSTR("BEGIN IMMEDIATE TRANSACTION;")),
        self->_isInTransaction = v6,
        v6))
  {
    v7 = v4[2](v4);
    if (!isInTransaction)
    {
      if (v7)
      {
        -[NPKGizmoDatabase _executeSQL:](self, "_executeSQL:", CFSTR("COMMIT;"));
        self->_isInTransaction = 0;
      }
      else
      {
        pk_General_log();
        v8 = objc_claimAutoreleasedReturnValue();
        v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);

        if (v9)
        {
          pk_General_log();
          v10 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)v11 = 0;
            _os_log_impl(&dword_213518000, v10, OS_LOG_TYPE_DEFAULT, "Warning: Rolling back transaction", v11, 2u);
          }

        }
        -[NPKGizmoDatabase _executeSQL:](self, "_executeSQL:", CFSTR("ROLLBACK;"));
        self->_isInTransaction = 0;
      }
    }
  }

}

- (id)_decodeObjectOfClasses:(id)a3 fromStatement:(sqlite3_stmt *)a4 column:(int)a5
{
  id v7;
  const void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;

  v7 = a3;
  v8 = sqlite3_column_blob(a4, a5);
  v9 = sqlite3_column_bytes(a4, a5);
  if (v9 < 1)
  {
    v12 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1620]), "initForReadingFromData:error:", v10, 0);
      objc_msgSend(v11, "decodeObjectOfClasses:forKey:", v7, *MEMORY[0x24BDD0E88]);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v12 = 0;
    }

  }
  return v12;
}

- (id)_decodeObjectOfClass:(Class)a3 fromStatement:(sqlite3_stmt *)a4 column:(int)a5
{
  uint64_t v5;
  void *v8;
  void *v9;

  v5 = *(_QWORD *)&a5;
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKGizmoDatabase _decodeObjectOfClasses:fromStatement:column:](self, "_decodeObjectOfClasses:fromStatement:column:", v8, a4, v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)savePass:(id)a3 isLocalPass:(BOOL)a4
{
  id v6;
  void *v7;
  NSObject *v8;
  _BOOL4 v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  _BOOL4 v13;
  NSObject *v14;
  void *v15;
  NSObject *v16;
  _BOOL4 v17;
  NSObject *v18;
  NSObject *dbQueue;
  id v20;
  id v21;
  _QWORD v23[5];
  id v24;
  _BYTE *v25;
  BOOL v26;
  _BYTE buf[24];
  uint64_t v28;
  __int128 v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = v6;
  if (!v6)
  {
    pk_General_log();
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = os_log_type_enabled(v8, OS_LOG_TYPE_ERROR);

    if (v9)
    {
      pk_General_log();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446722;
        *(_QWORD *)&buf[4] = "-[NPKGizmoDatabase savePass:isLocalPass:]";
        *(_WORD *)&buf[12] = 2082;
        *(_QWORD *)&buf[14] = "/Library/Caches/com.apple.xbs/Sources/NanoPassbook_Frameworks/NanoPassKit/NPKGizmoDatabase.m";
        *(_WORD *)&buf[22] = 2048;
        v28 = 1648;
        _os_log_impl(&dword_213518000, v10, OS_LOG_TYPE_ERROR, "Error: *** NPKAssertion failure in %{public}s, %{public}s:%ld (reason: Cannot save nil pass)", buf, 0x20u);
      }

    }
    _NPKAssertAbort();
  }
  objc_msgSend(v6, "uniqueID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
    pk_General_log();
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = os_log_type_enabled(v12, OS_LOG_TYPE_ERROR);

    if (v13)
    {
      pk_General_log();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446978;
        *(_QWORD *)&buf[4] = "-[NPKGizmoDatabase savePass:isLocalPass:]";
        *(_WORD *)&buf[12] = 2082;
        *(_QWORD *)&buf[14] = "/Library/Caches/com.apple.xbs/Sources/NanoPassbook_Frameworks/NanoPassKit/NPKGizmoDatabase.m";
        *(_WORD *)&buf[22] = 2048;
        v28 = 1649;
        LOWORD(v29) = 2112;
        *(_QWORD *)((char *)&v29 + 2) = v7;
        _os_log_impl(&dword_213518000, v14, OS_LOG_TYPE_ERROR, "Error: *** NPKAssertion failure in %{public}s, %{public}s:%ld (reason: Pass %@ has nil unique ID)", buf, 0x2Au);
      }

    }
    _NPKAssertAbort();
  }
  objc_msgSend(v7, "npkCompleteHash");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v15)
  {
    pk_General_log();
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = os_log_type_enabled(v16, OS_LOG_TYPE_ERROR);

    if (v17)
    {
      pk_General_log();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446978;
        *(_QWORD *)&buf[4] = "-[NPKGizmoDatabase savePass:isLocalPass:]";
        *(_WORD *)&buf[12] = 2082;
        *(_QWORD *)&buf[14] = "/Library/Caches/com.apple.xbs/Sources/NanoPassbook_Frameworks/NanoPassKit/NPKGizmoDatabase.m";
        *(_WORD *)&buf[22] = 2048;
        v28 = 1650;
        LOWORD(v29) = 2112;
        *(_QWORD *)((char *)&v29 + 2) = v7;
        _os_log_impl(&dword_213518000, v18, OS_LOG_TYPE_ERROR, "Error: *** NPKAssertion failure in %{public}s, %{public}s:%ld (reason: Pass %@ has nil complete hash)", buf, 0x2Au);
      }

    }
    _NPKAssertAbort();
  }
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v28 = (uint64_t)__Block_byref_object_copy__14;
  *(_QWORD *)&v29 = __Block_byref_object_dispose__14;
  *((_QWORD *)&v29 + 1) = 0;
  dbQueue = self->_dbQueue;
  v23[0] = MEMORY[0x24BDAC760];
  v23[1] = 3221225472;
  v23[2] = __41__NPKGizmoDatabase_savePass_isLocalPass___block_invoke;
  v23[3] = &unk_24CFEB0D0;
  v23[4] = self;
  v24 = v7;
  v26 = a4;
  v25 = buf;
  v20 = v7;
  dispatch_sync(dbQueue, v23);
  v21 = *(id *)(*(_QWORD *)&buf[8] + 40);

  _Block_object_dispose(buf, 8);
  return v21;
}

void __41__NPKGizmoDatabase_savePass_isLocalPass___block_invoke(uint64_t a1)
{
  NSObject *v2;
  _BOOL4 v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  _QWORD block[5];
  id v10;
  uint8_t v11;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  if (!objc_msgSend(*(id *)(a1 + 32), "database"))
  {
    pk_General_log();
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = os_log_type_enabled(v2, OS_LOG_TYPE_ERROR);

    if (v3)
    {
      pk_General_log();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446722;
        v13 = "-[NPKGizmoDatabase savePass:isLocalPass:]_block_invoke";
        v14 = 2082;
        v15 = "/Library/Caches/com.apple.xbs/Sources/NanoPassbook_Frameworks/NanoPassKit/NPKGizmoDatabase.m";
        v16 = 2048;
        v17 = 1655;
        _os_log_impl(&dword_213518000, v4, OS_LOG_TYPE_ERROR, "Error: *** NPKAssertion failure in %{public}s, %{public}s:%ld (reason: Nil database handle; did you check pass"
          "DBIsAvailable before calling?)",
          buf,
          0x20u);
      }

    }
    _NPKAssertAbort();
  }
  objc_msgSend(*(id *)(a1 + 32), "_loadInitialManifestLocked");
  buf[0] = 0;
  objc_msgSend(*(id *)(a1 + 32), "_savePassLocked:locallyAdded:wasUpdate:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 56), buf);
  objc_msgSend(*(id *)(a1 + 32), "_libraryHashLockedForWatchOSMajorVersion:", objc_msgSend((id)objc_opt_class(), "latestWatchOSMajorVersion"));
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __41__NPKGizmoDatabase_savePass_isLocalPass___block_invoke_327;
  block[3] = &unk_24CFE8FA8;
  v11 = buf[0];
  v8 = *(void **)(a1 + 40);
  block[4] = *(_QWORD *)(a1 + 32);
  v10 = v8;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
  objc_msgSend(*(id *)(a1 + 32), "_notifyDatabaseChangedExternally");
  objc_msgSend(*(id *)(a1 + 32), "_notifyDatabaseChangedWithNoop:", 0);

}

void __41__NPKGizmoDatabase_savePass_isLocalPass___block_invoke_327(uint64_t a1)
{
  void *v2;
  __CFString **v3;
  __CFString *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = &NPKGizmoDatabasePassUpdatedNotificationName;
  if (!*(_BYTE *)(a1 + 48))
    v3 = &NPKGizmoDatabasePassAddedNotificationName;
  v4 = *v3;
  v6 = *(_QWORD *)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v8 = NPKGizmoDatabasePassKeyName;
  v9[0] = v5;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:userInfo:", v4, v6, v7);

}

- (void)saveDiff:(id)a3 forPassWithUniqueID:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  _BOOL4 v9;
  NSObject *v10;
  NSObject *dbQueue;
  id v12;
  id v13;
  _QWORD block[5];
  id v15;
  id v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (!v7)
  {
    pk_General_log();
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = os_log_type_enabled(v8, OS_LOG_TYPE_ERROR);

    if (v9)
    {
      pk_General_log();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446978;
        v18 = "-[NPKGizmoDatabase saveDiff:forPassWithUniqueID:]";
        v19 = 2082;
        v20 = "/Library/Caches/com.apple.xbs/Sources/NanoPassbook_Frameworks/NanoPassKit/NPKGizmoDatabase.m";
        v21 = 2048;
        v22 = 1673;
        v23 = 2112;
        v24 = 0;
        _os_log_impl(&dword_213518000, v10, OS_LOG_TYPE_ERROR, "Error: *** NPKAssertion failure in %{public}s, %{public}s:%ld (reason: Unique ID %@ is nil)", buf, 0x2Au);
      }

    }
    _NPKAssertAbort();
  }
  dbQueue = self->_dbQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __49__NPKGizmoDatabase_saveDiff_forPassWithUniqueID___block_invoke;
  block[3] = &unk_24CFE8288;
  block[4] = self;
  v15 = v6;
  v16 = v7;
  v12 = v7;
  v13 = v6;
  dispatch_sync(dbQueue, block);

}

uint64_t __49__NPKGizmoDatabase_saveDiff_forPassWithUniqueID___block_invoke(uint64_t a1)
{
  NSObject *v2;
  _BOOL4 v3;
  NSObject *v4;
  int v6;
  const char *v7;
  __int16 v8;
  const char *v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  if (!objc_msgSend(*(id *)(a1 + 32), "database"))
  {
    pk_General_log();
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = os_log_type_enabled(v2, OS_LOG_TYPE_ERROR);

    if (v3)
    {
      pk_General_log();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      {
        v6 = 136446722;
        v7 = "-[NPKGizmoDatabase saveDiff:forPassWithUniqueID:]_block_invoke";
        v8 = 2082;
        v9 = "/Library/Caches/com.apple.xbs/Sources/NanoPassbook_Frameworks/NanoPassKit/NPKGizmoDatabase.m";
        v10 = 2048;
        v11 = 1677;
        _os_log_impl(&dword_213518000, v4, OS_LOG_TYPE_ERROR, "Error: *** NPKAssertion failure in %{public}s, %{public}s:%ld (reason: Nil database handle; did you check pass"
          "DBIsAvailable before calling?)",
          (uint8_t *)&v6,
          0x20u);
      }

    }
    _NPKAssertAbort();
  }
  objc_msgSend(*(id *)(a1 + 32), "_loadInitialManifestLocked");
  return objc_msgSend(*(id *)(a1 + 32), "_saveDiffLocked:forPassWithUniqueID:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (id)removePassWithUniqueID:(id)a3
{
  id v4;
  NSObject *v5;
  _BOOL4 v6;
  NSObject *v7;
  NSObject *dbQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v13;
  _BYTE *v14;
  _BYTE buf[24];
  uint64_t v16;
  void (*v17)(uint64_t);
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (!v4)
  {
    pk_General_log();
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = os_log_type_enabled(v5, OS_LOG_TYPE_ERROR);

    if (v6)
    {
      pk_General_log();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446722;
        *(_QWORD *)&buf[4] = "-[NPKGizmoDatabase removePassWithUniqueID:]";
        *(_WORD *)&buf[12] = 2082;
        *(_QWORD *)&buf[14] = "/Library/Caches/com.apple.xbs/Sources/NanoPassbook_Frameworks/NanoPassKit/NPKGizmoDatabase.m";
        *(_WORD *)&buf[22] = 2048;
        v16 = 1685;
        _os_log_impl(&dword_213518000, v7, OS_LOG_TYPE_ERROR, "Error: *** NPKAssertion failure in %{public}s, %{public}s:%ld (reason: Cannot remove pass with nil unique ID)", buf, 0x20u);
      }

    }
    _NPKAssertAbort();
  }
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v16 = (uint64_t)__Block_byref_object_copy__14;
  v17 = __Block_byref_object_dispose__14;
  v18 = 0;
  dbQueue = self->_dbQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __43__NPKGizmoDatabase_removePassWithUniqueID___block_invoke;
  block[3] = &unk_24CFEB0F8;
  block[4] = self;
  v13 = v4;
  v14 = buf;
  v9 = v4;
  dispatch_sync(dbQueue, block);
  v10 = *(id *)(*(_QWORD *)&buf[8] + 40);

  _Block_object_dispose(buf, 8);
  return v10;
}

uint64_t __43__NPKGizmoDatabase_removePassWithUniqueID___block_invoke(uint64_t a1)
{
  int v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(*(id *)(a1 + 32), "_loadInitialManifestLocked");
  v2 = objc_msgSend(*(id *)(a1 + 32), "_removePassWithUniqueIDLocked:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "_libraryHashLockedForWatchOSMajorVersion:", objc_msgSend((id)objc_opt_class(), "latestWatchOSMajorVersion"));
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  objc_msgSend(*(id *)(a1 + 32), "_notifyDatabaseChangedExternally");
  return objc_msgSend(*(id *)(a1 + 32), "_notifyDatabaseChangedWithNoop:", v2 ^ 1u);
}

- (id)rebuildDatabaseWithPasses:(id)a3
{
  id v4;
  NSObject *dbQueue;
  id v6;
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
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__14;
  v16 = __Block_byref_object_dispose__14;
  v17 = 0;
  dbQueue = self->_dbQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __46__NPKGizmoDatabase_rebuildDatabaseWithPasses___block_invoke;
  block[3] = &unk_24CFEB0F8;
  block[4] = self;
  v10 = v4;
  v11 = &v12;
  v6 = v4;
  dispatch_sync(dbQueue, block);
  v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __46__NPKGizmoDatabase_rebuildDatabaseWithPasses___block_invoke(uint64_t a1)
{
  NSObject *v2;
  _BOOL4 v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t);
  void *v12;
  id v13;
  id v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  if (!objc_msgSend(*(id *)(a1 + 32), "database"))
  {
    pk_General_log();
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = os_log_type_enabled(v2, OS_LOG_TYPE_ERROR);

    if (v3)
    {
      pk_General_log();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446722;
        v16 = "-[NPKGizmoDatabase rebuildDatabaseWithPasses:]_block_invoke";
        v17 = 2082;
        v18 = "/Library/Caches/com.apple.xbs/Sources/NanoPassbook_Frameworks/NanoPassKit/NPKGizmoDatabase.m";
        v19 = 2048;
        v20 = 1706;
        _os_log_impl(&dword_213518000, v4, OS_LOG_TYPE_ERROR, "Error: *** NPKAssertion failure in %{public}s, %{public}s:%ld (reason: Nil database handle; did you check pass"
          "DBIsAvailable before calling?)",
          buf,
          0x20u);
      }

    }
    _NPKAssertAbort();
  }
  objc_msgSend(*(id *)(a1 + 32), "_loadInitialManifestLocked");
  v9 = MEMORY[0x24BDAC760];
  v10 = 3221225472;
  v11 = __46__NPKGizmoDatabase_rebuildDatabaseWithPasses___block_invoke_329;
  v12 = &unk_24CFEB120;
  v5 = *(void **)(a1 + 40);
  v13 = *(id *)(a1 + 32);
  v14 = v5;
  objc_msgSend(v13, "_performTransactionWithBlock:", &v9);
  objc_msgSend(*(id *)(a1 + 32), "_libraryHashLockedForWatchOSMajorVersion:", objc_msgSend((id)objc_opt_class(), "latestWatchOSMajorVersion", v9, v10, v11, v12, v13));
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

  objc_msgSend(*(id *)(a1 + 32), "_notifyDatabaseChangedExternally");
  objc_msgSend(*(id *)(a1 + 32), "_notifyDatabaseChangedWithNoop:", 0);

}

uint64_t __46__NPKGizmoDatabase_rebuildDatabaseWithPasses___block_invoke_329(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _QWORD v13[5];
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 344), "allKeys");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __46__NPKGizmoDatabase_rebuildDatabaseWithPasses___block_invoke_2;
  v13[3] = &unk_24CFE8260;
  v13[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v2, "enumerateObjectsUsingBlock:", v13);
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  v3 = *(id *)(a1 + 40);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(a1 + 32), "_savePassLocked:locallyAdded:wasUpdate:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v7++), 0, 0, (_QWORD)v9);
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v14, 16);
    }
    while (v5);
  }

  return 1;
}

uint64_t __46__NPKGizmoDatabase_rebuildDatabaseWithPasses___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_removePassWithUniqueIDLocked:", a2);
}

- (void)saveTransaction:(id)a3 forPass:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  _BOOL4 v15;
  NSObject *v16;
  void *v17;
  int v18;
  id v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (NPKIsTransactionAllowedInUI(v6, v7))
  {
    objc_msgSend(v6, "transactionSourceIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "paymentPass");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "devicePrimaryPaymentApplication");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "paymentNetworkIdentifier");

    objc_msgSend(v7, "paymentPass");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v12, "isPeerPaymentPass") & 1) != 0)
      v13 = 0;
    else
      v13 = PKTransactionsUnlimitedForCredentialType() ^ 1;

    -[NPKGizmoDatabase _saveTransaction:forTransactionSourceIdentifier:withPaymentCredentialType:shouldTrim:](self, "_saveTransaction:forTransactionSourceIdentifier:withPaymentCredentialType:shouldTrim:", v6, v8, v11, v13);
  }
  else
  {
    pk_Payment_log();
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = os_log_type_enabled(v14, OS_LOG_TYPE_ERROR);

    if (v15)
    {
      pk_Payment_log();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v7, "uniqueID");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = 138412546;
        v19 = v6;
        v20 = 2112;
        v21 = v17;
        _os_log_impl(&dword_213518000, v16, OS_LOG_TYPE_ERROR, "Error: Transaction is not allowed in UI; not inserting transaction %@ for pass: %@",
          (uint8_t *)&v18,
          0x16u);

      }
    }
  }

}

- (void)_saveTransaction:(id)a3 forTransactionSourceIdentifier:(id)a4 withPaymentCredentialType:(int64_t)a5 shouldTrim:(BOOL)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  NSObject *v14;
  _BOOL4 v15;
  NSObject *v16;
  const char *v17;
  NSObject *v18;
  _BOOL4 v19;
  NSObject *v20;
  NSObject *v21;
  _BOOL4 v22;
  NSObject *v23;
  _BOOL4 v24;
  NSObject *dbQueue;
  _QWORD block[5];
  id v27;
  id v28;
  int64_t v29;
  BOOL v30;
  uint8_t buf[4];
  const char *v32;
  __int16 v33;
  const char *v34;
  __int16 v35;
  uint64_t v36;
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = v11;
  if (!v10)
  {
    pk_General_log();
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = os_log_type_enabled(v18, OS_LOG_TYPE_ERROR);

    if (v19)
    {
      pk_General_log();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446722;
        v32 = "-[NPKGizmoDatabase _saveTransaction:forTransactionSourceIdentifier:withPaymentCredentialType:shouldTrim:]";
        v33 = 2082;
        v34 = "/Library/Caches/com.apple.xbs/Sources/NanoPassbook_Frameworks/NanoPassKit/NPKGizmoDatabase.m";
        v35 = 2048;
        v36 = 1746;
        _os_log_impl(&dword_213518000, v20, OS_LOG_TYPE_ERROR, "Error: *** NPKAssertion failure in %{public}s, %{public}s:%ld (reason: Transaction is nil)", buf, 0x20u);
      }

    }
    _NPKAssertAbort();
  }
  if (v11)
  {
    objc_msgSend(v10, "identifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      if (objc_msgSend(v10, "suppressBehavior") != 1)
      {
        dbQueue = self->_dbQueue;
        block[0] = MEMORY[0x24BDAC760];
        block[1] = 3221225472;
        block[2] = __105__NPKGizmoDatabase__saveTransaction_forTransactionSourceIdentifier_withPaymentCredentialType_shouldTrim___block_invoke;
        block[3] = &unk_24CFEB148;
        block[4] = self;
        v27 = v10;
        v30 = a6;
        v28 = v12;
        v29 = a5;
        dispatch_sync(dbQueue, block);

        goto LABEL_22;
      }
      pk_Payment_log();
      v14 = objc_claimAutoreleasedReturnValue();
      v15 = os_log_type_enabled(v14, OS_LOG_TYPE_ERROR);

      if (v15)
      {
        pk_Payment_log();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v32 = (const char *)v10;
          v17 = "Error: Transaction should be suppressed from UI; not inserting %@";
LABEL_19:
          _os_log_impl(&dword_213518000, v16, OS_LOG_TYPE_ERROR, v17, buf, 0xCu);
          goto LABEL_20;
        }
        goto LABEL_20;
      }
    }
    else
    {
      pk_Payment_log();
      v23 = objc_claimAutoreleasedReturnValue();
      v24 = os_log_type_enabled(v23, OS_LOG_TYPE_ERROR);

      if (v24)
      {
        pk_Payment_log();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v32 = (const char *)v10;
          v17 = "Error: Transaction does not have identifier; not inserting %@";
          goto LABEL_19;
        }
        goto LABEL_20;
      }
    }
  }
  else
  {
    pk_Payment_log();
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = os_log_type_enabled(v21, OS_LOG_TYPE_ERROR);

    if (v22)
    {
      pk_Payment_log();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v32 = (const char *)v10;
        v17 = "Error: No transaction source identifier; not inserting transaction %@";
        goto LABEL_19;
      }
LABEL_20:

    }
  }
LABEL_22:

}

uint64_t __105__NPKGizmoDatabase__saveTransaction_forTransactionSourceIdentifier_withPaymentCredentialType_shouldTrim___block_invoke(uint64_t a1)
{
  NSObject *v2;
  _BOOL4 v3;
  NSObject *v4;
  uint64_t result;
  int v6;
  const char *v7;
  __int16 v8;
  const char *v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  if (!objc_msgSend(*(id *)(a1 + 32), "database"))
  {
    pk_General_log();
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = os_log_type_enabled(v2, OS_LOG_TYPE_ERROR);

    if (v3)
    {
      pk_General_log();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      {
        v6 = 136446722;
        v7 = "-[NPKGizmoDatabase _saveTransaction:forTransactionSourceIdentifier:withPaymentCredentialType:shouldTrim:]_block_invoke";
        v8 = 2082;
        v9 = "/Library/Caches/com.apple.xbs/Sources/NanoPassbook_Frameworks/NanoPassKit/NPKGizmoDatabase.m";
        v10 = 2048;
        v11 = 1760;
        _os_log_impl(&dword_213518000, v4, OS_LOG_TYPE_ERROR, "Error: *** NPKAssertion failure in %{public}s, %{public}s:%ld (reason: Nil database handle; did you check pass"
          "DBIsAvailable before calling?)",
          (uint8_t *)&v6,
          0x20u);
      }

    }
    _NPKAssertAbort();
  }
  objc_msgSend(*(id *)(a1 + 32), "_loadInitialManifestLocked");
  result = objc_msgSend(*(id *)(a1 + 32), "_saveTransactionLocked:forTransactionSourceIdentifier:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  if (*(_BYTE *)(a1 + 64))
    return objc_msgSend(*(id *)(a1 + 32), "_trimTransactionsForTransactionSourceIdentifierLocked:withPaymentCredentialType:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  return result;
}

- (void)removeTransactionWithIdentifier:(id)a3
{
  id v4;
  NSObject *v5;
  _BOOL4 v6;
  NSObject *v7;
  NSObject *dbQueue;
  id v9;
  _QWORD v10[5];
  id v11;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (!v4)
  {
    pk_General_log();
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = os_log_type_enabled(v5, OS_LOG_TYPE_ERROR);

    if (v6)
    {
      pk_General_log();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446722;
        v13 = "-[NPKGizmoDatabase removeTransactionWithIdentifier:]";
        v14 = 2082;
        v15 = "/Library/Caches/com.apple.xbs/Sources/NanoPassbook_Frameworks/NanoPassKit/NPKGizmoDatabase.m";
        v16 = 2048;
        v17 = 1773;
        _os_log_impl(&dword_213518000, v7, OS_LOG_TYPE_ERROR, "Error: *** NPKAssertion failure in %{public}s, %{public}s:%ld (reason: Transaction Unique ID is nil)", buf, 0x20u);
      }

    }
    _NPKAssertAbort();
  }
  dbQueue = self->_dbQueue;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __52__NPKGizmoDatabase_removeTransactionWithIdentifier___block_invoke;
  v10[3] = &unk_24CFE7E40;
  v10[4] = self;
  v11 = v4;
  v9 = v4;
  dispatch_async(dbQueue, v10);

}

uint64_t __52__NPKGizmoDatabase_removeTransactionWithIdentifier___block_invoke(uint64_t a1)
{
  NSObject *v2;
  _BOOL4 v3;
  NSObject *v4;
  int v6;
  const char *v7;
  __int16 v8;
  const char *v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  if (!objc_msgSend(*(id *)(a1 + 32), "database"))
  {
    pk_General_log();
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = os_log_type_enabled(v2, OS_LOG_TYPE_ERROR);

    if (v3)
    {
      pk_General_log();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      {
        v6 = 136446722;
        v7 = "-[NPKGizmoDatabase removeTransactionWithIdentifier:]_block_invoke";
        v8 = 2082;
        v9 = "/Library/Caches/com.apple.xbs/Sources/NanoPassbook_Frameworks/NanoPassKit/NPKGizmoDatabase.m";
        v10 = 2048;
        v11 = 1777;
        _os_log_impl(&dword_213518000, v4, OS_LOG_TYPE_ERROR, "Error: *** NPKAssertion failure in %{public}s, %{public}s:%ld (reason: Nil database handle; did you check pass"
          "DBIsAvailable before calling?)",
          (uint8_t *)&v6,
          0x20u);
      }

    }
    _NPKAssertAbort();
  }
  return objc_msgSend(*(id *)(a1 + 32), "_removeTransactionWithIdentifier:", *(_QWORD *)(a1 + 40));
}

- (void)removeTransactionsForTransactionSource:(id)a3
{
  id v4;
  NSObject *v5;
  _BOOL4 v6;
  NSObject *v7;
  NSObject *dbQueue;
  id v9;
  _QWORD v10[5];
  id v11;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (!v4)
  {
    pk_General_log();
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = os_log_type_enabled(v5, OS_LOG_TYPE_ERROR);

    if (v6)
    {
      pk_General_log();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446722;
        v13 = "-[NPKGizmoDatabase removeTransactionsForTransactionSource:]";
        v14 = 2082;
        v15 = "/Library/Caches/com.apple.xbs/Sources/NanoPassbook_Frameworks/NanoPassKit/NPKGizmoDatabase.m";
        v16 = 2048;
        v17 = 1784;
        _os_log_impl(&dword_213518000, v7, OS_LOG_TYPE_ERROR, "Error: *** NPKAssertion failure in %{public}s, %{public}s:%ld (reason: transaction source cannot not be nil)", buf, 0x20u);
      }

    }
    _NPKAssertAbort();
  }
  dbQueue = self->_dbQueue;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __59__NPKGizmoDatabase_removeTransactionsForTransactionSource___block_invoke;
  v10[3] = &unk_24CFE7E40;
  v10[4] = self;
  v11 = v4;
  v9 = v4;
  dispatch_async(dbQueue, v10);

}

uint64_t __59__NPKGizmoDatabase_removeTransactionsForTransactionSource___block_invoke(uint64_t a1)
{
  NSObject *v2;
  _BOOL4 v3;
  NSObject *v4;
  int v6;
  const char *v7;
  __int16 v8;
  const char *v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  if (!objc_msgSend(*(id *)(a1 + 32), "database"))
  {
    pk_General_log();
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = os_log_type_enabled(v2, OS_LOG_TYPE_ERROR);

    if (v3)
    {
      pk_General_log();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      {
        v6 = 136446722;
        v7 = "-[NPKGizmoDatabase removeTransactionsForTransactionSource:]_block_invoke";
        v8 = 2082;
        v9 = "/Library/Caches/com.apple.xbs/Sources/NanoPassbook_Frameworks/NanoPassKit/NPKGizmoDatabase.m";
        v10 = 2048;
        v11 = 1788;
        _os_log_impl(&dword_213518000, v4, OS_LOG_TYPE_ERROR, "Error: *** NPKAssertion failure in %{public}s, %{public}s:%ld (reason: Nil database handle; did you check pass"
          "DBIsAvailable before calling?)",
          (uint8_t *)&v6,
          0x20u);
      }

    }
    _NPKAssertAbort();
  }
  return objc_msgSend(*(id *)(a1 + 32), "_removeTransactionsForTransactionSource:", *(_QWORD *)(a1 + 40));
}

- (id)transactionSourcesForPassWithUniqueID:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x24BDBCF20], "set", a3);
}

- (id)transactionsForTransactionSourceIdentifier:(id)a3 withTransactionSource:(unint64_t)a4 withBackingData:(unint64_t)a5 startDate:(id)a6 endDate:(id)a7 orderedByDate:(int64_t)a8 limit:(int64_t)a9
{
  id v15;
  id v16;
  id v17;
  NSObject *dbQueue;
  id v19;
  id v20;
  id v21;
  id v22;
  _QWORD block[5];
  id v25;
  id v26;
  id v27;
  uint64_t *v28;
  unint64_t v29;
  unint64_t v30;
  int64_t v31;
  int64_t v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t (*v36)(uint64_t, uint64_t);
  void (*v37)(uint64_t);
  id v38;

  v15 = a3;
  v16 = a6;
  v17 = a7;
  v33 = 0;
  v34 = &v33;
  v35 = 0x3032000000;
  v36 = __Block_byref_object_copy__14;
  v37 = __Block_byref_object_dispose__14;
  v38 = 0;
  dbQueue = self->_dbQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __139__NPKGizmoDatabase_transactionsForTransactionSourceIdentifier_withTransactionSource_withBackingData_startDate_endDate_orderedByDate_limit___block_invoke;
  block[3] = &unk_24CFEB170;
  block[4] = self;
  v25 = v15;
  v28 = &v33;
  v29 = a4;
  v26 = v16;
  v27 = v17;
  v30 = a5;
  v31 = a8;
  v32 = a9;
  v19 = v17;
  v20 = v16;
  v21 = v15;
  dispatch_sync(dbQueue, block);
  v22 = (id)v34[5];

  _Block_object_dispose(&v33, 8);
  return v22;
}

void __139__NPKGizmoDatabase_transactionsForTransactionSourceIdentifier_withTransactionSource_withBackingData_startDate_endDate_orderedByDate_limit___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_loadInitialManifestLocked");
  if (objc_msgSend(*(id *)(a1 + 32), "database"))
  {
    objc_msgSend(*(id *)(a1 + 32), "_transactionsForTransactionSourceIdentifierLocked:withTransactionSource:withBackingData:startDate:endDate:orderByDate:limit:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 88), *(_QWORD *)(a1 + 96));
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v4 = *(void **)(v3 + 40);
    *(_QWORD *)(v3 + 40) = v2;

  }
}

- (id)transactionWithIdentifier:(id)a3
{
  id v4;
  NSObject *dbQueue;
  id v6;
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
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__14;
  v16 = __Block_byref_object_dispose__14;
  v17 = 0;
  dbQueue = self->_dbQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __46__NPKGizmoDatabase_transactionWithIdentifier___block_invoke;
  block[3] = &unk_24CFEB198;
  v10 = v4;
  v11 = &v12;
  block[4] = self;
  v6 = v4;
  dispatch_sync(dbQueue, block);
  v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __46__NPKGizmoDatabase_transactionWithIdentifier___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_loadInitialManifestLocked");
  if (objc_msgSend(*(id *)(a1 + 32), "database"))
  {
    objc_msgSend(*(id *)(a1 + 32), "_transactionWithIdentifierLocked:", *(_QWORD *)(a1 + 40));
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v4 = *(void **)(v3 + 40);
    *(_QWORD *)(v3 + 40) = v2;

  }
}

- (id)transactionWithServiceIdentifier:(id)a3
{
  id v4;
  NSObject *dbQueue;
  id v6;
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
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__14;
  v16 = __Block_byref_object_dispose__14;
  v17 = 0;
  dbQueue = self->_dbQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __53__NPKGizmoDatabase_transactionWithServiceIdentifier___block_invoke;
  block[3] = &unk_24CFEB198;
  v10 = v4;
  v11 = &v12;
  block[4] = self;
  v6 = v4;
  dispatch_sync(dbQueue, block);
  v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __53__NPKGizmoDatabase_transactionWithServiceIdentifier___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_loadInitialManifestLocked");
  if (objc_msgSend(*(id *)(a1 + 32), "database"))
  {
    objc_msgSend(*(id *)(a1 + 32), "_transactionWithServiceIdentifierLocked:", *(_QWORD *)(a1 + 40));
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v4 = *(void **)(v3 + 40);
    *(_QWORD *)(v3 + 40) = v2;

  }
}

- (id)transactionSourceIdentifierForTransactionWithIdentifier:(id)a3
{
  id v4;
  NSObject *dbQueue;
  id v6;
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
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__14;
  v16 = __Block_byref_object_dispose__14;
  v17 = 0;
  dbQueue = self->_dbQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __76__NPKGizmoDatabase_transactionSourceIdentifierForTransactionWithIdentifier___block_invoke;
  block[3] = &unk_24CFEB198;
  v10 = v4;
  v11 = &v12;
  block[4] = self;
  v6 = v4;
  dispatch_sync(dbQueue, block);
  v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __76__NPKGizmoDatabase_transactionSourceIdentifierForTransactionWithIdentifier___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_loadInitialManifestLocked");
  if (objc_msgSend(*(id *)(a1 + 32), "database"))
  {
    objc_msgSend(*(id *)(a1 + 32), "_transactionSourceIdentifierForTransactionWithIdentifierLocked:", *(_QWORD *)(a1 + 40));
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v4 = *(void **)(v3 + 40);
    *(_QWORD *)(v3 + 40) = v2;

  }
}

- (id)transactionSourceIdentifierForTransactionWithServiceIdentifier:(id)a3
{
  id v4;
  NSObject *dbQueue;
  id v6;
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
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__14;
  v16 = __Block_byref_object_dispose__14;
  v17 = 0;
  dbQueue = self->_dbQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __83__NPKGizmoDatabase_transactionSourceIdentifierForTransactionWithServiceIdentifier___block_invoke;
  block[3] = &unk_24CFEB198;
  v10 = v4;
  v11 = &v12;
  block[4] = self;
  v6 = v4;
  dispatch_sync(dbQueue, block);
  v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __83__NPKGizmoDatabase_transactionSourceIdentifierForTransactionWithServiceIdentifier___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_loadInitialManifestLocked");
  if (objc_msgSend(*(id *)(a1 + 32), "database"))
  {
    objc_msgSend(*(id *)(a1 + 32), "_transactionSourceIdentifierForTransactionWithServiceIdentifierLocked:", *(_QWORD *)(a1 + 40));
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v4 = *(void **)(v3 + 40);
    *(_QWORD *)(v3 + 40) = v2;

  }
}

- (id)transactionSourceIdentifierForPassWithUniqueID:(id)a3
{
  id v4;
  NSObject *dbQueue;
  id v6;
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
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__14;
  v16 = __Block_byref_object_dispose__14;
  v17 = 0;
  dbQueue = self->_dbQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __67__NPKGizmoDatabase_transactionSourceIdentifierForPassWithUniqueID___block_invoke;
  block[3] = &unk_24CFEB198;
  v10 = v4;
  v11 = &v12;
  block[4] = self;
  v6 = v4;
  dispatch_sync(dbQueue, block);
  v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __67__NPKGizmoDatabase_transactionSourceIdentifierForPassWithUniqueID___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_loadInitialManifestLocked");
  if (objc_msgSend(*(id *)(a1 + 32), "database"))
  {
    objc_msgSend(*(id *)(a1 + 32), "_transactionSourceIdentifierForPassUniqueIdentifierLocked:", *(_QWORD *)(a1 + 40));
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v4 = *(void **)(v3 + 40);
    *(_QWORD *)(v3 + 40) = v2;

  }
}

- (id)passUniqueIDForTransactionSourceIdentifier:(id)a3
{
  id v4;
  NSObject *dbQueue;
  id v6;
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
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__14;
  v16 = __Block_byref_object_dispose__14;
  v17 = 0;
  dbQueue = self->_dbQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __63__NPKGizmoDatabase_passUniqueIDForTransactionSourceIdentifier___block_invoke;
  block[3] = &unk_24CFEB198;
  v10 = v4;
  v11 = &v12;
  block[4] = self;
  v6 = v4;
  dispatch_sync(dbQueue, block);
  v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __63__NPKGizmoDatabase_passUniqueIDForTransactionSourceIdentifier___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_loadInitialManifestLocked");
  if (objc_msgSend(*(id *)(a1 + 32), "database"))
  {
    objc_msgSend(*(id *)(a1 + 32), "_passUniqueIdentifierForTransactionSourceIdentifierLocked:", *(_QWORD *)(a1 + 40));
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v4 = *(void **)(v3 + 40);
    *(_QWORD *)(v3 + 40) = v2;

  }
}

- (id)transitAppletStateForPassWithUniqueID:(id)a3
{
  id v4;
  NSObject *dbQueue;
  id v6;
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
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__14;
  v16 = __Block_byref_object_dispose__14;
  v17 = 0;
  dbQueue = self->_dbQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __58__NPKGizmoDatabase_transitAppletStateForPassWithUniqueID___block_invoke;
  block[3] = &unk_24CFEB198;
  v10 = v4;
  v11 = &v12;
  block[4] = self;
  v6 = v4;
  dispatch_sync(dbQueue, block);
  v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __58__NPKGizmoDatabase_transitAppletStateForPassWithUniqueID___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_loadInitialManifestLocked");
  if (objc_msgSend(*(id *)(a1 + 32), "database"))
  {
    objc_msgSend(*(id *)(a1 + 32), "_transitAppletStateForPassWithUniqueIDLocked:", *(_QWORD *)(a1 + 40));
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v4 = *(void **)(v3 + 40);
    *(_QWORD *)(v3 + 40) = v2;

  }
}

- (void)setTransitAppletState:(id)a3 forPassWithUniqueID:(id)a4
{
  id v6;
  id v7;
  NSObject *dbQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  dbQueue = self->_dbQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __62__NPKGizmoDatabase_setTransitAppletState_forPassWithUniqueID___block_invoke;
  block[3] = &unk_24CFE8288;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_sync(dbQueue, block);

}

uint64_t __62__NPKGizmoDatabase_setTransitAppletState_forPassWithUniqueID___block_invoke(uint64_t a1)
{
  NSObject *v2;
  _BOOL4 v3;
  NSObject *v4;
  int v6;
  const char *v7;
  __int16 v8;
  const char *v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  if (!objc_msgSend(*(id *)(a1 + 32), "database"))
  {
    pk_General_log();
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = os_log_type_enabled(v2, OS_LOG_TYPE_ERROR);

    if (v3)
    {
      pk_General_log();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      {
        v6 = 136446722;
        v7 = "-[NPKGizmoDatabase setTransitAppletState:forPassWithUniqueID:]_block_invoke";
        v8 = 2082;
        v9 = "/Library/Caches/com.apple.xbs/Sources/NanoPassbook_Frameworks/NanoPassKit/NPKGizmoDatabase.m";
        v10 = 2048;
        v11 = 1916;
        _os_log_impl(&dword_213518000, v4, OS_LOG_TYPE_ERROR, "Error: *** NPKAssertion failure in %{public}s, %{public}s:%ld (reason: Nil database handle; did you check pass"
          "DBIsAvailable before calling?)",
          (uint8_t *)&v6,
          0x20u);
      }

    }
    _NPKAssertAbort();
  }
  objc_msgSend(*(id *)(a1 + 32), "_loadInitialManifestLocked");
  return objc_msgSend(*(id *)(a1 + 32), "_setTransitAppletStateLocked:forPassWithUniqueID:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (id)paymentBalancesForPassWithUniqueID:(id)a3
{
  id v4;
  NSObject *dbQueue;
  id v6;
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
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__14;
  v16 = __Block_byref_object_dispose__14;
  v17 = 0;
  dbQueue = self->_dbQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __55__NPKGizmoDatabase_paymentBalancesForPassWithUniqueID___block_invoke;
  block[3] = &unk_24CFEB198;
  v10 = v4;
  v11 = &v12;
  block[4] = self;
  v6 = v4;
  dispatch_sync(dbQueue, block);
  v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __55__NPKGizmoDatabase_paymentBalancesForPassWithUniqueID___block_invoke(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  _BOOL4 v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  int v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "_loadInitialManifestLocked");
  v2 = objc_msgSend(*(id *)(a1 + 32), "database");
  pk_General_log();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);

  if (v2)
  {
    if (v4)
    {
      pk_General_log();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        v6 = objc_msgSend(*(id *)(a1 + 32), "database");
        v10 = 134217984;
        v11 = v6;
        _os_log_impl(&dword_213518000, v5, OS_LOG_TYPE_DEFAULT, "Notice: Will read payment balances from database: %p", (uint8_t *)&v10, 0xCu);
      }

    }
    objc_msgSend(*(id *)(a1 + 32), "_paymentBalancesForPassWithUniqueIDLocked:", *(_QWORD *)(a1 + 40));
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v9 = *(NSObject **)(v8 + 40);
    *(_QWORD *)(v8 + 40) = v7;
LABEL_7:

    return;
  }
  if (v4)
  {
    pk_General_log();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v10) = 0;
      _os_log_impl(&dword_213518000, v9, OS_LOG_TYPE_DEFAULT, "Notice: Database is nil, returning nil", (uint8_t *)&v10, 2u);
    }
    goto LABEL_7;
  }
}

- (void)setPaymentBalances:(id)a3 forPassWithUniqueID:(id)a4
{
  id v6;
  id v7;
  NSObject *dbQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  dbQueue = self->_dbQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __59__NPKGizmoDatabase_setPaymentBalances_forPassWithUniqueID___block_invoke;
  block[3] = &unk_24CFE8288;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_sync(dbQueue, block);

}

uint64_t __59__NPKGizmoDatabase_setPaymentBalances_forPassWithUniqueID___block_invoke(uint64_t a1)
{
  NSObject *v2;
  _BOOL4 v3;
  NSObject *v4;
  int v6;
  const char *v7;
  __int16 v8;
  const char *v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  if (!objc_msgSend(*(id *)(a1 + 32), "database"))
  {
    pk_General_log();
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = os_log_type_enabled(v2, OS_LOG_TYPE_ERROR);

    if (v3)
    {
      pk_General_log();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      {
        v6 = 136446722;
        v7 = "-[NPKGizmoDatabase setPaymentBalances:forPassWithUniqueID:]_block_invoke";
        v8 = 2082;
        v9 = "/Library/Caches/com.apple.xbs/Sources/NanoPassbook_Frameworks/NanoPassKit/NPKGizmoDatabase.m";
        v10 = 2048;
        v11 = 1943;
        _os_log_impl(&dword_213518000, v4, OS_LOG_TYPE_ERROR, "Error: *** NPKAssertion failure in %{public}s, %{public}s:%ld (reason: Nil database handle; did you check pass"
          "DBIsAvailable before calling?)",
          (uint8_t *)&v6,
          0x20u);
      }

    }
    _NPKAssertAbort();
  }
  objc_msgSend(*(id *)(a1 + 32), "_loadInitialManifestLocked");
  return objc_msgSend(*(id *)(a1 + 32), "_setPaymentBalancesLocked:forPassWithUniqueID:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (id)subcredentialsForPassWithUniqueID:(id)a3
{
  id v4;
  NSObject *dbQueue;
  id v6;
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
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__14;
  v16 = __Block_byref_object_dispose__14;
  v17 = 0;
  dbQueue = self->_dbQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __54__NPKGizmoDatabase_subcredentialsForPassWithUniqueID___block_invoke;
  block[3] = &unk_24CFEB198;
  v10 = v4;
  v11 = &v12;
  block[4] = self;
  v6 = v4;
  dispatch_sync(dbQueue, block);
  v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __54__NPKGizmoDatabase_subcredentialsForPassWithUniqueID___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_loadInitialManifestLocked");
  if (objc_msgSend(*(id *)(a1 + 32), "database"))
  {
    objc_msgSend(*(id *)(a1 + 32), "_subcredentialsForPassWithUniqueIDLocked:", *(_QWORD *)(a1 + 40));
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v4 = *(void **)(v3 + 40);
    *(_QWORD *)(v3 + 40) = v2;

  }
}

- (void)setSubcredentials:(id)a3 forPassWithUniqueID:(id)a4
{
  id v6;
  id v7;
  NSObject *dbQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  dbQueue = self->_dbQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __58__NPKGizmoDatabase_setSubcredentials_forPassWithUniqueID___block_invoke;
  block[3] = &unk_24CFE8288;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_sync(dbQueue, block);

}

uint64_t __58__NPKGizmoDatabase_setSubcredentials_forPassWithUniqueID___block_invoke(uint64_t a1)
{
  NSObject *v2;
  _BOOL4 v3;
  NSObject *v4;
  int v6;
  const char *v7;
  __int16 v8;
  const char *v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  if (!objc_msgSend(*(id *)(a1 + 32), "database"))
  {
    pk_General_log();
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = os_log_type_enabled(v2, OS_LOG_TYPE_ERROR);

    if (v3)
    {
      pk_General_log();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      {
        v6 = 136446722;
        v7 = "-[NPKGizmoDatabase setSubcredentials:forPassWithUniqueID:]_block_invoke";
        v8 = 2082;
        v9 = "/Library/Caches/com.apple.xbs/Sources/NanoPassbook_Frameworks/NanoPassKit/NPKGizmoDatabase.m";
        v10 = 2048;
        v11 = 1967;
        _os_log_impl(&dword_213518000, v4, OS_LOG_TYPE_ERROR, "Error: *** NPKAssertion failure in %{public}s, %{public}s:%ld (reason: Nil database handle; did you check pass"
          "DBIsAvailable before calling?)",
          (uint8_t *)&v6,
          0x20u);
      }

    }
    _NPKAssertAbort();
  }
  objc_msgSend(*(id *)(a1 + 32), "_loadInitialManifestLocked");
  return objc_msgSend(*(id *)(a1 + 32), "_setSubcredentialsLocked:forPassWithUniqueID:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)setCurrentEphemeralTransactionIdentifier:(id)a3 forTransactionSourceIdentifier:(id)a4
{
  id v6;
  id v7;
  NSObject *dbQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  dbQueue = self->_dbQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __92__NPKGizmoDatabase_setCurrentEphemeralTransactionIdentifier_forTransactionSourceIdentifier___block_invoke;
  block[3] = &unk_24CFE8288;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(dbQueue, block);

}

uint64_t __92__NPKGizmoDatabase_setCurrentEphemeralTransactionIdentifier_forTransactionSourceIdentifier___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setCurrentEphemeralTransactionIdentifier:forTransactionSourceIdentifier:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (id)currentEphemeralTransactionIdentifierForTransactionSourceIdentifier:(id)a3
{
  id v4;
  NSObject *dbQueue;
  id v6;
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
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__14;
  v16 = __Block_byref_object_dispose__14;
  v17 = 0;
  dbQueue = self->_dbQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __88__NPKGizmoDatabase_currentEphemeralTransactionIdentifierForTransactionSourceIdentifier___block_invoke;
  block[3] = &unk_24CFE9510;
  v10 = v4;
  v11 = &v12;
  block[4] = self;
  v6 = v4;
  dispatch_sync(dbQueue, block);
  v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __88__NPKGizmoDatabase_currentEphemeralTransactionIdentifierForTransactionSourceIdentifier___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_currentEphemeralTransactionIdentifierForTransactionSourceIdentifier:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)setLastAddValueAmount:(id)a3 forPassWithUniqueID:(id)a4
{
  id v6;
  id v7;
  NSObject *dbQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  dbQueue = self->_dbQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __62__NPKGizmoDatabase_setLastAddValueAmount_forPassWithUniqueID___block_invoke;
  block[3] = &unk_24CFE8288;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(dbQueue, block);

}

uint64_t __62__NPKGizmoDatabase_setLastAddValueAmount_forPassWithUniqueID___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setLastAddValueAmountLocked:forPassWithUniqueID:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (id)lastAddValueAmountForPassWithUniqueID:(id)a3
{
  id v4;
  NSObject *dbQueue;
  id v6;
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
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__14;
  v16 = __Block_byref_object_dispose__14;
  v17 = 0;
  dbQueue = self->_dbQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __58__NPKGizmoDatabase_lastAddValueAmountForPassWithUniqueID___block_invoke;
  block[3] = &unk_24CFE9510;
  v10 = v4;
  v11 = &v12;
  block[4] = self;
  v6 = v4;
  dispatch_sync(dbQueue, block);
  v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __58__NPKGizmoDatabase_lastAddValueAmountForPassWithUniqueID___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_lastAddValueAmountForPassWithUniqueIDLocked:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)setPendingAddValueDate:(id)a3 forPassWithUniqueID:(id)a4
{
  id v6;
  id v7;
  NSObject *dbQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  dbQueue = self->_dbQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __63__NPKGizmoDatabase_setPendingAddValueDate_forPassWithUniqueID___block_invoke;
  block[3] = &unk_24CFE8288;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(dbQueue, block);

}

uint64_t __63__NPKGizmoDatabase_setPendingAddValueDate_forPassWithUniqueID___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setPendingAddValueDateLocked:forPassWithUniqueID:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (id)pendingAddValueDateForPassWithUniqueID:(id)a3
{
  id v4;
  NSObject *dbQueue;
  id v6;
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
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__14;
  v16 = __Block_byref_object_dispose__14;
  v17 = 0;
  dbQueue = self->_dbQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __59__NPKGizmoDatabase_pendingAddValueDateForPassWithUniqueID___block_invoke;
  block[3] = &unk_24CFE9510;
  v10 = v4;
  v11 = &v12;
  block[4] = self;
  v6 = v4;
  dispatch_sync(dbQueue, block);
  v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __59__NPKGizmoDatabase_pendingAddValueDateForPassWithUniqueID___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_pendingAddValueDateForPassWithUniqueIDLocked:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)restoreBlockForVolatilePassData
{
  NSObject *v3;
  _BOOL4 v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  void *v25;
  void *v26;
  _QWORD v28[4];
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  _QWORD v35[4];
  id v36;
  NPKGizmoDatabase *v37;
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  uint8_t buf[16];

  pk_General_log();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);

  if (v4)
  {
    pk_General_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_213518000, v5, OS_LOG_TYPE_DEFAULT, "Notice: Fetching Volatile Pass Data from DB", buf, 2u);
    }

  }
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKGizmoDatabase passDescriptions](self, "passDescriptions");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v35[0] = MEMORY[0x24BDAC760];
  v35[1] = 3221225472;
  v35[2] = __51__NPKGizmoDatabase_restoreBlockForVolatilePassData__block_invoke;
  v35[3] = &unk_24CFEB1C0;
  v13 = v9;
  v36 = v13;
  v37 = self;
  v14 = v6;
  v38 = v14;
  v15 = v7;
  v39 = v15;
  v16 = v8;
  v40 = v16;
  v17 = v10;
  v41 = v17;
  v18 = v11;
  v42 = v18;
  objc_msgSend(v12, "enumerateObjectsUsingBlock:", v35);
  v28[0] = MEMORY[0x24BDAC760];
  v28[1] = 3221225472;
  v28[2] = __51__NPKGizmoDatabase_restoreBlockForVolatilePassData__block_invoke_2;
  v28[3] = &unk_24CFEB238;
  v29 = v13;
  v30 = v14;
  v31 = v15;
  v32 = v16;
  v33 = v17;
  v34 = v18;
  v19 = v18;
  v20 = v17;
  v21 = v16;
  v22 = v15;
  v23 = v14;
  v24 = v13;
  v25 = (void *)MEMORY[0x2199B6780](v28);
  v26 = (void *)MEMORY[0x2199B6780]();

  return v26;
}

void __51__NPKGizmoDatabase_restoreBlockForVolatilePassData__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;

  v22 = a2;
  v3 = *(void **)(a1 + 32);
  objc_msgSend(v22, "uniqueID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v22, v4);

  v5 = *(void **)(a1 + 40);
  objc_msgSend(v22, "uniqueID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "transactionSourceIdentifierForPassWithUniqueID:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = *(void **)(a1 + 48);
    objc_msgSend(v22, "uniqueID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKey:", v7, v9);

    objc_msgSend(*(id *)(a1 + 40), "transactionsForTransactionSourceIdentifier:withTransactionSource:withBackingData:startDate:endDate:orderedByDate:limit:", v7, 0, 0, 0, 0, 1, *MEMORY[0x24BE6F440]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
      objc_msgSend(*(id *)(a1 + 56), "setObject:forKey:", v10, v7);
    objc_msgSend(*(id *)(a1 + 40), "currentEphemeralTransactionIdentifierForTransactionSourceIdentifier:", v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
      objc_msgSend(*(id *)(a1 + 64), "setObject:forKey:", v11, v7);

  }
  v12 = *(void **)(a1 + 40);
  objc_msgSend(v22, "uniqueID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "paymentBalancesForPassWithUniqueID:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    v15 = *(void **)(a1 + 72);
    objc_msgSend(v22, "uniqueID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setObject:forKey:", v14, v16);

  }
  v17 = *(void **)(a1 + 40);
  objc_msgSend(v22, "uniqueID");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "subcredentialsForPassWithUniqueID:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    v20 = *(void **)(a1 + 80);
    objc_msgSend(v22, "uniqueID");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setObject:forKey:", v19, v21);

  }
}

void __51__NPKGizmoDatabase_restoreBlockForVolatilePassData__block_invoke_2(id *a1, void *a2)
{
  id v3;
  NSObject *v4;
  _BOOL4 v5;
  NSObject *v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  uint8_t buf[16];

  v3 = a2;
  pk_General_log();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);

  if (v5)
  {
    pk_General_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_213518000, v6, OS_LOG_TYPE_DEFAULT, "Notice: Restoring Volatile Pass Data on DB", buf, 2u);
    }

  }
  objc_msgSend(v3, "passDescriptions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __51__NPKGizmoDatabase_restoreBlockForVolatilePassData__block_invoke_333;
  v9[3] = &unk_24CFEB1C0;
  v10 = a1[4];
  v11 = v3;
  v12 = a1[5];
  v13 = a1[6];
  v14 = a1[7];
  v15 = a1[8];
  v16 = a1[9];
  v8 = v3;
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", v9);

}

void __51__NPKGizmoDatabase_restoreBlockForVolatilePassData__block_invoke_333(id *a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  _QWORD v28[4];
  id v29;
  id v30;
  _QWORD v31[4];
  id v32;
  id v33;
  id v34;

  v27 = a2;
  objc_msgSend(v27, "uniqueID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[4], "objectForKey:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "transitAppletState");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      v7 = a1[5];
      objc_msgSend(v5, "transitAppletState");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setTransitAppletState:forPassWithUniqueID:", v8, v3);

    }
    objc_msgSend(v5, "lastAddValueAmount");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      v10 = a1[5];
      objc_msgSend(v5, "lastAddValueAmount");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setLastAddValueAmount:forPassWithUniqueID:", v11, v3);

    }
    objc_msgSend(v5, "pendingAddValueDate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      v13 = a1[5];
      objc_msgSend(v5, "pendingAddValueDate");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setPendingAddValueDate:forPassWithUniqueID:", v14, v3);

    }
    objc_msgSend(v5, "preferredPaymentApplication");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = MEMORY[0x24BDAC760];
    if (v15)
    {
      objc_msgSend(v5, "preferredPaymentApplication");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "applicationIdentifier");
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v27, "devicePaymentApplications");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v31[0] = v16;
      v31[1] = 3221225472;
      v31[2] = __51__NPKGizmoDatabase_restoreBlockForVolatilePassData__block_invoke_2_334;
      v31[3] = &unk_24CFEB1E8;
      v32 = v18;
      v33 = v3;
      v34 = a1[5];
      v20 = v18;
      objc_msgSend(v19, "enumerateObjectsUsingBlock:", v31);

    }
    objc_msgSend(a1[6], "objectForKey:", v3);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (v21)
    {
      objc_msgSend(a1[7], "objectForKey:", v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v28[0] = v16;
      v28[1] = 3221225472;
      v28[2] = __51__NPKGizmoDatabase_restoreBlockForVolatilePassData__block_invoke_3;
      v28[3] = &unk_24CFEB210;
      v29 = a1[5];
      v23 = v21;
      v30 = v23;
      objc_msgSend(v22, "enumerateObjectsUsingBlock:", v28);
      objc_msgSend(a1[8], "objectForKey:", v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      if (v24)
        objc_msgSend(a1[5], "setCurrentEphemeralTransactionIdentifier:forTransactionSourceIdentifier:", v24, v23);

    }
    objc_msgSend(a1[9], "objectForKey:", v3);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    if (v25)
      objc_msgSend(a1[5], "setPaymentBalances:forPassWithUniqueID:", v25, v3);
    objc_msgSend(a1[10], "objectForKey:", v3);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (v26)
      objc_msgSend(a1[5], "setSubcredentials:forPassWithUniqueID:", v26, v3);

  }
}

void __51__NPKGizmoDatabase_restoreBlockForVolatilePassData__block_invoke_2_334(uint64_t a1, void *a2, _BYTE *a3)
{
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a2;
  objc_msgSend(v11, "applicationIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", *(_QWORD *)(a1 + 32));

  v7 = v11;
  if (v6)
  {
    +[NPKGizmoDatabase sharedDatabase](NPKGizmoDatabase, "sharedDatabase");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "passForUniqueID:", *(_QWORD *)(a1 + 40));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "paymentPass");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
      objc_msgSend(*(id *)(a1 + 48), "setPreferredPaymentApplication:forPaymentPass:", v11, v10);
    *a3 = 1;

    v7 = v11;
  }

}

uint64_t __51__NPKGizmoDatabase_restoreBlockForVolatilePassData__block_invoke_3(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_saveTransaction:forTransactionSourceIdentifier:withPaymentCredentialType:shouldTrim:", a2, *(_QWORD *)(a1 + 40), 103, 0);
}

- (void)_notifyDatabaseChangedWithNoop:(BOOL)a3
{
  -[NPKGizmoDatabase _notifyDatabaseChangedWithNoop:firstUnlock:](self, "_notifyDatabaseChangedWithNoop:firstUnlock:", a3, 0);
}

- (void)_notifyForFirstUnlock
{
  -[NPKGizmoDatabase _notifyDatabaseChangedWithNoop:firstUnlock:](self, "_notifyDatabaseChangedWithNoop:firstUnlock:", 0, 1);
}

- (void)_notifyDatabaseChangedWithNoop:(BOOL)a3 firstUnlock:(BOOL)a4
{
  _BOOL4 sendingLocalNotifyDatabaseChanged;
  NSObject *v8;
  _BOOL4 v9;
  NSObject *v10;
  NSObject *v11;
  _QWORD v12[5];
  BOOL v13;
  BOOL v14;
  uint8_t buf[16];

  sendingLocalNotifyDatabaseChanged = self->_sendingLocalNotifyDatabaseChanged;
  pk_General_log();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);

  if (sendingLocalNotifyDatabaseChanged)
  {
    if (v9)
    {
      pk_General_log();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_213518000, v10, OS_LOG_TYPE_DEFAULT, "Notice: NPKGizmoDatabase already sending DB change, so coalescing", buf, 2u);
      }

    }
    self->_needsMoreLocalNotifyDatabaseChanged = 1;
  }
  else
  {
    if (v9)
    {
      pk_General_log();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_213518000, v11, OS_LOG_TYPE_DEFAULT, "Notice: NPKGizmoDatabase alerting of DB change", buf, 2u);
      }

    }
    self->_sendingLocalNotifyDatabaseChanged = 1;
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __63__NPKGizmoDatabase__notifyDatabaseChangedWithNoop_firstUnlock___block_invoke;
    v12[3] = &unk_24CFEB260;
    v13 = a3;
    v14 = a4;
    v12[4] = self;
    dispatch_async(MEMORY[0x24BDAC9B8], v12);
  }
}

void __63__NPKGizmoDatabase__notifyDatabaseChangedWithNoop_firstUnlock___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  _QWORD block[5];
  char v9;
  _QWORD v10[2];
  _QWORD v11[3];

  v11[2] = *MEMORY[0x24BDAC8D0];
  v10[0] = NPKGizmoDatabaseChangedWasNoOpKeyName;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", *(unsigned __int8 *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v2;
  v10[1] = NPKGizmoDatabaseChangedWasFirstUnlockKeyName;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", *(unsigned __int8 *)(a1 + 41));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = v3;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v11, v10, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "postNotificationName:object:userInfo:", NPKGizmoDatabaseChangedNotificationName, *(_QWORD *)(a1 + 32), v4);

  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(NSObject **)(v6 + 328);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __63__NPKGizmoDatabase__notifyDatabaseChangedWithNoop_firstUnlock___block_invoke_2;
  block[3] = &unk_24CFE7D78;
  block[4] = v6;
  v9 = *(_BYTE *)(a1 + 40);
  dispatch_sync(v7, block);

}

uint64_t __63__NPKGizmoDatabase__notifyDatabaseChangedWithNoop_firstUnlock___block_invoke_2(uint64_t result)
{
  uint64_t v1;
  NSObject *v2;
  _BOOL4 v3;
  NSObject *v4;
  uint8_t v5[16];

  *(_BYTE *)(*(_QWORD *)(result + 32) + 372) = 0;
  if (*(_BYTE *)(*(_QWORD *)(result + 32) + 373))
  {
    v1 = result;
    pk_General_log();
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT);

    if (v3)
    {
      pk_General_log();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v5 = 0;
        _os_log_impl(&dword_213518000, v4, OS_LOG_TYPE_DEFAULT, "Notice: Finished alerting of DB change, but a coalesced change was detected...rebroadcasting", v5, 2u);
      }

    }
    *(_BYTE *)(*(_QWORD *)(v1 + 32) + 373) = 0;
    return objc_msgSend(*(id *)(v1 + 32), "_notifyDatabaseChangedWithNoop:", *(unsigned __int8 *)(v1 + 40));
  }
  return result;
}

- (void)_notifyDatabaseChangedExternally
{
  NSObject *v3;
  _BOOL4 v4;
  NSObject *v5;
  __CFNotificationCenter *DarwinNotifyCenter;
  uint8_t v7[16];

  pk_General_log();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);

  if (v4)
  {
    pk_General_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_213518000, v5, OS_LOG_TYPE_DEFAULT, "Notice: Alerting external clients of DB change...", v7, 2u);
    }

  }
  ++self->_externallyChangedBroadcasts;
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, (CFNotificationName)_NPKGizmoDatabaseExternallyChangedNotificationName, 0, 0, 1u);
}

- (BOOL)passDBIsAvailable
{
  NSObject *dbQueue;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  dbQueue = self->_dbQueue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __37__NPKGizmoDatabase_passDBIsAvailable__block_invoke;
  v5[3] = &unk_24CFE8318;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dbQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __37__NPKGizmoDatabase_passDBIsAvailable__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_passDBIsAvailableLocked");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (unint64_t)numberOfPasses
{
  void *v2;
  unint64_t v3;

  -[NPKGizmoDatabase manifestHashes](self, "manifestHashes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  return v3;
}

- (BOOL)_passDBIsAvailableLocked
{
  -[NPKGizmoDatabase database](self, "database");
  return self->_passDBIsAvailable;
}

- (void)_savePassLocked:(id)a3 locallyAdded:(BOOL)a4 wasUpdate:(BOOL *)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  NSMutableDictionary *manifest;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  BOOL v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  _BOOL4 v26;
  NSObject *v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  id v42;
  uint64_t v43;
  id v44;
  void *v45;
  id v46;
  void *v47;
  id v48;
  id v50;
  void *v51;
  void *context;
  void *v53;
  _QWORD v54[5];
  id v55;
  id v56;
  id v57;
  id v58;
  id v59;
  id v60;
  id v61;
  id v62;
  id v63;
  id v64;
  id v65;
  uint64_t v66;
  BOOL v67;
  BOOL v68;
  id v69;
  uint8_t buf[4];
  void *v71;
  uint64_t v72;

  v72 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  context = (void *)MEMORY[0x2199B65AC]();
  objc_msgSend(v7, "passTypeIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = (void *)objc_msgSend(v8, "copy");

  v53 = v7;
  v9 = (void *)objc_msgSend(v7, "copy");
  objc_msgSend(v9, "uniqueID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKGizmoDatabase _passForUniqueIDLocked:includeImageSets:](self, "_passForUniqueIDLocked:includeImageSets:", v10, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "paymentPass");
  v12 = objc_claimAutoreleasedReturnValue();
  v43 = NPKPassDescriptionExpressTypesMaskWithPass(v9);
  if (v11)
  {
    manifest = self->_manifest;
    objc_msgSend(v9, "uniqueID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKey:](manifest, "objectForKey:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "remoteManifestHashes");
    v45 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v45 = 0;
  }
  v51 = (void *)v12;
  if (v12)
  {
    v69 = 0;
    v16 = -[NPKGizmoDatabase _getPreferredPaymentApplicationForPaymentPass:aid:](self, "_getPreferredPaymentApplicationForPaymentPass:aid:", v12, &v69);
    v42 = v69;
    objc_msgSend(v9, "uniqueID");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = -[NPKGizmoDatabase _getDeletePendingForUniqueID:](self, "_getDeletePendingForUniqueID:", v17);

    objc_msgSend(v9, "uniqueID");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[NPKGizmoDatabase _transitAppletStateForPassWithUniqueIDLocked:](self, "_transitAppletStateForPassWithUniqueIDLocked:", v19);
    v41 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "uniqueID");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[NPKGizmoDatabase _lastAddValueAmountForPassWithUniqueIDLocked:](self, "_lastAddValueAmountForPassWithUniqueIDLocked:", v20);
    v40 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "uniqueID");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[NPKGizmoDatabase _pendingAddValueDateForPassWithUniqueIDLocked:](self, "_pendingAddValueDateForPassWithUniqueIDLocked:", v21);
    v39 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "uniqueID");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[NPKGizmoDatabase _paymentBalancesForPassWithUniqueIDLocked:](self, "_paymentBalancesForPassWithUniqueIDLocked:", v22);
    v38 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "uniqueID");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[NPKGizmoDatabase _subcredentialsForPassWithUniqueIDLocked:](self, "_subcredentialsForPassWithUniqueIDLocked:", v23);
    v37 = (void *)objc_claimAutoreleasedReturnValue();

    if (!a5)
      goto LABEL_7;
    goto LABEL_6;
  }
  v39 = 0;
  v40 = 0;
  v18 = 0;
  v37 = 0;
  v38 = 0;
  v41 = 0;
  v42 = 0;
  if (a5)
LABEL_6:
    *a5 = v11 != 0;
LABEL_7:
  objc_msgSend(v11, "diff:", v9);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  pk_General_log();
  v25 = objc_claimAutoreleasedReturnValue();
  v26 = os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT);

  if (v26)
  {
    pk_General_log();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v71 = v24;
      _os_log_impl(&dword_213518000, v27, OS_LOG_TYPE_DEFAULT, "Notice: Saving diff %@", buf, 0xCu);
    }

  }
  v54[0] = MEMORY[0x24BDAC760];
  v54[1] = 3221225472;
  v54[2] = __59__NPKGizmoDatabase__savePassLocked_locallyAdded_wasUpdate___block_invoke;
  v54[3] = &unk_24CFEB288;
  v54[4] = self;
  v55 = v9;
  v56 = v11;
  v57 = v24;
  v67 = v18;
  v36 = v24;
  v58 = v42;
  v59 = v41;
  v60 = v40;
  v61 = v39;
  v68 = a4;
  v62 = v45;
  v63 = v38;
  v64 = v37;
  v65 = v47;
  v66 = v43;
  v50 = v47;
  v44 = v37;
  v48 = v38;
  v28 = v45;
  v29 = v39;
  v46 = v40;
  v30 = v41;
  v31 = v42;
  v32 = v36;
  v33 = v11;
  v34 = v9;
  -[NPKGizmoDatabase _performTransactionWithBlock:](self, "_performTransactionWithBlock:", v54);
  objc_msgSend(v34, "uniqueID");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKGizmoDatabase _createTransactionSourceIdentifierIfNecessaryForPassWithUniqueIDLocked:](self, "_createTransactionSourceIdentifierIfNecessaryForPassWithUniqueIDLocked:", v35);

  objc_autoreleasePoolPop(context);
}

uint64_t __59__NPKGizmoDatabase__savePassLocked_locallyAdded_wasUpdate___block_invoke(uint64_t a1)
{
  sqlite3_stmt *v2;
  id v3;
  NSObject *v4;
  _BOOL4 v5;
  NSObject *v6;
  const char *v7;
  const char *v8;
  sqlite3_stmt *v9;
  id v10;
  void *v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  id v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  _BOOL4 v20;
  NSObject *v21;
  _BOOL4 v22;
  NSObject *v23;
  char *v24;
  void *v25;
  id v26;
  NSObject *v27;
  _BOOL4 v28;
  char *v29;
  id v30;
  id v31;
  void *v32;
  id v33;
  void *v34;
  id v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  id v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  id v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  id v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  id v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  id v73;
  void *v74;
  void *v75;
  void *v76;
  id v77;
  void *v78;
  void *v79;
  void *v80;
  id v81;
  void *v82;
  void *v83;
  void *v84;
  id v85;
  void *v86;
  id v87;
  void *v88;
  double v89;
  id v90;
  const void *v91;
  void *v92;
  int v93;
  void *v94;
  unint64_t i;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  id v103;
  void *v104;
  id v105;
  void *v106;
  id v107;
  void *v108;
  void *v109;
  void *v110;
  id v111;
  void *v112;
  void *v113;
  void *v114;
  id v115;
  void *v116;
  id v117;
  void *v118;
  id v119;
  void *v120;
  double v121;
  void *v122;
  NSObject *v123;
  _BOOL4 v124;
  NSObject *v125;
  char *v126;
  const char *v127;
  void *v128;
  void *v129;
  id v130;
  NSObject *v131;
  _BOOL4 v132;
  NSObject *v133;
  char *v134;
  const char *v135;
  NSObject *v136;
  _BOOL4 v137;
  NSObject *v138;
  char *v139;
  const char *v140;
  void *v141;
  void *v142;
  id v143;
  NSObject *v144;
  _BOOL4 v145;
  NSObject *v146;
  char *v147;
  const char *v148;
  int v149;
  NSObject *v150;
  _BOOL4 v151;
  NSObject *v152;
  id v153;
  uint64_t v154;
  NSObject *v155;
  _BOOL4 v156;
  NSObject *v157;
  const char *v158;
  const char *v159;
  void *v160;
  void *v161;
  void *v162;
  id v163;
  uint64_t v164;
  uint64_t v165;
  uint64_t v166;
  void *v167;
  void *v168;
  void *v169;
  char v170;
  NPKPassDescription *v171;
  void *v172;
  void *v173;
  void *v174;
  void *v175;
  void *v176;
  void *v177;
  void *v178;
  void *v179;
  void *v180;
  void *v181;
  void *v182;
  void *v183;
  void *v184;
  void *v185;
  void *v186;
  void *v187;
  void *v188;
  void *v189;
  void *v190;
  void *v191;
  void *v192;
  void *v193;
  void *v194;
  void *v195;
  void *v196;
  void *v197;
  void *v198;
  uint64_t v199;
  void *v200;
  void *v202;
  void *v203;
  void *v204;
  id v205;
  id v206;
  unsigned int v207;
  id v208;
  id v209;
  id v210;
  void *v211;
  id v212;
  id v213;
  id v214;
  id v215;
  void *v216;
  NPKGizmoDatabaseManifestEntry *v217;
  void *v218;
  __int128 v219;
  __int128 v220;
  __int128 v221;
  __int128 v222;
  _QWORD v223[4];
  id v224;
  uint64_t *v225;
  uint64_t v226;
  uint64_t *v227;
  uint64_t v228;
  uint64_t (*v229)(uint64_t, uint64_t);
  void (*v230)(uint64_t);
  id v231;
  uint8_t v232[128];
  uint8_t buf[4];
  const char *v234;
  __int16 v235;
  const char *v236;
  __int16 v237;
  uint64_t v238;
  __int16 v239;
  _BYTE v240[24];
  uint64_t v241;

  v241 = *MEMORY[0x24BDAC8D0];
  v2 = (sqlite3_stmt *)objc_msgSend(*(id *)(a1 + 32), "deleteStatement");
  objc_msgSend(*(id *)(a1 + 40), "uniqueID");
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  sqlite3_bind_text(v2, 1, (const char *)objc_msgSend(v3, "UTF8String"), -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);

  if ((sqlite3_step(v2) & 0xFFFFFFFE) != 0x64)
  {
    pk_General_log();
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = os_log_type_enabled(v4, OS_LOG_TYPE_ERROR);

    if (v5)
    {
      pk_General_log();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        v7 = sqlite3_sql(v2);
        v8 = sqlite3_errmsg(*(sqlite3 **)(*(_QWORD *)(a1 + 32) + 8));
        *(_DWORD *)buf = 136447234;
        v234 = "-[NPKGizmoDatabase _savePassLocked:locallyAdded:wasUpdate:]_block_invoke";
        v235 = 2082;
        v236 = "/Library/Caches/com.apple.xbs/Sources/NanoPassbook_Frameworks/NanoPassKit/NPKGizmoDatabase.m";
        v237 = 2048;
        v238 = 2246;
        v239 = 2080;
        *(_QWORD *)v240 = v7;
        *(_WORD *)&v240[8] = 2080;
        *(_QWORD *)&v240[10] = v8;
        _os_log_impl(&dword_213518000, v6, OS_LOG_TYPE_ERROR, "Error: *** NPKAssertion failure in %{public}s, %{public}s:%ld (reason: Delete failed: %s; %s)",
          buf,
          0x34u);
      }

    }
    _NPKAssertAbort();
  }
  sqlite3_clear_bindings(v2);
  sqlite3_reset(v2);
  v9 = (sqlite3_stmt *)objc_msgSend(*(id *)(a1 + 32), "insertStatement");
  objc_msgSend(*(id *)(a1 + 40), "uniqueID");
  v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  sqlite3_bind_text(v9, 1, (const char *)objc_msgSend(v10, "UTF8String"), -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);

  objc_msgSend(*(id *)(a1 + 40), "passTypeIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v11, "copy");

  v208 = objc_retainAutorelease(v12);
  v13 = (const char *)objc_msgSend(v208, "UTF8String");
  sqlite3_bind_text(v9, 2, v13, -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
  sqlite3_bind_int(v9, 3, objc_msgSend(*(id *)(a1 + 40), "style"));
  objc_msgSend(*(id *)(a1 + 40), "npkCompleteHash");
  v212 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  sqlite3_bind_blob(v9, 4, (const void *)objc_msgSend(v212, "bytes"), objc_msgSend(v212, "length"), (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
  objc_msgSend(*(id *)(a1 + 48), "ingestedDate");
  v14 = objc_claimAutoreleasedReturnValue();
  if (!v14)
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v14 = objc_claimAutoreleasedReturnValue();
  }
  v204 = (void *)v14;
  objc_msgSend(*(id *)(a1 + 40), "setIngestedDate:");
  v216 = (void *)objc_msgSend(*(id *)(a1 + 40), "copy");
  v15 = objc_alloc(MEMORY[0x24BE6EBC0]);
  v211 = (void *)objc_msgSend(v15, "initWithDictionary:bundle:", MEMORY[0x24BDBD1B8], 0);
  objc_msgSend(v211, "setMissingImageSetsFromObject:", v216);
  objc_msgSend(v216, "flushLoadedImageSets");
  NPKSecureArchiveObject(v216);
  v215 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  sqlite3_bind_blob(v9, 5, (const void *)objc_msgSend(v215, "bytes"), objc_msgSend(v215, "length"), (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
  if (os_variant_has_internal_ui())
  {
    v16 = objc_opt_class();
    NPKSecureUnarchiveObject(v215, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v17;
    if (v17)
    {
      objc_msgSend(v17, "passTypeIdentifier");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "length") == 0;

      if (!v20)
        goto LABEL_19;
      pk_General_log();
      v21 = objc_claimAutoreleasedReturnValue();
      v22 = os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT);

      if (!v22)
        goto LABEL_19;
      pk_General_log();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(*(id *)(a1 + 40), "uniqueID");
        v24 = (char *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v216, "passTypeIdentifier");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromBOOL();
        v26 = (id)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136316162;
        v234 = "-[NPKGizmoDatabase _savePassLocked:locallyAdded:wasUpdate:]_block_invoke";
        v235 = 2112;
        v236 = v24;
        v237 = 2112;
        v238 = (uint64_t)v208;
        v239 = 2112;
        *(_QWORD *)v240 = v25;
        *(_WORD *)&v240[8] = 2112;
        *(_QWORD *)&v240[10] = v26;
        _os_log_impl(&dword_213518000, v23, OS_LOG_TYPE_DEFAULT, "Warning: %s encoded_pass Encoding of pass with uniqueID %@ is missing the type identifier. Type identifier in stmt: %@. Type identifier from PKPass the archive was created from: %@ isUpdate?: %@", buf, 0x34u);

      }
    }
    else
    {
      pk_General_log();
      v27 = objc_claimAutoreleasedReturnValue();
      v28 = os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT);

      if (!v28)
      {
LABEL_19:

        goto LABEL_20;
      }
      pk_General_log();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(*(id *)(a1 + 40), "uniqueID");
        v29 = (char *)objc_claimAutoreleasedReturnValue();
        NSStringFromBOOL();
        v30 = (id)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136315650;
        v234 = "-[NPKGizmoDatabase _savePassLocked:locallyAdded:wasUpdate:]_block_invoke";
        v235 = 2112;
        v236 = v29;
        v237 = 2112;
        v238 = (uint64_t)v30;
        _os_log_impl(&dword_213518000, v23, OS_LOG_TYPE_DEFAULT, "Warning: %s encoded_pass There was a problem unarchiving the pass archive for pass with uniqueID %@. isUpdate?: %@", buf, 0x20u);

      }
    }

    goto LABEL_19;
  }
LABEL_20:
  if (v211)
  {
    NPKSecureArchiveObject(v211);
    v31 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    sqlite3_bind_blob(v9, 6, (const void *)objc_msgSend(v31, "bytes"), objc_msgSend(v31, "length"), (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);

  }
  else
  {
    sqlite3_bind_null(v9, 6);
  }
  v32 = *(void **)(a1 + 56);
  if (v32)
  {
    NPKSecureArchiveObject(v32);
    v33 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    sqlite3_bind_blob(v9, 7, (const void *)objc_msgSend(v33, "bytes"), objc_msgSend(v33, "length"), (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);

  }
  objc_msgSend(*(id *)(a1 + 40), "logoText");
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  if (v34)
  {
    objc_msgSend(*(id *)(a1 + 40), "logoText");
    v35 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    sqlite3_bind_text(v9, 8, (const char *)objc_msgSend(v35, "UTF8String"), -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);

  }
  objc_msgSend(*(id *)(a1 + 40), "logoImage");
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  if (v36)
  {
    objc_msgSend(*(id *)(a1 + 40), "logoImage");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    NPKSecureArchiveObject(v37);
    v38 = (void *)objc_claimAutoreleasedReturnValue();

    v214 = objc_retainAutorelease(v38);
    sqlite3_bind_blob(v9, 9, (const void *)objc_msgSend(v214, "bytes"), objc_msgSend(v214, "length"), (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
  }
  else
  {
    v214 = 0;
  }
  objc_msgSend(*(id *)(a1 + 40), "displayProfile");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "backgroundColor");
  v40 = (void *)objc_claimAutoreleasedReturnValue();

  if (v40)
  {
    objc_msgSend(*(id *)(a1 + 40), "displayProfile");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "backgroundColor");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    NPKSecureArchiveObject(v42);
    v43 = (void *)objc_claimAutoreleasedReturnValue();

    v44 = objc_retainAutorelease(v43);
    sqlite3_bind_blob(v9, 10, (const void *)objc_msgSend(v44, "bytes"), objc_msgSend(v44, "length"), (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);

  }
  objc_msgSend(*(id *)(a1 + 40), "displayProfile");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "labelColor");
  v46 = (void *)objc_claimAutoreleasedReturnValue();

  if (v46)
  {
    objc_msgSend(*(id *)(a1 + 40), "displayProfile");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "labelColor");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    NPKSecureArchiveObject(v48);
    v49 = (void *)objc_claimAutoreleasedReturnValue();

    v50 = objc_retainAutorelease(v49);
    sqlite3_bind_blob(v9, 11, (const void *)objc_msgSend(v50, "bytes"), objc_msgSend(v50, "length"), (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);

  }
  objc_msgSend(*(id *)(a1 + 40), "displayProfile");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "foregroundColor");
  v52 = (void *)objc_claimAutoreleasedReturnValue();

  if (v52)
  {
    objc_msgSend(*(id *)(a1 + 40), "displayProfile");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "foregroundColor");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    NPKSecureArchiveObject(v54);
    v55 = (void *)objc_claimAutoreleasedReturnValue();

    v56 = objc_retainAutorelease(v55);
    sqlite3_bind_blob(v9, 12, (const void *)objc_msgSend(v56, "bytes"), objc_msgSend(v56, "length"), (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);

  }
  objc_msgSend(*(id *)(a1 + 40), "backgroundImage");
  v57 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v57)
  {
    v213 = 0;
    goto LABEL_44;
  }
  if (objc_msgSend(*(id *)(a1 + 40), "style") != 2)
  {
    objc_msgSend(*(id *)(a1 + 40), "backgroundImage");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    if (v62)
      goto LABEL_39;
LABEL_42:
    v63 = 0;
    goto LABEL_43;
  }
  v58 = (void *)MEMORY[0x24BE6EB68];
  objc_msgSend(*(id *)(a1 + 40), "backgroundImage");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "size");
  objc_msgSend(v58, "constraintsWithFixedSize:");
  v60 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "backgroundImage");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "blurredImageWithRadius:constraints:", 27, v60);
  v62 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v62)
    goto LABEL_42;
LABEL_39:
  NPKSecureArchiveObject(v62);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_43:
  v213 = objc_retainAutorelease(v63);
  sqlite3_bind_blob(v9, 13, (const void *)objc_msgSend(v213, "bytes"), objc_msgSend(v213, "length"), (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);

LABEL_44:
  objc_msgSend(*(id *)(a1 + 40), "nfcPayload");
  v64 = (void *)objc_claimAutoreleasedReturnValue();

  if (v64)
  {
    objc_msgSend(*(id *)(a1 + 40), "nfcPayload");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    NPKSecureArchiveObject(v65);
    v66 = (void *)objc_claimAutoreleasedReturnValue();

    v67 = objc_retainAutorelease(v66);
    sqlite3_bind_blob(v9, 14, (const void *)objc_msgSend(v67, "bytes"), objc_msgSend(v67, "length"), (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);

  }
  objc_msgSend(*(id *)(a1 + 40), "paymentPass");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  sqlite3_bind_int(v9, 15, objc_msgSend(v68, "isPrivateLabel"));

  objc_msgSend(*(id *)(a1 + 40), "paymentPass");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  sqlite3_bind_int(v9, 16, objc_msgSend(v69, "isCobranded"));

  objc_msgSend(*(id *)(a1 + 40), "paymentPass");
  v218 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v218, "devicePaymentApplications");
  v70 = (void *)objc_claimAutoreleasedReturnValue();

  if (v70)
  {
    objc_msgSend(v218, "devicePaymentApplications");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    NPKSecureArchiveObject(v71);
    v72 = (void *)objc_claimAutoreleasedReturnValue();

    v73 = objc_retainAutorelease(v72);
    sqlite3_bind_blob(v9, 17, (const void *)objc_msgSend(v73, "bytes"), objc_msgSend(v73, "length"), (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);

  }
  else
  {
    sqlite3_bind_null(v9, 17);
  }
  objc_msgSend(v218, "devicePrimaryPaymentApplication");
  v74 = (void *)objc_claimAutoreleasedReturnValue();

  if (v74)
  {
    objc_msgSend(v218, "devicePrimaryPaymentApplication");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    NPKSecureArchiveObject(v75);
    v76 = (void *)objc_claimAutoreleasedReturnValue();

    v77 = objc_retainAutorelease(v76);
    sqlite3_bind_blob(v9, 18, (const void *)objc_msgSend(v77, "bytes"), objc_msgSend(v77, "length"), (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);

  }
  else
  {
    sqlite3_bind_null(v9, 18);
  }
  objc_msgSend(v218, "devicePrimaryContactlessPaymentApplication");
  v78 = (void *)objc_claimAutoreleasedReturnValue();

  if (v78)
  {
    objc_msgSend(v218, "devicePrimaryContactlessPaymentApplication");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    NPKSecureArchiveObject(v79);
    v80 = (void *)objc_claimAutoreleasedReturnValue();

    v81 = objc_retainAutorelease(v80);
    sqlite3_bind_blob(v9, 19, (const void *)objc_msgSend(v81, "bytes"), objc_msgSend(v81, "length"), (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);

  }
  else
  {
    sqlite3_bind_null(v9, 19);
  }
  objc_msgSend(v218, "devicePrimaryInAppPaymentApplication");
  v82 = (void *)objc_claimAutoreleasedReturnValue();

  if (v82)
  {
    objc_msgSend(v218, "devicePrimaryInAppPaymentApplication");
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    NPKSecureArchiveObject(v83);
    v84 = (void *)objc_claimAutoreleasedReturnValue();

    v85 = objc_retainAutorelease(v84);
    sqlite3_bind_blob(v9, 20, (const void *)objc_msgSend(v85, "bytes"), objc_msgSend(v85, "length"), (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);

  }
  else
  {
    sqlite3_bind_null(v9, 20);
  }
  v226 = 0;
  v227 = &v226;
  v228 = 0x3032000000;
  v229 = __Block_byref_object_copy__14;
  v230 = __Block_byref_object_dispose__14;
  v231 = 0;
  if (!v218)
    goto LABEL_62;
  if (!*(_QWORD *)(a1 + 64))
    goto LABEL_62;
  objc_msgSend(v218, "devicePaymentApplications");
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  v223[0] = MEMORY[0x24BDAC760];
  v223[1] = 3221225472;
  v223[2] = __59__NPKGizmoDatabase__savePassLocked_locallyAdded_wasUpdate___block_invoke_338;
  v223[3] = &unk_24CFE7EE0;
  v224 = *(id *)(a1 + 64);
  v225 = &v226;
  objc_msgSend(v86, "enumerateObjectsUsingBlock:", v223);

  if (v227[5])
  {
    sqlite3_bind_text(v9, 21, (const char *)objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 64)), "UTF8String"), -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
    NPKSecureArchiveObject((void *)v227[5]);
    v87 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    sqlite3_bind_blob(v9, 22, (const void *)objc_msgSend(v87, "bytes"), objc_msgSend(v87, "length"), (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);

  }
  else
  {
LABEL_62:
    sqlite3_bind_null(v9, 21);
    sqlite3_bind_null(v9, 22);
  }
  objc_msgSend(*(id *)(a1 + 40), "ingestedDate");
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v88, "timeIntervalSinceReferenceDate");
  sqlite3_bind_int(v9, 23, (int)v89);

  objc_msgSend(*(id *)(a1 + 40), "npkCompleteHash");
  v90 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v91 = (const void *)objc_msgSend(v90, "bytes");
  objc_msgSend(*(id *)(a1 + 40), "npkCompleteHash");
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  sqlite3_bind_blob(v9, 24, v91, objc_msgSend(v92, "length"), (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);

  sqlite3_bind_int(v9, 25, *(unsigned __int8 *)(a1 + 136));
  if (v218)
  {
    v93 = objc_msgSend(v218, "effectiveContactlessPaymentApplicationState");
    v207 = objc_msgSend(v218, "npkHasUserSelectableContactlessPaymentApplications");
  }
  else
  {
    v207 = 0;
    v93 = 0;
  }
  sqlite3_bind_int(v9, 26, v93);
  sqlite3_bind_int(v9, 27, v207);
  sqlite3_bind_int(v9, 28, objc_msgSend(*(id *)(a1 + 40), "hasStoredValue"));
  sqlite3_bind_int64(v9, 29, objc_msgSend(*(id *)(a1 + 40), "settings"));
  v94 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend((id)objc_opt_class(), "latestWatchOSMajorVersion"));
  for (i = 0; i < objc_msgSend((id)objc_opt_class(), "latestWatchOSMajorVersion"); ++i)
  {
    objc_msgSend(*(id *)(a1 + 40), "npkCompleteHashForWatchOSVersion:", i + 1);
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v94, "setObject:atIndexedSubscript:", v96, i);

  }
  v202 = (void *)objc_msgSend(v94, "copy");
  NPKSecureArchiveObject(v202);
  v210 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  sqlite3_bind_blob(v9, 30, (const void *)objc_msgSend(v210, "bytes"), objc_msgSend(v210, "length"), (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
  objc_msgSend(v218, "issuerCountryCode");
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  v206 = v97;
  if (v97)
    sqlite3_bind_text(v9, 31, (const char *)objc_msgSend(objc_retainAutorelease(v97), "UTF8String", v202), -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
  else
    sqlite3_bind_null(v9, 31);
  objc_msgSend(*(id *)(a1 + 40), "paymentPass", v202);
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v98, "availableActions");
  v99 = (void *)objc_claimAutoreleasedReturnValue();

  if (v99)
  {
    objc_msgSend(*(id *)(a1 + 40), "paymentPass");
    v100 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v100, "availableActions");
    v101 = (void *)objc_claimAutoreleasedReturnValue();
    NPKSecureArchiveObject(v101);
    v102 = (void *)objc_claimAutoreleasedReturnValue();

    v103 = objc_retainAutorelease(v102);
    sqlite3_bind_blob(v9, 32, (const void *)objc_msgSend(v103, "bytes"), objc_msgSend(v103, "length"), (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);

  }
  else
  {
    sqlite3_bind_null(v9, 32);
  }
  objc_msgSend(*(id *)(a1 + 40), "organizationName");
  v104 = (void *)objc_claimAutoreleasedReturnValue();

  if (v104)
  {
    objc_msgSend(*(id *)(a1 + 40), "organizationName");
    v105 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    sqlite3_bind_text(v9, 33, (const char *)objc_msgSend(v105, "UTF8String"), -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);

  }
  else
  {
    sqlite3_bind_null(v9, 33);
  }
  v106 = *(void **)(a1 + 72);
  if (v106)
  {
    NPKSecureArchiveObject(v106);
    v107 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    sqlite3_bind_blob(v9, 34, (const void *)objc_msgSend(v107, "bytes"), objc_msgSend(v107, "length"), (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);

  }
  else
  {
    sqlite3_bind_null(v9, 34);
  }
  objc_msgSend(*(id *)(a1 + 40), "frontFieldBuckets");
  v108 = (void *)objc_claimAutoreleasedReturnValue();

  if (v108)
  {
    objc_msgSend(*(id *)(a1 + 40), "frontFieldBuckets");
    v109 = (void *)objc_claimAutoreleasedReturnValue();
    NPKSecureArchiveObject(v109);
    v110 = (void *)objc_claimAutoreleasedReturnValue();

    v111 = objc_retainAutorelease(v110);
    sqlite3_bind_blob(v9, 35, (const void *)objc_msgSend(v111, "bytes"), objc_msgSend(v111, "length"), (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);

  }
  else
  {
    sqlite3_bind_null(v9, 35);
  }
  objc_msgSend(*(id *)(a1 + 40), "backFieldBuckets");
  v112 = (void *)objc_claimAutoreleasedReturnValue();

  if (v112)
  {
    objc_msgSend(*(id *)(a1 + 40), "backFieldBuckets");
    v113 = (void *)objc_claimAutoreleasedReturnValue();
    NPKSecureArchiveObject(v113);
    v114 = (void *)objc_claimAutoreleasedReturnValue();

    v115 = objc_retainAutorelease(v114);
    sqlite3_bind_blob(v9, 36, (const void *)objc_msgSend(v115, "bytes"), objc_msgSend(v115, "length"), (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);

  }
  else
  {
    sqlite3_bind_null(v9, 36);
  }
  v116 = *(void **)(a1 + 80);
  if (v116)
  {
    objc_msgSend(v116, "stringValue");
    v117 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    sqlite3_bind_text(v9, 37, (const char *)objc_msgSend(v117, "UTF8String"), -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);

  }
  else
  {
    sqlite3_bind_null(v9, 37);
  }
  objc_msgSend(*(id *)(a1 + 40), "localizedDescription");
  v118 = (void *)objc_claimAutoreleasedReturnValue();

  if (v118)
  {
    objc_msgSend(*(id *)(a1 + 40), "localizedDescription");
    v119 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    sqlite3_bind_text(v9, 38, (const char *)objc_msgSend(v119, "UTF8String"), -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);

  }
  else
  {
    sqlite3_bind_null(v9, 38);
  }
  v120 = *(void **)(a1 + 88);
  if (v120)
  {
    objc_msgSend(v120, "timeIntervalSinceReferenceDate");
    sqlite3_bind_int(v9, 39, (int)v121);
  }
  else
  {
    sqlite3_bind_null(v9, 39);
  }
  sqlite3_bind_int64(v9, 40, *(_QWORD *)(a1 + 128));
  v122 = v94;
  if (*(_BYTE *)(a1 + 137))
    v122 = *(void **)(a1 + 96);
  v205 = v122;
  NPKSecureArchiveObject(v205);
  v209 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  sqlite3_bind_blob(v9, 41, (const void *)objc_msgSend(v209, "bytes"), objc_msgSend(v209, "length"), (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
  sqlite3_bind_int(v9, 42, objc_msgSend(v218, "isPeerPaymentPass"));
  if (*(_QWORD *)(a1 + 104))
  {
    pk_General_log();
    v123 = objc_claimAutoreleasedReturnValue();
    v124 = os_log_type_enabled(v123, OS_LOG_TYPE_DEFAULT);

    if (v124)
    {
      pk_General_log();
      v125 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v125, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(*(id *)(a1 + 40), "uniqueID");
        v126 = (char *)objc_claimAutoreleasedReturnValue();
        v127 = *(const char **)(a1 + 104);
        *(_DWORD *)buf = 138412546;
        v234 = v126;
        v235 = 2112;
        v236 = v127;
        _os_log_impl(&dword_213518000, v125, OS_LOG_TYPE_DEFAULT, "Notice: (PKPaymentBalance restore) restoring old balances for pass %@ %@", buf, 0x16u);

      }
    }
    NPKSecureArchiveObject(*(void **)(a1 + 104));
    v128 = (void *)objc_claimAutoreleasedReturnValue();
    v129 = v128;
    if (v128)
    {
      v130 = objc_retainAutorelease(v128);
      sqlite3_bind_blob(v9, 43, (const void *)objc_msgSend(v130, "bytes"), objc_msgSend(v130, "length"), (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
    }
    else
    {
      pk_General_log();
      v131 = objc_claimAutoreleasedReturnValue();
      v132 = os_log_type_enabled(v131, OS_LOG_TYPE_DEFAULT);

      if (v132)
      {
        pk_General_log();
        v133 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v133, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(*(id *)(a1 + 40), "uniqueID");
          v134 = (char *)objc_claimAutoreleasedReturnValue();
          v135 = *(const char **)(a1 + 104);
          *(_DWORD *)buf = 138412546;
          v234 = v134;
          v235 = 2112;
          v236 = v135;
          _os_log_impl(&dword_213518000, v133, OS_LOG_TYPE_DEFAULT, "Notice: (PKPaymentBalance restore) archiving old balances for pass %@ %@ returned nil", buf, 0x16u);

        }
      }
      sqlite3_bind_null(v9, 43);
    }

  }
  else
  {
    sqlite3_bind_null(v9, 43);
  }
  if (*(_QWORD *)(a1 + 112))
  {
    pk_General_log();
    v136 = objc_claimAutoreleasedReturnValue();
    v137 = os_log_type_enabled(v136, OS_LOG_TYPE_DEFAULT);

    if (v137)
    {
      pk_General_log();
      v138 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v138, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(*(id *)(a1 + 40), "uniqueID");
        v139 = (char *)objc_claimAutoreleasedReturnValue();
        v140 = *(const char **)(a1 + 112);
        *(_DWORD *)buf = 138412546;
        v234 = v139;
        v235 = 2112;
        v236 = v140;
        _os_log_impl(&dword_213518000, v138, OS_LOG_TYPE_DEFAULT, "Notice: (PKAppletSubcredential restore) restoring old subcredentials for pass %@ %@", buf, 0x16u);

      }
    }
    NPKSecureArchiveObject(*(void **)(a1 + 112));
    v141 = (void *)objc_claimAutoreleasedReturnValue();
    v142 = v141;
    if (v141)
    {
      v143 = objc_retainAutorelease(v141);
      sqlite3_bind_blob(v9, 44, (const void *)objc_msgSend(v143, "bytes"), objc_msgSend(v143, "length"), (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
    }
    else
    {
      pk_General_log();
      v144 = objc_claimAutoreleasedReturnValue();
      v145 = os_log_type_enabled(v144, OS_LOG_TYPE_DEFAULT);

      if (v145)
      {
        pk_General_log();
        v146 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v146, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(*(id *)(a1 + 40), "uniqueID");
          v147 = (char *)objc_claimAutoreleasedReturnValue();
          v148 = *(const char **)(a1 + 112);
          *(_DWORD *)buf = 138412546;
          v234 = v147;
          v235 = 2112;
          v236 = v148;
          _os_log_impl(&dword_213518000, v146, OS_LOG_TYPE_DEFAULT, "Notice: (PKAppletSubcredential restore) archiving old subcredentials for pass %@ %@ returned nil", buf, 0x16u);

        }
      }
      sqlite3_bind_null(v9, 44);
    }

  }
  else
  {
    sqlite3_bind_null(v9, 44);
  }
  v149 = sqlite3_step(v9);
  if ((v149 & 0xFFFFFFFE) != 0x64)
  {
    pk_General_log();
    v150 = objc_claimAutoreleasedReturnValue();
    v151 = os_log_type_enabled(v150, OS_LOG_TYPE_ERROR);

    if (v151)
    {
      pk_General_log();
      v152 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v152, OS_LOG_TYPE_ERROR))
      {
        v153 = objc_retainAutorelease(*(id *)(a1 + 120));
        v154 = objc_msgSend(v153, "UTF8String");
        *(_DWORD *)buf = 138413058;
        v234 = (const char *)v153;
        v235 = 2080;
        v236 = (const char *)v154;
        v237 = 2112;
        v238 = (uint64_t)v208;
        v239 = 2080;
        *(_QWORD *)v240 = v13;
        _os_log_impl(&dword_213518000, v152, OS_LOG_TYPE_ERROR, "Error: Insert failed. passTypeIdentifier for insert stmt. Values inputStr: %@, inputUTF8: %s, stmtStr: %@, stmtUTF8: %s", buf, 0x2Au);
      }

    }
    pk_General_log();
    v155 = objc_claimAutoreleasedReturnValue();
    v156 = os_log_type_enabled(v155, OS_LOG_TYPE_ERROR);

    if (v156)
    {
      pk_General_log();
      v157 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v157, OS_LOG_TYPE_ERROR))
      {
        v158 = sqlite3_errmsg(*(sqlite3 **)(*(_QWORD *)(a1 + 32) + 8));
        v159 = sqlite3_sql(v9);
        *(_DWORD *)buf = 136447490;
        v234 = "-[NPKGizmoDatabase _savePassLocked:locallyAdded:wasUpdate:]_block_invoke";
        v235 = 2082;
        v236 = "/Library/Caches/com.apple.xbs/Sources/NanoPassbook_Frameworks/NanoPassKit/NPKGizmoDatabase.m";
        v237 = 2048;
        v238 = 2530;
        v239 = 1024;
        *(_DWORD *)v240 = v149;
        *(_WORD *)&v240[4] = 2080;
        *(_QWORD *)&v240[6] = v158;
        *(_WORD *)&v240[14] = 2080;
        *(_QWORD *)&v240[16] = v159;
        _os_log_impl(&dword_213518000, v157, OS_LOG_TYPE_ERROR, "Error: *** NPKAssertion failure in %{public}s, %{public}s:%ld (reason: Insert failed with result: %d, error: %s, stmt: %s)", buf, 0x3Au);
      }

    }
    _NPKAssertAbort();
  }
  sqlite3_clear_bindings(v9);
  sqlite3_reset(v9);
  v217 = objc_alloc_init(NPKGizmoDatabaseManifestEntry);
  objc_msgSend(*(id *)(a1 + 40), "uniqueID");
  v160 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKGizmoDatabaseManifestEntry setUniqueID:](v217, "setUniqueID:", v160);

  -[NPKGizmoDatabaseManifestEntry setLocalManifestHashes:](v217, "setLocalManifestHashes:", v94);
  -[NPKGizmoDatabaseManifestEntry setRemoteManifestHashes:](v217, "setRemoteManifestHashes:", v205);
  v161 = *(void **)(*(_QWORD *)(a1 + 32) + 344);
  objc_msgSend(*(id *)(a1 + 40), "uniqueID");
  v162 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v161, "setObject:forKeyedSubscript:", v217, v162);

  v221 = 0u;
  v222 = 0u;
  v219 = 0u;
  v220 = 0u;
  v163 = *(id *)(*(_QWORD *)(a1 + 32) + 352);
  v164 = objc_msgSend(v163, "countByEnumeratingWithState:objects:count:", &v219, v232, 16);
  if (v164)
  {
    v165 = *(_QWORD *)v220;
LABEL_138:
    v166 = 0;
    while (1)
    {
      if (*(_QWORD *)v220 != v165)
        objc_enumerationMutation(v163);
      v167 = *(void **)(*((_QWORD *)&v219 + 1) + 8 * v166);
      objc_msgSend(v167, "uniqueID");
      v168 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "uniqueID");
      v169 = (void *)objc_claimAutoreleasedReturnValue();
      v170 = objc_msgSend(v168, "isEqualToString:", v169);

      if ((v170 & 1) != 0)
        break;
      if (v164 == ++v166)
      {
        v164 = objc_msgSend(v163, "countByEnumeratingWithState:objects:count:", &v219, v232, 16);
        if (v164)
          goto LABEL_138;
        goto LABEL_144;
      }
    }
    v171 = v167;

    if (v171)
      goto LABEL_147;
  }
  else
  {
LABEL_144:

  }
  v171 = objc_alloc_init(NPKPassDescription);
  objc_msgSend(*(id *)(a1 + 40), "uniqueID");
  v172 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKPassDescription setUniqueID:](v171, "setUniqueID:", v172);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 352), "addObject:", v171);
LABEL_147:
  objc_msgSend(*(id *)(a1 + 40), "npkCompleteHash");
  v173 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKPassDescription setManifestHash:](v171, "setManifestHash:", v173);

  objc_msgSend(*(id *)(a1 + 40), "passTypeIdentifier");
  v174 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKPassDescription setPassTypeIdentifier:](v171, "setPassTypeIdentifier:", v174);

  -[NPKPassDescription setStyle:](v171, "setStyle:", objc_msgSend(*(id *)(a1 + 40), "style"));
  objc_msgSend(*(id *)(a1 + 40), "relevantDate");
  v175 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKPassDescription setRelevantDate:](v171, "setRelevantDate:", v175);

  objc_msgSend(*(id *)(a1 + 40), "logoText");
  v176 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKPassDescription setLogoText:](v171, "setLogoText:", v176);

  -[NPKPassDescription setLogoImageEncoded:](v171, "setLogoImageEncoded:", v214);
  objc_msgSend(*(id *)(a1 + 40), "displayProfile");
  v177 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v177, "backgroundColor");
  v178 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKPassDescription setBackgroundColor:](v171, "setBackgroundColor:", v178);

  objc_msgSend(*(id *)(a1 + 40), "displayProfile");
  v179 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v179, "labelColor");
  v180 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKPassDescription setLabelColor:](v171, "setLabelColor:", v180);

  objc_msgSend(*(id *)(a1 + 40), "displayProfile");
  v181 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v181, "foregroundColor");
  v182 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKPassDescription setForegroundColor:](v171, "setForegroundColor:", v182);

  -[NPKPassDescription setDeletePending:](v171, "setDeletePending:", *(unsigned __int8 *)(a1 + 136));
  -[NPKPassDescription setBackgroundImageEncoded:](v171, "setBackgroundImageEncoded:", v213);
  objc_msgSend(*(id *)(a1 + 40), "nfcPayload");
  v183 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKPassDescription setNfcPayload:](v171, "setNfcPayload:", v183);

  objc_msgSend(*(id *)(a1 + 40), "paymentPass");
  v184 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKPassDescription setPrivateLabel:](v171, "setPrivateLabel:", objc_msgSend(v184, "isPrivateLabel"));

  objc_msgSend(*(id *)(a1 + 40), "paymentPass");
  v185 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKPassDescription setCobranded:](v171, "setCobranded:", objc_msgSend(v185, "isCobranded"));

  objc_msgSend(v218, "devicePaymentApplications");
  v186 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKPassDescription setDevicePaymentApplications:](v171, "setDevicePaymentApplications:", v186);

  objc_msgSend(v218, "devicePrimaryPaymentApplication");
  v187 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKPassDescription setDevicePrimaryPaymentApplication:](v171, "setDevicePrimaryPaymentApplication:", v187);

  objc_msgSend(v218, "devicePrimaryContactlessPaymentApplication");
  v188 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKPassDescription setDevicePrimaryContactlessPaymentApplication:](v171, "setDevicePrimaryContactlessPaymentApplication:", v188);

  objc_msgSend(v218, "devicePrimaryInAppPaymentApplication");
  v189 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKPassDescription setDevicePrimaryInAppPaymentApplication:](v171, "setDevicePrimaryInAppPaymentApplication:", v189);

  -[NPKPassDescription setEffectivePaymentApplicationState:](v171, "setEffectivePaymentApplicationState:", objc_msgSend(v218, "effectiveContactlessPaymentApplicationState"));
  -[NPKPassDescription setHasUserSelectableContactlessPaymentApplications:](v171, "setHasUserSelectableContactlessPaymentApplications:", v207);
  -[NPKPassDescription setPreferredPaymentApplication:](v171, "setPreferredPaymentApplication:", v227[5]);
  objc_msgSend(*(id *)(a1 + 40), "ingestedDate");
  v190 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKPassDescription setIngestionDate:](v171, "setIngestionDate:", v190);

  objc_msgSend(*(id *)(a1 + 40), "npkCompleteHash");
  v191 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKPassDescription setCompleteHash:](v171, "setCompleteHash:", v191);

  -[NPKPassDescription setHasStoredValue:](v171, "setHasStoredValue:", objc_msgSend(*(id *)(a1 + 40), "hasStoredValue"));
  -[NPKPassDescription setSettings:](v171, "setSettings:", objc_msgSend(*(id *)(a1 + 40), "settings"));
  objc_msgSend(v218, "issuerCountryCode");
  v192 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKPassDescription setIssuerCountryCode:](v171, "setIssuerCountryCode:", v192);

  objc_msgSend(*(id *)(a1 + 40), "paymentPass");
  v193 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v193, "availableActions");
  v194 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKPassDescription setAvailableActions:](v171, "setAvailableActions:", v194);

  objc_msgSend(*(id *)(a1 + 40), "organizationName");
  v195 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKPassDescription setOrganizationName:](v171, "setOrganizationName:", v195);

  -[NPKPassDescription setTransitAppletState:](v171, "setTransitAppletState:", *(_QWORD *)(a1 + 72));
  -[NPKPassDescription setLastAddValueAmount:](v171, "setLastAddValueAmount:", *(_QWORD *)(a1 + 80));
  objc_msgSend(*(id *)(a1 + 40), "localizedDescription");
  v196 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKPassDescription setLocalizedDescription:](v171, "setLocalizedDescription:", v196);

  -[NPKPassDescription setPendingAddValueDate:](v171, "setPendingAddValueDate:", *(_QWORD *)(a1 + 88));
  -[NPKPassDescription setExpressPassTypesMask:](v171, "setExpressPassTypesMask:", *(_QWORD *)(a1 + 128));
  -[NPKPassDescription setHasAssociatedPeerPaymentAccount:](v171, "setHasAssociatedPeerPaymentAccount:", objc_msgSend(v218, "hasAssociatedPeerPaymentAccount"));
  objc_msgSend(v218, "devicePrimaryPaymentApplication");
  v197 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v197, "subcredentials");
  v198 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKPassDescription setSubcredentials:](v171, "setSubcredentials:", v198);

  v199 = *(_QWORD *)(a1 + 32);
  v200 = *(void **)(v199 + 360);
  *(_QWORD *)(v199 + 360) = 0;

  _Block_object_dispose(&v226, 8);
  return 1;
}

void __59__NPKGizmoDatabase__savePassLocked_locallyAdded_wasUpdate___block_invoke_338(uint64_t a1, void *a2, _BYTE *a3)
{
  void *v6;
  int v7;
  id v8;

  v8 = a2;
  objc_msgSend(v8, "applicationIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", *(_QWORD *)(a1 + 32));

  if (v7)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
    *a3 = 1;
  }

}

- (BOOL)_removePassWithUniqueIDLocked:(id)a3
{
  id v4;
  NSMutableArray *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  sqlite3_stmt *v13;
  id v14;
  NSObject *v15;
  _BOOL4 v16;
  NSObject *v17;
  const char *v18;
  const char *v19;
  void *v20;
  sqlite3_stmt *v21;
  id v22;
  NSObject *v23;
  _BOOL4 v24;
  NSObject *v25;
  const char *v26;
  const char *v27;
  NSArray *libraryHashes;
  void *v29;
  uint64_t v30;
  void *v31;
  char v32;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  uint64_t v38;
  void *v39;
  uint8_t buf[4];
  const char *v41;
  __int16 v42;
  const char *v43;
  __int16 v44;
  uint64_t v45;
  __int16 v46;
  const char *v47;
  __int16 v48;
  const char *v49;
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v5 = self->_passDescriptions;
  v6 = (id)-[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v34, v50, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v35;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v35 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v9, "uniqueID", (_QWORD)v34);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "isEqualToString:", v4);

        if (v11)
        {
          v6 = v9;
          goto LABEL_11;
        }
      }
      v6 = (id)-[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v34, v50, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  if ((objc_msgSend(v6, "deletePending") & 1) != 0)
  {
    v12 = 0;
  }
  else
  {
    -[NPKGizmoDatabase _passForUniqueIDLocked:includeImageSets:](self, "_passForUniqueIDLocked:includeImageSets:", v4, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v13 = -[NPKGizmoDatabase deleteStatement](self, "deleteStatement", (_QWORD)v34);
  v14 = objc_retainAutorelease(v4);
  sqlite3_bind_text(v13, 1, (const char *)objc_msgSend(v14, "UTF8String"), -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
  if ((sqlite3_step(v13) & 0xFFFFFFFE) != 0x64)
  {
    pk_General_log();
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = os_log_type_enabled(v15, OS_LOG_TYPE_ERROR);

    if (v16)
    {
      pk_General_log();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        v18 = sqlite3_sql(v13);
        v19 = sqlite3_errmsg(self->_database);
        *(_DWORD *)buf = 136447234;
        v41 = "-[NPKGizmoDatabase _removePassWithUniqueIDLocked:]";
        v42 = 2082;
        v43 = "/Library/Caches/com.apple.xbs/Sources/NanoPassbook_Frameworks/NanoPassKit/NPKGizmoDatabase.m";
        v44 = 2048;
        v45 = 2626;
        v46 = 2080;
        v47 = v18;
        v48 = 2080;
        v49 = v19;
        _os_log_impl(&dword_213518000, v17, OS_LOG_TYPE_ERROR, "Error: *** NPKAssertion failure in %{public}s, %{public}s:%ld (reason: Delete failed: %s; %s)",
          buf,
          0x34u);
      }

    }
    _NPKAssertAbort();
  }
  sqlite3_clear_bindings(v13);
  sqlite3_reset(v13);
  -[NPKGizmoDatabase _transactionSourceIdentifierForPassUniqueIdentifierLocked:](self, "_transactionSourceIdentifierForPassUniqueIdentifierLocked:", v14);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (v20)
  {
    v21 = -[NPKGizmoDatabase deleteTransactionsForTransactionSourceStatement](self, "deleteTransactionsForTransactionSourceStatement");
    v22 = objc_retainAutorelease(v20);
    sqlite3_bind_text(v21, 1, (const char *)objc_msgSend(v22, "UTF8String"), -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
    if ((sqlite3_step(v21) & 0xFFFFFFFE) != 0x64)
    {
      pk_General_log();
      v23 = objc_claimAutoreleasedReturnValue();
      v24 = os_log_type_enabled(v23, OS_LOG_TYPE_ERROR);

      if (v24)
      {
        pk_General_log();
        v25 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        {
          v26 = sqlite3_sql(v21);
          v27 = sqlite3_errmsg(self->_database);
          *(_DWORD *)buf = 136447234;
          v41 = "-[NPKGizmoDatabase _removePassWithUniqueIDLocked:]";
          v42 = 2082;
          v43 = "/Library/Caches/com.apple.xbs/Sources/NanoPassbook_Frameworks/NanoPassKit/NPKGizmoDatabase.m";
          v44 = 2048;
          v45 = 2640;
          v46 = 2080;
          v47 = v26;
          v48 = 2080;
          v49 = v27;
          _os_log_impl(&dword_213518000, v25, OS_LOG_TYPE_ERROR, "Error: *** NPKAssertion failure in %{public}s, %{public}s:%ld (reason: Delete failed: %s; %s)",
            buf,
            0x34u);
        }

      }
      _NPKAssertAbort();
    }
    sqlite3_clear_bindings(v21);
    sqlite3_reset(v21);
    -[NPKGizmoDatabase setCurrentEphemeralTransactionIdentifier:forTransactionSourceIdentifier:](self, "setCurrentEphemeralTransactionIdentifier:forTransactionSourceIdentifier:", 0, v22);
    -[NPKGizmoDatabase _removeTransactionSourceIdentifierForPassWithUniqueIDLocked:](self, "_removeTransactionSourceIdentifierForPassWithUniqueIDLocked:", v14);
  }
  -[NSMutableDictionary removeObjectForKey:](self->_manifest, "removeObjectForKey:", v14);
  libraryHashes = self->_libraryHashes;
  self->_libraryHashes = 0;

  -[NSMutableArray removeObject:](self->_passDescriptions, "removeObject:", v6);
  if (v12)
  {
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = NPKGizmoDatabasePassRemovedNotificationName;
    v38 = NPKGizmoDatabasePassKeyName;
    v39 = v12;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v39, &v38, 1);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "postNotificationName:object:userInfo:", v30, self, v31);

  }
  v32 = objc_msgSend(v6, "deletePending");

  return v32 ^ 1;
}

- (void)_saveTransactionLocked:(id)a3 forTransactionSourceIdentifier:(id)a4
{
  id v6;
  id v7;
  sqlite3_stmt *v8;
  id v9;
  const char *v10;
  id v11;
  void *v12;
  double v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  NSObject *v18;
  _BOOL4 v19;
  NSObject *v20;
  const char *v21;
  const char *v22;
  int v23;
  const char *v24;
  __int16 v25;
  const char *v26;
  __int16 v27;
  uint64_t v28;
  __int16 v29;
  const char *v30;
  __int16 v31;
  const char *v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = -[NPKGizmoDatabase insertTransactionStatement](self, "insertTransactionStatement");
  v9 = objc_retainAutorelease(v7);
  v10 = (const char *)objc_msgSend(v9, "UTF8String");

  sqlite3_bind_text(v8, 1, v10, -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
  sqlite3_bind_text(v8, 2, "", -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
  objc_msgSend(v6, "identifier");
  v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  sqlite3_bind_text(v8, 3, (const char *)objc_msgSend(v11, "UTF8String"), -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);

  objc_msgSend(v6, "transactionDate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "timeIntervalSinceReferenceDate");
  sqlite3_bind_int(v8, 4, (int)v13);

  sqlite3_bind_int(v8, 5, objc_msgSend(v6, "transactionSource"));
  sqlite3_bind_int(v8, 6, objc_msgSend(v6, "transactionType"));
  sqlite3_bind_int(v8, 7, objc_msgSend(v6, "hasNotificationServiceData"));
  NPKSecureArchiveObject(v6);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v14)
  {
    v16 = objc_retainAutorelease(v14);
    sqlite3_bind_blob(v8, 8, (const void *)objc_msgSend(v16, "bytes"), objc_msgSend(v16, "length"), (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
  }
  else
  {
    sqlite3_bind_null(v8, 8);
  }
  objc_msgSend(v6, "serviceIdentifier");
  v17 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  sqlite3_bind_text(v8, 10, (const char *)objc_msgSend(v17, "UTF8String"), -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);

  if ((sqlite3_step(v8) & 0xFFFFFFFE) != 0x64)
  {
    pk_General_log();
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = os_log_type_enabled(v18, OS_LOG_TYPE_ERROR);

    if (v19)
    {
      pk_General_log();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        v21 = sqlite3_sql(v8);
        v22 = sqlite3_errmsg(self->_database);
        v23 = 136447234;
        v24 = "-[NPKGizmoDatabase _saveTransactionLocked:forTransactionSourceIdentifier:]";
        v25 = 2082;
        v26 = "/Library/Caches/com.apple.xbs/Sources/NanoPassbook_Frameworks/NanoPassKit/NPKGizmoDatabase.m";
        v27 = 2048;
        v28 = 2693;
        v29 = 2080;
        v30 = v21;
        v31 = 2080;
        v32 = v22;
        _os_log_impl(&dword_213518000, v20, OS_LOG_TYPE_ERROR, "Error: *** NPKAssertion failure in %{public}s, %{public}s:%ld (reason: Insert transaction failed: %s; %s)",
          (uint8_t *)&v23,
          0x34u);
      }

    }
    _NPKAssertAbort();
  }
  sqlite3_clear_bindings(v8);
  sqlite3_reset(v8);

}

- (void)_removeTransactionWithServiceIdentifierLocked:(id)a3 forTransactionSourceIdentifier:(id)a4
{
  id v6;
  id v7;
  sqlite3_stmt *v8;
  id v9;
  const char *v10;
  id v11;
  const char *v12;
  NSObject *v13;
  _BOOL4 v14;
  NSObject *v15;
  const char *v16;
  const char *v17;
  int v18;
  const char *v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  uint64_t v23;
  __int16 v24;
  const char *v25;
  __int16 v26;
  const char *v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v7 = a3;
  v8 = -[NPKGizmoDatabase removeTransactionWithServiceIdentifierStatement](self, "removeTransactionWithServiceIdentifierStatement");
  v9 = objc_retainAutorelease(v6);
  v10 = (const char *)objc_msgSend(v9, "UTF8String");

  sqlite3_bind_text(v8, 1, v10, -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
  v11 = objc_retainAutorelease(v7);
  v12 = (const char *)objc_msgSend(v11, "UTF8String");

  sqlite3_bind_text(v8, 2, v12, -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
  if ((sqlite3_step(v8) & 0xFFFFFFFE) != 0x64)
  {
    pk_General_log();
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = os_log_type_enabled(v13, OS_LOG_TYPE_ERROR);

    if (v14)
    {
      pk_General_log();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        v16 = sqlite3_sql(v8);
        v17 = sqlite3_errmsg(self->_database);
        v18 = 136447234;
        v19 = "-[NPKGizmoDatabase _removeTransactionWithServiceIdentifierLocked:forTransactionSourceIdentifier:]";
        v20 = 2082;
        v21 = "/Library/Caches/com.apple.xbs/Sources/NanoPassbook_Frameworks/NanoPassKit/NPKGizmoDatabase.m";
        v22 = 2048;
        v23 = 2708;
        v24 = 2080;
        v25 = v16;
        v26 = 2080;
        v27 = v17;
        _os_log_impl(&dword_213518000, v15, OS_LOG_TYPE_ERROR, "Error: *** NPKAssertion failure in %{public}s, %{public}s:%ld (reason: Delete transaction failed: %s; %s)",
          (uint8_t *)&v18,
          0x34u);
      }

    }
    _NPKAssertAbort();
  }
  sqlite3_clear_bindings(v8);
  sqlite3_reset(v8);
}

- (void)_removeTransactionWithIdentifier:(id)a3
{
  id v4;
  sqlite3_stmt *v5;
  id v6;
  const char *v7;
  NSObject *v8;
  _BOOL4 v9;
  NSObject *v10;
  const char *v11;
  const char *v12;
  int v13;
  const char *v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  const char *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = -[NPKGizmoDatabase removeTransactionStatement](self, "removeTransactionStatement");
  v6 = objc_retainAutorelease(v4);
  v7 = (const char *)objc_msgSend(v6, "UTF8String");

  sqlite3_bind_text(v5, 1, v7, -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
  if ((sqlite3_step(v5) & 0xFFFFFFFE) != 0x64)
  {
    pk_General_log();
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = os_log_type_enabled(v8, OS_LOG_TYPE_ERROR);

    if (v9)
    {
      pk_General_log();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        v11 = sqlite3_sql(v5);
        v12 = sqlite3_errmsg(self->_database);
        v13 = 136447234;
        v14 = "-[NPKGizmoDatabase _removeTransactionWithIdentifier:]";
        v15 = 2082;
        v16 = "/Library/Caches/com.apple.xbs/Sources/NanoPassbook_Frameworks/NanoPassKit/NPKGizmoDatabase.m";
        v17 = 2048;
        v18 = 2723;
        v19 = 2080;
        v20 = v11;
        v21 = 2080;
        v22 = v12;
        _os_log_impl(&dword_213518000, v10, OS_LOG_TYPE_ERROR, "Error: *** NPKAssertion failure in %{public}s, %{public}s:%ld (reason: Delete transaction failed: %s; %s)",
          (uint8_t *)&v13,
          0x34u);
      }

    }
    _NPKAssertAbort();
  }
  sqlite3_clear_bindings(v5);
  sqlite3_reset(v5);
}

- (void)_removeTransactionsForTransactionSource:(id)a3
{
  id v4;
  sqlite3_stmt *v5;
  id v6;
  const char *v7;
  NSObject *v8;
  _BOOL4 v9;
  NSObject *v10;
  const char *v11;
  const char *v12;
  int v13;
  const char *v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  const char *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = -[NPKGizmoDatabase deleteTransactionsForTransactionSourceStatement](self, "deleteTransactionsForTransactionSourceStatement");
  v6 = objc_retainAutorelease(v4);
  v7 = (const char *)objc_msgSend(v6, "UTF8String");

  sqlite3_bind_text(v5, 1, v7, -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
  if ((sqlite3_step(v5) & 0xFFFFFFFE) != 0x64)
  {
    pk_General_log();
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = os_log_type_enabled(v8, OS_LOG_TYPE_ERROR);

    if (v9)
    {
      pk_General_log();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        v11 = sqlite3_sql(v5);
        v12 = sqlite3_errmsg(self->_database);
        v13 = 136447234;
        v14 = "-[NPKGizmoDatabase _removeTransactionsForTransactionSource:]";
        v15 = 2082;
        v16 = "/Library/Caches/com.apple.xbs/Sources/NanoPassbook_Frameworks/NanoPassKit/NPKGizmoDatabase.m";
        v17 = 2048;
        v18 = 2737;
        v19 = 2080;
        v20 = v11;
        v21 = 2080;
        v22 = v12;
        _os_log_impl(&dword_213518000, v10, OS_LOG_TYPE_ERROR, "Error: *** NPKAssertion failure in %{public}s, %{public}s:%ld (reason: Delete failed: %s; %s)",
          (uint8_t *)&v13,
          0x34u);
      }

    }
    _NPKAssertAbort();
  }
  sqlite3_clear_bindings(v5);
  sqlite3_reset(v5);
}

- (void)_trimTransactionsForTransactionSourceIdentifierLocked:(id)a3 withPaymentCredentialType:(int64_t)a4
{
  id v5;
  int v6;
  sqlite3_stmt *v7;
  id v8;
  id v9;
  const char *v10;
  NSObject *v11;
  _BOOL4 v12;
  NSObject *v13;
  const char *v14;
  const char *v15;
  int v16;
  const char *v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  const char *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = PKMaxPaymentTransactionsForCredentialType();
  v7 = -[NPKGizmoDatabase trimTransactionsForTransactionSourceStatement](self, "trimTransactionsForTransactionSourceStatement");
  v8 = objc_retainAutorelease(v5);
  sqlite3_bind_text(v7, 1, (const char *)objc_msgSend(v8, "UTF8String"), -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
  v9 = objc_retainAutorelease(v8);
  v10 = (const char *)objc_msgSend(v9, "UTF8String");

  sqlite3_bind_text(v7, 2, v10, -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
  sqlite3_bind_int(v7, 3, v6);
  if ((sqlite3_step(v7) & 0xFFFFFFFE) != 0x64)
  {
    pk_General_log();
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = os_log_type_enabled(v11, OS_LOG_TYPE_ERROR);

    if (v12)
    {
      pk_General_log();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        v14 = sqlite3_sql(v7);
        v15 = sqlite3_errmsg(self->_database);
        v16 = 136447234;
        v17 = "-[NPKGizmoDatabase _trimTransactionsForTransactionSourceIdentifierLocked:withPaymentCredentialType:]";
        v18 = 2082;
        v19 = "/Library/Caches/com.apple.xbs/Sources/NanoPassbook_Frameworks/NanoPassKit/NPKGizmoDatabase.m";
        v20 = 2048;
        v21 = 2755;
        v22 = 2080;
        v23 = v14;
        v24 = 2080;
        v25 = v15;
        _os_log_impl(&dword_213518000, v13, OS_LOG_TYPE_ERROR, "Error: *** NPKAssertion failure in %{public}s, %{public}s:%ld (reason: Trim transactions failed: %s; %s)",
          (uint8_t *)&v16,
          0x34u);
      }

    }
    _NPKAssertAbort();
  }
  sqlite3_clear_bindings(v7);
  sqlite3_reset(v7);
}

- (id)_transactionsForTransactionSourceIdentifierLocked:(id)a3 withTransactionSource:(unint64_t)a4 withBackingData:(unint64_t)a5 startDate:(id)a6 endDate:(id)a7 orderByDate:(int64_t)a8 limit:(unint64_t)a9
{
  id v15;
  id v16;
  id v17;
  void *v18;
  sqlite3_stmt *v19;
  id v20;
  double v21;
  double v22;
  const void *v23;
  int v24;
  void *v25;
  void *v26;
  NSObject *v27;
  void *v28;

  v15 = a3;
  v16 = a6;
  v17 = a7;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = -[NPKGizmoDatabase selectTransactionsStatementWithTransactionSource:orderByDate:limit:](self, "selectTransactionsStatementWithTransactionSource:orderByDate:limit:", a4, a8, a9);
  v20 = objc_retainAutorelease(v15);
  sqlite3_bind_text(v19, 1, (const char *)objc_msgSend(v20, "UTF8String"), -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
  sqlite3_bind_int(v19, 2, a5 == 0);
  sqlite3_bind_int(v19, 3, a5 == 1);
  sqlite3_bind_int(v19, 4, a5 != 1);
  sqlite3_bind_int(v19, 5, 2);
  sqlite3_bind_int(v19, 6, a5 != 2);
  sqlite3_bind_int(v19, 7, 2);
  if (v16)
  {
    if (v17)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "distantPast");
    v16 = (id)objc_claimAutoreleasedReturnValue();
    if (v17)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x24BDBCE60], "distantFuture");
  v17 = (id)objc_claimAutoreleasedReturnValue();
LABEL_3:
  objc_msgSend(v16, "timeIntervalSinceReferenceDate");
  sqlite3_bind_int(v19, 8, (int)v21);
  objc_msgSend(v17, "timeIntervalSinceReferenceDate");
  sqlite3_bind_int(v19, 9, (int)v22);
  if (a9)
    sqlite3_bind_int(v19, 10, a9);
  while (sqlite3_step(v19) == 100)
  {
    v23 = sqlite3_column_blob(v19, 0);
    v24 = sqlite3_column_bytes(v19, 0);
    v25 = (void *)MEMORY[0x2199B65AC]();
    objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", v23, v24);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_opt_class();
    NPKSecureUnarchiveObject(v26, v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    if (v28)
      objc_msgSend(v18, "addObject:", v28);

    objc_autoreleasePoolPop(v25);
  }
  sqlite3_clear_bindings(v19);
  sqlite3_reset(v19);

  return v18;
}

- (id)_transactionWithIdentifierLocked:(id)a3
{
  id v4;
  sqlite3_stmt *v5;
  id v6;
  const void *v7;
  int v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;

  v4 = a3;
  v5 = -[NPKGizmoDatabase selectTransactionWithIdentifierStatement](self, "selectTransactionWithIdentifierStatement");
  v6 = objc_retainAutorelease(v4);
  sqlite3_bind_text(v5, 1, (const char *)objc_msgSend(v6, "UTF8String"), -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
  if (sqlite3_step(v5) == 100)
  {
    v7 = sqlite3_column_blob(v5, 0);
    v8 = sqlite3_column_bytes(v5, 0);
    v9 = (void *)MEMORY[0x2199B65AC]();
    objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", v7, v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_opt_class();
    NPKSecureUnarchiveObject(v10, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_autoreleasePoolPop(v9);
  }
  else
  {
    v12 = 0;
  }
  sqlite3_clear_bindings(v5);
  sqlite3_reset(v5);

  return v12;
}

- (id)_transactionWithServiceIdentifierLocked:(id)a3
{
  id v4;
  sqlite3_stmt *v5;
  id v6;
  const void *v7;
  int v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;

  v4 = a3;
  v5 = -[NPKGizmoDatabase selectTransactionWithServiceIdentifierStatement](self, "selectTransactionWithServiceIdentifierStatement");
  v6 = objc_retainAutorelease(v4);
  sqlite3_bind_text(v5, 1, (const char *)objc_msgSend(v6, "UTF8String"), -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
  if (sqlite3_step(v5) == 100)
  {
    v7 = sqlite3_column_blob(v5, 0);
    v8 = sqlite3_column_bytes(v5, 0);
    v9 = (void *)MEMORY[0x2199B65AC]();
    objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", v7, v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_opt_class();
    NPKSecureUnarchiveObject(v10, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_autoreleasePoolPop(v9);
  }
  else
  {
    v12 = 0;
  }
  sqlite3_clear_bindings(v5);
  sqlite3_reset(v5);

  return v12;
}

- (id)_transactionSourceIdentifierForTransactionWithIdentifierLocked:(id)a3
{
  id v4;
  sqlite3_stmt *v5;
  id v6;
  const char *v7;
  void *v8;

  v4 = a3;
  v5 = -[NPKGizmoDatabase selectTransactionSourceIdentifierForTransactionWithIdentifierStatement](self, "selectTransactionSourceIdentifierForTransactionWithIdentifierStatement");
  v6 = objc_retainAutorelease(v4);
  v7 = (const char *)objc_msgSend(v6, "UTF8String");

  sqlite3_bind_text(v5, 1, v7, -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
  if (sqlite3_step(v5) == 100)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", sqlite3_column_text(v5, 0));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }
  sqlite3_clear_bindings(v5);
  sqlite3_reset(v5);
  return v8;
}

- (void)_createTransactionSourceIdentifierIfNecessaryForPassWithUniqueIDLocked:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  sqlite3_stmt *v8;
  id v9;
  NSObject *v10;
  _BOOL4 v11;
  NSObject *v12;
  const char *v13;
  const char *v14;
  int v15;
  const char *v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  const char *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[NPKGizmoDatabase _transactionSourceIdentifierForPassUniqueIdentifierLocked:](self, "_transactionSourceIdentifierForPassUniqueIdentifierLocked:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "UUIDString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = -[NPKGizmoDatabase insertTransactionSourceIdentifierForPassStatement](self, "insertTransactionSourceIdentifierForPassStatement");
    v9 = objc_retainAutorelease(v7);
    sqlite3_bind_text(v8, 1, (const char *)objc_msgSend(v9, "UTF8String"), -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
    sqlite3_bind_int(v8, 2, 0);
    sqlite3_bind_text(v8, 3, (const char *)objc_msgSend(objc_retainAutorelease(v4), "UTF8String"), -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
    if ((sqlite3_step(v8) & 0xFFFFFFFE) != 0x64)
    {
      pk_General_log();
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = os_log_type_enabled(v10, OS_LOG_TYPE_ERROR);

      if (v11)
      {
        pk_General_log();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          v13 = sqlite3_sql(v8);
          v14 = sqlite3_errmsg(self->_database);
          v15 = 136447234;
          v16 = "-[NPKGizmoDatabase _createTransactionSourceIdentifierIfNecessaryForPassWithUniqueIDLocked:]";
          v17 = 2082;
          v18 = "/Library/Caches/com.apple.xbs/Sources/NanoPassbook_Frameworks/NanoPassKit/NPKGizmoDatabase.m";
          v19 = 2048;
          v20 = 2869;
          v21 = 2080;
          v22 = v13;
          v23 = 2080;
          v24 = v14;
          _os_log_impl(&dword_213518000, v12, OS_LOG_TYPE_ERROR, "Error: *** NPKAssertion failure in %{public}s, %{public}s:%ld (reason: Insert transaction source identifier failed: %s; %s)",
            (uint8_t *)&v15,
            0x34u);
        }

      }
      _NPKAssertAbort();
    }
    sqlite3_clear_bindings(v8);
    sqlite3_reset(v8);

  }
}

- (void)_removeTransactionSourceIdentifierForPassWithUniqueIDLocked:(id)a3
{
  id v4;
  sqlite3_stmt *v5;
  id v6;
  const char *v7;
  NSObject *v8;
  _BOOL4 v9;
  NSObject *v10;
  const char *v11;
  const char *v12;
  int v13;
  const char *v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  const char *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = -[NPKGizmoDatabase deleteTransactionSourceIdentifierForPassStatement](self, "deleteTransactionSourceIdentifierForPassStatement");
  v6 = objc_retainAutorelease(v4);
  v7 = (const char *)objc_msgSend(v6, "UTF8String");

  sqlite3_bind_text(v5, 1, v7, -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
  if ((sqlite3_step(v5) & 0xFFFFFFFE) != 0x64)
  {
    pk_General_log();
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = os_log_type_enabled(v8, OS_LOG_TYPE_ERROR);

    if (v9)
    {
      pk_General_log();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        v11 = sqlite3_sql(v5);
        v12 = sqlite3_errmsg(self->_database);
        v13 = 136447234;
        v14 = "-[NPKGizmoDatabase _removeTransactionSourceIdentifierForPassWithUniqueIDLocked:]";
        v15 = 2082;
        v16 = "/Library/Caches/com.apple.xbs/Sources/NanoPassbook_Frameworks/NanoPassKit/NPKGizmoDatabase.m";
        v17 = 2048;
        v18 = 2884;
        v19 = 2080;
        v20 = v11;
        v21 = 2080;
        v22 = v12;
        _os_log_impl(&dword_213518000, v10, OS_LOG_TYPE_ERROR, "Error: *** NPKAssertion failure in %{public}s, %{public}s:%ld (reason: Delete transaction source identifier failed: %s; %s)",
          (uint8_t *)&v13,
          0x34u);
      }

    }
    _NPKAssertAbort();
  }
  sqlite3_clear_bindings(v5);
  sqlite3_reset(v5);
}

- (id)_transactionSourceIdentifierForTransactionWithServiceIdentifierLocked:(id)a3
{
  id v4;
  sqlite3_stmt *v5;
  id v6;
  const char *v7;
  void *v8;

  v4 = a3;
  v5 = -[NPKGizmoDatabase selectTransactionSourceIdentifierForTransactionWithServiceIdentifierStatement](self, "selectTransactionSourceIdentifierForTransactionWithServiceIdentifierStatement");
  v6 = objc_retainAutorelease(v4);
  v7 = (const char *)objc_msgSend(v6, "UTF8String");

  sqlite3_bind_text(v5, 1, v7, -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
  if (sqlite3_step(v5) == 100)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", sqlite3_column_text(v5, 0));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }
  sqlite3_clear_bindings(v5);
  sqlite3_reset(v5);
  return v8;
}

- (id)_transactionSourceIdentifierForPassUniqueIdentifierLocked:(id)a3
{
  id v4;
  sqlite3_stmt *v5;
  id v6;
  const char *v7;
  void *v8;

  v4 = a3;
  v5 = -[NPKGizmoDatabase selectTransactionSourceIdentifierForPassUniqueIdentifierStatement](self, "selectTransactionSourceIdentifierForPassUniqueIdentifierStatement");
  v6 = objc_retainAutorelease(v4);
  v7 = (const char *)objc_msgSend(v6, "UTF8String");

  sqlite3_bind_text(v5, 1, v7, -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
  if (sqlite3_step(v5) == 100)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", sqlite3_column_text(v5, 0));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }
  sqlite3_clear_bindings(v5);
  sqlite3_reset(v5);
  return v8;
}

- (id)_passUniqueIdentifierForTransactionSourceIdentifierLocked:(id)a3
{
  id v4;
  sqlite3_stmt *v5;
  id v6;
  const char *v7;
  void *v8;

  v4 = a3;
  v5 = -[NPKGizmoDatabase selectPassUniqueIdentifierForTransactionSourceIdentifierStatement](self, "selectPassUniqueIdentifierForTransactionSourceIdentifierStatement");
  v6 = objc_retainAutorelease(v4);
  v7 = (const char *)objc_msgSend(v6, "UTF8String");

  sqlite3_bind_text(v5, 1, v7, -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
  if (sqlite3_step(v5) == 100)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", sqlite3_column_text(v5, 0));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }
  sqlite3_clear_bindings(v5);
  sqlite3_reset(v5);
  return v8;
}

- (id)_transitAppletStateForPassWithUniqueIDLocked:(id)a3
{
  id v4;
  sqlite3_stmt *v5;
  id v6;
  const void *v7;
  int v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;

  v4 = a3;
  v5 = -[NPKGizmoDatabase selectTransitAppletStateForPassStatement](self, "selectTransitAppletStateForPassStatement");
  v6 = objc_retainAutorelease(v4);
  sqlite3_bind_text(v5, 1, (const char *)objc_msgSend(v6, "UTF8String"), -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
  if (sqlite3_step(v5) == 100)
  {
    v7 = sqlite3_column_blob(v5, 0);
    v8 = sqlite3_column_bytes(v5, 0);
    v9 = (void *)MEMORY[0x2199B65AC]();
    objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", v7, v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "length"))
    {
      v11 = objc_opt_class();
      NPKSecureUnarchiveObject(v10, v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v12 = 0;
    }

    objc_autoreleasePoolPop(v9);
  }
  else
  {
    v12 = 0;
  }
  sqlite3_clear_bindings(v5);
  sqlite3_reset(v5);

  return v12;
}

- (void)_setTransitAppletStateLocked:(id)a3 forPassWithUniqueID:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  _BOOL4 v9;
  NSObject *v10;
  NSObject *dbQueue;
  id v12;
  id v13;
  _QWORD block[5];
  id v15;
  id v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  const char *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (!v7)
  {
    pk_General_log();
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = os_log_type_enabled(v8, OS_LOG_TYPE_ERROR);

    if (v9)
    {
      pk_General_log();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446978;
        v18 = "-[NPKGizmoDatabase _setTransitAppletStateLocked:forPassWithUniqueID:]";
        v19 = 2082;
        v20 = "/Library/Caches/com.apple.xbs/Sources/NanoPassbook_Frameworks/NanoPassKit/NPKGizmoDatabase.m";
        v21 = 2048;
        v22 = 2956;
        v23 = 2080;
        v24 = "-[NPKGizmoDatabase _setTransitAppletStateLocked:forPassWithUniqueID:]";
        _os_log_impl(&dword_213518000, v10, OS_LOG_TYPE_ERROR, "Error: *** NPKAssertion failure in %{public}s, %{public}s:%ld (reason: %s cannot take nil unique ID)", buf, 0x2Au);
      }

    }
    _NPKAssertAbort();
  }
  dbQueue = self->_dbQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __69__NPKGizmoDatabase__setTransitAppletStateLocked_forPassWithUniqueID___block_invoke;
  block[3] = &unk_24CFE8288;
  block[4] = self;
  v15 = v6;
  v16 = v7;
  v12 = v7;
  v13 = v6;
  dispatch_async(dbQueue, block);

}

void __69__NPKGizmoDatabase__setTransitAppletStateLocked_forPassWithUniqueID___block_invoke(id *a1)
{
  NSObject *v2;
  _BOOL4 v3;
  NSObject *v4;
  sqlite3_stmt *v5;
  id v6;
  id v7;
  NSObject *v8;
  _BOOL4 v9;
  NSObject *v10;
  const char *v11;
  const char *v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  id v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  const char *v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1[4], "_loadInitialManifestLocked");
  if (!objc_msgSend(a1[4], "database"))
  {
    pk_General_log();
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = os_log_type_enabled(v2, OS_LOG_TYPE_ERROR);

    if (v3)
    {
      pk_General_log();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446722;
        v18 = "-[NPKGizmoDatabase _setTransitAppletStateLocked:forPassWithUniqueID:]_block_invoke";
        v19 = 2082;
        v20 = "/Library/Caches/com.apple.xbs/Sources/NanoPassbook_Frameworks/NanoPassKit/NPKGizmoDatabase.m";
        v21 = 2048;
        v22 = 2959;
        _os_log_impl(&dword_213518000, v4, OS_LOG_TYPE_ERROR, "Error: *** NPKAssertion failure in %{public}s, %{public}s:%ld (reason: Nil database handle; did you check pass"
          "DBIsAvailable before calling?)",
          buf,
          0x20u);
      }

    }
    _NPKAssertAbort();
  }
  v5 = (sqlite3_stmt *)objc_msgSend(a1[4], "updateTransitAppletStateForPassStatement");
  v6 = a1[5];
  if (v6)
  {
    NPKSecureArchiveObject(v6);
    v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    sqlite3_bind_blob(v5, 1, (const void *)objc_msgSend(v7, "bytes"), objc_msgSend(v7, "length"), (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);

  }
  else
  {
    sqlite3_bind_null(v5, 1);
  }
  sqlite3_bind_text(v5, 2, (const char *)objc_msgSend(objc_retainAutorelease(a1[6]), "UTF8String"), -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
  if (sqlite3_step(v5) != 101)
  {
    pk_General_log();
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = os_log_type_enabled(v8, OS_LOG_TYPE_ERROR);

    if (v9)
    {
      pk_General_log();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        v11 = sqlite3_sql(v5);
        v12 = sqlite3_errmsg(*((sqlite3 **)a1[4] + 1));
        *(_DWORD *)buf = 136447234;
        v18 = "-[NPKGizmoDatabase _setTransitAppletStateLocked:forPassWithUniqueID:]_block_invoke";
        v19 = 2082;
        v20 = "/Library/Caches/com.apple.xbs/Sources/NanoPassbook_Frameworks/NanoPassKit/NPKGizmoDatabase.m";
        v21 = 2048;
        v22 = 2974;
        v23 = 2080;
        v24 = v11;
        v25 = 2080;
        v26 = v12;
        _os_log_impl(&dword_213518000, v10, OS_LOG_TYPE_ERROR, "Error: *** NPKAssertion failure in %{public}s, %{public}s:%ld (reason: Updating transit applet state failed: %s; %s)",
          buf,
          0x34u);
      }

    }
    _NPKAssertAbort();
  }
  sqlite3_clear_bindings(v5);
  sqlite3_reset(v5);
  v13 = (void *)*((_QWORD *)a1[4] + 44);
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __69__NPKGizmoDatabase__setTransitAppletStateLocked_forPassWithUniqueID___block_invoke_341;
  v14[3] = &unk_24CFEB2B0;
  v15 = a1[6];
  v16 = a1[5];
  objc_msgSend(v13, "enumerateObjectsUsingBlock:", v14);

}

void __69__NPKGizmoDatabase__setTransitAppletStateLocked_forPassWithUniqueID___block_invoke_341(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  void *v7;
  int v8;
  NSObject *v9;
  _BOOL4 v10;
  NSObject *v11;
  uint64_t v12;
  int v13;
  id v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v6 = a2;
  objc_msgSend(v6, "uniqueID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqualToString:", *(_QWORD *)(a1 + 32));

  if (v8)
  {
    pk_General_log();
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);

    if (v10)
    {
      pk_General_log();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        v12 = *(_QWORD *)(a1 + 40);
        v13 = 138412546;
        v14 = v6;
        v15 = 2112;
        v16 = v12;
        _os_log_impl(&dword_213518000, v11, OS_LOG_TYPE_DEFAULT, "Notice: Updating description %@ with new transit applet state %@", (uint8_t *)&v13, 0x16u);
      }

    }
    objc_msgSend(v6, "setTransitAppletState:", *(_QWORD *)(a1 + 40));
    *a4 = 1;
  }

}

- (void)_setCurrentEphemeralTransactionIdentifier:(id)a3 forTransactionSourceIdentifier:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  _BOOL4 v9;
  NSObject *v10;
  NSObject *v11;
  _BOOL4 v12;
  NSObject *v13;
  sqlite3_stmt *v14;
  const char *v15;
  sqlite3_stmt *v16;
  int v17;
  NSObject *v18;
  _BOOL4 v19;
  NSObject *v20;
  const char *v21;
  const char *v22;
  int v23;
  const char *v24;
  __int16 v25;
  const char *v26;
  __int16 v27;
  uint64_t v28;
  __int16 v29;
  const char *v30;
  __int16 v31;
  const char *v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (!v7)
  {
    pk_General_log();
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = os_log_type_enabled(v8, OS_LOG_TYPE_ERROR);

    if (v9)
    {
      pk_General_log();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        v23 = 136446978;
        v24 = "-[NPKGizmoDatabase _setCurrentEphemeralTransactionIdentifier:forTransactionSourceIdentifier:]";
        v25 = 2082;
        v26 = "/Library/Caches/com.apple.xbs/Sources/NanoPassbook_Frameworks/NanoPassKit/NPKGizmoDatabase.m";
        v27 = 2048;
        v28 = 2990;
        v29 = 2080;
        v30 = "-[NPKGizmoDatabase _setCurrentEphemeralTransactionIdentifier:forTransactionSourceIdentifier:]";
        _os_log_impl(&dword_213518000, v10, OS_LOG_TYPE_ERROR, "Error: *** NPKAssertion failure in %{public}s, %{public}s:%ld (reason: %s cannot take nil transaction source identifier)", (uint8_t *)&v23, 0x2Au);
      }

    }
    _NPKAssertAbort();
  }
  if (!-[NPKGizmoDatabase database](self, "database"))
  {
    pk_General_log();
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = os_log_type_enabled(v11, OS_LOG_TYPE_ERROR);

    if (v12)
    {
      pk_General_log();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        v23 = 136446722;
        v24 = "-[NPKGizmoDatabase _setCurrentEphemeralTransactionIdentifier:forTransactionSourceIdentifier:]";
        v25 = 2082;
        v26 = "/Library/Caches/com.apple.xbs/Sources/NanoPassbook_Frameworks/NanoPassKit/NPKGizmoDatabase.m";
        v27 = 2048;
        v28 = 2991;
        _os_log_impl(&dword_213518000, v13, OS_LOG_TYPE_ERROR, "Error: *** NPKAssertion failure in %{public}s, %{public}s:%ld (reason: Nil database handle; did you check pass"
          "DBIsAvailable before calling?)",
          (uint8_t *)&v23,
          0x20u);
      }

    }
    _NPKAssertAbort();
  }
  if (v6)
  {
    v14 = -[NPKGizmoDatabase insertEphemeralTransactionStatement](self, "insertEphemeralTransactionStatement");
    sqlite3_bind_text(v14, 1, (const char *)objc_msgSend(objc_retainAutorelease(v7), "UTF8String"), -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
    v15 = (const char *)objc_msgSend(objc_retainAutorelease(v6), "UTF8String");
    v16 = v14;
    v17 = 2;
  }
  else
  {
    v14 = -[NPKGizmoDatabase deleteEphemeralTransactionByTransactionSourceIdentifierStatement](self, "deleteEphemeralTransactionByTransactionSourceIdentifierStatement");
    v15 = (const char *)objc_msgSend(objc_retainAutorelease(v7), "UTF8String");
    v16 = v14;
    v17 = 1;
  }
  sqlite3_bind_text(v16, v17, v15, -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
  if ((sqlite3_step(v14) & 0xFFFFFFFE) != 0x64)
  {
    pk_General_log();
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = os_log_type_enabled(v18, OS_LOG_TYPE_ERROR);

    if (v19)
    {
      pk_General_log();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        v21 = sqlite3_sql(v14);
        v22 = sqlite3_errmsg(self->_database);
        v23 = 136447234;
        v24 = "-[NPKGizmoDatabase _setCurrentEphemeralTransactionIdentifier:forTransactionSourceIdentifier:]";
        v25 = 2082;
        v26 = "/Library/Caches/com.apple.xbs/Sources/NanoPassbook_Frameworks/NanoPassKit/NPKGizmoDatabase.m";
        v27 = 2048;
        v28 = 3010;
        v29 = 2080;
        v30 = v21;
        v31 = 2080;
        v32 = v22;
        _os_log_impl(&dword_213518000, v20, OS_LOG_TYPE_ERROR, "Error: *** NPKAssertion failure in %{public}s, %{public}s:%ld (reason: Delete ephemeral transaction failed: %s; %s)",
          (uint8_t *)&v23,
          0x34u);
      }

    }
    _NPKAssertAbort();
  }
  sqlite3_clear_bindings(v14);
  sqlite3_reset(v14);

}

- (id)_currentEphemeralTransactionIdentifierForTransactionSourceIdentifier:(id)a3
{
  id v4;
  NSObject *v5;
  _BOOL4 v6;
  NSObject *v7;
  NSObject *v8;
  _BOOL4 v9;
  NSObject *v10;
  sqlite3_stmt *v11;
  id v12;
  void *v13;
  int v15;
  const char *v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  const char *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (!v4)
  {
    pk_General_log();
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = os_log_type_enabled(v5, OS_LOG_TYPE_ERROR);

    if (v6)
    {
      pk_General_log();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        v15 = 136446978;
        v16 = "-[NPKGizmoDatabase _currentEphemeralTransactionIdentifierForTransactionSourceIdentifier:]";
        v17 = 2082;
        v18 = "/Library/Caches/com.apple.xbs/Sources/NanoPassbook_Frameworks/NanoPassKit/NPKGizmoDatabase.m";
        v19 = 2048;
        v20 = 3017;
        v21 = 2080;
        v22 = "-[NPKGizmoDatabase _currentEphemeralTransactionIdentifierForTransactionSourceIdentifier:]";
        _os_log_impl(&dword_213518000, v7, OS_LOG_TYPE_ERROR, "Error: *** NPKAssertion failure in %{public}s, %{public}s:%ld (reason: %s cannot take nil transaction source identifier)", (uint8_t *)&v15, 0x2Au);
      }

    }
    _NPKAssertAbort();
  }
  if (!-[NPKGizmoDatabase database](self, "database"))
  {
    pk_General_log();
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = os_log_type_enabled(v8, OS_LOG_TYPE_ERROR);

    if (v9)
    {
      pk_General_log();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        v15 = 136446722;
        v16 = "-[NPKGizmoDatabase _currentEphemeralTransactionIdentifierForTransactionSourceIdentifier:]";
        v17 = 2082;
        v18 = "/Library/Caches/com.apple.xbs/Sources/NanoPassbook_Frameworks/NanoPassKit/NPKGizmoDatabase.m";
        v19 = 2048;
        v20 = 3018;
        _os_log_impl(&dword_213518000, v10, OS_LOG_TYPE_ERROR, "Error: *** NPKAssertion failure in %{public}s, %{public}s:%ld (reason: Nil database handle; did you check pass"
          "DBIsAvailable before calling?)",
          (uint8_t *)&v15,
          0x20u);
      }

    }
    _NPKAssertAbort();
  }
  v11 = -[NPKGizmoDatabase currentEphemeralTransactionIdentifierStatement](self, "currentEphemeralTransactionIdentifierStatement");
  v12 = objc_retainAutorelease(v4);
  sqlite3_bind_text(v11, 1, (const char *)objc_msgSend(v12, "UTF8String"), -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
  if (sqlite3_step(v11) == 100)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", sqlite3_column_text(v11, 0));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13 = 0;
  }
  sqlite3_clear_bindings(v11);
  sqlite3_reset(v11);

  return v13;
}

- (id)_lastAddValueAmountForPassWithUniqueIDLocked:(id)a3
{
  id v4;
  sqlite3_stmt *v5;
  id v6;
  const char *v7;
  const unsigned __int8 *v8;
  void *v9;
  void *v10;

  v4 = a3;
  v5 = -[NPKGizmoDatabase selectLastAddValueAmountForPassStatement](self, "selectLastAddValueAmountForPassStatement");
  v6 = objc_retainAutorelease(v4);
  v7 = (const char *)objc_msgSend(v6, "UTF8String");

  sqlite3_bind_text(v5, 1, v7, -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
  if (sqlite3_step(v5) == 100 && (v8 = sqlite3_column_text(v5, 0)) != 0 && *v8)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1518], "decimalNumberWithString:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
  }
  sqlite3_clear_bindings(v5);
  sqlite3_reset(v5);
  return v10;
}

- (void)_setLastAddValueAmountLocked:(id)a3 forPassWithUniqueID:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  _BOOL4 v9;
  NSObject *v10;
  NSObject *dbQueue;
  id v12;
  id v13;
  _QWORD block[5];
  id v15;
  id v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  const char *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (!v7)
  {
    pk_General_log();
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = os_log_type_enabled(v8, OS_LOG_TYPE_ERROR);

    if (v9)
    {
      pk_General_log();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446978;
        v18 = "-[NPKGizmoDatabase _setLastAddValueAmountLocked:forPassWithUniqueID:]";
        v19 = 2082;
        v20 = "/Library/Caches/com.apple.xbs/Sources/NanoPassbook_Frameworks/NanoPassKit/NPKGizmoDatabase.m";
        v21 = 2048;
        v22 = 3051;
        v23 = 2080;
        v24 = "-[NPKGizmoDatabase _setLastAddValueAmountLocked:forPassWithUniqueID:]";
        _os_log_impl(&dword_213518000, v10, OS_LOG_TYPE_ERROR, "Error: *** NPKAssertion failure in %{public}s, %{public}s:%ld (reason: %s cannot take nil unique ID)", buf, 0x2Au);
      }

    }
    _NPKAssertAbort();
  }
  dbQueue = self->_dbQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __69__NPKGizmoDatabase__setLastAddValueAmountLocked_forPassWithUniqueID___block_invoke;
  block[3] = &unk_24CFE8288;
  block[4] = self;
  v15 = v6;
  v16 = v7;
  v12 = v7;
  v13 = v6;
  dispatch_async(dbQueue, block);

}

void __69__NPKGizmoDatabase__setLastAddValueAmountLocked_forPassWithUniqueID___block_invoke(id *a1)
{
  NSObject *v2;
  _BOOL4 v3;
  NSObject *v4;
  sqlite3_stmt *v5;
  id v6;
  id v7;
  NSObject *v8;
  _BOOL4 v9;
  NSObject *v10;
  const char *v11;
  const char *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t, void *, uint64_t, _BYTE *);
  void *v17;
  id v18;
  id v19;
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  uint64_t v25;
  __int16 v26;
  const char *v27;
  __int16 v28;
  const char *v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1[4], "_loadInitialManifestLocked");
  if (!objc_msgSend(a1[4], "database"))
  {
    pk_General_log();
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = os_log_type_enabled(v2, OS_LOG_TYPE_ERROR);

    if (v3)
    {
      pk_General_log();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446722;
        v21 = "-[NPKGizmoDatabase _setLastAddValueAmountLocked:forPassWithUniqueID:]_block_invoke";
        v22 = 2082;
        v23 = "/Library/Caches/com.apple.xbs/Sources/NanoPassbook_Frameworks/NanoPassKit/NPKGizmoDatabase.m";
        v24 = 2048;
        v25 = 3054;
        _os_log_impl(&dword_213518000, v4, OS_LOG_TYPE_ERROR, "Error: *** NPKAssertion failure in %{public}s, %{public}s:%ld (reason: Nil database handle; did you check pass"
          "DBIsAvailable before calling?)",
          buf,
          0x20u);
      }

    }
    _NPKAssertAbort();
  }
  v5 = (sqlite3_stmt *)objc_msgSend(a1[4], "updateLastAddValueAmountForPassStatement");
  v6 = a1[5];
  if (v6)
  {
    objc_msgSend(v6, "stringValue");
    v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    sqlite3_bind_text(v5, 1, (const char *)objc_msgSend(v7, "UTF8String"), -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);

  }
  else
  {
    sqlite3_bind_null(v5, 1);
  }
  sqlite3_bind_text(v5, 2, (const char *)objc_msgSend(objc_retainAutorelease(a1[6]), "UTF8String"), -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
  if (sqlite3_step(v5) != 101)
  {
    pk_General_log();
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = os_log_type_enabled(v8, OS_LOG_TYPE_ERROR);

    if (v9)
    {
      pk_General_log();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        v11 = sqlite3_sql(v5);
        v12 = sqlite3_errmsg(*((sqlite3 **)a1[4] + 1));
        *(_DWORD *)buf = 136447234;
        v21 = "-[NPKGizmoDatabase _setLastAddValueAmountLocked:forPassWithUniqueID:]_block_invoke";
        v22 = 2082;
        v23 = "/Library/Caches/com.apple.xbs/Sources/NanoPassbook_Frameworks/NanoPassKit/NPKGizmoDatabase.m";
        v24 = 2048;
        v25 = 3068;
        v26 = 2080;
        v27 = v11;
        v28 = 2080;
        v29 = v12;
        _os_log_impl(&dword_213518000, v10, OS_LOG_TYPE_ERROR, "Error: *** NPKAssertion failure in %{public}s, %{public}s:%ld (reason: Setting last add value amount failed: %s; %s)",
          buf,
          0x34u);
      }

    }
    _NPKAssertAbort();
  }
  sqlite3_clear_bindings(v5);
  sqlite3_reset(v5);
  v13 = (void *)*((_QWORD *)a1[4] + 44);
  v14 = MEMORY[0x24BDAC760];
  v15 = 3221225472;
  v16 = __69__NPKGizmoDatabase__setLastAddValueAmountLocked_forPassWithUniqueID___block_invoke_342;
  v17 = &unk_24CFEB2B0;
  v18 = a1[6];
  v19 = a1[5];
  objc_msgSend(v13, "enumerateObjectsUsingBlock:", &v14);
  objc_msgSend(a1[4], "_notifyDatabaseChangedExternally", v14, v15, v16, v17);
  objc_msgSend(a1[4], "_notifyDatabaseChangedWithNoop:", 0);

}

void __69__NPKGizmoDatabase__setLastAddValueAmountLocked_forPassWithUniqueID___block_invoke_342(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  void *v7;
  int v8;
  NSObject *v9;
  _BOOL4 v10;
  NSObject *v11;
  uint64_t v12;
  int v13;
  id v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v6 = a2;
  objc_msgSend(v6, "uniqueID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqualToString:", *(_QWORD *)(a1 + 32));

  if (v8)
  {
    pk_General_log();
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);

    if (v10)
    {
      pk_General_log();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        v12 = *(_QWORD *)(a1 + 40);
        v13 = 138412546;
        v14 = v6;
        v15 = 2112;
        v16 = v12;
        _os_log_impl(&dword_213518000, v11, OS_LOG_TYPE_DEFAULT, "Notice: Updating description %@ with new last add value amount %@", (uint8_t *)&v13, 0x16u);
      }

    }
    objc_msgSend(v6, "setLastAddValueAmount:", *(_QWORD *)(a1 + 40));
    *a4 = 1;
  }

}

- (id)_pendingAddValueDateForPassWithUniqueIDLocked:(id)a3
{
  id v4;
  sqlite3_stmt *v5;
  id v6;
  const char *v7;
  int v8;
  void *v9;

  v4 = a3;
  v5 = -[NPKGizmoDatabase selectPendingAddValueDateForPassStatement](self, "selectPendingAddValueDateForPassStatement");
  v6 = objc_retainAutorelease(v4);
  v7 = (const char *)objc_msgSend(v6, "UTF8String");

  sqlite3_bind_text(v5, 1, v7, -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
  if (sqlite3_step(v5) == 100 && (v8 = sqlite3_column_int(v5, 0)) != 0)
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSinceReferenceDate:", (double)v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }
  sqlite3_clear_bindings(v5);
  sqlite3_reset(v5);
  return v9;
}

- (void)_setPendingAddValueDateLocked:(id)a3 forPassWithUniqueID:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  _BOOL4 v9;
  NSObject *v10;
  NSObject *dbQueue;
  id v12;
  id v13;
  _QWORD block[5];
  id v15;
  id v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  const char *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (!v7)
  {
    pk_General_log();
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = os_log_type_enabled(v8, OS_LOG_TYPE_ERROR);

    if (v9)
    {
      pk_General_log();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446978;
        v18 = "-[NPKGizmoDatabase _setPendingAddValueDateLocked:forPassWithUniqueID:]";
        v19 = 2082;
        v20 = "/Library/Caches/com.apple.xbs/Sources/NanoPassbook_Frameworks/NanoPassKit/NPKGizmoDatabase.m";
        v21 = 2048;
        v22 = 3103;
        v23 = 2080;
        v24 = "-[NPKGizmoDatabase _setPendingAddValueDateLocked:forPassWithUniqueID:]";
        _os_log_impl(&dword_213518000, v10, OS_LOG_TYPE_ERROR, "Error: *** NPKAssertion failure in %{public}s, %{public}s:%ld (reason: %s cannot take nil unique ID)", buf, 0x2Au);
      }

    }
    _NPKAssertAbort();
  }
  dbQueue = self->_dbQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __70__NPKGizmoDatabase__setPendingAddValueDateLocked_forPassWithUniqueID___block_invoke;
  block[3] = &unk_24CFE8288;
  block[4] = self;
  v15 = v6;
  v16 = v7;
  v12 = v7;
  v13 = v6;
  dispatch_async(dbQueue, block);

}

void __70__NPKGizmoDatabase__setPendingAddValueDateLocked_forPassWithUniqueID___block_invoke(id *a1)
{
  NSObject *v2;
  _BOOL4 v3;
  NSObject *v4;
  sqlite3_stmt *v5;
  id v6;
  double v7;
  NSObject *v8;
  _BOOL4 v9;
  NSObject *v10;
  const char *v11;
  const char *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t, void *, uint64_t, _BYTE *);
  void *v17;
  id v18;
  id v19;
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  uint64_t v25;
  __int16 v26;
  const char *v27;
  __int16 v28;
  const char *v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1[4], "_loadInitialManifestLocked");
  if (!objc_msgSend(a1[4], "database"))
  {
    pk_General_log();
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = os_log_type_enabled(v2, OS_LOG_TYPE_ERROR);

    if (v3)
    {
      pk_General_log();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446722;
        v21 = "-[NPKGizmoDatabase _setPendingAddValueDateLocked:forPassWithUniqueID:]_block_invoke";
        v22 = 2082;
        v23 = "/Library/Caches/com.apple.xbs/Sources/NanoPassbook_Frameworks/NanoPassKit/NPKGizmoDatabase.m";
        v24 = 2048;
        v25 = 3106;
        _os_log_impl(&dword_213518000, v4, OS_LOG_TYPE_ERROR, "Error: *** NPKAssertion failure in %{public}s, %{public}s:%ld (reason: Nil database handle; did you check pass"
          "DBIsAvailable before calling?)",
          buf,
          0x20u);
      }

    }
    _NPKAssertAbort();
  }
  v5 = (sqlite3_stmt *)objc_msgSend(a1[4], "updatePendingAddValueDateForPassStatement");
  v6 = a1[5];
  if (v6)
  {
    objc_msgSend(v6, "timeIntervalSinceReferenceDate");
    sqlite3_bind_int(v5, 1, (int)v7);
  }
  else
  {
    sqlite3_bind_null(v5, 1);
  }
  sqlite3_bind_text(v5, 2, (const char *)objc_msgSend(objc_retainAutorelease(a1[6]), "UTF8String"), -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
  if (sqlite3_step(v5) != 101)
  {
    pk_General_log();
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = os_log_type_enabled(v8, OS_LOG_TYPE_ERROR);

    if (v9)
    {
      pk_General_log();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        v11 = sqlite3_sql(v5);
        v12 = sqlite3_errmsg(*((sqlite3 **)a1[4] + 1));
        *(_DWORD *)buf = 136447234;
        v21 = "-[NPKGizmoDatabase _setPendingAddValueDateLocked:forPassWithUniqueID:]_block_invoke";
        v22 = 2082;
        v23 = "/Library/Caches/com.apple.xbs/Sources/NanoPassbook_Frameworks/NanoPassKit/NPKGizmoDatabase.m";
        v24 = 2048;
        v25 = 3120;
        v26 = 2080;
        v27 = v11;
        v28 = 2080;
        v29 = v12;
        _os_log_impl(&dword_213518000, v10, OS_LOG_TYPE_ERROR, "Error: *** NPKAssertion failure in %{public}s, %{public}s:%ld (reason: Setting pending add value date failed: %s; %s)",
          buf,
          0x34u);
      }

    }
    _NPKAssertAbort();
  }
  sqlite3_clear_bindings(v5);
  sqlite3_reset(v5);
  v13 = (void *)*((_QWORD *)a1[4] + 44);
  v14 = MEMORY[0x24BDAC760];
  v15 = 3221225472;
  v16 = __70__NPKGizmoDatabase__setPendingAddValueDateLocked_forPassWithUniqueID___block_invoke_343;
  v17 = &unk_24CFEB2B0;
  v18 = a1[6];
  v19 = a1[5];
  objc_msgSend(v13, "enumerateObjectsUsingBlock:", &v14);
  objc_msgSend(a1[4], "_notifyDatabaseChangedExternally", v14, v15, v16, v17);
  objc_msgSend(a1[4], "_notifyDatabaseChangedWithNoop:", 0);

}

void __70__NPKGizmoDatabase__setPendingAddValueDateLocked_forPassWithUniqueID___block_invoke_343(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  void *v7;
  int v8;
  NSObject *v9;
  _BOOL4 v10;
  NSObject *v11;
  uint64_t v12;
  int v13;
  id v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v6 = a2;
  objc_msgSend(v6, "uniqueID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqualToString:", *(_QWORD *)(a1 + 32));

  if (v8)
  {
    pk_General_log();
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);

    if (v10)
    {
      pk_General_log();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        v12 = *(_QWORD *)(a1 + 40);
        v13 = 138412546;
        v14 = v6;
        v15 = 2112;
        v16 = v12;
        _os_log_impl(&dword_213518000, v11, OS_LOG_TYPE_DEFAULT, "Notice: Updating description %@ with new pending add value date %@", (uint8_t *)&v13, 0x16u);
      }

    }
    objc_msgSend(v6, "setPendingAddValueDate:", *(_QWORD *)(a1 + 40));
    *a4 = 1;
  }

}

- (id)_paymentBalancesForPassWithUniqueIDLocked:(id)a3
{
  id v4;
  sqlite3_stmt *v5;
  id v6;
  const void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  NSObject *v15;
  _BOOL4 v16;
  NSObject *v17;
  uint8_t buf[16];

  v4 = a3;
  v5 = -[NPKGizmoDatabase selectBalancesForPassStatement](self, "selectBalancesForPassStatement");
  v6 = objc_retainAutorelease(v4);
  sqlite3_bind_text(v5, 1, (const char *)objc_msgSend(v6, "UTF8String"), -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
  if (sqlite3_step(v5) == 100)
  {
    v7 = sqlite3_column_blob(v5, 0);
    v8 = sqlite3_column_bytes(v5, 0);
    v9 = (void *)MEMORY[0x2199B65AC]();
    objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", v7, v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)MEMORY[0x24BDBCF20];
    v12 = objc_opt_class();
    objc_msgSend(v11, "setWithObjects:", v12, objc_opt_class(), 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    NPKSecureUnarchiveObjectOfClasses(v10, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_autoreleasePoolPop(v9);
  }
  else
  {
    pk_General_log();
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);

    if (v16)
    {
      pk_General_log();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_213518000, v17, OS_LOG_TYPE_DEFAULT, "Notice: selectBalancesForPassStatement does not equal row", buf, 2u);
      }

    }
    v14 = 0;
  }
  sqlite3_clear_bindings(v5);
  sqlite3_reset(v5);

  return v14;
}

- (void)_setPaymentBalancesLocked:(id)a3 forPassWithUniqueID:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  _BOOL4 v9;
  NSObject *v10;
  NSObject *v11;
  _BOOL4 v12;
  NSObject *v13;
  sqlite3_stmt *v14;
  id v15;
  NSObject *v16;
  _BOOL4 v17;
  NSObject *v18;
  id v19;
  int v20;
  NSObject *v21;
  NSObject *v22;
  _BOOL4 v23;
  NSObject *v24;
  sqlite3 *v25;
  _BOOL4 v26;
  NSObject *v27;
  const char *v28;
  const char *v29;
  int v30;
  const char *v31;
  __int16 v32;
  const char *v33;
  __int16 v34;
  uint64_t v35;
  __int16 v36;
  const char *v37;
  __int16 v38;
  const char *v39;
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (!v7)
  {
    pk_General_log();
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = os_log_type_enabled(v8, OS_LOG_TYPE_ERROR);

    if (v9)
    {
      pk_General_log();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        v30 = 136446978;
        v31 = "-[NPKGizmoDatabase _setPaymentBalancesLocked:forPassWithUniqueID:]";
        v32 = 2082;
        v33 = "/Library/Caches/com.apple.xbs/Sources/NanoPassbook_Frameworks/NanoPassKit/NPKGizmoDatabase.m";
        v34 = 2048;
        v35 = 3159;
        v36 = 2080;
        v37 = "-[NPKGizmoDatabase _setPaymentBalancesLocked:forPassWithUniqueID:]";
        _os_log_impl(&dword_213518000, v10, OS_LOG_TYPE_ERROR, "Error: *** NPKAssertion failure in %{public}s, %{public}s:%ld (reason: %s cannot take nil unique ID)", (uint8_t *)&v30, 0x2Au);
      }

    }
    _NPKAssertAbort();
  }
  -[NPKGizmoDatabase _loadInitialManifestLocked](self, "_loadInitialManifestLocked");
  if (!-[NPKGizmoDatabase database](self, "database"))
  {
    pk_General_log();
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = os_log_type_enabled(v11, OS_LOG_TYPE_ERROR);

    if (v12)
    {
      pk_General_log();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        v30 = 136446722;
        v31 = "-[NPKGizmoDatabase _setPaymentBalancesLocked:forPassWithUniqueID:]";
        v32 = 2082;
        v33 = "/Library/Caches/com.apple.xbs/Sources/NanoPassbook_Frameworks/NanoPassKit/NPKGizmoDatabase.m";
        v34 = 2048;
        v35 = 3161;
        _os_log_impl(&dword_213518000, v13, OS_LOG_TYPE_ERROR, "Error: *** NPKAssertion failure in %{public}s, %{public}s:%ld (reason: Nil database handle; did you check pass"
          "DBIsAvailable before calling?)",
          (uint8_t *)&v30,
          0x20u);
      }

    }
    _NPKAssertAbort();
  }
  v14 = -[NPKGizmoDatabase updateBalancesForPassStatement](self, "updateBalancesForPassStatement");
  if (v6)
  {
    NPKSecureArchiveObject(v6);
    v15 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    sqlite3_bind_blob(v14, 1, (const void *)objc_msgSend(v15, "bytes"), objc_msgSend(v15, "length"), (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);

  }
  else
  {
    pk_General_log();
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT);

    if (v17)
    {
      pk_General_log();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v30) = 0;
        _os_log_impl(&dword_213518000, v18, OS_LOG_TYPE_DEFAULT, "Notice: Passed empty balances, storing null", (uint8_t *)&v30, 2u);
      }

    }
    sqlite3_bind_null(v14, 1);
  }
  v19 = objc_retainAutorelease(v7);
  sqlite3_bind_text(v14, 2, (const char *)objc_msgSend(v19, "UTF8String"), -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
  v20 = sqlite3_step(v14);
  pk_General_log();
  v21 = objc_claimAutoreleasedReturnValue();
  v22 = v21;
  if (v20 != 101)
  {
    v26 = os_log_type_enabled(v21, OS_LOG_TYPE_ERROR);

    if (v26)
    {
      pk_General_log();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        v28 = sqlite3_sql(v14);
        v29 = sqlite3_errmsg(self->_database);
        v30 = 136447234;
        v31 = "-[NPKGizmoDatabase _setPaymentBalancesLocked:forPassWithUniqueID:]";
        v32 = 2082;
        v33 = "/Library/Caches/com.apple.xbs/Sources/NanoPassbook_Frameworks/NanoPassKit/NPKGizmoDatabase.m";
        v34 = 2048;
        v35 = 3178;
        v36 = 2080;
        v37 = v28;
        v38 = 2080;
        v39 = v29;
        _os_log_impl(&dword_213518000, v27, OS_LOG_TYPE_ERROR, "Error: *** NPKAssertion failure in %{public}s, %{public}s:%ld (reason: Updating balances failed: %s; %s)",
          (uint8_t *)&v30,
          0x34u);
      }

    }
    _NPKAssertAbort();
  }
  v23 = os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT);

  if (v23)
  {
    pk_General_log();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      v25 = -[NPKGizmoDatabase database](self, "database");
      v30 = 134218498;
      v31 = (const char *)v25;
      v32 = 2112;
      v33 = (const char *)v6;
      v34 = 2112;
      v35 = (uint64_t)v19;
      _os_log_impl(&dword_213518000, v24, OS_LOG_TYPE_DEFAULT, "Notice: Successfully wrote balances in database: %p, balance: %@, uniqueID: %@", (uint8_t *)&v30, 0x20u);
    }

  }
  sqlite3_clear_bindings(v14);
  sqlite3_reset(v14);

}

- (id)_subcredentialsForPassWithUniqueIDLocked:(id)a3
{
  id v4;
  sqlite3_stmt *v5;
  id v6;
  const void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;

  v4 = a3;
  v5 = -[NPKGizmoDatabase selectSubcredentialsForPassStatement](self, "selectSubcredentialsForPassStatement");
  v6 = objc_retainAutorelease(v4);
  sqlite3_bind_text(v5, 1, (const char *)objc_msgSend(v6, "UTF8String"), -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
  if (sqlite3_step(v5) == 100)
  {
    v7 = sqlite3_column_blob(v5, 0);
    v8 = sqlite3_column_bytes(v5, 0);
    v9 = (void *)MEMORY[0x2199B65AC]();
    objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", v7, v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "length"))
    {
      v11 = (void *)MEMORY[0x24BDBCF20];
      v12 = objc_opt_class();
      objc_msgSend(v11, "setWithObjects:", v12, objc_opt_class(), 0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      NPKSecureUnarchiveObjectOfClasses(v10, v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v14 = 0;
    }

    objc_autoreleasePoolPop(v9);
  }
  else
  {
    v14 = 0;
  }
  sqlite3_clear_bindings(v5);
  sqlite3_reset(v5);

  return v14;
}

- (void)_setSubcredentialsLocked:(id)a3 forPassWithUniqueID:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  _BOOL4 v9;
  NSObject *v10;
  NSObject *v11;
  _BOOL4 v12;
  NSObject *v13;
  sqlite3_stmt *v14;
  sqlite3_stmt *v15;
  id v16;
  id v17;
  NSObject *v18;
  _BOOL4 v19;
  NSObject *v20;
  const char *v21;
  const char *v22;
  NSMutableArray *passDescriptions;
  id v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  void (*v28)(uint64_t, void *, uint64_t, _BYTE *);
  void *v29;
  id v30;
  id v31;
  uint8_t buf[4];
  const char *v33;
  __int16 v34;
  const char *v35;
  __int16 v36;
  uint64_t v37;
  __int16 v38;
  const char *v39;
  __int16 v40;
  const char *v41;
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (!v7)
  {
    pk_General_log();
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = os_log_type_enabled(v8, OS_LOG_TYPE_ERROR);

    if (v9)
    {
      pk_General_log();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446978;
        v33 = "-[NPKGizmoDatabase _setSubcredentialsLocked:forPassWithUniqueID:]";
        v34 = 2082;
        v35 = "/Library/Caches/com.apple.xbs/Sources/NanoPassbook_Frameworks/NanoPassKit/NPKGizmoDatabase.m";
        v36 = 2048;
        v37 = 3206;
        v38 = 2080;
        v39 = "-[NPKGizmoDatabase _setSubcredentialsLocked:forPassWithUniqueID:]";
        _os_log_impl(&dword_213518000, v10, OS_LOG_TYPE_ERROR, "Error: *** NPKAssertion failure in %{public}s, %{public}s:%ld (reason: %s cannot take nil unique ID)", buf, 0x2Au);
      }

    }
    _NPKAssertAbort();
  }
  -[NPKGizmoDatabase _loadInitialManifestLocked](self, "_loadInitialManifestLocked");
  if (!-[NPKGizmoDatabase database](self, "database"))
  {
    pk_General_log();
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = os_log_type_enabled(v11, OS_LOG_TYPE_ERROR);

    if (v12)
    {
      pk_General_log();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446722;
        v33 = "-[NPKGizmoDatabase _setSubcredentialsLocked:forPassWithUniqueID:]";
        v34 = 2082;
        v35 = "/Library/Caches/com.apple.xbs/Sources/NanoPassbook_Frameworks/NanoPassKit/NPKGizmoDatabase.m";
        v36 = 2048;
        v37 = 3208;
        _os_log_impl(&dword_213518000, v13, OS_LOG_TYPE_ERROR, "Error: *** NPKAssertion failure in %{public}s, %{public}s:%ld (reason: Nil database handle; did you check pass"
          "DBIsAvailable before calling?)",
          buf,
          0x20u);
      }

    }
    _NPKAssertAbort();
  }
  v14 = -[NPKGizmoDatabase updateSubcredentialsForPassStatement](self, "updateSubcredentialsForPassStatement");
  v15 = v14;
  if (v6)
  {
    NPKSecureArchiveObject(v6);
    v16 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    sqlite3_bind_blob(v15, 1, (const void *)objc_msgSend(v16, "bytes"), objc_msgSend(v16, "length"), (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);

  }
  else
  {
    sqlite3_bind_null(v14, 1);
  }
  v17 = objc_retainAutorelease(v7);
  sqlite3_bind_text(v15, 2, (const char *)objc_msgSend(v17, "UTF8String"), -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
  if (sqlite3_step(v15) != 101)
  {
    pk_General_log();
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = os_log_type_enabled(v18, OS_LOG_TYPE_ERROR);

    if (v19)
    {
      pk_General_log();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        v21 = sqlite3_sql(v15);
        v22 = sqlite3_errmsg(self->_database);
        *(_DWORD *)buf = 136447234;
        v33 = "-[NPKGizmoDatabase _setSubcredentialsLocked:forPassWithUniqueID:]";
        v34 = 2082;
        v35 = "/Library/Caches/com.apple.xbs/Sources/NanoPassbook_Frameworks/NanoPassKit/NPKGizmoDatabase.m";
        v36 = 2048;
        v37 = 3223;
        v38 = 2080;
        v39 = v21;
        v40 = 2080;
        v41 = v22;
        _os_log_impl(&dword_213518000, v20, OS_LOG_TYPE_ERROR, "Error: *** NPKAssertion failure in %{public}s, %{public}s:%ld (reason: Updating subcredentials failed: %s; %s)",
          buf,
          0x34u);
      }

    }
    _NPKAssertAbort();
  }
  sqlite3_clear_bindings(v15);
  sqlite3_reset(v15);
  passDescriptions = self->_passDescriptions;
  v26 = MEMORY[0x24BDAC760];
  v27 = 3221225472;
  v28 = __65__NPKGizmoDatabase__setSubcredentialsLocked_forPassWithUniqueID___block_invoke;
  v29 = &unk_24CFEB2B0;
  v30 = v17;
  v31 = v6;
  v24 = v6;
  v25 = v17;
  -[NSMutableArray enumerateObjectsUsingBlock:](passDescriptions, "enumerateObjectsUsingBlock:", &v26);
  -[NPKGizmoDatabase _notifyDatabaseChangedExternally](self, "_notifyDatabaseChangedExternally", v26, v27, v28, v29);
  -[NPKGizmoDatabase _notifyDatabaseChangedWithNoop:](self, "_notifyDatabaseChangedWithNoop:", 0);

}

void __65__NPKGizmoDatabase__setSubcredentialsLocked_forPassWithUniqueID___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  void *v7;
  int v8;
  NSObject *v9;
  _BOOL4 v10;
  NSObject *v11;
  uint64_t v12;
  int v13;
  id v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v6 = a2;
  objc_msgSend(v6, "uniqueID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqualToString:", *(_QWORD *)(a1 + 32));

  if (v8)
  {
    pk_General_log();
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);

    if (v10)
    {
      pk_General_log();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        v12 = *(_QWORD *)(a1 + 40);
        v13 = 138412546;
        v14 = v6;
        v15 = 2112;
        v16 = v12;
        _os_log_impl(&dword_213518000, v11, OS_LOG_TYPE_DEFAULT, "Notice: Updating description %@ with new subcredentials %@", (uint8_t *)&v13, 0x16u);
      }

    }
    objc_msgSend(v6, "setSubcredentials:", *(_QWORD *)(a1 + 40));
    *a4 = 1;
  }

}

- (void)_enumerateAllPassesForMigration:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __52__NPKGizmoDatabase__enumerateAllPassesForMigration___block_invoke;
  v6[3] = &unk_24CFEB2D8;
  v7 = v4;
  v5 = v4;
  -[NPKGizmoDatabase _executeSQLQuery:processResultsBlock:](self, "_executeSQLQuery:processResultsBlock:", CFSTR("SELECT encoded_pass, encoded_image_sets, preferred_aid FROM pass"), v6);

}

uint64_t __52__NPKGizmoDatabase__enumerateAllPassesForMigration___block_invoke(uint64_t result, int a2, sqlite3_stmt *a3)
{
  __int128 v4;
  const void *v5;
  int v6;
  const void *v7;
  int v8;
  const unsigned __int8 *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  NSObject *v20;
  _BOOL4 v21;
  NSObject *v22;
  void *v23;
  uint64_t v24;
  __int128 v25;
  uint64_t v26;
  uint8_t buf[4];
  const char *v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v26 = result;
  v31 = *MEMORY[0x24BDAC8D0];
  if (a3)
  {
    if (a2)
    {
      result = sqlite3_step(a3);
      if ((_DWORD)result == 100)
      {
        *(_QWORD *)&v4 = 136315394;
        v25 = v4;
        do
        {
          v5 = sqlite3_column_blob(a3, 0);
          v6 = sqlite3_column_bytes(a3, 0);
          v7 = sqlite3_column_blob(a3, 1);
          v8 = sqlite3_column_bytes(a3, 1);
          v9 = sqlite3_column_text(a3, 2);
          v10 = (void *)MEMORY[0x2199B65AC]();
          if (v9)
          {
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v9, 4);
            v11 = (void *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v11 = 0;
          }
          objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", v5, v6, v25);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_opt_class();
          NPKSecureUnarchiveObject(v12, v13);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          if (v14)
          {
            objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", v7, v8);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v16 = objc_opt_class();
            NPKSecureUnarchiveObject(v15, v16);
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            if (v17)
              objc_msgSend(v14, "setMissingImageSetsFromObject:", v17);
            if (os_variant_has_internal_ui())
            {
              objc_msgSend(v14, "passTypeIdentifier");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              v19 = objc_msgSend(v18, "length");

              if (!v19)
              {
                pk_General_log();
                v20 = objc_claimAutoreleasedReturnValue();
                v21 = os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT);

                if (v21)
                {
                  pk_General_log();
                  v22 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
                  {
                    objc_msgSend(v14, "uniqueID");
                    v23 = (void *)objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)buf = v25;
                    v28 = "-[NPKGizmoDatabase _enumerateAllPassesForMigration:]_block_invoke";
                    v29 = 2112;
                    v30 = v23;
                    _os_log_impl(&dword_213518000, v22, OS_LOG_TYPE_DEFAULT, "Warning: %s encoded_pass Unarchived pass with unique identifier %@ is missing the type identifier", buf, 0x16u);

                  }
                }
              }
            }
            v24 = *(_QWORD *)(v26 + 32);
            if (v24)
              (*(void (**)(uint64_t, void *, void *))(v24 + 16))(v24, v14, v11);

          }
          objc_autoreleasePoolPop(v10);
          result = sqlite3_step(a3);
        }
        while ((_DWORD)result == 100);
      }
    }
  }
  return result;
}

- (BOOL)_updateNFCPayloadDuringMigration:(id)a3
{
  id v4;
  BOOL v5;
  _QWORD v7[6];
  sqlite3_stmt *ppStmt;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  char v12;

  v4 = a3;
  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 1;
  ppStmt = 0;
  if (sqlite3_prepare_v2(-[NPKGizmoDatabase database](self, "database"), (const char *)objc_msgSend(CFSTR("UPDATE pass SET nfc_payload=? WHERE unique_id=?"), "UTF8String"), -1, &ppStmt, 0))
  {
    v5 = 0;
    *((_BYTE *)v10 + 24) = 0;
  }
  else
  {
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __53__NPKGizmoDatabase__updateNFCPayloadDuringMigration___block_invoke;
    v7[3] = &unk_24CFEB300;
    v7[4] = &v9;
    v7[5] = ppStmt;
    objc_msgSend(v4, "enumerateObjectsUsingBlock:", v7);
    v5 = *((_BYTE *)v10 + 24) != 0;
  }
  _Block_object_dispose(&v9, 8);

  return v5;
}

void __53__NPKGizmoDatabase__updateNFCPayloadDuringMigration___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  void *v7;
  void *v8;
  sqlite3_stmt *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a2;
  objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("nfcPayload"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    NPKSecureArchiveObject(v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = *(sqlite3_stmt **)(a1 + 40);
    v10 = objc_retainAutorelease(v8);
    sqlite3_bind_blob(v9, 1, (const void *)objc_msgSend(v10, "bytes"), objc_msgSend(v10, "length"), (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);

  }
  objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("uniqueID"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (!v11
    || (sqlite3_bind_text(*(sqlite3_stmt **)(a1 + 40), 2, (const char *)objc_msgSend(objc_retainAutorelease(v11), "UTF8String"), -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL), sqlite3_step(*(sqlite3_stmt **)(a1 + 40)) != 101))
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
    *a4 = 1;
  }
  sqlite3_clear_bindings(*(sqlite3_stmt **)(a1 + 40));
  sqlite3_reset(*(sqlite3_stmt **)(a1 + 40));

}

- (BOOL)_updatePrivateLabelAndCobrandDuringMigration:(id)a3
{
  id v4;
  BOOL v5;
  _QWORD v7[6];
  sqlite3_stmt *ppStmt;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  char v12;

  v4 = a3;
  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 1;
  ppStmt = 0;
  if (sqlite3_prepare_v2(-[NPKGizmoDatabase database](self, "database"), (const char *)objc_msgSend(CFSTR("UPDATE pass SET private_label=?, cobranded=? WHERE unique_id=?"), "UTF8String"), -1, &ppStmt, 0))
  {
    v5 = 0;
    *((_BYTE *)v10 + 24) = 0;
  }
  else
  {
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __65__NPKGizmoDatabase__updatePrivateLabelAndCobrandDuringMigration___block_invoke;
    v7[3] = &unk_24CFEB300;
    v7[4] = &v9;
    v7[5] = ppStmt;
    objc_msgSend(v4, "enumerateObjectsUsingBlock:", v7);
    v5 = *((_BYTE *)v10 + 24) != 0;
  }
  _Block_object_dispose(&v9, 8);

  return v5;
}

void __65__NPKGizmoDatabase__updatePrivateLabelAndCobrandDuringMigration___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  void *v7;
  int v8;
  void *v9;
  int v10;
  id v11;

  v6 = a2;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("privateLabel"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "BOOLValue");

  sqlite3_bind_int(*(sqlite3_stmt **)(a1 + 40), 1, v8);
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("cobranded"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "BOOLValue");

  sqlite3_bind_int(*(sqlite3_stmt **)(a1 + 40), 2, v10);
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("uniqueID"));
  v11 = (id)objc_claimAutoreleasedReturnValue();

  if (!v11
    || (sqlite3_bind_text(*(sqlite3_stmt **)(a1 + 40), 3, (const char *)objc_msgSend(objc_retainAutorelease(v11), "UTF8String"), -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL), sqlite3_step(*(sqlite3_stmt **)(a1 + 40)) != 101))
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
    *a4 = 1;
  }
  sqlite3_clear_bindings(*(sqlite3_stmt **)(a1 + 40));
  sqlite3_reset(*(sqlite3_stmt **)(a1 + 40));

}

- (BOOL)_updateDeviceAndPreferredPaymentApplicationsDuringMigration:(id)a3
{
  id v4;
  char v5;
  _QWORD v7[6];
  sqlite3_stmt *ppStmt;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  char v12;

  v4 = a3;
  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 1;
  ppStmt = 0;
  if (!sqlite3_prepare_v2(-[NPKGizmoDatabase database](self, "database"), (const char *)objc_msgSend(CFSTR("UPDATE pass SET device_primary_payment_application=?, preferred_payment_application=? WHERE unique_id=?"), "UTF8String"), -1, &ppStmt, 0))
  {
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __80__NPKGizmoDatabase__updateDeviceAndPreferredPaymentApplicationsDuringMigration___block_invoke;
    v7[3] = &unk_24CFEB300;
    v7[4] = &v9;
    v7[5] = ppStmt;
    objc_msgSend(v4, "enumerateObjectsUsingBlock:", v7);
  }
  v5 = *((_BYTE *)v10 + 24);
  _Block_object_dispose(&v9, 8);

  return v5;
}

void __80__NPKGizmoDatabase__updateDeviceAndPreferredPaymentApplicationsDuringMigration___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  void *v7;
  void *v8;
  sqlite3_stmt *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  sqlite3_stmt *v14;
  id v15;
  void *v16;
  void *v17;
  id v18;

  v18 = a2;
  objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("devicePrimaryPaymentApplication"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6
    && (objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("devicePrimaryPaymentApplication")),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        NPKSecureArchiveObject(v7),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v7,
        v8))
  {
    v9 = *(sqlite3_stmt **)(a1 + 40);
    v10 = objc_retainAutorelease(v8);
    sqlite3_bind_blob(v9, 1, (const void *)objc_msgSend(v10, "bytes"), objc_msgSend(v10, "length"), (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);

  }
  else
  {
    sqlite3_bind_null(*(sqlite3_stmt **)(a1 + 40), 1);
  }
  objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("preferredPaymentApplication"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11
    && (objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("preferredPaymentApplication")),
        v12 = (void *)objc_claimAutoreleasedReturnValue(),
        NPKSecureArchiveObject(v12),
        v13 = (void *)objc_claimAutoreleasedReturnValue(),
        v12,
        v13))
  {
    v14 = *(sqlite3_stmt **)(a1 + 40);
    v15 = objc_retainAutorelease(v13);
    sqlite3_bind_blob(v14, 2, (const void *)objc_msgSend(v15, "bytes"), objc_msgSend(v15, "length"), (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);

  }
  else
  {
    sqlite3_bind_null(*(sqlite3_stmt **)(a1 + 40), 2);
  }
  objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("uniqueID"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if (!v16
    || (sqlite3_bind_text(*(sqlite3_stmt **)(a1 + 40), 3, (const char *)objc_msgSend(objc_retainAutorelease(v16), "UTF8String"), -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL), sqlite3_step(*(sqlite3_stmt **)(a1 + 40)) != 101))
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
    *a4 = 1;
  }
  sqlite3_clear_bindings(*(sqlite3_stmt **)(a1 + 40));
  sqlite3_reset(*(sqlite3_stmt **)(a1 + 40));

}

- (BOOL)_updatePrimaryContactlessAndInAppPaymentApplicationsDuringMigration:(id)a3
{
  id v4;
  char v5;
  _QWORD v7[6];
  sqlite3_stmt *ppStmt;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  char v12;

  v4 = a3;
  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 1;
  ppStmt = 0;
  if (!sqlite3_prepare_v2(-[NPKGizmoDatabase database](self, "database"), (const char *)objc_msgSend(CFSTR("UPDATE pass SET device_primary_contactless_payment_application=?, device_primary_in_app_payment_application=? WHERE unique_id=?"), "UTF8String"), -1, &ppStmt, 0))
  {
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __88__NPKGizmoDatabase__updatePrimaryContactlessAndInAppPaymentApplicationsDuringMigration___block_invoke;
    v7[3] = &unk_24CFEB300;
    v7[4] = &v9;
    v7[5] = ppStmt;
    objc_msgSend(v4, "enumerateObjectsUsingBlock:", v7);
  }
  v5 = *((_BYTE *)v10 + 24);
  _Block_object_dispose(&v9, 8);

  return v5;
}

void __88__NPKGizmoDatabase__updatePrimaryContactlessAndInAppPaymentApplicationsDuringMigration___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  void *v7;
  void *v8;
  sqlite3_stmt *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  sqlite3_stmt *v14;
  id v15;
  void *v16;
  void *v17;
  id v18;

  v18 = a2;
  objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("devicePrimaryContactlessPaymentApplication"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6
    && (objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("devicePrimaryContactlessPaymentApplication")),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        NPKSecureArchiveObject(v7),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v7,
        v8))
  {
    v9 = *(sqlite3_stmt **)(a1 + 40);
    v10 = objc_retainAutorelease(v8);
    sqlite3_bind_blob(v9, 1, (const void *)objc_msgSend(v10, "bytes"), objc_msgSend(v10, "length"), (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);

  }
  else
  {
    sqlite3_bind_null(*(sqlite3_stmt **)(a1 + 40), 1);
  }
  objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("devicePrimaryInAppPaymentApplication"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11
    && (objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("devicePrimaryInAppPaymentApplication")),
        v12 = (void *)objc_claimAutoreleasedReturnValue(),
        NPKSecureArchiveObject(v12),
        v13 = (void *)objc_claimAutoreleasedReturnValue(),
        v12,
        v13))
  {
    v14 = *(sqlite3_stmt **)(a1 + 40);
    v15 = objc_retainAutorelease(v13);
    sqlite3_bind_blob(v14, 2, (const void *)objc_msgSend(v15, "bytes"), objc_msgSend(v15, "length"), (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);

  }
  else
  {
    sqlite3_bind_null(*(sqlite3_stmt **)(a1 + 40), 2);
  }
  objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("uniqueID"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if (!v16
    || (sqlite3_bind_text(*(sqlite3_stmt **)(a1 + 40), 3, (const char *)objc_msgSend(objc_retainAutorelease(v16), "UTF8String"), -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL), sqlite3_step(*(sqlite3_stmt **)(a1 + 40)) != 101))
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
    *a4 = 1;
  }
  sqlite3_clear_bindings(*(sqlite3_stmt **)(a1 + 40));
  sqlite3_reset(*(sqlite3_stmt **)(a1 + 40));

}

- (BOOL)_updateEncodedImageSetsDuringMigration:(id)a3
{
  id v4;
  char v5;
  _QWORD v7[7];
  sqlite3_stmt *ppStmt;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  char v12;

  v4 = a3;
  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 1;
  ppStmt = 0;
  if (!sqlite3_prepare_v2(-[NPKGizmoDatabase database](self, "database"), (const char *)objc_msgSend(CFSTR("UPDATE pass SET encoded_pass=?, encoded_image_sets=? WHERE unique_id=?"), "UTF8String"), -1, &ppStmt, 0))
  {
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __59__NPKGizmoDatabase__updateEncodedImageSetsDuringMigration___block_invoke;
    v7[3] = &unk_24CFEB328;
    v7[4] = self;
    v7[5] = &v9;
    v7[6] = ppStmt;
    objc_msgSend(v4, "enumerateObjectsUsingBlock:", v7);
  }
  v5 = *((_BYTE *)v10 + 24);
  _Block_object_dispose(&v9, 8);

  return v5;
}

void __59__NPKGizmoDatabase__updateEncodedImageSetsDuringMigration___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  void *v7;
  void *v8;
  sqlite3_stmt *v9;
  id v10;
  sqlite3_stmt *v11;
  id v12;
  id v13;

  v6 = a2;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("encodedPassWithoutImageSets"));
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("encodedImageSets"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("uniqueID"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
    goto LABEL_5;
  if (!v13)
    goto LABEL_5;
  if (!v7)
    goto LABEL_5;
  objc_msgSend(*(id *)(a1 + 32), "_verifyPassDataIsUnarchivedCorrectlyWithData:forPassWithUniqueID:", v13, v8);
  v9 = *(sqlite3_stmt **)(a1 + 48);
  v10 = objc_retainAutorelease(v13);
  sqlite3_bind_blob(v9, 1, (const void *)objc_msgSend(v10, "bytes"), objc_msgSend(v10, "length"), (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
  v11 = *(sqlite3_stmt **)(a1 + 48);
  v12 = objc_retainAutorelease(v7);
  sqlite3_bind_blob(v11, 2, (const void *)objc_msgSend(v12, "bytes"), objc_msgSend(v12, "length"), (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
  sqlite3_bind_text(*(sqlite3_stmt **)(a1 + 48), 3, (const char *)objc_msgSend(objc_retainAutorelease(v8), "UTF8String"), -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
  if (sqlite3_step(*(sqlite3_stmt **)(a1 + 48)) != 101)
  {
LABEL_5:
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
    *a4 = 1;
  }
  sqlite3_clear_bindings(*(sqlite3_stmt **)(a1 + 48));
  sqlite3_reset(*(sqlite3_stmt **)(a1 + 48));

}

- (BOOL)_repairEncodedImagesDuringMigration:(id)a3
{
  id v4;
  int v5;
  char v6;
  _QWORD v8[7];
  sqlite3_stmt *v9;
  sqlite3_stmt *ppStmt;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 1;
  ppStmt = 0;
  v5 = sqlite3_prepare_v2(-[NPKGizmoDatabase database](self, "database"), (const char *)objc_msgSend(CFSTR("UPDATE pass SET logo_image=? WHERE unique_id=?"), "UTF8String"), -1, &ppStmt, 0);
  v9 = 0;
  if (!(v5 | sqlite3_prepare_v2(-[NPKGizmoDatabase database](self, "database"), (const char *)objc_msgSend(CFSTR("UPDATE pass SET background_image=? WHERE unique_id=?"), "UTF8String"), -1, &v9, 0)))
  {
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __56__NPKGizmoDatabase__repairEncodedImagesDuringMigration___block_invoke;
    v8[3] = &unk_24CFEB350;
    v8[4] = &v11;
    v8[5] = ppStmt;
    v8[6] = v9;
    objc_msgSend(v4, "enumerateObjectsUsingBlock:", v8);
  }
  v6 = *((_BYTE *)v12 + 24);
  _Block_object_dispose(&v11, 8);

  return v6;
}

void __56__NPKGizmoDatabase__repairEncodedImagesDuringMigration___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  void *v7;
  void *v8;
  sqlite3_stmt *v9;
  id v10;
  sqlite3_stmt *v11;
  id v12;
  id v13;

  v6 = a2;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("encodedLogoImageData"));
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("encodedBackgroundImageData"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("uniqueID"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    if (v13)
    {
      v9 = *(sqlite3_stmt **)(a1 + 40);
      v10 = objc_retainAutorelease(v13);
      sqlite3_bind_blob(v9, 1, (const void *)objc_msgSend(v10, "bytes"), objc_msgSend(v10, "length"), (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
      sqlite3_bind_text(*(sqlite3_stmt **)(a1 + 40), 2, (const char *)objc_msgSend(objc_retainAutorelease(v8), "UTF8String"), -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
      if (sqlite3_step(*(sqlite3_stmt **)(a1 + 40)) != 101)
      {
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
        *a4 = 1;
      }
      sqlite3_clear_bindings(*(sqlite3_stmt **)(a1 + 40));
      sqlite3_reset(*(sqlite3_stmt **)(a1 + 40));
    }
    if (v7)
    {
      v11 = *(sqlite3_stmt **)(a1 + 48);
      v12 = objc_retainAutorelease(v7);
      sqlite3_bind_blob(v11, 1, (const void *)objc_msgSend(v12, "bytes"), objc_msgSend(v12, "length"), (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
      sqlite3_bind_text(*(sqlite3_stmt **)(a1 + 48), 2, (const char *)objc_msgSend(objc_retainAutorelease(v8), "UTF8String"), -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
      if (sqlite3_step(*(sqlite3_stmt **)(a1 + 48)) != 101)
      {
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
        *a4 = 1;
      }
      sqlite3_clear_bindings(*(sqlite3_stmt **)(a1 + 48));
      sqlite3_reset(*(sqlite3_stmt **)(a1 + 48));
    }
  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
    *a4 = 1;
  }

}

- (BOOL)_updateIssuerCountryCodesDuringMigration:(id)a3
{
  id v4;
  char v5;
  _QWORD v7[6];
  sqlite3_stmt *ppStmt;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  char v12;

  v4 = a3;
  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 1;
  ppStmt = 0;
  if (!sqlite3_prepare_v2(-[NPKGizmoDatabase database](self, "database"), (const char *)objc_msgSend(CFSTR("UPDATE pass SET issuer_country_code=? WHERE unique_id=?"), "UTF8String"), -1, &ppStmt, 0))
  {
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __61__NPKGizmoDatabase__updateIssuerCountryCodesDuringMigration___block_invoke;
    v7[3] = &unk_24CFEB300;
    v7[4] = &v9;
    v7[5] = ppStmt;
    objc_msgSend(v4, "enumerateObjectsUsingBlock:", v7);
  }
  v5 = *((_BYTE *)v10 + 24);
  _Block_object_dispose(&v9, 8);

  return v5;
}

void __61__NPKGizmoDatabase__updateIssuerCountryCodesDuringMigration___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  void *v7;
  sqlite3_stmt *v8;
  id v9;

  v6 = a2;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("issuerCountryCode"));
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("uniqueID"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
    goto LABEL_6;
  v8 = *(sqlite3_stmt **)(a1 + 40);
  if (v9)
    sqlite3_bind_text(v8, 1, (const char *)objc_msgSend(objc_retainAutorelease(v9), "UTF8String"), -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
  else
    sqlite3_bind_null(v8, 1);
  sqlite3_bind_text(*(sqlite3_stmt **)(a1 + 40), 2, (const char *)objc_msgSend(objc_retainAutorelease(v7), "UTF8String"), -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
  if (sqlite3_step(*(sqlite3_stmt **)(a1 + 40)) != 101)
  {
LABEL_6:
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
    *a4 = 1;
  }
  sqlite3_clear_bindings(*(sqlite3_stmt **)(a1 + 40));
  sqlite3_reset(*(sqlite3_stmt **)(a1 + 40));

}

- (BOOL)_updateExpressPassTypesMaskDuringMigration:(id)a3
{
  id v4;
  char v5;
  _QWORD v7[6];
  sqlite3_stmt *ppStmt;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  char v12;

  v4 = a3;
  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 1;
  ppStmt = 0;
  if (!sqlite3_prepare_v2(-[NPKGizmoDatabase database](self, "database"), (const char *)objc_msgSend(CFSTR("UPDATE pass SET express_pass_types_mask=? WHERE unique_id=?"), "UTF8String"), -1, &ppStmt, 0))
  {
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __63__NPKGizmoDatabase__updateExpressPassTypesMaskDuringMigration___block_invoke;
    v7[3] = &unk_24CFEB300;
    v7[4] = &v9;
    v7[5] = ppStmt;
    objc_msgSend(v4, "enumerateObjectsUsingBlock:", v7);
  }
  v5 = *((_BYTE *)v10 + 24);
  _Block_object_dispose(&v9, 8);

  return v5;
}

void __63__NPKGizmoDatabase__updateExpressPassTypesMaskDuringMigration___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a2;
  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("expressPassTypesMask"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
    sqlite3_bind_int64(*(sqlite3_stmt **)(a1 + 40), 1, objc_msgSend(v6, "integerValue"));
  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("uniqueID"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (!v8
    || (sqlite3_bind_text(*(sqlite3_stmt **)(a1 + 40), 2, (const char *)objc_msgSend(objc_retainAutorelease(v8), "UTF8String"), -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL), sqlite3_step(*(sqlite3_stmt **)(a1 + 40)) != 101))
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
    *a4 = 1;
  }
  sqlite3_clear_bindings(*(sqlite3_stmt **)(a1 + 40));
  sqlite3_reset(*(sqlite3_stmt **)(a1 + 40));

}

- (BOOL)_updateDevicePaymentApplicationsDuringMigration:(id)a3
{
  id v4;
  char v5;
  _QWORD v7[6];
  sqlite3_stmt *ppStmt;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  char v12;

  v4 = a3;
  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 1;
  ppStmt = 0;
  if (!sqlite3_prepare_v2(-[NPKGizmoDatabase database](self, "database"), (const char *)objc_msgSend(CFSTR("UPDATE pass SET device_payment_applications=? WHERE unique_id=?"), "UTF8String"), -1, &ppStmt, 0))
  {
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __68__NPKGizmoDatabase__updateDevicePaymentApplicationsDuringMigration___block_invoke;
    v7[3] = &unk_24CFEB300;
    v7[4] = &v9;
    v7[5] = ppStmt;
    objc_msgSend(v4, "enumerateObjectsUsingBlock:", v7);
  }
  v5 = *((_BYTE *)v10 + 24);
  _Block_object_dispose(&v9, 8);

  return v5;
}

void __68__NPKGizmoDatabase__updateDevicePaymentApplicationsDuringMigration___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  void *v7;
  void *v8;
  sqlite3_stmt *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a2;
  objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("devicePaymentApplications"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6
    && (objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("devicePaymentApplications")),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        NPKSecureArchiveObject(v7),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v7,
        v8))
  {
    v9 = *(sqlite3_stmt **)(a1 + 40);
    v10 = objc_retainAutorelease(v8);
    sqlite3_bind_blob(v9, 1, (const void *)objc_msgSend(v10, "bytes"), objc_msgSend(v10, "length"), (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);

  }
  else
  {
    sqlite3_bind_null(*(sqlite3_stmt **)(a1 + 40), 1);
  }
  objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("uniqueID"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (!v11
    || (sqlite3_bind_text(*(sqlite3_stmt **)(a1 + 40), 2, (const char *)objc_msgSend(objc_retainAutorelease(v11), "UTF8String"), -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL), sqlite3_step(*(sqlite3_stmt **)(a1 + 40)) != 101))
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
    *a4 = 1;
  }
  sqlite3_clear_bindings(*(sqlite3_stmt **)(a1 + 40));
  sqlite3_reset(*(sqlite3_stmt **)(a1 + 40));

}

- (BOOL)_updateIngestedDatesDuringMigration:(id)a3
{
  id v4;
  char v5;
  _QWORD v7[6];
  sqlite3_stmt *ppStmt;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  char v12;

  v4 = a3;
  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 1;
  ppStmt = 0;
  if (!sqlite3_prepare_v2(-[NPKGizmoDatabase database](self, "database"), (const char *)objc_msgSend(CFSTR("UPDATE pass SET ingested_date=? WHERE unique_id=?"), "UTF8String"), -1, &ppStmt, 0))
  {
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __56__NPKGizmoDatabase__updateIngestedDatesDuringMigration___block_invoke;
    v7[3] = &unk_24CFEB300;
    v7[4] = &v9;
    v7[5] = ppStmt;
    objc_msgSend(v4, "enumerateObjectsUsingBlock:", v7);
  }
  v5 = *((_BYTE *)v10 + 24);
  _Block_object_dispose(&v9, 8);

  return v5;
}

void __56__NPKGizmoDatabase__updateIngestedDatesDuringMigration___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  void *v7;
  sqlite3_stmt *v8;
  double v9;
  void *v10;
  id v11;

  v6 = a2;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("ingestedDate"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v8 = *(sqlite3_stmt **)(a1 + 40);
  v11 = v7;
  objc_msgSend(v7, "timeIntervalSinceReferenceDate");
  sqlite3_bind_int(v8, 1, (int)v9);
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("uniqueID"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10
    || (sqlite3_bind_text(*(sqlite3_stmt **)(a1 + 40), 2, (const char *)objc_msgSend(objc_retainAutorelease(v10), "UTF8String"), -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL), sqlite3_step(*(sqlite3_stmt **)(a1 + 40)) != 101))
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
    *a4 = 1;
  }
  sqlite3_clear_bindings(*(sqlite3_stmt **)(a1 + 40));
  sqlite3_reset(*(sqlite3_stmt **)(a1 + 40));

}

- (BOOL)_updateCompleteLocalHashesDuringMigration:(id)a3
{
  id v4;
  char v5;
  _QWORD v7[6];
  sqlite3_stmt *ppStmt;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  char v12;

  v4 = a3;
  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 1;
  ppStmt = 0;
  if (!sqlite3_prepare_v2(-[NPKGizmoDatabase database](self, "database"), (const char *)objc_msgSend(CFSTR("UPDATE pass SET complete_hash=?, complete_hashes=? WHERE unique_id=?"), "UTF8String"), -1, &ppStmt, 0))
  {
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __62__NPKGizmoDatabase__updateCompleteLocalHashesDuringMigration___block_invoke;
    v7[3] = &unk_24CFEB300;
    v7[4] = &v9;
    v7[5] = ppStmt;
    objc_msgSend(v4, "enumerateObjectsUsingBlock:", v7);
  }
  v5 = *((_BYTE *)v10 + 24);
  _Block_object_dispose(&v9, 8);

  return v5;
}

void __62__NPKGizmoDatabase__updateCompleteLocalHashesDuringMigration___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  void *v7;
  void *v8;
  sqlite3_stmt *v9;
  id v10;
  void *v11;
  sqlite3_stmt *v12;
  id v13;
  id v14;

  v6 = a2;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("completeHash"));
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("completeLocalHashes"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("uniqueID"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
    goto LABEL_10;
  v9 = *(sqlite3_stmt **)(a1 + 40);
  if (v14)
  {
    v10 = objc_retainAutorelease(v14);
    sqlite3_bind_blob(v9, 1, (const void *)objc_msgSend(v10, "bytes"), objc_msgSend(v10, "length"), (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
    if (!v7)
      goto LABEL_8;
  }
  else
  {
    sqlite3_bind_null(v9, 1);
    if (!v7)
      goto LABEL_8;
  }
  NPKSecureArchiveObject(v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    v12 = *(sqlite3_stmt **)(a1 + 40);
    v13 = objc_retainAutorelease(v11);
    sqlite3_bind_blob(v12, 2, (const void *)objc_msgSend(v13, "bytes"), objc_msgSend(v13, "length"), (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);

    goto LABEL_9;
  }
LABEL_8:
  sqlite3_bind_null(*(sqlite3_stmt **)(a1 + 40), 2);
LABEL_9:
  sqlite3_bind_text(*(sqlite3_stmt **)(a1 + 40), 3, (const char *)objc_msgSend(objc_retainAutorelease(v8), "UTF8String"), -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
  if (sqlite3_step(*(sqlite3_stmt **)(a1 + 40)) != 101)
  {
LABEL_10:
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
    *a4 = 1;
  }
  sqlite3_clear_bindings(*(sqlite3_stmt **)(a1 + 40));
  sqlite3_reset(*(sqlite3_stmt **)(a1 + 40));

}

- (BOOL)_updateFrontAndBackFieldBucketsDuringMigration:(id)a3
{
  id v4;
  char v5;
  _QWORD v7[6];
  sqlite3_stmt *ppStmt;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  char v12;

  v4 = a3;
  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 1;
  ppStmt = 0;
  if (!sqlite3_prepare_v2(-[NPKGizmoDatabase database](self, "database"), (const char *)objc_msgSend(CFSTR("UPDATE pass SET front_field_buckets=?, back_field_buckets=? WHERE unique_id=?"), "UTF8String"), -1, &ppStmt, 0))
  {
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __67__NPKGizmoDatabase__updateFrontAndBackFieldBucketsDuringMigration___block_invoke;
    v7[3] = &unk_24CFEB300;
    v7[4] = &v9;
    v7[5] = ppStmt;
    objc_msgSend(v4, "enumerateObjectsUsingBlock:", v7);
  }
  v5 = *((_BYTE *)v10 + 24);
  _Block_object_dispose(&v9, 8);

  return v5;
}

void __67__NPKGizmoDatabase__updateFrontAndBackFieldBucketsDuringMigration___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  sqlite3_stmt *v10;
  id v11;
  void *v12;
  sqlite3_stmt *v13;
  id v14;
  id v15;

  v6 = a2;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("frontFieldBuckets"));
  v15 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("backFieldBuckets"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("uniqueID"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
    goto LABEL_11;
  if (v15 && (NPKSecureArchiveObject(v15), (v9 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    v10 = *(sqlite3_stmt **)(a1 + 40);
    v11 = objc_retainAutorelease(v9);
    sqlite3_bind_blob(v10, 1, (const void *)objc_msgSend(v11, "bytes"), objc_msgSend(v11, "length"), (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);

    if (!v7)
      goto LABEL_9;
  }
  else
  {
    sqlite3_bind_null(*(sqlite3_stmt **)(a1 + 40), 1);
    if (!v7)
      goto LABEL_9;
  }
  NPKSecureArchiveObject(v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = *(sqlite3_stmt **)(a1 + 40);
    v14 = objc_retainAutorelease(v12);
    sqlite3_bind_blob(v13, 2, (const void *)objc_msgSend(v14, "bytes"), objc_msgSend(v14, "length"), (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);

    goto LABEL_10;
  }
LABEL_9:
  sqlite3_bind_null(*(sqlite3_stmt **)(a1 + 40), 2);
LABEL_10:
  sqlite3_bind_text(*(sqlite3_stmt **)(a1 + 40), 3, (const char *)objc_msgSend(objc_retainAutorelease(v8), "UTF8String"), -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
  if (sqlite3_step(*(sqlite3_stmt **)(a1 + 40)) != 101)
  {
LABEL_11:
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
    *a4 = 1;
  }
  sqlite3_clear_bindings(*(sqlite3_stmt **)(a1 + 40));
  sqlite3_reset(*(sqlite3_stmt **)(a1 + 40));

}

- (BOOL)_updateAvailableActionsDuringMigration:(id)a3
{
  id v4;
  char v5;
  _QWORD v7[6];
  sqlite3_stmt *ppStmt;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  char v12;

  v4 = a3;
  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 1;
  ppStmt = 0;
  if (!sqlite3_prepare_v2(-[NPKGizmoDatabase database](self, "database"), (const char *)objc_msgSend(CFSTR("UPDATE pass SET available_actions=? WHERE unique_id=?"), "UTF8String"), -1, &ppStmt, 0))
  {
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __59__NPKGizmoDatabase__updateAvailableActionsDuringMigration___block_invoke;
    v7[3] = &unk_24CFEB300;
    v7[4] = &v9;
    v7[5] = ppStmt;
    objc_msgSend(v4, "enumerateObjectsUsingBlock:", v7);
  }
  v5 = *((_BYTE *)v10 + 24);
  _Block_object_dispose(&v9, 8);

  return v5;
}

void __59__NPKGizmoDatabase__updateAvailableActionsDuringMigration___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  void *v7;
  void *v8;
  sqlite3_stmt *v9;
  id v10;
  id v11;

  v6 = a2;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("availableActions"));
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("uniqueID"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
    goto LABEL_7;
  if (v11 && (NPKSecureArchiveObject(v11), (v8 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    v9 = *(sqlite3_stmt **)(a1 + 40);
    v10 = objc_retainAutorelease(v8);
    sqlite3_bind_blob(v9, 1, (const void *)objc_msgSend(v10, "bytes"), objc_msgSend(v10, "length"), (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);

  }
  else
  {
    sqlite3_bind_null(*(sqlite3_stmt **)(a1 + 40), 1);
  }
  sqlite3_bind_text(*(sqlite3_stmt **)(a1 + 40), 2, (const char *)objc_msgSend(objc_retainAutorelease(v7), "UTF8String"), -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
  if (sqlite3_step(*(sqlite3_stmt **)(a1 + 40)) != 101)
  {
LABEL_7:
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
    *a4 = 1;
  }
  sqlite3_clear_bindings(*(sqlite3_stmt **)(a1 + 40));
  sqlite3_reset(*(sqlite3_stmt **)(a1 + 40));

}

- (BOOL)_updateOrganizationNamesDuringMigration:(id)a3
{
  id v4;
  char v5;
  _QWORD v7[6];
  sqlite3_stmt *ppStmt;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  char v12;

  v4 = a3;
  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 1;
  ppStmt = 0;
  if (!sqlite3_prepare_v2(-[NPKGizmoDatabase database](self, "database"), (const char *)objc_msgSend(CFSTR("UPDATE pass SET organization_name=? WHERE unique_id=?"), "UTF8String"), -1, &ppStmt, 0))
  {
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __60__NPKGizmoDatabase__updateOrganizationNamesDuringMigration___block_invoke;
    v7[3] = &unk_24CFEB300;
    v7[4] = &v9;
    v7[5] = ppStmt;
    objc_msgSend(v4, "enumerateObjectsUsingBlock:", v7);
  }
  v5 = *((_BYTE *)v10 + 24);
  _Block_object_dispose(&v9, 8);

  return v5;
}

void __60__NPKGizmoDatabase__updateOrganizationNamesDuringMigration___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  void *v7;
  sqlite3_stmt *v8;
  id v9;

  v6 = a2;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("organizationName"));
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("uniqueID"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
    goto LABEL_6;
  v8 = *(sqlite3_stmt **)(a1 + 40);
  if (v9)
    sqlite3_bind_text(v8, 1, (const char *)objc_msgSend(objc_retainAutorelease(v9), "UTF8String"), -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
  else
    sqlite3_bind_null(v8, 1);
  sqlite3_bind_text(*(sqlite3_stmt **)(a1 + 40), 2, (const char *)objc_msgSend(objc_retainAutorelease(v7), "UTF8String"), -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
  if (sqlite3_step(*(sqlite3_stmt **)(a1 + 40)) != 101)
  {
LABEL_6:
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
    *a4 = 1;
  }
  sqlite3_clear_bindings(*(sqlite3_stmt **)(a1 + 40));
  sqlite3_reset(*(sqlite3_stmt **)(a1 + 40));

}

- (BOOL)_updateLocalizedDescriptionDuringMigration:(id)a3
{
  id v4;
  char v5;
  _QWORD v7[6];
  sqlite3_stmt *ppStmt;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  char v12;

  v4 = a3;
  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 1;
  ppStmt = 0;
  if (!sqlite3_prepare_v2(-[NPKGizmoDatabase database](self, "database"), (const char *)objc_msgSend(CFSTR("UPDATE pass SET localized_description=? WHERE unique_id=?"), "UTF8String"), -1, &ppStmt, 0))
  {
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __63__NPKGizmoDatabase__updateLocalizedDescriptionDuringMigration___block_invoke;
    v7[3] = &unk_24CFEB300;
    v7[4] = &v9;
    v7[5] = ppStmt;
    objc_msgSend(v4, "enumerateObjectsUsingBlock:", v7);
  }
  v5 = *((_BYTE *)v10 + 24);
  _Block_object_dispose(&v9, 8);

  return v5;
}

void __63__NPKGizmoDatabase__updateLocalizedDescriptionDuringMigration___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  void *v7;
  sqlite3_stmt *v8;
  id v9;

  v6 = a2;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("localizedDescription"));
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("uniqueID"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
    goto LABEL_6;
  v8 = *(sqlite3_stmt **)(a1 + 40);
  if (v9)
    sqlite3_bind_text(v8, 1, (const char *)objc_msgSend(objc_retainAutorelease(v9), "UTF8String"), -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
  else
    sqlite3_bind_null(v8, 1);
  sqlite3_bind_text(*(sqlite3_stmt **)(a1 + 40), 2, (const char *)objc_msgSend(objc_retainAutorelease(v7), "UTF8String"), -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
  if (sqlite3_step(*(sqlite3_stmt **)(a1 + 40)) != 101)
  {
LABEL_6:
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
    *a4 = 1;
  }
  sqlite3_clear_bindings(*(sqlite3_stmt **)(a1 + 40));
  sqlite3_reset(*(sqlite3_stmt **)(a1 + 40));

}

- (BOOL)_updateEffectivePaymentApplicationStateDuringMigration:(id)a3
{
  id v4;
  char v5;
  _QWORD v7[6];
  sqlite3_stmt *ppStmt;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  char v12;

  v4 = a3;
  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 1;
  ppStmt = 0;
  if (!sqlite3_prepare_v2(-[NPKGizmoDatabase database](self, "database"), (const char *)objc_msgSend(CFSTR("UPDATE pass SET effective_payment_application_state=? WHERE unique_id=?"), "UTF8String"), -1, &ppStmt, 0))
  {
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __75__NPKGizmoDatabase__updateEffectivePaymentApplicationStateDuringMigration___block_invoke;
    v7[3] = &unk_24CFEB300;
    v7[4] = &v9;
    v7[5] = ppStmt;
    objc_msgSend(v4, "enumerateObjectsUsingBlock:", v7);
  }
  v5 = *((_BYTE *)v10 + 24);
  _Block_object_dispose(&v9, 8);

  return v5;
}

void __75__NPKGizmoDatabase__updateEffectivePaymentApplicationStateDuringMigration___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  void *v7;
  int v8;
  void *v9;
  id v10;

  v10 = a2;
  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("effectivePaymentApplicationState"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
    v8 = objc_msgSend(v6, "intValue");
  else
    v8 = 0;
  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("uniqueID"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9
    || (sqlite3_bind_int(*(sqlite3_stmt **)(a1 + 40), 1, v8),
        sqlite3_bind_text(*(sqlite3_stmt **)(a1 + 40), 2, (const char *)objc_msgSend(objc_retainAutorelease(v9), "UTF8String"), -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL), sqlite3_step(*(sqlite3_stmt **)(a1 + 40)) != 101))
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
    *a4 = 1;
  }
  sqlite3_clear_bindings(*(sqlite3_stmt **)(a1 + 40));
  sqlite3_reset(*(sqlite3_stmt **)(a1 + 40));

}

- (BOOL)_updateHasUserSelectableContactlessPaymentApplications:(id)a3
{
  id v4;
  char v5;
  _QWORD v7[6];
  sqlite3_stmt *ppStmt;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  char v12;

  v4 = a3;
  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 1;
  ppStmt = 0;
  if (!sqlite3_prepare_v2(-[NPKGizmoDatabase database](self, "database"), (const char *)objc_msgSend(CFSTR("UPDATE pass SET has_user_selectable_payment_applications=? WHERE unique_id=?"), "UTF8String"), -1, &ppStmt, 0))
  {
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __75__NPKGizmoDatabase__updateHasUserSelectableContactlessPaymentApplications___block_invoke;
    v7[3] = &unk_24CFEB300;
    v7[4] = &v9;
    v7[5] = ppStmt;
    objc_msgSend(v4, "enumerateObjectsUsingBlock:", v7);
  }
  v5 = *((_BYTE *)v10 + 24);
  _Block_object_dispose(&v9, 8);

  return v5;
}

void __75__NPKGizmoDatabase__updateHasUserSelectableContactlessPaymentApplications___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  void *v7;
  int v8;
  void *v9;
  id v10;

  v10 = a2;
  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("hasUserSelectableContactlessPaymentApplications"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
    v8 = objc_msgSend(v6, "intValue");
  else
    v8 = 0;
  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("uniqueID"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9
    || (sqlite3_bind_int(*(sqlite3_stmt **)(a1 + 40), 1, v8),
        sqlite3_bind_text(*(sqlite3_stmt **)(a1 + 40), 2, (const char *)objc_msgSend(objc_retainAutorelease(v9), "UTF8String"), -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL), sqlite3_step(*(sqlite3_stmt **)(a1 + 40)) != 101))
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
    *a4 = 1;
  }
  sqlite3_clear_bindings(*(sqlite3_stmt **)(a1 + 40));
  sqlite3_reset(*(sqlite3_stmt **)(a1 + 40));

}

- (BOOL)_updateEncodedPaymentPassDuringMigration:(id)a3
{
  id v4;
  char v5;
  _QWORD v7[7];
  sqlite3_stmt *ppStmt;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  char v12;

  v4 = a3;
  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 1;
  ppStmt = 0;
  if (!sqlite3_prepare_v2(-[NPKGizmoDatabase database](self, "database"), (const char *)objc_msgSend(CFSTR("UPDATE pass SET encoded_pass=? WHERE unique_id=?"), "UTF8String"), -1, &ppStmt, 0))
  {
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __61__NPKGizmoDatabase__updateEncodedPaymentPassDuringMigration___block_invoke;
    v7[3] = &unk_24CFEB328;
    v7[4] = self;
    v7[5] = &v9;
    v7[6] = ppStmt;
    objc_msgSend(v4, "enumerateObjectsUsingBlock:", v7);
  }
  v5 = *((_BYTE *)v10 + 24);
  _Block_object_dispose(&v9, 8);

  return v5;
}

void __61__NPKGizmoDatabase__updateEncodedPaymentPassDuringMigration___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  void *v7;
  sqlite3_stmt *v8;
  id v9;
  id v10;

  v6 = a2;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("encodedPass"));
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("uniqueID"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7
    || v10
    && (objc_msgSend(*(id *)(a1 + 32), "_verifyPassDataIsUnarchivedCorrectlyWithData:forPassWithUniqueID:", v10, v7),
        v8 = *(sqlite3_stmt **)(a1 + 48),
        v9 = objc_retainAutorelease(v10),
        sqlite3_bind_blob(v8, 1, (const void *)objc_msgSend(v9, "bytes"), objc_msgSend(v9, "length"), (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL), sqlite3_bind_text(*(sqlite3_stmt **)(a1 + 48), 2, (const char *)objc_msgSend(objc_retainAutorelease(v7), "UTF8String"), -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL), sqlite3_step(*(sqlite3_stmt **)(a1 + 48)) != 101))
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
    *a4 = 1;
  }
  sqlite3_clear_bindings(*(sqlite3_stmt **)(a1 + 48));
  sqlite3_reset(*(sqlite3_stmt **)(a1 + 48));

}

- (BOOL)_updateHasStoredValueDuringMigration:(id)a3
{
  id v4;
  char v5;
  _QWORD v7[6];
  sqlite3_stmt *ppStmt;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  char v12;

  v4 = a3;
  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 1;
  ppStmt = 0;
  if (!sqlite3_prepare_v2(-[NPKGizmoDatabase database](self, "database"), (const char *)objc_msgSend(CFSTR("UPDATE pass SET has_stored_value=? WHERE unique_id=?"), "UTF8String"), -1, &ppStmt, 0))
  {
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __57__NPKGizmoDatabase__updateHasStoredValueDuringMigration___block_invoke;
    v7[3] = &unk_24CFEB300;
    v7[4] = &v9;
    v7[5] = ppStmt;
    objc_msgSend(v4, "enumerateObjectsUsingBlock:", v7);
  }
  v5 = *((_BYTE *)v10 + 24);
  _Block_object_dispose(&v9, 8);

  return v5;
}

void __57__NPKGizmoDatabase__updateHasStoredValueDuringMigration___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  void *v7;
  int v8;
  void *v9;
  id v10;

  v10 = a2;
  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("hasStoredValue"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
    v8 = objc_msgSend(v6, "intValue");
  else
    v8 = 0;
  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("uniqueID"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9
    || (sqlite3_bind_int(*(sqlite3_stmt **)(a1 + 40), 1, v8),
        sqlite3_bind_text(*(sqlite3_stmt **)(a1 + 40), 2, (const char *)objc_msgSend(objc_retainAutorelease(v9), "UTF8String"), -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL), sqlite3_step(*(sqlite3_stmt **)(a1 + 40)) != 101))
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
    *a4 = 1;
  }
  sqlite3_clear_bindings(*(sqlite3_stmt **)(a1 + 40));
  sqlite3_reset(*(sqlite3_stmt **)(a1 + 40));

}

- (BOOL)_updateSettingsDuringMigration:(id)a3
{
  id v4;
  char v5;
  _QWORD v7[6];
  sqlite3_stmt *ppStmt;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  char v12;

  v4 = a3;
  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 1;
  ppStmt = 0;
  if (!sqlite3_prepare_v2(-[NPKGizmoDatabase database](self, "database"), (const char *)objc_msgSend(CFSTR("UPDATE pass SET settings=? WHERE unique_id=?"), "UTF8String"), -1, &ppStmt, 0))
  {
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __51__NPKGizmoDatabase__updateSettingsDuringMigration___block_invoke;
    v7[3] = &unk_24CFEB300;
    v7[4] = &v9;
    v7[5] = ppStmt;
    objc_msgSend(v4, "enumerateObjectsUsingBlock:", v7);
  }
  v5 = *((_BYTE *)v10 + 24);
  _Block_object_dispose(&v9, 8);

  return v5;
}

void __51__NPKGizmoDatabase__updateSettingsDuringMigration___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  void *v7;
  sqlite3_int64 v8;
  void *v9;
  id v10;

  v10 = a2;
  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("settings"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
    v8 = (int)objc_msgSend(v6, "intValue");
  else
    v8 = 0;
  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("uniqueID"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9
    || (sqlite3_bind_int64(*(sqlite3_stmt **)(a1 + 40), 1, v8),
        sqlite3_bind_text(*(sqlite3_stmt **)(a1 + 40), 2, (const char *)objc_msgSend(objc_retainAutorelease(v9), "UTF8String"), -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL), sqlite3_step(*(sqlite3_stmt **)(a1 + 40)) != 101))
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
    *a4 = 1;
  }
  sqlite3_clear_bindings(*(sqlite3_stmt **)(a1 + 40));
  sqlite3_reset(*(sqlite3_stmt **)(a1 + 40));

}

- (BOOL)_updateCompleteRemoteHashesDuringMigration
{
  sqlite3_stmt *ppStmt;

  ppStmt = 0;
  return !sqlite3_prepare_v2(-[NPKGizmoDatabase database](self, "database"), (const char *)objc_msgSend(CFSTR("UPDATE pass SET complete_remote_hashes=complete_hashes"), "UTF8String"), -1, &ppStmt, 0)&& sqlite3_step(ppStmt) == 101;
}

- (BOOL)_updateTransactionSourceIdentifiersDuringMigration:(id)a3
{
  id v4;
  int v5;
  int v6;
  int v7;
  char v8;
  _QWORD v10[8];
  sqlite3_stmt *pStmt;
  sqlite3_stmt *v12;
  sqlite3_stmt *ppStmt;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  char v17;

  v4 = a3;
  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 1;
  ppStmt = 0;
  v5 = sqlite3_prepare_v2(-[NPKGizmoDatabase database](self, "database"), (const char *)objc_msgSend(CFSTR("UPDATE transactions SET transaction_source_identifier=? WHERE pass_unique_id=?"), "UTF8String"), -1, &ppStmt, 0);
  v12 = 0;
  v6 = sqlite3_prepare_v2(-[NPKGizmoDatabase database](self, "database"), (const char *)objc_msgSend(CFSTR("UPDATE ephemeral_transactions SET transaction_source_identifier=? WHERE pass_unique_id=?"), "UTF8String"), -1, &v12, 0);
  pStmt = 0;
  v7 = sqlite3_prepare_v2(-[NPKGizmoDatabase database](self, "database"), (const char *)objc_msgSend(CFSTR("INSERT INTO transaction_source (transaction_source_identifier, type, pass_unique_id) VALUES (?, ?, ?)"), "UTF8String"), -1, &pStmt, 0);
  if (!v5 && !v6 && !v7)
  {
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __71__NPKGizmoDatabase__updateTransactionSourceIdentifiersDuringMigration___block_invoke;
    v10[3] = &unk_24CFEB378;
    v10[4] = &v14;
    v10[5] = ppStmt;
    v10[6] = v12;
    v10[7] = pStmt;
    objc_msgSend(v4, "enumerateObjectsUsingBlock:", v10);
  }
  sqlite3_finalize(ppStmt);
  sqlite3_finalize(pStmt);
  v8 = *((_BYTE *)v15 + 24);
  _Block_object_dispose(&v14, 8);

  return v8;
}

void __71__NPKGizmoDatabase__updateTransactionSourceIdentifiersDuringMigration___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  void *v7;
  void *v8;
  sqlite3_stmt *v9;
  id v10;
  sqlite3_stmt *v11;
  id v12;
  int v13;
  int v14;
  NSObject *v15;
  _BOOL4 v16;
  NSObject *v17;
  sqlite3_stmt *v18;
  id v19;
  sqlite3_stmt *v20;
  id v21;
  int v22;
  int v23;
  NSObject *v24;
  _BOOL4 v25;
  NSObject *v26;
  sqlite3_stmt *v27;
  id v28;
  sqlite3_stmt *v29;
  id v30;
  int v31;
  int v32;
  NSObject *v33;
  _BOOL4 v34;
  NSObject *v35;
  int v36;
  id v37;
  __int16 v38;
  id v39;
  __int16 v40;
  int v41;
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  v6 = a2;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("uniqueID"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("transactionSourceIdentifier"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7 && v8)
  {
    v9 = *(sqlite3_stmt **)(a1 + 40);
    v10 = objc_retainAutorelease(v8);
    sqlite3_bind_text(v9, 1, (const char *)objc_msgSend(v10, "UTF8String"), -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
    v11 = *(sqlite3_stmt **)(a1 + 40);
    v12 = objc_retainAutorelease(v7);
    sqlite3_bind_text(v11, 2, (const char *)objc_msgSend(v12, "UTF8String"), -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
    v13 = sqlite3_step(*(sqlite3_stmt **)(a1 + 40));
    if (v13 != 101)
    {
      v14 = v13;
      pk_General_log();
      v15 = objc_claimAutoreleasedReturnValue();
      v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);

      if (v16)
      {
        pk_General_log();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          v36 = 138412802;
          v37 = v12;
          v38 = 2112;
          v39 = v10;
          v40 = 1024;
          v41 = v14;
          _os_log_impl(&dword_213518000, v17, OS_LOG_TYPE_DEFAULT, "Notice: Update transactions table failed for unique ID %@ transaction source identifier %@ result %d", (uint8_t *)&v36, 0x1Cu);
        }

      }
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
      *a4 = 1;
    }
    sqlite3_clear_bindings(*(sqlite3_stmt **)(a1 + 40));
    sqlite3_reset(*(sqlite3_stmt **)(a1 + 40));
    v18 = *(sqlite3_stmt **)(a1 + 48);
    v19 = objc_retainAutorelease(v10);
    sqlite3_bind_text(v18, 1, (const char *)objc_msgSend(v19, "UTF8String"), -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
    v20 = *(sqlite3_stmt **)(a1 + 48);
    v21 = objc_retainAutorelease(v12);
    sqlite3_bind_text(v20, 2, (const char *)objc_msgSend(v21, "UTF8String"), -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
    v22 = sqlite3_step(*(sqlite3_stmt **)(a1 + 48));
    if (v22 != 101)
    {
      v23 = v22;
      pk_General_log();
      v24 = objc_claimAutoreleasedReturnValue();
      v25 = os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT);

      if (v25)
      {
        pk_General_log();
        v26 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
        {
          v36 = 138412802;
          v37 = v21;
          v38 = 2112;
          v39 = v19;
          v40 = 1024;
          v41 = v23;
          _os_log_impl(&dword_213518000, v26, OS_LOG_TYPE_DEFAULT, "Notice: Update ephemeral transactions table failed for unique ID %@ transaction source identifier %@ result %d", (uint8_t *)&v36, 0x1Cu);
        }

      }
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
      *a4 = 1;
    }
    sqlite3_clear_bindings(*(sqlite3_stmt **)(a1 + 48));
    sqlite3_reset(*(sqlite3_stmt **)(a1 + 48));
    v27 = *(sqlite3_stmt **)(a1 + 56);
    v28 = objc_retainAutorelease(v19);
    sqlite3_bind_text(v27, 1, (const char *)objc_msgSend(v28, "UTF8String"), -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
    sqlite3_bind_int(*(sqlite3_stmt **)(a1 + 56), 2, 0);
    v29 = *(sqlite3_stmt **)(a1 + 56);
    v30 = objc_retainAutorelease(v21);
    sqlite3_bind_text(v29, 3, (const char *)objc_msgSend(v30, "UTF8String"), -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
    v31 = sqlite3_step(*(sqlite3_stmt **)(a1 + 56));
    if (v31 != 101)
    {
      v32 = v31;
      pk_General_log();
      v33 = objc_claimAutoreleasedReturnValue();
      v34 = os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT);

      if (v34)
      {
        pk_General_log();
        v35 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
        {
          v36 = 138412802;
          v37 = v30;
          v38 = 2112;
          v39 = v28;
          v40 = 1024;
          v41 = v32;
          _os_log_impl(&dword_213518000, v35, OS_LOG_TYPE_DEFAULT, "Notice: Insert into transaction source table failed for unique ID %@ transaction source identifier %@ result %d", (uint8_t *)&v36, 0x1Cu);
        }

      }
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
      *a4 = 1;
    }
    sqlite3_clear_bindings(*(sqlite3_stmt **)(a1 + 56));
    sqlite3_reset(*(sqlite3_stmt **)(a1 + 56));
  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
    *a4 = 1;
  }

}

- (id)_passForUniqueIDLocked:(id)a3 includeImageSets:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  sqlite3_stmt *v7;
  sqlite3_stmt *v8;
  id v9;
  const void *v10;
  int v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  NSObject *v18;
  _BOOL4 v19;
  NSObject *v20;
  void *v21;
  const void *v22;
  int v23;
  void *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  int v29;
  void *v30;
  void *v31;
  void *v32;
  int v34;
  const char *v35;
  __int16 v36;
  void *v37;
  uint64_t v38;

  v4 = a4;
  v38 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  if (v4)
    v7 = -[NPKGizmoDatabase selectPassAndImageSetsDataStatement](self, "selectPassAndImageSetsDataStatement");
  else
    v7 = -[NPKGizmoDatabase selectPassDataStatement](self, "selectPassDataStatement");
  v8 = v7;
  v9 = objc_retainAutorelease(v6);
  sqlite3_bind_text(v8, 1, (const char *)objc_msgSend(v9, "UTF8String"), -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
  if (sqlite3_step(v8) == 100)
  {
    v10 = sqlite3_column_blob(v8, 0);
    v11 = sqlite3_column_bytes(v8, 0);
    v12 = (void *)MEMORY[0x2199B65AC]();
    objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", v10, v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_opt_class();
    NPKSecureUnarchiveObject(v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_autoreleasePoolPop(v12);
    if (v15)
    {
      if (os_variant_has_internal_ui())
      {
        objc_msgSend(v15, "passTypeIdentifier");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "length");

        if (!v17)
        {
          pk_General_log();
          v18 = objc_claimAutoreleasedReturnValue();
          v19 = os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT);

          if (v19)
          {
            pk_General_log();
            v20 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
            {
              objc_msgSend(v15, "uniqueID");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              v34 = 136315394;
              v35 = "-[NPKGizmoDatabase _passForUniqueIDLocked:includeImageSets:]";
              v36 = 2112;
              v37 = v21;
              _os_log_impl(&dword_213518000, v20, OS_LOG_TYPE_DEFAULT, "Warning: %s encoded_pass Unarchived pass with unique identifier %@ is missing the type identifier", (uint8_t *)&v34, 0x16u);

            }
          }
        }
      }
      if (v4)
      {
        v22 = sqlite3_column_blob(v8, 1);
        v23 = sqlite3_column_bytes(v8, 1);
        v24 = (void *)MEMORY[0x2199B65AC]();
        objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", v22, v23);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = objc_opt_class();
        NPKSecureUnarchiveObject(v25, v26);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        if (v27)
          objc_msgSend(v15, "setMissingImageSetsFromObject:", v27);

        objc_autoreleasePoolPop(v24);
      }
      objc_msgSend(v15, "paymentPass");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = objc_msgSend(v28, "hasCredentials");

      if (v29)
      {
        -[NPKGizmoDatabase _subcredentialsForPassWithUniqueIDLocked:](self, "_subcredentialsForPassWithUniqueIDLocked:", v9);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        if (v30)
        {
          objc_msgSend(v15, "paymentPass");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "devicePrimaryPaymentApplication");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "setSubcredentials:", v30);

        }
      }
    }
  }
  else
  {
    v15 = 0;
  }
  sqlite3_clear_bindings(v8);
  sqlite3_reset(v8);

  return v15;
}

- (id)_diffForUniqueIDLocked:(id)a3
{
  id v4;
  sqlite3_stmt *v5;
  id v6;
  const char *v7;
  const void *v8;
  void *v9;
  NSObject *v10;
  void *v11;

  v4 = a3;
  v5 = -[NPKGizmoDatabase selectPassDiffStatement](self, "selectPassDiffStatement");
  v6 = objc_retainAutorelease(v4);
  v7 = (const char *)objc_msgSend(v6, "UTF8String");

  sqlite3_bind_text(v5, 1, v7, -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
  if (sqlite3_step(v5) == 100)
  {
    v8 = sqlite3_column_blob(v5, 0);
    objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", v8, sqlite3_column_bytes(v5, 0));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_opt_class();
    NPKSecureUnarchiveObject(v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11 = 0;
  }
  sqlite3_clear_bindings(v5);
  sqlite3_reset(v5);
  return v11;
}

- (void)_saveDiffLocked:(id)a3 forPassWithUniqueID:(id)a4
{
  id v6;
  id v7;
  sqlite3_stmt *v8;
  sqlite3_stmt *v9;
  id v10;
  id v11;
  const char *v12;
  NSObject *v13;
  _BOOL4 v14;
  NSObject *v15;
  const char *v16;
  const char *v17;
  int v18;
  const char *v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  uint64_t v23;
  __int16 v24;
  const char *v25;
  __int16 v26;
  const char *v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = -[NPKGizmoDatabase insertDiffStatement](self, "insertDiffStatement");
  v9 = v8;
  if (v6)
  {
    NPKSecureArchiveObject(v6);
    v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    sqlite3_bind_blob(v9, 1, (const void *)objc_msgSend(v10, "bytes"), objc_msgSend(v10, "length"), (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);

  }
  else
  {
    sqlite3_bind_null(v8, 1);
  }
  v11 = objc_retainAutorelease(v7);
  v12 = (const char *)objc_msgSend(v11, "UTF8String");

  sqlite3_bind_text(v9, 2, v12, -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
  if (sqlite3_step(v9) != 101)
  {
    pk_General_log();
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = os_log_type_enabled(v13, OS_LOG_TYPE_ERROR);

    if (v14)
    {
      pk_General_log();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        v16 = sqlite3_sql(v9);
        v17 = sqlite3_errmsg(self->_database);
        v18 = 136447234;
        v19 = "-[NPKGizmoDatabase _saveDiffLocked:forPassWithUniqueID:]";
        v20 = 2082;
        v21 = "/Library/Caches/com.apple.xbs/Sources/NanoPassbook_Frameworks/NanoPassKit/NPKGizmoDatabase.m";
        v22 = 2048;
        v23 = 4182;
        v24 = 2080;
        v25 = v16;
        v26 = 2080;
        v27 = v17;
        _os_log_impl(&dword_213518000, v15, OS_LOG_TYPE_ERROR, "Error: *** NPKAssertion failure in %{public}s, %{public}s:%ld (reason: Save diff failed: %s; %s)",
          (uint8_t *)&v18,
          0x34u);
      }

    }
    _NPKAssertAbort();
  }
  sqlite3_clear_bindings(v9);
  sqlite3_reset(v9);

}

- (id)passForUniqueID:(id)a3
{
  return -[NPKGizmoDatabase passForUniqueID:includeImageSets:](self, "passForUniqueID:includeImageSets:", a3, 1);
}

- (id)passForUniqueID:(id)a3 includeImageSets:(BOOL)a4
{
  id v6;
  NSObject *dbQueue;
  id v8;
  id v9;
  _QWORD v11[5];
  id v12;
  uint64_t *v13;
  BOOL v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v6 = a3;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__14;
  v19 = __Block_byref_object_dispose__14;
  v20 = 0;
  dbQueue = self->_dbQueue;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __53__NPKGizmoDatabase_passForUniqueID_includeImageSets___block_invoke;
  v11[3] = &unk_24CFEB3A0;
  v12 = v6;
  v13 = &v15;
  v11[4] = self;
  v14 = a4;
  v8 = v6;
  dispatch_sync(dbQueue, v11);
  v9 = (id)v16[5];

  _Block_object_dispose(&v15, 8);
  return v9;
}

void __53__NPKGizmoDatabase_passForUniqueID_includeImageSets___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_loadInitialManifestLocked");
  if (objc_msgSend(*(id *)(a1 + 32), "database"))
  {
    objc_msgSend(*(id *)(a1 + 32), "_passForUniqueIDLocked:includeImageSets:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 56));
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v4 = *(void **)(v3 + 40);
    *(_QWORD *)(v3 + 40) = v2;

  }
}

- (id)diffForUniqueID:(id)a3
{
  id v4;
  NSObject *dbQueue;
  id v6;
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
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__14;
  v16 = __Block_byref_object_dispose__14;
  v17 = 0;
  dbQueue = self->_dbQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __36__NPKGizmoDatabase_diffForUniqueID___block_invoke;
  block[3] = &unk_24CFEB198;
  v10 = v4;
  v11 = &v12;
  block[4] = self;
  v6 = v4;
  dispatch_sync(dbQueue, block);
  v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __36__NPKGizmoDatabase_diffForUniqueID___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_loadInitialManifestLocked");
  if (objc_msgSend(*(id *)(a1 + 32), "database"))
  {
    objc_msgSend(*(id *)(a1 + 32), "_diffForUniqueIDLocked:", *(_QWORD *)(a1 + 40));
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v4 = *(void **)(v3 + 40);
    *(_QWORD *)(v3 + 40) = v2;

  }
}

- (void)setDeletePending:(BOOL)a3 forUniqueID:(id)a4
{
  id v6;
  NSObject *v7;
  _BOOL4 v8;
  NSObject *v9;
  NSObject *dbQueue;
  id v11;
  _QWORD block[5];
  id v13;
  BOOL v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  if (!v6)
  {
    pk_General_log();
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = os_log_type_enabled(v7, OS_LOG_TYPE_ERROR);

    if (v8)
    {
      pk_General_log();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446722;
        v16 = "-[NPKGizmoDatabase setDeletePending:forUniqueID:]";
        v17 = 2082;
        v18 = "/Library/Caches/com.apple.xbs/Sources/NanoPassbook_Frameworks/NanoPassKit/NPKGizmoDatabase.m";
        v19 = 2048;
        v20 = 4221;
        _os_log_impl(&dword_213518000, v9, OS_LOG_TYPE_ERROR, "Error: *** NPKAssertion failure in %{public}s, %{public}s:%ld (reason: setDeletePending:forUniqueID: can't accept nil uniqueID)", buf, 0x20u);
      }

    }
    _NPKAssertAbort();
  }
  dbQueue = self->_dbQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __49__NPKGizmoDatabase_setDeletePending_forUniqueID___block_invoke;
  block[3] = &unk_24CFE8FA8;
  block[4] = self;
  v13 = v6;
  v14 = a3;
  v11 = v6;
  dispatch_sync(dbQueue, block);

}

void __49__NPKGizmoDatabase_setDeletePending_forUniqueID___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  _BOOL4 v4;
  NSObject *v5;
  sqlite3_stmt *v6;
  NSObject *v7;
  _BOOL4 v8;
  NSObject *v9;
  const char *v10;
  const char *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  char v19;
  id v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint64_t v29;
  void *v30;
  uint8_t v31[128];
  uint8_t buf[4];
  const char *v33;
  __int16 v34;
  const char *v35;
  __int16 v36;
  uint64_t v37;
  __int16 v38;
  const char *v39;
  __int16 v40;
  const char *v41;
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "_passForUniqueIDLocked:includeImageSets:", *(_QWORD *)(a1 + 40), 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(*(id *)(a1 + 32), "database"))
  {
    pk_General_log();
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = os_log_type_enabled(v3, OS_LOG_TYPE_ERROR);

    if (v4)
    {
      pk_General_log();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446722;
        v33 = "-[NPKGizmoDatabase setDeletePending:forUniqueID:]_block_invoke";
        v34 = 2082;
        v35 = "/Library/Caches/com.apple.xbs/Sources/NanoPassbook_Frameworks/NanoPassKit/NPKGizmoDatabase.m";
        v36 = 2048;
        v37 = 4227;
        _os_log_impl(&dword_213518000, v5, OS_LOG_TYPE_ERROR, "Error: *** NPKAssertion failure in %{public}s, %{public}s:%ld (reason: Nil database handle; did you check pass"
          "DBIsAvailable before calling?)",
          buf,
          0x20u);
      }

    }
    _NPKAssertAbort();
  }
  v6 = (sqlite3_stmt *)objc_msgSend(*(id *)(a1 + 32), "updateDeletePendingStatement");
  sqlite3_bind_int(v6, 1, *(unsigned __int8 *)(a1 + 48));
  sqlite3_bind_text(v6, 2, (const char *)objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 40)), "UTF8String"), -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
  if (sqlite3_step(v6) != 101)
  {
    pk_General_log();
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = os_log_type_enabled(v7, OS_LOG_TYPE_ERROR);

    if (v8)
    {
      pk_General_log();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        v10 = sqlite3_sql(v6);
        v11 = sqlite3_errmsg(*(sqlite3 **)(*(_QWORD *)(a1 + 32) + 8));
        *(_DWORD *)buf = 136447234;
        v33 = "-[NPKGizmoDatabase setDeletePending:forUniqueID:]_block_invoke";
        v34 = 2082;
        v35 = "/Library/Caches/com.apple.xbs/Sources/NanoPassbook_Frameworks/NanoPassKit/NPKGizmoDatabase.m";
        v36 = 2048;
        v37 = 4238;
        v38 = 2080;
        v39 = v10;
        v40 = 2080;
        v41 = v11;
        _os_log_impl(&dword_213518000, v9, OS_LOG_TYPE_ERROR, "Error: *** NPKAssertion failure in %{public}s, %{public}s:%ld (reason: Update delete pending failed: %s; %s)",
          buf,
          0x34u);
      }

    }
    _NPKAssertAbort();
  }
  sqlite3_clear_bindings(v6);
  sqlite3_reset(v6);
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v12 = *(id *)(*(_QWORD *)(a1 + 32) + 352);
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v25, v31, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v26;
    while (2)
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v26 != v15)
          objc_enumerationMutation(v12);
        v17 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
        objc_msgSend(v17, "uniqueID", (_QWORD)v25);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v18, "isEqualToString:", *(_QWORD *)(a1 + 40));

        if ((v19 & 1) != 0)
        {
          v20 = v17;

          if (v20)
            objc_msgSend(v20, "setDeletePending:", *(unsigned __int8 *)(a1 + 48));
          goto LABEL_24;
        }
      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v25, v31, 16);
      if (v14)
        continue;
      break;
    }
  }

  v20 = 0;
LABEL_24:
  if (v2 && *(_BYTE *)(a1 + 48))
  {
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = NPKGizmoDatabasePassRemovedNotificationName;
    v23 = *(_QWORD *)(a1 + 32);
    v29 = NPKGizmoDatabasePassKeyName;
    v30 = v2;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v30, &v29, 1);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "postNotificationName:object:userInfo:", v22, v23, v24);

  }
  objc_msgSend(*(id *)(a1 + 32), "_notifyDatabaseChangedExternally", (_QWORD)v25);
  objc_msgSend(*(id *)(a1 + 32), "_notifyDatabaseChangedWithNoop:", 0);

}

- (BOOL)_getDeletePendingForUniqueID:(id)a3
{
  id v4;
  sqlite3_stmt *v5;
  id v6;
  const char *v7;
  BOOL v8;

  v4 = a3;
  v5 = -[NPKGizmoDatabase selectDeletePendingStatement](self, "selectDeletePendingStatement");
  v6 = objc_retainAutorelease(v4);
  v7 = (const char *)objc_msgSend(v6, "UTF8String");

  sqlite3_bind_text(v5, 1, v7, -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
  v8 = sqlite3_step(v5) == 100 && sqlite3_column_int(v5, 0) != 0;
  sqlite3_clear_bindings(v5);
  sqlite3_reset(v5);
  return v8;
}

- (void)setPreferredPaymentApplication:(id)a3 forPaymentPass:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  _BOOL4 v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  id v14;
  void *v15;
  NSObject *v16;
  _BOOL4 v17;
  NSObject *v18;
  void *v19;
  NSObject *dbQueue;
  id v21;
  id v22;
  _QWORD v23[5];
  id v24;
  id v25;
  _QWORD v26[4];
  id v27;
  uint8_t buf[4];
  const char *v29;
  __int16 v30;
  const char *v31;
  __int16 v32;
  uint64_t v33;
  __int16 v34;
  const char *v35;
  __int16 v36;
  id v37;
  __int16 v38;
  void *v39;
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (!v7)
  {
    pk_General_log();
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = os_log_type_enabled(v9, OS_LOG_TYPE_ERROR);

    if (v10)
    {
      pk_General_log();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446978;
        v29 = "-[NPKGizmoDatabase setPreferredPaymentApplication:forPaymentPass:]";
        v30 = 2082;
        v31 = "/Library/Caches/com.apple.xbs/Sources/NanoPassbook_Frameworks/NanoPassKit/NPKGizmoDatabase.m";
        v32 = 2048;
        v33 = 4280;
        v34 = 2080;
        v35 = "-[NPKGizmoDatabase setPreferredPaymentApplication:forPaymentPass:]";
        _os_log_impl(&dword_213518000, v11, OS_LOG_TYPE_ERROR, "Error: *** NPKAssertion failure in %{public}s, %{public}s:%ld (reason: %s cannot take nil payment pass)", buf, 0x2Au);
      }

    }
    _NPKAssertAbort();
  }
  v12 = MEMORY[0x24BDAC760];
  if (v6)
  {
    objc_msgSend(v7, "paymentApplications");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v26[0] = v12;
    v26[1] = 3221225472;
    v26[2] = __66__NPKGizmoDatabase_setPreferredPaymentApplication_forPaymentPass___block_invoke;
    v26[3] = &unk_24CFEB3C8;
    v14 = v6;
    v27 = v14;
    objc_msgSend(v13, "pk_anyObjectPassingTest:", v26);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v15)
    {
      pk_General_log();
      v16 = objc_claimAutoreleasedReturnValue();
      v17 = os_log_type_enabled(v16, OS_LOG_TYPE_ERROR);

      if (v17)
      {
        pk_General_log();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(v8, "paymentApplications");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 136447490;
          v29 = "-[NPKGizmoDatabase setPreferredPaymentApplication:forPaymentPass:]";
          v30 = 2082;
          v31 = "/Library/Caches/com.apple.xbs/Sources/NanoPassbook_Frameworks/NanoPassKit/NPKGizmoDatabase.m";
          v32 = 2048;
          v33 = 4283;
          v34 = 2112;
          v35 = (const char *)v8;
          v36 = 2112;
          v37 = v14;
          v38 = 2112;
          v39 = v19;
          _os_log_impl(&dword_213518000, v18, OS_LOG_TYPE_ERROR, "Error: *** NPKAssertion failure in %{public}s, %{public}s:%ld (reason: Payment pass %@ did not contain payment application %@ (has applications = %@))", buf, 0x3Eu);

        }
      }
      _NPKAssertAbort();
    }

  }
  dbQueue = self->_dbQueue;
  v23[0] = v12;
  v23[1] = 3221225472;
  v23[2] = __66__NPKGizmoDatabase_setPreferredPaymentApplication_forPaymentPass___block_invoke_401;
  v23[3] = &unk_24CFE8288;
  v23[4] = self;
  v24 = v6;
  v25 = v8;
  v21 = v8;
  v22 = v6;
  dispatch_async(dbQueue, v23);

}

uint64_t __66__NPKGizmoDatabase_setPreferredPaymentApplication_forPaymentPass___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "applicationIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "applicationIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v4, "isEqualToString:", v5);
  return v6;
}

void __66__NPKGizmoDatabase_setPreferredPaymentApplication_forPaymentPass___block_invoke_401(id *a1)
{
  NSObject *v2;
  _BOOL4 v3;
  NSObject *v4;
  sqlite3_stmt *v5;
  id v6;
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  _BOOL4 v11;
  NSObject *v12;
  const char *v13;
  const char *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t, void *, uint64_t, _BYTE *);
  void *v19;
  id v20;
  id v21;
  uint8_t buf[4];
  const char *v23;
  __int16 v24;
  const char *v25;
  __int16 v26;
  uint64_t v27;
  __int16 v28;
  const char *v29;
  __int16 v30;
  const char *v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1[4], "_loadInitialManifestLocked");
  if (!objc_msgSend(a1[4], "database"))
  {
    pk_General_log();
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = os_log_type_enabled(v2, OS_LOG_TYPE_ERROR);

    if (v3)
    {
      pk_General_log();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446722;
        v23 = "-[NPKGizmoDatabase setPreferredPaymentApplication:forPaymentPass:]_block_invoke";
        v24 = 2082;
        v25 = "/Library/Caches/com.apple.xbs/Sources/NanoPassbook_Frameworks/NanoPassKit/NPKGizmoDatabase.m";
        v26 = 2048;
        v27 = 4286;
        _os_log_impl(&dword_213518000, v4, OS_LOG_TYPE_ERROR, "Error: *** NPKAssertion failure in %{public}s, %{public}s:%ld (reason: Nil database handle; did you check pass"
          "DBIsAvailable before calling?)",
          buf,
          0x20u);
      }

    }
    _NPKAssertAbort();
  }
  v5 = (sqlite3_stmt *)objc_msgSend(a1[4], "updatePreferredAIDStatement");
  objc_msgSend(a1[5], "applicationIdentifier");
  v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  sqlite3_bind_text(v5, 1, (const char *)objc_msgSend(v6, "UTF8String"), -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);

  v7 = a1[5];
  if (v7)
  {
    NPKSecureArchiveObject(v7);
    v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    sqlite3_bind_blob(v5, 2, (const void *)objc_msgSend(v8, "bytes"), objc_msgSend(v8, "length"), (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);

  }
  else
  {
    sqlite3_bind_null(v5, 2);
  }
  objc_msgSend(a1[6], "uniqueID");
  v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  sqlite3_bind_text(v5, 3, (const char *)objc_msgSend(v9, "UTF8String"), -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);

  if (sqlite3_step(v5) != 101)
  {
    pk_General_log();
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = os_log_type_enabled(v10, OS_LOG_TYPE_ERROR);

    if (v11)
    {
      pk_General_log();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        v13 = sqlite3_sql(v5);
        v14 = sqlite3_errmsg(*((sqlite3 **)a1[4] + 1));
        *(_DWORD *)buf = 136447234;
        v23 = "-[NPKGizmoDatabase setPreferredPaymentApplication:forPaymentPass:]_block_invoke";
        v24 = 2082;
        v25 = "/Library/Caches/com.apple.xbs/Sources/NanoPassbook_Frameworks/NanoPassKit/NPKGizmoDatabase.m";
        v26 = 2048;
        v27 = 4303;
        v28 = 2080;
        v29 = v13;
        v30 = 2080;
        v31 = v14;
        _os_log_impl(&dword_213518000, v12, OS_LOG_TYPE_ERROR, "Error: *** NPKAssertion failure in %{public}s, %{public}s:%ld (reason: Update preferred AID failed: %s; %s)",
          buf,
          0x34u);
      }

    }
    _NPKAssertAbort();
  }
  sqlite3_clear_bindings(v5);
  sqlite3_reset(v5);
  v15 = (void *)*((_QWORD *)a1[4] + 44);
  v16 = MEMORY[0x24BDAC760];
  v17 = 3221225472;
  v18 = __66__NPKGizmoDatabase_setPreferredPaymentApplication_forPaymentPass___block_invoke_402;
  v19 = &unk_24CFEB2B0;
  v20 = a1[6];
  v21 = a1[5];
  objc_msgSend(v15, "enumerateObjectsUsingBlock:", &v16);
  objc_msgSend(a1[4], "_notifyDatabaseChangedExternally", v16, v17, v18, v19);
  objc_msgSend(a1[4], "_notifyDatabaseChangedWithNoop:", 0);

}

void __66__NPKGizmoDatabase_setPreferredPaymentApplication_forPaymentPass___block_invoke_402(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  void *v7;
  void *v8;
  int v9;
  NSObject *v10;
  _BOOL4 v11;
  NSObject *v12;
  uint64_t v13;
  int v14;
  id v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v6 = a2;
  objc_msgSend(v6, "uniqueID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "uniqueID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "isEqualToString:", v8);

  if (v9)
  {
    pk_General_log();
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);

    if (v11)
    {
      pk_General_log();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        v13 = *(_QWORD *)(a1 + 40);
        v14 = 138412546;
        v15 = v6;
        v16 = 2112;
        v17 = v13;
        _os_log_impl(&dword_213518000, v12, OS_LOG_TYPE_DEFAULT, "Notice: Updating description %@ with new preferred payment application %@", (uint8_t *)&v14, 0x16u);
      }

    }
    objc_msgSend(v6, "setPreferredPaymentApplication:", *(_QWORD *)(a1 + 40));
    *a4 = 1;
  }

}

- (id)preferredPaymentApplicationForPaymentPass:(id)a3
{
  id v4;
  NSObject *v5;
  _BOOL4 v6;
  NSObject *v7;
  NSObject *dbQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v13;
  _BYTE *v14;
  _BYTE buf[24];
  uint64_t v16;
  __int128 v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (!v4)
  {
    pk_General_log();
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = os_log_type_enabled(v5, OS_LOG_TYPE_ERROR);

    if (v6)
    {
      pk_General_log();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446978;
        *(_QWORD *)&buf[4] = "-[NPKGizmoDatabase preferredPaymentApplicationForPaymentPass:]";
        *(_WORD *)&buf[12] = 2082;
        *(_QWORD *)&buf[14] = "/Library/Caches/com.apple.xbs/Sources/NanoPassbook_Frameworks/NanoPassKit/NPKGizmoDatabase.m";
        *(_WORD *)&buf[22] = 2048;
        v16 = 4322;
        LOWORD(v17) = 2080;
        *(_QWORD *)((char *)&v17 + 2) = "-[NPKGizmoDatabase preferredPaymentApplicationForPaymentPass:]";
        _os_log_impl(&dword_213518000, v7, OS_LOG_TYPE_ERROR, "Error: *** NPKAssertion failure in %{public}s, %{public}s:%ld (reason: %s cannot take nil payment pass)", buf, 0x2Au);
      }

    }
    _NPKAssertAbort();
  }
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v16 = (uint64_t)__Block_byref_object_copy__14;
  *(_QWORD *)&v17 = __Block_byref_object_dispose__14;
  *((_QWORD *)&v17 + 1) = 0;
  dbQueue = self->_dbQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __62__NPKGizmoDatabase_preferredPaymentApplicationForPaymentPass___block_invoke;
  block[3] = &unk_24CFEB198;
  v13 = v4;
  v14 = buf;
  block[4] = self;
  v9 = v4;
  dispatch_sync(dbQueue, block);
  v10 = *(id *)(*(_QWORD *)&buf[8] + 40);

  _Block_object_dispose(buf, 8);
  return v10;
}

void __62__NPKGizmoDatabase_preferredPaymentApplicationForPaymentPass___block_invoke(uint64_t a1)
{
  NSObject *v2;
  _BOOL4 v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  int v8;
  const char *v9;
  __int16 v10;
  const char *v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "_loadInitialManifestLocked");
  if (!objc_msgSend(*(id *)(a1 + 32), "database"))
  {
    pk_General_log();
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = os_log_type_enabled(v2, OS_LOG_TYPE_ERROR);

    if (v3)
    {
      pk_General_log();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      {
        v8 = 136446722;
        v9 = "-[NPKGizmoDatabase preferredPaymentApplicationForPaymentPass:]_block_invoke";
        v10 = 2082;
        v11 = "/Library/Caches/com.apple.xbs/Sources/NanoPassbook_Frameworks/NanoPassKit/NPKGizmoDatabase.m";
        v12 = 2048;
        v13 = 4326;
        _os_log_impl(&dword_213518000, v4, OS_LOG_TYPE_ERROR, "Error: *** NPKAssertion failure in %{public}s, %{public}s:%ld (reason: Nil database handle; did you check pass"
          "DBIsAvailable before calling?)",
          (uint8_t *)&v8,
          0x20u);
      }

    }
    _NPKAssertAbort();
  }
  objc_msgSend(*(id *)(a1 + 32), "_getPreferredPaymentApplicationForPaymentPass:aid:", *(_QWORD *)(a1 + 40), 0);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

}

- (id)_getPreferredPaymentApplicationForPaymentPass:(id)a3 aid:(id *)a4
{
  id v6;
  sqlite3_stmt *v7;
  id v8;
  const unsigned __int8 *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v15[6];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;

  v6 = a3;
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__14;
  v26 = __Block_byref_object_dispose__14;
  v27 = 0;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__14;
  v20 = __Block_byref_object_dispose__14;
  v21 = 0;
  v7 = -[NPKGizmoDatabase selectPreferredAIDStatement](self, "selectPreferredAIDStatement");
  objc_msgSend(v6, "uniqueID");
  v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  sqlite3_bind_text(v7, 1, (const char *)objc_msgSend(v8, "UTF8String"), -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);

  if (sqlite3_step(v7) == 100)
  {
    v9 = sqlite3_column_text(v7, 0);
    if (v9)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v9, 4);
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = (void *)v17[5];
      v17[5] = v10;

      objc_msgSend(v6, "paymentApplications");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v15[0] = MEMORY[0x24BDAC760];
      v15[1] = 3221225472;
      v15[2] = __70__NPKGizmoDatabase__getPreferredPaymentApplicationForPaymentPass_aid___block_invoke;
      v15[3] = &unk_24CFEB3F0;
      v15[4] = &v16;
      v15[5] = &v22;
      objc_msgSend(v12, "enumerateObjectsUsingBlock:", v15);

    }
  }
  sqlite3_clear_bindings(v7);
  sqlite3_reset(v7);
  if (a4)
    *a4 = objc_retainAutorelease((id)v17[5]);
  v13 = (id)v23[5];
  _Block_object_dispose(&v16, 8);

  _Block_object_dispose(&v22, 8);
  return v13;
}

void __70__NPKGizmoDatabase__getPreferredPaymentApplicationForPaymentPass_aid___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  void *v6;
  int v7;
  id v8;

  v8 = a2;
  objc_msgSend(v8, "applicationIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40));

  if (v7)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
    *a3 = 1;
  }

}

- (NSArray)passDescriptions
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
  v9 = __Block_byref_object_copy__14;
  v10 = __Block_byref_object_dispose__14;
  v11 = 0;
  dbQueue = self->_dbQueue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __36__NPKGizmoDatabase_passDescriptions__block_invoke;
  v5[3] = &unk_24CFEB418;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dbQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSArray *)v3;
}

void __36__NPKGizmoDatabase_passDescriptions__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_loadInitialManifestLocked");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 352));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (NSData)libraryHash
{
  return (NSData *)-[NPKGizmoDatabase libraryHashForWatchOSMajorVersion:](self, "libraryHashForWatchOSMajorVersion:", 2);
}

- (id)libraryHashForWatchOSMajorVersion:(unint64_t)a3
{
  NSObject *dbQueue;
  id v4;
  _QWORD block[7];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__14;
  v11 = __Block_byref_object_dispose__14;
  v12 = 0;
  dbQueue = self->_dbQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __54__NPKGizmoDatabase_libraryHashForWatchOSMajorVersion___block_invoke;
  block[3] = &unk_24CFEA788;
  block[4] = self;
  block[5] = &v7;
  block[6] = a3;
  dispatch_sync(dbQueue, block);
  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __54__NPKGizmoDatabase_libraryHashForWatchOSMajorVersion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  if (objc_msgSend(*(id *)(a1 + 32), "database"))
  {
    objc_msgSend(*(id *)(a1 + 32), "_loadInitialManifestLocked");
    objc_msgSend(*(id *)(a1 + 32), "_libraryHashLockedForWatchOSMajorVersion:", *(_QWORD *)(a1 + 48));
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v4 = *(void **)(v3 + 40);
    *(_QWORD *)(v3 + 40) = v2;

  }
}

+ (unint64_t)latestWatchOSMajorVersion
{
  return 2;
}

- (id)_libraryHashLockedForWatchOSMajorVersion:(unint64_t)a3
{
  NSObject *v5;
  _BOOL4 v6;
  NSObject *v7;
  NSArray *libraryHashes;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  void *v16;
  unint64_t v17;
  void *v18;
  void *v19;
  NSArray *v20;
  NSArray *v21;
  void *v23;
  void *v24;
  _QWORD v25[5];
  _QWORD v26[5];
  id v27;
  uint8_t buf[4];
  const char *v29;
  __int16 v30;
  const char *v31;
  __int16 v32;
  uint64_t v33;
  __int16 v34;
  unint64_t v35;
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  if (!a3 || objc_msgSend((id)objc_opt_class(), "latestWatchOSMajorVersion") < a3)
  {
    pk_General_log();
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = os_log_type_enabled(v5, OS_LOG_TYPE_ERROR);

    if (v6)
    {
      pk_General_log();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446978;
        v29 = "-[NPKGizmoDatabase _libraryHashLockedForWatchOSMajorVersion:]";
        v30 = 2082;
        v31 = "/Library/Caches/com.apple.xbs/Sources/NanoPassbook_Frameworks/NanoPassKit/NPKGizmoDatabase.m";
        v32 = 2048;
        v33 = 4390;
        v34 = 2048;
        v35 = a3;
        _os_log_impl(&dword_213518000, v7, OS_LOG_TYPE_ERROR, "Error: *** NPKAssertion failure in %{public}s, %{public}s:%ld (reason: Received invalid watch OS version %lu)", buf, 0x2Au);
      }

    }
    _NPKAssertAbort();
  }
  libraryHashes = self->_libraryHashes;
  if (libraryHashes)
  {
    -[NSArray objectAtIndexedSubscript:](libraryHashes, "objectAtIndexedSubscript:", a3 - 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = (void *)MEMORY[0x2199B65AC]();
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary allKeys](self->_manifest, "allKeys");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "sortedArrayUsingSelector:", sel_caseInsensitiveCompare_);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = MEMORY[0x24BDAC760];
    v26[0] = MEMORY[0x24BDAC760];
    v26[1] = 3221225472;
    v26[2] = __61__NPKGizmoDatabase__libraryHashLockedForWatchOSMajorVersion___block_invoke;
    v26[3] = &unk_24CFE9EC0;
    v26[4] = self;
    v15 = v11;
    v27 = v15;
    objc_msgSend(v13, "enumerateObjectsUsingBlock:", v26);

    if (objc_msgSend(v15, "count"))
    {
      v23 = v10;
      v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend((id)objc_opt_class(), "latestWatchOSMajorVersion"));
      if (objc_msgSend((id)objc_opt_class(), "latestWatchOSMajorVersion"))
      {
        v17 = 0;
        do
        {
          v25[0] = v14;
          v25[1] = 3221225472;
          v25[2] = __61__NPKGizmoDatabase__libraryHashLockedForWatchOSMajorVersion___block_invoke_405;
          v25[3] = &__block_descriptor_40_e17__16__0__NSArray_8l;
          v25[4] = v17;
          objc_msgSend(v15, "npkComprehension:", v25, v23);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          NPKLibraryHashForPassHashes(v18);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "setObject:atIndexedSubscript:", v19, v17);

          ++v17;
        }
        while (v17 < objc_msgSend((id)objc_opt_class(), "latestWatchOSMajorVersion"));
      }
      v20 = (NSArray *)objc_msgSend(v16, "copy", v23);
      v21 = self->_libraryHashes;
      self->_libraryHashes = v20;

      -[NSArray objectAtIndexedSubscript:](self->_libraryHashes, "objectAtIndexedSubscript:", a3 - 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      v10 = v24;
    }
    else
    {
      v9 = 0;
    }

    objc_autoreleasePoolPop(v10);
  }
  return v9;
}

void __61__NPKGizmoDatabase__libraryHashLockedForWatchOSMajorVersion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  _BOOL4 v7;
  NSObject *v8;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 344), "objectForKey:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "remoteManifestHashes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v5);
  }
  else
  {
    pk_Payment_log();
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);

    if (v7)
    {
      pk_Payment_log();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        v9 = 138412290;
        v10 = v3;
        _os_log_impl(&dword_213518000, v8, OS_LOG_TYPE_DEFAULT, "Notice: Skipping pass with unique ID %@ because it has no remote manifest hashes", (uint8_t *)&v9, 0xCu);
      }

    }
  }

}

uint64_t __61__NPKGizmoDatabase__libraryHashLockedForWatchOSMajorVersion___block_invoke_405(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "objectAtIndexedSubscript:", *(_QWORD *)(a1 + 32));
}

- (NSDictionary)manifestHashes
{
  return (NSDictionary *)-[NPKGizmoDatabase manifestHashesForWatchOSMajorVersion:](self, "manifestHashesForWatchOSMajorVersion:", objc_msgSend((id)objc_opt_class(), "latestWatchOSMajorVersion"));
}

- (id)manifestHashesForWatchOSMajorVersion:(unint64_t)a3
{
  NSObject *dbQueue;
  id v4;
  _QWORD block[7];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__14;
  v11 = __Block_byref_object_dispose__14;
  v12 = 0;
  dbQueue = self->_dbQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __57__NPKGizmoDatabase_manifestHashesForWatchOSMajorVersion___block_invoke;
  block[3] = &unk_24CFEA788;
  block[5] = &v7;
  block[6] = a3;
  block[4] = self;
  dispatch_sync(dbQueue, block);
  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __57__NPKGizmoDatabase_manifestHashesForWatchOSMajorVersion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  uint64_t v11;

  if (objc_msgSend(*(id *)(a1 + 32), "database"))
  {
    objc_msgSend(*(id *)(a1 + 32), "_loadInitialManifestLocked");
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 344), "count"));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = *(void **)(*(_QWORD *)(a1 + 32) + 344);
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __57__NPKGizmoDatabase_manifestHashesForWatchOSMajorVersion___block_invoke_2;
    v9[3] = &unk_24CFEB460;
    v4 = *(_QWORD *)(a1 + 48);
    v10 = v2;
    v11 = v4;
    v8 = v2;
    objc_msgSend(v3, "enumerateKeysAndObjectsUsingBlock:", v9);
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithDictionary:", v8);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v5;

  }
}

void __57__NPKGizmoDatabase_manifestHashesForWatchOSMajorVersion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  unint64_t v8;
  unint64_t v9;
  NSObject *v10;
  _BOOL4 v11;
  NSObject *v12;
  const char *v13;
  NSObject *v14;
  _BOOL4 v15;
  void *v16;
  int v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  objc_msgSend(a3, "remoteManifestHashes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    v8 = objc_msgSend(v6, "count");
    v9 = *(_QWORD *)(a1 + 40);
    if (v8 >= v9)
    {
      objc_msgSend(v7, "objectAtIndexedSubscript:", v9 - 1);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v16, v5);

      goto LABEL_12;
    }
    pk_Payment_log();
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);

    if (v11)
    {
      pk_Payment_log();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        v17 = 138412290;
        v18 = v5;
        v13 = "Warning: Skipping pass with unique ID %@ from manifest calculation because it is missing manifest hash for this version";
LABEL_9:
        _os_log_impl(&dword_213518000, v12, OS_LOG_TYPE_DEFAULT, v13, (uint8_t *)&v17, 0xCu);
        goto LABEL_10;
      }
      goto LABEL_10;
    }
  }
  else
  {
    pk_Payment_log();
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);

    if (v15)
    {
      pk_Payment_log();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        v17 = 138412290;
        v18 = v5;
        v13 = "Notice: Skipping pass with unique ID %@ from manifest calculation because it has no remote manifest hash";
        goto LABEL_9;
      }
LABEL_10:

    }
  }
LABEL_12:

}

- (void)enumerateAllPassesWithBlock:(id)a3 includeImageSets:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v4 = a4;
  v6 = a3;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __65__NPKGizmoDatabase_enumerateAllPassesWithBlock_includeImageSets___block_invoke;
  v8[3] = &unk_24CFEB488;
  v9 = v6;
  v7 = v6;
  -[NPKGizmoDatabase enumerateAllPassesAndDescriptionsWithBlock:includeImageSets:](self, "enumerateAllPassesAndDescriptionsWithBlock:includeImageSets:", v8, v4);

}

uint64_t __65__NPKGizmoDatabase_enumerateAllPassesWithBlock_includeImageSets___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)enumerateAllPassesAndDescriptionsWithBlock:(id)a3 includeImageSets:(BOOL)a4
{
  id v6;
  NSObject *dbQueue;
  id v8;
  _QWORD block[5];
  id v10;
  BOOL v11;

  v6 = a3;
  dbQueue = self->_dbQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __80__NPKGizmoDatabase_enumerateAllPassesAndDescriptionsWithBlock_includeImageSets___block_invoke;
  block[3] = &unk_24CFE87E0;
  v11 = a4;
  block[4] = self;
  v10 = v6;
  v8 = v6;
  dispatch_sync(dbQueue, block);

}

void __80__NPKGizmoDatabase_enumerateAllPassesAndDescriptionsWithBlock_includeImageSets___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  _QWORD v6[5];
  id v7;
  _QWORD *v8;
  uint64_t v9;
  char v10;
  _QWORD v11[4];

  if (objc_msgSend(*(id *)(a1 + 32), "database"))
  {
    objc_msgSend(*(id *)(a1 + 32), "_loadInitialManifestLocked");
    v11[0] = 0;
    v11[1] = v11;
    v11[2] = 0x2020000000;
    v11[3] = 0;
    v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 352), "count");
    v6[0] = MEMORY[0x24BDAC760];
    v6[2] = __80__NPKGizmoDatabase_enumerateAllPassesAndDescriptionsWithBlock_includeImageSets___block_invoke_2;
    v6[3] = &unk_24CFEB4B0;
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(void **)(a1 + 40);
    v5 = *(void **)(v3 + 352);
    v6[1] = 3221225472;
    v6[4] = v3;
    v10 = *(_BYTE *)(a1 + 48);
    v7 = v4;
    v8 = v11;
    v9 = v2;
    objc_msgSend(v5, "enumerateObjectsUsingBlock:", v6);

    _Block_object_dispose(v11, 8);
  }
}

void __80__NPKGizmoDatabase_enumerateAllPassesAndDescriptionsWithBlock_includeImageSets___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  id v7;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "uniqueID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_passForUniqueIDLocked:includeImageSets:", v5, *(unsigned __int8 *)(a1 + 64));
  v7 = (id)objc_claimAutoreleasedReturnValue();

  v6 = *(_QWORD *)(a1 + 40);
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
  (*(void (**)(void))(v6 + 16))();

}

- (BOOL)hasPassesMatchingPassDescriptionPredicate:(id)a3
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
  char v14;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  dbQueue = self->_dbQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __62__NPKGizmoDatabase_hasPassesMatchingPassDescriptionPredicate___block_invoke;
  block[3] = &unk_24CFEB0F8;
  block[4] = self;
  v9 = v4;
  v10 = &v11;
  v6 = v4;
  dispatch_sync(dbQueue, block);
  LOBYTE(dbQueue) = *((_BYTE *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)dbQueue;
}

void __62__NPKGizmoDatabase_hasPassesMatchingPassDescriptionPredicate___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  if (objc_msgSend(*(id *)(a1 + 32), "database"))
  {
    objc_msgSend(*(id *)(a1 + 32), "_loadInitialManifestLocked");
    v9 = 0u;
    v10 = 0u;
    v7 = 0u;
    v8 = 0u;
    v2 = *(id *)(*(_QWORD *)(a1 + 32) + 352);
    v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    if (v3)
    {
      v4 = v3;
      v5 = *(_QWORD *)v8;
      while (2)
      {
        for (i = 0; i != v4; ++i)
        {
          if (*(_QWORD *)v8 != v5)
            objc_enumerationMutation(v2);
          if (objc_msgSend(*(id *)(a1 + 40), "evaluateWithObject:", *(_QWORD *)(*((_QWORD *)&v7 + 1) + 8 * i), (_QWORD)v7))
          {
            *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
            goto LABEL_12;
          }
        }
        v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
        if (v4)
          continue;
        break;
      }
    }
LABEL_12:

  }
}

- (id)filteredPassesUsingPassDescriptionPredicate:(id)a3 includeImageSets:(BOOL)a4
{
  id v6;
  NSObject *dbQueue;
  id v8;
  id v9;
  _QWORD v11[5];
  id v12;
  uint64_t *v13;
  BOOL v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v6 = a3;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__14;
  v19 = __Block_byref_object_dispose__14;
  v20 = 0;
  dbQueue = self->_dbQueue;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __81__NPKGizmoDatabase_filteredPassesUsingPassDescriptionPredicate_includeImageSets___block_invoke;
  v11[3] = &unk_24CFEB0D0;
  v11[4] = self;
  v12 = v6;
  v14 = a4;
  v13 = &v15;
  v8 = v6;
  dispatch_sync(dbQueue, v11);
  v9 = (id)v16[5];

  _Block_object_dispose(&v15, 8);
  return v9;
}

void __81__NPKGizmoDatabase_filteredPassesUsingPassDescriptionPredicate_includeImageSets___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  if (objc_msgSend(*(id *)(a1 + 32), "database"))
  {
    objc_msgSend(*(id *)(a1 + 32), "_loadInitialManifestLocked");
    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v3 = *(id *)(*(_QWORD *)(a1 + 32) + 352);
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v16;
      do
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v16 != v6)
            objc_enumerationMutation(v3);
          v8 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
          if (objc_msgSend(*(id *)(a1 + 40), "evaluateWithObject:", v8, (_QWORD)v15))
          {
            v9 = *(void **)(a1 + 32);
            objc_msgSend(v8, "uniqueID");
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "_passForUniqueIDLocked:includeImageSets:", v10, *(unsigned __int8 *)(a1 + 56));
            v11 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v2, "addObject:", v11);
          }
        }
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v5);
    }

    v12 = objc_msgSend(v2, "copy");
    v13 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v14 = *(void **)(v13 + 40);
    *(_QWORD *)(v13 + 40) = v12;

  }
}

- (void)_rebuildDatabaseWithPassesFromCompanionPasses
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  NSObject *v12;
  _BOOL4 v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  void *v20;
  NSObject *v21;
  _BOOL4 v22;
  NSObject *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  _BOOL4 v27;
  NSObject *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  NSObject *v33;
  _BOOL4 v34;
  NSObject *v35;
  id v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t k;
  uint64_t v41;
  void *v42;
  void *v43;
  uint64_t v44;
  void *v45;
  uint64_t v46;
  NSObject *v47;
  NSObject *v48;
  _BOOL4 v49;
  NSObject *v50;
  const char *v51;
  NSObject *v52;
  os_log_type_t v53;
  uint32_t v54;
  _BOOL4 v55;
  void *v56;
  id v57;
  id obj;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  char v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  uint8_t v72[128];
  uint8_t buf[4];
  uint64_t v74;
  __int16 v75;
  id v76;
  __int16 v77;
  void *v78;
  _BYTE v79[128];
  _BYTE v80[128];
  uint64_t v81;

  v81 = *MEMORY[0x24BDAC8D0];
  objc_msgSend((id)objc_opt_class(), "_migrationDataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "companionPaymentPassUniqueIDs");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(v4, "count"));
  v68 = 0u;
  v69 = 0u;
  v70 = 0u;
  v71 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v68, v80, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v69;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v69 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(v3, "companionPaymentPassWithUniqueID:", *(_QWORD *)(*((_QWORD *)&v68 + 1) + 8 * i));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "npkSafelyAddObject:", v11);

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v68, v80, 16);
    }
    while (v8);
  }

  pk_General_log();
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);

  if (v13)
  {
    pk_General_log();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v15 = objc_msgSend(v5, "count");
      *(_DWORD *)buf = 134218242;
      v74 = v15;
      v75 = 2112;
      v76 = v6;
      _os_log_impl(&dword_213518000, v14, OS_LOG_TYPE_DEFAULT, "Notice: NPKGizmoDatabase: Re-encoding payment passes migration step. Re-saving %lu payment passes with unique IDs: %@", buf, 0x16u);
    }

  }
  v56 = v6;
  v66 = 0u;
  v67 = 0u;
  v64 = 0u;
  v65 = 0u;
  obj = v5;
  v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v64, v79, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v65;
    do
    {
      for (j = 0; j != v17; ++j)
      {
        if (*(_QWORD *)v65 != v18)
          objc_enumerationMutation(obj);
        v20 = *(void **)(*((_QWORD *)&v64 + 1) + 8 * j);
        pk_General_log();
        v21 = objc_claimAutoreleasedReturnValue();
        v22 = os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT);

        if (v22)
        {
          pk_General_log();
          v23 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v20, "uniqueID");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "localizedDescription");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            v74 = (uint64_t)v24;
            v75 = 2112;
            v76 = v25;
            _os_log_impl(&dword_213518000, v23, OS_LOG_TYPE_DEFAULT, "Notice: NPKGizmoDatabase: Re-encoding - Will save payment pass with unique id: %@, localized description: %@", buf, 0x16u);

          }
        }
        v63 = 0;
        -[NPKGizmoDatabase _savePassLocked:locallyAdded:wasUpdate:](self, "_savePassLocked:locallyAdded:wasUpdate:", v20, 0, &v63);
        pk_General_log();
        v26 = objc_claimAutoreleasedReturnValue();
        v27 = os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT);

        if (v27)
        {
          pk_General_log();
          v28 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v20, "uniqueID");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "localizedDescription");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            NSStringFromBOOL();
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412802;
            v74 = (uint64_t)v29;
            v75 = 2112;
            v76 = v30;
            v77 = 2112;
            v78 = v31;
            _os_log_impl(&dword_213518000, v28, OS_LOG_TYPE_DEFAULT, "Notice: NPKGizmoDatabase: Re-encoding - Did save save payment pass with unique id: %@ localized description: %@, was update?: %@", buf, 0x20u);

          }
        }
      }
      v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v64, v79, 16);
    }
    while (v17);
  }

  v32 = v56;
  if (os_variant_has_internal_ui())
  {
    pk_General_log();
    v33 = objc_claimAutoreleasedReturnValue();
    v34 = os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT);

    if (v34)
    {
      pk_General_log();
      v35 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v74 = (uint64_t)v56;
        _os_log_impl(&dword_213518000, v35, OS_LOG_TYPE_DEFAULT, "Notice: NPKGizmoDatabase: Verifying re-encoding payment passes after migration step. Passes to verify: %@", buf, 0xCu);
      }

    }
    v57 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    v59 = 0u;
    v60 = 0u;
    v61 = 0u;
    v62 = 0u;
    v36 = v56;
    v37 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v59, v72, 16);
    if (v37)
    {
      v38 = v37;
      v39 = *(_QWORD *)v60;
      do
      {
        for (k = 0; k != v38; ++k)
        {
          if (*(_QWORD *)v60 != v39)
            objc_enumerationMutation(v36);
          v41 = *(_QWORD *)(*((_QWORD *)&v59 + 1) + 8 * k);
          -[NPKGizmoDatabase _passForUniqueIDLocked:includeImageSets:](self, "_passForUniqueIDLocked:includeImageSets:", v41, 0);
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v42, "passTypeIdentifier");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          v44 = objc_msgSend(v43, "length");

          if (!v44)
          {
            objc_msgSend(v42, "localizedDescription");
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v57, "setObject:forKeyedSubscript:", v45, v41);

          }
        }
        v38 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v59, v72, 16);
      }
      while (v38);
    }

    v46 = objc_msgSend(v57, "count");
    pk_General_log();
    v47 = objc_claimAutoreleasedReturnValue();
    v48 = v47;
    if (v46)
    {
      v49 = os_log_type_enabled(v47, OS_LOG_TYPE_ERROR);

      v32 = v56;
      if (v49)
      {
        pk_General_log();
        v50 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v74 = (uint64_t)v57;
          v51 = "Error: NPKGizmoDatabase: Re-encoding payment passes migration step verification found encoding issues in"
                " passes with unique IDs: %@";
          v52 = v50;
          v53 = OS_LOG_TYPE_ERROR;
          v54 = 12;
LABEL_48:
          _os_log_impl(&dword_213518000, v52, v53, v51, buf, v54);
          goto LABEL_49;
        }
        goto LABEL_49;
      }
    }
    else
    {
      v55 = os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT);

      v32 = v56;
      if (v55)
      {
        pk_General_log();
        v50 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          v51 = "Notice: NPKGizmoDatabase: Re-encoding payment passes migration step verification did not find any encoding issues";
          v52 = v50;
          v53 = OS_LOG_TYPE_DEFAULT;
          v54 = 2;
          goto LABEL_48;
        }
LABEL_49:

      }
    }

  }
}

- (void)_verifyPassDataIsUnarchivedCorrectlyWithData:(id)a3 forPassWithUniqueID:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  _BOOL4 v13;
  NSObject *v14;
  const char *v15;
  NSObject *v16;
  _BOOL4 v17;
  int v18;
  const char *v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  if (os_variant_has_internal_ui())
  {
    v7 = objc_opt_class();
    NPKSecureUnarchiveObject(v5, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
    {
      objc_msgSend(v8, "passTypeIdentifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "length");

      if (v11)
        goto LABEL_12;
      pk_General_log();
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);

      if (!v13)
        goto LABEL_12;
      pk_General_log();
      v14 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        goto LABEL_11;
      v18 = 136315394;
      v19 = "-[NPKGizmoDatabase _verifyPassDataIsUnarchivedCorrectlyWithData:forPassWithUniqueID:]";
      v20 = 2112;
      v21 = v6;
      v15 = "Warning: %s encoded_pass Updating the pass with encoded data of pass with uniqueID %@ is missing the type identifier.";
    }
    else
    {
      pk_General_log();
      v16 = objc_claimAutoreleasedReturnValue();
      v17 = os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT);

      if (!v17)
      {
LABEL_12:

        goto LABEL_13;
      }
      pk_General_log();
      v14 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
LABEL_11:

        goto LABEL_12;
      }
      v18 = 136315394;
      v19 = "-[NPKGizmoDatabase _verifyPassDataIsUnarchivedCorrectlyWithData:forPassWithUniqueID:]";
      v20 = 2112;
      v21 = v6;
      v15 = "Warning: %s encoded_pass There was a problem unarchiving the pass archive for pass with uniqueID %@.";
    }
    _os_log_impl(&dword_213518000, v14, OS_LOG_TYPE_DEFAULT, v15, (uint8_t *)&v18, 0x16u);
    goto LABEL_11;
  }
LABEL_13:

}

- (BOOL)_migrateDatabase:(id)a3
{
  id v4;
  int64_t v5;
  uint64_t v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  _BOOL4 v10;
  BOOL v11;
  _QWORD v13[5];
  NSObject *v14;
  uint64_t *v15;
  int64_t v16;
  uint64_t v17;
  char v18;
  __int16 v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  char v23;
  uint8_t buf[4];
  int64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v20 = 0;
  v21 = &v20;
  v22 = 0x2020000000;
  v23 = 1;
  v19 = 0;
  v5 = -[NPKGizmoDatabase _databaseVersionExists:valid:](self, "_databaseVersionExists:valid:", (char *)&v19 + 1, &v19);
  v6 = objc_msgSend((id)objc_opt_class(), "maxDatabaseVersion");
  if (v5 >= v6)
  {
    pk_General_log();
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);

    if (!v10)
      goto LABEL_7;
    pk_General_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v25 = v5;
      _os_log_impl(&dword_213518000, v8, OS_LOG_TYPE_DEFAULT, "Notice: NPKGizmoDatabase: on-disk version %ld matches current version", buf, 0xCu);
    }
  }
  else
  {
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __37__NPKGizmoDatabase__migrateDatabase___block_invoke;
    v13[3] = &unk_24CFEB4D8;
    v16 = v5;
    v17 = v6;
    v15 = &v20;
    v7 = v4;
    v18 = HIBYTE(v19);
    v13[4] = self;
    v14 = v7;
    -[NPKGizmoDatabase _performTransactionWithBlock:](self, "_performTransactionWithBlock:", v13);
    v8 = v14;
  }

LABEL_7:
  v11 = *((_BYTE *)v21 + 24) != 0;
  _Block_object_dispose(&v20, 8);

  return v11;
}

uint64_t __37__NPKGizmoDatabase__migrateDatabase___block_invoke(uint64_t a1)
{
  NSObject *v2;
  _BOOL4 v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  _BOOL4 v8;
  NSObject *v9;
  int v10;
  void *v11;
  uint64_t v12;
  int v14;
  uint64_t v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  pk_General_log();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT);

  if (v3)
  {
    pk_General_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = *(_QWORD *)(a1 + 56);
      v6 = *(_QWORD *)(a1 + 64);
      v14 = 134218240;
      v15 = v5;
      v16 = 2048;
      v17 = v6;
      _os_log_impl(&dword_213518000, v4, OS_LOG_TYPE_DEFAULT, "Notice: NPKGizmoDatabase: on-disk version %ld out of date, migrating to current version %ld", (uint8_t *)&v14, 0x16u);
    }

  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  pk_General_log();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);

  if (v8)
  {
    pk_General_log();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
      v14 = 67109120;
      LODWORD(v15) = v10;
      _os_log_impl(&dword_213518000, v9, OS_LOG_TYPE_DEFAULT, "Notice: NPKGizmoDatabase: migration success = %d", (uint8_t *)&v14, 8u);
    }

  }
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
  {
    v11 = *(void **)(a1 + 32);
    v12 = *(_QWORD *)(a1 + 64);
    if (*(_BYTE *)(a1 + 72))
      objc_msgSend(v11, "_updateDatabaseVersionRow:", v12);
    else
      objc_msgSend(v11, "_insertDatabaseVersionRow:", v12);
  }
  return *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
}

- (int64_t)_databaseVersionExists:(BOOL *)a3 valid:(BOOL *)a4
{
  int64_t v7;
  _QWORD v9[7];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;

  -[NPKGizmoDatabase _executeSQL:](self, "_executeSQL:", CFSTR("CREATE TABLE IF NOT EXISTS key_value_store (key TEXT NOT NULL, value TEXT);"));
  -[NPKGizmoDatabase _executeSQL:](self, "_executeSQL:", CFSTR("CREATE UNIQUE INDEX IF NOT EXISTS key_value_store_idx1 ON key_value_store(key)"));
  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __49__NPKGizmoDatabase__databaseVersionExists_valid___block_invoke;
  v9[3] = &unk_24CFEB500;
  v9[4] = &v10;
  v9[5] = a3;
  v9[6] = a4;
  -[NPKGizmoDatabase _executeSQLQuery:processResultsBlock:](self, "_executeSQLQuery:processResultsBlock:", CFSTR("SELECT value FROM key_value_store WHERE KEY=\"version\"), v9);
  v7 = v11[3];
  _Block_object_dispose(&v10, 8);
  return v7;
}

void __49__NPKGizmoDatabase__databaseVersionExists_valid___block_invoke(_QWORD *a1, int a2, sqlite3_stmt *a3)
{
  int v5;
  _BYTE *v6;
  void *v7;
  _BYTE *v8;
  _BYTE *v9;
  NSObject *v10;
  _BOOL4 v11;
  NSObject *v12;
  int v13;
  const char *v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  if (a3)
  {
    v5 = sqlite3_step(a3);
    v6 = (_BYTE *)a1[5];
    if (v5 == 100)
    {
      if (v6)
        *v6 = 1;
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", sqlite3_column_text(a3, 0));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 24) = objc_msgSend(v7, "integerValue");
      if (*(uint64_t *)(*(_QWORD *)(a1[4] + 8) + 24) < 1)
      {
        pk_General_log();
        v10 = objc_claimAutoreleasedReturnValue();
        v11 = os_log_type_enabled(v10, OS_LOG_TYPE_ERROR);

        if (v11)
        {
          pk_General_log();
          v12 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
          {
            v13 = 136446978;
            v14 = "-[NPKGizmoDatabase _databaseVersionExists:valid:]_block_invoke";
            v15 = 2082;
            v16 = "/Library/Caches/com.apple.xbs/Sources/NanoPassbook_Frameworks/NanoPassKit/NPKGizmoDatabase.m";
            v17 = 2048;
            v18 = 4619;
            v19 = 2112;
            v20 = v7;
            _os_log_impl(&dword_213518000, v12, OS_LOG_TYPE_ERROR, "Error: *** NPKAssertion failure in %{public}s, %{public}s:%ld (reason: Invalid pass DB version string: %@)", (uint8_t *)&v13, 0x2Au);
          }

        }
        _NPKAssertAbort();
      }
      v8 = (_BYTE *)a1[6];
      if (v8)
        *v8 = 1;

    }
    else
    {
      if (v6)
        *v6 = 0;
      v9 = (_BYTE *)a1[6];
      if (v9)
        *v9 = 1;
    }
  }
}

- (void)_insertDatabaseVersionRow:(int64_t)a3
{
  int64_t v5;
  NSObject *v6;
  _BOOL4 v7;
  NSObject *v8;
  void *v9;
  BOOL v10;
  NSObject *v11;
  _BOOL4 v12;
  NSObject *v13;
  uint8_t buf[4];
  const char *v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  int64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v5 = objc_msgSend((id)objc_opt_class(), "maxDatabaseVersion");
  if (a3 < 1 || v5 < a3)
  {
    pk_General_log();
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = os_log_type_enabled(v6, OS_LOG_TYPE_ERROR);

    if (v7)
    {
      pk_General_log();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446978;
        v15 = "-[NPKGizmoDatabase _insertDatabaseVersionRow:]";
        v16 = 2082;
        v17 = "/Library/Caches/com.apple.xbs/Sources/NanoPassbook_Frameworks/NanoPassKit/NPKGizmoDatabase.m";
        v18 = 2048;
        v19 = 4633;
        v20 = 2048;
        v21 = a3;
        _os_log_impl(&dword_213518000, v8, OS_LOG_TYPE_ERROR, "Error: *** NPKAssertion failure in %{public}s, %{public}s:%ld (reason: Cannot save unsupported database version %ld)", buf, 0x2Au);
      }

    }
    _NPKAssertAbort();
  }
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("INSERT INTO key_value_store (key, value) VALUES (\"version\", \"%ld\")"), a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[NPKGizmoDatabase _executeSQL:](self, "_executeSQL:", v9);

  if (!v10)
  {
    pk_General_log();
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = os_log_type_enabled(v11, OS_LOG_TYPE_ERROR);

    if (v12)
    {
      pk_General_log();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446978;
        v15 = "-[NPKGizmoDatabase _insertDatabaseVersionRow:]";
        v16 = 2082;
        v17 = "/Library/Caches/com.apple.xbs/Sources/NanoPassbook_Frameworks/NanoPassKit/NPKGizmoDatabase.m";
        v18 = 2048;
        v19 = 4635;
        v20 = 2048;
        v21 = a3;
        _os_log_impl(&dword_213518000, v13, OS_LOG_TYPE_ERROR, "Error: *** NPKAssertion failure in %{public}s, %{public}s:%ld (reason: Unable to save version number to DB: %ld)", buf, 0x2Au);
      }

    }
    _NPKAssertAbort();
  }
}

- (void)_updateDatabaseVersionRow:(int64_t)a3
{
  int64_t v5;
  NSObject *v6;
  _BOOL4 v7;
  NSObject *v8;
  void *v9;
  BOOL v10;
  NSObject *v11;
  _BOOL4 v12;
  NSObject *v13;
  uint8_t buf[4];
  const char *v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  int64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v5 = objc_msgSend((id)objc_opt_class(), "maxDatabaseVersion");
  if (a3 < 1 || v5 < a3)
  {
    pk_General_log();
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = os_log_type_enabled(v6, OS_LOG_TYPE_ERROR);

    if (v7)
    {
      pk_General_log();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446978;
        v15 = "-[NPKGizmoDatabase _updateDatabaseVersionRow:]";
        v16 = 2082;
        v17 = "/Library/Caches/com.apple.xbs/Sources/NanoPassbook_Frameworks/NanoPassKit/NPKGizmoDatabase.m";
        v18 = 2048;
        v19 = 4639;
        v20 = 2048;
        v21 = a3;
        _os_log_impl(&dword_213518000, v8, OS_LOG_TYPE_ERROR, "Error: *** NPKAssertion failure in %{public}s, %{public}s:%ld (reason: Cannot save unsupported database version %ld)", buf, 0x2Au);
      }

    }
    _NPKAssertAbort();
  }
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("UPDATE key_value_store SET value=\"%ld\" WHERE key=\"version\"), a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[NPKGizmoDatabase _executeSQL:](self, "_executeSQL:", v9);

  if (!v10)
  {
    pk_General_log();
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = os_log_type_enabled(v11, OS_LOG_TYPE_ERROR);

    if (v12)
    {
      pk_General_log();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446978;
        v15 = "-[NPKGizmoDatabase _updateDatabaseVersionRow:]";
        v16 = 2082;
        v17 = "/Library/Caches/com.apple.xbs/Sources/NanoPassbook_Frameworks/NanoPassKit/NPKGizmoDatabase.m";
        v18 = 2048;
        v19 = 4641;
        v20 = 2048;
        v21 = a3;
        _os_log_impl(&dword_213518000, v13, OS_LOG_TYPE_ERROR, "Error: *** NPKAssertion failure in %{public}s, %{public}s:%ld (reason: Unable to save version number to DB: %ld)", buf, 0x2Au);
      }

    }
    _NPKAssertAbort();
  }
}

- (BOOL)_preconditionsMetForDatabaseOpen
{
  void *v2;

  objc_msgSend((id)objc_opt_class(), "_migrationDataSource");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2 && MKBDeviceUnlockedSinceBoot() == 1;
}

- (void)_handleDatabaseChangedExternally
{
  NSObject *dbQueue;
  _QWORD block[5];

  dbQueue = self->_dbQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __52__NPKGizmoDatabase__handleDatabaseChangedExternally__block_invoke;
  block[3] = &unk_24CFE7998;
  block[4] = self;
  dispatch_async(dbQueue, block);
}

void __52__NPKGizmoDatabase__handleDatabaseChangedExternally__block_invoke(uint64_t a1)
{
  int v2;
  NSObject *v3;
  _BOOL4 v4;
  NSObject *v5;
  NSObject *v6;
  uint8_t v7[16];
  uint8_t buf[16];

  v2 = *(_DWORD *)(*(_QWORD *)(a1 + 32) + 368);
  pk_General_log();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);

  if (v2 < 1)
  {
    if (v4)
    {
      pk_General_log();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v7 = 0;
        _os_log_impl(&dword_213518000, v6, OS_LOG_TYPE_DEFAULT, "Notice: NPKGizmoDatabase DB changed externally, reloading", v7, 2u);
      }

    }
    objc_msgSend(*(id *)(a1 + 32), "_inQueue_teardownDB");
  }
  else
  {
    if (v4)
    {
      pk_General_log();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_213518000, v5, OS_LOG_TYPE_DEFAULT, "Notice: We were expecting a DB change, so suppressing DB reload", buf, 2u);
      }

    }
    --*(_DWORD *)(*(_QWORD *)(a1 + 32) + 368);
  }
}

- (void)teardownDB
{
  NSObject *dbQueue;
  _QWORD block[5];

  dbQueue = self->_dbQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __30__NPKGizmoDatabase_teardownDB__block_invoke;
  block[3] = &unk_24CFE7998;
  block[4] = self;
  dispatch_sync(dbQueue, block);
}

uint64_t __30__NPKGizmoDatabase_teardownDB__block_invoke(uint64_t a1)
{
  NSObject *v2;
  _BOOL4 v3;
  NSObject *v4;
  uint8_t v6[16];

  pk_General_log();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT);

  if (v3)
  {
    pk_General_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_213518000, v4, OS_LOG_TYPE_DEFAULT, "Notice: requested to teardown NPKGizmoDatabase DB", v6, 2u);
    }

  }
  return objc_msgSend(*(id *)(a1 + 32), "_inQueue_teardownDB");
}

- (void)_inQueue_teardownDB
{
  NSObject *v3;
  _BOOL4 v4;
  NSObject *v5;
  sqlite3_stmt *deleteStatement;
  sqlite3_stmt *insertStatement;
  sqlite3_stmt *insertDiffStatement;
  sqlite3_stmt *selectPassDataStatement;
  sqlite3_stmt *selectPassAndImageSetsDataStatement;
  sqlite3_stmt *selectPassDiffStatement;
  sqlite3_stmt *updateDeletePendingStatement;
  sqlite3_stmt *selectDeletePendingStatement;
  sqlite3_stmt *updatePreferredAIDStatement;
  sqlite3_stmt *selectPreferredAIDStatement;
  sqlite3_stmt *insertTransactionStatement;
  sqlite3_stmt *removeTransactionStatement;
  sqlite3_stmt *removeTransactionWithServiceIdentifier;
  sqlite3_stmt *selectTransactionsStatement;
  sqlite3_stmt *selectTransactionsStatementWithSource;
  sqlite3_stmt *selectTransactionsStatementWithoutSource;
  sqlite3_stmt *selectTransactionWithIdentifierStatement;
  sqlite3_stmt *selectTransactionWithServiceIdentifierStatement;
  sqlite3_stmt *insertTransactionSourceIdentifierForPassStatement;
  sqlite3_stmt *selectTransactionSourceIdentifierForTransactionWithIdentifierStatement;
  sqlite3_stmt *selectTransactionSourceIdentifierForTransactionWithServiceIdentifierStatement;
  sqlite3_stmt *selectTransactionSourceIdentifierForPassUniqueIdentifierStatement;
  sqlite3_stmt *selectPassUniqueIdentifierForTransactionSourceIdentifierStatement;
  sqlite3_stmt *deleteTransactionSourceIdentifierForPassStatement;
  sqlite3_stmt *deleteTransactionsForTransactionSourceStatement;
  sqlite3_stmt *trimTransactionsForTransactionSourceStatement;
  sqlite3_stmt *selectTransitAppletStateForPassStatement;
  sqlite3_stmt *updateTransitAppletStateForPassStatement;
  sqlite3_stmt *insertEphemeralTransactionStatement;
  sqlite3_stmt *deleteEphemeralTransactionByTransactionSourceIdentifierStatement;
  sqlite3_stmt *currentEphemeralTransactionIdentifierStatement;
  sqlite3_stmt *selectLastAddValueAmountForPassStatement;
  sqlite3_stmt *updateLastAddValueAmountForPassStatement;
  sqlite3_stmt *selectPendingAddValueDateForPassStatement;
  sqlite3_stmt *updatePendingAddValueDateForPassStatement;
  sqlite3_stmt *selectBalancesForPassStatement;
  sqlite3_stmt *updateBalancesForPassStatement;
  sqlite3_stmt *selectSubcredentialsForPassStatement;
  sqlite3_stmt *updateSubcredentialsForPassStatement;
  sqlite3 *database;
  NSMutableDictionary *manifest;
  NSMutableArray *passDescriptions;
  NSArray *libraryHashes;
  uint8_t v49[16];

  dispatch_assert_queue_V2((dispatch_queue_t)self->_dbQueue);
  pk_General_log();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);

  if (v4)
  {
    pk_General_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v49 = 0;
      _os_log_impl(&dword_213518000, v5, OS_LOG_TYPE_DEFAULT, "Notice: tearing down NPKGizmoDatabase DB", v49, 2u);
    }

  }
  deleteStatement = self->_deleteStatement;
  if (deleteStatement)
    sqlite3_finalize(deleteStatement);
  self->_deleteStatement = 0;
  insertStatement = self->_insertStatement;
  if (insertStatement)
    sqlite3_finalize(insertStatement);
  self->_insertStatement = 0;
  insertDiffStatement = self->_insertDiffStatement;
  if (insertDiffStatement)
    sqlite3_finalize(insertDiffStatement);
  self->_insertDiffStatement = 0;
  selectPassDataStatement = self->_selectPassDataStatement;
  if (selectPassDataStatement)
    sqlite3_finalize(selectPassDataStatement);
  self->_selectPassDataStatement = 0;
  selectPassAndImageSetsDataStatement = self->_selectPassAndImageSetsDataStatement;
  if (selectPassAndImageSetsDataStatement)
    sqlite3_finalize(selectPassAndImageSetsDataStatement);
  self->_selectPassAndImageSetsDataStatement = 0;
  selectPassDiffStatement = self->_selectPassDiffStatement;
  if (selectPassDiffStatement)
    sqlite3_finalize(selectPassDiffStatement);
  self->_selectPassDiffStatement = 0;
  updateDeletePendingStatement = self->_updateDeletePendingStatement;
  if (updateDeletePendingStatement)
    sqlite3_finalize(updateDeletePendingStatement);
  self->_updateDeletePendingStatement = 0;
  selectDeletePendingStatement = self->_selectDeletePendingStatement;
  if (selectDeletePendingStatement)
    sqlite3_finalize(selectDeletePendingStatement);
  self->_selectDeletePendingStatement = 0;
  updatePreferredAIDStatement = self->_updatePreferredAIDStatement;
  if (updatePreferredAIDStatement)
    sqlite3_finalize(updatePreferredAIDStatement);
  self->_updatePreferredAIDStatement = 0;
  selectPreferredAIDStatement = self->_selectPreferredAIDStatement;
  if (selectPreferredAIDStatement)
    sqlite3_finalize(selectPreferredAIDStatement);
  self->_selectPreferredAIDStatement = 0;
  insertTransactionStatement = self->_insertTransactionStatement;
  if (insertTransactionStatement)
    sqlite3_finalize(insertTransactionStatement);
  self->_insertTransactionStatement = 0;
  removeTransactionStatement = self->_removeTransactionStatement;
  if (removeTransactionStatement)
    sqlite3_finalize(removeTransactionStatement);
  self->_removeTransactionStatement = 0;
  removeTransactionWithServiceIdentifier = self->_removeTransactionWithServiceIdentifier;
  if (removeTransactionWithServiceIdentifier)
    sqlite3_finalize(removeTransactionWithServiceIdentifier);
  self->_removeTransactionWithServiceIdentifier = 0;
  selectTransactionsStatement = self->_selectTransactionsStatement;
  if (selectTransactionsStatement)
    sqlite3_finalize(selectTransactionsStatement);
  self->_selectTransactionsStatement = 0;
  selectTransactionsStatementWithSource = self->_selectTransactionsStatementWithSource;
  if (selectTransactionsStatementWithSource)
    sqlite3_finalize(selectTransactionsStatementWithSource);
  self->_selectTransactionsStatementWithSource = 0;
  selectTransactionsStatementWithoutSource = self->_selectTransactionsStatementWithoutSource;
  if (selectTransactionsStatementWithoutSource)
    sqlite3_finalize(selectTransactionsStatementWithoutSource);
  self->_selectTransactionsStatementWithoutSource = 0;
  selectTransactionWithIdentifierStatement = self->_selectTransactionWithIdentifierStatement;
  if (selectTransactionWithIdentifierStatement)
    sqlite3_finalize(selectTransactionWithIdentifierStatement);
  self->_selectTransactionWithIdentifierStatement = 0;
  selectTransactionWithServiceIdentifierStatement = self->_selectTransactionWithServiceIdentifierStatement;
  if (selectTransactionWithServiceIdentifierStatement)
    sqlite3_finalize(selectTransactionWithServiceIdentifierStatement);
  self->_selectTransactionWithServiceIdentifierStatement = 0;
  insertTransactionSourceIdentifierForPassStatement = self->_insertTransactionSourceIdentifierForPassStatement;
  if (insertTransactionSourceIdentifierForPassStatement)
    sqlite3_finalize(insertTransactionSourceIdentifierForPassStatement);
  self->_insertTransactionSourceIdentifierForPassStatement = 0;
  selectTransactionSourceIdentifierForTransactionWithIdentifierStatement = self->_selectTransactionSourceIdentifierForTransactionWithIdentifierStatement;
  if (selectTransactionSourceIdentifierForTransactionWithIdentifierStatement)
    sqlite3_finalize(selectTransactionSourceIdentifierForTransactionWithIdentifierStatement);
  self->_selectTransactionSourceIdentifierForTransactionWithIdentifierStatement = 0;
  selectTransactionSourceIdentifierForTransactionWithServiceIdentifierStatement = self->_selectTransactionSourceIdentifierForTransactionWithServiceIdentifierStatement;
  if (selectTransactionSourceIdentifierForTransactionWithServiceIdentifierStatement)
    sqlite3_finalize(selectTransactionSourceIdentifierForTransactionWithServiceIdentifierStatement);
  self->_selectTransactionSourceIdentifierForTransactionWithServiceIdentifierStatement = 0;
  selectTransactionSourceIdentifierForPassUniqueIdentifierStatement = self->_selectTransactionSourceIdentifierForPassUniqueIdentifierStatement;
  if (selectTransactionSourceIdentifierForPassUniqueIdentifierStatement)
    sqlite3_finalize(selectTransactionSourceIdentifierForPassUniqueIdentifierStatement);
  self->_selectTransactionSourceIdentifierForPassUniqueIdentifierStatement = 0;
  selectPassUniqueIdentifierForTransactionSourceIdentifierStatement = self->_selectPassUniqueIdentifierForTransactionSourceIdentifierStatement;
  if (selectPassUniqueIdentifierForTransactionSourceIdentifierStatement)
    sqlite3_finalize(selectPassUniqueIdentifierForTransactionSourceIdentifierStatement);
  self->_selectPassUniqueIdentifierForTransactionSourceIdentifierStatement = 0;
  deleteTransactionSourceIdentifierForPassStatement = self->_deleteTransactionSourceIdentifierForPassStatement;
  if (deleteTransactionSourceIdentifierForPassStatement)
    sqlite3_finalize(deleteTransactionSourceIdentifierForPassStatement);
  self->_deleteTransactionSourceIdentifierForPassStatement = 0;
  deleteTransactionsForTransactionSourceStatement = self->_deleteTransactionsForTransactionSourceStatement;
  if (deleteTransactionsForTransactionSourceStatement)
    sqlite3_finalize(deleteTransactionsForTransactionSourceStatement);
  self->_deleteTransactionsForTransactionSourceStatement = 0;
  trimTransactionsForTransactionSourceStatement = self->_trimTransactionsForTransactionSourceStatement;
  if (trimTransactionsForTransactionSourceStatement)
    sqlite3_finalize(trimTransactionsForTransactionSourceStatement);
  self->_trimTransactionsForTransactionSourceStatement = 0;
  selectTransitAppletStateForPassStatement = self->_selectTransitAppletStateForPassStatement;
  if (selectTransitAppletStateForPassStatement)
    sqlite3_finalize(selectTransitAppletStateForPassStatement);
  self->_selectTransitAppletStateForPassStatement = 0;
  updateTransitAppletStateForPassStatement = self->_updateTransitAppletStateForPassStatement;
  if (updateTransitAppletStateForPassStatement)
    sqlite3_finalize(updateTransitAppletStateForPassStatement);
  self->_updateTransitAppletStateForPassStatement = 0;
  insertEphemeralTransactionStatement = self->_insertEphemeralTransactionStatement;
  if (insertEphemeralTransactionStatement)
    sqlite3_finalize(insertEphemeralTransactionStatement);
  self->_insertEphemeralTransactionStatement = 0;
  deleteEphemeralTransactionByTransactionSourceIdentifierStatement = self->_deleteEphemeralTransactionByTransactionSourceIdentifierStatement;
  if (deleteEphemeralTransactionByTransactionSourceIdentifierStatement)
    sqlite3_finalize(deleteEphemeralTransactionByTransactionSourceIdentifierStatement);
  self->_deleteEphemeralTransactionByTransactionSourceIdentifierStatement = 0;
  currentEphemeralTransactionIdentifierStatement = self->_currentEphemeralTransactionIdentifierStatement;
  if (currentEphemeralTransactionIdentifierStatement)
    sqlite3_finalize(currentEphemeralTransactionIdentifierStatement);
  self->_currentEphemeralTransactionIdentifierStatement = 0;
  selectLastAddValueAmountForPassStatement = self->_selectLastAddValueAmountForPassStatement;
  if (selectLastAddValueAmountForPassStatement)
    sqlite3_finalize(selectLastAddValueAmountForPassStatement);
  self->_selectLastAddValueAmountForPassStatement = 0;
  updateLastAddValueAmountForPassStatement = self->_updateLastAddValueAmountForPassStatement;
  if (updateLastAddValueAmountForPassStatement)
    sqlite3_finalize(updateLastAddValueAmountForPassStatement);
  self->_updateLastAddValueAmountForPassStatement = 0;
  selectPendingAddValueDateForPassStatement = self->_selectPendingAddValueDateForPassStatement;
  if (selectPendingAddValueDateForPassStatement)
    sqlite3_finalize(selectPendingAddValueDateForPassStatement);
  self->_selectPendingAddValueDateForPassStatement = 0;
  updatePendingAddValueDateForPassStatement = self->_updatePendingAddValueDateForPassStatement;
  if (updatePendingAddValueDateForPassStatement)
    sqlite3_finalize(updatePendingAddValueDateForPassStatement);
  self->_updatePendingAddValueDateForPassStatement = 0;
  selectBalancesForPassStatement = self->_selectBalancesForPassStatement;
  if (selectBalancesForPassStatement)
    sqlite3_finalize(selectBalancesForPassStatement);
  self->_selectBalancesForPassStatement = 0;
  updateBalancesForPassStatement = self->_updateBalancesForPassStatement;
  if (updateBalancesForPassStatement)
    sqlite3_finalize(updateBalancesForPassStatement);
  self->_updateBalancesForPassStatement = 0;
  selectSubcredentialsForPassStatement = self->_selectSubcredentialsForPassStatement;
  if (selectSubcredentialsForPassStatement)
    sqlite3_finalize(selectSubcredentialsForPassStatement);
  self->_selectSubcredentialsForPassStatement = 0;
  updateSubcredentialsForPassStatement = self->_updateSubcredentialsForPassStatement;
  if (updateSubcredentialsForPassStatement)
    sqlite3_finalize(updateSubcredentialsForPassStatement);
  self->_updateSubcredentialsForPassStatement = 0;
  database = self->_database;
  if (database)
    sqlite3_close(database);
  self->_database = 0;
  manifest = self->_manifest;
  self->_manifest = 0;

  passDescriptions = self->_passDescriptions;
  self->_passDescriptions = 0;

  libraryHashes = self->_libraryHashes;
  self->_libraryHashes = 0;

  self->_passDBIsAvailable = 0;
  -[NPKGizmoDatabase _notifyDatabaseChangedWithNoop:](self, "_notifyDatabaseChangedWithNoop:", 0);
}

- (void)_handleFirstUnlock
{
  NSObject *v3;
  _BOOL4 v4;
  NSObject *v5;
  uint8_t v6[16];

  pk_General_log();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);

  if (v4)
  {
    pk_General_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_213518000, v5, OS_LOG_TYPE_DEFAULT, "Notice: First unlock detected", v6, 2u);
    }

  }
  if (-[NPKGizmoDatabase _preconditionsMetForDatabaseOpen](self, "_preconditionsMetForDatabaseOpen"))
    -[NPKGizmoDatabase _attemptDatabaseOpen](self, "_attemptDatabaseOpen");
}

- (void)_handleHasMigrationDataSource
{
  NSObject *v3;
  _BOOL4 v4;
  NSObject *v5;
  uint8_t v6[16];

  pk_General_log();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);

  if (v4)
  {
    pk_General_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_213518000, v5, OS_LOG_TYPE_DEFAULT, "Notice: Have migration data source", v6, 2u);
    }

  }
  if (-[NPKGizmoDatabase _preconditionsMetForDatabaseOpen](self, "_preconditionsMetForDatabaseOpen"))
    -[NPKGizmoDatabase _attemptDatabaseOpen](self, "_attemptDatabaseOpen");
}

- (void)_attemptDatabaseOpen
{
  NSObject *dbQueue;
  _QWORD block[5];

  dbQueue = self->_dbQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __40__NPKGizmoDatabase__attemptDatabaseOpen__block_invoke;
  block[3] = &unk_24CFE7998;
  block[4] = self;
  dispatch_async(dbQueue, block);
}

uint64_t __40__NPKGizmoDatabase__attemptDatabaseOpen__block_invoke(uint64_t result)
{
  uint64_t v1;
  NSObject *v2;
  _BOOL4 v3;
  NSObject *v4;
  uint8_t v5[16];

  if (!*(_QWORD *)(*(_QWORD *)(result + 32) + 8))
  {
    v1 = result;
    pk_General_log();
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT);

    if (v3)
    {
      pk_General_log();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v5 = 0;
        _os_log_impl(&dword_213518000, v4, OS_LOG_TYPE_DEFAULT, "Notice: Retrying opening database", v5, 2u);
      }

    }
    return objc_msgSend(*(id *)(v1 + 32), "database");
  }
  return result;
}

- (BOOL)_table:(id)a3 containsColumn:(id)a4
{
  char *v6;
  char *v7;
  NSObject *v8;
  _BOOL4 v9;
  NSObject *v10;
  void *v11;
  sqlite3 *v12;
  id v13;
  NSObject *v14;
  _BOOL4 v15;
  NSObject *v16;
  char v17;
  const unsigned __int8 *v18;
  void *v19;
  NSObject *v20;
  _BOOL4 v21;
  NSObject *v22;
  BOOL v23;
  NSObject *v24;
  _BOOL4 v25;
  NSObject *v26;
  sqlite3_stmt *ppStmt;
  uint8_t buf[4];
  const char *v30;
  __int16 v31;
  const char *v32;
  __int16 v33;
  uint64_t v34;
  __int16 v35;
  char *v36;
  __int16 v37;
  char *v38;
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v6 = (char *)a3;
  v7 = (char *)a4;
  pk_General_log();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);

  if (v9)
  {
    pk_General_log();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v30 = v7;
      v31 = 2112;
      v32 = v6;
      _os_log_impl(&dword_213518000, v10, OS_LOG_TYPE_DEFAULT, "Notice: Start search column:%@ in table:%@", buf, 0x16u);
    }

  }
  ppStmt = 0;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("PRAGMA table_info('%@')"), v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[NPKGizmoDatabase database](self, "database");
  v13 = objc_retainAutorelease(v11);
  if (sqlite3_prepare_v2(v12, (const char *)objc_msgSend(v13, "UTF8String"), -1, &ppStmt, 0))
  {
    pk_General_log();
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = os_log_type_enabled(v14, OS_LOG_TYPE_ERROR);

    if (v15)
    {
      pk_General_log();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136447234;
        v30 = "-[NPKGizmoDatabase _table:containsColumn:]";
        v31 = 2082;
        v32 = "/Library/Caches/com.apple.xbs/Sources/NanoPassbook_Frameworks/NanoPassKit/NPKGizmoDatabase.m";
        v33 = 2048;
        v34 = 4814;
        v35 = 2112;
        v36 = v7;
        v37 = 2112;
        v38 = v6;
        _os_log_impl(&dword_213518000, v16, OS_LOG_TYPE_ERROR, "Error: *** NPKAssertion failure in %{public}s, %{public}s:%ld (reason: Unable to prepare statement to find column:%@ in table:%@)", buf, 0x34u);
      }

    }
    _NPKAssertAbort();
  }
  v17 = 0;
  while (sqlite3_step(ppStmt) == 100)
  {
    v18 = sqlite3_column_text(ppStmt, 1);
    if (v18)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v18, 4);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v7, "isEqualToString:", v19);

    }
    if ((v17 & 1) != 0)
    {
      pk_General_log();
      v20 = objc_claimAutoreleasedReturnValue();
      v21 = os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT);

      if (v21)
      {
        pk_General_log();
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          v30 = v7;
          v31 = 2112;
          v32 = v6;
          _os_log_impl(&dword_213518000, v22, OS_LOG_TYPE_DEFAULT, "Notice: found column:%@ in table:%@", buf, 0x16u);
        }

      }
      v23 = 1;
      goto LABEL_25;
    }
  }
  pk_General_log();
  v24 = objc_claimAutoreleasedReturnValue();
  v25 = os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT);

  v23 = 0;
  if (v25)
  {
    pk_General_log();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v30 = v7;
      v31 = 2112;
      v32 = v6;
      _os_log_impl(&dword_213518000, v26, OS_LOG_TYPE_DEFAULT, "Notice: Could not find column:%@ in table:%@", buf, 0x16u);
    }

    v23 = 0;
  }
LABEL_25:
  sqlite3_finalize(ppStmt);

  return v23;
}

- (void)setPassDBIsAvailable:(BOOL)a3
{
  self->_passDBIsAvailable = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_libraryHashes, 0);
  objc_storeStrong((id *)&self->_passDescriptions, 0);
  objc_storeStrong((id *)&self->_manifest, 0);
  objc_storeStrong((id *)&self->_dbQueue, 0);
}

@end
