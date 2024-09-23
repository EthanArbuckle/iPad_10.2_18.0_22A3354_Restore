@implementation AMSSQLitePreparedStatement

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_SQL, 0);
}

- (const)connectionPointer
{
  return self->_connectionPointer;
}

- (AMSSQLitePreparedStatement)initWithConnection:(const void *)a3 SQL:(id)a4
{
  id v6;
  AMSSQLitePreparedStatement *v7;
  AMSSQLitePreparedStatement *v8;
  uint64_t v9;
  NSString *SQL;
  objc_super v12;

  v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)AMSSQLitePreparedStatement;
  v7 = -[AMSSQLitePreparedStatement init](&v12, sel_init);
  v8 = v7;
  if (v7)
  {
    v7->_connectionPointer = a3;
    v9 = objc_msgSend(v6, "copy");
    SQL = v8->_SQL;
    v8->_SQL = (NSString *)v9;

  }
  return v8;
}

- (NSString)SQL
{
  return self->_SQL;
}

@end
