@implementation AXLogDisplay

void __AXLogDisplay_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Accessibility", "AXDisplay");
  v1 = (void *)AXLogDisplay___logObj;
  AXLogDisplay___logObj = (uint64_t)v0;

}

@end
