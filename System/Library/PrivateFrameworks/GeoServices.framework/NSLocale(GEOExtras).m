@implementation NSLocale(GEOExtras)

- (id)_geo_languageAndLocale
{
  void *v2;
  void *v3;
  uint64_t v4;
  __CFString *v5;
  void *v6;
  void *v7;
  void *v8;

  v2 = (void *)MEMORY[0x1E0C99DC8];
  objc_msgSend(MEMORY[0x1E0C99DC8], "systemLanguages");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "mostPreferredLanguageOf:forUsage:options:", v3, 1, 0);
  v4 = objc_claimAutoreleasedReturnValue();

  if (v4)
    v5 = (__CFString *)v4;
  else
    v5 = &stru_1E1C241D0;
  v6 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(a1, "localeIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringWithFormat:", CFSTR("%@:%@"), v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

@end
