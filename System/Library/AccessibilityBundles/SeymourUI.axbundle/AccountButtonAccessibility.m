@implementation AccountButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SeymourUI.AccountButton");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)accessibilityLabel
{
  return accessibilityLocalizedString(CFSTR("account.button"));
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AccountButtonAccessibility;
  return *MEMORY[0x24BDF73B0] | -[AccountButtonAccessibility accessibilityTraits](&v3, sel_accessibilityTraits);
}

@end
