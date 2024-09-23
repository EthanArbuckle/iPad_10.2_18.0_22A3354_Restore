@implementation SFSQLite

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

  v10 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
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
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithString:", CFSTR("insert or replace into "));
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
  -[SFSQLite statementForSQL:](self, "statementForSQL:", v14);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "bindValues:", v10);
  objc_msgSend(v19, "step");
  objc_msgSend(v19, "reset");
  v20 = -[SFSQLite lastInsertRowID](self, "lastInsertRowID");

  return v20;
}

- (int64_t)lastInsertRowID
{
  sqlite3 *db;
  NSObject *v4;
  uint8_t v5[16];

  db = self->_db;
  if (db)
    return sqlite3_last_insert_rowid(db);
  secLogObjForScope("SecError");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_18A900000, v4, OS_LOG_TYPE_DEFAULT, "sfsqlite: Database is closed", v5, 2u);
  }

  return -1;
}

- (BOOL)executeSQL:(id)a3
{
  id v4;
  void *v5;
  sqlite3 *db;
  id v7;
  int v8;
  int v9;
  NSObject *v11;
  NSObject *v12;
  BOOL v13;
  int v15;
  id v16;
  __int16 v17;
  int v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  db = self->_db;
  if (db)
  {
    v7 = objc_retainAutorelease(v4);
    v8 = sqlite3_exec(db, (const char *)objc_msgSend(v7, "UTF8String"), 0, 0, 0);
    if (!v8)
    {
      v13 = 1;
      goto LABEL_14;
    }
    v9 = v8;
    if (v8 != 8 && v8 != 23)
    {
      secLogObjForScope("SecError");
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        v15 = 138412546;
        v16 = v7;
        v17 = 1024;
        v18 = v9;
        _os_log_impl(&dword_18A900000, v11, OS_LOG_TYPE_DEFAULT, "sfsqlite: Error executing SQL: \"%@\" (%d)", (uint8_t *)&v15, 0x12u);
      }

    }
  }
  else
  {
    secLogObjForScope("SecError");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v15) = 0;
      _os_log_impl(&dword_18A900000, v12, OS_LOG_TYPE_DEFAULT, "sfsqlite: Database is closed", (uint8_t *)&v15, 2u);
    }

  }
  v13 = 0;
LABEL_14:

  return v13;
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
  v14 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v15 = (void *)MEMORY[0x1E0CB37A0];
  objc_msgSend(v10, "componentsJoinedByString:", CFSTR(", "));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "stringWithFormat:", CFSTR("select %@ from %@"), v16, v11);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
    objc_msgSend(v17, "appendFormat:", CFSTR(" where %@"), v12);
  -[SFSQLite statementForSQL:](self, "statementForSQL:", v17);
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

- (id)statementForSQL:(id)a3
{
  id v5;
  SFSQLiteStatement *v6;
  SFSQLiteStatement *v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  SFSQLiteStatement *v12;
  sqlite3_stmt *ppStmt;
  uint8_t buf[4];
  NSObject *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!self->_db)
  {
    secLogObjForScope("SecError");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18A900000, v9, OS_LOG_TYPE_DEFAULT, "sfsqlite: Database is closed", buf, 2u);
    }
LABEL_11:

    v7 = 0;
    goto LABEL_12;
  }
  -[NSMutableDictionary objectForKeyedSubscript:](self->_statementsBySQL, "objectForKeyedSubscript:", v5);
  v6 = (SFSQLiteStatement *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    ppStmt = 0;
    v9 = v5;
    if (!sqlite3_prepare_v2(self->_db, (const char *)-[NSObject UTF8String](v9, "UTF8String"), -1, &ppStmt, 0))
    {
      v12 = [SFSQLiteStatement alloc];
      v7 = -[SFSQLiteStatement initWithSQLite:SQL:handle:](v12, "initWithSQLite:SQL:handle:", self, v9, ppStmt);
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_statementsBySQL, "setObject:forKeyedSubscript:", v7, v9);

      goto LABEL_12;
    }
    secLogObjForScope("SecError");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v15 = v9;
      _os_log_impl(&dword_18A900000, v10, OS_LOG_TYPE_DEFAULT, "Error preparing statement: %@", buf, 0xCu);
    }

    goto LABEL_11;
  }
  v7 = v6;
  if (!-[SFSQLiteStatement isReset](v6, "isReset"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SFSQLite.m"), 550, CFSTR("Statement not reset after last use: \"%@\"), v5);

  }
LABEL_12:

  return v7;
}

