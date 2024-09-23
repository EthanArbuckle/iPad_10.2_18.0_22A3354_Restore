@implementation IMDSortDescriptorToSQLConverter

- (id)_columnWithSortDescriptor:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  objc_msgSend(v4, "key");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[IMDSortDescriptorToSQLConverter keyPathsToColumns](self, "keyPathsToColumns");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "key");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)_orderByClauseWithSortDescriptor:(id)a3
{
  id v4;
  int v5;
  __CFString *v6;
  __CFString *v7;
  void *v8;
  void *v9;

  v4 = a3;
  v5 = objc_msgSend(v4, "ascending");
  v6 = CFSTR("DESC");
  if (v5)
    v6 = CFSTR("ASC");
  v7 = v6;
  -[IMDSortDescriptorToSQLConverter _columnWithSortDescriptor:](self, "_columnWithSortDescriptor:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ %@"), v8, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (IMDSortDescriptorToSQLConverter)init
{

  return 0;
}

- (IMDSortDescriptorToSQLConverter)initWithSortDescriptor:(id)a3 keyPathsToColumns:(id)a4
{
  id v6;
  id v7;
  IMDSortDescriptorToSQLConverter *v8;
  IMDSortDescriptorToSQLConverter *v9;
  uint64_t v10;
  NSString *expression;
  IMDSortDescriptorToSQLConverter *v12;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)IMDSortDescriptorToSQLConverter;
  v8 = -[IMDSortDescriptorToSQLConverter init](&v14, sel_init);
  v9 = v8;
  if (v8
    && (objc_storeStrong((id *)&v8->_keyPathsToColumns, a4),
        -[IMDSortDescriptorToSQLConverter _orderByClauseWithSortDescriptor:](v9, "_orderByClauseWithSortDescriptor:", v6), v10 = objc_claimAutoreleasedReturnValue(), expression = v9->_expression, v9->_expression = (NSString *)v10, expression, !v9->_expression))
  {
    v12 = 0;
  }
  else
  {
    v12 = v9;
  }

  return v12;
}

- (NSDictionary)keyPathsToColumns
{
  return self->_keyPathsToColumns;
}

- (NSString)expression
{
  return self->_expression;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_expression, 0);
  objc_storeStrong((id *)&self->_keyPathsToColumns, 0);
}

@end
