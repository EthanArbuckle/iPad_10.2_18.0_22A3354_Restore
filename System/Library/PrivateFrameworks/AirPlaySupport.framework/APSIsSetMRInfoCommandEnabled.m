@implementation APSIsSetMRInfoCommandEnabled

uint64_t __APSIsSetMRInfoCommandEnabled_block_invoke()
{
  uint64_t result;

  result = APSSettingsIsFeatureEnabled(CFSTR("SetMRInfo"));
  if ((_DWORD)result)
    APSIsSetMRInfoCommandEnabled_sSetMREnabled = 1;
  return result;
}

@end
