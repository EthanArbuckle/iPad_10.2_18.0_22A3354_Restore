@implementation SiriAcousticIdAttributionFooterViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SiriAcousticIdAttributionFooterView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SiriAcousticIdAttributionFooterView"), CFSTR("attributionButton"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SiriAcousticIdAttributionFooterView"), CFSTR("initWithFrame:"), "@", "{CGRect={CGPoint=dd}{CGSize=dd}}", 0);

}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SiriAcousticIdAttributionFooterViewAccessibility;
  -[SiriAcousticIdAttributionFooterViewAccessibility _accessibilityLoadAccessibilityInformation](&v6, sel__accessibilityLoadAccessibilityInformation);
  -[SiriAcousticIdAttributionFooterViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("attributionButton"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  accessibilityLocalizedString(CFSTR("attribution.button.title"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAccessibilityLabel:", v4);

  accessibilityLocalizedString(CFSTR("attribution.button.hint"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAccessibilityHint:", v5);

}

- (SiriAcousticIdAttributionFooterViewAccessibility)initWithFrame:(CGRect)a3
{
  SiriAcousticIdAttributionFooterViewAccessibility *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SiriAcousticIdAttributionFooterViewAccessibility;
  v3 = -[SiriAcousticIdAttributionFooterViewAccessibility initWithFrame:](&v5, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  -[SiriAcousticIdAttributionFooterViewAccessibility _accessibilityLoadAccessibilityInformation](v3, "_accessibilityLoadAccessibilityInformation");

  return v3;
}

@end
