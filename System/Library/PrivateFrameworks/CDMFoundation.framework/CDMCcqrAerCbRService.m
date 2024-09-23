@implementation CDMCcqrAerCbRService

- (id)handleRequestCommandTypeNames
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDBCF20];
  +[CDMBaseCommand commandName](CDMQRRequestCommand, "commandName");
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
  return +[CDMFeatureFlags isCcqrAerCbrEnabled](CDMFeatureFlags, "isCcqrAerCbrEnabled");
}

- (id)createSetupResponseWithError:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[CDMBaseService createSetupResponseCommand](self, "createSetupResponseCommand");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setCmdError:", v4);

  return v5;
}

- (id)warmup:(id)a3
{
  NSObject *v4;
  void *v5;
  id v6;
  CDMWarmupResponseCommand *v7;
  int64_t v8;
  void *v9;
  CDMWarmupResponseCommand *v10;
  uint64_t v12;
  uint8_t buf[4];
  const char *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  CDMOSLoggerForCategory(0);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v14 = "-[CDMCcqrAerCbRService warmup:]";
    _os_log_impl(&dword_21A2A0000, v4, OS_LOG_TYPE_INFO, "%s Warming Up CDMCcqrAerCbRService", buf, 0xCu);
  }

  if (+[CDMUserDefaultsUtils prewarmModels](CDMUserDefaultsUtils, "prewarmModels"))
  {
    +[CDMCcqrServiceUtils buildQueryRewriteRequest](CDMCcqrServiceUtils, "buildQueryRewriteRequest");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 0;
    v6 = -[CDMCcqrAerCbRService doInference:status:](self, "doInference:status:", v5, &v12);

  }
  v7 = [CDMWarmupResponseCommand alloc];
  v8 = -[CDMBaseService serviceState](self, "serviceState");
  -[CDMBaseService serviceName](self, "serviceName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[CDMWarmupResponseCommand initWithServiceState:serviceName:](v7, "initWithServiceState:serviceName:", v8, v9);

  return v10;
}

