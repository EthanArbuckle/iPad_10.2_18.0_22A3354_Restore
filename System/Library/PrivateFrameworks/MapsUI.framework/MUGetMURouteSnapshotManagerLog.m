@implementation MUGetMURouteSnapshotManagerLog

void __MUGetMURouteSnapshotManagerLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.MapsUI", "MURouteSnapshotManager");
  v1 = (void *)qword_1ED01B590;
  qword_1ED01B590 = (uint64_t)v0;

}

@end
