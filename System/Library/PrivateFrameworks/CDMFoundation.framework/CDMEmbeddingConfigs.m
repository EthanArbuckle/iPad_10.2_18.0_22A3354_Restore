@implementation CDMEmbeddingConfigs

- (void)setupWithError:(id *)a3
{
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  NSDictionary *v9;
  NSDictionary *embeddingReturnForVersion;
  NSDictionary *v11;
  id v12;
  NSDictionary *v13;
  id v14;
  NSObject *v15;
  NSDictionary *v16;
  NSDictionary *embeddingConfigItems;
  NSDictionary *v18;
  NSDictionary *serviceDependentEmbeddingModelVersions;
  NSDictionary *v20;
  NSDictionary *v21;
  NSDictionary *v22;
  id v23;
  NSDictionary *v24;
  id v25;
  id v26;
  id v27;
  uint8_t buf[4];
  const char *v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  CDMOSLoggerForCategory(0);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    v29 = "-[CDMEmbeddingConfigs setupWithError:]";
    _os_log_debug_impl(&dword_21A2A0000, v5, OS_LOG_TYPE_DEBUG, "%s Setup CDM embedding configs.", buf, 0xCu);
  }

  self->_setupCalled = 1;
  -[NSDictionary objectForKey:](self->_assetPaths, "objectForKey:", CFSTR("com.apple.siri.nl.owl"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "getAssetMetadata");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", CFSTR("EMBEDDING_RETURN_FOR_VERSION"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (NSDictionary *)objc_alloc_init(MEMORY[0x24BDBCE70]);
  embeddingReturnForVersion = self->_embeddingReturnForVersion;
  self->_embeddingReturnForVersion = v9;

  if (v8
    && (v27 = 0,
        +[CDMEmbeddingUtils setStringToJSONDictionaryWithError:stringToConvert:](CDMEmbeddingUtils, "setStringToJSONDictionaryWithError:stringToConvert:", &v27, v8), v11 = (NSDictionary *)objc_claimAutoreleasedReturnValue(), v12 = v27, v13 = self->_embeddingReturnForVersion, self->_embeddingReturnForVersion = v11, v13, v12))
  {
    v14 = objc_retainAutorelease(v12);
    *a3 = v14;
    CDMOSLoggerForCategory(0);
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315138;
      v29 = "-[CDMEmbeddingConfigs setupWithError:]";
      _os_log_debug_impl(&dword_21A2A0000, v15, OS_LOG_TYPE_DEBUG, "%s Failed to save EMBEDDING_RETURN_FOR_VERSION value to dictionary.", buf, 0xCu);
    }

  }
  else
  {
    v16 = (NSDictionary *)objc_alloc_init(MEMORY[0x24BDBCE70]);
    embeddingConfigItems = self->_embeddingConfigItems;
    self->_embeddingConfigItems = v16;

    v18 = (NSDictionary *)objc_alloc_init(MEMORY[0x24BDBCE70]);
    serviceDependentEmbeddingModelVersions = self->_serviceDependentEmbeddingModelVersions;
    self->_serviceDependentEmbeddingModelVersions = v18;

    v26 = 0;
    -[CDMEmbeddingConfigs generateEmbeddingConfigItemsWithError:](self, "generateEmbeddingConfigItemsWithError:", &v26);
    v20 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    v14 = v26;
    v21 = self->_embeddingConfigItems;
    self->_embeddingConfigItems = v20;

    if (v14)
    {
      *a3 = objc_retainAutorelease(v14);
    }
    else
    {
      v25 = 0;
      -[CDMEmbeddingConfigs generateServiceDependentEmbeddingModelVersionsWithError:](self, "generateServiceDependentEmbeddingModelVersionsWithError:", &v25);
      v22 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
      v23 = v25;
      v24 = self->_serviceDependentEmbeddingModelVersions;
      self->_serviceDependentEmbeddingModelVersions = v22;

      if (v23)
        *a3 = objc_retainAutorelease(v23);

    }
  }

}

