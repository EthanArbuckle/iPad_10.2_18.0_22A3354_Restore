@implementation MKPhotoLibraryAssetDatabase

- (MKPhotoLibraryAssetDatabase)initWithType:(unint64_t)a3
{
  return -[MKPhotoLibraryAssetDatabase initWithType:reuse:](self, "initWithType:reuse:", a3, 0);
}

- (MKPhotoLibraryAssetDatabase)initWithType:(unint64_t)a3 reuse:(BOOL)a4
{
  _BOOL8 v4;
  MKPhotoLibraryAssetDatabase *v6;
  MKPhotoLibraryAssetDatabase *v7;
  __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  id v15;
  void *v16;
  NSObject *v17;
  void *v18;
  int v19;
  void *v20;
  id v21;
  NSObject *v22;
  id v24;
  id v25;
  objc_super v26;

  v4 = a4;
  v26.receiver = self;
  v26.super_class = (Class)MKPhotoLibraryAssetDatabase;
  v6 = -[MKPhotoLibraryAssetDatabase init](&v26, sel_init);
  v7 = v6;
  if (v6)
  {
    v8 = 0;
    v6->_database = 0;
    if (a3 <= 2)
      v8 = off_24E3593F0[a3];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("/Library/MigrationKit/%@"), v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    NSHomeDirectory();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringByAppendingPathComponent:", v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "stringByDeletingLastPathComponent");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "fileExistsAtPath:", v12);

    if ((v14 & 1) != 0)
    {
      v15 = 0;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = 0;
      objc_msgSend(v16, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v12, 1, 0, &v25);
      v15 = v25;

      if (v15)
      {
        +[MKLog log](MKLog, "log");
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          -[MKPhotoLibraryAssetDatabase initWithType:reuse:].cold.2();

      }
    }
    if (v4
      || (objc_msgSend(MEMORY[0x24BDD1580], "defaultManager"),
          v18 = (void *)objc_claimAutoreleasedReturnValue(),
          v19 = objc_msgSend(v18, "isDeletableFileAtPath:", v11),
          v18,
          !v19))
    {
      v21 = v15;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = v15;
      objc_msgSend(v20, "removeItemAtPath:error:", v11, &v24);
      v21 = v24;

      if (v21)
      {
        +[MKLog log](MKLog, "log");
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
          -[MKPhotoLibraryAssetDatabase initWithType:reuse:].cold.1();

      }
    }
    -[MKPhotoLibraryAssetDatabase open:reuse:](v7, "open:reuse:", v11, v4);

  }
  return v7;
}

- (void)dealloc
{
  objc_super v3;

  -[MKPhotoLibraryAssetDatabase close](self, "close");
  v3.receiver = self;
  v3.super_class = (Class)MKPhotoLibraryAssetDatabase;
  -[MKPhotoLibraryAssetDatabase dealloc](&v3, sel_dealloc);
}

- (void)open:(id)a3 reuse:(BOOL)a4
{
  _BOOL8 v4;
  NSObject *v6;

  v4 = a4;
  if (sqlite3_open((const char *)objc_msgSend(objc_retainAutorelease(a3), "UTF8String"), &self->_database))
  {
    +[MKLog log](MKLog, "log");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[MKPhotoLibraryAssetDatabase open:reuse:].cold.1((uint64_t)self, v6);

  }
  else
  {
    -[MKPhotoLibraryAssetDatabase create:](self, "create:", v4);
  }
}

- (void)close
{
  NSObject *v3;
  uint8_t v4[16];

  if (self->_database)
  {
    +[MKLog log](MKLog, "log");
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_21EC08000, v3, OS_LOG_TYPE_INFO, "will close an asset database.", v4, 2u);
    }

    sqlite3_close(self->_database);
    self->_database = 0;
  }
}

- (void)query:(id)a3
{
  NSObject *v3;
  NSObject *v4;
  sqlite3_stmt *ppStmt;

  ppStmt = 0;
  if (sqlite3_prepare_v2(self->_database, (const char *)objc_msgSend(objc_retainAutorelease(a3), "UTF8String"), -1, &ppStmt, 0))
  {
    +[MKLog log](MKLog, "log");
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      -[MKApplicationDatabase query:].cold.2();

  }
  else
  {
    if (sqlite3_step(ppStmt) != 101)
    {
      +[MKLog log](MKLog, "log");
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
        -[MKApplicationDatabase query:].cold.1();

    }
    sqlite3_finalize(ppStmt);
  }
}

