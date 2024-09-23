@implementation MUGetPlaceCardAnalyticsUILog

void __MUGetPlaceCardAnalyticsUILog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.MapsUI", "PlaceCardAnalyticsUI");
  v1 = (void *)_MergedGlobals_117;
  _MergedGlobals_117 = (uint64_t)v0;

}

@end
