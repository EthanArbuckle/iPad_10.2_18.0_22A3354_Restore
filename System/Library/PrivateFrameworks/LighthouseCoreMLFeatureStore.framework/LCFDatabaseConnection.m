@implementation LCFDatabaseConnection

- (id)init:(id)a3 databaseName:(id)a4 tableName:(id)a5
{
  id v9;
  id v10;
  id v11;
  LCFDatabaseConnection *v12;
  void *v13;
  uint64_t v14;
  NSString *databaseNamePath;
  LCFDatabaseColumnConnection *v16;
  void *v17;
  uint64_t v18;
  LCFDatabaseColumnConnection *dbColumnConnection;
  objc_super v21;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v21.receiver = self;
  v21.super_class = (Class)LCFDatabaseConnection;
  v12 = -[LCFDatabaseConnection init](&v21, sel_init);
  if (v12)
  {
    LCFLoggingUtilsInit();
    objc_storeStrong((id *)&v12->_databaseBaseURL, a3);
    objc_storeStrong((id *)&v12->_databaseName, a4);
    objc_storeStrong((id *)&v12->_tableName, a5);
    -[NSURL path](v12->_databaseBaseURL, "path");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "stringByAppendingPathComponent:", v12->_databaseName);
    v14 = objc_claimAutoreleasedReturnValue();
    databaseNamePath = v12->_databaseNamePath;
    v12->_databaseNamePath = (NSString *)v14;

    v16 = [LCFDatabaseColumnConnection alloc];
    objc_msgSend(v11, "stringByAppendingString:", CFSTR("_Columns"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = -[LCFDatabaseColumnConnection init:databaseName:tableName:](v16, "init:databaseName:tableName:", v9, v10, v17);
    dbColumnConnection = v12->_dbColumnConnection;
    v12->_dbColumnConnection = (LCFDatabaseColumnConnection *)v18;

    -[LCFDatabaseConnection ensureDatabaseTable](v12, "ensureDatabaseTable");
  }

  return v12;
}

- (void)ensureDatabaseTable
{
  OUTLINED_FUNCTION_1(&dword_24032B000, a2, a3, "sqlite3_open failed %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

- (BOOL)doQueryEachStep:(id)a3 statementStepHandler:(id)a4
{
  id v6;
  void (**v7)(id, sqlite3_stmt *);
  void *v8;
  NSString **p_databaseNamePath;
  NSString *databaseNamePath;
  const char *v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  int v19;
  sqlite3_stmt *v21;
  sqlite3 *ppDb;

  v6 = a3;
  v7 = (void (**)(id, sqlite3_stmt *))a4;
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  databaseNamePath = self->_databaseNamePath;
  p_databaseNamePath = &self->_databaseNamePath;
  if (objc_msgSend(v8, "fileExistsAtPath:", databaseNamePath))
  {
    v11 = -[NSString UTF8String](*p_databaseNamePath, "UTF8String");
    ppDb = 0;
    if (sqlite3_open(v11, &ppDb))
    {
      v12 = LCFLogDatabaseConnection;
      if (os_log_type_enabled((os_log_t)LCFLogDatabaseConnection, OS_LOG_TYPE_ERROR))
        -[LCFDatabaseConnection ensureDatabaseTable].cold.2((uint64_t)p_databaseNamePath, v12, v13, v14, v15, v16, v17, v18);
    }
    else
    {
      v21 = 0;
      sqlite3_prepare_v2(ppDb, (const char *)objc_msgSend(objc_retainAutorelease(v6), "UTF8String"), -1, &v21, 0);
      while (1)
      {
        v19 = sqlite3_step(v21);
        if (v19 != 100)
          break;
        v7[2](v7, v21);
      }
      if (v19 != 101)
        -[LCFDatabaseConnection doQueryEachStep:statementStepHandler:].cold.1();
      sqlite3_close(ppDb);
    }
  }

  return 1;
}

- (BOOL)doQueryExec:(id)a3
{
  id v4;
  void *v5;
  NSString **p_databaseNamePath;
  NSString *databaseNamePath;
  const char *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  BOOL v16;
  sqlite3 *v18;
  id v19;
  int v20;
  NSObject *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  sqlite3 *ppDb;

  v4 = a3;
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  databaseNamePath = self->_databaseNamePath;
  p_databaseNamePath = &self->_databaseNamePath;
  if (!objc_msgSend(v5, "fileExistsAtPath:", databaseNamePath))
  {
LABEL_5:
    v16 = 0;
    goto LABEL_6;
  }
  v8 = -[NSString UTF8String](*p_databaseNamePath, "UTF8String");
  ppDb = 0;
  if (sqlite3_open(v8, &ppDb))
  {
    v9 = LCFLogDatabaseConnection;
    if (os_log_type_enabled((os_log_t)LCFLogDatabaseConnection, OS_LOG_TYPE_ERROR))
      -[LCFDatabaseConnection ensureDatabaseTable].cold.2((uint64_t)p_databaseNamePath, v9, v10, v11, v12, v13, v14, v15);
    goto LABEL_5;
  }
  sqlite3_exec(ppDb, "BEGIN", 0, 0, 0);
  v28 = 0;
  v18 = ppDb;
  v19 = objc_retainAutorelease(v4);
  v20 = sqlite3_exec(v18, (const char *)objc_msgSend(v19, "UTF8String", 0), 0, 0, &v28);
  v16 = v20 == 0;
  if (v20)
  {
    v21 = LCFLogDatabaseConnection;
    if (os_log_type_enabled((os_log_t)LCFLogDatabaseConnection, OS_LOG_TYPE_ERROR))
      -[LCFDatabaseConnection ensureDatabaseTable].cold.1((uint64_t)v19, v21, v22, v23, v24, v25, v26, v27);
  }
  sqlite3_exec(ppDb, "COMMIT", 0, 0, 0);
  sqlite3_close(ppDb);
LABEL_6:

  return v16;
}

- (id)getColumns
{
  id v3;
  void *v4;
  id v5;
  _QWORD v7[4];
  id v8;

  v3 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("pragma table_info(%@)"), self->_tableName);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __35__LCFDatabaseConnection_getColumns__block_invoke;
  v7[3] = &unk_25109F1D0;
  v5 = v3;
  v8 = v5;
  -[LCFDatabaseConnection doQueryEachStep:statementStepHandler:](self, "doQueryEachStep:statementStepHandler:", v4, v7);

  return v5;
}

void __35__LCFDatabaseConnection_getColumns__block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  const unsigned __int8 *v4;
  const unsigned __int8 *v5;
  LCFDatabaseColumn *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v4 = sqlite3_column_text(a2, 1);
  v5 = sqlite3_column_text(a2, 2);
  v6 = [LCFDatabaseColumn alloc];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[LCFDatabaseColumn init:typeDb:](v6, "init:typeDb:", v7, v8);

  v9 = *(void **)(a1 + 32);
  objc_msgSend(v11, "name");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setValue:forKey:", v11, v10);

}

- (BOOL)addColumn:(id)a3
{
  LCFDatabaseConnection *v3;
  void *v4;
  NSString *tableName;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = self;
  v4 = (void *)MEMORY[0x24BDD17C8];
  tableName = self->_tableName;
  v6 = a3;
  objc_msgSend(v6, "name");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "typeDb");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "stringWithFormat:", CFSTR("alter table %@ ADD COLUMN %@ %@;"), tableName, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v3) = -[LCFDatabaseConnection doQueryExec:](v3, "doQueryExec:", v9);
  return (char)v3;
}

