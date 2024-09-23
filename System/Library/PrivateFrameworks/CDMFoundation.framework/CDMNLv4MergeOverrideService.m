@implementation CDMNLv4MergeOverrideService

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
  return 1;
}

- (id)setup:(id)a3
{
  id v4;
  NSObject *v5;
  _BOOL4 v6;
  __CFString *v7;
  __CFString *v8;
  os_signpost_id_t v9;
  NSObject *v10;
  NSObject *v11;
  unint64_t v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _BOOL4 v19;
  NSObject *v20;
  NSObject *v21;
  NSObject *v22;
  NSObject *v23;
  uint64_t v24;
  NSObject *v25;
  NSObject *v26;
  void *v27;
  NSObject *v28;
  NSObject *v29;
  NSObject *v30;
  NSObject *v31;
  NSObject *v32;
  __CFString *v34;
  uint8_t buf[4];
  const char *v36;
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  CDMOSLoggerForCategory(0);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    v36 = "-[CDMNLv4MergeOverrideService setup:]";
    _os_log_debug_impl(&dword_21A2A0000, v5, OS_LOG_TYPE_DEBUG, "%s Beginning setup of new instance of NLv4 Service Overrides service", buf, 0xCu);
  }

  v6 = -[CDMNLv4MergeOverrideService isOverrideServiceEnabled](self, "isOverrideServiceEnabled");
  v7 = CFSTR("disabled");
  if (v6)
    v7 = CFSTR("enabled");
  v8 = v7;
  v9 = os_signpost_id_generate((os_log_t)CDMLogContext);
  v10 = (id)CDMLogContext;
  v11 = v10;
  v12 = v9 - 1;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_DWORD *)buf = 138412290;
    v36 = (const char *)v8;
    _os_signpost_emit_with_name_impl(&dword_21A2A0000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v9, "NLv4MergeOverride", "setupNLv4MergeOverrideService: %@", buf, 0xCu);
  }

  if (v6)
  {
    CDMOSLoggerForCategory(0);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v36 = "-[CDMNLv4MergeOverrideService setup:]";
      _os_log_impl(&dword_21A2A0000, v13, OS_LOG_TYPE_INFO, "%s The NLv4 Overrides service is enabled", buf, 0xCu);
    }

    objc_msgSend(v4, "dynamicConfig");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "getAssetBundlePathForFactorName:", CFSTR("com.apple.siri.nl.nlv4"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v15)
    {
      v25 = (id)CDMLogContext;
      v26 = v25;
      if (v12 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v25))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_21A2A0000, v26, OS_SIGNPOST_INTERVAL_END, v9, "NLv4MergeOverride", ", buf, 2u);
      }

      -[CDMNLv4MergeOverrideService setupFailedFor:](self, "setupFailedFor:", CFSTR("Unable to locate NSBundle of requisite file assets to handle requests"));
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_40;
    }
    if (+[CDMFeatureFlags isTrieOverridesEnabled](CDMFeatureFlags, "isTrieOverridesEnabled"))
    {
      objc_msgSend(v15, "resourcePath");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "stringByAppendingPathComponent:", CFSTR("trie_bundle"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v18, "fileExistsAtPath:", v17))
      {
        v34 = v8;
        v19 = -[CDMNLv4MergeOverrideService InitializeNLv4OverrideStore:](self, "InitializeNLv4OverrideStore:", v17);
        CDMOSLoggerForCategory(0);
        v20 = objc_claimAutoreleasedReturnValue();
        v21 = v20;
        if (v19)
        {
          if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 136315138;
            v36 = "-[CDMNLv4MergeOverrideService setup:]";
            _os_log_impl(&dword_21A2A0000, v21, OS_LOG_TYPE_INFO, "%s Trie Overrides: Loaded NLv4 overrides bundle", buf, 0xCu);
          }

          v22 = (id)CDMLogContext;
          v23 = v22;
          v8 = v34;
          if (v12 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v22))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl(&dword_21A2A0000, v23, OS_SIGNPOST_INTERVAL_END, v9, "NLv4MergeOverride", ", buf, 2u);
          }

          -[CDMNLv4MergeOverrideService setupSucceeded](self, "setupSucceeded");
          v24 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
          if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315138;
            v36 = "-[CDMNLv4MergeOverrideService setup:]";
            _os_log_error_impl(&dword_21A2A0000, v21, OS_LOG_TYPE_ERROR, "%s [ERR]: Trie Overrides: Failed to load NLv4 overrides bundle", buf, 0xCu);
          }

          v31 = (id)CDMLogContext;
          v32 = v31;
          v8 = v34;
          if (v12 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v31))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl(&dword_21A2A0000, v32, OS_SIGNPOST_INTERVAL_END, v9, "NLv4MergeOverride", ", buf, 2u);
          }

          -[CDMNLv4MergeOverrideService setupFailedFor:](self, "setupFailedFor:", CFSTR("Failed to load NLv4 overrides bundle. See CDM Logs for details"));
          v24 = objc_claimAutoreleasedReturnValue();
        }
        v27 = (void *)v24;

