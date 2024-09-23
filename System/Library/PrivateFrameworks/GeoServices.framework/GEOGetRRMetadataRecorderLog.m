@implementation GEOGetRRMetadataRecorderLog

void __GEOGetRRMetadataRecorderLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.GeoServices", "RRMetadataRecorder");
  v1 = (void *)_MergedGlobals_319;
  _MergedGlobals_319 = (uint64_t)v0;

}

@end
