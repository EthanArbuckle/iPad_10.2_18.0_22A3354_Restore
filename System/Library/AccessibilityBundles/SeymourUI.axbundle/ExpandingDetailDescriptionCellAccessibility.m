@implementation ExpandingDetailDescriptionCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SeymourUI.ExpandingDetailDescriptionCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasSwiftField:withSwiftType:", CFSTR("SeymourUI.ExpandingDetailDescriptionCell"), CFSTR("titleLabel"), "UILabel");
}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)ExpandingDetailDescriptionCellAccessibility;
  -[ExpandingDetailDescriptionCellAccessibility _accessibilityLoadAccessibilityInformation](&v4, sel__accessibilityLoadAccessibilityInformation);
  -[ExpandingDetailDescriptionCellAccessibility safeSwiftValueForKey:](self, "safeSwiftValueForKey:", CFSTR("titleLabel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAccessibilityTraits:", *MEMORY[0x24BDF73C0]);

}

@end
