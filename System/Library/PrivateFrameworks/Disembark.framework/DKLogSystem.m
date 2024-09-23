@implementation DKLogSystem

void ___DKLogSystem_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.disembarkui", "general");
  v1 = (void *)_DKLogSystem_log;
  _DKLogSystem_log = (uint64_t)v0;

}

@end
