@implementation STOverallUsageSummaryCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("STOverallUsageSummaryCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("STOverallUsageSummaryCell"), CFSTR("weekGraphViewController"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("STOverallUsageSummaryCell"), CFSTR("noUsageDataView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("STNoUsageDataView"), CFSTR("noDataDetailTextLabel"), "@", 0);

}

- (id)_accessibilityNoUsageViewIfPresent
{
  void *v2;
  void *v3;
  id v4;

  -[STOverallUsageSummaryCellAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("noUsageDataView"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "isHidden"))
    v3 = 0;
  else
    v3 = v2;
  v4 = v3;

  return v4;
}

- (BOOL)isAccessibilityElement
{
  void *v2;
  BOOL v3;

  -[STOverallUsageSummaryCellAccessibility _accessibilityNoUsageViewIfPresent](self, "_accessibilityNoUsageViewIfPresent");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  -[STOverallUsageSummaryCellAccessibility _accessibilityNoUsageViewIfPresent](self, "_accessibilityNoUsageViewIfPresent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "safeValueForKey:", CFSTR("noDataDetailTextLabel"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "accessibilityLabel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)STOverallUsageSummaryCellAccessibility;
    -[STOverallUsageSummaryCellAccessibility accessibilityLabel](&v8, sel_accessibilityLabel);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

- (id)accessibilityElements
{
  void *v3;
  void *v4;
  _QWORD v6[4];
  id v7;
  id location;

  -[STOverallUsageSummaryCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("weekGraphViewController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "accessibilityElements");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_initWeak(&location, self);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __63__STOverallUsageSummaryCellAccessibility_accessibilityElements__block_invoke;
  v6[3] = &unk_250336330;
  objc_copyWeak(&v7, &location);
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v6);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
  return v4;
}

void __63__STOverallUsageSummaryCellAccessibility_accessibilityElements__block_invoke(uint64_t a1, void *a2)
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
