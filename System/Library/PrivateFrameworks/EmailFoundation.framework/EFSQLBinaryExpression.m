@implementation EFSQLBinaryExpression

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_right, 0);
  objc_storeStrong((id *)&self->_left, 0);
}

- (EFSQLBinaryExpression)initWithLeft:(id)a3 operator:(unint64_t)a4 right:(id)a5
{
  id v9;
  id v10;
  EFSQLBinaryExpression *v11;
  EFSQLBinaryExpression *v12;
  objc_super v14;

  v9 = a3;
  v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)EFSQLBinaryExpression;
  v11 = -[EFSQLBinaryExpression init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_left, a3);
    objc_storeStrong((id *)&v12->_right, a5);
    v12->_binaryOperator = a4;
  }

  return v12;
}

- (void)ef_renderSQLExpressionInto:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[EFSQLExpressable ef_renderSQLExpressionInto:](self->_left, "ef_renderSQLExpressionInto:");
  -[EFSQLBinaryExpression _binaryStringForOperator:]((const __CFString *)self, self->_binaryOperator);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendString:", v4);

  -[EFSQLExpressable ef_renderSQLExpressionInto:](self->_right, "ef_renderSQLExpressionInto:", v5);
}

- (const)_binaryStringForOperator:(const __CFString *)result
{
  if (result)
  {
    if ((unint64_t)(a2 - 1) > 0xF)
      return CFSTR(" = ");
    else
      return off_1E62A6F00[a2 - 1];
  }
  return result;
}

- (NSString)ef_SQLExpression
{
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[EFSQLBinaryExpression ef_renderSQLExpressionInto:](self, "ef_renderSQLExpressionInto:", v3);
  return (NSString *)v3;
}

- (void)setColumnExpression:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[EFSQLBinaryExpression left](self, "left");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setColumnExpression:", v5);

}

- (EFSQLExpressable)left
{
  return self->_left;
}

- (EFSQLExpressable)right
{
  return self->_right;
}

- (unint64_t)binaryOperator
{
  return self->_binaryOperator;
}

@end