- (id)setup:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  CDMCcqrAerCbRService *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  id v20;
  QueryRewriter *ccqrPredictor;
  void *v22;
  NSObject *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  NSObject *v32;
  _TtC13CDMFoundation27CDMCcqrAerCbROverridesProxy *v33;
  _TtC13CDMFoundation27CDMCcqrAerCbROverridesProxy *overrideProxy;
  os_signpost_id_t v35;
  NSObject *v36;
  NSObject *v37;
  unint64_t v38;
  NSObject *v39;
  _BOOL4 v40;
  NSObject *v41;
  NSObject *v42;
  _BOOL4 v43;
  int v44;
  uint64_t v45;
  void *v47;
  uint64_t v48;
  os_signpost_id_t spid;
  void *v50;
  void *v51;
  void *v52;
  id v53;
  uint8_t buf[4];
  const char *v55;
  __int16 v56;
  void *v57;
  __int16 v58;
  const __CFString *v59;
  uint64_t v60;

  v60 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  CDMOSLoggerForCategory(0);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v55 = "-[CDMCcqrAerCbRService setup:]";
    _os_log_impl(&dword_21A2A0000, v5, OS_LOG_TYPE_INFO, "%s Setting up CCQR (AER & CbR) service", buf, 0xCu);
  }

  +[CDMCcqrAerCbRService CcqrAerCbRServiceLogInitIfNeeded](CDMCcqrAerCbRService, "CcqrAerCbRServiceLogInitIfNeeded");
  if (!-[CDMCcqrAerCbRService skipServiceSetup](self, "skipServiceSetup"))
  {
    objc_msgSend(v4, "dynamicConfig");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "getAssetForFactorName:", CFSTR("com.apple.siri.nl.marrs.ccqr"));
    v52 = (void *)objc_claimAutoreleasedReturnValue();

    CDMOSLoggerForCategory(0);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315650;
      v55 = "-[CDMCcqrAerCbRService setup:]";
      v56 = 2112;
      v57 = v52;
      v58 = 2112;
      v59 = CFSTR("com.apple.siri.nl.marrs.ccqr");
      _os_log_debug_impl(&dword_21A2A0000, v10, OS_LOG_TYPE_DEBUG, "%s Asset is: [%@] for factor: %@.", buf, 0x20u);
    }

    objc_msgSend(v52, "getAssetMetadata");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    CDMOSLoggerForCategory(0);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v51, "description");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      v55 = "-[CDMCcqrAerCbRService setup:]";
      v56 = 2112;
      v57 = v47;
      _os_log_debug_impl(&dword_21A2A0000, v11, OS_LOG_TYPE_DEBUG, "%s CCQRAerCbR Asset Metadata: %@", buf, 0x16u);

    }
    objc_msgSend(v4, "dynamicConfig");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "getAssetBundlePathForFactorName:", CFSTR("com.apple.siri.nl.marrs.ccqr"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      v14 = self;
      objc_sync_enter(v14);
      objc_msgSend(v4, "dynamicConfig");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "languageCode");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "resourcePath");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "objectForKey:", CFSTR("modelType"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v53 = 0;
      -[CDMCcqrAerCbRService getPredictor:FilesPath:modelType:status:](v14, "getPredictor:FilesPath:modelType:status:", v16, v17, v18, &v53);
      v19 = objc_claimAutoreleasedReturnValue();
      v20 = v53;
      ccqrPredictor = v14->_ccqrPredictor;
      v14->_ccqrPredictor = (QueryRewriter *)v19;

      if (v20)
      {
        objc_msgSend(v20, "localizedDescription");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        -[CDMBaseService createErrorWithCode:description:](v14, "createErrorWithCode:description:", 1, v22);
        v7 = (void *)objc_claimAutoreleasedReturnValue();

        v14->super.super._serviceState = 4;
        CDMOSLoggerForCategory(0);
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315138;
          v55 = "-[CDMCcqrAerCbRService setup:]";
          _os_log_impl(&dword_21A2A0000, v23, OS_LOG_TYPE_INFO, "%s CCQR (AER & CbR) model Disabled", buf, 0xCu);
        }
      }
      else
      {
        v14->super.super._serviceState = 2;
        CDMOSLoggerForCategory(0);
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315138;
          v55 = "-[CDMCcqrAerCbRService setup:]";
          _os_log_impl(&dword_21A2A0000, v23, OS_LOG_TYPE_INFO, "%s CCQR (AER & CbR) model loaded", buf, 0xCu);
        }
        v7 = 0;
      }

      objc_sync_exit(v14);
    }
    else
    {
      -[CDMBaseService createErrorWithCode:description:](self, "createErrorWithCode:description:", 1, CFSTR("Not able to find Siri CCQR (AER & CbR)) model bundle directory"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      self->super.super._serviceState = 4;
    }
    if (!+[CDMFeatureFlags isTrieOverridesEnabled](CDMFeatureFlags, "isTrieOverridesEnabled"))
      goto LABEL_44;
    CDMOSLoggerForCategory(0);
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315138;
      v55 = "-[CDMCcqrAerCbRService setup:]";
      _os_log_debug_impl(&dword_21A2A0000, v24, OS_LOG_TYPE_DEBUG, "%s Trie Overrides FF Enabled, CCQR loading override trie bundle", buf, 0xCu);
    }

    objc_msgSend(v4, "dynamicConfig");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "getAssetBundlePathForFactorName:", CFSTR("com.apple.siri.nl.overrides"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v26)
    {
      -[CDMBaseService createErrorWithCode:description:](self, "createErrorWithCode:description:", 1, CFSTR("Unable to find CCQR Trie Overrides assets from overrides namespace"));
      v45 = objc_claimAutoreleasedReturnValue();

      self->super.super._serviceState = 4;
      v7 = (void *)v45;
      goto LABEL_44;
    }
    objc_msgSend(v26, "resourcePath");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "stringByAppendingPathComponent:", CFSTR("trie_bundle"));
    v50 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v13, "resourcePath");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "stringByAppendingPathComponent:", CFSTR("trie_bundle"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v28) = objc_msgSend(v30, "fileExistsAtPath:", v50);
    v31 = objc_msgSend(v30, "fileExistsAtPath:", v29);
    if ((_DWORD)v28)
    {
      v8 = v31;
      CDMOSLoggerForCategory(0);
      v32 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        v55 = "-[CDMCcqrAerCbRService setup:]";
        _os_log_impl(&dword_21A2A0000, v32, OS_LOG_TYPE_INFO, "%s Trie overrides: CCQR service detects global overrides assets factor has trie bundle, getting the shared trie overrides store", buf, 0xCu);
      }

      v33 = -[CDMCcqrAerCbROverridesProxy initWithUseTrie:useMemory:templatePattern:]([_TtC13CDMFoundation27CDMCcqrAerCbROverridesProxy alloc], "initWithUseTrie:useMemory:templatePattern:", 1, self->_useMemoryForOverrideStore, 0);
      overrideProxy = self->_overrideProxy;
      self->_overrideProxy = v33;

      if (!(_DWORD)v8)
        goto LABEL_40;
      v35 = os_signpost_id_generate((os_log_t)CDMLogContext);
      v36 = (id)CDMCcqrAerCbRServiceLogContext;
      v37 = v36;
      spid = v35;
      v38 = v35 - 1;
      if (v38 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v36))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_21A2A0000, v37, OS_SIGNPOST_INTERVAL_BEGIN, spid, "Load Trie Overrides", ", buf, 2u);
      }

      CDMOSLoggerForCategory(0);
      v39 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        v55 = "-[CDMCcqrAerCbRService setup:]";
        _os_log_impl(&dword_21A2A0000, v39, OS_LOG_TYPE_INFO, "%s Trie overrides initializing CCQR component overrides from ccqr bundle", buf, 0xCu);
      }

      v40 = -[SiriNLUOverrideProxy loadComponentOverrideTrieStoreWithTrieFilePath:](self->_overrideProxy, "loadComponentOverrideTrieStoreWithTrieFilePath:", v29);
      v41 = (id)CDMCcqrAerCbRServiceLogContext;
      v42 = v41;
      if (v38 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v41))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_21A2A0000, v42, OS_SIGNPOST_INTERVAL_END, spid, "Load Trie Overrides", ", buf, 2u);
      }

      CDMOSLoggerForCategory(0);
      v8 = objc_claimAutoreleasedReturnValue();
      v43 = os_log_type_enabled(v8, OS_LOG_TYPE_INFO);
      if (v40)
      {
        if (v43)
        {
          *(_DWORD *)buf = 136315138;
          v55 = "-[CDMCcqrAerCbRService setup:]";
          _os_log_impl(&dword_21A2A0000, v8, OS_LOG_TYPE_INFO, "%s Trie Overrides: Successfully initialized CCQR Trie component overrides and re-used shared trie overrides store", buf, 0xCu);
        }

LABEL_40:
        v44 = 1;
        goto LABEL_43;
      }
      if (v43)
      {
        *(_DWORD *)buf = 136315138;
        v55 = "-[CDMCcqrAerCbRService setup:]";
        _os_log_impl(&dword_21A2A0000, v8, OS_LOG_TYPE_INFO, "%s Trie Overrides: Fail to load CCQR Trie overrides bundle", buf, 0xCu);
      }

      -[CDMBaseService createErrorWithCode:description:](self, "createErrorWithCode:description:", 1, CFSTR("Unable to initialize CCQR component override from trie assets"));
      v48 = objc_claimAutoreleasedReturnValue();

      self->super.super._serviceState = 4;
      -[CDMCcqrAerCbRService createSetupResponseWithError:](self, "createSetupResponseWithError:", v48);
      v8 = objc_claimAutoreleasedReturnValue();
      v44 = 0;
      v7 = (void *)v48;
    }
    else
    {
      -[CDMCcqrAerCbRService createSetupResponseWithError:](self, "createSetupResponseWithError:", v7);
      v8 = objc_claimAutoreleasedReturnValue();
      v44 = 0;
    }
