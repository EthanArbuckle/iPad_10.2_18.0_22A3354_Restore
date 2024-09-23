@implementation GEOGetGEODaemonLog

void __GEOGetGEODaemonLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.GeoServices", "GEODaemon");
  v1 = (void *)qword_1ECDBBAE0;
  qword_1ECDBBAE0 = (uint64_t)v0;

}

void __GEOGetGEODaemonLog_block_invoke_0()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.GeoServices", "GEODaemon");
  v1 = (void *)qword_1ECDBC2A8;
  qword_1ECDBC2A8 = (uint64_t)v0;

}

void __GEOGetGEODaemonLog_block_invoke_1()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.GeoServices", "GEODaemon");
  v1 = (void *)_MergedGlobals_345;
  _MergedGlobals_345 = (uint64_t)v0;

}

@end
