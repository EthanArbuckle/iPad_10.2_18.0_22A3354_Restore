@implementation EFSQLTableSchema

- (EFSQLTableSchema)initWithName:(id)a3 rowIDType:(unint64_t)a4 rowIDAlias:(id)a5 columns:(id)a6 primaryKeyColumns:(id)a7 conflictResolution:(unint64_t)a8
{
  id v14;
  EFSQLTableSchema *v15;
  EFSQLTableSchema *v16;
  uint64_t v17;
  NSMutableArray *columns;
  NSMutableDictionary *v19;
  NSMutableDictionary *columnsByName;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  void *v25;
  NSMutableDictionary *v26;
  void *v27;
  id v28;
  uint64_t v29;
  NSString *rowIDColumnName;
  uint64_t v31;
  NSArray *primaryKeyColumns;
  NSMutableArray *v33;
  NSMutableArray *uniquenessConstraints;
  NSMutableArray *v35;
  NSMutableArray *checkConstraints;
  uint64_t v37;
  NSHashTable *foreignKeyReferences;
  uint64_t v39;
  NSHashTable *associatedColumns;
  NSMutableArray *v41;
  NSMutableArray *indexes;
  void *v44;
  id v47;
  id v48;
  id v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  objc_super v54;
  _BYTE v55[128];
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v47 = a3;
  v48 = a5;
  v14 = a6;
  v49 = a7;
  v54.receiver = self;
  v54.super_class = (Class)EFSQLTableSchema;
  v15 = -[EFSQLTableSchema init](&v54, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_name, a3);
    v17 = objc_msgSend(v14, "mutableCopy");
    columns = v16->_columns;
    v16->_columns = (NSMutableArray *)v17;

    v19 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    columnsByName = v16->_columnsByName;
    v16->_columnsByName = v19;

    v52 = 0u;
    v53 = 0u;
    v50 = 0u;
    v51 = 0u;
    v21 = v14;
    v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v50, v55, 16);
    if (v22)
    {
      v23 = *(_QWORD *)v51;
      do
      {
        for (i = 0; i != v22; ++i)
        {
          if (*(_QWORD *)v51 != v23)
            objc_enumerationMutation(v21);
          v25 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * i);
          objc_msgSend(v25, "setTable:", v16);
          v26 = v16->_columnsByName;
          objc_msgSend(v25, "name");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableDictionary setObject:forKeyedSubscript:](v26, "setObject:forKeyedSubscript:", v25, v27);

        }
        v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v50, v55, 16);
      }
      while (v22);
    }

    if (a4 - 1 >= 2)
    {
      if (!a4)
      {
        if (!objc_msgSend(v49, "count"))
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v44, "handleFailureInMethod:object:file:lineNumber:description:", a2, v16, CFSTR("EFSQLTableSchema.m"), 72, CFSTR("No primary key columns specified"));

        }
        -[EFSQLTableSchema _columnsForColumnNames:](v16, "_columnsForColumnNames:", v49);
        v31 = objc_claimAutoreleasedReturnValue();
        primaryKeyColumns = v16->_primaryKeyColumns;
        v16->_primaryKeyColumns = (NSArray *)v31;

        v16->_primaryKeyConflictResolution = a8;
      }
    }
    else
    {
      v28 = -[EFSQLColumnSchema initRowIDWithAlias:isAutoincrementing:]([EFSQLColumnSchema alloc], "initRowIDWithAlias:isAutoincrementing:", v48, a4 == 2);
      objc_msgSend(v28, "setTable:", v16);
      -[NSMutableArray insertObject:atIndex:](v16->_columns, "insertObject:atIndex:", v28, 0);
      objc_msgSend(v28, "name");
      v29 = objc_claimAutoreleasedReturnValue();
      rowIDColumnName = v16->_rowIDColumnName;
      v16->_rowIDColumnName = (NSString *)v29;

      -[NSMutableDictionary setObject:forKeyedSubscript:](v16->_columnsByName, "setObject:forKeyedSubscript:", v28, v16->_rowIDColumnName);
    }
    v33 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    uniquenessConstraints = v16->_uniquenessConstraints;
    v16->_uniquenessConstraints = v33;

    v35 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    checkConstraints = v16->_checkConstraints;
    v16->_checkConstraints = v35;

    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v37 = objc_claimAutoreleasedReturnValue();
    foreignKeyReferences = v16->_foreignKeyReferences;
    v16->_foreignKeyReferences = (NSHashTable *)v37;

    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v39 = objc_claimAutoreleasedReturnValue();
    associatedColumns = v16->_associatedColumns;
    v16->_associatedColumns = (NSHashTable *)v39;

    v41 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    indexes = v16->_indexes;
    v16->_indexes = v41;

  }
  return v16;
}

