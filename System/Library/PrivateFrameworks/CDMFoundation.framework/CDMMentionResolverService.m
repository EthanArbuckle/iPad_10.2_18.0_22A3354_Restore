@implementation CDMMentionResolverService

- (id)handleRequestCommandTypeNames
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDBCF20];
  +[CDMBaseCommand commandName](CDMMentionResolverRequestCommand, "commandName");
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
  return +[CDMFeatureFlags isMarrsMentionResolverEnabled](CDMFeatureFlags, "isMarrsMentionResolverEnabled");
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
  v6 = CFSTR("marrs/mr");
  v7 = CFSTR("com.apple.siri.nl.marrs.mr");
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
  MRRMultimodalMentionResolver *v12;
  id v13;
  MRRMultimodalMentionResolver *mentionResolver;
  void *v15;
  void *v16;
  CDMSetupResponseCommand *v17;
  NSObject *v18;
  void *v19;
  NSArray *v20;
  NSArray *overrideMentionsForReplay;
  NSObject *v22;
  CDMSetupResponseCommand *v23;
  id v25;
  uint8_t buf[4];
  const char *v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  CDMOSLoggerForCategory(0);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v27 = "-[CDMMentionResolverService setup:]";
    _os_log_impl(&dword_21A2A0000, v5, OS_LOG_TYPE_INFO, "%s Setting up Mention Resolver service", buf, 0xCu);
  }

  v6 = objc_alloc_init(CDMSetupResponseCommand);
  objc_msgSend(v4, "dynamicConfig");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "getAssetBundlePathForFactorName:", CFSTR("com.apple.siri.nl.marrs.mr"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v8, "resourcePath");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dynamicConfig");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "languageCode");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = 0;
    -[CDMMentionResolverService getPredictor:forLocale:status:](self, "getPredictor:forLocale:status:", v9, v11, &v25);
    v12 = (MRRMultimodalMentionResolver *)objc_claimAutoreleasedReturnValue();
    v13 = v25;
    mentionResolver = self->_mentionResolver;
    self->_mentionResolver = v12;

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
      v27 = "-[CDMMentionResolverService setup:]";
      _os_log_impl(&dword_21A2A0000, v18, OS_LOG_TYPE_INFO, "%s Mention Resolver model bundle not found", buf, 0xCu);
    }

  }
  objc_msgSend(v4, "dynamicConfig");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "overrideMentions");
  v20 = (NSArray *)objc_claimAutoreleasedReturnValue();
  overrideMentionsForReplay = self->_overrideMentionsForReplay;
  self->_overrideMentionsForReplay = v20;

  self->super.super._serviceState = 2;
  CDMOSLoggerForCategory(0);
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v27 = "-[CDMMentionResolverService setup:]";
    _os_log_impl(&dword_21A2A0000, v22, OS_LOG_TYPE_INFO, "%s Mention Resolver loaded", buf, 0xCu);
  }

  v13 = 0;
  -[CDMBaseService createSetupResponseCommand](self, "createSetupResponseCommand");
  v17 = (CDMSetupResponseCommand *)objc_claimAutoreleasedReturnValue();
LABEL_12:
  v23 = v17;

  return v23;
}

