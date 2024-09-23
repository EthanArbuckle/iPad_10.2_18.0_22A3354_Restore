@implementation ACCSQLite

- (ACCSQLite)initWithPath:(id)a3 schema:(id)a4
{
  id v7;
  id v8;
  ACCSQLite *v9;
  ACCSQLite *v10;
  uint64_t v11;
  NSString *schemaVersion;
  NSMutableDictionary *v13;
  NSMutableDictionary *statementsBySQL;
  NSString *objectClassPrefix;
  objc_super v17;

  v7 = a3;
  v8 = a4;
  v17.receiver = self;
  v17.super_class = (Class)ACCSQLite;
  v9 = -[ACCSQLite init](&v17, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_path, a3);
    objc_storeStrong((id *)&v10->_schema, a4);
    -[ACCSQLite _createSchemaHash](v10, "_createSchemaHash");
    v11 = objc_claimAutoreleasedReturnValue();
    schemaVersion = v10->_schemaVersion;
    v10->_schemaVersion = (NSString *)v11;

    v13 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    statementsBySQL = v10->_statementsBySQL;
    v10->_statementsBySQL = v13;

    objectClassPrefix = v10->_objectClassPrefix;
    v10->_objectClassPrefix = (NSString *)CFSTR("CK");

    v10->_synchronousMode = 1;
    *(_WORD *)&v10->_hasMigrated = 256;
  }

  return v10;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  v3 = (void *)MEMORY[0x219A08EFC](self, a2);
  -[ACCSQLite close](self, "close");
  objc_autoreleasePoolPop(v3);
  v4.receiver = self;
  v4.super_class = (Class)ACCSQLite;
  -[ACCSQLite dealloc](&v4, sel_dealloc);
}

- (int)userVersion
{
  void *v3;
  void *v4;
  int v5;

  -[ACCSQLite delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return self->_userVersion;
  -[ACCSQLite delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "userVersion");

  return v5;
}

- (id)_synchronousModeString
{
  unint64_t v2;

  v2 = -[ACCSQLite synchronousMode](self, "synchronousMode");
  if (v2 >= 3)
    -[ACCSQLite _synchronousModeString].cold.1();
  return off_24D71A138[v2];
}

- (id)_createSchemaHash
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _OWORD v8[2];
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  memset(v8, 0, sizeof(v8));
  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytesNoCopy:length:freeWhenDone:", v8, 32, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACCSQLite schema](self, "schema");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dataUsingEncoding:", 4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  CC_SHA256((const void *)objc_msgSend(v5, "bytes"), objc_msgSend(v5, "length"), (unsigned __int8 *)v8);
  objc_msgSend(v3, "CKUppercaseHexStringWithoutSpaces");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)isOpen
{
  return self->_db != 0;
}

- (void)_periodicVacuum
{
  void *v3;
  void *v4;
  float v5;
  double v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v3 = (void *)MEMORY[0x24BDBCE60];
  -[ACCSQLite propertyForKey:](self, "propertyForKey:", CFSTR("LastVacuum"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "floatValue");
  objc_msgSend(v3, "dateWithTimeIntervalSinceReferenceDate:", v5);
  v11 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "timeIntervalSinceNow");
  if (v6 < -604800.0)
  {
    -[ACCSQLite executeSQL:](self, "executeSQL:", CFSTR("VACUUM"));
    v7 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "timeIntervalSinceReferenceDate");
    objc_msgSend(v7, "stringWithFormat:", CFSTR("%f"), v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    -[ACCSQLite setProperty:forKey:](self, "setProperty:forKey:", v10, CFSTR("LastVacuum"));
  }

}

- (BOOL)openWithError:(id *)a3
{
  NSString *v5;
  unint64_t openCount;
  void *v7;
  id v8;
  id v9;
  BOOL v10;
  void *v11;
  char v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t v16;
  NSString *v17;
  void *v18;
  id v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  char v23;
  void *v24;
  id v25;
  int v26;
  sqlite3 **p_db;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  _BOOL4 v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  int v40;
  void *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  uint64_t v46;
  void *v47;
  void *v48;
  int v49;
  char v50;
  void *v51;
  void *v52;
  void *v53;
  uint64_t v54;
  void *v55;
  id *v56;
  id v57;
  id v58;
  uint64_t v59;
  void *v60;
  uint64_t v61;
  void *v62;
  uint64_t v63;
  _QWORD v64[2];

  v64[1] = *MEMORY[0x24BDAC8D0];
  v5 = self->_path;
  openCount = self->_openCount;
  if (openCount)
  {
    v7 = 0;
    v8 = 0;
    v9 = 0;
    self->_openCount = openCount + 1;
LABEL_3:
    v10 = 1;
    goto LABEL_31;
  }
  -[NSString stringByDeletingLastPathComponent](self->_path, "stringByDeletingLastPathComponent");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v58 = 0;
  v12 = objc_msgSend(v11, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v8, 1, 0, &v58);
  v13 = v58;
  v14 = v13;
  if ((v12 & 1) != 0)
    goto LABEL_7;
  objc_msgSend(v13, "domain");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v15, "isEqualToString:", *MEMORY[0x24BDD0B88]))
  {

    goto LABEL_11;
  }
  v16 = objc_msgSend(v14, "code");

  if (v16 != 516)
  {
LABEL_11:
    v25 = objc_retainAutorelease(v14);
    v26 = 0;
    v19 = v25;
    goto LABEL_12;
  }
