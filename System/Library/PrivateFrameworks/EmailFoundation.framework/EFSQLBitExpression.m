@implementation EFSQLBitExpression

+ (id)rightShift:(id)a3 by:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithLeft:bitwiseOperator:right:", v6, 3, v7);

  return v8;
}

+ (id)leftShift:(id)a3 by:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithLeft:bitwiseOperator:right:", v6, 2, v7);

  return v8;
}

+ (id)and:(id)a3 with:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithLeft:bitwiseOperator:right:", v6, 0, v7);

  return v8;
}

- (EFSQLBitExpression)initWithLeft:(id)a3 bitwiseOperator:(unint64_t)a4 right:(id)a5
{
  id v9;
  id v10;
  EFSQLBitExpression *v11;
  EFSQLBitExpression *v12;
  objc_super v14;

  v9 = a3;
  v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)EFSQLBitExpression;
  v11 = -[EFSQLBitExpression init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_left, a3);
    v12->_bitwiseOperator = a4;
    objc_storeStrong((id *)&v12->_right, a5);
  }

  return v12;
}

+ (id)or:(id)a3 with:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithLeft:bitwiseOperator:right:", v6, 1, v7);

  return v8;
}

- (NSString)ef_SQLExpression
{
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[EFSQLBitExpression ef_renderSQLExpressionInto:](self, "ef_renderSQLExpressionInto:", v3);
  return (NSString *)v3;
}

- (void)ef_renderSQLExpressionInto:(id)a3
{
  unint64_t v4;
  const __CFString *v5;
  id v6;

  v6 = a3;
  objc_msgSend(v6, "appendString:", CFSTR("("));
  -[EFSQLExpressable ef_renderSQLExpressionInto:](self->_left, "ef_renderSQLExpressionInto:", v6);
  v4 = self->_bitwiseOperator - 1;
  if (v4 > 2)
    v5 = CFSTR(" & ");
  else
    v5 = off_1E62A6F80[v4];
  objc_msgSend(v6, "appendString:", v5);
  -[EFSQLExpressable ef_renderSQLExpressionInto:](self->_right, "ef_renderSQLExpressionInto:", v6);
  objc_msgSend(v6, "appendString:", CFSTR(")"));

}

- (void)setColumnExpression:(id)a3
{
  void *v4;
  char isKindOfClass;
  void *v6;
  id v7;

  v7 = a3;
  -[EFSQLBitExpression left](self, "left");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    -[EFSQLBitExpression left](self, "left");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setColumnExpression:", v7);

  }
  else
  {
    -[EFSQLBitExpression setLeft:](self, "setLeft:", v7);
  }

}

- (EFSQLExpressable)left
{
  return self->_left;
}

- (void)setLeft:(id)a3
{
  objc_storeStrong((id *)&self->_left, a3);
}

- (EFSQLExpressable)right
{
  return self->_right;
}

- (unint64_t)bitwiseOperator
{
  return self->_bitwiseOperator;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_right, 0);
  objc_storeStrong((id *)&self->_left, 0);
}

@end
