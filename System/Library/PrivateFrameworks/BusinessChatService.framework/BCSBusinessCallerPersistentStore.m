@implementation BCSBusinessCallerPersistentStore

- (BCSBusinessCallerPersistentStore)init
{
  objc_super v2;

  if (self)
  {
    v2.receiver = self;
    v2.super_class = (Class)BCSBusinessCallerPersistentStore;
    self = -[BCSPersistentStore init](&v2, sel_init);
    if (self)
      self->_schemaVersion = 2;
  }
  return self;
}

- (id)databasePath
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;

  if (!objc_msgSend((id)databasePath_databasePath_2, "length"))
  {
    +[BCSPathProvider sharedInstance](BCSPathProvider, "sharedInstance");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "documentsURL");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "path");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "stringByAppendingPathComponent:", CFSTR("business_caller_items.db"));
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)databasePath_databasePath_2;
    databasePath_databasePath_2 = v5;

  }
  return (id)databasePath_databasePath_2;
}

- (int64_t)schemaVersion
{
  return self->_schemaVersion;
}

- (void)schemaVersionWillChangeForDatabase:(sqlite3 *)a3 fromSchemaVersion:(int64_t)a4 toSchemaVersion:(int64_t)a5
{
  NSObject *v8;
  NSObject *v9;
  const char *v10;
  sqlite3_stmt *ppStmt;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  int64_t v15;
  __int16 v16;
  int64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  ABSLogCommon();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v13 = "-[BCSBusinessCallerPersistentStore schemaVersionWillChangeForDatabase:fromSchemaVersion:toSchemaVersion:]";
    v14 = 2048;
    v15 = a4;
    v16 = 2048;
    v17 = a5;
    _os_log_impl(&dword_20ACAD000, v8, OS_LOG_TYPE_DEFAULT, "%s schema version will change from '%ld' to '%ld', dropping link_items table", buf, 0x20u);
  }

  ppStmt = 0;
  if (!sqlite3_prepare_v2(a3, "DROP TABLE IF EXISTS business_caller_items", -1, &ppStmt, 0))
  {
    if (sqlite3_step(ppStmt) != 101)
    {
      ABSLogCommon();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        v10 = sqlite3_errmsg(a3);
        *(_DWORD *)buf = 136315138;
        v13 = v10;
        _os_log_error_impl(&dword_20ACAD000, v9, OS_LOG_TYPE_ERROR, "error while dropping link_items table: %s", buf, 0xCu);
      }

    }
    sqlite3_finalize(ppStmt);
  }
}

- (const)schema
{
  return "CREATE TABLE IF NOT EXISTS business_caller_items    (phone_hash INTEGER PRIMARY KEY,     phone TEXT,     messag"
         "e BLOB,     expiration_date DOUBLE)";
}

+ (const)debugQueueName
{
  return "com.apple.businessservices.persistentStore.businessCallerItems";
}

- (void)deleteExpiredItemsOfType:(int64_t)a3
{
  NSObject *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  const char *v10;
  _BYTE buf[24];
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  ABSLogCommon();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    *(_QWORD *)&buf[4] = "-[BCSBusinessCallerPersistentStore deleteExpiredItemsOfType:]";
    _os_log_impl(&dword_20ACAD000, v5, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  if (a3 == 3)
  {
    -[BCSPersistentStore beginBatch](self, "beginBatch");
    v6 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "timeIntervalSince1970");
    objc_msgSend(v6, "stringWithFormat:", CFSTR("DELETE FROM business_caller_items WHERE expiration_date <= \"%f\"), v8);
    v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v10 = (const char *)objc_msgSend(v9, "UTF8String");

    *(_QWORD *)buf = 0;
    if (!sqlite3_prepare_v2(-[BCSPersistentStore openedDatabase](self, "openedDatabase"), v10, -1, (sqlite3_stmt **)buf, 0))
    {
      sqlite3_step(*(sqlite3_stmt **)buf);
      sqlite3_finalize(*(sqlite3_stmt **)buf);
    }
    -[BCSPersistentStore endBatch](self, "endBatch");
  }
}

- (void)deleteItemMatching:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  const char *v7;
  _BYTE buf[24];
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  ABSLogCommon();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    *(_QWORD *)&buf[4] = "-[BCSBusinessCallerPersistentStore deleteItemMatching:]";
    _os_log_impl(&dword_20ACAD000, v5, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  if (objc_msgSend(v4, "type") == 3)
  {
    -[BCSPersistentStore beginBatch](self, "beginBatch");
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("DELETE FROM business_caller_items WHERE phone_hash = %lld"), objc_msgSend(v4, "truncatedHash"));
    v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v7 = (const char *)objc_msgSend(v6, "UTF8String");

    *(_QWORD *)buf = 0;
    if (!sqlite3_prepare_v2(-[BCSPersistentStore openedDatabase](self, "openedDatabase"), v7, -1, (sqlite3_stmt **)buf, 0))
    {
      sqlite3_step(*(sqlite3_stmt **)buf);
      sqlite3_finalize(*(sqlite3_stmt **)buf);
    }
    -[BCSPersistentStore endBatch](self, "endBatch");
  }

}

- (void)deleteItemsOfType:(int64_t)a3
{
  NSObject *v5;
  _BYTE pStmt[24];
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  ABSLogCommon();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)pStmt = 136315138;
    *(_QWORD *)&pStmt[4] = "-[BCSBusinessCallerPersistentStore deleteItemsOfType:]";
    _os_log_impl(&dword_20ACAD000, v5, OS_LOG_TYPE_DEFAULT, "%s", pStmt, 0xCu);
  }

  if (a3 == 3)
  {
    -[BCSPersistentStore beginBatch](self, "beginBatch");
    *(_QWORD *)pStmt = 0;
    if (!sqlite3_prepare_v2(-[BCSPersistentStore openedDatabase](self, "openedDatabase"), (const char *)objc_msgSend(CFSTR("DELETE FROM business_caller_items"), "UTF8String"), -1, (sqlite3_stmt **)pStmt, 0))
    {
      sqlite3_step(*(sqlite3_stmt **)pStmt);
      sqlite3_finalize(*(sqlite3_stmt **)pStmt);
    }
    -[BCSPersistentStore endBatch](self, "endBatch");
  }
}

