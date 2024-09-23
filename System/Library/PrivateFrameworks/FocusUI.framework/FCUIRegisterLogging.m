@implementation FCUIRegisterLogging

void __FCUIRegisterLogging_block_invoke()
{
  os_log_t v0;
  void *v1;
  os_log_t v2;
  void *v3;
  os_log_t v4;
  void *v5;

  v0 = os_log_create("com.apple.focusui", "Selection");
  v1 = (void *)FCUILogSelection;
  FCUILogSelection = (uint64_t)v0;

  v2 = os_log_create("com.apple.focusui", "Module");
  v3 = (void *)FCUILogModule;
  FCUILogModule = (uint64_t)v2;

  v4 = os_log_create("com.apple.focusui", "Discovery");
  v5 = (void *)FCUILogDiscovery;
  FCUILogDiscovery = (uint64_t)v4;

}

@end
