@implementation CDMEmbeddingProtoService

+ (id)getCDMServiceAssetConfig
{
  CDMServiceAssetConfig *v2;
  void *v3;
  void *v4;
  _QWORD v6[2];
  const __CFString *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x24BDAC8D0];
  v2 = objc_alloc_init(CDMServiceAssetConfig);
  v6[0] = CFSTR("siri_input_representations");
  v6[1] = CFSTR("temp_model");
  v7 = CFSTR("com.apple.siri.nl.owl");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v3;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CDMServiceAssetConfig addCDMFactorToFoldersMapping:forAssetSet:](v2, "addCDMFactorToFoldersMapping:forAssetSet:", v4, 0);

  return v2;
}

- (id)handleRequestCommandTypeNames
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDBCF20];
  +[CDMBaseCommand commandName](CDMEmbeddingProtoRequestCommand, "commandName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v3;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v7, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)warmup:(id)a3
{
  NSObject *v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  CDMWarmupResponseCommand *v9;
  int64_t v10;
  void *v11;
  CDMWarmupResponseCommand *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint8_t v18[128];
  uint8_t buf[4];
  const char *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  CDMOSLoggerForCategory(0);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v20 = "-[CDMEmbeddingProtoService warmup:]";
    _os_log_impl(&dword_21A2A0000, v4, OS_LOG_TYPE_INFO, "%s Prewarm Embedding models", buf, 0xCu);
  }

  if (+[CDMUserDefaultsUtils prewarmModels](CDMUserDefaultsUtils, "prewarmModels")
    && -[CDMEmbeddingProtoService hasEmbedderOrchestrator](self, "hasEmbedderOrchestrator"))
  {
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v5 = self->_embedders;
    v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v6)
    {
      v7 = *(_QWORD *)v15;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v15 != v7)
            objc_enumerationMutation(v5);
          objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * i), "warmup", (_QWORD)v14);
        }
        v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v6);
    }
  }
  else
  {
    CDMOSLoggerForCategory(0);
    v5 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v5->super.super, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315138;
      v20 = "-[CDMEmbeddingProtoService warmup:]";
      _os_log_debug_impl(&dword_21A2A0000, &v5->super.super, OS_LOG_TYPE_DEBUG, "%s Model prewarming is turned off. Embedding models will not prewarm.", buf, 0xCu);
    }
  }

  v9 = [CDMWarmupResponseCommand alloc];
  v10 = -[CDMBaseService serviceState](self, "serviceState");
  -[CDMBaseService serviceName](self, "serviceName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[CDMWarmupResponseCommand initWithServiceState:serviceName:](v9, "initWithServiceState:serviceName:", v10, v11);

  return v12;
}

- (BOOL)hasEmbedderOrchestrator
{
  NSMutableArray *embedders;

  embedders = self->_embedders;
  if (embedders)
    LOBYTE(embedders) = -[NSMutableArray count](embedders, "count") != 0;
  return (char)embedders;
}

