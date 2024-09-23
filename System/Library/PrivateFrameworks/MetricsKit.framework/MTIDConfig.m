@implementation MTIDConfig

- (MTIDConfig)initWithDictionary:(id)a3
{
  id v4;
  MTIDConfig *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  MTIDScheme *v20;
  void *v21;
  MTIDScheme *v22;
  void *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t i;
  uint64_t v29;
  uint64_t v30;
  void *v31;
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
  void *v42;
  void *v43;
  MTIDScheme *v44;
  void *v45;
  MTIDScheme *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  MTIDScheme *v60;
  void *v61;
  MTIDScheme *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t j;
  uint64_t v73;
  void *v74;
  void *v75;
  void *v76;
  uint64_t v77;
  void *v78;
  void *v80;
  id v81;
  uint64_t v82;
  void *v83;
  void *v84;
  uint64_t v85;
  void *v86;
  void *v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  objc_super v100;
  _BYTE v101[128];
  _BYTE v102[128];
  _BYTE v103[128];
  uint64_t v104;

  v104 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v100.receiver = self;
  v100.super_class = (Class)MTIDConfig;
  v5 = -[MTIDConfig init](&v100, sel_init);
  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {

      v4 = (id)MEMORY[0x24BDBD1B8];
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("performanceTopic"));
    v6 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[MTIDConfig setPerformanceTopic:](v5, "setPerformanceTopic:", v6);
    v80 = (void *)v6;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("schemes"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v81 = v4;
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {

      v7 = (void *)MEMORY[0x24BDBD1A8];
    }
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", objc_msgSend(v7, "count"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[MTIDConfig setCache:](v5, "setCache:", v8);

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[MTIDConfig setUserIdNamespacesByTopic:](v5, "setUserIdNamespacesByTopic:", v9);

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[MTIDConfig setClientIdNamespacesByTopic:](v5, "setClientIdNamespacesByTopic:", v10);

    v98 = 0u;
    v99 = 0u;
    v96 = 0u;
    v97 = 0u;
    v11 = v7;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v96, v103, 16);
    v83 = v11;
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v97;
      v82 = *(_QWORD *)v97;
      do
      {
        v15 = 0;
        v85 = v13;
        do
        {
          if (*(_QWORD *)v97 != v14)
            objc_enumerationMutation(v11);
          v16 = *(void **)(*((_QWORD *)&v96 + 1) + 8 * v15);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("namespace"));
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            if (v17)
            {
              -[MTIDConfig cache](v5, "cache");
              v18 = v16;
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              v20 = -[MTIDScheme initWithNamespace:options:]([MTIDScheme alloc], "initWithNamespace:options:", v17, v18);
              v21 = v17;
              v22 = v20;
              v87 = v21;
              objc_msgSend(v19, "setObject:forKeyedSubscript:", v20);

              v86 = v18;
              objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("topics"));
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                -[MTIDScheme setTopics:](v22, "setTopics:", v23);
                v94 = 0u;
                v95 = 0u;
                v92 = 0u;
                v93 = 0u;
                v84 = v23;
                v24 = v23;
                v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v92, v102, 16);
                if (v25)
                {
                  v26 = v25;
                  v27 = *(_QWORD *)v93;
                  do
                  {
                    for (i = 0; i != v26; ++i)
                    {
                      if (*(_QWORD *)v93 != v27)
                        objc_enumerationMutation(v24);
                      v29 = *(_QWORD *)(*((_QWORD *)&v92 + 1) + 8 * i);
                      v30 = -[MTIDScheme idType](v22, "idType");
                      -[MTIDScheme idNamespace](v22, "idNamespace");
                      v31 = (void *)objc_claimAutoreleasedReturnValue();
                      if (v30 == 2)
                        -[MTIDConfig userIdNamespacesByTopic](v5, "userIdNamespacesByTopic");
                      else
                        -[MTIDConfig clientIdNamespacesByTopic](v5, "clientIdNamespacesByTopic");
                      v32 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v32, "setObject:forKeyedSubscript:", v31, v29);

                    }
                    v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v92, v102, 16);
                  }
                  while (v26);
                }

                v14 = v82;
                v11 = v83;
                v23 = v84;
              }
              objc_msgSend(v86, "objectForKeyedSubscript:", CFSTR("default"));
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v33, "BOOLValue"))
              {
                -[MTIDScheme setIsDefault:](v22, "setIsDefault:", 1);
                -[MTIDConfig defaultUserIdNamespace](v5, "defaultUserIdNamespace");
                v34 = (void *)objc_claimAutoreleasedReturnValue();
                if (v34)
                {

LABEL_33:
                  -[MTIDConfig defaultClientIdNamespace](v5, "defaultClientIdNamespace");
                  v35 = (void *)objc_claimAutoreleasedReturnValue();
                  if (v35)
                  {

                  }
                  else if (-[MTIDScheme idType](v22, "idType") == 1)
                  {
                    -[MTIDConfig setDefaultClientIdNamespace:](v5, "setDefaultClientIdNamespace:", v87);
                  }
                }
                else
                {
                  if (-[MTIDScheme idType](v22, "idType") != 2)
                    goto LABEL_33;
                  -[MTIDConfig setDefaultUserIdNamespace:](v5, "setDefaultUserIdNamespace:", v87);
                }
              }

              v13 = v85;
              v17 = v87;
            }

          }
          ++v15;
        }
        while (v15 != v13);
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v96, v103, 16);
      }
      while (v13);
    }

    -[MTIDConfig defaultUserIdNamespace](v5, "defaultUserIdNamespace");
    v36 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v36)
    {
      v37 = (void *)MEMORY[0x24BDD17C8];
      +[MTFrameworkEnvironment sharedEnvironment](MTFrameworkEnvironment, "sharedEnvironment");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "hostProcessBundleIdentifier");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "stringWithFormat:", CFSTR("%@.user"), v39);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      -[MTIDConfig setDefaultUserIdNamespace:](v5, "setDefaultUserIdNamespace:", v40);

      -[MTIDConfig cache](v5, "cache");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      -[MTIDConfig defaultUserIdNamespace](v5, "defaultUserIdNamespace");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "objectForKeyedSubscript:", v42);
      v43 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v43)
      {
        v44 = [MTIDScheme alloc];
        -[MTIDConfig defaultUserIdNamespace](v5, "defaultUserIdNamespace");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        v46 = -[MTIDScheme initWithNamespace:type:](v44, "initWithNamespace:type:", v45, 2);
        -[MTIDConfig cache](v5, "cache");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        -[MTIDConfig defaultUserIdNamespace](v5, "defaultUserIdNamespace");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v47, "setObject:forKeyedSubscript:", v46, v48);

      }
      -[MTIDConfig cache](v5, "cache");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      -[MTIDConfig defaultUserIdNamespace](v5, "defaultUserIdNamespace");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "objectForKeyedSubscript:", v50);
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "setIsDefault:", 1);

    }
    -[MTIDConfig defaultClientIdNamespace](v5, "defaultClientIdNamespace");
    v52 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v52)
    {
      v53 = (void *)MEMORY[0x24BDD17C8];
      +[MTFrameworkEnvironment sharedEnvironment](MTFrameworkEnvironment, "sharedEnvironment");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v54, "hostProcessBundleIdentifier");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "stringWithFormat:", CFSTR("%@.client"), v55);
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      -[MTIDConfig setDefaultClientIdNamespace:](v5, "setDefaultClientIdNamespace:", v56);

      -[MTIDConfig cache](v5, "cache");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      -[MTIDConfig defaultClientIdNamespace](v5, "defaultClientIdNamespace");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v57, "objectForKeyedSubscript:", v58);
      v59 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v59)
      {
        v60 = [MTIDScheme alloc];
        -[MTIDConfig defaultClientIdNamespace](v5, "defaultClientIdNamespace");
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        v62 = -[MTIDScheme initWithNamespace:type:](v60, "initWithNamespace:type:", v61, 1);
        -[MTIDConfig cache](v5, "cache");
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        -[MTIDConfig defaultClientIdNamespace](v5, "defaultClientIdNamespace");
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v63, "setObject:forKeyedSubscript:", v62, v64);

      }
      -[MTIDConfig cache](v5, "cache");
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      -[MTIDConfig defaultClientIdNamespace](v5, "defaultClientIdNamespace");
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v65, "objectForKeyedSubscript:", v66);
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v67, "setIsDefault:", 1);

    }
    v90 = 0u;
    v91 = 0u;
    v88 = 0u;
    v89 = 0u;
    -[MTIDConfig cache](v5, "cache");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    v69 = objc_msgSend(v68, "countByEnumeratingWithState:objects:count:", &v88, v101, 16);
    if (v69)
    {
      v70 = v69;
      v71 = *(_QWORD *)v89;
      do
      {
        for (j = 0; j != v70; ++j)
        {
          if (*(_QWORD *)v89 != v71)
            objc_enumerationMutation(v68);
          v73 = *(_QWORD *)(*((_QWORD *)&v88 + 1) + 8 * j);
          -[MTIDConfig cache](v5, "cache");
          v74 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v74, "objectForKeyedSubscript:", v73);
          v75 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v75, "correlations");
          v76 = (void *)objc_claimAutoreleasedReturnValue();
          v77 = objc_msgSend(v76, "count");

          if (v77)
          {
            objc_msgSend(v75, "correlations");
            v78 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v75, "setCorrelationHash:", -[MTIDConfig calculateCombinedHashForNamespaces:](v5, "calculateCombinedHashForNamespaces:", v78));

          }
        }
        v70 = objc_msgSend(v68, "countByEnumeratingWithState:objects:count:", &v88, v101, 16);
      }
      while (v70);
    }

    v4 = v81;
  }

  return v5;
}

