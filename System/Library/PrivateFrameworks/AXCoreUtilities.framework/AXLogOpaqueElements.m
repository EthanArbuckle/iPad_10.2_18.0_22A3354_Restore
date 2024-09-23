@implementation AXLogOpaqueElements

void __AXLogOpaqueElements_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Accessibility", "AXOpaqueElements");
  v1 = (void *)AXLogOpaqueElements___logObj;
  AXLogOpaqueElements___logObj = (uint64_t)v0;

}

@end
