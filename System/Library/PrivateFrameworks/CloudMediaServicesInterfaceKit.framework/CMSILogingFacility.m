@implementation CMSILogingFacility

void ___CMSILogingFacility_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.agora.interface", "log");
  v1 = (void *)_CMSILogingFacility_oslog;
  _CMSILogingFacility_oslog = (uint64_t)v0;

}

@end
