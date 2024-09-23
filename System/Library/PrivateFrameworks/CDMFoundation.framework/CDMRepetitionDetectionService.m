@implementation CDMRepetitionDetectionService

- (id)handleRequestCommandTypeNames
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDBCF20];
  +[CDMBaseCommand commandName](CDMRepetitionDetectionRequestCommand, "commandName");
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
  return +[CDMFeatureFlags isRepetitionDetectionEnabled](CDMFeatureFlags, "isRepetitionDetectionEnabled");
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
  v6 = CFSTR("marrs/rd");
  v7 = CFSTR("com.apple.siri.nl.marrs.rd");
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
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  QueryRewriter *v11;
  id v12;
  QueryRewriter *repetitionDetector;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  id v19;
  uint8_t buf[4];
  const char *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  CDMOSLoggerForCategory(0);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v21 = "-[CDMRepetitionDetectionService setup:]";
    _os_log_impl(&dword_21A2A0000, v5, OS_LOG_TYPE_INFO, "%s Setting up Repetition Detection service", buf, 0xCu);
  }

  objc_msgSend(v4, "dynamicConfig");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "getAssetBundlePathForFactorName:", CFSTR("com.apple.siri.nl.marrs.rd"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v4, "dynamicConfig");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "languageCode");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "resourcePath");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 0;
    -[CDMRepetitionDetectionService getPredictor:FilesPath:status:](self, "getPredictor:FilesPath:status:", v9, v10, &v19);
    v11 = (QueryRewriter *)objc_claimAutoreleasedReturnValue();
    v12 = v19;
    repetitionDetector = self->_repetitionDetector;
    self->_repetitionDetector = v11;

    if (v12)
    {
      objc_msgSend(v12, "localizedDescription");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[CDMBaseService createErrorWithCode:description:](self, "createErrorWithCode:description:", 1, v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      self->super.super._serviceState = 4;
    }
    else
    {
      self->super.super._serviceState = 2;
      CDMOSLoggerForCategory(0);
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        v21 = "-[CDMRepetitionDetectionService setup:]";
        _os_log_impl(&dword_21A2A0000, v16, OS_LOG_TYPE_INFO, "%s Repetition Detector loaded", buf, 0xCu);
      }

      v15 = 0;
    }

  }
  else
  {
    -[CDMBaseService createErrorWithCode:description:](self, "createErrorWithCode:description:", 1, CFSTR("Not able to find Repetition Detection model bundle directory"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    self->super.super._serviceState = 4;
  }
  -[CDMBaseService createSetupResponseCommand](self, "createSetupResponseCommand");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setCmdError:", v15);

  return v17;
}

- (id)handle:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  _BOOL4 v7;
  NSObject *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  CDMRepetitionDetectionResponseCommand *v12;
  NSObject *v13;
  const char *v14;
  NSObject *v15;
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
  CDMOSLoggerForCategory(0);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v20 = "-[CDMRepetitionDetectionService handle:]";
    _os_log_impl(&dword_21A2A0000, v5, OS_LOG_TYPE_INFO, "%s Calling Repetition Detection", buf, 0xCu);
  }

  if (!self->_repetitionDetector)
  {
    CDMOSLoggerForCategory(0);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v20 = "-[CDMRepetitionDetectionService handle:]";
      _os_log_error_impl(&dword_21A2A0000, v11, OS_LOG_TYPE_ERROR, "%s [ERR]: Repetition Detection: Predictor is not initialized correctly!", buf, 0xCu);
    }
    goto LABEL_14;
  }
  objc_msgSend(v4, "qrRequest");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6 == 0;

  if (v7)
  {
    CDMOSLoggerForCategory(0);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315138;
      v20 = "-[CDMRepetitionDetectionService handle:]";
      _os_log_debug_impl(&dword_21A2A0000, v11, OS_LOG_TYPE_DEBUG, "%s Repetition Detection: qrRequest is nil. Skipping RD Inference", buf, 0xCu);
    }
LABEL_14:
    v12 = 0;
    goto LABEL_21;
  }
  v8 = (id)CDMLogContext;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v4, "qrRequest");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315650;
    v20 = "-[CDMRepetitionDetectionService handle:]";
    v21 = 2112;
    v22 = CFSTR("queryrewrite");
    v23 = 2112;
    v24 = v17;
    _os_log_debug_impl(&dword_21A2A0000, v8, OS_LOG_TYPE_DEBUG, "%s [insights-cdm-%@]:\nQUERYREWRITEQRRequest: %@", buf, 0x20u);

  }
  objc_msgSend(v4, "qrRequest");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0;
  -[CDMRepetitionDetectionService doInference:status:](self, "doInference:status:", v9, &v18);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v18;

  v12 = -[CDMRepetitionDetectionResponseCommand initWithResponse:]([CDMRepetitionDetectionResponseCommand alloc], "initWithResponse:", v10);
  -[CDMBaseCommand setCmdError:](v12, "setCmdError:", v11);
  if (objc_msgSend(v10, "repetitionType") == 3)
  {
    CDMOSLoggerForCategory(0);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v20 = "-[CDMRepetitionDetectionService handle:]";
      v14 = "%s Service Result: Full Repetition";
LABEL_17:
      _os_log_impl(&dword_21A2A0000, v13, OS_LOG_TYPE_INFO, v14, buf, 0xCu);
    }
  }
  else
  {
    CDMOSLoggerForCategory(0);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v20 = "-[CDMRepetitionDetectionService handle:]";
      v14 = "%s Service Result: No/Partial/Unavailable Repetition";
      goto LABEL_17;
    }
  }

  v15 = CDMLogContext;
  if (os_log_type_enabled((os_log_t)CDMLogContext, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315650;
    v20 = "-[CDMRepetitionDetectionService handle:]";
    v21 = 2112;
    v22 = CFSTR("queryrewrite");
    v23 = 2112;
    v24 = v10;
    _os_log_debug_impl(&dword_21A2A0000, v15, OS_LOG_TYPE_DEBUG, "%s [insights-cdm-%@]:\nQUERYREWRITEQRResponse: %@", buf, 0x20u);
  }

LABEL_21:
  return v12;
}

- (id)getPredictor:(id)a3 FilesPath:(id)a4 status:(id *)a5
{
  id v7;
  id v8;
  void *v9;

  v7 = a3;
  v8 = a4;
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE64050]), "initWithLocale:filesPath:predictorType:status:", v7, v8, 0, a5);

  return v9;
}

- (id)doInference:(id)a3 status:(id *)a4
{
  -[QueryRewriter predictWithInput:status:](self->_repetitionDetector, "predictWithInput:status:", a3, a4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (QueryRewriter)repetitionDetector
{
  return self->_repetitionDetector;
}

- (void)setRepetitionDetector:(id)a3
{
  objc_storeStrong((id *)&self->_repetitionDetector, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_repetitionDetector, 0);
}

@end