- (NSMutableDictionary)cache
{
  return self->_cache;
}

- (NSMutableDictionary)userIdNamespacesByTopic
{
  return self->_userIdNamespacesByTopic;
}

- (NSMutableDictionary)clientIdNamespacesByTopic
{
  return self->_clientIdNamespacesByTopic;
}

- (NSString)defaultUserIdNamespace
{
  return self->_defaultUserIdNamespace;
}

- (NSString)defaultClientIdNamespace
{
  return self->_defaultClientIdNamespace;
}

- (unint64_t)calculateCombinedHashForNamespaces:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v4);
        v10 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i);
        -[MTIDConfig cache](self, "cache");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "objectForKeyedSubscript:", v10);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v7 ^= objc_msgSend(v12, "hash");

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v6);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)setUserIdNamespacesByTopic:(id)a3
{
  objc_storeStrong((id *)&self->_userIdNamespacesByTopic, a3);
}

- (void)setPerformanceTopic:(id)a3
{
  objc_storeStrong((id *)&self->_performanceTopic, a3);
}

- (void)setDefaultUserIdNamespace:(id)a3
{
  objc_storeStrong((id *)&self->_defaultUserIdNamespace, a3);
}

- (void)setDefaultClientIdNamespace:(id)a3
{
  objc_storeStrong((id *)&self->_defaultClientIdNamespace, a3);
}

