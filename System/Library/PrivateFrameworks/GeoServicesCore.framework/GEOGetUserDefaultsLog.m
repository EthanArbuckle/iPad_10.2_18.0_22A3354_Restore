@implementation GEOGetUserDefaultsLog

void __GEOGetUserDefaultsLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.GeoServices", "UserDefaults");
  v1 = (void *)qword_1ECE24528;
  qword_1ECE24528 = (uint64_t)v0;

}

@end
