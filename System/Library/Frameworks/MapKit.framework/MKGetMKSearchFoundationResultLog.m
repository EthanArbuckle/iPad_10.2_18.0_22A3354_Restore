@implementation MKGetMKSearchFoundationResultLog

void __MKGetMKSearchFoundationResultLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.MapKit", "MKSearchFoundationResult");
  v1 = (void *)_MergedGlobals_1_11;
  _MergedGlobals_1_11 = (uint64_t)v0;

}

@end
