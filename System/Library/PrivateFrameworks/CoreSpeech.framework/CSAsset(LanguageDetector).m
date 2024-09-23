@implementation CSAsset(LanguageDetector)

- (id)languageDetectorSupportedLocale
{
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  char isKindOfClass;
  void *v10;

  objc_msgSend(a1, "dictionary");
  v2 = objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = (void *)v2;
    objc_msgSend(a1, "dictionary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("supported-locales"));
    v5 = objc_claimAutoreleasedReturnValue();
    if (!v5)
    {

      v10 = 0;
      goto LABEL_7;
    }
    v6 = (void *)v5;
    objc_msgSend(a1, "dictionary");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("supported-locales"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      objc_msgSend(a1, "dictionary");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("supported-locales"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_7:

      return v10;
    }
  }
  v10 = 0;
  return v10;
}

- (id)languageDetectorConfigFile
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  char isKindOfClass;
  __CFString *v11;
  void *v12;

  objc_msgSend(a1, "resourcePath");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "dictionary");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)v3;
    objc_msgSend(a1, "dictionary");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("detector-config"));
    v6 = objc_claimAutoreleasedReturnValue();
    if (!v6)
    {

      v11 = CFSTR("detector.json");
      goto LABEL_7;
    }
    v7 = (void *)v6;
    objc_msgSend(a1, "dictionary");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("detector-config"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      objc_msgSend(a1, "dictionary");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("detector-config"));
      v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_7:

      goto LABEL_8;
    }
  }
  v11 = CFSTR("detector.json");
LABEL_8:
  objc_msgSend(v2, "stringByAppendingPathComponent:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)startOfSpeechDetectorConfigFile
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "resourcePath");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "stringByAppendingPathComponent:", CFSTR("sos-options.json"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)spgConfigFile
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "resourcePath");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "stringByAppendingPathComponent:", CFSTR("SPG.json"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

@end
