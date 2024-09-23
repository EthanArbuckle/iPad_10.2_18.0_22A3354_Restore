@implementation GEOGetTileLoadingLog

void __GEOGetTileLoadingLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.GeoServices", "TileLoading");
  v1 = (void *)qword_1ECE24518;
  qword_1ECE24518 = (uint64_t)v0;

}

@end
