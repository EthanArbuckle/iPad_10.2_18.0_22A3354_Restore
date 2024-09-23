@implementation DeviceInformationViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("Diagnostics.DeviceInformationView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("Diagnostics.DeviceInformationView"), CFSTR("deviceIdentifierLabel"), "UILabel");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("Diagnostics.DeviceInformationView"), CFSTR("marketingNameLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("Diagnostics.DeviceInformationView"), CFSTR("descriptionLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("Diagnostics.DeviceInformationView"), CFSTR("addButton"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("Diagnostics.DeviceInformationView"), CFSTR("ellipsisButton"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("Diagnostics.DeviceInformationView"), CFSTR("activityIndicator"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("Diagnostics.DeviceInformationView"), CFSTR("infoLabel"), "UILabel");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("Diagnostics.DeviceInformationView"), CFSTR("infoLabelType"), "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("Diagnostics.DeviceInformationView"), CFSTR("infoLabelTapped"), "v", 0);

}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)DeviceInformationViewAccessibility;
  -[DeviceInformationViewAccessibility _accessibilityLoadAccessibilityInformation](&v9, sel__accessibilityLoadAccessibilityInformation);
  -[DeviceInformationViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("addButton"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  accessibilityLocalizedString(CFSTR("add"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAccessibilityLabel:", v4);

  -[DeviceInformationViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("ellipsisButton"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  accessibilityLocalizedString(CFSTR("more"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAccessibilityLabel:", v6);

  -[DeviceInformationViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("activityIndicator"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  accessibilityLocalizedString(CFSTR("loading"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAccessibilityLabel:", v8);

  AXPerformBlockAsynchronouslyOnMainThread();
}

void __80__DeviceInformationViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_opt_class();
  objc_msgSend(*(id *)(a1 + 32), "safeValueForKey:", CFSTR("deviceIdentifierLabel"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  accessibilityLocalizedString(CFSTR("device_identifier"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "text");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAXStringForVariables();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAccessibilityLabel:", v6, v5, CFSTR("__AXStringForVariablesSentinel"));

  objc_msgSend(*(id *)(a1 + 32), "_axLoadLabelAccessibility");
}

- (id)subviewsForStackViewElement
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = (void *)MEMORY[0x24BDBCE30];
  -[DeviceInformationViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("deviceIdentifierLabel"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[DeviceInformationViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("marketingNameLabel"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[DeviceInformationViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("descriptionLabel"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[DeviceInformationViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("infoLabel"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[DeviceInformationViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("addButton"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[DeviceInformationViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("ellipsisButton"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "axArrayByIgnoringNilElementsWithCount:", 6, v4, v5, v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (void)_axLoadLabelAccessibility
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  __CFString *v9;
  void *v10;
  void *v11;

  objc_opt_class();
  -[DeviceInformationViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("infoLabel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = -[DeviceInformationViewAccessibility safeIntegerForKey:](self, "safeIntegerForKey:", CFSTR("infoLabelType"));
  if (v5 == 1)
  {
    accessibilityLocalizedString(CFSTR("imei"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "text");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v7;
    __UIAXStringForVariables();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = CFSTR("show_serial_number");
    goto LABEL_5;
  }
  if (!v5)
  {
    accessibilityLocalizedString(CFSTR("serial_number"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "text");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v7;
    __UIAXStringForVariables();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = CFSTR("show_imei");
LABEL_5:
    objc_msgSend(v4, "setAccessibilityLabel:", v8, v11, CFSTR("__AXStringForVariablesSentinel"));

    accessibilityLocalizedString(v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setAccessibilityHint:", v10);

  }
}

- (void)infoLabelTapped
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)DeviceInformationViewAccessibility;
  -[DeviceInformationViewAccessibility infoLabelTapped](&v3, sel_infoLabelTapped);
  -[DeviceInformationViewAccessibility _axLoadLabelAccessibility](self, "_axLoadLabelAccessibility");
}

@end
