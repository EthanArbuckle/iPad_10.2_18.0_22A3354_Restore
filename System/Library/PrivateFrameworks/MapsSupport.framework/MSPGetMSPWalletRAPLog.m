@implementation MSPGetMSPWalletRAPLog

void __MSPGetMSPWalletRAPLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Maps.MSP", "MSPWalletRAP");
  v1 = (void *)_MergedGlobals_43;
  _MergedGlobals_43 = (uint64_t)v0;

}

@end
