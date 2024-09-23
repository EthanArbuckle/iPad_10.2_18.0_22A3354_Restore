@implementation NSDateFormatter(CalClassAdditions)

+ (id)CalSharedDateFormatter
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3978], "currentThread");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "threadDictionary");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKey:", CFSTR("CalSharedDateFormatterKey"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    v2 = (void *)objc_opt_new();
    objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setLocale:", v3);

    objc_msgSend(v1, "setObject:forKey:", v2, CFSTR("CalSharedDateFormatterKey"));
  }
  objc_msgSend(v2, "setDateFormat:", 0);

  return v2;
}

@end