LABEL_7:
  v56 = a3;
  v57 = v14;
  v17 = v5;
  objc_msgSend(v11, "attributesOfItemAtPath:error:", v8, &v57);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v57;

  v20 = *MEMORY[0x24BDD0CF0];
  objc_msgSend(v18, "objectForKeyedSubscript:", *MEMORY[0x24BDD0CF0]);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = *MEMORY[0x24BDD0CE0];
  v23 = objc_msgSend(v21, "isEqualToString:", *MEMORY[0x24BDD0CE0]);

  if ((v23 & 1) == 0)
  {
    v63 = v20;
    v64[0] = v22;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v64, &v63, 1);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setAttributes:ofItemAtPath:error:", v24, v8, 0);

  }
  v25 = 0;
  v26 = 1;
  v5 = v17;
  a3 = v56;
LABEL_12:

  v9 = v25;
  if (!v26)
    goto LABEL_26;
  p_db = &self->_db;
  v28 = sqlite3_open_v2(-[NSString fileSystemRepresentation](v5, "fileSystemRepresentation"), &self->_db, 3145734, 0);
  if ((_DWORD)v28)
  {
    v29 = (void *)MEMORY[0x24BDD1540];
    v30 = *MEMORY[0x24BDD0B88];
    v61 = *MEMORY[0x24BDD0FC8];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Error opening db at %@, rc=%d(0x%x)"), self->_path, v28, v28);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v62 = v31;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v62, &v61, 1);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "errorWithDomain:code:userInfo:", v30, 0, v32);
    v33 = objc_claimAutoreleasedReturnValue();

    v9 = (id)v33;
    goto LABEL_26;
  }
  sqlite3_extended_result_codes(*p_db, 1);
  if (!sqlite3_busy_timeout(*p_db, 300000))
  {
    if (-[ACCSQLite executeSQL:](self, "executeSQL:", CFSTR("pragma journal_mode = WAL")))
    {
      -[ACCSQLite _synchronousModeString](self, "_synchronousModeString");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = -[ACCSQLite executeSQL:](self, "executeSQL:", CFSTR("pragma synchronous = %@"), v34);

      if (v35)
      {
        if (-[ACCSQLite executeSQL:](self, "executeSQL:", CFSTR("pragma auto_vacuum = FULL")))
        {
          -[ACCSQLite begin](self, "begin");
          -[ACCSQLite select:from:where:bindings:](self, "select:from:where:bindings:", &unk_24D726468, CFSTR("sqlite_master"), CFSTR("type = ? AND name = ?"), &unk_24D726480);
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          if (!objc_msgSend(v36, "count"))
            -[ACCSQLite executeSQL:](self, "executeSQL:", CFSTR("create table if not exists Properties (\n    key    text primary key,\n    value  text\n);\n"));
          -[ACCSQLite propertyForKey:](self, "propertyForKey:", CFSTR("SchemaVersion"));
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          v37 = -[ACCSQLite dbUserVersion](self, "dbUserVersion");
          if (v7)
          {
            v38 = v37;
            -[ACCSQLite schemaVersion](self, "schemaVersion");
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v7, "isEqualToString:", v39))
            {
              if (!-[ACCSQLite userVersion](self, "userVersion"))
              {
                v50 = 0;
                goto LABEL_40;
              }
              v40 = -[ACCSQLite userVersion](self, "userVersion");

              if ((_DWORD)v38 == v40)
              {
LABEL_37:
                v50 = 0;
LABEL_41:
                -[ACCSQLite end](self, "end");
                if (-[ACCSQLite shouldVacuum](self, "shouldVacuum"))
                  -[ACCSQLite _periodicVacuum](self, "_periodicVacuum");
                if ((v50 & 1) != 0 || self->_hasMigrated)
                {
                  -[ACCSQLite schemaVersion](self, "schemaVersion");
                  v55 = (void *)objc_claimAutoreleasedReturnValue();
                  -[ACCSQLite setProperty:forKey:](self, "setProperty:forKey:", v55, CFSTR("SchemaVersion"));

                  if (-[ACCSQLite userVersion](self, "userVersion"))
                    -[ACCSQLite executeSQL:](self, "executeSQL:", CFSTR("pragma user_version = %ld"), -[ACCSQLite userVersion](self, "userVersion"));
                }
                ++self->_openCount;

                goto LABEL_3;
              }
            }
            else
            {

            }
            -[ACCSQLite delegate](self, "delegate");
            v46 = objc_claimAutoreleasedReturnValue();
            if (v46)
            {
              v47 = (void *)v46;
              -[ACCSQLite delegate](self, "delegate");
              v48 = (void *)objc_claimAutoreleasedReturnValue();
              v49 = objc_msgSend(v48, "migrateDatabase:fromVersion:", self, v38);

              if (v49)
                self->_hasMigrated = 1;
            }
            if (self->_hasMigrated)
              goto LABEL_37;
            -[ACCSQLite removeAllStatements](self, "removeAllStatements");
            -[ACCSQLite dropAllTables](self, "dropAllTables");
            self->_hasMigrated = 1;
          }
          -[ACCSQLite executeSQL:](self, "executeSQL:", CFSTR("create table if not exists Properties (\n    key    text primary key,\n    value  text\n);\n"));
          -[ACCSQLite schema](self, "schema");
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          -[ACCSQLite executeSQL:](self, "executeSQL:", CFSTR("%@"), v51);

          v52 = (void *)MEMORY[0x24BDD17C8];
          objc_msgSend(MEMORY[0x24BDBCE60], "date");
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v53, "timeIntervalSinceReferenceDate");
          objc_msgSend(v52, "stringWithFormat:", CFSTR("%f"), v54);
          v39 = (void *)objc_claimAutoreleasedReturnValue();

          -[ACCSQLite setProperty:forKey:](self, "setProperty:forKey:", v39, CFSTR("Created"));
          v50 = 1;
LABEL_40:

          goto LABEL_41;
        }
      }
    }
  }