- (void)end
{
  -[SFSQLite executeSQL:](self, "executeSQL:", CFSTR("end"));
}

- (BOOL)isOpen
{
  return self->_db != 0;
}

- (void)begin
{
  -[SFSQLite executeSQL:](self, "executeSQL:", CFSTR("begin exclusive"));
}

- (SFSQLite)initWithPath:(id)a3 schema:(id)a4
{
  id v7;
  id v8;
  SFSQLite *v9;
  SFSQLite *v10;
  uint64_t v11;
  NSString *schemaVersion;
  NSMutableDictionary *v13;
  NSMutableDictionary *statementsBySQL;
  NSString *objectClassPrefix;
  SFSQLite *v16;
  NSObject *v17;
  const char *v18;
  objc_super v20;
  uint8_t buf[16];

  v7 = a3;
  v8 = a4;
  if (!objc_msgSend(v7, "length"))
  {
    secLogObjForScope("SecCritical");
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v18 = "Cannot init db with empty path";
LABEL_10:
      _os_log_impl(&dword_18A900000, v17, OS_LOG_TYPE_DEFAULT, v18, buf, 2u);
    }
LABEL_11:

    v16 = 0;
    goto LABEL_12;
  }
  if (!objc_msgSend(v8, "length"))
  {
    secLogObjForScope("SecCritical");
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v18 = "Cannot init db without schema";
      goto LABEL_10;
    }
    goto LABEL_11;
  }
  v20.receiver = self;
  v20.super_class = (Class)SFSQLite;
  v9 = -[SFSQLite init](&v20, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_path, a3);
    objc_storeStrong((id *)&v10->_schema, a4);
    -[SFSQLite _createSchemaHash](v10, "_createSchemaHash");
    v11 = objc_claimAutoreleasedReturnValue();
    schemaVersion = v10->_schemaVersion;
    v10->_schemaVersion = (NSString *)v11;

    v13 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    statementsBySQL = v10->_statementsBySQL;
    v10->_statementsBySQL = v13;

    objectClassPrefix = v10->_objectClassPrefix;
    v10->_objectClassPrefix = (NSString *)CFSTR("CK");

    v10->_synchronousMode = 1;
    v10->_hasMigrated = 0;
  }
  self = v10;
  v16 = self;
LABEL_12:

  return v16;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  v3 = (void *)MEMORY[0x18D770A24](self, a2);
  -[SFSQLite close](self, "close");
  objc_autoreleasePoolPop(v3);
  v4.receiver = self;
  v4.super_class = (Class)SFSQLite;
  -[SFSQLite dealloc](&v4, sel_dealloc);
}

- (int)userVersion
{
  void *v3;
  void *v4;
  int v5;

  -[SFSQLite delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return self->_userVersion;
  -[SFSQLite delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "userVersion");

  return v5;
}

- (id)_synchronousModeString
{
  unint64_t v2;

  v2 = -[SFSQLite synchronousMode](self, "synchronousMode");
  if (v2 < 3)
    return off_1E1FCB780[v2];
  __security_simulatecrash(CFSTR("Execution has encountered an unexpected state"), 0x53C0000Eu);
  return CFSTR("normal");
}

- (id)_createSchemaHash
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _OWORD v8[2];
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  memset(v8, 0, sizeof(v8));
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:", v8, 32, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFSQLite schema](self, "schema");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dataUsingEncoding:", 4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  CC_SHA256((const void *)objc_msgSend(v5, "bytes"), objc_msgSend(v5, "length"), (unsigned __int8 *)v8);
  objc_msgSend(v3, "CKUppercaseHexStringWithoutSpaces");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)attemptProperDatabasePermissions
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = *MEMORY[0x1E0CB2AA8];
  v4 = v17;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithShort:", 438);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, &v17, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAttributes:ofItemAtPath:error:", v6, self->_path, 0);

  v15 = v4;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithShort:", 438);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v16, &v15, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-wal"), self->_path);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAttributes:ofItemAtPath:error:", v8, v9, 0);

  v13 = v4;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithShort:", 438);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v14, &v13, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-shm"), self->_path);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAttributes:ofItemAtPath:error:", v11, v12, 0);

}

