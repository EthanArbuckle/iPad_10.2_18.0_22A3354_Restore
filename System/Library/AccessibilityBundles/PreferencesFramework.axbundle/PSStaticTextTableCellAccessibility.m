@implementation PSStaticTextTableCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PSStaticTextTableCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (unint64_t)accessibilityTraits
{
  unint64_t v2;
  uint64_t v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PSStaticTextTableCellAccessibility;
  v2 = -[PSStaticTextTableCellAccessibility accessibilityTraits](&v5, sel_accessibilityTraits);
  v3 = *MEMORY[0x24BDF73B0];
  if ((*MEMORY[0x24BDF73B0] & v2) == 0)
    v3 = 0;
  return v3 ^ v2;
}

@end
