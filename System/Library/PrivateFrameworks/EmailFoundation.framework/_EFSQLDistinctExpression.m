@implementation _EFSQLDistinctExpression

- (void)ef_renderSQLExpressionInto:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "appendString:", CFSTR("DISTINCT "));
  -[EFSQLExpressable ef_renderSQLExpressionInto:](self->_expression, "ef_renderSQLExpressionInto:", v4);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_expression, 0);
}

- (_EFSQLDistinctExpression)initWithExpression:(id)a3
{
  id v5;
  _EFSQLDistinctExpression *v6;
  _EFSQLDistinctExpression *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_EFSQLDistinctExpression;
  v6 = -[_EFSQLDistinctExpression init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_expression, a3);

  return v7;
}

- (NSString)ef_SQLExpression
{
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_EFSQLDistinctExpression ef_renderSQLExpressionInto:](self, "ef_renderSQLExpressionInto:", v3);
  return (NSString *)v3;
}

- (EFSQLExpressable)expression
{
  return self->_expression;
}

@end
