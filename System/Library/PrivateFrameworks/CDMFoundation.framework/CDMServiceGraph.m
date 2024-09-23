@implementation CDMServiceGraph

+ (id)getAssetsForSetup:(id)a3
{
  CDMAssetsInfo *v4;
  objc_class *v5;
  void *v6;
  void *v7;
  NSString *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t j;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  CDMAssetsFactorConfig *v17;
  CDMAssetsFactorConfig *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t k;
  uint64_t v23;
  void *v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t m;
  void *v29;
  void *v30;
  NSObject *v31;
  uint64_t v33;
  uint64_t v34;
  id obj;
  uint64_t i;
  CDMAssetsInfo *v37;
  id v38;
  id v39;
  id v40;
  uint64_t v41;
  _BOOL4 v42;
  uint64_t v43;
  void *v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  uint8_t buf[4];
  const char *v62;
  __int16 v63;
  void *v64;
  _BYTE v65[128];
  _BYTE v66[128];
  _BYTE v67[128];
  _BYTE v68[128];
  uint64_t v69;

  v69 = *MEMORY[0x24BDAC8D0];
  v38 = a3;
  v4 = [CDMAssetsInfo alloc];
  v39 = a1;
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = -[CDMAssetsInfo initWithGraphName:](v4, "initWithGraphName:", v6);

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "requiredDAGServices");
  v59 = 0u;
  v60 = 0u;
  v57 = 0u;
  v58 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v33 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v57, v68, 16);
  if (v33)
  {
    v34 = *(_QWORD *)v58;
    do
    {
      for (i = 0; i != v33; ++i)
      {
        if (*(_QWORD *)v58 != v34)
          objc_enumerationMutation(obj);
        v8 = *(NSString **)(*((_QWORD *)&v57 + 1) + 8 * i);
        v42 = +[CDMServiceGraph isServiceRequiredForSetup:](CDMServiceGraph, "isServiceRequiredForSetup:", v8);
        -[objc_class getCDMServiceAssetConfig](NSClassFromString(v8), "getCDMServiceAssetConfig");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v55 = 0u;
        v56 = 0u;
        v53 = 0u;
        v54 = 0u;
        v44 = v9;
        objc_msgSend(v9, "getAllAssetSets");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v53, v67, 16);
        if (v11)
        {
          v40 = v10;
          v41 = *(_QWORD *)v54;
          do
          {
            v43 = v11;
            for (j = 0; j != v43; ++j)
            {
              if (*(_QWORD *)v54 != v41)
                objc_enumerationMutation(v40);
              v13 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * j);
              objc_msgSend(v44, "getCDMAssetsFactorConfigForAssetSet:", objc_msgSend(v13, "integerValue"));
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v7, "objectForKeyedSubscript:", v13);
              v15 = (void *)objc_claimAutoreleasedReturnValue();

              if (v15)
              {
                objc_msgSend(v7, "objectForKeyedSubscript:", v13);
                v16 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v16, "addEntriesFromCDMAssetsFactorConfig:", v14);
              }
              else
              {
                v17 = [CDMAssetsFactorConfig alloc];
                objc_msgSend(v14, "getFactorToFoldersMapping");
                v16 = (void *)objc_claimAutoreleasedReturnValue();
                v18 = -[CDMAssetsFactorConfig initWithFactorToFoldersMapping:](v17, "initWithFactorToFoldersMapping:", v16);
                objc_msgSend(v7, "setObject:forKeyedSubscript:", v18, v13);

              }
              if (v42)
              {
                v51 = 0u;
                v52 = 0u;
                v49 = 0u;
                v50 = 0u;
                objc_msgSend(v44, "getAllFactors");
                v19 = (void *)objc_claimAutoreleasedReturnValue();
                v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v49, v66, 16);
                if (v20)
                {
                  v21 = *(_QWORD *)v50;
                  do
                  {
                    for (k = 0; k != v20; ++k)
                    {
                      if (*(_QWORD *)v50 != v21)
                        objc_enumerationMutation(v19);
                      v23 = *(_QWORD *)(*((_QWORD *)&v49 + 1) + 8 * k);
                      objc_msgSend(v7, "objectForKeyedSubscript:", v13);
                      v24 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v24, "setIsRequiredForFactor:isRequired:", v23, 1);

                    }
                    v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v49, v66, 16);
                  }
                  while (v20);
                }

              }
            }
            v10 = v40;
            v11 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v53, v67, 16);
          }
          while (v11);
        }

      }
      v33 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v57, v68, 16);
    }
    while (v33);
  }

  v47 = 0u;
  v48 = 0u;
  v45 = 0u;
  v46 = 0u;
  v25 = v7;
  v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v45, v65, 16);
  if (v26)
  {
    v27 = *(_QWORD *)v46;
    do
    {
      for (m = 0; m != v26; ++m)
      {
        if (*(_QWORD *)v46 != v27)
          objc_enumerationMutation(v25);
        v29 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * m);
        objc_msgSend(v39, "getUsageForAssetSetName:withLocale:", objc_msgSend(v29, "integerValue"), v38);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        if (v30)
        {
          objc_msgSend(v25, "objectForKeyedSubscript:", v29);
          v31 = objc_claimAutoreleasedReturnValue();
          -[CDMAssetsInfo setAssetsUsages:withCDMAssetsFactorConfig:forCDMAssetSet:](v37, "setAssetsUsages:withCDMAssetsFactorConfig:forCDMAssetSet:", v30, v31, objc_msgSend(v29, "integerValue"));
        }
        else
        {
          CDMOSLoggerForCategory(2);
          v31 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315394;
            v62 = "+[CDMServiceGraph getAssetsForSetup:]";
            v63 = 2112;
            v64 = v29;
            _os_log_error_impl(&dword_21A2A0000, v31, OS_LOG_TYPE_ERROR, "%s [ERR]: Usages not found for %@, skipping assets for this cdmAssetSet for setup", buf, 0x16u);
          }
        }

      }
      v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v45, v65, 16);
    }
    while (v26);
  }

  return v37;
}