- (BOOL)openWithError:(id *)a3
{
  NSString *v6;
  unint64_t openCount;
  void *v8;
  id v9;
  id v10;
  BOOL v11;
  void *v12;
  char v13;
  id v14;
  void *v15;
  void *v16;
  uint64_t v17;
  NSString *v18;
  id v19;
  void *v20;
  id v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  char v25;
  void *v26;
  id v27;
  int v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  id v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  _BOOL4 v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  int v47;
  void *v48;
  uint64_t v49;
  void *v50;
  void *v51;
  uint64_t v53;
  void *v54;
  void *v55;
  int v56;
  void *v57;
  void *v58;
  void *v59;
  uint64_t v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  id *v65;
  id v66;
  id v67;
  uint64_t v68;
  void *v69;
  uint64_t v70;
  void *v71;
  uint64_t v72;
  _QWORD v73[2];

  v73[1] = *MEMORY[0x1E0C80C00];
  v6 = self->_path;
  openCount = self->_openCount;
  if (openCount)
  {
    if (!self->_db)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v64, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SFSQLite.m"), 324, CFSTR("Missing handle for open cache db"));

      openCount = self->_openCount;
    }
    v8 = 0;
    v9 = 0;
    v10 = 0;
    self->_openCount = openCount + 1;
    v11 = 1;
    goto LABEL_34;
  }
  -[NSString stringByDeletingLastPathComponent](self->_path, "stringByDeletingLastPathComponent");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v67 = 0;
  v13 = objc_msgSend(v12, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v9, 1, 0, &v67);
  v14 = v67;
  v15 = v14;
  if ((v13 & 1) != 0)
    goto LABEL_8;
  objc_msgSend(v14, "domain");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v16, "isEqualToString:", *MEMORY[0x1E0CB28A8]))
  {

    goto LABEL_12;
  }
  v17 = objc_msgSend(v15, "code");

  if (v17 != 516)
  {
LABEL_12:
    v27 = objc_retainAutorelease(v15);
    v28 = 0;
    v21 = v27;
    goto LABEL_13;
  }
LABEL_8:
  v65 = a3;
  v66 = v15;
  v18 = v6;
  v19 = v9;
  objc_msgSend(v12, "attributesOfItemAtPath:error:", v9, &v66);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v66;

  v22 = *MEMORY[0x1E0CB2AD8];
  objc_msgSend(v20, "objectForKeyedSubscript:", *MEMORY[0x1E0CB2AD8]);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = *MEMORY[0x1E0CB2AC0];
  v25 = objc_msgSend(v23, "isEqualToString:", *MEMORY[0x1E0CB2AC0]);

  if ((v25 & 1) == 0)
  {
    v72 = v22;
    v73[0] = v24;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v73, &v72, 1);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setAttributes:ofItemAtPath:error:", v26, v19, 0);

  }
  v27 = 0;
  v28 = 1;
  v6 = v18;
  a3 = v65;
  v9 = v19;
