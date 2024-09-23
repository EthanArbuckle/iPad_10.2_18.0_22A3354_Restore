@implementation EFParenthesizedSQLExpression

- (void)ef_renderSQLExpressionInto:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "appendString:", CFSTR("("));
  objc_msgSend(self->_expressable, "ef_renderSQLExpressionInto:", v4);
  objc_msgSend(v4, "appendString:", CFSTR(")"));

}

+ (id)parenthesizedValueCollectionExpressable:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithExpressable:", v4);

  return v5;
}

+ (id)parenthesizedValueExpressable:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithExpressable:", v4);

  return v5;
}

- (EFParenthesizedSQLExpression)initWithExpressable:(id)a3
{
  id v5;
  EFParenthesizedSQLExpression *v6;
  EFParenthesizedSQLExpression *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)EFParenthesizedSQLExpression;
  v6 = -[EFParenthesizedSQLExpression init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong(&v6->_expressable, a3);

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_expressable, 0);
}

- (BOOL)respondsToSelector:(SEL)a3
{
  return objc_opt_respondsToSelector() & 1;
}

- (id)ef_SQLExpression
{
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[EFParenthesizedSQLExpression ef_renderSQLExpressionInto:](self, "ef_renderSQLExpressionInto:", v3);
  return v3;
}

- (void)ef_renderSQLExpressionInto:(id)a3 conjoiner:(id)a4
{
  id v6;
  id v7;

  v7 = a3;
  v6 = a4;
  objc_msgSend(v7, "appendString:", CFSTR("("));
  objc_msgSend(self->_expressable, "ef_renderSQLExpressionInto:conjoiner:", v7, v6);
  objc_msgSend(v7, "appendString:", CFSTR(")"));

}

@end
