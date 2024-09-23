@implementation AIDALogSystem

void ___AIDALogSystem_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.appleaccount", "authentication");
  v1 = (void *)_AIDALogSystem_log;
  _AIDALogSystem_log = (uint64_t)v0;

}

@end
