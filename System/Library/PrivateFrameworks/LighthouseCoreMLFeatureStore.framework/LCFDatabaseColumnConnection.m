@implementation LCFDatabaseColumnConnection

- (id)init:(id)a3 databaseName:(id)a4 tableName:(id)a5
{
  id v9;
  id v10;
  id v11;
  LCFDatabaseColumnConnection *v12;
  void *v13;
  uint64_t v14;
  NSString *databaseNamePath;
  objc_super v17;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)LCFDatabaseColumnConnection;
  v12 = -[LCFDatabaseColumnConnection init](&v17, sel_init);
  if (v12)
  {
    LCFLoggingUtilsInit();
    objc_storeStrong((id *)&v12->_databaseBaseURL, a3);
    objc_storeStrong((id *)&v12->_databaseName, a4);
    objc_storeStrong((id *)&v12->_tableName, a5);
    -[NSURL path](v12->_databaseBaseURL, "path");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "stringByAppendingPathComponent:", v12->_databaseName);
    v14 = objc_claimAutoreleasedReturnValue();
    databaseNamePath = v12->_databaseNamePath;
    v12->_databaseNamePath = (NSString *)v14;

    -[LCFDatabaseColumnConnection ensureDatabaseTable](v12, "ensureDatabaseTable");
  }

  return v12;
}

- (void)ensureDatabaseTable
{
  void *v3;
  void *v4;
  NSString **p_databaseNamePath;
  const char *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  NSString *v15;
  void *v16;
  sqlite3 *v17;
  id v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  sqlite3 *ppDb;
  _BYTE buf[24];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSURL path](self->_databaseBaseURL, "path");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "fileExistsAtPath:", v4) & 1) == 0)
    objc_msgSend(v3, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v4, 1, 0, 0);
  p_databaseNamePath = &self->_databaseNamePath;
  v6 = -[NSString UTF8String](self->_databaseNamePath, "UTF8String");
  ppDb = 0;
  if (sqlite3_open(v6, &ppDb))
  {
    v7 = LCFLogDatabaseColumnConnection;
    if (os_log_type_enabled((os_log_t)LCFLogDatabaseColumnConnection, OS_LOG_TYPE_ERROR))
      -[LCFDatabaseConnection ensureDatabaseTable].cold.2((uint64_t)p_databaseNamePath, v7, v8, v9, v10, v11, v12, v13);
  }
  else
  {
    sqlite3_exec(ppDb, "BEGIN", 0, 0, 0);
    v14 = LCFLogDatabaseColumnConnection;
    if (os_log_type_enabled((os_log_t)LCFLogDatabaseColumnConnection, OS_LOG_TYPE_INFO))
    {
      v15 = *p_databaseNamePath;
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v15;
      _os_log_impl(&dword_24032B000, v14, OS_LOG_TYPE_INFO, "sqlite3_open succeeded %@", buf, 0xCu);
    }
    *(_QWORD *)buf = 0;
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("CREATE TABLE IF NOT EXISTS %@ (ID INTEGER PRIMARY KEY AUTOINCREMENT, ColumnName TEXT, Type INTEGER)"), self->_tableName);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = ppDb;
    v18 = objc_retainAutorelease(v16);
    if (sqlite3_exec(v17, (const char *)objc_msgSend(v18, "UTF8String"), 0, 0, (char **)buf))
    {
      v19 = LCFLogDatabaseColumnConnection;
      if (os_log_type_enabled((os_log_t)LCFLogDatabaseColumnConnection, OS_LOG_TYPE_ERROR))
        -[LCFDatabaseConnection ensureDatabaseTable].cold.1((uint64_t)v18, v19, v20, v21, v22, v23, v24, v25);
    }
    sqlite3_exec(ppDb, "COMMIT", 0, 0, 0);
    sqlite3_close(ppDb);

  }
}

- (BOOL)doQueryEachStep:(id)a3 statementStepHandler:(id)a4
{
  id v6;
  void (**v7)(id, sqlite3_stmt *);
  void *v8;
  const char *v9;
  int v10;
  sqlite3_stmt *v12;
  sqlite3 *ppDb;

  v6 = a3;
  v7 = (void (**)(id, sqlite3_stmt *))a4;
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "fileExistsAtPath:", self->_databaseNamePath))
  {
    v9 = -[NSString UTF8String](self->_databaseNamePath, "UTF8String");
    ppDb = 0;
    if (!sqlite3_open(v9, &ppDb))
    {
      v12 = 0;
      sqlite3_prepare_v2(ppDb, (const char *)objc_msgSend(objc_retainAutorelease(v6), "UTF8String"), -1, &v12, 0);
      while (1)
      {
        v10 = sqlite3_step(v12);
        if (v10 != 100)
          break;
        v7[2](v7, v12);
      }
      if (v10 != 101)
        -[LCFDatabaseColumnConnection doQueryEachStep:statementStepHandler:].cold.1();
      sqlite3_close(ppDb);
    }
  }

  return 1;
}

