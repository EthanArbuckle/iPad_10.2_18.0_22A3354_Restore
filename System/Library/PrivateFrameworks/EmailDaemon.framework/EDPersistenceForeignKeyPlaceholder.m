@implementation EDPersistenceForeignKeyPlaceholder

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tableName, 0);
  objc_storeStrong((id *)&self->_column, 0);
}

- (EDPersistenceForeignKeyPlaceholder)initWithColumn:(id)a3 tableName:(id)a4 onDelete:(unint64_t)a5 onUpdate:(unint64_t)a6
{
  id v11;
  id v12;
  EDPersistenceForeignKeyPlaceholder *v13;
  EDPersistenceForeignKeyPlaceholder *v14;
  uint64_t v15;
  NSString *tableName;
  objc_super v18;

  v11 = a3;
  v12 = a4;
  v18.receiver = self;
  v18.super_class = (Class)EDPersistenceForeignKeyPlaceholder;
  v13 = -[EDPersistenceForeignKeyPlaceholder init](&v18, sel_init);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_column, a3);
    v15 = objc_msgSend(v12, "copy");
    tableName = v14->_tableName;
    v14->_tableName = (NSString *)v15;

    v14->_deleteAction = a5;
    v14->_updateAction = a6;
  }

  return v14;
}

- (BOOL)resolveWithSchema:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[EDPersistenceForeignKeyPlaceholder tableName](self, "tableName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "tableForName:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[EDPersistenceForeignKeyPlaceholder column](self, "column");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setAsForeignKeyForTable:onDelete:onUpdate:", v6, -[EDPersistenceForeignKeyPlaceholder deleteAction](self, "deleteAction"), -[EDPersistenceForeignKeyPlaceholder updateAction](self, "updateAction"));

  }
  return v6 != 0;
}

- (unint64_t)updateAction
{
  return self->_updateAction;
}

- (NSString)tableName
{
  return self->_tableName;
}

- (unint64_t)deleteAction
{
  return self->_deleteAction;
}

- (EFSQLColumnSchema)column
{
  return self->_column;
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
  v10.super_class = (Class)EDPersistenceForeignKeyPlaceholder;
  -[EDPersistenceForeignKeyPlaceholder description](&v10, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[EDPersistenceForeignKeyPlaceholder column](self, "column");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fullNameWithDatabaseName:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[EDPersistenceForeignKeyPlaceholder tableName](self, "tableName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("%@ %@ -> %@"), v4, v6, v7);

  return v8;
}

- (BOOL)resolveToStringForTableNames:(id)a3
{
  id v4;
  void *v5;
  char v6;
  id v7;
  void *v8;
  void *v9;

  v4 = a3;
  -[EDPersistenceForeignKeyPlaceholder tableName](self, "tableName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "containsObject:", v5);
  if ((v6 & 1) != 0)
  {
    v7 = objc_alloc(MEMORY[0x1E0CB3940]);
    v8 = (void *)objc_msgSend(v7, "initWithFormat:", CFSTR("%@(%@)"), v5, *MEMORY[0x1E0D1EE00]);
    -[EDPersistenceForeignKeyPlaceholder column](self, "column");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setAsForeignKeyForString:onDelete:onUpdate:", v8, -[EDPersistenceForeignKeyPlaceholder deleteAction](self, "deleteAction"), -[EDPersistenceForeignKeyPlaceholder updateAction](self, "updateAction"));

  }
  return v6;
}

@end
