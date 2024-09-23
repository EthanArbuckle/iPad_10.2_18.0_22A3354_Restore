@implementation STMostUsedCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("STMostUsedCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("STMostUsedCell"), CFSTR("allowanceIconView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("STUsageCell"), CFSTR("_itemNameLabel"), "UILabel");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("STUsageCell"), CFSTR("_usageLabel"), "UILabel");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("STUsageCell"), CFSTR("value"), "@", 0);

}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  -[STMostUsedCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("value"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilitySafeClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  objc_msgSend(v4, "safeValueForKey:", CFSTR("totalUsage"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6
    || (objc_msgSend(v6, "doubleValue"),
        v8 = v7,
        objc_msgSend(v6, "doubleValue"),
        MEMORY[0x23491C5C8](v9 < 60.0, v8),
        (v10 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    -[STMostUsedCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_usageLabel"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "accessibilityLabel");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  -[STMostUsedCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_itemNameLabel"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "accessibilityLabel");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  __AXStringForVariables();
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (id)accessibilityValue
{
  void *v2;
  void *v3;
  void *v4;

  -[STMostUsedCellAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("allowanceIconView"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessibilityIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v3, "isEqualToString:", CFSTR("HourGlassEmpty")))
  {
    accessibilityLocalizedString(CFSTR("allowance.expired"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

@end
