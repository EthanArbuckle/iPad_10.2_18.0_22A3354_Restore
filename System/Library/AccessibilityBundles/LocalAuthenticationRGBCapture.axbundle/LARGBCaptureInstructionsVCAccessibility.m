@implementation LARGBCaptureInstructionsVCAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("LARGBCaptureInstructionsVC");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("LARGBCaptureInstructionsVC"), CFSTR("loadView"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("LARGBCaptureInstructionsVC"), CFSTR("_titleLabel"), "UILabel");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("LARGBCaptureInstructionsVC"), CFSTR("_footerText"), "UITextView");

}

- (void)_accessibilityLoadAccessibilityInformation
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)LARGBCaptureInstructionsVCAccessibility;
  -[LARGBCaptureInstructionsVCAccessibility _accessibilityLoadAccessibilityInformation](&v7, sel__accessibilityLoadAccessibilityInformation);
  v3 = *MEMORY[0x24BDF73C0];
  -[LARGBCaptureInstructionsVCAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("_titleLabel"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAccessibilityTraits:", v3);

  -[LARGBCaptureInstructionsVCAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("_footerText"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAccessibilityTraits:", *MEMORY[0x24BDFEF48]);

  -[LARGBCaptureInstructionsVCAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("_footerText"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAccessibilityLabel:", 0);

}

- (void)loadView
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)LARGBCaptureInstructionsVCAccessibility;
  -[LARGBCaptureInstructionsVCAccessibility loadView](&v3, sel_loadView);
  -[LARGBCaptureInstructionsVCAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

@end
