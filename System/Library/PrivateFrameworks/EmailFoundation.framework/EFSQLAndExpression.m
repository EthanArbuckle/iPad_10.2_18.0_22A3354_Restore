@implementation EFSQLAndExpression

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_expressions, 0);
}

- (void)ef_renderSQLExpressionInto:(id)a3
{
  -[NSArray ef_renderSQLExpressionInto:conjoiner:](self->_expressions, "ef_renderSQLExpressionInto:conjoiner:", a3, CFSTR(" AND "));
}

- (id)ef_SQLIsolatedExpression
{
  return +[EFParenthesizedSQLExpression parenthesizedValueExpressable:](EFParenthesizedSQLExpression, "parenthesizedValueExpressable:", self);
}

+ (id)combined:(id)a3
{
  id v3;
  EFSQLAndExpression *v4;
  EFSQLAndExpression *v5;

  v3 = a3;
  if (objc_msgSend(v3, "count") == 1)
  {
    objc_msgSend(v3, "firstObject");
    v4 = (EFSQLAndExpression *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = -[EFSQLAndExpression initWithExpressions:]([EFSQLAndExpression alloc], "initWithExpressions:", v3);
  }
  v5 = v4;

  return v5;
}

- (EFSQLAndExpression)initWithExpressions:(id)a3
{
  id v5;
  EFSQLAndExpression *v6;
  EFSQLAndExpression *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)EFSQLAndExpression;
  v6 = -[EFSQLAndExpression init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_expressions, a3);

  return v7;
}

- (NSString)ef_SQLExpression
{
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[EFSQLAndExpression ef_renderSQLExpressionInto:](self, "ef_renderSQLExpressionInto:", v3);
  return (NSString *)v3;
}

- (NSArray)expressions
{
  return self->_expressions;
}

@end
