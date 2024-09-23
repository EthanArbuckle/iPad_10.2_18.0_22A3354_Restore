@implementation NSString

uint64_t __62__NSString_Notification__mtStringByAppendingNotificationDate___block_invoke()
{
  id v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v0 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  v1 = (void *)mtStringByAppendingNotificationDate____dateFormatter;
  mtStringByAppendingNotificationDate____dateFormatter = (uint64_t)v0;

  v2 = (void *)mtStringByAppendingNotificationDate____dateFormatter;
  objc_msgSend(MEMORY[0x1E0C99DC8], "localeWithLocaleIdentifier:", CFSTR("en_US_POSIX"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setLocale:", v3);

  v4 = (void *)mtStringByAppendingNotificationDate____dateFormatter;
  objc_msgSend(MEMORY[0x1E0C99E80], "timeZoneForSecondsFromGMT:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTimeZone:", v5);

  return objc_msgSend((id)mtStringByAppendingNotificationDate____dateFormatter, "setDateFormat:", CFSTR("yyyy-MM-dd-HH-mm"));
}

@end
