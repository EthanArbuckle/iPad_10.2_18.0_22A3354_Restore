@implementation _EFSQLAliasedExpression

- (_EFSQLAliasedExpression)initWithExpression:(id)a3 alias:(id)a4
{
  id v7;
  id v8;
  _EFSQLAliasedExpression *v9;
  _EFSQLAliasedExpression *v10;
  uint64_t v11;
  NSString *alias;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)_EFSQLAliasedExpression;
  v9 = -[_EFSQLAliasedExpression init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_expression, a3);
    v11 = objc_msgSend(v8, "copy");
    alias = v10->_alias;
    v10->_alias = (NSString *)v11;

  }
  return v10;
}

- (void)ef_renderSQLExpressionInto:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[EFSQLValueExpressable ef_SQLIsolatedExpression](self->_expression, "ef_SQLIsolatedExpression");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "ef_renderSQLExpressionInto:", v5);

  objc_msgSend(v5, "appendFormat:", CFSTR(" AS %@"), self->_alias);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alias, 0);
  objc_storeStrong((id *)&self->_expression, 0);
}

- (NSString)ef_SQLExpression
{
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_EFSQLAliasedExpression ef_renderSQLExpressionInto:](self, "ef_renderSQLExpressionInto:", v3);
  return (NSString *)v3;
}

- (EFSQLValueExpressable)expression
{
  return self->_expression;
}

- (NSString)alias
{
  return self->_alias;
}

@end
