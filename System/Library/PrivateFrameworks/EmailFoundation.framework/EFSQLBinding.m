@implementation EFSQLBinding

- (void)bindToStatement:(id)a3 usingIndex:(unint64_t)a4
{
  sqlite3_stmt *v6;
  int v7;
  uint64_t v8;
  id v9;
  id v10;

  v10 = objc_retainAutorelease(a3);
  v6 = (sqlite3_stmt *)objc_msgSend(v10, "compiled");
  v7 = sqlite3_bind_parameter_count(v6);
  if ((v7 & ~(v7 >> 31)) <= a4)
  {
    v8 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Index %lu beyond number of parameters in statement: %@"), a4, v10);
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v8, 0);
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v9);
  }
  -[EFSQLBinding bindTo:withSQLIndex:](self, "bindTo:withSQLIndex:", v6, (a4 + 1));

}

- (void)bindToStatement:(id)a3 usingName:(id)a4
{
  id v6;
  id v7;
  sqlite3_stmt *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  v13 = objc_retainAutorelease(v6);
  v8 = (sqlite3_stmt *)objc_msgSend(v13, "compiled");
  v9 = objc_retainAutorelease(v7);
  v10 = sqlite3_bind_parameter_index(v8, (const char *)objc_msgSend(v9, "UTF8String"));
  if (!(_DWORD)v10)
  {
    v11 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Named parameter %@ not found in statement: %@"), v9, v13);
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v11, 0);
    v12 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v12);
  }
  -[EFSQLBinding bindTo:withSQLIndex:](self, "bindTo:withSQLIndex:", v8, v10);

}

+ (id)bindingWithString:(id)a3
{
  id v3;
  _EFSQLStringBinding *v4;

  v3 = a3;
  v4 = -[_EFSQLStringBinding initWithString:]([_EFSQLStringBinding alloc], "initWithString:", v3);

  return v4;
}

+ (id)bindingWithInt64:(int64_t)a3
{
  return -[_EFSQLInt64Binding initWithInt64:]([_EFSQLInt64Binding alloc], "initWithInt64:", a3);
}

+ (id)bindingWithData:(id)a3
{
  id v3;
  _EFSQLDataBinding *v4;

  v3 = a3;
  v4 = -[_EFSQLDataBinding initWithData:]([_EFSQLDataBinding alloc], "initWithData:", v3);

  return v4;
}

+ (id)bindingWithDouble:(double)a3
{
  return -[_EFSQLDoubleBinding initWithDouble:]([_EFSQLDoubleBinding alloc], "initWithDouble:", a3);
}

+ (id)nullBinding
{
  return objc_alloc_init(EFSQLBinding);
}

- (void)bindTo:(sqlite3_stmt *)a3 withSQLIndex:(int)a4
{
  sqlite3_bind_null(a3, a4);
}

@end