LABEL_13:

  v10 = v27;
  if (!v28)
    goto LABEL_29;
  v29 = sqlite3_open_v2(-[NSString fileSystemRepresentation](v6, "fileSystemRepresentation"), &self->_db, 3145734, 0);
  if ((_DWORD)v29)
  {
    v30 = v29;
    v31 = sqlite3_system_errno(self->_db);
    v32 = (void *)MEMORY[0x1E0CB35C8];
    v33 = *MEMORY[0x1E0CB28A8];
    v34 = (int)v30;
    v70 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Error opening db at %@, rc=%d(0x%x), errno=%d(0x%x)"), self->_path, v30, v30, v31, v31);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v71 = v35;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v71, &v70, 1);
    v36 = v9;
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "errorWithDomain:code:userInfo:", v33, v34, v37);
    v38 = objc_claimAutoreleasedReturnValue();

    v9 = v36;
    v10 = (id)v38;
    goto LABEL_29;
  }
  -[SFSQLite attemptProperDatabasePermissions](self, "attemptProperDatabasePermissions");
  sqlite3_extended_result_codes(self->_db, 1);
  if (!sqlite3_busy_timeout(self->_db, 300000))
  {
    if (-[SFSQLite executeSQL:](self, "executeSQL:", CFSTR("pragma journal_mode = WAL")))
    {
      v39 = (void *)MEMORY[0x1E0CB3940];
      -[SFSQLite _synchronousModeString](self, "_synchronousModeString");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "stringWithFormat:", CFSTR("pragma synchronous = %@"), v40);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = -[SFSQLite executeSQL:](self, "executeSQL:", v41);

      if (v42
        && (-[SFSQLite autoVacuumSetting](self, "autoVacuumSetting") == 1
         || -[SFSQLite executeSQL:](self, "executeSQL:", CFSTR("pragma auto_vacuum = FULL"))
         && -[SFSQLite executeSQL:](self, "executeSQL:", CFSTR("VACUUM"))))
      {
        -[SFSQLite begin](self, "begin");
        -[SFSQLite select:from:where:bindings:](self, "select:from:where:bindings:", &unk_1E1FFEDD0, CFSTR("sqlite_master"), CFSTR("type = ? AND name = ?"), &unk_1E1FFEDE8);
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v43, "count"))
          -[SFSQLite executeSQL:](self, "executeSQL:", CFSTR("create table if not exists Properties (\n    key    text primary key,\n    value  text\n);\n"));
        -[SFSQLite propertyForKey:](self, "propertyForKey:", CFSTR("SchemaVersion"));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v44 = -[SFSQLite dbUserVersion](self, "dbUserVersion");
        if (v8)
        {
          v45 = v44;
          -[SFSQLite schemaVersion](self, "schemaVersion");
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v8, "isEqualToString:", v46))
          {
            if (!-[SFSQLite userVersion](self, "userVersion"))
            {

              goto LABEL_43;
            }
            v47 = -[SFSQLite userVersion](self, "userVersion");

            if ((_DWORD)v45 == v47)
            {
LABEL_43:
              -[SFSQLite end](self, "end");
              if (!self->_hasMigrated)
              {
LABEL_46:
                ++self->_openCount;

                v11 = 1;
                goto LABEL_34;
              }
LABEL_44:
              -[SFSQLite schemaVersion](self, "schemaVersion");
              v62 = (void *)objc_claimAutoreleasedReturnValue();
              -[SFSQLite setProperty:forKey:](self, "setProperty:forKey:", v62, CFSTR("SchemaVersion"));

              if (-[SFSQLite userVersion](self, "userVersion"))
              {
                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("pragma user_version = %ld"), -[SFSQLite userVersion](self, "userVersion"));
                v63 = (void *)objc_claimAutoreleasedReturnValue();
                -[SFSQLite executeSQL:](self, "executeSQL:", v63);

              }
              goto LABEL_46;
            }
          }
          else
          {

          }
          -[SFSQLite delegate](self, "delegate");
          v53 = objc_claimAutoreleasedReturnValue();
          if (v53)
          {
            v54 = (void *)v53;
            -[SFSQLite delegate](self, "delegate");
            v55 = (void *)objc_claimAutoreleasedReturnValue();
            v56 = objc_msgSend(v55, "migrateDatabase:fromVersion:", self, v45);

            if (v56)
              self->_hasMigrated = 1;
          }
          if (self->_hasMigrated)
            goto LABEL_43;
          -[SFSQLite removeAllStatements](self, "removeAllStatements");
          -[SFSQLite dropAllTables](self, "dropAllTables");
          self->_hasMigrated = 1;
        }
        -[SFSQLite executeSQL:](self, "executeSQL:", CFSTR("create table if not exists Properties (\n    key    text primary key,\n    value  text\n);\n"));
        -[SFSQLite schema](self, "schema");
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        -[SFSQLite executeSQL:](self, "executeSQL:", v57);

        v58 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v59, "timeIntervalSinceReferenceDate");
        objc_msgSend(v58, "stringWithFormat:", CFSTR("%f"), v60);
        v61 = (void *)objc_claimAutoreleasedReturnValue();

        -[SFSQLite setProperty:forKey:](self, "setProperty:forKey:", v61, CFSTR("Created"));
        -[SFSQLite end](self, "end");
        goto LABEL_44;
      }
    }
  }
