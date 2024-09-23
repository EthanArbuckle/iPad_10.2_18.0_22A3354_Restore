@implementation STUsageSummaryTitleViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("STUsageSummaryTitleView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("STUsageSummaryTitleView"), CFSTR("titleLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("STUsageSummaryTitleView"), CFSTR("usageLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("STUsageSummaryTitleView"), CFSTR("deltaAverageLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("STUsageSummaryTitleView"), CFSTR("usageReport"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("STUsageSummaryTitleView"), CFSTR("usageItemType"), "Q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("STUsageReport"), CFSTR("totalScreenTime"), "d", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("STUsageReport"), CFSTR("type"), "Q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("STUsageReport"), CFSTR("activePickupDateIntervals"), "d", 0);

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  uint64_t v8;
  void *v9;
  void *v10;
  double v11;
  BOOL v12;
  __n128 v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  -[STUsageSummaryTitleViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("titleLabel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "accessibilityLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[STUsageSummaryTitleViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("usageReport"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[STUsageSummaryTitleViewAccessibility safeUnsignedIntegerForKey:](self, "safeUnsignedIntegerForKey:", CFSTR("usageItemType")) != 1)goto LABEL_9;
  objc_msgSend(v5, "safeDoubleForKey:", CFSTR("totalScreenTime"));
  v7 = v6;
  v8 = objc_msgSend(v5, "safeUnsignedIntegerForKey:", CFSTR("type"));
  if (v8)
  {
    if (v8 != 1 || (MEMORY[0x23491C5C8](v7 < 60.0, v7), (v9 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
    {
LABEL_9:
      -[STUsageSummaryTitleViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("usageLabel"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "accessibilityLabel");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v10 = (void *)objc_opt_new();
    objc_msgSend(v10, "setAllowedUnits:", 96);
    objc_msgSend(v10, "setUnitsStyle:", 1);
    objc_msgSend(v5, "safeCGFloatForKey:", CFSTR("activePickupDateIntervals"));
    v11 = v7 / v13.n128_f64[0];
    v12 = v13.n128_f64[0] <= 0.0;
    v13.n128_u64[0] = 0;
    if (!v12)
      v13.n128_f64[0] = v11;
    MEMORY[0x23491C5C8](0, v13);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9)
      goto LABEL_9;
  }
  -[STUsageSummaryTitleViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("deltaAverageLabel"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "accessibilityLabel");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  __AXStringForVariables();
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

@end
