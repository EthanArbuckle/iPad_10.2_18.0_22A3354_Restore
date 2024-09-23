@implementation GEOGetPublisherAttributionLog

void __GEOGetPublisherAttributionLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.GeoServices", "PublisherAttribution");
  v1 = (void *)qword_1ECDBCAA8;
  qword_1ECDBCAA8 = (uint64_t)v0;

}

@end
