@implementation CCDatabaseReader

- (CCDatabaseReader)init
{
  id v2;

  objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB0], CFSTR("init unsupported"), MEMORY[0x24BDBD1B8]);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

+ (id)readerForDatabaseAtURL:(id)a3 accessAssertion:(id)a4
{
  void *v4;
  void *v5;

  +[CCDatabaseConnection readOnlyConnectionToDatabaseAtURL:accessAssertion:](CCDatabaseConnection, "readOnlyConnectionToDatabaseAtURL:accessAssertion:", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithConnection:", v4);

  return v5;
}

- (CCDatabaseReader)initWithConnection:(id)a3
{
  id v5;
  CCDatabaseReader *v6;
  CCDatabaseReader *v7;
  CCDatabaseReader *v8;
  NSObject *v9;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CCDatabaseReader;
  v6 = -[CCDatabaseReader init](&v11, sel_init);
  v7 = v6;
  if (v6 && (objc_storeStrong((id *)&v6->_connection, a3), !v7->_connection))
  {
    __biome_log_for_category();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[CCDatabaseReader initWithConnection:].cold.1(v9);

    v8 = 0;
  }
  else
  {
    v8 = v7;
  }

  return v8;
}

- (void)dealloc
{
  objc_super v3;

  -[CCDatabaseReader reset:](self, "reset:", 0);
  v3.receiver = self;
  v3.super_class = (Class)CCDatabaseReader;
  -[CCDatabaseReader dealloc](&v3, sel_dealloc);
}

- (BOOL)_openAndBeginReadTransactionIfNotExists:(id *)a3
{
  if (self->_inTransaction)
    return 1;
  if (-[CCDatabaseConnection openWithError:](self->_connection, "openWithError:"))
  {
    if (-[CCDatabaseConnection beginTransactionWithError:](self->_connection, "beginTransactionWithError:", a3))
      self->_inTransaction = 1;
  }
  return self->_inTransaction;
}

- (BOOL)_commitAndCloseReadTransactionIfExists:(id *)a3
{
  if (!self->_inTransaction)
    return 1;
  if (-[CCDatabaseConnection commitTransactionWithError:](self->_connection, "commitTransactionWithError:"))
  {
    if (-[CCDatabaseConnection closeWithError:](self->_connection, "closeWithError:", a3))
      self->_inTransaction = 0;
  }
  return !self->_inTransaction;
}

- (BOOL)enumerateRecordResultsOfSelect:(id)a3 recordClass:(Class)a4 error:(id *)a5 usingBlock:(id)a6
{
  id v10;
  id v11;
  BOOL v12;

  v10 = a3;
  v11 = a6;
  if (-[CCDatabaseReader _openAndBeginReadTransactionIfNotExists:](self, "_openAndBeginReadTransactionIfNotExists:", a5))
  {
    v12 = -[CCDatabaseConnection enumerateRecordResultsOfSelect:recordClass:error:usingBlock:](self->_connection, "enumerateRecordResultsOfSelect:recordClass:error:usingBlock:", v10, a4, a5, v11);
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (BOOL)enumerateRowResultsOfSelect:(id)a3 error:(id *)a4 usingBlock:(id)a5
{
  id v8;
  id v9;
  BOOL v10;

  v8 = a3;
  v9 = a5;
  if (-[CCDatabaseReader _openAndBeginReadTransactionIfNotExists:](self, "_openAndBeginReadTransactionIfNotExists:", a4))
  {
    v10 = -[CCDatabaseConnection enumerateRowResultsOfSelect:error:usingBlock:](self->_connection, "enumerateRowResultsOfSelect:error:usingBlock:", v8, a4, v9);
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)enumeratorForRowResultsOfSelect:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;

  v6 = a3;
  if (-[CCDatabaseReader _openAndBeginReadTransactionIfNotExists:](self, "_openAndBeginReadTransactionIfNotExists:", a4))
  {
    -[CCDatabaseConnection enumeratorForRowResultsOfSelect:error:](self->_connection, "enumeratorForRowResultsOfSelect:error:", v6, a4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
}

- (void)initWithConnection:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_237B25000, log, OS_LOG_TYPE_ERROR, "nil database connection.", v1, 2u);
}

@end
