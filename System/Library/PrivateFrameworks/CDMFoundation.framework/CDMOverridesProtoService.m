@implementation CDMOverridesProtoService

- (id)handleRequestCommandTypeNames
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDBCF20];
  +[CDMBaseCommand commandName](CDMOverridesProtoRequestCommand, "commandName");
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
  return +[CDMFeatureFlags globalOverridesAreEnabled](CDMFeatureFlags, "globalOverridesAreEnabled");
}

- (id)createSetupErrorCmd:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  self->super.super._serviceState = 4;
  v4 = a3;
  -[CDMBaseService createSetupResponseCommand](self, "createSetupResponseCommand");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CDMBaseService createErrorWithCode:description:](self, "createErrorWithCode:description:", 0, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setCmdError:", v6);
  return v5;
}

- (id)setup:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  NSObject *v9;
  const char *v10;
  void *v11;
  void *v12;
  void *v13;
  char *v14;
  NSObject *v15;
  void *v16;
  int v17;
  NSObject *v18;
  _BOOL4 v19;
  SiriNLUOverrideProxy *v20;
  SiriNLUOverrideProxy *store;
  NSObject *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  int v27;
  const char *v28;
  __int16 v29;
  const char *v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  CDMOSLoggerForCategory(0);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v27 = 136315138;
    v28 = "-[CDMOverridesProtoService setup:]";
    _os_log_debug_impl(&dword_21A2A0000, v5, OS_LOG_TYPE_DEBUG, "%s Beginning setup of new instance of Overrides (Protobuf) service", (uint8_t *)&v27, 0xCu);
  }

  objc_msgSend(v4, "dynamicConfig");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "languageCode");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend((id)objc_opt_class(), "isEnabled");
  CDMOSLoggerForCategory(0);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v10 = "NO";
    if (v8)
      v10 = "YES";
    v27 = 136315394;
    v28 = "-[CDMOverridesProtoService setup:]";
    v29 = 2080;
    v30 = v10;
    _os_log_impl(&dword_21A2A0000, v9, OS_LOG_TYPE_INFO, "%s Is the Overrides (Protobuf) service enabled? %s", (uint8_t *)&v27, 0x16u);
  }

  if ((v8 & 1) != 0)
  {
    objc_msgSend(v4, "dynamicConfig");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "getAssetBundlePathForFactorName:", CFSTR("com.apple.siri.nl.overrides"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      if (+[CDMFeatureFlags isTrieOverridesEnabled](CDMFeatureFlags, "isTrieOverridesEnabled"))
      {
        objc_msgSend(v12, "resourcePath");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "stringByAppendingPathComponent:", CFSTR("trie_bundle"));
        v14 = (char *)objc_claimAutoreleasedReturnValue();

        CDMOSLoggerForCategory(0);
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
        {
          v27 = 136315394;
          v28 = "-[CDMOverridesProtoService setup:]";
          v29 = 2112;
          v30 = v14;
          _os_log_impl(&dword_21A2A0000, v15, OS_LOG_TYPE_INFO, "%s Overrides Trie asset bundle is:%@", (uint8_t *)&v27, 0x16u);
        }

        objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "fileExistsAtPath:", v14);
        CDMOSLoggerForCategory(0);
        v18 = objc_claimAutoreleasedReturnValue();
        v19 = os_log_type_enabled(v18, OS_LOG_TYPE_INFO);
        if (v17)
        {
          if (v19)
          {
            v27 = 136315138;
            v28 = "-[CDMOverridesProtoService setup:]";
            _os_log_impl(&dword_21A2A0000, v18, OS_LOG_TYPE_INFO, "%s Trie Overrides Enabled! There is global overrides trie asset folder", (uint8_t *)&v27, 0xCu);
          }

          v20 = -[SiriNLUOverrideProxy initWithUseTrie:useMemory:]([SiriNLUOverrideProxy alloc], "initWithUseTrie:useMemory:", 1, 0);
          store = self->__store;
          self->__store = v20;

          if (-[SiriNLUOverrideProxy loadGlobalOverrideTrieStoreWithTrieFilePath:](self->__store, "loadGlobalOverrideTrieStoreWithTrieFilePath:", v14))
          {
            CDMOSLoggerForCategory(0);
            v22 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
            {
              v27 = 136315138;
              v28 = "-[CDMOverridesProtoService setup:]";
              _os_log_impl(&dword_21A2A0000, v22, OS_LOG_TYPE_INFO, "%s Trie Overrides store successfully initialized", (uint8_t *)&v27, 0xCu);
            }

            -[CDMOverridesProtoService setupSucceeded](self, "setupSucceeded");
            v23 = objc_claimAutoreleasedReturnValue();
          }
          else
          {
            -[CDMOverridesProtoService setupFailedFor:](self, "setupFailedFor:", CFSTR("Trie Overrides store unable to initialize"));
            v23 = objc_claimAutoreleasedReturnValue();
          }
          v24 = (void *)v23;

          goto LABEL_26;
        }
        if (v19)
        {
          v27 = 136315138;
          v28 = "-[CDMOverridesProtoService setup:]";
          _os_log_impl(&dword_21A2A0000, v18, OS_LOG_TYPE_INFO, "%s Trie Overrides Enabled! But there is no trie asset folder. Fallback to load protobuf overrides assets.", (uint8_t *)&v27, 0xCu);
        }

      }
      -[CDMOverridesProtoService setupSucceeded](self, "setupSucceeded");
      v25 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[CDMOverridesProtoService setupFailedFor:](self, "setupFailedFor:", CFSTR("Unable to locate NSBundle of requisite file assets to handle requests"));
      v25 = objc_claimAutoreleasedReturnValue();
    }
    v24 = (void *)v25;
