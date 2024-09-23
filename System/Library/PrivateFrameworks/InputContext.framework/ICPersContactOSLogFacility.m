@implementation ICPersContactOSLogFacility

void ___ICPersContactOSLogFacility_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.InputContext", "PersonalizationContact");
  v1 = (void *)_ICPersContactOSLogFacility_logFacility;
  _ICPersContactOSLogFacility_logFacility = (uint64_t)v0;

}

@end
