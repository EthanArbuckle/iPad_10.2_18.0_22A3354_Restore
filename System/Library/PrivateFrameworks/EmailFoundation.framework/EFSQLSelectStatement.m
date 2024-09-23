@implementation EFSQLSelectStatement

- (id)join:(id)a3 alias:(id)a4 sourceColumn:(id)a5 targetColumn:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  -[EFSQLSelectStatement tableName](self, "tableName");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[EFSQLColumnExpression table:column:](EFSQLColumnExpression, "table:column:", v14, v12);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
    v16 = v11;
  else
    v16 = v10;
  +[EFSQLColumnExpression table:column:](EFSQLColumnExpression, "table:column:", v16, v13);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "equalTo:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[EFSQLSelectStatement join:alias:on:](self, "join:alias:on:", v10, v11, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

- (void)addResultColumn:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[EFSQLSelectStatement tableName](self, "tableName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[EFSQLSelectStatement addResultColumn:fromTable:](self, "addResultColumn:fromTable:", v5, v4);

}

- (NSString)tableName
{
  return self->_tableName;
}

- (void)addResultColumn:(id)a3 fromTable:(id)a4 alias:(id)a5
{
  void *v8;
  id v9;

  v9 = a5;
  +[EFSQLColumnExpression table:column:](EFSQLColumnExpression, "table:column:", a4, a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[EFSQLSelectStatement addResult:alias:](self, "addResult:alias:", v8, v9);

}

- (void)addResult:(id)a3 alias:(id)a4
{
  id v6;
  _EFSQLAliasedExpression *v7;
  void *v8;
  _EFSQLAliasedExpression *v9;

  v9 = (_EFSQLAliasedExpression *)a3;
  v6 = a4;
  if (v6)
  {
    v7 = -[_EFSQLAliasedExpression initWithExpression:alias:]([_EFSQLAliasedExpression alloc], "initWithExpression:alias:", v9, v6);

    v9 = v7;
  }
  -[EFSQLSelectStatement results](self, "results");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObject:", v9);

}

- (NSMutableArray)results
{
  return self->_results;
}

- (void)addResultColumn:(id)a3 fromTable:(id)a4
{
  -[EFSQLSelectStatement addResultColumn:fromTable:alias:](self, "addResultColumn:fromTable:alias:", a3, a4, 0);
}

uint64_t __51__EFSQLSelectStatement_ef_renderSQLExpressionInto___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "ef_renderSQLExpressionInto:", *(_QWORD *)(a1 + 32));
}

- (void)ef_renderSQLExpressionInto:(id)a3
{
  id v4;
  NSMutableArray *joinExpressions;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  objc_msgSend(v4, "appendString:", CFSTR("SELECT "));
  if (-[NSMutableArray count](self->_results, "count"))
  {
    if (self->_distinct)
      objc_msgSend(v4, "appendString:", CFSTR("DISTINCT "));
    -[NSMutableArray ef_renderSQLExpressionInto:](self->_results, "ef_renderSQLExpressionInto:", v4);
  }
  else
  {
    objc_msgSend(v4, "appendString:", CFSTR("NULL"));
  }
  if (self->_tableName)
    objc_msgSend(v4, "appendFormat:", CFSTR(" FROM %@"), self->_tableName);
  joinExpressions = self->_joinExpressions;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __51__EFSQLSelectStatement_ef_renderSQLExpressionInto___block_invoke;
  v7[3] = &unk_1E62A7480;
  v6 = v4;
  v8 = v6;
  -[NSMutableArray enumerateObjectsUsingBlock:](joinExpressions, "enumerateObjectsUsingBlock:", v7);
  if (self->_where)
  {
    objc_msgSend(v6, "appendString:", CFSTR(" WHERE "));
    -[EFSQLValueExpressable ef_renderSQLExpressionInto:](self->_where, "ef_renderSQLExpressionInto:", v6);
  }
  if (-[NSArray count](self->_groupExpressions, "count"))
  {
    objc_msgSend(v6, "appendString:", CFSTR(" GROUP BY "));
    -[NSArray ef_renderSQLExpressionInto:](self->_groupExpressions, "ef_renderSQLExpressionInto:", v6);
  }
  if (-[NSMutableArray count](self->_orderExpressions, "count"))
  {
    objc_msgSend(v6, "appendString:", CFSTR(" ORDER BY "));
    -[NSMutableArray ef_renderSQLExpressionInto:](self->_orderExpressions, "ef_renderSQLExpressionInto:", v6);
  }
  if (self->_limit)
    objc_msgSend(v6, "appendFormat:", CFSTR(" LIMIT %llu"), self->_limit);

}