- (id)generateEmbeddingConfigItemsWithError:(id *)a3
{
  NSObject *v5;
  NSDictionary *assetPaths;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  id v15;
  void *v16;
  NSObject *v17;
  _UNKNOWN **v18;
  void *v19;
  NSObject *v20;
  NSString *clientEmbeddingVersion;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  NSObject *v27;
  NSObject *v29;
  CDMEmbeddingConfigItem *v30;
  NSObject *v31;
  NSString *v32;
  uint64_t v33;
  BOOL v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t i;
  void *v39;
  void *v40;
  void *v41;
  CDMEmbeddingConfigItem *v42;
  void *v43;
  CDMEmbeddingConfigItem *v44;
  void *v45;
  char v46;
  void *v47;
  NSString *v48;
  NSString *stableEmbeddingModelVersion;
  void *v50;
  uint64_t v51;
  void *v52;
  void *v53;
  NSObject *v54;
  uint64_t v55;
  void *v56;
  void *v57;
  void *v58;
  NSObject *v59;
  id v60;
  void *v61;
  void *v62;
  void *v63;
  NSObject *v64;
  void *v66;
  void *v67;
  void *v68;
  NSObject *v69;
  id v70;
  id v71;
  id v72;
  id v73;
  void *v74;
  uint64_t v75;
  CDMEmbeddingConfigItem *obj;
  void *v77;
  uint64_t v78;
  id *v79;
  void *v80;
  id v81;
  uint64_t v82;
  void *v83;
  void *v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  uint64_t v89;
  void *v90;
  uint64_t v91;
  void *v92;
  _BYTE v93[128];
  uint64_t v94;
  void *v95;
  uint64_t v96;
  void *v97;
  uint8_t buf[4];
  const char *v99;
  __int16 v100;
  uint64_t v101;
  __int16 v102;
  uint64_t v103;
  uint64_t v104;
  _QWORD v105[4];

  v105[1] = *MEMORY[0x24BDAC8D0];
  CDMOSLoggerForCategory(0);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    v99 = "-[CDMEmbeddingConfigs generateEmbeddingConfigItemsWithError:]";
    _os_log_debug_impl(&dword_21A2A0000, v5, OS_LOG_TYPE_DEBUG, "%s Generate embedding config item list.", buf, 0xCu);
  }

  assetPaths = self->_assetPaths;
  if (assetPaths)
  {
    -[NSDictionary objectForKey:](assetPaths, "objectForKey:", CFSTR("com.apple.siri.nl.owl"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (!v7 || !objc_msgSend(v7, "getAssetType"))
    {
      v23 = (void *)MEMORY[0x24BDD1540];
      v104 = *MEMORY[0x24BDD0FC8];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Embedding asset is nil"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v105[0] = v24;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v105, &v104, 1);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "errorWithDomain:code:userInfo:", CFSTR("CDMEmbeddingConfigs"), 0, v25);
      *a3 = (id)objc_claimAutoreleasedReturnValue();

      CDMOSLoggerForCategory(0);
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        v60 = *a3;
        *(_DWORD *)buf = 136315394;
        v99 = "-[CDMEmbeddingConfigs generateEmbeddingConfigItemsWithError:]";
        v100 = 2112;
        v101 = (uint64_t)v60;
        _os_log_error_impl(&dword_21A2A0000, v26, OS_LOG_TYPE_ERROR, "%s [ERR]: Error: %@. Return empty map.", buf, 0x16u);
      }

      v22 = objc_alloc_init(MEMORY[0x24BDBCE70]);
      goto LABEL_55;
    }
    v79 = a3;
    objc_msgSend(v8, "getAssetVersion");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "getAssetPath");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "getAssetMetadata");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKey:", CFSTR("MULTI_EMBEDDING_MODEL_IDS"));
    v12 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKey:", CFSTR("STABLE_EMBEDDING_MODEL_ID"));
    v13 = objc_claimAutoreleasedReturnValue();
    CDMOSLoggerForCategory(0);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315650;
      v99 = "-[CDMEmbeddingConfigs generateEmbeddingConfigItemsWithError:]";
      v100 = 2112;
      v101 = v12;
      v102 = 2112;
      v103 = v13;
      _os_log_impl(&dword_21A2A0000, v14, OS_LOG_TYPE_INFO, "%s Get embedding model ids: %@, stable embedding model id: %@", buf, 0x20u);
    }

    v15 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    v16 = v15;
    if (v12 && v13)
    {
      v83 = v10;
      CDMOSLoggerForCategory(0);
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        v99 = "-[CDMEmbeddingConfigs generateEmbeddingConfigItemsWithError:]";
        _os_log_impl(&dword_21A2A0000, v17, OS_LOG_TYPE_INFO, "%s In multi embedding model mode.", buf, 0xCu);
      }

      v18 = &off_24DCA0000;
      +[CDMEmbeddingConfigs generateEmbeddingModelIdList:](CDMEmbeddingConfigs, "generateEmbeddingModelIdList:", v12);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v77 = v19;
      if (self->_clientEmbeddingVersion)
      {
        CDMOSLoggerForCategory(0);
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
        {
          clientEmbeddingVersion = self->_clientEmbeddingVersion;
          *(_DWORD *)buf = 136315394;
          v99 = "-[CDMEmbeddingConfigs generateEmbeddingConfigItemsWithError:]";
          v100 = 2112;
          v101 = (uint64_t)clientEmbeddingVersion;
          _os_log_impl(&dword_21A2A0000, v20, OS_LOG_TYPE_INFO, "%s Client Embedding version is not nil and the value is %@.", buf, 0x16u);
        }

        -[CDMEmbeddingConfigs validateClientEmbeddingVersion:embeddingAssetVersion:embeddingModelIdList:multipleModels:withError:](self, "validateClientEmbeddingVersion:embeddingAssetVersion:embeddingModelIdList:multipleModels:withError:", self->_clientEmbeddingVersion, v9, v19, 1, v79);
        v18 = &off_24DCA0000;
        if (*v79)
        {
          v22 = objc_alloc_init(MEMORY[0x24BDBCE70]);
          goto LABEL_52;
        }
      }
      v82 = v13;
      if ((objc_msgSend(v19, "containsObject:", v13) & 1) == 0)
      {
        v55 = v12;
        v56 = (void *)MEMORY[0x24BDD1540];
        v96 = *MEMORY[0x24BDD0FC8];
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Can't locate stable embedding id: %@ in embedding model id list: %@."), self->_stableEmbeddingModelVersion, v19);
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        v97 = v57;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v97, &v96, 1);
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v56, "errorWithDomain:code:userInfo:", CFSTR("CDMEmbeddingConfigs"), 1, v58);
        *v79 = (id)objc_claimAutoreleasedReturnValue();

        CDMOSLoggerForCategory(0);
        v59 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR))
        {
          v71 = *v79;
          *(_DWORD *)buf = 136315394;
          v99 = "-[CDMEmbeddingConfigs generateEmbeddingConfigItemsWithError:]";
          v100 = 2112;
          v101 = (uint64_t)v71;
          _os_log_error_impl(&dword_21A2A0000, v59, OS_LOG_TYPE_ERROR, "%s [ERR]: Error: %@. Return empty map.", buf, 0x16u);
        }

        v22 = objc_alloc_init(MEMORY[0x24BDBCE70]);
        v12 = v55;
        goto LABEL_51;
      }
      v75 = v12;
      v33 = objc_msgSend(v18[483], "getMaxEmbeddingConcurrency");
      v34 = objc_msgSend(v19, "count") == (int)v33;
      v35 = v19;
      if (!v34)
      {
        v61 = (void *)MEMORY[0x24BDD1540];
        v94 = *MEMORY[0x24BDD0FC8];
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("The count of embedding model ids in the configs: %lu doesn't match with max embedding concurrency count: %d."), objc_msgSend(v35, "count"), v33);
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        v95 = v62;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v95, &v94, 1);
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v61, "errorWithDomain:code:userInfo:", CFSTR("CDMEmbeddingConfigs"), 1, v63);
        *v79 = (id)objc_claimAutoreleasedReturnValue();

        CDMOSLoggerForCategory(0);
        v64 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v64, OS_LOG_TYPE_ERROR))
        {
          v72 = *v79;
          *(_DWORD *)buf = 136315394;
          v99 = "-[CDMEmbeddingConfigs generateEmbeddingConfigItemsWithError:]";
          v100 = 2112;
          v101 = (uint64_t)v72;
          _os_log_error_impl(&dword_21A2A0000, v64, OS_LOG_TYPE_ERROR, "%s [ERR]: Error: %@. Return empty map.", buf, 0x16u);
        }

        v22 = objc_alloc_init(MEMORY[0x24BDBCE70]);
        v12 = v75;
