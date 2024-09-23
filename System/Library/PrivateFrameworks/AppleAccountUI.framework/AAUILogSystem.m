@implementation AAUILogSystem

void ___AAUILogSystem_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.appleaccount", "ui");
  v1 = (void *)_AAUILogSystem_log;
  _AAUILogSystem_log = (uint64_t)v0;

}

@end
