@implementation CDPSignpostLogSystem

void ___CDPSignpostLogSystem_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.cdp", "signpost");
  v1 = (void *)_CDPSignpostLogSystem_log;
  _CDPSignpostLogSystem_log = (uint64_t)v0;

}

@end
