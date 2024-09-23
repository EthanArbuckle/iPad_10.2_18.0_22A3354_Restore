@implementation WFHotspotCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("WFHotspotCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIView"), CFSTR("didMoveToWindow"), "v", 0);
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("WFHotspotCell"), CFSTR("UIView"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("WFAssociationStateView"), CFSTR("state"), "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("WFHotspotCell"), CFSTR("associationStateView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("WFHotspotCell"), CFSTR("hotspotDetailsView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("WFHotspotCell"), CFSTR("nameLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("WFHotspotDetailsView"), CFSTR("batteryCharge"), "Q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("WFHotspotDetailsView"), CFSTR("cellularProtocolString"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("WFHotspotDetailsView"), CFSTR("signalBars"), "Q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("WFHotspotDetailsView"), CFSTR("batteryView"), "@", 0);

}

- (void)_axHideBatteryView
{
  void *v2;
  id v3;

  -[WFHotspotCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("hotspotDetailsView"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeValueForKey:", CFSTR("batteryView"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setIsAccessibilityElement:", 0);

}

- (void)_accessibilityLoadAccessibilityInformation
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)WFHotspotCellAccessibility;
  -[WFHotspotCellAccessibility _accessibilityLoadAccessibilityInformation](&v3, sel__accessibilityLoadAccessibilityInformation);
  -[WFHotspotCellAccessibility _axHideBatteryView](self, "_axHideBatteryView");
}

- (void)didMoveToWindow
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)WFHotspotCellAccessibility;
  -[WFHotspotCellAccessibility didMoveToWindow](&v3, sel_didMoveToWindow);
  -[WFHotspotCellAccessibility _axHideBatteryView](self, "_axHideBatteryView");
}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v16;

  -[WFHotspotCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("hotspotDetailsView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x24BDD17C8];
  accessibilityLocalizedString(CFSTR("cellular.strength"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeUnsignedIntegerForKey:", CFSTR("signalBars"));
  AXFormatInteger();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)MEMORY[0x24BDD17C8];
  accessibilityLocalizedString(CFSTR("battery.level"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeUnsignedIntegerForKey:", CFSTR("batteryCharge"));
  AXFormatFloatWithPercentage();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringWithFormat:", v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[WFHotspotCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("nameLabel"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "accessibilityLabel");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeStringForKey:", CFSTR("cellularProtocolString"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAXStringForVariables();
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

@end