+ (BOOL)isServiceRequiredForSetup:(id)a3
{
  NSString *v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  char v8;

  v3 = (NSString *)a3;
  if (-[objc_class isEnabled](NSClassFromString(v3), "isEnabled")
    && (-[objc_class getCDMServiceAssetConfig](NSClassFromString(v3), "getCDMServiceAssetConfig"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v5 = objc_msgSend(v4, "isAssetRequiredForSetup"),
        v4,
        v5))
  {
    -[objc_class getCDMServiceAssetConfig](NSClassFromString(v3), "getCDMServiceAssetConfig");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "getCDMAssetSetToFactorsConfig");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "hasAssetSetToFactorsMapping");

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (CDMServiceGraph)initWithServices:(id)a3 graphInput:(id)a4 languageCode:(id)a5 handlerId:(id)a6 aneLock:(id)a7 dataDispatcherContext:(id)a8
{
  return -[CDMServiceGraph initWithServices:graphServices:graphInput:languageCode:handlerId:aneLock:dataDispatcherContext:](self, "initWithServices:graphServices:graphInput:languageCode:handlerId:aneLock:dataDispatcherContext:", a3, MEMORY[0x24BDBD1A8], a4, a5, a6, a7, a8);
}

- (CDMServiceGraph)initWithServices:(id)a3 graphServices:(id)a4 graphInput:(id)a5 languageCode:(id)a6 handlerId:(id)a7 aneLock:(id)a8 dataDispatcherContext:(id)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  CDMServiceGraph *v22;
  NSMutableDictionary *v23;
  NSMutableDictionary *serviceMap;
  NSMutableDictionary *v25;
  NSMutableDictionary *graphServiceMap;
  void *v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  char v32;
  uint64_t i;
  void *v34;
  objc_class *v35;
  void *v36;
  void *v37;
  id v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t j;
  uint64_t v43;
  objc_class *v44;
  void *v45;
  void *v46;
  uint64_t v47;
  objc_class *v48;
  void *v49;
  void *v50;
  NSObject *v51;
  CDMDataDispatcherContext *v52;
  void *cdmDataDispatcherContext;
  void *v54;
  void *v55;
  void *v56;
  uint64_t v57;
  NSError *v58;
  NSObject *v59;
  id graphOutput;
  NSError *error;
  NSMutableArray *v62;
  NSMutableArray *nodes;
  NSMutableDictionary *v64;
  NSMutableDictionary *nodesWithName;
  CDMServiceGraphNode *endNode;
  NSMutableDictionary *v67;
  NSMutableDictionary *skipNodes;
  NSMutableArray *v69;
  NSMutableArray *serviceMetrics;
  void *v72;
  void *v73;
  id v74;
  id v75;
  id v76;
  id v77;
  id v78;
  id obj;
  id v80;
  id v81;
  void *v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  objc_super v91;
  uint8_t buf[4];
  const char *v93;
  __int16 v94;
  void *v95;
  uint64_t v96;
  void *v97;
  _BYTE v98[128];
  _BYTE v99[128];
  uint64_t v100;

  v100 = *MEMORY[0x24BDAC8D0];
  v15 = a3;
  v16 = a4;
  v17 = a5;
  obj = a6;
  v18 = a6;
  v80 = a7;
  v19 = a7;
  v81 = a8;
  v20 = a8;
  v21 = a9;
  v91.receiver = self;
  v91.super_class = (Class)CDMServiceGraph;
  v22 = -[CDMServiceGraph init](&v91, sel_init);
  if (v22)
  {
    v73 = v21;
    v74 = v20;
    v75 = v19;
    v76 = v18;
    v77 = v17;
    v82 = v16;
    v23 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    serviceMap = v22->_serviceMap;
    v22->_serviceMap = v23;

    v25 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    graphServiceMap = v22->_graphServiceMap;
    v22->_graphServiceMap = v25;

    v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(v15, "count"));
    v87 = 0u;
    v88 = 0u;
    v89 = 0u;
    v90 = 0u;
    v78 = v15;
    v28 = v15;
    v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v87, v99, 16);
    if (v29)
    {
      v30 = v29;
      v31 = *(_QWORD *)v88;
      v32 = 1;
      do
      {
        for (i = 0; i != v30; ++i)
        {
          if (*(_QWORD *)v88 != v31)
            objc_enumerationMutation(v28);
          v34 = *(void **)(*((_QWORD *)&v87 + 1) + 8 * i);
          v35 = (objc_class *)objc_opt_class();
          NSStringFromClass(v35);
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableDictionary setObject:forKeyedSubscript:](v22->_serviceMap, "setObject:forKeyedSubscript:", v34, v36);
          if (objc_msgSend(v34, "serviceState") == 3)
          {
            objc_msgSend(v34, "serviceName");
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v27, "addObject:", v37);

            v32 = 0;
          }

        }
        v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v87, v99, 16);
      }
      while (v30);
    }
    else
    {
      v32 = 1;
    }

    v85 = 0u;
    v86 = 0u;
    v83 = 0u;
    v84 = 0u;
    v38 = v82;
    v39 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v83, v98, 16);
    if (v39)
    {
      v40 = v39;
      v41 = *(_QWORD *)v84;
      do
      {
        for (j = 0; j != v40; ++j)
        {
          if (*(_QWORD *)v84 != v41)
            objc_enumerationMutation(v38);
          v43 = *(_QWORD *)(*((_QWORD *)&v83 + 1) + 8 * j);
          v44 = (objc_class *)objc_opt_class();
          NSStringFromClass(v44);
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableDictionary setObject:forKeyedSubscript:](v22->_graphServiceMap, "setObject:forKeyedSubscript:", v43, v45);

        }
        v40 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v83, v98, 16);
      }
      while (v40);
    }

    if ((v32 & 1) != 0)
    {
      v17 = v77;
      v21 = v73;
      if (-[CDMServiceGraph supportedGraphInputType](v22, "supportedGraphInputType"))
      {
        -[CDMServiceGraph supportedGraphInputType](v22, "supportedGraphInputType");
        v15 = v78;
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          v46 = (void *)MEMORY[0x24BDD17C8];
          v47 = -[CDMServiceGraph supportedGraphInputType](v22, "supportedGraphInputType");
          v48 = (objc_class *)objc_opt_class();
          NSStringFromClass(v48);
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v46, "stringWithFormat:", CFSTR("Incompatible type for graphInput, expected:%@, received:%@"), v47, v49);
          v50 = (void *)objc_claimAutoreleasedReturnValue();

          CDMOSLoggerForCategory(2);
          v51 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315394;
            v93 = "-[CDMServiceGraph initWithServices:graphServices:graphInput:languageCode:handlerId:aneLock:dataDispatcherContext:]";
            v94 = 2112;
            v95 = v50;
            _os_log_error_impl(&dword_21A2A0000, v51, OS_LOG_TYPE_ERROR, "%s [ERR]: %@", buf, 0x16u);
          }

          +[IncompatibleInputTypeException raise:format:](IncompatibleInputTypeException, "raise:format:", CFSTR("IncompatibleInputTypeException"), CFSTR("%@"), v50);
        }
        objc_storeStrong(&v22->_graphInput, a5);
        v52 = v73;
        cdmDataDispatcherContext = v22->_cdmDataDispatcherContext;
        v22->_cdmDataDispatcherContext = v52;
      }
      else
      {
        cdmDataDispatcherContext = v22->_graphInput;
        v22->_graphInput = 0;
        v15 = v78;
      }
      v16 = v82;

      objc_storeStrong((id *)&v22->_language, obj);
      graphOutput = v22->_graphOutput;
      v22->_graphOutput = 0;

      error = v22->_error;
      v22->_error = 0;

      objc_storeStrong((id *)&v22->_handlerId, v80);
      v62 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
      nodes = v22->_nodes;
      v22->_nodes = v62;

      v64 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
      nodesWithName = v22->_nodesWithName;
      v22->_nodesWithName = v64;

      endNode = v22->_endNode;
      v22->_endNode = 0;

      objc_storeStrong((id *)&v22->_aneLock, v81);
      v67 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
      skipNodes = v22->_skipNodes;
      v22->_skipNodes = v67;

      v69 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
      serviceMetrics = v22->_serviceMetrics;
      v22->_serviceMetrics = v69;

      -[CDMServiceGraph buildGraphInternal](v22, "buildGraphInternal");
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Abort building service graph, the following services are not setup: %@"), v27);
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      v55 = (void *)MEMORY[0x24BDD1540];
      v96 = *MEMORY[0x24BDD0FC8];
      v97 = v54;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v97, &v96, 1);
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v55, "errorWithDomain:code:userInfo:", CFSTR("CDMServiceGraphErrorDomain"), 3, v56);
      v57 = objc_claimAutoreleasedReturnValue();
      v58 = v22->_error;
      v22->_error = (NSError *)v57;

      CDMOSLoggerForCategory(2);
      v59 = objc_claimAutoreleasedReturnValue();
      v17 = v77;
      v21 = v73;
      if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR))
      {
        +[CDMPlatformUtils prettyPrintError:](CDMPlatformUtils, "prettyPrintError:", v22->_error);
        v72 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136315394;
        v93 = "-[CDMServiceGraph initWithServices:graphServices:graphInput:languageCode:handlerId:aneLock:dataDispatcherContext:]";
        v94 = 2112;
        v95 = v72;
        _os_log_error_impl(&dword_21A2A0000, v59, OS_LOG_TYPE_ERROR, "%s [ERR]: %@", buf, 0x16u);

      }
      v15 = v78;
      v16 = v82;
    }
    v20 = v74;

    v19 = v75;
    v18 = v76;
  }

  return v22;
}

- (CDMServiceGraph)init
{
  +[InvalidMethodCalledException raise:format:](InvalidMethodCalledException, "raise:format:", CFSTR("InvalidMethodCalledException"), CFSTR("init shouldn't be called"));

  return 0;
}

