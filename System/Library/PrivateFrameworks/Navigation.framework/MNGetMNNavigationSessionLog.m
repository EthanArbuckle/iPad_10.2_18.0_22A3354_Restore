@implementation MNGetMNNavigationSessionLog

void __MNGetMNNavigationSessionLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Navigation", "MNNavigationSession");
  v1 = (void *)MNGetMNNavigationSessionLog_log;
  MNGetMNNavigationSessionLog_log = (uint64_t)v0;

}

@end
