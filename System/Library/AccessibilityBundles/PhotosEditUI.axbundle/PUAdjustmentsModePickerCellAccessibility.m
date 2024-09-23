@implementation PUAdjustmentsModePickerCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PUAdjustmentsModePickerCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("PUAdjustmentsModePickerCell"), CFSTR("_accessoryButton"), "UIButton");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PUAdjustmentsModePickerCell"), CFSTR("localizedModeName"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PUAdjustmentsModePickerCell"), CFSTR("_updateButton"), "v", 0);

}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PUAdjustmentsModePickerCellAccessibility;
  -[PUAdjustmentsModePickerCellAccessibility _accessibilityLoadAccessibilityInformation](&v6, sel__accessibilityLoadAccessibilityInformation);
  objc_opt_class();
  -[PUAdjustmentsModePickerCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_accessoryButton"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[PUAdjustmentsModePickerCellAccessibility safeStringForKey:](self, "safeStringForKey:", CFSTR("localizedModeName"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAccessibilityValue:", v5);

}

- (unint64_t)accessibilityTraits
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PUAdjustmentsModePickerCellAccessibility;
  return *MEMORY[0x24BDF73B0] | -[PUAdjustmentsModePickerCellAccessibility accessibilityTraits](&v3, sel_accessibilityTraits);
}

- (void)_updateButton
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PUAdjustmentsModePickerCellAccessibility;
  -[PUAdjustmentsModePickerCellAccessibility _updateButton](&v3, sel__updateButton);
  -[PUAdjustmentsModePickerCellAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

@end
