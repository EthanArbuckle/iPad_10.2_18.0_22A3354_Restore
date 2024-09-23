@implementation DMTLogEnrollment

void ___DMTLogEnrollment_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.devicemanagementtools", "Enrollment");
  v1 = (void *)_DMTLogEnrollment_logObj;
  _DMTLogEnrollment_logObj = (uint64_t)v0;

}

@end
