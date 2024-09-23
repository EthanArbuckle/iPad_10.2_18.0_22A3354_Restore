@implementation EFSQLIndexSchema

EFSQLIndexedColumnSchema *__63__EFSQLIndexSchema_initWithTableName_columnNames_where_unique___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  EFSQLIndexedColumnSchema *v3;

  v2 = a2;
  v3 = -[EFSQLIndexedColumnSchema initWithColumnName:]([EFSQLIndexedColumnSchema alloc], "initWithColumnName:", v2);

  return v3;
}

- (id)definitionWithDatabaseName:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  __CFString *v13;
  uint64_t v14;
  id v15;
  _BOOL4 v16;
  uint64_t v17;
  void *v18;
  const __CFString *v19;
  const __CFString *v20;
  void *v21;

  v4 = a3;
  if (objc_msgSend(v4, "length"))
  {
    v5 = objc_alloc(MEMORY[0x1E0CB3940]);
    -[EFSQLIndexSchema name](self, "name");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v5, "initWithFormat:", CFSTR("%@.%@"), v4, v6);

  }
  else
  {
    -[EFSQLIndexSchema name](self, "name");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[EFSQLIndexSchema indexedColumns](self, "indexedColumns");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "ef_mapSelector:", sel_definition);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "componentsJoinedByString:", CFSTR(", "));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[EFSQLIndexSchema where](self, "where");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "ef_SQLIsolatedExpression");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "ef_SQLExpression");
  v13 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    objc_msgSend(CFSTR(" WHERE "), "stringByAppendingString:", v13);
    v14 = objc_claimAutoreleasedReturnValue();

    v13 = (__CFString *)v14;
  }
  v15 = objc_alloc(MEMORY[0x1E0CB3940]);
  v16 = -[EFSQLIndexSchema unique](self, "unique");
  -[EFSQLIndexSchema tableName](self, "tableName");
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = (void *)v17;
  v19 = &stru_1E62A84D8;
  v20 = CFSTR("UNIQUE ");
  if (!v16)
    v20 = &stru_1E62A84D8;
  if (v13)
    v19 = v13;
  v21 = (void *)objc_msgSend(v15, "initWithFormat:", CFSTR("CREATE %@INDEX IF NOT EXISTS %@ ON %@(%@)%@;"),
                  v20,
                  v7,
                  v17,
                  v10,
                  v19);

  return v21;
}

- (NSString)tableName
{
  return self->_tableName;
}

- (EFSQLValueExpressable)where
{
  return self->_where;
}

- (BOOL)unique
{
  return self->_unique;
}

- (NSString)name
{
  return self->_name;
}

- (NSArray)indexedColumns
{
  return self->_indexedColumns;
}

- (EFSQLIndexSchema)initWithTableName:(id)a3 columnNames:(id)a4 where:(id)a5 unique:(BOOL)a6
{
  _BOOL8 v6;
  id v10;
  id v11;
  void *v12;
  EFSQLIndexSchema *v13;

  v6 = a6;
  v10 = a3;
  v11 = a5;
  objc_msgSend(a4, "ef_map:", &__block_literal_global_48);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[EFSQLIndexSchema initWithTableName:indexedColumns:where:unique:](self, "initWithTableName:indexedColumns:where:unique:", v10, v12, v11, v6);

  return v13;
}

- (EFSQLIndexSchema)initWithTableName:(id)a3 indexedColumns:(id)a4 where:(id)a5 unique:(BOOL)a6
{
  _BOOL8 v6;
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  uint64_t v15;
  void *v16;
  const __CFString *v17;
  void *v18;
  EFSQLIndexSchema *v19;

  v6 = a6;
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = objc_alloc(MEMORY[0x1E0CB3940]);
  objc_msgSend(v11, "ef_mapSelector:", sel_name);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "componentsJoinedByString:", CFSTR("_"));
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = (void *)v15;
  v17 = &stru_1E62A84D8;
  if (v6)
    v17 = CFSTR("unique_");
  v18 = (void *)objc_msgSend(v13, "initWithFormat:", CFSTR("%@_%@_%@index"), v10, v15, v17);

  v19 = -[EFSQLIndexSchema initWithName:tableName:indexedColumns:where:unique:](self, "initWithName:tableName:indexedColumns:where:unique:", v18, v10, v11, v12, v6);
  return v19;
}

- (EFSQLIndexSchema)initWithName:(id)a3 tableName:(id)a4 indexedColumns:(id)a5 where:(id)a6 unique:(BOOL)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  EFSQLIndexSchema *v16;
  uint64_t v17;
  NSString *name;
  uint64_t v19;
  NSString *tableName;
  uint64_t v21;
  NSArray *indexedColumns;
  objc_super v24;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v24.receiver = self;
  v24.super_class = (Class)EFSQLIndexSchema;
  v16 = -[EFSQLIndexSchema init](&v24, sel_init);
  if (v16)
  {
    v17 = objc_msgSend(v12, "copy");
    name = v16->_name;
    v16->_name = (NSString *)v17;

    v19 = objc_msgSend(v13, "copy");
    tableName = v16->_tableName;
    v16->_tableName = (NSString *)v19;

    v21 = objc_msgSend(v14, "copy");
    indexedColumns = v16->_indexedColumns;
    v16->_indexedColumns = (NSArray *)v21;

    objc_storeStrong((id *)&v16->_where, a6);
    v16->_unique = a7;
  }

  return v16;
}

- (EFSQLIndexSchema)initWithTableName:(id)a3 columnNames:(id)a4
{
  return -[EFSQLIndexSchema initWithTableName:columnNames:where:unique:](self, "initWithTableName:columnNames:where:unique:", a3, a4, 0, 0);
}

- (EFSQLIndexSchema)initWithTableName:(id)a3 indexedColumns:(id)a4
{
  return -[EFSQLIndexSchema initWithTableName:indexedColumns:where:unique:](self, "initWithTableName:indexedColumns:where:unique:", a3, a4, 0, 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_where, 0);
  objc_storeStrong((id *)&self->_indexedColumns, 0);
  objc_storeStrong((id *)&self->_tableName, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
