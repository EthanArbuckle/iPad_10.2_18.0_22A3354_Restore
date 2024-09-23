@implementation CCDatabaseDeleteBuilder

- (id)build
{
  void *v3;
  void *v4;
  void *v5;

  -[CCDatabaseCommandBuilder tableName](self, "tableName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CCDatabaseCommandBuilder criterion](self, "criterion");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[CCSQLCommandGenerator deleteFromTableWithName:criterion:returningColumns:](CCSQLCommandGenerator, "deleteFromTableWithName:criterion:returningColumns:", v3, v4, self->_returningColumns);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)setCommandCriterion:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CCDatabaseDeleteBuilder;
  -[CCDatabaseCommandBuilder setCommandCriterion:](&v3, sel_setCommandCriterion_, a3);
}

- (void)setReturningColumns:(id)a3
{
  NSArray *v4;
  NSArray *returningColumns;

  v4 = (NSArray *)objc_msgSend(a3, "copy");
  returningColumns = self->_returningColumns;
  self->_returningColumns = v4;

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_returningColumns, 0);
}

@end
