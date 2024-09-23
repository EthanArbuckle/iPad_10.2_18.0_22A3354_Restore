@implementation BCSPersistentStore

+ (const)debugQueueName
{
  return "com.apple.businesschat.persistentStore";
}

- (BCSPersistentStore)init
{
  BCSPersistentStore *v2;
  BCSPersistentStore *v3;
  void *v4;
  uint64_t Serial;
  OS_dispatch_queue *queue;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)BCSPersistentStore;
  v2 = -[BCSPersistentStore init](&v8, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_batchCount = 0;
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", objc_msgSend((id)objc_opt_class(), "debugQueueName"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    Serial = BSDispatchQueueCreateSerial();
    queue = v3->_queue;
    v3->_queue = (OS_dispatch_queue *)Serial;

  }
  return v3;
}

- (void)dealloc
{
  NSObject *v3;
  objc_super v4;
  uint8_t buf[16];

  if (self->_batchCount >= 1)
  {
    ABSLogCommon();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_20ACAD000, v3, OS_LOG_TYPE_ERROR, "Dealloc'ing BCSPersistentStore with an unbalanced batchCount", buf, 2u);
    }

  }
  v4.receiver = self;
  v4.super_class = (Class)BCSPersistentStore;
  -[BCSPersistentStore dealloc](&v4, sel_dealloc);
}

- (BOOL)deleteDatabaseFile
{
  void *v3;
  void *v4;
  char v5;

  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[BCSPersistentStore databasePath](self, "databasePath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "removeItemAtPath:error:", v4, 0);

  return v5;
}

void __51__BCSPersistentStore_queue_openDatabaseIfNecessary__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  NSObject *v6;
  id v7;
  id v8;
  const char *v9;
  sqlite3 *v10;
  dispatch_queue_t *v11;
  int v12;
  dispatch_queue_t *v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  const char *v17;
  NSObject *v18;
  NSObject *v19;
  void *v20;
  sqlite3_stmt *ppStmt;
  _BYTE ppDb[24];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  ABSLogCommon();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)ppDb = 138412290;
    *(_QWORD *)&ppDb[4] = v3;
    _os_log_debug_impl(&dword_20ACAD000, v4, OS_LOG_TYPE_DEBUG, "Creating database at path: %@", ppDb, 0xCu);
  }

  v5 = *(_QWORD *)(a1 + 32);
  if (!v5)
    goto LABEL_20;
  v6 = *(NSObject **)(v5 + 24);
  v7 = *(id *)(a1 + 40);
  dispatch_assert_queue_V2(v6);
  *(_QWORD *)ppDb = 0;
  v8 = objc_retainAutorelease(v7);
  v9 = (const char *)objc_msgSend(v8, "UTF8String");

  v10 = sqlite3_open_v2(v9, (sqlite3 **)ppDb, 65542, 0) ? 0 : *(sqlite3 **)ppDb;
  v11 = *(dispatch_queue_t **)(a1 + 32);
  if (v11)
  {
    dispatch_assert_queue_V2(v11[3]);
    v12 = sqlite3_exec(v10, (const char *)-[dispatch_queue_t schema](v11, "schema"), 0, 0, 0);
    v13 = *(dispatch_queue_t **)(a1 + 32);
    v14 = -[dispatch_queue_t schemaVersion](v13, "schemaVersion");
    if (v13)
    {
      v15 = v14;
      dispatch_assert_queue_V2(v13[3]);
      ppStmt = 0;
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("PRAGMA user_version=%ld"), v15);
      v16 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v17 = (const char *)objc_msgSend(v16, "UTF8String");

      if (!sqlite3_prepare_v2(v10, v17, -1, &ppStmt, 0))
      {
        if (sqlite3_step(ppStmt) == 101)
        {
          sqlite3_finalize(ppStmt);
          if (!v12)
          {
            *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) = v10;
            goto LABEL_19;
          }
        }
        else
        {
          ABSLogCommon();
          v18 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)ppDb = 134217984;
            *(_QWORD *)&ppDb[4] = v15;
            _os_log_error_impl(&dword_20ACAD000, v18, OS_LOG_TYPE_ERROR, "Error while setting database to schema version:%ld", ppDb, 0xCu);
          }

        }
      }
    }
  }
  else
  {
LABEL_20:
    objc_msgSend(0, "schemaVersion");
  }
  ABSLogCommon();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)ppDb = 138412290;
    *(_QWORD *)&ppDb[4] = v3;
    _os_log_error_impl(&dword_20ACAD000, v19, OS_LOG_TYPE_ERROR, "Failed to create database at path:%@", ppDb, 0xCu);
  }

  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "removeItemAtPath:error:", *(_QWORD *)(a1 + 40), 0);

