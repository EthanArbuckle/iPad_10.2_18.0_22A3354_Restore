@implementation GEOGetRequestCountPowerLoggerLog

void __GEOGetRequestCountPowerLoggerLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.GeoServices", "RequestCountPowerLogger");
  v1 = (void *)qword_1ECDBBC60;
  qword_1ECDBBC60 = (uint64_t)v0;

}

@end