LABEL_43:

    if (!v44)
    {
LABEL_45:

      goto LABEL_46;
    }
LABEL_44:
    -[CDMCcqrAerCbRService createSetupResponseWithError:](self, "createSetupResponseWithError:", v7);
    v8 = objc_claimAutoreleasedReturnValue();
    goto LABEL_45;
  }
  CDMOSLoggerForCategory(0);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    v55 = "-[CDMCcqrAerCbRService setup:]";
    _os_log_debug_impl(&dword_21A2A0000, v6, OS_LOG_TYPE_DEBUG, "%s Skip CDMCcqrAerCbRService setup as NLRouter service requirements met", buf, 0xCu);
  }

  self->super.super._serviceState = 4;
  -[CDMBaseService createErrorWithCode:description:](self, "createErrorWithCode:description:", 1, CFSTR("Skip CCQR service setup as NLRouter service requirements met."));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CDMCcqrAerCbRService createSetupResponseWithError:](self, "createSetupResponseWithError:", v7);
  v8 = objc_claimAutoreleasedReturnValue();
LABEL_46:

  return v8;
}

- (id)match:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  CDMQRResponseCommand *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  char v19;
  void *v20;
  void *v21;
  uint64_t v22;
  id v23;
  void *v24;
  CDMQRResponseCommand *v25;
  CDMQRResponseCommand *v26;
  NSObject *v28;
  uint8_t buf[4];
  const char *v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  -[SiriNLUOverrideProxy matchWithInputs:overrideNamespace:](self->_overrideProxy, "matchWithInputs:overrideNamespace:", a3, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (!v4 || !objc_msgSend(v4, "hasCcqrOverrideTemplate"))
    goto LABEL_18;
  objc_msgSend(v5, "ccqrOverrideTemplate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v6, "hasRewriteMessage") & 1) == 0)
    goto LABEL_17;
  objc_msgSend(v5, "ccqrOverrideTemplate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "rewriteMessage");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v8, "hasRewriteType") & 1) == 0)
  {

LABEL_17:
    goto LABEL_18;
  }
  objc_msgSend(v5, "ccqrOverrideTemplate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "rewriteMessage");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "hasRewrittenUtterance");

  if (!v11)
  {
LABEL_18:
    v26 = 0;
    goto LABEL_19;
  }
  v12 = -[CDMQRResponseCommand initWithResponse:]([CDMQRResponseCommand alloc], "initWithResponse:", 0);
  objc_msgSend(v5, "ccqrOverrideTemplate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "rewriteMessage");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "rewrittenUtterance");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  -[CDMCcqrAerCbROverridesProxy getRewriteHypothesisWithOverrideUtterance:](self->_overrideProxy, "getRewriteHypothesisWithOverrideUtterance:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if (v16)
  {
    objc_msgSend(v16, "utterance");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "isEqualToString:", &stru_24DCAE158);

    if ((v19 & 1) == 0)
    {
      objc_msgSend(v5, "ccqrOverrideTemplate");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "rewriteMessage");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v21, "rewriteType");

      if ((_DWORD)v22)
      {
        if ((_DWORD)v22 != 1)
        {
          if ((_DWORD)v22 != 2)
          {
            CDMOSLoggerForCategory(0);
            v28 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136315138;
              v30 = "-[CDMCcqrAerCbRService match:]";
              _os_log_error_impl(&dword_21A2A0000, v28, OS_LOG_TYPE_ERROR, "%s [ERR]: CCQR override did not find the correct rewrite type", buf, 0xCu);
            }

            v26 = 0;
            goto LABEL_15;
          }
          v22 = 0;
        }
        objc_msgSend(v17, "setRewriteType:", v22);
      }
      v23 = objc_alloc_init(MEMORY[0x24BE9E288]);
      v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithObjects:", v17, 0);
      objc_msgSend(v23, "setRewriteHypotheses:", v24);

      v25 = -[CDMQRResponseCommand initWithResponse:]([CDMQRResponseCommand alloc], "initWithResponse:", v23);
      v12 = v25;
    }
  }
  v12 = v12;
  v26 = v12;
LABEL_15:

LABEL_19:
  return v26;
}