- (BOOL)writeFeatures:(id)a3
{
  id v4;
  uint64_t v5;
  LCFDatabaseConnection *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  LCFDatabaseColumn *v16;
  void *v17;
  void *v18;
  id v19;
  double v20;
  double v21;
  void *v22;
  double v23;
  id v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t j;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  NSString *tableName;
  void *v42;
  void *v43;
  void *v44;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  _BYTE v61[128];
  _QWORD v62[3];
  _QWORD v63[3];
  _BYTE v64[128];
  uint64_t v65;

  v65 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "featureValues");
  v5 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "itemIdentifier");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "featureVersion");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = v4;
  objc_msgSend(v4, "timestamp");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = self;
  -[LCFDatabaseConnection getColumns](self, "getColumns");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "allKeys");
  v7 = objc_claimAutoreleasedReturnValue();
  v57 = 0u;
  v58 = 0u;
  v59 = 0u;
  v60 = 0u;
  v52 = (void *)v5;
  v8 = (void *)v5;
  v9 = (void *)v7;
  objc_msgSend(v8, "allKeys");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v57, v64, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v58;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v58 != v13)
          objc_enumerationMutation(v10);
        v15 = *(_QWORD *)(*((_QWORD *)&v57 + 1) + 8 * i);
        if ((objc_msgSend(v9, "containsObject:", v15) & 1) == 0)
        {
          v16 = [LCFDatabaseColumn alloc];
          objc_msgSend(v52, "objectForKeyedSubscript:", v15);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "getTypeDBString");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = -[LCFDatabaseColumn init:typeDb:](v16, "init:typeDb:", v15, v18);

          -[LCFDatabaseConnection addColumn:](v6, "addColumn:", v19);
        }
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v57, v64, 16);
    }
    while (v12);
  }

  v46 = v9;
  if (v49)
  {
    objc_msgSend(v49, "timeIntervalSinceReferenceDate");
    v21 = v20;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "now");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "timeIntervalSinceReferenceDate");
    v21 = v23;

  }
  v24 = objc_alloc(MEMORY[0x24BDBCEB8]);
  v63[0] = CFSTR("_lcf_itemIdentifier");
  v63[1] = CFSTR("_lcf_featureVersion");
  v63[2] = CFSTR("_lcf_timestamp");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v63, 3);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = (void *)objc_msgSend(v24, "initWithArray:", v25);

  v27 = objc_alloc(MEMORY[0x24BDBCEB8]);
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("'%@'"), v51);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v62[0] = v28;
  v62[1] = v50;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v21);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v62[2] = v29;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v62, 3);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = (void *)objc_msgSend(v27, "initWithArray:", v30);

  v55 = 0u;
  v56 = 0u;
  v53 = 0u;
  v54 = 0u;
  objc_msgSend(v52, "allKeys");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v53, v61, 16);
  if (v33)
  {
    v34 = v33;
    v35 = *(_QWORD *)v54;
    do
    {
      for (j = 0; j != v34; ++j)
      {
        if (*(_QWORD *)v54 != v35)
          objc_enumerationMutation(v32);
        v37 = *(_QWORD *)(*((_QWORD *)&v53 + 1) + 8 * j);
        objc_msgSend(v52, "objectForKeyedSubscript:", v37);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        -[LCFDatabaseColumnConnection writeFeatures:featureValueType:](v6->_dbColumnConnection, "writeFeatures:featureValueType:", v37, objc_msgSend(v38, "type"));
        objc_msgSend(v26, "addObject:", v37);
        objc_msgSend(v38, "valueInString");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "addObject:", v39);

      }
      v34 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v53, v61, 16);
    }
    while (v34);
  }

  v40 = (void *)MEMORY[0x24BDD17C8];
  tableName = v6->_tableName;
  objc_msgSend(v26, "componentsJoinedByString:", CFSTR(","));
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "componentsJoinedByString:", CFSTR(","));
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "stringWithFormat:", CFSTR("INSERT INTO %@ (%@) VALUES(%@)"), tableName, v42, v43);
  v44 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v43) = -[LCFDatabaseConnection doQueryExec:](v6, "doQueryExec:", v44);
  return (char)v43;
}

