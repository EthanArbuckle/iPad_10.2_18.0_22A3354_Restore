@implementation STTimeTitleDetailCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("STTimeTitleDetailCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (unint64_t)accessibilityTraits
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)STTimeTitleDetailCellAccessibility;
  return -[STTimeTitleDetailCellAccessibility accessibilityTraits](&v3, sel_accessibilityTraits) & ~*MEMORY[0x24BDF73E8];
}

@end