- (void)setClientIdNamespacesByTopic:(id)a3
{
  objc_storeStrong((id *)&self->_clientIdNamespacesByTopic, a3);
}

- (void)setCache:(id)a3
{
  objc_storeStrong((id *)&self->_cache, a3);
}

- (id)schemeForNamespace:(id)a3
{
  id v4;
  MTIDConfig *v5;
  void *v6;
  void *v7;
  MTIDScheme *v8;
  MTIDScheme *v9;
  void *v10;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  -[MTIDConfig cache](v5, "cache");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = v7;
    objc_sync_exit(v5);

  }
  else
  {
    v9 = -[MTIDScheme initWithNamespace:options:]([MTIDScheme alloc], "initWithNamespace:options:", v4, 0);
    -[MTIDConfig cache](v5, "cache");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v9, v4);

    objc_sync_exit(v5);
    v8 = v9;
  }

  return v8;
}

- (id)namespaceForTopic:(id)a3 idType:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;

  v6 = a3;
  if (a4 != 2)
  {
    -[MTIDConfig clientIdNamespacesByTopic](self, "clientIdNamespacesByTopic");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8)
    {
      -[MTIDConfig defaultClientIdNamespace](self, "defaultClientIdNamespace");
      v9 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    }
    goto LABEL_5;
  }
  -[MTIDConfig userIdNamespacesByTopic](self, "userIdNamespacesByTopic");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
LABEL_5:
    v9 = v8;
    v8 = v9;
    goto LABEL_7;
  }
  -[MTIDConfig defaultUserIdNamespace](self, "defaultUserIdNamespace");
  v9 = (id)objc_claimAutoreleasedReturnValue();
LABEL_7:
  v10 = v9;

  return v10;
}

- (NSString)performanceTopic
{
  return self->_performanceTopic;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaultClientIdNamespace, 0);
  objc_storeStrong((id *)&self->_defaultUserIdNamespace, 0);
  objc_storeStrong((id *)&self->_clientIdNamespacesByTopic, 0);
  objc_storeStrong((id *)&self->_userIdNamespacesByTopic, 0);
  objc_storeStrong((id *)&self->_cache, 0);
  objc_storeStrong((id *)&self->_performanceTopic, 0);
}

- (id)allKnownSchemes
{
  MTIDConfig *v2;
  void *v3;
  void *v4;

  v2 = self;
  objc_sync_enter(v2);
  -[MTIDConfig cache](v2, "cache");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allValues");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_sync_exit(v2);
  return v4;
}

- (id)dictionaryRepresentation
{
  void *v2;
  void *v3;
  void *v4;
  const __CFString *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x24BDAC8D0];
  v6 = CFSTR("schemes");
  -[MTIDConfig allKnownSchemes](self, "allKnownSchemes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "mt_map:", &__block_literal_global_10);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v3;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

uint64_t __38__MTIDConfig_dictionaryRepresentation__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "dictionaryRepresentation");
}

@end