LABEL_29:
  sqlite3_close_v2(self->_db);
  self->_db = 0;
  if (a3)
  {
    if (!v10)
    {
      v48 = (void *)MEMORY[0x1E0CB35C8];
      v49 = *MEMORY[0x1E0CB28A8];
      v68 = *MEMORY[0x1E0CB2D50];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Error opening db at %@"), self->_path);
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      v69 = v50;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v69, &v68, 1);
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "errorWithDomain:code:userInfo:", v49, 0, v51);
      v10 = (id)objc_claimAutoreleasedReturnValue();

    }
    v10 = objc_retainAutorelease(v10);
    v8 = 0;
    v11 = 0;
    *a3 = v10;
  }
  else
  {
    v8 = 0;
    v11 = 0;
  }
LABEL_34:

  return v11;
}

- (void)open
{
  BOOL v3;
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  id v8;
  uint8_t buf[4];
  void *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0;
  v3 = -[SFSQLite openWithError:](self, "openWithError:", &v8);
  v4 = v8;
  v5 = v4;
  if (!v3 && (!v4 || objc_msgSend(v4, "code") != 23))
  {
    secLogObjForScope("SecError");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      -[SFSQLite path](self, "path");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v10 = v7;
      v11 = 2112;
      v12 = v5;
      _os_log_impl(&dword_18A900000, v6, OS_LOG_TYPE_DEFAULT, "sfsqlite: Error opening db at %@: %@", buf, 0x16u);

    }
  }

}

- (void)close
{
  unint64_t openCount;
  NSObject *v4;
  void *v6;
  uint8_t v7[16];

  openCount = self->_openCount;
  if (!openCount)
    return;
  if (openCount != 1)
  {
LABEL_10:
    self->_openCount = openCount - 1;
    return;
  }
  if (!self->_db)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SFSQLite.m"), 465, CFSTR("Missing handle for open cache db"));

  }
  -[SFSQLite removeAllStatements](self, "removeAllStatements");
  if (!sqlite3_close(self->_db))
  {
    self->_db = 0;
    openCount = self->_openCount;
    goto LABEL_10;
  }
  secLogObjForScope("SecError");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_18A900000, v4, OS_LOG_TYPE_DEFAULT, "sfsqlite: Error closing database", v7, 2u);
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
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (self->_openCount)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SFSQLite.m"), 480, CFSTR("Trying to remove db at: %@ while it is open"), self->_path);

  }
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeItemAtPath:error:", self->_path, 0);

  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = objc_msgSend(&unk_1E1FFEDB8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v14;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v14 != v6)
          objc_enumerationMutation(&unk_1E1FFEDB8);
        v8 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v7);
        objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSString stringByAppendingString:](self->_path, "stringByAppendingString:", v8);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "removeItemAtPath:error:", v10, 0);

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(&unk_1E1FFEDB8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v5);
  }
}

- (void)rollback
{
  -[SFSQLite executeSQL:](self, "executeSQL:", CFSTR("rollback"));
}

- (void)analyze
{
  -[SFSQLite executeSQL:](self, "executeSQL:", CFSTR("analyze"));
}

- (void)vacuum
{
  -[SFSQLite executeSQL:](self, "executeSQL:", CFSTR("vacuum"));
}

- (int)changes
{
  sqlite3 *db;
  NSObject *v4;
  uint8_t v5[16];

  db = self->_db;
  if (db)
    return sqlite3_changes(db);
  secLogObjForScope("SecError");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_18A900000, v4, OS_LOG_TYPE_DEFAULT, "sfsqlite: Database is closed", v5, 2u);
  }

  return -1;
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

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[SFSQLite statementForSQL:](self, "statementForSQL:", CFSTR("select name from sqlite_master where type = 'table'"));
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
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[SFSQLite allTableNames](self, "allTableNames");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("drop table %@"), *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v7));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[SFSQLite executeSQL:](self, "executeSQL:", v8);

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

}

- (id)propertyForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  uint8_t v9[16];

  v4 = a3;
  if (objc_msgSend(v4, "length"))
  {
    -[SFSQLite statementForSQL:](self, "statementForSQL:", CFSTR("select value from Properties where key = ?"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bindText:atIndex:", v4, 0);
    v6 = 0;
    if (objc_msgSend(v5, "step"))
    {
      objc_msgSend(v5, "textAtIndex:", 0);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v5, "reset");

  }
  else
  {
    secLogObjForScope("SecError");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_18A900000, v7, OS_LOG_TYPE_DEFAULT, "SFSQLite: attempt to retrieve property without a key", v9, 2u);
    }

    v6 = 0;
  }

  return v6;
}

