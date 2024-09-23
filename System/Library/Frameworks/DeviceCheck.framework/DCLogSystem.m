@implementation DCLogSystem

void ___DCLogSystem_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.devicecheck", "core");
  v1 = (void *)_DCLogSystem_log;
  _DCLogSystem_log = (uint64_t)v0;

}

@end
