@implementation VSProxyDetector

+ (BOOL)isProxyConfigured
{
  CFDictionaryRef v2;
  void *v3;
  NSObject *v4;
  _DWORD v6[2];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v2 = CFNetworkCopySystemProxySettings();
  -[__CFDictionary objectForKeyedSubscript:](v2, "objectForKeyedSubscript:", *MEMORY[0x1E0C93128]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  VSDefaultLogObject();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6[0] = 67109120;
    v6[1] = v3 != 0;
    _os_log_impl(&dword_1D2419000, v4, OS_LOG_TYPE_DEFAULT, "Proxy Configured? %d", (uint8_t *)v6, 8u);
  }

  return v3 != 0;
}

@end