- (void)setProperty:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  uint8_t v9[16];

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v7, "length"))
  {
    if (!v6)
    {
      -[SFSQLite removePropertyForKey:](self, "removePropertyForKey:", v7);
      goto LABEL_8;
    }
    -[SFSQLite statementForSQL:](self, "statementForSQL:", CFSTR("insert or replace into Properties (key, value) values (?,?)"));
    v8 = objc_claimAutoreleasedReturnValue();
    -[NSObject bindText:atIndex:](v8, "bindText:atIndex:", v7, 0);
    -[NSObject bindText:atIndex:](v8, "bindText:atIndex:", v6, 1);
    -[NSObject step](v8, "step");
    -[NSObject reset](v8, "reset");
  }
  else
  {
    secLogObjForScope("SecError");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_18A900000, v8, OS_LOG_TYPE_DEFAULT, "SFSQLite: attempt to set property without a key", v9, 2u);
    }
  }

LABEL_8:
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
    -[NSDateFormatter setDateFormat:](v4, "setDateFormat:", CFSTR("yyyy-MM-dd'T'HH:mm:ss.SSSZZZZ"));
    v5 = self->_dateFormatter;
    self->_dateFormatter = v4;

    dateFormatter = self->_dateFormatter;
  }
  return dateFormatter;
}

- (NSDateFormatter)oldDateFormatter
{
  NSDateFormatter *oldDateFormatter;
  NSDateFormatter *v4;
  NSDateFormatter *v5;

  oldDateFormatter = self->_oldDateFormatter;
  if (!oldDateFormatter)
  {
    v4 = (NSDateFormatter *)objc_opt_new();
    -[NSDateFormatter setDateFormat:](v4, "setDateFormat:", CFSTR("yyyy-MM-dd'T'HH:mm:ssZZZZZ"));
    v5 = self->_oldDateFormatter;
    self->_oldDateFormatter = v4;

    oldDateFormatter = self->_oldDateFormatter;
  }
  return oldDateFormatter;
}

- (id)datePropertyForKey:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[SFSQLite propertyForKey:](self, "propertyForKey:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "length"))
  {
    -[SFSQLite dateFormatter](self, "dateFormatter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "dateFromString:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
    {
      -[SFSQLite oldDateFormatter](self, "oldDateFormatter");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "dateFromString:", v4);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

    }
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
    -[SFSQLite dateFormatter](self, "dateFormatter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringFromDate:", v6);
    a3 = (id)objc_claimAutoreleasedReturnValue();

  }
  -[SFSQLite setProperty:forKey:](self, "setProperty:forKey:", a3, v8);

}

- (void)removePropertyForKey:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  if (objc_msgSend(v5, "length"))
  {
    -[SFSQLite statementForSQL:](self, "statementForSQL:", CFSTR("delete from Properties where key = ?"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "bindText:atIndex:", v5, 0);
    objc_msgSend(v4, "step");
    objc_msgSend(v4, "reset");

  }
}

- (id)creationDate
{
  void *v2;
  void *v3;
  float v4;
  void *v5;

  v2 = (void *)MEMORY[0x1E0C99D68];
  -[SFSQLite propertyForKey:](self, "propertyForKey:", CFSTR("Created"));
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

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("pragma table_info(%@)"), a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFSQLite statementForSQL:](self, "statementForSQL:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_alloc_init(MEMORY[0x1E0C99E20]);
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
  return -[SFSQLite select:from:where:bindings:](self, "select:from:where:bindings:", a3, a4, 0, 0);
}

- (id)select:(id)a3 from:(id)a4 mapEachRow:(id)a5
{
  id v8;
  objc_class *v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  _QWORD v18[4];
  id v19;
  id v20;

  v8 = a5;
  v9 = (objc_class *)MEMORY[0x1E0C99DE8];
  v10 = a4;
  v11 = a3;
  v12 = objc_alloc_init(v9);
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __35__SFSQLite_select_from_mapEachRow___block_invoke;
  v18[3] = &unk_1E1FCB738;
  v20 = v8;
  v13 = v12;
  v19 = v13;
  v14 = v8;
  -[SFSQLite select:from:where:bindings:orderBy:limit:forEachRow:](self, "select:from:where:bindings:orderBy:limit:forEachRow:", v11, v10, 0, 0, 0, 0, v18);

  v15 = v19;
  v16 = v13;

  return v16;
}