- (id)setup:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  CDMEmbeddingConfigs *v7;
  CDMEmbeddingConfigs *embeddingConfigs;
  CDMDataDispatcherContext *v9;
  CDMDataDispatcherContext *dataDispatcherContext;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  NSMutableArray *v15;
  NSMutableArray *embedders;
  NSObject *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  uint64_t v24;
  int v25;
  const char *v26;
  __int16 v27;
  uint64_t v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  CDMOSLoggerForCategory(0);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v25 = 136315138;
    v26 = "-[CDMEmbeddingProtoService setup:]";
    _os_log_impl(&dword_21A2A0000, v5, OS_LOG_TYPE_INFO, "%s Setup CDMEmbeddingProtoService", (uint8_t *)&v25, 0xCu);
  }

  objc_msgSend(v4, "dynamicConfig");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "embeddingConfigs");
  v7 = (CDMEmbeddingConfigs *)objc_claimAutoreleasedReturnValue();
  embeddingConfigs = self->_embeddingConfigs;
  self->_embeddingConfigs = v7;

  objc_msgSend(v4, "dataDispatcherContext");
  v9 = (CDMDataDispatcherContext *)objc_claimAutoreleasedReturnValue();
  dataDispatcherContext = self->_dataDispatcherContext;
  self->_dataDispatcherContext = v9;

  objc_msgSend(v4, "dynamicConfig");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "embeddingVersion");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[CDMEmbeddingConfigs getDependentEmbeddingConfigs](self->_embeddingConfigs, "getDependentEmbeddingConfigs");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  CDMOSLoggerForCategory(0);
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    v24 = objc_msgSend(v13, "count");
    v25 = 136315394;
    v26 = "-[CDMEmbeddingProtoService setup:]";
    v27 = 2048;
    v28 = v24;
    _os_log_debug_impl(&dword_21A2A0000, v14, OS_LOG_TYPE_DEBUG, "%s Initialize _embedders array with capacity %lu", (uint8_t *)&v25, 0x16u);
  }

  v15 = (NSMutableArray *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(v13, "count"));
  embedders = self->_embedders;
  self->_embedders = v15;

  if (v12)
  {
    CDMOSLoggerForCategory(0);
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      v25 = 136315394;
      v26 = "-[CDMEmbeddingProtoService setup:]";
      v27 = 2112;
      v28 = (uint64_t)v12;
      _os_log_impl(&dword_21A2A0000, v17, OS_LOG_TYPE_INFO, "%s Client Embedding version is not nil and the value is %@.", (uint8_t *)&v25, 0x16u);
    }

    -[CDMEmbeddingConfigs getEmbeddingVersionDictionary](self->_embeddingConfigs, "getEmbeddingVersionDictionary");
    v18 = objc_claimAutoreleasedReturnValue();
    -[CDMEmbeddingProtoService getSpecificEmbeddingModelItem:dependentEmbeddingConfigs:embeddingVersion:](self, "getSpecificEmbeddingModelItem:dependentEmbeddingConfigs:embeddingVersion:", v18, v13, v12);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (v19)
    {
      -[CDMEmbeddingProtoService addEmbeddingModelItemToEmbedders:](self, "addEmbeddingModelItemToEmbedders:", v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_16;
    }
    CDMOSLoggerForCategory(0);
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      v25 = 136315138;
      v26 = "-[CDMEmbeddingProtoService setup:]";
      _os_log_impl(&dword_21A2A0000, v21, OS_LOG_TYPE_INFO, "%s Embedding version not found; fallback to stable embedding.",
        (uint8_t *)&v25,
        0xCu);
    }

  }
  -[CDMEmbeddingProtoService getStableEmbeddingModelItem:](self, "getStableEmbeddingModelItem:", v13);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v19)
  {
    self->super.super._serviceState = 3;
    -[CDMEmbeddingProtoService createNoStableEmbeddingsModelFoundResponse](self, "createNoStableEmbeddingsModelFoundResponse");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_18;
  }
  -[CDMEmbeddingProtoService addEmbeddingModelItemToEmbedders:](self, "addEmbeddingModelItemToEmbedders:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  CDMOSLoggerForCategory(0);
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v19, "embeddingModelVersion");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = 136315394;
    v26 = "-[CDMEmbeddingProtoService setup:]";
    v27 = 2112;
    v28 = (uint64_t)v22;
    _os_log_impl(&dword_21A2A0000, v18, OS_LOG_TYPE_INFO, "%s Embeddings model successfully loaded: %@", (uint8_t *)&v25, 0x16u);

  }
LABEL_16:

LABEL_18:
  return v20;
}

- (id)getStableEmbeddingModelItem:(id)a3
{
  id v3;
  id v4;
  uint64_t v5;
  void *i;
  void *v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v3 = a3;
  v4 = (id)objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v10;
    while (2)
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(_QWORD *)v10 != v5)
          objc_enumerationMutation(v3);
        v7 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v7, "isStableEmbeddingModel", (_QWORD)v9))
        {
          v4 = v7;
          goto LABEL_11;
        }
      }
      v4 = (id)objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      if (v4)
        continue;
      break;
    }
  }
LABEL_11:

  return v4;
}