LABEL_51:
        v13 = v82;
LABEL_52:
        v10 = v83;
LABEL_53:

        goto LABEL_54;
      }
      v80 = v16;
      v74 = v11;
      v87 = 0u;
      v88 = 0u;
      v85 = 0u;
      v86 = 0u;
      v30 = v19;
      v36 = -[CDMEmbeddingConfigItem countByEnumeratingWithState:objects:count:](v30, "countByEnumeratingWithState:objects:count:", &v85, v93, 16);
      if (v36)
      {
        v37 = v36;
        v78 = *(_QWORD *)v86;
        obj = v30;
        while (2)
        {
          for (i = 0; i != v37; ++i)
          {
            if (*(_QWORD *)v86 != v78)
              objc_enumerationMutation(obj);
            v39 = *(void **)(*((_QWORD *)&v85 + 1) + 8 * i);
            v40 = v9;
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@.%@"), v9, v39);
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            v42 = [CDMEmbeddingConfigItem alloc];
            objc_msgSend(v83, "stringByAppendingPathComponent:", v39);
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            v44 = -[CDMEmbeddingConfigItem initWithEmbeddingModelPath:isStableEmbeddingModel:](v42, "initWithEmbeddingModelPath:isStableEmbeddingModel:", v43, objc_msgSend(v39, "isEqualToString:", v82));

            -[CDMEmbeddingConfigItem embeddingModelVersion](v44, "embeddingModelVersion");
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            v46 = objc_msgSend(v45, "isEqualToString:", v41);

            if ((v46 & 1) == 0)
            {
              v66 = (void *)MEMORY[0x24BDD1540];
              v91 = *MEMORY[0x24BDD0FC8];
              objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Embedding model version of embedding config for embedding model id: %@ doesn't match with expected embedding model version: %@."), v39, v41);
              v67 = (void *)objc_claimAutoreleasedReturnValue();
              v92 = v67;
              objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v92, &v91, 1);
              v68 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v66, "errorWithDomain:code:userInfo:", CFSTR("CDMEmbeddingConfigs"), 1, v68);
              *v79 = (id)objc_claimAutoreleasedReturnValue();

              CDMOSLoggerForCategory(0);
              v69 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v69, OS_LOG_TYPE_ERROR))
              {
                v73 = *v79;
                *(_DWORD *)buf = 136315394;
                v99 = "-[CDMEmbeddingConfigs generateEmbeddingConfigItemsWithError:]";
                v100 = 2112;
                v101 = (uint64_t)v73;
                _os_log_error_impl(&dword_21A2A0000, v69, OS_LOG_TYPE_ERROR, "%s [ERR]: Error: %@. Return empty map.", buf, 0x16u);
              }

              v22 = objc_alloc_init(MEMORY[0x24BDBCE70]);
              v9 = v40;
              v13 = v82;
              v10 = v83;
              v11 = v74;
              v12 = v75;
              v16 = v80;
              goto LABEL_53;
            }
            -[CDMEmbeddingConfigItem embeddingModelVersion](v44, "embeddingModelVersion");
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v80, "setObject:forKeyedSubscript:", v44, v47);

            v9 = v40;
          }
          v30 = obj;
          v37 = -[CDMEmbeddingConfigItem countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v85, v93, 16);
          if (v37)
            continue;
          break;
        }
      }

      v13 = v82;
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@.%@"), v9, v82);
      v48 = (NSString *)objc_claimAutoreleasedReturnValue();
      stableEmbeddingModelVersion = self->_stableEmbeddingModelVersion;
      self->_stableEmbeddingModelVersion = v48;

      v10 = v83;
      v11 = v74;
      v12 = v75;
      v16 = v80;
    }
    else
    {
      if (v12 | v13)
      {
        v84 = v10;
        v81 = v15;
        v50 = (void *)MEMORY[0x24BDD1540];
        v89 = *MEMORY[0x24BDD0FC8];
        v51 = v12;
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Invalid embedding configs with embedding model ids: %@, stable embedding model id: %@. CDM is confusing whether current is single embedding mode or multi embedding mode."), v12, v13);
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        v90 = v52;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v90, &v89, 1);
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v50, "errorWithDomain:code:userInfo:", CFSTR("CDMEmbeddingConfigs"), 1, v53);
        *v79 = (id)objc_claimAutoreleasedReturnValue();

        CDMOSLoggerForCategory(0);
        v54 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
        {
          v70 = *v79;
          *(_DWORD *)buf = 136315394;
          v99 = "-[CDMEmbeddingConfigs generateEmbeddingConfigItemsWithError:]";
          v100 = 2112;
          v101 = (uint64_t)v70;
          _os_log_error_impl(&dword_21A2A0000, v54, OS_LOG_TYPE_ERROR, "%s [ERR]: Error: %@. Return empty map.", buf, 0x16u);
        }

        v22 = objc_alloc_init(MEMORY[0x24BDBCE70]);
        v12 = v51;
        v16 = v81;
        v10 = v84;
        goto LABEL_54;
      }
      CDMOSLoggerForCategory(0);
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        v99 = "-[CDMEmbeddingConfigs generateEmbeddingConfigItemsWithError:]";
        _os_log_impl(&dword_21A2A0000, v29, OS_LOG_TYPE_INFO, "%s In single embedding model mode. Skipping version check.", buf, 0xCu);
      }

      objc_storeStrong((id *)&self->_stableEmbeddingModelVersion, v9);
      v30 = -[CDMEmbeddingConfigItem initWithEmbeddingModelPath:isStableEmbeddingModel:]([CDMEmbeddingConfigItem alloc], "initWithEmbeddingModelPath:isStableEmbeddingModel:", v10, 1);
      objc_msgSend(v16, "setObject:forKeyedSubscript:", v30, v9);
    }

    CDMOSLoggerForCategory(0);
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
    {
      v32 = self->_stableEmbeddingModelVersion;
      *(_DWORD *)buf = 136315650;
      v99 = "-[CDMEmbeddingConfigs generateEmbeddingConfigItemsWithError:]";
      v100 = 2112;
      v101 = (uint64_t)v32;
      v102 = 2112;
      v103 = (uint64_t)v16;
      _os_log_impl(&dword_21A2A0000, v31, OS_LOG_TYPE_INFO, "%s Stable embedding asset version: %@. Embedding config items: %@.", buf, 0x20u);
    }

    v22 = v16;
