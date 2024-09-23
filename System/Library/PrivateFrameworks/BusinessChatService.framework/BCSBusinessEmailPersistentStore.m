@implementation BCSBusinessEmailPersistentStore

- (BCSBusinessEmailPersistentStore)init
{
  objc_super v2;

  if (self)
  {
    v2.receiver = self;
    v2.super_class = (Class)BCSBusinessEmailPersistentStore;
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

  if (!objc_msgSend((id)databasePath_databasePath_1, "length"))
  {
    +[BCSPathProvider sharedInstance](BCSPathProvider, "sharedInstance");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "documentsURL");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "path");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "stringByAppendingPathComponent:", CFSTR("business_email_items.db"));
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)databasePath_databasePath_1;
    databasePath_databasePath_1 = v5;

  }
  return (id)databasePath_databasePath_1;
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
    v13 = "-[BCSBusinessEmailPersistentStore schemaVersionWillChangeForDatabase:fromSchemaVersion:toSchemaVersion:]";
    v14 = 2048;
    v15 = a4;
    v16 = 2048;
    v17 = a5;
    _os_log_impl(&dword_20ACAD000, v8, OS_LOG_TYPE_DEFAULT, "%s schema version will change from '%ld' to '%ld', dropping link_items table", buf, 0x20u);
  }

  ppStmt = 0;
  if (!sqlite3_prepare_v2(a3, "DROP TABLE IF EXISTS business_email_items", -1, &ppStmt, 0))
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
  return "CREATE TABLE IF NOT EXISTS business_email_items    (key INTEGER PRIMARY KEY,     message BLOB,     message_type"
         " INTEGER,     expiration_date DOUBLE)";
}