- (id)addEmbeddingModelItemToEmbedders:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _BOOL4 v11;
  uint64_t v12;
  NSObject *v13;
  CDMEmbeddingProtoService *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  Embedder *v18;
  void *v19;
  uint64_t v20;
  NSObject *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  BOOL v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  NSObject *v35;
  void *v36;
  void *v37;
  int v38;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  uint8_t buf[4];
  const char *v45;
  __int16 v46;
  uint64_t v47;
  __int16 v48;
  void *v49;
  __int16 v50;
  void *v51;
  __int16 v52;
  void *v53;
  uint64_t v54;

  v54 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (v4)
  {
    CDMOSLoggerForCategory(0);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v4, "embeddingModelVersion");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      v45 = "-[CDMEmbeddingProtoService addEmbeddingModelItemToEmbedders:]";
      v46 = 2112;
      v47 = (uint64_t)v37;
      _os_log_debug_impl(&dword_21A2A0000, v5, OS_LOG_TYPE_DEBUG, "%s Processing embedding config for model %@", buf, 0x16u);

    }
    CDMOSLoggerForCategory(0);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      v38 = objc_msgSend(v4, "isStableEmbeddingModel");
      *(_DWORD *)buf = 136315394;
      v45 = "-[CDMEmbeddingProtoService addEmbeddingModelItemToEmbedders:]";
      v46 = 1024;
      LODWORD(v47) = v38;
      _os_log_debug_impl(&dword_21A2A0000, v6, OS_LOG_TYPE_DEBUG, "%s Is stable model: %d", buf, 0x12u);
    }

    v7 = (void *)MEMORY[0x24BDD1488];
    objc_msgSend(v4, "embeddingModelPath");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "bundleWithPath:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9)
    {
      self->super.super._serviceState = 3;
      -[CDMEmbeddingProtoService createEmptyEmbeddingsBundleResponse:](self, "createEmptyEmbeddingsBundleResponse:", v4);
      v20 = objc_claimAutoreleasedReturnValue();
      goto LABEL_19;
    }
    objc_msgSend(v9, "bundlePath");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = +[CDMEmbeddingProtoService isSiriInputRepresentationModel:](CDMEmbeddingProtoService, "isSiriInputRepresentationModel:", v10);

    if (v11)
    {
      -[CDMEmbeddingProtoService assetsPathURLForModelBundle:](self, "assetsPathURLForModelBundle:", v9);
      v12 = objc_claimAutoreleasedReturnValue();
      if (v12)
      {
        CDMOSLoggerForCategory(0);
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136315394;
          v45 = "-[CDMEmbeddingProtoService addEmbeddingModelItemToEmbedders:]";
          v46 = 2112;
          v47 = v12;
          _os_log_debug_impl(&dword_21A2A0000, v13, OS_LOG_TYPE_DEBUG, "%s Embeddings proto service passing assets path to embeddings orchestrator: %@", buf, 0x16u);
        }

        v14 = self;
        objc_sync_enter(v14);
        CDMOSLoggerForCategory(0);
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(v4, "embeddingModelVersion");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 136315394;
          v45 = "-[CDMEmbeddingProtoService addEmbeddingModelItemToEmbedders:]";
          v46 = 2112;
          v47 = (uint64_t)v16;
          _os_log_impl(&dword_21A2A0000, v15, OS_LOG_TYPE_INFO, "%s creating SNLPEmbedder for embeddings model: %@", buf, 0x16u);

        }
        -[CDMEmbeddingProtoService createEmbedderOrchestrator:](v14, "createEmbedderOrchestrator:", v12);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = -[Embedder initWithSnlpEmbedder:andEmbeddingConfigItem:]([Embedder alloc], "initWithSnlpEmbedder:andEmbeddingConfigItem:", v17, v4);
        -[NSMutableArray addObject:](v14->_embedders, "addObject:", v18);
        v19 = (void *)v12;
        goto LABEL_14;
      }
      self->super.super._serviceState = 3;
      -[CDMBaseService createSetupResponseCommand](self, "createSetupResponseCommand");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(v9, "description");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "stringWithFormat:", CFSTR("Could not look up embeddings assets path %@"), v34);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      CDMOSLoggerForCategory(0);
      v35 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        v45 = "-[CDMEmbeddingProtoService addEmbeddingModelItemToEmbedders:]";
        v46 = 2112;
        v47 = (uint64_t)v19;
        _os_log_impl(&dword_21A2A0000, v35, OS_LOG_TYPE_INFO, "%s [WARN]: %@", buf, 0x16u);
      }

      -[CDMBaseService createErrorWithCode:description:](self, "createErrorWithCode:description:", 1, v19);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "setCmdError:", v36);

