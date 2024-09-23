@implementation HGObjCLoggingFacility

void ___HGObjCLoggingFacility_block_invoke(uint64_t a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create("com.apple.HeadGestures", *(const char **)(a1 + 32));
  v2 = (void *)_HGObjCLoggingFacility_oslog;
  _HGObjCLoggingFacility_oslog = (uint64_t)v1;

}

@end
