@implementation GEOGetSubscriptionsLog

void __GEOGetSubscriptionsLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.GeoServices", "Subscriptions");
  v1 = (void *)qword_1ECE24578;
  qword_1ECE24578 = (uint64_t)v0;

}

@end
