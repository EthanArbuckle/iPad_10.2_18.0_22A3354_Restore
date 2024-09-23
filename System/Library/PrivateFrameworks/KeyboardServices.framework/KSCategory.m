@implementation KSCategory

void __KSCategory_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.KeyboardServices", "KeyboardServices");
  v1 = (void *)KSCategory_logFacility;
  KSCategory_logFacility = (uint64_t)v0;

}

@end
