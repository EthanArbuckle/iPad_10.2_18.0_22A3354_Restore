@implementation GEOGetSignedResourcesLog

void __GEOGetSignedResourcesLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.GeoServices", "SignedResources");
  v1 = (void *)qword_1ECDBB950;
  qword_1ECDBB950 = (uint64_t)v0;

}

@end
