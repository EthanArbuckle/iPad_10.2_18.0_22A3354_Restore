@implementation HKMedicalIDEditorCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("HKMedicalIDEditorCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HKMedicalIDEditorCell"), CFSTR("label"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HKMedicalIDEditorCell"), CFSTR("formattedValue"), "@", 0);

}

- (id)accessibilityLabel
{
  return (id)-[HKMedicalIDEditorCellAccessibility _accessibilityStringForLabelKeyValues:](self, "_accessibilityStringForLabelKeyValues:", CFSTR("label, formattedValue"));
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HKMedicalIDEditorCellAccessibility;
  return *MEMORY[0x24BDF73B0] | -[HKMedicalIDEditorCellAccessibility accessibilityTraits](&v3, sel_accessibilityTraits);
}

@end