- (id)handle:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  _BOOL4 v7;
  NSObject *v8;
  CDMMentionResolverResponseCommand *v9;
  NSObject *v10;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  id v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  const __CFString *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  CDMOSLoggerForCategory(0);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v18 = "-[CDMMentionResolverService handle:]";
    _os_log_impl(&dword_21A2A0000, v5, OS_LOG_TYPE_INFO, "%s Calling Mention Resolver", buf, 0xCu);
  }

  if (!v4
    || !self->_mentionResolver
    || (objc_msgSend(v4, "mrRequest"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v7 = v6 == 0,
        v6,
        v7))
  {
    CDMOSLoggerForCategory(0);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v18 = "-[CDMMentionResolverService handle:]";
      _os_log_error_impl(&dword_21A2A0000, v10, OS_LOG_TYPE_ERROR, "%s [ERR]: Mention Resolver: Either Request and/or Predictor is nil", buf, 0xCu);
    }
    v9 = 0;
    goto LABEL_13;
  }
  v8 = CDMLogContext;
  if (os_log_type_enabled((os_log_t)CDMLogContext, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315650;
    v18 = "-[CDMMentionResolverService handle:]";
    v19 = 2112;
    v20 = CFSTR("mentionresolver");
    v21 = 2112;
    v22 = v4;
    _os_log_debug_impl(&dword_21A2A0000, v8, OS_LOG_TYPE_DEBUG, "%s [insights-cdm-%@]:\nMENTIONRESOLVERRequest: %@", buf, 0x20u);
  }
  if (!self->_overrideMentionsForReplay)
  {
    if (+[CDMFeatureFlags isLogNluEnabled](CDMFeatureFlags, "isLogNluEnabled"))
    {
      objc_msgSend(v4, "mrRequest");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      +[CDMMentionResolverServiceUtils logMRRequestToFile:](CDMMentionResolverServiceUtils, "logMRRequestToFile:", v12);

    }
    objc_msgSend(v4, "mrRequest");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 0;
    -[CDMMentionResolverService predictWithInput:forLocale:status:](self, "predictWithInput:forLocale:status:", v13, 0, &v16);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v16;

    if (+[CDMFeatureFlags isLogNluEnabled](CDMFeatureFlags, "isLogNluEnabled"))
      +[CDMMentionResolverServiceUtils logMRResponseToFile:](CDMMentionResolverServiceUtils, "logMRResponseToFile:", v14);
    v9 = -[CDMMentionResolverResponseCommand initWithResponse:]([CDMMentionResolverResponseCommand alloc], "initWithResponse:", v14);
    -[CDMBaseCommand setCmdError:](v9, "setCmdError:", v10);
    v15 = CDMLogContext;
    if (os_log_type_enabled((os_log_t)CDMLogContext, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315650;
      v18 = "-[CDMMentionResolverService handle:]";
      v19 = 2112;
      v20 = CFSTR("mentionresolver");
      v21 = 2112;
      v22 = v14;
      _os_log_debug_impl(&dword_21A2A0000, v15, OS_LOG_TYPE_DEBUG, "%s [insights-cdm-%@]:\nMENTIONRESOLVERResponse: %@", buf, 0x20u);
    }

LABEL_13:
    goto LABEL_14;
  }
  v9 = -[CDMMentionResolverResponseCommand initWithMentions:]([CDMMentionResolverResponseCommand alloc], "initWithMentions:", self->_overrideMentionsForReplay);
LABEL_14:

  return v9;
}

- (id)getPredictor:(id)a3 forLocale:(id)a4 status:(id *)a5
{
  id v7;
  id v8;
  void *v9;

  v7 = a3;
  v8 = a4;
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE64048]), "initWithAssets:forLocale:status:", v7, v8, a5);

  return v9;
}

- (id)predictWithInput:(id)a3 forLocale:(id)a4 status:(id *)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v7 = a3;
  -[MRRMultimodalMentionResolver resolveMentionsInUtterance:status:](self->_mentionResolver, "resolveMentionsInUtterance:status:", v7, a5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "tokenChain");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[CDMMentionResolverServiceUtils includeWhitespaceInIndices:tokenchain:](CDMMentionResolverServiceUtils, "includeWhitespaceInIndices:tokenchain:", v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (MRRMultimodalMentionResolver)mentionResolver
{
  return self->_mentionResolver;
}

- (void)setMentionResolver:(id)a3
{
  objc_storeStrong((id *)&self->_mentionResolver, a3);
}

- (NSArray)overrideMentionsForReplay
{
  return self->_overrideMentionsForReplay;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overrideMentionsForReplay, 0);
  objc_storeStrong((id *)&self->_mentionResolver, 0);
}

@end
