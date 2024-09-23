@implementation SSVellumOpacityControlAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SSVellumOpacityControl");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SSVellumOpacityControl"), CFSTR("_slider"), "UISlider");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SSVellumOpacityControl"), CFSTR("initWithFrame:"), "@", "{CGRect={CGPoint=dd}{CGSize=dd}}", 0);

}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SSVellumOpacityControlAccessibility;
  -[SSVellumOpacityControlAccessibility _accessibilityLoadAccessibilityInformation](&v5, sel__accessibilityLoadAccessibilityInformation);
  -[SSVellumOpacityControlAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_slider"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  accessibilityLocalizedString(CFSTR("opacity.slider"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAccessibilityLabel:", v4);

}

- (SSVellumOpacityControlAccessibility)initWithFrame:(CGRect)a3
{
  SSVellumOpacityControlAccessibility *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SSVellumOpacityControlAccessibility;
  v3 = -[SSVellumOpacityControlAccessibility initWithFrame:](&v5, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  -[SSVellumOpacityControlAccessibility _accessibilityLoadAccessibilityInformation](v3, "_accessibilityLoadAccessibilityInformation");

  return v3;
}

- (BOOL)canBecomeFocused
{
  return 0;
}

@end
