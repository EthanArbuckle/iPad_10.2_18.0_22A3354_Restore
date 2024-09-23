@implementation CCDatabaseEnumerationResult

- (CCDatabaseEnumerationResult)init
{
  id v2;

  objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB0], CFSTR("init unsupported"), MEMORY[0x24BDBD1B8]);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

- (CCDatabaseEnumerationResult)initWithStatement:(id)a3 database:(id)a4 command:(id)a5 error:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  CCDatabaseEnumerationResult *v15;
  CCDatabaseEnumerationResult *v16;
  objc_super v18;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)CCDatabaseEnumerationResult;
  v15 = -[CCDatabaseEnumerationResult init](&v18, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_database, a4);
    objc_storeStrong((id *)&v16->_command, a5);
    objc_storeStrong((id *)&v16->_statement, a3);
    v16->_column_count = sqlite3_column_count((sqlite3_stmt *)objc_msgSend(v11, "stmt"));
    objc_storeStrong((id *)&v16->_error, a6);
  }

  return v16;
}

- (id)next
{
  NSArray *v2;
  NSArray *peekedNext;
  NSArray *v5;

  if (self->_error)
  {
    v2 = 0;
  }
  else
  {
    peekedNext = self->_peekedNext;
    if (peekedNext)
    {
      v2 = peekedNext;
      v5 = self->_peekedNext;
      self->_peekedNext = 0;

    }
    else
    {
      -[CCDatabaseEnumerationResult _next](self, "_next");
      v2 = (NSArray *)objc_claimAutoreleasedReturnValue();
    }
  }
  return v2;
}

- (id)_next
{
  CCSQLitePreparedStatement *statement;
  int v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *error;
  NSError *v9;

  statement = self->_statement;
  if (!statement)
    goto LABEL_12;
  v4 = sqlite3_step(-[CCSQLitePreparedStatement stmt](statement, "stmt"));
  if (v4 == 101)
  {
    error = self->_statement;
    self->_statement = 0;
LABEL_11:

LABEL_12:
    v5 = 0;
    return v5;
  }
  if (v4 != 100)
  {
    v9 = (NSError *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1540]), "initWithDomain:code:userInfo:", CFSTR("com.apple.CascadeSets.CCDatabase"), 2, 0);
    error = self->_error;
    self->_error = v9;
    goto LABEL_11;
  }
  if (self->_column_count < 1)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", self->_column_count);
    if (self->_column_count >= 1)
    {
      v6 = 0;
      do
      {
        _columnValueFromSQLiteStatement(-[CCSQLitePreparedStatement stmt](self->_statement, "stmt"), v6);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v7);

        v6 = (v6 + 1);
      }
      while ((int)v6 < self->_column_count);
    }
  }
  return v5;
}

- (id)peek
{
  NSArray *peekedNext;
  void *v4;
  NSArray *v5;
  NSArray *v6;

  peekedNext = self->_peekedNext;
  if (!peekedNext)
  {
    v4 = (void *)MEMORY[0x23B82079C]();
    -[CCDatabaseEnumerationResult _next](self, "_next");
    v5 = (NSArray *)objc_claimAutoreleasedReturnValue();
    objc_autoreleasePoolPop(v4);
    v6 = self->_peekedNext;
    self->_peekedNext = v5;

    peekedNext = self->_peekedNext;
  }
  return peekedNext;
}

- (NSError)error
{
  return self->_error;
}

- (NSArray)peekedNext
{
  return self->_peekedNext;
}

- (CCSQLitePreparedStatement)statement
{
  return self->_statement;
}

- (int)column_count
{
  return self->_column_count;
}

- (void)setError:(id)a3
{
  objc_storeStrong((id *)&self->_error, a3);
}

- (CCSQLiteDatabase)database
{
  return self->_database;
}

- (CCDatabaseCommand)command
{
  return self->_command;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_command, 0);
  objc_storeStrong((id *)&self->_database, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_statement, 0);
  objc_storeStrong((id *)&self->_peekedNext, 0);
}

@end
