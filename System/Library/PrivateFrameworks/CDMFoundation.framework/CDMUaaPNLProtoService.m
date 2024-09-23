@implementation CDMUaaPNLProtoService

- (id)handleRequestCommandTypeNames
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDBCF20];
  +[CDMBaseCommand commandName](CDMUaaPNLProtoRequestCommand, "commandName");
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
  return +[CDMFeatureFlags isUaaPEnabled](CDMFeatureFlags, "isUaaPEnabled");
}

- (int)getOverrideNamespace
{
  return 0;
}

- (id)setup:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  NSObject *v14;
  UPModelBundle *v15;
  UPModelBundle *coreModelBundle;
  UPModelBundle *v17;
  NSObject *v18;
  NSObject *v19;
  CDMUaaPNLModelProvider *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  NSObject *v25;
  NSSet *appModelBundles;
  NSSet *v27;
  NSSet *v28;
  NSUInteger v29;
  NSObject *v30;
  NSUInteger v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  NSObject *v36;
  void *v37;
  NSSet *v38;
  const char *v39;
  id v41;
  id v42;
  id v43;
  id v44;
  id v45;
  id v46;
  uint8_t buf[4];
  const char *v48;
  __int16 v49;
  NSUInteger v50;
  uint64_t v51;

  v51 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  self->super.super._serviceState = 2;
  objc_msgSend(v4, "dynamicConfig");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "getAssetBundlePathForFactorName:", CFSTR("com.apple.siri.nl.uaap.ssu"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "bundlePath");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend((id)objc_opt_class(), "isEnabled") & 1) != 0)
  {
    CDMOSLoggerForCategory(0);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315138;
      v48 = "-[CDMUaaPNLProtoService setup:]";
      _os_log_debug_impl(&dword_21A2A0000, v8, OS_LOG_TYPE_DEBUG, "%s Fetching core model configuration", buf, 0xCu);
    }

    objc_msgSend(v4, "dynamicConfig");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "languageCode");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = 0;
    +[CDMUaaPNLModelProvider getCoreModelConfigurationForLocale:bundlePath:error:](CDMUaaPNLModelProvider, "getCoreModelConfigurationForLocale:bundlePath:error:", v10, v7, &v46);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v46;

    CDMOSLoggerForCategory(0);
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (!v11)
    {
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v12, "localizedDescription");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136315394;
        v48 = "-[CDMUaaPNLProtoService setup:]";
        v49 = 2112;
        v50 = (NSUInteger)v33;
        _os_log_impl(&dword_21A2A0000, v14, OS_LOG_TYPE_INFO, "%s [WARN]: Failed to fetch core model configuration: %@", buf, 0x16u);

      }
      -[CDMBaseService createSetupResponseCommand](self, "createSetupResponseCommand");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_34;
    }
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315138;
      v48 = "-[CDMUaaPNLProtoService setup:]";
      _os_log_debug_impl(&dword_21A2A0000, v14, OS_LOG_TYPE_DEBUG, "%s Loading core model bundle", buf, 0xCu);
    }

    v45 = 0;
    +[CDMUaaPNLProtoService loadModelBundle:error:](CDMUaaPNLProtoService, "loadModelBundle:error:", v11, &v45);
    v15 = (UPModelBundle *)objc_claimAutoreleasedReturnValue();
    v43 = v45;
    coreModelBundle = self->__coreModelBundle;
    self->__coreModelBundle = v15;

    v17 = self->__coreModelBundle;
    CDMOSLoggerForCategory(0);
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = v18;
    if (!v17)
    {
      v34 = v43;
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v43, "localizedDescription");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136315394;
        v48 = "-[CDMUaaPNLProtoService setup:]";
        v49 = 2112;
        v50 = (NSUInteger)v35;
        _os_log_impl(&dword_21A2A0000, v19, OS_LOG_TYPE_INFO, "%s [WARN]: Failed to load core model bundle: %@", buf, 0x16u);

      }
      -[CDMBaseService createSetupResponseCommand](self, "createSetupResponseCommand");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_33;
    }
    v41 = v12;
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315138;
      v48 = "-[CDMUaaPNLProtoService setup:]";
      _os_log_debug_impl(&dword_21A2A0000, v19, OS_LOG_TYPE_DEBUG, "%s Fetching app model configurations", buf, 0xCu);
    }

    v20 = objc_alloc_init(CDMUaaPNLModelProvider);
    objc_msgSend(v4, "dynamicConfig");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "languageCode");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = 0;
    -[CDMUaaPNLModelProvider getModelConfigsForLocale:error:](v20, "getModelConfigsForLocale:error:", v22, &v44);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = v44;

    if (!v23)
    {
      CDMOSLoggerForCategory(0);
      v36 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v42, "localizedDescription");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136315394;
        v48 = "-[CDMUaaPNLProtoService setup:]";
        v49 = 2112;
        v50 = (NSUInteger)v37;
        _os_log_impl(&dword_21A2A0000, v36, OS_LOG_TYPE_INFO, "%s [WARN]: Failed to fetch any app configuration (are any UaaP-enabled apps present?): %@", buf, 0x16u);

      }
      objc_msgSend(MEMORY[0x24BDBCF20], "set");
      v38 = (NSSet *)objc_claimAutoreleasedReturnValue();
      appModelBundles = self->__appModelBundles;
      self->__appModelBundles = v38;
      goto LABEL_32;
    }
    v24 = objc_msgSend(v23, "count");
    CDMOSLoggerForCategory(0);
    v25 = objc_claimAutoreleasedReturnValue();
    appModelBundles = (NSSet *)v25;
    if (v24)
    {
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315138;
        v48 = "-[CDMUaaPNLProtoService setup:]";
        _os_log_debug_impl(&dword_21A2A0000, &appModelBundles->super, OS_LOG_TYPE_DEBUG, "%s Loading app model bundles", buf, 0xCu);
      }

      +[CDMUaaPNLProtoService loadAppModelBundles:](CDMUaaPNLProtoService, "loadAppModelBundles:", v23);
      v27 = (NSSet *)objc_claimAutoreleasedReturnValue();
      v28 = self->__appModelBundles;
      self->__appModelBundles = v27;

      v29 = -[NSSet count](self->__appModelBundles, "count");
      CDMOSLoggerForCategory(0);
      v30 = objc_claimAutoreleasedReturnValue();
      appModelBundles = (NSSet *)v30;
      if (v29)
      {
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
        {
          v31 = -[NSSet count](self->__appModelBundles, "count");
          *(_DWORD *)buf = 136315394;
          v48 = "-[CDMUaaPNLProtoService setup:]";
          v49 = 2048;
          v50 = v31;
          _os_log_debug_impl(&dword_21A2A0000, &appModelBundles->super, OS_LOG_TYPE_DEBUG, "%s Loaded %lu app model bundles", buf, 0x16u);
        }
        goto LABEL_32;
      }
      if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        v48 = "-[CDMUaaPNLProtoService setup:]";
        v39 = "%s [WARN]: Failed to load any app model bundles (despite having configurations)";
        goto LABEL_31;
      }
    }
    else if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v48 = "-[CDMUaaPNLProtoService setup:]";
      v39 = "%s [WARN]: getModelConfigsForLocale returned an unexpected empty set";