LABEL_26:
  sqlite3_close_v2(self->_db);
  self->_db = 0;
  if (a3)
  {
    if (!v9)
    {
      v41 = (void *)MEMORY[0x24BDD1540];
      v42 = *MEMORY[0x24BDD0B88];
      v59 = *MEMORY[0x24BDD0FC8];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Error opening db at %@, "), self->_path);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v60 = v43;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v60, &v59, 1);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "errorWithDomain:code:userInfo:", v42, 0, v44);
      v9 = (id)objc_claimAutoreleasedReturnValue();

    }
    v9 = objc_retainAutorelease(v9);
    v7 = 0;
    v10 = 0;
    *a3 = v9;
  }
  else
  {
    v7 = 0;
    v10 = 0;
  }
LABEL_31:

  return v10;
}

- (void)open
{
  BOOL v3;
  id v4;
  void *v5;
  id v6;
  uint8_t buf[4];
  void *v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v6 = 0;
  v3 = -[ACCSQLite openWithError:](self, "openWithError:", &v6);
  v4 = v6;
  if (!v3 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    -[ACCSQLite path](self, "path");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v8 = v5;
    v9 = 2112;
    v10 = v4;
    _os_log_impl(&dword_21722C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "[#ACCEventLogger] accsqlite: Error opening db at %@: %@", buf, 0x16u);

  }
}

- (void)close
{
  unint64_t openCount;
  uint8_t v4[16];

  openCount = self->_openCount;
  if (openCount)
  {
    if (openCount == 1)
    {
      -[ACCSQLite removeAllStatements](self, "removeAllStatements");
      if (sqlite3_close(self->_db))
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v4 = 0;
          _os_log_impl(&dword_21722C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "[#ACCEventLogger] accsqlite: Error closing database", v4, 2u);
        }
        return;
      }
      self->_db = 0;
      openCount = self->_openCount;
    }
    self->_openCount = openCount - 1;
  }
}

- (void)remove
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeItemAtPath:error:", self->_path, 0);

  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v4 = objc_msgSend(&unk_24D726450, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(&unk_24D726450);
        v8 = *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v7);
        objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSString stringByAppendingString:](self->_path, "stringByAppendingString:", v8);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "removeItemAtPath:error:", v10, 0);

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(&unk_24D726450, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v5);
  }
}

- (void)begin
{
  -[ACCSQLite executeSQL:](self, "executeSQL:", CFSTR("begin exclusive"));
}

- (void)end
{
  -[ACCSQLite executeSQL:](self, "executeSQL:", CFSTR("end"));
}

- (void)rollback
{
  -[ACCSQLite executeSQL:](self, "executeSQL:", CFSTR("rollback"));
}

- (void)analyze
{
  -[ACCSQLite executeSQL:](self, "executeSQL:", CFSTR("analyze"));
}