LABEL_54:

LABEL_55:
    return v22;
  }
  CDMOSLoggerForCategory(0);
  v27 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    v99 = "-[CDMEmbeddingConfigs generateEmbeddingConfigItemsWithError:]";
    _os_log_debug_impl(&dword_21A2A0000, v27, OS_LOG_TYPE_DEBUG, "%s Input asset paths is nil. Return empty map.", buf, 0xCu);
  }

  return objc_alloc_init(MEMORY[0x24BDBCE70]);
}

- (id)generateServiceDependentEmbeddingModelVersionsWithError:(id *)a3
{
  NSObject *v5;
  id v6;
  NSDictionary *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  NSObject *v17;
  void *v18;
  NSObject *v19;
  id v20;
  NSObject *v21;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  id v29;
  id *v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint64_t v35;
  void *v36;
  uint8_t buf[4];
  const char *v38;
  __int16 v39;
  id v40;
  __int16 v41;
  const __CFString *v42;
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  CDMOSLoggerForCategory(0);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    v38 = "-[CDMEmbeddingConfigs generateServiceDependentEmbeddingModelVersionsWithError:]";
    _os_log_debug_impl(&dword_21A2A0000, v5, OS_LOG_TYPE_DEBUG, "%s Generate CDM service dependent embedding model version map.", buf, 0xCu);
  }

  if (self->_assetPaths)
  {
    v30 = a3;
    v6 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    v7 = self->_assetPaths;
    v8 = -[NSDictionary countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v31, v43, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v32;
      while (2)
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v32 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
          -[NSDictionary objectForKey:](self->_assetPaths, "objectForKey:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = v13;
          if (v13 && objc_msgSend(v13, "getAssetType"))
          {
            objc_msgSend(v14, "getAssetMetadata");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "objectForKey:", CFSTR("EMBEDDING_VERSION"));
            v16 = objc_claimAutoreleasedReturnValue();

            if (!v16)
            {
              CDMOSLoggerForCategory(0);
              v17 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 136315650;
                v38 = "-[CDMEmbeddingConfigs generateServiceDependentEmbeddingModelVersionsWithError:]";
                v39 = 2112;
                v40 = v14;
                v41 = 2112;
                v42 = CFSTR("EMBEDDING_VERSION");
                _os_log_debug_impl(&dword_21A2A0000, v17, OS_LOG_TYPE_DEBUG, "%s Asset: %@ doesn't have metadata with key: %@. Will use the stable embedding model version.", buf, 0x20u);
              }

              v16 = self->_stableEmbeddingModelVersion;
            }
            -[NSDictionary objectForKey:](self->_embeddingConfigItems, "objectForKey:", v16);
            v18 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v18)
            {
              v23 = (void *)MEMORY[0x24BDD1540];
              v35 = *MEMORY[0x24BDD0FC8];
              v24 = (void *)MEMORY[0x24BDD17C8];
              -[NSDictionary allKeys](self->_embeddingConfigItems, "allKeys");
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v24, "stringWithFormat:", CFSTR("The dependent embedding model version: %@ for uafFactorName: %@ doesn't exist in all available embedding model versions: %@."), v16, v12, v25);
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              v36 = v26;
              objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v36, &v35, 1);
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v23, "errorWithDomain:code:userInfo:", CFSTR("CDMEmbeddingConfigs"), 1, v27);
              *v30 = (id)objc_claimAutoreleasedReturnValue();

              CDMOSLoggerForCategory(0);
              v28 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
              {
                v29 = *v30;
                *(_DWORD *)buf = 136315394;
                v38 = "-[CDMEmbeddingConfigs generateServiceDependentEmbeddingModelVersionsWithError:]";
                v39 = 2112;
                v40 = v29;
                _os_log_error_impl(&dword_21A2A0000, v28, OS_LOG_TYPE_ERROR, "%s [ERR]: Error: %@. Return empty map.", buf, 0x16u);
              }

              v20 = objc_alloc_init(MEMORY[0x24BDBCE70]);
              goto LABEL_30;
            }
            objc_msgSend(v6, "setObject:forKeyedSubscript:", v16, v12);
          }
          else
          {
            CDMOSLoggerForCategory(0);
            v16 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 136315394;
              v38 = "-[CDMEmbeddingConfigs generateServiceDependentEmbeddingModelVersionsWithError:]";
              v39 = 2112;
              v40 = v12;
              _os_log_debug_impl(&dword_21A2A0000, v16, OS_LOG_TYPE_DEBUG, "%s Asset for UAF factor: %@ is nil.", buf, 0x16u);
            }
          }

        }
        v9 = -[NSDictionary countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v31, v43, 16);
        if (v9)
          continue;
        break;
      }
    }

    CDMOSLoggerForCategory(0);
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v38 = "-[CDMEmbeddingConfigs generateServiceDependentEmbeddingModelVersionsWithError:]";
      v39 = 2112;
      v40 = v6;
      _os_log_impl(&dword_21A2A0000, v19, OS_LOG_TYPE_INFO, "%s CDM factor dependent embedding model version map is: %@.", buf, 0x16u);
    }

    v20 = v6;
