@implementation MKGetMKMapItemViewLog

void __MKGetMKMapItemViewLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.MapKit", "MKMapItemView");
  v1 = (void *)_MergedGlobals_3_3;
  _MergedGlobals_3_3 = (uint64_t)v0;

}

@end
