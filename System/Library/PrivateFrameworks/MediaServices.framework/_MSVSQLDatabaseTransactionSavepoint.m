@implementation _MSVSQLDatabaseTransactionSavepoint

- (void)dealloc
{
  objc_super v3;

  -[_MSVSQLDatabaseTransactionSavepoint commit](self, "commit");
  v3.receiver = self;
  v3.super_class = (Class)_MSVSQLDatabaseTransactionSavepoint;
  -[_MSVSQLDatabaseTransactionSavepoint dealloc](&v3, sel_dealloc);
}

- (NSString)description
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@: %p name=%@ transaction=%@>"), objc_opt_class(), self, self->_name, self->_transaction);
}

- (BOOL)commit
{
  return -[MSVSQLDatabaseTransaction _releaseSavepoint:](self->_transaction, "_releaseSavepoint:", self);
}

- (NSString)name
{
  return self->_name;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transaction, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
