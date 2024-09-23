@implementation EFSQLBetweenExpression

- (EFSQLBetweenExpression)initWithLeft:(id)a3 firstValue:(id)a4 secondValue:(id)a5 between:(BOOL)a6
{
  id v11;
  EFSQLBetweenExpression *v12;
  EFSQLBetweenExpression *v13;
  objc_super v15;

  v11 = a3;
  v15.receiver = self;
  v15.super_class = (Class)EFSQLBetweenExpression;
  v12 = -[EFPair initWithFirst:second:](&v15, sel_initWithFirst_second_, a4, a5);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_left, a3);
    v13->_between = a6;
  }

  return v13;
}

- (NSString)ef_SQLExpression
{
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[EFSQLBetweenExpression ef_renderSQLExpressionInto:](self, "ef_renderSQLExpressionInto:", v3);
  return (NSString *)v3;
}

- (void)ef_renderSQLExpressionInto:(id)a3
{
  void *v4;
  const __CFString *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[EFSQLBetweenExpression left](self, "left");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "ef_renderSQLExpressionInto:", v8);

  if (self->_between)
    v5 = CFSTR(" BETWEEN ");
  else
    v5 = CFSTR(" NOT BETWEEN ");
  objc_msgSend(v8, "appendString:", v5);
  -[EFPair first](self, "first");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "ef_renderSQLExpressionInto:", v8);

  objc_msgSend(v8, "appendString:", CFSTR(" AND "));
  -[EFPair second](self, "second");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "ef_renderSQLExpressionInto:", v8);

}

- (void)setColumnExpression:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[EFSQLBetweenExpression left](self, "left");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setColumnExpression:", v5);

}

- (EFSQLExpressable)left
{
  return self->_left;
}

- (BOOL)between
{
  return self->_between;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_left, 0);
}

@end
