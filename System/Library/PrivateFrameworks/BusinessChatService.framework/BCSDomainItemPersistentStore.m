@implementation BCSDomainItemPersistentStore

- (id)databasePath
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;

  if (!objc_msgSend((id)databasePath_databasePath_0, "length"))
  {
    +[BCSPathProvider sharedInstance](BCSPathProvider, "sharedInstance");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "documentsURL");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "path");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "stringByAppendingPathComponent:", CFSTR("domain_shard_items.db"));
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)databasePath_databasePath_0;
    databasePath_databasePath_0 = v5;

  }
  return (id)databasePath_databasePath_0;
}

- (int64_t)schemaVersion
{
  return 1;
}

- (const)schema
{
  return (const char *)objc_msgSend(CFSTR("create table if not exists domain_shard_items (domain text primary key, shard_item, expiration_date double)"), "UTF8String");
}

- (id)domainItemMatching:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  const char *v7;
  BCSDomainItem *v8;
  id v9;
  __CFString *v10;
  void *v11;
  sqlite3_stmt *ppStmt;

  v4 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(a3, "domain");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("select * from domain_shard_items where domain=\"%@\"), v5);
  v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v7 = (const char *)objc_msgSend(v6, "UTF8String");

  -[BCSPersistentStore beginBatch](self, "beginBatch");
  ppStmt = 0;
  v8 = 0;
  if (!sqlite3_prepare_v2(-[BCSPersistentStore openedDatabase](self, "openedDatabase"), v7, -1, &ppStmt, 0))
  {
    if (sqlite3_step(ppStmt) == 100)
    {
      if (sqlite3_column_text(ppStmt, 1))
      {
        v9 = objc_alloc(MEMORY[0x24BDD17C8]);
        v10 = (__CFString *)objc_msgSend(v9, "initWithUTF8String:", sqlite3_column_text(ppStmt, 1));
      }
      else
      {
        v10 = &stru_24C39D888;
      }
      objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSince1970:", sqlite3_column_double(ppStmt, 2));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = -[BCSDomainItem initWithBase64EncodedShardString:expirationDate:]([BCSDomainItem alloc], "initWithBase64EncodedShardString:expirationDate:", v10, v11);

    }
    else
    {
      v8 = 0;
    }
    sqlite3_finalize(ppStmt);
  }
  -[BCSPersistentStore endBatch](self, "endBatch");
  return v8;
}

