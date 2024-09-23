@implementation ANLogSystem

void ___ANLogSystem_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.and", "core");
  v1 = (void *)_ANLogSystem_log;
  _ANLogSystem_log = (uint64_t)v0;

}

@end
