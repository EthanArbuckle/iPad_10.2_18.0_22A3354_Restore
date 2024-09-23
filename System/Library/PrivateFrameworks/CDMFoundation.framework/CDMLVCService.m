@implementation CDMLVCService

- (id)handleRequestCommandTypeNames
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDBCF20];
  +[CDMBaseCommand commandName](CDMLVCRequestCommand, "commandName");
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
  return +[CDMFeatureFlags isLVCEnabled](CDMFeatureFlags, "isLVCEnabled");
}

- (id)handle:(id)a3
{
  id v4;
  NSObject *v5;
  CDMLVCService *v6;
  SiriNLUOverrideProxy *overrideProxy;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  CDMLVCResponseCommand *v12;
  id v13;
  CDMLVCResponseCommand *v14;
  NSObject *v15;
  int64_t serviceState;
  NSObject *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  id v21;
  uint64_t v22;
  NSObject *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  NSObject *v33;
  void *v34;
  void *v35;
  id v36;
  void *v37;
  _BOOL4 v38;
  NSObject *v39;
  NSObject *v40;
  NSObject *v41;
  NSObject *v42;
  void *v43;
  id v44;
  __CFString *v46;
  uint64_t v47;
  id v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  uint64_t v53;
  uint8_t buf[4];
  const char *v55;
  __int16 v56;
  const __CFString *v57;
  __int16 v58;
  void *v59;
  _BYTE v60[128];
  uint64_t v61;

  v61 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  CDMOSLoggerForCategory(0);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v55 = "-[CDMLVCService handle:]";
    _os_log_impl(&dword_21A2A0000, v5, OS_LOG_TYPE_INFO, "%s Running LVC inference...", buf, 0xCu);
  }

  if (self->super.super._serviceState == 2)
  {
    v6 = self;
    objc_sync_enter(v6);
    overrideProxy = v6->_overrideProxy;
    if (overrideProxy)
    {
      v8 = CDMLogContext;
      if (os_log_type_enabled((os_log_t)CDMLogContext, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        v55 = "-[CDMLVCService handle:]";
        v56 = 2112;
        v57 = CFSTR("lvc");
        _os_log_impl(&dword_21A2A0000, v8, OS_LOG_TYPE_INFO, "%s [insights-cdm-%@]:\nLVC override start matching", buf, 0x16u);
        overrideProxy = v6->_overrideProxy;
      }
      objc_msgSend(v4, "overridesInputs");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[SiriNLUOverrideProxy matchWithInputs:overrideNamespace:](overrideProxy, "matchWithInputs:overrideNamespace:", v9, 4);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (v10)
      {
        +[CDMLVCService buildMultiLingualVariant:](CDMLVCService, "buildMultiLingualVariant:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11)
        {
          v12 = [CDMLVCResponseCommand alloc];
          v13 = objc_alloc_init(MEMORY[0x24BE9E200]);
          v14 = -[CDMLVCResponseCommand initWithITFMResponse:languageVariantResult:](v12, "initWithITFMResponse:languageVariantResult:", v13, v11);

          objc_sync_exit(v6);
          goto LABEL_50;
        }
      }

    }
    if (!v6->_lvcOrchestrator)
    {
      CDMOSLoggerForCategory(0);
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        v55 = "-[CDMLVCService handle:]";
        _os_log_error_impl(&dword_21A2A0000, v17, OS_LOG_TYPE_ERROR, "%s [ERR]: _lvcOrchestrator not initialized", buf, 0xCu);
      }

    }
    CDMOSLoggerForCategory(0);
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v4, "parserRequest");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "tokenisedUtterance");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "originalUtterance");
      v21 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v22 = objc_msgSend(v21, "UTF8String");
      *(_DWORD *)buf = 136315394;
      v55 = "-[CDMLVCService handle:]";
      v56 = 2080;
      v57 = (const __CFString *)v22;
      _os_log_impl(&dword_21A2A0000, v18, OS_LOG_TYPE_INFO, "%s LVC Request for utterance: %s", buf, 0x16u);

    }
    CDMOSLoggerForCategory(0);
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v55 = "-[CDMLVCService handle:]";
      _os_log_impl(&dword_21A2A0000, v23, OS_LOG_TYPE_INFO, "%s Handling LVC Request", buf, 0xCu);
    }

    if (+[CDMFeatureFlags isLogNluEnabled](CDMFeatureFlags, "isLogNluEnabled"))
    {
      objc_msgSend(v4, "parserRequest");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v53 = 0;
      v25 = +[CDMNluLogUtil writeLVCRequestToDisk:error:](CDMNluLogUtil, "writeLVCRequestToDisk:error:", v24, &v53);

    }
    v51 = 0u;
    v52 = 0u;
    v49 = 0u;
    v50 = 0u;
    objc_msgSend(v4, "parserRequest");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "tokenisedUtterance");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "tokenChain");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "tokens");
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v49, v60, 16);
    if (v30)
    {
      v31 = *(_QWORD *)v50;
LABEL_26:
      v32 = 0;
      while (1)
      {
        if (*(_QWORD *)v50 != v31)
          objc_enumerationMutation(v29);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v49 + 1) + 8 * v32), "isWhitespace") & 1) == 0)
          break;
        if (v30 == ++v32)
        {
          v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v49, v60, 16);
          if (v30)
            goto LABEL_26;
          goto LABEL_32;
        }
      }

      v33 = v6;
      objc_sync_enter(v33);
      objc_msgSend(v4, "parserRequest");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v48 = 0;
      -[NSObject doInference:error:](v33, "doInference:error:", v34, &v48);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = v48;

      if (v35)
      {

        objc_sync_exit(v33);
        objc_msgSend(v35, "hypotheses");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v38 = objc_msgSend(v37, "count") == 0;

        if (v38)
        {
          CDMOSLoggerForCategory(0);
          v39 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 136315138;
            v55 = "-[CDMLVCService handle:]";
            _os_log_debug_impl(&dword_21A2A0000, v39, OS_LOG_TYPE_DEBUG, "%s LVC returned no hypotheses", buf, 0xCu);
          }

        }
        v40 = CDMLogContext;
        if (os_log_type_enabled((os_log_t)CDMLogContext, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136315650;
          v55 = "-[CDMLVCService handle:]";
          v56 = 2112;
          v57 = CFSTR("lvc");
          v58 = 2112;
          v59 = v35;
          _os_log_debug_impl(&dword_21A2A0000, v40, OS_LOG_TYPE_DEBUG, "%s [insights-cdm-%@]:\nLVC Parser Response: %@", buf, 0x20u);
        }
        goto LABEL_47;
      }
      CDMOSLoggerForCategory(0);
      v41 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v36, "localizedDescription");
        v46 = (__CFString *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136315394;
        v55 = "-[CDMLVCService handle:]";
        v56 = 2112;
        v57 = v46;
        _os_log_error_impl(&dword_21A2A0000, v41, OS_LOG_TYPE_ERROR, "%s [ERR]: LVC inference failed with error: %@", buf, 0x16u);

      }
      objc_sync_exit(v33);
    }
    else
    {
LABEL_32:

      CDMOSLoggerForCategory(0);
      v33 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        v55 = "-[CDMLVCService handle:]";
        _os_log_impl(&dword_21A2A0000, v33, OS_LOG_TYPE_INFO, "%s No non whitespace tokens found. Skipping call to LVC model inference.", buf, 0xCu);
      }
    }

    CDMOSLoggerForCategory(0);
    v42 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v55 = "-[CDMLVCService handle:]";
      _os_log_impl(&dword_21A2A0000, v42, OS_LOG_TYPE_INFO, "%s Given that LVC model call has been incomplete, returning an empty response.", buf, 0xCu);
    }

    v35 = (void *)objc_opt_new();
