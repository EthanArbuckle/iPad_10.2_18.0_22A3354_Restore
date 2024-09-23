@implementation HKMedicalIDViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("HKMedicalIDViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:conformsToProtocol:", CFSTR("HKMedicalIDViewController"), CFSTR("UITableViewDataSource"));
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("HKMedicalIDViewController"), CFSTR("UITableViewController"));
  objc_msgSend(v3, "validateClass:conformsToProtocol:", CFSTR("HKMedicalIDViewController"), CFSTR("UITableViewDataSource"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UITableViewController"), CFSTR("tableView"), "@", 0);

}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)HKMedicalIDViewControllerAccessibility;
  -[HKMedicalIDViewControllerAccessibility viewWillAppear:](&v4, sel_viewWillAppear_, a3);
  -[HKMedicalIDViewControllerAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[5];
  char v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)HKMedicalIDViewControllerAccessibility;
  -[HKMedicalIDViewControllerAccessibility _accessibilityLoadAccessibilityInformation](&v13, sel__accessibilityLoadAccessibilityInformation);
  v12 = 0;
  objc_opt_class();
  -[HKMedicalIDViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("tableView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "visibleCells");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __84__HKMedicalIDViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke;
  v11[3] = &unk_25022AD58;
  v11[4] = self;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v11);

  v12 = 0;
  -[HKMedicalIDViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("navigationItem"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilitySafeClass();
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "titleView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilitySafeClass();
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
    abort();
  objc_msgSend(v9, "text");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setAccessibilityLabel:", v10);

  objc_msgSend(v9, "setAccessibilityTraits:", *MEMORY[0x24BDF73C0]);
}

uint64_t __84__HKMedicalIDViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_accessibilityMakeEditingInsertStyleControlInaccessibleOnCell:", a2);
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)HKMedicalIDViewControllerAccessibility;
  -[HKMedicalIDViewControllerAccessibility tableView:cellForRowAtIndexPath:](&v7, sel_tableView_cellForRowAtIndexPath_, a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKMedicalIDViewControllerAccessibility _accessibilityMakeEditingInsertStyleControlInaccessibleOnCell:](self, "_accessibilityMakeEditingInsertStyleControlInaccessibleOnCell:", v5);
  return v5;
}

- (void)_accessibilityMakeEditingInsertStyleControlInaccessibleOnCell:(id)a3
{
  objc_msgSend(a3, "_accessibilitySetBoolValue:forKey:", 1, CFSTR("accessibilityShouldNotBeAnElementIfInsertEditStyle"));
}

@end
