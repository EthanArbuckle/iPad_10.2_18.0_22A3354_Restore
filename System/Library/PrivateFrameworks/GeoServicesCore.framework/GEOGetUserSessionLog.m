@implementation GEOGetUserSessionLog

void __GEOGetUserSessionLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.GeoServices", "UserSession");
  v1 = (void *)qword_1ECE24548;
  qword_1ECE24548 = (uint64_t)v0;

}

@end