- (Class)supportedGraphInputType
{
  +[NotImplementedException raise:format:](NotImplementedException, "raise:format:", CFSTR("NotImplementedException"), CFSTR("supportedGraphInputType need to be implemented"));
  return 0;
}

- (id)getNodes
{
  return (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:", self->_nodes);
}

- (id)getNodesWithName
{
  return (id)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithDictionary:", self->_nodesWithName);
}

- (id)getError
{
  return self->_error;
}

- (void)buildGraph
{
  +[NotImplementedException raise:format:](NotImplementedException, "raise:format:", CFSTR("NotImplementedException"), CFSTR("buildGraph need to be implemented"));
}

- (void)buildGraphInternal
{
  NSString *v3;
  void *v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  NSString *v16;
  NSMutableArray *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  NSObject *v21;
  void *v22;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _QWORD v28[4];
  id v29;
  id v30;
  id v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  uint8_t buf[4];
  const char *v37;
  __int16 v38;
  void *v39;
  _BYTE v40[128];
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  -[CDMServiceGraph buildGraph](self, "buildGraph");
  v3 = self->_handlerId;
  -[CDMServiceGraph addNodeWithName:requestId:block:](self, "addNodeWithName:requestId:block:", CFSTR("endNode"), 0, &__block_literal_global_3422);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  v5 = self->_nodes;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v32, v41, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v33;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v33 != v7)
          objc_enumerationMutation(v5);
        if (*(void **)(*((_QWORD *)&v32 + 1) + 8 * i) != v4)
          objc_msgSend(v4, "addDependency:");
      }
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v32, v41, 16);
    }
    while (v6);
  }

  objc_storeStrong((id *)&self->_endNode, v4);
  -[CDMServiceGraph getGraphInput](self, "getGraphInput");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "loggingRequestID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[CDMServiceGraph serviceMetrics](self, "serviceMetrics");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[CDMServiceGraph cdmDataDispatcherContext](self, "cdmDataDispatcherContext");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = MEMORY[0x24BDAC760];
  v28[1] = 3221225472;
  v28[2] = __37__CDMServiceGraph_buildGraphInternal__block_invoke_264;
  v28[3] = &unk_24DCABF50;
  v13 = v11;
  v29 = v13;
  v30 = v10;
  v14 = v12;
  v31 = v14;
  v23 = v30;
  -[CDMServiceGraph addNodeWithName:requestId:block:](self, "addNodeWithName:requestId:block:", CFSTR("metricsNode"), v30, v28);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v3;
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v17 = self->_nodes;
  v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v24, v40, 16);
  if (v18)
  {
    v19 = *(_QWORD *)v25;
    do
    {
      for (j = 0; j != v18; ++j)
      {
        if (*(_QWORD *)v25 != v19)
          objc_enumerationMutation(v17);
        if (*(void **)(*((_QWORD *)&v24 + 1) + 8 * j) != v15)
          objc_msgSend(v15, "addDependency:");
      }
      v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v24, v40, 16);
    }
    while (v18);
  }

  CDMOSLoggerForCategory(2);
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
  {
    -[CDMServiceGraph toMermaid](self, "toMermaid");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315394;
    v37 = "-[CDMServiceGraph buildGraphInternal]";
    v38 = 2112;
    v39 = v22;
    _os_log_debug_impl(&dword_21A2A0000, v21, OS_LOG_TYPE_DEBUG, "%s Mermaid graph%@", buf, 0x16u);

  }
}

- (id)toMermaid
{
  NSObject *v3;
  __CFString *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __CFString *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSMutableArray *obj;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint8_t v33[128];
  uint8_t buf[4];
  const char *v35;
  __int16 v36;
  const __CFString *v37;
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  if (!self->_endNode)
  {
    CDMOSLoggerForCategory(2);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315394;
      v35 = "-[CDMServiceGraph toMermaid]";
      v36 = 2112;
      v37 = CFSTR("Graph hasn't been built yet, building one...");
      _os_log_debug_impl(&dword_21A2A0000, v3, OS_LOG_TYPE_DEBUG, "%s %@", buf, 0x16u);
    }

    -[CDMServiceGraph buildGraphInternal](self, "buildGraphInternal");
  }
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  obj = self->_nodes;
  v22 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
  if (v22)
  {
    v21 = *(_QWORD *)v29;
    v4 = &stru_24DCAE158;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v29 != v21)
          objc_enumerationMutation(obj);
        v23 = v5;
        v6 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * v5);
        v24 = 0u;
        v25 = 0u;
        v26 = 0u;
        v27 = 0u;
        objc_msgSend(v6, "dependencies");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
        if (v8)
        {
          v9 = v8;
          v10 = *(_QWORD *)v25;
          do
          {
            v11 = 0;
            v12 = v4;
            do
            {
              if (*(_QWORD *)v25 != v10)
                objc_enumerationMutation(v7);
              v13 = (void *)MEMORY[0x24BDD17C8];
              objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * v11), "getNodeName");
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v6, "getNodeName");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v13, "stringWithFormat:", CFSTR("  %@-->%@\n"), v14, v15);
              v16 = (void *)objc_claimAutoreleasedReturnValue();

              -[__CFString stringByAppendingString:](v12, "stringByAppendingString:", v16);
              v4 = (__CFString *)objc_claimAutoreleasedReturnValue();

              ++v11;
              v12 = v4;
            }
            while (v9 != v11);
            v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
          }
          while (v9);
        }

        v5 = v23 + 1;
      }
      while (v23 + 1 != v22);
      v22 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
    }
    while (v22);
  }
  else
  {
    v4 = &stru_24DCAE158;
  }

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("\n%@\n"), CFSTR("graph TD"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%@"), v17, v4);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

- (id)topoSort
{
  NSObject *v2;
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  _QWORD aBlock[5];
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE buf[24];
  void *(*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  if (!self->_endNode)
  {
    CDMOSLoggerForCategory(2);
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)&buf[4] = "-[CDMServiceGraph topoSort]";
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = CFSTR("Graph hasn't been built yet, building one...");
      _os_log_debug_impl(&dword_21A2A0000, v2, OS_LOG_TYPE_DEBUG, "%s %@", buf, 0x16u);
    }

    -[CDMServiceGraph buildGraphInternal](self, "buildGraphInternal");
  }
  v3 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  -[CDMServiceGraph getNodes](self, "getNodes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v23 != v6)
          objc_enumerationMutation(v4);
        v8 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        objc_msgSend(v8, "getNodeName");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "getNodeName");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v3, "containsObject:", v10);

        if (v11)
        {
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Duplicate CDMServiceGraphNode name: %@"), v9);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          +[DuplicateNodeNameException raise:format:](DuplicateNodeNameException, "raise:format:", CFSTR("DuplicateNodeNameException"), CFSTR("%@"), v12);

        }
        objc_msgSend(v3, "addObject:", v9);

      }
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
    }
    while (v5);
  }

  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v27 = __Block_byref_object_copy__3408;
  v28 = __Block_byref_object_dispose__3409;
  v29 = 0;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __27__CDMServiceGraph_topoSort__block_invoke;
  aBlock[3] = &unk_24DCABF78;
  aBlock[4] = buf;
  v13 = _Block_copy(aBlock);
  v14 = *(void **)(*(_QWORD *)&buf[8] + 40);
  *(_QWORD *)(*(_QWORD *)&buf[8] + 40) = v13;

  v15 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v16 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  if ((*(unsigned int (**)(void))(*(_QWORD *)(*(_QWORD *)&buf[8] + 40) + 16))())
    v17 = v15;
  else
    v17 = 0;
  v18 = v17;

  _Block_object_dispose(buf, 8);
  return v18;
}

