@implementation CCDatabaseUpdateBuilder

- (void)setCommandCriterion:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CCDatabaseUpdateBuilder;
  -[CCDatabaseCommandBuilder setCommandCriterion:](&v3, sel_setCommandCriterion_, a3);
}

- (CCDatabaseUpdateBuilder)initWithTableName:(id)a3
{
  CCDatabaseUpdateBuilder *v3;
  NSMutableArray *v4;
  NSMutableArray *columnNames;
  NSMutableArray *v6;
  NSMutableArray *columnValues;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CCDatabaseUpdateBuilder;
  v3 = -[CCDatabaseCommandBuilder initWithTableName:](&v9, sel_initWithTableName_, a3);
  if (v3)
  {
    v4 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    columnNames = v3->_columnNames;
    v3->_columnNames = v4;

    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    columnValues = v3->_columnValues;
    v3->_columnValues = v6;

  }
  return v3;
}

- (id)build
{
  void *v3;
  NSMutableArray *columnNames;
  NSMutableArray *columnValues;
  void *v6;
  void *v7;

  -[CCDatabaseCommandBuilder tableName](self, "tableName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  columnNames = self->_columnNames;
  columnValues = self->_columnValues;
  -[CCDatabaseCommandBuilder criterion](self, "criterion");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[CCSQLCommandGenerator updateWithTableName:columnNames:columnValues:criterion:returningColumns:](CCSQLCommandGenerator, "updateWithTableName:columnNames:columnValues:criterion:returningColumns:", v3, columnNames, columnValues, v6, self->_returningColumns);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)setValue:(id)a3 forColumn:(id)a4
{
  NSMutableArray *columnNames;
  id v7;

  columnNames = self->_columnNames;
  v7 = a3;
  -[NSMutableArray addObject:](columnNames, "addObject:", a4);
  -[NSMutableArray addObject:](self->_columnValues, "addObject:", v7);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_returningColumns, 0);
  objc_storeStrong((id *)&self->_columnValues, 0);
  objc_storeStrong((id *)&self->_columnNames, 0);
}

- (void)setReturningColumns:(id)a3
{
  NSArray *v4;
  NSArray *returningColumns;

  v4 = (NSArray *)objc_msgSend(a3, "copy");
  returningColumns = self->_returningColumns;
  self->_returningColumns = v4;

}

@end
