@implementation ML3BulkStatementExecutionOperation

- (unint64_t)type
{
  return 2;
}

- (BOOL)_execute:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  id v12[5];

  v12[4] = *(id *)MEMORY[0x1E0C80C00];
  -[ML3DatabaseOperation attributes](self, "attributes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", CFSTR("MLDatabaseOperationAttributeStatementsKey"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ML3DatabaseOperation transaction](self, "transaction");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "connection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v12[0] = 0;
  LOBYTE(v7) = -[ML3BulkStatementExecutionOperation _executeStatements:onConnection:withError:](self, "_executeStatements:onConnection:withError:", v6, v8, v12);
  v9 = v12[0];

  v10 = objc_retainAutorelease(v9);
  *a3 = v10;

  return (char)v7;
}

- (BOOL)_executeStatements:(id)a3 onConnection:(id)a4 withError:(id *)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  id v19;
  BOOL v20;
  id *v22;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v10 = v8;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v11)
  {
    v12 = v11;
    v22 = a5;
    v13 = *(_QWORD *)v25;
    while (2)
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v25 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
        objc_msgSend(v15, "sql", v22);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "parameters");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = 0;
        v18 = objc_msgSend(v9, "executeUpdate:withParameters:error:", v16, v17, &v23);
        v19 = v23;

        if (v18)
          v20 = v19 == 0;
        else
          v20 = 0;
        if (!v20)
        {
          if (v22)
          {
            v19 = objc_retainAutorelease(v19);
            *v22 = v19;
          }
          goto LABEL_19;
        }
        if ((-[ML3BulkStatementExecutionOperation isCancelled](self, "isCancelled") & 1) != 0)
        {
          v19 = 0;
          LOBYTE(v18) = 0;
          goto LABEL_19;
        }
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      v19 = 0;
      LOBYTE(v18) = 1;
      if (v12)
        continue;
      break;
    }
  }
  else
  {
    v19 = 0;
    LOBYTE(v18) = 1;
  }
LABEL_19:

  return v18;
}

@end