- (BOOL)isAcyclic
{
  NSObject *v3;
  void *v4;
  BOOL v5;
  int v7;
  const char *v8;
  __int16 v9;
  const __CFString *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  if (!self->_endNode)
  {
    CDMOSLoggerForCategory(2);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      v7 = 136315394;
      v8 = "-[CDMServiceGraph isAcyclic]";
      v9 = 2112;
      v10 = CFSTR("Graph hasn't been built yet, building one...");
      _os_log_debug_impl(&dword_21A2A0000, v3, OS_LOG_TYPE_DEBUG, "%s %@", (uint8_t *)&v7, 0x16u);
    }

    -[CDMServiceGraph buildGraphInternal](self, "buildGraphInternal");
  }
  -[CDMServiceGraph topoSort](self, "topoSort");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4 != 0;

  return v5;
}

- (void)setGraphOutput:(id)a3
{
  objc_storeStrong(&self->_graphOutput, a3);
}

- (id)getGraphOutput
{
  return self->_graphOutput;
}

- (id)getServiceByClass:(Class)a3
{
  NSMutableDictionary *serviceMap;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  serviceMap = self->_serviceMap;
  NSStringFromClass(a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary valueForKey:](serviceMap, "valueForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    v7 = (void *)MEMORY[0x24BDD17C8];
    NSStringFromClass(a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringWithFormat:", CFSTR("Service type %@ is unknown"), v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    +[UnknownServiceException raise:format:](UnknownServiceException, "raise:format:", CFSTR("UnknownServiceException"), CFSTR("%@"), v9);
  }
  return v6;
}

- (id)getGraphServiceByClass:(Class)a3
{
  NSMutableDictionary *graphServiceMap;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  graphServiceMap = self->_graphServiceMap;
  NSStringFromClass(a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary valueForKey:](graphServiceMap, "valueForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    v7 = (void *)MEMORY[0x24BDD17C8];
    NSStringFromClass(a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringWithFormat:", CFSTR("Service type %@ is unknown"), v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    +[UnknownServiceException raise:format:](UnknownServiceException, "raise:format:", CFSTR("UnknownServiceException"), CFSTR("%@"), v9);
  }
  return v6;
}

- (id)getGraphInput
{
  return self->_graphInput;
}

- (id)addNodeWithName:(id)a3 requestId:(id)a4 block:(id)a5
{
  return -[CDMServiceGraph addNodeWithName:bindService:aneEnabled:requestId:block:](self, "addNodeWithName:bindService:aneEnabled:requestId:block:", a3, 0, 0, a4, a5);
}

- (id)addNodeWithName:(id)a3 aneEnabled:(BOOL)a4 requestId:(id)a5 block:(id)a6
{
  return -[CDMServiceGraph addNodeWithName:bindService:aneEnabled:requestId:block:](self, "addNodeWithName:bindService:aneEnabled:requestId:block:", a3, 0, a4, a5, a6);
}

- (id)addNodeWithName:(id)a3 bindService:(id)a4 requestId:(id)a5 block:(id)a6
{
  return -[CDMServiceGraph addNodeWithName:bindService:aneEnabled:requestId:block:](self, "addNodeWithName:bindService:aneEnabled:requestId:block:", a3, a4, 0, a5, a6);
}

- (id)addNodeWithName:(id)a3 bindService:(id)a4 aneEnabled:(BOOL)a5 requestId:(id)a6 block:(id)a7
{
  _BOOL4 v9;
  id v12;
  id v13;
  id v14;
  void *v15;
  uint64_t v16;
  void *v17;
  NSString *handlerId;
  id *v19;
  id WeakRetained;
  void *v21;
  id v22;
  void *v23;
  uint64_t v24;
  NSString *v25;
  void *v26;
  NSMutableDictionary *nodesWithName;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  NSMutableDictionary *v33;
  void *v34;
  id v36;
  void *v37;
  void *v38;
  id v39;
  _QWORD v40[4];
  id v41;
  _QWORD v42[4];
  id v43;
  _QWORD aBlock[4];
  id v45;
  id v46;
  id location[2];

  v9 = a5;
  v12 = a3;
  v13 = a4;
  v39 = a6;
  v14 = a7;
  v15 = _Block_copy(v14);
  v16 = MEMORY[0x24BDAC760];
  v36 = v14;
  if (v9)
  {
    objc_initWeak(location, self->_aneLock);
    aBlock[0] = v16;
    aBlock[1] = 3221225472;
    aBlock[2] = __74__CDMServiceGraph_addNodeWithName_bindService_aneEnabled_requestId_block___block_invoke;
    aBlock[3] = &unk_24DCABFA0;
    objc_copyWeak(&v46, location);
    v45 = v14;
    v17 = _Block_copy(aBlock);

    objc_destroyWeak(&v46);
    objc_destroyWeak(location);
    v15 = v17;
  }
  v38 = v13;
  if (+[CDMServiceGraph shouldSkipNode:service:](CDMServiceGraph, "shouldSkipNode:service:", v12, v13))
  {
    objc_initWeak(location, self);
    handlerId = self->_handlerId;
    v42[0] = v16;
    v42[1] = 3221225472;
    v42[2] = __74__CDMServiceGraph_addNodeWithName_bindService_aneEnabled_requestId_block___block_invoke_2;
    v42[3] = &unk_24DCABFC8;
    v19 = &v43;
    objc_copyWeak(&v43, location);
    WeakRetained = objc_loadWeakRetained(location);
    objc_msgSend(WeakRetained, "cdmDataDispatcherContext");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_loadWeakRetained(location);
    objc_msgSend(v22, "serviceMetrics");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    +[CDMServiceGraphNode initWithName:forHandler:withError:usingFunction:requestId:dataDispatcherContext:serviceMetricsArray:](CDMServiceGraphNode, "initWithName:forHandler:withError:usingFunction:requestId:dataDispatcherContext:serviceMetricsArray:", v12, handlerId, v42, &__block_literal_global_293, v39, v21, v23, v36);
    v24 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_initWeak(location, self);
    v25 = self->_handlerId;
    v40[0] = v16;
    v40[1] = 3221225472;
    v40[2] = __74__CDMServiceGraph_addNodeWithName_bindService_aneEnabled_requestId_block___block_invoke_4;
    v40[3] = &unk_24DCABFC8;
    v19 = &v41;
    objc_copyWeak(&v41, location);
    WeakRetained = objc_loadWeakRetained(location);
    objc_msgSend(WeakRetained, "cdmDataDispatcherContext");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_loadWeakRetained(location);
    objc_msgSend(v22, "serviceMetrics");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    +[CDMServiceGraphNode initWithName:forHandler:withError:usingFunction:requestId:dataDispatcherContext:serviceMetricsArray:](CDMServiceGraphNode, "initWithName:forHandler:withError:usingFunction:requestId:dataDispatcherContext:serviceMetricsArray:", v12, v25, v40, v15, v39, v21, v23, v36);
    v24 = objc_claimAutoreleasedReturnValue();
  }
  v26 = (void *)v24;

  objc_destroyWeak(v19);
  objc_destroyWeak(location);
  -[NSMutableArray addObject:](self->_nodes, "addObject:", v26);
  nodesWithName = self->_nodesWithName;
  objc_msgSend(v26, "getNodeName");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](nodesWithName, "objectForKey:", v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  if (v29)
  {
    v30 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v26, "getNodeName");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "stringWithFormat:", CFSTR("Duplicate node name: %@"), v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    +[DuplicateNodeNameException raise:format:](DuplicateNodeNameException, "raise:format:", CFSTR("DuplicateNodeNameException"), CFSTR("%@"), v32);
  }
  v33 = self->_nodesWithName;
  objc_msgSend(v26, "getNodeName");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setValue:forKey:](v33, "setValue:forKey:", v26, v34);

  return v26;
}

- (id)getLanguage
{
  return self->_language;
}

- (id)getEndNode
{
  return self->_endNode;
}

- (id)getHandlerId
{
  return self->_handlerId;
}

