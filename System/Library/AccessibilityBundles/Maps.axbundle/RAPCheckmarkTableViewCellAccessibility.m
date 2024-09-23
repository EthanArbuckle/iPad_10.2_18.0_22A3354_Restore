@implementation RAPCheckmarkTableViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("RAPCheckmarkTableViewCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("RAPCheckmarkTableViewCell"), CFSTR("isChecked"), "B", 0);
}

- (unint64_t)accessibilityTraits
{
  int v3;
  unint64_t v4;
  uint64_t v5;
  objc_super v7;

  v3 = -[RAPCheckmarkTableViewCellAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("isChecked"));
  v7.receiver = self;
  v7.super_class = (Class)RAPCheckmarkTableViewCellAccessibility;
  v4 = -[RAPCheckmarkTableViewCellAccessibility accessibilityTraits](&v7, sel_accessibilityTraits);
  v5 = *MEMORY[0x24BDF7400];
  if (!v3)
    v5 = 0;
  return *MEMORY[0x24BDF73B0] | v4 | v5;
}

@end
