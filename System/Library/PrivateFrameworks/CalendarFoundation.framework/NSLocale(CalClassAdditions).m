@implementation NSLocale(CalClassAdditions)

- (uint64_t)CalPrefersFullMonthDisplayNames
{
  uint64_t result;

  result = objc_msgSend(a1, "_languageIsArabic");
  if ((_DWORD)result)
    return objc_msgSend(a1, "_calendarIsIslamic");
  return result;
}

- (uint64_t)_languageIsArabic
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "languageCode");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "isEqualToString:", CFSTR("ar"));

  return v2;
}

- (uint64_t)_calendarIsIslamic
{
  void *v1;
  void *v2;
  uint64_t v3;

  objc_msgSend(a1, "objectForKey:", *MEMORY[0x1E0C99790]);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "calendarIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "containsString:", CFSTR("islamic"));

  return v3;
}

- (uint64_t)CalUnableToAbbreviateMonthNames
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "languageCode");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "isEqualToString:", CFSTR("fi"));

  return v2;
}

- (uint64_t)CalShouldUseAbbreviatedDayNames
{
  return objc_msgSend(a1, "_languageIsArabic") ^ 1;
}

- (uint64_t)CalRegionIsChina
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "countryCode");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "isEqualToString:", CFSTR("CN"));

  return v2;
}

- (uint64_t)CalLanguageIsSimplifiedChinese
{
  void *v0;
  void *v1;
  uint64_t v2;

  objc_msgSend(MEMORY[0x1E0C99DC8], "preferredLanguages");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "firstObject");
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  v2 = objc_msgSend(v1, "hasPrefix:", CFSTR("zh-Hans"));
  return v2;
}

- (uint64_t)CalUsesCelsius
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "objectForKey:", *MEMORY[0x1E0C99828]);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "isEqualToString:", *MEMORY[0x1E0C99830]);

  return v2;
}

@end
