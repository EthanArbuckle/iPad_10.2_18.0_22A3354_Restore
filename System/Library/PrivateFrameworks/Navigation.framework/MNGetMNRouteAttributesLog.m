@implementation MNGetMNRouteAttributesLog

void __MNGetMNRouteAttributesLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Navigation", "MNRouteAttributes");
  v1 = (void *)MNGetMNRouteAttributesLog_log;
  MNGetMNRouteAttributesLog_log = (uint64_t)v0;

}

@end
