@implementation AXLogOrator

void __AXLogOrator_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Accessibility", "AXOrator");
  v1 = (void *)AXLogOrator___logObj;
  AXLogOrator___logObj = (uint64_t)v0;

}

@end
