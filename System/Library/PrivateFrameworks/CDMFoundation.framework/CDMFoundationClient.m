@implementation CDMFoundationClient

void __55__CDMFoundationClient_setup_nullableCompletionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  _QWORD *WeakRetained;
  NSObject *v6;
  os_signpost_id_t v7;
  os_signpost_id_t v8;
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  id v19;
  uint64_t v20;
  int v21;
  const char *v22;
  __int16 v23;
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    v6 = (id)CDMLogContext;
    v7 = os_signpost_id_generate((os_log_t)CDMLogContext);
    if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v8 = v7;
      if (os_signpost_enabled(v6))
      {
        LOWORD(v21) = 0;
        _os_signpost_emit_with_name_impl(&dword_21A2A0000, v6, OS_SIGNPOST_EVENT, v8, "cdmClientSetupReceivedCDM finished setup", ", (uint8_t *)&v21, 2u);
      }
    }

    CDMOSLoggerForCategory(0);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v21 = 136315138;
      v22 = "-[CDMFoundationClient setup:nullableCompletionHandler:]_block_invoke";
      _os_log_impl(&dword_21A2A0000, v9, OS_LOG_TYPE_INFO, "%s CDM finished processing CDMSetupRequestCommand during setup", (uint8_t *)&v21, 0xCu);
    }

    if (v4)
    {
      CDMOSLoggerForCategory(0);
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v4, "localizedDescription");
        v19 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v20 = objc_msgSend(v19, "UTF8String");
        v21 = 136315394;
        v22 = "-[CDMFoundationClient setup:nullableCompletionHandler:]_block_invoke";
        v23 = 2080;
        v24 = v20;
        _os_log_error_impl(&dword_21A2A0000, v10, OS_LOG_TYPE_ERROR, "%s [ERR]: Setup failed: %s", (uint8_t *)&v21, 0x16u);

      }
      CDMOSLoggerForCategory(0);
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        v21 = 136315138;
        v22 = "-[CDMFoundationClient setup:nullableCompletionHandler:]_block_invoke";
        _os_log_debug_impl(&dword_21A2A0000, v11, OS_LOG_TYPE_DEBUG, "%s Set CDMClient KVO as setup error", (uint8_t *)&v21, 0xCu);
      }

      objc_msgSend(WeakRetained, "setValue:forKey:", v4, CFSTR("errorFromSetup"));
      CDMOSLoggerForCategory(0);
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        v21 = 136315138;
        v22 = "-[CDMFoundationClient setup:nullableCompletionHandler:]_block_invoke";
        _os_log_debug_impl(&dword_21A2A0000, v12, OS_LOG_TYPE_DEBUG, "%s Send CoreAnalytics", (uint8_t *)&v21, 0xCu);
      }

      objc_msgSend(*(id *)(a1 + 32), "languageCode");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      +[CDMAnalytics recordCDMSetupFailureEvent:withError:](CDMAnalytics, "recordCDMSetupFailureEvent:withError:", v13, v4);

      CDMOSLoggerForCategory(0);
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
        v21 = 136315138;
        v22 = "-[CDMFoundationClient setup:nullableCompletionHandler:]_block_invoke";
        _os_log_debug_impl(&dword_21A2A0000, v14, OS_LOG_TYPE_DEBUG, "%s SELF Logging - client setup fail", (uint8_t *)&v21, 0xCu);
      }

      +[CDMSELFLogUtil cdmClientSetupFailed:errorDomain:errorCode:logMessage:dataDispatcherContext:](CDMSELFLogUtil, "cdmClientSetupFailed:errorDomain:errorCode:logMessage:dataDispatcherContext:", *(_QWORD *)(a1 + 40), 2, objc_msgSend(v4, "code"), CFSTR("SELF client setup failed message emitted"), WeakRetained[9]);
      v15 = *(_QWORD *)(a1 + 48);
      if (v15)
        (*(void (**)(uint64_t, id))(v15 + 16))(v15, v4);
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "languageCode");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      +[CDMAnalytics recordCDMSetupSuccessEvent:](CDMAnalytics, "recordCDMSetupSuccessEvent:", v16);

      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 1);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "setValue:forKey:", v17, CFSTR("successFromSetup"));

      +[CDMSELFLogUtil cdmClientSetupEnded:logMessage:dataDispatcherContext:](CDMSELFLogUtil, "cdmClientSetupEnded:logMessage:dataDispatcherContext:", *(_QWORD *)(a1 + 40), CFSTR("SELF client setup ended message emitted"), WeakRetained[9]);
      v18 = *(_QWORD *)(a1 + 48);
      if (v18)
        (*(void (**)(uint64_t, _QWORD))(v18 + 16))(v18, 0);
    }
  }

}

