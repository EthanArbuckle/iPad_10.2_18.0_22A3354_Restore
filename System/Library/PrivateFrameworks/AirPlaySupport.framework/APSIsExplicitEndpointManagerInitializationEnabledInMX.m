@implementation APSIsExplicitEndpointManagerInitializationEnabledInMX

uint64_t __APSIsExplicitEndpointManagerInitializationEnabledInMX_block_invoke()
{
  uint64_t result;

  result = APSSettingsIsFeatureEnabledInDomain();
  if ((_DWORD)result)
    APSIsExplicitEndpointManagerInitializationEnabledInMX_sEnabled = 1;
  return result;
}

@end
