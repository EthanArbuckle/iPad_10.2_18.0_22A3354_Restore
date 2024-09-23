@implementation APSIsSuntoryEnabled

uint64_t __APSIsSuntoryEnabled_block_invoke()
{
  uint64_t result;

  result = APSSettingsIsFeatureEnabledInDomain();
  if ((_DWORD)result)
    APSIsSuntoryEnabled_sSuntoryEnabled = 1;
  return result;
}

@end
