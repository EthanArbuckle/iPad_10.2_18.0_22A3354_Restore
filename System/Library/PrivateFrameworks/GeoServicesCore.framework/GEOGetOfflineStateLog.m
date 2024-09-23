@implementation GEOGetOfflineStateLog

void __GEOGetOfflineStateLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.GeoServices", "OfflineState");
  v1 = (void *)qword_1ECE245A8;
  qword_1ECE245A8 = (uint64_t)v0;

}

@end
