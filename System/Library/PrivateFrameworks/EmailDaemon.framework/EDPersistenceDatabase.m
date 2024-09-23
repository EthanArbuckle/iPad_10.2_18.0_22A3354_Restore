@implementation EDPersistenceDatabase

- (EFSQLQueryLogging)queryLogger
{
  return self->_queryLogger;
}

- (BOOL)performWithOptions:(unint64_t)a3 caller:(id)a4 block:(id)a5
{
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  char v17;
  id v18;
  __int128 v19;
  uint64_t v20;
  void *v21;
  void *v22;
  id v23;
  NSObject *v24;
  NSObject *v25;
  int v26;
  EFProtectedFile *v27;
  EFProtectedFile *v28;
  int v29;
  void *v31;
  NSObject *v32;
  int v33;
  EFProtectedFile *protectedDatabaseFile;
  __int128 v35;
  id v36;
  uint8_t v37;
  _BYTE v38[15];
  id v39;
  id v40;
  uint8_t buf[4];
  int v42;
  __int16 v43;
  int v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v36 = a4;
  v9 = a5;
  if (-[EDPersistenceDatabase isNestedDatabaseCall](self, "isNestedDatabaseCall"))
  {
    objc_msgSend(MEMORY[0x1E0CB3978], "currentThread");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "threadDictionary");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("_EDPersistenceActiveDatabaseConnection"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "transactionLabel");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setTransactionLabel:", v36);
    if ((a3 & 2) != 0)
    {
      objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("_EDPersistenceReadOnlyDatabaseConnection"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "BOOLValue");

      if (v15)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EDPersistenceDatabase.m"), 186, CFSTR("Database write block nested inside a readblock."));

      }
    }
    v40 = 0;
    v17 = objc_msgSend(v12, "performWithOptions:transactionError:block:", a3, &v40, v9);
    v18 = v40;
    objc_msgSend(v12, "setTransactionLabel:", v13);
    if ((v17 & 1) == 0)
      objc_msgSend(v12, "handleError:message:", v18, CFSTR("Committing transaction in nested block"));

  }
  else
  {
    -[EDPersistenceDatabase checkOutConnectionIsWriter:](self, "checkOutConnectionIsWriter:", (a3 >> 1) & 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setTransactionLabel:", v36);
    if (!v11)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EDPersistenceDatabase.m"), 199, CFSTR("Couldn't get database connection in performBlock"));

    }
    v20 = 2;
    *(_QWORD *)&v19 = 67109376;
    v35 = v19;
    while (1)
    {
      -[EDPersistenceDatabase protectedDatabasePersistence](self, "protectedDatabasePersistence", v35);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[EDPersistenceDatabase protectedSchema](self, "protectedSchema");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "attachProtectedOrJournalDatabaseToConnectionIfNecessary:withSchema:", v11, v22);

      v39 = 0;
      v17 = objc_msgSend(v11, "performWithOptions:transactionError:block:", a3, &v39, v9);
      v23 = v39;
      objc_msgSend(v11, "setTransactionLabel:", 0);
      if ((v17 & 1) != 0)
        break;
      if (!objc_msgSend(v11, "protectedDatabaseAttached")
        || !-[EDPersistenceDatabase _isIOError:]((uint64_t)self, v23) && !objc_msgSend(v11, "hadIOError"))
      {
        objc_msgSend(v11, "handleError:message:", v23, CFSTR("Committing transaction"));
        goto LABEL_29;
      }
      if (!v20)
      {
        +[EDPersistenceDatabase log](EDPersistenceDatabase, "log");
        v32 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_FAULT))
        {
          v33 = EFProtectedDataAvailable();
          if (self)
            protectedDatabaseFile = self->_protectedDatabaseFile;
          else
            protectedDatabaseFile = 0;
          -[EDPersistenceDatabase performWithOptions:caller:block:].cold.1(-[EFProtectedFile backgroundProcessingIsAllowed](protectedDatabaseFile, "backgroundProcessingIsAllowed"), buf, v33, v32);
        }

        abort();
      }
      +[EDPersistenceDatabase log](EDPersistenceDatabase, "log");
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        v26 = EFProtectedDataAvailable();
        if (self)
          v27 = self->_protectedDatabaseFile;
        else
          v27 = 0;
        v28 = v27;
        v29 = -[EFProtectedFile backgroundProcessingIsAllowed](v28, "backgroundProcessingIsAllowed");
        *(_DWORD *)buf = v35;
        v42 = v26;
        v43 = 1024;
        v44 = v29;
        _os_log_error_impl(&dword_1D2F2C000, v24, OS_LOG_TYPE_ERROR, "Got IOError for transaction, retrying again, EFProtectedData = %d, backgroud processing = %d", buf, 0xEu);

      }
      objc_msgSend(v11, "setHadIOError:", 0);
      objc_msgSend(v11, "close");
      objc_msgSend(v11, "open");
      if (-[EDPersistenceDatabase protectedDatabaseIsAvailable](self, "protectedDatabaseIsAvailable"))
      {
        +[EDPersistenceDatabase log](EDPersistenceDatabase, "log");
        v25 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
          -[EDPersistenceDatabase performWithOptions:caller:block:].cold.2(&v37, v38, v25);

      }
      --v20;
    }
    if (objc_msgSend(MEMORY[0x1E0D1E180], "shouldBlockSQLQueries"))
      objc_msgSend(MEMORY[0x1E0D1E180], "blockForRandomDurationWithMessage:", CFSTR("Block SQL Query"));