- (void)begin
{
  -[MKPhotoLibraryAssetDatabase query:](self, "query:", CFSTR("BEGIN TRANSACTION"));
}

- (void)commit
{
  -[MKPhotoLibraryAssetDatabase query:](self, "query:", CFSTR("COMMIT TRANSACTION"));
}

- (void)rollback
{
  -[MKPhotoLibraryAssetDatabase query:](self, "query:", CFSTR("ROLLBACK TRANSACTION"));
}

- (void)create:(BOOL)a3
{
  if (!a3)
  {
    -[MKPhotoLibraryAssetDatabase query:](self, "query:", CFSTR("DROP TABLE IF EXISTS assets;"));
    -[MKPhotoLibraryAssetDatabase query:](self, "query:", CFSTR("DROP TABLE IF EXISTS identifiers;"));
  }
  -[MKPhotoLibraryAssetDatabase query:](self, "query:", CFSTR("CREATE TABLE IF NOT EXISTS assets (size INTEGER DEFAULT 0, path TEXT DEFAULT '' NOT NULL, filename TEXT DEFAULT '' NOT NULL, collection TEXT, original_filename TEXT);"));
  -[MKPhotoLibraryAssetDatabase query:](self, "query:", CFSTR("CREATE TABLE IF NOT EXISTS identifiers (identifier TEXT, collection TEXT);"));
}

- (unint64_t)count
{
  return self->_count;
}

- (void)addAsset:(id)a3
{
  id v4;
  void *v5;
  sqlite3 **p_database;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  unint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  sqlite3 *v16;
  id v17;
  NSObject *v18;
  void *v19;
  void *v20;
  sqlite3_int64 insert_rowid;
  NSObject *v22;
  uint64_t v23;
  void *v24;
  sqlite3_stmt *ppStmt;

  v4 = a3;
  v5 = v4;
  p_database = &self->_database;
  if (self->_database)
  {
    v23 = objc_msgSend(v4, "size");
    objc_msgSend(v5, "path");
    v7 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "filename");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "collection");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "originalFilename");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(&unk_24E36C6F8, "count"));
    if (objc_msgSend(&unk_24E36C6F8, "count"))
    {
      v11 = 0;
      do
        objc_msgSend(v10, "setObject:atIndexedSubscript:", CFSTR("?"), v11++);
      while (v11 < objc_msgSend(&unk_24E36C6F8, "count"));
    }
    v12 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(&unk_24E36C6F8, "componentsJoinedByString:", CFSTR(","));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "componentsJoinedByString:", CFSTR(","));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stringWithFormat:", CFSTR("INSERT INTO assets (%@) VALUES (%@)"), v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    ppStmt = 0;
    v16 = *p_database;
    v17 = objc_retainAutorelease(v15);
    if (sqlite3_prepare(v16, (const char *)objc_msgSend(v17, "UTF8String"), -1, &ppStmt, 0))
    {
      +[MKLog log](MKLog, "log");
      v18 = objc_claimAutoreleasedReturnValue();
      v19 = v8;
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        -[MKApplicationDatabase query:].cold.2();

      v20 = v24;
    }
    else
    {
      sqlite3_bind_int64(ppStmt, 1, v23);
      sqlite3_bind_text(ppStmt, 2, (const char *)-[NSObject UTF8String](objc_retainAutorelease(v7), "UTF8String"), -1, 0);
      v19 = v8;
      sqlite3_bind_text(ppStmt, 3, (const char *)objc_msgSend(objc_retainAutorelease(v8), "UTF8String"), -1, 0);
      if (v9)
        sqlite3_bind_text(ppStmt, 4, (const char *)objc_msgSend(objc_retainAutorelease(v9), "UTF8String"), -1, 0);
      else
        sqlite3_bind_null(ppStmt, 4);
      v20 = v24;
      if (v24)
        sqlite3_bind_text(ppStmt, 5, (const char *)objc_msgSend(objc_retainAutorelease(v24), "UTF8String"), -1, 0);
      else
        sqlite3_bind_null(ppStmt, 5);
      if (sqlite3_step(ppStmt) == 101)
      {
        insert_rowid = sqlite3_last_insert_rowid(*p_database);
        sqlite3_finalize(ppStmt);
        if (insert_rowid != -1)
          ++self->_count;
      }
      else
      {
        +[MKLog log](MKLog, "log");
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
          -[MKApplicationDatabase addIdentifier:].cold.2();

        sqlite3_finalize(ppStmt);
      }
    }

  }
  else
  {
    +[MKLog log](MKLog, "log");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[MKApplicationDatabase addIdentifier:].cold.1();
  }

}

