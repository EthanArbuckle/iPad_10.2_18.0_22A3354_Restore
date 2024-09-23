@implementation AXLogFocusEngine

void __AXLogFocusEngine_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Accessibility", "AXFocusEngine");
  v1 = (void *)AXLogFocusEngine___logObj;
  AXLogFocusEngine___logObj = (uint64_t)v0;

}

@end
