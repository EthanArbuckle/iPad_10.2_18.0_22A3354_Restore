@implementation MKApplicationDatabase

- (MKApplicationDatabase)init
{
  MKApplicationDatabase *v2;
  MKApplicationDatabase *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id v18;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)MKApplicationDatabase;
  v2 = -[MKApplicationDatabase init](&v19, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_database = 0;
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("/Library/MigrationKit/"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    NSHomeDirectory();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringByAppendingPathComponent:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 0;
    objc_msgSend(v7, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v6, 1, 0, &v18);
    v8 = v18;

    if (v8)
    {
      +[MKLog log](MKLog, "log");
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        -[MKApplicationDatabase init].cold.1((uint64_t)v8, v9, v10, v11, v12, v13, v14, v15);

    }
    objc_msgSend(v6, "stringByAppendingPathComponent:", CFSTR("application.db"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKApplicationDatabase open:](v3, "open:", v16);

  }
  return v3;
}

- (void)dealloc
{
  objc_super v3;

  -[MKApplicationDatabase close](self, "close");
  v3.receiver = self;
  v3.super_class = (Class)MKApplicationDatabase;
  -[MKApplicationDatabase dealloc](&v3, sel_dealloc);
}

- (void)open:(id)a3
{
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  if (sqlite3_open((const char *)objc_msgSend(objc_retainAutorelease(a3), "UTF8String"), &self->_database))
  {
    +[MKLog log](MKLog, "log");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      -[MKApplicationDatabase open:].cold.1((uint64_t)self, v4, v5, v6, v7, v8, v9, v10);

  }
  else
  {
    -[MKApplicationDatabase create](self, "create");
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
      _os_log_impl(&dword_21EC08000, v3, OS_LOG_TYPE_INFO, "will close application database.", v4, 2u);
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
  -[MKApplicationDatabase query:](self, "query:", CFSTR("BEGIN TRANSACTION"));
}

- (void)commit
{
  -[MKApplicationDatabase query:](self, "query:", CFSTR("COMMIT TRANSACTION"));
}

- (void)rollback
{
  -[MKApplicationDatabase query:](self, "query:", CFSTR("ROLLBACK TRANSACTION"));
}

- (void)create
{
  -[MKApplicationDatabase query:](self, "query:", CFSTR("CREATE TABLE IF NOT EXISTS identifiers (identifier TEXT DEFAULT '' NOT NULL);"));
  -[MKApplicationDatabase query:](self, "query:", CFSTR("CREATE TABLE IF NOT EXISTS applications (appstore_identifier TEXT DEFAULT '' NOT NULL);"));
}

- (void)drop
{
  -[MKApplicationDatabase query:](self, "query:", CFSTR("DROP TABLE IF EXISTS identifiers;"));
  -[MKApplicationDatabase query:](self, "query:", CFSTR("DROP TABLE IF EXISTS applications;"));
}

- (void)addIdentifiers:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[MKApplicationDatabase begin](self, "begin");
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
LABEL_3:
    v9 = 0;
    while (1)
    {
      if (*(_QWORD *)v11 != v8)
        objc_enumerationMutation(v5);
      if (!-[MKApplicationDatabase addIdentifier:](self, "addIdentifier:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v9), (_QWORD)v10))break;
      if (v7 == ++v9)
      {
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
        if (v7)
          goto LABEL_3;

        -[MKApplicationDatabase commit](self, "commit");
        goto LABEL_11;
      }
    }
  }

  -[MKApplicationDatabase rollback](self, "rollback");
LABEL_11:

}

- (BOOL)addIdentifier:(id)a3
{
  id v4;
  sqlite3 **p_database;
  sqlite3 *database;
  NSObject *v7;
  unint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  sqlite3 *v13;
  id v14;
  NSObject *v15;
  sqlite3_int64 insert_rowid;
  BOOL v17;
  NSObject *v18;
  sqlite3_stmt *ppStmt;

  v4 = a3;
  database = self->_database;
  p_database = &self->_database;
  if (database)
  {
    v7 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(&unk_24E36C650, "count"));
    if (objc_msgSend(&unk_24E36C650, "count"))
    {
      v8 = 0;
      do
        -[NSObject setObject:atIndexedSubscript:](v7, "setObject:atIndexedSubscript:", CFSTR("?"), v8++);
      while (v8 < objc_msgSend(&unk_24E36C650, "count"));
    }
    v9 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(&unk_24E36C650, "componentsJoinedByString:", CFSTR(","));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject componentsJoinedByString:](v7, "componentsJoinedByString:", CFSTR(","));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringWithFormat:", CFSTR("INSERT INTO identifiers (%@) VALUES (%@)"), v10, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    ppStmt = 0;
    v13 = *p_database;
    v14 = objc_retainAutorelease(v12);
    if (sqlite3_prepare(v13, (const char *)objc_msgSend(v14, "UTF8String"), -1, &ppStmt, 0))
    {
      +[MKLog log](MKLog, "log");
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        -[MKApplicationDatabase query:].cold.2();

      insert_rowid = -1;
    }
    else
    {
      sqlite3_bind_text(ppStmt, 1, (const char *)objc_msgSend(objc_retainAutorelease(v4), "UTF8String"), -1, 0);
      if (sqlite3_step(ppStmt) == 101)
      {
        insert_rowid = sqlite3_last_insert_rowid(*p_database);
      }
      else
      {
        +[MKLog log](MKLog, "log");
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
          -[MKApplicationDatabase addIdentifier:].cold.2();

        insert_rowid = -1;
      }
      sqlite3_finalize(ppStmt);
    }
    v17 = insert_rowid != -1;

  }
  else
  {
    +[MKLog log](MKLog, "log");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[MKApplicationDatabase addIdentifier:].cold.1();
    v17 = 0;
  }

  return v17;
}

