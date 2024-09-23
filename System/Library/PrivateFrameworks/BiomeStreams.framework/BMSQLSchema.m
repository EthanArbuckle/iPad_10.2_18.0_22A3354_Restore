@implementation BMSQLSchema

- (NSArray)columns
{
  return self->_columns;
}

- (BMSQLSchema)initWithTableName:(id)a3 columns:(id)a4
{
  id v6;
  id v7;
  BMSQLSchema *v8;
  uint64_t v9;
  NSString *tableName;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)BMSQLSchema;
  v8 = -[BMSQLSchema init](&v12, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    tableName = v8->_tableName;
    v8->_tableName = (NSString *)v9;

    objc_storeStrong((id *)&v8->_columns, a4);
  }

  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_columns, 0);
  objc_storeStrong((id *)&self->_tableName, 0);
}

- (id)createTableSQL
{
  id v3;
  void *v4;
  uint64_t v5;
  unint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  unint64_t v14;
  void *v15;

  v3 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  objc_msgSend(v3, "appendFormat:", CFSTR("CREATE TABLE IF NOT EXISTS \"%@\"(\n"), self->_tableName);
  -[BMSQLSchema columns](self, "columns");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (v5)
  {
    v6 = 0;
    do
    {
      -[BMSQLSchema columns](self, "columns");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectAtIndexedSubscript:", v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v3, "appendString:", CFSTR("\t"));
      objc_msgSend(v8, "name");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "appendFormat:", CFSTR("\"%@\"), v9);

      BMSQLDataTypeToString(objc_msgSend(v8, "dataType"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "appendFormat:", CFSTR(" %@"), v10);

      if (objc_msgSend(v8, "requestOnly"))
        objc_msgSend(v3, "appendString:", CFSTR(" HIDDEN"));
      -[BMSQLSchema columns](self, "columns");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "count") - 1;

      if (v6 != v12)
        objc_msgSend(v3, "appendString:", CFSTR(","));
      objc_msgSend(v3, "appendString:", CFSTR("\n"));

      ++v6;
      -[BMSQLSchema columns](self, "columns");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "count");

    }
    while (v6 < v14);
  }
  objc_msgSend(v3, "appendString:", CFSTR(")"));
  v15 = (void *)objc_msgSend(v3, "copy");

  return v15;
}

- (id)insertSQL
{
  void *v3;
  void *v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  NSString *tableName;
  void *v16;
  void *v17;
  void *v18;
  BMSQLSchema *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  v4 = (void *)objc_opt_new();
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v20 = self;
  v5 = self->_columns;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v22;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v22 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * v9);
        v11 = objc_alloc(MEMORY[0x1E0CB3940]);
        objc_msgSend(v10, "name");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = (void *)objc_msgSend(v11, "initWithFormat:", CFSTR("\"%@\"), v12);
        objc_msgSend(v3, "addObject:", v13);

        objc_msgSend(v4, "addObject:", CFSTR("?"));
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v7);
  }

  v14 = objc_alloc(MEMORY[0x1E0CB3940]);
  tableName = v20->_tableName;
  objc_msgSend(v3, "componentsJoinedByString:", CFSTR(","));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "componentsJoinedByString:", CFSTR(","));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v14, "initWithFormat:", CFSTR("INSERT INTO %@ (%@) VALUES (%@)"), tableName, v16, v17);

  return v18;
}

- (id)description
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  v4 = objc_opt_class();
  -[BMSQLSchema createTableSQL](self, "createTableSQL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<%@ %p> sql: '%@'"), v4, self, v5);

  return v6;
}

- (unint64_t)hash
{
  unint64_t v3;
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = -[NSString hash](self->_tableName, "hash");
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v4 = self->_columns;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        v3 ^= objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v8++), "hash", (_QWORD)v10);
      }
      while (v6 != v8);
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  NSString *tableName;
  void *v7;
  NSArray *columns;
  void *v9;
  char v10;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    tableName = self->_tableName;
    objc_msgSend(v5, "tableName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[NSString isEqual:](tableName, "isEqual:", v7))
    {
      columns = self->_columns;
      objc_msgSend(v5, "columns");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = -[NSArray isEqual:](columns, "isEqual:", v9);

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

- (NSString)tableName
{
  return self->_tableName;
}

@end