- (void)setup:(id)a3 nullableCompletionHandler:(id)a4
{
  id v6;
  NSObject *v7;
  NSObject *v8;
  os_signpost_id_t v9;
  os_signpost_id_t v10;
  void *v11;
  _BOOL4 v12;
  NSUUID *v13;
  NSObject *p_super;
  NSUUID *v15;
  NSUUID *nlSetupId;
  NSString *v17;
  NSString *invocationSource;
  void *v19;
  void *v20;
  NSString *v21;
  NSString *localeIdentifier;
  NSObject *v23;
  NSString *v24;
  NSString *v25;
  NSString *v26;
  NSObject *v27;
  NSString *v28;
  uint64_t v29;
  uint64_t v30;
  NSObject *v31;
  void *v32;
  void *v33;
  NSObject *v34;
  void *v35;
  void *v36;
  BOOL v37;
  void *v38;
  void *v39;
  void *v40;
  CDMDynamicConfig *v41;
  NSString *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  CDMDynamicConfig *v47;
  CDMDynamicConfig *dynamicConfig;
  id v49;
  void *v50;
  CDMSetupRequestCommand *v51;
  void *v52;
  void *v53;
  void *v54;
  NSString *aClassName;
  void (**v56)(id, void *);
  void *v57;
  _QWORD aBlock[4];
  id v59;
  id v60;
  void (**v61)(id, void *);
  id v62;
  uint8_t buf[4];
  const char *v64;
  __int16 v65;
  uint64_t v66;
  __int16 v67;
  uint64_t v68;
  uint64_t v69;

  v69 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v56 = (void (**)(id, void *))a4;
  CDMOSLoggerForCategory(0);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v64 = "-[CDMFoundationClient setup:nullableCompletionHandler:]";
    v65 = 2112;
    v66 = (uint64_t)v6;
    _os_log_impl(&dword_21A2A0000, v7, OS_LOG_TYPE_INFO, "%s CDMClient setup... %@", buf, 0x16u);
  }

  v8 = (id)CDMLogContext;
  v9 = os_signpost_id_generate((os_log_t)CDMLogContext);
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v10 = v9;
    if (os_signpost_enabled(v8))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_21A2A0000, v8, OS_SIGNPOST_EVENT, v10, "cdmClientSetupSentCDMClient calling CDM to setup", ", buf, 2u);
    }
  }

  objc_msgSend(v6, "nlSetupId");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11 == 0;

  if (v12)
  {
    v15 = (NSUUID *)objc_alloc_init(MEMORY[0x24BDD1880]);
    nlSetupId = self->_nlSetupId;
    self->_nlSetupId = v15;

    CDMOSLoggerForCategory(0);
    p_super = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(p_super, OS_LOG_TYPE_DEBUG))
    {
      -[NSUUID UUIDString](self->_nlSetupId, "UUIDString");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      v64 = "-[CDMFoundationClient setup:nullableCompletionHandler:]";
      v65 = 2112;
      v66 = (uint64_t)v52;
      _os_log_debug_impl(&dword_21A2A0000, p_super, OS_LOG_TYPE_DEBUG, "%s CDMClient setup has not nlSetupId set. Minting: %@", buf, 0x16u);

    }
  }
  else
  {
    objc_msgSend(v6, "nlSetupId");
    v13 = (NSUUID *)objc_claimAutoreleasedReturnValue();
    p_super = &self->_nlSetupId->super;
    self->_nlSetupId = v13;
  }

  objc_msgSend(v6, "invocationSource");
  v17 = (NSString *)objc_claimAutoreleasedReturnValue();
  invocationSource = self->_invocationSource;
  self->_invocationSource = v17;

  objc_msgSend(MEMORY[0x24BE9E320], "convertFromUUID:", self->_nlSetupId);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  +[CDMSELFLogUtil createSELFMetadataWithNlId:andWithTrpId:andWithRequestId:andWithResultCandidateId:andWithConnectionId:](CDMSELFLogUtil, "createSELFMetadataWithNlId:andWithTrpId:andWithRequestId:andWithResultCandidateId:andWithConnectionId:");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "activeServiceGraph");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  +[CDMDynamicConfig resolveActiveGraph:](CDMDynamicConfig, "resolveActiveGraph:", v19);
  aClassName = (NSString *)objc_claimAutoreleasedReturnValue();

  +[CDMSELFLogUtil cdmClientSetupStarted:logMessage:currentServiceGraph:dataDispatcherContext:](CDMSELFLogUtil, "cdmClientSetupStarted:logMessage:currentServiceGraph:dataDispatcherContext:", v57, CFSTR("SELF client setup started message emitted"), -[objc_class getNLXSchemaCDMServiceGraphName](NSClassFromString(aClassName), "getNLXSchemaCDMServiceGraphName"), self->_dataDispatcherContext);
  if (v6)
  {
    objc_msgSend(v6, "localeIdentifier");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v53 = v20;
    if (!v20)
    {
      -[CDMClientInterface createNSError:errorCode:](self, "createNSError:errorCode:", CFSTR("CDMClientSetup does not have locale?"), 1);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      -[CDMFoundationClient setValue:forKey:](self, "setValue:forKey:", v33, CFSTR("errorFromSetup"));
      +[CDMSELFLogUtil cdmClientSetupFailed:errorDomain:errorCode:logMessage:dataDispatcherContext:](CDMSELFLogUtil, "cdmClientSetupFailed:errorDomain:errorCode:logMessage:dataDispatcherContext:", v57, 1, 2, CFSTR("SELF client setup failed message emitted"), self->_dataDispatcherContext);
      if (v56)
        v56[2](v56, v33);
      goto LABEL_33;
    }
    objc_msgSend(v20, "localeIdentifier");
    v21 = (NSString *)objc_claimAutoreleasedReturnValue();
    localeIdentifier = self->_localeIdentifier;
    self->_localeIdentifier = v21;

    CDMOSLoggerForCategory(0);
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      v24 = self->_localeIdentifier;
      *(_DWORD *)buf = 136315394;
      v64 = "-[CDMFoundationClient setup:nullableCompletionHandler:]";
      v65 = 2112;
      v66 = (uint64_t)v24;
      _os_log_impl(&dword_21A2A0000, v23, OS_LOG_TYPE_INFO, "%s Received CDMClientSetup with localeIdentifier=%@", buf, 0x16u);
    }

    +[CDMPlatformUtils normalizeLocaleIdentifier:](CDMPlatformUtils, "normalizeLocaleIdentifier:", self->_localeIdentifier);
    v25 = (NSString *)objc_claimAutoreleasedReturnValue();
    v26 = self->_localeIdentifier;
    self->_localeIdentifier = v25;

    CDMOSLoggerForCategory(0);
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
    {
      v28 = self->_localeIdentifier;
      *(_DWORD *)buf = 136315394;
      v64 = "-[CDMFoundationClient setup:nullableCompletionHandler:]";
      v65 = 2112;
      v66 = (uint64_t)v28;
      _os_log_impl(&dword_21A2A0000, v27, OS_LOG_TYPE_INFO, "%s Received CDMClientSetup with localeIdentifier=%@ (normalized within CDMClient)", buf, 0x16u);
    }

    if (-[CDMFoundationClient isLighthouseAPIEnabled](self, "isLighthouseAPIEnabled"))
    {
      objc_msgSend(v6, "assetDirPath");
      v29 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "overrideSiriVocabSpans");
      v30 = objc_claimAutoreleasedReturnValue();
      CDMOSLoggerForCategory(0);
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315650;
        v64 = "-[CDMFoundationClient setup:nullableCompletionHandler:]";
        v65 = 2112;
        v66 = v29;
        v67 = 2112;
        v68 = v30;
        _os_log_debug_impl(&dword_21A2A0000, v31, OS_LOG_TYPE_DEBUG, "%s SiriMini lighthouse API is enabled. Got asset dir path: %@, overrides Siri vocabulary spans: %@.", buf, 0x20u);
      }
    }
    else
    {
      CDMOSLoggerForCategory(0);
      v34 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315138;
        v64 = "-[CDMFoundationClient setup:nullableCompletionHandler:]";
        _os_log_debug_impl(&dword_21A2A0000, v34, OS_LOG_TYPE_DEBUG, "%s SiriMini lighthouse API is disabled.", buf, 0xCu);
      }

      objc_msgSend(v6, "assetDirPath");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      if (v35)
      {

      }
      else
      {
        objc_msgSend(v6, "overrideSiriVocabSpans");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = v36 == 0;

        if (v37)
        {
          v33 = 0;
          v40 = 0;
          goto LABEL_32;
        }
      }
      CDMOSLoggerForCategory(0);
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v6, "assetDirPath");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "overrideSiriVocabSpans");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136315650;
        v64 = "-[CDMFoundationClient setup:nullableCompletionHandler:]";
        v65 = 2112;
        v66 = (uint64_t)v38;
        v67 = 2112;
        v68 = (uint64_t)v39;
        _os_log_impl(&dword_21A2A0000, v31, OS_LOG_TYPE_INFO, "%s [WARN]: CDM got asset dir path: %@, overrides Siri vocabulary spans: %@. However, SiriMini lighthouse API is disabled. You are holding it wrong! CDM will ignore above parameters.", buf, 0x20u);

      }
      v29 = 0;
      v30 = 0;
    }

    v33 = (void *)v29;
    v40 = (void *)v30;