- (id)asset
{
  void *v3;
  void *v4;
  void *v5;
  sqlite3 *database;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  MKPhotoLibraryAsset *v12;
  sqlite3_int64 v13;
  sqlite3_int64 v14;
  const unsigned __int8 *v15;
  const unsigned __int8 *v16;
  const unsigned __int8 *v17;
  const unsigned __int8 *v18;
  sqlite3_stmt *ppStmt;

  if (self->_database)
  {
    v3 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(&unk_24E36C710, "componentsJoinedByString:", CFSTR(","));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringWithFormat:", CFSTR("SELECT %@ FROM assets ORDER BY rowid ASC LIMIT 1;"), v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    ppStmt = 0;
    database = self->_database;
    v7 = objc_retainAutorelease(v5);
    v8 = 0;
    v9 = 0;
    v10 = 0;
    v11 = 0;
    v12 = 0;
    if (!sqlite3_prepare(database, (const char *)-[NSObject UTF8String](v7, "UTF8String"), -1, &ppStmt, 0))
    {
      if (sqlite3_step(ppStmt) == 100)
      {
        v13 = sqlite3_column_int64(ppStmt, 0);
        v14 = sqlite3_column_int64(ppStmt, 1);
        v15 = sqlite3_column_text(ppStmt, 2);
        if (v15)
        {
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v15);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v11 = 0;
        }
        v16 = sqlite3_column_text(ppStmt, 3);
        if (v16)
        {
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v16);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v10 = 0;
        }
        v17 = sqlite3_column_text(ppStmt, 4);
        if (v17)
        {
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v17);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v9 = 0;
        }
        v18 = sqlite3_column_text(ppStmt, 5);
        if (v18)
        {
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v18);
          v8 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v8 = 0;
        }
        sqlite3_finalize(ppStmt);
        if (v13 != -1)
        {
          v12 = -[MKPhotoLibraryAsset initWithPath:filename:collection:originalFilename:size:]([MKPhotoLibraryAsset alloc], "initWithPath:filename:collection:originalFilename:size:", v11, v10, v9, v8, v14);
          -[MKPhotoLibraryAsset setRowID:](v12, "setRowID:", v13);
          goto LABEL_23;
        }
      }
      else
      {
        sqlite3_finalize(ppStmt);
        v8 = 0;
        v9 = 0;
        v10 = 0;
        v11 = 0;
      }
      v12 = 0;
    }
LABEL_23:

    goto LABEL_24;
  }
  +[MKLog log](MKLog, "log");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    -[MKApplicationDatabase addIdentifier:].cold.1();
  v12 = 0;
LABEL_24:

  return v12;
}

- (void)remove:(id)a3
{
  id v4;
  void *v5;
  sqlite3_int64 v6;
  sqlite3 *database;
  NSObject *v8;
  NSObject *v9;
  sqlite3_stmt *ppStmt;

  v4 = a3;
  if (self->_database)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("DELETE FROM assets WHERE rowid = ?;"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v4, "rowID");
    ppStmt = 0;
    database = self->_database;
    v8 = objc_retainAutorelease(v5);
    if (!sqlite3_prepare(database, (const char *)-[NSObject UTF8String](v8, "UTF8String"), -1, &ppStmt, 0))
    {
      sqlite3_bind_int64(ppStmt, 1, v6);
      if (sqlite3_step(ppStmt) == 101)
      {
        --self->_count;
      }
      else
      {
        +[MKLog log](MKLog, "log");
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
          -[MKApplicationDatabase addIdentifier:].cold.2();

      }
      sqlite3_finalize(ppStmt);
    }
  }
  else
  {
    +[MKLog log](MKLog, "log");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[MKApplicationDatabase addIdentifier:].cold.1();
  }

}