- (id)isDoubleArray:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  id v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a3, "dataUsingEncoding:", 4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0;
  objc_msgSend(MEMORY[0x24BDD1608], "JSONObjectWithData:options:error:", v3, 0, &v17);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v17;
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v6 = v4;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v14;
      while (2)
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v14 != v9)
            objc_enumerationMutation(v6);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {

            v11 = 0;
            goto LABEL_14;
          }
          ++v10;
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
        if (v8)
          continue;
        break;
      }
    }

    v11 = v6;
LABEL_14:

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)query:(id)a3 startDate:(id)a4 endDate:(id)a5 reversed:(BOOL)a6
{
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t j;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  unint64_t v30;
  NSObject *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  id v38;
  void *v39;
  id v40;
  void *v41;
  id v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  unint64_t v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  const __CFString *v56;
  id v57;
  _BOOL4 v59;
  void *v60;
  id v61;
  void *v62;
  unint64_t v63;
  _QWORD v64[4];
  id v65;
  id v66;
  id v67;
  LCFDatabaseConnection *v68;
  id v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  _BYTE v78[128];
  _BYTE v79[128];
  uint64_t v80;

  v59 = a6;
  v80 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v61 = a4;
  v63 = (unint64_t)a5;
  v10 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v74 = 0u;
  v75 = 0u;
  v76 = 0u;
  v77 = 0u;
  -[LCFDatabaseColumnConnection query](self->_dbColumnConnection, "query");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v74, v79, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v75;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v75 != v14)
          objc_enumerationMutation(v11);
        v16 = *(void **)(*((_QWORD *)&v74 + 1) + 8 * i);
        objc_msgSend(v16, "featureName");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setObject:forKeyedSubscript:", v16, v17);

      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v74, v79, 16);
    }
    while (v13);
  }

  v18 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  -[LCFDatabaseConnection getColumns](self, "getColumns");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v19;
  v62 = v9;
  v60 = v18;
  if (v9)
  {
    objc_msgSend(v19, "allKeys");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v70 = 0u;
    v71 = 0u;
    v72 = 0u;
    v73 = 0u;
    v22 = v9;
    v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v70, v78, 16);
    if (v23)
    {
      v24 = v23;
      v25 = *(_QWORD *)v71;
      while (2)
      {
        for (j = 0; j != v24; ++j)
        {
          if (*(_QWORD *)v71 != v25)
            objc_enumerationMutation(v22);
          v27 = *(_QWORD *)(*((_QWORD *)&v70 + 1) + 8 * j);
          if ((objc_msgSend(v21, "containsObject:", v27) & 1) == 0)
          {
            v31 = LCFLogDatabaseConnection;
            if (os_log_type_enabled((os_log_t)LCFLogDatabaseConnection, OS_LOG_TYPE_ERROR))
              -[LCFDatabaseConnection query:startDate:endDate:reversed:].cold.1(v27, v31, v32, v33, v34, v35, v36, v37);
            v38 = 0;
            v39 = v60;
            v30 = (unint64_t)v61;
            goto LABEL_40;
          }
        }
        v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v70, v78, 16);
        if (v24)
          continue;
        break;
      }
    }

    v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithArray:", v22);
    v29 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithArray:", v22);
    v30 = (unint64_t)v61;
    if ((objc_msgSend(v28, "containsObject:", CFSTR("_lcf_itemIdentifier")) & 1) == 0)
      objc_msgSend(v28, "addObject:", CFSTR("_lcf_itemIdentifier"));
    if ((objc_msgSend(v28, "containsObject:", CFSTR("_lcf_featureVersion")) & 1) == 0)
      objc_msgSend(v28, "addObject:", CFSTR("_lcf_featureVersion"));
    if ((objc_msgSend(v28, "containsObject:", CFSTR("_lcf_timestamp")) & 1) == 0)
      objc_msgSend(v28, "addObject:", CFSTR("_lcf_timestamp"));

    v21 = (void *)v29;
  }
  else
  {
    v40 = objc_alloc(MEMORY[0x24BDBCEB8]);
    objc_msgSend(v20, "allKeys");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = (void *)objc_msgSend(v40, "initWithArray:", v41);

    v42 = objc_alloc(MEMORY[0x24BDBCEB8]);
    objc_msgSend(v20, "allKeys");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = (void *)objc_msgSend(v42, "initWithArray:", v43);

    objc_msgSend(v21, "removeObject:", CFSTR("_lcf_itemIdentifier"));
    objc_msgSend(v21, "removeObject:", CFSTR("_lcf_featureVersion"));
    objc_msgSend(v21, "removeObject:", CFSTR("_lcf_timestamp"));
    v30 = (unint64_t)v61;
  }
  v44 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(v28, "componentsJoinedByString:", CFSTR(","));
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "stringWithFormat:", CFSTR("SELECT %@ FROM %@"), v45, self->_tableName);
  v46 = (void *)objc_claimAutoreleasedReturnValue();

  if (v30 | v63)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ where "), v46);
    v47 = (void *)objc_claimAutoreleasedReturnValue();

    v48 = 0x24BDD1000uLL;
    if (v30)
    {
      v49 = (void *)MEMORY[0x24BDD17C8];
      v50 = (void *)MEMORY[0x24BDD16E0];
      objc_msgSend((id)v30, "timeIntervalSinceReferenceDate");
      objc_msgSend(v50, "numberWithDouble:");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "stringWithFormat:", CFSTR("%@ %@ >= %@ "), v47, CFSTR("_lcf_timestamp"), v51);
      v52 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v63)
      {
LABEL_34:
        v47 = v52;
        goto LABEL_35;
      }
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ and "), v52);
      v47 = (void *)objc_claimAutoreleasedReturnValue();

      v48 = 0x24BDD1000;
    }
    else if (!v63)
    {
LABEL_35:
      if (v59)
        v56 = CFSTR("%@ order by %@ asc");
      else
        v56 = CFSTR("%@ order by %@ desc");
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", v56, v47, CFSTR("_lcf_timestamp"));
      v46 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_39;
    }
    v53 = (void *)MEMORY[0x24BDD17C8];
    v54 = *(void **)(v48 + 1760);
    objc_msgSend((id)v63, "timeIntervalSinceReferenceDate");
    objc_msgSend(v54, "numberWithDouble:");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "stringWithFormat:", CFSTR("%@ %@ <= %@ "), v47, CFSTR("_lcf_timestamp"), v55);
    v52 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_34;
  }
