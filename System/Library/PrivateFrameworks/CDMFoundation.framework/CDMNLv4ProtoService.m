@implementation CDMNLv4ProtoService

- (id)handleRequestCommandTypeNames
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDBCF20];
  +[CDMBaseCommand commandName](CDMNLv4ProtoRequestCommand, "commandName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v3;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v7, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)xpcEventStreamsSupported
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x24BDBCE30];
  +[XPCStreamEventRegistration registrationWithStream:eventName:dagServiceClass:](XPCStreamEventRegistration, "registrationWithStream:eventName:dagServiceClass:", CFSTR("com.apple.notifyd.matching"), CFSTR("com.apple.trial.NamespaceUpdate.SIRI_UNDERSTANDING_NL"), objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[XPCStreamEventRegistration registrationWithStream:eventName:dagServiceClass:](XPCStreamEventRegistration, "registrationWithStream:eventName:dagServiceClass:", CFSTR("com.apple.notifyd.matching"), CFSTR("com.apple.siri.uaf.com.apple.siri.understanding"), objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "arrayWithObjects:", v3, v4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)xpcActivitySupported
{
  void *v2;

  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", CFSTR("com.apple.siri.cdm.xpc_activity.post_install"));
  objc_msgSend(v2, "addObject:", CFSTR("com.apple.siri.cdm.xpc_activity.maintenance"));
  return v2;
}

- (id)setup:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  CDMNLv4ProtoService *v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  id v14;
  SNLPNaturalLanguageParser *parser;
  SNLPNaturalLanguageParser *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  id v27;
  uint8_t buf[4];
  const char *v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  CDMOSLoggerForCategory(0);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v29 = "-[CDMNLv4ProtoService setup:]";
    _os_log_impl(&dword_21A2A0000, v5, OS_LOG_TYPE_INFO, "%s NLv4 model setup...", buf, 0xCu);
  }

  objc_msgSend(v4, "dynamicConfig");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "getAssetBundlePathForFactorName:", CFSTR("com.apple.siri.nl.nlv4"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[CDMNLv4ProtoService assetsPathURLForModelBundle:](self, "assetsPathURLForModelBundle:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      CDMOSLoggerForCategory(0);
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315394;
        v29 = "-[CDMNLv4ProtoService setup:]";
        v30 = 2112;
        v31 = v8;
        _os_log_debug_impl(&dword_21A2A0000, v9, OS_LOG_TYPE_DEBUG, "%s NLv4 proto service passing assets path to NLv4IO: %@", buf, 0x16u);
      }

      v10 = self;
      objc_sync_enter(v10);
      CDMOSLoggerForCategory(0);
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        v29 = "-[CDMNLv4ProtoService setup:]";
        _os_log_impl(&dword_21A2A0000, v11, OS_LOG_TYPE_INFO, "%s Creating _parser", buf, 0xCu);
      }

      objc_msgSend(v4, "selfMetadata");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = 0;
      -[CDMNLv4ProtoService parserFromAssetDirectory:selfMetadata:error:](v10, "parserFromAssetDirectory:selfMetadata:error:", v8, v12, &v27);
      v13 = objc_claimAutoreleasedReturnValue();
      v14 = v27;
      parser = v10->_parser;
      v10->_parser = (SNLPNaturalLanguageParser *)v13;

      v16 = v10->_parser;
      if (!v16)
      {
        v10->super.super._serviceState = 3;
        -[CDMBaseService createSetupResponseCommand](v10, "createSetupResponseCommand");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = (void *)MEMORY[0x24BDD17C8];
        objc_msgSend(v14, "localizedDescription");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "stringWithFormat:", CFSTR("Error during NLv4 parser init: %@"), v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        CDMOSLoggerForCategory(0);
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315394;
          v29 = "-[CDMNLv4ProtoService setup:]";
          v30 = 2112;
          v31 = v19;
          _os_log_error_impl(&dword_21A2A0000, v20, OS_LOG_TYPE_ERROR, "%s [ERR]: %@", buf, 0x16u);
        }

        -[CDMBaseService createErrorWithCode:description:](v10, "createErrorWithCode:description:", 1, v19);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setCmdError:", v21);

      }
      objc_sync_exit(v10);

      if (v16)
      {
        CDMOSLoggerForCategory(0);
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315138;
          v29 = "-[CDMNLv4ProtoService setup:]";
          _os_log_impl(&dword_21A2A0000, v22, OS_LOG_TYPE_INFO, "%s NLv4 model loaded during setup", buf, 0xCu);
        }

        v10->super.super._serviceState = 2;
        -[CDMBaseService createSetupResponseCommand](v10, "createSetupResponseCommand");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      self->super.super._serviceState = 3;
      -[CDMBaseService createSetupResponseCommand](self, "createSetupResponseCommand");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Could not look up NLv4 assets path"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      CDMOSLoggerForCategory(0);
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        v29 = "-[CDMNLv4ProtoService setup:]";
        v30 = 2112;
        v31 = v23;
        _os_log_impl(&dword_21A2A0000, v24, OS_LOG_TYPE_INFO, "%s [WARN]: %@", buf, 0x16u);
      }

      -[CDMBaseService createErrorWithCode:description:](self, "createErrorWithCode:description:", 1, v23);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setCmdError:", v25);

      v8 = 0;
    }
  }
  else
  {
    self->super.super._serviceState = 3;
    -[CDMBaseService createSetupResponseCommand](self, "createSetupResponseCommand");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[CDMBaseService createErrorWithCode:description:](self, "createErrorWithCode:description:", 1, CFSTR("Not able to find/load NLv4 model bundle directory"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setCmdError:", v8);
  }

  return v12;
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
  CDMNLv4ProtoService *v11;
  NSObject *v12;
  void *v13;
  id v14;
  NSObject *v15;
  uint64_t v16;
  CDMWarmupResponseCommand *v17;
  int64_t v18;
  void *v19;
  CDMWarmupResponseCommand *v20;
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
    v25 = "-[CDMNLv4ProtoService warmup:]";
    _os_log_impl(&dword_21A2A0000, v5, OS_LOG_TYPE_INFO, "%s Prewarm NLv4 model", buf, 0xCu);
  }

  if (+[CDMUserDefaultsUtils prewarmModels](CDMUserDefaultsUtils, "prewarmModels"))
  {
    objc_msgSend(v4, "dynamicConfig");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "embeddingConfigs");
    v7 = objc_claimAutoreleasedReturnValue();

    -[NSObject getEmbeddingConfigForFactor:](v7, "getEmbeddingConfigForFactor:", CFSTR("com.apple.siri.nl.nlv4"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "embeddingModelDimension");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[CDMNLServiceUtils buildSetupNLv4ProtoRequest:](CDMNLServiceUtils, "buildSetupNLv4ProtoRequest:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = self;
    objc_sync_enter(v11);
    if (v11->_parser)
    {
      CDMOSLoggerForCategory(0);
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315138;
        v25 = "-[CDMNLv4ProtoService warmup:]";
        _os_log_debug_impl(&dword_21A2A0000, v12, OS_LOG_TYPE_DEBUG, "%s Performing NLv4 warmup request", buf, 0xCu);
      }

      v23 = 0;
      -[CDMNLv4ProtoService doNLv4Inference:outError:](v11, "doNLv4Inference:outError:", v10, &v23);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v23;
      if (!v13)
      {
        CDMOSLoggerForCategory(0);
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(v14, "localizedDescription");
          v16 = objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 136315394;
          v25 = "-[CDMNLv4ProtoService warmup:]";
          v26 = 2112;
          v27 = v16;
          v22 = (void *)v16;
          _os_log_impl(&dword_21A2A0000, v15, OS_LOG_TYPE_INFO, "%s [WARN]: Warmup NLv4 request failed: %@", buf, 0x16u);

        }
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
      v25 = "-[CDMNLv4ProtoService warmup:]";
      _os_log_debug_impl(&dword_21A2A0000, v7, OS_LOG_TYPE_DEBUG, "%s Model prewarming is turned off. NLv4 will not prewarm.", buf, 0xCu);
    }
  }

  v17 = [CDMWarmupResponseCommand alloc];
  v18 = -[CDMBaseService serviceState](self, "serviceState");
  -[CDMBaseService serviceName](self, "serviceName");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = -[CDMWarmupResponseCommand initWithServiceState:serviceName:](v17, "initWithServiceState:serviceName:", v18, v19);

  return v20;
}

