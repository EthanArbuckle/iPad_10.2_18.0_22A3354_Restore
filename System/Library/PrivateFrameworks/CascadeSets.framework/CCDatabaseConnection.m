@implementation CCDatabaseConnection

uint64_t __84__CCDatabaseConnection_enumerateRecordResultsOfSelect_recordClass_error_usingBlock___block_invoke(uint64_t a1, uint64_t a2, _QWORD *a3, _BYTE *a4)
{
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 40), "recordFromDatabaseValueRow:", a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    v9 = (void *)MEMORY[0x24BDD1540];
    v13 = *MEMORY[0x24BDD0BA0];
    v14[0] = CFSTR("Unrecognized database record converted from SQLite value row");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "errorWithDomain:code:userInfo:", CFSTR("com.apple.CascadeSets.CCDatabase"), 15, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    CCSetError(a3, v11);

    goto LABEL_5;
  }
  if (((*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))() & 1) == 0)
  {
LABEL_5:
    v8 = 0;
    *a4 = 1;
    goto LABEL_6;
  }
  v8 = 1;
LABEL_6:

  return v8;
}

- (BOOL)enumerateRecordResultsOfSelect:(id)a3 recordClass:(Class)a4 error:(id *)a5 usingBlock:(id)a6
{
  id v10;
  id v11;
  _QWORD v13[4];
  id v14;
  Class v15;

  v10 = a6;
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __84__CCDatabaseConnection_enumerateRecordResultsOfSelect_recordClass_error_usingBlock___block_invoke;
  v13[3] = &unk_250990B28;
  v14 = v10;
  v15 = a4;
  v11 = v10;
  LOBYTE(a5) = -[CCDatabaseConnection enumerateRowResultsOfSelect:error:usingBlock:](self, "enumerateRowResultsOfSelect:error:usingBlock:", a3, a5, v13);

  return (char)a5;
}

- (BOOL)beginTransactionWithError:(id *)a3
{
  void *v4;
  void *v5;
  void *v6;
  int v7;
  NSObject *v9;
  uint64_t v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x24BDAC8D0];
  if (self->_inTransaction)
  {
    v4 = (void *)MEMORY[0x24BDD1540];
    v11 = *MEMORY[0x24BDD0BA0];
    v12[0] = CFSTR("Attempted to begin transaction when one is already active");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "errorWithDomain:code:userInfo:", CFSTR("com.apple.CascadeSets.CCDatabase"), 11, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    CCSetError(a3, v6);

    LOBYTE(v7) = 0;
  }
  else
  {
    __biome_log_for_category();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      -[CCDatabaseConnection beginTransactionWithError:].cold.1();

    v7 = -[CCDatabase beginTransactionWithError:](self->_db, "beginTransactionWithError:", a3);
    if (v7)
    {
      LOBYTE(v7) = 1;
      self->_inTransaction = 1;
    }
  }
  return v7;
}

- (BOOL)executeCommand:(id)a3 error:(id *)a4
{
  void *v5;
  void *v6;

  -[CCDatabase executeCommand:options:](self->_db, "executeCommand:options:", a3, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "error");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    CCSetError(a4, v6);

  return v6 == 0;
}