+ (const)debugQueueName
{
  return "com.apple.businessservices.persistentStore.businessEmailItems";
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
    *(_QWORD *)&buf[4] = "-[BCSBusinessEmailPersistentStore deleteExpiredItemsOfType:]";
    _os_log_impl(&dword_20ACAD000, v5, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  if (a3 == 4)
  {
    -[BCSPersistentStore beginBatch](self, "beginBatch");
    v6 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "timeIntervalSince1970");
    objc_msgSend(v6, "stringWithFormat:", CFSTR("DELETE FROM business_email_items WHERE expiration_date <= \"%f\"), v8);
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
    *(_QWORD *)&buf[4] = "-[BCSBusinessEmailPersistentStore deleteItemMatching:]";
    _os_log_impl(&dword_20ACAD000, v5, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  if (objc_msgSend(v4, "type") == 4)
  {
    -[BCSPersistentStore beginBatch](self, "beginBatch");
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("DELETE FROM business_email_items WHERE key = %lld AND message_type = %ld"), objc_msgSend(v4, "truncatedHash"), BCSEmailStoreTypeForItemIdentifier(v4));
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
    *(_QWORD *)&pStmt[4] = "-[BCSBusinessEmailPersistentStore deleteItemsOfType:]";
    _os_log_impl(&dword_20ACAD000, v5, OS_LOG_TYPE_DEFAULT, "%s", pStmt, 0xCu);
  }

  if (a3 == 4)
  {
    -[BCSPersistentStore beginBatch](self, "beginBatch");
    *(_QWORD *)pStmt = 0;
    if (!sqlite3_prepare_v2(-[BCSPersistentStore openedDatabase](self, "openedDatabase"), (const char *)objc_msgSend(CFSTR("DELETE FROM business_email_items"), "UTF8String"), -1, (sqlite3_stmt **)pStmt, 0))
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
  uint64_t v6;
  id v7;
  const char *v8;
  void *v9;
  __objc2_class *v10;
  _BYTE buf[24];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  ABSLogCommon();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    *(_QWORD *)&buf[4] = "-[BCSBusinessEmailPersistentStore itemMatching:]";
    _os_log_impl(&dword_20ACAD000, v5, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  if (objc_msgSend(v4, "type") == 4)
  {
    v6 = BCSEmailStoreTypeForItemIdentifier(v4);
    -[BCSPersistentStore beginBatch](self, "beginBatch");
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("SELECT key, message, message_type, expiration_date    FROM business_email_items    WHERE key = %lld AND message_type = %ld"), objc_msgSend(v4, "truncatedHash"), v6);
    v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v8 = (const char *)objc_msgSend(v7, "UTF8String");

    *(_QWORD *)buf = 0;
    v9 = 0;
    if (sqlite3_prepare_v2(-[BCSPersistentStore openedDatabase](self, "openedDatabase"), v8, -1, (sqlite3_stmt **)buf, 0))
    {
LABEL_14:
      -[BCSPersistentStore endBatch](self, "endBatch");
      goto LABEL_15;
    }
    if (sqlite3_step(*(sqlite3_stmt **)buf) == 100)
    {
      if (v6 == 2)
      {
        v10 = BCSBusinessLogo;
        goto LABEL_12;
      }
      if (v6 == 1)
      {
        v10 = BCSBusinessEmailItem;
LABEL_12:
        -[__objc2_class itemFromStatement:](v10, "itemFromStatement:", *(_QWORD *)buf);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_13;
      }
    }
    v9 = 0;
LABEL_13:
    sqlite3_finalize(*(sqlite3_stmt **)buf);
    goto LABEL_14;
  }
  v9 = 0;
LABEL_15:

  return v9;
}

- (void)updateItem:(id)a3 withItemIdentifier:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  int v10;
  int v11;
  NSObject *v12;
  const char *v13;
  const char *v14;
  sqlite3_stmt *ppStmt;
  uint8_t buf[4];
  _DWORD v17[7];

  *(_QWORD *)&v17[5] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  ABSLogCommon();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    *(_QWORD *)v17 = "-[BCSBusinessEmailPersistentStore updateItem:withItemIdentifier:]";
    _os_log_impl(&dword_20ACAD000, v8, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  if (objc_msgSend(v7, "type") == 4)
  {
    BCSEmailStoreTypeForItemIdentifier(v7);
    -[BCSPersistentStore beginBatch](self, "beginBatch");
    ppStmt = 0;
    if (sqlite3_prepare_v2(-[BCSPersistentStore openedDatabase](self, "openedDatabase"), (const char *)objc_msgSend(CFSTR("INSERT OR REPLACE INTO business_email_items    (key, message, message_type, expiration_date)    VALUES (?,?,?,?)"), "UTF8String"), -1, &ppStmt, 0))
    {
      ABSLogCommon();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        v13 = sqlite3_errmsg(-[BCSPersistentStore openedDatabase](self, "openedDatabase"));
        *(_DWORD *)buf = 136315138;
        *(_QWORD *)v17 = v13;
        _os_log_error_impl(&dword_20ACAD000, v9, OS_LOG_TYPE_ERROR, "Failed to update item: %s", buf, 0xCu);
      }

    }
    else
    {
      objc_msgSend(v6, "updateStatementValues:withItemIdentifier:", ppStmt, v7);
      v10 = sqlite3_step(ppStmt);
      if (v10 != 101)
      {
        v11 = v10;
        ABSLogCommon();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          v14 = sqlite3_errmsg(-[BCSPersistentStore openedDatabase](self, "openedDatabase"));
          *(_DWORD *)buf = 67109378;
          v17[0] = v11;
          LOWORD(v17[1]) = 2080;
          *(_QWORD *)((char *)&v17[1] + 2) = v14;
          _os_log_error_impl(&dword_20ACAD000, v12, OS_LOG_TYPE_ERROR, "Failed to insert business email item: %d (%s)", buf, 0x12u);
        }

      }
      sqlite3_finalize(ppStmt);
    }
    -[BCSPersistentStore endBatch](self, "endBatch");
  }

}

@end
