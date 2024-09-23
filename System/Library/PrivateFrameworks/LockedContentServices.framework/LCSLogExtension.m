@implementation LCSLogExtension

void __LCSLogExtension_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.LockedContentServices", "Extension");
  v1 = (void *)LCSLogExtension___logObj;
  LCSLogExtension___logObj = (uint64_t)v0;

}

@end
