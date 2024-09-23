@implementation MNGetMNTimeAndDistanceUpdaterLog

void __MNGetMNTimeAndDistanceUpdaterLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Navigation", "MNTimeAndDistanceUpdater");
  v1 = (void *)MNGetMNTimeAndDistanceUpdaterLog_log;
  MNGetMNTimeAndDistanceUpdaterLog_log = (uint64_t)v0;

}

@end
