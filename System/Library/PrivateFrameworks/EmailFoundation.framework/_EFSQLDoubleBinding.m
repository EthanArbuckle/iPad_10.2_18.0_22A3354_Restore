@implementation _EFSQLDoubleBinding

- (_EFSQLDoubleBinding)initWithDouble:(double)a3
{
  _EFSQLDoubleBinding *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_EFSQLDoubleBinding;
  result = -[_EFSQLDoubleBinding init](&v5, sel_init);
  if (result)
    result->_doubleValue = a3;
  return result;
}

- (void)bindTo:(sqlite3_stmt *)a3 withSQLIndex:(int)a4
{
  double v6;

  -[_EFSQLDoubleBinding doubleValue](self, "doubleValue");
  sqlite3_bind_double(a3, a4, v6);
}

- (double)doubleValue
{
  return self->_doubleValue;
}

@end
