@implementation WDMedicalRecordCategorySectionHeaderCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("WDMedicalRecordCategorySectionHeaderCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:isKindOfClass:", CFSTR("WDMedicalRecordCategorySectionHeaderCell"), CFSTR("UITableViewCell"));
}

- (unint64_t)accessibilityTraits
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)WDMedicalRecordCategorySectionHeaderCellAccessibility;
  return *MEMORY[0x24BDF73C0] | -[WDMedicalRecordCategorySectionHeaderCellAccessibility accessibilityTraits](&v3, sel_accessibilityTraits);
}

@end
