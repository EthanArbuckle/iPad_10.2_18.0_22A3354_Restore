@implementation APNetworksControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("APNetworksController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)accessibilityIdentifier
{
  return CFSTR("APNetworks");
}

@end
