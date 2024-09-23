@implementation GEOGetSubscriptionExpirationLog

void __GEOGetSubscriptionExpirationLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.GeoServices", "SubscriptionExpiration");
  v1 = (void *)qword_1ECDBCC18;
  qword_1ECDBCC18 = (uint64_t)v0;

}

@end
