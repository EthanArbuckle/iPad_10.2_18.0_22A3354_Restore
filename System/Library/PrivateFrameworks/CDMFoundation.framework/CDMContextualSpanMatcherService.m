@implementation CDMContextualSpanMatcherService

- (id)handleRequestCommandTypeNames
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDBCF20];
  +[CDMBaseCommand commandName](CDMContextualSpanMatcherRequestCommand, "commandName");
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
  return +[CDMFeatureFlags isContextualSpanMatcherEnabled](CDMFeatureFlags, "isContextualSpanMatcherEnabled");
}

+ (BOOL)isAssetRequired
{
  return 0;
}

- (id)setup:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  NSArray *v7;
  NSArray *overrideSpansForReplay;
  ContextualSpanMatcher *v9;
  ContextualSpanMatcher *contextualSpanMatcher;
  NSObject *v11;
  int v13;
  const char *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  CDMOSLoggerForCategory(0);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v13 = 136315138;
    v14 = "-[CDMContextualSpanMatcherService setup:]";
    _os_log_impl(&dword_21A2A0000, v5, OS_LOG_TYPE_INFO, "%s Setting up ContextualSpanMatcher service", (uint8_t *)&v13, 0xCu);
  }

  objc_msgSend(v4, "dynamicConfig");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "overrideContextualSpans");
  v7 = (NSArray *)objc_claimAutoreleasedReturnValue();
  overrideSpansForReplay = self->_overrideSpansForReplay;
  self->_overrideSpansForReplay = v7;

  self->super.super._serviceState = 2;
  -[CDMContextualSpanMatcherService getPredictor](self, "getPredictor");
  v9 = (ContextualSpanMatcher *)objc_claimAutoreleasedReturnValue();
  contextualSpanMatcher = self->_contextualSpanMatcher;
  self->_contextualSpanMatcher = v9;

  CDMOSLoggerForCategory(0);
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    v13 = 136315138;
    v14 = "-[CDMContextualSpanMatcherService setup:]";
    _os_log_impl(&dword_21A2A0000, v11, OS_LOG_TYPE_INFO, "%s ContextualSpanMatcher service loaded", (uint8_t *)&v13, 0xCu);
  }

  -[CDMBaseService createSetupResponseCommand](self, "createSetupResponseCommand");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)handle:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  CDMContextualSpanMatcherResponseCommand *v8;
  NSObject *v9;
  void *v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  int v15;
  const char *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  CDMOSLoggerForCategory(0);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v15 = 136315138;
    v16 = "-[CDMContextualSpanMatcherService handle:]";
    _os_log_impl(&dword_21A2A0000, v5, OS_LOG_TYPE_INFO, "%s Calling ContextualSpanMatcher", (uint8_t *)&v15, 0xCu);
  }

  if (v4
    && (objc_msgSend(v4, "contextualSpanMatcherRequest"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v6,
        v6))
  {
    if (self->_overrideSpansForReplay)
    {
      CDMOSLoggerForCategory(0);
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      {
        v15 = 136315138;
        v16 = "-[CDMContextualSpanMatcherService handle:]";
        _os_log_debug_impl(&dword_21A2A0000, v7, OS_LOG_TYPE_DEBUG, "%s ContextualSpanMatcher is using override contextual spans", (uint8_t *)&v15, 0xCu);
      }

      v8 = -[CDMContextualSpanMatcherResponseCommand initWithMentions:]([CDMContextualSpanMatcherResponseCommand alloc], "initWithMentions:", self->_overrideSpansForReplay);
    }
    else
    {
      objc_msgSend(v4, "contextualSpanMatcherRequest");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[CDMContextualSpanMatcherService getContextualSpansInternal:](self, "getContextualSpansInternal:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      CDMOSLoggerForCategory(0);
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        v15 = 136315394;
        v16 = "-[CDMContextualSpanMatcherService handle:]";
        v17 = 2112;
        v18 = v12;
        _os_log_debug_impl(&dword_21A2A0000, v13, OS_LOG_TYPE_DEBUG, "%s #ContextualSpanMatcherService obtained response: %@; handling now",
          (uint8_t *)&v15,
          0x16u);
      }

      CDMOSLoggerForCategory(0);
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        v15 = 136315138;
        v16 = "-[CDMContextualSpanMatcherService handle:]";
        _os_log_impl(&dword_21A2A0000, v14, OS_LOG_TYPE_INFO, "%s Returning from ContextualSpanMatcher", (uint8_t *)&v15, 0xCu);
      }

      v8 = -[CDMContextualSpanMatcherResponseCommand initWithContextualSpanMatcherResponse:]([CDMContextualSpanMatcherResponseCommand alloc], "initWithContextualSpanMatcherResponse:", v12);
    }
  }
  else
  {
    CDMOSLoggerForCategory(0);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v15 = 136315138;
      v16 = "-[CDMContextualSpanMatcherService handle:]";
      _os_log_error_impl(&dword_21A2A0000, v9, OS_LOG_TYPE_ERROR, "%s [ERR]: ContextualSpanMatcher: Either Request and/or Predictor is nil", (uint8_t *)&v15, 0xCu);
    }

    v8 = 0;
  }

  return v8;
}

- (id)getPredictor
{
  return objc_alloc_init(MEMORY[0x24BE64038]);
}

- (id)getContextualSpansInternal:(id)a3
{
  return (id)-[ContextualSpanMatcher getContextualSpansWithRequest:](self->_contextualSpanMatcher, "getContextualSpansWithRequest:", a3);
}

- (ContextualSpanMatcher)contextualSpanMatcher
{
  return self->_contextualSpanMatcher;
}

- (void)setContextualSpanMatcher:(id)a3
{
  objc_storeStrong((id *)&self->_contextualSpanMatcher, a3);
}

- (NSArray)overrideSpansForReplay
{
  return self->_overrideSpansForReplay;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overrideSpansForReplay, 0);
  objc_storeStrong((id *)&self->_contextualSpanMatcher, 0);
}

@end
