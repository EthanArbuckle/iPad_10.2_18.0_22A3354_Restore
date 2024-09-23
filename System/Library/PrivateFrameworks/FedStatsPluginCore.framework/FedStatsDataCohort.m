@implementation FedStatsDataCohort

- (FedStatsDataCohort)init
{
  FedStatsDataCohort *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  NSDictionary *namespaceMap;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)FedStatsDataCohort;
  v2 = -[FedStatsDataCohort init](&v8, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "pathForResource:ofType:", CFSTR("FedStatsCohortAllowList"), CFSTR("plist"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithContentsOfFile:", v4);
    v5 = objc_claimAutoreleasedReturnValue();
    namespaceMap = v2->_namespaceMap;
    v2->_namespaceMap = (NSDictionary *)v5;

  }
  return v2;
}

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __36__FedStatsDataCohort_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken_116 != -1)
    dispatch_once(&sharedInstance_onceToken_116, block);
  return (id)sharedInstance_sharedDataCohortInstance;
}

void __36__FedStatsDataCohort_sharedInstance__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sharedInstance_sharedDataCohortInstance;
  sharedInstance_sharedDataCohortInstance = (uint64_t)v1;

}

+ (BOOL)checkCohortField:(id)a3 forNamespaceID:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;

  v5 = a3;
  v6 = a4;
  +[FedStatsDataCohort sharedInstance](FedStatsDataCohort, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "namespaceMap");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
    v10 = objc_msgSend(v9, "containsObject:", v5);
  else
    v10 = 0;

  return v10;
}

+ (id)keysForCohorts:(id)a3 namespaceID:(id)a4 parameters:(id)a5 possibleError:(id *)a6
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  NSObject *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v31;
  void *v32;
  id v33;
  id v34;
  id obj;
  id v36;
  void *v37;
  id v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  uint8_t buf[4];
  uint64_t v44;
  __int16 v45;
  id v46;
  __int16 v47;
  id v48;
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a4;
  v36 = a5;
  +[FedStatsDataCohort sharedInstance](FedStatsDataCohort, "sharedInstance");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "namespaceMap");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKey:", v10);
  v13 = objc_claimAutoreleasedReturnValue();

  v37 = (void *)v13;
  if (v13)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v9, "count"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = 0u;
    v40 = 0u;
    v41 = 0u;
    v42 = 0u;
    obj = v9;
    v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v49, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v40;
      v18 = v14;
      v32 = v11;
      v33 = v9;
      v34 = v10;
LABEL_4:
      v19 = 0;
      while (1)
      {
        if (*(_QWORD *)v40 != v17)
          objc_enumerationMutation(obj);
        v20 = *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * v19);
        if ((objc_msgSend(v37, "containsObject:", v20) & 1) == 0)
          break;
        +[FedStatsCohortFactory cohortQueryFieldByName:](FedStatsCohortFactory, "cohortQueryFieldByName:", v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v21)
        {
          v11 = v32;
          v9 = v33;
          v10 = v34;
          if (a6)
          {
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("\"%@\" cohort is not implemented."), v20, v31);
LABEL_25:
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            +[FedStatsPluginError errorWithCode:description:](FedStatsPluginError, "errorWithCode:description:", 300, v29);
            *a6 = (id)objc_claimAutoreleasedReturnValue();

            v14 = v18;
          }
          goto LABEL_26;
        }
        v22 = v21;
        v38 = 0;
        objc_msgSend(v21, "cohortKeyForParameters:possibleError:", v36, &v38);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = v38;
        +[FedStatsPluginLog logger](FedStatsPluginLog, "logger");
        v25 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412802;
          v44 = v20;
          v45 = 2112;
          v46 = v23;
          v47 = 2112;
          v48 = v34;
          _os_log_debug_impl(&dword_23B425000, v25, OS_LOG_TYPE_DEBUG, "cohortName:cohortKey => %@=%@ for namespace %@", buf, 0x20u);
        }

        if (v24)
        {
          +[FedStatsPluginLog logger](FedStatsPluginLog, "logger");
          v26 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412546;
            v44 = v20;
            v45 = 2112;
            v46 = v24;
            _os_log_debug_impl(&dword_23B425000, v26, OS_LOG_TYPE_DEBUG, "\"%@\" cohort error while creating the key: %@", buf, 0x16u);
          }

        }
        v14 = v18;
        objc_msgSend(v18, "addObject:", v23);

        if (v16 == ++v19)
        {
          v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v49, 16);
          v11 = v32;
          v9 = v33;
          v10 = v34;
          if (v16)
            goto LABEL_4;
          goto LABEL_17;
        }
      }
      v11 = v32;
      v9 = v33;
      v10 = v34;
      if (a6)
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("\"%@\" cohort is not approved for \"%@\" namespace."), v20, v34);
        goto LABEL_25;
      }
LABEL_26:

      v27 = 0;
      goto LABEL_27;
    }
LABEL_17:

    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:", v14);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_27:

  }
  else
  {
    if (a6)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("\"%@\" namespace is invalid."), v10);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      +[FedStatsPluginError errorWithCode:description:](FedStatsPluginError, "errorWithCode:description:", 300, v28);
      *a6 = (id)objc_claimAutoreleasedReturnValue();

    }
    v27 = 0;
  }

  return v27;
}

- (NSDictionary)namespaceMap
{
  return self->_namespaceMap;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_namespaceMap, 0);
}

@end
