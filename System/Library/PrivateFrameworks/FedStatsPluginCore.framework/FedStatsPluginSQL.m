@implementation FedStatsPluginSQL

- (FedStatsPluginSQL)initWithError:(id *)a3
{
  FedStatsPluginSQL *v4;
  void *v5;
  void *v6;
  char v7;
  id v8;
  void *v9;
  char v10;
  id v11;
  BMSQLDatabase *database;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  id v18;
  id v19;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)FedStatsPluginSQL;
  v4 = -[FedStatsPluginSQL init](&v20, sel_init);
  if (!v4)
    goto LABEL_6;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE0CCD0]), "initWithPrivileges:isColumnAccessLoggingEnabled:", 0, 1);
  if (!v5)
  {
    if (!a3)
      goto LABEL_16;
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Could not create the BIOME database"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    +[FedStatsPluginError errorWithCode:description:](FedStatsPluginError, "errorWithCode:description:", 400, v14);
    *a3 = (id)objc_claimAutoreleasedReturnValue();

LABEL_15:
    a3 = 0;
    goto LABEL_16;
  }
  v6 = v5;
  objc_msgSend(v5, "resetColumnAccessLog");
  v19 = 0;
  v7 = objc_msgSend(v6, "registerFunctionWithName:numArgs:function:userData:error:", CFSTR("strip_url"), 1, &__block_literal_global_0, 0, &v19);
  v8 = v19;
  v9 = v8;
  if ((v7 & 1) == 0)
  {
    if (!a3)
    {
LABEL_14:

      goto LABEL_15;
    }
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Cannot register UDF '%@' with Biome DB"), CFSTR("strip_url"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    +[FedStatsPluginError errorWithCode:underlyingError:description:](FedStatsPluginError, "errorWithCode:underlyingError:description:", 300, v9, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_13:
    *a3 = v16;

    goto LABEL_14;
  }
  v18 = v8;
  v10 = objc_msgSend(v6, "registerFunctionWithName:numArgs:function:userData:error:", CFSTR("extract_host"), 1, &__block_literal_global_27, 0, &v18);
  v11 = v18;

  if ((v10 & 1) == 0)
  {
    if (!a3)
    {
      v9 = v11;
      goto LABEL_14;
    }
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Cannot register UDF '%@' with Biome DB"), CFSTR("extract_host"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    +[FedStatsPluginError errorWithCode:underlyingError:description:](FedStatsPluginError, "errorWithCode:underlyingError:description:", 300, v11, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v11;
    goto LABEL_13;
  }
  database = v4->_database;
  v4->_database = (BMSQLDatabase *)v6;
  v13 = v6;

LABEL_6:
  a3 = v4;
LABEL_16:

  return (FedStatsPluginSQL *)a3;
}

id __35__FedStatsPluginSQL_initWithError___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v2 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(a2, "objectAtIndexedSubscript:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%@"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(v5, "scheme");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "host");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "path");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringWithFormat:", CFSTR("%@://%@%@"), v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

id __35__FedStatsPluginSQL_initWithError___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(a2, "objectAtIndexedSubscript:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%@"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "host");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)runQuery:(id)a3 withError:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t j;
  void *v34;
  NSObject *v35;
  FedStatsPluginSQL *v37;
  void *v39;
  void *v40;
  void *v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  uint8_t buf[16];
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  _BYTE v51[128];
  _BYTE v52[128];
  uint64_t v53;

  v53 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  -[FedStatsPluginSQL database](self, "database");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "resetColumnAccessLog");

  v40 = v5;
  v7 = (void *)objc_msgSend(v5, "copy");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_claimAutoreleasedReturnValue();

  v37 = self;
  -[FedStatsPluginSQL database](self, "database");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = (void *)v10;
  objc_msgSend(v11, "executeQuery:", CFSTR("%@"), v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BE30C78], "samplerWithCount:", *MEMORY[0x24BE30C88]);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v12, "next"))
  {
    do
    {
      v13 = (void *)MEMORY[0x24BDBCED8];
      objc_msgSend(v12, "columns");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "dictionaryWithCapacity:", objc_msgSend(v14, "count"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      v49 = 0u;
      v50 = 0u;
      v47 = 0u;
      v48 = 0u;
      objc_msgSend(v12, "columns");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v47, v52, 16);
      if (v17)
      {
        v18 = v17;
        v19 = *(_QWORD *)v48;
        do
        {
          for (i = 0; i != v18; ++i)
          {
            if (*(_QWORD *)v48 != v19)
              objc_enumerationMutation(v16);
            v21 = *(_QWORD *)(*((_QWORD *)&v47 + 1) + 8 * i);
            objc_msgSend(MEMORY[0x24BDBCEF8], "null");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "setObject:forKey:", v22, v21);

          }
          v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v47, v52, 16);
        }
        while (v18);
      }

      objc_msgSend(v12, "row");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "addEntriesFromDictionary:", v23);

      objc_msgSend(v41, "addItem:", v15);
    }
    while ((objc_msgSend(v12, "next") & 1) != 0);
  }
  objc_msgSend(v12, "error");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (v24)
  {
    if (!a4)
    {
      v26 = 0;
      goto LABEL_30;
    }
    objc_msgSend(v12, "error");
    v25 = (id)objc_claimAutoreleasedReturnValue();
    +[FedStatsPluginError errorWithCode:underlyingError:description:](FedStatsPluginError, "errorWithCode:underlyingError:description:", 400, v25, CFSTR("Query execution failed"));
    v26 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v41, "getResults");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v26, "count"))
    {
      +[FedStatsPluginLog logger](FedStatsPluginLog, "logger");
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_23B425000, v27, OS_LOG_TYPE_INFO, "The returned SQL query result from BIOME is empty", buf, 2u);
      }

    }
    v25 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
    v42 = 0u;
    v43 = 0u;
    v44 = 0u;
    v45 = 0u;
    -[FedStatsPluginSQL database](v37, "database");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "accessedColumns");
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v42, v51, 16);
    if (v30)
    {
      v31 = v30;
      v32 = *(_QWORD *)v43;
      do
      {
        for (j = 0; j != v31; ++j)
        {
          if (*(_QWORD *)v43 != v32)
            objc_enumerationMutation(v29);
          objc_msgSend(*(id *)(*((_QWORD *)&v42 + 1) + 8 * j), "columns");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "unionSet:", v34);

        }
        v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v42, v51, 16);
      }
      while (v31);
    }

    if (!objc_msgSend(v25, "count"))
    {
      +[FedStatsPluginLog logger](FedStatsPluginLog, "logger");
      v35 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_23B425000, v35, OS_LOG_TYPE_INFO, "The returned SQL accessed columns from BIOME is empty", buf, 2u);
      }

    }
  }

LABEL_30:
  return v26;
}

- (BMSQLDatabase)database
{
  return self->_database;
}

- (void)setDatabase:(id)a3
{
  objc_storeStrong((id *)&self->_database, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_database, 0);
}

@end