id __43__EFSQLTableSchema__columnsForColumnNames___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v6;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "columnForName:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), CFSTR("EFSQLTableSchema.m"), 218, CFSTR("No matching column for column name: %@"), v3);

  }
  return v4;
}

- (id)columnForName:(id)a3
{
  -[NSMutableDictionary objectForKeyedSubscript:](self->_columnsByName, "objectForKeyedSubscript:", a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

id __62__EFSQLTableSchema_definitionWithDatabaseName_includeIndexes___block_invoke(uint64_t a1, void *a2)
{
  objc_msgSend(a2, "definition");
  return (id)objc_claimAutoreleasedReturnValue();
}

id __62__EFSQLTableSchema_definitionWithDatabaseName_includeIndexes___block_invoke_3(uint64_t a1, void *a2)
{
  objc_msgSend(a2, "name");
  return (id)objc_claimAutoreleasedReturnValue();
}

id __53__EFSQLTableSchema_indexDefinitionsWithDatabaseName___block_invoke(uint64_t a1, void *a2)
{
  objc_msgSend(a2, "definitionWithDatabaseName:", *(_QWORD *)(a1 + 32));
  return (id)objc_claimAutoreleasedReturnValue();
}

- (NSString)name
{
  return self->_name;
}

- (void)addIndex:(id)a3
{
  void *v4;
  void *v5;
  int v6;
  id v7;

  v7 = a3;
  objc_msgSend(v7, "tableName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[EFSQLTableSchema name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isEqualToString:", v5);

  if (v6)
    -[NSMutableArray addObject:](self->_indexes, "addObject:", v7);

}

- (EFSQLColumnSchema)rowIDColumn
{
  NSMutableDictionary *columnsByName;
  void *v3;
  void *v4;

  columnsByName = self->_columnsByName;
  -[EFSQLTableSchema rowIDColumnName](self, "rowIDColumnName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](columnsByName, "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (EFSQLColumnSchema *)v4;
}

- (NSString)rowIDColumnName
{
  return self->_rowIDColumnName;
}

- (void)addForeignKeyReference:(id)a3
{
  -[NSHashTable addObject:](self->_foreignKeyReferences, "addObject:", a3);
}

- (void)addAssociatedColumn:(id)a3
{
  -[NSHashTable addObject:](self->_associatedColumns, "addObject:", a3);
}

- (NSSet)associatedColumns
{
  void *v2;
  void *v3;

  -[NSHashTable setRepresentation](self->_associatedColumns, "setRepresentation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "ef_notEmpty");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v3;
}

- (NSSet)foreignKeyReferences
{
  void *v2;
  void *v3;

  -[NSHashTable setRepresentation](self->_foreignKeyReferences, "setRepresentation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "ef_notEmpty");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v3;
}

- (void)addUniquenessConstraintForColumns:(id)a3 conflictResolution:(unint64_t)a4
{
  NSMutableArray *uniquenessConstraints;
  void *v7;
  void *v8;
  id v9;

  -[EFSQLTableSchema _columnsForColumnNames:](self, "_columnsForColumnNames:", a3);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  uniquenessConstraints = self->_uniquenessConstraints;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[EFPair pairWithFirst:second:](EFPair, "pairWithFirst:second:", v9, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray addObject:](uniquenessConstraints, "addObject:", v8);

}

- (id)_columnsForColumnNames:(id)a3
{
  _QWORD v4[6];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __43__EFSQLTableSchema__columnsForColumnNames___block_invoke;
  v4[3] = &unk_1E62A7578;
  v4[4] = self;
  v4[5] = a2;
  objc_msgSend(a3, "ef_map:", v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)definitionWithDatabaseName:(id)a3 includeIndexes:(BOOL)a4
{
  _BOOL4 v4;
  void *v6;
  void *v7;
  __CFString *v8;
  uint64_t v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  const __CFString *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  __CFString *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  _BOOL4 v38;
  const __CFString *v39;
  void *v40;
  void *v41;
  __CFString *v42;
  id v43;
  EFSQLTableSchema *v44;
  NSMutableArray *obj;
  void *v46;
  _QWORD v47[4];
  id v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  _BYTE v53[128];
  uint64_t v54;

  v4 = a4;
  v54 = *MEMORY[0x1E0C80C00];
  v43 = a3;
  -[NSMutableArray ef_map:](self->_columns, "ef_map:", &__block_literal_global_36);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = self;
  -[EFSQLTableSchema primaryKeyColumns](self, "primaryKeyColumns");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = v6;
  if (v6)
  {
    objc_msgSend(v6, "ef_map:", &__block_literal_global_19);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = &stru_1E62A84D8;
    v9 = -[EFSQLTableSchema primaryKeyConflictResolution](v44, "primaryKeyConflictResolution");
    if (v9)
    {
      v10 = objc_alloc(MEMORY[0x1E0CB3940]);
      EFSQLStringForConflictResolution(v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (__CFString *)objc_msgSend(v10, "initWithFormat:", CFSTR(" ON CONFLICT %@"), v11);

    }
    v12 = objc_alloc(MEMORY[0x1E0CB3940]);
    objc_msgSend(v7, "componentsJoinedByString:", CFSTR(", "));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = (__CFString *)objc_msgSend(v12, "initWithFormat:", CFSTR(",\nPRIMARY KEY(%@)%@"), v13, v8);

    v14 = CFSTR(" WITHOUT ROWID");
  }
  else
  {
    v14 = &stru_1E62A84D8;
    v42 = &stru_1E62A84D8;
  }
  v39 = v14;
  v38 = v4;
  if (-[NSMutableArray count](v44->_uniquenessConstraints, "count"))
  {
    v46 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](v44->_uniquenessConstraints, "count"));
    v51 = 0u;
    v52 = 0u;
    v49 = 0u;
    v50 = 0u;
    obj = v44->_uniquenessConstraints;
    v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v49, v53, 16);
    if (v15)
    {
      v16 = *(_QWORD *)v50;
      do
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v50 != v16)
            objc_enumerationMutation(obj);
          v18 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * i);
          objc_msgSend(v18, "first");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "ef_map:", &__block_literal_global_28);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "componentsJoinedByString:", CFSTR(", "));
          v21 = (void *)objc_claimAutoreleasedReturnValue();

          v22 = objc_alloc(MEMORY[0x1E0CB3940]);
          objc_msgSend(v18, "second");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          EFSQLStringForConflictResolution(objc_msgSend(v23, "unsignedIntegerValue"));
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = (void *)objc_msgSend(v22, "initWithFormat:", CFSTR("UNIQUE(%@) ON CONFLICT %@"), v21, v24);

          objc_msgSend(v46, "addObject:", v25);
        }
        v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v49, v53, 16);
      }
      while (v15);
    }

    v26 = objc_alloc(MEMORY[0x1E0CB3940]);
    objc_msgSend(v46, "componentsJoinedByString:", CFSTR(",\n"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = (__CFString *)objc_msgSend(v26, "initWithFormat:", CFSTR(",\n%@"), v27);

  }
  else
  {
    v28 = &stru_1E62A84D8;
  }
  -[EFSQLTableSchema checkConstraints](v44, "checkConstraints");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v29, "count"))
  {
    v47[0] = MEMORY[0x1E0C809B0];
    v47[1] = 3221225472;
    v47[2] = __62__EFSQLTableSchema_definitionWithDatabaseName_includeIndexes___block_invoke_4;
    v47[3] = &unk_1E62A74E8;
    v48 = v30;
    objc_msgSend(v29, "enumerateObjectsUsingBlock:", v47);

  }
  -[EFSQLTableSchema fullNameWithDatabaseName:](v44, "fullNameWithDatabaseName:", v43);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = objc_alloc(MEMORY[0x1E0CB3940]);
  objc_msgSend(v41, "componentsJoinedByString:", CFSTR(",\n"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = (void *)objc_msgSend(v32, "initWithFormat:", CFSTR("CREATE TABLE IF NOT EXISTS %@ (%@%@%@%@)%@;"),
                  v31,
                  v33,
                  v42,
                  v28,
                  v30,
                  v39);

  if (v38)
  {
    -[EFSQLTableSchema indexDefinitionsWithDatabaseName:](v44, "indexDefinitionsWithDatabaseName:", v43);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v35, "length"))
    {
      v36 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@\n%@"), v34, v35);

      v34 = (void *)v36;
    }

  }
  return v34;
}