- (id)handle:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  id v7;
  CDMNLv4ProtoService *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  CDMNLv4ProtoResponseCommand *v17;
  NSObject *v18;
  int64_t serviceState;
  void *v20;
  void *v21;
  CDMNLv4ProtoService *v22;
  NSObject *v23;
  id v24;
  void *v25;
  unint64_t v26;
  void *v27;
  NSObject *v28;
  void *v29;
  void *v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  id v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  uint64_t v41;
  uint8_t buf[4];
  const char *v43;
  __int16 v44;
  const __CFString *v45;
  __int16 v46;
  uint64_t v47;
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  CDMOSLoggerForCategory(0);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v43 = "-[CDMNLv4ProtoService handle:]";
    _os_log_impl(&dword_21A2A0000, v5, OS_LOG_TYPE_INFO, "%s calling NLv4 Inference", buf, 0xCu);
  }

  if (+[CDMFeatureFlags isLogNluEnabled](CDMFeatureFlags, "isLogNluEnabled"))
  {
    objc_msgSend(v4, "parserRequest");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = 0;
    v7 = +[CDMNluLogUtil writeNlv4RequestToDisk:error:](CDMNluLogUtil, "writeNlv4RequestToDisk:error:", v6, &v41);

  }
  if (self->super.super._serviceState == 2)
  {
    v8 = self;
    objc_sync_enter(v8);
    if (v8->_parser)
    {
      objc_sync_exit(v8);

      v39 = 0u;
      v40 = 0u;
      v37 = 0u;
      v38 = 0u;
      objc_msgSend(v4, "parserRequest");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "tokenisedUtterance");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "tokenChain");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "tokens");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v37, v48, 16);
      if (v13)
      {
        v14 = *(_QWORD *)v38;
        while (2)
        {
          v15 = 0;
          do
          {
            if (*(_QWORD *)v38 != v14)
              objc_enumerationMutation(v12);
            if ((objc_msgSend(*(id *)(*((_QWORD *)&v37 + 1) + 8 * v15), "isWhitespace") & 1) == 0)
            {

              objc_msgSend(v4, "parserRequest");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              v36 = 0;
              -[CDMNLv4ProtoService doNLv4Inference:outError:](v8, "doNLv4Inference:outError:", v20, &v36);
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              v22 = (CDMNLv4ProtoService *)v36;

              if (v22)
              {
                v17 = objc_alloc_init(CDMNLv4ProtoResponseCommand);
                -[CDMBaseCommand setCmdError:](v17, "setCmdError:", v22);
              }
              else
              {
                if (+[CDMFeatureFlags isLogNluEnabled](CDMFeatureFlags, "isLogNluEnabled"))
                {
                  v35 = 0;
                  v24 = +[CDMNluLogUtil writeNlv4ResponseToDisk:error:](CDMNluLogUtil, "writeNlv4ResponseToDisk:error:", v21, &v35);
                }
                objc_msgSend(v21, "hypotheses");
                v25 = (void *)objc_claimAutoreleasedReturnValue();
                v26 = objc_msgSend(v25, "count");
                objc_msgSend(v4, "parserRequest");
                v27 = (void *)objc_claimAutoreleasedReturnValue();
                LODWORD(v26) = v26 > objc_msgSend(v27, "maxNumParses");

                if ((_DWORD)v26)
                {
                  CDMOSLoggerForCategory(0);
                  v28 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
                  {
                    objc_msgSend(v21, "hypotheses");
                    v31 = (void *)objc_claimAutoreleasedReturnValue();
                    v32 = objc_msgSend(v31, "count");
                    objc_msgSend(v4, "parserRequest");
                    v33 = (void *)objc_claimAutoreleasedReturnValue();
                    v34 = objc_msgSend(v33, "maxNumParses");
                    *(_DWORD *)buf = 136315650;
                    v43 = "-[CDMNLv4ProtoService handle:]";
                    v44 = 2048;
                    v45 = (const __CFString *)v32;
                    v46 = 2048;
                    v47 = v34;
                    _os_log_error_impl(&dword_21A2A0000, v28, OS_LOG_TYPE_ERROR, "%s [ERR]: The number of parses in the response (%lu) is greater than the max num parses in the request (%llu)", buf, 0x20u);

                  }
                }
                objc_msgSend(v4, "requestId");
                v29 = (void *)objc_claimAutoreleasedReturnValue();
                -[CDMNLv4ProtoService buildNLv4ResponseCommand:requestId:](v8, "buildNLv4ResponseCommand:requestId:", v21, v29);
                v17 = (CDMNLv4ProtoResponseCommand *)objc_claimAutoreleasedReturnValue();

              }
              v8 = v22;
              goto LABEL_34;
            }
            ++v15;
          }
          while (v13 != v15);
          v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v37, v48, 16);
          if (v13)
            continue;
          break;
        }
      }

      v16 = CDMLogContext;
      if (os_log_type_enabled((os_log_t)CDMLogContext, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        v43 = "-[CDMNLv4ProtoService handle:]";
        v44 = 2112;
        v45 = CFSTR("nlv4");
        _os_log_impl(&dword_21A2A0000, v16, OS_LOG_TYPE_INFO, "%s [WARN]: [insights-cdm-%@]:\nNo non whitespace tokens found. Skipping call to the model.", buf, 0x16u);
      }
      objc_msgSend(v4, "requestId");
      v8 = (CDMNLv4ProtoService *)objc_claimAutoreleasedReturnValue();
      +[CDMNLv4ProtoService buildEmptyNLv4ResponseCommand:](CDMNLv4ProtoService, "buildEmptyNLv4ResponseCommand:", v8);
      v17 = (CDMNLv4ProtoResponseCommand *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      CDMOSLoggerForCategory(0);
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        v43 = "-[CDMNLv4ProtoService handle:]";
        _os_log_error_impl(&dword_21A2A0000, v23, OS_LOG_TYPE_ERROR, "%s [ERR]: _parser not initialized", buf, 0xCu);
      }

      objc_sync_exit(v8);
      v17 = 0;
    }
  }
  else
  {
    CDMOSLoggerForCategory(0);
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      serviceState = self->super.super._serviceState;
      *(_DWORD *)buf = 136315394;
      v43 = "-[CDMNLv4ProtoService handle:]";
      v44 = 2048;
      v45 = (const __CFString *)serviceState;
      _os_log_impl(&dword_21A2A0000, v18, OS_LOG_TYPE_INFO, "%s Not Ready! State: %tu", buf, 0x16u);
    }

    v17 = objc_alloc_init(CDMNLv4ProtoResponseCommand);
    -[CDMBaseService createErrorWithCode:description:](self, "createErrorWithCode:description:", 1, &stru_24DCAE158);
    v8 = (CDMNLv4ProtoService *)objc_claimAutoreleasedReturnValue();
    -[CDMBaseCommand setCmdError:](v17, "setCmdError:", v8);
  }
