@implementation CDMSNLCProtoService

- (id)handleRequestCommandTypeNames
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDBCF20];
  +[CDMBaseCommand commandName](CDMSNLCProtoRequestCommand, "commandName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v3;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v7, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)handle:(id)a3
{
  id v4;
  NSObject *v5;
  CDMSNLCProtoService *v6;
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
  CDMSNLCProtoResponseCommand *v26;
  double v27;
  CDMSNLCProtoService *v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  float v33;
  float v34;
  void *v35;
  void *v36;
  float v37;
  void *v38;
  NSObject *v39;
  void *v40;
  NSObject *v41;
  void *v42;
  NSObject *v43;
  id v44;
  int v46;
  float v47;
  const char *v48;
  uint64_t v49;
  id v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  uint64_t v55;
  uint8_t buf[4];
  const char *v57;
  __int16 v58;
  const __CFString *v59;
  __int16 v60;
  double v61;
  _BYTE v62[128];
  uint64_t v63;

  v63 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  CDMOSLoggerForCategory(0);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v57 = "-[CDMSNLCProtoService handle:]";
    _os_log_impl(&dword_21A2A0000, v5, OS_LOG_TYPE_INFO, "%s Running SNLC inference...", buf, 0xCu);
  }

  if (self->super.super._serviceState == 2)
  {
    v6 = self;
    objc_sync_enter(v6);
    if (!v6->_snlcOrchestrator)
    {
      CDMOSLoggerForCategory(0);
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        v57 = "-[CDMSNLCProtoService handle:]";
        _os_log_error_impl(&dword_21A2A0000, v7, OS_LOG_TYPE_ERROR, "%s [ERR]: _snlcOrchestrator not initialized", buf, 0xCu);
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
      v57 = "-[CDMSNLCProtoService handle:]";
      v58 = 2080;
      v59 = (const __CFString *)v12;
      _os_log_impl(&dword_21A2A0000, v8, OS_LOG_TYPE_INFO, "%s SNLC Request for utterance: %s", buf, 0x16u);

    }
    CDMOSLoggerForCategory(0);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v57 = "-[CDMSNLCProtoService handle:]";
      _os_log_impl(&dword_21A2A0000, v13, OS_LOG_TYPE_INFO, "%s Handling SNLC Request", buf, 0xCu);
    }

    if (+[CDMFeatureFlags isLogNluEnabled](CDMFeatureFlags, "isLogNluEnabled"))
    {
      objc_msgSend(v4, "parserRequest");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v55 = 0;
      v15 = +[CDMNluLogUtil writeSNLCRequestToDisk:error:](CDMNluLogUtil, "writeSNLCRequestToDisk:error:", v14, &v55);

    }
    v53 = 0u;
    v54 = 0u;
    v51 = 0u;
    v52 = 0u;
    objc_msgSend(v4, "parserRequest");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "tokenisedUtterance");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "tokenChain");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "tokens");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v51, v62, 16);
    if (v20)
    {
      v21 = *(_QWORD *)v52;
LABEL_16:
      v22 = 0;
      while (1)
      {
        if (*(_QWORD *)v52 != v21)
          objc_enumerationMutation(v19);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v51 + 1) + 8 * v22), "isWhitespace") & 1) == 0)
          break;
        if (v20 == ++v22)
        {
          v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v51, v62, 16);
          if (v20)
            goto LABEL_16;
          goto LABEL_22;
        }
      }

      v28 = v6;
      objc_sync_enter(v28);
      objc_msgSend(v4, "parserRequest");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v50 = 0;
      -[CDMSNLCProtoService doInference:error:](v28, "doInference:error:", v29, &v50);
      v27 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
      v30 = v50;

      objc_sync_exit(v28);
      if (v27 == 0.0)
        goto LABEL_31;
      objc_msgSend(*(id *)&v27, "hypotheses");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "objectAtIndexedSubscript:", 0);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "probability");
      v34 = v33;
      objc_msgSend(*(id *)&v27, "hypotheses");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "objectAtIndexedSubscript:", 1);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "probability");
      if (v34 > v37)
      {
        objc_msgSend(*(id *)&v27, "hypotheses");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "objectAtIndexedSubscript:", 0);
      }
      else
      {
        objc_msgSend(*(id *)&v27, "hypotheses");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "objectAtIndexedSubscript:", 1);
      }
      v40 = (void *)objc_claimAutoreleasedReturnValue();

      CDMOSLoggerForCategory(0);
      v41 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG))
      {
        v46 = objc_msgSend(v40, "label");
        objc_msgSend(v40, "probability");
        v48 = "Device";
        if (!v46)
          v48 = "Server";
        *(_DWORD *)buf = 136315650;
        v57 = "-[CDMSNLCProtoService handle:]";
        v58 = 2080;
        v59 = (const __CFString *)v48;
        v60 = 2048;
        v61 = v47;
        _os_log_debug_impl(&dword_21A2A0000, v41, OS_LOG_TYPE_DEBUG, "%s SNLC delegated this request to %s with probability %f", buf, 0x20u);
      }

    }
    else
    {
LABEL_22:

      CDMOSLoggerForCategory(0);
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        v57 = "-[CDMSNLCProtoService handle:]";
        _os_log_impl(&dword_21A2A0000, v23, OS_LOG_TYPE_INFO, "%s No non whitespace tokens found. Skipping call to SNLC model inference.", buf, 0xCu);
      }

