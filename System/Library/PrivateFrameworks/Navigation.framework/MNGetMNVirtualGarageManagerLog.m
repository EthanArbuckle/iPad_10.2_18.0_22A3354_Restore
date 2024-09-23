@implementation MNGetMNVirtualGarageManagerLog

void __MNGetMNVirtualGarageManagerLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Navigation", "MNVirtualGarageManager");
  v1 = (void *)MNGetMNVirtualGarageManagerLog_log;
  MNGetMNVirtualGarageManagerLog_log = (uint64_t)v0;

}

@end
