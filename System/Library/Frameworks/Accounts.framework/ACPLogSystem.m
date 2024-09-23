@implementation ACPLogSystem

void ___ACPLogSystem_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.accounts", "persona");
  v1 = (void *)_ACPLogSystem_log;
  _ACPLogSystem_log = (uint64_t)v0;

}

@end