LABEL_26:

    goto LABEL_27;
  }
  -[CDMOverridesProtoService setupFailedFor:](self, "setupFailedFor:", CFSTR("Feature flag prescribes that Overrides (Protobuf) service remain disabled; bailing."));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_27:

  return v24;
}

- (id)warmup:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  CDMWarmupResponseCommand *v11;
  int64_t v12;
  void *v13;
  CDMWarmupResponseCommand *v14;
  int v16;
  const char *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  CDMOSLoggerForCategory(0);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v16 = 136315138;
    v17 = "-[CDMOverridesProtoService warmup:]";
    _os_log_impl(&dword_21A2A0000, v5, OS_LOG_TYPE_INFO, "%s Warming Up CDMOverridesProtoService", (uint8_t *)&v16, 0xCu);
  }

  -[CDMOverridesProtoService store](self, "store");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dynamicConfig");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "languageCode");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "preheatWithLanguageCode:", v8);

  -[CDMOverridesProtoService buildOverridesTurnInputAndPreprocessing](self, "buildOverridesTurnInputAndPreprocessing");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v16) = 0;
  v10 = -[CDMOverridesProtoService matchOverride:shouldAppend:](self, "matchOverride:shouldAppend:", v9, &v16);
  v11 = [CDMWarmupResponseCommand alloc];
  v12 = -[CDMBaseService serviceState](self, "serviceState");
  -[CDMBaseService serviceName](self, "serviceName");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[CDMWarmupResponseCommand initWithServiceState:serviceName:](v11, "initWithServiceState:serviceName:", v12, v13);

  return v14;
}

- (id)setupSucceeded
{
  NSObject *v3;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  CDMOSLoggerForCategory(0);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v5 = 136315138;
    v6 = "-[CDMOverridesProtoService setupSucceeded]";
    _os_log_impl(&dword_21A2A0000, v3, OS_LOG_TYPE_INFO, "%s Overrides service has been setup successfully!", (uint8_t *)&v5, 0xCu);
  }

  self->super.super._serviceState = 2;
  -[CDMBaseService createSetupResponseCommand](self, "createSetupResponseCommand");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)setupFailedFor:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  int v9;
  const char *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  CDMOSLoggerForCategory(0);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    v9 = 136315394;
    v10 = "-[CDMOverridesProtoService setupFailedFor:]";
    v11 = 2112;
    v12 = v4;
    _os_log_error_impl(&dword_21A2A0000, v5, OS_LOG_TYPE_ERROR, "%s [ERR]: Overrides service failed to setup: %@", (uint8_t *)&v9, 0x16u);
  }

  self->super.super._serviceState = 3;
  -[CDMBaseService createSetupResponseCommand](self, "createSetupResponseCommand");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CDMBaseService createErrorWithCode:description:](self, "createErrorWithCode:description:", 0, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setCmdError:", v7);

  return v6;
}

