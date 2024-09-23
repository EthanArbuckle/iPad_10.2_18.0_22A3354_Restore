@implementation BCSShardItemPersistentStore

- (BCSShardItemPersistentStore)init
{
  return -[BCSShardItemPersistentStore initWithSchemaVersion:](self, "initWithSchemaVersion:", 1);
}

- (BCSShardItemPersistentStore)initWithSchemaVersion:(int64_t)a3
{
  BCSShardItemPersistentStore *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)BCSShardItemPersistentStore;
  result = -[BCSPersistentStore init](&v5, sel_init);
  if (result)
    result->_schemaVersion = a3;
  return result;
}

+ (const)debugQueueName
{
  return "com.apple.businesschat.persistentStore.shards";
}

- (id)databasePath
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;

  if (self)
  {
    if (!objc_msgSend((id)_databasePath_databasePath, "length"))
    {
      +[BCSPathProvider sharedInstance](BCSPathProvider, "sharedInstance");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "documentsURL");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "path");
      v4 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v4, "stringByAppendingPathComponent:", CFSTR("shard_items.db"));
      v5 = objc_claimAutoreleasedReturnValue();
      v6 = (void *)_databasePath_databasePath;
      _databasePath_databasePath = v5;

    }
    self = (BCSShardItemPersistentStore *)(id)_databasePath_databasePath;
  }
  return self;
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
    v13 = "-[BCSShardItemPersistentStore schemaVersionWillChangeForDatabase:fromSchemaVersion:toSchemaVersion:]";
    v14 = 2048;
    v15 = a4;
    v16 = 2048;
    v17 = a5;
    _os_log_impl(&dword_20ACAD000, v8, OS_LOG_TYPE_DEFAULT, "%s schema version will change from '%ld' to '%ld', dropping shard_items table", buf, 0x20u);
  }

  ppStmt = 0;
  if (!sqlite3_prepare_v2(a3, "DROP TABLE IF EXISTS shard_items", -1, &ppStmt, 0))
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
        _os_log_error_impl(&dword_20ACAD000, v9, OS_LOG_TYPE_ERROR, "error while dropping shard_items table: %s", buf, 0xCu);
      }

    }
    sqlite3_finalize(ppStmt);
  }
}

- (const)schema
{
  return "create table if not exists shard_items (id integer primary key autoincrement, bloom_filter_string text, start_i"
         "ndex integer, shard_count integer, bloom_filter_type integer, expiration_date double)";
}