- (id)handle:(id)a3
{
  id v4;
  void *v5;
  CDMCcqrAerCbRService *v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  NSObject *v12;
  CDMQRResponseCommand *v13;
  NSObject *v14;
  NSObject *v16;
  void *v17;
  id v18;
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  const __CFString *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)CDMLogContext;
  if (os_log_type_enabled((os_log_t)CDMLogContext, OS_LOG_TYPE_DEBUG))
  {
    v16 = v5;
    objc_msgSend(v4, "qrRequest");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315650;
    v20 = "-[CDMCcqrAerCbRService handle:]";
    v21 = 2112;
    v22 = CFSTR("queryrewrite");
    v23 = 2112;
    v24 = v17;
    _os_log_debug_impl(&dword_21A2A0000, v16, OS_LOG_TYPE_DEBUG, "%s [insights-cdm-%@]:\nQUERYREWRITEQRRequest: %@", buf, 0x20u);

  }
  v6 = self;
  objc_sync_enter(v6);
  if (v6->_ccqrPredictor)
  {
    objc_sync_exit(v6);

    CDMOSLoggerForCategory(0);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315138;
      v20 = "-[CDMCcqrAerCbRService handle:]";
      _os_log_debug_impl(&dword_21A2A0000, v7, OS_LOG_TYPE_DEBUG, "%s Calling CCQR (AER & CbR)", buf, 0xCu);
    }

    objc_msgSend(v4, "qrRequest");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[CDMCcqrServiceUtils leftShiftSiriResponse:](CDMCcqrServiceUtils, "leftShiftSiriResponse:", v8);
    v9 = objc_claimAutoreleasedReturnValue();

    v18 = 0;
    -[CDMCcqrAerCbRService doInference:status:](v6, "doInference:status:", v9, &v18);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v18;
    -[CDMCcqrAerCbRService debugCcqrResponse:](v6, "debugCcqrResponse:", v10);
    v12 = CDMLogContext;
    if (os_log_type_enabled((os_log_t)CDMLogContext, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315650;
      v20 = "-[CDMCcqrAerCbRService handle:]";
      v21 = 2112;
      v22 = CFSTR("queryrewrite");
      v23 = 2112;
      v24 = v10;
      _os_log_debug_impl(&dword_21A2A0000, v12, OS_LOG_TYPE_DEBUG, "%s [insights-cdm-%@]:\nQUERYREWRITEQRResponse: %@", buf, 0x20u);
    }
    v13 = -[CDMQRResponseCommand initWithResponse:]([CDMQRResponseCommand alloc], "initWithResponse:", v10);

    v6 = (CDMCcqrAerCbRService *)v9;
  }
  else
  {
    CDMOSLoggerForCategory(0);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v20 = "-[CDMCcqrAerCbRService handle:]";
      _os_log_error_impl(&dword_21A2A0000, v14, OS_LOG_TYPE_ERROR, "%s [ERR]: CCQR (AER & CbR): Predictor not initialized!", buf, 0xCu);
    }

    objc_sync_exit(v6);
    v13 = 0;
  }

  return v13;
}

