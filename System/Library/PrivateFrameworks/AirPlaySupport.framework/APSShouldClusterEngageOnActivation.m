@implementation APSShouldClusterEngageOnActivation

uint64_t __APSShouldClusterEngageOnActivation_block_invoke()
{
  uint64_t result;

  result = APSSettingsIsFeatureEnabled(CFSTR("EngageOnActivateCluster"));
  if ((_DWORD)result)
    APSShouldClusterEngageOnActivation_sEngageOnActivateCluster = 1;
  return result;
}

@end