LABEL_29:

    if (v11)
      -[EDPersistenceDatabase checkInConnection:](self, "checkInConnection:", v11);
  }

  return v17;
}

- (BOOL)isNestedDatabaseCall
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3978], "currentThread");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "threadDictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("_EDPersistenceActiveDatabaseConnection"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v2) = v4 != 0;

  return (char)v2;
}

- (EDProtectedDatabasePersistence)protectedDatabasePersistence
{
  return self->_protectedDatabasePersistence;
}

- (EFSQLSchema)protectedSchema
{
  return self->_protectedSchema;
}

- (void)checkInConnection:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  EDPersistenceDatabaseConnectionPool *connectionPool;
  id v9;

  v9 = a3;
  -[EDPersistenceDatabase protectedDatabasePersistence](self, "protectedDatabasePersistence");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "detachProtectedOrJournalDatabaseFromConnectionIfNecessary:", v9);

  objc_msgSend(v9, "sqlConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "finalizeStatementsWithError:", 0);

  objc_msgSend(MEMORY[0x1E0CB3978], "currentThread");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "threadDictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "removeObjectForKey:", CFSTR("_EDPersistenceActiveDatabaseConnection"));
  objc_msgSend(v7, "removeObjectForKey:", CFSTR("_EDPersistenceReadOnlyDatabaseConnection"));
  objc_msgSend(v9, "setHadIOError:", 0);

  if (self)
    connectionPool = self->_connectionPool;
  else
    connectionPool = 0;
  -[EDPersistenceDatabaseConnectionPool checkInConnection:](connectionPool, "checkInConnection:", v9);

}

- (BOOL)protectedDatabaseIsAvailable
{
  EFProtectedFile *protectedDatabaseFile;

  if ((EFProtectedDataAvailable() & 1) != 0)
    return 1;
  if (self)
    protectedDatabaseFile = self->_protectedDatabaseFile;
  else
    protectedDatabaseFile = 0;
  return -[EFProtectedFile backgroundProcessingIsAllowed](protectedDatabaseFile, "backgroundProcessingIsAllowed");
}

