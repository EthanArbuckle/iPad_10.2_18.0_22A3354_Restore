@implementation AALogSystem

void ___AALogSystem_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.appleaccount", "log");
  v1 = (void *)_AALogSystem_log;
  _AALogSystem_log = (uint64_t)v0;

}

@end