LABEL_34:

  return v17;
}

- (id)buildNLv4ResponseCommand:(id)a3 requestId:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  CDMNLv4ProtoResponseCommand *v11;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "hypotheses");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[CDMNLv4ProtoService getParserEnum](CDMNLv4ProtoService, "getParserEnum");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[CDMNLServiceUtils populateParser:parserToSet:](CDMNLServiceUtils, "populateParser:parserToSet:", v7, v8);

  v9 = objc_alloc_init(MEMORY[0x24BE9E088]);
  objc_msgSend(v9, "setRequestId:", v6);
  objc_msgSend(v5, "hypotheses");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setParses:", v10);

  v11 = -[CDMNLv4ProtoResponseCommand initWithParserResponse:nluResponse:]([CDMNLv4ProtoResponseCommand alloc], "initWithParserResponse:nluResponse:", v5, v9);
  return v11;
}

- (id)parserFromAssetDirectory:(id)a3 selfMetadata:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  void *v9;

  v7 = a3;
  v8 = a4;
  objc_msgSend((id)objc_opt_class(), "parserFromAssetDirectory:selfMetadata:error:", v7, v8, a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)doNLv4Inference:(id)a3 outError:(id *)a4
{
  id v6;
  NSObject *v7;
  CDMNLv4ProtoService *v8;
  SNLPNaturalLanguageParser *parser;
  void *v10;
  id v11;
  NSObject *v12;
  NSObject *v13;
  void *v15;
  id v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  const __CFString *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  CDMOSLoggerForCategory(0);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v18 = "-[CDMNLv4ProtoService doNLv4Inference:outError:]";
    _os_log_impl(&dword_21A2A0000, v7, OS_LOG_TYPE_INFO, "%s Start NLv4 Inference", buf, 0xCu);
  }

  v8 = self;
  objc_sync_enter(v8);
  parser = v8->_parser;
  v16 = 0;
  -[SNLPNaturalLanguageParser inferenceResponseForRequest:error:](parser, "inferenceResponseForRequest:error:", v6, &v16);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v16;
  if (!v10)
  {
    v12 = (id)CDMLogContext;
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v11, "localizedDescription");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315650;
      v18 = "-[CDMNLv4ProtoService doNLv4Inference:outError:]";
      v19 = 2112;
      v20 = CFSTR("nlv4");
      v21 = 2112;
      v22 = v15;
      _os_log_error_impl(&dword_21A2A0000, v12, OS_LOG_TYPE_ERROR, "%s [ERR]: [insights-cdm-%@]:\nNLv4 inference error: %@", buf, 0x20u);

    }
    *a4 = objc_retainAutorelease(v11);
  }

  objc_sync_exit(v8);
  CDMOSLoggerForCategory(0);
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v18 = "-[CDMNLv4ProtoService doNLv4Inference:outError:]";
    _os_log_impl(&dword_21A2A0000, v13, OS_LOG_TYPE_INFO, "%s CDMNLv4ProtoService::doNLv4Inference finished", buf, 0xCu);
  }

  return v10;
}

