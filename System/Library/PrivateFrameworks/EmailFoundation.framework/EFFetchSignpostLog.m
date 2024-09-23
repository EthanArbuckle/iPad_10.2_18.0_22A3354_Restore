@implementation EFFetchSignpostLog

void __EFFetchSignpostLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.email.fetch.signpost", "PointsOfInterest");
  v1 = (void *)EFFetchSignpostLog_log;
  EFFetchSignpostLog_log = (uint64_t)v0;

}

@end