- (BOOL)__performReadWithCaller:(id)a3 usingBlock:(id)a4
{
  id v7;
  id v8;
  BOOL v9;
  void *v11;

  v7 = a3;
  v8 = a4;
  if (!-[EDPersistenceDatabase setupIsComplete](self, "setupIsComplete")
    && !-[EDPersistenceDatabase isNestedDatabaseCall](self, "isNestedDatabaseCall"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EDPersistenceDatabase.m"), 164, CFSTR("performReadBlockInDatabase called before database setup is complete"));

  }
  v9 = -[EDPersistenceDatabase performWithOptions:caller:block:](self, "performWithOptions:caller:block:", 1, v7, v8);

  return v9;
}

- (BOOL)setupIsComplete
{
  return self->_setupIsComplete;
}

- (EDPersistenceDatabase)initWithBasePath:(id)a3 databaseName:(id)a4 maxConcurrentReaders:(unint64_t)a5 schema:(id)a6 protectedSchema:(id)a7 propertyMapper:(id)a8 protectedDatabasePersistence:(id)a9
{
  id v14;
  EDPersistenceDatabase *v15;
  uint64_t v16;
  NSString *basePath;
  uint64_t v18;
  NSString *databaseName;
  uint64_t v20;
  NSString *protectedDatabasePath;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  uint64_t v27;
  EFProtectedFile *protectedDatabaseFile;
  NSString *v29;
  id v30;
  NSString *v31;
  uint64_t v32;
  uint64_t v33;
  NSString *fullPath;
  EDPersistenceDatabaseConnectionPool *v35;
  EDPersistenceDatabaseConnectionPool *connectionPool;
  EFSQLQueryLogging *queryLogger;
  EDSQLQueryLogger *v38;
  EFSQLQueryLogging *v39;
  id obj;
  id v43;
  id v44;
  id v45;
  id v46;
  id v47;
  objc_super v48;
  _QWORD v49[3];

  v49[2] = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v47 = a4;
  v43 = a6;
  v44 = a7;
  v45 = a8;
  v46 = a9;
  v48.receiver = self;
  v48.super_class = (Class)EDPersistenceDatabase;
  v15 = -[EDPersistenceDatabase init](&v48, sel_init);
  if (v15)
  {
    v16 = objc_msgSend(v14, "copy");
    basePath = v15->_basePath;
    v15->_basePath = (NSString *)v16;

    v18 = objc_msgSend(v47, "copy");
    databaseName = v15->_databaseName;
    v15->_databaseName = (NSString *)v18;

    if (v14)
    {
      objc_msgSend(v14, "stringByAppendingPathComponent:", CFSTR("Protected Index"), a9);
      v20 = objc_claimAutoreleasedReturnValue();
      protectedDatabasePath = v15->_protectedDatabasePath;
      v15->_protectedDatabasePath = (NSString *)v20;

      objc_msgSend(CFSTR("Protected Index"), "stringByAppendingString:", CFSTR("-wal"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "stringByAppendingPathComponent:", v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_alloc(MEMORY[0x1E0D1EF70]);
      v49[0] = v15->_protectedDatabasePath;
      v49[1] = v23;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v49, 2);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[EDPersistenceDatabase _fileProtectionTypeForDatabaseType:](v15, 1uLL);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = objc_msgSend(v24, "initWithFilePaths:protectionType:", v25, v26);
      protectedDatabaseFile = v15->_protectedDatabaseFile;
      v15->_protectedDatabaseFile = (EFProtectedFile *)v27;

    }
    else
    {
      v29 = v15->_protectedDatabasePath;
      v15->_protectedDatabasePath = (NSString *)CFSTR("Protected Index");

      v30 = objc_alloc(MEMORY[0x1E0D1EF68]);
      v31 = v15->_protectedDatabasePath;
      -[EDPersistenceDatabase _fileProtectionTypeForDatabaseType:](v15, 1uLL);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = objc_msgSend(v30, "initWithFilePath:protectionType:", v31, v22, a9);
      v23 = v15->_protectedDatabaseFile;
      v15->_protectedDatabaseFile = (EFProtectedFile *)v32;
    }

    objc_msgSend(v14, "stringByAppendingPathComponent:", v47);
    v33 = objc_claimAutoreleasedReturnValue();
    fullPath = v15->_fullPath;
    v15->_fullPath = (NSString *)v33;

    objc_storeStrong((id *)&v15->_schema, a6);
    objc_storeStrong((id *)&v15->_protectedSchema, a7);
    objc_storeStrong((id *)&v15->_propertyMapper, a8);
    v35 = -[EDPersistenceDatabaseConnectionPool initWithDelegate:maxConcurrentBackgroundReaders:]([EDPersistenceDatabaseConnectionPool alloc], "initWithDelegate:maxConcurrentBackgroundReaders:", v15, a5);
    connectionPool = v15->_connectionPool;
    v15->_connectionPool = v35;

    queryLogger = v15->_queryLogger;
    v15->_queryLogger = 0;

    if (_os_feature_enabled_impl())
    {
      v38 = objc_alloc_init(EDSQLQueryLogger);
      v39 = v15->_queryLogger;
      v15->_queryLogger = (EFSQLQueryLogging *)v38;

    }
    objc_storeStrong((id *)&v15->_protectedDatabasePersistence, obj);
    objc_msgSend(v46, "setDatabase:", v15);
    if (-[EDPersistenceDatabase enforceDataProtection](v15, "enforceDataProtection")
      && registerVFSModulesIfNeeded_onceToken != -1)
    {
      dispatch_once(&registerVFSModulesIfNeeded_onceToken, &__block_literal_global_222);
    }
  }

  return v15;
}

- (id)urlForDatabasePath:(id)a3 type:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a3;
  -[EDPersistenceDatabase urlFileProtectionTypeForDatabaseType:](self, "urlFileProtectionTypeForDatabaseType:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[EDPersistenceDatabase urlForDatabasePath:type:fileProtection:](self, "urlForDatabasePath:type:fileProtection:", v6, a4, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)urlFileProtectionTypeForDatabaseType:(int64_t)a3
{
  _BOOL4 v4;
  id v5;

  v4 = -[EDPersistenceDatabase enforceDataProtection](self, "enforceDataProtection");
  v5 = 0;
  if (v4 && (unint64_t)a3 <= 2)
    v5 = **((id **)&unk_1E949F7F8 + a3);
  return v5;
}

- (id)urlForDatabasePath:(id)a3 type:(int64_t)a4 fileProtection:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  _QWORD v24[2];
  void *v25;
  void *v26;
  _QWORD v27[2];

  v27[1] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a5;
  v11 = objc_alloc_init(MEMORY[0x1E0CB3998]);
  objc_msgSend(v11, "setScheme:", CFSTR("file"));
  objc_msgSend(v11, "setPath:", v9);
  if ((unint64_t)a4 >= 3)
  {
    if (a4 == 3)
    {
      objc_msgSend(MEMORY[0x1E0CB39D8], "queryItemWithName:value:", CFSTR("cache"), CFSTR("shared"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB39D8], "queryItemWithName:value:", CFSTR("mode"), CFSTR("memory"), v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v24[1] = v15;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 2);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setQueryItems:", v16);

      goto LABEL_10;
    }
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EDPersistenceDatabase.m"), 427, CFSTR("Invalid database type"));
    goto LABEL_9;
  }
  if (v10 && -[EDPersistenceDatabase enforceDataProtection](self, "enforceDataProtection"))
  {
    if (objc_msgSend(v10, "isEqualToString:", *MEMORY[0x1E0C99918]))
    {
      objc_msgSend(MEMORY[0x1E0CB39D8], "queryItemWithName:value:", CFSTR("vfs"), CFSTR("MailClassAVFS"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v27[0] = v12;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setQueryItems:", v13);

      goto LABEL_10;
    }
    if (objc_msgSend(v10, "isEqualToString:", *MEMORY[0x1E0C99920]))
    {
      objc_msgSend(MEMORY[0x1E0CB39D8], "queryItemWithName:value:", CFSTR("vfs"), CFSTR("MailClassBVFS"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = v20;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v26, 1);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setQueryItems:", v21);

      goto LABEL_10;
    }
    if (objc_msgSend(v10, "isEqualToString:", *MEMORY[0x1E0C99928]))
    {
      objc_msgSend(MEMORY[0x1E0CB39D8], "queryItemWithName:value:", CFSTR("vfs"), CFSTR("MailClassCVFS"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = v22;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v25, 1);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setQueryItems:", v23);

      goto LABEL_10;
    }
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EDPersistenceDatabase.m"), 416, CFSTR("Unsupported file protection"));
LABEL_9:

  }
LABEL_10:
  objc_msgSend(v11, "URL");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

- (NSString)protectedDatabasePath
{
  return self->_protectedDatabasePath;
}

- (id)_fileProtectionTypeForDatabaseType:(id)a1
{
  int v3;

  if (a1)
  {
    v3 = objc_msgSend(a1, "enforceDataProtection");
    a1 = 0;
    if (v3)
    {
      if (a2 <= 2)
        a1 = **((id **)&unk_1E949F7E0 + a2);
    }
  }
  return a1;
}

- (id)checkOutConnectionIsWriter:(BOOL)a3
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  NSObject *v11;
  void *v12;
  int v13;
  void *v14;
  int v15;
  EDPersistenceDatabaseConnectionPool *connectionPool;
  void *v17;
  EDPersistenceDatabaseConnectionPool *v18;
  EDPersistenceDatabaseConnectionPool *v20;
  void *v21;

  if (-[EDPersistenceDatabase isNestedDatabaseCall](self, "isNestedDatabaseCall"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EDPersistenceDatabase.m"), 271, CFSTR("We should not be checking out a connection on a nested call"));

  }
  objc_msgSend(MEMORY[0x1E0CB3978], "currentThread");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "threadDictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3B38], "currentConnection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "serviceName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isEqual:", *MEMORY[0x1E0D1DC00]);

  if ((v10 & 1) != 0)
  {
    if (a3)
    {
      +[EDPersistenceDatabase log](EDPersistenceDatabase, "log");
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
        -[EDPersistenceDatabase checkOutConnectionIsWriter:].cold.1(v11);

      objc_msgSend(MEMORY[0x1E0D1EEA8], "currentDevice");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "isInternal");

      if (v13)
        triedToCheckoutWriterWhileOnXPCQueue();
      goto LABEL_13;
    }
    goto LABEL_17;
  }
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("_EDPersistenceNeedsHighPriority"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {

    if (!a3)
      goto LABEL_17;
LABEL_13:
    if (self)
      connectionPool = self->_connectionPool;
    else
      connectionPool = 0;
    -[EDPersistenceDatabaseConnectionPool writerConnection](connectionPool, "writerConnection");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setIsWriter:", 1);
    goto LABEL_20;
  }
  v15 = objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread");

  if (a3)
    goto LABEL_13;
  if (v15)
  {
LABEL_17:
    if (self)
      v18 = self->_connectionPool;
    else
      v18 = 0;
    -[EDPersistenceDatabaseConnectionPool readerConnection](v18, "readerConnection");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setIsWriter:", 0);
    goto LABEL_20;
  }
  if (self)
    v20 = self->_connectionPool;
  else
    v20 = 0;
  -[EDPersistenceDatabaseConnectionPool backgroundReaderConnection](v20, "backgroundReaderConnection");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setIsWriter:", 0);
LABEL_20:
  if (v17)
  {
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v17, CFSTR("_EDPersistenceActiveDatabaseConnection"));
    if (!a3)
      objc_msgSend(v7, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("_EDPersistenceReadOnlyDatabaseConnection"));
    objc_msgSend(v17, "setHadIOError:", 0);
  }

  return v17;
}

- (NSString)databaseName
{
  return self->_databaseName;
}

- (NSString)basePath
{
  return self->_basePath;
}

- (EFSQLPropertyMapper)propertyMapper
{
  return self->_propertyMapper;
}

- (void)performDatabaseWorkInBlockWithHighPriority:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void (**v6)(void);

  v6 = (void (**)(void))a3;
  objc_msgSend(MEMORY[0x1E0CB3978], "currentThread");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "threadDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("_EDPersistenceNeedsHighPriority"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6[2]();
  }
  else
  {
    objc_msgSend(v4, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("_EDPersistenceNeedsHighPriority"));
    v6[2]();
    objc_msgSend(v4, "removeObjectForKey:", CFSTR("_EDPersistenceNeedsHighPriority"));
  }

}

- (BOOL)__performWriteWithCaller:(id)a3 usingBlock:(id)a4
{
  id v7;
  id v8;
  BOOL v9;
  void *v11;

  v7 = a3;
  v8 = a4;
  if (!-[EDPersistenceDatabase setupIsComplete](self, "setupIsComplete")
    && !-[EDPersistenceDatabase isNestedDatabaseCall](self, "isNestedDatabaseCall"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EDPersistenceDatabase.m"), 169, CFSTR("performWriteBlockInDatabase called before database setup is complete"));

  }
  v9 = -[EDPersistenceDatabase performWithOptions:caller:block:](self, "performWithOptions:caller:block:", 3, v7, v8);

  return v9;
}

- (EFSQLSchema)schema
{
  return self->_schema;
}

- (void)setSetupIsComplete:(BOOL)a3
{
  self->_setupIsComplete = a3;
}

- (void)reconcileJournalWithCompletionBlock:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[EDPersistenceDatabase protectedDatabasePersistence](self, "protectedDatabasePersistence");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[EDPersistenceDatabase protectedSchema](self, "protectedSchema");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "reconcileJournalsWithSchema:completionBlock:", v5, v6);

}

+ (OS_os_log)log
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __28__EDPersistenceDatabase_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_63 != -1)
    dispatch_once(&log_onceToken_63, block);
  return (OS_os_log *)(id)log_log_63;
}