LABEL_31:
      _os_log_impl(&dword_21A2A0000, &appModelBundles->super, OS_LOG_TYPE_INFO, v39, buf, 0xCu);
    }
LABEL_32:
    v34 = v43;

    -[CDMBaseService createSetupResponseCommand](self, "createSetupResponseCommand");
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = v41;
LABEL_33:

LABEL_34:
    goto LABEL_35;
  }
  self->super.super._serviceState = 4;
  -[CDMBaseService createSetupResponseCommand](self, "createSetupResponseCommand");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_35:

  return v32;
}

- (id)handle:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  CDMUaaPNLProtoResponseCommand *v22;
  NSObject *v23;
  int64_t serviceState;
  NSObject *v25;
  void *v26;
  id v27;
  NSObject *v29;
  void *v30;
  NSObject *v31;
  void *v32;
  id v33;
  uint8_t buf[4];
  const char *v35;
  __int16 v36;
  int64_t v37;
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  CDMOSLoggerForCategory(0);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v35 = "-[CDMUaaPNLProtoService handle:]";
    _os_log_impl(&dword_21A2A0000, v5, OS_LOG_TYPE_INFO, "%s Calling UAAP Inference", buf, 0xCu);
  }

  if (self->super.super._serviceState == 2)
  {
    objc_msgSend(v4, "parserRequest");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "tokenChain");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    CDMOSLoggerForCategory(0);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v7, "stringValue");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      v35 = "-[CDMUaaPNLProtoService handle:]";
      v36 = 2112;
      v37 = (int64_t)v30;
      _os_log_debug_impl(&dword_21A2A0000, v8, OS_LOG_TYPE_DEBUG, "%s Handling UaaP request for utterance: %@", buf, 0x16u);

    }
    objc_msgSend(v4, "parserRequest");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "hasTokenChain");

    if ((v10 & 1) != 0)
    {
      +[CDMUaaPNLModelBundleFilter selectModelBundlesForLoadedAppModelBundles:](CDMUaaPNLModelBundleFilter, "selectModelBundlesForLoadedAppModelBundles:", self->__appModelBundles);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v11;
      if (v11 && objc_msgSend(v11, "count"))
      {
        v13 = objc_alloc(MEMORY[0x24BE9E420]);
        -[UPModelBundle parserModel](self->__coreModelBundle, "parserModel");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = (id)objc_msgSend(v13, "initWithCoreModel:domainModelBundles:", v14, v12);

        objc_msgSend(v4, "parserRequest");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = 0;
        objc_msgSend(v15, "predictionFromProtobufQuery:error:", v16, &v33);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = v33;

        if (v17)
        {
          if (objc_msgSend(v17, "hypothesesCount"))
          {
            objc_msgSend(v17, "hypotheses");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v20 = objc_alloc_init(MEMORY[0x24BE9E088]);
            objc_msgSend(v4, "requestId");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "setRequestId:", v21);

            objc_msgSend(v20, "setParses:", v19);
            v22 = -[CDMUaaPNLProtoResponseCommand initWithParserResponse:nluResponse:]([CDMUaaPNLProtoResponseCommand alloc], "initWithParserResponse:nluResponse:", v17, v20);

          }
          else
          {
            CDMOSLoggerForCategory(0);
            v31 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
            {
              objc_msgSend(v18, "localizedDescription");
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 136315394;
              v35 = "-[CDMUaaPNLProtoService handle:]";
              v36 = 2112;
              v37 = (int64_t)v32;
              _os_log_impl(&dword_21A2A0000, v31, OS_LOG_TYPE_INFO, "%s [WARN]: UaaP provided no candidate parses: %@", buf, 0x16u);

            }
            +[CDMUaaPNLProtoService createErrorResponse:](CDMUaaPNLProtoService, "createErrorResponse:", v18);
            v22 = (CDMUaaPNLProtoResponseCommand *)objc_claimAutoreleasedReturnValue();

          }
        }
        else
        {
          CDMOSLoggerForCategory(0);
          v29 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 136315138;
            v35 = "-[CDMUaaPNLProtoService handle:]";
            _os_log_impl(&dword_21A2A0000, v29, OS_LOG_TYPE_INFO, "%s [WARN]: Received no UaaP result", buf, 0xCu);
          }

          +[CDMUaaPNLProtoService createErrorResponse:](CDMUaaPNLProtoService, "createErrorResponse:", v18);
          v22 = (CDMUaaPNLProtoResponseCommand *)objc_claimAutoreleasedReturnValue();

        }
      }
      else
      {
        v15 = objc_alloc_init(MEMORY[0x24BE9E088]);
        objc_msgSend(v4, "requestId");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "setRequestId:", v26);

        v27 = objc_alloc_init(MEMORY[0x24BE9E310]);
        v22 = -[CDMUaaPNLProtoResponseCommand initWithParserResponse:nluResponse:]([CDMUaaPNLProtoResponseCommand alloc], "initWithParserResponse:nluResponse:", v27, v15);

      }
    }
    else
    {
      CDMOSLoggerForCategory(0);
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        v35 = "-[CDMUaaPNLProtoService handle:]";
        _os_log_impl(&dword_21A2A0000, v25, OS_LOG_TYPE_INFO, "%s [WARN]: CDM tokens empty", buf, 0xCu);
      }

      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("UaaPNLProtobufServiceError"), 0, 0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      +[CDMUaaPNLProtoService createErrorResponse:](CDMUaaPNLProtoService, "createErrorResponse:", v12);
      v22 = (CDMUaaPNLProtoResponseCommand *)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    CDMOSLoggerForCategory(0);
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      serviceState = self->super.super._serviceState;
      *(_DWORD *)buf = 136315394;
      v35 = "-[CDMUaaPNLProtoService handle:]";
      v36 = 2048;
      v37 = serviceState;
      _os_log_impl(&dword_21A2A0000, v23, OS_LOG_TYPE_INFO, "%s Not Ready! State: %tu", buf, 0x16u);
    }

    -[CDMBaseService createErrorWithCode:description:](self, "createErrorWithCode:description:", 1, CFSTR("UaaP service is not ready"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[CDMUaaPNLProtoService createErrorResponse:](CDMUaaPNLProtoService, "createErrorResponse:", v7);
    v22 = (CDMUaaPNLProtoResponseCommand *)objc_claimAutoreleasedReturnValue();
  }

  return v22;
}

