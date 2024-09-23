@implementation MNGetMNDirectionsRequestLog

void __MNGetMNDirectionsRequestLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Navigation", "MNDirectionsRequest");
  v1 = (void *)MNGetMNDirectionsRequestLog_log;
  MNGetMNDirectionsRequestLog_log = (uint64_t)v0;

}

@end