- (BOOL)openWithError:(id *)a3
{
  void *v5;
  void *v6;
  char v7;

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("PRAGMA busy_timeout = %d"), 500);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("PRAGMA cache_spill = %d"), 800);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[CCDatabase openWithError:](self->_db, "openWithError:", a3)
    && -[CCDatabase executeCommandString:error:](self->_db, "executeCommandString:error:", v5, a3)
    && -[CCDatabase executeCommandString:error:](self->_db, "executeCommandString:error:", CFSTR("PRAGMA foreign_keys = ON;"),
                       a3))
  {
    v7 = -[CCDatabase executeCommandString:error:](self->_db, "executeCommandString:error:", v6, a3);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)enumerateRowResultsOfSelect:(id)a3 error:(id *)a4 usingBlock:(id)a5
{
  id v8;
  uint64_t (**v9)(id, CCDatabaseValueRow *, id *, _BYTE *);
  void *v10;
  _BOOL4 v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  CCDatabaseValueRow *v22;
  int v23;
  int v24;
  id v27;
  void *v28;
  id *v29;
  id v30;
  id v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  id v36;
  id v37;
  unsigned __int8 v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = (uint64_t (**)(id, CCDatabaseValueRow *, id *, _BYTE *))a5;
  v38 = 0;
  v10 = (void *)MEMORY[0x23B82079C]();
  v36 = 0;
  v37 = 0;
  v11 = -[CCDatabaseConnection _getRowResultsOfSelect:outRows:error:](self, "_getRowResultsOfSelect:outRows:error:", v8, &v37, &v36);
  v12 = v37;
  v13 = v36;
  if (v11)
  {
    v34 = 0u;
    v35 = 0u;
    v32 = 0u;
    v33 = 0u;
    v14 = v12;
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v32, v39, 16);
    if (v15)
    {
      v16 = v15;
      v27 = v12;
      v28 = v10;
      v29 = a4;
      v30 = v8;
      v17 = *(_QWORD *)v33;
LABEL_4:
      v18 = 0;
      v19 = v13;
      while (1)
      {
        if (*(_QWORD *)v33 != v17)
          objc_enumerationMutation(v14);
        v20 = *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * v18);
        v21 = (void *)MEMORY[0x23B82079C]();
        v22 = -[CCDatabaseValueRow initWithDatabaseValueArray:]([CCDatabaseValueRow alloc], "initWithDatabaseValueArray:", v20);
        v31 = v19;
        v23 = v9[2](v9, v22, &v31, &v38);
        v13 = v31;

        v24 = v38;
        objc_autoreleasePoolPop(v21);
        if (!v23 || v24 != 0)
          break;
        ++v18;
        v19 = v13;
        if (v16 == v18)
        {
          v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v32, v39, 16);
          if (v16)
            goto LABEL_4;
          LOBYTE(v23) = 1;
          break;
        }
      }
      a4 = v29;
      v8 = v30;
      v12 = v27;
      v10 = v28;
    }
    else
    {
      LOBYTE(v23) = 1;
    }

  }
  else
  {
    LOBYTE(v23) = 0;
  }

  objc_autoreleasePoolPop(v10);
  CCSetError(a4, v13);

  return v23;
}

- (BOOL)_getRowResultsOfSelect:(id)a3 outRows:(id *)a4 error:(id *)a5
{
  id v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  BOOL v13;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;
  _QWORD v27[2];

  v27[1] = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[CCDatabase executeCommand:options:](self->_db, "executeCommand:options:", v8, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "error");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v10)
    {
      objc_msgSend(v9, "rowValueTuples");
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      v13 = 1;
      goto LABEL_8;
    }
    CCSetError(a5, v10);
    __biome_log_for_category();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v8, "commandString");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "parameters");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[CCDatabase path](self->_db, "path");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138413058;
      v19 = v15;
      v20 = 2112;
      v21 = v16;
      v22 = 2112;
      v23 = v17;
      v24 = 2112;
      v25 = v10;
      _os_log_error_impl(&dword_237B25000, v11, OS_LOG_TYPE_ERROR, "Could not execute command=%@ with parameters=%@ in database file at %@, err=%@", (uint8_t *)&v18, 0x2Au);

    }
  }
  else
  {
    v12 = (void *)MEMORY[0x24BDD1540];
    v26 = *MEMORY[0x24BDD0BA0];
    v27[0] = CFSTR("Could not execute non-select command on read-only database connection");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v27, &v26, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "errorWithDomain:code:userInfo:", CFSTR("com.apple.CascadeSets.CCDatabase"), 14, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    CCSetError(a5, v10);
  }
  v13 = 0;
LABEL_8:

  return v13;
}

- (void)dealloc
{
  objc_super v3;

  -[CCDatabaseConnection closeWithError:](self, "closeWithError:", 0);
  v3.receiver = self;
  v3.super_class = (Class)CCDatabaseConnection;
  -[CCDatabaseConnection dealloc](&v3, sel_dealloc);
}

- (BOOL)closeWithError:(id *)a3
{
  return -[CCDatabase closeWithError:](self->_db, "closeWithError:", a3);
}

+ (id)connectionToDatabaseAtURL:(id)a3 dataProtectionClass:(int)a4 openMode:(int64_t)a5 accessAssertion:(id)a6
{
  uint64_t v7;
  id v9;
  id v10;
  CCSQLiteDatabase *v11;
  void *v12;
  int64_t v13;
  CCSQLiteDatabase *v14;
  void *v15;

  v7 = *(_QWORD *)&a4;
  v9 = a6;
  v10 = a3;
  v11 = [CCSQLiteDatabase alloc];
  objc_msgSend(v10, "path");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if ((unint64_t)(a5 - 1) >= 3)
    v13 = 0;
  else
    v13 = a5;
  v14 = -[CCSQLiteDatabase initWithPath:accessPermission:threadingMode:dataProtectionClass:databaseOptions:](v11, "initWithPath:accessPermission:threadingMode:dataProtectionClass:databaseOptions:", v12, v13, 3, v7, 3);

  v15 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithDatabase:accessAssertion:", v14, v9);
  return v15;
}

