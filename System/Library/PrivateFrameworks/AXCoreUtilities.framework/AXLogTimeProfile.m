@implementation AXLogTimeProfile

void __AXLogTimeProfile_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Accessibility", "AXTimeProfile");
  v1 = (void *)AXLogTimeProfile___logObj;
  AXLogTimeProfile___logObj = (uint64_t)v0;

}

@end
