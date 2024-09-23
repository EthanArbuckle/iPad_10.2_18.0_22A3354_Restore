@implementation ML3DatabaseTable

- (id)copyWithZone:(_NSZone *)a3
{
  return -[ML3DatabaseTable _copyWithZone:concreteClass:](self, "_copyWithZone:concreteClass:", a3, objc_opt_class());
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return -[ML3DatabaseTable _copyWithZone:concreteClass:](self, "_copyWithZone:concreteClass:", a3, objc_opt_class());
}

- (id)columnDefinitionsSQL
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[ML3DatabaseTable columns](self, "columns", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v8), "_columnDefinitionSQL");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

  objc_msgSend(v3, "componentsJoinedByString:", CFSTR(", "));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)createTableSQLWithExistenceClause:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  __CFString *v14;
  __CFString *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v3 = a3;
  v28 = *MEMORY[0x1E0C80C00];
  -[ML3DatabaseTable columnDefinitionsSQL](self, "columnDefinitionsSQL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  -[ML3DatabaseTable foreignKeyConstraints](self, "foreignKeyConstraints");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v24;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v24 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * v11), "_foreignKeyClauseSQL");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "addObject:", v12);

        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v9);
  }

  objc_msgSend(v6, "componentsJoinedByString:", CFSTR(", "));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = &stru_1E5B66908;
  if (v3)
    v14 = CFSTR(" IF NOT EXISTS");
  v15 = v14;
  v16 = objc_msgSend(v6, "count");
  v17 = (void *)MEMORY[0x1E0CB3940];
  -[ML3DatabaseTable name](self, "name");
  v18 = objc_claimAutoreleasedReturnValue();
  v19 = (void *)v18;
  if (v16)
    objc_msgSend(v17, "stringWithFormat:", CFSTR("CREATE TABLE%@ %@ (%@, %@)"), v15, v18, v5, v13);
  else
    objc_msgSend(v17, "stringWithFormat:", CFSTR("CREATE TABLE%@ %@ (%@)"), v15, v18, v5, v22);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

- (id)_copyWithZone:(_NSZone *)a3 concreteClass:(Class)a4
{
  objc_class *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;

  v5 = -[objc_class init](-[objc_class allocWithZone:](a4, "allocWithZone:", a3), "init");
  -[ML3DatabaseTable name](self, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "copy");
  v8 = (void *)*((_QWORD *)v5 + 1);
  *((_QWORD *)v5 + 1) = v7;

  -[ML3DatabaseTable columns](self, "columns");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "copy");
  v11 = (void *)*((_QWORD *)v5 + 2);
  *((_QWORD *)v5 + 2) = v10;

  -[ML3DatabaseTable foreignKeyConstraints](self, "foreignKeyConstraints");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "copy");
  v14 = (void *)*((_QWORD *)v5 + 3);
  *((_QWORD *)v5 + 3) = v13;

  return v5;
}

- (NSString)name
{
  return self->_name;
}

- (NSArray)columns
{
  return self->_columns;
}

- (NSArray)foreignKeyConstraints
{
  return self->_foreignKeyConstraints;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_foreignKeyConstraints, 0);
  objc_storeStrong((id *)&self->_columns, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
