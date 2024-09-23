@implementation BMDSLTableSQLQueryTransform

- (BMDSLTableSQLQueryTransform)initWithName:(id)a3 version:(unsigned int)a4 SQL:(id)a5 tableNames:(id)a6 schema:(id)a7
{
  id v12;
  id v13;
  id v14;
  BMDSLTableSQLQueryTransform *v15;
  uint64_t v16;
  NSString *SQL;
  uint64_t v18;
  NSArray *tableNames;
  BMDSLTableSQLQueryTransform *v20;
  NSObject *v21;
  objc_super v23;

  v12 = a5;
  v13 = a6;
  v14 = a7;
  if (a4 == 1)
  {
    v23.receiver = self;
    v23.super_class = (Class)BMDSLTableSQLQueryTransform;
    v15 = -[BMDSLBaseCodable initWithName:version:](&v23, sel_initWithName_version_, a3, 1);
    if (v15)
    {
      v16 = objc_msgSend(v12, "copy");
      SQL = v15->_SQL;
      v15->_SQL = (NSString *)v16;

      objc_storeStrong((id *)&v15->_schema, a7);
      v18 = objc_msgSend(v13, "copy");
      tableNames = v15->_tableNames;
      v15->_tableNames = (NSArray *)v18;

    }
    self = v15;
    v20 = self;
  }
  else
  {
    __biome_log_for_category();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      -[BMDSLTableSQLQueryTransform initWithName:version:SQL:tableNames:schema:].cold.1(a4, v21);

    v20 = 0;
  }

  return v20;
}

- (BMDSLTableSQLQueryTransform)initWithSQL:(id)a3 tableNames:(id)a4 schema:(id)a5
{
  return -[BMDSLTableSQLQueryTransform initWithName:version:SQL:tableNames:schema:](self, "initWithName:version:SQL:tableNames:schema:", CFSTR("tableSQLExpression"), 1, a3, a4, a5);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)BMDSLTableSQLQueryTransform;
  v4 = a3;
  -[BMDSLBaseCodable encodeWithCoder:](&v8, sel_encodeWithCoder_, v4);
  -[BMDSLTableSQLQueryTransform SQL](self, "SQL", v8.receiver, v8.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("SQL"));

  -[BMDSLTableSQLQueryTransform tableNames](self, "tableNames");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("tableNames"));

  -[BMDSLTableSQLQueryTransform schema](self, "schema");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("schema"));

}

- (BMDSLTableSQLQueryTransform)initWithCoder:(id)a3
{
  id v4;
  BMDSLTableSQLQueryTransform *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)BMDSLTableSQLQueryTransform;
  v5 = -[BMDSLBaseCodable initWithCoder:](&v12, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SQL"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D01B90], "allowed");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v7, CFSTR("tableNames"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("schema"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[BMDSLBaseCodable name](v5, "name");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[BMDSLTableSQLQueryTransform initWithName:version:SQL:tableNames:schema:](v5, "initWithName:version:SQL:tableNames:schema:", v10, -[BMDSLBaseCodable version](v5, "version"), v6, v8, v9);

  }
  return v5;
}

- (id)transformInput:(id)a3 combinedState:(id)a4
{
  id v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  NSObject *v31;
  id v33;
  id v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  uint8_t v39[4];
  uint64_t v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D01C10]), "initWithURL:", 0);
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v7 = v5;
  v8 = -[NSObject countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v35, v41, 16);
  if (v8)
  {
    v9 = v8;
    v10 = 0;
    v11 = *(_QWORD *)v36;
LABEL_3:
    v12 = 0;
    while (1)
    {
      if (*(_QWORD *)v36 != v11)
        objc_enumerationMutation(v7);
      v13 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * v12);
      objc_msgSend(v13, "rows");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "count");

      if (v15)
      {
        -[BMDSLTableSQLQueryTransform tableNames](self, "tableNames");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "objectAtIndexedSubscript:", v10 + v12);
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        v34 = 0;
        objc_msgSend(v6, "addTable:named:error:", v13, v17, &v34);
        v18 = v34;
        if (v18)
        {
          v20 = v18;
          __biome_log_for_category();
          v31 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_FAULT))
            -[BMDSLTableSQLQueryTransform transformInput:combinedState:].cold.3(v6);
          goto LABEL_23;
        }
        objc_msgSend(v13, "rows");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = 0;
        objc_msgSend(v6, "upsertRows:error:", v19, &v33);
        v20 = v33;

        if (v20)
        {
          __biome_log_for_category();
          v31 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_FAULT))
            -[BMDSLTableSQLQueryTransform transformInput:combinedState:].cold.2(v39, v6, &v40, v31);