- (void)debugCcqrResponse:(id)a3
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  void *v6;
  int v7;
  NSObject *v8;
  _BOOL4 v9;
  const char *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  int v14;
  const char *v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = objc_msgSend(v3, "rewriteHypothesesCount");
  CDMOSLoggerForCategory(0);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v14 = 136315394;
    v15 = "-[CDMCcqrAerCbRService debugCcqrResponse:]";
    v16 = 2048;
    v17 = v4;
    _os_log_debug_impl(&dword_21A2A0000, v5, OS_LOG_TYPE_DEBUG, "%s CcqrAerCbR: Generated %lu rewrite hypotheses.", (uint8_t *)&v14, 0x16u);
  }

  if (v4)
  {
    objc_msgSend(v3, "rewriteHypothesesAtIndex:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "rewriteType");

    CDMOSLoggerForCategory(0);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG);
    if (v7)
    {
      if (v9)
      {
        v14 = 136315138;
        v15 = "-[CDMCcqrAerCbRService debugCcqrResponse:]";
        v10 = "%s Reference Resolution";
LABEL_13:
        _os_log_debug_impl(&dword_21A2A0000, v8, OS_LOG_TYPE_DEBUG, v10, (uint8_t *)&v14, 0xCu);
      }
    }
    else if (v9)
    {
      v14 = 136315138;
      v15 = "-[CDMCcqrAerCbRService debugCcqrResponse:]";
      v10 = "%s Correction by Repetition";
      goto LABEL_13;
    }

    CDMOSLoggerForCategory(0);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v3, "rewriteHypothesesAtIndex:", 0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "utterance");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 136315394;
      v15 = "-[CDMCcqrAerCbRService debugCcqrResponse:]";
      v16 = 2112;
      v17 = (uint64_t)v13;
      _os_log_debug_impl(&dword_21A2A0000, v11, OS_LOG_TYPE_DEBUG, "%s Rewritten Utterance: %@", (uint8_t *)&v14, 0x16u);

    }
  }

}

