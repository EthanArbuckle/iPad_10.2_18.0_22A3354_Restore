@implementation CPLCloudPhotoServicesOSLogDomain

void ____CPLCloudPhotoServicesOSLogDomain_block_invoke()
{
  const char *v0;
  os_log_t v1;
  void *v2;

  v0 = (const char *)_CPLOSLogSubsystem();
  v1 = os_log_create(v0, "cloudphotoservices");
  v2 = (void *)__CPLCloudPhotoServicesOSLogDomain_result;
  __CPLCloudPhotoServicesOSLogDomain_result = (uint64_t)v1;

}

@end
