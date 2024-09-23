@implementation CDMRegexSpanMatchService

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
  CDMRegexSpanMatcher *v7;
  int v9;
  const char *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
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
      v9 = 136315394;
      v10 = "-[CDMRegexSpanMatchService setupSpanMatcher:]";
      v11 = 2112;
      v12 = v5;
      _os_log_impl(&dword_21A2A0000, v6, OS_LOG_TYPE_INFO, "%s Initializing RegexSpanMatcher from path %@", (uint8_t *)&v9, 0x16u);
    }

    v7 = -[CDMRegexSpanMatcher initWithCachePath:]([CDMRegexSpanMatcher alloc], "initWithCachePath:", v5);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

@end