- (void)configureUseMemoryForOverrideStore
{
  -[CDMCcqrAerCbRService setUseMemoryForOverrideStore:](self, "setUseMemoryForOverrideStore:", 0);
}

- (id)getPredictor:(id)a3 FilesPath:(id)a4 modelType:(id)a5 status:(id *)a6
{
  id v10;
  id v11;
  NSObject *v12;
  void *v13;
  const __CFString *v15;
  int v16;
  const char *v17;
  __int16 v18;
  const __CFString *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  self->_modelType = 1;
  v10 = a4;
  v11 = a3;
  if (objc_msgSend(a5, "isEqualToString:", CFSTR("JointCCQR")))
    self->_modelType = 4;
  CDMOSLoggerForCategory(0);
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    if (self->_modelType == 1)
      v15 = CFSTR("AER");
    else
      v15 = CFSTR("AER + CBR");
    v16 = 136315394;
    v17 = "-[CDMCcqrAerCbRService getPredictor:FilesPath:modelType:status:]";
    v18 = 2112;
    v19 = v15;
    _os_log_debug_impl(&dword_21A2A0000, v12, OS_LOG_TYPE_DEBUG, "%s CCQR initialized with %@ functionality", (uint8_t *)&v16, 0x16u);
  }

  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE64050]), "initWithLocale:filesPath:predictorType:status:", v11, v10, self->_modelType, a6);
  return v13;
}