- (id)identifiers
{
  id v3;
  sqlite3 **p_database;
  sqlite3 *database;
  void *v6;
  void *v7;
  void *v8;
  sqlite3 *v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  const unsigned __int8 *v13;
  uint64_t v14;
  sqlite3_stmt *ppStmt;

  v3 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  database = self->_database;
  p_database = &self->_database;
  if (database)
  {
    v6 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(&unk_24E36C668, "componentsJoinedByString:", CFSTR(","));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringWithFormat:", CFSTR("SELECT %@ FROM identifiers ORDER BY rowid ASC;"), v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    ppStmt = 0;
    v9 = *p_database;
    v10 = objc_retainAutorelease(v8);
    if (sqlite3_prepare(v9, (const char *)-[NSObject UTF8String](v10, "UTF8String"), -1, &ppStmt, 0))
    {
      +[MKLog log](MKLog, "log");
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        -[MKApplicationDatabase query:].cold.2();

      v12 = 0;
    }
    else
    {
      if (sqlite3_step(ppStmt) == 100)
      {
        v12 = 0;
        do
        {
          v13 = sqlite3_column_text(ppStmt, 0);
          if (v13)
          {
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v13);
            v14 = objc_claimAutoreleasedReturnValue();

            objc_msgSend(v3, "addObject:", v14);
            v12 = (void *)v14;
          }
        }
        while (sqlite3_step(ppStmt) == 100);
      }
      else
      {
        v12 = 0;
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

  return v3;
}

- (void)addAppStoreIdentifier:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  -[MKApplicationDatabase begin](self, "begin");
  v5 = -[MKApplicationDatabase _addAppStoreIdentifier:](self, "_addAppStoreIdentifier:", v4);

  if (v5)
    -[MKApplicationDatabase commit](self, "commit");
  else
    -[MKApplicationDatabase rollback](self, "rollback");
}

- (BOOL)_addAppStoreIdentifier:(id)a3
{
  id v4;
  sqlite3 **p_database;
  sqlite3 *database;
  NSObject *v7;
  unint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  sqlite3 *v13;
  id v14;
  NSObject *v15;
  sqlite3_int64 insert_rowid;
  BOOL v17;
  NSObject *v18;
  sqlite3_stmt *ppStmt;

  v4 = a3;
  database = self->_database;
  p_database = &self->_database;
  if (database)
  {
    v7 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(&unk_24E36C680, "count"));
    if (objc_msgSend(&unk_24E36C680, "count"))
    {
      v8 = 0;
      do
        -[NSObject setObject:atIndexedSubscript:](v7, "setObject:atIndexedSubscript:", CFSTR("?"), v8++);
      while (v8 < objc_msgSend(&unk_24E36C680, "count"));
    }
    v9 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(&unk_24E36C680, "componentsJoinedByString:", CFSTR(","));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject componentsJoinedByString:](v7, "componentsJoinedByString:", CFSTR(","));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringWithFormat:", CFSTR("INSERT INTO applications (%@) VALUES (%@)"), v10, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    ppStmt = 0;
    v13 = *p_database;
    v14 = objc_retainAutorelease(v12);
    if (sqlite3_prepare(v13, (const char *)objc_msgSend(v14, "UTF8String"), -1, &ppStmt, 0))
    {
      +[MKLog log](MKLog, "log");
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        -[MKApplicationDatabase query:].cold.2();

      insert_rowid = -1;
    }
    else
    {
      sqlite3_bind_text(ppStmt, 1, (const char *)objc_msgSend(objc_retainAutorelease(v4), "UTF8String"), -1, 0);
      if (sqlite3_step(ppStmt) == 101)
      {
        insert_rowid = sqlite3_last_insert_rowid(*p_database);
      }
      else
      {
        +[MKLog log](MKLog, "log");
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
          -[MKApplicationDatabase addIdentifier:].cold.2();

        insert_rowid = -1;
      }
      sqlite3_finalize(ppStmt);
    }
    v17 = insert_rowid != -1;

  }
  else
  {
    +[MKLog log](MKLog, "log");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[MKApplicationDatabase addIdentifier:].cold.1();
    v17 = 0;
  }

  return v17;
}

