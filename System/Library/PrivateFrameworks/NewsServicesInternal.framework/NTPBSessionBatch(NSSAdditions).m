@implementation NTPBSessionBatch(NSSAdditions)

+ (id)nss_sessionBatchWithIdentifier
{
  void *v0;
  void *v1;

  v0 = (void *)objc_opt_new();
  NSSNTPBAnalyticsUUIDData();
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setIdentifier:", v1);

  return v0;
}

@end
