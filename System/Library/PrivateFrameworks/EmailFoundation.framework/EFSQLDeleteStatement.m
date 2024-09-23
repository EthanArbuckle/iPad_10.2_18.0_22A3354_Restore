@implementation EFSQLDeleteStatement

- (EFSQLDeleteStatement)initWithTable:(id)a3
{
  return -[EFSQLDeleteStatement initWithTable:where:](self, "initWithTable:where:", a3, 0);
}

- (EFSQLDeleteStatement)initWithTable:(id)a3 where:(id)a4
{
  id v7;
  id v8;
  EFSQLDeleteStatement *v9;
  EFSQLDeleteStatement *v10;
  NSMutableArray *v11;
  NSMutableArray *orderExpressions;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)EFSQLDeleteStatement;
  v9 = -[EFSQLDeleteStatement init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_table, a3);
    objc_storeStrong((id *)&v10->_where, a4);
    v11 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    orderExpressions = v10->_orderExpressions;
    v10->_orderExpressions = v11;

  }
  return v10;
}

- (void)orderBy:(id)a3 ascending:(BOOL)a4
{
  _BOOL8 v4;
  EFSQLOrderExpression *v6;
  NSMutableArray *orderExpressions;
  id v8;

  v4 = a4;
  v8 = a3;
  v6 = -[EFSQLOrderExpression initWithExpression:ascending:]([EFSQLOrderExpression alloc], "initWithExpression:ascending:", v8, v4);
  if (self)
    orderExpressions = self->_orderExpressions;
  else
    orderExpressions = 0;
  -[NSMutableArray addObject:](orderExpressions, "addObject:", v6);

}

- (void)orderByColumn:(id)a3 ascending:(BOOL)a4
{
  id v5;

  +[EFSQLColumnExpression column:](EFSQLColumnExpression, "column:", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[EFSQLDeleteStatement orderBy:ascending:](self, "orderBy:ascending:");

}

- (NSString)queryString
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("DELETE FROM %@"), self->_table);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (self->_where)
  {
    objc_msgSend(v3, "appendString:", CFSTR(" WHERE "));
    -[EFSQLValueExpressable ef_renderSQLExpressionInto:](self->_where, "ef_renderSQLExpressionInto:", v4);
  }
  if (-[NSMutableArray count](self->_orderExpressions, "count"))
  {
    objc_msgSend(v4, "appendString:", CFSTR(" ORDER BY "));
    -[NSMutableArray ef_renderSQLExpressionInto:](self->_orderExpressions, "ef_renderSQLExpressionInto:", v4);
  }
  if (self->_limit)
    objc_msgSend(v4, "appendFormat:", CFSTR(" LIMIT %llu"), self->_limit);
  return (NSString *)v4;
}

- (EFSQLValueExpressable)where
{
  return self->_where;
}

- (void)setWhere:(id)a3
{
  objc_storeStrong((id *)&self->_where, a3);
}

- (unint64_t)limit
{
  return self->_limit;
}

- (void)setLimit:(unint64_t)a3
{
  self->_limit = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_orderExpressions, 0);
  objc_storeStrong((id *)&self->_table, 0);
  objc_storeStrong((id *)&self->_where, 0);
}

@end
