@implementation MSLogingFacility

void ___MSLogingFacility_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.mediasetup.framework", "log");
  v1 = (void *)_MSLogingFacility_oslog;
  _MSLogingFacility_oslog = (uint64_t)v0;

}

@end
