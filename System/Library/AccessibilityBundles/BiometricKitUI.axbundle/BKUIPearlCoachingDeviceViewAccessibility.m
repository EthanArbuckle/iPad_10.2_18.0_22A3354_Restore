@implementation BKUIPearlCoachingDeviceViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("BKUIPearlCoachingDeviceView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("BKUIPearlCoachingDeviceView"), CFSTR("deviceView"), "@", 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BKUIPearlCoachingDeviceViewAccessibility;
  return *MEMORY[0x24BDF73C8] | -[BKUIPearlCoachingDeviceViewAccessibility accessibilityTraits](&v3, sel_accessibilityTraits);
}

- (id)accessibilityLabel
{
  return accessibilityLocalizedString(CFSTR("coaching.device.view.label"));
}

- (CGRect)accessibilityFrame
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGRect result;

  -[BKUIPearlCoachingDeviceViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("deviceView"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessibilityFrame");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;

  v11 = v4;
  v12 = v6;
  v13 = v8;
  v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (BOOL)_accessibilityOverridesInvalidFrames
{
  return 1;
}

@end
