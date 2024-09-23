@implementation GEOGetImageServiceLog

void __GEOGetImageServiceLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.GeoServices", "ImageService");
  v1 = (void *)qword_1ECDBCAE0;
  qword_1ECDBCAE0 = (uint64_t)v0;

}

@end
