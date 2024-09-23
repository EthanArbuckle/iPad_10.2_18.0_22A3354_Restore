@implementation MNGetMNTunnelProjectorLog

void __MNGetMNTunnelProjectorLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Navigation", "MNTunnelProjector");
  v1 = (void *)MNGetMNTunnelProjectorLog_log;
  MNGetMNTunnelProjectorLog_log = (uint64_t)v0;

}

@end
