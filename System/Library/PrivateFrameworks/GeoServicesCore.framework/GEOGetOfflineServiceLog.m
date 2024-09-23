@implementation GEOGetOfflineServiceLog

void __GEOGetOfflineServiceLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.GeoServices", "OfflineService");
  v1 = (void *)qword_1ECE24598;
  qword_1ECE24598 = (uint64_t)v0;

}

@end