void __28__EDPersistenceDatabase_log__block_invoke(uint64_t a1)
{
  os_log_t v1;
  void *v2;
  id v3;

  NSStringFromClass(*(Class *)(a1 + 32));
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v1 = os_log_create("com.apple.email", (const char *)objc_msgSend(v3, "UTF8String"));
  v2 = (void *)log_log_63;
  log_log_63 = (uint64_t)v1;

}

- (EDPersistenceDatabase)init
{
  -[EDPersistenceDatabase doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  __assert_rtn("-[EDPersistenceDatabase init]", "EDPersistenceDatabase.m", 95, "0");
}

- (void)test_tearDown
{
  id v4;
  id v5;

  if ((EFIsRunningUnitTests() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EDPersistenceDatabase.m"), 138, CFSTR("%s can only be called from unit tests"), "-[EDPersistenceDatabase test_tearDown]");

  }
  -[EDPersistenceDatabase protectedDatabasePersistence](self, "protectedDatabasePersistence");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "test_tearDown");

}

- (BOOL)writersAreWaiting
{
  if (self)
    self = (EDPersistenceDatabase *)self->_connectionPool;
  return -[EDPersistenceDatabase writersWaiting](self, "writersWaiting") != 0;
}

- (BOOL)performDatabaseSetupUsingTransaction:(BOOL)a3 block:(id)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  uint64_t v8;
  BOOL v9;

  v4 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[EDPersistenceDatabase performDatabaseSetupUsingTransaction:block:]");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    v8 = 7;
  else
    v8 = 2;
  v9 = -[EDPersistenceDatabase performWithOptions:caller:block:](self, "performWithOptions:caller:block:", v8, v7, v6);

  return v9;
}

