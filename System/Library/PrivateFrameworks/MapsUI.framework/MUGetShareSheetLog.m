@implementation MUGetShareSheetLog

void __MUGetShareSheetLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.MapsUI", "ShareSheet");
  v1 = (void *)MUGetShareSheetLog_log;
  MUGetShareSheetLog_log = (uint64_t)v0;

}

@end
