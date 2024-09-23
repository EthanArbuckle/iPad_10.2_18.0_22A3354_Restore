@implementation CCDatabaseSelectBuilder

- (void)setColumns:(id)a3 withTablePrefixes:(id)a4
{
  id v6;
  void *v7;
  unint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  v6 = a4;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(v12, "count"));
  if (objc_msgSend(v12, "count"))
  {
    v8 = 0;
    do
    {
      objc_msgSend(v12, "objectAtIndex:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v6, "count") <= v8)
      {
        v10 = 0;
      }
      else
      {
        objc_msgSend(v6, "objectAtIndex:", v8);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
      }
      +[CCSQLCommandGenerator prefixColumnName:withTableName:](CCSQLCommandGenerator, "prefixColumnName:withTableName:", v9, v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addObject:", v11);

      ++v8;
    }
    while (v8 < objc_msgSend(v12, "count"));
  }
  -[CCDatabaseSelectBuilder setColumns:](self, "setColumns:", v7);

}

- (void)setCommandCriterion:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CCDatabaseSelectBuilder;
  -[CCDatabaseCommandBuilder setCommandCriterion:](&v3, sel_setCommandCriterion_, a3);
}

- (CCDatabaseSelectBuilder)initWithTableName:(id)a3
{
  CCDatabaseSelectBuilder *v3;
  CCDatabaseSelectBuilder *v4;
  CCSQLCommandJoin *join;
  CCSQLCommandOrder *order;
  NSNumber *limit;
  NSNumber *offset;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)CCDatabaseSelectBuilder;
  v3 = -[CCDatabaseCommandBuilder initWithTableName:](&v10, sel_initWithTableName_, a3);
  v4 = v3;
  if (v3)
  {
    join = v3->_join;
    v3->_join = 0;

    order = v4->_order;
    v4->_order = 0;

    v4->_count = 0;
    limit = v4->_limit;
    v4->_limit = 0;

    offset = v4->_offset;
    v4->_offset = 0;

  }
  return v4;
}

- (id)build
{
  void *v3;
  NSArray *columns;
  _BOOL8 count;
  CCSQLCommandJoin *join;
  void *v7;
  void *v8;

  -[CCDatabaseCommandBuilder tableName](self, "tableName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  columns = self->_columns;
  count = self->_count;
  join = self->_join;
  -[CCDatabaseCommandBuilder criterion](self, "criterion");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[CCSQLCommandGenerator selectFromTableWithName:columns:count:join:criterion:order:limit:offset:](CCSQLCommandGenerator, "selectFromTableWithName:columns:count:join:criterion:order:limit:offset:", v3, columns, count, join, v7, self->_order, self->_limit, self->_offset);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_offset, 0);
  objc_storeStrong((id *)&self->_limit, 0);
  objc_storeStrong((id *)&self->_columns, 0);
  objc_storeStrong((id *)&self->_order, 0);
  objc_storeStrong((id *)&self->_join, 0);
}

- (void)setCount:(BOOL)a3
{
  self->_count = a3;
}

- (void)setColumns:(id)a3
{
  NSArray *v4;
  NSArray *columns;

  v4 = (NSArray *)objc_msgSend(a3, "copy");
  columns = self->_columns;
  self->_columns = v4;

}

- (void)setJoinWithType:(int64_t)a3 tables:(id)a4
{
  id v6;
  CCSQLCommandJoin *v7;
  CCSQLCommandJoin *join;

  v6 = a4;
  v7 = -[CCSQLCommandJoin initWithJoinType:joinTables:]([CCSQLCommandJoin alloc], "initWithJoinType:joinTables:", a3, v6);

  join = self->_join;
  self->_join = v7;

}

- (void)setCommandOrder:(id)a3
{
  CCSQLCommandOrder *v4;
  CCSQLCommandOrder *order;

  v4 = (CCSQLCommandOrder *)objc_msgSend(a3, "copy");
  order = self->_order;
  self->_order = v4;

}

- (void)setLimit:(id)a3
{
  objc_storeStrong((id *)&self->_limit, a3);
}

- (void)setOffset:(id)a3
{
  objc_storeStrong((id *)&self->_offset, a3);
}

@end