- (BOOL)_isIOError:(uint64_t)a1
{
  id v3;
  void *v4;
  void *v5;
  _BOOL8 v6;

  v3 = a2;
  v4 = v3;
  if (a1)
  {
    objc_msgSend(v3, "domain");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0D1EE10]))
      v6 = objc_msgSend(v4, "code") == 10;
    else
      v6 = 0;

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)closeAllConnections
{
  if (self)
    self = (EDPersistenceDatabase *)self->_connectionPool;
  -[EDPersistenceDatabase flush](self, "flush");
}

- (id)openConnectionIsWriter:(BOOL)a3
{
  -[EDPersistenceDatabase doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  __assert_rtn("-[EDPersistenceDatabase openConnectionIsWriter:]", "EDPersistenceDatabase.m", 321, "0");
}

- (BOOL)databaseIsCorrupt
{
  int v2;
  NSObject *v3;
  _DWORD v5[2];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  -[NSString fileSystemRepresentation](self->_fullPath, "fileSystemRepresentation");
  v2 = _sqlite3_integrity_check();
  +[EDPersistenceDatabase log](EDPersistenceDatabase, "log");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v5[0] = 67109120;
    v5[1] = v2;
    _os_log_impl(&dword_1D2F2C000, v3, OS_LOG_TYPE_DEFAULT, "Integrity check result: %d", (uint8_t *)v5, 8u);
  }

  return v2 == 11;
}