- (void)failedWithErrorCode:(int64_t)a3 errorDomain:(id)a4 message:(id)a5
{
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  NSString *language;
  void *v15;
  uint64_t v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x24BDAC8D0];
  v8 = (void *)MEMORY[0x24BDD1540];
  v16 = *MEMORY[0x24BDD0FC8];
  v17[0] = a5;
  v9 = (void *)MEMORY[0x24BDBCE70];
  v10 = a5;
  v11 = a4;
  objc_msgSend(v9, "dictionaryWithObjects:forKeys:count:", v17, &v16, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "errorWithDomain:code:userInfo:", v11, a3, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[CDMServiceGraph setError:](self, "setError:", v13);
  language = self->_language;
  -[CDMServiceGraph error](self, "error");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  +[CDMAnalytics recordGraphFailureEvent:withError:](CDMAnalytics, "recordGraphFailureEvent:withError:", language, v15);

}

- (void)failedWithError:(id)a3
{
  NSString *language;
  id v5;
  id v6;

  language = self->_language;
  v5 = a3;
  +[CDMAnalytics recordGraphFailureEvent:withError:](CDMAnalytics, "recordGraphFailureEvent:withError:", language, v5);
  v6 = (id)objc_msgSend(v5, "copy");

  -[CDMServiceGraph setError:](self, "setError:", v6);
}

- (id)validateRequest:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  CDMServiceGraph *v34;
  void *v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  uint8_t buf[4];
  const char *v41;
  __int16 v42;
  void *v43;
  __int16 v44;
  uint64_t v45;
  __int16 v46;
  void *v47;
  __int16 v48;
  uint64_t v49;
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = v4;
  if (!v4)
    goto LABEL_17;
  objc_msgSend(v4, "currentTurnInput");
  v6 = objc_claimAutoreleasedReturnValue();
  if (!v6)
    goto LABEL_17;
  v7 = (void *)v6;
  objc_msgSend(v5, "currentTurnInput");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "asrOutputs");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "count");

  if (v10)
  {
    v34 = self;
    v35 = v5;
    v38 = 0u;
    v39 = 0u;
    v36 = 0u;
    v37 = 0u;
    objc_msgSend(v5, "currentTurnInput");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "asrOutputs");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v36, v50, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v37;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v37 != v15)
            objc_enumerationMutation(v12);
          v17 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * i);
          objc_msgSend(v17, "utterance");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = (void *)objc_msgSend(v18, "mutableCopy");

          skitRemoveBidiCharacters();
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "setUtterance:", v20);

          CDMOSLoggerForCategory(2);
          v21 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
          {
            v22 = objc_msgSend(v19, "length");
            objc_msgSend(v17, "utterance");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "utterance");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            v25 = objc_msgSend(v24, "length");
            *(_DWORD *)buf = 136316162;
            v41 = "-[CDMServiceGraph validateRequest:]";
            v42 = 2112;
            v43 = v19;
            v44 = 2048;
            v45 = v22;
            v46 = 2112;
            v47 = v23;
            v48 = 2048;
            v49 = v25;
            _os_log_debug_impl(&dword_21A2A0000, v21, OS_LOG_TYPE_DEBUG, "%s Original text is '<%@>' with u16 size <%zu>. Text after filtering bidi characters is' <%@>' with u16 size <%zu>.", buf, 0x34u);

          }
        }
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v36, v50, 16);
      }
      while (v14);
    }

    v5 = v35;
    objc_msgSend(v35, "currentTurnInput");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "asrOutputs");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "firstObject");
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v28, "utterance");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    if (v29)
    {
      objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceCharacterSet");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "stringByTrimmingCharactersInSet:", v30);
      v31 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v31, "length") && objc_msgSend(v29, "length"))
      {
        v32 = v28;
      }
      else
      {
        -[CDMServiceGraph failedWithErrorCode:errorDomain:message:](v34, "failedWithErrorCode:errorDomain:message:", 2, CFSTR("CDMServiceGraphErrorDomain"), CFSTR("utterance is empty"));
        v32 = 0;
      }

    }
    else
    {
      -[CDMServiceGraph failedWithErrorCode:errorDomain:message:](v34, "failedWithErrorCode:errorDomain:message:", 2, CFSTR("CDMServiceGraphErrorDomain"), CFSTR("utterance is nil"));
      v32 = 0;
    }

  }
  else
  {
LABEL_17:
    -[CDMServiceGraph failedWithErrorCode:errorDomain:message:](self, "failedWithErrorCode:errorDomain:message:", 2, CFSTR("CDMServiceGraphErrorDomain"), CFSTR("nluRequest is empty"));
    v32 = 0;
  }

  return v32;
}

- (void)populateRequesterEnumForNluRequest:(id)a3
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  const char *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  int v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(v3, "requestId");
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = v4;
    objc_msgSend(v3, "requestId");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "connectionId");
    v7 = objc_claimAutoreleasedReturnValue();
    if (!v7)
      goto LABEL_6;
    v8 = (void *)v7;
    objc_msgSend(v3, "requestId");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "requester");

    if (!v10)
    {
      objc_msgSend(v3, "requestId");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "connectionId");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = +[CDMServiceGraph getCdmRequesterWithConnectionId:](CDMServiceGraph, "getCdmRequesterWithConnectionId:", v12);
      objc_msgSend(v3, "requestId");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setRequester:", v13);

      CDMOSLoggerForCategory(2);
      v5 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      {
LABEL_7:

        goto LABEL_8;
      }
      objc_msgSend(v3, "requestId");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "connectionId");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "requestId");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 136315650;
      v18 = "-[CDMServiceGraph populateRequesterEnumForNluRequest:]";
      v19 = 2112;
      v20 = v15;
      v21 = 1024;
      v22 = objc_msgSend(v16, "requester");
      _os_log_debug_impl(&dword_21A2A0000, v5, OS_LOG_TYPE_DEBUG, "%s Inferring cdmRequester enum based on connectionId=%@ as requester enum=%d; use enum directly once SRD / other"
        " callers of CDM start populating RequestID.requester",
        (uint8_t *)&v17,
        0x1Cu);

LABEL_6:
      goto LABEL_7;
    }
  }
LABEL_8:

}

- (void)skipNode:(id)a3 basedOnNode:(id)a4 withCondition:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  NSObject *v17;
  const char *v18;
  NSObject *v19;
  uint32_t v20;
  int v21;
  const char *v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (!v10)
  {
    CDMOSLoggerForCategory(2);
    v17 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      goto LABEL_16;
    v21 = 136315394;
    v22 = "-[CDMServiceGraph skipNode:basedOnNode:withCondition:]";
    v23 = 2112;
    v24 = v8;
    v18 = "%s [WARN]: Empty skip condition for node:%@";
LABEL_14:
    v19 = v17;
    v20 = 22;
LABEL_15:
    _os_log_impl(&dword_21A2A0000, v19, OS_LOG_TYPE_INFO, v18, (uint8_t *)&v21, v20);
    goto LABEL_16;
  }
  if ((-[NSMutableArray containsObject:](self->_nodes, "containsObject:", v8) & 1) == 0)
  {
    CDMOSLoggerForCategory(2);
    v17 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      goto LABEL_16;
    v21 = 136315394;
    v22 = "-[CDMServiceGraph skipNode:basedOnNode:withCondition:]";
    v23 = 2112;
    v24 = v8;
    v18 = "%s [WARN]: Node is not found in graph:%@";
    goto LABEL_14;
  }
  if ((-[NSMutableArray containsObject:](self->_nodes, "containsObject:", v9) & 1) == 0)
  {
    CDMOSLoggerForCategory(2);
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      v21 = 136315394;
      v22 = "-[CDMServiceGraph skipNode:basedOnNode:withCondition:]";
      v23 = 2112;
      v24 = v9;
      v18 = "%s [WARN]: Node is not found in graph:%@";
      goto LABEL_14;
    }
