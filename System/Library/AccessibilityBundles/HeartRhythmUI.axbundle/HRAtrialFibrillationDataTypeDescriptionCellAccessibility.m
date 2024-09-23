@implementation HRAtrialFibrillationDataTypeDescriptionCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("HRAtrialFibrillationDataTypeDescriptionCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("HRAtrialFibrillationDataTypeDescriptionCell"), CFSTR("_descriptionTextView"), "UITextView");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("HRAtrialFibrillationDataTypeDescriptionCell"), CFSTR("_settingsDescriptionTextView"), "UITextView");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HRAtrialFibrillationDataTypeDescriptionCell"), CFSTR("_setupDescriptionTextView"), "v", 0);

}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HRAtrialFibrillationDataTypeDescriptionCellAccessibility;
  -[HRAtrialFibrillationDataTypeDescriptionCellAccessibility _accessibilityLoadAccessibilityInformation](&v5, sel__accessibilityLoadAccessibilityInformation);
  -[HRAtrialFibrillationDataTypeDescriptionCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_descriptionTextView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_accessibilitySetTextViewShouldBreakUpParagraphs:", 1);

  -[HRAtrialFibrillationDataTypeDescriptionCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_settingsDescriptionTextView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_accessibilitySetTextViewShouldBreakUpParagraphs:", 1);

}

- (void)_setupDescriptionTextView
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HRAtrialFibrillationDataTypeDescriptionCellAccessibility;
  -[HRAtrialFibrillationDataTypeDescriptionCellAccessibility _setupDescriptionTextView](&v3, sel__setupDescriptionTextView);
  -[HRAtrialFibrillationDataTypeDescriptionCellAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

@end
