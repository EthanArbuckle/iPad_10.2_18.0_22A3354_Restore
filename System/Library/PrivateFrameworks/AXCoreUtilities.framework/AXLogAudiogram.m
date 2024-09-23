@implementation AXLogAudiogram

void __AXLogAudiogram_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Accessibility", "AXAudiogram");
  v1 = (void *)AXLogAudiogram___logObj;
  AXLogAudiogram___logObj = (uint64_t)v0;

}

@end