LABEL_30:

    return v20;
  }
  else
  {
    CDMOSLoggerForCategory(0);
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315138;
      v38 = "-[CDMEmbeddingConfigs generateServiceDependentEmbeddingModelVersionsWithError:]";
      _os_log_debug_impl(&dword_21A2A0000, v21, OS_LOG_TYPE_DEBUG, "%s Input asset paths is nil. Return empty map.", buf, 0xCu);
    }

    return objc_alloc_init(MEMORY[0x24BDBCE70]);
  }
}

- (id)getDependentEmbeddingConfigs
{
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t v20[128];
  uint8_t buf[4];
  const char *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  if (self->_setupCalled)
  {
    v3 = (void *)MEMORY[0x24BDBCF20];
    -[NSDictionary allValues](self->_serviceDependentEmbeddingModelVersions, "allValues");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setWithArray:", v4);
    v5 = objc_claimAutoreleasedReturnValue();

    -[NSObject allObjects](v5, "allObjects");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    CDMOSLoggerForCategory(0);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315394;
      v22 = "-[CDMEmbeddingConfigs getDependentEmbeddingConfigs]";
      v23 = 2112;
      v24 = v6;
      _os_log_debug_impl(&dword_21A2A0000, v7, OS_LOG_TYPE_DEBUG, "%s All embedding versions that has CDM DAG services dependent on: %@.", buf, 0x16u);
    }

    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(v6, "count"));
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v9 = v6;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v17;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v17 != v12)
            objc_enumerationMutation(v9);
          -[NSDictionary objectForKey:](self->_embeddingConfigItems, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v13), (_QWORD)v16);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "addObject:", v14);

          ++v13;
        }
        while (v11 != v13);
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v11);
    }

  }
  else
  {
    CDMOSLoggerForCategory(0);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v22 = "-[CDMEmbeddingConfigs getDependentEmbeddingConfigs]";
      _os_log_error_impl(&dword_21A2A0000, v5, OS_LOG_TYPE_ERROR, "%s [ERR]: The setup method has not been called. Please call setup first.", buf, 0xCu);
    }
    v8 = 0;
  }

  return v8;
}

- (CDMEmbeddingConfigs)initWithAssetPaths:(id)a3 embeddingVersion:(id)a4
{
  id v7;
  id v8;
  NSObject *v9;
  CDMEmbeddingConfigs *v10;
  CDMEmbeddingConfigs *v11;
  objc_super v13;
  uint8_t buf[4];
  const char *v15;
  __int16 v16;
  id v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  CDMOSLoggerForCategory(0);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315650;
    v15 = "-[CDMEmbeddingConfigs initWithAssetPaths:embeddingVersion:]";
    v16 = 2112;
    v17 = v7;
    v18 = 2112;
    v19 = v8;
    _os_log_debug_impl(&dword_21A2A0000, v9, OS_LOG_TYPE_DEBUG, "%s Init CDM embedding configs with asset paths: %@ and embedding version %@.", buf, 0x20u);
  }

  v13.receiver = self;
  v13.super_class = (Class)CDMEmbeddingConfigs;
  v10 = -[CDMEmbeddingConfigs init](&v13, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_assetPaths, a3);
    objc_storeStrong((id *)&v11->_clientEmbeddingVersion, a4);
  }

  return v11;
}

- (id)getEmbeddingVersionDictionary
{
  return self->_embeddingReturnForVersion;
}

