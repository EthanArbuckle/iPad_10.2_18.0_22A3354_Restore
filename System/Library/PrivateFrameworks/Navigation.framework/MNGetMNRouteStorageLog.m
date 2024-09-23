@implementation MNGetMNRouteStorageLog

void __MNGetMNRouteStorageLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Navigation", "MNRouteStorage");
  v1 = (void *)MNGetMNRouteStorageLog_log;
  MNGetMNRouteStorageLog_log = (uint64_t)v0;

}

@end
