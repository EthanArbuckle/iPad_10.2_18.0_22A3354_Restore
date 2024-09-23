@implementation CDMMentionDetectorService

- (id)handleRequestCommandTypeNames
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDBCF20];
  +[CDMBaseCommand commandName](CDMMentionDetectorRequestCommand, "commandName");
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
  return +[CDMFeatureFlags isMarrsMentionDetectorEnabled](CDMFeatureFlags, "isMarrsMentionDetectorEnabled");
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
  v6 = CFSTR("marrs/md");
  v7 = CFSTR("com.apple.siri.nl.marrs.md");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v6, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v3;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CDMServiceAssetConfig addCDMFactorToFoldersMapping:forAssetSet:](v2, "addCDMFactorToFoldersMapping:forAssetSet:", v4, 0);

  -[CDMServiceAssetConfig setIsAssetRequiredForSetup:](v2, "setIsAssetRequiredForSetup:", 0);
  return v2;
}

- (id)setup:(id)a3
{
  id v4;
  NSObject *v5;
  CDMSetupResponseCommand *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  MRRMultimodalMentionDetector *v12;
  id v13;
  MRRMultimodalMentionDetector *mentionDetector;
  void *v15;
  void *v16;
  CDMSetupResponseCommand *v17;
  NSObject *v18;
  NSObject *v19;
  CDMSetupResponseCommand *v20;
  id v22;
  uint8_t buf[4];
  const char *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  CDMOSLoggerForCategory(0);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v24 = "-[CDMMentionDetectorService setup:]";
    _os_log_impl(&dword_21A2A0000, v5, OS_LOG_TYPE_INFO, "%s Setting up Mention Detector service", buf, 0xCu);
  }

  v6 = objc_alloc_init(CDMSetupResponseCommand);
  objc_msgSend(v4, "dynamicConfig");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "getAssetBundlePathForFactorName:", CFSTR("com.apple.siri.nl.marrs.md"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v8, "resourcePath");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dynamicConfig");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "languageCode");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 0;
    -[CDMMentionDetectorService getPredictor:forLocale:status:](self, "getPredictor:forLocale:status:", v9, v11, &v22);
    v12 = (MRRMultimodalMentionDetector *)objc_claimAutoreleasedReturnValue();
    v13 = v22;
    mentionDetector = self->_mentionDetector;
    self->_mentionDetector = v12;

    if (v13)
    {
      objc_msgSend(v13, "localizedDescription");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[CDMBaseService createErrorWithCode:description:](self, "createErrorWithCode:description:", 1, v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[CDMBaseCommand setCmdError:](v6, "setCmdError:", v16);

      self->super.super._serviceState = 4;
      v17 = v6;
      goto LABEL_12;
    }
  }
  else
  {
    CDMOSLoggerForCategory(0);
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v24 = "-[CDMMentionDetectorService setup:]";
      _os_log_impl(&dword_21A2A0000, v18, OS_LOG_TYPE_INFO, "%s Mention Detector model bundle not found", buf, 0xCu);
    }

  }
  self->super.super._serviceState = 2;
  CDMOSLoggerForCategory(0);
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v24 = "-[CDMMentionDetectorService setup:]";
    _os_log_impl(&dword_21A2A0000, v19, OS_LOG_TYPE_INFO, "%s Mention Detector loaded", buf, 0xCu);
  }

  v13 = 0;
  -[CDMBaseService createSetupResponseCommand](self, "createSetupResponseCommand");
  v17 = (CDMSetupResponseCommand *)objc_claimAutoreleasedReturnValue();
LABEL_12:
  v20 = v17;

  return v20;
}

