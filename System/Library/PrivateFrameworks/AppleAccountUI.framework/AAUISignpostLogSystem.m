@implementation AAUISignpostLogSystem

void ___AAUISignpostLogSystem_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.appleaccount", "ui.signpost");
  v1 = (void *)_AAUISignpostLogSystem_log;
  _AAUISignpostLogSystem_log = (uint64_t)v0;

}

@end
