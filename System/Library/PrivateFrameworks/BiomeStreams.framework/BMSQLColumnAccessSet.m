@implementation BMSQLColumnAccessSet

- (BMSQLColumnAccessSet)initWithTable:(id)a3 columns:(id)a4
{
  id v6;
  id v7;
  BMSQLColumnAccessSet *v8;
  uint64_t v9;
  NSString *table;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)BMSQLColumnAccessSet;
  v8 = -[BMSQLColumnAccessSet init](&v12, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    table = v8->_table;
    v8->_table = (NSString *)v9;

    objc_storeStrong((id *)&v8->_columns, a4);
  }

  return v8;
}

- (BOOL)checkTable:(id)a3 column:(id)a4
{
  id v6;
  void *v7;
  BOOL v8;

  v6 = a4;
  v7 = v6;
  v8 = 0;
  if (a3 && v6)
  {
    if (-[NSString isEqualToString:](self->_table, "isEqualToString:", a3))
      v8 = -[NSSet containsObject:](self->_columns, "containsObject:", v7);
    else
      v8 = 0;
  }

  return v8;
}

- (id)description
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("<%@ %p> table: %@, columns: %@"), objc_opt_class(), self, self->_table, self->_columns);
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[BMSQLColumnAccessSet table](self, "table");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "table");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "isEqual:", v7))
    {
      -[BMSQLColumnAccessSet columns](self, "columns");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "columns");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v8, "isEqualToSet:", v9);

    }
    else
    {
      v10 = 0;
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (NSString)table
{
  return self->_table;
}

- (NSSet)columns
{
  return self->_columns;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_columns, 0);
  objc_storeStrong((id *)&self->_table, 0);
}

@end
