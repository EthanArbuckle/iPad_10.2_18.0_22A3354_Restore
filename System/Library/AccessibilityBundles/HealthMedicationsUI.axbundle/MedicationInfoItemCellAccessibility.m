@implementation MedicationInfoItemCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("HealthMedicationsUI.MedicationInfoItemCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasSwiftField:withSwiftType:", CFSTR("HealthMedicationsUI.MedicationInfoItemCell"), CFSTR("nameLabel"), "UILabel");
  objc_msgSend(v3, "validateClass:hasSwiftField:withSwiftType:", CFSTR("HealthMedicationsUI.MedicationInfoItemCell"), CFSTR("strengthLabel"), "UILabel");
  objc_msgSend(v3, "validateClass:hasSwiftField:withSwiftType:", CFSTR("HealthMedicationsUI.MedicationInfoItemCell"), CFSTR("ingredientsLabel"), "UILabel");
  objc_msgSend(v3, "validateClass:hasSwiftField:withSwiftType:", CFSTR("HealthMedicationsUI.MedicationInfoItemCell"), CFSTR("medmojiView"), "MedicationView");

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  void *v5;
  void *v7;

  -[MedicationInfoItemCellAccessibility safeSwiftValueForKey:](self, "safeSwiftValueForKey:", CFSTR("nameLabel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MedicationInfoItemCellAccessibility safeSwiftValueForKey:](self, "safeSwiftValueForKey:", CFSTR("strengthLabel"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MedicationInfoItemCellAccessibility safeSwiftValueForKey:](self, "safeSwiftValueForKey:", CFSTR("ingredientsLabel"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  __AXStringForVariables();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)accessibilityValue
{
  void *v2;
  void *v3;

  -[MedicationInfoItemCellAccessibility safeSwiftValueForKey:](self, "safeSwiftValueForKey:", CFSTR("medmojiView"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessibilityLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