LABEL_31:
      CDMOSLoggerForCategory(0);
      v39 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        v57 = "-[CDMSNLCProtoService handle:]";
        _os_log_impl(&dword_21A2A0000, v39, OS_LOG_TYPE_INFO, "%s Given that SNLC model call has been incomplete, returning the default SERVER response.", buf, 0xCu);
      }

      objc_msgSend((id)objc_opt_class(), "_stockServerResponse");
      v27 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
    }
    +[CDMSNLCProtoService getParserEnum](CDMSNLCProtoService, "getParserEnum");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    +[CDMNLServiceUtils buildSNLCProtoResponse:snlcRequest:parserToSet:](CDMNLServiceUtils, "buildSNLCProtoResponse:snlcRequest:parserToSet:", *(_QWORD *)&v27, v4, v42);
    v26 = (CDMSNLCProtoResponseCommand *)objc_claimAutoreleasedReturnValue();

    v43 = CDMLogContext;
    if (os_log_type_enabled((os_log_t)CDMLogContext, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315650;
      v57 = "-[CDMSNLCProtoService handle:]";
      v58 = 2112;
      v59 = CFSTR("snlc");
      v60 = 2112;
      v61 = v27;
      _os_log_debug_impl(&dword_21A2A0000, v43, OS_LOG_TYPE_DEBUG, "%s [insights-cdm-%@]:\nSNLCParserResponse: %@", buf, 0x20u);
    }
    if (+[CDMFeatureFlags isLogNluEnabled](CDMFeatureFlags, "isLogNluEnabled"))
    {
      v49 = 0;
      v44 = +[CDMNluLogUtil writeSNLCResponseToDisk:error:](CDMNluLogUtil, "writeSNLCResponseToDisk:error:", *(_QWORD *)&v27, &v49);
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
      v57 = "-[CDMSNLCProtoService handle:]";
      v58 = 2048;
      v59 = (const __CFString *)serviceState;
      _os_log_impl(&dword_21A2A0000, v24, OS_LOG_TYPE_INFO, "%s Not Ready! State: %tu", buf, 0x16u);
    }

    v26 = objc_alloc_init(CDMSNLCProtoResponseCommand);
    -[CDMBaseService createErrorWithCode:description:](self, "createErrorWithCode:description:", 1, &stru_24DCAE158);
    v27 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
    -[CDMBaseCommand setCmdError:](v26, "setCmdError:", *(_QWORD *)&v27);
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
  CDMSNLCProtoService *v10;
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
    v22 = "-[CDMSNLCProtoService setup:]";
    _os_log_impl(&dword_21A2A0000, v5, OS_LOG_TYPE_INFO, "%s SNLC model setup", buf, 0xCu);
  }

  objc_msgSend(v4, "dynamicConfig");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "getAssetBundlePathForFactorName:", CFSTR("com.apple.siri.nl.snlc"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[CDMSNLCProtoService assetsPathURLForModelBundle:](self, "assetsPathURLForModelBundle:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      CDMOSLoggerForCategory(0);
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315394;
        v22 = "-[CDMSNLCProtoService setup:]";
        v23 = 2112;
        v24 = v8;
        _os_log_debug_impl(&dword_21A2A0000, v9, OS_LOG_TYPE_DEBUG, "%s SNLC proto service passing assets path to SNLPServerNLClassifier: %@", buf, 0x16u);
      }

      v10 = self;
      objc_sync_enter(v10);
      v20 = 0;
      -[CDMSNLCProtoService getSNLPServerNLClassifierPath:error:](v10, "getSNLPServerNLClassifierPath:error:", v8, &v20);
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
          v22 = "-[CDMSNLCProtoService setup:]";
          v23 = 2112;
          v24 = v19;
          _os_log_error_impl(&dword_21A2A0000, v13, OS_LOG_TYPE_ERROR, "%s [ERR]: Failed to create SNLC Orchestrator: %@", buf, 0x16u);

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
          v22 = "-[CDMSNLCProtoService setup:]";
          _os_log_impl(&dword_21A2A0000, v14, OS_LOG_TYPE_INFO, "%s SNLC model loaded", buf, 0xCu);
        }

        v10->super.super._serviceState = 2;
        -[CDMBaseService createSetupResponseCommand](v10, "createSetupResponseCommand");
        v9 = objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      self->super.super._serviceState = 3;
      -[CDMBaseService createSetupResponseCommand](self, "createSetupResponseCommand");
      v9 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Could not look up SNLC assets path"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      CDMOSLoggerForCategory(0);
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        v22 = "-[CDMSNLCProtoService setup:]";
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
    self->super.super._serviceState = 3;
    -[CDMBaseService createSetupResponseCommand](self, "createSetupResponseCommand");
    v9 = objc_claimAutoreleasedReturnValue();
    -[CDMBaseService createErrorWithCode:description:](self, "createErrorWithCode:description:", 1, CFSTR("Not able to find/load SNLC model bundle directory"));
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
  CDMSNLCProtoService *v11;
  void *v12;
  id v13;
  NSObject *v14;
  CDMWarmupResponseCommand *v15;
  int64_t v16;
  void *v17;
  CDMWarmupResponseCommand *v18;
  uint64_t v20;
  void *v21;
  id v22;
  uint8_t buf[4];
  const char *v24;
  __int16 v25;
  uint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  CDMOSLoggerForCategory(0);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v24 = "-[CDMSNLCProtoService warmup:]";
    _os_log_impl(&dword_21A2A0000, v5, OS_LOG_TYPE_INFO, "%s Prewarm SNLC model", buf, 0xCu);
  }

  if (+[CDMUserDefaultsUtils prewarmModels](CDMUserDefaultsUtils, "prewarmModels"))
  {
    objc_msgSend(v4, "dynamicConfig");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "embeddingConfigs");
    v7 = objc_claimAutoreleasedReturnValue();

    -[NSObject getEmbeddingConfigForFactor:](v7, "getEmbeddingConfigForFactor:", CFSTR("com.apple.siri.nl.snlc"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "embeddingModelDimension");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[CDMNLServiceUtils buildSetupSNLCProtoRequest:](CDMNLServiceUtils, "buildSetupSNLCProtoRequest:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = self;
    objc_sync_enter(v11);
    v22 = 0;
    -[CDMSNLCProtoService doInference:error:](v11, "doInference:error:", v10, &v22);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v22;
    if (!v12)
    {
      CDMOSLoggerForCategory(0);
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v13, "localizedDescription");
        v20 = objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136315394;
        v24 = "-[CDMSNLCProtoService warmup:]";
        v25 = 2112;
        v26 = v20;
        v21 = (void *)v20;
        _os_log_error_impl(&dword_21A2A0000, v14, OS_LOG_TYPE_ERROR, "%s [ERR]: SNLC inference failed with error: %@", buf, 0x16u);

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
      v24 = "-[CDMSNLCProtoService warmup:]";
      _os_log_debug_impl(&dword_21A2A0000, v7, OS_LOG_TYPE_DEBUG, "%s Model prewarming is turned off. SNLC will not prewarm.", buf, 0xCu);
    }
  }

  v15 = [CDMWarmupResponseCommand alloc];
  v16 = -[CDMBaseService serviceState](self, "serviceState");
  -[CDMBaseService serviceName](self, "serviceName");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = -[CDMWarmupResponseCommand initWithServiceState:serviceName:](v15, "initWithServiceState:serviceName:", v16, v17);

  return v18;
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
    v12 = "-[CDMSNLCProtoService doInference:error:]";
    _os_log_impl(&dword_21A2A0000, v7, OS_LOG_TYPE_INFO, "%s Start SNLC", (uint8_t *)&v11, 0xCu);
  }

  -[SNLPServerNLClassifier responseForRequest:error:](self->_snlcOrchestrator, "responseForRequest:error:", v6, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  CDMOSLoggerForCategory(0);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v11 = 136315138;
    v12 = "-[CDMSNLCProtoService doInference:error:]";
    _os_log_impl(&dword_21A2A0000, v9, OS_LOG_TYPE_INFO, "%s SNLC finished", (uint8_t *)&v11, 0xCu);
  }

  return v8;
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
      v13 = "-[CDMSNLCProtoService assetsPathURLForModelBundle:]";
      v14 = 2112;
      v15 = v4;
      _os_log_impl(&dword_21A2A0000, v9, OS_LOG_TYPE_INFO, "%s [WARN]: SNLC assets path does not exist or is not a directory: %@", buf, 0x16u);
    }

    v8 = 0;
  }

  return v8;
}

