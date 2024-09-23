@implementation CDMDateTimeSpanMatchService

+ (Class)spanMatcherClass
{
  return (Class)objc_opt_class();
}

- (id)setupSpanMatcher:(id)a3
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  CDMDateTimeProtoSpanMatcher *v13;
  void *v14;
  CDMDateTimeProtoSpanMatcher *v15;
  int v17;
  const char *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  CDMOSLoggerForCategory(0);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v3, "dynamicConfig");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "languageCode");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 136315394;
    v18 = "-[CDMDateTimeSpanMatchService setupSpanMatcher:]";
    v19 = 2112;
    v20 = v6;
    _os_log_impl(&dword_21A2A0000, v4, OS_LOG_TYPE_INFO, "%s Initializing CDMDateTimeSpanMatcher for locale %@", (uint8_t *)&v17, 0x16u);

  }
  objc_msgSend(v3, "dynamicConfig");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "getAssetBundlePathForFactorName:", CFSTR("com.apple.siri.nl.data_detectors"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v9 = objc_alloc(MEMORY[0x24BDBCEA0]);
    objc_msgSend(v3, "dynamicConfig");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "languageCode");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v9, "initWithLocaleIdentifier:", v11);

    v13 = [CDMDateTimeProtoSpanMatcher alloc];
    objc_msgSend(v8, "resourcePath");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = -[CDMDateTimeProtoSpanMatcher initWithDataDetectorPath:locale:](v13, "initWithDataDetectorPath:locale:", v14, v12);

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

@end
