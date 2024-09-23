@implementation HDSQLiteOrderingTerm

- (HDSQLiteOrderingTerm)init
{
  void *v3;
  uint64_t v4;
  void *v5;

  v3 = (void *)MEMORY[0x24BDBCE88];
  v4 = *MEMORY[0x24BDBCAB8];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("The -%@ method is not available on %@"), v5, objc_opt_class());

  return 0;
}

- (HDSQLiteOrderingTerm)initWithExpression:(id)a3 ascending:(BOOL)a4
{
  id v6;
  HDSQLiteOrderingTerm *v7;
  uint64_t v8;
  NSString *expression;
  objc_super v11;

  v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HDSQLiteOrderingTerm;
  v7 = -[HDSQLiteOrderingTerm init](&v11, sel_init);
  if (v7)
  {
    v8 = objc_msgSend(v6, "copy");
    expression = v7->_expression;
    v7->_expression = (NSString *)v8;

    v7->_ascending = a4;
  }

  return v7;
}

+ (id)orderingTermWithProperty:(id)a3 entityClass:(Class)a4 ascending:(BOOL)a5
{
  _BOOL8 v5;
  void *v7;
  void *v8;

  v5 = a5;
  -[objc_class disambiguatedSQLForProperty:](a4, "disambiguatedSQLForProperty:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithExpression:ascending:", v7, v5);

  return v8;
}

- (id)SQL
{
  __CFString **v2;

  v2 = HDSQLiteOrderAscending;
  if (!self->_ascending)
    v2 = HDSQLiteOrderDescending;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), self->_expression, *v2);
}

- (id)description
{
  const __CFString *v2;

  if (self->_ascending)
    v2 = CFSTR("ascending");
  else
    v2 = CFSTR("descending");
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("<Order: \"%@\" %@>"), self->_expression, v2);
}

- (unint64_t)hash
{
  return -[NSString hash](self->_expression, "hash") ^ self->_ascending;
}

- (BOOL)isEqual:(id)a3
{
  HDSQLiteOrderingTerm *v4;
  HDSQLiteOrderingTerm *v5;
  NSString *expression;
  NSString *v7;
  BOOL v8;

  v4 = (HDSQLiteOrderingTerm *)a3;
  if (self == v4)
  {
    v8 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      expression = self->_expression;
      v7 = v5->_expression;
      v8 = (expression == v7 || v7 && -[NSString isEqualToString:](expression, "isEqualToString:"))
        && self->_ascending == v5->_ascending;

    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

- (NSString)expression
{
  return self->_expression;
}

- (BOOL)ascending
{
  return self->_ascending;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_expression, 0);
}

@end
