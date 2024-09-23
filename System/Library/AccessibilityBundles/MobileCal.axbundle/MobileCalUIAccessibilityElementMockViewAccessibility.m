@implementation MobileCalUIAccessibilityElementMockViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UIAccessibilityElementMockView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceVariable:withType:", CFSTR("UIAccessibilityElementMockView"), CFSTR("_view"), "UIView");
}

- (BOOL)accessibilityActivate
{
  void *v3;
  void *v4;
  objc_super v6;

  -[MobileCalUIAccessibilityElementMockViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_view"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeValueForKey:", CFSTR("window"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
    return 0;
  v6.receiver = self;
  v6.super_class = (Class)MobileCalUIAccessibilityElementMockViewAccessibility;
  return -[MobileCalUIAccessibilityElementMockViewAccessibility accessibilityActivate](&v6, sel_accessibilityActivate);
}

@end
