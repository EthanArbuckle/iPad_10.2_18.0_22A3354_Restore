@implementation MTSwitchCellAccessibility_temp

+ (id)safeCategoryTargetClassName
{
  return CFSTR("MTSwitchCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MTSwitchCell"), CFSTR("toggle"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MTSwitchCell"), CFSTR("toggleChanged:"), "v", "@", 0);

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityValue
{
  void *v2;
  void *v3;

  -[MTSwitchCellAccessibility_temp safeValueForKey:](self, "safeValueForKey:", CFSTR("toggle"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessibilityValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (CGPoint)accessibilityActivationPoint
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGPoint result;

  -[MTSwitchCellAccessibility_temp safeValueForKey:](self, "safeValueForKey:", CFSTR("toggle"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessibilityActivationPoint");
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.y = v8;
  result.x = v7;
  return result;
}

- (unint64_t)accessibilityTraits
{
  void *v2;

  -[MTSwitchCellAccessibility_temp safeValueForKey:](self, "safeValueForKey:", CFSTR("toggle"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessibilityTraits");

  return _AXTraitsRemoveTrait();
}

@end
