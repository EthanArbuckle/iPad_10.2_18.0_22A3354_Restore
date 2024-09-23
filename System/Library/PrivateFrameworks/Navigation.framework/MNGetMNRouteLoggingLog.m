@implementation MNGetMNRouteLoggingLog

void __MNGetMNRouteLoggingLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Navigation", "MNRouteLogging");
  v1 = (void *)_MergedGlobals_31;
  _MergedGlobals_31 = (uint64_t)v0;

}

@end