- (id)handle:(id)a3
{
  NSObject *v4;
  __CFString *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _BOOL4 v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  NSObject *v18;
  CDMOverridesProtoResponseCommand *v19;
  void *v20;
  CDMOverridesProtoService *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  int v35;
  void *v36;
  __CFString *v37;
  int v38;
  NSObject *v39;
  _BOOL4 v40;
  CDMOverridesProtoResponseCommand *v41;
  uint64_t v42;
  NSObject *v43;
  void *v44;
  void *v45;
  void *v46;
  NSObject *v47;
  CDMOverridesProtoResponseCommand *v48;
  CDMOverridesProtoResponseCommand *v49;
  void *v50;
  id v51;
  unsigned __int8 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  uint64_t v57;
  const __CFString *v58;
  uint64_t v59;
  const __CFString *v60;
  _BYTE v61[128];
  uint64_t v62;
  const __CFString *v63;
  int buf;
  const char *v65;
  __int16 v66;
  const __CFString *v67;
  __int16 v68;
  const __CFString *v69;
  uint64_t v70;

  v70 = *MEMORY[0x24BDAC8D0];
  v51 = a3;
  CDMOSLoggerForCategory(0);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    buf = 136315138;
    v65 = "-[CDMOverridesProtoService handle:]";
    _os_log_debug_impl(&dword_21A2A0000, v4, OS_LOG_TYPE_DEBUG, "%s Service is handling command to match user request to database of overrides", (uint8_t *)&buf, 0xCu);
  }

  if (self->super.super._serviceState != 2)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Service is not ready to handle commands! State: %tu"), self->super.super._serviceState);
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    CDMOSLoggerForCategory(0);
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      buf = 136315394;
      v65 = "-[CDMOverridesProtoService handle:]";
      v66 = 2112;
      v67 = v5;
      _os_log_error_impl(&dword_21A2A0000, v24, OS_LOG_TYPE_ERROR, "%s [ERR]: %@", (uint8_t *)&buf, 0x16u);
    }

    v19 = objc_alloc_init(CDMOverridesProtoResponseCommand);
    -[CDMBaseService createErrorWithCode:description:](self, "createErrorWithCode:description:", 1, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CDMBaseCommand setCmdError:](v19, "setCmdError:", v6);
    goto LABEL_26;
  }
  objc_msgSend(v51, "request");
  v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  -[__CFString inputs](v5, "inputs");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectAtIndex:", 0);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "tokenChain");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
    goto LABEL_22;
  objc_msgSend(v50, "tokenChain");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "tokens");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {

    goto LABEL_22;
  }
  objc_msgSend(v50, "tokenChain");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "tokens");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "count") == 0;

  if (v12)
  {
LABEL_22:
    v25 = CDMLogContext;
    if (os_log_type_enabled((os_log_t)CDMLogContext, OS_LOG_TYPE_INFO))
    {
      buf = 136315650;
      v65 = "-[CDMOverridesProtoService handle:]";
      v66 = 2112;
      v67 = CFSTR("overrides");
      v68 = 2112;
      v69 = CFSTR("Request has no tokens; ignoring command.");
      _os_log_impl(&dword_21A2A0000, v25, OS_LOG_TYPE_INFO, "%s [WARN]: [insights-cdm-%@]:\nOverrides skipped request: %@", (uint8_t *)&buf, 0x20u);
    }
    v19 = objc_alloc_init(CDMOverridesProtoResponseCommand);
    v26 = (void *)MEMORY[0x24BDD1540];
    -[CDMBaseService serviceName](self, "serviceName");
    v21 = (CDMOverridesProtoService *)objc_claimAutoreleasedReturnValue();
    v62 = *MEMORY[0x24BDD0FC8];
    v63 = CFSTR("Request has no tokens; ignoring command.");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v63, &v62, 1);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "errorWithDomain:code:userInfo:", v21, 3, v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[CDMBaseCommand setCmdError:](v19, "setCmdError:", v28);

    goto LABEL_25;
  }
  v55 = 0u;
  v56 = 0u;
  v53 = 0u;
  v54 = 0u;
  objc_msgSend(v50, "tokenChain");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "tokens");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v53, v61, 16);
  if (!v15)
    goto LABEL_15;
  v16 = *(_QWORD *)v54;
  while (2)
  {
    for (i = 0; i != v15; ++i)
    {
      if (*(_QWORD *)v54 != v16)
        objc_enumerationMutation(v14);
      if (!objc_msgSend(*(id *)(*((_QWORD *)&v53 + 1) + 8 * i), "isWhitespace"))
      {

        v21 = self;
        objc_sync_enter(v21);
        objc_msgSend(v50, "tokenChain");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        if (v30)
        {
          objc_msgSend(v50, "tokenChain");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "locale");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          if (v32)
          {
            objc_msgSend(v50, "tokenChain");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v33, "locale");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            v35 = objc_msgSend(v34, "isEqual:", &stru_24DCAE158);

            if (!v35)
            {
              -[__CFString inputs](v5, "inputs");
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              v52 = 0;
              -[CDMOverridesProtoService matchOverride:shouldAppend:](v21, "matchOverride:shouldAppend:", v36, &v52);
              v37 = (__CFString *)objc_claimAutoreleasedReturnValue();
              if (-[__CFString count](v37, "count"))
              {
                v38 = v52;
                v39 = CDMLogContext;
                v40 = os_log_type_enabled((os_log_t)CDMLogContext, OS_LOG_TYPE_DEBUG);
                if (v38)
                {
                  if (v40)
                  {
                    buf = 136315650;
                    v65 = "-[CDMOverridesProtoService handle:]";
                    v66 = 2112;
                    v67 = CFSTR("overrides");
                    v68 = 2112;
                    v69 = v37;
                    _os_log_debug_impl(&dword_21A2A0000, v39, OS_LOG_TYPE_DEBUG, "%s [insights-cdm-%@]:\nMatched override(s) to append: %@", (uint8_t *)&buf, 0x20u);
                  }
                  v41 = [CDMOverridesProtoResponseCommand alloc];
                  v42 = -[CDMOverridesProtoResponseCommand initWithParsesForReplacement:parsesForAppending:](v41, "initWithParsesForReplacement:parsesForAppending:", MEMORY[0x24BDBD1A8], v37);
                }
                else
                {
                  if (v40)
                  {
                    buf = 136315650;
                    v65 = "-[CDMOverridesProtoService handle:]";
                    v66 = 2112;
                    v67 = CFSTR("overrides");
                    v68 = 2112;
                    v69 = v37;
                    _os_log_debug_impl(&dword_21A2A0000, v39, OS_LOG_TYPE_DEBUG, "%s [insights-cdm-%@]:\nMatched override: %@", (uint8_t *)&buf, 0x20u);
                  }
                  v49 = [CDMOverridesProtoResponseCommand alloc];
                  v42 = -[CDMOverridesProtoResponseCommand initWithParsesForReplacement:parsesForAppending:](v49, "initWithParsesForReplacement:parsesForAppending:", v37, MEMORY[0x24BDBD1A8]);
                }
              }
              else
              {
                v47 = CDMLogContext;
                if (os_log_type_enabled((os_log_t)CDMLogContext, OS_LOG_TYPE_DEBUG))
                {
                  buf = 136315394;
                  v65 = "-[CDMOverridesProtoService handle:]";
                  v66 = 2112;
                  v67 = CFSTR("overrides");
                  _os_log_debug_impl(&dword_21A2A0000, v47, OS_LOG_TYPE_DEBUG, "%s [insights-cdm-%@]:\nNo overrides were matched to the request.", (uint8_t *)&buf, 0x16u);
                }
                v48 = [CDMOverridesProtoResponseCommand alloc];
                v42 = -[CDMOverridesProtoResponseCommand initWithParsesForReplacement:parsesForAppending:](v48, "initWithParsesForReplacement:parsesForAppending:", MEMORY[0x24BDBD1A8], MEMORY[0x24BDBD1A8]);
              }
              v19 = (CDMOverridesProtoResponseCommand *)v42;

LABEL_39:
              objc_sync_exit(v21);
              goto LABEL_25;
            }
          }
          else
          {

          }
        }
        v43 = CDMLogContext;
        if (os_log_type_enabled((os_log_t)CDMLogContext, OS_LOG_TYPE_ERROR))
        {
          buf = 136315650;
          v65 = "-[CDMOverridesProtoService handle:]";
          v66 = 2112;
          v67 = CFSTR("overrides");
          v68 = 2112;
          v69 = CFSTR("Language code is not set; unable to perform override lookup.");
          _os_log_error_impl(&dword_21A2A0000, v43, OS_LOG_TYPE_ERROR, "%s [ERR]: [insights-cdm-%@]:\nOverrides skipped request: %@", (uint8_t *)&buf, 0x20u);
        }
        v19 = objc_alloc_init(CDMOverridesProtoResponseCommand);
        v44 = (void *)MEMORY[0x24BDD1540];
        -[CDMBaseService serviceName](v21, "serviceName");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v57 = *MEMORY[0x24BDD0FC8];
        v58 = CFSTR("Language code is not set; unable to perform override lookup.");
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v58, &v57, 1);
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "errorWithDomain:code:userInfo:", v36, 3, v45);
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        -[CDMBaseCommand setCmdError:](v19, "setCmdError:", v46);

        goto LABEL_39;
      }
    }
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v53, v61, 16);
    if (v15)
      continue;
    break;
  }
