@implementation MNGetMNNavigationXPCLog

void __MNGetMNNavigationXPCLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Navigation", "MNNavigationXPC");
  v1 = (void *)MNGetMNNavigationXPCLog_log;
  MNGetMNNavigationXPCLog_log = (uint64_t)v0;

}

@end
