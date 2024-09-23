@implementation MSVSQLDatabase

- (id)resultsForStatement:(id)a3
{
  id v3;
  id *v4;

  v3 = a3;
  v4 = -[MSVSQLRowEnumerator initWithStatement:]((id *)[MSVSQLRowEnumerator alloc], v3);

  return v4;
}

- (NSString)description
{
  void *v3;
  uint64_t v4;
  _MSVSQLConnection *connection;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  connection = self->_connection;
  if (connection)
    connection = (_MSVSQLConnection *)connection->_databaseURI;
  return (NSString *)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p uri=%@>"), v4, self, connection);
}

- (MSVSQLDatabase)initWithURL:(id)a3 error:(id *)a4
{
  id v6;
  MSVSQLDatabase *v7;
  _MSVSQLConnection *v8;
  void *v9;
  char *v10;
  _MSVSQLConnection *connection;
  uint64_t v12;
  NSURL *databaseURL;
  MSVSQLDatabase *v14;

  v6 = a3;
  v7 = -[MSVSQLDatabase init](self, "init");
  if (v7)
  {
    v8 = [_MSVSQLConnection alloc];
    objc_msgSend(v6, "path");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[_MSVSQLConnection initWithDatabaseURI:options:error:]((char *)v8, v9, 0, a4);
    connection = v7->_connection;
    v7->_connection = (_MSVSQLConnection *)v10;

    if (!v7->_connection)
    {
      v14 = 0;
      goto LABEL_6;
    }
    v12 = objc_msgSend(v6, "copy");
    databaseURL = v7->_databaseURL;
    v7->_databaseURL = (NSURL *)v12;

  }
  v14 = v7;
LABEL_6:

  return v14;
}

- (id)transactionWithName:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  __CFString *v8;

  v6 = a3;
  -[_MSVSQLConnection mutableCloneWithError:](&self->_connection->super.isa, (uint64_t)a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
    v8 = -[MSVSQLDatabaseTransaction initWithConnection:name:error:]((__CFString *)[MSVSQLDatabaseTransaction alloc], v7, v6, a4);
  else
    v8 = 0;

  return v8;
}

- (MSVSQLDatabase)initWithMemory
{
  void *v3;
  void *v4;
  MSVSQLDatabase *v5;

  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "UUIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = -[MSVSQLDatabase initWithMemoryNamed:](self, "initWithMemoryNamed:", v4);
  return v5;
}

- (MSVSQLDatabase)initWithMemoryNamed:(id)a3
{
  id v4;
  MSVSQLDatabase *v5;
  void *v6;
  char *v7;
  _MSVSQLConnection *connection;

  v4 = a3;
  v5 = -[MSVSQLDatabase init](self, "init");
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("file:%@?mode=memory&cache=shared"), v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[_MSVSQLConnection initWithDatabaseURI:options:error:]((char *)[_MSVSQLConnection alloc], v6, 1, 0);
    connection = v5->_connection;
    v5->_connection = (_MSVSQLConnection *)v7;

  }
  return v5;
}

- (void)registerFunctionNamed:(id)a3 arguments:(int64_t)a4 options:(unint64_t)a5 block:(id)a6
{
  -[_MSVSQLConnection registerFunctionNamed:arguments:options:block:](self->_connection, "registerFunctionNamed:arguments:options:block:", a3, a4, a5, a6);
}

- (void)unregisterFunctionNamed:(id)a3 arguments:(int64_t)a4
{
  -[_MSVSQLConnection unregisterFunctionNamed:arguments:](self->_connection, "unregisterFunctionNamed:arguments:", a3, a4);
}

- (void)registerAggregateFunctionNamed:(id)a3 arguments:(int64_t)a4 options:(unint64_t)a5 start:(id)a6 add:(id)a7 remove:(id)a8 value:(id)a9
{
  -[_MSVSQLConnection registerAggregateFunctionNamed:arguments:options:start:add:remove:value:](self->_connection, "registerAggregateFunctionNamed:arguments:options:start:add:remove:value:", a3, a4, a5, a6, a7, a8);
}

- (id)statementWithString:(id)a3 error:(id *)a4
{
  return -[_MSVSQLConnection statementWithString:error:](self->_connection, "statementWithString:error:", a3, a4);
}

- (BOOL)executeStatement:(id)a3 error:(id *)a4
{
  return -[_MSVSQLConnection executeStatement:error:](self->_connection, "executeStatement:error:", a3, a4);
}

- (BOOL)executeStatementString:(id)a3 error:(id *)a4
{
  return -[_MSVSQLConnection executeStatementString:error:](self->_connection, "executeStatementString:error:", a3, a4);
}

- (id)markdownTableForSQL:(id)a3
{
  void *v4;
  void *v5;

  -[MSVSQLDatabase statementWithString:error:](self, "statementWithString:error:", a3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSVSQLDatabase markdownTableForStatement:](self, "markdownTableForStatement:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "invalidate");

  return v5;
}

- (id)markdownTableForStatement:(id)a3
{
  void *v3;
  void *v4;

  -[MSVSQLDatabase resultsForStatement:](self, "resultsForStatement:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "markdownTable");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)markdownTableForTableNamed:(id)a3
{
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("SELECT * FROM %@"), a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSVSQLDatabase statementWithString:error:](self, "statementWithString:error:", v4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[MSVSQLDatabase markdownTableForStatement:](self, "markdownTableForStatement:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "invalidate");

  return v6;
}

- (NSURL)databaseURL
{
  return self->_databaseURL;
}

- (void)setDatabaseURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_databaseURL, 0);
}

@end