LABEL_32:
    v41 = [CDMDynamicConfig alloc];
    v42 = self->_localeIdentifier;
    objc_msgSend(v6, "embeddingVersion");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "activeServiceGraph");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "sandboxId");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "serviceStateDirectory");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = -[CDMDynamicConfig initWithLanguageCode:embeddingVersion:graphName:sandboxId:assetPaths:assetDirPath:overrideSiriVocabSpans:overrideMentions:overrideContextualSpans:serviceStateDirectory:](v41, "initWithLanguageCode:embeddingVersion:graphName:sandboxId:assetPaths:assetDirPath:overrideSiriVocabSpans:overrideMentions:overrideContextualSpans:serviceStateDirectory:", v42, v43, v44, v45, 0, v33, v40, 0, 0, v46);
    dynamicConfig = self->_dynamicConfig;
    self->_dynamicConfig = v47;

    objc_initWeak((id *)buf, self);
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 3221225472;
    aBlock[2] = __55__CDMFoundationClient_setup_nullableCompletionHandler___block_invoke;
    aBlock[3] = &unk_24DCAB6D0;
    objc_copyWeak(&v62, (id *)buf);
    v59 = v53;
    v49 = v57;
    v60 = v49;
    v61 = v56;
    v50 = _Block_copy(aBlock);
    v51 = -[CDMSetupRequestCommand initWithDynamicConfig:selfMetadata:dataDispatcherContext:shouldPerformWarmup:]([CDMSetupRequestCommand alloc], "initWithDynamicConfig:selfMetadata:dataDispatcherContext:shouldPerformWarmup:", self->_dynamicConfig, v49, self->_dataDispatcherContext, objc_msgSend(v6, "shouldPerformWarmup"));
    -[CDMFoundationClient doHandleCommand:forCallback:](self, "doHandleCommand:forCallback:", v51, v50);

    objc_destroyWeak(&v62);
    objc_destroyWeak((id *)buf);

LABEL_33:
    v32 = v53;
    goto LABEL_34;
  }
  -[CDMClientInterface createNSError:errorCode:](self, "createNSError:errorCode:", CFSTR("Trust but verify: got nil CDMClientSetup"), 1);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[CDMFoundationClient setValue:forKey:](self, "setValue:forKey:", v32, CFSTR("errorFromSetup"));
  +[CDMSELFLogUtil cdmClientSetupFailed:errorDomain:errorCode:logMessage:dataDispatcherContext:](CDMSELFLogUtil, "cdmClientSetupFailed:errorDomain:errorCode:logMessage:dataDispatcherContext:", v57, 1, 1, CFSTR("SELF client setup failed message emitted"), self->_dataDispatcherContext);
  if (v56)
    v56[2](v56, v32);
LABEL_34:

}

- (BOOL)isLighthouseAPIEnabled
{
  return +[CDMFeatureFlags isLighthouseAPIEnabled](CDMFeatureFlags, "isLighthouseAPIEnabled");
}

- (void)doHandleCommand:(id)a3 forCallback:(id)a4
{
  id v6;
  id v7;

  v7 = a3;
  v6 = a4;
  objc_msgSend(v7, "setDataDispatcherContext:", self->_dataDispatcherContext);
  -[CDMServiceCenter handleCommand:forCallback:](self->_serviceCenter, "handleCommand:forCallback:", v7, v6);

}

- (CDMFoundationClient)initWithCallingBundleId:(id)a3
{
  id v4;
  CDMDataDispatcherContext *v5;
  CDMDataDispatcherContext *dataDispatcherContext;
  CDMFoundationClient *v7;

  v4 = a3;
  v5 = -[CDMDataDispatcherContext initWithCallingBundleId:]([CDMDataDispatcherContext alloc], "initWithCallingBundleId:", v4);
  dataDispatcherContext = self->_dataDispatcherContext;
  self->_dataDispatcherContext = v5;

  v7 = -[CDMFoundationClient init](self, "init");
  return v7;
}

- (CDMFoundationClient)init
{
  CDMConfig *v3;
  CDMDynamicConfig *dynamicConfig;
  NSUUID *nlSetupId;
  NSString *invocationSource;
  CDMServiceCenter *v7;
  CDMServiceCenter *serviceCenter;
  void *v9;
  void *v10;
  XPCStreamEventRegister *v11;
  XPCStreamEventRegister *eventRegister;

  +[CDMLogging CDMLogInitIfNeeded](CDMLogging, "CDMLogInitIfNeeded");
  v3 = objc_alloc_init(CDMConfig);
  dynamicConfig = self->_dynamicConfig;
  self->_dynamicConfig = 0;

  nlSetupId = self->_nlSetupId;
  self->_nlSetupId = 0;

  invocationSource = self->_invocationSource;
  self->_invocationSource = 0;

  v7 = objc_alloc_init(CDMServiceCenter);
  serviceCenter = self->_serviceCenter;
  self->_serviceCenter = v7;

  -[CDMFoundationClient doServiceCenterInitWithConfig:](self, "doServiceCenterInitWithConfig:", v3);
  +[CDMNLUServiceGraph requiredDAGServices](CDMNLUServiceGraph, "requiredDAGServices");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "allObjects");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[XPCStreamEventRegister registerFromDagServiceNames:](XPCStreamEventRegister, "registerFromDagServiceNames:", v10);
  v11 = (XPCStreamEventRegister *)objc_claimAutoreleasedReturnValue();
  eventRegister = self->_eventRegister;
  self->_eventRegister = v11;

  return self;
}

