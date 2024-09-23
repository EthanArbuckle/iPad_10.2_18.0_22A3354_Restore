@implementation BSSqlitePreparedStatement

- (id)_initWithDatabaseConnection:(void *)a1
{
  id v3;
  void *v4;
  id *v5;
  id *v6;
  void *v8;
  objc_super v9;

  v3 = a2;
  v4 = v3;
  if (a1)
  {
    if (!v3)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", sel__initWithDatabaseConnection_, a1, CFSTR("BSSqlitePreparedStatement.m"), 68, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("connection"));

    }
    v9.receiver = a1;
    v9.super_class = (Class)BSSqlitePreparedStatement;
    v5 = (id *)objc_msgSendSuper2(&v9, sel_init);
    v6 = v5;
    if (v5)
      objc_storeWeak(v5 + 1, v4);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BSSqlitePreparedStatement)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BSSqlitePreparedStatement.m"), 76, CFSTR("init is not allowed"));

  return (BSSqlitePreparedStatement *)-[BSSqlitePreparedStatement _initWithDatabaseConnection:](self, 0);
}

- (void)dealloc
{
  objc_super v3;

  objc_storeWeak((id *)&self->_dbConnection, 0);
  v3.receiver = self;
  v3.super_class = (Class)BSSqlitePreparedStatement;
  -[BSSqlitePreparedStatement dealloc](&v3, sel_dealloc);
}

+ (id)_newPreparedStatementForDatabaseConnection:(void *)a3 withSQLQuery:
{
  id v4;
  id v5;
  uint64_t v6;
  id v7;
  id v8;
  id v9;
  void *v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  id v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v4 = a2;
  v5 = a3;
  v6 = objc_opt_self();
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", sel__newPreparedStatementForDatabaseConnection_withSQLQuery_, v6, CFSTR("BSSqlitePreparedStatement.m"), 87, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("connection"));

    if (v5)
      goto LABEL_3;
LABEL_5:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", sel__newPreparedStatementForDatabaseConnection_withSQLQuery_, v6, CFSTR("BSSqlitePreparedStatement.m"), 88, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("sqlQuery"));

    goto LABEL_3;
  }
  if (!v5)
    goto LABEL_5;
LABEL_3:
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy_;
  v21 = __Block_byref_object_dispose_;
  v22 = 0;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __85__BSSqlitePreparedStatement__newPreparedStatementForDatabaseConnection_withSQLQuery___block_invoke;
  v13[3] = &unk_1E1EBE728;
  v7 = v5;
  v14 = v7;
  v8 = v4;
  v15 = v8;
  v16 = &v17;
  -[BSSqliteDatabaseConnection performSyncWithDatabase:]((uint64_t)v8, (uint64_t)v13);
  v9 = (id)v18[5];

  _Block_object_dispose(&v17, 8);
  return v9;
}

void __85__BSSqlitePreparedStatement__newPreparedStatementForDatabaseConnection_withSQLQuery___block_invoke(uint64_t a1, sqlite3 *a2)
{
  char *v4;
  id v5;
  int v6;
  id v7;
  void *v8;
  _BSSqliteDeferredPreparedSimpleStatement *v9;
  id v10;
  id *v11;
  id *v12;
  id *v13;
  uint64_t v14;
  id v15;
  _BSSqlitePreparedSimpleStatement *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  _BSSqlitePreparedCompoundStatement *v21;
  id v22;
  id v23;
  uint64_t v24;
  NSArray *statements;
  uint64_t v26;
  char *pzTail;
  sqlite3_stmt *ppStmt;

  v4 = (char *)objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 32)), "UTF8String");
  pzTail = 0;
  ppStmt = 0;
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (!v4 || !*v4)
  {
LABEL_18:
    if (objc_msgSend(v5, "count") == 1)
    {
      objc_msgSend(v5, "objectAtIndex:", 0);
      v18 = objc_claimAutoreleasedReturnValue();
      v19 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v20 = *(void **)(v19 + 40);
      *(_QWORD *)(v19 + 40) = v18;
    }
    else
    {
      v21 = [_BSSqlitePreparedCompoundStatement alloc];
      v22 = *(id *)(a1 + 40);
      v23 = v5;
      if (v21)
      {
        v21 = (_BSSqlitePreparedCompoundStatement *)-[BSSqlitePreparedStatement _initWithDatabaseConnection:](v21, v22);
        if (v21)
        {
          v24 = objc_msgSend(v23, "copy");
          statements = v21->_statements;
          v21->_statements = (NSArray *)v24;

        }
      }

      v26 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v20 = *(void **)(v26 + 40);
      *(_QWORD *)(v26 + 40) = v21;
    }

    goto LABEL_25;
  }
  while (1)
  {
    v6 = strlen(v4);
    if (sqlite3_prepare_v2(a2, v4, v6, &ppStmt, (const char **)&pzTail))
      break;
    v16 = [_BSSqlitePreparedSimpleStatement alloc];
    v12 = -[_BSSqlitePreparedSimpleStatement _initWithDatabaseConnection:statement:]((id *)&v16->super.super.isa, *(void **)(a1 + 40), ppStmt);
    objc_msgSend(v5, "addObject:", v12);
LABEL_12:

    v4 = pzTail;
    if (!pzTail || !*pzTail)
      goto LABEL_18;
  }
  if (pzTail > v4)
  {
    v7 = objc_alloc(MEMORY[0x1E0CB3940]);
    v8 = (void *)objc_msgSend(v7, "initWithBytes:length:encoding:", v4, pzTail - v4, 4);
    v9 = [_BSSqliteDeferredPreparedSimpleStatement alloc];
    v10 = *(id *)(a1 + 40);
    v11 = v8;
    v12 = v11;
    if (v9)
    {
      if (!v11)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", sel_initWithDatabaseConnection_deferredSql_, v9, CFSTR("BSSqlitePreparedStatement.m"), 343, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("sql"));

      }
      v13 = -[_BSSqlitePreparedSimpleStatement _initWithDatabaseConnection:statement:]((id *)&v9->super.super.super.isa, v10, 0);
      if (v13)
      {
        v14 = objc_msgSend(v12, "copy");
        v15 = v13[3];
        v13[3] = (id)v14;

      }
    }
    else
    {
      v13 = 0;
    }

    objc_msgSend(v5, "addObject:", v13);
    goto LABEL_12;
  }
  if (!pzTail || !*pzTail)
    goto LABEL_18;
LABEL_25:

}

- (BOOL)executeWithBindings:(id)a3 resultRowHandler:(id)a4 error:(id *)a5
{
  void *v7;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3, a4, a5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BSSqlitePreparedStatement.m"), 136, CFSTR("Abstract class implementation should never be called"));

  return 0;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_dbConnection);
}

@end
