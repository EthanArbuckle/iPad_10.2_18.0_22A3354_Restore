@implementation MedicationListItemCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("HealthMedicationsUI.MedicationListItemCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasSwiftField:withSwiftType:", CFSTR("HealthMedicationsUI.MedicationListItemCell"), CFSTR("primaryLabel"), "UILabel");
  objc_msgSend(v3, "validateClass:hasSwiftField:withSwiftType:", CFSTR("HealthMedicationsUI.MedicationListItemCell"), CFSTR("itemsStackView"), "UIStackView");
  objc_msgSend(v3, "validateClass:hasSwiftField:withSwiftType:", CFSTR("HealthMedicationsUI.MedicationListItemCell"), CFSTR("pillImageView"), "MedicationView");

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  objc_opt_class();
  -[MedicationListItemCellAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("itemsStackView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[MedicationListItemCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("primaryLabel"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "axSafelyAddObject:", v6);

  UIAXStringForAllChildren();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "axSafelyAddObject:", v7);

  -[MedicationListItemCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("pillImageView"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "axSafelyAddObject:", v8);

  MEMORY[0x234910AA8](v3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

@end