- (id)doInference:(id)a3 status:(id *)a4
{
  id v6;
  CDMCcqrAerCbRService *v7;
  void *v8;

  v6 = a3;
  v7 = self;
  objc_sync_enter(v7);
  -[QueryRewriter predictWithInput:status:](v7->_ccqrPredictor, "predictWithInput:status:", v6, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_exit(v7);

  return v8;
}

- (BOOL)skipServiceSetup
{
  NLRouterExperimentTrialController *v2;
  _BOOL4 v3;

  v2 = objc_alloc_init(NLRouterExperimentTrialController);
  if (AFDeviceSupportsSAE()
    && +[CDMCcqrServiceUtils isNLRouterAssetAvailable](CDMCcqrServiceUtils, "isNLRouterAssetAvailable"))
  {
    v3 = !-[NLRouterExperimentTrialController suppressRewrite](v2, "suppressRewrite");
  }
  else
  {
    LOBYTE(v3) = 0;
  }

  return v3;
}

- (int)modelType
{
  return self->_modelType;
}

- (QueryRewriter)ccqrPredictor
{
  return self->_ccqrPredictor;
}

- (void)setCcqrPredictor:(id)a3
{
  objc_storeStrong((id *)&self->_ccqrPredictor, a3);
}

- (BOOL)useMemoryForOverrideStore
{
  return self->_useMemoryForOverrideStore;
}

- (void)setUseMemoryForOverrideStore:(BOOL)a3
{
  self->_useMemoryForOverrideStore = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ccqrPredictor, 0);
  objc_storeStrong((id *)&self->_overrideProxy, 0);
}

+ (void)CcqrAerCbRServiceLogInitIfNeeded
{
  if (CcqrAerCbRServiceLogInitIfNeeded_once != -1)
    dispatch_once(&CcqrAerCbRServiceLogInitIfNeeded_once, &__block_literal_global_6607);
}

+ (BOOL)suppressCcqrUsingCurContext:(id)a3
{
  id v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  NSObject *v14;
  BOOL v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t buf[4];
  const char *v22;
  __int16 v23;
  const __CFString *v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  objc_msgSend(v3, "nlContext", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "systemDialogActs");
  v5 = objc_claimAutoreleasedReturnValue();

  v6 = -[NSObject countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v18;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v18 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        if ((objc_msgSend(v10, "hasOffered") & 1) != 0
          || (objc_msgSend(v10, "hasPrompted") & 1) != 0
          || objc_msgSend(v10, "hasGaveOptions"))
        {
          CDMOSLoggerForCategory(0);
          v14 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 136315138;
            v22 = "+[CDMCcqrAerCbRService suppressCcqrUsingCurContext:]";
            _os_log_debug_impl(&dword_21A2A0000, v14, OS_LOG_TYPE_DEBUG, "%s Skipping ccqr to reason #1: Previous turn result in a active task, such that SDA is non-empty", buf, 0xCu);
          }

          goto LABEL_17;
        }
      }
      v7 = -[NSObject countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
      if (v7)
        continue;
      break;
    }
  }

  objc_msgSend(v3, "legacyNlContext");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "previousDomainName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "isEqualToString:", CFSTR("arithmetic"));

  if (v13)
  {
    CDMOSLoggerForCategory(0);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315394;
      v22 = "+[CDMCcqrAerCbRService suppressCcqrUsingCurContext:]";
      v23 = 2112;
      v24 = CFSTR("arithmetic");
      _os_log_debug_impl(&dword_21A2A0000, v5, OS_LOG_TYPE_DEBUG, "%s Skipping ccqr to reason #3: Disable certain domain(s): %@", buf, 0x16u);
    }
LABEL_17:

    v15 = 1;
  }
  else
  {
    v15 = 0;
  }

  return v15;
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
  v6 = CFSTR("marrs/ccqr");
  v7 = CFSTR("com.apple.siri.nl.marrs.ccqr");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v6, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v3;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CDMServiceAssetConfig addCDMFactorToFoldersMapping:forAssetSet:](v2, "addCDMFactorToFoldersMapping:forAssetSet:", v4, 0);

  -[CDMServiceAssetConfig setIsAssetRequiredForSetup:](v2, "setIsAssetRequiredForSetup:", 0);
  return v2;
}

void __56__CDMCcqrAerCbRService_CcqrAerCbRServiceLogInitIfNeeded__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create((const char *)CDMLoggingSubsystem, "CCQR");
  v1 = (void *)CDMCcqrAerCbRServiceLogContext;
  CDMCcqrAerCbRServiceLogContext = (uint64_t)v0;

}

@end
