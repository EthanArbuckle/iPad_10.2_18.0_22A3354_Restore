@implementation IMDDatabaseDowngradeHelper

- (IMDDatabaseDowngradeHelper)initWithPath:(id)a3 tableNames:(id)a4 createTablesSQL:(id)a5 createIndexesSQL:(id)a6 createTriggersSQL:(id)a7 downgradesToVersion:(int64_t)a8
{
  IMDDatabaseDowngradeHelper *v14;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)IMDDatabaseDowngradeHelper;
  v14 = -[IMDDatabaseDowngradeHelper init](&v16, sel_init);
  if (v14)
  {
    v14->_path = (NSString *)objc_msgSend(a3, "copy");
    v14->_tableNames = (NSArray *)objc_msgSend(a4, "copy");
    v14->_createTablesSQL = (NSArray *)objc_msgSend(a5, "copy");
    v14->_createIndexesSQL = (NSArray *)objc_msgSend(a6, "copy");
    v14->_createTriggersSQL = (NSArray *)objc_msgSend(a7, "copy");
    v14->_downgradesToVersion = a8;
  }
  return v14;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)IMDDatabaseDowngradeHelper;
  -[IMDDatabaseDowngradeHelper dealloc](&v3, sel_dealloc);
}

- (BOOL)runSimpleQuery:(id)a3 resultBlock:(id)a4
{
  id v7;
  uint64_t v8;
  uint64_t v9;
  sqlite3_stmt *ppStmt;

  ppStmt = 0;
  v7 = -[IMDDatabaseDowngradeHelper errorFromResult:query:](self, "errorFromResult:query:", sqlite3_prepare_v2(self->_database, (const char *)objc_msgSend(a3, "UTF8String"), -1, &ppStmt, 0), a3);
  if (!v7)
  {
    v8 = sqlite3_step(ppStmt);
    if ((_DWORD)v8 == 100)
    {
      do
        v9 = sqlite3_step(ppStmt);
      while ((_DWORD)v9 == 100);
      v8 = v9;
    }
    v7 = -[IMDDatabaseDowngradeHelper errorFromResult:query:](self, "errorFromResult:query:", v8, a3);
  }
  if (ppStmt)
  {
    sqlite3_finalize(ppStmt);
    ppStmt = 0;
  }
  if (a4)
    (*((void (**)(id, BOOL, id))a4 + 2))(a4, v7 == 0, v7);
  return v7 == 0;
}

- (BOOL)runArrayOfQueries:(id)a3 resultBlock:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _BOOL4 v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v7 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
LABEL_3:
    v10 = 0;
    while (1)
    {
      if (*(_QWORD *)v14 != v9)
        objc_enumerationMutation(a3);
      v11 = -[IMDDatabaseDowngradeHelper runSimpleQuery:resultBlock:](self, "runSimpleQuery:resultBlock:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v10), a4);
      if (!v11)
        break;
      if (v8 == ++v10)
      {
        v8 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
        if (v8)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:
    LOBYTE(v11) = 1;
  }
  return v11;
}

- (BOOL)createTables:(id)a3
{
  -[IMDDatabaseDowngradeHelper createTablesSQL](self, "createTablesSQL");
  return MEMORY[0x1E0DE7D20](self, sel_runArrayOfQueries_resultBlock_);
}

- (BOOL)createIndexes:(id)a3
{
  -[IMDDatabaseDowngradeHelper createIndexesSQL](self, "createIndexesSQL");
  return MEMORY[0x1E0DE7D20](self, sel_runArrayOfQueries_resultBlock_);
}

- (BOOL)createTriggers:(id)a3
{
  -[IMDDatabaseDowngradeHelper createTriggersSQL](self, "createTriggersSQL");
  return MEMORY[0x1E0DE7D20](self, sel_runArrayOfQueries_resultBlock_);
}

- (BOOL)isOpen
{
  return self->_database != 0;
}

- (BOOL)beginTransaction:(id)a3
{
  BOOL result;

  result = -[IMDDatabaseDowngradeHelper runSimpleQuery:resultBlock:](self, "runSimpleQuery:resultBlock:", CFSTR("BEGIN EXCLUSIVE;"),
             a3);
  self->_inTransaction = result;
  return result;
}

- (BOOL)commitTransaction:(id)a3
{
  BOOL v4;
  NSObject *v5;
  uint8_t v7[16];

  if (self->_inTransaction)
  {
    if (-[IMDDatabaseDowngradeHelper runSimpleQuery:resultBlock:](self, "runSimpleQuery:resultBlock:", CFSTR("COMMIT;"),
           a3))
    {
      self->_inTransaction = 0;
      return 1;
    }
    else
    {
      return 0;
    }
  }
  else
  {
    v5 = IMLogHandleForCategory();
    v4 = 1;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_1ABB60000, v5, OS_LOG_TYPE_INFO, "Skipping commit of a non-existent transaction in Downgraded database", v7, 2u);
    }
  }
  return v4;
}