- (void)setIdentifier:(id)a3 forAsset:(id)a4
{
  id v6;
  id v7;
  sqlite3 **p_database;
  sqlite3 *database;
  NSObject *v10;
  unint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  sqlite3 *v16;
  id v17;
  NSObject *v18;
  sqlite3_stmt *v19;
  id v20;
  NSObject *v21;
  sqlite3_stmt *ppStmt;

  v6 = a3;
  v7 = a4;
  database = self->_database;
  p_database = &self->_database;
  if (database)
  {
    v10 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(&unk_24E36C728, "count"));
    if (objc_msgSend(&unk_24E36C728, "count"))
    {
      v11 = 0;
      do
        -[NSObject setObject:atIndexedSubscript:](v10, "setObject:atIndexedSubscript:", CFSTR("?"), v11++);
      while (v11 < objc_msgSend(&unk_24E36C728, "count"));
    }
    v12 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(&unk_24E36C728, "componentsJoinedByString:", CFSTR(","));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject componentsJoinedByString:](v10, "componentsJoinedByString:", CFSTR(","));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stringWithFormat:", CFSTR("INSERT INTO identifiers (%@) VALUES (%@)"), v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    ppStmt = 0;
    v16 = *p_database;
    v17 = objc_retainAutorelease(v15);
    if (sqlite3_prepare(v16, (const char *)objc_msgSend(v17, "UTF8String"), -1, &ppStmt, 0))
    {
      +[MKLog log](MKLog, "log");
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        -[MKApplicationDatabase query:].cold.2();

    }
    else
    {
      sqlite3_bind_text(ppStmt, 1, (const char *)objc_msgSend(objc_retainAutorelease(v6), "UTF8String"), -1, 0);
      v19 = ppStmt;
      objc_msgSend(v7, "collection");
      v20 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      sqlite3_bind_text(v19, 2, (const char *)objc_msgSend(v20, "UTF8String"), -1, 0);

      if (sqlite3_step(ppStmt) == 101)
      {
        sqlite3_last_insert_rowid(*p_database);
      }
      else
      {
        +[MKLog log](MKLog, "log");
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
          -[MKApplicationDatabase addIdentifier:].cold.2();

      }
      sqlite3_finalize(ppStmt);
    }

  }
  else
  {
    +[MKLog log](MKLog, "log");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[MKApplicationDatabase addIdentifier:].cold.1();
  }

}

- (id)collections
{
  id v3;
  const unsigned __int8 *v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  sqlite3_stmt *ppStmt;

  v3 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  if (self->_database)
  {
    ppStmt = 0;
    if (!sqlite3_prepare(self->_database, (const char *)objc_msgSend(CFSTR("SELECT DISTINCT collection FROM identifiers WHERE collection IS NOT NULL;"),
                            "UTF8String"),
            -1,
            &ppStmt,
            0))
    {
      while (sqlite3_step(ppStmt) == 100)
      {
        v4 = sqlite3_column_text(ppStmt, 0);
        if (v4)
        {
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v4);
          v5 = objc_claimAutoreleasedReturnValue();
          if (v5)
          {
            v6 = (void *)v5;
            objc_msgSend(v3, "addObject:", v5);

          }
        }
      }
      sqlite3_finalize(ppStmt);
    }
  }
  else
  {
    +[MKLog log](MKLog, "log");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[MKApplicationDatabase addIdentifier:].cold.1();

  }
  return v3;
}

