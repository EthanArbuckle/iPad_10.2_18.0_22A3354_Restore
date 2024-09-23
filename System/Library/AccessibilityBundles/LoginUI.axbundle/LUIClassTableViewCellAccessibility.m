@implementation LUIClassTableViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("LUIClassTableViewCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (unint64_t)accessibilityTraits
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)LUIClassTableViewCellAccessibility;
  return (*MEMORY[0x24BDF73B0] | -[LUIClassTableViewCellAccessibility accessibilityTraits](&v3, sel_accessibilityTraits)) & ~*MEMORY[0x24BDF7400];
}

- (id)accessibilityHint
{
  return accessibilityLocalizedString(CFSTR("class.select.cell.hint"));
}

@end
