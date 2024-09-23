@implementation MNGetMNSuggestedNavigationModeLog

void __MNGetMNSuggestedNavigationModeLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Navigation", "MNSuggestedNavigationMode");
  v1 = (void *)MNGetMNSuggestedNavigationModeLog_log;
  MNGetMNSuggestedNavigationModeLog_log = (uint64_t)v0;

}

@end