- (void)doServiceCenterInitWithConfig:(id)a3
{
  -[CDMServiceCenter initWithConfig:](self->_serviceCenter, "initWithConfig:", a3);
}

- (CDMFoundationClient)initWithDelegate:(id)a3
{
  objc_storeStrong((id *)&self->_delegate, a3);
  return -[CDMFoundationClient init](self, "init");
}

- (CDMFoundationClient)initWithDelegate:(id)a3 withCallingBundleId:(id)a4
{
  id v6;
  id v7;
  CDMDataDispatcherContext *v8;
  CDMDataDispatcherContext *dataDispatcherContext;
  CDMFoundationClient *v10;

  v6 = a3;
  v7 = a4;
  v8 = -[CDMDataDispatcherContext initWithCallingBundleId:]([CDMDataDispatcherContext alloc], "initWithCallingBundleId:", v7);
  dataDispatcherContext = self->_dataDispatcherContext;
  self->_dataDispatcherContext = v8;

  v10 = -[CDMFoundationClient initWithDelegate:](self, "initWithDelegate:", v6);
  return v10;
}

- (BOOL)areAssetsAvailable:(id)a3
{
  id v4;
  NSObject *v5;
  NSString *v6;
  NSString *v7;
  NSString *localeIdentifier;
  NSString *v9;
  NSString *v10;
  NSObject *v11;
  NSString *v12;
  BOOL v13;
  NSObject *v14;
  int v16;
  const char *v17;
  __int16 v18;
  NSString *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (v4)
  {
    CDMOSLoggerForCategory(0);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v4, "localeIdentifier");
      v6 = (NSString *)objc_claimAutoreleasedReturnValue();
      v16 = 136315394;
      v17 = "-[CDMFoundationClient areAssetsAvailable:]";
      v18 = 2112;
      v19 = v6;
      _os_log_impl(&dword_21A2A0000, v5, OS_LOG_TYPE_INFO, "%s Are assets available called with locale: %@.", (uint8_t *)&v16, 0x16u);

    }
    objc_msgSend(v4, "localeIdentifier");
    v7 = (NSString *)objc_claimAutoreleasedReturnValue();
    localeIdentifier = self->_localeIdentifier;
    self->_localeIdentifier = v7;

    +[CDMPlatformUtils normalizeLocaleIdentifier:](CDMPlatformUtils, "normalizeLocaleIdentifier:", self->_localeIdentifier);
    v9 = (NSString *)objc_claimAutoreleasedReturnValue();
    v10 = self->_localeIdentifier;
    self->_localeIdentifier = v9;

    CDMOSLoggerForCategory(0);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      v12 = self->_localeIdentifier;
      v16 = 136315394;
      v17 = "-[CDMFoundationClient areAssetsAvailable:]";
      v18 = 2112;
      v19 = v12;
      _os_log_impl(&dword_21A2A0000, v11, OS_LOG_TYPE_INFO, "%s Normalized localeIdentifier: %@", (uint8_t *)&v16, 0x16u);
    }

    v13 = -[CDMServiceCenter areAssetsAvailable:](self->_serviceCenter, "areAssetsAvailable:", self->_localeIdentifier);
  }
  else
  {
    CDMOSLoggerForCategory(0);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v16 = 136315394;
      v17 = "-[CDMFoundationClient areAssetsAvailable:]";
      v18 = 2112;
      v19 = 0;
      _os_log_error_impl(&dword_21A2A0000, v14, OS_LOG_TYPE_ERROR, "%s [ERR]: I NEED localeIdentifier=%@", (uint8_t *)&v16, 0x16u);
    }

    v13 = 0;
  }

  return v13;
}

- (BOOL)registerWithAssetsDelegate:(id)a3
{
  id v4;
  NSObject *v5;
  BOOL v6;
  NSString *localeIdentifier;
  int v9;
  const char *v10;
  __int16 v11;
  NSString *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  CDMOSLoggerForCategory(0);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    localeIdentifier = self->_localeIdentifier;
    v9 = 136315394;
    v10 = "-[CDMFoundationClient registerWithAssetsDelegate:]";
    v11 = 2112;
    v12 = localeIdentifier;
    _os_log_debug_impl(&dword_21A2A0000, v5, OS_LOG_TYPE_DEBUG, "%s Register assets delegate for CDMFoundationClient for enabled DAG services for locale: %@", (uint8_t *)&v9, 0x16u);
  }

  v6 = +[CDMAssetsUtils registerWithAssetsDelegate:withType:withLocale:](CDMAssetsUtils, "registerWithAssetsDelegate:withType:withLocale:", v4, 0, self->_localeIdentifier);
  return v6;
}

- (BOOL)registerWithAssetsDelegate:(id)a3 withType:(int64_t)a4
{
  id v6;
  NSObject *v7;
  BOOL v8;
  NSString *localeIdentifier;
  int v11;
  const char *v12;
  __int16 v13;
  NSString *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  CDMOSLoggerForCategory(0);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    localeIdentifier = self->_localeIdentifier;
    v11 = 136315394;
    v12 = "-[CDMFoundationClient registerWithAssetsDelegate:withType:]";
    v13 = 2112;
    v14 = localeIdentifier;
    _os_log_debug_impl(&dword_21A2A0000, v7, OS_LOG_TYPE_DEBUG, "%s Register assets delegate for CDMFoundationClient for locale: %@", (uint8_t *)&v11, 0x16u);
  }

  v8 = +[CDMAssetsUtils registerWithAssetsDelegate:withType:withLocale:](CDMAssetsUtils, "registerWithAssetsDelegate:withType:withLocale:", v6, a4, self->_localeIdentifier);
  return v8;
}

- (void)setup:(id)a3
{
  -[CDMFoundationClient setup:nullableCompletionHandler:](self, "setup:nullableCompletionHandler:", a3, 0);
}

