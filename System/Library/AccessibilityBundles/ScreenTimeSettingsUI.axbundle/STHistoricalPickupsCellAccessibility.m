@implementation STHistoricalPickupsCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("STHistoricalPickupsCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("STHistoricalPickupsCell"), CFSTR("_historicalUsageViewController"), "STHistoricalUsageViewController");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("STHistoricalPickupsCell"), CFSTR("pickupMetricsView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("STHistoricalPickupsCell"), CFSTR("_firstUsedAfterPickupLabel"), "UILabel");

}

- (BOOL)isAccessibilityElement
{
  return 0;
}

- (id)accessibilityElements
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[4];
  id v10;
  id location;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[STHistoricalPickupsCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_historicalUsageViewController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "accessibilityElements");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "axSafelyAddObjectsFromArray:", v5);
  -[STHistoricalPickupsCellAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("pickupMetricsView"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "axSafelyAddObject:", v6);

  -[STHistoricalPickupsCellAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("_firstUsedAfterPickupLabel"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAccessibilityTraits:", *MEMORY[0x24BDF73C0]);
  objc_msgSend(v3, "axSafelyAddObject:", v7);
  objc_initWeak(&location, self);
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __61__STHistoricalPickupsCellAccessibility_accessibilityElements__block_invoke;
  v9[3] = &unk_250336330;
  objc_copyWeak(&v10, &location);
  objc_msgSend(v3, "enumerateObjectsUsingBlock:", v9);
  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);

  return v3;
}

void __61__STHistoricalPickupsCellAccessibility_accessibilityElements__block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(v3, "setAccessibilityContainer:", WeakRetained);

}

@end
