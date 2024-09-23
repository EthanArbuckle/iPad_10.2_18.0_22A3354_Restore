@implementation EFSQLPreparedStatement

- (BOOL)executeUsingBlock:(id)a3 error:(id *)a4
{
  void (**v5)(id, EFSQLRow *, uint64_t, char *);
  EFSQLPreparedStatement *v6;
  sqlite3_stmt *v7;
  double Current;
  uint64_t v9;
  double v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  sqlite3 *v14;
  double v15;
  void *v16;
  double v17;
  NSObject *v18;
  NSObject *v19;
  uint64_t v20;
  NSObject *v21;
  void *v22;
  sqlite3 *v23;
  id v24;
  uint64_t v25;
  NSObject *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  const unsigned __int8 *v30;
  id v31;
  void *v32;
  NSObject *v33;
  NSObject *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  BOOL v39;
  double allowedExecutionTime;
  id v42;
  EFSQLRow *v44;
  sqlite3_stmt *ppStmt;
  char v46;
  uint8_t buf[4];
  EFSQLPreparedStatement *v48;
  __int16 v49;
  void *v50;
  uint8_t v51[4];
  double v52;
  __int16 v53;
  double v54;
  __int16 v55;
  void *v56;
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v5 = (void (**)(id, EFSQLRow *, uint64_t, char *))a3;
  v6 = objc_retainAutorelease(self);
  v7 = -[EFSQLPreparedStatement compiled](v6, "compiled");
  Current = CFAbsoluteTimeGetCurrent();
  v9 = 0;
  v44 = 0;
  v46 = 0;
  v10 = 0.0;
  while (1)
  {
    v11 = sqlite3_step(v7);
    v12 = v11;
    if ((_DWORD)v11 != 100)
      break;
    if (v5)
    {
      if (!v44)
        v44 = -[EFSQLRow initWithPreparedStatement:]([EFSQLRow alloc], "initWithPreparedStatement:", v6);
      v13 = (void *)MEMORY[0x1B5E15A60]();
      v5[2](v5, v44, v9, &v46);
      objc_autoreleasePoolPop(v13);
      if (!v9)
        v10 = CFAbsoluteTimeGetCurrent() - Current;
      if (v46)
      {
        v12 = 100;
        goto LABEL_13;
      }
      ++v9;
    }
  }
  if ((_DWORD)v11 && (_DWORD)v11 != 101)
  {
    v14 = sqlite3_db_handle(v7);
    v12 = sqlite3_extended_errcode(v14);
  }
LABEL_13:
  v15 = CFAbsoluteTimeGetCurrent();
  -[EFSQLPreparedStatement originalString](v6, "originalString");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v15 - Current;
  if (EFSQLVerboseDebugLoggingEnabled())
  {
    +[EFSQLPreparedStatement log](EFSQLPreparedStatement, "log");
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      -[EFSQLPreparedStatement executeUsingBlock:error:].cold.5((uint64_t)v16, v18, v17);

  }
  if (v17 > v6->_allowedExecutionTime)
  {
    +[EFSQLPreparedStatement log](EFSQLPreparedStatement, "log");
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      allowedExecutionTime = v6->_allowedExecutionTime;
      *(_DWORD *)v51 = 134218498;
      v52 = allowedExecutionTime;
      v53 = 2048;
      v54 = v17;
      v55 = 2112;
      v56 = v16;
      _os_log_error_impl(&dword_1B106E000, v19, OS_LOG_TYPE_ERROR, "Query execution exceeded threshold of %.02f seconds - Took %0.05f seconds for query %@", v51, 0x20u);
    }

    if (v17 > 2.0 && (_DWORD)v12 == 101)
    {
      v20 = objc_msgSend(v16, "rangeOfString:", CFSTR("WHERE"));
      if (v20 == 0x7FFFFFFFFFFFFFFFLL)
      {
        +[EFSQLPreparedStatement log](EFSQLPreparedStatement, "log");
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
          -[EFSQLPreparedStatement executeUsingBlock:error:].cold.3((uint64_t)v6, (uint64_t)v16, v21);
      }
      else
      {
        +[EFSQLPreparedStatement log](EFSQLPreparedStatement, "log");
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(v16, "substringFromIndex:", v20);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          -[EFSQLPreparedStatement executeUsingBlock:error:].cold.4((uint64_t)v6, v22, (uint64_t)v51, v21);
        }
      }

      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("EXPLAIN QUERY PLAN %@"), v16);
      v42 = (id)objc_claimAutoreleasedReturnValue();
      v23 = sqlite3_db_handle(v7);
      ppStmt = 0;
      v24 = objc_retainAutorelease(v42);
      v25 = sqlite3_prepare_v2(v23, (const char *)objc_msgSend(v24, "UTF8String"), -1, &ppStmt, 0);
      if ((_DWORD)v25)
      {
        +[EFSQLPreparedStatement log](EFSQLPreparedStatement, "log");
        v26 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(MEMORY[0x1E0CB35C8], "ef_SQLiteErrorWithCode:", v25);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          -[EFSQLPreparedStatement executeUsingBlock:error:].cold.1(v27, (uint64_t)buf, v26);
        }

      }
      else
      {
        while (1)
        {
          v28 = sqlite3_step(ppStmt);
          v29 = v28;
          if ((_DWORD)v28 != 100)
            break;
          v30 = sqlite3_column_text(ppStmt, 3);
          v31 = objc_alloc(MEMORY[0x1E0CB3940]);
          v32 = (void *)objc_msgSend(v31, "initWithBytes:length:encoding:", v30, sqlite3_column_bytes(ppStmt, 3), 4);
          +[EFSQLPreparedStatement log](EFSQLPreparedStatement, "log");
          v33 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 134218242;
            v48 = v6;
            v49 = 2112;
            v50 = v32;
            _os_log_error_impl(&dword_1B106E000, v33, OS_LOG_TYPE_ERROR, "%p: %@", buf, 0x16u);
          }

        }
        if ((_DWORD)v28 && (_DWORD)v28 != 101)
        {
          +[EFSQLPreparedStatement log](EFSQLPreparedStatement, "log");
          v34 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend(MEMORY[0x1E0CB35C8], "ef_SQLiteErrorWithCode:", v29);
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            -[EFSQLPreparedStatement executeUsingBlock:error:].cold.1(v35, (uint64_t)buf, v34);
          }

        }
        sqlite3_finalize(ppStmt);
      }

    }
  }
  -[EFSQLPreparedStatement queryLogger](v6, "queryLogger");
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  if (v36)
  {
    -[EFSQLPreparedStatement queryLogger](v6, "queryLogger");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[EFSQLPreparedStatement transactionLabel](v6, "transactionLabel");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "logQueryString:label:firstRowExecutionTimeInNanoseconds:totalExecutionTimeInNanoseconds:numberOfRows:", v16, v38, (unint64_t)(v10 * 1000000000.0), (unint64_t)(v17 * 1000000000.0), v9 + 1);

  }
  -[EFSQLPreparedStatement clearBindingsWithError:](v6, "clearBindingsWithError:", 0);
  -[EFSQLPreparedStatement resetWithError:](v6, "resetWithError:", 0);
  v39 = +[EFSQLConnection isSuccessResultCode:forStep:error:](EFSQLConnection, "isSuccessResultCode:forStep:error:", v12, 1, a4);

  return v39;
}

