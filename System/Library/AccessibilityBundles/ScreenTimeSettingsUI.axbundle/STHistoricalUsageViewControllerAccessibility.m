@implementation STHistoricalUsageViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("STHistoricalUsageViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("STHistoricalUsageViewController"), CFSTR("titleView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("STHistoricalUsageViewController"), CFSTR("selectedWeekGraphViewController"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("STHistoricalUsageViewController"), CFSTR("selectedDayGraphViewController"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("STHistoricalUsageViewController"), CFSTR("currentViewMode"), "q", 0);

}

- (id)accessibilityElements
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[STHistoricalUsageViewControllerAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("titleView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "axSafelyAddObject:", v4);

  v5 = -[STHistoricalUsageViewControllerAccessibility safeIntegerForKey:](self, "safeIntegerForKey:", CFSTR("currentViewMode"));
  -[STHistoricalUsageViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("selectedWeekGraphViewController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "accessibilityElements");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "ax_filteredArrayUsingBlock:", &__block_literal_global_2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "firstObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "setMode:", 0);
  accessibilityLocalizedString(CFSTR("weekly.summary.chart"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setAccessibilityLabel:", v10);

  objc_msgSend(v3, "axSafelyAddObjectsFromArray:", v7);
  if (v5 == 1)
  {
    -[STHistoricalUsageViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("selectedDayGraphViewController"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "accessibilityElements");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "ax_filteredArrayUsingBlock:", &__block_literal_global_195);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "firstObject");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v14, "setMode:", 1);
    accessibilityLocalizedString(CFSTR("daily.summary.chart"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setAccessibilityLabel:", v15);

    objc_msgSend(v3, "axSafelyAddObjectsFromArray:", v12);
  }

  return v3;
}

uint64_t __69__STHistoricalUsageViewControllerAccessibility_accessibilityElements__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

uint64_t __69__STHistoricalUsageViewControllerAccessibility_accessibilityElements__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

@end