- (void)select:(id)a3 from:(id)a4 where:(id)a5 bindings:(id)a6 orderBy:(id)a7 limit:(id)a8 block:(id)a9
{
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;

  v16 = a9;
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __59__SFSQLite_select_from_where_bindings_orderBy_limit_block___block_invoke;
  v18[3] = &unk_1E1FCB760;
  v19 = v16;
  v17 = v16;
  -[SFSQLite select:from:where:bindings:orderBy:limit:forEachRow:](self, "select:from:where:bindings:orderBy:limit:forEachRow:", a3, a4, a5, a6, a7, a8, v18);

}

- (void)select:(id)a3 from:(id)a4 where:(id)a5 bindings:(id)a6 orderBy:(id)a7 limit:(id)a8 forEachRow:(id)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void (**v20)(id, void *, _BYTE *);
  uint64_t v21;
  id v22;
  __CFString *v23;
  void *v24;
  void *v25;
  void *v26;
  void *context;
  id v28;
  char v29;

  v15 = a3;
  v28 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  v20 = (void (**)(id, void *, _BYTE *))a9;
  v21 = MEMORY[0x18D770A24]();
  v22 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  context = (void *)v21;
  if (objc_msgSend(v15, "count"))
  {
    objc_msgSend(v15, "componentsJoinedByString:", CFSTR(", "));
    v23 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v23 = CFSTR("*");
  }
  objc_msgSend(v22, "appendFormat:", CFSTR("select %@ from %@"), v23, v28);
  if (objc_msgSend(v16, "length"))
    objc_msgSend(v22, "appendFormat:", CFSTR(" where %@"), v16);
  if (v18)
  {
    objc_msgSend(v18, "componentsJoinedByString:", CFSTR(", "));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "appendFormat:", CFSTR(" order by %@"), v24);

  }
  if (v19)
    objc_msgSend(v22, "appendFormat:", CFSTR(" limit %ld"), objc_msgSend(v19, "integerValue"));
  -[SFSQLite statementForSQL:](self, "statementForSQL:", v22);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = (void *)MEMORY[0x18D770A24](objc_msgSend(v25, "bindValues:", v17));
  if (objc_msgSend(v25, "step"))
  {
    do
    {
      if (v20)
      {
        v29 = 0;
        v20[2](v20, v25, &v29);
        if (v29)
          break;
      }
      objc_autoreleasePoolPop(v26);
      v26 = (void *)MEMORY[0x18D770A24]();
    }
    while ((objc_msgSend(v25, "step") & 1) != 0);
  }
  objc_autoreleasePoolPop(v26);
  objc_msgSend(v25, "reset");

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
  context = (void *)MEMORY[0x18D770A24]();
  v20 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
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
  -[SFSQLite statementForSQL:](self, "statementForSQL:", v20);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = (void *)MEMORY[0x18D770A24](objc_msgSend(v22, "bindValues:", v16));
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
      v23 = (void *)MEMORY[0x18D770A24]();
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
  v14 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  objc_msgSend(v14, "appendFormat:", CFSTR("select * from %@"), v10);
  if (objc_msgSend(v11, "length"))
    objc_msgSend(v14, "appendFormat:", CFSTR(" where %@"), v11);
  if (v13)
    objc_msgSend(v14, "appendFormat:", CFSTR(" limit %ld"), objc_msgSend(v13, "integerValue"));
  v15 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[SFSQLite statementForSQL:](self, "statementForSQL:", v14);
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
  if (objc_msgSend(v12, "length"))
  {
    v16 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
    objc_msgSend(v16, "appendFormat:", CFSTR("update %@"), v18);
    objc_msgSend(v16, "appendFormat:", CFSTR(" set %@"), v12);
    if (objc_msgSend(v13, "length"))
      objc_msgSend(v16, "appendFormat:", CFSTR(" where %@"), v13);
    if (v15)
      objc_msgSend(v16, "appendFormat:", CFSTR(" limit %ld"), objc_msgSend(v15, "integerValue"));
    -[SFSQLite statementForSQL:](self, "statementForSQL:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "bindValues:", v14);
    while ((objc_msgSend(v17, "step") & 1) != 0)
      ;
    objc_msgSend(v17, "reset");

  }
}