LABEL_39:
  v64[0] = MEMORY[0x24BDAC760];
  v64[1] = 3221225472;
  v64[2] = __58__LCFDatabaseConnection_query_startDate_endDate_reversed___block_invoke;
  v64[3] = &unk_25109F1F8;
  v65 = v28;
  v66 = v20;
  v67 = v10;
  v68 = self;
  v39 = v60;
  v57 = v60;
  v69 = v57;
  v22 = v28;
  -[LCFDatabaseConnection doQueryEachStep:statementStepHandler:](self, "doQueryEachStep:statementStepHandler:", v46, v64);
  v38 = v57;

LABEL_40:
  return v38;
}

void __58__LCFDatabaseConnection_query_startDate_endDate_reversed___block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  id v4;
  __int128 v5;
  uint64_t v6;
  const unsigned __int8 *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  LCFFeatureValue *v15;
  LCFFeatureValue *v16;
  void *v17;
  LCFFeatureValue *v18;
  LCFFeatureValue *v19;
  LCFFeatureValue *v20;
  LCFFeatureValue *v21;
  LCFFeatureValue *v22;
  LCFFeatureValue *v23;
  LCFFeatureValue *v24;
  LCFFeatureValue *v25;
  LCFFeatureValue *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  LCFFeatureSet *v42;
  __int128 v43;
  _BYTE buf[24];
  uint64_t v45;
  uint64_t v46;

  v46 = *MEMORY[0x24BDAC8D0];
  v4 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  if (objc_msgSend(*(id *)(a1 + 32), "count"))
  {
    v6 = 0;
    *(_QWORD *)&v5 = 138412802;
    v43 = v5;
    while (2)
    {
      v7 = sqlite3_column_text(a2, v6);
      v8 = *(void **)(a1 + 40);
      objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", v6);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectForKeyedSubscript:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      v11 = *(void **)(a1 + 48);
      objc_msgSend(v10, "name");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "objectForKeyedSubscript:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "featureValueType");

      switch(objc_msgSend(v10, "type"))
      {
        case 1:
          switch(v14)
          {
            case 0:
              goto LABEL_9;
            case 6:
              if (v7)
              {
                objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v7);
                v17 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(*(id *)(a1 + 56), "isDoubleArray:", v17);
                v28 = (void *)objc_claimAutoreleasedReturnValue();
                v16 = -[LCFFeatureValue initWithDoubleArray:]([LCFFeatureValue alloc], "initWithDoubleArray:", v28);

                goto LABEL_26;
              }
              v15 = -[LCFFeatureValue initWithDoubleArray:]([LCFFeatureValue alloc], "initWithDoubleArray:", 0);
              goto LABEL_5;
            case 3:
LABEL_9:
              if (v7)
              {
                objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v7);
                v17 = (void *)objc_claimAutoreleasedReturnValue();
                v18 = -[LCFFeatureValue initWithStringValue:]([LCFFeatureValue alloc], "initWithStringValue:", v17);
                goto LABEL_25;
              }
              v15 = -[LCFFeatureValue initWithStringValue:]([LCFFeatureValue alloc], "initWithStringValue:", 0);
              goto LABEL_5;
          }
          v27 = (void *)LCFLogDatabaseConnection;
          if (!os_log_type_enabled((os_log_t)LCFLogDatabaseConnection, OS_LOG_TYPE_FAULT))
            goto LABEL_38;
          goto LABEL_37;
        case 2:
          if (!v14 || v14 == 5)
          {
            v25 = [LCFFeatureValue alloc];
            v26 = v25;
            if (v7)
            {
              objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", sqlite3_column_int(a2, v6));
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              v18 = -[LCFFeatureValue initWithTimeBucketValue:](v26, "initWithTimeBucketValue:", v17);
              goto LABEL_25;
            }
            v15 = -[LCFFeatureValue initWithTimeBucketValue:](v25, "initWithTimeBucketValue:", 0);
            goto LABEL_5;
          }
          if (v14 == 1)
          {
            v19 = [LCFFeatureValue alloc];
            v20 = v19;
            if (v7)
            {
              objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", sqlite3_column_int(a2, v6));
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              v18 = -[LCFFeatureValue initWithIntValue:](v20, "initWithIntValue:", v17);
              goto LABEL_25;
            }
            v15 = -[LCFFeatureValue initWithIntValue:](v19, "initWithIntValue:", 0);
            goto LABEL_5;
          }
          v27 = (void *)LCFLogDatabaseConnection;
          if (!os_log_type_enabled((os_log_t)LCFLogDatabaseConnection, OS_LOG_TYPE_FAULT))
            goto LABEL_38;
          goto LABEL_37;
        case 3:
          if (!v14 || v14 == 2)
          {
            v21 = [LCFFeatureValue alloc];
            v22 = v21;
            if (v7)
            {
              objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", sqlite3_column_double(a2, v6));
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              v18 = -[LCFFeatureValue initWithDoubleValue:](v22, "initWithDoubleValue:", v17);
              goto LABEL_25;
            }
            v15 = -[LCFFeatureValue initWithDoubleValue:](v21, "initWithDoubleValue:", 0);
            goto LABEL_5;
          }
          v27 = (void *)LCFLogDatabaseConnection;
          if (!os_log_type_enabled((os_log_t)LCFLogDatabaseConnection, OS_LOG_TYPE_FAULT))
            goto LABEL_38;
          goto LABEL_37;
        case 4:
          if (v14 == 4)
          {
            v23 = [LCFFeatureValue alloc];
            v24 = v23;
            if (v7)
            {
              objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", sqlite3_column_int(a2, v6));
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              v18 = -[LCFFeatureValue initWithBoolValue:](v24, "initWithBoolValue:", v17);
LABEL_25:
              v16 = v18;
LABEL_26:

            }
            else
            {
              v15 = -[LCFFeatureValue initWithBoolValue:](v23, "initWithBoolValue:", 0);
LABEL_5:
              v16 = v15;
            }
          }
          else
          {
            v27 = (void *)LCFLogDatabaseConnection;
            if (os_log_type_enabled((os_log_t)LCFLogDatabaseConnection, OS_LOG_TYPE_FAULT))
            {
LABEL_37:
              v29 = v27;
              objc_msgSend(v10, "name");
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              v31 = objc_msgSend(v10, "type");
              *(_DWORD *)buf = v43;
              *(_QWORD *)&buf[4] = v30;
              *(_WORD *)&buf[12] = 2048;
              *(_QWORD *)&buf[14] = v31;
              *(_WORD *)&buf[22] = 2048;
              v45 = v14;
              _os_log_fault_impl(&dword_24032B000, v29, OS_LOG_TYPE_FAULT, "Wrong feature value type is assigned featureName:%@ columnInDb.type:%ld featureValueType: %ld", buf, 0x20u);

            }
LABEL_38:
            v16 = 0;
          }
          objc_msgSend(v10, "name", v43, *(_OWORD *)buf, *(_QWORD *)&buf[16], v45);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "setValue:forKey:", v16, v32);

          if (objc_msgSend(*(id *)(a1 + 32), "count") <= (unint64_t)++v6)
            break;
          continue;
        default:
          v15 = -[LCFFeatureValue initEmpty]([LCFFeatureValue alloc], "initEmpty");
          goto LABEL_5;
      }
      break;
    }
  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("_lcf_itemIdentifier"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "stringValue");
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("_lcf_featureVersion"));
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "doubleValue");
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  v37 = (void *)MEMORY[0x24BDBCE60];
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("_lcf_timestamp"));
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "doubleValue");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "doubleValue");
  objc_msgSend(v37, "dateWithTimeIntervalSinceReferenceDate:");
  v40 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "removeObjectForKey:", CFSTR("_lcf_itemIdentifier"));
  objc_msgSend(v4, "removeObjectForKey:", CFSTR("_lcf_featureVersion"));
  objc_msgSend(v4, "removeObjectForKey:", CFSTR("_lcf_timestamp"));
  objc_msgSend(v4, "removeObjectForKey:", CFSTR("ID"));
  v41 = *(void **)(a1 + 64);
  v42 = -[LCFFeatureSet initWithIdentifier:featureVersion:timestamp:featureValues:]([LCFFeatureSet alloc], "initWithIdentifier:featureVersion:timestamp:featureValues:", v34, v36, v40, v4);
  objc_msgSend(v41, "addObject:", v42);

}