- (BOOL)resetWithError:(id *)a3
{
  return +[EFSQLConnection isSuccessResultCode:forStep:error:](EFSQLConnection, "isSuccessResultCode:forStep:error:", sqlite3_reset(-[EFSQLPreparedStatement compiled](objc_retainAutorelease(self), "compiled")), 0, a3);
}

- (sqlite3_stmt)compiled
{
  void *v5;
  objc_class *v6;
  void *v7;

  if (-[EFSQLPreparedStatement isFinalized](self, "isFinalized"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EFSQLPreparedStatement.m"), 64, CFSTR("%@ has already been finalized"), v7);

  }
  return self->_compiled;
}

- (BOOL)isFinalized
{
  return self->_compiled == 0;
}

- (EFSQLQueryLogging)queryLogger
{
  return self->_queryLogger;
}

- (NSString)originalString
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", sqlite3_sql(-[EFSQLPreparedStatement compiled](objc_retainAutorelease(self), "compiled")));
}

- (BOOL)clearBindingsWithError:(id *)a3
{
  return +[EFSQLConnection isSuccessResultCode:forStep:error:](EFSQLConnection, "isSuccessResultCode:forStep:error:", sqlite3_clear_bindings(-[EFSQLPreparedStatement compiled](objc_retainAutorelease(self), "compiled")), 0, a3);
}

+ (id)log
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __29__EFSQLPreparedStatement_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_8 != -1)
    dispatch_once(&log_onceToken_8, block);
  return (id)log_log_8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transactionLabel, 0);
  objc_storeStrong((id *)&self->_queryLogger, 0);
}