- (BOOL)revertTransaction:(id)a3
{
  BOOL v4;
  NSObject *v5;
  uint8_t v7[16];

  if (self->_inTransaction)
  {
    if (-[IMDDatabaseDowngradeHelper runSimpleQuery:resultBlock:](self, "runSimpleQuery:resultBlock:", CFSTR("REVERT;"),
           a3))
    {
      self->_inTransaction = 0;
      return 1;
    }
    else
    {
      return 0;
    }
  }
  else
  {
    v5 = IMLogHandleForCategory();
    v4 = 1;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_1ABB60000, v5, OS_LOG_TYPE_INFO, "Skipping revert of a non-existant transaction in Downgraded database.", v7, 2u);
    }
  }
  return v4;
}

- (BOOL)writeDatabaseVersion:(int64_t)a3 resultBlock:(id)a4
{
  return -[IMDDatabaseDowngradeHelper runSimpleQuery:resultBlock:](self, "runSimpleQuery:resultBlock:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("UPDATE _SqliteDatabaseProperties SET value = %ld WHERE key = '_ClientVersion';"),
             a3),
           a4);
}

- (BOOL)cloneTableContents:(id)a3 withOperation:(IMDSqlOperation *)a4 resultBlock:(id)a5
{
  NSObject *v8;
  id Rows;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  id v20;
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint8_t v26[128];
  uint8_t buf[16];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v8 = IMLogHandleForCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)&buf[4] = a3;
    _os_log_impl(&dword_1ABB60000, v8, OS_LOG_TYPE_INFO, "Cloning and downgrading table '%@' into Downgraded Database", buf, 0xCu);
  }
  Rows = _IMDSqlOperationGetRows((uint64_t)a4, (const __CFString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("PRAGMA dest.table_info(%@);"),
                                 a3));
  *(_QWORD *)buf = 0;
  IMDSqlOperationGetError((uint64_t)a4, buf);
  v10 = *(_QWORD *)buf;
  if (!*(_QWORD *)buf)
  {
    v20 = a3;
    v21 = a5;
    v11 = (void *)objc_msgSend(MEMORY[0x1E0CB37A0], "string");
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v12 = objc_msgSend(Rows, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v23;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v23 != v14)
            objc_enumerationMutation(Rows);
          v16 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
          v17 = objc_msgSend(v11, "length");
          v18 = objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("name"));
          if (v17)
            objc_msgSend(v11, "appendFormat:", CFSTR(", %@"), v18);
          else
            objc_msgSend(v11, "appendString:", v18);
        }
        v13 = objc_msgSend(Rows, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      }
      while (v13);
    }
    _IMDSqlOperationRunQuery((uint64_t)a4, (CFStringRef)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("INSERT INTO dest.%@ SELECT %@ FROM main.%@"), v20, v11, v20), 0, 0);
    *(_QWORD *)buf = 0;
    IMDSqlOperationGetError((uint64_t)a4, buf);
    v10 = *(_QWORD *)buf;
    a5 = v21;
  }

  if (a5)
    (*((void (**)(id, BOOL, uint64_t))a5 + 2))(a5, v10 == 0, v10);
  return v10 == 0;
}