- (void)vacuum
{
  -[ACCSQLite executeSQL:](self, "executeSQL:", CFSTR("vacuum"));
}

- (int64_t)lastInsertRowID
{
  sqlite3 *db;
  uint8_t v4[16];

  db = self->_db;
  if (db)
    return sqlite3_last_insert_rowid(db);
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_21722C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "[#ACCEventLogger] accsqlite: Database is closed", v4, 2u);
  }
  return -1;
}

- (int)changes
{
  sqlite3 *db;
  uint8_t v4[16];

  db = self->_db;
  if (db)
    return sqlite3_changes(db);
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_21722C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "[#ACCEventLogger] accsqlite: Database is closed", v4, 2u);
  }
  return -1;
}

- (BOOL)executeSQL:(id)a3
{
  uint64_t v4;

  return -[ACCSQLite executeSQL:arguments:](self, "executeSQL:arguments:", a3, &v4);
}

- (BOOL)executeSQL:(id)a3 arguments:(char *)a4
{
  objc_class *v6;
  id v7;
  void *v8;
  sqlite3 *db;
  int v10;
  int v11;
  BOOL v12;
  NSObject *v13;
  const char *v14;
  uint32_t v15;
  int v17;
  void *v18;
  __int16 v19;
  int v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v6 = (objc_class *)MEMORY[0x24BDD17C8];
  v7 = a3;
  v8 = (void *)objc_msgSend([v6 alloc], "initWithFormat:arguments:", v7, a4);

  db = self->_db;
  if (db)
  {
    v10 = sqlite3_exec(db, (const char *)objc_msgSend(v8, "UTF8String"), 0, 0, 0);
    if (!v10)
    {
      v12 = 1;
      goto LABEL_9;
    }
    v11 = v10;
    v12 = 0;
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      v17 = 138412546;
      v18 = v8;
      v19 = 1024;
      v20 = v11;
      v13 = MEMORY[0x24BDACB70];
      v14 = "[#ACCEventLogger] accsqlite: Error executing SQL: \"%@\" (%d)";
      v15 = 18;
LABEL_7:
      _os_log_impl(&dword_21722C000, v13, OS_LOG_TYPE_DEFAULT, v14, (uint8_t *)&v17, v15);
      v12 = 0;
    }
  }
  else
  {
    v12 = 0;
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v17) = 0;
      v13 = MEMORY[0x24BDACB70];
      v14 = "[#ACCEventLogger] accsqlite: Database is closed";
      v15 = 2;
      goto LABEL_7;
    }
  }
LABEL_9:

  return v12;
}

- (id)statementForSQL:(id)a3
{
  id v4;
  ACCSQLiteStatement *v5;
  id v6;
  ACCSQLiteStatement *v8;
  sqlite3_stmt *ppStmt;
  uint8_t buf[4];
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (!self->_db)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21722C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "[#ACCEventLogger] accsqlite: Database is closed", buf, 2u);
    }
LABEL_9:
    v5 = 0;
    goto LABEL_10;
  }
  -[NSMutableDictionary objectForKeyedSubscript:](self->_statementsBySQL, "objectForKeyedSubscript:", v4);
  v5 = (ACCSQLiteStatement *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    ppStmt = 0;
    v6 = v4;
    if (!sqlite3_prepare_v2(self->_db, (const char *)objc_msgSend(v6, "UTF8String"), -1, &ppStmt, 0))
    {
      v8 = [ACCSQLiteStatement alloc];
      v5 = -[ACCSQLiteStatement initWithSQLite:SQL:handle:](v8, "initWithSQLite:SQL:handle:", self, v6, ppStmt);
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_statementsBySQL, "setObject:forKeyedSubscript:", v5, v6);

      goto LABEL_10;
    }
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v11 = v6;
      _os_log_impl(&dword_21722C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "[#ACCEventLogger] Error preparing statement: %@", buf, 0xCu);
    }

    goto LABEL_9;
  }
LABEL_10:

  return v5;
}

- (void)removeAllStatements
{
  void *v3;

  -[NSMutableDictionary allValues](self->_statementsBySQL, "allValues");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "makeObjectsPerformSelector:", sel_finalizeStatement);

  -[NSMutableDictionary removeAllObjects](self->_statementsBySQL, "removeAllObjects");
}

- (id)allTableNames
{
  id v3;
  void *v4;
  void *v5;

  v3 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  -[ACCSQLite statementForSQL:](self, "statementForSQL:", CFSTR("select name from sqlite_master where type = 'table'"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "step"))
  {
    do
    {
      objc_msgSend(v4, "textAtIndex:", 0);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "addObject:", v5);

    }
    while ((objc_msgSend(v4, "step") & 1) != 0);
  }
  objc_msgSend(v4, "reset");

  return v3;
}