- (CCDatabaseConnection)initWithDatabase:(id)a3 accessAssertion:(id)a4
{
  id v7;
  id v8;
  CCDatabaseConnection *v9;
  CCDatabaseConnection *v10;
  CCDatabaseConnection *v11;
  NSObject *v12;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)CCDatabaseConnection;
  v9 = -[CCDatabaseConnection init](&v14, sel_init);
  v10 = v9;
  if (v9
    && (v9->_inTransaction = 0,
        objc_storeStrong((id *)&v9->_db, a3),
        objc_storeStrong((id *)&v10->_accessAssertion, a4),
        !v10->_db))
  {
    __biome_log_for_category();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[CCDatabaseConnection initWithDatabase:accessAssertion:].cold.1();

    v11 = 0;
  }
  else
  {
    v11 = v10;
  }

  return v11;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessAssertion, 0);
  objc_storeStrong((id *)&self->_db, 0);
}

- (BOOL)commitTransactionWithError:(id *)a3
{
  NSObject *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x24BDAC8D0];
  if (self->_inTransaction)
  {
    __biome_log_for_category();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      -[CCDatabaseConnection commitTransactionWithError:].cold.1();

    v6 = -[CCDatabase commitTransactionWithError:](self->_db, "commitTransactionWithError:", a3);
    if (v6)
    {
      self->_inTransaction = 0;
      LOBYTE(v6) = 1;
    }
  }
  else
  {
    v7 = (void *)MEMORY[0x24BDD1540];
    v11 = *MEMORY[0x24BDD0BA0];
    v12[0] = CFSTR("Attempted to commit transaction when none are active");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "errorWithDomain:code:userInfo:", CFSTR("com.apple.CascadeSets.CCDatabase"), 12, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    CCSetError(a3, v9);

    LOBYTE(v6) = 0;
  }
  return v6;
}

- (CCDatabaseConnection)init
{
  id v2;

  objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB0], CFSTR("init unsupported"), MEMORY[0x24BDBD1B8]);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

+ (id)readOnlyConnectionToDatabaseAtURL:(id)a3 accessAssertion:(id)a4
{
  id v5;
  id v6;
  void *v7;

  v5 = a4;
  v6 = a3;
  objc_msgSend((id)objc_opt_class(), "connectionToDatabaseAtURL:dataProtectionClass:openMode:accessAssertion:", v6, 0, 1, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BOOL)prepareWithError:(id *)a3
{
  NSObject *v6;

  if (-[CCDatabaseConnection _createTableWithRecordClass:error:](self, "_createTableWithRecordClass:error:", objc_opt_class(), a3)&& -[CCDatabaseConnection _createTableWithRecordClass:error:](self, "_createTableWithRecordClass:error:", objc_opt_class(), a3)&& -[CCDatabaseConnection _createTableWithRecordClass:error:](self, "_createTableWithRecordClass:error:", objc_opt_class(), a3)&& -[CCDatabaseConnection _createTableWithRecordClass:error:](self, "_createTableWithRecordClass:error:", objc_opt_class(), a3)
    && -[CCDatabaseConnection _createTableWithRecordClass:error:](self, "_createTableWithRecordClass:error:", objc_opt_class(), a3)&& -[CCDatabaseConnection _createTableWithRecordClass:error:](self, "_createTableWithRecordClass:error:", objc_opt_class(), a3))
  {
    return 1;
  }
  __biome_log_for_category();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    -[CCDatabaseConnection prepareWithError:].cold.1();

  return 0;
}

- (BOOL)_createTableWithRecordClass:(Class)a3 error:(id *)a4
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  BOOL v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[objc_class genSQLCreateStatements](a3, "genSQLCreateStatements", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        if (!-[CCDatabase executeCommandString:error:](self->_db, "executeCommandString:error:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i), a4))
        {
          v11 = 0;
          goto LABEL_11;
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v8)
        continue;
      break;
    }
  }
  v11 = 1;
LABEL_11:

  return v11;
}

- (BOOL)rollbackTransactionWithError:(id *)a3
{
  NSObject *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x24BDAC8D0];
  if (self->_inTransaction)
  {
    __biome_log_for_category();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      -[CCDatabaseConnection rollbackTransactionWithError:].cold.1();

    v6 = -[CCDatabase rollbackTransactionWithError:](self->_db, "rollbackTransactionWithError:", a3);
    if (v6)
    {
      self->_inTransaction = 0;
      LOBYTE(v6) = 1;
    }
  }
  else
  {
    v7 = (void *)MEMORY[0x24BDD1540];
    v11 = *MEMORY[0x24BDD0BA0];
    v12[0] = CFSTR("Attempted to rollback transaction when none are active");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "errorWithDomain:code:userInfo:", CFSTR("com.apple.CascadeSets.CCDatabase"), 13, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    CCSetError(a3, v9);

    LOBYTE(v6) = 0;
  }
  return v6;
}

