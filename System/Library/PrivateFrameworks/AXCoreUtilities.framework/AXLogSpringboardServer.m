@implementation AXLogSpringboardServer

void __AXLogSpringboardServer_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Accessibility", "AXSpringboardServer");
  v1 = (void *)AXLogSpringboardServer___logObj;
  AXLogSpringboardServer___logObj = (uint64_t)v0;

}

@end