- (void)dropAllTables
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  -[ACCSQLite allTableNames](self, "allTableNames");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        -[ACCSQLite executeSQL:](self, "executeSQL:", CFSTR("drop table %@"), *(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * v7++));
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

}

- (id)propertyForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[ACCSQLite statementForSQL:](self, "statementForSQL:", CFSTR("select value from Properties where key = ?"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bindText:atIndex:", v4, 0);

  v6 = 0;
  if (objc_msgSend(v5, "step"))
  {
    objc_msgSend(v5, "textAtIndex:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v5, "reset");

  return v6;
}

- (void)setProperty:(id)a3 forKey:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v8 = a3;
  v6 = a4;
  if (v8)
  {
    -[ACCSQLite statementForSQL:](self, "statementForSQL:", CFSTR("insert or replace into Properties (key, value) values (?,?)"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "bindText:atIndex:", v6, 0);

    objc_msgSend(v7, "bindText:atIndex:", v8, 1);
    objc_msgSend(v7, "step");
    objc_msgSend(v7, "reset");
    v6 = v7;
  }
  else
  {
    -[ACCSQLite removePropertyForKey:](self, "removePropertyForKey:", v6);
  }

}

- (NSDateFormatter)dateFormatter
{
  NSDateFormatter *dateFormatter;
  NSDateFormatter *v4;
  NSDateFormatter *v5;

  dateFormatter = self->_dateFormatter;
  if (!dateFormatter)
  {
    v4 = (NSDateFormatter *)objc_opt_new();
    -[NSDateFormatter setDateFormat:](v4, "setDateFormat:", CFSTR("yyyy-MM-dd'T'HH:mm:ssZZZZZ"));
    v5 = self->_dateFormatter;
    self->_dateFormatter = v4;

    dateFormatter = self->_dateFormatter;
  }
  return dateFormatter;
}

- (id)datePropertyForKey:(id)a3
{
  void *v4;
  void *v5;
  void *v6;

  -[ACCSQLite propertyForKey:](self, "propertyForKey:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "length"))
  {
    -[ACCSQLite dateFormatter](self, "dateFormatter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "dateFromString:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)setDateProperty:(id)a3 forKey:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v8 = a4;
  if (a3)
  {
    v6 = a3;
    -[ACCSQLite dateFormatter](self, "dateFormatter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringFromDate:", v6);
    a3 = (id)objc_claimAutoreleasedReturnValue();

  }
  -[ACCSQLite setProperty:forKey:](self, "setProperty:forKey:", a3, v8);

}

- (void)removePropertyForKey:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[ACCSQLite statementForSQL:](self, "statementForSQL:", CFSTR("delete from Properties where key = ?"));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bindText:atIndex:", v4, 0);

  objc_msgSend(v5, "step");
  objc_msgSend(v5, "reset");

}

- (id)creationDate
{
  void *v2;
  void *v3;
  float v4;
  void *v5;

  v2 = (void *)MEMORY[0x24BDBCE60];
  -[ACCSQLite propertyForKey:](self, "propertyForKey:", CFSTR("Created"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "floatValue");
  objc_msgSend(v2, "dateWithTimeIntervalSinceReferenceDate:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)columnNamesForTable:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("pragma table_info(%@)"), a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACCSQLite statementForSQL:](self, "statementForSQL:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
  if (objc_msgSend(v5, "step"))
  {
    do
    {
      objc_msgSend(v5, "textAtIndex:", 1);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "addObject:", v7);

    }
    while ((objc_msgSend(v5, "step") & 1) != 0);
  }
  objc_msgSend(v5, "reset");

  return v6;
}

- (id)select:(id)a3 from:(id)a4
{
  return -[ACCSQLite select:from:where:bindings:](self, "select:from:where:bindings:", a3, a4, 0, 0);
}

- (id)select:(id)a3 from:(id)a4 where:(id)a5 bindings:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v15 = (void *)MEMORY[0x24BDD16A8];
  objc_msgSend(v10, "componentsJoinedByString:", CFSTR(", "));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "stringWithFormat:", CFSTR("select %@ from %@"), v16, v11);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
    objc_msgSend(v17, "appendFormat:", CFSTR(" where %@"), v12);
  -[ACCSQLite statementForSQL:](self, "statementForSQL:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "bindValues:", v13);
  if (objc_msgSend(v18, "step"))
  {
    do
    {
      objc_msgSend(v18, "allObjectsByColumnName");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "addObject:", v19);

    }
    while ((objc_msgSend(v18, "step") & 1) != 0);
  }
  objc_msgSend(v18, "reset");

  return v14;
}

- (void)select:(id)a3 from:(id)a4 where:(id)a5 bindings:(id)a6 orderBy:(id)a7 limit:(id)a8 block:(id)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  void (**v19)(id, void *, _BYTE *);
  uint64_t v20;
  id v21;
  __CFString *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *context;
  id v28;
  id v29;
  char v30;

  v15 = a3;
  v29 = a4;
  v16 = a5;
  v28 = a6;
  v17 = a7;
  v18 = a8;
  v19 = (void (**)(id, void *, _BYTE *))a9;
  v20 = MEMORY[0x219A08EFC]();
  v21 = objc_alloc_init(MEMORY[0x24BDD16A8]);
  context = (void *)v20;
  if (objc_msgSend(v15, "count"))
  {
    objc_msgSend(v15, "componentsJoinedByString:", CFSTR(", "));
    v22 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v22 = CFSTR("*");
  }
  objc_msgSend(v21, "appendFormat:", CFSTR("select %@ from %@"), v22, v29);
  if (objc_msgSend(v16, "length"))
    objc_msgSend(v21, "appendFormat:", CFSTR(" where %@"), v16);
  if (v17)
  {
    objc_msgSend(v17, "componentsJoinedByString:", CFSTR(", "));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "appendFormat:", CFSTR(" order by %@"), v23);

  }
  if (v18)
    objc_msgSend(v21, "appendFormat:", CFSTR(" limit %ld"), objc_msgSend(v18, "integerValue"));
  -[ACCSQLite statementForSQL:](self, "statementForSQL:", v21);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = (void *)MEMORY[0x219A08EFC](objc_msgSend(v24, "bindValues:", v28));
  if (objc_msgSend(v24, "step"))
  {
    while (1)
    {
      objc_msgSend(v24, "allObjectsByColumnName");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      if (v19)
      {
        v30 = 0;
        v19[2](v19, v26, &v30);
        if (v30)
          break;
      }

      objc_autoreleasePoolPop(v25);
      v25 = (void *)MEMORY[0x219A08EFC]();
      if ((objc_msgSend(v24, "step") & 1) == 0)
        goto LABEL_16;
    }

  }
LABEL_16:
  objc_autoreleasePoolPop(v25);
  objc_msgSend(v24, "reset");

  objc_autoreleasePoolPop(context);
}

- (void)selectFrom:(id)a3 where:(id)a4 bindings:(id)a5 orderBy:(id)a6 limit:(id)a7 block:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void (**v19)(id, void *, _BYTE *);
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *context;
  char v26;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = (void (**)(id, void *, _BYTE *))a8;
  context = (void *)MEMORY[0x219A08EFC]();
  v20 = objc_alloc_init(MEMORY[0x24BDD16A8]);
  objc_msgSend(v20, "appendFormat:", CFSTR("select * from %@"), v14);
  if (objc_msgSend(v15, "length"))
    objc_msgSend(v20, "appendFormat:", CFSTR(" where %@"), v15);
  if (v17)
  {
    objc_msgSend(v17, "componentsJoinedByString:", CFSTR(", "));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "appendFormat:", CFSTR(" order by %@"), v21);

  }
  if (v18)
    objc_msgSend(v20, "appendFormat:", CFSTR(" limit %ld"), objc_msgSend(v18, "integerValue"));
  -[ACCSQLite statementForSQL:](self, "statementForSQL:", v20);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = (void *)MEMORY[0x219A08EFC](objc_msgSend(v22, "bindValues:", v16));
  if (objc_msgSend(v22, "step"))
  {
    while (1)
    {
      objc_msgSend(v22, "allObjectsByColumnName");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      if (v19)
      {
        v26 = 0;
        v19[2](v19, v24, &v26);
        if (v26)
          break;
      }

      objc_autoreleasePoolPop(v23);
      v23 = (void *)MEMORY[0x219A08EFC]();
      if ((objc_msgSend(v22, "step") & 1) == 0)
        goto LABEL_13;
    }

  }