- (void)addIndexForColumns:(id)a3
{
  EFSQLIndexSchema *v4;
  void *v5;
  EFSQLIndexSchema *v6;
  id v7;

  v7 = a3;
  v4 = [EFSQLIndexSchema alloc];
  -[EFSQLTableSchema name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[EFSQLIndexSchema initWithTableName:columnNames:](v4, "initWithTableName:columnNames:", v5, v7);

  -[NSMutableArray addObject:](self->_indexes, "addObject:", v6);
}

- (id)fullNameWithDatabaseName:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;

  v4 = a3;
  if (objc_msgSend(v4, "length"))
  {
    v5 = objc_alloc(MEMORY[0x1E0CB3940]);
    -[EFSQLTableSchema name](self, "name");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v5, "initWithFormat:", CFSTR("%@.%@"), v4, v6);

  }
  else
  {
    -[EFSQLTableSchema name](self, "name");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

- (NSArray)primaryKeyColumns
{
  return self->_primaryKeyColumns;
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
  -[EFSQLTableSchema indexes](self, "indexes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __53__EFSQLTableSchema_indexDefinitionsWithDatabaseName___block_invoke;
  v10[3] = &unk_1E62A7510;
  v6 = v4;
  v11 = v6;
  objc_msgSend(v5, "ef_map:", v10);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v7, "count"))
  {
    objc_msgSend(v7, "componentsJoinedByString:", CFSTR("\n"));
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = &stru_1E62A84D8;
  }

  return v8;
}