- (BOOL)importDataFromWhitetailDatabaseWithSqlOperation:(IMDSqlOperation *)a3 resultBlock:(id)a4
{
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  NSObject *v9;
  NSArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  NSObject *v16;
  BOOL v17;
  id v19;
  _QWORD v21[5];
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint8_t buf[8];
  uint8_t *v27;
  uint64_t v28;
  void (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  uint64_t v31;
  uint8_t v32[16];
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v6 = IMLogHandleForCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1ABB60000, v6, OS_LOG_TYPE_INFO, "Downgrade: turning off foreign keys", buf, 2u);
  }
  _IMDSqlOperationRunQuery((uint64_t)a3, CFSTR("PRAGMA foreign_keys = OFF;"), 0, 0);
  *(_QWORD *)buf = 0;
  v27 = buf;
  v28 = 0x3052000000;
  v29 = sub_1ABB6CAAC;
  v30 = sub_1ABB6CABC;
  v31 = 0;
  *(_QWORD *)v32 = 0;
  IMDSqlOperationGetError((uint64_t)a3, v32);
  v31 = *(_QWORD *)v32;
  if (!*((_QWORD *)v27 + 5))
  {
    v7 = IMLogHandleForCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v32 = 0;
      _os_log_impl(&dword_1ABB60000, v7, OS_LOG_TYPE_INFO, "Downgrade: attaching new (empty so far) downgraded database to the real database", v32, 2u);
    }
    _IMDSqlOperationRunQuery((uint64_t)a3, (CFStringRef)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("ATTACH '%@' AS 'dest';"),
                     -[IMDDatabaseDowngradeHelper path](self, "path")),
      0,
      0);
    *(_QWORD *)v32 = 0;
    IMDSqlOperationGetError((uint64_t)a3, v32);
    v8 = *(_QWORD *)v32;
    *((_QWORD *)v27 + 5) = *(_QWORD *)v32;
    if (!v8)
    {
      v9 = IMLogHandleForCategory();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v32 = 0;
        _os_log_impl(&dword_1ABB60000, v9, OS_LOG_TYPE_INFO, "Downgrade: Beginning transaction", v32, 2u);
      }
      IMDSqlOperationBeginTransaction(a3);
      v19 = a4;
      v24 = 0u;
      v25 = 0u;
      v22 = 0u;
      v23 = 0u;
      v10 = -[IMDDatabaseDowngradeHelper tableNames](self, "tableNames");
      v11 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v22, v33, 16);
      if (v11)
      {
        v12 = *(_QWORD *)v23;
LABEL_11:
        v13 = 0;
        while (1)
        {
          if (*(_QWORD *)v23 != v12)
            objc_enumerationMutation(v10);
          v14 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * v13);
          v15 = IMLogHandleForCategory();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)v32 = 138412290;
            *(_QWORD *)&v32[4] = v14;
            _os_log_impl(&dword_1ABB60000, v15, OS_LOG_TYPE_INFO, "Downgrade: Copying table: %@", v32, 0xCu);
          }
          v21[0] = MEMORY[0x1E0C809B0];
          v21[1] = 3221225472;
          v21[2] = sub_1ABB6CAC8;
          v21[3] = &unk_1E5AAF548;
          v21[4] = buf;
          -[IMDDatabaseDowngradeHelper cloneTableContents:withOperation:resultBlock:](self, "cloneTableContents:withOperation:resultBlock:", v14, a3, v21);
          if (*((_QWORD *)v27 + 5))
            break;
          if (v11 == ++v13)
          {
            v11 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v22, v33, 16);
            if (v11)
              goto LABEL_11;
            break;
          }
        }
      }
      IMDSqlOperationCommitOrRevertTransaction(a3);
      a4 = v19;
    }
  }
  v16 = IMLogHandleForCategory();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v32 = 0;
    _os_log_impl(&dword_1ABB60000, v16, OS_LOG_TYPE_INFO, "Downgrade: Detaching database", v32, 2u);
  }
  _IMDSqlOperationRunQuery((uint64_t)a3, CFSTR("DETACH DATABASE 'dest';"), 0, 0);
  if (a4)
    (*((void (**)(id, BOOL))a4 + 2))(a4, *((_QWORD *)v27 + 5) == 0);
  v17 = *((_QWORD *)v27 + 5) == 0;
  _Block_object_dispose(buf, 8);
  return v17;
}