- (BOOL)enforceDataProtection
{
  -[EDPersistenceDatabase doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  __assert_rtn("-[EDPersistenceDatabase enforceDataProtection]", "EDPersistenceDatabase.m", 335, "0");
}

- (id)requestProtectedDatabaseBackgroundProcessingForDuration:(double)a3 error:(id *)a4
{
  if (self)
    self = (EDPersistenceDatabase *)self->_protectedDatabaseFile;
  -[EDPersistenceDatabase requestBackgroundProcessingForDuration:error:](self, "requestBackgroundProcessingForDuration:error:", a4, a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)scheduleRecurringActivity
{
  void *v3;

  -[EDPersistenceDatabase protectedDatabasePersistence](self, "protectedDatabasePersistence");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "scheduleRecurringActivity");

  -[EDPersistenceDatabase _scheduleProcessSQLQueryPerformanceData](self);
}

- (void)_scheduleProcessSQLQueryPerformanceData
{
  void *v2;
  void *v3;
  _QWORD aBlock[5];

  if (a1)
  {
    objc_msgSend(a1, "queryLogger");
    v2 = (void *)objc_claimAutoreleasedReturnValue();

    if (v2)
    {
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 3221225472;
      aBlock[2] = __64__EDPersistenceDatabase__scheduleProcessSQLQueryPerformanceData__block_invoke_2;
      aBlock[3] = &unk_1E949BC90;
      aBlock[4] = a1;
      v3 = _Block_copy(aBlock);
      ef_xpc_activity_register();

    }
  }
}

void __64__EDPersistenceDatabase__scheduleProcessSQLQueryPerformanceData__block_invoke(uint64_t a1, void *a2)
{
  xpc_object_t xdict;

  xdict = a2;
  xpc_dictionary_set_int64(xdict, (const char *)*MEMORY[0x1E0C807A8], *MEMORY[0x1E0C807B8]);
  xpc_dictionary_set_BOOL(xdict, (const char *)*MEMORY[0x1E0C80738], 1);
  xpc_dictionary_set_string(xdict, (const char *)*MEMORY[0x1E0C80878], (const char *)*MEMORY[0x1E0C80880]);
  xpc_dictionary_set_BOOL(xdict, (const char *)*MEMORY[0x1E0C80898], 1);

}

void __64__EDPersistenceDatabase__scheduleProcessSQLQueryPerformanceData__block_invoke_2(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "queryLogger");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "submitQueryLogData");

}