- (id)assetsPathURLForModelBundle:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  objc_msgSend((id)objc_opt_class(), "assetsPathURLForModelBundle:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parser, 0);
}

+ (id)buildEmptyNLv4ResponseCommand:(id)a3
{
  id v3;
  id v4;
  id v5;
  CDMNLv4ProtoResponseCommand *v6;

  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x24BE9E240]);
  v5 = objc_alloc_init(MEMORY[0x24BE9E088]);
  objc_msgSend(v5, "setRequestId:", v3);
  v6 = -[CDMNLv4ProtoResponseCommand initWithParserResponse:nluResponse:]([CDMNLv4ProtoResponseCommand alloc], "initWithParserResponse:nluResponse:", v4, v5);

  return v6;
}

+ (id)getParserEnum
{
  id v2;

  v2 = objc_alloc_init(MEMORY[0x24BE9E0D8]);
  objc_msgSend(v2, "setAlgorithm:", 2);
  objc_msgSend(v2, "setParserId:", 3);
  return v2;
}

+ (id)parserFromAssetDirectory:(id)a3 selfMetadata:(id)a4 error:(id *)a5
{
  objc_msgSend(MEMORY[0x24BE9E3B0], "parserFromAssetDirectory:metadata:error:", a3, a4, a5);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)assetsPathURLForModelBundle:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;
  char v8;
  void *v9;
  NSObject *v10;
  char v12;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(v3, "resourcePath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByAppendingPathComponent:", CFSTR("model_bundle/v3/"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = 0;
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "fileExistsAtPath:isDirectory:", v5, &v12);

  if (v12)
    v8 = v7;
  else
    v8 = 0;
  if ((v8 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:isDirectory:", v5, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    CDMOSLoggerForCategory(0);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v14 = "+[CDMNLv4ProtoService assetsPathURLForModelBundle:]";
      v15 = 2112;
      v16 = v5;
      _os_log_impl(&dword_21A2A0000, v10, OS_LOG_TYPE_INFO, "%s [WARN]: NLv4 assets path does not exist or is not a directory: %@", buf, 0x16u);
    }

    v9 = 0;
  }

  return v9;
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
  v6 = CFSTR("temp_model");
  v7 = CFSTR("com.apple.siri.nl.nlv4");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v6, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v3;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CDMServiceAssetConfig addCDMFactorToFoldersMapping:forAssetSet:](v2, "addCDMFactorToFoldersMapping:forAssetSet:", v4, 0);

  return v2;
}

