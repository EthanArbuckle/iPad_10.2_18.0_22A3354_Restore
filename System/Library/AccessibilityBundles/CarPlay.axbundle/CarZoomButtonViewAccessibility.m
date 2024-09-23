@implementation CarZoomButtonViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CarZoomButtonView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CarZoomButtonView"), CFSTR("initWithFrame:"), "@", "{CGRect={CGPoint=dd}{CGSize=dd}}", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("CarZoomButtonView"), CFSTR("_zoomInButton"), "CarFocusableImageButton");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("CarZoomButtonView"), CFSTR("_zoomOutButton"), "CarFocusableImageButton");

}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CarZoomButtonViewAccessibility;
  -[CarZoomButtonViewAccessibility _accessibilityLoadAccessibilityInformation](&v5, sel__accessibilityLoadAccessibilityInformation);
  -[CarZoomButtonViewAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("_zoomInButton"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAccessibilityIdentifier:", CFSTR("CarZoomButton-In"));

  -[CarZoomButtonViewAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("_zoomOutButton"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAccessibilityIdentifier:", CFSTR("CarZoomButton-In"));

}

- (CarZoomButtonViewAccessibility)initWithFrame:(CGRect)a3
{
  CarZoomButtonViewAccessibility *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CarZoomButtonViewAccessibility;
  v3 = -[CarZoomButtonViewAccessibility initWithFrame:](&v5, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  -[CarZoomButtonViewAccessibility _accessibilityLoadAccessibilityInformation](v3, "_accessibilityLoadAccessibilityInformation");

  return v3;
}

@end
