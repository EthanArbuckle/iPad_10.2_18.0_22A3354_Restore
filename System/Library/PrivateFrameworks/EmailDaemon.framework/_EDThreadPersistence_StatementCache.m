@implementation _EDThreadPersistence_StatementCache

- (_EDThreadPersistence_StatementCache)initWithConnection:(id)a3
{
  id v5;
  _EDThreadPersistence_StatementCache *v6;
  _EDThreadPersistence_StatementCache *v7;
  uint64_t v8;
  NSMutableDictionary *preparedStatements;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_EDThreadPersistence_StatementCache;
  v6 = -[_EDThreadPersistence_StatementCache init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_connection, a3);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v8 = objc_claimAutoreleasedReturnValue();
    preparedStatements = v7->_preparedStatements;
    v7->_preparedStatements = (NSMutableDictionary *)v8;

  }
  return v7;
}

- (id)preparedStatementForQueryString:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  -[_EDThreadPersistence_StatementCache preparedStatements](self, "preparedStatements");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    -[_EDThreadPersistence_StatementCache connection](self, "connection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "preparedStatementForQueryString:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
      __assert_rtn("-[_EDThreadPersistence_StatementCache preparedStatementForQueryString:]", "EDThreadPersistence_ThreadMessages.m", 1202, "statement");
    -[_EDThreadPersistence_StatementCache preparedStatements](self, "preparedStatements");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v6, v4);

  }
  return v6;
}

- (EDPersistenceDatabaseConnection)connection
{
  return self->_connection;
}

- (NSMutableDictionary)preparedStatements
{
  return self->_preparedStatements;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preparedStatements, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

@end
