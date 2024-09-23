@implementation CKUIPageControlAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UIPageControl");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)accessibilityValue
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  unint64_t v8;
  uint64_t v9;
  void *v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)CKUIPageControlAccessibility;
  -[CKUIPageControlAccessibility accessibilityValue](&v12, sel_accessibilityValue);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKUIPageControlAccessibility accessibilityIdentification](self, "accessibilityIdentification");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("AXImpactEffectPageControl"));

  if (v5)
  {
    -[CKUIPageControlAccessibility _accessibilityValueForKey:](self, "_accessibilityValueForKey:", CFSTR("AXImpactEffectPageControlValues"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKUIPageControlAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("currentPage"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "integerValue");

    if (v8 < objc_msgSend(v6, "count"))
    {
      objc_msgSend(v6, "objectAtIndex:", v8);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      __AXStringForVariables();
      v9 = objc_claimAutoreleasedReturnValue();

      v3 = (void *)v9;
    }

  }
  return v3;
}

@end