LABEL_40:
        goto LABEL_41;
      }
      CDMOSLoggerForCategory(0);
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        v36 = "-[CDMNLv4MergeOverrideService setup:]";
        _os_log_impl(&dword_21A2A0000, v28, OS_LOG_TYPE_INFO, "%s [WARN]: NLv4 Overrides Enabled! There is no NLv4 overrides trie asset folder. Setting up CDM anyways", buf, 0xCu);
      }

    }
  }
  v29 = (id)CDMLogContext;
  v30 = v29;
  if (v12 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v29))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_21A2A0000, v30, OS_SIGNPOST_INTERVAL_END, v9, "NLv4MergeOverride", ", buf, 2u);
  }

  -[CDMNLv4MergeOverrideService setupSucceeded](self, "setupSucceeded");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_41:

  return v27;
}

- (BOOL)InitializeNLv4OverrideStore:(id)a3
{
  id v4;
  NSObject *v5;
  SiriNLUOverrideProxy *v6;
  SiriNLUOverrideProxy *store;
  _BOOL4 v8;
  NSObject *v9;
  NSObject *v10;
  int v12;
  const char *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  CDMOSLoggerForCategory(0);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v12 = 136315394;
    v13 = "-[CDMNLv4MergeOverrideService InitializeNLv4OverrideStore:]";
    v14 = 2112;
    v15 = v4;
    _os_log_impl(&dword_21A2A0000, v5, OS_LOG_TYPE_INFO, "%s Overrides Trie asset bundle is:%@", (uint8_t *)&v12, 0x16u);
  }

  v6 = -[SiriNLUOverrideProxy initWithUseTrie:useMemory:]([SiriNLUOverrideProxy alloc], "initWithUseTrie:useMemory:", 1, 0);
  store = self->_store;
  self->_store = v6;

  v8 = -[SiriNLUOverrideProxy loadComponentOverrideTrieStoreWithTrieFilePath:](self->_store, "loadComponentOverrideTrieStoreWithTrieFilePath:", v4);
  CDMOSLoggerForCategory(0);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v8)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v12 = 136315138;
      v13 = "-[CDMNLv4MergeOverrideService InitializeNLv4OverrideStore:]";
      _os_log_impl(&dword_21A2A0000, v10, OS_LOG_TYPE_INFO, "%s NLv4 Overrides store successfully initialized", (uint8_t *)&v12, 0xCu);
    }
  }
  else if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    v12 = 136315138;
    v13 = "-[CDMNLv4MergeOverrideService InitializeNLv4OverrideStore:]";
    _os_log_error_impl(&dword_21A2A0000, v10, OS_LOG_TYPE_ERROR, "%s [ERR]: NLv4 Overrides store unable to initialize", (uint8_t *)&v12, 0xCu);
  }

  return v8;
}

