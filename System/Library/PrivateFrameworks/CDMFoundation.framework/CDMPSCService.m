@implementation CDMPSCService

- (id)handleRequestCommandTypeNames
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDBCF20];
  +[CDMBaseCommand commandName](CDMPSCRequestCommand, "commandName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v3;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v7, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (BOOL)isEnabled
{
  return +[CDMFeatureFlags isPSCEnabled](CDMFeatureFlags, "isPSCEnabled");
}

+ (id)_emptyResponse
{
  return objc_alloc_init(MEMORY[0x24BE9E200]);
}

+ (id)getCDMServiceAssetConfig
{
  CDMServiceAssetConfig *v2;
  void *v3;
  void *v4;
  const __CFString *v6;
  const __CFString *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x24BDAC8D0];
  v2 = objc_alloc_init(CDMServiceAssetConfig);
  v6 = CFSTR("model_bundle_psc");
  v7 = CFSTR("com.apple.siri.nl.psc");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v6, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v3;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CDMServiceAssetConfig addCDMFactorToFoldersMapping:forAssetSet:](v2, "addCDMFactorToFoldersMapping:forAssetSet:", v4, 0);

  -[CDMServiceAssetConfig setIsAssetRequiredForSetup:](v2, "setIsAssetRequiredForSetup:", 0);
  return v2;
}

