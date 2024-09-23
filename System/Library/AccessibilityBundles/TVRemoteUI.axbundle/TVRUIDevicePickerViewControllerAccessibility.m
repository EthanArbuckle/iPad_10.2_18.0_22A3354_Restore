@implementation TVRUIDevicePickerViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("TVRUIDevicePickerViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("TVRUIDevicePickerViewController"), CFSTR("_setupDeviceTitleView"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("TVRUIDevicePickerViewController"), CFSTR("isDevicePickerShowing"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("TVRUIDevicePickerViewController"), CFSTR("titleButton"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("TVRUIDevicePickerViewController"), CFSTR("tableView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("TVRUIDevicePickerViewController"), CFSTR("_toggleState"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("TVRUIDeviceListCell"), CFSTR("device"), "@", 0);
  objc_msgSend(v3, "validateProtocol:hasRequiredInstanceMethod:", CFSTR("TVRUIDevice"), CFSTR("model"));
  objc_msgSend(v3, "validateProtocol:hasRequiredInstanceMethod:", CFSTR("TVRUIDevice"), CFSTR("name"));

}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  _QWORD v8[4];
  id v9;
  _QWORD v10[4];
  id v11;
  id location;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)TVRUIDevicePickerViewControllerAccessibility;
  -[TVRUIDevicePickerViewControllerAccessibility _accessibilityLoadAccessibilityInformation](&v13, sel__accessibilityLoadAccessibilityInformation);
  -[TVRUIDevicePickerViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("titleButton"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  v4 = MEMORY[0x24BDAC760];
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __90__TVRUIDevicePickerViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke;
  v10[3] = &unk_2503ADCB0;
  objc_copyWeak(&v11, &location);
  objc_msgSend(v3, "_setAccessibilityValueBlock:", v10);
  v8[0] = v4;
  v8[1] = 3221225472;
  v8[2] = __90__TVRUIDevicePickerViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_2;
  v8[3] = &unk_2503ADCB0;
  objc_copyWeak(&v9, &location);
  objc_msgSend(v3, "_setAccessibilityHintBlock:", v8);
  -[TVRUIDevicePickerViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("tableView"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v4;
  v6[1] = 3221225472;
  v6[2] = __90__TVRUIDevicePickerViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_3;
  v6[3] = &unk_2503ADCD8;
  objc_copyWeak(&v7, &location);
  objc_msgSend(v5, "_setAccessibilityElementsHiddenBlock:", v6);
  objc_destroyWeak(&v7);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);

}

id __90__TVRUIDevicePickerViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1)
{
  id WeakRetained;
  __CFString *v2;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (objc_msgSend(WeakRetained, "safeBoolForKey:", CFSTR("isDevicePickerShowing")))
    v2 = CFSTR("dropdown.expanded.value");
  else
    v2 = CFSTR("dropdown.collapsed.value");
  accessibilityLocalizedString(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id __90__TVRUIDevicePickerViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  __CFString *v2;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (objc_msgSend(WeakRetained, "safeBoolForKey:", CFSTR("isDevicePickerShowing")))
    v2 = CFSTR("dropdown.expanded.hint");
  else
    v2 = CFSTR("dropdown.collapsed.hint");
  accessibilityLocalizedString(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t __90__TVRUIDevicePickerViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_3(uint64_t a1)
{
  id WeakRetained;
  uint64_t v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = objc_msgSend(WeakRetained, "safeBoolForKey:", CFSTR("isDevicePickerShowing")) ^ 1;

  return v2;
}

- (void)_setupDeviceTitleView
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TVRUIDevicePickerViewControllerAccessibility;
  -[TVRUIDevicePickerViewControllerAccessibility _setupDeviceTitleView](&v3, sel__setupDeviceTitleView);
  -[TVRUIDevicePickerViewControllerAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  int v8;
  void *v9;
  __CFString *v10;
  void *v11;
  void *v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)TVRUIDevicePickerViewControllerAccessibility;
  -[TVRUIDevicePickerViewControllerAccessibility tableView:cellForRowAtIndexPath:](&v14, sel_tableView_cellForRowAtIndexPath_, a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "safeValueForKey:", CFSTR("device"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "accessibilityTraits");
  objc_msgSend(v4, "setAccessibilityTraits:", *MEMORY[0x24BDF73B0] | v6);
  objc_msgSend(v5, "safeValueForKey:", CFSTR("model"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "containsString:", CFSTR("AppleTV"));

  objc_msgSend(v5, "safeValueForKey:", CFSTR("name"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
    v10 = CFSTR("apple.tv.device.label");
  else
    v10 = CFSTR("tv.device.label");
  accessibilityLocalizedString(v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAXStringForVariables();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAccessibilityLabel:", v12, v11, CFSTR("__AXStringForVariablesSentinel"));

  return v4;
}

- (void)_toggleState
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)TVRUIDevicePickerViewControllerAccessibility;
  -[TVRUIDevicePickerViewControllerAccessibility _toggleState](&v2, sel__toggleState);
  UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], 0);
}

@end
