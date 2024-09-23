@implementation NNSetupCompanionSyncLog

void __NNSetupCompanionSyncLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.nanonews", "CompanionSync");
  v1 = (void *)NNSetupCompanionSyncLog_log;
  NNSetupCompanionSyncLog_log = (uint64_t)v0;

}

@end