- (CDMEmbeddingConfigs)initWithAssetPaths:(id)a3
{
  id v5;
  NSObject *v6;
  CDMEmbeddingConfigs *v7;
  CDMEmbeddingConfigs *v8;
  objc_super v10;
  uint8_t buf[4];
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  CDMOSLoggerForCategory(0);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    v12 = "-[CDMEmbeddingConfigs initWithAssetPaths:]";
    _os_log_debug_impl(&dword_21A2A0000, v6, OS_LOG_TYPE_DEBUG, "%s Init CDM embedding configs.", buf, 0xCu);
  }

  v10.receiver = self;
  v10.super_class = (Class)CDMEmbeddingConfigs;
  v7 = -[CDMEmbeddingConfigs init](&v10, sel_init);
  v8 = v7;
  if (v7)
    objc_storeStrong((id *)&v7->_assetPaths, a3);

  return v8;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("[CDMEmbeddingConfigs] - Stable Embedding Model Version: %@,\n Service Dependent Embedding Model Versions: %@,\n Max Embedding Concurrency: %d,\n Embedding Model Config Items: %@."), self->_stableEmbeddingModelVersion, self->_serviceDependentEmbeddingModelVersions, +[CDMEmbeddingConfigs getMaxEmbeddingConcurrency](CDMEmbeddingConfigs, "getMaxEmbeddingConcurrency"), self->_embeddingConfigItems);
}

- (id)getStableEmbeddingConfig
{
  NSObject *v3;
  void *v4;
  NSObject *v5;
  int v7;
  const char *v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  CDMOSLoggerForCategory(0);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    v7 = 136315138;
    v8 = "-[CDMEmbeddingConfigs getStableEmbeddingConfig]";
    _os_log_debug_impl(&dword_21A2A0000, v3, OS_LOG_TYPE_DEBUG, "%s Get stable embedding config.", (uint8_t *)&v7, 0xCu);
  }

  if (self->_setupCalled)
  {
    -[NSDictionary objectForKey:](self->_embeddingConfigItems, "objectForKey:", self->_stableEmbeddingModelVersion);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    CDMOSLoggerForCategory(0);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v7 = 136315394;
      v8 = "-[CDMEmbeddingConfigs getStableEmbeddingConfig]";
      v9 = 2112;
      v10 = v4;
      _os_log_impl(&dword_21A2A0000, v5, OS_LOG_TYPE_INFO, "%s Return stable embedding config: %@.", (uint8_t *)&v7, 0x16u);
    }
  }
  else
  {
    CDMOSLoggerForCategory(0);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v7 = 136315138;
      v8 = "-[CDMEmbeddingConfigs getStableEmbeddingConfig]";
      _os_log_error_impl(&dword_21A2A0000, v5, OS_LOG_TYPE_ERROR, "%s [ERR]: The setup method has not been called. Please call setup first.", (uint8_t *)&v7, 0xCu);
    }
    v4 = 0;
  }

  return v4;
}

- (id)getEmbeddingConfigForFactor:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  NSObject *v9;
  int v11;
  const char *v12;
  __int16 v13;
  id v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  CDMOSLoggerForCategory(0);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v11 = 136315394;
    v12 = "-[CDMEmbeddingConfigs getEmbeddingConfigForFactor:]";
    v13 = 2112;
    v14 = v4;
    _os_log_debug_impl(&dword_21A2A0000, v5, OS_LOG_TYPE_DEBUG, "%s Get embedding config for factor: %@.", (uint8_t *)&v11, 0x16u);
  }

  if (self->_setupCalled)
  {
    -[CDMEmbeddingConfigs getStableEmbeddingConfig](self, "getStableEmbeddingConfig");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDictionary objectForKey:](self->_serviceDependentEmbeddingModelVersions, "objectForKey:", v4);
    v7 = objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      -[CDMEmbeddingConfigs getEmbeddingConfigForEmbeddingModelVersion:](self, "getEmbeddingConfigForEmbeddingModelVersion:", v7);
      v8 = objc_claimAutoreleasedReturnValue();

      v6 = (void *)v8;
    }
    CDMOSLoggerForCategory(0);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v11 = 136315650;
      v12 = "-[CDMEmbeddingConfigs getEmbeddingConfigForFactor:]";
      v13 = 2112;
      v14 = v6;
      v15 = 2112;
      v16 = v4;
      _os_log_impl(&dword_21A2A0000, v9, OS_LOG_TYPE_INFO, "%s Return embedding config: %@ for factor :%@.", (uint8_t *)&v11, 0x20u);
    }

  }
  else
  {
    CDMOSLoggerForCategory(0);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v11 = 136315138;
      v12 = "-[CDMEmbeddingConfigs getEmbeddingConfigForFactor:]";
      _os_log_error_impl(&dword_21A2A0000, v7, OS_LOG_TYPE_ERROR, "%s [ERR]: The setup method has not been called. Please call setup first.", (uint8_t *)&v11, 0xCu);
    }
    v6 = 0;
  }

  return v6;
}

- (id)getAllEmbeddingConfigs
{
  void *v2;
  NSObject *v3;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  if (self->_setupCalled)
  {
    -[NSDictionary allValues](self->_embeddingConfigItems, "allValues");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    CDMOSLoggerForCategory(0);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      v5 = 136315138;
      v6 = "-[CDMEmbeddingConfigs getAllEmbeddingConfigs]";
      _os_log_error_impl(&dword_21A2A0000, v3, OS_LOG_TYPE_ERROR, "%s [ERR]: The setup method has not been called. Please call setup first.", (uint8_t *)&v5, 0xCu);
    }

    v2 = 0;
  }
  return v2;
}

