@implementation MedicationCategoryTipCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("HealthMedicationsUI.MedicationCategoryTipCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasSwiftField:withSwiftType:", CFSTR("HealthMedicationsUI.MedicationCategoryTipCell"), CFSTR("item"), "Optional<SectionedDataSourceItem>");
  objc_msgSend(v3, "validateSwiftStruct:hasSwiftField:withSwiftType:", CFSTR("HealthMedicationsUI.MedicationsCategoryTipItem"), CFSTR("titleText"), "String");
  objc_msgSend(v3, "validateSwiftStruct:hasSwiftField:withSwiftType:", CFSTR("HealthMedicationsUI.MedicationsCategoryTipItem"), CFSTR("bodyText"), "String");
  objc_msgSend(v3, "validateClass:", CFSTR("HealthMedicationsExperience.MedicationView"));

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  void *v2;
  void *v3;
  void *v4;
  void *v6;

  -[MedicationCategoryTipCellAccessibility safeSwiftValueForKey:](self, "safeSwiftValueForKey:", CFSTR("item"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safeSwiftValueForKey:", CFSTR("titleText"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safeSwiftValueForKey:", CFSTR("bodyText"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAXStringForVariables();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)accessibilityValue
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v8;

  -[MedicationCategoryTipCellAccessibility _axTipMedicationViews](self, "_axTipMedicationViews");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  UIAXStringForAllChildren();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MedicationCategoryTipCellAccessibility _axTipCellButtons](self, "_axTipCellButtons");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  UIAXStringForAllChildren();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  __AXStringForVariables();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (CGPoint)accessibilityActivationPoint
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  objc_super v11;
  CGPoint result;

  -[MedicationCategoryTipCellAccessibility _axTipCellButtons](self, "_axTipCellButtons");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v4, "accessibilityActivationPoint");
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)MedicationCategoryTipCellAccessibility;
    -[MedicationCategoryTipCellAccessibility accessibilityActivationPoint](&v11, sel_accessibilityActivationPoint);
  }
  v7 = v5;
  v8 = v6;

  v9 = v7;
  v10 = v8;
  result.y = v10;
  result.x = v9;
  return result;
}

- (unint64_t)accessibilityTraits
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MedicationCategoryTipCellAccessibility;
  return *MEMORY[0x24BDF73B0] | -[MedicationCategoryTipCellAccessibility accessibilityTraits](&v3, sel_accessibilityTraits);
}

- (id)_axTipCellButtons
{
  return (id)-[MedicationCategoryTipCellAccessibility _accessibilityFindSubviewDescendantsPassingTest:](self, "_accessibilityFindSubviewDescendantsPassingTest:", &__block_literal_global_0);
}

uint64_t __59__MedicationCategoryTipCellAccessibility__axTipCellButtons__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;

  v2 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = objc_msgSend(v2, "accessibilityElementsHidden") ^ 1;
  else
    v3 = 0;

  return v3;
}

- (id)_axTipMedicationViews
{
  return (id)-[MedicationCategoryTipCellAccessibility _accessibilityFindSubviewDescendantsPassingTest:](self, "_accessibilityFindSubviewDescendantsPassingTest:", &__block_literal_global_199);
}

uint64_t __63__MedicationCategoryTipCellAccessibility__axTipMedicationViews__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  NSClassFromString(CFSTR("HealthMedicationsExperience.MedicationView"));
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

@end
