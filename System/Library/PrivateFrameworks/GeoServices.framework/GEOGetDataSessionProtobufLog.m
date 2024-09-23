@implementation GEOGetDataSessionProtobufLog

void __GEOGetDataSessionProtobufLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.GeoServices", "DataSessionProtobuf");
  v1 = (void *)qword_1ECDBC210;
  qword_1ECDBC210 = (uint64_t)v0;

}

@end
