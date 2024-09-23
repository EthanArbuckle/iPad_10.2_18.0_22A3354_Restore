@implementation ACDPluginLogSystem

void ___ACDPluginLogSystem_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.accounts", "plugin");
  v1 = (void *)_ACDPluginLogSystem_log;
  _ACDPluginLogSystem_log = (uint64_t)v0;

}

@end
