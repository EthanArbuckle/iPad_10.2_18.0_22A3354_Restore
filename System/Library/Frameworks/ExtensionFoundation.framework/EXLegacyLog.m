@implementation EXLegacyLog

void ___EXLegacyLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.extensionkit", "NSExtension");
  v1 = (void *)_EXLegacyLog_log;
  _EXLegacyLog_log = (uint64_t)v0;

}

@end
