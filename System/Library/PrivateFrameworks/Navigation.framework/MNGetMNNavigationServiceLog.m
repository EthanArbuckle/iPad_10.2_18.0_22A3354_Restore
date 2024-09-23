@implementation MNGetMNNavigationServiceLog

void __MNGetMNNavigationServiceLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Navigation", "MNNavigationService");
  v1 = (void *)MNGetMNNavigationServiceLog_log;
  MNGetMNNavigationServiceLog_log = (uint64_t)v0;

}

@end
