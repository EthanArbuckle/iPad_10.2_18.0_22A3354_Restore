@implementation AXLogUIViewService

void __AXLogUIViewService_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Accessibility", "AXUIViewService");
  v1 = (void *)AXLogUIViewService___logObj;
  AXLogUIViewService___logObj = (uint64_t)v0;

}

@end
