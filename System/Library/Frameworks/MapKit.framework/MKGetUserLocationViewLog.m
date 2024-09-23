@implementation MKGetUserLocationViewLog

void __MKGetUserLocationViewLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.MapKit", "UserLocationView");
  v1 = (void *)_MergedGlobals_7_0;
  _MergedGlobals_7_0 = (uint64_t)v0;

}

@end
