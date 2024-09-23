@implementation _EDThreadPersistence_ThreadScope

- (_EDThreadPersistence_ThreadScope)initWithCache:(id)a3 messagePersistence:(id)a4 threadScopeDatabaseID:(int64_t)a5 threadScopeExpression:(id)a6
{
  id v10;
  id v11;
  id v12;
  _EDThreadPersistence_ThreadScope *v13;
  _EDThreadPersistence_SQLHelper *v14;
  _EDThreadPersistence_SQLHelper *sqlHelper;
  objc_super v17;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  v17.receiver = self;
  v17.super_class = (Class)_EDThreadPersistence_ThreadScope;
  v13 = -[_EDThreadPersistence_ThreadScope init](&v17, sel_init);
  if (v13)
  {
    v14 = -[_EDThreadPersistence_SQLHelper initWithCache:]([_EDThreadPersistence_SQLHelper alloc], "initWithCache:", v10);
    sqlHelper = v13->_sqlHelper;
    v13->_sqlHelper = v14;

    objc_storeStrong((id *)&v13->_messagePersistence, a4);
    v13->_threadScopeDatabaseID = a5;
    objc_storeStrong((id *)&v13->_threadScopeExpression, a6);
  }

  return v13;
}

- (id)createMessagesWithThreadObjectID:(id)a3 wrappedMessages:(id)a4
{
  id v6;
  id v7;
  _EDThreadPersistence_ThreadMessages *v8;
  void *v9;
  void *v10;
  _EDThreadPersistence_ThreadMessages *v11;

  v6 = a3;
  v7 = a4;
  -[_EDThreadPersistence_ThreadScope _ensureTempScopeView](self, "_ensureTempScopeView");
  v8 = [_EDThreadPersistence_ThreadMessages alloc];
  -[_EDThreadPersistence_ThreadScope sqlHelper](self, "sqlHelper");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[_EDThreadPersistence_ThreadScope messagePersistence](self, "messagePersistence");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[_EDThreadPersistence_ThreadMessages initWithSQLHelper:messagePersistence:threadScopeDatabaseID:threadObjectID:wrappedMessages:](v8, "initWithSQLHelper:messagePersistence:threadScopeDatabaseID:threadObjectID:wrappedMessages:", v9, v10, -[_EDThreadPersistence_ThreadScope threadScopeDatabaseID](self, "threadScopeDatabaseID"), v6, v7);

  return v11;
}

- (void)_ensureTempScopeView
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;

  if (!self->_didCreateTempScopeView)
  {
    self->_didCreateTempScopeView = 1;
    v3 = (void *)MEMORY[0x1D824B334]();
    -[_EDThreadPersistence_ThreadScope dropTemporaryView](self, "dropTemporaryView");
    v4 = (void *)MEMORY[0x1E0CB3940];
    -[_EDThreadPersistence_ThreadScope threadScopeExpression](self, "threadScopeExpression");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "ef_SQLExpression");
    v6 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", CFSTR("CREATE TEMP VIEW temp_thread_scope_message AS SELECT * FROM messages WHERE %@;"),
      v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    -[_EDThreadPersistence_ThreadScope sqlHelper](self, "sqlHelper");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "connection");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v6) = objc_msgSend(v9, "executeStatementString:errorMessage:", v7, CFSTR("CREATE TEMP VIEW"));

    if ((v6 & 1) == 0)
      __assert_rtn("-[_EDThreadPersistence_ThreadScope _ensureTempScopeView]", "EDThreadPersistence_ThreadMessages.m", 1162, "success");

    objc_autoreleasePoolPop(v3);
  }
}

- (void)dropTemporaryView
{
  __assert_rtn("-[_EDThreadPersistence_ThreadScope dropTemporaryView]", "EDThreadPersistence_ThreadMessages.m", 1171, "success");
}

- (EDMessagePersistence)messagePersistence
{
  return self->_messagePersistence;
}

- (int64_t)threadScopeDatabaseID
{
  return self->_threadScopeDatabaseID;
}

- (EFSQLExpressable)threadScopeExpression
{
  return self->_threadScopeExpression;
}

- (_EDThreadPersistence_SQLHelper)sqlHelper
{
  return self->_sqlHelper;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sqlHelper, 0);
  objc_storeStrong((id *)&self->_threadScopeExpression, 0);
  objc_storeStrong((id *)&self->_messagePersistence, 0);
}

@end
