@implementation CycleHistoryTableViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("MenstrualCyclesAppPlugin.CycleHistoryTableViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("MenstrualCyclesAppPlugin.CycleHistoryTableViewController"), CFSTR("UITableViewController"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MenstrualCyclesAppPlugin.CycleHistoryTableViewController"), CFSTR("axFilterSelected"), "B", 0);

}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)CycleHistoryTableViewControllerAccessibility;
  -[CycleHistoryTableViewControllerAccessibility _accessibilityLoadAccessibilityInformation](&v11, sel__accessibilityLoadAccessibilityInformation);
  objc_opt_class();
  __UIAccessibilityCastAsClass();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "navigationItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "rightBarButtonItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setIsAccessibilityElement:", 1);
  accessibilityLocalizedString(CFSTR("cycle.history.filters"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAccessibilityLabel:", v6);

  v7 = objc_msgSend(v5, "accessibilityTraits");
  v8 = *MEMORY[0x24BDF73B0] | v7;
  v9 = -[CycleHistoryTableViewControllerAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("axFilterSelected"));
  v10 = *MEMORY[0x24BDF7400];
  if (!v9)
    v10 = 0;
  objc_msgSend(v5, "setAccessibilityTraits:", v8 | v10);

}

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CycleHistoryTableViewControllerAccessibility;
  -[CycleHistoryTableViewControllerAccessibility viewDidLoad](&v3, sel_viewDidLoad);
  -[CycleHistoryTableViewControllerAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

@end
