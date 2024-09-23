@implementation MNGetMNNavigationSimulationLog

void __MNGetMNNavigationSimulationLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Navigation", "MNNavigationSimulation");
  v1 = (void *)MNGetMNNavigationSimulationLog_log;
  MNGetMNNavigationSimulationLog_log = (uint64_t)v0;

}

@end
