@implementation STSimpleScheduleListControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("STSimpleScheduleListController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("STSimpleScheduleListController"), CFSTR("UIViewController"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("STSimpleScheduleListController"), CFSTR("specifiers"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("STSimpleScheduleListController"), CFSTR("startTimeSpecifier"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("STSimpleScheduleListController"), CFSTR("endTimeSpecifier"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("STSimpleScheduleListController"), CFSTR("startTimePickerSpecifier"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("STSimpleScheduleListController"), CFSTR("endTimePickerSpecifier"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("STSimpleScheduleListController"), CFSTR("tableView:didSelectRowAtIndexPath:"), "v", "@", "@", 0);

}

- (id)_accessibilitySelectedSpecifier
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  objc_opt_class();
  -[STSimpleScheduleListControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("startTimePickerSpecifier"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsSafeCategory();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  -[STSimpleScheduleListControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("endTimePickerSpecifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsSafeCategory();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[STSimpleScheduleListControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("specifiers"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "containsObject:", v4))
    v8 = v4;
  else
    v8 = v6;
  v9 = v8;

  return v9;
}

- (void)_accessibilityMarkSelectedSpecifier
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

  objc_opt_class();
  -[STSimpleScheduleListControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("startTimeSpecifier"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsSafeCategory();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  -[STSimpleScheduleListControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("endTimeSpecifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsSafeCategory();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  -[STSimpleScheduleListControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("startTimePickerSpecifier"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsSafeCategory();
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  -[STSimpleScheduleListControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("endTimePickerSpecifier"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsSafeCategory();
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[STSimpleScheduleListControllerAccessibility _accessibilitySelectedSpecifier](self, "_accessibilitySelectedSpecifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_accessibilitySetIsExpandedSTUICell:", v8 == v11);
  objc_msgSend(v6, "_accessibilitySetIsExpandedSTUICell:", v10 == v11);

}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)STSimpleScheduleListControllerAccessibility;
  -[STSimpleScheduleListControllerAccessibility _accessibilityLoadAccessibilityInformation](&v7, sel__accessibilityLoadAccessibilityInformation);
  objc_opt_class();
  -[STSimpleScheduleListControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("startTimeSpecifier"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsSafeCategory();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "_accessibilitySetIsExpandableSTUICell:", 1);
  objc_opt_class();
  -[STSimpleScheduleListControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("endTimeSpecifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsSafeCategory();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "_accessibilitySetIsExpandableSTUICell:", 1);
  -[STSimpleScheduleListControllerAccessibility _accessibilityMarkSelectedSpecifier](self, "_accessibilityMarkSelectedSpecifier");
}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)STSimpleScheduleListControllerAccessibility;
  -[STSimpleScheduleListControllerAccessibility viewDidAppear:](&v4, sel_viewDidAppear_, a3);
  -[STSimpleScheduleListControllerAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)STSimpleScheduleListControllerAccessibility;
  -[STSimpleScheduleListControllerAccessibility tableView:didSelectRowAtIndexPath:](&v5, sel_tableView_didSelectRowAtIndexPath_, a3, a4);
  -[STSimpleScheduleListControllerAccessibility _accessibilityMarkSelectedSpecifier](self, "_accessibilityMarkSelectedSpecifier");
  UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], 0);
}

@end
