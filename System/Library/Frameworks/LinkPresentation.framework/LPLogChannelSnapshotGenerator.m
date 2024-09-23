@implementation LPLogChannelSnapshotGenerator

void __LPLogChannelSnapshotGenerator_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.LinkPresentation", "SnapshotGenerator");
  v1 = (void *)LPLogChannelSnapshotGenerator_log;
  LPLogChannelSnapshotGenerator_log = (uint64_t)v0;

}

@end
