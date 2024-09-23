@implementation AXLogBackboardServer

void __AXLogBackboardServer_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Accessibility", "AXBackboardServer");
  v1 = (void *)AXLogBackboardServer___logObj;
  AXLogBackboardServer___logObj = (uint64_t)v0;

}

@end
