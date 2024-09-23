@implementation CDMVocSpanMatchService

+ (Class)spanMatcherClass
{
  return (Class)objc_opt_class();
}

- (id)setupSpanMatcher:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  CDMVocTrieProtoSpanMatcher *v13;
  int v15;
  const char *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a3, "dynamicConfig");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "getAssetForFactorName:", CFSTR("com.apple.siri.nl.voc"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "getAssetPath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    CDMOSLoggerForCategory(0);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v15 = 136315394;
      v16 = "-[CDMVocSpanMatchService setupSpanMatcher:]";
      v17 = 2112;
      v18 = v5;
      _os_log_impl(&dword_21A2A0000, v6, OS_LOG_TYPE_INFO, "%s Initializing VocSpanMatcher from path %@", (uint8_t *)&v15, 0x16u);
    }

    objc_msgSend(v4, "getAssetMetadata");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7
      && (objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("normalizeWords")),
          v9 = (void *)objc_claimAutoreleasedReturnValue(),
          v9,
          v9))
    {
      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("normalizeWords"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "BOOLValue");

      CDMOSLoggerForCategory(0);
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        v15 = 136315394;
        v16 = "-[CDMVocSpanMatchService setupSpanMatcher:]";
        v17 = 1024;
        LODWORD(v18) = v11;
        _os_log_debug_impl(&dword_21A2A0000, v12, OS_LOG_TYPE_DEBUG, "%s Voc asset sets normalizeWords to %d", (uint8_t *)&v15, 0x12u);
      }
    }
    else
    {
      CDMOSLoggerForCategory(0);
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        v15 = 136315138;
        v16 = "-[CDMVocSpanMatchService setupSpanMatcher:]";
        _os_log_impl(&dword_21A2A0000, v12, OS_LOG_TYPE_INFO, "%s [WARN]: Voc asset does not specify normalizeWords configuration", (uint8_t *)&v15, 0xCu);
      }
      v11 = 0;
    }

    v13 = -[CDMVocTrieProtoSpanMatcher initWithVocTriePath:useNormalizedValues:]([CDMVocTrieProtoSpanMatcher alloc], "initWithVocTriePath:useNormalizedValues:", v5, v11);
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (BOOL)shouldBeUsedForAsrAlternatives
{
  return 1;
}

@end
