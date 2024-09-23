@implementation APSIsProximitySenderEnabled

uint64_t __APSIsProximitySenderEnabled_block_invoke()
{
  uint64_t result;

  result = APSSettingsIsFeatureEnabled(CFSTR("ProximitySender"));
  APSIsProximitySenderEnabled_sProximitySenderEnabled = result;
  return result;
}

@end