- (id)itemMatching:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  const char *v7;
  void *v8;
  _BYTE buf[24];
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  ABSLogCommon();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    *(_QWORD *)&buf[4] = "-[BCSBusinessCallerPersistentStore itemMatching:]";
    _os_log_impl(&dword_20ACAD000, v5, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  if (objc_msgSend(v4, "type") == 3)
  {
    -[BCSPersistentStore beginBatch](self, "beginBatch");
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("SELECT phone_hash, phone, message, expiration_date    FROM business_caller_items    WHERE phone_hash = %lld"), objc_msgSend(v4, "truncatedHash"));
    v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v7 = (const char *)objc_msgSend(v6, "UTF8String");

    *(_QWORD *)buf = 0;
    v8 = 0;
    if (!sqlite3_prepare_v2(-[BCSPersistentStore openedDatabase](self, "openedDatabase"), v7, -1, (sqlite3_stmt **)buf, 0))
    {
      if (sqlite3_step(*(sqlite3_stmt **)buf) == 100)
      {
        +[BCSBusinessCallerItem itemFromStatement:](BCSBusinessCallerItem, "itemFromStatement:", *(_QWORD *)buf);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v8 = 0;
      }
      sqlite3_finalize(*(sqlite3_stmt **)buf);
    }
    -[BCSPersistentStore endBatch](self, "endBatch");
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)updateItem:(id)a3 withItemIdentifier:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  NSObject *v10;
  int v11;
  int v12;
  NSObject *v13;
  const char *v14;
  const char *v15;
  sqlite3_stmt *ppStmt;
  uint8_t buf[4];
  _DWORD v18[7];

  *(_QWORD *)&v18[5] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  ABSLogCommon();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    *(_QWORD *)v18 = "-[BCSBusinessCallerPersistentStore updateItem:withItemIdentifier:]";
    _os_log_impl(&dword_20ACAD000, v8, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  if (objc_msgSend(v7, "type") == 3)
  {
    v9 = v6;
    -[BCSPersistentStore beginBatch](self, "beginBatch");
    ppStmt = 0;
    if (sqlite3_prepare_v2(-[BCSPersistentStore openedDatabase](self, "openedDatabase"), (const char *)objc_msgSend(CFSTR("INSERT OR REPLACE INTO business_caller_items    (phone_hash, phone, message, expiration_date)    VALUES (?,?,?,?)"), "UTF8String"), -1, &ppStmt, 0))
    {
      ABSLogCommon();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        v14 = sqlite3_errmsg(-[BCSPersistentStore openedDatabase](self, "openedDatabase"));
        *(_DWORD *)buf = 136315138;
        *(_QWORD *)v18 = v14;
        _os_log_error_impl(&dword_20ACAD000, v10, OS_LOG_TYPE_ERROR, "Failed to update item: %s", buf, 0xCu);
      }

    }
    else
    {
      objc_msgSend(v9, "updateStatementValues:withItemIdentifier:", ppStmt, v7);
      v11 = sqlite3_step(ppStmt);
      if (v11 != 101)
      {
        v12 = v11;
        ABSLogCommon();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        {
          v15 = sqlite3_errmsg(-[BCSPersistentStore openedDatabase](self, "openedDatabase"));
          *(_DWORD *)buf = 67109378;
          v18[0] = v12;
          LOWORD(v18[1]) = 2080;
          *(_QWORD *)((char *)&v18[1] + 2) = v15;
          _os_log_error_impl(&dword_20ACAD000, v13, OS_LOG_TYPE_ERROR, "Failed to insert business caller item: %d (%s)", buf, 0x12u);
        }

      }
      sqlite3_finalize(ppStmt);
    }
    -[BCSPersistentStore endBatch](self, "endBatch");

  }
}

@end
