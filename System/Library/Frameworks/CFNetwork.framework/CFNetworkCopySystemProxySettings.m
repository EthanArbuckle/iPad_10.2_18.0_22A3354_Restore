@implementation CFNetworkCopySystemProxySettings

uint64_t ___CFNetworkCopySystemProxySettings_block_invoke()
{
  int *v0;
  uint64_t result;
  int check;

  v0 = (int *)operator new();
  v0[1] = 0;
  *v0 = 0;
  notify_register_check("com.apple.system.config.network_change", v0);
  notify_register_check("com.apple.system.config.proxy_change", v0 + 1);
  check = 0;
  notify_check(*v0, &check);
  result = notify_check(v0[1], &check);
  _CFNetworkCopySystemProxySettings::configWatcher = (uint64_t)v0;
  return result;
}

@end
