@implementation CELogSystem

void ___CELogSystem_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.cloudexperience", "log");
  v1 = (void *)_CELogSystem_log;
  _CELogSystem_log = (uint64_t)v0;

}

@end