- (id)handle:(id)a3
{
  id v4;
  NSObject *v5;
  CDMPSCService *v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  NSObject *v24;
  int64_t serviceState;
  CDMPSCResponseCommand *v26;
  void *v27;
  CDMPSCService *v28;
  void *v29;
  id v30;
  NSObject *v31;
  NSObject *v32;
  NSObject *v33;
  id v34;
  __CFString *v36;
  uint64_t v37;
  id v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  uint64_t v43;
  uint8_t buf[4];
  const char *v45;
  __int16 v46;
  const __CFString *v47;
  __int16 v48;
  void *v49;
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  CDMOSLoggerForCategory(0);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v45 = "-[CDMPSCService handle:]";
    _os_log_impl(&dword_21A2A0000, v5, OS_LOG_TYPE_INFO, "%s Running PSC inference...", buf, 0xCu);
  }

  if (self->super.super._serviceState == 2)
  {
    v6 = self;
    objc_sync_enter(v6);
    if (!v6->_pscOrchestrator)
    {
      CDMOSLoggerForCategory(0);
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        v45 = "-[CDMPSCService handle:]";
        _os_log_error_impl(&dword_21A2A0000, v7, OS_LOG_TYPE_ERROR, "%s [ERR]: _pscOrchestrator not initialized", buf, 0xCu);
      }

    }
    CDMOSLoggerForCategory(0);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v4, "parserRequest");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "tokenisedUtterance");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "originalUtterance");
      v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v12 = objc_msgSend(v11, "UTF8String");
      *(_DWORD *)buf = 136315394;
      v45 = "-[CDMPSCService handle:]";
      v46 = 2080;
      v47 = (const __CFString *)v12;
      _os_log_impl(&dword_21A2A0000, v8, OS_LOG_TYPE_INFO, "%s PSC Request for utterance: %s", buf, 0x16u);

    }
    CDMOSLoggerForCategory(0);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v45 = "-[CDMPSCService handle:]";
      _os_log_impl(&dword_21A2A0000, v13, OS_LOG_TYPE_INFO, "%s Handling PSC Request", buf, 0xCu);
    }

    if (+[CDMFeatureFlags isLogNluEnabled](CDMFeatureFlags, "isLogNluEnabled"))
    {
      objc_msgSend(v4, "parserRequest");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v43 = 0;
      v15 = +[CDMNluLogUtil writePSCRequestToDisk:error:](CDMNluLogUtil, "writePSCRequestToDisk:error:", v14, &v43);

    }
    v41 = 0u;
    v42 = 0u;
    v39 = 0u;
    v40 = 0u;
    objc_msgSend(v4, "parserRequest");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "tokenisedUtterance");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "tokenChain");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "tokens");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v39, v50, 16);
    if (v20)
    {
      v21 = *(_QWORD *)v40;
LABEL_16:
      v22 = 0;
      while (1)
      {
        if (*(_QWORD *)v40 != v21)
          objc_enumerationMutation(v19);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v39 + 1) + 8 * v22), "isWhitespace") & 1) == 0)
          break;
        if (v20 == ++v22)
        {
          v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v39, v50, 16);
          if (v20)
            goto LABEL_16;
          goto LABEL_22;
        }
      }

      v28 = v6;
      objc_sync_enter(v28);
      objc_msgSend(v4, "parserRequest");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = 0;
      -[CDMPSCService doInference:error:](v28, "doInference:error:", v29, &v38);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = v38;

      if (v27)
      {
        v31 = CDMLogContext;
        if (os_log_type_enabled((os_log_t)CDMLogContext, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136315650;
          v45 = "-[CDMPSCService handle:]";
          v46 = 2112;
          v47 = CFSTR("psc");
          v48 = 2112;
          v49 = v27;
          _os_log_debug_impl(&dword_21A2A0000, v31, OS_LOG_TYPE_DEBUG, "%s [insights-cdm-%@]:\nPSC Response: %@", buf, 0x20u);
        }
      }
      else
      {
        CDMOSLoggerForCategory(0);
        v32 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(v30, "localizedDescription");
          v36 = (__CFString *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 136315394;
          v45 = "-[CDMPSCService handle:]";
          v46 = 2112;
          v47 = v36;
          _os_log_error_impl(&dword_21A2A0000, v32, OS_LOG_TYPE_ERROR, "%s [ERR]: PSC inference failed with error: %@", buf, 0x16u);

        }
      }

      objc_sync_exit(v28);
      if (v27)
        goto LABEL_38;
    }
    else
    {
LABEL_22:

      CDMOSLoggerForCategory(0);
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        v45 = "-[CDMPSCService handle:]";
        _os_log_impl(&dword_21A2A0000, v23, OS_LOG_TYPE_INFO, "%s No non whitespace tokens found. Skipping call to PSC model inference.", buf, 0xCu);
      }

    }
    CDMOSLoggerForCategory(0);
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v45 = "-[CDMPSCService handle:]";
      _os_log_impl(&dword_21A2A0000, v33, OS_LOG_TYPE_INFO, "%s Given that PSC model call has been incomplete, returning an empty response.", buf, 0xCu);
    }

    objc_msgSend((id)objc_opt_class(), "_emptyResponse");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_38:
    +[CDMNLServiceUtils buildPSCResponse:pscRequest:](CDMNLServiceUtils, "buildPSCResponse:pscRequest:", v27, v4);
    v26 = (CDMPSCResponseCommand *)objc_claimAutoreleasedReturnValue();
    if (+[CDMFeatureFlags isLogNluEnabled](CDMFeatureFlags, "isLogNluEnabled"))
    {
      v37 = 0;
      v34 = +[CDMNluLogUtil writePSCResponseToDisk:error:](CDMNluLogUtil, "writePSCResponseToDisk:error:", v27, &v37);
    }
    objc_sync_exit(v6);

  }
  else
  {
    CDMOSLoggerForCategory(0);
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      serviceState = self->super.super._serviceState;
      *(_DWORD *)buf = 136315394;
      v45 = "-[CDMPSCService handle:]";
      v46 = 2048;
      v47 = (const __CFString *)serviceState;
      _os_log_impl(&dword_21A2A0000, v24, OS_LOG_TYPE_INFO, "%s Not Ready! State: %tu", buf, 0x16u);
    }

    v26 = objc_alloc_init(CDMPSCResponseCommand);
    -[CDMBaseService createErrorWithCode:description:](self, "createErrorWithCode:description:", 1, &stru_24DCAE158);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[CDMBaseCommand setCmdError:](v26, "setCmdError:", v27);
  }

  return v26;
}

