@implementation CPLProxyPushSessionOSLogDomain

void ____CPLProxyPushSessionOSLogDomain_block_invoke()
{
  const char *v0;
  os_log_t v1;
  void *v2;

  v0 = _CPLOSLogSubsystem();
  v1 = os_log_create(v0, "client.session.push.proxy");
  v2 = (void *)__CPLProxyPushSessionOSLogDomain_result;
  __CPLProxyPushSessionOSLogDomain_result = (uint64_t)v1;

}

@end