- (void)warmupWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *v5;
  NSUUID *nlSetupId;
  NSUUID *v7;
  NSUUID *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  NSString *v13;
  CDMWarmupRequestCommand *v14;
  NSObject *v15;
  id v16;
  void *v17;
  NSObject *v18;
  __CFString *v19;
  _QWORD aBlock[4];
  id v21;
  id v22;
  id v23;
  _BYTE location[12];
  __int16 v25;
  const __CFString *v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  CDMOSLoggerForCategory(0);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)location = 136315138;
    *(_QWORD *)&location[4] = "-[CDMFoundationClient warmupWithCompletionHandler:]";
    _os_log_debug_impl(&dword_21A2A0000, v5, OS_LOG_TYPE_DEBUG, "%s CDMClient warmup called", location, 0xCu);
  }

  nlSetupId = self->_nlSetupId;
  if (!nlSetupId)
  {
    v7 = (NSUUID *)objc_alloc_init(MEMORY[0x24BDD1880]);
    v8 = self->_nlSetupId;
    self->_nlSetupId = v7;

    CDMOSLoggerForCategory(0);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      -[NSUUID UUIDString](self->_nlSetupId, "UUIDString");
      v19 = (__CFString *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)location = 136315394;
      *(_QWORD *)&location[4] = "-[CDMFoundationClient warmupWithCompletionHandler:]";
      v25 = 2112;
      v26 = v19;
      _os_log_debug_impl(&dword_21A2A0000, v9, OS_LOG_TYPE_DEBUG, "%s CDMClient warmup has no nlSetupId set. Minting: %@", location, 0x16u);

    }
    nlSetupId = self->_nlSetupId;
  }
  objc_msgSend(MEMORY[0x24BE9E320], "convertFromUUID:", nlSetupId);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_dynamicConfig)
  {
    +[CDMSELFLogUtil createSELFMetadataWithNlId:andWithTrpId:andWithRequestId:andWithResultCandidateId:andWithConnectionId:](CDMSELFLogUtil, "createSELFMetadataWithNlId:andWithTrpId:andWithRequestId:andWithResultCandidateId:andWithConnectionId:", v10, 0, 0, CFSTR("0"), self->_invocationSource);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[CDMDynamicConfig graphName](self->_dynamicConfig, "graphName");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[CDMDynamicConfig resolveActiveGraph:](CDMDynamicConfig, "resolveActiveGraph:", v12);
    v13 = (NSString *)objc_claimAutoreleasedReturnValue();

    +[CDMSELFLogUtil cdmClientWarmupStarted:logMessage:currentServiceGraph:dataDispatcherContext:](CDMSELFLogUtil, "cdmClientWarmupStarted:logMessage:currentServiceGraph:dataDispatcherContext:", v11, CFSTR("SELF client warmup started message emitted"), -[objc_class getNLXSchemaCDMServiceGraphName](NSClassFromString(v13), "getNLXSchemaCDMServiceGraphName"), self->_dataDispatcherContext);
    v14 = -[CDMWarmupRequestCommand initWithDynamicConfig:selfMetadata:]([CDMWarmupRequestCommand alloc], "initWithDynamicConfig:selfMetadata:", self->_dynamicConfig, v11);
    CDMOSLoggerForCategory(0);
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)location = 136315394;
      *(_QWORD *)&location[4] = "-[CDMFoundationClient warmupWithCompletionHandler:]";
      v25 = 2112;
      v26 = (const __CFString *)v14;
      _os_log_debug_impl(&dword_21A2A0000, v15, OS_LOG_TYPE_DEBUG, "%s Created CDMWarmupCommand to pass into active graph, %@", location, 0x16u);
    }

    objc_initWeak((id *)location, self);
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 3221225472;
    aBlock[2] = __51__CDMFoundationClient_warmupWithCompletionHandler___block_invoke;
    aBlock[3] = &unk_24DCAB6F8;
    objc_copyWeak(&v23, (id *)location);
    v16 = v11;
    v21 = v16;
    v22 = v4;
    v17 = _Block_copy(aBlock);
    -[CDMFoundationClient doHandleCommand:forCallback:](self, "doHandleCommand:forCallback:", v14, v17);

    objc_destroyWeak(&v23);
    objc_destroyWeak((id *)location);

  }
  else
  {
    -[CDMClientInterface createNSError:errorCode:](self, "createNSError:errorCode:", CFSTR("warmupWithCompletionHandler called but dynamicConfig is nil. Did you have a successful setup?"), 3);
    v16 = (id)objc_claimAutoreleasedReturnValue();
    CDMOSLoggerForCategory(0);
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)location = 136315394;
      *(_QWORD *)&location[4] = "-[CDMFoundationClient warmupWithCompletionHandler:]";
      v25 = 2112;
      v26 = CFSTR("warmupWithCompletionHandler called but dynamicConfig is nil. Did you have a successful setup?");
      _os_log_error_impl(&dword_21A2A0000, v18, OS_LOG_TYPE_ERROR, "%s [ERR]: %@", location, 0x16u);
    }

    +[CDMSELFLogUtil createSELFMetadataWithNlId:andWithTrpId:andWithRequestId:andWithResultCandidateId:andWithConnectionId:](CDMSELFLogUtil, "createSELFMetadataWithNlId:andWithTrpId:andWithRequestId:andWithResultCandidateId:andWithConnectionId:", v10, 0, 0, CFSTR("0"), self->_invocationSource);
    v13 = (NSString *)objc_claimAutoreleasedReturnValue();
    +[CDMSELFLogUtil cdmClientWarmupFailed:errorDomain:errorCode:logMessage:dataDispatcherContext:](CDMSELFLogUtil, "cdmClientWarmupFailed:errorDomain:errorCode:logMessage:dataDispatcherContext:", v13, 1, objc_msgSend(v16, "code"), CFSTR("SELF client warmup failed message emitted"), self->_dataDispatcherContext);
    (*((void (**)(id, id))v4 + 2))(v4, v16);
  }

}

- (void)processCDMNluRequest:(id)a3
{
  -[CDMFoundationClient processCDMNluRequest:nullableCompletionHandler:](self, "processCDMNluRequest:nullableCompletionHandler:", a3, 0);
}

