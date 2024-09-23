@implementation VehicleDetailViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("VehicleDetailViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("VehicleDetailViewController"), CFSTR("vehicleColorView"), "@", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  _QWORD v5[4];
  id v6;
  id location;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)VehicleDetailViewControllerAccessibility;
  -[VehicleDetailViewControllerAccessibility _accessibilityLoadAccessibilityInformation](&v8, sel__accessibilityLoadAccessibilityInformation);
  -[VehicleDetailViewControllerAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("vehicleColorView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setIsAccessibilityElement:", 1);
  AXMapsLocString(CFSTR("VEHICLE_ICON"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAccessibilityLabel:", v4);

  objc_initWeak(&location, v3);
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __86__VehicleDetailViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke;
  v5[3] = &unk_250258DB8;
  objc_copyWeak(&v6, &location);
  objc_msgSend(v3, "_setAccessibilityValueBlock:", v5);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);

}

id __86__VehicleDetailViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "backgroundColor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  AXMapsStringForVehicleColor(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
