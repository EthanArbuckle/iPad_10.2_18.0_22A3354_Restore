@implementation EFSQLValueSource

- (EFSQLValueSource)initWithTableName:(id)a3 selectResultAlias:(id)a4
{
  id v8;
  id v9;
  EFSQLValueSource *v10;
  void *v12;
  objc_super v13;

  v8 = a3;
  v9 = a4;
  v13.receiver = self;
  v13.super_class = (Class)EFSQLValueSource;
  v10 = -[EFSQLValueSource init](&v13, sel_init);
  if (v10)
  {
    if (!v8)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, v10, CFSTR("EFSQLObjectPropertyMapper.m"), 30, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("tableName"));

    }
    objc_storeStrong((id *)&v10->_tableName, a3);
    objc_storeStrong((id *)&v10->_selectResultAlias, a4);
  }

  return v10;
}

- (EFSQLValueExpressable)selectResultExpression
{
  -[EFSQLValueSource doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  __assert_rtn("-[EFSQLValueSource selectResultExpression]", "EFSQLObjectPropertyMapper.m", 38, "0");
}

- (id)comparisonExpressionForValue:(id)a3 predicateOperator:(unint64_t)a4
{
  id v6;

  v6 = a3;
  -[EFSQLValueSource doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  __assert_rtn("-[EFSQLValueSource comparisonExpressionForValue:predicateOperator:]", "EFSQLObjectPropertyMapper.m", 42, "0");
}

- (NSString)tableName
{
  return self->_tableName;
}

- (NSString)selectResultAlias
{
  return self->_selectResultAlias;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectResultAlias, 0);
  objc_storeStrong((id *)&self->_tableName, 0);
}

@end
