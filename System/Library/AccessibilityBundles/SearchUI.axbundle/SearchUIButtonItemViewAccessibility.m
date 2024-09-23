@implementation SearchUIButtonItemViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SearchUIButtonItemView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SearchUIButtonItemView"), CFSTR("iconView"), "@", 0);
}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  objc_super v9;

  -[SearchUIButtonItemViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("iconView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_accessibilityFindDescendant:", &__block_literal_global_0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "accessibilityLabel");
    v6 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)SearchUIButtonItemViewAccessibility;
    -[SearchUIButtonItemViewAccessibility accessibilityLabel](&v9, sel_accessibilityLabel);
    v6 = objc_claimAutoreleasedReturnValue();
  }
  v7 = (void *)v6;

  return v7;
}

uint64_t __57__SearchUIButtonItemViewAccessibility_accessibilityLabel__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

@end
