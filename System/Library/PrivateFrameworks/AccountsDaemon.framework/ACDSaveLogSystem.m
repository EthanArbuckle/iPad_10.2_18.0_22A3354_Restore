@implementation ACDSaveLogSystem

void ___ACDSaveLogSystem_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.accounts", "save");
  v1 = (void *)_ACDSaveLogSystem_log;
  _ACDSaveLogSystem_log = (uint64_t)v0;

}

@end
