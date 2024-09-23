@implementation NSLocale

- (id)language
{
  if (a1)
  {
    objc_msgSend(a1, "objectForKey:", *MEMORY[0x24BDBCB20]);
    a1 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

- (id)country
{
  if (a1)
  {
    objc_msgSend(a1, "objectForKey:", *MEMORY[0x24BDBCAE8]);
    a1 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

+ (id)currentLanguage
{
  void *v0;
  uint64_t v1;
  void *v2;

  objc_opt_self();
  if (!objc_msgSend((id)currentLanguage_language, "length"))
  {
    objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
    v0 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSLocale language](v0);
    v1 = objc_claimAutoreleasedReturnValue();
    v2 = (void *)currentLanguage_language;
    currentLanguage_language = v1;

  }
  return (id)currentLanguage_language;
}

- (BOOL)isDevice24HourTime
{
  void *v1;
  _BOOL8 v2;

  if (!a1)
    return 0;
  objc_msgSend(MEMORY[0x24BDD1500], "dateFormatFromTemplate:options:locale:", CFSTR("j"), 0, a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "rangeOfString:", CFSTR("a")) == 0x7FFFFFFFFFFFFFFFLL;

  return v2;
}

@end
