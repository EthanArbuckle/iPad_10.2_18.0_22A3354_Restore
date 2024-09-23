@implementation LogCategory

void __LogCategory_Unspecified_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.icloud.FMCoreUI", "_");
  v1 = (void *)LogCategory_Unspecified_log;
  LogCategory_Unspecified_log = (uint64_t)v0;

}

void __LogCategory_ViewControllerLifecyle_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.icloud.FMCoreUI", "vc");
  v1 = (void *)LogCategory_ViewControllerLifecyle_log;
  LogCategory_ViewControllerLifecyle_log = (uint64_t)v0;

}

void __LogCategory_FMSlidingPaneViewController_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.icloud.FMCoreUI", "FMSlidingPaneViewController");
  v1 = (void *)LogCategory_FMSlidingPaneViewController_log;
  LogCategory_FMSlidingPaneViewController_log = (uint64_t)v0;

}

@end