LABEL_16:

    goto LABEL_17;
  }
  if (v8 == v9)
  {
    CDMOSLoggerForCategory(2);
    v17 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      goto LABEL_16;
    v21 = 136315138;
    v22 = "-[CDMServiceGraph skipNode:basedOnNode:withCondition:]";
    v18 = "%s [WARN]: Same node provided as base node, ignored";
    v19 = v17;
    v20 = 12;
    goto LABEL_15;
  }
  objc_msgSend(v9, "getNodeName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "getNodeName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](self->_skipNodes, "objectForKey:", v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v13)
  {
    v14 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_skipNodes, "setObject:forKeyedSubscript:", v14, v11);

  }
  v15 = _Block_copy(v10);
  -[NSMutableDictionary objectForKeyedSubscript:](self->_skipNodes, "objectForKeyedSubscript:", v11);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setObject:forKeyedSubscript:", v15, v12);

LABEL_17:
}

- (id)getSkippedNodes
{
  return (id)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithDictionary:", self->_skipNodes);
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
  objc_storeStrong((id *)&self->_error, a3);
}

- (CDMDataDispatcherContext)cdmDataDispatcherContext
{
  return self->_cdmDataDispatcherContext;
}

- (void)setCdmDataDispatcherContext:(id)a3
{
  objc_storeStrong((id *)&self->_cdmDataDispatcherContext, a3);
}

- (NSMutableArray)serviceMetrics
{
  return (NSMutableArray *)objc_getProperty(self, a2, 112, 1);
}

- (void)setServiceMetrics:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 112);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceMetrics, 0);
  objc_storeStrong((id *)&self->_cdmDataDispatcherContext, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_skipNodes, 0);
  objc_storeStrong((id *)&self->_aneLock, 0);
  objc_storeStrong((id *)&self->_endNode, 0);
  objc_storeStrong((id *)&self->_handlerId, 0);
  objc_storeStrong((id *)&self->_language, 0);
  objc_storeStrong(&self->_graphInput, 0);
  objc_storeStrong(&self->_graphOutput, 0);
  objc_storeStrong((id *)&self->_graphServiceMap, 0);
  objc_storeStrong((id *)&self->_serviceMap, 0);
  objc_storeStrong((id *)&self->_nodesWithName, 0);
  objc_storeStrong((id *)&self->_nodes, 0);
}

void __74__CDMServiceGraph_addNodeWithName_bindService_aneEnabled_requestId_block___block_invoke(uint64_t a1, void *a2)
{
  id *v3;
  id WeakRetained;
  uint64_t v5;
  id v6;
  id v7;
  id location;

  objc_initWeak(&location, a2);
  v3 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "lock");

  v5 = *(_QWORD *)(a1 + 32);
  v6 = objc_loadWeakRetained(&location);
  (*(void (**)(uint64_t, id))(v5 + 16))(v5, v6);

  v7 = objc_loadWeakRetained(v3);
  objc_msgSend(v7, "unlock");

  objc_destroyWeak(&location);
}

void __74__CDMServiceGraph_addNodeWithName_bindService_aneEnabled_requestId_block___block_invoke_2(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  id v5;

  v5 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
    objc_msgSend(WeakRetained, "failedWithError:", v5);

}

void __74__CDMServiceGraph_addNodeWithName_bindService_aneEnabled_requestId_block___block_invoke_4(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  id v5;

  v5 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
    objc_msgSend(WeakRetained, "failedWithError:", v5);

}

uint64_t __27__CDMServiceGraph_topoSort__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (v7)
  {
    objc_msgSend(v7, "getNodeName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "intValue");

    if (v12 == 1)
    {
LABEL_16:
      v22 = 0;
    }
    else
    {
      objc_msgSend(v9, "objectForKeyedSubscript:", v10);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "intValue");

      if (v14 != 2)
      {
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 1);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setObject:forKeyedSubscript:", v15, v10);

        v26 = 0u;
        v27 = 0u;
        v24 = 0u;
        v25 = 0u;
        objc_msgSend(v7, "dependencies", 0);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
        if (v17)
        {
          v18 = v17;
          v19 = *(_QWORD *)v25;
          while (2)
          {
            v20 = 0;
            do
            {
              if (*(_QWORD *)v25 != v19)
                objc_enumerationMutation(v16);
              if (!(*(unsigned int (**)(void))(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) + 16))())
              {

                goto LABEL_16;
              }
              ++v20;
            }
            while (v18 != v20);
            v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
            if (v18)
              continue;
            break;
          }
        }

        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 2);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setObject:forKeyedSubscript:", v21, v10);

        objc_msgSend(v8, "addObject:", v7);
      }
      v22 = 1;
    }

  }
  else
  {
    v22 = 0;
  }

  return v22;
}

uint64_t __37__CDMServiceGraph_buildGraphInternal__block_invoke_264(_QWORD *a1)
{
  NSObject *v2;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  CDMOSLoggerForCategory(2);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    v4 = 136315138;
    v5 = "-[CDMServiceGraph buildGraphInternal]_block_invoke";
    _os_log_debug_impl(&dword_21A2A0000, v2, OS_LOG_TYPE_DEBUG, "%s CDMServiceGraph is attempting to emit service metrics log.", (uint8_t *)&v4, 0xCu);
  }

  return +[CDMServiceGraph dispatchServiceGraphHandleMetricsLogging:requestId:dataDispatcherContext:](CDMServiceGraph, "dispatchServiceGraphHandleMetricsLogging:requestId:dataDispatcherContext:", a1[4], a1[5], a1[6]);
}

+ (id)requiredDAGServices
{
  +[NotImplementedException raise:format:](NotImplementedException, "raise:format:", CFSTR("NotImplementedException"), CFSTR("requiredDAGServices need to be implemented"));
  return 0;
}

+ (id)requiredCDMGraphServices
{
  return objc_alloc_init(MEMORY[0x24BDBCF20]);
}

+ (BOOL)requiresAssets
{
  return 0;
}

+ (int)getCdmRequesterWithConnectionId:(id)a3
{
  id v3;
  void *v4;
  int v5;

  v3 = a3;
  v4 = v3;
  if (v3)
  {
    if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ORCHESTRATOR")) & 1) != 0)
    {
      v5 = 1;
    }
    else if ((objc_msgSend(v4, "isEqualToString:", CFSTR("CURARE")) & 1) != 0)
    {
      v5 = 2;
    }
    else if (objc_msgSend(v4, "isEqualToString:", CFSTR("LIGHTHOUSE")))
    {
      v5 = 3;
    }
    else
    {
      v5 = 0;
    }
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (BOOL)shouldSkipNode:(id)a3 service:(id)a4
{
  id v5;
  id v6;
  BOOL v7;

  v5 = a3;
  v6 = a4;
  v7 = v6 && (!objc_msgSend((id)objc_opt_class(), "isEnabled") || objc_msgSend(v6, "serviceState") == 4);

  return v7;
}

+ (int)getNLXSchemaCDMServiceGraphName
{
  return 0;
}

+ (void)dispatchServiceGraphRequestLogging:(id)a3 dataDispatcherContext:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  id v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  NSObject *v16;
  objc_class *v17;
  void *v18;
  _QWORD v19[4];
  NSObject *v20;
  id v21;
  id v22;
  _QWORD block[8];
  _QWORD v24[5];
  id v25;
  uint8_t v26[4];
  const char *v27;
  __int16 v28;
  void *v29;
  __int128 buf;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  id v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "loggingRequestID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  CDMOSLoggerForCategory(2);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    LODWORD(buf) = 136315138;
    *(_QWORD *)((char *)&buf + 4) = "+[CDMServiceGraph dispatchServiceGraphRequestLogging:dataDispatcherContext:]";
    _os_log_debug_impl(&dword_21A2A0000, v9, OS_LOG_TYPE_DEBUG, "%s CDMDataDispatcher is about to dispatch CDM Request data.", (uint8_t *)&buf, 0xCu);
  }

  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v31 = 0x3032000000;
  v32 = __Block_byref_object_copy__304;
  v33 = __Block_byref_object_dispose__305;
  +[CDMSELFLogUtil createSELFMetadataWithRequestId:](CDMSELFLogUtil, "createSELFMetadataWithRequestId:", v8);
  v34 = (id)objc_claimAutoreleasedReturnValue();
  v24[0] = 0;
  v24[1] = v24;
  v24[2] = 0x3032000000;
  v24[3] = __Block_byref_object_copy__304;
  v24[4] = __Block_byref_object_dispose__305;
  v10 = v7;
  v25 = v10;
  v11 = mach_absolute_time();
  +[CDMDataDispatcherCompletionQueue getDataDispatcherCompletionQueue](CDMDataDispatcherCompletionQueue, "getDataDispatcherCompletionQueue");
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = MEMORY[0x24BDAC760];
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __76__CDMServiceGraph_dispatchServiceGraphRequestLogging_dataDispatcherContext___block_invoke;
  block[3] = &unk_24DCAC028;
  block[6] = v11;
  block[7] = a1;
  block[4] = &buf;
  block[5] = v24;
  dispatch_async(v12, block);

  objc_msgSend(a1, "requestFeatureStoreStreamId");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v12) = v14 == 0;

  if ((_DWORD)v12)
  {
    CDMOSLoggerForCategory(2);
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      v17 = (objc_class *)objc_opt_class();
      NSStringFromClass(v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v26 = 136315394;
      v27 = "+[CDMServiceGraph dispatchServiceGraphRequestLogging:dataDispatcherContext:]";
      v28 = 2112;
      v29 = v18;
      _os_log_debug_impl(&dword_21A2A0000, v16, OS_LOG_TYPE_DEBUG, "%s Graph: %@ has not adopted base featurestore request insertion. Skipping", v26, 0x16u);

    }
  }
  else
  {
    +[CDMDataDispatcherCompletionQueue getDataDispatcherCompletionQueue](CDMDataDispatcherCompletionQueue, "getDataDispatcherCompletionQueue");
    v15 = objc_claimAutoreleasedReturnValue();
    v19[0] = v13;
    v19[1] = 3221225472;
    v19[2] = __76__CDMServiceGraph_dispatchServiceGraphRequestLogging_dataDispatcherContext___block_invoke_311;
    v19[3] = &unk_24DCAC050;
    v22 = a1;
    v20 = v6;
    v21 = v8;
    dispatch_async(v15, v19);

    v16 = v20;
  }

  _Block_object_dispose(v24, 8);
  _Block_object_dispose(&buf, 8);

}

