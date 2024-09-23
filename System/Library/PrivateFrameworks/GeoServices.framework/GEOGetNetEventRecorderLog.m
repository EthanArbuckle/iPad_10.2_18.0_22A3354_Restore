@implementation GEOGetNetEventRecorderLog

void __GEOGetNetEventRecorderLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.GeoServices", "NetEventRecorder");
  v1 = (void *)qword_1ECDBC288;
  qword_1ECDBC288 = (uint64_t)v0;

}

@end