- (id)handle:(id)a3
{
  id v4;
  _BOOL4 v5;
  __CFString *v6;
  __CFString *v7;
  os_signpost_id_t v8;
  NSObject *v9;
  NSObject *v10;
  unint64_t v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  NSObject *v17;
  CDMOverridesProtoResponseCommand *v18;
  void *v19;
  void *v20;
  CDMOverridesProtoResponseCommand *v21;
  NSObject *v22;
  void *v24;
  uint8_t buf[4];
  __CFString *v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = -[CDMNLv4MergeOverrideService isOverrideServiceEnabled](self, "isOverrideServiceEnabled");
  v6 = CFSTR("disabled");
  if (v5)
    v6 = CFSTR("enabled");
  v7 = v6;
  v8 = os_signpost_id_generate((os_log_t)CDMLogContext);
  v9 = (id)CDMLogContext;
  v10 = v9;
  v11 = v8 - 1;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_DWORD *)buf = 138412290;
    v26 = v7;
    _os_signpost_emit_with_name_impl(&dword_21A2A0000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v8, "NLv4MergeOverride", "invokeNLv4MergeOverrideService: %@", buf, 0xCu);
  }

  if (v5 && self->_store)
  {
    objc_msgSend(v4, "request");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "inputs");
    v13 = objc_claimAutoreleasedReturnValue();

    -[SiriNLUOverrideProxy matchWithInputs:overrideNamespace:](self->_store, "matchWithInputs:overrideNamespace:", v13, 5);
    v14 = objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      v15 = (void *)v14;
      v16 = (id)CDMLogContext;
      v17 = v16;
      if (v11 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_21A2A0000, v17, OS_SIGNPOST_INTERVAL_END, v8, "NLv4MergeOverride", ", buf, 2u);
      }

      v18 = [CDMOverridesProtoResponseCommand alloc];
      objc_msgSend(v15, "userParse");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = v19;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v24, 1);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = -[CDMOverridesProtoResponseCommand initWithParsesForReplacement:parsesForAppending:](v18, "initWithParsesForReplacement:parsesForAppending:", v20, MEMORY[0x24BDBD1A8]);

      goto LABEL_18;
    }

  }
  v22 = (id)CDMLogContext;
  v13 = v22;
  if (v11 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v22))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_21A2A0000, v13, OS_SIGNPOST_INTERVAL_END, v8, "NLv4MergeOverride", ", buf, 2u);
  }
  v21 = 0;
LABEL_18:

  return v21;
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
    v6 = "-[CDMNLv4MergeOverrideService setupSucceeded]";
    _os_log_impl(&dword_21A2A0000, v3, OS_LOG_TYPE_INFO, "%s NLv4 Overrides service has been setup successfully!", (uint8_t *)&v5, 0xCu);
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
    v10 = "-[CDMNLv4MergeOverrideService setupFailedFor:]";
    v11 = 2112;
    v12 = v4;
    _os_log_error_impl(&dword_21A2A0000, v5, OS_LOG_TYPE_ERROR, "%s [ERR]: NLv4 Overrides service failed to setup: %@", (uint8_t *)&v9, 0x16u);
  }

  self->super.super._serviceState = 3;
  -[CDMBaseService createSetupResponseCommand](self, "createSetupResponseCommand");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CDMBaseService createErrorWithCode:description:](self, "createErrorWithCode:description:", 0, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setCmdError:", v7);

  return v6;
}

- (BOOL)isOverrideServiceEnabled
{
  return +[CDMFeatureFlags isNLv4ServiceOverridesEnabled](CDMFeatureFlags, "isNLv4ServiceOverridesEnabled");
}

- (SiriNLUOverrideProxy)store
{
  return self->_store;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_store, 0);
}

@end
