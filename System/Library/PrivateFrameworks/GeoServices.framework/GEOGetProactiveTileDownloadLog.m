@implementation GEOGetProactiveTileDownloadLog

void __GEOGetProactiveTileDownloadLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.GeoServices", "ProactiveTileDownload");
  v1 = (void *)_MergedGlobals_208;
  _MergedGlobals_208 = (uint64_t)v0;

}

@end
