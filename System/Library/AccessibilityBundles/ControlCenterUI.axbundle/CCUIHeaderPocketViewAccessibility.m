@implementation CCUIHeaderPocketViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CCUIHeaderPocketView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CCUIHeaderPocketView"), CFSTR("editButton"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CCUIHeaderPocketView"), CFSTR("powerButton"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("CCUIHeaderPocketView"), CFSTR("_compactSensorAttributionControl"), "CCUISensorAttributionCompactControl");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("CCUIHeaderPocketView"), CFSTR("_sensorAttributionExpandedWrapperView"), "UIView");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("CCUIHeaderPocketView"), CFSTR("_sensorAttributionExpandedViewController"), "CCUISensorAttributionExpandedViewController");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CCUISensorAttributionExpandedViewController"), CFSTR("isExpanded"), "B", 0);

}

- (id)accessibilityElements
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  -[CCUIHeaderPocketViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("editButton"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CCUIHeaderPocketViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("powerButton"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CCUIHeaderPocketViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_compactSensorAttributionControl"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "axSafelyAddObject:", v4);
  objc_msgSend(v3, "axSafelyAddObject:", v5);
  objc_msgSend(v3, "axSafelyAddObject:", v6);
  objc_msgSend((id)*MEMORY[0x24BDF74F8], "_accessibilityStatusBarElements:sorted:", 1, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "axSafelyAddObjectsFromArray:", v7);

  return v3;
}

- (int64_t)_accessibilitySortPriority
{
  return 1;
}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  id location;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)CCUIHeaderPocketViewAccessibility;
  -[CCUIHeaderPocketViewAccessibility _accessibilityLoadAccessibilityInformation](&v12, sel__accessibilityLoadAccessibilityInformation);
  -[CCUIHeaderPocketViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("editButton"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  accessibilityLocalizedString(CFSTR("control.center.add.controls"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAccessibilityLabel:", v4);

  objc_msgSend(v3, "_setAccessibilityServesAsFirstElement:", 1);
  -[CCUIHeaderPocketViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("powerButton"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  accessibilityLocalizedString(CFSTR("control.center.power"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAccessibilityLabel:", v6);

  objc_msgSend(v5, "setIsAccessibilityElement:", 1);
  objc_msgSend(v5, "setAccessibilityTraits:", *MEMORY[0x24BDF73B0]);
  -[CCUIHeaderPocketViewAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("_sensorAttributionExpandedWrapperView"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CCUIHeaderPocketViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_sensorAttributionExpandedViewController"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, v8);
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __79__CCUIHeaderPocketViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke;
  v9[3] = &unk_2501E15C0;
  objc_copyWeak(&v10, &location);
  objc_msgSend(v7, "setAccessibilityViewIsModalBlock:", v9);
  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);

}

uint64_t __79__CCUIHeaderPocketViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1)
{
  id WeakRetained;
  uint64_t v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = objc_msgSend(WeakRetained, "safeBoolForKey:", CFSTR("isExpanded"));

  return v2;
}

@end