LABEL_13:
  objc_autoreleasePoolPop(v23);
  objc_msgSend(v22, "reset");

  objc_autoreleasePoolPop(context);
}

- (id)selectFrom:(id)a3 where:(id)a4 bindings:(id)a5 limit:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = objc_alloc_init(MEMORY[0x24BDD16A8]);
  objc_msgSend(v14, "appendFormat:", CFSTR("select * from %@"), v10);
  if (objc_msgSend(v11, "length"))
    objc_msgSend(v14, "appendFormat:", CFSTR(" where %@"), v11);
  if (v13)
    objc_msgSend(v14, "appendFormat:", CFSTR(" limit %ld"), objc_msgSend(v13, "integerValue"));
  v15 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  -[ACCSQLite statementForSQL:](self, "statementForSQL:", v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "bindValues:", v12);
  if (objc_msgSend(v16, "step"))
  {
    do
    {
      objc_msgSend(v16, "allObjectsByColumnName");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "addObject:", v17);

    }
    while ((objc_msgSend(v16, "step") & 1) != 0);
  }
  objc_msgSend(v16, "reset");

  return v15;
}

- (void)update:(id)a3 set:(id)a4 where:(id)a5 bindings:(id)a6 limit:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  id v18;

  v18 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  v16 = objc_alloc_init(MEMORY[0x24BDD16A8]);
  objc_msgSend(v16, "appendFormat:", CFSTR("update %@"), v18);
  objc_msgSend(v16, "appendFormat:", CFSTR(" set %@"), v12);
  if (objc_msgSend(v13, "length"))
    objc_msgSend(v16, "appendFormat:", CFSTR(" where %@"), v13);
  if (v15)
    objc_msgSend(v16, "appendFormat:", CFSTR(" limit %ld"), objc_msgSend(v15, "integerValue"));
  -[ACCSQLite statementForSQL:](self, "statementForSQL:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "bindValues:", v14);
  while ((objc_msgSend(v17, "step") & 1) != 0)
    ;
  objc_msgSend(v17, "reset");

}

