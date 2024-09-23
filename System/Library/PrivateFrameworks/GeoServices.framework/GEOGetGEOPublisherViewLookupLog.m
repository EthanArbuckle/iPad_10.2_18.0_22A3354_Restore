@implementation GEOGetGEOPublisherViewLookupLog

void __GEOGetGEOPublisherViewLookupLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.GeoServices", "GEOPublisherViewLookup");
  v1 = (void *)qword_1EDF51110;
  qword_1EDF51110 = (uint64_t)v0;

}

@end
