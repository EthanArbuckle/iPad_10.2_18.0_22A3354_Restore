@implementation _CSSingleBatteryChargingViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("_CSSingleBatteryChargingView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceVariable:withType:", CFSTR("_CSSingleBatteryChargingView"), CFSTR("_chargePercentLabel"), "SBUILegibilityLabel");
}

- (id)accessibilityLabel
{
  void *v2;
  void *v3;

  -[_CSSingleBatteryChargingViewAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("_chargePercentLabel"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessibilityLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