- (NSArray)indexes
{
  return (NSArray *)-[NSMutableArray ef_notEmpty](self->_indexes, "ef_notEmpty");
}

- (NSArray)checkConstraints
{
  return (NSArray *)-[NSMutableArray ef_notEmpty](self->_checkConstraints, "ef_notEmpty");
}

- (EFSQLTableSchema)initWithName:(id)a3 rowIDType:(unint64_t)a4 rowIDAlias:(id)a5 columns:(id)a6
{
  id v11;
  id v12;
  id v13;
  EFSQLTableSchema *v14;
  void *v16;

  v11 = a3;
  v12 = a5;
  v13 = a6;
  if (!a4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EFSQLTableSchema.m"), 46, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("rowIDType != EFSQLRowIDTypeNone"));

  }
  v14 = -[EFSQLTableSchema initWithName:rowIDType:rowIDAlias:columns:primaryKeyColumns:conflictResolution:](self, "initWithName:rowIDType:rowIDAlias:columns:primaryKeyColumns:conflictResolution:", v11, a4, v12, v13, 0, 0);

  return v14;
}

- (EFSQLTableSchema)initWithName:(id)a3 rowIDType:(unint64_t)a4 columns:(id)a5
{
  id v9;
  id v10;
  EFSQLTableSchema *v11;
  void *v13;

  v9 = a3;
  v10 = a5;
  if (!a4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EFSQLTableSchema.m"), 41, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("rowIDType != EFSQLRowIDTypeNone"));

  }
  v11 = -[EFSQLTableSchema initWithName:rowIDType:rowIDAlias:columns:primaryKeyColumns:conflictResolution:](self, "initWithName:rowIDType:rowIDAlias:columns:primaryKeyColumns:conflictResolution:", v9, a4, 0, v10, 0, 0);

  return v11;
}

