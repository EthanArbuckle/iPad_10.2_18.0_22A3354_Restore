@implementation EFSQLColumnValueSource

- (EFSQLColumnValueSource)initWithColumn:(id)a3
{
  return -[EFSQLColumnValueSource initWithColumn:sourceTableAlias:columnAlias:](self, "initWithColumn:sourceTableAlias:columnAlias:", a3, 0, 0);
}

- (EFSQLColumnValueSource)initWithColumn:(id)a3 columnAlias:(id)a4
{
  return -[EFSQLColumnValueSource initWithColumn:sourceTableAlias:columnAlias:](self, "initWithColumn:sourceTableAlias:columnAlias:", a3, 0, a4);
}

- (EFSQLColumnValueSource)initWithColumn:(id)a3 sourceTableAlias:(id)a4 columnAlias:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  EFSQLColumnValueSource *v15;
  EFSQLColumnExpression *v16;
  void *v17;
  uint64_t v18;
  EFSQLColumnExpression *columnExpression;
  objc_super v21;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (v9)
  {
    v11 = v9;
  }
  else
  {
    objc_msgSend(v8, "table");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "name");
    v11 = (id)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v8, "table");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "name");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v21.receiver = self;
  v21.super_class = (Class)EFSQLColumnValueSource;
  v15 = -[EFSQLValueSource initWithTableName:selectResultAlias:](&v21, sel_initWithTableName_selectResultAlias_, v14, v10);

  if (v15)
  {
    v16 = [EFSQLColumnExpression alloc];
    objc_msgSend(v8, "name");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = -[EFSQLColumnExpression initWithName:table:](v16, "initWithName:table:", v17, v11);
    columnExpression = v15->_columnExpression;
    v15->_columnExpression = (EFSQLColumnExpression *)v18;

    objc_storeStrong((id *)&v15->_columnAlias, a5);
  }

  return v15;
}

- (id)selectResultExpression
{
  return self->_columnExpression;
}

- (id)comparisonExpressionForValue:(id)a3 predicateOperator:(unint64_t)a4
{
  -[EFSQLColumnExpression expressionForPredicateOperatorType:constantValue:](self->_columnExpression, "expressionForPredicateOperatorType:constantValue:", a4, a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_columnAlias, 0);
  objc_storeStrong((id *)&self->_columnExpression, 0);
}

@end