- (id)setup:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  CDMPSCService *v10;
  void *v11;
  id v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v19;
  id v20;
  uint8_t buf[4];
  const char *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  CDMOSLoggerForCategory(0);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v22 = "-[CDMPSCService setup:]";
    _os_log_impl(&dword_21A2A0000, v5, OS_LOG_TYPE_INFO, "%s PSC model setup", buf, 0xCu);
  }

  objc_msgSend(v4, "dynamicConfig");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "getAssetBundlePathForFactorName:", CFSTR("com.apple.siri.nl.psc"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[CDMPSCService assetsPathURLForModelBundle:](self, "assetsPathURLForModelBundle:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      CDMOSLoggerForCategory(0);
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315394;
        v22 = "-[CDMPSCService setup:]";
        v23 = 2112;
        v24 = v8;
        _os_log_debug_impl(&dword_21A2A0000, v9, OS_LOG_TYPE_DEBUG, "%s PSC proto service passing assets path to SNLPPommesServerClassifier: %@", buf, 0x16u);
      }

      v10 = self;
      objc_sync_enter(v10);
      v20 = 0;
      -[CDMPSCService getSNLPPommesServerClassifierPath:error:](v10, "getSNLPPommesServerClassifierPath:error:", v8, &v20);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v20;

      if (!v11)
      {
        CDMOSLoggerForCategory(0);
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(v12, "localizedDescription");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 136315394;
          v22 = "-[CDMPSCService setup:]";
          v23 = 2112;
          v24 = v19;
          _os_log_error_impl(&dword_21A2A0000, v13, OS_LOG_TYPE_ERROR, "%s [ERR]: Failed to create PSC Orchestrator: %@", buf, 0x16u);

        }
        v10->super.super._serviceState = 3;
        -[CDMBaseService createSetupResponseCommand](v10, "createSetupResponseCommand");
        v9 = objc_claimAutoreleasedReturnValue();
        -[NSObject setCmdError:](v9, "setCmdError:", v12);
      }

      objc_sync_exit(v10);
      if (v11)
      {
        CDMOSLoggerForCategory(0);
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315138;
          v22 = "-[CDMPSCService setup:]";
          _os_log_impl(&dword_21A2A0000, v14, OS_LOG_TYPE_INFO, "%s PSC model loaded", buf, 0xCu);
        }

        v10->super.super._serviceState = 2;
        -[CDMBaseService createSetupResponseCommand](v10, "createSetupResponseCommand");
        v9 = objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      self->super.super._serviceState = 4;
      -[CDMBaseService createSetupResponseCommand](self, "createSetupResponseCommand");
      v9 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Could not look up PSC assets path"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      CDMOSLoggerForCategory(0);
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        v22 = "-[CDMPSCService setup:]";
        v23 = 2112;
        v24 = v15;
        _os_log_impl(&dword_21A2A0000, v16, OS_LOG_TYPE_INFO, "%s [WARN]: %@", buf, 0x16u);
      }

      -[CDMBaseService createErrorWithCode:description:](self, "createErrorWithCode:description:", 1, v15);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject setCmdError:](v9, "setCmdError:", v17);

      v8 = 0;
    }
  }
  else
  {
    self->super.super._serviceState = 4;
    -[CDMBaseService createSetupResponseCommand](self, "createSetupResponseCommand");
    v9 = objc_claimAutoreleasedReturnValue();
    -[CDMBaseService createErrorWithCode:description:](self, "createErrorWithCode:description:", 1, CFSTR("Not able to find/load PSC model bundle directory"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject setCmdError:](v9, "setCmdError:", v8);
  }

  return v9;
}

