@implementation GEOGetMKIconManagerLog

void __GEOGetMKIconManagerLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.GeoServices", "MKIconManager");
  v1 = (void *)qword_1ECE2D988;
  qword_1ECE2D988 = (uint64_t)v0;

}

@end