- (void)dumpDatabase
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  -[LCFDatabaseConnection getColumns](self, "getColumns");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allKeys");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("SELECT * FROM %@ limit 10"), self->_tableName);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __37__LCFDatabaseConnection_dumpDatabase__block_invoke;
  v7[3] = &unk_25109F1D0;
  v8 = v4;
  v6 = v4;
  -[LCFDatabaseConnection doQueryEachStep:statementStepHandler:](self, "doQueryEachStep:statementStepHandler:", v5, v7);

}

void __37__LCFDatabaseConnection_dumpDatabase__block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  id v4;
  unint64_t v5;
  const unsigned __int8 *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v4 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  if (objc_msgSend(*(id *)(a1 + 32), "count"))
  {
    v5 = 0;
    do
    {
      v6 = sqlite3_column_text(a2, v5);
      if (v6)
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v6);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v7);

      }
      else
      {
        objc_msgSend(v4, "addObject:", CFSTR("null"));
      }
      ++v5;
    }
    while (objc_msgSend(*(id *)(a1 + 32), "count") > v5);
  }
  v8 = (void *)LCFLogDatabaseConnection;
  if (os_log_type_enabled((os_log_t)LCFLogDatabaseConnection, OS_LOG_TYPE_INFO))
  {
    v9 = v8;
    objc_msgSend(v4, "componentsJoinedByString:", CFSTR(","));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138412290;
    v12 = v10;
    _os_log_impl(&dword_24032B000, v9, OS_LOG_TYPE_INFO, "database %@", (uint8_t *)&v11, 0xCu);

  }
}