LABEL_47:
    +[CDMNLServiceUtils buildLVCResponse:lvcRequest:](CDMNLServiceUtils, "buildLVCResponse:lvcRequest:", v35, v4);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    if (+[CDMFeatureFlags isLogNluEnabled](CDMFeatureFlags, "isLogNluEnabled"))
    {
      v47 = 0;
      v44 = +[CDMNluLogUtil writeLVCResponseToDisk:error:](CDMNluLogUtil, "writeLVCResponseToDisk:error:", v35, &v47);
    }
    objc_sync_exit(v6);

    v6 = v43;
    v14 = (CDMLVCResponseCommand *)v6;
  }
  else
  {
    CDMOSLoggerForCategory(0);
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      serviceState = self->super.super._serviceState;
      *(_DWORD *)buf = 136315394;
      v55 = "-[CDMLVCService handle:]";
      v56 = 2048;
      v57 = (const __CFString *)serviceState;
      _os_log_impl(&dword_21A2A0000, v15, OS_LOG_TYPE_INFO, "%s Not Ready! State: %tu", buf, 0x16u);
    }

    v14 = objc_alloc_init(CDMLVCResponseCommand);
    -[CDMBaseService createErrorWithCode:description:](self, "createErrorWithCode:description:", 1, &stru_24DCAE158);
    v6 = (CDMLVCService *)objc_claimAutoreleasedReturnValue();
    -[CDMBaseCommand setCmdError:](v14, "setCmdError:", v6);
  }
