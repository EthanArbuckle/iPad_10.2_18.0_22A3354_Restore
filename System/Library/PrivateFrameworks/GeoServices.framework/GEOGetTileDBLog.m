@implementation GEOGetTileDBLog

void __GEOGetTileDBLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.GeoServices", "TileDB");
  v1 = (void *)qword_1ECDBB8F8;
  qword_1ECDBB8F8 = (uint64_t)v0;

}

void __GEOGetTileDBLog_block_invoke_0()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.GeoServices", "TileDB");
  v1 = (void *)_MergedGlobals_280;
  _MergedGlobals_280 = (uint64_t)v0;

}

@end
