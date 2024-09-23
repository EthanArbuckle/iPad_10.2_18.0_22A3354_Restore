@implementation CESignpostLogSystem

void ___CESignpostLogSystem_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.cloudexperience", "core.signpost");
  v1 = (void *)_CESignpostLogSystem_log;
  _CESignpostLogSystem_log = (uint64_t)v0;

}

@end