LABEL_50:

  return v14;
}

- (id)setup:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  CDMLVCService *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  int v18;
  NSObject *v19;
  const char *v20;
  void *v21;
  NSObject *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  void *v28;
  id v29;
  uint64_t v30;
  const __CFString *v31;
  uint8_t buf[4];
  const char *v33;
  __int16 v34;
  uint64_t v35;
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  CDMOSLoggerForCategory(0);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v33 = "-[CDMLVCService setup:]";
    _os_log_impl(&dword_21A2A0000, v5, OS_LOG_TYPE_INFO, "%s LVC model setup", buf, 0xCu);
  }

  objc_msgSend(v4, "dynamicConfig");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "getAssetBundlePathForFactorName:", CFSTR("com.apple.siri.nl.lvc"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    CDMOSLoggerForCategory(0);
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v33 = "-[CDMLVCService setup:]";
      v20 = "%s Bundle not found for the LVC service";
LABEL_16:
      _os_log_impl(&dword_21A2A0000, v19, OS_LOG_TYPE_INFO, v20, buf, 0xCu);
    }
LABEL_17:

    v21 = 0;
    self->super.super._serviceState = 4;
    -[CDMBaseService createSetupResponseCommand](self, "createSetupResponseCommand");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_30;
  }
  objc_msgSend((id)objc_opt_class(), "assetsPathURLForModelBundle:", v7);
  v8 = objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    CDMOSLoggerForCategory(0);
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v33 = "-[CDMLVCService setup:]";
      v20 = "%s Language variant classifier asset path not found";
      goto LABEL_16;
    }
    goto LABEL_17;
  }
  CDMOSLoggerForCategory(0);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    v33 = "-[CDMLVCService setup:]";
    v34 = 2112;
    v35 = v8;
    _os_log_debug_impl(&dword_21A2A0000, v9, OS_LOG_TYPE_DEBUG, "%s LVC service passing assets path to SNLPLanguageVariantClassifier: %@", buf, 0x16u);
  }

  v10 = self;
  objc_sync_enter(v10);
  v29 = 0;
  -[CDMLVCService getSNLPLanguageVariantClassifierPath:error:](v10, "getSNLPLanguageVariantClassifierPath:error:", v8, &v29);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v29;

  if (v11)
  {
    objc_msgSend(v4, "dynamicConfig");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "getAssetBundlePathForFactorName:", CFSTR("com.apple.siri.nl.overrides"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v14, "resourcePath");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "stringByAppendingPathComponent:", CFSTR("trie_bundle"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (-[CDMLVCService initializeLVCOverrides:](v10, "initializeLVCOverrides:", v16))
    {
      CDMOSLoggerForCategory(0);
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        v33 = "-[CDMLVCService setup:]";
        _os_log_impl(&dword_21A2A0000, v17, OS_LOG_TYPE_INFO, "%s Trie Overrides: Loaded LVC overrides bundle", buf, 0xCu);
      }
      v18 = 0;
    }
    else
    {
      CDMOSLoggerForCategory(0);
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        v33 = "-[CDMLVCService setup:]";
        _os_log_error_impl(&dword_21A2A0000, v23, OS_LOG_TYPE_ERROR, "%s [ERR]: Trie Overrides: Failed to load LVC overrides bundle", buf, 0xCu);
      }

      v10->super.super._serviceState = 4;
      -[CDMBaseService createSetupResponseCommand](v10, "createSetupResponseCommand");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = (void *)MEMORY[0x24BDD1540];
      v30 = *MEMORY[0x24BDD0FD8];
      v31 = CFSTR("Failed to load LVC overrides bundle");
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v31, &v30, 1);
      v17 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "errorWithDomain:code:userInfo:", *MEMORY[0x24BE9E428], 0, v17);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setCmdError:", v25);

      v18 = 1;
    }

  }
  else
  {
    CDMOSLoggerForCategory(0);
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v12, "localizedDescription");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      v33 = "-[CDMLVCService setup:]";
      v34 = 2112;
      v35 = (uint64_t)v28;
      _os_log_error_impl(&dword_21A2A0000, v22, OS_LOG_TYPE_ERROR, "%s [ERR]: Failed to create LVC Orchestrator: %@", buf, 0x16u);

    }
    v10->super.super._serviceState = 3;
    -[CDMBaseService createSetupResponseCommand](v10, "createSetupResponseCommand");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setCmdError:", v12);
    v18 = 1;
  }

  objc_sync_exit(v10);
  if (!v18)
  {
    CDMOSLoggerForCategory(0);
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v33 = "-[CDMLVCService setup:]";
      _os_log_impl(&dword_21A2A0000, v26, OS_LOG_TYPE_INFO, "%s LVC model loaded", buf, 0xCu);
    }

    v10->super.super._serviceState = 2;
    -[CDMBaseService createSetupResponseCommand](v10, "createSetupResponseCommand");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v21 = (void *)v8;