- (id)handle:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  _BOOL4 v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _BOOL4 v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  CDMMentionDetectorResponseCommand *v19;
  void *v20;
  _BOOL4 v21;
  NSObject *v22;
  id v24;
  uint8_t buf[4];
  const char *v26;
  __int16 v27;
  const __CFString *v28;
  __int16 v29;
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  CDMOSLoggerForCategory(0);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v26 = "-[CDMMentionDetectorService handle:]";
    _os_log_impl(&dword_21A2A0000, v5, OS_LOG_TYPE_INFO, "%s Calling Mention Detection", buf, 0xCu);
  }

  if (!v4
    || !self->_mentionDetector
    || (objc_msgSend(v4, "mdRequest"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v7 = v6 == 0,
        v6,
        v7))
  {
    CDMOSLoggerForCategory(0);
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v26 = "-[CDMMentionDetectorService handle:]";
      _os_log_error_impl(&dword_21A2A0000, v18, OS_LOG_TYPE_ERROR, "%s [ERR]: Mention Detection: Either Request and/or Predictor is nil", buf, 0xCu);
    }
    goto LABEL_20;
  }
  objc_msgSend(v4, "turnInput");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_msgSend(v4, "turnInput");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "turnContext");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "nlContext");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "salientEntities");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "count") == 0;

    if (v13)
    {
      CDMOSLoggerForCategory(0);
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315138;
        v26 = "-[CDMMentionDetectorService handle:]";
        _os_log_debug_impl(&dword_21A2A0000, v18, OS_LOG_TYPE_DEBUG, "%s Skipping MD as there are no salient entities", buf, 0xCu);
      }
LABEL_20:
      v19 = 0;
      goto LABEL_21;
    }
  }
  v14 = CDMLogContext;
  if (os_log_type_enabled((os_log_t)CDMLogContext, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315650;
    v26 = "-[CDMMentionDetectorService handle:]";
    v27 = 2112;
    v28 = CFSTR("mentiondetector");
    v29 = 2112;
    v30 = v4;
    _os_log_debug_impl(&dword_21A2A0000, v14, OS_LOG_TYPE_DEBUG, "%s [insights-cdm-%@]:\nMENTIONDETECTORRequest: %@", buf, 0x20u);
  }
  if (+[CDMFeatureFlags isLogNluEnabled](CDMFeatureFlags, "isLogNluEnabled"))
  {
    objc_msgSend(v4, "mdRequest");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    +[CDMMentionDetectorServiceUtils logMDRequestToFile:](CDMMentionDetectorServiceUtils, "logMDRequestToFile:", v15);

  }
  objc_msgSend(v4, "mdRequest");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = 0;
  -[CDMMentionDetectorService predictWithInput:forLocale:status:](self, "predictWithInput:forLocale:status:", v16, 0, &v24);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v24;

  v19 = -[CDMMentionDetectorResponseCommand initWithResponse:]([CDMMentionDetectorResponseCommand alloc], "initWithResponse:", v17);
  -[CDMBaseCommand setCmdError:](v19, "setCmdError:", v18);
  if (+[CDMFeatureFlags isLogNluEnabled](CDMFeatureFlags, "isLogNluEnabled"))
  {
    -[CDMBaseCommand cmdError](v19, "cmdError");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v20 == 0;

    if (v21)
      +[CDMMentionDetectorServiceUtils logMDResponseToFile:](CDMMentionDetectorServiceUtils, "logMDResponseToFile:", v17);
  }
  v22 = CDMLogContext;
  if (os_log_type_enabled((os_log_t)CDMLogContext, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315650;
    v26 = "-[CDMMentionDetectorService handle:]";
    v27 = 2112;
    v28 = CFSTR("mentiondetector");
    v29 = 2112;
    v30 = v17;
    _os_log_debug_impl(&dword_21A2A0000, v22, OS_LOG_TYPE_DEBUG, "%s [insights-cdm-%@]:\nMENTIONDETECTORResponse: %@", buf, 0x20u);
  }

LABEL_21:
  return v19;
}

- (id)getPredictor:(id)a3 forLocale:(id)a4 status:(id *)a5
{
  id v7;
  id v8;
  void *v9;

  v7 = a3;
  v8 = a4;
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE64040]), "initWithAssets:forLocale:status:", v7, v8, a5);

  return v9;
}

- (id)predictWithInput:(id)a3 forLocale:(id)a4 status:(id *)a5
{
  -[MRRMultimodalMentionDetector detectMentionsInUtteranceRequest:status:](self->_mentionDetector, "detectMentionsInUtteranceRequest:status:", a3, a5);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (MRRMultimodalMentionDetector)mentionDetector
{
  return self->_mentionDetector;
}

- (void)setMentionDetector:(id)a3
{
  objc_storeStrong((id *)&self->_mentionDetector, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mentionDetector, 0);
}

@end