LABEL_33:
      goto LABEL_34;
    }
    -[CDMEmbeddingProtoService legacyEmbeddingPaths:](self, "legacyEmbeddingPaths:", v9);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    CDMOSLoggerForCategory(0);
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v19, "srcVocabPath");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "modelPath");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "configPath");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "reformulationPath");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136316162;
      v45 = "-[CDMEmbeddingProtoService addEmbeddingModelItemToEmbedders:]";
      v46 = 2112;
      v47 = (uint64_t)v40;
      v48 = 2112;
      v49 = v41;
      v50 = 2112;
      v51 = v42;
      v52 = 2112;
      v53 = v43;
      _os_log_debug_impl(&dword_21A2A0000, v23, OS_LOG_TYPE_DEBUG, "%s SrcVocabPath:%@, Model path:%@, Model config path:%@, Reformulation path:%@", buf, 0x34u);

    }
    objc_msgSend(v19, "srcVocabPath");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (v24)
    {
      objc_msgSend(v19, "modelPath");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      if (v25)
      {
        objc_msgSend(v19, "configPath");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        if (v26)
        {
          objc_msgSend(v19, "reformulationPath");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v28 = v27 == 0;

          if (!v28)
          {
            v14 = self;
            objc_sync_enter(v14);
            objc_msgSend(v19, "srcVocabPath");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "modelPath");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "configPath");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "reformulationPath");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            -[CDMEmbeddingProtoService createEmbedderOrchestrator:embedding_bert_path:embedding_config_path:reformulation_path:](v14, "createEmbedderOrchestrator:embedding_bert_path:embedding_config_path:reformulation_path:", v29, v30, v31, v32);
            v17 = (void *)objc_claimAutoreleasedReturnValue();

            v18 = -[Embedder initWithSnlpEmbedder:andEmbeddingConfigItem:]([Embedder alloc], "initWithSnlpEmbedder:andEmbeddingConfigItem:", v17, v4);
            -[NSMutableArray addObject:](v14->_embedders, "addObject:", v18);
LABEL_14:

            objc_sync_exit(v14);
            self->super.super._serviceState = 2;
            -[CDMBaseService createSetupResponseCommand](self, "createSetupResponseCommand");
            v20 = objc_claimAutoreleasedReturnValue();
LABEL_19:
            v22 = (void *)v20;
LABEL_34:

            goto LABEL_35;
          }
          goto LABEL_32;
        }

      }
    }
LABEL_32:
    self->super.super._serviceState = 3;
    -[CDMEmbeddingProtoService createEmbeddingsBundleMissingPathResponse](self, "createEmbeddingsBundleMissingPathResponse");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_33;
  }
  CDMOSLoggerForCategory(0);
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    v45 = "-[CDMEmbeddingProtoService addEmbeddingModelItemToEmbedders:]";
    _os_log_debug_impl(&dword_21A2A0000, v21, OS_LOG_TYPE_DEBUG, "%s The CDMEmbeddingConfigItem to be used is nil. Fail the setup.", buf, 0xCu);
  }

  self->super.super._serviceState = 3;
  -[CDMEmbeddingProtoService createEmbeddingConfigItemEqualToNilResponse](self, "createEmbeddingConfigItemEqualToNilResponse");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_35:

  return v22;
}

- (id)getSpecificEmbeddingModelItem:(id)a3 dependentEmbeddingConfigs:(id)a4 embeddingVersion:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  BOOL v18;
  id v19;
  id v21;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  v22 = v7;
  objc_msgSend(v7, "objectForKey:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = v9;
  if (v10)
  {
    objc_msgSend(v7, "objectForKey:", v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v12 = v8;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v13)
  {
    v21 = v8;
    v14 = *(_QWORD *)v24;
    while (2)
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v24 != v14)
          objc_enumerationMutation(v12);
        v16 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
        objc_msgSend(v16, "embeddingModelVersion", v21);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v17, "rangeOfString:", v11) == 0x7FFFFFFFFFFFFFFFLL;

        if (!v18)
        {
          v19 = v16;
          goto LABEL_13;
        }
      }
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      if (v13)
        continue;
      break;
    }
  }
  v19 = 0;
LABEL_13:

  return v19;
}

- (id)createEmbedderOrchestrator:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE9E3A0]), "initFromAssetDirectoryURL:", v3);

  return v4;
}

- (id)assetsPathURLForModelBundle:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  char v6;
  char v7;
  void *v8;
  NSObject *v9;
  char v11;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(v3, "resourcePath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "fileExistsAtPath:isDirectory:", v4, &v11);

  if (v11)
    v7 = v6;
  else
    v7 = 0;
  if ((v7 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:isDirectory:", v4, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    CDMOSLoggerForCategory(0);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v13 = "-[CDMEmbeddingProtoService assetsPathURLForModelBundle:]";
      v14 = 2112;
      v15 = v4;
      _os_log_error_impl(&dword_21A2A0000, v9, OS_LOG_TYPE_ERROR, "%s [ERR]: Embeddings assets path does not exist or is not a directory: %@", buf, 0x16u);
    }

    v8 = 0;
  }

  return v8;
}

+ (BOOL)isSiriInputRepresentationModel:(id)a3
{
  void *v3;
  char v4;

  objc_msgSend(a3, "pathComponents");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "containsObject:", CFSTR("siri_input_representations"));

  return v4;
}