- (id)identifiersForCollection:(id)a3 offset:(unint64_t)a4 limit:(unint64_t)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  sqlite3 *database;
  NSObject *v14;
  const unsigned __int8 *v15;
  void *v16;
  sqlite3_stmt *ppStmt;

  v8 = a3;
  v9 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  if (self->_database)
  {
    v10 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(&unk_24E36C740, "componentsJoinedByString:", CFSTR(","));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringWithFormat:", CFSTR("SELECT %@ FROM identifiers WHERE collection IS NOT NULL AND identifier IS NOT NULL AND collection = ? ORDER BY rowid ASC LIMIT %ld OFFSET %ld;"),
      v11,
      a5,
      a4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    ppStmt = 0;
    database = self->_database;
    v14 = objc_retainAutorelease(v12);
    if (!sqlite3_prepare(database, (const char *)-[NSObject UTF8String](v14, "UTF8String"), -1, &ppStmt, 0))
    {
      sqlite3_bind_text(ppStmt, 1, (const char *)objc_msgSend(objc_retainAutorelease(v8), "UTF8String"), -1, 0);
      while (sqlite3_step(ppStmt) == 100)
      {
        v15 = sqlite3_column_text(ppStmt, 0);
        if (v15)
        {
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v15);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v16 = 0;
        }
        objc_msgSend(v9, "addObject:", v16);

      }
      sqlite3_finalize(ppStmt);
    }
  }
  else
  {
    +[MKLog log](MKLog, "log");
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      -[MKApplicationDatabase addIdentifier:].cold.1();
  }

  return v9;
}

- (unint64_t)countForCollection:(id)a3
{
  id v4;
  int v5;
  sqlite3_int64 v6;
  NSObject *v7;
  sqlite3_stmt *ppStmt;

  v4 = a3;
  if (self->_database)
  {
    ppStmt = 0;
    v5 = sqlite3_prepare(self->_database, (const char *)objc_msgSend(CFSTR("SELECT COUNT(*) FROM identifiers WHERE collection IS NOT NULL AND identifier IS NOT NULL AND collection = ?;"),
                           "UTF8String"),
           -1,
           &ppStmt,
           0);
    v6 = 0;
    if (!v5)
    {
      sqlite3_bind_text(ppStmt, 1, (const char *)objc_msgSend(objc_retainAutorelease(v4), "UTF8String"), -1, 0);
      v6 = 0;
      if (sqlite3_step(ppStmt) == 100)
        v6 = sqlite3_column_int64(ppStmt, 0);
      sqlite3_finalize(ppStmt);
    }
  }
  else
  {
    +[MKLog log](MKLog, "log");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[MKApplicationDatabase addIdentifier:].cold.1();

    v6 = 0;
  }

  return v6;
}

- (void)removeCollection:(id)a3
{
  id v4;
  sqlite3 **p_database;
  sqlite3 *database;
  void *v7;
  sqlite3 *v8;
  NSObject *v9;
  NSObject *v10;
  sqlite3_stmt *ppStmt;

  v4 = a3;
  database = self->_database;
  p_database = &self->_database;
  if (database)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("DELETE FROM identifiers WHERE collection = ?;"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    ppStmt = 0;
    v8 = *p_database;
    v9 = objc_retainAutorelease(v7);
    if (!sqlite3_prepare(v8, (const char *)-[NSObject UTF8String](v9, "UTF8String"), -1, &ppStmt, 0))
    {
      sqlite3_bind_text(ppStmt, 1, (const char *)objc_msgSend(objc_retainAutorelease(v4), "UTF8String"), -1, 0);
      if (sqlite3_step(ppStmt) != 101)
      {
        +[MKLog log](MKLog, "log");
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
          -[MKPhotoLibraryAssetDatabase removeCollection:].cold.2();

      }
      sqlite3_finalize(ppStmt);
    }
  }
  else
  {
    +[MKLog log](MKLog, "log");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[MKApplicationDatabase addIdentifier:].cold.1();
  }

}

- (void)initWithType:reuse:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_21EC08000, v0, v1, "could not delete asset database. path=%@, error=%@");
  OUTLINED_FUNCTION_3();
}

- (void)initWithType:reuse:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_21EC08000, v0, v1, "could not delete asset database. directory=%@, error=%@");
  OUTLINED_FUNCTION_3();
}

- (void)open:(uint64_t)a1 reuse:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_21EC08000, a2, OS_LOG_TYPE_ERROR, "%@ could not open a database file.", (uint8_t *)&v2, 0xCu);
  OUTLINED_FUNCTION_3();
}

- (void)removeCollection:.cold.2()
{
  sqlite3 **v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_3_0(v0);
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_21EC08000, v1, v2, "delete failed. %d (%s)", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_2_0();
}

@end
