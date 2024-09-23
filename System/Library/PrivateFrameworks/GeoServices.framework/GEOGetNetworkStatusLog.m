@implementation GEOGetNetworkStatusLog

void __GEOGetNetworkStatusLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.GeoServices", "NetworkStatus");
  v1 = (void *)qword_1ECDBC088;
  qword_1ECDBC088 = (uint64_t)v0;

}

@end