void __68__EFSQLPreparedStatement_executeWithNamedBindings_usingBlock_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;

  v6 = a2;
  objc_msgSend(a3, "ef_SQLBinding");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bindToStatement:usingName:", *(_QWORD *)(a1 + 32), v6);

}

- (EFSQLPreparedStatement)initWithString:(id)a3 connection:(id)a4 transactionLabel:(id)a5 queryLogger:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  EFSQLPreparedStatement *v14;
  EFSQLPreparedStatement *v15;
  sqlite3 *v16;
  id v17;
  NSObject *v18;
  const char *v19;
  objc_super v21;
  size_t v22;
  _BYTE v23[32];
  _DWORD __b[162];
  int v25[2];
  int v26;
  pid_t v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v21.receiver = self;
  v21.super_class = (Class)EFSQLPreparedStatement;
  v14 = -[EFSQLPreparedStatement init](&v21, sel_init);
  v15 = v14;
  if (v14)
  {
    v14->_allowedExecutionTime = 2.0;
    objc_storeStrong((id *)&v14->_queryLogger, a6);
    objc_storeStrong((id *)&v15->_transactionLabel, a5);
    v16 = (sqlite3 *)objc_msgSend(v11, "sqlDB");
    v17 = objc_retainAutorelease(v10);
    if (sqlite3_prepare_v2(v16, (const char *)objc_msgSend(v17, "UTF8String"), -1, &v15->_compiled, 0))
    {
      +[EFSQLPreparedStatement log](EFSQLPreparedStatement, "log");
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        v19 = sqlite3_errmsg((sqlite3 *)objc_msgSend(v11, "sqlDB"));
        -[EFSQLPreparedStatement initWithString:connection:transactionLabel:queryLogger:].cold.1((uint64_t)v19, (uint64_t)v23, (uint64_t)v17, v18);
      }

      memset(__b, 170, sizeof(__b));
      __b[8] = 0;
      *(_QWORD *)v25 = 0xE00000001;
      v26 = 1;
      v27 = getpid();
      v22 = 648;
      if (!sysctl(v25, 4u, __b, &v22, 0, 0) && (__b[8] & 0x800) != 0)
        __debugbreak();

      v15 = 0;
    }
  }

  return v15;
}

- (void)dealloc
{
  objc_super v3;

  -[EFSQLPreparedStatement finalizeWithError:](self, "finalizeWithError:", 0);
  v3.receiver = self;
  v3.super_class = (Class)EFSQLPreparedStatement;
  -[EFSQLPreparedStatement dealloc](&v3, sel_dealloc);
}

- (BOOL)finalizeWithError:(id *)a3
{
  BOOL result;

  result = +[EFSQLConnection isSuccessResultCode:forStep:error:](EFSQLConnection, "isSuccessResultCode:forStep:error:", sqlite3_finalize(self->_compiled), 0, a3);
  self->_compiled = 0;
  return result;
}

- (BOOL)executeWithIndexedBindings:(id)a3 usingBlock:(id)a4 error:(id *)a5
{
  id v8;
  _QWORD v10[5];

  v8 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __70__EFSQLPreparedStatement_executeWithIndexedBindings_usingBlock_error___block_invoke;
  v10[3] = &unk_1E62A7278;
  v10[4] = self;
  objc_msgSend(a3, "enumerateObjectsUsingBlock:", v10);
  LOBYTE(a5) = -[EFSQLPreparedStatement executeUsingBlock:error:](self, "executeUsingBlock:error:", v8, a5);

  return (char)a5;
}

- (BOOL)executeWithNamedBindings:(id)a3 usingBlock:(id)a4 error:(id *)a5
{
  id v8;
  _QWORD v10[5];

  v8 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __68__EFSQLPreparedStatement_executeWithNamedBindings_usingBlock_error___block_invoke;
  v10[3] = &unk_1E62A7230;
  v10[4] = self;
  objc_msgSend(a3, "enumerateKeysAndObjectsUsingBlock:", v10);
  LOBYTE(a5) = -[EFSQLPreparedStatement executeUsingBlock:error:](self, "executeUsingBlock:error:", v8, a5);

  return (char)a5;
}

void __70__EFSQLPreparedStatement_executeWithIndexedBindings_usingBlock_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;

  objc_msgSend(a2, "ef_SQLBinding");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bindToStatement:usingIndex:", *(_QWORD *)(a1 + 32), a3);

}

