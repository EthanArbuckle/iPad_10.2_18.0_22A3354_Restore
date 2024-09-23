@implementation CCSQLitePreparedStatement

- (CCSQLitePreparedStatement)init
{
  id v2;

  objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB0], CFSTR("init unsupported"), MEMORY[0x24BDBD1B8]);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

- (CCSQLitePreparedStatement)initWithStmt:(sqlite3_stmt *)a3
{
  CCSQLitePreparedStatement *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CCSQLitePreparedStatement;
  result = -[CCSQLitePreparedStatement init](&v5, sel_init);
  if (result)
    result->_stmt = a3;
  return result;
}

- (void)dealloc
{
  sqlite3_stmt *stmt;
  objc_super v4;

  stmt = self->_stmt;
  if (stmt)
  {
    sqlite3_finalize(stmt);
    self->_stmt = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)CCSQLitePreparedStatement;
  -[CCSQLitePreparedStatement dealloc](&v4, sel_dealloc);
}

- (sqlite3_stmt)stmt
{
  return self->_stmt;
}

@end
