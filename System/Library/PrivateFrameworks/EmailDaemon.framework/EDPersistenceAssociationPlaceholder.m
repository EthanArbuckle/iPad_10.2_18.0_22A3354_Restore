@implementation EDPersistenceAssociationPlaceholder

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tableName, 0);
  objc_storeStrong((id *)&self->_column, 0);
}

- (BOOL)resolveWithSchema:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[EDPersistenceAssociationPlaceholder tableName](self, "tableName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "tableForName:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[EDPersistenceAssociationPlaceholder column](self, "column");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "associateWithTable:", v6);

  }
  return v6 != 0;
}

- (NSString)tableName
{
  return self->_tableName;
}

- (EFSQLColumnSchema)column
{
  return self->_column;
}

- (EDPersistenceAssociationPlaceholder)initWithColumn:(id)a3 tableName:(id)a4
{
  id v7;
  id v8;
  EDPersistenceAssociationPlaceholder *v9;
  EDPersistenceAssociationPlaceholder *v10;
  uint64_t v11;
  NSString *tableName;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)EDPersistenceAssociationPlaceholder;
  v9 = -[EDPersistenceAssociationPlaceholder init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_column, a3);
    v11 = objc_msgSend(v8, "copy");
    tableName = v10->_tableName;
    v10->_tableName = (NSString *)v11;

  }
  return v10;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  v10.receiver = self;
  v10.super_class = (Class)EDPersistenceAssociationPlaceholder;
  -[EDPersistenceAssociationPlaceholder description](&v10, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[EDPersistenceAssociationPlaceholder column](self, "column");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fullNameWithDatabaseName:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[EDPersistenceAssociationPlaceholder tableName](self, "tableName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("%@ %@ -> %@"), v4, v6, v7);

  return v8;
}

@end