- (id)createEmbeddingProtoServiceErrorWithCode:(int64_t)a3 description:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v7 = (void *)MEMORY[0x24BDD1540];
  -[CDMBaseService serviceName](self, "serviceName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = *MEMORY[0x24BDD0FC8];
  v13[0] = v6;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "errorWithDomain:code:userInfo:", v8, a3, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)createNotReadyForHandleProtoResponse
{
  NSObject *v3;
  int64_t serviceState;
  CDMEmbeddingProtoResponseCommand *v5;
  void *v6;
  int v8;
  const char *v9;
  __int16 v10;
  int64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  CDMOSLoggerForCategory(0);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    serviceState = self->super.super._serviceState;
    v8 = 136315394;
    v9 = "-[CDMEmbeddingProtoService createNotReadyForHandleProtoResponse]";
    v10 = 2048;
    v11 = serviceState;
    _os_log_impl(&dword_21A2A0000, v3, OS_LOG_TYPE_INFO, "%s Not Ready! State: %tu", (uint8_t *)&v8, 0x16u);
  }

  v5 = objc_alloc_init(CDMEmbeddingProtoResponseCommand);
  -[CDMEmbeddingProtoService createEmbeddingProtoServiceErrorWithCode:description:](self, "createEmbeddingProtoServiceErrorWithCode:description:", 0, CFSTR("Service not ready to handle requests"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CDMBaseCommand setCmdError:](v5, "setCmdError:", v6);

  return v5;
}

- (id)createEmptyEmbeddingsBundleResponse:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  -[CDMBaseService createSetupResponseCommand](self, "createSetupResponseCommand");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(v4, "embeddingModelPath");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringWithFormat:", CFSTR("Not able to find/load Bert Embedding model bundle directory from path: %@."), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CDMEmbeddingProtoService createEmbeddingProtoServiceErrorWithCode:description:](self, "createEmbeddingProtoServiceErrorWithCode:description:", 1, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setCmdError:", v9);

  return v5;
}

- (id)createEmbeddingConfigItemEqualToNilResponse
{
  void *v3;
  void *v4;
  void *v5;

  -[CDMBaseService createSetupResponseCommand](self, "createSetupResponseCommand");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("CDM EmbeddingConfigItem is Nil. Aborting setup."));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CDMEmbeddingProtoService createEmbeddingProtoServiceErrorWithCode:description:](self, "createEmbeddingProtoServiceErrorWithCode:description:", 5, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setCmdError:", v5);

  return v3;
}

- (id)createNoStableEmbeddingsModelFoundResponse
{
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  int v8;
  const char *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  -[CDMBaseService createSetupResponseCommand](self, "createSetupResponseCommand");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("No stable embeddings model found. Aborting setup."));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  CDMOSLoggerForCategory(0);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    v8 = 136315394;
    v9 = "-[CDMEmbeddingProtoService createNoStableEmbeddingsModelFoundResponse]";
    v10 = 2112;
    v11 = v4;
    _os_log_error_impl(&dword_21A2A0000, v5, OS_LOG_TYPE_ERROR, "%s [ERR]: %@", (uint8_t *)&v8, 0x16u);
  }

  -[CDMEmbeddingProtoService createEmbeddingProtoServiceErrorWithCode:description:](self, "createEmbeddingProtoServiceErrorWithCode:description:", 2, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setCmdError:", v6);

  return v3;
}

- (id)createEmbeddingsBundleMissingPathResponse
{
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  int v8;
  const char *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  -[CDMBaseService createSetupResponseCommand](self, "createSetupResponseCommand");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Not able to find/load all values needed for Embedding model bundle."));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  CDMOSLoggerForCategory(0);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    v8 = 136315394;
    v9 = "-[CDMEmbeddingProtoService createEmbeddingsBundleMissingPathResponse]";
    v10 = 2112;
    v11 = v4;
    _os_log_error_impl(&dword_21A2A0000, v5, OS_LOG_TYPE_ERROR, "%s [ERR]: %@", (uint8_t *)&v8, 0x16u);
  }

  -[CDMEmbeddingProtoService createEmbeddingProtoServiceErrorWithCode:description:](self, "createEmbeddingProtoServiceErrorWithCode:description:", 3, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setCmdError:", v6);

  return v3;
}

