@implementation WDMedicalRecordSectionHeaderCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("WDMedicalRecordSectionHeaderCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:isKindOfClass:", CFSTR("WDMedicalRecordSectionHeaderCell"), CFSTR("UITableViewCell"));
}

- (unint64_t)accessibilityTraits
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)WDMedicalRecordSectionHeaderCellAccessibility;
  return *MEMORY[0x24BDF73C0] | -[WDMedicalRecordSectionHeaderCellAccessibility accessibilityTraits](&v3, sel_accessibilityTraits);
}

@end
