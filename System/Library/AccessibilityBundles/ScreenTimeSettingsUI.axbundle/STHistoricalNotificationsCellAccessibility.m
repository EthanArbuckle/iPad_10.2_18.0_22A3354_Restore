@implementation STHistoricalNotificationsCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("STHistoricalNotificationsCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceVariable:withType:", CFSTR("STHistoricalNotificationsCell"), CFSTR("_historicalUsageViewController"), "STHistoricalUsageViewController");
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
  _QWORD v7[4];
  id v8;
  id location;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[STHistoricalNotificationsCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_historicalUsageViewController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "accessibilityElements");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "axSafelyAddObjectsFromArray:", v5);
  objc_initWeak(&location, self);
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __67__STHistoricalNotificationsCellAccessibility_accessibilityElements__block_invoke;
  v7[3] = &unk_250336330;
  objc_copyWeak(&v8, &location);
  objc_msgSend(v3, "enumerateObjectsUsingBlock:", v7);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);

  return v3;
}

void __67__STHistoricalNotificationsCellAccessibility_accessibilityElements__block_invoke(uint64_t a1, void *a2)
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