- (void)updateDomainItemsForDomainShard:(id)a3
{
  BCSLineReader *v4;
  void *v5;
  BCSLineReader *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  BCSDomainItem *v10;
  void *v11;
  BCSDomainItem *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v16 = a3;
  v4 = [BCSLineReader alloc];
  objc_msgSend(v16, "fileURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[BCSLineReader initWithFileURL:](v4, "initWithFileURL:", v5);

  v7 = (void *)MEMORY[0x20BD300D0](-[BCSLineReader readLine](v6, "readLine"));
  -[BCSLineReader readLine](v6, "readLine");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
    do
    {
      v10 = [BCSDomainItem alloc];
      objc_msgSend(v16, "expirationDate");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = -[BCSDomainItem initWithBase64EncodedShardString:expirationDate:](v10, "initWithBase64EncodedShardString:expirationDate:", v9, v11);

      -[BCSDomainItem domain](v12, "domain");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      +[BCSDomainItemIdentifier identifierWithType:domain:](BCSDomainItemIdentifier, "identifierWithType:domain:", 3, v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      -[BCSDomainItemPersistentStore domainItemMatching:](self, "domainItemMatching:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (v15)
        -[BCSDomainItemPersistentStore deleteDomainItemMatching:](self, "deleteDomainItemMatching:", v14);
      -[BCSDomainItemPersistentStore updateDomainItem:withDomainItemIdentifier:](self, "updateDomainItem:withDomainItemIdentifier:", v12, v14);

      objc_autoreleasePoolPop(v7);
      v7 = (void *)MEMORY[0x20BD300D0]();
      -[BCSLineReader readLine](v6, "readLine");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    while (v9);
  }
  objc_autoreleasePoolPop(v7);

}

- (void)updateDomainItem:(id)a3 withDomainItemIdentifier:(id)a4
{
  id v5;
  sqlite3_stmt *v6;
  id v7;
  sqlite3_stmt *v8;
  id v9;
  sqlite3_stmt *v10;
  void *v11;
  double v12;
  int v13;
  NSObject *v14;
  const char *v15;
  sqlite3_stmt *ppStmt;
  uint8_t buf[4];
  uint64_t v18;
  __int16 v19;
  const char *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  -[BCSPersistentStore beginBatch](self, "beginBatch");
  ppStmt = 0;
  if (!sqlite3_prepare_v2(-[BCSPersistentStore openedDatabase](self, "openedDatabase"), (const char *)objc_msgSend(CFSTR("insert into domain_shard_items (domain, shard_item, expiration_date) values (?,?,?)"), "UTF8String"), -1, &ppStmt, 0))
  {
    v6 = ppStmt;
    objc_msgSend(v5, "domain");
    v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    sqlite3_bind_text(v6, 1, (const char *)objc_msgSend(v7, "UTF8String"), -1, 0);

    v8 = ppStmt;
    objc_msgSend(v5, "base64EncodedShardString");
    v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    sqlite3_bind_text(v8, 2, (const char *)objc_msgSend(v9, "UTF8String"), -1, 0);

    v10 = ppStmt;
    objc_msgSend(v5, "expirationDate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "timeIntervalSince1970");
    sqlite3_bind_double(v10, 3, v12);

    v13 = sqlite3_step(ppStmt);
    sqlite3_finalize(ppStmt);
    if (v13 != 101)
    {
      ABSLogCommon();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        v15 = sqlite3_errmsg(-[BCSPersistentStore openedDatabase](self, "openedDatabase"));
        *(_DWORD *)buf = 134218242;
        v18 = v13;
        v19 = 2080;
        v20 = v15;
        _os_log_error_impl(&dword_20ACAD000, v14, OS_LOG_TYPE_ERROR, "Error while finalizing insert shard item %lu %s", buf, 0x16u);
      }

    }
  }
  -[BCSPersistentStore endBatch](self, "endBatch");

}

- (void)deleteDomainItemMatching:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v4 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(a3, "domain");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("delete from domain_shard_items where domain=\"%@\"), v5);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  -[BCSDomainItemPersistentStore executeDeleteDomainDomainItemSQLQuery:](self, "executeDeleteDomainDomainItemSQLQuery:", v6);
}

- (void)deleteAllDomainItems
{
  id v3;

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("delete from domain_shard_items"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[BCSDomainItemPersistentStore executeDeleteDomainDomainItemSQLQuery:](self, "executeDeleteDomainDomainItemSQLQuery:", v3);

}

- (void)deleteAllExpiredDomainItems
{
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;

  v3 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "timeIntervalSince1970");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("delete from domain_shard_items where expiration_date <= \"%f\"), v5);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  -[BCSDomainItemPersistentStore executeDeleteDomainDomainItemSQLQuery:](self, "executeDeleteDomainDomainItemSQLQuery:", v6);
}

- (BOOL)executeDeleteDomainDomainItemSQLQuery:(id)a3
{
  id v4;
  sqlite3 *v5;
  id v6;
  const char *v7;
  BOOL v8;
  sqlite3_stmt *ppStmt;

  v4 = a3;
  -[BCSPersistentStore beginBatch](self, "beginBatch");
  ppStmt = 0;
  v5 = -[BCSPersistentStore openedDatabase](self, "openedDatabase");
  v6 = objc_retainAutorelease(v4);
  v7 = (const char *)objc_msgSend(v6, "UTF8String");

  if (sqlite3_prepare_v2(v5, v7, -1, &ppStmt, 0))
  {
    v8 = 0;
  }
  else
  {
    v8 = sqlite3_step(ppStmt) == 101;
    sqlite3_finalize(ppStmt);
  }
  -[BCSPersistentStore endBatch](self, "endBatch");
  return v8;
}

@end
