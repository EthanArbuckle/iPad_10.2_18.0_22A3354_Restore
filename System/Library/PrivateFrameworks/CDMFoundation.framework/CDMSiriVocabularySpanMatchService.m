@implementation CDMSiriVocabularySpanMatchService

- (id)handleRequestCommandTypeNames
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[3];

  v8[2] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDBCF20];
  +[CDMBaseCommand commandName](CDMSpanMatcherRequestCommand, "commandName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v3;
  +[CDMBaseCommand commandName](CDMSpanMatchDataUpdateCommand, "commandName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = v4;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v8, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)setupSpanMatcher:(id)a3
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  CDMSiriVocabularyProtoSpanMatcher *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  NSObject *v14;
  CDMSiriVocabularyProtoSpanMatcher *v15;
  CDMSiriVocabularyProtoSpanMatcher *v16;
  NSObject *v17;
  CDMSiriVocabularyProtoSpanMatcher *v19;
  void *v20;
  void *v21;
  int v22;
  const char *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  CDMOSLoggerForCategory(0);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v22 = 136315138;
    v23 = "-[CDMSiriVocabularySpanMatchService setupSpanMatcher:]";
    _os_log_impl(&dword_21A2A0000, v4, OS_LOG_TYPE_INFO, "%s initializing CDMSiriVocabularySpanMatcher", (uint8_t *)&v22, 0xCu);
  }

  objc_msgSend(v3, "dynamicConfig");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "overrideSiriVocabSpans");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    CDMOSLoggerForCategory(0);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      v22 = 136315138;
      v23 = "-[CDMSiriVocabularySpanMatchService setupSpanMatcher:]";
      _os_log_debug_impl(&dword_21A2A0000, v7, OS_LOG_TYPE_DEBUG, "%s Span Matcher service is using override spans for SiriVocabularyMatcher!", (uint8_t *)&v22, 0xCu);
    }

    v8 = [CDMSiriVocabularyProtoSpanMatcher alloc];
    objc_msgSend(v3, "dynamicConfig");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "overrideSiriVocabSpans");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[CDMSiriVocabularyProtoSpanMatcher initWithOverrideSpans:](v8, "initWithOverrideSpans:", v10);
LABEL_11:
    v16 = (CDMSiriVocabularyProtoSpanMatcher *)v11;

    goto LABEL_12;
  }
  objc_msgSend(v3, "dynamicConfig");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "siriVocabularySandboxId");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    CDMOSLoggerForCategory(0);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v3, "dynamicConfig");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "siriVocabularySandboxId");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = 136315394;
      v23 = "-[CDMSiriVocabularySpanMatchService setupSpanMatcher:]";
      v24 = 2112;
      v25 = v21;
      _os_log_debug_impl(&dword_21A2A0000, v14, OS_LOG_TYPE_DEBUG, "%s user profile debug: initializing CDMSiriVocabularySpanMatcher with Sandbox id %@", (uint8_t *)&v22, 0x16u);

    }
    v15 = [CDMSiriVocabularyProtoSpanMatcher alloc];
    objc_msgSend(v3, "dynamicConfig");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "siriVocabularySandboxId");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[CDMSiriVocabularyProtoSpanMatcher initWithSandboxId:](v15, "initWithSandboxId:", v10);
    goto LABEL_11;
  }
  v19 = [CDMSiriVocabularyProtoSpanMatcher alloc];
  objc_msgSend(MEMORY[0x24BE92CA8], "indexMatcher");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[CDMSiriVocabularyProtoSpanMatcher initWithSEMSpanMatcher:userId:](v19, "initWithSEMSpanMatcher:userId:", v9, 0);
LABEL_12:

  if (!v16)
  {
    CDMOSLoggerForCategory(0);
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      v22 = 136315138;
      v23 = "-[CDMSiriVocabularySpanMatchService setupSpanMatcher:]";
      _os_log_error_impl(&dword_21A2A0000, v17, OS_LOG_TYPE_ERROR, "%s [ERR]: Not able to initialize SiriVocabulary span matcher", (uint8_t *)&v22, 0xCu);
    }

  }
  return v16;
}

- (id)handle:(id)a3
{
  id v4;
  void *v6;
  objc_super v7;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[CDMSiriVocabularySpanMatchService updateData:](self, "updateData:", v4);

    return 0;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)CDMSiriVocabularySpanMatchService;
    -[CDMBaseSpanMatchService handle:](&v7, sel_handle_, v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    return v6;
  }
}

