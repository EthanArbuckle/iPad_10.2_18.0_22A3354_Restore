@implementation APSIsProximityReceiverEnabled

uint64_t __APSIsProximityReceiverEnabled_block_invoke()
{
  uint64_t result;

  result = APSSettingsIsFeatureEnabled(CFSTR("ProximityReceiver"));
  APSIsProximityReceiverEnabled_sProximityReceiverEnabled = result;
  return result;
}

@end
