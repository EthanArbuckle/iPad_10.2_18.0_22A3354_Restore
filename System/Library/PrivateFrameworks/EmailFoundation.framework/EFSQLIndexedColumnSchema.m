@implementation EFSQLIndexedColumnSchema

- (NSString)name
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[EFSQLIndexedColumnSchema expression](self, "expression");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v2, "name");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (name_onceToken != -1)
      dispatch_once(&name_onceToken, &__block_literal_global_32);
    objc_msgSend(v2, "ef_SQLExpression");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "ef_stringByRemovingCharactersInSet:", name_sInvalidCharacters);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v3, "lowercaseString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

- (EFSQLExpressable)expression
{
  return self->_expression;
}

- (EFSQLIndexedColumnSchema)initWithColumnName:(id)a3 orderDirection:(unint64_t)a4
{
  return -[EFSQLIndexedColumnSchema initWithColumnName:collation:orderDirection:](self, "initWithColumnName:collation:orderDirection:", a3, 0, a4);
}

- (EFSQLIndexedColumnSchema)initWithColumnName:(id)a3 collation:(unint64_t)a4 orderDirection:(unint64_t)a5
{
  id v8;
  EFSQLColumnExpression *v9;
  EFSQLIndexedColumnSchema *v10;

  v8 = a3;
  v9 = -[EFSQLColumnExpression initWithName:]([EFSQLColumnExpression alloc], "initWithName:", v8);
  v10 = -[EFSQLIndexedColumnSchema initWithExpression:collation:orderDirection:](self, "initWithExpression:collation:orderDirection:", v9, a4, a5);

  return v10;
}

- (EFSQLIndexedColumnSchema)initWithExpression:(id)a3 collation:(unint64_t)a4 orderDirection:(unint64_t)a5
{
  id v9;
  EFSQLIndexedColumnSchema *v10;
  EFSQLIndexedColumnSchema *v11;
  objc_super v13;

  v9 = a3;
  v13.receiver = self;
  v13.super_class = (Class)EFSQLIndexedColumnSchema;
  v10 = -[EFSQLIndexedColumnSchema init](&v13, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_expression, a3);
    v11->_collation = a4;
    v11->_orderDirection = a5;
  }

  return v11;
}

- (EFSQLIndexedColumnSchema)initWithColumnName:(id)a3
{
  return -[EFSQLIndexedColumnSchema initWithColumnName:orderDirection:](self, "initWithColumnName:orderDirection:", a3, 0);
}

- (NSString)definition
{
  __CFString *v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  void *v9;
  __CFString *v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  const __CFString *v15;
  const __CFString *v16;
  void *v17;

  v3 = -[EFSQLIndexedColumnSchema collation](self, "collation");
  if (v3)
  {
    v4 = objc_alloc(MEMORY[0x1E0CB3940]);
    EFSQLStringForCollation((uint64_t)v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v4, "initWithFormat:", CFSTR(" %@"), v5);

    v3 = (__CFString *)v6;
  }
  v7 = -[EFSQLIndexedColumnSchema orderDirection](self, "orderDirection");
  if (v7)
  {
    v8 = objc_alloc(MEMORY[0x1E0CB3940]);
    EFSQLStringForOrderDirection(v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (__CFString *)objc_msgSend(v8, "initWithFormat:", CFSTR(" %@"), v9);

  }
  else
  {
    v10 = 0;
  }
  v11 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[EFSQLIndexedColumnSchema expression](self, "expression");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "ef_SQLExpression");
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = (void *)v13;
  v15 = &stru_1E62A84D8;
  if (v3)
    v16 = v3;
  else
    v16 = &stru_1E62A84D8;
  if (v10)
    v15 = v10;
  v17 = (void *)objc_msgSend(v11, "initWithFormat:", CFSTR("%@%@%@"), v13, v16, v15);

  return (NSString *)v17;
}

- (unint64_t)orderDirection
{
  return self->_orderDirection;
}

- (unint64_t)collation
{
  return self->_collation;
}

- (EFSQLIndexedColumnSchema)initWithExpression:(id)a3 orderDirection:(unint64_t)a4
{
  return -[EFSQLIndexedColumnSchema initWithExpression:collation:orderDirection:](self, "initWithExpression:collation:orderDirection:", a3, 0, a4);
}

- (EFSQLIndexedColumnSchema)initWithExpression:(id)a3
{
  return -[EFSQLIndexedColumnSchema initWithExpression:orderDirection:](self, "initWithExpression:orderDirection:", a3, 0);
}

void __32__EFSQLIndexedColumnSchema_name__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  id v3;

  objc_msgSend(MEMORY[0x1E0CB3500], "ef_asciiAlphaNumericCharacterSet");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (id)objc_msgSend(v0, "mutableCopy");

  objc_msgSend(v3, "addCharactersInString:", CFSTR("_"));
  objc_msgSend(v3, "invertedSet");
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)name_sInvalidCharacters;
  name_sInvalidCharacters = v1;

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_expression, 0);
}

@end
