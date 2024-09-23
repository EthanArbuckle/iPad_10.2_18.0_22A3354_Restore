@implementation GEOGetNetEventFileManagerLog

void __GEOGetNetEventFileManagerLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.GeoServices", "NetEventFileManager");
  v1 = (void *)qword_1ECDBB9F0;
  qword_1ECDBB9F0 = (uint64_t)v0;

}

@end