- (id)createOrchestratorConstructFailureResponse
{
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  int v8;
  const char *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  -[CDMBaseService createSetupResponseCommand](self, "createSetupResponseCommand");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Unable to get EmbedderOrchestrator"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  CDMOSLoggerForCategory(0);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    v8 = 136315394;
    v9 = "-[CDMEmbeddingProtoService createOrchestratorConstructFailureResponse]";
    v10 = 2112;
    v11 = v4;
    _os_log_error_impl(&dword_21A2A0000, v5, OS_LOG_TYPE_ERROR, "%s [ERR]: %@", (uint8_t *)&v8, 0x16u);
  }

  -[CDMEmbeddingProtoService createEmbeddingProtoServiceErrorWithCode:description:](self, "createEmbeddingProtoServiceErrorWithCode:description:", 4, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setCmdError:", v6);

  return v3;
}

- (id)legacyEmbeddingPaths:(id)a3
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  EmbeddingPaths *v14;
  void *v16;
  int v17;
  const char *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  CDMOSLoggerForCategory(0);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v3, "bundlePath");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 136315394;
    v18 = "-[CDMEmbeddingProtoService legacyEmbeddingPaths:]";
    v19 = 2112;
    v20 = v16;
    _os_log_debug_impl(&dword_21A2A0000, v4, OS_LOG_TYPE_DEBUG, "%s Load legacy owl asset from: %@", (uint8_t *)&v17, 0x16u);

  }
  v5 = (void *)MEMORY[0x24BDD1488];
  objc_msgSend(v3, "bundlePath");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringByAppendingPathComponent:", CFSTR("model_bundle/v3/bert.mlmodelc"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringByDeletingLastPathComponent");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bundleWithPath:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "pathForResource:ofType:", CFSTR("src_vocab"), CFSTR("txt"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "pathForResource:ofType:inDirectory:", CFSTR("model.espresso"), CFSTR("net"), CFSTR("model_bundle/v3/bert.mlmodelc"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "pathForResource:ofType:inDirectory:", CFSTR("config"), CFSTR("json"), CFSTR("model_bundle/v3/bert.mlmodelc"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "pathForResource:ofType:", CFSTR("reformulations"), CFSTR("txt"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[EmbeddingPaths initWithSrcVocabPath:modelPath:configPath:reformulationPath:]([EmbeddingPaths alloc], "initWithSrcVocabPath:modelPath:configPath:reformulationPath:", v10, v11, v12, v13);

  return v14;
}

- (id)handle:(id)a3
{
  id v4;
  void *v5;
  __CFString *v6;
  NSObject *v7;
  NSObject *v8;
  CDMEmbeddingProtoService *v9;
  uint64_t v10;
  void *v11;
  NSMutableArray *embedders;
  NSObject *v13;
  _BOOL4 v14;
  const char *v15;
  int v17;
  const char *v18;
  __int16 v19;
  const __CFString *v20;
  __int16 v21;
  __CFString *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "request");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "text");
  v6 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (-[CDMDataDispatcherContext cdmSELFLoggingPolicyType](self->_dataDispatcherContext, "cdmSELFLoggingPolicyType") == 2)
  {

    v6 = CFSTR("<Redacted>");
  }
  v7 = CDMLogContext;
  if (os_log_type_enabled((os_log_t)CDMLogContext, OS_LOG_TYPE_DEBUG))
  {
    v17 = 136315650;
    v18 = "-[CDMEmbeddingProtoService handle:]";
    v19 = 2112;
    v20 = CFSTR("embedding");
    v21 = 2112;
    v22 = v6;
    _os_log_debug_impl(&dword_21A2A0000, v7, OS_LOG_TYPE_DEBUG, "%s [insights-cdm-%@]:\nEmbeddingRequest text: %@", (uint8_t *)&v17, 0x20u);
  }
  CDMOSLoggerForCategory(0);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v17 = 136315138;
    v18 = "-[CDMEmbeddingProtoService handle:]";
    _os_log_impl(&dword_21A2A0000, v8, OS_LOG_TYPE_INFO, "%s calling SiriBERT embedding", (uint8_t *)&v17, 0xCu);
  }

  if (-[CDMEmbeddingProtoService getServiceState](self, "getServiceState") != 2)
  {
    -[CDMEmbeddingProtoService createNotReadyForHandleProtoResponse](self, "createNotReadyForHandleProtoResponse");
    v10 = objc_claimAutoreleasedReturnValue();
    goto LABEL_11;
  }
  v9 = self;
  objc_sync_enter(v9);
  if (!-[CDMEmbeddingProtoService hasEmbedderOrchestrator](v9, "hasEmbedderOrchestrator"))
  {
    embedders = v9->_embedders;
    v13 = CDMLogContext;
    v14 = os_log_type_enabled((os_log_t)CDMLogContext, OS_LOG_TYPE_ERROR);
    if (embedders)
    {
      if (v14)
      {
        v17 = 136315394;
        v18 = "-[CDMEmbeddingProtoService handle:]";
        v19 = 2112;
        v20 = CFSTR("embedding");
        v15 = "%s [ERR]: [insights-cdm-%@]:\nNo embedders were loaded";
LABEL_19:
        _os_log_error_impl(&dword_21A2A0000, v13, OS_LOG_TYPE_ERROR, v15, (uint8_t *)&v17, 0x16u);
      }
    }
    else if (v14)
    {
      v17 = 136315394;
      v18 = "-[CDMEmbeddingProtoService handle:]";
      v19 = 2112;
      v20 = CFSTR("embedding");
      v15 = "%s [ERR]: [insights-cdm-%@]:\n_embedders array is nil";
      goto LABEL_19;
    }
    objc_sync_exit(v9);

    v11 = 0;
    goto LABEL_17;
  }
  objc_sync_exit(v9);

  -[CDMEmbeddingProtoService doEmbedding:](v9, "doEmbedding:", v4);
  v10 = objc_claimAutoreleasedReturnValue();
LABEL_11:
  v11 = (void *)v10;
LABEL_17:

  return v11;
}

