@implementation HKMedicalIDNoValueTableViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("HKMedicalIDNoValueTableViewCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HKMedicalIDNoValueTableViewCell"), CFSTR("addValueLabel"), "@", 0);
}

- (id)accessibilityLabel
{
  return (id)-[HKMedicalIDNoValueTableViewCellAccessibility _accessibilityStringForLabelKeyValues:](self, "_accessibilityStringForLabelKeyValues:", CFSTR("addValueLabel"));
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HKMedicalIDNoValueTableViewCellAccessibility;
  return *MEMORY[0x24BDF73B0] | -[HKMedicalIDNoValueTableViewCellAccessibility accessibilityTraits](&v3, sel_accessibilityTraits);
}

@end
