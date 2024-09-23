@implementation MNGetMNLocationTrackerLog

void __MNGetMNLocationTrackerLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Navigation", "MNLocationTracker");
  v1 = (void *)MNGetMNLocationTrackerLog_log;
  MNGetMNLocationTrackerLog_log = (uint64_t)v0;

}

@end
