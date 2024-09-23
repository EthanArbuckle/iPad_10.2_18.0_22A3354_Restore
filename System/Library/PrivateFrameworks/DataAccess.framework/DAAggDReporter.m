@implementation DAAggDReporter

+ (void)startDailyAggDReporter
{
  +[DAAnalyticsReporter startDailyAnalyticsReporter](DAAnalyticsReporter, "startDailyAnalyticsReporter");
}

+ (void)endDailyAggDReporter
{
  +[DAAnalyticsReporter endDailyAnalyticsReporter](DAAnalyticsReporter, "endDailyAnalyticsReporter");
}

+ (void)reportActiveExchangeOAuthAccountsCount
{
  +[DAAnalyticsReporter reportActiveExchangeOAuthAccountsCount](DAAnalyticsReporter, "reportActiveExchangeOAuthAccountsCount");
}

@end
