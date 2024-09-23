@implementation CPLProxyPullSessionOSLogDomain

void ____CPLProxyPullSessionOSLogDomain_block_invoke()
{
  const char *v0;
  os_log_t v1;
  void *v2;

  v0 = _CPLOSLogSubsystem();
  v1 = os_log_create(v0, "client.session.pull.proxy");
  v2 = (void *)__CPLProxyPullSessionOSLogDomain_result;
  __CPLProxyPullSessionOSLogDomain_result = (uint64_t)v1;

}

@end
