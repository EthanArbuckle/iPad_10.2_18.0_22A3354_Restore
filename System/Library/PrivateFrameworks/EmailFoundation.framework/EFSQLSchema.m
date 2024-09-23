@implementation EFSQLSchema

id __57__EFSQLSchema_definitionWithDatabaseName_includeIndexes___block_invoke(uint64_t a1, void *a2)
{
  objc_msgSend(a2, "definitionWithDatabaseName:includeIndexes:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)tableForName:(id)a3
{
  -[NSDictionary objectForKeyedSubscript:](self->_tablesByName, "objectForKeyedSubscript:", a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (NSArray)tables
{
  return -[NSDictionary allValues](self->_tablesByName, "allValues");
}

- (id)definitionWithDatabaseName:(id)a3
{
  -[EFSQLSchema definitionWithDatabaseName:includeIndexes:](self, "definitionWithDatabaseName:includeIndexes:", a3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)definitionWithDatabaseName:(id)a3 includeIndexes:(BOOL)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v12;
  uint64_t v13;
  id (*v14)(uint64_t, void *);
  void *v15;
  id v16;
  BOOL v17;

  v6 = a3;
  -[NSDictionary allValues](self->_tablesByName, "allValues");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = MEMORY[0x1E0C809B0];
  v13 = 3221225472;
  v14 = __57__EFSQLSchema_definitionWithDatabaseName_includeIndexes___block_invoke;
  v15 = &unk_1E62A7430;
  v8 = v6;
  v16 = v8;
  v17 = a4;
  objc_msgSend(v7, "ef_map:", &v12);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "componentsJoinedByString:", CFSTR("\n\n"), v12, v13, v14, v15);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (EFSQLSchema)initWithTables:(id)a3
{
  id v4;
  EFSQLSchema *v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  uint64_t v13;
  NSDictionary *tablesByName;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  objc_super v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)EFSQLSchema;
  v5 = -[EFSQLSchema init](&v20, sel_init);
  if (v5)
  {
    v6 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v7 = v4;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
    if (v8)
    {
      v9 = *(_QWORD *)v17;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v17 != v9)
            objc_enumerationMutation(v7);
          v11 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
          objc_msgSend(v11, "name", (_QWORD)v16);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "setObject:forKeyedSubscript:", v11, v12);

        }
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
      }
      while (v8);
    }

    v13 = objc_msgSend(v6, "copy");
    tablesByName = v5->_tablesByName;
    v5->_tablesByName = (NSDictionary *)v13;

  }
  return v5;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  v8.receiver = self;
  v8.super_class = (Class)EFSQLSchema;
  -[EFSQLSchema description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary allValues](self->_tablesByName, "allValues");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("%@ [%@]"), v4, v5);

  return v6;
}

- (id)indexDefinitionsWithDatabaseName:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  __CFString *v8;
  _QWORD v10[4];
  id v11;

  v4 = a3;
  -[NSDictionary allValues](self->_tablesByName, "allValues");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __48__EFSQLSchema_indexDefinitionsWithDatabaseName___block_invoke;
  v10[3] = &unk_1E62A7458;
  v6 = v4;
  v11 = v6;
  objc_msgSend(v5, "ef_compactMap:", v10);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v7, "count"))
  {
    objc_msgSend(v7, "componentsJoinedByString:", CFSTR("\n\n"));
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = &stru_1E62A84D8;
  }

  return v8;
}

id __48__EFSQLSchema_indexDefinitionsWithDatabaseName___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(a2, "indexDefinitionsWithDatabaseName:", *(_QWORD *)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "length"))
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tablesByName, 0);
}

@end
