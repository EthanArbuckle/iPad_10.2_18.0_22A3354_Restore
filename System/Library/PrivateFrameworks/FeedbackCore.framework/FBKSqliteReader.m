@implementation FBKSqliteReader

- (FBKSqliteReader)initWithFile:(id)a3
{
  id v4;
  FBKSqliteReader *v5;
  FBKSqliteReader *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)FBKSqliteReader;
  v5 = -[FBKSqliteReader init](&v8, sel_init);
  v6 = v5;
  if (v5)
    -[FBKSqliteReader setDbFile:](v5, "setDbFile:", v4);

  return v6;
}

- (void)setDbFile:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  int v8;
  NSObject *v9;
  uint64_t v10;
  NSURL *dbFile;

  v5 = a3;
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "path");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "fileExistsAtPath:", v7);

  if (v8)
  {
    objc_storeStrong((id *)&self->_dbFile, a3);
  }
  else
  {
    +[FBKLog appHandle](FBKLog, "appHandle");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[FBKSqliteReader setDbFile:].cold.1((uint64_t)v5, v9, v10);

    dbFile = self->_dbFile;
    self->_dbFile = 0;

  }
}

- (id)tableNames
{
  void *v2;
  void *v3;

  -[FBKSqliteReader runQuery:](self, "runQuery:", CFSTR("SELECT name FROM sqlite_master WHERE type='table'"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "valueForKey:", CFSTR("name"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)allRowsForTable:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v9;

  v4 = a3;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCA98], CFSTR("passed nil tableName to rowsForTable:"), 0);
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v9);
  }
  v5 = v4;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("SELECT * FROM %@"), v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[FBKSqliteReader runQuery:](self, "runQuery:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)csvRepresentationForTable:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  const __CFString *v11;
  unint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  const __CFString *v19;
  unint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  __CFString *v25;
  id v27;
  uint64_t v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[FBKSqliteReader allRowsForTable:](self, "allRowsForTable:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
  if (v6)
  {
    v7 = v6;
    v27 = v4;
    v8 = 0;
    v9 = 0;
    v10 = *(_QWORD *)v30;
    v11 = CFSTR("\n");
    v12 = 0x24BDD1000uLL;
    do
    {
      v13 = 0;
      v14 = v8;
      v28 = v7;
      do
      {
        if (*(_QWORD *)v30 != v10)
          objc_enumerationMutation(v5);
        v15 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * v13);
        if (!v9)
        {
          v9 = (void *)objc_opt_new();
          objc_msgSend(v15, "allKeys");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = v16;
          if (v16 && objc_msgSend(v16, "count"))
          {
            objc_msgSend(v17, "componentsJoinedByString:", CFSTR(","));
            v18 = v10;
            v19 = v11;
            v20 = v12;
            v21 = v5;
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "appendString:", v22);

            v5 = v21;
            v12 = v20;
            v11 = v19;
            v10 = v18;
            v7 = v28;
          }
          objc_msgSend(v9, "appendString:", v11);

        }
        objc_msgSend(v15, "allValues");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "componentsJoinedByString:", CFSTR(","));
        v8 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(*(id *)(v12 + 1992), "stringWithFormat:", CFSTR("%@\n"), v8);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "appendString:", v24);

        ++v13;
        v14 = v8;
      }
      while (v7 != v13);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    }
    while (v7);
    if (v9)
      v25 = (__CFString *)objc_msgSend(objc_alloc(*(Class *)(v12 + 1992)), "initWithString:", v9);
    else
      v25 = &stru_24E15EAF8;
    v4 = v27;
  }
  else
  {
    v8 = 0;
    v9 = 0;
    v25 = &stru_24E15EAF8;
  }

  return v25;
}

- (id)runQuery:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  NSObject *v11;
  int v12;
  uint64_t v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  const unsigned __int8 *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v31;
  id v32;
  void *v33;
  sqlite3_stmt *ppStmt;
  sqlite3 *ppDb;

  v4 = a3;
  if (!self->_dbFile)
  {
    objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCA98], CFSTR("invalid database file"), 0);
    v31 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v31);
  }
  v5 = v4;
  ppDb = 0;
  -[FBKSqliteReader dbFile](self, "dbFile");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "path");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_retainAutorelease(v7);
  v9 = 0;
  v10 = 0;
  if (!sqlite3_open((const char *)objc_msgSend(v8, "UTF8String"), &ppDb))
  {
    ppStmt = 0;
    if (sqlite3_prepare_v2(ppDb, (const char *)objc_msgSend(objc_retainAutorelease(v5), "UTF8String"), -1, &ppStmt, 0))
    {
      +[FBKLog appHandle](FBKLog, "appHandle");
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        -[FBKSqliteReader runQuery:].cold.1(&ppDb, v11);

      v9 = 0;
      v10 = 0;
    }
    else
    {
      v12 = sqlite3_column_count(ppStmt);
      v13 = v12;
      v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", v12);
      if (v12 >= 1)
      {
        v15 = 0;
        do
        {
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", sqlite3_column_name(ppStmt, v15));
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "addObject:", v16);

          ++v15;
        }
        while ((_DWORD)v13 != v15);
      }
      v17 = (void *)MEMORY[0x24BDBCE30];
      v18 = (void *)objc_msgSend(v14, "copy");
      objc_msgSend(v17, "arrayWithArray:", v18);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", v13);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (sqlite3_step(ppStmt) == 100)
      {
        v32 = v8;
        v33 = v5;
        do
        {
          v19 = (void *)objc_opt_new();
          if ((int)v13 < 1)
          {
            v22 = 0;
            v21 = 0;
          }
          else
          {
            v20 = 0;
            v21 = 0;
            v22 = 0;
            do
            {
              v23 = sqlite3_column_text(ppStmt, v20);
              if (v23)
              {
                objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v23);
                v24 = objc_claimAutoreleasedReturnValue();

                objc_msgSend(v10, "objectAtIndexedSubscript:", v20);
                v25 = objc_claimAutoreleasedReturnValue();

                objc_msgSend(v19, "setObject:forKeyedSubscript:", v24, v25);
                v22 = (void *)v25;
                v21 = (void *)v24;
              }
              ++v20;
            }
            while (v13 != v20);
          }
          v26 = (void *)objc_msgSend(v19, "copy", v32, v33);
          objc_msgSend(v9, "addObject:", v26);

        }
        while (sqlite3_step(ppStmt) == 100);
        v8 = v32;
        v5 = v33;
      }
    }
    sqlite3_finalize(ppStmt);
  }
  sqlite3_close(ppDb);
  v27 = (void *)MEMORY[0x24BDBCE30];
  v28 = (void *)objc_msgSend(v9, "copy");
  objc_msgSend(v27, "arrayWithArray:", v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  return v29;
}

- (NSURL)dbFile
{
  return self->_dbFile;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dbFile, 0);
}

- (void)setDbFile:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v3 = 138412290;
  v4 = a1;
  OUTLINED_FUNCTION_1_1(&dword_21D9A9000, a2, a3, "dbFile %@ does not exist, setting to nil", (uint8_t *)&v3);
}

- (void)runQuery:(sqlite3 *)a1 .cold.1(sqlite3 **a1, NSObject *a2)
{
  const char *v3;
  uint64_t v4;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = sqlite3_errmsg(*a1);
  v5 = 136315138;
  v6 = v3;
  OUTLINED_FUNCTION_1_1(&dword_21D9A9000, a2, v4, "%s", (uint8_t *)&v5);
}

@end
