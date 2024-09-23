@implementation GEOGetGEOPOICategoryLog

void __GEOGetGEOPOICategoryLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.GeoServices", "GEOPOICategory");
  v1 = (void *)qword_1ECDBCBE0;
  qword_1ECDBCBE0 = (uint64_t)v0;

}

@end
