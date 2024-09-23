@implementation BMIndex

- (BMIndex)initWithName:(id)a3 fields:(id)a4 streamIdentifier:(id)a5
{
  id v9;
  id v10;
  id v11;
  BMIndex *v12;
  BMIndex *v13;
  uint64_t v14;
  NSString *viewName;
  uint64_t v16;
  BMSQLSchema *schema;
  objc_super v19;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v19.receiver = self;
  v19.super_class = (Class)BMIndex;
  v12 = -[BMIndex init](&v19, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_name, a3);
    objc_storeStrong((id *)&v13->_streamIdentifier, a5);
    objc_msgSend((id)objc_opt_class(), "_viewNameWithStreamIdentifier:indexName:", v11, v9);
    v14 = objc_claimAutoreleasedReturnValue();
    viewName = v13->_viewName;
    v13->_viewName = (NSString *)v14;

    objc_storeStrong((id *)&v13->_fields, a4);
    objc_msgSend((id)objc_opt_class(), "_indexTableSchemaWithName:fields:", v13->_viewName, v10);
    v16 = objc_claimAutoreleasedReturnValue();
    schema = v13->_schema;
    v13->_schema = (BMSQLSchema *)v16;

  }
  return v13;
}

+ (id)_viewNameWithStreamIdentifier:(id)a3 indexName:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
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
  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_opt_new();
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  objc_msgSend(v5, "componentsSeparatedByString:", CFSTR("."));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v31;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v31 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
        if (objc_msgSend(v13, "length"))
        {
          objc_msgSend(v13, "substringToIndex:", 1);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "appendString:", v14);

        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
    }
    while (v10);
  }

  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  objc_msgSend(v6, "componentsSeparatedByString:", CFSTR("_"), 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v27;
    do
    {
      for (j = 0; j != v17; ++j)
      {
        if (*(_QWORD *)v27 != v18)
          objc_enumerationMutation(v15);
        v20 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * j);
        objc_msgSend(v20, "substringToIndex:", 1);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "uppercaseString");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "appendString:", v22);

        objc_msgSend(v20, "substringFromIndex:", 1);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "appendString:", v23);

      }
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
    }
    while (v17);
  }

  objc_msgSend(v7, "appendString:", CFSTR("IndexView"));
  v24 = (void *)objc_msgSend(v7, "copy");

  return v24;
}

+ (id)_indexTableSchemaWithName:(id)a3 fields:(id)a4
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  BMSQLColumn *v17;
  void *v18;
  BMSQLColumn *v19;
  void *v20;
  void *v21;
  BMSQLSchema *v22;
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v24 = a3;
  v5 = a4;
  v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v26 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
        objc_msgSend(v12, "name");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        BMEventTimestampSQLColumn();
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "name");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v13, "isEqualToString:", v15);

        if ((v16 & 1) == 0)
        {
          v17 = [BMSQLColumn alloc];
          objc_msgSend(v12, "name");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = -[BMSQLColumn initWithName:dataType:](v17, "initWithName:dataType:", v18, objc_msgSend(v12, "dataType"));
          objc_msgSend(v6, "addObject:", v19);

        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v9);
  }

  BMEventBookmarkSQLColumns();
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObjectsFromArray:", v20);

  BMEventTimestampSQLColumn();
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v21);

  v22 = -[BMSQLSchema initWithTableName:columns:]([BMSQLSchema alloc], "initWithTableName:columns:", v24, v6);
  return v22;
}

- (id)createViewSQL
{
  void *v3;
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  BMIndex *v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v34 = self;
  v4 = self->_fields;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v40;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v40 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * i);
        objc_msgSend(v9, "name");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        BMEventTimestampSQLColumn();
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "name");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v10, "isEqualToString:", v12);

        if ((v13 & 1) == 0)
        {
          objc_msgSend(v9, "expression");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "lowercaseString");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "addObject:", v15);

        }
      }
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
    }
    while (v6);
  }

  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  BMEventBookmarkSQLColumns();
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v36;
    do
    {
      for (j = 0; j != v18; ++j)
      {
        if (*(_QWORD *)v36 != v19)
          objc_enumerationMutation(v16);
        v21 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * j);
        v22 = objc_alloc(MEMORY[0x1E0CB3940]);
        objc_msgSend(v21, "name");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "lowercaseString");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = (void *)objc_msgSend(v22, "initWithFormat:", CFSTR("\"%@\"), v24);
        objc_msgSend(v3, "addObject:", v25);

      }
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
    }
    while (v18);
  }

  BMEventTimestampSQLColumn();
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "name");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "lowercaseString");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v28);

  v29 = (void *)MEMORY[0x1E0CB3940];
  -[NSString lowercaseString](v34->_viewName, "lowercaseString");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "componentsJoinedByString:", CFSTR(","));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "stringWithFormat:", CFSTR("CREATE MATERIALIZED VIEW %@ AS SELECT %@ FROM \"%@\"), v30, v31, v34->_streamIdentifier);
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  return v32;
}

- (id)createTableSQL
{
  void *v3;
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  NSString *name;
  NSString *viewName;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v4 = self->_fields;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v20;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v20 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * v8), "name");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v6);
  }

  v10 = (void *)MEMORY[0x1E0CB3940];
  name = self->_name;
  viewName = self->_viewName;
  objc_msgSend(v3, "componentsJoinedByString:", CFSTR(","));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringWithFormat:", CFSTR("CREATE INDEX IF NOT EXISTS %@_Index ON %@(%@)"), name, viewName, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = (void *)MEMORY[0x1E0CB3940];
  -[BMSQLSchema createTableSQL](self->_schema, "createTableSQL");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "stringWithFormat:", CFSTR("%@;\n%@;"), v16, v14);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (id)description
{
  return objc_autoreleaseReturnValue((id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("<%@ %p> name: %@; fields: %@"),
                                           objc_opt_class(),
                                           self,
                                           self->_name,
                                           self->_fields));
}

- (NSString)name
{
  return self->_name;
}

- (NSString)streamIdentifier
{
  return self->_streamIdentifier;
}

- (NSString)viewName
{
  return self->_viewName;
}

- (NSArray)fields
{
  return self->_fields;
}

- (BMSQLSchema)schema
{
  return self->_schema;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_schema, 0);
  objc_storeStrong((id *)&self->_fields, 0);
  objc_storeStrong((id *)&self->_viewName, 0);
  objc_storeStrong((id *)&self->_streamIdentifier, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
