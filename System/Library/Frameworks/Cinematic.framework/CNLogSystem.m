@implementation CNLogSystem

void ___CNLogSystem_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.portrait", "cinematic");
  v1 = (void *)_CNLogSystem_log;
  _CNLogSystem_log = (uint64_t)v0;

}

@end