+ (void)handleXPCEvent:(id)a3 fromStream:(id)a4 withAssets:(id)a5 withSelfMetadata:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  NSObject *v15;
  const char *v16;
  NSObject *v17;
  uint32_t v18;
  int v19;
  const char *v20;
  __int16 v21;
  id v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  +[XPCStreamEventUtils getXPCEventName:](XPCStreamEventUtils, "getXPCEventName:", v10);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v14)
  {
    CDMOSLoggerForCategory(0);
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v19 = 136315394;
      v20 = "+[CDMNLv4ProtoService(SystemEvent) handleXPCEvent:fromStream:withAssets:withSelfMetadata:]";
      v21 = 2048;
      v22 = v10;
      v16 = "%s [ERR]: Could not extract XPC event name for event %p";
      v17 = v15;
      v18 = 22;
      goto LABEL_12;
    }
LABEL_9:

    goto LABEL_10;
  }
  if (!objc_msgSend(CFSTR("com.apple.notifyd.matching"), "isEqualToString:", v11)
    || (objc_msgSend(CFSTR("com.apple.trial.NamespaceUpdate.SIRI_UNDERSTANDING_NL"), "isEqualToString:", v14) & 1) == 0
    && !objc_msgSend(CFSTR("com.apple.siri.uaf.com.apple.siri.understanding"), "isEqualToString:", v14))
  {
    CDMOSLoggerForCategory(0);
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v19 = 136315650;
      v20 = "+[CDMNLv4ProtoService(SystemEvent) handleXPCEvent:fromStream:withAssets:withSelfMetadata:]";
      v21 = 2112;
      v22 = v11;
      v23 = 2112;
      v24 = v14;
      v16 = "%s [ERR]: Unhandled XPC event with streamName=%@, eventName=%@";
      v17 = v15;
      v18 = 32;
LABEL_12:
      _os_log_error_impl(&dword_21A2A0000, v17, OS_LOG_TYPE_ERROR, v16, (uint8_t *)&v19, v18);
      goto LABEL_9;
    }
    goto LABEL_9;
  }
  objc_msgSend(a1, "handleTrialAssetUpdate:selfMetadata:", v12, v13);
