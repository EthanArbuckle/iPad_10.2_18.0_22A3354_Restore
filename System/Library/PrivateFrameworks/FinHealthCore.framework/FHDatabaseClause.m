@implementation FHDatabaseClause

- (FHDatabaseClause)initWithQuoteWrapOption:(id)a3 fieldName:(id)a4 expression:(id)a5 quoteWrapExpression:(BOOL)a6
{
  id v10;
  id v11;
  id v12;
  FHDatabaseClause *v13;
  uint64_t v14;
  NSString *comparisonOperator;
  void *v16;
  uint64_t v17;
  NSString *fieldName;
  void *v19;
  NSString *v20;
  uint64_t v21;
  NSString *expression;
  uint64_t v23;
  objc_super v25;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v25.receiver = self;
  v25.super_class = (Class)FHDatabaseClause;
  v13 = -[FHDatabaseClause init](&v25, sel_init);
  if (v13)
  {
    v14 = objc_msgSend(v10, "copy");
    comparisonOperator = v13->_comparisonOperator;
    v13->_comparisonOperator = (NSString *)v14;

    v16 = (void *)objc_msgSend(v11, "copy");
    objc_msgSend(v16, "lowercaseString");
    v17 = objc_claimAutoreleasedReturnValue();
    fieldName = v13->_fieldName;
    v13->_fieldName = (NSString *)v17;

    if (a6)
    {
      v19 = (void *)MEMORY[0x24BDD17C8];
      v20 = (NSString *)objc_msgSend(v12, "copy");
      objc_msgSend(v19, "stringWithFormat:", CFSTR("'%@'"), v20);
      v21 = objc_claimAutoreleasedReturnValue();
      expression = v13->_expression;
      v13->_expression = (NSString *)v21;

    }
    else
    {
      v23 = objc_msgSend(v12, "copy");
      v20 = v13->_expression;
      v13->_expression = (NSString *)v23;
    }

  }
  return v13;
}

- (id)description
{
  void *v3;

  objc_msgSend(MEMORY[0x24BDD16A8], "stringWithFormat:", CFSTR("<%@: %p; "), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("fieldName: '%@'; "), self->_fieldName);
  objc_msgSend(v3, "appendFormat:", CFSTR("comparisonOperator: '%@'; "), self->_comparisonOperator);
  objc_msgSend(v3, "appendFormat:", CFSTR("expression: '%@'; "), self->_expression);
  objc_msgSend(v3, "appendFormat:", CFSTR(">"));
  return v3;
}

- (id)shortDescription
{
  id v3;
  void *v4;

  v3 = objc_alloc_init(MEMORY[0x24BDD16A8]);
  objc_msgSend(v3, "appendFormat:", CFSTR("%@ %@ %@"), self->_fieldName, self->_comparisonOperator, self->_expression);
  v4 = (void *)objc_msgSend(v3, "copy");

  return v4;
}

- (NSString)comparisonOperator
{
  return self->_comparisonOperator;
}

- (void)setComparisonOperator:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)fieldName
{
  return self->_fieldName;
}

- (void)setFieldName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)expression
{
  return self->_expression;
}

- (void)setExpression:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_expression, 0);
  objc_storeStrong((id *)&self->_fieldName, 0);
  objc_storeStrong((id *)&self->_comparisonOperator, 0);
}

@end