- (void)processCDMNluRequest:(id)a3 nullableCompletionHandler:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD, void *);
  NSObject *v8;
  char *v9;
  NSObject *v10;
  NSObject *v11;
  unint64_t v12;
  NSObject *v13;
  os_signpost_id_t v14;
  os_signpost_id_t v15;
  CDMClientDelegate *delegate;
  void *v17;
  NSObject *v18;
  NSObject *v19;
  NSObject *v20;
  siri::ontology *v21;
  void *v22;
  _BOOL4 v23;
  CDMNluRequestID *v24;
  void *v25;
  CDMNluRequestID *v26;
  CDMAssistantNLUCommand *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  NSObject *v33;
  NSObject *v34;
  siri::ontology *v35;
  NSObject *v36;
  NSObject *v37;
  NSObject *v38;
  siri::ontology *v39;
  NSObject *v40;
  NSObject *v41;
  void *v42;
  NSObject *v43;
  NSObject *v44;
  siri::ontology *v45;
  CDMNluRequestID *v46;
  void *v47;
  CDMAssistantNLUCommand *v48;
  _QWORD aBlock[4];
  CDMNluRequestID *v50;
  CDMFoundationClient *v51;
  void (**v52)(id, _QWORD, void *);
  id v53[2];
  uint8_t buf[4];
  const char *v55;
  __int16 v56;
  id v57;
  uint64_t v58;

  v58 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void (**)(id, _QWORD, void *))a4;
  CDMOSLoggerForCategory(0);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v55 = "-[CDMFoundationClient processCDMNluRequest:nullableCompletionHandler:]";
    v56 = 2112;
    v57 = v6;
    _os_log_impl(&dword_21A2A0000, v8, OS_LOG_TYPE_INFO, "%s CDMClient processCDMNluRequest... %@", buf, 0x16u);
  }

  v9 = (char *)os_signpost_id_generate((os_log_t)CDMLogContext);
  v10 = (id)CDMLogContext;
  v11 = v10;
  v12 = (unint64_t)(v9 - 1);
  if ((unint64_t)(v9 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_21A2A0000, v11, OS_SIGNPOST_INTERVAL_BEGIN, (os_signpost_id_t)v9, "ondevice_nl_time", "On device NL process time enableTelemetry=YES", buf, 2u);
  }

  v13 = (id)CDMLogContext;
  v14 = os_signpost_id_generate((os_log_t)CDMLogContext);
  if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v15 = v14;
    if (os_signpost_enabled(v13))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_21A2A0000, v13, OS_SIGNPOST_EVENT, v15, "requestSent", "RequestDispatcher calling CDM with CDMNluRequest", buf, 2u);
    }
  }

  delegate = self->_delegate;
  if (v7)
  {
    if (delegate)
    {
      -[CDMClientInterface createNSError:errorCode:](self, "createNSError:errorCode:", CFSTR("Using processCDMNluRequest:completionHandler with delegate not supported"), 1);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      CDMOSLoggerForCategory(0);
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        v55 = "-[CDMFoundationClient processCDMNluRequest:nullableCompletionHandler:]";
        _os_log_error_impl(&dword_21A2A0000, v18, OS_LOG_TYPE_ERROR, "%s [ERR]: Using processCDMNluRequest:completionHandler with delegate is not supported use [CDMClient init]", buf, 0xCu);
      }

      v19 = (id)CDMLogContext;
      v20 = v19;
      if (v12 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v19))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_21A2A0000, v20, OS_SIGNPOST_INTERVAL_END, (os_signpost_id_t)v9, "ondevice_nl_time", " enableTelemetry=YES ", buf, 2u);
      }

      siri::ontology::resetSharedUsoVocabManager(v21);
      v7[2](v7, 0, v17);
      goto LABEL_49;
    }
LABEL_18:
    if (v6)
    {
      objc_msgSend(v6, "objcProto");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = v22 == 0;

      if (!v23)
      {
        objc_msgSend(v6, "objcProto");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = [CDMNluRequestID alloc];
        objc_msgSend(v17, "requestId");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = -[CDMNluRequestID initWithObjcProto:](v24, "initWithObjcProto:", v25);

        if (-[CDMClientInterface successFromSetup](self, "successFromSetup"))
        {
          objc_initWeak((id *)buf, self);
          aBlock[0] = MEMORY[0x24BDAC760];
          aBlock[1] = 3221225472;
          aBlock[2] = __70__CDMFoundationClient_processCDMNluRequest_nullableCompletionHandler___block_invoke;
          aBlock[3] = &unk_24DCAB720;
          objc_copyWeak(v53, (id *)buf);
          v53[1] = v9;
          v52 = v7;
          v46 = v26;
          v50 = v46;
          v51 = self;
          v47 = _Block_copy(aBlock);
          v27 = [CDMAssistantNLUCommand alloc];
          objc_msgSend(v17, "requestId");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "connectionId");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v48 = -[CDMAssistantNLUCommand initWithNLURequest:clientId:dataDispatcherContext:](v27, "initWithNLURequest:clientId:dataDispatcherContext:", v17, v29, self->_dataDispatcherContext);

          -[CDMServiceCenter getAssetPaths](self->_serviceCenter, "getAssetPaths");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "requestId");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          +[CDMSELFLogUtil createSELFMetadataWithRequestId:](CDMSELFLogUtil, "createSELFMetadataWithRequestId:", v31);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          +[CDMSELFLogUtil cdmAssetsReported:metadata:dataDispatcherContext:](CDMSELFLogUtil, "cdmAssetsReported:metadata:dataDispatcherContext:", v30, v32, self->_dataDispatcherContext);

          siri::ontology::resetSharedUsoVocabManager((siri::ontology *)-[CDMFoundationClient doHandleCommand:forCallback:](self, "doHandleCommand:forCallback:", v48, v47));
          objc_destroyWeak(v53);

          objc_destroyWeak((id *)buf);
          v26 = v46;
        }
        else
        {
          -[CDMClientInterface createNSError:errorCode:](self, "createNSError:errorCode:", CFSTR("CDMClient not ready to process request, did you call setup and got success back?"), 1);
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          v43 = (id)CDMLogContext;
          v44 = v43;
          if (v12 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v43))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl(&dword_21A2A0000, v44, OS_SIGNPOST_INTERVAL_END, (os_signpost_id_t)v9, "ondevice_nl_time", " enableTelemetry=YES ", buf, 2u);
          }

          if (v7)
            v45 = (siri::ontology *)((uint64_t (*)(id, _QWORD, void *))v7[2])(v7, 0, v42);
          else
            v45 = (siri::ontology *)-[CDMClientDelegate processCDMNluRequestErrorCallback:error:](self->_delegate, "processCDMNluRequestErrorCallback:error:", v26, v42);
          siri::ontology::resetSharedUsoVocabManager(v45);

        }
        goto LABEL_48;
      }
      -[CDMClientInterface createNSError:errorCode:](self, "createNSError:errorCode:", CFSTR("This should not be nil SIRINLUEXTERNALCDMNluRequest"), 1);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      +[CDMFoundationClient createEmptyNluRequestId](CDMFoundationClient, "createEmptyNluRequestId");
      v26 = (CDMNluRequestID *)objc_claimAutoreleasedReturnValue();
      v40 = (id)CDMLogContext;
      v41 = v40;
      if (v12 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v40))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_21A2A0000, v41, OS_SIGNPOST_INTERVAL_END, (os_signpost_id_t)v9, "ondevice_nl_time", " enableTelemetry=YES ", buf, 2u);
      }

      if (v7)
        goto LABEL_26;
    }
    else
    {
      -[CDMClientInterface createNSError:errorCode:](self, "createNSError:errorCode:", CFSTR("Trust but verify: got nil CDMNluRequest"), 1);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      +[CDMFoundationClient createEmptyNluRequestId](CDMFoundationClient, "createEmptyNluRequestId");
      v26 = (CDMNluRequestID *)objc_claimAutoreleasedReturnValue();
      v33 = (id)CDMLogContext;
      v34 = v33;
      if (v12 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v33))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_21A2A0000, v34, OS_SIGNPOST_INTERVAL_END, (os_signpost_id_t)v9, "ondevice_nl_time", " enableTelemetry=YES ", buf, 2u);
      }

      if (v7)
      {
LABEL_26:
        v35 = (siri::ontology *)((uint64_t (*)(id, _QWORD, void *))v7[2])(v7, 0, v17);
LABEL_44:
        siri::ontology::resetSharedUsoVocabManager(v35);
LABEL_48:

LABEL_49:
        goto LABEL_50;
      }
    }
    v35 = (siri::ontology *)-[CDMClientDelegate processCDMNluRequestErrorCallback:error:](self->_delegate, "processCDMNluRequestErrorCallback:error:", v26, v17);
    goto LABEL_44;
  }
  if (delegate)
    goto LABEL_18;
  CDMOSLoggerForCategory(0);
  v36 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315138;
    v55 = "-[CDMFoundationClient processCDMNluRequest:nullableCompletionHandler:]";
    _os_log_error_impl(&dword_21A2A0000, v36, OS_LOG_TYPE_ERROR, "%s [ERR]: No delegate set? did you init with a valid delegate [CDMClient initWithDelegate:]?", buf, 0xCu);
  }

  v37 = (id)CDMLogContext;
  v38 = v37;
  if (v12 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v37))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_21A2A0000, v38, OS_SIGNPOST_INTERVAL_END, (os_signpost_id_t)v9, "ondevice_nl_time", " enableTelemetry=YES ", buf, 2u);
  }

  siri::ontology::resetSharedUsoVocabManager(v39);
