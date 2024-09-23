@implementation MKGetMKPlaceInlineMapVCLog

void __MKGetMKPlaceInlineMapVCLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.MapKit", "MKPlaceInlineMapVC");
  v1 = (void *)_MergedGlobals_3;
  _MergedGlobals_3 = (uint64_t)v0;

}

@end
