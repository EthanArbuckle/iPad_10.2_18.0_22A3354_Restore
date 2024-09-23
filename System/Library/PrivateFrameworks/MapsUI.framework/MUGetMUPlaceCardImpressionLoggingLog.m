@implementation MUGetMUPlaceCardImpressionLoggingLog

void __MUGetMUPlaceCardImpressionLoggingLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.MapsUI", "MUPlaceCardImpressionLogging");
  v1 = (void *)_MergedGlobals_134;
  _MergedGlobals_134 = (uint64_t)v0;

}

@end
