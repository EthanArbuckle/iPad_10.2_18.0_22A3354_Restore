@implementation _EFSQLJoinExpression

- (void)addResultColumn:(id)a3
{
  -[_EFSQLJoinExpression addResultColumn:alias:](self, "addResultColumn:alias:", a3, 0);
}

- (id)leftOuterJoin:(id)a3 alias:(id)a4 sourceColumn:(id)a5 targetColumn:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  -[_EFSQLJoinExpression tableAlias](self, "tableAlias");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (!v14)
  {
    -[_EFSQLJoinExpression tableName](self, "tableName");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  +[EFSQLColumnExpression table:column:](EFSQLColumnExpression, "table:column:", v15, v12);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v14)

  if (v11)
    v17 = v11;
  else
    v17 = v10;
  +[EFSQLColumnExpression table:column:](EFSQLColumnExpression, "table:column:", v17, v13);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "equalTo:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[_EFSQLJoinExpression leftOuterJoin:alias:on:](self, "leftOuterJoin:alias:on:", v10, v11, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

- (void)ef_renderSQLExpressionInto:(id)a3
{
  id v4;
  const __CFString *v5;
  id v6;

  v4 = a3;
  if (self->_isLeftOuter)
    v5 = CFSTR(" LEFT OUTER JOIN ");
  else
    v5 = CFSTR(" JOIN ");
  v6 = v4;
  objc_msgSend(v4, "appendString:", v5);
  objc_msgSend(v6, "appendString:", self->_tableName);
  if (self->_tableAlias)
    objc_msgSend(v6, "appendFormat:", CFSTR(" AS %@"), self->_tableAlias);
  objc_msgSend(v6, "appendString:", CFSTR(" ON "));
  -[EFSQLExpressable ef_renderSQLExpressionInto:](self->_joinConstraint, "ef_renderSQLExpressionInto:", v6);

}

- (void)orderByColumn:(id)a3 ascending:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a4;
  v9 = a3;
  -[_EFSQLJoinExpression select](self, "select");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[_EFSQLJoinExpression tableAlias](self, "tableAlias");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (!v7)
  {
    -[_EFSQLJoinExpression tableName](self, "tableName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v6, "orderByColumn:fromTable:ascending:", v9, v8, v4);
  if (!v7)

}

- (void)addResultColumn:(id)a3 alias:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  -[_EFSQLJoinExpression select](self, "select");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[_EFSQLJoinExpression tableAlias](self, "tableAlias");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (!v8)
  {
    -[_EFSQLJoinExpression tableName](self, "tableName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v7, "addResultColumn:fromTable:alias:", v10, v9, v6);
  if (!v8)

}

- (NSString)tableName
{
  return self->_tableName;
}

- (NSString)tableAlias
{
  return self->_tableAlias;
}

- (EFSQLSelectStatement)select
{
  return (EFSQLSelectStatement *)objc_loadWeakRetained((id *)&self->_select);
}

- (id)leftOuterJoin:(id)a3 alias:(id)a4 on:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[_EFSQLJoinExpression select](self, "select");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "leftOuterJoin:alias:on:", v8, v9, v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (_EFSQLJoinExpression)initWithSelect:(id)a3 tableName:(id)a4 tableAlias:(id)a5 joinConstraint:(id)a6 isLeftOuter:(BOOL)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  _EFSQLJoinExpression *v16;
  _EFSQLJoinExpression *v17;
  uint64_t v18;
  NSString *tableName;
  uint64_t v20;
  NSString *tableAlias;
  objc_super v23;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v23.receiver = self;
  v23.super_class = (Class)_EFSQLJoinExpression;
  v16 = -[_EFSQLJoinExpression init](&v23, sel_init);
  v17 = v16;
  if (v16)
  {
    objc_storeWeak((id *)&v16->_select, v12);
    v18 = objc_msgSend(v13, "copy");
    tableName = v17->_tableName;
    v17->_tableName = (NSString *)v18;

    v20 = objc_msgSend(v14, "copy");
    tableAlias = v17->_tableAlias;
    v17->_tableAlias = (NSString *)v20;

    objc_storeStrong((id *)&v17->_joinConstraint, a6);
    v17->_isLeftOuter = a7;
  }

  return v17;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_joinConstraint, 0);
  objc_storeStrong((id *)&self->_tableAlias, 0);
  objc_storeStrong((id *)&self->_tableName, 0);
  objc_destroyWeak((id *)&self->_select);
}

- (id)leftOuterJoin:(id)a3 sourceColumn:(id)a4 targetColumn:(id)a5
{
  -[_EFSQLJoinExpression leftOuterJoin:alias:sourceColumn:targetColumn:](self, "leftOuterJoin:alias:sourceColumn:targetColumn:", a3, 0, a4, a5);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (NSString)ef_SQLExpression
{
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_EFSQLJoinExpression ef_renderSQLExpressionInto:](self, "ef_renderSQLExpressionInto:", v3);
  return (NSString *)v3;
}

- (id)join:(id)a3 on:(id)a4
{
  -[_EFSQLJoinExpression join:alias:on:](self, "join:alias:on:", a3, 0, a4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)leftOuterJoin:(id)a3 on:(id)a4
{
  -[_EFSQLJoinExpression leftOuterJoin:alias:on:](self, "leftOuterJoin:alias:on:", a3, 0, a4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)join:(id)a3 alias:(id)a4 on:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[_EFSQLJoinExpression select](self, "select");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "join:alias:on:", v8, v9, v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)join:(id)a3 sourceColumn:(id)a4 targetColumn:(id)a5
{
  -[_EFSQLJoinExpression join:alias:sourceColumn:targetColumn:](self, "join:alias:sourceColumn:targetColumn:", a3, 0, a4, a5);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)join:(id)a3 alias:(id)a4 sourceColumn:(id)a5 targetColumn:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  -[_EFSQLJoinExpression tableAlias](self, "tableAlias");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (!v14)
  {
    -[_EFSQLJoinExpression tableName](self, "tableName");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  +[EFSQLColumnExpression table:column:](EFSQLColumnExpression, "table:column:", v15, v12);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v14)

  if (v11)
    v17 = v11;
  else
    v17 = v10;
  +[EFSQLColumnExpression table:column:](EFSQLColumnExpression, "table:column:", v17, v13);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "equalTo:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[_EFSQLJoinExpression join:alias:on:](self, "join:alias:on:", v10, v11, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

- (void)groupByColumn:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  -[_EFSQLJoinExpression select](self, "select");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_EFSQLJoinExpression tableAlias](self, "tableAlias");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5)
  {
    -[_EFSQLJoinExpression tableName](self, "tableName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v4, "groupByColumn:fromTable:", v7, v6);
  if (!v5)

}

- (EFSQLExpressable)joinConstraint
{
  return self->_joinConstraint;
}

- (BOOL)isLeftOuter
{
  return self->_isLeftOuter;
}

@end
