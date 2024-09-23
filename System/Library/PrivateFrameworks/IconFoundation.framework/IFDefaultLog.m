@implementation IFDefaultLog

void __IFDefaultLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.iconservices", "foundation");
  v1 = (void *)IFDefaultLog_log;
  IFDefaultLog_log = (uint64_t)v0;

}

@end
