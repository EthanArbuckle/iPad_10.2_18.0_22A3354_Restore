@implementation GEOGetTileServerRemoteProxyLog

void __GEOGetTileServerRemoteProxyLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.GeoServices", "TileServerRemoteProxy");
  v1 = (void *)_MergedGlobals_9;
  _MergedGlobals_9 = (uint64_t)v0;

}

@end