+ (void)dispatchServiceGraphResponseLogging:(id)a3 requestId:(id)a4 dataDispatcherContext:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  uint64_t v13;
  NSObject *v14;
  uint64_t v15;
  void *v16;
  NSObject *v17;
  NSObject *v18;
  objc_class *v19;
  void *v20;
  _QWORD v21[4];
  NSObject *v22;
  id v23;
  id v24;
  _QWORD block[7];
  _QWORD v26[5];
  id v27;
  uint8_t v28[4];
  const char *v29;
  __int16 v30;
  void *v31;
  __int128 buf;
  uint64_t v33;
  uint64_t (*v34)(uint64_t, uint64_t);
  void (*v35)(uint64_t);
  id v36;
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  CDMOSLoggerForCategory(2);
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    LODWORD(buf) = 136315138;
    *(_QWORD *)((char *)&buf + 4) = "+[CDMServiceGraph dispatchServiceGraphResponseLogging:requestId:dataDispatcherContext:]";
    _os_log_debug_impl(&dword_21A2A0000, v11, OS_LOG_TYPE_DEBUG, "%s CDMDataDispatcher is about to dispatch CDM Response data.", (uint8_t *)&buf, 0xCu);
  }

  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v33 = 0x3032000000;
  v34 = __Block_byref_object_copy__304;
  v35 = __Block_byref_object_dispose__305;
  +[CDMSELFLogUtil createSELFMetadataWithRequestId:](CDMSELFLogUtil, "createSELFMetadataWithRequestId:", v9);
  v36 = (id)objc_claimAutoreleasedReturnValue();
  v26[0] = 0;
  v26[1] = v26;
  v26[2] = 0x3032000000;
  v26[3] = __Block_byref_object_copy__304;
  v26[4] = __Block_byref_object_dispose__305;
  v12 = v10;
  v27 = v12;
  v13 = mach_absolute_time();
  +[CDMDataDispatcherCompletionQueue getDataDispatcherCompletionQueue](CDMDataDispatcherCompletionQueue, "getDataDispatcherCompletionQueue");
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = MEMORY[0x24BDAC760];
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __87__CDMServiceGraph_dispatchServiceGraphResponseLogging_requestId_dataDispatcherContext___block_invoke;
  block[3] = &unk_24DCAC078;
  block[4] = &buf;
  block[5] = v26;
  block[6] = v13;
  dispatch_async(v14, block);

  objc_msgSend(a1, "responseFeatureStoreStreamId");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v14) = v16 == 0;

  if ((_DWORD)v14)
  {
    CDMOSLoggerForCategory(2);
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      v19 = (objc_class *)objc_opt_class();
      NSStringFromClass(v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v28 = 136315394;
      v29 = "+[CDMServiceGraph dispatchServiceGraphResponseLogging:requestId:dataDispatcherContext:]";
      v30 = 2112;
      v31 = v20;
      _os_log_debug_impl(&dword_21A2A0000, v18, OS_LOG_TYPE_DEBUG, "%s Graph: %@ has not adopted base featurestore response insertion. Skipping", v28, 0x16u);

    }
  }
  else
  {
    +[CDMDataDispatcherCompletionQueue getDataDispatcherCompletionQueue](CDMDataDispatcherCompletionQueue, "getDataDispatcherCompletionQueue");
    v17 = objc_claimAutoreleasedReturnValue();
    v21[0] = v15;
    v21[1] = 3221225472;
    v21[2] = __87__CDMServiceGraph_dispatchServiceGraphResponseLogging_requestId_dataDispatcherContext___block_invoke_315;
    v21[3] = &unk_24DCAC050;
    v24 = a1;
    v22 = v8;
    v23 = v9;
    dispatch_async(v17, v21);

    v18 = v22;
  }

  _Block_object_dispose(v26, 8);
  _Block_object_dispose(&buf, 8);

}

+ (void)dispatchServiceGraphHandleMetricsLogging:(id)a3 requestId:(id)a4 dataDispatcherContext:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  _QWORD block[4];
  id v14;
  _QWORD *v15;
  _QWORD *v16;
  _QWORD v17[5];
  id v18;
  _QWORD v19[5];
  id v20;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v19[0] = 0;
  v19[1] = v19;
  v19[2] = 0x3032000000;
  v19[3] = __Block_byref_object_copy__304;
  v19[4] = __Block_byref_object_dispose__305;
  +[CDMSELFLogUtil createSELFMetadataWithRequestId:](CDMSELFLogUtil, "createSELFMetadataWithRequestId:", v8);
  v20 = (id)objc_claimAutoreleasedReturnValue();
  v17[0] = 0;
  v17[1] = v17;
  v17[2] = 0x3032000000;
  v17[3] = __Block_byref_object_copy__304;
  v17[4] = __Block_byref_object_dispose__305;
  v10 = v9;
  v18 = v10;
  +[CDMDataDispatcherCompletionQueue getDataDispatcherCompletionQueue](CDMDataDispatcherCompletionQueue, "getDataDispatcherCompletionQueue");
  v11 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __92__CDMServiceGraph_dispatchServiceGraphHandleMetricsLogging_requestId_dataDispatcherContext___block_invoke;
  block[3] = &unk_24DCAC0A0;
  v14 = v7;
  v15 = v19;
  v16 = v17;
  v12 = v7;
  dispatch_async(v11, block);

  _Block_object_dispose(v17, 8);
  _Block_object_dispose(v19, 8);

}

+ (id)requestFeatureStoreStreamId
{
  return 0;
}

+ (id)serializeFeatureStoreWithRequestCmd:(id)a3
{
  return 0;
}

+ (id)responseFeatureStoreStreamId
{
  return 0;
}

