@implementation MNGetMNTraceLog

void __MNGetMNTraceLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Navigation", "MNTrace");
  v1 = (void *)MNGetMNTraceLog_log;
  MNGetMNTraceLog_log = (uint64_t)v0;

}

@end