LABEL_50:

}

- (void)setDataDispatcherContext:(id)a3
{
  objc_storeStrong((id *)&self->_dataDispatcherContext, a3);
}

- (void)waitForDataDispatcherCompletion
{
  NSObject *v2;

  +[CDMDataDispatcherCompletionQueue getDataDispatcherCompletionQueue](CDMDataDispatcherCompletionQueue, "getDataDispatcherCompletionQueue");
  v2 = objc_claimAutoreleasedReturnValue();
  dispatch_barrier_async_and_wait(v2, &__block_literal_global_93);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_invocationSource, 0);
  objc_storeStrong((id *)&self->_nlSetupId, 0);
  objc_storeStrong((id *)&self->_dataDispatcherContext, 0);
  objc_storeStrong((id *)&self->_dynamicConfig, 0);
  objc_storeStrong((id *)&self->_eventRegister, 0);
  objc_storeStrong((id *)&self->_localeIdentifier, 0);
  objc_storeStrong((id *)&self->_serviceCenter, 0);
  objc_storeStrong((id *)&self->_delegate, 0);
}

void __54__CDMFoundationClient_waitForDataDispatcherCompletion__block_invoke()
{
  NSObject *v0;
  int v1;
  const char *v2;
  __int16 v3;
  const char *v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  CDMOSLoggerForCategory(0);
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEBUG))
  {
    v1 = 136315394;
    v2 = "-[CDMFoundationClient waitForDataDispatcherCompletion]_block_invoke";
    v3 = 2080;
    v4 = "-[CDMFoundationClient waitForDataDispatcherCompletion]_block_invoke";
    _os_log_debug_impl(&dword_21A2A0000, v0, OS_LOG_TYPE_DEBUG, "%s %s: all blocks in the background CDMDataDispatcherCompletionQueue have been completed.", (uint8_t *)&v1, 0x16u);
  }

}

