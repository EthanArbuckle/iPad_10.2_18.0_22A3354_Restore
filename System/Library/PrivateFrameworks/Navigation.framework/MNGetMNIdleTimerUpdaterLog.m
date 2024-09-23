@implementation MNGetMNIdleTimerUpdaterLog

void __MNGetMNIdleTimerUpdaterLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Navigation", "MNIdleTimerUpdater");
  v1 = (void *)MNGetMNIdleTimerUpdaterLog_log;
  MNGetMNIdleTimerUpdaterLog_log = (uint64_t)v0;

}

@end
