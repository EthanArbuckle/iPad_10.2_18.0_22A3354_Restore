@implementation CPLDropDerivativesOSLogDomain

void ____CPLDropDerivativesOSLogDomain_block_invoke()
{
  const char *v0;
  os_log_t v1;
  void *v2;

  v0 = (const char *)_CPLOSLogSubsystem();
  v1 = os_log_create(v0, "cloudphotoservices.dropderivatives");
  v2 = (void *)__CPLDropDerivativesOSLogDomain_result;
  __CPLDropDerivativesOSLogDomain_result = (uint64_t)v1;

}

@end
