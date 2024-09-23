@implementation AXLogVisibleFrame

void __AXLogVisibleFrame_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Accessibility", "AXVisibleFrame");
  v1 = (void *)AXLogVisibleFrame___logObj;
  AXLogVisibleFrame___logObj = (uint64_t)v0;

}

@end