- (id)selectAllFrom:(id)a3 where:(id)a4 bindings:(id)a5
{
  return -[ACCSQLite selectFrom:where:bindings:limit:](self, "selectFrom:where:bindings:limit:", a3, a4, a5, 0);
}

- (unint64_t)selectCountFrom:(id)a3 where:(id)a4 bindings:(id)a5
{
  void *v5;
  void *v6;
  void *v7;
  unint64_t v8;

  -[ACCSQLite select:from:where:bindings:](self, "select:from:where:bindings:", &unk_24D726498, a3, a4, a5);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("n"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "unsignedIntegerValue");

  return v8;
}

- (int64_t)insertOrReplaceInto:(id)a3 values:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  unint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  unint64_t v15;
  void *v16;
  unint64_t v17;
  const __CFString *v18;
  void *v19;
  int64_t v20;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "allKeys");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "sortedArrayUsingSelector:", sel_compare_);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  if (objc_msgSend(v9, "count"))
  {
    v11 = 0;
    do
    {
      objc_msgSend(v9, "objectAtIndexedSubscript:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectForKeyedSubscript:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setObject:atIndexedSubscript:", v13, v11);

      ++v11;
    }
    while (v11 < objc_msgSend(v9, "count"));
  }
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16A8]), "initWithString:", CFSTR("insert or replace into "));
  objc_msgSend(v14, "appendString:", v6);
  objc_msgSend(v14, "appendString:", CFSTR(" ("));
  if (objc_msgSend(v9, "count"))
  {
    v15 = 0;
    do
    {
      objc_msgSend(v9, "objectAtIndexedSubscript:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "appendString:", v16);

      if (v15 != objc_msgSend(v9, "count") - 1)
        objc_msgSend(v14, "appendString:", CFSTR(","));
      ++v15;
    }
    while (v15 < objc_msgSend(v9, "count"));
  }
  objc_msgSend(v14, "appendString:", CFSTR(") values ("));
  if (objc_msgSend(v9, "count"))
  {
    v17 = 0;
    do
    {
      if (v17 == objc_msgSend(v9, "count") - 1)
        v18 = CFSTR("?");
      else
        v18 = CFSTR("?,");
      objc_msgSend(v14, "appendString:", v18);
      ++v17;
    }
    while (v17 < objc_msgSend(v9, "count"));
  }
  objc_msgSend(v14, "appendString:", CFSTR(")"));
  -[ACCSQLite statementForSQL:](self, "statementForSQL:", v14);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "bindValues:", v10);
  objc_msgSend(v19, "step");
  objc_msgSend(v19, "reset");
  v20 = -[ACCSQLite lastInsertRowID](self, "lastInsertRowID");

  return v20;
}

- (void)deleteFrom:(id)a3 matchingValues:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  unint64_t v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  const __CFString *v17;
  ACCSQLite *v18;
  id v19;

  v18 = self;
  v19 = a3;
  v5 = a4;
  objc_msgSend(v5, "allKeys");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sortedArrayUsingSelector:", sel_compare_);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v9 = objc_alloc_init(MEMORY[0x24BDD16A8]);
  if (objc_msgSend(v7, "count"))
  {
    v10 = 0;
    v11 = 0;
    do
    {
      objc_msgSend(v7, "objectAtIndexedSubscript:", v10, v18);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "objectForKeyedSubscript:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v7, "objectAtIndexedSubscript:", v10);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "appendString:", v14);

      if (v13
        && (objc_msgSend(MEMORY[0x24BDBCEF8], "null"),
            v15 = (void *)objc_claimAutoreleasedReturnValue(),
            v16 = objc_msgSend(v15, "isEqual:", v13),
            v15,
            (v16 & 1) == 0))
      {
        objc_msgSend(v8, "setObject:atIndexedSubscript:", v13, v11);
        v17 = CFSTR("=?");
        ++v11;
      }
      else
      {
        v17 = CFSTR(" is NULL");
      }
      objc_msgSend(v9, "appendString:", v17);
      if (v10 != objc_msgSend(v7, "count") - 1)
        objc_msgSend(v9, "appendString:", CFSTR(" AND "));

      ++v10;
    }
    while (v10 < objc_msgSend(v7, "count"));
  }
  -[ACCSQLite deleteFrom:where:bindings:](v18, "deleteFrom:where:bindings:", v19, v9, v8, v18);

}

