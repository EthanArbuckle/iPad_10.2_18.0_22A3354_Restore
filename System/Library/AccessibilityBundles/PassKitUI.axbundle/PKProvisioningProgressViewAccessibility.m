@implementation PKProvisioningProgressViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PKProvisioningProgressView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceVariable:withType:", CFSTR("PKProvisioningProgressView"), CFSTR("_primaryLabel"), "UITextView");
}

- (void)_accessibilityLoadAccessibilityInformation
{
  uint64_t v3;
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PKProvisioningProgressViewAccessibility;
  -[PKProvisioningProgressViewAccessibility _accessibilityLoadAccessibilityInformation](&v6, sel__accessibilityLoadAccessibilityInformation);
  v3 = *MEMORY[0x24BDF73C0];
  -[PKProvisioningProgressViewAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("_primaryLabel"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAccessibilityTraits:", v3);

  -[PKProvisioningProgressViewAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("_primaryLabel"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_accessibilitySetTextViewShouldBreakUpParagraphs:", 0);

}

@end
