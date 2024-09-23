@implementation AXLogVectorKit

void __AXLogVectorKit_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Accessibility", "AXVectorKit");
  v1 = (void *)AXLogVectorKit___logObj;
  AXLogVectorKit___logObj = (uint64_t)v0;

}

@end
