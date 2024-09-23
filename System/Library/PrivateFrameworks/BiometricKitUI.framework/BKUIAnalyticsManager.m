@implementation BKUIAnalyticsManager

- (BKUIAnalyticsManager)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BKUIAnalyticsManager;
  return -[BKUIAnalyticsManager init](&v3, sel_init);
}

- (void)traceEvent:(id)a3 withPayload:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  int v8;
  id v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  _BKUILoggingFacility();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138412546;
    v9 = v5;
    v10 = 2112;
    v11 = v6;
    _os_log_impl(&dword_1DB281000, v7, OS_LOG_TYPE_DEFAULT, "Tracing event: %@ payload: %@", (uint8_t *)&v8, 0x16u);
  }

  AnalyticsSendEvent();
}

@end
