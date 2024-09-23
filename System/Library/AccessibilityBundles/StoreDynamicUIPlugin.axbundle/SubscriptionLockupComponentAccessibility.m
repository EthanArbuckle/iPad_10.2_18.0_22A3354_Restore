@implementation SubscriptionLockupComponentAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("StoreDynamicUIPlugin.SubscriptionLockupComponent");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

@end