- (id)selectAllFrom:(id)a3 where:(id)a4 bindings:(id)a5
{
  return -[SFSQLite selectFrom:where:bindings:limit:](self, "selectFrom:where:bindings:limit:", a3, a4, a5, 0);
}

- (unint64_t)selectCountFrom:(id)a3 where:(id)a4 bindings:(id)a5
{
  void *v5;
  void *v6;
  void *v7;
  unint64_t v8;

  -[SFSQLite select:from:where:bindings:](self, "select:from:where:bindings:", &unk_1E1FFEE00, a3, a4, a5);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("n"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "unsignedIntegerValue");

  return v8;
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
  SFSQLite *v18;
  id v19;

  v18 = self;
  v19 = a3;
  v5 = a4;
  objc_msgSend(v5, "allKeys");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sortedArrayUsingSelector:", sel_compare_);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v9 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
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
        && (objc_msgSend(MEMORY[0x1E0C99E38], "null"),
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
  -[SFSQLite deleteFrom:where:bindings:](v18, "deleteFrom:where:bindings:", v19, v9, v8, v18);

}

- (void)deleteFrom:(id)a3 where:(id)a4 bindings:(id)a5
{
  void *v8;
  id v9;
  void *v10;
  id v11;

  v8 = (void *)MEMORY[0x1E0CB3940];
  v9 = a5;
  objc_msgSend(v8, "stringWithFormat:", CFSTR("delete from %@ where %@"), a3, a4);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  -[SFSQLite statementForSQL:](self, "statementForSQL:", v11);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "bindValues:", v9);

  objc_msgSend(v10, "step");
  objc_msgSend(v10, "reset");

}

- (id)_tableNameForClass:(Class)a3
{
  void *v4;
  void *v5;
  NSObject *v6;
  NSString *objectClassPrefix;
  int v9;
  void *v10;
  __int16 v11;
  NSString *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  -[objc_class SFSQLiteClassName](a3, "SFSQLiteClassName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "hasPrefix:", self->_objectClassPrefix) & 1) != 0)
  {
    objc_msgSend(v4, "substringFromIndex:", -[NSString length](self->_objectClassPrefix, "length"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    secLogObjForScope("SecError");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      objectClassPrefix = self->_objectClassPrefix;
      v9 = 138412546;
      v10 = v4;
      v11 = 2112;
      v12 = objectClassPrefix;
      _os_log_impl(&dword_18A900000, v6, OS_LOG_TYPE_DEFAULT, "sfsqlite: Object class \"%@\" does not have prefix \"%@\", (uint8_t *)&v9, 0x16u);
    }

    v5 = 0;
  }

  return v5;
}

- (int)dbUserVersion
{
  void *v2;
  int v3;

  -[SFSQLite statementForSQL:](self, "statementForSQL:", CFSTR("pragma user_version"));
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

- (int)autoVacuumSetting
{
  void *v2;
  int v3;

  -[SFSQLite statementForSQL:](self, "statementForSQL:", CFSTR("pragma auto_vacuum"));
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

- (SFSQLiteDelegate)delegate
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

- (void)setOldDateFormatter:(id)a3
{
  objc_storeStrong((id *)&self->_oldDateFormatter, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_oldDateFormatter, 0);
  objc_storeStrong((id *)&self->_dateFormatter, 0);
  objc_storeStrong((id *)&self->_objectClassPrefix, 0);
  objc_storeStrong((id *)&self->_statementsBySQL, 0);
  objc_storeStrong((id *)&self->_schemaVersion, 0);
  objc_storeStrong((id *)&self->_schema, 0);
  objc_storeStrong((id *)&self->_path, 0);
  objc_storeStrong((id *)&self->_delegate, 0);
}

void __59__SFSQLite_select_from_where_bindings_orderBy_limit_block___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(a2, "allObjectsByColumnName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
  {
    v5 = v3;
    (*(void (**)(void))(v4 + 16))();
    v3 = v5;
  }

}

void __35__SFSQLite_select_from_mapEachRow___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = v2;
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v2);
    v2 = v3;
  }

}

@end