LABEL_19:
}

- (void)beginBatch
{
  NSObject *queue;
  _QWORD block[5];

  if (self)
    queue = self->_queue;
  else
    queue = 0;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __32__BCSPersistentStore_beginBatch__block_invoke;
  block[3] = &unk_24C39C268;
  block[4] = self;
  dispatch_sync(queue, block);
}

void __32__BCSPersistentStore_beginBatch__block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  void *v4;
  id v5;
  void (**v6)(_QWORD, _QWORD);
  void *v7;
  char v8;
  id v9;
  int v10;
  int v11;
  NSObject *v12;
  uint64_t v13;
  NSObject *v14;
  sqlite3 *v15;
  int v16;
  uint64_t v17;
  uint64_t v18;
  sqlite3 *ppDb;
  _BYTE buf[24];
  void *v21;
  uint64_t v22;
  id v23;
  char *errmsg[2];

  errmsg[1] = *(char **)MEMORY[0x24BDAC8D0];
  v1 = *(_QWORD *)(a1 + 32);
  if (v1)
  {
    v2 = *(_QWORD *)(v1 + 16);
    if (v2)
    {
LABEL_18:
      *(_QWORD *)(v1 + 16) = v2 + 1;
      return;
    }
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(v1 + 24));
    if (!*(_QWORD *)(v1 + 8))
    {
      objc_msgSend((id)v1, "databasePath");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      ppDb = 0;
      *(_QWORD *)buf = MEMORY[0x24BDAC760];
      *(_QWORD *)&buf[8] = 3221225472;
      *(_QWORD *)&buf[16] = __51__BCSPersistentStore_queue_openDatabaseIfNecessary__block_invoke;
      v21 = &unk_24C39C240;
      v22 = v1;
      v5 = v4;
      v23 = v5;
      v6 = (void (**)(_QWORD, _QWORD))MEMORY[0x20BD30274](buf);
      objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "fileExistsAtPath:", v5);

      if ((v8 & 1) != 0)
      {
        v9 = objc_retainAutorelease(v5);
        v10 = sqlite3_open_v2((const char *)objc_msgSend(v9, "UTF8String"), &ppDb, 65538, 0);
        if (v10)
        {
          v11 = v10;
          ABSLogCommon();
          v12 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
          {
            LODWORD(errmsg[0]) = 67109120;
            HIDWORD(errmsg[0]) = v11;
            _os_log_error_impl(&dword_20ACAD000, v12, OS_LOG_TYPE_ERROR, "Failed to open database: %d", (uint8_t *)errmsg, 8u);
          }

        }
        else
        {
          v15 = ppDb;
          dispatch_assert_queue_V2(*(dispatch_queue_t *)(v1 + 24));
          if (v15)
          {
            errmsg[0] = 0;
            v16 = -1;
            if (!sqlite3_prepare_v2(v15, "PRAGMA user_version", -1, (sqlite3_stmt **)errmsg, 0))
            {
              if (sqlite3_step((sqlite3_stmt *)errmsg[0]) == 100)
              {
                do
                  v16 = sqlite3_column_int((sqlite3_stmt *)errmsg[0], 0);
                while (sqlite3_step((sqlite3_stmt *)errmsg[0]) == 100);
              }
              else
              {
                v16 = -1;
              }
              sqlite3_finalize((sqlite3_stmt *)errmsg[0]);
            }
          }
          else
          {
            v16 = -1;
          }
          v17 = objc_msgSend((id)v1, "schemaVersion");
          if (v17 == v16)
          {
            *(_QWORD *)(v1 + 8) = ppDb;
          }
          else
          {
            v18 = v17;
            objc_msgSend((id)v1, "schemaVersionWillChangeForDatabase:fromSchemaVersion:toSchemaVersion:", ppDb, v16, v17);
            ((void (**)(_QWORD, id))v6)[2](v6, v9);
            objc_msgSend((id)v1, "schemaVersionDidChangeForDatabase:fromSchemaVersion:toSchemaVersion:", ppDb, v16, v18);
          }
        }
      }
      else
      {
        ((void (**)(_QWORD, id))v6)[2](v6, v5);
      }

    }
    v13 = *(_QWORD *)(a1 + 32);
    if (v13)
    {
      errmsg[0] = 0;
      sqlite3_exec(*(sqlite3 **)(v13 + 8), "BEGIN TRANSACTION", 0, 0, errmsg);
      if (errmsg[0])
      {
        ABSLogCommon();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315394;
          *(_QWORD *)&buf[4] = "-[BCSPersistentStore beginTransaction]";
          *(_WORD *)&buf[12] = 2080;
          *(char **)&buf[14] = errmsg[0];
          _os_log_error_impl(&dword_20ACAD000, v14, OS_LOG_TYPE_ERROR, "%s Error on beginning sqlite transaction: %s", buf, 0x16u);
        }

        sqlite3_free(errmsg[0]);
      }
      v1 = *(_QWORD *)(a1 + 32);
      if (v1)
      {
        v2 = *(_QWORD *)(v1 + 16);
        goto LABEL_18;
      }
    }
  }
}

