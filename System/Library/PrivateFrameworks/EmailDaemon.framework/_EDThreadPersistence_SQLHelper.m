@implementation _EDThreadPersistence_SQLHelper

- (_EDThreadPersistence_SQLHelper)initWithCache:(id)a3
{
  id v5;
  _EDThreadPersistence_SQLHelper *v6;
  uint64_t v7;
  EDPersistenceDatabaseConnection *connection;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_EDThreadPersistence_SQLHelper;
  v6 = -[_EDThreadPersistence_SQLHelper init](&v10, sel_init);
  if (v6)
  {
    objc_msgSend(v5, "connection");
    v7 = objc_claimAutoreleasedReturnValue();
    connection = v6->_connection;
    v6->_connection = (EDPersistenceDatabaseConnection *)v7;

    objc_storeStrong((id *)&v6->_cache, a3);
  }

  return v6;
}

- (int64_t)executeUpdateSQL:(id)a3 bindings:(id)a4 errorHandler:(id)a5
{
  id v8;
  void (**v9)(id, void *);
  void (**v10)(id, id);
  void *v11;
  void *v12;
  void *v13;
  char v14;
  id v15;
  int64_t v16;
  id v18;
  uint64_t v19;

  v8 = a3;
  v9 = (void (**)(id, void *))a4;
  v10 = (void (**)(id, id))a5;
  -[_EDThreadPersistence_SQLHelper cache](self, "cache");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "preparedStatementForQueryString:", v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
    __assert_rtn("-[_EDThreadPersistence_SQLHelper executeUpdateSQL:bindings:errorHandler:]", "EDThreadPersistence_ThreadMessages.m", 1281, "statement");
  v19 = 0;
  createBindingsDictionary();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v9[2](v9, v13);
  v18 = 0;
  v14 = objc_msgSend(v12, "executeWithNamedBindings:rowsChanged:error:", v13, &v19, &v18);
  v15 = v18;
  if ((v14 & 1) != 0)
  {
    if (v19)
      v16 = 2;
    else
      v16 = 1;
  }
  else
  {
    v10[2](v10, v15);
    v16 = 0;
  }

  return v16;
}

- (int64_t)executeUpsertSQL:(id)a3 bindings:(id)a4 errorHandler:(id)a5
{
  id v8;
  void (**v9)(id, void *);
  void (**v10)(id, id);
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  id v17;
  void *v18;
  int64_t v19;
  id v21;
  uint64_t v22;

  v8 = a3;
  v9 = (void (**)(id, void *))a4;
  v10 = (void (**)(id, id))a5;
  -[_EDThreadPersistence_SQLHelper cache](self, "cache");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "preparedStatementForQueryString:", v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
    __assert_rtn("-[_EDThreadPersistence_SQLHelper executeUpsertSQL:bindings:errorHandler:]", "EDThreadPersistence_ThreadMessages.m", 1299, "statement");
  -[_EDThreadPersistence_SQLHelper connection](self, "connection");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "clearLastInsertedDatabaseID");

  -[_EDThreadPersistence_SQLHelper connection](self, "connection");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v14, "lastInsertedDatabaseID"))
    __assert_rtn("-[_EDThreadPersistence_SQLHelper executeUpsertSQL:bindings:errorHandler:]", "EDThreadPersistence_ThreadMessages.m", 1304, "self.connection.lastInsertedDatabaseID == 0");

  v22 = 0;
  createBindingsDictionary();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v9[2](v9, v15);
  v21 = 0;
  v16 = objc_msgSend(v12, "executeWithNamedBindings:rowsChanged:error:", v15, &v22, &v21);
  v17 = v21;
  if ((v16 & 1) != 0)
  {
    -[_EDThreadPersistence_SQLHelper connection](self, "connection");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "lastInsertedDatabaseID");

  }
  else
  {
    v10[2](v10, v17);
    v19 = *MEMORY[0x1E0D1DC08];
  }

  return v19;
}

- (BOOL)executeSelectSQL:(id)a3 bindings:(id)a4 errorHandler:(id)a5 rowHandler:(id)a6
{
  id v10;
  void (**v11)(id, void *);
  void (**v12)(id, id);
  id v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  id v18;
  id v20;

  v10 = a3;
  v11 = (void (**)(id, void *))a4;
  v12 = (void (**)(id, id))a5;
  v13 = a6;
  -[_EDThreadPersistence_SQLHelper cache](self, "cache");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "preparedStatementForQueryString:", v10);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v15)
    __assert_rtn("-[_EDThreadPersistence_SQLHelper executeSelectSQL:bindings:errorHandler:rowHandler:]", "EDThreadPersistence_ThreadMessages.m", 1321, "statement");
  createBindingsDictionary();
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v11[2](v11, v16);
  v20 = 0;
  v17 = objc_msgSend(v15, "executeWithNamedBindings:usingBlock:error:", v16, v13, &v20);
  v18 = v20;
  if ((v17 & 1) == 0)
    v12[2](v12, v18);

  return v17;
}

- (BOOL)executeSQL:(id)a3 indexBindings:(id)a4 errorHandler:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, id);
  void *v11;
  void *v12;
  char v13;
  id v14;
  id v16;

  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, id))a5;
  -[_EDThreadPersistence_SQLHelper cache](self, "cache");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "preparedStatementForQueryString:", v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
    __assert_rtn("-[_EDThreadPersistence_SQLHelper executeSQL:indexBindings:errorHandler:]", "EDThreadPersistence_ThreadMessages.m", 1336, "statement");
  v16 = 0;
  v13 = objc_msgSend(v12, "executeWithIndexedBindings:usingBlock:error:", v9, &__block_literal_global_355, &v16);
  v14 = v16;
  if ((v13 & 1) == 0)
    v10[2](v10, v14);

  return v13;
}

- (BOOL)executeSQL:(id)a3 errorHandler:(id)a4
{
  id v6;
  void (**v7)(id, id);
  void *v8;
  void *v9;
  char v10;
  id v11;
  id v13;

  v6 = a3;
  v7 = (void (**)(id, id))a4;
  -[_EDThreadPersistence_SQLHelper cache](self, "cache");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "preparedStatementForQueryString:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
    __assert_rtn("-[_EDThreadPersistence_SQLHelper executeSQL:errorHandler:]", "EDThreadPersistence_ThreadMessages.m", 1347, "statement");
  v13 = 0;
  v10 = objc_msgSend(v9, "executeUsingBlock:error:", &__block_literal_global_356, &v13);
  v11 = v13;
  if ((v10 & 1) == 0)
    v7[2](v7, v11);

  return v10;
}

- (EDPersistenceDatabaseConnection)connection
{
  return self->_connection;
}

- (_EDThreadPersistence_StatementCache)cache
{
  return self->_cache;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cache, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

@end
