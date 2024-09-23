@implementation SectionHeaderViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SectionHeaderView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SectionHeaderView"), CFSTR("label"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("MKVibrantLabel"), CFSTR("_label"), "UILabel");

}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SectionHeaderViewAccessibility;
  -[SectionHeaderViewAccessibility _accessibilityLoadAccessibilityInformation](&v5, sel__accessibilityLoadAccessibilityInformation);
  -[SectionHeaderViewAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("label"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeUIViewForKey:", CFSTR("_label"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setAccessibilityTraits:", *MEMORY[0x24BDF73C0] | *MEMORY[0x24BDF7410]);
}

@end
