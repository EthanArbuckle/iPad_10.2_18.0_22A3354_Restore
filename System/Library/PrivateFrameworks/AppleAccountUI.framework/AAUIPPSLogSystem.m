@implementation AAUIPPSLogSystem

void ___AAUIPPSLogSystem_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.appleaccount", "ui.pps");
  v1 = (void *)_AAUIPPSLogSystem_log;
  _AAUIPPSLogSystem_log = (uint64_t)v0;

}

@end
