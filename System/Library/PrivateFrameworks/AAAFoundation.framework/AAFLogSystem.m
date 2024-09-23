@implementation AAFLogSystem

void ___AAFLogSystem_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.aaafoundation", "log");
  v1 = (void *)_AAFLogSystem_log;
  _AAFLogSystem_log = (uint64_t)v0;

}

@end
