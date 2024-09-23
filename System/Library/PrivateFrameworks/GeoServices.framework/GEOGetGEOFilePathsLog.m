@implementation GEOGetGEOFilePathsLog

void __GEOGetGEOFilePathsLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.GeoServices", "GEOFilePaths");
  v1 = (void *)qword_1ECDBC150;
  qword_1ECDBC150 = (uint64_t)v0;

}

void __GEOGetGEOFilePathsLog_block_invoke_0()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.GeoServices", "GEOFilePaths");
  v1 = (void *)_MergedGlobals_286;
  _MergedGlobals_286 = (uint64_t)v0;

}

@end