- (void)orderByColumn:(id)a3 fromTable:(id)a4 ascending:(BOOL)a5
{
  id v6;

  +[EFSQLColumnExpression table:column:](EFSQLColumnExpression, "table:column:", a4, a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[EFSQLSelectStatement orderBy:ascending:](self, "orderBy:ascending:");

}

- (void)orderBy:(id)a3 ascending:(BOOL)a4
{
  _BOOL8 v4;
  EFSQLOrderExpression *v6;
  void *v7;
  id v8;

  v4 = a4;
  v8 = a3;
  v6 = -[EFSQLOrderExpression initWithExpression:ascending:]([EFSQLOrderExpression alloc], "initWithExpression:ascending:", v8, v4);
  -[EFSQLSelectStatement orderExpressions](self, "orderExpressions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObject:", v6);

}

- (NSMutableArray)orderExpressions
{
  return self->_orderExpressions;
}

- (id)join:(id)a3 alias:(id)a4 on:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  _EFSQLJoinExpression *v13;
  void *v14;
  void *v16;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  -[EFSQLSelectStatement tableName](self, "tableName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EFSQLSelectStatement.m"), 115, CFSTR("Can't JOIN on a SELECT without a base table"));

  }
  v13 = -[_EFSQLJoinExpression initWithSelect:tableName:tableAlias:joinConstraint:isLeftOuter:]([_EFSQLJoinExpression alloc], "initWithSelect:tableName:tableAlias:joinConstraint:isLeftOuter:", self, v9, v10, v11, 0);
  -[EFSQLSelectStatement joinExpressions](self, "joinExpressions");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addObject:", v13);

  return v13;
}

- (id)leftOuterJoin:(id)a3 alias:(id)a4 on:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  _EFSQLJoinExpression *v13;
  void *v14;
  void *v16;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  -[EFSQLSelectStatement tableName](self, "tableName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EFSQLSelectStatement.m"), 122, CFSTR("Can't JOIN on a SELECT without a base table"));

  }
  v13 = -[_EFSQLJoinExpression initWithSelect:tableName:tableAlias:joinConstraint:isLeftOuter:]([_EFSQLJoinExpression alloc], "initWithSelect:tableName:tableAlias:joinConstraint:isLeftOuter:", self, v9, v10, v11, 1);
  -[EFSQLSelectStatement joinExpressions](self, "joinExpressions");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addObject:", v13);

  return v13;
}

- (NSMutableArray)joinExpressions
{
  return self->_joinExpressions;
}

- (void)setLimit:(unint64_t)a3
{
  self->_limit = a3;
}

- (EFSQLValueExpressable)where
{
  return self->_where;
}

- (id)join:(id)a3 sourceColumn:(id)a4 targetColumn:(id)a5
{
  -[EFSQLSelectStatement join:alias:sourceColumn:targetColumn:](self, "join:alias:sourceColumn:targetColumn:", a3, 0, a4, a5);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (NSString)queryString
{
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[EFSQLSelectStatement ef_renderSQLExpressionInto:](self, "ef_renderSQLExpressionInto:", v3);
  return (NSString *)v3;
}

- (void)setWhere:(id)a3
{
  objc_storeStrong((id *)&self->_where, a3);
}

- (EFSQLSelectStatement)initWithResultColumn:(id)a3 table:(id)a4
{
  id v6;
  void *v7;
  EFSQLSelectStatement *v8;

  v6 = a4;
  +[EFSQLColumnExpression table:column:](EFSQLColumnExpression, "table:column:", v6, a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[EFSQLSelectStatement initWithResult:table:](self, "initWithResult:table:", v7, v6);

  return v8;
}

- (EFSQLSelectStatement)initWithResult:(id)a3 table:(id)a4
{
  id v6;
  id v7;
  EFSQLSelectStatement *v8;
  EFSQLSelectStatement *v9;

  v6 = a3;
  v7 = a4;
  v8 = -[EFSQLSelectStatement initWithTable:](self, "initWithTable:", v7);
  v9 = v8;
  if (v8)
    -[NSMutableArray addObject:](v8->_results, "addObject:", v6);

  return v9;
}

- (EFSQLSelectStatement)initWithTable:(id)a3
{
  id v4;
  EFSQLSelectStatement *v5;
  uint64_t v6;
  NSString *tableName;
  NSMutableArray *v8;
  NSMutableArray *results;
  NSMutableArray *v10;
  NSMutableArray *joinExpressions;
  NSMutableArray *v12;
  NSMutableArray *orderExpressions;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)EFSQLSelectStatement;
  v5 = -[EFSQLSelectStatement init](&v15, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    tableName = v5->_tableName;
    v5->_tableName = (NSString *)v6;

    v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    results = v5->_results;
    v5->_results = v8;

    v10 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    joinExpressions = v5->_joinExpressions;
    v5->_joinExpressions = v10;

    v12 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    orderExpressions = v5->_orderExpressions;
    v5->_orderExpressions = v12;

  }
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_orderExpressions, 0);
  objc_storeStrong((id *)&self->_groupExpressions, 0);
  objc_storeStrong((id *)&self->_joinExpressions, 0);
  objc_storeStrong((id *)&self->_results, 0);
  objc_storeStrong((id *)&self->_tableName, 0);
  objc_storeStrong((id *)&self->_where, 0);
}