+ (id)serializeFeatureStoreWithResponseCmd:(id)a3
{
  return 0;
}

+ (id)getUsageForAssetSetName:(int64_t)a3 withLocale:(id)a4
{
  +[NotImplementedException raise:format:](NotImplementedException, "raise:format:", CFSTR("NotImplementedException"), CFSTR("getUsageForAssetSetName needs to be implemented"));
  return 0;
}

void __92__CDMServiceGraph_dispatchServiceGraphHandleMetricsLogging_requestId_dataDispatcherContext___block_invoke(uint64_t a1)
{
  os_signpost_id_t v2;
  NSObject *v3;
  NSObject *v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  id v11;
  id v12;
  NSObject *v13;
  NSObject *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint8_t buf[8];
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v2 = os_signpost_id_generate((os_log_t)CDMLogContext);
  v3 = (id)CDMLogContext;
  v4 = v3;
  if (v2 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v3))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_21A2A0000, v4, OS_SIGNPOST_INTERVAL_BEGIN, v2, "CDMDataDispatcher-SELF", "dispatchCdmServiceHandleMetricsData", buf, 2u);
  }

  v5 = objc_alloc_init(MEMORY[0x24BE95420]);
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v6 = *(id *)(a1 + 32);
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(v5, "addHandleMetrics:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i), (_QWORD)v15);
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
    }
    while (v8);
  }

  v11 = objc_alloc_init(MEMORY[0x24BE95448]);
  objc_msgSend(v11, "setCdmServiceHandleMetricsReported:", v5);
  objc_msgSend(v11, "setEventMetadata:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
  v12 = objc_alloc_init(MEMORY[0x24BE9E318]);
  objc_msgSend(v12, "setMainEvent:", v11);
  +[CDMSELFLogUtil emitEventsFromContainer:mainEventLogMessage:dataDispatcherContext:](CDMSELFLogUtil, "emitEventsFromContainer:mainEventLogMessage:dataDispatcherContext:", v12, CFSTR("SELF CDMServiceHandleMetricsReported event emitted"), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
  v13 = (id)CDMLogContext;
  v14 = v13;
  if (v2 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_21A2A0000, v14, OS_SIGNPOST_INTERVAL_END, v2, "CDMDataDispatcher-SELF", ", buf, 2u);
  }

}

void __87__CDMServiceGraph_dispatchServiceGraphResponseLogging_requestId_dataDispatcherContext___block_invoke(_QWORD *a1)
{
  os_signpost_id_t v2;
  NSObject *v3;
  NSObject *v4;
  NSObject *v5;
  NSObject *v6;
  uint8_t v7[16];
  uint8_t buf[16];

  v2 = os_signpost_id_generate((os_log_t)CDMLogContext);
  v3 = (id)CDMLogContext;
  v4 = v3;
  if (v2 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v3))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_21A2A0000, v4, OS_SIGNPOST_INTERVAL_BEGIN, v2, "CDMDataDispatcher-SELF", "dispatchCdmResponseData", buf, 2u);
  }

  +[CDMSELFLogUtil cdmEnded:metadata:logMessage:machAbsoluteTime:dataDispatcherContext:](CDMSELFLogUtil, "cdmEnded:metadata:logMessage:machAbsoluteTime:dataDispatcherContext:", 0, *(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 40), CFSTR("SELF CDM Request ended message emitted"), a1[6], *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 40));
  v5 = (id)CDMLogContext;
  v6 = v5;
  if (v2 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    *(_WORD *)v7 = 0;
    _os_signpost_emit_with_name_impl(&dword_21A2A0000, v6, OS_SIGNPOST_INTERVAL_END, v2, "CDMDataDispatcher-SELF", ", v7, 2u);
  }

}

void __87__CDMServiceGraph_dispatchServiceGraphResponseLogging_requestId_dataDispatcherContext___block_invoke_315(uint64_t a1)
{
  os_signpost_id_t v2;
  NSObject *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  uint8_t v10[16];
  uint8_t buf[16];

  v2 = os_signpost_id_generate((os_log_t)CDMLogContext);
  v3 = (id)CDMLogContext;
  v4 = v3;
  if (v2 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v3))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_21A2A0000, v4, OS_SIGNPOST_INTERVAL_BEGIN, v2, "CDMDataDispatcher-FS", "insertResponseToFeatureStore", buf, 2u);
  }

  objc_msgSend(*(id *)(a1 + 48), "serializeFeatureStoreWithResponseCmd:", *(_QWORD *)(a1 + 32));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "idA");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "responseFeatureStoreStreamId");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[CDMFeatureStoreUtils insertJsonStringToFeatureStore:interactionId:streamId:](CDMFeatureStoreUtils, "insertJsonStringToFeatureStore:interactionId:streamId:", v5, v6, v7);

  v8 = (id)CDMLogContext;
  v9 = v8;
  if (v2 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    *(_WORD *)v10 = 0;
    _os_signpost_emit_with_name_impl(&dword_21A2A0000, v9, OS_SIGNPOST_INTERVAL_END, v2, "CDMDataDispatcher-FS", ", v10, 2u);
  }

}

void __76__CDMServiceGraph_dispatchServiceGraphRequestLogging_dataDispatcherContext___block_invoke(uint64_t a1)
{
  os_signpost_id_t v2;
  NSObject *v3;
  NSObject *v4;
  NSObject *v5;
  NSObject *v6;
  uint8_t v7[16];
  uint8_t buf[16];

  v2 = os_signpost_id_generate((os_log_t)CDMLogContext);
  v3 = (id)CDMLogContext;
  v4 = v3;
  if (v2 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v3))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_21A2A0000, v4, OS_SIGNPOST_INTERVAL_BEGIN, v2, "CDMDataDispatcher-SELF", "dispatchCdmRequestData", buf, 2u);
  }

  +[CDMSELFLogUtil cdmStarted:metadata:logMessage:machAbsoluteTime:currentServiceGraph:dataDispatcherContext:](CDMSELFLogUtil, "cdmStarted:metadata:logMessage:machAbsoluteTime:currentServiceGraph:dataDispatcherContext:", 0, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), CFSTR("SELF CDM started message emitted from service graph"), *(_QWORD *)(a1 + 48), objc_msgSend(*(id *)(a1 + 56), "getNLXSchemaCDMServiceGraphName"), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
  v5 = (id)CDMLogContext;
  v6 = v5;
  if (v2 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    *(_WORD *)v7 = 0;
    _os_signpost_emit_with_name_impl(&dword_21A2A0000, v6, OS_SIGNPOST_INTERVAL_END, v2, "CDMDataDispatcher-SELF", ", v7, 2u);
  }

}

void __76__CDMServiceGraph_dispatchServiceGraphRequestLogging_dataDispatcherContext___block_invoke_311(uint64_t a1)
{
  os_signpost_id_t v2;
  NSObject *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  uint8_t v10[16];
  uint8_t buf[16];

  v2 = os_signpost_id_generate((os_log_t)CDMLogContext);
  v3 = (id)CDMLogContext;
  v4 = v3;
  if (v2 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v3))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_21A2A0000, v4, OS_SIGNPOST_INTERVAL_BEGIN, v2, "CDMDataDispatcher-FS", "insertRequestToFeatureStore", buf, 2u);
  }

  objc_msgSend(*(id *)(a1 + 48), "serializeFeatureStoreWithRequestCmd:", *(_QWORD *)(a1 + 32));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "idA");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "requestFeatureStoreStreamId");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[CDMFeatureStoreUtils insertJsonStringToFeatureStore:interactionId:streamId:](CDMFeatureStoreUtils, "insertJsonStringToFeatureStore:interactionId:streamId:", v5, v6, v7);

  v8 = (id)CDMLogContext;
  v9 = v8;
  if (v2 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    *(_WORD *)v10 = 0;
    _os_signpost_emit_with_name_impl(&dword_21A2A0000, v9, OS_SIGNPOST_INTERVAL_END, v2, "CDMDataDispatcher-FS", ", v10, 2u);
  }

}

@end
