@implementation MedicationsCategoryRoomTipViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("HealthMedicationsUI.MedicationsCategoryRoomTipView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HealthMedicationsUI.MedicationsCategoryRoomTipView"), CFSTR("dismissButton"), "@", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MedicationsCategoryRoomTipViewAccessibility;
  -[MedicationsCategoryRoomTipViewAccessibility _accessibilityLoadAccessibilityInformation](&v5, sel__accessibilityLoadAccessibilityInformation);
  -[MedicationsCategoryRoomTipViewAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("dismissButton"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  accessibilityLocalizedString(CFSTR("close"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAccessibilityLabel:", v4);

}

@end