LABEL_30:

  return v15;
}

- (id)warmup:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  CDMWarmupResponseCommand *v9;
  int64_t v10;
  void *v11;
  CDMWarmupResponseCommand *v12;
  int v14;
  const char *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  CDMOSLoggerForCategory(0);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v14 = 136315138;
    v15 = "-[CDMLVCService warmup:]";
    _os_log_impl(&dword_21A2A0000, v5, OS_LOG_TYPE_INFO, "%s Prewarm LVC model", (uint8_t *)&v14, 0xCu);
  }

  if (+[CDMUserDefaultsUtils prewarmModels](CDMUserDefaultsUtils, "prewarmModels"))
  {
    objc_msgSend(v4, "dynamicConfig");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "embeddingConfigs");
    v7 = objc_claimAutoreleasedReturnValue();

    -[NSObject getEmbeddingConfigForFactor:](v7, "getEmbeddingConfigForFactor:", CFSTR("com.apple.siri.nl.lvc"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[CDMLVCService _prewarmModelWithEmbeddingConfigItem:](self, "_prewarmModelWithEmbeddingConfigItem:", v8);

  }
  else
  {
    CDMOSLoggerForCategory(0);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      v14 = 136315138;
      v15 = "-[CDMLVCService warmup:]";
      _os_log_debug_impl(&dword_21A2A0000, v7, OS_LOG_TYPE_DEBUG, "%s Model prewarming is turned off. LVC will not prewarm.", (uint8_t *)&v14, 0xCu);
    }
  }

  v9 = [CDMWarmupResponseCommand alloc];
  v10 = -[CDMBaseService serviceState](self, "serviceState");
  -[CDMBaseService serviceName](self, "serviceName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[CDMWarmupResponseCommand initWithServiceState:serviceName:](v9, "initWithServiceState:serviceName:", v10, v11);

  return v12;
}