- (id)appStoreIdentifiers
{
  id v3;
  sqlite3 **p_database;
  sqlite3 *database;
  void *v6;
  void *v7;
  void *v8;
  sqlite3 *v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  const unsigned __int8 *v13;
  uint64_t v14;
  sqlite3_stmt *ppStmt;

  v3 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  database = self->_database;
  p_database = &self->_database;
  if (database)
  {
    v6 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(&unk_24E36C698, "componentsJoinedByString:", CFSTR(","));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringWithFormat:", CFSTR("SELECT %@ FROM applications ORDER BY rowid ASC;"), v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    ppStmt = 0;
    v9 = *p_database;
    v10 = objc_retainAutorelease(v8);
    if (sqlite3_prepare(v9, (const char *)-[NSObject UTF8String](v10, "UTF8String"), -1, &ppStmt, 0))
    {
      +[MKLog log](MKLog, "log");
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        -[MKApplicationDatabase query:].cold.2();

      v12 = 0;
    }
    else
    {
      if (sqlite3_step(ppStmt) == 100)
      {
        v12 = 0;
        do
        {
          v13 = sqlite3_column_text(ppStmt, 0);
          if (v13)
          {
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v13);
            v14 = objc_claimAutoreleasedReturnValue();

            objc_msgSend(v3, "addObject:", v14);
            v12 = (void *)v14;
          }
        }
        while (sqlite3_step(ppStmt) == 100);
      }
      else
      {
        v12 = 0;
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

  return v3;
}

- (int64_t)countForAppStoreIdentifiers
{
  sqlite3_int64 v2;
  NSObject *v3;
  sqlite3_stmt *ppStmt;

  if (self->_database)
  {
    ppStmt = 0;
    v2 = 0;
    if (!sqlite3_prepare(self->_database, (const char *)objc_msgSend(CFSTR("SELECT COUNT(*) FROM applications;"), "UTF8String"),
            -1,
            &ppStmt,
            0))
    {
      if (sqlite3_step(ppStmt) == 100)
        v2 = sqlite3_column_int64(ppStmt, 0);
      else
        v2 = 0;
      sqlite3_finalize(ppStmt);
    }
  }
  else
  {
    +[MKLog log](MKLog, "log");
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      -[MKApplicationDatabase addIdentifier:].cold.1();

    return 0;
  }
  return v2;
}

- (void)init
{
  OUTLINED_FUNCTION_0_0(&dword_21EC08000, a2, a3, "could not create a directory for application database. error=%@", a5, a6, a7, a8, 2u);
}

- (void)open:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_21EC08000, a2, a3, "%@ could not open a database file.", a5, a6, a7, a8, 2u);
}

- (void)query:.cold.1()
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
  OUTLINED_FUNCTION_0_1(&dword_21EC08000, v1, v2, "query failed. %d (%s)", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_2_0();
}

- (void)query:.cold.2()
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
  OUTLINED_FUNCTION_0_1(&dword_21EC08000, v1, v2, "prepare failed. %d (%s)", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_2_0();
}

- (void)addIdentifier:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0(&dword_21EC08000, v0, v1, "tried to access an unintialized or closed database.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

- (void)addIdentifier:.cold.2()
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
  OUTLINED_FUNCTION_0_1(&dword_21EC08000, v1, v2, "insert failed. %d (%s)", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_2_0();
}

@end
