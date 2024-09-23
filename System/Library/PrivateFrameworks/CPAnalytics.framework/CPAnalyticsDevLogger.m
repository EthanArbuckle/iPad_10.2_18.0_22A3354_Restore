@implementation CPAnalyticsDevLogger

- (CPAnalyticsDevLogger)initWithConfig:(id)a3 cpAnalyticsInstance:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CPAnalyticsDevLogger;
  return -[CPAnalyticsDevLogger init](&v5, sel_init, a3, a4);
}

- (void)processEvent:(id)a3
{
  id v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  if (processEvent__devLoggerOnce != -1)
    dispatch_once(&processEvent__devLoggerOnce, &__block_literal_global);
  v4 = (void *)processEvent__devLogger;
  if (os_log_type_enabled((os_log_t)processEvent__devLogger, OS_LOG_TYPE_DEBUG))
  {
    v5 = v4;
    objc_msgSend(v3, "timestamp");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "name");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v3, "copyRawPayload");
    v9 = 138412802;
    v10 = v6;
    v11 = 2112;
    v12 = v7;
    v13 = 2112;
    v14 = v8;
    _os_log_debug_impl(&dword_20AB22000, v5, OS_LOG_TYPE_DEBUG, "%@: %@ payload: %@", (uint8_t *)&v9, 0x20u);

  }
}

- (BOOL)disabled
{
  return 1;
}

void __37__CPAnalyticsDevLogger_processEvent___block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.photos.CPAnalytics", "CPAnalyticsDevLogger");
  v1 = (void *)processEvent__devLogger;
  processEvent__devLogger = (uint64_t)v0;

}

@end