- (void)loadOverrides:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  char v11;
  NSObject *v12;
  void *v13;
  id v14;
  NSObject *v15;
  int v16;
  const char *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = (void *)MEMORY[0x24BDD1580];
  v5 = a3;
  objc_msgSend(v4, "defaultManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:relativeToURL:", CFSTR("overrides.pb"), v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
    goto LABEL_8;
  objc_msgSend(v7, "path");
  v8 = objc_claimAutoreleasedReturnValue();
  if (!v8)
    goto LABEL_8;
  v9 = (void *)v8;
  objc_msgSend(v7, "path");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v6, "fileExistsAtPath:", v10);

  if ((v11 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDBCE50], "dataWithContentsOfURL:", v7);
    v12 = objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE7AEF8]), "initWithData:", v12);
      v14 = objc_alloc_init(MEMORY[0x24BE9E268]);
      objc_msgSend(v14, "readFrom:", v13);
      -[CDMUaaPNLProtoService addOverride:](self, "addOverride:", v14);
      CDMOSLoggerForCategory(0);
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        v16 = 136315394;
        v17 = "-[CDMUaaPNLProtoService loadOverrides:]";
        v18 = 2112;
        v19 = v7;
        _os_log_impl(&dword_21A2A0000, v15, OS_LOG_TYPE_INFO, "%s UaaP added override from pb file: %@", (uint8_t *)&v16, 0x16u);
      }

    }
  }
  else
  {
LABEL_8:
    CDMOSLoggerForCategory(0);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      v16 = 136315138;
      v17 = "-[CDMUaaPNLProtoService loadOverrides:]";
      _os_log_impl(&dword_21A2A0000, v12, OS_LOG_TYPE_INFO, "%s UaaP component override file is missing", (uint8_t *)&v16, 0xCu);
    }
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__appModelBundles, 0);
  objc_storeStrong((id *)&self->__coreModelBundle, 0);
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
  v6 = CFSTR("uaap/ssu");
  v7 = CFSTR("com.apple.siri.nl.uaap.ssu");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v6, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v3;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CDMServiceAssetConfig addCDMFactorToFoldersMapping:forAssetSet:](v2, "addCDMFactorToFoldersMapping:forAssetSet:", v4, 0);

  -[CDMServiceAssetConfig setIsAssetRequiredForSetup:](v2, "setIsAssetRequiredForSetup:", 0);
  return v2;
}