LABEL_15:

  v18 = CDMLogContext;
  if (os_log_type_enabled((os_log_t)CDMLogContext, OS_LOG_TYPE_INFO))
  {
    buf = 136315650;
    v65 = "-[CDMOverridesProtoService handle:]";
    v66 = 2112;
    v67 = CFSTR("overrides");
    v68 = 2112;
    v69 = CFSTR("All tokens found contained only whitespace; ignoring command.");
    _os_log_impl(&dword_21A2A0000, v18, OS_LOG_TYPE_INFO, "%s [WARN]: [insights-cdm-%@]:\nOverrides skipped request: %@", (uint8_t *)&buf, 0x20u);
  }
  v19 = objc_alloc_init(CDMOverridesProtoResponseCommand);
  v20 = (void *)MEMORY[0x24BDD1540];
  -[CDMBaseService serviceName](self, "serviceName");
  v21 = (CDMOverridesProtoService *)objc_claimAutoreleasedReturnValue();
  v59 = *MEMORY[0x24BDD0FC8];
  v60 = CFSTR("All tokens found contained only whitespace; ignoring command.");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v60, &v59, 1);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "errorWithDomain:code:userInfo:", v21, 3, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[CDMBaseCommand setCmdError:](v19, "setCmdError:", v23);

LABEL_25:
LABEL_26:

  return v19;
}

