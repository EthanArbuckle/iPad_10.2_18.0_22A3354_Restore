@implementation BTTableSharingCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("BTTableSharingCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (unint64_t)accessibilityTraits
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BTTableSharingCellAccessibility;
  return (*MEMORY[0x24BDF73B0] | -[BTTableSharingCellAccessibility accessibilityTraits](&v3, sel_accessibilityTraits)) & ~*MEMORY[0x24BDF73E8];
}

- (id)accessibilityHint
{
  return accessibilityLocalizedString(CFSTR("bluetooth.sharing.item.hint"));
}

@end