- (BOOL)cleanup:(id *)a3
{
  void *v4;
  void *v5;
  void *v6;
  NSObject *v9;
  uint64_t v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x24BDAC8D0];
  if (self->_inTransaction)
  {
    v4 = (void *)MEMORY[0x24BDD1540];
    v10 = *MEMORY[0x24BDD0BA0];
    v11[0] = CFSTR("Attempted to cleanup while transaction is active");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "errorWithDomain:code:userInfo:", CFSTR("com.apple.CascadeSets.CCDatabase"), 16, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    CCSetError(a3, v6);

    return 0;
  }
  else
  {
    __biome_log_for_category();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      -[CCDatabaseConnection cleanup:].cold.1();

    return -[CCDatabase cleanup:](self->_db, "cleanup:", a3);
  }
}

- (BOOL)executeCommand:(id)a3 error:(id *)a4 returningRow:(id *)a5
{
  void *v7;
  void *v8;
  CCDatabaseValueRow *v9;
  void *v10;
  void *v11;
  CCDatabaseValueRow *v12;

  -[CCDatabase executeCommand:options:](self->_db, "executeCommand:options:", a3, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "error");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    CCSetError(a4, v8);
  }
  else
  {
    v9 = [CCDatabaseValueRow alloc];
    objc_msgSend(v7, "rowValueTuples");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "firstObject");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[CCDatabaseValueRow initWithDatabaseValueArray:](v9, "initWithDatabaseValueArray:", v11);

    if (a5)
      *a5 = objc_retainAutorelease(v12);

  }
  return v8 == 0;
}

- (id)enumeratorForRowResultsOfSelect:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  CCDatabaseValueRowEnumerator *v11;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[CCDatabase enumerateCommand:options:](self->_db, "enumerateCommand:options:", v6, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "error");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v8)
    {
      v11 = -[CCDatabaseValueRowEnumerator initWithEnumerationResult:]([CCDatabaseValueRowEnumerator alloc], "initWithEnumerationResult:", v7);
      goto LABEL_8;
    }
    CCSetError(a4, v8);
    __biome_log_for_category();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v6, "commandString");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "parameters");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[CCDatabase path](self->_db, "path");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138413058;
      v17 = v13;
      v18 = 2112;
      v19 = v14;
      v20 = 2112;
      v21 = v15;
      v22 = 2112;
      v23 = v8;
      _os_log_error_impl(&dword_237B25000, v9, OS_LOG_TYPE_ERROR, "Could not execute command=%@ with parameters=%@ in database file at %@, err=%@", (uint8_t *)&v16, 0x2Au);

    }
  }
  else
  {
    v10 = (void *)MEMORY[0x24BDD1540];
    v24 = *MEMORY[0x24BDD0BA0];
    v25[0] = CFSTR("Could not execute non-select command on read-only database connection");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v25, &v24, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "errorWithDomain:code:userInfo:", CFSTR("com.apple.CascadeSets.CCDatabase"), 14, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    CCSetError(a4, v8);
  }
  v11 = 0;
LABEL_8:

  return v11;
}

- (int)rowsModified:(id *)a3
{
  return -[CCDatabase rowsModified:](self->_db, "rowsModified:", a3);
}

- (void)initWithDatabase:accessAssertion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_237B25000, v0, v1, "Cannot create connection with nil database.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_0();
}

- (void)prepareWithError:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_237B25000, v0, v1, "Failed to create table on prepare operation.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_0();
}

- (void)beginTransactionWithError:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_3(&dword_237B25000, v0, v1, "Beginning transaction", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_0();
}

- (void)commitTransactionWithError:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_3(&dword_237B25000, v0, v1, "Committing transaction.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_0();
}

- (void)rollbackTransactionWithError:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_3(&dword_237B25000, v0, v1, "Rolling back transaction.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_0();
}

- (void)cleanup:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_3(&dword_237B25000, v0, v1, "Cleaning database.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_0();
}

@end
