@implementation GDCLog

void __GDCLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.intelligenceplatform.IntelligencePlatformCompute", "default");
  v1 = (void *)GDCLog_log;
  GDCLog_log = (uint64_t)v0;

}

@end
