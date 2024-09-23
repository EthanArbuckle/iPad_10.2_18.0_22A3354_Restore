@implementation APSIsEndpointClusteringEnabled

uint64_t __APSIsEndpointClusteringEnabled_block_invoke()
{
  uint64_t result;

  APSIsEndpointClusteringEnabled_sIsEndpointClusteringEnabled = 1;
  result = IsAppleInternalBuild();
  if ((_DWORD)result)
  {
    result = APSSettingsGetIntWithOverrideAndDefault(CFSTR("enableClusterEndpoint"), 0, APSIsEndpointClusteringEnabled_sIsEndpointClusteringEnabled);
    APSIsEndpointClusteringEnabled_sIsEndpointClusteringEnabled = result;
  }
  return result;
}

@end