- (id)getEmbeddingConfigForEmbeddingModelVersion:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  int v9;
  const char *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  CDMOSLoggerForCategory(0);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v9 = 136315394;
    v10 = "-[CDMEmbeddingConfigs getEmbeddingConfigForEmbeddingModelVersion:]";
    v11 = 2112;
    v12 = v4;
    _os_log_debug_impl(&dword_21A2A0000, v5, OS_LOG_TYPE_DEBUG, "%s Get embedding config for embedding model version: %@.", (uint8_t *)&v9, 0x16u);
  }

  -[NSDictionary objectForKey:](self->_embeddingConfigItems, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  CDMOSLoggerForCategory(0);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v9 = 136315394;
    v10 = "-[CDMEmbeddingConfigs getEmbeddingConfigForEmbeddingModelVersion:]";
    v11 = 2112;
    v12 = v6;
    _os_log_impl(&dword_21A2A0000, v7, OS_LOG_TYPE_INFO, "%s Return embedding config: %@.", (uint8_t *)&v9, 0x16u);
  }

  return v6;
}

- (void)validateClientEmbeddingVersion:(id)a3 embeddingAssetVersion:(id)a4 embeddingModelIdList:(id)a5 multipleModels:(BOOL)a6 withError:(id *)a7
{
  _BOOL4 v8;
  id v12;
  id v13;
  id v14;
  _BOOL4 v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void **v23;
  uint64_t *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  id v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  _QWORD v38[2];

  v8 = a6;
  v38[1] = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = +[CDMEmbeddingUtils isValidEmbeddingVersionOnlyNumber:](CDMEmbeddingUtils, "isValidEmbeddingVersionOnlyNumber:", self->_clientEmbeddingVersion);
  if (v8)
  {
    if (v15 && !-[NSString isEqualToString:](self->_clientEmbeddingVersion, "isEqualToString:", v13))
    {
      v16 = (void *)MEMORY[0x24BDD1540];
      v37 = *MEMORY[0x24BDD0FC8];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("The embeddingVersion is with format {OS}.{NCV}.{Patch}, and it does not match with the top-level embedding asset version. Return empty map."));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v38[0] = v17;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v38, &v37, 1);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "errorWithDomain:code:userInfo:", CFSTR("CDMEmbeddingConfigs"), 2, v18);
      *a7 = (id)objc_claimAutoreleasedReturnValue();

      v19 = +[CDMPlatformUtils prettyPrintError:](CDMPlatformUtils, "prettyPrintError:", *a7);
    }
    if (!+[CDMEmbeddingUtils isValidEmbeddingVersionOnlyNumber:](CDMEmbeddingUtils, "isValidEmbeddingVersionOnlyNumber:", self->_clientEmbeddingVersion)&& (objc_msgSend(v14, "containsObject:", self->_clientEmbeddingVersion) & 1) == 0)
    {
      v20 = (void *)MEMORY[0x24BDD1540];
      v35 = *MEMORY[0x24BDD0FC8];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("The embeddingVersion is not a valid bolt ID as it does not exist in the available embedding model ids provided in embedding asset configuration. Return empty map."));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = v21;
      v22 = (void *)MEMORY[0x24BDBCE70];
      v23 = &v36;
      v24 = &v35;
LABEL_13:
      objc_msgSend(v22, "dictionaryWithObjects:forKeys:count:", v23, v24, 1);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "errorWithDomain:code:userInfo:", CFSTR("CDMEmbeddingConfigs"), 2, v29);
      *a7 = (id)objc_claimAutoreleasedReturnValue();

      v30 = +[CDMPlatformUtils prettyPrintError:](CDMPlatformUtils, "prettyPrintError:", *a7);
    }
  }
  else
  {
    if (v15 && !-[NSString isEqualToString:](self->_clientEmbeddingVersion, "isEqualToString:", v13))
    {
      v25 = (void *)MEMORY[0x24BDD1540];
      v33 = *MEMORY[0x24BDD0FC8];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("The embeddingVersion is with format {OS}.{NCV}.{Patch} (e.g. 3200.1002.1004) and it does not matche with the CDM embedding asset version. Return empty map."));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = v26;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v34, &v33, 1);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "errorWithDomain:code:userInfo:", CFSTR("CDMEmbeddingConfigs"), 2, v27);
      *a7 = (id)objc_claimAutoreleasedReturnValue();

      v28 = +[CDMPlatformUtils prettyPrintError:](CDMPlatformUtils, "prettyPrintError:", *a7);
    }
    if (!+[CDMEmbeddingUtils isValidEmbeddingVersionOnlyNumber:](CDMEmbeddingUtils, "isValidEmbeddingVersionOnlyNumber:", self->_clientEmbeddingVersion))
    {
      v20 = (void *)MEMORY[0x24BDD1540];
      v31 = *MEMORY[0x24BDD0FC8];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("In a single embedding model case, it is not allowed that the embeddingVersion is with format {Espresso_Bolt_ID}. Return empty map."));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = v21;
      v22 = (void *)MEMORY[0x24BDBCE70];
      v23 = &v32;
      v24 = &v31;
      goto LABEL_13;
    }
  }

}

- (id)getAssetPaths
{
  return self->_assetPaths;
}

