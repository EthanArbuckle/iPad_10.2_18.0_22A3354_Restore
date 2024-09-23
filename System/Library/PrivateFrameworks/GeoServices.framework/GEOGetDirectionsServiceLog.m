@implementation GEOGetDirectionsServiceLog

void __GEOGetDirectionsServiceLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.GeoServices", "DirectionsService");
  v1 = (void *)_MergedGlobals_281;
  _MergedGlobals_281 = (uint64_t)v0;

}

void __GEOGetDirectionsServiceLog_block_invoke_0()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.GeoServices", "DirectionsService");
  v1 = (void *)qword_1ECDBC6A0;
  qword_1ECDBC6A0 = (uint64_t)v0;

}

@end
