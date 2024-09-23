@implementation PKAddPaymentPassDevicePickerViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PKAddPaymentPassDevicePickerViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("PKAddPaymentPassDevicePickerViewController"), CFSTR("UITableViewController"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UITableViewController"), CFSTR("tableView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PKAddPaymentPassDevicePickerViewController"), CFSTR("tableView:cellForRowAtIndexPath:"), "@", "@", "@", 0);

}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  uint64_t v12;
  _QWORD v13[5];
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  char v18;
  objc_super v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v19.receiver = self;
  v19.super_class = (Class)PKAddPaymentPassDevicePickerViewControllerAccessibility;
  -[PKAddPaymentPassDevicePickerViewControllerAccessibility _accessibilityLoadAccessibilityInformation](&v19, sel__accessibilityLoadAccessibilityInformation);
  v18 = 0;
  objc_opt_class();
  -[PKAddPaymentPassDevicePickerViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("tableView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  objc_msgSend(v4, "visibleCells");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v20, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    v9 = MEMORY[0x24BDAC760];
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        v11 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        v12 = objc_msgSend(v11, "accessibilityTraits");
        v13[0] = v9;
        v13[1] = 3221225472;
        v13[2] = __101__PKAddPaymentPassDevicePickerViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke;
        v13[3] = &__block_descriptor_40_e5_Q8__0l;
        v13[4] = v12;
        objc_msgSend(v11, "_setAccessibilityTraitsBlock:", v13);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v20, 16);
    }
    while (v7);
  }

}

uint64_t __101__PKAddPaymentPassDevicePickerViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1)
{
  return *MEMORY[0x24BDF73B0] | *(_QWORD *)(a1 + 32);
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  void *v4;
  uint64_t v5;
  _QWORD v7[5];
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PKAddPaymentPassDevicePickerViewControllerAccessibility;
  -[PKAddPaymentPassDevicePickerViewControllerAccessibility tableView:cellForRowAtIndexPath:](&v8, sel_tableView_cellForRowAtIndexPath_, a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "accessibilityTraits");
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __91__PKAddPaymentPassDevicePickerViewControllerAccessibility_tableView_cellForRowAtIndexPath___block_invoke;
  v7[3] = &__block_descriptor_40_e5_Q8__0l;
  v7[4] = v5;
  objc_msgSend(v4, "_setAccessibilityTraitsBlock:", v7);
  return v4;
}

uint64_t __91__PKAddPaymentPassDevicePickerViewControllerAccessibility_tableView_cellForRowAtIndexPath___block_invoke(uint64_t a1)
{
  return *MEMORY[0x24BDF73B0] | *(_QWORD *)(a1 + 32);
}

@end
