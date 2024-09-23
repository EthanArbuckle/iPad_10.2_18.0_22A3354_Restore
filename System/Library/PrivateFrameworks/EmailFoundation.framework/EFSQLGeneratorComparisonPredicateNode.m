@implementation EFSQLGeneratorComparisonPredicateNode

- (EFSQLValueExpressable)sqlExpressable
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v11;

  -[EFSQLGeneratorComparisonPredicateNode constantValue](self, "constantValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[EFSQLGeneratorComparisonPredicateNode valueSource](self, "valueSource");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[EFSQLGeneratorComparisonPredicateNode constantValue](self, "constantValue");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "comparisonExpressionForValue:predicateOperator:", v6, -[EFSQLGeneratorComparisonPredicateNode predicateOperator](self, "predicateOperator"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[EFSQLGeneratorComparisonPredicateNode comparisonSource](self, "comparisonSource");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EFSQLGeneratorPredicateNode.m"), 100, CFSTR("Need something to compare to"));

    }
    -[EFSQLGeneratorComparisonPredicateNode comparisonSource](self, "comparisonSource");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[EFSQLGeneratorComparisonPredicateNode valueSource](self, "valueSource");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "selectResultExpression");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "comparisonExpressionForValue:predicateOperator:", v9, -[EFSQLGeneratorComparisonPredicateNode predicateOperator](self, "predicateOperator"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return (EFSQLValueExpressable *)v7;
}

- (EFSQLValueExpressable)constantValue
{
  return self->_constantValue;
}

- (EFSQLValueSource)valueSource
{
  return self->_valueSource;
}

- (unint64_t)predicateOperator
{
  return self->_predicateOperator;
}

- (EFSQLGeneratorComparisonPredicateNode)initWithValueSource:(id)a3 predicateOperator:(unint64_t)a4 constantValue:(id)a5
{
  id v9;
  id v10;
  EFSQLGeneratorComparisonPredicateNode *v11;
  EFSQLGeneratorComparisonPredicateNode *v12;
  objc_super v14;

  v9 = a3;
  v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)EFSQLGeneratorComparisonPredicateNode;
  v11 = -[EFSQLGeneratorComparisonPredicateNode init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_valueSource, a3);
    v12->_predicateOperator = a4;
    objc_storeStrong((id *)&v12->_constantValue, a5);
  }

  return v12;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_comparisonSource, 0);
  objc_storeStrong((id *)&self->_constantValue, 0);
  objc_storeStrong((id *)&self->_valueSource, 0);
}

- (EFSQLGeneratorComparisonPredicateNode)initWithValueSource:(id)a3 predicateOperator:(unint64_t)a4 comparisonSource:(id)a5
{
  id v9;
  id v10;
  EFSQLGeneratorComparisonPredicateNode *v11;
  EFSQLGeneratorComparisonPredicateNode *v12;
  objc_super v14;

  v9 = a3;
  v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)EFSQLGeneratorComparisonPredicateNode;
  v11 = -[EFSQLGeneratorComparisonPredicateNode init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_valueSource, a3);
    v12->_predicateOperator = a4;
    objc_storeStrong((id *)&v12->_comparisonSource, a5);
  }

  return v12;
}

- (EFSQLValueSource)comparisonSource
{
  return self->_comparisonSource;
}

@end