- (CDMEmbeddingConfigs)initWithCoder:(id)a3
{
  id v4;
  CDMEmbeddingConfigs *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  NSDictionary *assetPaths;
  uint64_t v14;
  NSString *stableEmbeddingModelVersion;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  NSDictionary *embeddingConfigItems;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  NSDictionary *serviceDependentEmbeddingModelVersions;
  objc_super v28;

  v4 = a3;
  v28.receiver = self;
  v28.super_class = (Class)CDMEmbeddingConfigs;
  v5 = -[CDMEmbeddingConfigs init](&v28, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x24BDBCF20];
    v7 = objc_opt_class();
    v8 = objc_opt_class();
    v9 = objc_opt_class();
    v10 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, v8, v9, v10, objc_opt_class(), 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v11, CFSTR("assetPaths"));
    v12 = objc_claimAutoreleasedReturnValue();
    assetPaths = v5->_assetPaths;
    v5->_assetPaths = (NSDictionary *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_stableEmbeddingModelVersion"));
    v14 = objc_claimAutoreleasedReturnValue();
    stableEmbeddingModelVersion = v5->_stableEmbeddingModelVersion;
    v5->_stableEmbeddingModelVersion = (NSString *)v14;

    v16 = (void *)MEMORY[0x24BDBCF20];
    v17 = objc_opt_class();
    v18 = objc_opt_class();
    objc_msgSend(v16, "setWithObjects:", v17, v18, objc_opt_class(), 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v19, CFSTR("embeddingConfigItems"));
    v20 = objc_claimAutoreleasedReturnValue();
    embeddingConfigItems = v5->_embeddingConfigItems;
    v5->_embeddingConfigItems = (NSDictionary *)v20;

    v22 = (void *)MEMORY[0x24BDBCF20];
    v23 = objc_opt_class();
    objc_msgSend(v22, "setWithObjects:", v23, objc_opt_class(), 0);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v24, CFSTR("serviceDependentEmbeddingModelVersions"));
    v25 = objc_claimAutoreleasedReturnValue();
    serviceDependentEmbeddingModelVersions = v5->_serviceDependentEmbeddingModelVersions;
    v5->_serviceDependentEmbeddingModelVersions = (NSDictionary *)v25;

    v5->_setupCalled = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("setupCalled"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSDictionary *assetPaths;
  id v5;

  assetPaths = self->_assetPaths;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", assetPaths, CFSTR("assetPaths"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_stableEmbeddingModelVersion, CFSTR("_stableEmbeddingModelVersion"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_embeddingConfigItems, CFSTR("embeddingConfigItems"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_serviceDependentEmbeddingModelVersions, CFSTR("serviceDependentEmbeddingModelVersions"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_setupCalled, CFSTR("setupCalled"));

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_embeddingReturnForVersion, 0);
  objc_storeStrong((id *)&self->_serviceDependentEmbeddingModelVersions, 0);
  objc_storeStrong((id *)&self->_embeddingConfigItems, 0);
  objc_storeStrong((id *)&self->_clientEmbeddingVersion, 0);
  objc_storeStrong((id *)&self->_stableEmbeddingModelVersion, 0);
  objc_storeStrong((id *)&self->_assetPaths, 0);
}

+ (id)generateEmbeddingModelIdList:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a3, "componentsSeparatedByString:", CFSTR(","));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(v3, "count"));
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * v9);
        objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceAndNewlineCharacterSet", (_QWORD)v14);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "stringByTrimmingCharactersInSet:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v12, "length"))
          objc_msgSend(v4, "addObject:", v12);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }

  return v4;
}

+ (int)getMaxEmbeddingConcurrencyConst
{
  return 1;
}

+ (BOOL)isInternalBuild
{
  return +[CDMPlatformUtils isInternalInstall](CDMPlatformUtils, "isInternalInstall");
}

+ (int)getMaxEmbeddingConcurrency
{
  int v2;
  NSObject *v3;
  int v4;
  _BOOL4 v5;
  _BOOL4 v6;
  const char *v7;
  int v9;
  const char *v10;
  __int16 v11;
  int v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v2 = +[CDMEmbeddingConfigs getMaxEmbeddingConcurrencyConst](CDMEmbeddingConfigs, "getMaxEmbeddingConcurrencyConst");
  if (v2 == 1)
  {
    CDMOSLoggerForCategory(0);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      v9 = 136315138;
      v10 = "+[CDMEmbeddingConfigs getMaxEmbeddingConcurrency]";
      _os_log_debug_impl(&dword_21A2A0000, v3, OS_LOG_TYPE_DEBUG, "%s Simplicity is good, just 1 embedding in the system.", (uint8_t *)&v9, 0xCu);
    }
    goto LABEL_4;
  }
  v4 = v2;
  if (v2 <= 0)
  {
    CDMOSLoggerForCategory(0);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      v9 = 136315394;
      v10 = "+[CDMEmbeddingConfigs getMaxEmbeddingConcurrency]";
      v11 = 1024;
      v12 = v4;
      v7 = "%s [WARN]: ⚠️ Trust but verify, why is this set to %d? Returning 1 as we need to have at least a embedding in the system.";
LABEL_13:
      v4 = 1;
      goto LABEL_14;
    }
  }
  else
  {
    v5 = +[CDMEmbeddingConfigs isInternalBuild](CDMEmbeddingConfigs, "isInternalBuild");
    CDMOSLoggerForCategory(0);
    v3 = objc_claimAutoreleasedReturnValue();
    v6 = os_log_type_enabled(v3, OS_LOG_TYPE_INFO);
    if (v5)
    {
      if (!v6)
        goto LABEL_15;
      v9 = 136315394;
      v10 = "+[CDMEmbeddingConfigs getMaxEmbeddingConcurrency]";
      v11 = 1024;
      v12 = v4;
      v7 = "%s [WARN]: ⚠️ In active development on an internal build. Configured with multiple embeddings at the moment: %d";
LABEL_14:
      _os_log_impl(&dword_21A2A0000, v3, OS_LOG_TYPE_INFO, v7, (uint8_t *)&v9, 0x12u);
      goto LABEL_15;
    }
    if (v6)
    {
      v9 = 136315394;
      v10 = "+[CDMEmbeddingConfigs getMaxEmbeddingConcurrency]";
      v11 = 1024;
      v12 = v4;
      v7 = "%s [WARN]: 🚨 Cannot have multiple embeddings (%d) on a non-internal build, so returning 1";
      goto LABEL_13;
    }
  }
LABEL_4:
  v4 = 1;
LABEL_15:

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
