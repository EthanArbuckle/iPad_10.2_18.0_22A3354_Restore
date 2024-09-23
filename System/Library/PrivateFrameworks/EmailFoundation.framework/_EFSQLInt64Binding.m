@implementation _EFSQLInt64Binding

- (void)bindTo:(sqlite3_stmt *)a3 withSQLIndex:(int)a4
{
  sqlite3_bind_int64(a3, a4, -[_EFSQLInt64Binding integerValue](self, "integerValue"));
}

- (int64_t)integerValue
{
  return self->_integerValue;
}

- (_EFSQLInt64Binding)initWithInt64:(int64_t)a3
{
  _EFSQLInt64Binding *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_EFSQLInt64Binding;
  result = -[_EFSQLInt64Binding init](&v5, sel_init);
  if (result)
    result->_integerValue = a3;
  return result;
}

@end
