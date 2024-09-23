@implementation FMR1DistanceViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("FMFindingUI.FMR1DistanceView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("FMFindingUI.FMR1DistanceView"), CFSTR("accessibilityDistanceLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("FMFindingUI.FMR1DistanceView"), CFSTR("accessibilityDirectionLabel"), "@", 0);

}

- (BOOL)isAccessibilityElement
{
  void *v2;
  BOOL v3;

  -[FMR1DistanceViewAccessibility _accessibilityStringForDirectionView](self, "_accessibilityStringForDirectionView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "length") != 0;

  return v3;
}

- (id)_accessibilityStringForDirectionView
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;

  -[FMR1DistanceViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("accessibilityDistanceLabel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[FMR1DistanceViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("accessibilityDirectionLabel"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "string");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(v3, "accessibilityLabel");
    v6 = objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v7 = (void *)v6;
      objc_msgSend(v5, "stringByAppendingString:", v6);
      v8 = objc_claimAutoreleasedReturnValue();

      v5 = (void *)v8;
    }
  }
  if (v4)
  {
    objc_msgSend(v4, "accessibilityLabel");
    v9 = objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      v10 = (void *)v9;
      objc_msgSend(v5, "stringByAppendingFormat:", CFSTR(" %@"), v9);
      v11 = objc_claimAutoreleasedReturnValue();

      v5 = (void *)v11;
    }
  }

  return v5;
}

@end