- (void)deleteFrom:(id)a3 where:(id)a4 bindings:(id)a5
{
  void *v8;
  id v9;
  void *v10;
  id v11;

  v8 = (void *)MEMORY[0x24BDD17C8];
  v9 = a5;
  objc_msgSend(v8, "stringWithFormat:", CFSTR("delete from %@ where %@"), a3, a4);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  -[ACCSQLite statementForSQL:](self, "statementForSQL:", v11);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "bindValues:", v9);

  objc_msgSend(v10, "step");
  objc_msgSend(v10, "reset");

}

- (id)_tableNameForClass:(Class)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint8_t buf[4];
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  -[objc_class ACCSQLiteClassName](a3, "ACCSQLiteClassName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "hasPrefix:", self->_objectClassPrefix) & 1) != 0)
  {
    objc_msgSend(v4, "substringFromIndex:", -[NSString length](self->_objectClassPrefix, "length"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Object class \"%@\" does not have prefix \"%@\"), v4, self->_objectClassPrefix);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v9 = v6;
      _os_log_impl(&dword_21722C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "[#ACCEventLogger] accsqlite: %@", buf, 0xCu);

    }
    v5 = 0;
  }

  return v5;
}

- (int)dbUserVersion
{
  void *v2;
  int v3;

  -[ACCSQLite statementForSQL:](self, "statementForSQL:", CFSTR("pragma user_version"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "step"))
  {
    do
      v3 = objc_msgSend(v2, "intAtIndex:", 0);
    while ((objc_msgSend(v2, "step") & 1) != 0);
  }
  else
  {
    v3 = 0;
  }
  objc_msgSend(v2, "reset");

  return v3;
}

- (ACCSQLiteDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  objc_storeStrong((id *)&self->_delegate, a3);
}

- (NSString)path
{
  return self->_path;
}

- (NSString)schema
{
  return self->_schema;
}

- (NSString)schemaVersion
{
  return self->_schemaVersion;
}

- (NSString)objectClassPrefix
{
  return self->_objectClassPrefix;
}

- (void)setObjectClassPrefix:(id)a3
{
  objc_storeStrong((id *)&self->_objectClassPrefix, a3);
}

- (void)setUserVersion:(int)a3
{
  self->_userVersion = a3;
}

- (int64_t)synchronousMode
{
  return self->_synchronousMode;
}

- (void)setSynchronousMode:(int64_t)a3
{
  self->_synchronousMode = a3;
}

- (BOOL)hasMigrated
{
  return self->_hasMigrated;
}

- (BOOL)shouldVacuum
{
  return self->_shouldVacuum;
}

- (void)setShouldVacuum:(BOOL)a3
{
  self->_shouldVacuum = a3;
}

- (BOOL)traced
{
  return self->_traced;
}

- (void)setTraced:(BOOL)a3
{
  self->_traced = a3;
}

- (sqlite3)db
{
  return self->_db;
}

- (void)setDb:(sqlite3 *)a3
{
  self->_db = a3;
}

- (unint64_t)openCount
{
  return self->_openCount;
}

- (void)setOpenCount:(unint64_t)a3
{
  self->_openCount = a3;
}

- (BOOL)corrupt
{
  return self->_corrupt;
}

- (void)setCorrupt:(BOOL)a3
{
  self->_corrupt = a3;
}

- (NSMutableDictionary)statementsBySQL
{
  return self->_statementsBySQL;
}

- (void)setDateFormatter:(id)a3
{
  objc_storeStrong((id *)&self->_dateFormatter, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateFormatter, 0);
  objc_storeStrong((id *)&self->_objectClassPrefix, 0);
  objc_storeStrong((id *)&self->_statementsBySQL, 0);
  objc_storeStrong((id *)&self->_schemaVersion, 0);
  objc_storeStrong((id *)&self->_schema, 0);
  objc_storeStrong((id *)&self->_path, 0);
  objc_storeStrong((id *)&self->_delegate, 0);
}

- (void)_synchronousModeString
{
  __assert_rtn("-[ACCSQLite _synchronousModeString]", "ACCSQLite.m", 279, "0 && \"Unknown synchronous mode\");
}

@end
