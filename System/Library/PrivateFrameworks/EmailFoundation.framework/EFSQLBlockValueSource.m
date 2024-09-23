@implementation EFSQLBlockValueSource

- (EFSQLBlockValueSource)initWithSourceTableName:(id)a3 creationBlock:(id)a4 selectResultExpression:(id)a5 selectResultAlias:(id)a6
{
  id v10;
  id v11;
  id v12;
  EFSQLBlockValueSource *v13;
  void *v14;
  id creationBlock;
  objc_super v17;

  v10 = a4;
  v11 = a5;
  v12 = a6;
  v17.receiver = self;
  v17.super_class = (Class)EFSQLBlockValueSource;
  v13 = -[EFSQLValueSource initWithTableName:selectResultAlias:](&v17, sel_initWithTableName_selectResultAlias_, a3, v12);
  if (v13)
  {
    v14 = _Block_copy(v10);
    creationBlock = v13->_creationBlock;
    v13->_creationBlock = v14;

    objc_storeStrong((id *)&v13->_selectResultExpression, a5);
    objc_storeStrong((id *)&v13->_selectResultAlias, a6);
  }

  return v13;
}

- (id)selectResultExpression
{
  return self->_selectResultExpression;
}

- (id)comparisonExpressionForValue:(id)a3 predicateOperator:(unint64_t)a4
{
  (*((void (**)(void))self->_creationBlock + 2))();
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectResultAlias, 0);
  objc_storeStrong((id *)&self->_selectResultExpression, 0);
  objc_storeStrong(&self->_creationBlock, 0);
}

@end
