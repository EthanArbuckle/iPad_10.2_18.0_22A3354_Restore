@implementation GEOGetRRMetadataFileManagerLog

void __GEOGetRRMetadataFileManagerLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.GeoServices", "RRMetadataFileManager");
  v1 = (void *)qword_1ECDBBDA8;
  qword_1ECDBBDA8 = (uint64_t)v0;

}

@end
