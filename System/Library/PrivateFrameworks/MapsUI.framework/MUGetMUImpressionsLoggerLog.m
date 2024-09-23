@implementation MUGetMUImpressionsLoggerLog

void __MUGetMUImpressionsLoggerLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.MapsUI", "MUImpressionsLogger");
  v1 = (void *)_MergedGlobals_126;
  _MergedGlobals_126 = (uint64_t)v0;

}

@end
