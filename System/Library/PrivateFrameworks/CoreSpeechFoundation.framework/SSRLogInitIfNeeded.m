@implementation SSRLogInitIfNeeded

void __SSRLogInitIfNeeded_block_invoke()
{
  os_log_t v0;
  void *v1;
  id v2;
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  int v7;
  const char *v8;
  __int16 v9;
  const char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v0 = os_log_create((const char *)SSRLoggingSubsystem, (const char *)kSSRLoggingContextFramework);
  v1 = (void *)SSRLogContextFacilityCoreSpeech;
  SSRLogContextFacilityCoreSpeech = (uint64_t)v0;

  v2 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  v3 = (void *)_ssrDateFormatter;
  _ssrDateFormatter = (uint64_t)v2;

  v4 = (void *)_ssrDateFormatter;
  objc_msgSend(MEMORY[0x1E0C99DC8], "localeWithLocaleIdentifier:", CFSTR("en_US_POSIX"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setLocale:", v5);

  objc_msgSend((id)_ssrDateFormatter, "setDateFormat:", CFSTR("yyyyMMdd-HHmmss"));
  v6 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 136315394;
    v8 = "SSRLogInitIfNeeded_block_invoke";
    v9 = 2080;
    v10 = "Unknown";
    _os_log_impl(&dword_1B502E000, v6, OS_LOG_TYPE_DEFAULT, "%s ::: SSR logging initialized (%s)", (uint8_t *)&v7, 0x16u);
  }
}

@end
