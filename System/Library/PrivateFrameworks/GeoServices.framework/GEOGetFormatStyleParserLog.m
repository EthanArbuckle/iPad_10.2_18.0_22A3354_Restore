@implementation GEOGetFormatStyleParserLog

void __GEOGetFormatStyleParserLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.GeoServices", "FormatStyleParser");
  v1 = (void *)qword_1ECDBBE20;
  qword_1ECDBBE20 = (uint64_t)v0;

}

@end