- (BOOL)doQueryExec:(id)a3
{
  id v4;
  void *v5;
  const char *v6;
  BOOL v7;
  sqlite3 *v9;
  id v10;
  int v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  sqlite3 *ppDb;

  v4 = a3;
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "fileExistsAtPath:", self->_databaseNamePath)
    && (v6 = -[NSString UTF8String](self->_databaseNamePath, "UTF8String"), ppDb = 0, !sqlite3_open(v6, &ppDb)))
  {
    sqlite3_exec(ppDb, "BEGIN", 0, 0, 0);
    v19 = 0;
    v9 = ppDb;
    v10 = objc_retainAutorelease(v4);
    v11 = sqlite3_exec(v9, (const char *)objc_msgSend(v10, "UTF8String", 0), 0, 0, &v19);
    v7 = v11 == 0;
    if (v11)
    {
      v12 = LCFLogDatabaseConnection;
      if (os_log_type_enabled((os_log_t)LCFLogDatabaseConnection, OS_LOG_TYPE_ERROR))
        -[LCFDatabaseConnection ensureDatabaseTable].cold.1((uint64_t)v10, v12, v13, v14, v15, v16, v17, v18);
    }
    sqlite3_exec(ppDb, "COMMIT", 0, 0, 0);
    sqlite3_close(ppDb);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)writeFeatures:(id)a3 featureValueType:(int64_t)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  NSString *tableName;
  void *v17;
  void *v18;
  NSArray *nameTypesCache;
  BOOL v20;
  uint64_t v21;
  void *v22;
  NSObject *v24;
  uint64_t v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint8_t buf[4];
  id v31;
  __int16 v32;
  uint64_t v33;
  __int16 v34;
  int64_t v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  -[LCFDatabaseColumnConnection query](self, "query");
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v26, v36, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v27;
    while (2)
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v27 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
        objc_msgSend(v12, "featureName");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "isEqualToString:", v6);

        if (v14)
        {
          v21 = objc_msgSend(v12, "featureValueType");
          v20 = v21 == a4;
          if (v21 != a4)
          {
            v22 = (void *)LCFLogDatabaseConnection;
            if (os_log_type_enabled((os_log_t)LCFLogDatabaseConnection, OS_LOG_TYPE_ERROR))
            {
              v24 = v22;
              v25 = objc_msgSend(v12, "featureValueType");
              *(_DWORD *)buf = 138412802;
              v31 = v6;
              v32 = 2048;
              v33 = v25;
              v34 = 2048;
              v35 = a4;
              _os_log_error_impl(&dword_24032B000, v24, OS_LOG_TYPE_ERROR, "Wrong type is asked %@ %ld %ld", buf, 0x20u);

            }
            v20 = 0;
          }
          v18 = v7;
          goto LABEL_15;
        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v26, v36, 16);
      if (v9)
        continue;
      break;
    }
  }

  v15 = (void *)MEMORY[0x24BDD17C8];
  tableName = self->_tableName;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a4);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "stringWithFormat:", CFSTR("INSERT INTO %@ (ColumnName, Type) VALUES('%@', %@)"), tableName, v6, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  -[LCFDatabaseColumnConnection doQueryExec:](self, "doQueryExec:", v18);
  nameTypesCache = self->_nameTypesCache;
  self->_nameTypesCache = 0;

  v20 = 1;
LABEL_15:

  return v20;
}

- (id)query
{
  NSArray *nameTypesCache;
  NSArray **p_nameTypesCache;
  id v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;

  p_nameTypesCache = &self->_nameTypesCache;
  nameTypesCache = self->_nameTypesCache;
  if (nameTypesCache)
    return nameTypesCache;
  v6 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("SELECT * FROM %@"), self->_tableName);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __36__LCFDatabaseColumnConnection_query__block_invoke;
  v9[3] = &unk_25109F1D0;
  v8 = v6;
  v10 = v8;
  -[LCFDatabaseColumnConnection doQueryEachStep:statementStepHandler:](self, "doQueryEachStep:statementStepHandler:", v7, v9);
  objc_storeStrong((id *)p_nameTypesCache, v6);

  return v8;
}

void __36__LCFDatabaseColumnConnection_query__block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  sqlite3_stmt *v2;
  const unsigned __int8 *v4;
  LCFFetureValueNameType *v5;
  void *v6;
  id v7;

  v2 = a2;
  v4 = sqlite3_column_text(a2, 1);
  LODWORD(v2) = sqlite3_column_int(v2, 2);
  v5 = [LCFFetureValueNameType alloc];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[LCFFetureValueNameType init:featureValueType:](v5, "init:featureValueType:", v6, (int)v2);

  objc_msgSend(*(id *)(a1 + 32), "addObject:", v7);
}

- (NSURL)databaseBaseURL
{
  return self->_databaseBaseURL;
}

- (NSString)databaseName
{
  return self->_databaseName;
}

- (NSString)databaseNamePath
{
  return self->_databaseNamePath;
}

- (NSString)tableName
{
  return self->_tableName;
}

- (NSArray)nameTypesCache
{
  return self->_nameTypesCache;
}

- (void)setNameTypesCache:(id)a3
{
  objc_storeStrong((id *)&self->_nameTypesCache, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nameTypesCache, 0);
  objc_storeStrong((id *)&self->_tableName, 0);
  objc_storeStrong((id *)&self->_databaseNamePath, 0);
  objc_storeStrong((id *)&self->_databaseName, 0);
  objc_storeStrong((id *)&self->_databaseBaseURL, 0);
}

- (void)doQueryEachStep:statementStepHandler:.cold.1()
{
  __assert_rtn("-[LCFDatabaseColumnConnection doQueryEachStep:statementStepHandler:]", "LCFDatabaseColumnConnection.m", 100, "false");
}

@end