+ (id)loadAppModelBundles:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  __int128 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  NSObject *v14;
  void *v15;
  __int128 v17;
  id v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t buf[4];
  const char *v24;
  __int16 v25;
  void *v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
  if (v6)
  {
    v8 = v6;
    v9 = *(_QWORD *)v20;
    *(_QWORD *)&v7 = 136315394;
    v17 = v7;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v20 != v9)
          objc_enumerationMutation(v5);
        v11 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v10);
        v18 = 0;
        +[CDMUaaPNLProtoService loadModelBundle:error:](CDMUaaPNLProtoService, "loadModelBundle:error:", v11, &v18, v17);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = v18;
        if (v12)
        {
          objc_msgSend(v4, "addObject:", v12);
        }
        else
        {
          CDMOSLoggerForCategory(0);
          v14 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
          {
            objc_msgSend(v13, "localizedDescription");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = v17;
            v24 = "+[CDMUaaPNLProtoService loadAppModelBundles:]";
            v25 = 2112;
            v26 = v15;
            _os_log_impl(&dword_21A2A0000, v14, OS_LOG_TYPE_INFO, "%s [WARN]: Error initializing model bundle: %@. Skipping.", buf, 0x16u);

          }
        }

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
    }
    while (v8);
  }

  return v4;
}

+ (id)detectForegroundAppForLocale:(id)a3
{
  id v3;
  CDMUaaPNLModelProvider *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;
  void *v13;
  id v14;
  id v15;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = objc_alloc_init(CDMUaaPNLModelProvider);
  v15 = 0;
  -[CDMUaaPNLModelProvider getForegroundModelConfigForLocale:error:](v4, "getForegroundModelConfigForLocale:error:", v3, &v15);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = v15;
  if (v5)
  {
    v14 = v6;
    +[CDMUaaPNLProtoService loadModelBundle:error:](CDMUaaPNLProtoService, "loadModelBundle:error:", v5, &v14);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v14;

    if (v7)
    {
      v9 = v7;
      v10 = v9;
    }
    else
    {
      CDMOSLoggerForCategory(0);
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(v8, "description");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136315394;
        v17 = "+[CDMUaaPNLProtoService detectForegroundAppForLocale:]";
        v18 = 2112;
        v19 = v13;
        _os_log_debug_impl(&dword_21A2A0000, v11, OS_LOG_TYPE_DEBUG, "%s Failed to create foreground UaaP parser model %@", buf, 0x16u);

      }
      v9 = 0;
      v10 = 0;
    }
  }
  else
  {
    CDMOSLoggerForCategory(0);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315138;
      v17 = "+[CDMUaaPNLProtoService detectForegroundAppForLocale:]";
      _os_log_debug_impl(&dword_21A2A0000, v9, OS_LOG_TYPE_DEBUG, "%s Failed to find foreground app model configuration", buf, 0xCu);
    }
    v10 = 0;
    v8 = v6;
  }

  return v10;
}