- (void)addColumn:(id)a3
{
  NSMutableDictionary *columnsByName;
  void *v5;
  id v6;

  v6 = a3;
  objc_msgSend(v6, "setTable:", self);
  -[NSMutableArray addObject:](self->_columns, "addObject:", v6);
  columnsByName = self->_columnsByName;
  objc_msgSend(v6, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](columnsByName, "setObject:forKeyedSubscript:", v6, v5);

}

- (void)addCheckConstraintForExpression:(id)a3
{
  -[NSMutableArray addObject:](self->_checkConstraints, "addObject:", a3);
}

- (EFSQLTableSchema)initWithName:(id)a3 columns:(id)a4 primaryKeyColumns:(id)a5
{
  return -[EFSQLTableSchema initWithName:rowIDType:rowIDAlias:columns:primaryKeyColumns:conflictResolution:](self, "initWithName:rowIDType:rowIDAlias:columns:primaryKeyColumns:conflictResolution:", a3, 0, 0, a4, a5, 0);
}

- (EFSQLTableSchema)initWithName:(id)a3 columns:(id)a4 primaryKeyColumns:(id)a5 conflictResolution:(unint64_t)a6
{
  return -[EFSQLTableSchema initWithName:rowIDType:rowIDAlias:columns:primaryKeyColumns:conflictResolution:](self, "initWithName:rowIDType:rowIDAlias:columns:primaryKeyColumns:conflictResolution:", a3, 0, 0, a4, a5, a6);
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
  v8.super_class = (Class)EFSQLTableSchema;
  -[EFSQLTableSchema description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[EFSQLTableSchema name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("%@ %@ [%@]"), v4, v5, self->_columns);

  return v6;
}

- (id)definitionWithDatabaseName:(id)a3
{
  -[EFSQLTableSchema definitionWithDatabaseName:includeIndexes:](self, "definitionWithDatabaseName:includeIndexes:", a3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

id __62__EFSQLTableSchema_definitionWithDatabaseName_includeIndexes___block_invoke_2(uint64_t a1, void *a2)
{
  objc_msgSend(a2, "name");
  return (id)objc_claimAutoreleasedReturnValue();
}

void __62__EFSQLTableSchema_definitionWithDatabaseName_includeIndexes___block_invoke_4(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  objc_msgSend(*(id *)(a1 + 32), "appendString:", CFSTR(",\n"));
  objc_msgSend(*(id *)(a1 + 32), "appendString:", CFSTR("CHECK("));
  objc_msgSend(v4, "ef_SQLIsolatedExpression");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "ef_renderSQLExpressionInto:", *(_QWORD *)(a1 + 32));

  objc_msgSend(*(id *)(a1 + 32), "appendString:", CFSTR(")"));
}

- (NSArray)columns
{
  return (NSArray *)(id)-[NSMutableArray copy](self->_columns, "copy");
}

- (NSArray)uniqueColumns
{
  void *v2;
  void *v3;

  -[NSMutableArray ef_map:](self->_uniquenessConstraints, "ef_map:", &__block_literal_global_51);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "ef_notEmpty");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

id __33__EFSQLTableSchema_uniqueColumns__block_invoke(uint64_t a1, void *a2)
{
  objc_msgSend(a2, "first");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)removeColumn:(id)a3
{
  NSMutableDictionary *columnsByName;
  void *v5;
  id v6;

  v6 = a3;
  objc_msgSend(v6, "setTable:", 0);
  -[NSMutableArray removeObject:](self->_columns, "removeObject:", v6);
  columnsByName = self->_columnsByName;
  objc_msgSend(v6, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](columnsByName, "setObject:forKeyedSubscript:", 0, v5);

}

- (unint64_t)primaryKeyConflictResolution
{
  return self->_primaryKeyConflictResolution;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rowIDColumnName, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_primaryKeyColumns, 0);
  objc_storeStrong((id *)&self->_indexes, 0);
  objc_storeStrong((id *)&self->_associatedColumns, 0);
  objc_storeStrong((id *)&self->_foreignKeyReferences, 0);
  objc_storeStrong((id *)&self->_checkConstraints, 0);
  objc_storeStrong((id *)&self->_uniquenessConstraints, 0);
  objc_storeStrong((id *)&self->_columnsByName, 0);
  objc_storeStrong((id *)&self->_columns, 0);
}

@end
