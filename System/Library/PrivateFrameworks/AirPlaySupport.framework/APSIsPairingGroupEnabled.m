@implementation APSIsPairingGroupEnabled

uint64_t __APSIsPairingGroupEnabled_block_invoke()
{
  uint64_t result;

  result = APSSettingsIsFeatureEnabled(CFSTR("PairingGroup"));
  APSIsPairingGroupEnabled_sIsPairingGroupEnabled = result;
  return result;
}

@end