- (void)updateShardItem:(id)a3 withShardIdentifier:(id)a4
{
  id v6;
  id v7;
  id v8;
  const char *v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  sqlite3_stmt *v17;
  id v18;
  sqlite3_stmt *v19;
  void *v20;
  double v21;
  int v22;
  NSObject *v23;
  const char *v24;
  id v25;
  sqlite3_stmt *ppStmt;
  uint8_t buf[4];
  const char *v28;
  __int16 v29;
  uint64_t v30;
  __int16 v31;
  uint64_t v32;
  __int16 v33;
  uint64_t v34;
  __int16 v35;
  uint64_t v36;
  __int16 v37;
  void *v38;
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v7 = a3;
  -[BCSPersistentStore beginBatch](self, "beginBatch");
  -[BCSShardItemPersistentStore deleteShardItemMatching:](self, "deleteShardItemMatching:", v6);
  v8 = v7;
  if (self)
  {
    -[BCSPersistentStore beginBatch](self, "beginBatch");
    ppStmt = 0;
    v9 = (const char *)objc_msgSend(CFSTR("insert into shard_items (bloom_filter_string, start_index, shard_count, bloom_filter_type, expiration_date) values (?,?,?,?,?)"), "UTF8String");
    ABSLogCommon();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v8, "base64EncodedString");
      v25 = v6;
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "length");
      v13 = objc_msgSend(v8, "startIndex");
      v14 = objc_msgSend(v8, "shardCount");
      v15 = objc_msgSend(v8, "type");
      objc_msgSend(v8, "expirationDate");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136316418;
      v28 = "-[BCSShardItemPersistentStore _updateShardItem:withShardIdentifier:]";
      v29 = 2048;
      v30 = v12;
      v31 = 2048;
      v32 = v13;
      v33 = 2048;
      v34 = v14;
      v35 = 2048;
      v36 = v15;
      v37 = 2112;
      v38 = v16;
      _os_log_impl(&dword_20ACAD000, v10, OS_LOG_TYPE_DEFAULT, "%s Inserting shard into DB Shard Item of length %lu startIndex %lld shardCount %lld type %ld %@", buf, 0x3Eu);

      v6 = v25;
    }

    if (!sqlite3_prepare_v2(-[BCSPersistentStore openedDatabase](self, "openedDatabase"), v9, -1, &ppStmt, 0))
    {
      v17 = ppStmt;
      objc_msgSend(v8, "base64EncodedString");
      v18 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      sqlite3_bind_text(v17, 1, (const char *)objc_msgSend(v18, "UTF8String"), -1, 0);

      sqlite3_bind_int64(ppStmt, 2, objc_msgSend(v8, "startIndex"));
      sqlite3_bind_int64(ppStmt, 3, objc_msgSend(v8, "shardCount"));
      sqlite3_bind_int(ppStmt, 4, objc_msgSend(v8, "type"));
      v19 = ppStmt;
      objc_msgSend(v8, "expirationDate");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "timeIntervalSince1970");
      sqlite3_bind_double(v19, 5, v21);

      v22 = sqlite3_step(ppStmt);
      sqlite3_finalize(ppStmt);
      if (v22 != 101)
      {
        ABSLogCommon();
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        {
          v24 = sqlite3_errmsg(-[BCSPersistentStore openedDatabase](self, "openedDatabase"));
          *(_DWORD *)buf = 134218242;
          v28 = (const char *)v22;
          v29 = 2080;
          v30 = (uint64_t)v24;
          _os_log_error_impl(&dword_20ACAD000, v23, OS_LOG_TYPE_ERROR, "Error while finalizing insert shard item %lu %s", buf, 0x16u);
        }

      }
    }
    -[BCSPersistentStore endBatch](self, "endBatch");
  }

  -[BCSPersistentStore endBatch](self, "endBatch");
}

