@implementation MNGetMNNavigationDetailsLog

void __MNGetMNNavigationDetailsLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Navigation", "MNNavigationDetails");
  v1 = (void *)MNGetMNNavigationDetailsLog_log;
  MNGetMNNavigationDetailsLog_log = (uint64_t)v0;

}

@end
