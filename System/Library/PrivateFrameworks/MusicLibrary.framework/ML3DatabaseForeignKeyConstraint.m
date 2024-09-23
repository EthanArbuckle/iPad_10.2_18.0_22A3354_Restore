@implementation ML3DatabaseForeignKeyConstraint

- (ML3DatabaseForeignKeyConstraint)initWithForeignTable:(id)a3 localColumns:(id)a4 foreignColumns:(id)a5
{
  id v9;
  id v10;
  id v11;
  ML3DatabaseForeignKeyConstraint *v12;
  ML3DatabaseForeignKeyConstraint *v13;
  uint64_t v14;
  NSArray *localColumns;
  uint64_t v16;
  NSArray *foreignColumns;
  objc_super v19;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v19.receiver = self;
  v19.super_class = (Class)ML3DatabaseForeignKeyConstraint;
  v12 = -[ML3DatabaseForeignKeyConstraint init](&v19, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_foreignTable, a3);
    v14 = objc_msgSend(v10, "copy");
    localColumns = v13->_localColumns;
    v13->_localColumns = (NSArray *)v14;

    v16 = objc_msgSend(v11, "copy");
    foreignColumns = v13->_foreignColumns;
    v13->_foreignColumns = (NSArray *)v16;

  }
  return v13;
}

- (id)_foreignKeyClauseSQL
{
  NSUInteger v4;
  id v5;
  NSArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  NSArray *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v4 = -[NSArray count](self->_localColumns, "count");
  if (v4 != -[NSArray count](self->_foreignColumns, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ML3DatabaseForeignKeyConstraint.m"), 34, CFSTR("Number of local columns (%lu) does not match the number of foreign columns (%lu)"), -[NSArray count](self->_localColumns, "count"), -[NSArray count](self->_foreignColumns, "count"));

  }
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v6 = self->_localColumns;
  v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v31;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v31 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v30 + 1) + 8 * v10), "name");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
    }
    while (v8);
  }

  v12 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v13 = self->_foreignColumns;
  v14 = -[NSArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v27;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v27 != v16)
          objc_enumerationMutation(v13);
        objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * v17), "name");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "addObject:", v18);

        ++v17;
      }
      while (v15 != v17);
      v15 = -[NSArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
    }
    while (v15);
  }

  objc_msgSend(v5, "componentsJoinedByString:", CFSTR(", "));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "componentsJoinedByString:", CFSTR(", "));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (void *)MEMORY[0x1E0CB3940];
  -[ML3DatabaseTable name](self->_foreignTable, "name");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "stringWithFormat:", CFSTR("FOREIGN KEY (%@) REFERENCES %@ (%@)"), v19, v22, v20);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  return v23;
}

- (ML3DatabaseTable)foreignTable
{
  return self->_foreignTable;
}

- (NSArray)localColumns
{
  return self->_localColumns;
}

- (NSArray)foreignColumns
{
  return self->_foreignColumns;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_foreignColumns, 0);
  objc_storeStrong((id *)&self->_localColumns, 0);
  objc_storeStrong((id *)&self->_foreignTable, 0);
}

@end
