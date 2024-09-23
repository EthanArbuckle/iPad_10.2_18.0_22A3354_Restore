@implementation CFNGetHTTP3Override

void ____CFNGetHTTP3Override_block_invoke()
{
  char *v0;
  const char *v1;
  NSObject *v2;
  const char *v3;
  char AppIntegerValue;
  Boolean keyExistsAndHasValidFormat;
  uint8_t buf[4];
  int v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v0 = getenv("CFN_USE_HTTP3");
  if (!v0)
    goto LABEL_9;
  v1 = v0;
  if (__CFNIsInDevelopmentEnvironment::onceToken != -1)
    dispatch_once(&__CFNIsInDevelopmentEnvironment::onceToken, &__block_literal_global_21_4777);
  if (__CFNIsInDevelopmentEnvironment::ok)
  {
    __CFNGetHTTP3Override::value = strtol(v1, 0, 10);
    if (CFNLog::onceToken != -1)
      dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4755);
    v2 = CFNLog::logger;
    if (os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109120;
      v7 = __CFNGetHTTP3Override::value;
      v3 = "HTTP/3 override %d via env";
LABEL_14:
      _os_log_impl(&dword_183ECA000, v2, OS_LOG_TYPE_INFO, v3, buf, 8u);
    }
  }
  else
  {
LABEL_9:
    keyExistsAndHasValidFormat = 0;
    AppIntegerValue = CFPreferencesGetAppIntegerValue(CFSTR("CFNetworkHTTP3Override"), CFSTR("Apple Global Domain"), &keyExistsAndHasValidFormat);
    if (keyExistsAndHasValidFormat)
    {
      __CFNGetHTTP3Override::value = AppIntegerValue;
      if (CFNLog::onceToken != -1)
        dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4755);
      v2 = CFNLog::logger;
      if (os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109120;
        v7 = __CFNGetHTTP3Override::value;
        v3 = "HTTP/3 override %d via preference";
        goto LABEL_14;
      }
    }
  }
}

@end
