@implementation NSDateFormatter(AppleMediaServices)

+ (id)ams_serverFriendlyFormatter
{
  if (_MergedGlobals_159 != -1)
    dispatch_once(&_MergedGlobals_159, &__block_literal_global_144);
  return (id)qword_1ECEADA48;
}

+ (id)ams_serverFriendlyLocalTimeZoneFormatter
{
  if (qword_1ECEADA50 != -1)
    dispatch_once(&qword_1ECEADA50, &__block_literal_global_1);
  return (id)qword_1ECEADA58;
}

+ (id)_ams_serverFriendlyFormatter
{
  void *v0;
  id v1;
  void *v2;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DC8]), "initWithLocaleIdentifier:", CFSTR("en_US_POSIX"));
  v1 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  objc_msgSend(v1, "setDateFormat:", CFSTR("yyyy-MM-dd'T'HH:mm:ssZ"));
  objc_msgSend(v1, "setLocale:", v0);
  objc_msgSend(MEMORY[0x1E0C99E80], "timeZoneForSecondsFromGMT:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setTimeZone:", v2);

  return v1;
}

+ (id)_ams_serverFriendlyLocalTimeZoneFormatter
{
  id v0;

  v0 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  objc_msgSend(v0, "setDateFormat:", CFSTR("yyyy-MM-dd'T'HH:mm:ss"));
  return v0;
}

@end
