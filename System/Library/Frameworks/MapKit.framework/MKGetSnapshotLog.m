@implementation MKGetSnapshotLog

void __MKGetSnapshotLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.MapKit", "Snapshot");
  v1 = (void *)MKGetSnapshotLog_log;
  MKGetSnapshotLog_log = (uint64_t)v0;

}

@end
