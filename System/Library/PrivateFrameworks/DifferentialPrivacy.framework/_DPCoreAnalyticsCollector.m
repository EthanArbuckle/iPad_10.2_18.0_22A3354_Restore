@implementation _DPCoreAnalyticsCollector

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1)
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_2);
  return (id)sharedInstance_reporter;
}

- (void)reportMetricsForEvent:(id)a3 withMetrics:(id)a4
{
  AnalyticsSendEvent();
}

@end
