@implementation ICPersNamedEntityOSLogFacility

void ___ICPersNamedEntityOSLogFacility_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.InputContext", "PersonalizationNamedEntity");
  v1 = (void *)_ICPersNamedEntityOSLogFacility_logFacility;
  _ICPersNamedEntityOSLogFacility_logFacility = (uint64_t)v0;

}

@end
