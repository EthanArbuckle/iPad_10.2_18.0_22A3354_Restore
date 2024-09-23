@implementation DMFPersonalHotspotLog

void __DMFPersonalHotspotLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.dmd", "PersonalHotspot");
  v1 = (void *)DMFPersonalHotspotLog_log;
  DMFPersonalHotspotLog_log = (uint64_t)v0;

}

@end
