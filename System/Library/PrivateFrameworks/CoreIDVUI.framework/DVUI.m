@implementation DVUI

void __DVUI_LOG_CLIENT_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.CoreIDV", "CoreIDVUI");
  v1 = (void *)DVUI_LOG_CLIENT_log;
  DVUI_LOG_CLIENT_log = (uint64_t)v0;

}

@end