- (void)dealloc
{
  objc_super v3;

  objc_msgSend(MEMORY[0x24BE9C108], "clearCache");
  v3.receiver = self;
  v3.super_class = (Class)CDMOverridesProtoService;
  -[CDMOverridesProtoService dealloc](&v3, sel_dealloc);
}

- (id)buildOverridesTurnInputAndPreprocessing
{
  void *v2;
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEA0]), "initWithLocaleIdentifier:", CFSTR("en_US"));
  v3 = objc_alloc_init(MEMORY[0x24BE9E078]);
  objc_msgSend(v3, "setUtterance:", CFSTR("HelloWorld"));
  objc_msgSend(v3, "setProbability:", 1.0);
  v4 = (void *)MEMORY[0x24BE9E320];
  v5 = objc_alloc_init(MEMORY[0x24BDD1880]);
  objc_msgSend(v4, "convertFromUUID:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setIdA:", v6);

  v7 = objc_alloc_init(MEMORY[0x24BE9E2F8]);
  objc_msgSend(v7, "setValue:", CFSTR("HelloWorld"));
  objc_msgSend(v7, "setBegin:", 0);
  objc_msgSend(v7, "setEnd:", 10);
  objc_msgSend(v7, "setIsSignificant:", 1);
  objc_msgSend(v7, "setIsWhitespace:", 0);
  objc_msgSend(v7, "setCleanValue:", CFSTR("HelloWorld"));
  objc_msgSend(v7, "setTokenIndex:", 0);
  objc_msgSend(v7, "setNonWhitespaceTokenIndex:", 0);
  v8 = objc_alloc_init(MEMORY[0x24BE9E300]);
  objc_msgSend(v2, "localeIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setLocale:", v9);

  objc_msgSend(v8, "setStringValue:", CFSTR("HelloWorld"));
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithObjects:", v7, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTokens:", v10);

  v11 = objc_alloc_init(MEMORY[0x24BE9E148]);
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithObjects:", v3, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setAsrOutputs:", v12);

  objc_msgSend(v2, "localeIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setLocale:", v13);

  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", 1);
  v15 = objc_alloc_init(MEMORY[0x24BE9E260]);
  objc_msgSend(v15, "setUtterance:", CFSTR("HelloWorld"));
  objc_msgSend(v15, "setTokenChain:", v8);
  objc_msgSend(v15, "setTurnInput:", v11);
  objc_msgSend(v14, "addObject:", v15);

  return v14;
}

- (id)matchOverride:(id)a3 shouldAppend:(BOOL *)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a3;
  -[CDMOverridesProtoService store](self, "store");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "matchWithInputs:shouldAppend:", v6, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (SiriNLUOverrideProxy)store
{
  return self->__store;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__store, 0);
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
  v6 = CFSTR("nlv4_overrides");
  v7 = CFSTR("com.apple.siri.nl.overrides");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v6, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v3;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CDMServiceAssetConfig addCDMFactorToFoldersMapping:forAssetSet:](v2, "addCDMFactorToFoldersMapping:forAssetSet:", v4, 1);

  return v2;
}

@end