- (id)warmup:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  CDMPSCService *v11;
  SNLPPommesServerClassifier *pscOrchestrator;
  void *v13;
  id v14;
  NSObject *v15;
  CDMWarmupResponseCommand *v16;
  int64_t v17;
  void *v18;
  CDMWarmupResponseCommand *v19;
  uint64_t v21;
  void *v22;
  id v23;
  uint8_t buf[4];
  const char *v25;
  __int16 v26;
  uint64_t v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  CDMOSLoggerForCategory(0);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v25 = "-[CDMPSCService warmup:]";
    _os_log_impl(&dword_21A2A0000, v5, OS_LOG_TYPE_INFO, "%s Prewarm PSC model", buf, 0xCu);
  }

  if (+[CDMUserDefaultsUtils prewarmModels](CDMUserDefaultsUtils, "prewarmModels"))
  {
    objc_msgSend(v4, "dynamicConfig");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "embeddingConfigs");
    v7 = objc_claimAutoreleasedReturnValue();

    -[NSObject getEmbeddingConfigForFactor:](v7, "getEmbeddingConfigForFactor:", CFSTR("com.apple.siri.nl.psc"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "embeddingModelDimension");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[CDMNLServiceUtils buildSetupITFMRequest:](CDMNLServiceUtils, "buildSetupITFMRequest:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = self;
    objc_sync_enter(v11);
    pscOrchestrator = v11->_pscOrchestrator;
    v23 = 0;
    -[SNLPPommesServerClassifier responseForRequest:error:](pscOrchestrator, "responseForRequest:error:", v10, &v23);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v23;
    if (!v13)
    {
      CDMOSLoggerForCategory(0);
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v14, "localizedDescription");
        v21 = objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136315394;
        v25 = "-[CDMPSCService warmup:]";
        v26 = 2112;
        v27 = v21;
        v22 = (void *)v21;
        _os_log_error_impl(&dword_21A2A0000, v15, OS_LOG_TYPE_ERROR, "%s [ERR]: Failed to run warm-up inference call: %@", buf, 0x16u);

      }
    }

    objc_sync_exit(v11);
  }
  else
  {
    CDMOSLoggerForCategory(0);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315138;
      v25 = "-[CDMPSCService warmup:]";
      _os_log_debug_impl(&dword_21A2A0000, v7, OS_LOG_TYPE_DEBUG, "%s Model prewarming is turned off. PSC will not prewarm.", buf, 0xCu);
    }
  }

  v16 = [CDMWarmupResponseCommand alloc];
  v17 = -[CDMBaseService serviceState](self, "serviceState");
  -[CDMBaseService serviceName](self, "serviceName");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = -[CDMWarmupResponseCommand initWithServiceState:serviceName:](v16, "initWithServiceState:serviceName:", v17, v18);

  return v19;
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
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v13 = "-[CDMPSCService assetsPathURLForModelBundle:]";
      v14 = 2112;
      v15 = v4;
      _os_log_impl(&dword_21A2A0000, v9, OS_LOG_TYPE_INFO, "%s [WARN]: PSC assets path does not exist or is not a directory: %@", buf, 0x16u);
    }

    v8 = 0;
  }

  return v8;
}

- (id)doInference:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  int v11;
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  CDMOSLoggerForCategory(0);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v11 = 136315138;
    v12 = "-[CDMPSCService doInference:error:]";
    _os_log_impl(&dword_21A2A0000, v7, OS_LOG_TYPE_INFO, "%s Start PSC", (uint8_t *)&v11, 0xCu);
  }

  -[SNLPPommesServerClassifier responseForRequest:error:](self->_pscOrchestrator, "responseForRequest:error:", v6, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  CDMOSLoggerForCategory(0);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v11 = 136315138;
    v12 = "-[CDMPSCService doInference:error:]";
    _os_log_impl(&dword_21A2A0000, v9, OS_LOG_TYPE_INFO, "%s PSC finished", (uint8_t *)&v11, 0xCu);
  }

  return v8;
}

- (id)getSNLPPommesServerClassifierPath:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  uint64_t v8;
  id *p_pscOrchestrator;
  id v10;
  id v11;
  int v13;
  const char *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  CDMOSLoggerForCategory(0);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v13 = 136315394;
    v14 = "-[CDMPSCService getSNLPPommesServerClassifierPath:error:]";
    v15 = 2112;
    v16 = v6;
    _os_log_impl(&dword_21A2A0000, v7, OS_LOG_TYPE_INFO, "%s creating SNLPPommesServerClassifier: %@", (uint8_t *)&v13, 0x16u);
  }

  objc_msgSend(MEMORY[0x24BE9E3B8], "classifierWithPathURL:error:", v6, a4);
  v8 = objc_claimAutoreleasedReturnValue();
  p_pscOrchestrator = (id *)&self->_pscOrchestrator;
  v10 = *p_pscOrchestrator;
  *p_pscOrchestrator = (id)v8;

  v11 = *p_pscOrchestrator;
  return v11;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pscOrchestrator, 0);
}

@end
