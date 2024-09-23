@implementation IMDPredicateToSQLConverter

- (NSArray)parameters
{
  return (NSArray *)(id)-[NSMutableArray copy](self->_foundParameters, "copy");
}

- (NSDictionary)keyPathsToColumns
{
  return self->_keyPathsToColumns;
}

- (IMDPredicateToSQLConverter)initWithPredicate:(id)a3 keyPathsToColumns:(id)a4
{
  id v6;
  id v7;
  IMDPredicateToSQLConverter *v8;
  NSMutableArray *v9;
  NSMutableArray *foundParameters;
  uint64_t v11;
  NSString *expression;
  IMDPredicateToSQLConverter *v13;
  objc_super v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)IMDPredicateToSQLConverter;
  v8 = -[IMDPredicateToSQLConverter init](&v15, sel_init);
  if (v8)
  {
    v9 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    foundParameters = v8->_foundParameters;
    v8->_foundParameters = v9;

    objc_storeStrong((id *)&v8->_keyPathsToColumns, a4);
    sub_1ABB6A468((__CFString *)v8, v6);
    v11 = objc_claimAutoreleasedReturnValue();
    expression = v8->_expression;
    v8->_expression = (NSString *)v11;

  }
  v13 = v8;

  return v13;
}

- (NSString)expression
{
  return self->_expression;
}

- (void)bindParametersToSqliteWithStatement:(CSDBSqliteStatement *)a3
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[IMDPredicateToSQLConverter parameters](self, "parameters", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * v7);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          CSDBSqliteBindTextFromCFString();
          goto LABEL_13;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v8, "integerValue");
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
            goto LABEL_13;
          objc_msgSend(v8, "__im_nanosecondTimeInterval");
        }
        CSDBSqliteBindInt64();
LABEL_13:
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_foundParameters, 0);
  objc_storeStrong((id *)&self->_expression, 0);
  objc_storeStrong((id *)&self->_keyPathsToColumns, 0);
}

- (IMDPredicateToSQLConverter)init
{

  return 0;
}

@end
