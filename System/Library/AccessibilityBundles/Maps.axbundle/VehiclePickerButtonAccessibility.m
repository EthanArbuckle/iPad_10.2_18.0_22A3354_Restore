@implementation VehiclePickerButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("VehiclePickerButton");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("VehiclePickerButton"), CFSTR("colorView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("VehiclePickerButton"), CFSTR("isActive"), "B", 0);

}

- (id)accessibilityLabel
{
  void *v2;
  void *v3;
  void *v4;

  -[VehiclePickerButtonAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("colorView"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "backgroundColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  AXMapsStringForVehicleColor(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (unint64_t)accessibilityTraits
{
  unint64_t v3;
  int v4;
  uint64_t v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)VehiclePickerButtonAccessibility;
  v3 = -[VehiclePickerButtonAccessibility accessibilityTraits](&v7, sel_accessibilityTraits);
  v4 = -[VehiclePickerButtonAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("isActive"));
  v5 = *MEMORY[0x24BDF7400];
  if (!v4)
    v5 = 0;
  return v5 | v3;
}

@end
