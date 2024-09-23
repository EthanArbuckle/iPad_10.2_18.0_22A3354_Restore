@implementation NSDate(SGDateUtils)

- (id)sg_descriptionForMimeHeaders
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_opt_new();
  objc_msgSend(v2, "setDateFormat:", CFSTR("EEE, d MMM yyyy HH:mm:ss ZZ"));
  objc_msgSend(MEMORY[0x1E0C99DC8], "localeWithLocaleIdentifier:", CFSTR("en_US_POSIX"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setLocale:", v3);

  objc_msgSend(v2, "stringFromDate:", a1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end
