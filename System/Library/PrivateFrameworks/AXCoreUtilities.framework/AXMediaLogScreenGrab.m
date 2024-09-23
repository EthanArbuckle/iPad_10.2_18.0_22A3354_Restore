@implementation AXMediaLogScreenGrab

void __AXMediaLogScreenGrab_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Accessibility", "AXMediaScreenGrab");
  v1 = (void *)AXMediaLogScreenGrab___logObj;
  AXMediaLogScreenGrab___logObj = (uint64_t)v0;

}

@end
