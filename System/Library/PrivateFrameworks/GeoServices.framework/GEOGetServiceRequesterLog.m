@implementation GEOGetServiceRequesterLog

void __GEOGetServiceRequesterLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.GeoServices", "ServiceRequester");
  v1 = (void *)_MergedGlobals_327;
  _MergedGlobals_327 = (uint64_t)v0;

}

@end