- (void)_prewarmModelWithEmbeddingConfigItem:(id)a3
{
  void *v4;
  void *v5;
  CDMLVCService *v6;
  SNLPLanguageVariantClassifier *lvcOrchestrator;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  id v12;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a3, "embeddingModelDimension");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[CDMNLServiceUtils buildSetupITFMRequest:](CDMNLServiceUtils, "buildSetupITFMRequest:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = self;
  objc_sync_enter(v6);
  lvcOrchestrator = v6->_lvcOrchestrator;
  v12 = 0;
  -[SNLPLanguageVariantClassifier responseForRequest:error:](lvcOrchestrator, "responseForRequest:error:", v5, &v12);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v12;
  if (!v8)
  {
    CDMOSLoggerForCategory(0);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v9, "localizedDescription");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      v14 = "-[CDMLVCService _prewarmModelWithEmbeddingConfigItem:]";
      v15 = 2112;
      v16 = v11;
      _os_log_error_impl(&dword_21A2A0000, v10, OS_LOG_TYPE_ERROR, "%s [ERR]: Failed to run warm-up inference call: %@", buf, 0x16u);

    }
  }

  objc_sync_exit(v6);
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
    v12 = "-[CDMLVCService doInference:error:]";
    _os_log_impl(&dword_21A2A0000, v7, OS_LOG_TYPE_INFO, "%s Start LVC", (uint8_t *)&v11, 0xCu);
  }

  -[SNLPLanguageVariantClassifier responseForRequest:error:](self->_lvcOrchestrator, "responseForRequest:error:", v6, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  CDMOSLoggerForCategory(0);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v11 = 136315138;
    v12 = "-[CDMLVCService doInference:error:]";
    _os_log_impl(&dword_21A2A0000, v9, OS_LOG_TYPE_INFO, "%s LVC finished", (uint8_t *)&v11, 0xCu);
  }

  return v8;
}

- (id)getSNLPLanguageVariantClassifierPath:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  uint64_t v8;
  id *p_lvcOrchestrator;
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
    v14 = "-[CDMLVCService getSNLPLanguageVariantClassifierPath:error:]";
    v15 = 2112;
    v16 = v6;
    _os_log_impl(&dword_21A2A0000, v7, OS_LOG_TYPE_INFO, "%s creating SNLPLanguageVariantClassifier: %@", (uint8_t *)&v13, 0x16u);
  }

  objc_msgSend(MEMORY[0x24BE9E3A8], "classifierWithPathURL:error:", v6, a4);
  v8 = objc_claimAutoreleasedReturnValue();
  p_lvcOrchestrator = (id *)&self->_lvcOrchestrator;
  v10 = *p_lvcOrchestrator;
  *p_lvcOrchestrator = (id)v8;

  v11 = *p_lvcOrchestrator;
  return v11;
}

