@implementation BRLTLog

void __BRLTLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Accessibility", "BRLTranslation");
  v1 = (void *)BRLTLog_Logger;
  BRLTLog_Logger = (uint64_t)v0;

}

@end
