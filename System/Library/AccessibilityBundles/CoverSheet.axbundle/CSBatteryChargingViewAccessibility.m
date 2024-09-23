@implementation CSBatteryChargingViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CSBatteryChargingView");
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
