@implementation EFSQLNotExpression

- (id)ef_SQLIsolatedExpression
{
  return +[EFParenthesizedSQLExpression parenthesizedValueExpressable:](EFParenthesizedSQLExpression, "parenthesizedValueExpressable:", self);
}

- (EFSQLNotExpression)initWithExpression:(id)a3
{
  id v5;
  EFSQLNotExpression *v6;
  EFSQLNotExpression *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)EFSQLNotExpression;
  v6 = -[EFSQLNotExpression init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_expression, a3);

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_expression, 0);
}

- (void)ef_renderSQLExpressionInto:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "appendString:", CFSTR("NOT ("));
  -[EFSQLValueExpressable ef_renderSQLExpressionInto:](self->_expression, "ef_renderSQLExpressionInto:", v4);
  objc_msgSend(v4, "appendString:", CFSTR(")"));

}

- (NSString)ef_SQLExpression
{
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[EFSQLNotExpression ef_renderSQLExpressionInto:](self, "ef_renderSQLExpressionInto:", v3);
  return (NSString *)v3;
}

- (EFSQLValueExpressable)expression
{
  return self->_expression;
}

@end
