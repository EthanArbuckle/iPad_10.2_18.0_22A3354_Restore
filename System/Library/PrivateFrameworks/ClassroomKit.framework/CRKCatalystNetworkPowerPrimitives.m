@implementation CRKCatalystNetworkPowerPrimitives

- (id)assertNetworkPowerOn
{
  +[CRKNetworkPowerAssertion increment](CRKNetworkPowerAssertion, "increment");
  return (id)objc_opt_new();
}

@end