- (id)createEmbedderOrchestrator:(id)a3 embedding_bert_path:(id)a4 embedding_config_path:(id)a5 reformulation_path:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE9E3A0]), "initFromSourceVocabPath:bertModelPath:bertConfigPath:reformulatorPath:", v9, v10, v11, v12);

  return v13;
}

- (void)setEmbedders:(id)a3
{
  objc_storeStrong((id *)&self->_embedders, a3);
}

- (id)doEmbedding:(id)a3
{
  NSObject *v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  void *v30;
  CDMEmbeddingProtoResponseCommand *v31;
  NSObject *v32;
  NSObject *v33;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  void *v38;
  CDMEmbeddingProtoService *v39;
  uint64_t v40;
  id v41;
  NSMutableArray *obj;
  uint64_t v43;
  void *v44;
  id v45;
  void *v46;
  void *v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  uint8_t v52[128];
  uint8_t buf[4];
  const char *v54;
  __int16 v55;
  uint64_t v56;
  uint64_t v57;

  v39 = self;
  v57 = *MEMORY[0x24BDAC8D0];
  v45 = a3;
  CDMOSLoggerForCategory(0);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v54 = "-[CDMEmbeddingProtoService doEmbedding:]";
    _os_log_impl(&dword_21A2A0000, v3, OS_LOG_TYPE_INFO, "%s Start doEmbedding", buf, 0xCu);
  }

  if (-[CDMDataDispatcherContext cdmSELFLoggingPolicyType](v39->_dataDispatcherContext, "cdmSELFLoggingPolicyType") == 2)
  {
    CDMOSLoggerForCategory(0);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315138;
      v54 = "-[CDMEmbeddingProtoService doEmbedding:]";
      _os_log_debug_impl(&dword_21A2A0000, v4, OS_LOG_TYPE_DEBUG, "%s CDMEmbeddingProtoService::doEmbedding input: <Redacted>", buf, 0xCu);
    }
  }
  else
  {
    CDMOSLoggerForCategory(0);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v45, "request");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      v54 = "-[CDMEmbeddingProtoService doEmbedding:]";
      v55 = 2112;
      v56 = (uint64_t)v38;
      _os_log_debug_impl(&dword_21A2A0000, v4, OS_LOG_TYPE_DEBUG, "%s CDMEmbeddingProtoService::doEmbedding input: %@", buf, 0x16u);

    }
  }

  v41 = objc_alloc_init(MEMORY[0x24BE9E1E0]);
  v47 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", -[NSMutableArray count](v39->_embedders, "count"));
  v46 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", -[NSMutableArray count](v39->_embedders, "count"));
  CDMOSLoggerForCategory(0);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v35 = -[NSMutableArray count](v39->_embedders, "count");
    *(_DWORD *)buf = 136315394;
    v54 = "-[CDMEmbeddingProtoService doEmbedding:]";
    v55 = 2048;
    v56 = v35;
    _os_log_debug_impl(&dword_21A2A0000, v5, OS_LOG_TYPE_DEBUG, "%s Running doEmbedding for %lu embedders", buf, 0x16u);
  }

  v50 = 0u;
  v51 = 0u;
  v48 = 0u;
  v49 = 0u;
  obj = v39->_embedders;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v48, v52, 16);
  if (!v6)
  {

LABEL_22:
    CDMOSLoggerForCategory(0);
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v54 = "-[CDMEmbeddingProtoService doEmbedding:]";
      _os_log_error_impl(&dword_21A2A0000, v27, OS_LOG_TYPE_ERROR, "%s [ERR]: Stable not response is not found! Execution should not continue", buf, 0xCu);
    }

    v26 = 0;
    goto LABEL_25;
  }
  v43 = *(_QWORD *)v49;
  v44 = 0;
  do
  {
    for (i = 0; i != v6; ++i)
    {
      if (*(_QWORD *)v49 != v43)
        objc_enumerationMutation(obj);
      v8 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * i);
      v9 = objc_alloc_init(MEMORY[0x24BE9E1E8]);
      v10 = objc_alloc_init(MEMORY[0x24BE9E1E8]);
      objc_msgSend(v8, "snlpEmbedder");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "request");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "getEmbeddings:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v9, "setEmbeddingDim:", objc_msgSend(v13, "embeddingDim"));
      objc_msgSend(v13, "embeddingTensorOutputs");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "objectAtIndexedSubscript:", 0);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "embeddingTensor");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setEmbeddingTensor:", v16);

      objc_msgSend(v8, "embeddingConfigItem");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setIsStableEmbeddingsVersion:", objc_msgSend(v17, "isStableEmbeddingModel"));

      objc_msgSend(v8, "embeddingConfigItem");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "embeddingModelVersion");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setEmbeddingVersion:", v19);

      if (objc_msgSend(v9, "isStableEmbeddingsVersion"))
      {
        v20 = v13;

        v44 = v20;
      }
      objc_msgSend(v47, "addObject:", v9, v39);
      objc_msgSend(v10, "setEmbeddingDim:", objc_msgSend(v13, "embeddingDim"));
      objc_msgSend(v13, "subwordEmbeddingTensorOutputs");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "objectAtIndexedSubscript:", 0);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "embeddingTensor");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setEmbeddingTensor:", v23);

      objc_msgSend(v8, "embeddingConfigItem");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "embeddingModelVersion");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setEmbeddingVersion:", v25);

      objc_msgSend(v46, "addObject:", v10);
    }
    v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v48, v52, 16);
  }
  while (v6);

  v26 = v44;
  if (!v44)
    goto LABEL_22;
