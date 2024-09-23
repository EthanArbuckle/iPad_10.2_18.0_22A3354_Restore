@implementation GEOGetGEOPrivacyManagerLog

void __GEOGetGEOPrivacyManagerLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.GeoServices", "GEOPrivacyManager");
  v1 = (void *)qword_1ECDBC108;
  qword_1ECDBC108 = (uint64_t)v0;

}

@end