- (void)endBatch
{
  NSObject *queue;
  _QWORD block[5];

  if (self)
    queue = self->_queue;
  else
    queue = 0;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __30__BCSPersistentStore_endBatch__block_invoke;
  block[3] = &unk_24C39C268;
  block[4] = self;
  dispatch_sync(queue, block);
}

void __30__BCSPersistentStore_endBatch__block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  NSObject *v4;
  uint64_t v5;
  sqlite3 *v6;
  char *errmsg;
  uint8_t buf[4];
  const char *v9;
  __int16 v10;
  char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v1 = *(_QWORD *)(a1 + 32);
  if (v1)
  {
    --*(_QWORD *)(v1 + 16);
    v3 = *(_QWORD *)(a1 + 32);
    if (v3)
    {
      if (!*(_QWORD *)(v3 + 16))
      {
        errmsg = 0;
        sqlite3_exec(*(sqlite3 **)(v3 + 8), "END TRANSACTION", 0, 0, &errmsg);
        if (errmsg)
        {
          ABSLogCommon();
          v4 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315394;
            v9 = "-[BCSPersistentStore endTransaction]";
            v10 = 2080;
            v11 = errmsg;
            _os_log_error_impl(&dword_20ACAD000, v4, OS_LOG_TYPE_ERROR, "%s Error on ending sqlite transaction: %s", buf, 0x16u);
          }

          sqlite3_free(errmsg);
        }
        v5 = *(_QWORD *)(a1 + 32);
        if (v5)
        {
          dispatch_assert_queue_V2(*(dispatch_queue_t *)(v5 + 24));
          v6 = *(sqlite3 **)(v5 + 8);
          if (v6)
          {
            sqlite3_close(v6);
            *(_QWORD *)(v5 + 8) = 0;
          }
        }
      }
    }
  }
}

- (id)databasePath
{
  return 0;
}

- (int64_t)schemaVersion
{
  return -1;
}

- (const)schema
{
  return 0;
}

- (sqlite3)openedDatabase
{
  return self->_openedDatabase;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