LABEL_25:
  v28 = v26;
  objc_msgSend(v26, "tokenChain", v39);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "setTokenChain:", v29);

  objc_msgSend(v41, "setNumToken:", objc_msgSend(v28, "numToken"));
  objc_msgSend(v28, "subwordTokenChain");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "setSubwordTokenChain:", v30);

  objc_msgSend(v41, "setNumSubwordToken:", objc_msgSend(v28, "numSubwordToken"));
  objc_msgSend(v41, "setEmbeddingTensorOutputs:", v47);
  objc_msgSend(v41, "setSubwordEmbeddingTensorOutputs:", v46);
  v31 = -[CDMEmbeddingProtoResponseCommand initWithResponse:embeddingConfigs:]([CDMEmbeddingProtoResponseCommand alloc], "initWithResponse:embeddingConfigs:", v41, *(_QWORD *)(v40 + 56));
  CDMOSLoggerForCategory(0);
  v32 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v54 = "-[CDMEmbeddingProtoService doEmbedding:]";
    _os_log_impl(&dword_21A2A0000, v32, OS_LOG_TYPE_INFO, "%s CDMEmbeddingProtoService::doEmbedding finished", buf, 0xCu);
  }

  CDMOSLoggerForCategory(0);
  v33 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v41, "embeddingTensorOutputs");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = objc_msgSend(v36, "count");
    *(_DWORD *)buf = 136315394;
    v54 = "-[CDMEmbeddingProtoService doEmbedding:]";
    v55 = 2048;
    v56 = v37;
    _os_log_debug_impl(&dword_21A2A0000, v33, OS_LOG_TYPE_DEBUG, "%s CDMEmbeddingProtoService::doEmbedding produced %lu embedding tensors", buf, 0x16u);

  }
  return v31;
}

- (int64_t)getServiceState
{
  return self->super.super._serviceState;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataDispatcherContext, 0);
  objc_storeStrong((id *)&self->_embeddingConfigs, 0);
  objc_storeStrong((id *)&self->_embedders, 0);
}

@end
