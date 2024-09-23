@implementation SWFrameworkLogHandle

void __SWFrameworkLogHandle_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.SharedWithYou", "General");
  v1 = (void *)SWFrameworkLogHandle_osLog;
  SWFrameworkLogHandle_osLog = (uint64_t)v0;

}

@end