- (id)shardItemMatching:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  const char *v7;
  BCSFilterShardItem *v8;
  sqlite3_stmt *v9;
  __CFString *v10;
  sqlite3_int64 v11;
  sqlite3_int64 v12;
  uint64_t v13;
  void *v14;
  _BYTE buf[12];
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  ABSLogCommon();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315906;
    *(_QWORD *)&buf[4] = "-[BCSShardItemPersistentStore shardItemMatching:]";
    v17 = 2048;
    v18 = objc_msgSend(v4, "startIndex");
    v19 = 2048;
    v20 = objc_msgSend(v4, "shardCount");
    v21 = 2048;
    v22 = objc_msgSend(v4, "type");
    _os_log_impl(&dword_20ACAD000, v5, OS_LOG_TYPE_DEFAULT, "%s Fetching shard from DB Shard Item from startIndex %lld shardCount %lld type %ld", buf, 0x2Au);
  }

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("select * from shard_items where start_index=\"%lld\" AND shard_count = \"%lld\" AND bloom_filter_type = \"%ld\"), objc_msgSend(v4, "startIndex"), objc_msgSend(v4, "shardCount"), objc_msgSend(v4, "type"));
  v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v7 = (const char *)objc_msgSend(v6, "UTF8String");

  if (self)
  {
    -[BCSPersistentStore beginBatch](self, "beginBatch");
    *(_QWORD *)buf = 0;
    v8 = 0;
    if (!sqlite3_prepare_v2(-[BCSPersistentStore openedDatabase](self, "openedDatabase"), v7, -1, (sqlite3_stmt **)buf, 0))
    {
      if (sqlite3_step(*(sqlite3_stmt **)buf) == 100)
      {
        v9 = *(sqlite3_stmt **)buf;
        if (sqlite3_column_text(*(sqlite3_stmt **)buf, 1))
          v10 = (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithUTF8String:", sqlite3_column_text(v9, 1));
        else
          v10 = &stru_24C39D888;
        v11 = sqlite3_column_int64(v9, 2);
        v12 = sqlite3_column_int64(v9, 3);
        v13 = sqlite3_column_int(v9, 4);
        objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSince1970:", sqlite3_column_double(v9, 5));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = -[BCSFilterShardItem initWithBloomFilterString:startIndex:shardCount:type:expirationDate:]([BCSFilterShardItem alloc], "initWithBloomFilterString:startIndex:shardCount:type:expirationDate:", v10, v11, v12, v13, v14);

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

- (void)deleteShardItemMatching:(id)a3
{
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  const char *v10;

  v4 = (void *)MEMORY[0x24BDD17C8];
  v5 = a3;
  v6 = objc_msgSend(v5, "startIndex");
  v7 = objc_msgSend(v5, "shardCount");
  v8 = objc_msgSend(v5, "type");

  objc_msgSend(v4, "stringWithFormat:", CFSTR("delete from shard_items where start_index=\"%lld\" AND shard_count = \"%lld\" AND bloom_filter_type = \"%ld\"), v6, v7, v8);
  v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v10 = (const char *)objc_msgSend(v9, "UTF8String");

  -[BCSLinkItemPersistentStore _executeDeleteSQLQuery:](self, v10);
}

- (void)deleteShardItemsOfType:(int64_t)a3
{
  id v4;
  const char *v5;

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("delete from shard_items where bloom_filter_type = \"%ld\"), a3);
  v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v5 = (const char *)objc_msgSend(v4, "UTF8String");

  -[BCSLinkItemPersistentStore _executeDeleteSQLQuery:](self, v5);
}

- (void)deleteExpiredShardItemsOfType:(int64_t)a3
{
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  const char *v9;

  v5 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "timeIntervalSince1970");
  objc_msgSend(v5, "stringWithFormat:", CFSTR("delete from shard_items where bloom_filter_type = \"%ld\" AND expiration_date <= \"%f\"), a3, v7);
  v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v9 = (const char *)objc_msgSend(v8, "UTF8String");

  -[BCSLinkItemPersistentStore _executeDeleteSQLQuery:](self, v9);
}

- (int64_t)countOfShardsOfType:(int64_t)a3
{
  id v4;
  const char *v5;

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("select count(*) from shard_items where bloom_filter_type = \"%ld\"), a3);
  v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v5 = (const char *)objc_msgSend(v4, "UTF8String");

  return -[BCSShardItemPersistentStore _executeCountSQLQuery:](self, v5);
}

- (sqlite3_int64)_executeCountSQLQuery:(void *)a1
{
  int v4;
  sqlite3_int64 v5;
  sqlite3_stmt *ppStmt;

  if (!a1)
    return 0;
  objc_msgSend(a1, "beginBatch");
  ppStmt = 0;
  v4 = sqlite3_prepare_v2((sqlite3 *)objc_msgSend(a1, "openedDatabase"), a2, -1, &ppStmt, 0);
  v5 = 0;
  if (!v4)
  {
    if (sqlite3_step(ppStmt) == 100)
      v5 = sqlite3_column_int64(ppStmt, 0);
    else
      v5 = 0;
    sqlite3_finalize(ppStmt);
  }
  objc_msgSend(a1, "endBatch");
  return v5;
}

- (int64_t)countOfExpiredShardsOfType:(int64_t)a3
{
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  const char *v9;

  v5 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "timeIntervalSince1970");
  objc_msgSend(v5, "stringWithFormat:", CFSTR("select count(*) from shard_items where bloom_filter_type = \"%ld\" AND expiration_date <= \"%f\"), a3, v7);
  v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v9 = (const char *)objc_msgSend(v8, "UTF8String");

  return -[BCSShardItemPersistentStore _executeCountSQLQuery:](self, v9);
}

@end
