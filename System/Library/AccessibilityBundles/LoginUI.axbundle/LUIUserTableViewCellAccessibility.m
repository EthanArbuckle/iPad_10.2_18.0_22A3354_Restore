@implementation LUIUserTableViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("LUIUserTableViewCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (unint64_t)accessibilityTraits
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)LUIUserTableViewCellAccessibility;
  return (*MEMORY[0x24BDF73B0] | -[LUIUserTableViewCellAccessibility accessibilityTraits](&v3, sel_accessibilityTraits)) & ~*MEMORY[0x24BDF7400];
}

- (id)accessibilityHint
{
  return accessibilityLocalizedString(CFSTR("login.cell.hint"));
}

@end
