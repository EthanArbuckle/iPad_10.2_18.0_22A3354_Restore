@implementation AFUIServiceDelegateOSLogFacility

void __AFUIServiceDelegateOSLogFacility_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.AutoFillUI", "AFUIServiceDelegate");
  v1 = (void *)AFUIServiceDelegateOSLogFacility_logFacility;
  AFUIServiceDelegateOSLogFacility_logFacility = (uint64_t)v0;

}

@end
