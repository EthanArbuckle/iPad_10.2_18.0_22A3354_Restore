@implementation MNGetMNDepartureUpdaterLog

void __MNGetMNDepartureUpdaterLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Navigation", "MNDepartureUpdater");
  v1 = (void *)MNGetMNDepartureUpdaterLog_log;
  MNGetMNDepartureUpdaterLog_log = (uint64_t)v0;

}

@end