- (BOOL)initializeLVCOverrides:(id)a3
{
  char *v4;
  void *v5;
  SiriNLUOverrideProxy *v6;
  SiriNLUOverrideProxy *overrideProxy;
  _BOOL4 v8;
  NSObject *v9;
  const char *v10;
  int v12;
  const char *v13;
  __int16 v14;
  const char *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = (char *)a3;
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "fileExistsAtPath:", v4) & 1) != 0)
  {
    v6 = -[SiriNLUOverrideProxy initWithUseTrie:useMemory:]([SiriNLUOverrideProxy alloc], "initWithUseTrie:useMemory:", 1, 0);
    overrideProxy = self->_overrideProxy;
    self->_overrideProxy = v6;

    v8 = -[SiriNLUOverrideProxy loadComponentOverrideTrieStoreWithTrieFilePath:](self->_overrideProxy, "loadComponentOverrideTrieStoreWithTrieFilePath:", v4);
    CDMOSLoggerForCategory(0);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v10 = "NO";
      if (v8)
        v10 = "YES";
      v12 = 136315394;
      v13 = "-[CDMLVCService initializeLVCOverrides:]";
      v14 = 2080;
      v15 = v10;
      _os_log_impl(&dword_21A2A0000, v9, OS_LOG_TYPE_INFO, "%s Override proxy returned the following for loading LVC overrides: %s", (uint8_t *)&v12, 0x16u);
    }
  }
  else
  {
    CDMOSLoggerForCategory(0);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v12 = 136315394;
      v13 = "-[CDMLVCService initializeLVCOverrides:]";
      v14 = 2112;
      v15 = v4;
      _os_log_impl(&dword_21A2A0000, v9, OS_LOG_TYPE_INFO, "%s [WARN]: Unable to initialize LVC override from path %@", (uint8_t *)&v12, 0x16u);
    }
    LOBYTE(v8) = 0;
  }

  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overrideProxy, 0);
  objc_storeStrong((id *)&self->_lvcOrchestrator, 0);
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
  v6 = CFSTR("model_bundle_lvc");
  v7 = CFSTR("com.apple.siri.nl.lvc");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v6, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v3;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CDMServiceAssetConfig addCDMFactorToFoldersMapping:forAssetSet:](v2, "addCDMFactorToFoldersMapping:forAssetSet:", v4, 0);

  -[CDMServiceAssetConfig setIsAssetRequiredForSetup:](v2, "setIsAssetRequiredForSetup:", 0);
  return v2;
}

+ (id)assetsPathURLForModelBundle:(id)a3
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
      v13 = "+[CDMLVCService assetsPathURLForModelBundle:]";
      v14 = 2112;
      v15 = v4;
      _os_log_impl(&dword_21A2A0000, v9, OS_LOG_TYPE_INFO, "%s [WARN]: LVC assets path does not exist or is not a directory: %@", buf, 0x16u);
    }

    v8 = 0;
  }

  return v8;
}

+ (id)buildMultiLingualVariant:(id)a3
{
  id v3;
  void *v4;
  int v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  id v15;
  id v16;
  int v18;
  const char *v19;
  __int16 v20;
  const __CFString *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  if (objc_msgSend(v3, "hasLvcOverrideValue")
    && (objc_msgSend(v3, "lvcOverrideValue"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v5 = objc_msgSend(v4, "hasLvcValue"),
        v4,
        v5))
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_alloc_init(MEMORY[0x24BE9E0C0]);
    objc_msgSend(v3, "lvcOverrideValue");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "lvcValue");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "languageVariantName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setLanguageVariantName:", v10);

    objc_msgSend(v3, "lvcOverrideValue");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "lvcValue");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "languageVariantScore");
    objc_msgSend(v7, "setLanguageVariantScore:");

    v13 = (id)CDMLogContext;
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v7, "dictionaryRepresentation");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 136315650;
      v19 = "+[CDMLVCService buildMultiLingualVariant:]";
      v20 = 2112;
      v21 = CFSTR("lvc");
      v22 = 2112;
      v23 = v14;
      _os_log_impl(&dword_21A2A0000, v13, OS_LOG_TYPE_INFO, "%s [insights-cdm-%@]:\nLVC override found:%@", (uint8_t *)&v18, 0x20u);

    }
    objc_msgSend(v6, "addObject:", v7);
    v15 = objc_alloc_init(MEMORY[0x24BE9E0B0]);
    objc_msgSend(v15, "setMultilingualVariants:", v6);
    v16 = objc_alloc_init(MEMORY[0x24BE9E0D8]);
    objc_msgSend(v16, "setAlgorithm:", 1);
    objc_msgSend(v16, "setParserId:", 8);
    objc_msgSend(v15, "setParser:", v16);

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

@end
