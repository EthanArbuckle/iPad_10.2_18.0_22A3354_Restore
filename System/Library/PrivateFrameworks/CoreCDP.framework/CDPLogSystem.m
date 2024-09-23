@implementation CDPLogSystem

void ___CDPLogSystem_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.cdp", "core");
  v1 = (void *)_CDPLogSystem_log;
  _CDPLogSystem_log = (uint64_t)v0;

}

@end
