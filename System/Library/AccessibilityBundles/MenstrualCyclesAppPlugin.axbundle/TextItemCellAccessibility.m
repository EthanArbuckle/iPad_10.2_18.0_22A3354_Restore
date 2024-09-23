@implementation TextItemCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("MenstrualCyclesAppPlugin.TextItemCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TextItemCellAccessibility;
  return *MEMORY[0x24BDF73B0] | -[TextItemCellAccessibility accessibilityTraits](&v3, sel_accessibilityTraits);
}

@end
