@implementation GEOGetExternalRequestLog

void __GEOGetExternalRequestLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.GeoServices", "ExternalRequest");
  v1 = (void *)qword_1ECDBB970;
  qword_1ECDBB970 = (uint64_t)v0;

}

@end
