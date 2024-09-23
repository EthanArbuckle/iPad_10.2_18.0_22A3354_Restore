@implementation EFSQLOrderExpression

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_expression, 0);
}

- (void)ef_renderSQLExpressionInto:(id)a3
{
  const __CFString *v4;
  id v5;

  v5 = a3;
  -[EFSQLExpressable ef_renderSQLExpressionInto:](self->_expression, "ef_renderSQLExpressionInto:");
  if (self->_isAscending)
    v4 = CFSTR(" ASC");
  else
    v4 = CFSTR(" DESC");
  objc_msgSend(v5, "appendString:", v4);

}

- (EFSQLOrderExpression)initWithExpression:(id)a3 ascending:(BOOL)a4
{
  id v7;
  EFSQLOrderExpression *v8;
  EFSQLOrderExpression *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)EFSQLOrderExpression;
  v8 = -[EFSQLOrderExpression init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_expression, a3);
    v9->_isAscending = a4;
  }

  return v9;
}

- (NSString)ef_SQLExpression
{
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[EFSQLOrderExpression ef_renderSQLExpressionInto:](self, "ef_renderSQLExpressionInto:", v3);
  return (NSString *)v3;
}

- (EFSQLExpressable)expression
{
  return self->_expression;
}

- (BOOL)isAscending
{
  return self->_isAscending;
}

@end