- (NSString)fullPath
{
  return self->_fullPath;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fullPath, 0);
  objc_storeStrong((id *)&self->_databaseName, 0);
  objc_storeStrong((id *)&self->_basePath, 0);
  objc_storeStrong((id *)&self->_protectedDatabasePersistence, 0);
  objc_storeStrong((id *)&self->_blankCellsController, 0);
  objc_storeStrong((id *)&self->_connectionPool, 0);
  objc_storeStrong((id *)&self->_protectedDatabaseFile, 0);
  objc_storeStrong((id *)&self->_propertyMapper, 0);
  objc_storeStrong((id *)&self->_protectedSchema, 0);
  objc_storeStrong((id *)&self->_schema, 0);
  objc_storeStrong((id *)&self->_queryLogger, 0);
  objc_storeStrong((id *)&self->_protectedDatabasePath, 0);
}

- (void)performWithOptions:(int)a3 caller:(os_log_t)log block:.cold.1(char a1, uint8_t *buf, int a3, os_log_t log)
{
  *(_DWORD *)buf = 67109376;
  *((_DWORD *)buf + 1) = a3;
  *((_WORD *)buf + 4) = 1024;
  *(_DWORD *)(buf + 10) = a1 & 1;
  _os_log_fault_impl(&dword_1D2F2C000, log, OS_LOG_TYPE_FAULT, "Got IOError three times in a row, aborting, EFProtectedData = %d, backgroud processing = %d", buf, 0xEu);
}

- (void)performWithOptions:(uint8_t *)buf caller:(_BYTE *)a2 block:(os_log_t)log .cold.2(uint8_t *buf, _BYTE *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_error_impl(&dword_1D2F2C000, log, OS_LOG_TYPE_ERROR, "Got IOError for transaction", buf, 2u);
}

- (void)checkOutConnectionIsWriter:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_1D2F2C000, log, OS_LOG_TYPE_FAULT, "Trying to get a database write connection while servicing an XPC request.", v1, 2u);
}

@end