- (BOOL)pruneFrom:(id)a3 endDate:(id)a4
{
  unint64_t v6;
  unint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  BOOL v16;

  v6 = (unint64_t)a3;
  v7 = (unint64_t)a4;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("DELETE FROM %@"), self->_tableName);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!(v6 | v7))
    goto LABEL_7;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ where "), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v10 = (void *)MEMORY[0x24BDD17C8];
    v11 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend((id)v6, "timeIntervalSinceReferenceDate");
    objc_msgSend(v11, "numberWithDouble:");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringWithFormat:", CFSTR("%@ %@ >= %@ "), v9, CFSTR("_lcf_timestamp"), v12);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v7)
    {
LABEL_7:
      v9 = v8;
      goto LABEL_8;
    }
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ and "), v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_6:
    v13 = (void *)MEMORY[0x24BDD17C8];
    v14 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend((id)v7, "timeIntervalSinceReferenceDate");
    objc_msgSend(v14, "numberWithDouble:");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "stringWithFormat:", CFSTR("%@ %@ <= %@ "), v9, CFSTR("_lcf_timestamp"), v15);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_7;
  }
  if (v7)
    goto LABEL_6;
LABEL_8:
  v16 = -[LCFDatabaseConnection doQueryExec:](self, "doQueryExec:", v9);

  return v16;
}

- (NSURL)databaseBaseURL
{
  return self->_databaseBaseURL;
}

- (NSString)databaseName
{
  return self->_databaseName;
}

- (NSString)databaseNamePath
{
  return self->_databaseNamePath;
}

- (NSString)tableName
{
  return self->_tableName;
}

- (LCFDatabaseColumnConnection)dbColumnConnection
{
  return self->_dbColumnConnection;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dbColumnConnection, 0);
  objc_storeStrong((id *)&self->_tableName, 0);
  objc_storeStrong((id *)&self->_databaseNamePath, 0);
  objc_storeStrong((id *)&self->_databaseName, 0);
  objc_storeStrong((id *)&self->_databaseBaseURL, 0);
}

- (void)doQueryEachStep:statementStepHandler:.cold.1()
{
  __assert_rtn("-[LCFDatabaseConnection doQueryEachStep:statementStepHandler:]", "LCFDatabaseConnection.m", 93, "false");
}

- (void)query:(uint64_t)a3 startDate:(uint64_t)a4 endDate:(uint64_t)a5 reversed:(uint64_t)a6 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1(&dword_24032B000, a2, a3, "sqlite3_exec no column found - %@ ", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

@end