- (void)updateData:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  CDMSiriVocabularyProtoSpanMatcher *v13;
  void *v14;
  CDMSiriVocabularyProtoSpanMatcher *v15;
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
    v17 = "-[CDMSiriVocabularySpanMatchService updateData:]";
    _os_log_impl(&dword_21A2A0000, v5, OS_LOG_TYPE_INFO, "%s Span Match Service Update data", (uint8_t *)&v16, 0xCu);
  }

  -[CDMBaseSpanMatchService spanMatcher](self, "spanMatcher");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "semSandboxId");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {

    }
    else
    {
      objc_msgSend(v7, "overrideSpans");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v9)
      {
        objc_msgSend(v4, "semSpanMatcher");
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v11)
          goto LABEL_10;
        CDMOSLoggerForCategory(0);
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
        {
          v16 = 136315138;
          v17 = "-[CDMSiriVocabularySpanMatchService updateData:]";
          _os_log_impl(&dword_21A2A0000, v12, OS_LOG_TYPE_INFO, "%s Update Siri Vocab Searcher, using Siri Entity Matcher", (uint8_t *)&v16, 0xCu);
        }

        v13 = [CDMSiriVocabularyProtoSpanMatcher alloc];
        objc_msgSend(v4, "semSpanMatcher");
        v10 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "userId");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = -[CDMSiriVocabularyProtoSpanMatcher initWithSEMSpanMatcher:userId:](v13, "initWithSEMSpanMatcher:userId:", v10, v14);
        -[CDMBaseSpanMatchService setSpanMatcher:](self, "setSpanMatcher:", v15);

        goto LABEL_9;
      }
    }
    CDMOSLoggerForCategory(0);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v16 = 136315138;
      v17 = "-[CDMSiriVocabularySpanMatchService updateData:]";
      _os_log_impl(&dword_21A2A0000, v10, OS_LOG_TYPE_INFO, "%s SiriVocab SpanMatcher not updated because it is originally initialized via sandbox or override spans", (uint8_t *)&v16, 0xCu);
    }
LABEL_9:

  }
LABEL_10:

}

- (BOOL)isSetupRerunNeededForRequest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  unsigned __int8 v10;
  NSObject *v11;
  BOOL v12;
  NSObject *v13;
  void *v15;
  void *v16;
  objc_super v17;
  objc_super v18;
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[CDMBaseSpanMatchService spanMatcher](self, "spanMatcher");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "semSandboxId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    objc_msgSend(v4, "siriVocabularySandboxId");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v7)
    {
      CDMOSLoggerForCategory(0);
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315138;
        v20 = "-[CDMSiriVocabularySpanMatchService isSetupRerunNeededForRequest:]";
        _os_log_debug_impl(&dword_21A2A0000, v13, OS_LOG_TYPE_DEBUG, "%s Both Ids are nil, consider them equal; No need to re-run setup for sandboxes.",
          buf,
          0xCu);
      }

      v10 = -[CDMDAGBaseService isSetupRerunNeededForRequest:](&v18, sel_isSetupRerunNeededForRequest_, v4, v17.receiver, v17.super_class, self, CDMSiriVocabularySpanMatchService);
      goto LABEL_11;
    }
  }
  objc_msgSend(v4, "siriVocabularySandboxId");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v6, "isEqualToString:", v8);

  if ((v9 & 1) != 0)
  {
    v10 = -[CDMDAGBaseService isSetupRerunNeededForRequest:](&v17, sel_isSetupRerunNeededForRequest_, v4, self, CDMSiriVocabularySpanMatchService, v18.receiver, v18.super_class);
LABEL_11:
    v12 = v10;
    goto LABEL_12;
  }
  CDMOSLoggerForCategory(0);
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    -[CDMBaseService serviceName](self, "serviceName");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "siriVocabularySandboxId");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315906;
    v20 = "-[CDMSiriVocabularySpanMatchService isSetupRerunNeededForRequest:]";
    v21 = 2112;
    v22 = v15;
    v23 = 2112;
    v24 = v6;
    v25 = 2112;
    v26 = v16;
    _os_log_debug_impl(&dword_21A2A0000, v11, OS_LOG_TYPE_DEBUG, "%s Setup rerun is needed for service %@ to change sandbox from %@ to %@", buf, 0x2Au);

  }
  v12 = 1;
LABEL_12:

  return v12;
}

- (BOOL)shouldBeUsedForAsrAlternatives
{
  return 1;
}

- (id)warmup:(id)a3
{
  NSObject *v4;
  void *v5;
  CDMWarmupResponseCommand *v6;
  int64_t v7;
  void *v8;
  CDMWarmupResponseCommand *v9;
  int v11;
  const char *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  CDMOSLoggerForCategory(0);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    -[CDMBaseService serviceName](self, "serviceName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 136315394;
    v12 = "-[CDMSiriVocabularySpanMatchService warmup:]";
    v13 = 2112;
    v14 = v5;
    _os_log_impl(&dword_21A2A0000, v4, OS_LOG_TYPE_INFO, "%s Prewarm Span Matcher %@: No-op", (uint8_t *)&v11, 0x16u);

  }
  v6 = [CDMWarmupResponseCommand alloc];
  v7 = -[CDMBaseService serviceState](self, "serviceState");
  -[CDMBaseService serviceName](self, "serviceName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[CDMWarmupResponseCommand initWithServiceState:serviceName:](v6, "initWithServiceState:serviceName:", v7, v8);

  return v9;
}

+ (Class)spanMatcherClass
{
  return (Class)objc_opt_class();
}

@end