void __29__EFSQLPreparedStatement_log__block_invoke(uint64_t a1)
{
  os_log_t v1;
  void *v2;
  id v3;

  NSStringFromClass(*(Class *)(a1 + 32));
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v1 = os_log_create("com.apple.email", (const char *)objc_msgSend(v3, "UTF8String"));
  v2 = (void *)log_log_8;
  log_log_8 = (uint64_t)v1;

}

- (id)debugDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)EFSQLPreparedStatement;
  -[EFSQLPreparedStatement debugDescription](&v8, sel_debugDescription);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[EFSQLPreparedStatement originalString](self, "originalString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)executeWithNamedBindings:(id)a3 rowsChanged:(unint64_t *)a4 error:(id *)a5
{
  BOOL v8;
  char v9;
  sqlite3 *v10;
  _QWORD v12[5];

  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __69__EFSQLPreparedStatement_executeWithNamedBindings_rowsChanged_error___block_invoke;
  v12[3] = &unk_1E62A7230;
  v12[4] = self;
  objc_msgSend(a3, "enumerateKeysAndObjectsUsingBlock:", v12);
  v8 = -[EFSQLPreparedStatement executeUsingBlock:error:](self, "executeUsingBlock:error:", &__block_literal_global_33, a5);
  v9 = !v8;
  if (!a4)
    v9 = 1;
  if ((v9 & 1) == 0)
  {
    v10 = sqlite3_db_handle(-[EFSQLPreparedStatement compiled](objc_retainAutorelease(self), "compiled"));
    *a4 = sqlite3_changes(v10);
  }
  return v8;
}

void __69__EFSQLPreparedStatement_executeWithNamedBindings_rowsChanged_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;

  v6 = a2;
  objc_msgSend(a3, "ef_SQLBinding");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bindToStatement:usingName:", *(_QWORD *)(a1 + 32), v6);

}

- (double)allowedExecutionTime
{
  return self->_allowedExecutionTime;
}

- (void)setAllowedExecutionTime:(double)a3
{
  self->_allowedExecutionTime = a3;
}

- (void)setQueryLogger:(id)a3
{
  objc_storeStrong((id *)&self->_queryLogger, a3);
}

- (NSString)transactionLabel
{
  return self->_transactionLabel;
}

- (void)setTransactionLabel:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void)initWithString:(uint64_t)a1 connection:(uint64_t)a2 transactionLabel:(uint64_t)a3 queryLogger:(NSObject *)a4 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, NSObject *a4)
{
  *(_DWORD *)a2 = 138412546;
  *(_QWORD *)(a2 + 4) = a3;
  *(_WORD *)(a2 + 12) = 2082;
  *(_QWORD *)(a2 + 14) = a1;
  OUTLINED_FUNCTION_0_2(&dword_1B106E000, a4, a3, "Unable to prepare statement '%@': %{public}s", (uint8_t *)a2);
}

- (void)executeUsingBlock:(NSObject *)a3 error:.cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 138412290;
  *(_QWORD *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_1_2(&dword_1B106E000, a2, a3, "Got error %@ preparing EXPLAIN QUERY PLAN", (uint8_t *)a2);

  OUTLINED_FUNCTION_3();
}

- (void)executeUsingBlock:(NSObject *)a3 error:.cold.3(uint64_t a1, uint64_t a2, NSObject *a3)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 134218242;
  v4 = a1;
  v5 = 2112;
  v6 = a2;
  OUTLINED_FUNCTION_0_2(&dword_1B106E000, a3, (uint64_t)a3, "%p QUERY PLAN for statement: %@", (uint8_t *)&v3);
}

- (void)executeUsingBlock:(uint64_t)a3 error:(NSObject *)a4 .cold.4(uint64_t a1, void *a2, uint64_t a3, NSObject *a4)
{
  *(_DWORD *)a3 = 134218242;
  *(_QWORD *)(a3 + 4) = a1;
  *(_WORD *)(a3 + 12) = 2112;
  *(_QWORD *)(a3 + 14) = a2;
  OUTLINED_FUNCTION_0_2(&dword_1B106E000, a4, a3, "%p QUERY PLAN for clause: %@", (uint8_t *)a3);

  OUTLINED_FUNCTION_3();
}

- (void)executeUsingBlock:(double)a3 error:.cold.5(uint64_t a1, NSObject *a2, double a3)
{
  int v3;
  double v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 134218242;
  v4 = a3;
  v5 = 2112;
  v6 = a1;
  _os_log_debug_impl(&dword_1B106E000, a2, OS_LOG_TYPE_DEBUG, "Execution took %0.05f seconds for query %@", (uint8_t *)&v3, 0x16u);
}

@end
