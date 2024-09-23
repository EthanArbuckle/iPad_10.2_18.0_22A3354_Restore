@implementation ACLogSystem

void ___ACLogSystem_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.accounts", "core");
  v1 = (void *)_ACLogSystem_log;
  _ACLogSystem_log = (uint64_t)v0;

}

@end
