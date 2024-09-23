@implementation MedicationMarkdownItemCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("HealthMedicationsUI.MedicationMarkdownItemCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

@end