LABEL_10:

}

+ (void)handleXPCActivity:(id)a3 withAssets:(id)a4 withSelfMetadata:(id)a5
{
  __CFString *v8;
  id v9;
  id v10;
  NSObject *v11;
  int v12;
  const char *v13;
  __int16 v14;
  __CFString *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v8 = (__CFString *)a3;
  v9 = a4;
  v10 = a5;
  if (v8 == CFSTR("com.apple.siri.cdm.xpc_activity.post_install")
    || v8 == CFSTR("com.apple.siri.cdm.xpc_activity.maintenance"))
  {
    objc_msgSend(a1, "handleTrialAssetUpdate:selfMetadata:", v9, v10);
  }
  else
  {
    CDMOSLoggerForCategory(0);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v12 = 136315394;
      v13 = "+[CDMNLv4ProtoService(SystemEvent) handleXPCActivity:withAssets:withSelfMetadata:]";
      v14 = 2112;
      v15 = v8;
      _os_log_error_impl(&dword_21A2A0000, v11, OS_LOG_TYPE_ERROR, "%s [ERR]: Unhandled activity type: %@", (uint8_t *)&v12, 0x16u);
    }

  }
}

+ (void)handleTrialAssetUpdate:(id)a3 selfMetadata:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  NSObject *v20;
  id v21;
  uint8_t buf[4];
  const char *v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  CDMOSLoggerForCategory(0);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    v23 = "+[CDMNLv4ProtoService(SystemEvent) handleTrialAssetUpdate:selfMetadata:]";
    _os_log_debug_impl(&dword_21A2A0000, v8, OS_LOG_TYPE_DEBUG, "%s Pre-compiling NLv4 mil assets to E5RT.", buf, 0xCu);
  }

  objc_msgSend(v6, "getAssetBundlePathForFactorName:", CFSTR("com.apple.siri.nl.nlv4"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[CDMNLv4ProtoService assetsPathURLForModelBundle:](CDMNLv4ProtoService, "assetsPathURLForModelBundle:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v11 = a1;
    objc_sync_enter(v11);
    CDMOSLoggerForCategory(0);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v23 = "+[CDMNLv4ProtoService(SystemEvent) handleTrialAssetUpdate:selfMetadata:]";
      _os_log_impl(&dword_21A2A0000, v12, OS_LOG_TYPE_INFO, "%s Triggering on-device E5RT compilation of NLv4 model assets.", buf, 0xCu);
    }

    v21 = 0;
    objc_msgSend(v11, "parserFromAssetDirectory:selfMetadata:error:", v10, v7, &v21);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v21;
    v15 = v14;
    if (!v13)
    {
      v16 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(v14, "localizedDescription");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "stringWithFormat:", CFSTR("Error during NLv4 parser init: %@"), v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      CDMOSLoggerForCategory(0);
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v23 = "+[CDMNLv4ProtoService(SystemEvent) handleTrialAssetUpdate:selfMetadata:]";
        v24 = 2112;
        v25 = v18;
        _os_log_error_impl(&dword_21A2A0000, v19, OS_LOG_TYPE_ERROR, "%s [ERR]: %@", buf, 0x16u);
      }

    }
    objc_sync_exit(v11);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Could not look up NLv4 assets path"));
    v11 = (id)objc_claimAutoreleasedReturnValue();
    CDMOSLoggerForCategory(0);
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v23 = "+[CDMNLv4ProtoService(SystemEvent) handleTrialAssetUpdate:selfMetadata:]";
      v24 = 2112;
      v25 = v11;
      _os_log_error_impl(&dword_21A2A0000, v20, OS_LOG_TYPE_ERROR, "%s [ERR]: %@", buf, 0x16u);
    }

  }
}

@end
