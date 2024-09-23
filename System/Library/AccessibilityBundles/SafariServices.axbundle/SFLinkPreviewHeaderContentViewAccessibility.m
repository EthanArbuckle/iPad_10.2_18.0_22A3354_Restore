@implementation SFLinkPreviewHeaderContentViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SFLinkPreviewHeaderContentView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceVariable:withType:", CFSTR("SFLinkPreviewHeaderContentView"), CFSTR("_domainLabel"), "UILabel");
}

- (BOOL)isAccessibilityElement
{
  return 0;
}

- (void)_accessibilityLoadAccessibilityInformation
{
  uint64_t v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SFLinkPreviewHeaderContentViewAccessibility;
  -[SFLinkPreviewHeaderContentViewAccessibility _accessibilityLoadAccessibilityInformation](&v5, sel__accessibilityLoadAccessibilityInformation);
  v3 = *MEMORY[0x24BDF73C0];
  -[SFLinkPreviewHeaderContentViewAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("_domainLabel"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAccessibilityTraits:", v3);

}

@end
