@implementation IKColumnCollectionElement

- (id)applyUpdatesWithElement:(id)a3
{
  NSArray *columns;
  id v5;
  void *v6;
  objc_super v8;

  columns = self->_columns;
  self->_columns = 0;
  v5 = a3;

  v8.receiver = self;
  v8.super_class = (Class)IKColumnCollectionElement;
  -[IKViewElement applyUpdatesWithElement:](&v8, sel_applyUpdatesWithElement_, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSArray)columns
{
  NSArray *columns;
  NSArray *v4;
  NSArray *v5;

  columns = self->_columns;
  if (!columns)
  {
    -[IKViewElement childElementsWithType:](self, "childElementsWithType:", 21);
    v4 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v5 = self->_columns;
    self->_columns = v4;

    columns = self->_columns;
  }
  return columns;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_columns, 0);
}

@end