LABEL_23:

          v30 = 0;
          v23 = v7;
          goto LABEL_27;
        }

      }
      if (v9 == ++v12)
      {
        v9 = -[NSObject countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v35, v41, 16);
        v10 += v12;
        if (v9)
          goto LABEL_3;
        break;
      }
    }
  }

  if ((objc_msgSend(v6, "openDB") & 1) != 0)
  {
    objc_msgSend(v6, "db");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[BMDSLTableSQLQueryTransform SQL](self, "SQL");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "executeQuery:", v22);
    v23 = objc_claimAutoreleasedReturnValue();

    -[BMDSLTableSQLQueryTransform schema](self, "schema");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = (void *)objc_opt_new();
    if (-[NSObject next](v23, "next"))
    {
      do
      {
        v26 = (void *)objc_opt_new();
        if ((int)-[NSObject columnCount](v23, "columnCount") >= 1)
        {
          v27 = 0;
          do
          {
            -[NSObject objectForColumnIndex:](v23, "objectForColumnIndex:", v27);
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "addObject:", v28);

            v27 = (v27 + 1);
          }
          while ((int)v27 < (int)-[NSObject columnCount](v23, "columnCount"));
        }
        v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D01BE8]), "initWithValues:", v26);
        objc_msgSend(v25, "addObject:", v29);

      }
      while ((-[NSObject next](v23, "next") & 1) != 0);
    }
    v30 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D01C00]), "initWithRows:schema:", v25, v24);
    objc_msgSend(v6, "closeDB");

  }
  else
  {
    __biome_log_for_category();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
      -[BMDSLTableSQLQueryTransform transformInput:combinedState:].cold.1(v6);
    v30 = 0;
  }
LABEL_27:

  return v30;
}

- (NSArray)tableNames
{
  return self->_tableNames;
}

- (NSString)SQL
{
  return self->_SQL;
}

- (BMTableSchema)schema
{
  return self->_schema;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_schema, 0);
  objc_storeStrong((id *)&self->_SQL, 0);
  objc_storeStrong((id *)&self->_tableNames, 0);
}

- (void)initWithName:(int)a1 version:(NSObject *)a2 SQL:tableNames:schema:.cold.1(int a1, NSObject *a2)
{
  _DWORD v2[2];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_18D810000, a2, OS_LOG_TYPE_ERROR, "Unexpected version %u. Failed to initialize BMDSLTableSQLQueryTransform", (uint8_t *)v2, 8u);
}

- (void)transformInput:(void *)a1 combinedState:.cold.1(void *a1)
{
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  objc_msgSend(a1, "db");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "lastError");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_2(&dword_18D810000, v4, v5, "BMTableStore: unable to open database: %@", v6, v7, v8, v9, 2u);

  OUTLINED_FUNCTION_1_0();
}

- (void)transformInput:(_QWORD *)a3 combinedState:(NSObject *)a4 .cold.2(uint8_t *a1, void *a2, _QWORD *a3, NSObject *a4)
{
  void *v7;
  void *v8;
  void *v9;

  objc_msgSend(a2, "db");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "lastError");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "description");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)a1 = 138412290;
  *a3 = v9;
  _os_log_fault_impl(&dword_18D810000, a4, OS_LOG_TYPE_FAULT, "BMTableStore: unable to add rows to database: %@", a1, 0xCu);

}

- (void)transformInput:(void *)a1 combinedState:.cold.3(void *a1)
{
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  objc_msgSend(a1, "db");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "lastError");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_2(&dword_18D810000, v4, v5, "BMTableStore: unable to add table to database: %@", v6, v7, v8, v9, 2u);

  OUTLINED_FUNCTION_1_0();
}

@end
