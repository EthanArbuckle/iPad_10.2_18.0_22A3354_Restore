@implementation MNGetMNRouteEditorLog

void __MNGetMNRouteEditorLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Navigation", "MNRouteEditor");
  v1 = (void *)MNGetMNRouteEditorLog_log;
  MNGetMNRouteEditorLog_log = (uint64_t)v0;

}

@end
