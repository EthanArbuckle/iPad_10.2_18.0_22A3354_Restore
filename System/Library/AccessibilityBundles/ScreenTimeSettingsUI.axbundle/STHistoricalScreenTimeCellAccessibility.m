@implementation STHistoricalScreenTimeCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("STHistoricalScreenTimeCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("STHistoricalScreenTimeCell"), CFSTR("_historicalUsageViewController"), "STHistoricalUsageViewController");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("STHistoricalScreenTimeCell"), CFSTR("topItemsView"), "@", 0);

}

- (id)accessibilityElements
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[4];
  id v9;
  id location;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[STHistoricalScreenTimeCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_historicalUsageViewController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "accessibilityElements");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "axSafelyAddObjectsFromArray:", v5);
  -[STHistoricalScreenTimeCellAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("topItemsView"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "axSafelyAddObject:", v6);

  objc_initWeak(&location, self);
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __64__STHistoricalScreenTimeCellAccessibility_accessibilityElements__block_invoke;
  v8[3] = &unk_250336330;
  objc_copyWeak(&v9, &location);
  objc_msgSend(v3, "enumerateObjectsUsingBlock:", v8);
  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);

  return v3;
}

void __64__STHistoricalScreenTimeCellAccessibility_accessibilityElements__block_invoke(uint64_t a1, void *a2)
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