- (id)errorFromResult:(int)a3 query:(id)a4
{
  BOOL v5;
  NSObject *v6;
  void *v7;
  void *v9;
  NSObject *v10;
  int v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = (a3 - 100) < 2 || a3 == 0;
  if (v5 || (v9 = IMDCreateCFErrorWithQueryErrorCode(a3, self->_database, (uint64_t)a4)) == 0)
  {
    v6 = IMLogHandleForCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v11 = 138412290;
      v12 = a4;
      _os_log_impl(&dword_1ABB60000, v6, OS_LOG_TYPE_INFO, "Downgraded database SQL query ran ok: '%@'", (uint8_t *)&v11, 0xCu);
    }
    return 0;
  }
  else
  {
    v7 = v9;
    v10 = IMLogHandleForCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      sub_1ABC55F30((uint64_t)a4, v7, v10);
  }
  return v7;
}

- (BOOL)open:(id)a3
{
  NSObject *v5;
  NSString *path;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  BOOL v10;
  _QWORD v12[5];
  _QWORD v13[5];
  _QWORD v14[5];
  _QWORD v15[5];
  __int128 buf;
  uint64_t v17;
  void (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = IMLogHandleForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    path = self->_path;
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = path;
    _os_log_impl(&dword_1ABB60000, v5, OS_LOG_TYPE_INFO, "Opening Downgraded database at: '%@'...", (uint8_t *)&buf, 0xCu);
  }
  v7 = sqlite3_open_v2(-[NSString UTF8String](self->_path, "UTF8String"), &self->_database, 6, 0);
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v17 = 0x3052000000;
  v18 = sub_1ABB6CAAC;
  v19 = sub_1ABB6CABC;
  v20 = 0;
  v20 = -[IMDDatabaseDowngradeHelper errorFromResult:query:](self, "errorFromResult:query:", v7, CFSTR("Open database"));
  v8 = *((_QWORD *)&buf + 1);
  if (!*(_QWORD *)(*((_QWORD *)&buf + 1) + 40))
  {
    v9 = MEMORY[0x1E0C809B0];
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = sub_1ABB6CE70;
    v15[3] = &unk_1E5AAF548;
    v15[4] = &buf;
    -[IMDDatabaseDowngradeHelper runSimpleQuery:resultBlock:](self, "runSimpleQuery:resultBlock:", CFSTR("PRAGMA page_size = 4096;"),
      v15);
    v8 = *((_QWORD *)&buf + 1);
    if (!*(_QWORD *)(*((_QWORD *)&buf + 1) + 40))
    {
      v14[0] = v9;
      v14[1] = 3221225472;
      v14[2] = sub_1ABB6CE80;
      v14[3] = &unk_1E5AAF548;
      v14[4] = &buf;
      -[IMDDatabaseDowngradeHelper runSimpleQuery:resultBlock:](self, "runSimpleQuery:resultBlock:", CFSTR("PRAGMA auto_vacuum = 2;"),
        v14);
      v8 = *((_QWORD *)&buf + 1);
      if (!*(_QWORD *)(*((_QWORD *)&buf + 1) + 40))
      {
        v13[0] = v9;
        v13[1] = 3221225472;
        v13[2] = sub_1ABB6CE90;
        v13[3] = &unk_1E5AAF548;
        v13[4] = &buf;
        -[IMDDatabaseDowngradeHelper runSimpleQuery:resultBlock:](self, "runSimpleQuery:resultBlock:", CFSTR("PRAGMA journal_mode = wal;"),
          v13);
        v8 = *((_QWORD *)&buf + 1);
        if (!*(_QWORD *)(*((_QWORD *)&buf + 1) + 40))
        {
          v12[0] = v9;
          v12[1] = 3221225472;
          v12[2] = sub_1ABB6CEA0;
          v12[3] = &unk_1E5AAF548;
          v12[4] = &buf;
          -[IMDDatabaseDowngradeHelper runSimpleQuery:resultBlock:](self, "runSimpleQuery:resultBlock:", CFSTR("PRAGMA foreign_keys = OFF;"),
            v12);
          v8 = *((_QWORD *)&buf + 1);
        }
      }
    }
  }
  if (a3)
  {
    (*((void (**)(id, BOOL))a3 + 2))(a3, *(_QWORD *)(v8 + 40) == 0);
    v8 = *((_QWORD *)&buf + 1);
  }
  v10 = *(_QWORD *)(v8 + 40) == 0;
  _Block_object_dispose(&buf, 8);
  return v10;
}

