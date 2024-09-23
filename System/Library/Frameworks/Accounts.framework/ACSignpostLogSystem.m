@implementation ACSignpostLogSystem

void ___ACSignpostLogSystem_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.accounts", "signpost");
  v1 = (void *)_ACSignpostLogSystem_log;
  _ACSignpostLogSystem_log = (uint64_t)v0;

}

@end