+ (id)createErrorResponse:(id)a3
{
  id v3;
  CDMUaaPNLProtoResponseCommand *v4;

  v3 = a3;
  v4 = objc_alloc_init(CDMUaaPNLProtoResponseCommand);
  -[CDMBaseCommand setCmdError:](v4, "setCmdError:", v3);

  return v4;
}

+ (id)loadModelBundle:(id)a3 error:(id *)a4
{
  objc_class *v5;
  id v6;
  void *v7;
  void *v8;
  int v9;
  NSObject *v10;
  _BOOL4 v11;
  void *v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  void *v17;
  NSObject *v18;
  int v20;
  const char *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v5 = (objc_class *)MEMORY[0x24BE9E400];
  v6 = a3;
  v7 = (void *)objc_msgSend([v5 alloc], "initWithModelConfiguration:", v6);

  if (v7)
  {
    objc_msgSend(MEMORY[0x24BE9E418], "modelWithLoadedModelConfiguration:error:", v7, a4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v9 = objc_msgSend(v7, "hasCalibrationModel");
      CDMOSLoggerForCategory(0);
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG);
      if (v9)
      {
        if (v11)
        {
          v20 = 136315138;
          v21 = "+[CDMUaaPNLProtoService loadModelBundle:error:]";
          _os_log_debug_impl(&dword_21A2A0000, v10, OS_LOG_TYPE_DEBUG, "%s Found calibration model in configuration: loading it", (uint8_t *)&v20, 0xCu);
        }

        objc_msgSend(MEMORY[0x24BE9E3E8], "modelWithLoadedModelConfiguration:error:", v7, a4);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v12)
        {
          CDMOSLoggerForCategory(0);
          v13 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
          {
            v20 = 136315138;
            v21 = "+[CDMUaaPNLProtoService loadModelBundle:error:]";
            _os_log_impl(&dword_21A2A0000, v13, OS_LOG_TYPE_INFO, "%s [WARN]: Failed to load calibration model", (uint8_t *)&v20, 0xCu);
          }

          if (a4)
          {
            v14 = (void *)MEMORY[0x24BDD1540];
            v15 = 2;
LABEL_19:
            objc_msgSend(v14, "errorWithDomain:code:userInfo:", CFSTR("UaaPNLProtobufServiceError"), v15, 0);
            v17 = 0;
            *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_26:

            goto LABEL_27;
          }
          goto LABEL_25;
        }
      }
      else
      {
        if (v11)
        {
          v20 = 136315138;
          v21 = "+[CDMUaaPNLProtoService loadModelBundle:error:]";
          _os_log_debug_impl(&dword_21A2A0000, v10, OS_LOG_TYPE_DEBUG, "%s Did not find calibration model in configuration: calibration will be disabled", (uint8_t *)&v20, 0xCu);
        }

        v12 = 0;
      }
      v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE9E408]), "initWithLoadedModelConfiguration:parserModel:calibrationModel:", v7, v8, v12);

      goto LABEL_26;
    }
    CDMOSLoggerForCategory(0);
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      v20 = 136315138;
      v21 = "+[CDMUaaPNLProtoService loadModelBundle:error:]";
      _os_log_impl(&dword_21A2A0000, v18, OS_LOG_TYPE_INFO, "%s [WARN]: Failed to load parser model", (uint8_t *)&v20, 0xCu);
    }

    if (a4)
    {
      v14 = (void *)MEMORY[0x24BDD1540];
      v15 = 3;
      goto LABEL_19;
    }
LABEL_25:
    v17 = 0;
    goto LABEL_26;
  }
  CDMOSLoggerForCategory(0);
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    v20 = 136315138;
    v21 = "+[CDMUaaPNLProtoService loadModelBundle:error:]";
    _os_log_impl(&dword_21A2A0000, v16, OS_LOG_TYPE_INFO, "%s [WARN]: Failed to load model configuration from disk", (uint8_t *)&v20, 0xCu);
  }

  if (a4)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("UaaPNLProtobufServiceError"), 1, 0);
    v17 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v17 = 0;
  }
LABEL_27:

  return v17;
}

@end