void __70__CDMFoundationClient_processCDMNluRequest_nullableCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id *WeakRetained;
  NSObject *v8;
  NSObject *v9;
  os_signpost_id_t v10;
  os_signpost_id_t v11;
  NSObject *v12;
  NSObject *v13;
  NSObject *v14;
  os_signpost_id_t v15;
  uint64_t v16;
  id v17;
  void *v18;
  NSObject *v19;
  NSObject *v20;
  NSObject *v21;
  os_signpost_id_t v22;
  uint64_t v23;
  NSObject *v24;
  NSObject *v25;
  os_signpost_id_t v26;
  uint64_t v27;
  id v28;
  uint64_t v29;
  uint8_t buf[4];
  const char *v31;
  __int16 v32;
  uint64_t v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    CDMOSLoggerForCategory(0);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v31 = "-[CDMFoundationClient processCDMNluRequest:nullableCompletionHandler:]_block_invoke";
      _os_log_impl(&dword_21A2A0000, v8, OS_LOG_TYPE_INFO, "%s CDM graph finished processing, ready to send response back to SiriRequestDispatcher (SRD)", buf, 0xCu);
    }

    v9 = (id)CDMLogContext;
    v10 = os_signpost_id_generate((os_log_t)CDMLogContext);
    if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v11 = v10;
      if (os_signpost_enabled(v9))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_21A2A0000, v9, OS_SIGNPOST_EVENT, v11, "responseReceivedRequestDispatcher received a SIRINLUResponse (or error) from CDM", ", buf, 2u);
      }
    }

    if (v6)
    {
      CDMOSLoggerForCategory(0);
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v6, "localizedDescription");
        v28 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v29 = objc_msgSend(v28, "UTF8String");
        *(_DWORD *)buf = 136315394;
        v31 = "-[CDMFoundationClient processCDMNluRequest:nullableCompletionHandler:]_block_invoke";
        v32 = 2080;
        v33 = v29;
        _os_log_error_impl(&dword_21A2A0000, v12, OS_LOG_TYPE_ERROR, "%s [ERR]: %s", buf, 0x16u);

      }
      v13 = (id)CDMLogContext;
      v14 = v13;
      v15 = *(_QWORD *)(a1 + 64);
      if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_21A2A0000, v14, OS_SIGNPOST_INTERVAL_END, v15, "ondevice_nl_time", " enableTelemetry=YES ", buf, 2u);
      }

      v16 = *(_QWORD *)(a1 + 48);
      if (v16)
        (*(void (**)(uint64_t, _QWORD, id))(v16 + 16))(v16, 0, v6);
      else
        objc_msgSend(WeakRetained[4], "processCDMNluRequestErrorCallback:error:", *(_QWORD *)(a1 + 32), v6);
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v17 = v5;
        objc_msgSend(v17, "cdmNluResponse");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        CDMOSLoggerForCategory(0);
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315394;
          v31 = "-[CDMFoundationClient processCDMNluRequest:nullableCompletionHandler:]_block_invoke";
          v32 = 2112;
          v33 = (uint64_t)v17;
          _os_log_impl(&dword_21A2A0000, v19, OS_LOG_TYPE_INFO, "%s CDM graph finished processing, sending response back to SiriRequestDispatcher (SRD): %@", buf, 0x16u);
        }

        v20 = (id)CDMLogContext;
        v21 = v20;
        v22 = *(_QWORD *)(a1 + 64);
        if (v22 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v20))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_21A2A0000, v21, OS_SIGNPOST_INTERVAL_END, v22, "ondevice_nl_time", " enableTelemetry=YES ", buf, 2u);
        }

        v23 = *(_QWORD *)(a1 + 48);
        if (v23)
          (*(void (**)(uint64_t, void *, _QWORD))(v23 + 16))(v23, v18, 0);
        else
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 32), "processCDMNluRequestCallback:", v18);
      }
      else
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Expecting CDMGenericSendCommand, but got %@"), v5);
        v17 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(WeakRetained, "createNSError:errorCode:", v17, 2);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = (id)CDMLogContext;
        v25 = v24;
        v26 = *(_QWORD *)(a1 + 64);
        if (v26 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v24))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_21A2A0000, v25, OS_SIGNPOST_INTERVAL_END, v26, "ondevice_nl_time", " enableTelemetry=YES ", buf, 2u);
        }

        v27 = *(_QWORD *)(a1 + 48);
        if (v27)
          (*(void (**)(uint64_t, _QWORD, void *))(v27 + 16))(v27, 0, v18);
        else
          objc_msgSend(WeakRetained[4], "processCDMNluRequestErrorCallback:error:", *(_QWORD *)(a1 + 32), v18);
      }

    }
  }

}

void __51__CDMFoundationClient_warmupWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  _QWORD *WeakRetained;
  NSObject *v8;
  NSObject *v9;
  id v10;
  uint64_t v11;
  int v12;
  const char *v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    CDMOSLoggerForCategory(0);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v12 = 136315650;
      v13 = "-[CDMFoundationClient warmupWithCompletionHandler:]_block_invoke";
      v14 = 2112;
      v15 = (uint64_t)v5;
      v16 = 2112;
      v17 = v6;
      _os_log_impl(&dword_21A2A0000, v8, OS_LOG_TYPE_INFO, "%s CDM graph finished processing, output=%@, error=%@", (uint8_t *)&v12, 0x20u);
    }

    if (v6)
    {
      CDMOSLoggerForCategory(0);
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v6, "localizedDescription");
        v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v11 = objc_msgSend(v10, "UTF8String");
        v12 = 136315394;
        v13 = "-[CDMFoundationClient warmupWithCompletionHandler:]_block_invoke";
        v14 = 2080;
        v15 = v11;
        _os_log_error_impl(&dword_21A2A0000, v9, OS_LOG_TYPE_ERROR, "%s [ERR]: %s", (uint8_t *)&v12, 0x16u);

      }
      +[CDMSELFLogUtil cdmClientWarmupFailed:errorDomain:errorCode:logMessage:dataDispatcherContext:](CDMSELFLogUtil, "cdmClientWarmupFailed:errorDomain:errorCode:logMessage:dataDispatcherContext:", *(_QWORD *)(a1 + 32), 2, objc_msgSend(v6, "code"), CFSTR("SELF client warmup failed message emitted"), WeakRetained[9]);
      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    }
    else
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
      +[CDMSELFLogUtil cdmClientWarmupEnded:logMessage:dataDispatcherContext:](CDMSELFLogUtil, "cdmClientWarmupEnded:logMessage:dataDispatcherContext:", *(_QWORD *)(a1 + 32), CFSTR("SELF client warmup ended message emitted"), WeakRetained[9]);
    }
  }

}

+ (id)createEmptyNluRequestId
{
  NSObject *v2;
  id v3;
  CDMNluRequestID *v4;
  int v6;
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  CDMOSLoggerForCategory(0);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v6 = 136315138;
    v7 = "+[CDMFoundationClient createEmptyNluRequestId]";
    _os_log_impl(&dword_21A2A0000, v2, OS_LOG_TYPE_INFO, "%s [WARN]: Creating an empty CDMNluRequestID object to send back", (uint8_t *)&v6, 0xCu);
  }

  v3 = objc_alloc_init(MEMORY[0x24BE9E0F0]);
  objc_msgSend(v3, "setIdA:", CFSTR("received-invalid-CDMNluRequest"));
  objc_msgSend(v3, "setConnectionId:", CFSTR("received-invalid-CDMNluRequest"));
  v4 = -[CDMNluRequestID initWithObjcProto:]([CDMNluRequestID alloc], "initWithObjcProto:", v3);

  return v4;
}

- (id)handleableXPCEventStreams
{
  return -[XPCStreamEventRegister handleableXPCEventStreams](self->_eventRegister, "handleableXPCEventStreams");
}

- (id)handleableXPCActivities
{
  return -[XPCStreamEventRegister handleableXPCActivities](self->_eventRegister, "handleableXPCActivities");
}

- (BOOL)handleXPCEvent:(id)a3 fromStream:(id)a4
{
  return -[CDMServiceCenter handleXPCEvent:fromStream:withRegister:](self->_serviceCenter, "handleXPCEvent:fromStream:withRegister:", a3, a4, self->_eventRegister);
}

- (BOOL)handleXPCActivity:(id)a3 fromIdentifier:(id)a4
{
  return -[CDMServiceCenter handleXPCActivity:fromIdentifier:withRegister:](self->_serviceCenter, "handleXPCActivity:fromIdentifier:withRegister:", a3, a4, self->_eventRegister);
}

@end
