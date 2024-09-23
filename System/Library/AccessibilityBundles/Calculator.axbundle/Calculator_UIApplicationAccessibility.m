@implementation Calculator_UIApplicationAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UIApplication");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)_accessibilityActiveKeyboard
{
  void *v2;
  void *v3;

  -[Calculator_UIApplicationAccessibility _accessibilityWindow](self, "_accessibilityWindow");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessibilityViewWithIdentifier:", CFSTR("CalculatorKeypadView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