- (id)getSNLPServerNLClassifierPath:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  uint64_t v8;
  id *p_snlcOrchestrator;
  id v10;
  id v11;
  int v13;
  const char *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  CDMOSLoggerForCategory(0);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v13 = 136315138;
    v14 = "-[CDMSNLCProtoService getSNLPServerNLClassifierPath:error:]";
    _os_log_impl(&dword_21A2A0000, v7, OS_LOG_TYPE_INFO, "%s creating _snlcInferenceOrchestrator", (uint8_t *)&v13, 0xCu);
  }

  objc_msgSend(MEMORY[0x24BE9E3E0], "classifierWithPathURL:error:", v6, a4);
  v8 = objc_claimAutoreleasedReturnValue();
  p_snlcOrchestrator = (id *)&self->_snlcOrchestrator;
  v10 = *p_snlcOrchestrator;
  *p_snlcOrchestrator = (id)v8;

  v11 = *p_snlcOrchestrator;
  return v11;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_snlcOrchestrator, 0);
}

+ (id)_stockServerResponse
{
  id v2;
  id v3;
  double v4;
  id v5;
  double v6;
  void *v7;

  v2 = objc_alloc_init(MEMORY[0x24BE9E200]);
  v3 = objc_alloc_init(MEMORY[0x24BE9E1F0]);
  LODWORD(v4) = 1.0;
  objc_msgSend(v3, "setProbability:", v4);
  objc_msgSend(v3, "setLabel:", 0);
  v5 = objc_alloc_init(MEMORY[0x24BE9E1F0]);
  LODWORD(v6) = 0;
  objc_msgSend(v5, "setProbability:", v6);
  objc_msgSend(v5, "setLabel:", 1);
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithObjects:", v3, v5, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setHypotheses:", v7);

  return v2;
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
  v6 = CFSTR("model_bundle_snlc");
  v7 = CFSTR("com.apple.siri.nl.snlc");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v6, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v3;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CDMServiceAssetConfig addCDMFactorToFoldersMapping:forAssetSet:](v2, "addCDMFactorToFoldersMapping:forAssetSet:", v4, 0);

  return v2;
}

+ (id)getParserEnum
{
  id v2;

  v2 = objc_alloc_init(MEMORY[0x24BE9E0D8]);
  objc_msgSend(v2, "setAlgorithm:", 2);
  objc_msgSend(v2, "setParserId:", 2);
  return v2;
}

@end
