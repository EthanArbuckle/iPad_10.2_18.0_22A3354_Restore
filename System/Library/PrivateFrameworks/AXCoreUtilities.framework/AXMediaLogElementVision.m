@implementation AXMediaLogElementVision

void __AXMediaLogElementVision_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Accessibility", "AXMediaElementVision");
  v1 = (void *)AXMediaLogElementVision___logObj;
  AXMediaLogElementVision___logObj = (uint64_t)v0;

}

@end