- (BOOL)close:(id)a3
{
  sqlite3 *database;
  NSObject *v6;
  NSString *path;
  int v9;
  NSString *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  database = self->_database;
  if (database)
  {
    sqlite3_close_v2(database);
    self->_database = 0;
    v6 = IMLogHandleForCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      path = self->_path;
      v9 = 138412290;
      v10 = path;
      _os_log_impl(&dword_1ABB60000, v6, OS_LOG_TYPE_INFO, "Closed Downgraded database at: '%@'...", (uint8_t *)&v9, 0xCu);
    }
  }
  if (a3)
    (*((void (**)(id, uint64_t, _QWORD))a3 + 2))(a3, 1, 0);
  return 1;
}

- (sqlite3)database
{
  return self->_database;
}

- (NSString)path
{
  return self->_path;
}

- (void)setPath:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 24);
}

- (int64_t)downgradesToVersion
{
  return self->_downgradesToVersion;
}

- (NSArray)tableNames
{
  return self->_tableNames;
}

- (void)setTableNames:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 40);
}

- (NSArray)createIndexesSQL
{
  return self->_createIndexesSQL;
}

- (void)setCreateIndexesSQL:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 48);
}

- (NSArray)createTablesSQL
{
  return self->_createTablesSQL;
}

- (void)setCreateTablesSQL:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 56);
}

- (NSArray)createTriggersSQL
{
  return self->_createTriggersSQL;
}

- (void)setCreateTriggersSQL:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 64);
}

- (BOOL)_readIntegerFromQuery:(id)a3 resultBlock:(id)a4
{
  id v7;
  id v8;
  sqlite3_int64 v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  sqlite3_stmt *ppStmt;

  ppStmt = 0;
  v7 = -[IMDDatabaseDowngradeHelper errorFromResult:query:](self, "errorFromResult:query:", sqlite3_prepare_v2(self->_database, (const char *)objc_msgSend(a3, "UTF8String"), -1, &ppStmt, 0), a3);
  if (v7)
  {
    v8 = v7;
    v9 = 0x7FFFFFFFFFFFFFFFLL;
  }
  else
  {
    v10 = sqlite3_step(ppStmt);
    if ((_DWORD)v10 == 100)
    {
      do
      {
        v9 = sqlite3_column_int64(ppStmt, 0);
        v11 = sqlite3_step(ppStmt);
      }
      while ((_DWORD)v11 == 100);
      v12 = v11;
    }
    else
    {
      v12 = v10;
      v9 = 0x7FFFFFFFFFFFFFFFLL;
    }
    v8 = -[IMDDatabaseDowngradeHelper errorFromResult:query:](self, "errorFromResult:query:", v12, a3);
  }
  if (ppStmt)
  {
    sqlite3_finalize(ppStmt);
    ppStmt = 0;
  }
  if (a4)
    (*((void (**)(id, BOOL, id, sqlite3_int64))a4 + 2))(a4, v8 == 0, v8, v9);
  return v8 == 0;
}

- (BOOL)readDatabaseVersion:(id)a3
{
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("SELECT value FROM _SqliteDatabaseProperties WHERE key = '_ClientVersion';"));
  return MEMORY[0x1E0DE7D20](self, sel__readIntegerFromQuery_resultBlock_);
}

- (BOOL)readRowCountForTable:(id)a3 resultBlock:(id)a4
{
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("SELECT count(*) FROM %@;"), a3);
  return MEMORY[0x1E0DE7D20](self, sel__readIntegerFromQuery_resultBlock_);
}

@end
