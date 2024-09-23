@implementation AXLogUltronKShot

void __AXLogUltronKShot_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Accessibility", "AXUltronKShot");
  v1 = (void *)AXLogUltronKShot___logObj;
  AXLogUltronKShot___logObj = (uint64_t)v0;

}

@end