- (id)leftOuterJoin:(id)a3 sourceColumn:(id)a4 targetColumn:(id)a5
{
  -[EFSQLSelectStatement leftOuterJoin:alias:sourceColumn:targetColumn:](self, "leftOuterJoin:alias:sourceColumn:targetColumn:", a3, 0, a4, a5);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)leftOuterJoin:(id)a3 alias:(id)a4 sourceColumn:(id)a5 targetColumn:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  -[EFSQLSelectStatement tableName](self, "tableName");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[EFSQLColumnExpression table:column:](EFSQLColumnExpression, "table:column:", v14, v12);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
    v16 = v11;
  else
    v16 = v10;
  +[EFSQLColumnExpression table:column:](EFSQLColumnExpression, "table:column:", v16, v13);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "equalTo:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[EFSQLSelectStatement leftOuterJoin:alias:on:](self, "leftOuterJoin:alias:on:", v10, v11, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

- (id)ef_SQLIsolatedExpression
{
  return +[EFParenthesizedSQLExpression parenthesizedValueCollectionExpressable:](EFParenthesizedSQLExpression, "parenthesizedValueCollectionExpressable:", self);
}

- (void)orderByColumn:(id)a3 ascending:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  id v7;

  v4 = a4;
  v7 = a3;
  -[EFSQLSelectStatement tableName](self, "tableName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[EFSQLSelectStatement orderByColumn:fromTable:ascending:](self, "orderByColumn:fromTable:ascending:", v7, v6, v4);

}

- (EFSQLSelectStatement)init
{
  return -[EFSQLSelectStatement initWithTable:](self, "initWithTable:", 0);
}

- (EFSQLSelectStatement)initWithResult:(id)a3
{
  return -[EFSQLSelectStatement initWithResult:table:](self, "initWithResult:table:", a3, 0);
}

- (EFSQLSelectStatement)initWithResultColumn:(id)a3
{
  return -[EFSQLSelectStatement initWithResultColumn:table:](self, "initWithResultColumn:table:", a3, 0);
}

- (void)addResultColumn:(id)a3 alias:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v8 = a3;
  v6 = a4;
  -[EFSQLSelectStatement tableName](self, "tableName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[EFSQLSelectStatement addResultColumn:fromTable:alias:](self, "addResultColumn:fromTable:alias:", v8, v7, v6);

}

- (id)join:(id)a3 on:(id)a4
{
  -[EFSQLSelectStatement join:alias:on:](self, "join:alias:on:", a3, 0, a4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)leftOuterJoin:(id)a3 on:(id)a4
{
  -[EFSQLSelectStatement leftOuterJoin:alias:on:](self, "leftOuterJoin:alias:on:", a3, 0, a4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)groupByColumn:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[EFSQLSelectStatement tableName](self, "tableName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[EFSQLSelectStatement groupByColumn:fromTable:](self, "groupByColumn:fromTable:", v5, v4);

}

- (void)groupByColumn:(id)a3 fromTable:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  +[EFSQLColumnExpression table:column:](EFSQLColumnExpression, "table:column:", v7, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[EFSQLSelectStatement setGroupExpressions:](self, "setGroupExpressions:", v9);

}

- (BOOL)distinct
{
  return self->_distinct;
}

- (void)setDistinct:(BOOL)a3
{
  self->_distinct = a3;
}

- (unint64_t)limit
{
  return self->_limit;
}

- (NSArray)groupExpressions
{
  return self->_groupExpressions;
}

- (void)setGroupExpressions:(id)a3
{
  objc_storeStrong((id *)&self->_groupExpressions, a3);
}

@end
