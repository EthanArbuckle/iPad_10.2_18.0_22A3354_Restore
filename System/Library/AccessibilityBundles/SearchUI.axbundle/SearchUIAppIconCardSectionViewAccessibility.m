@implementation SearchUIAppIconCardSectionViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SearchUIAppIconCardSectionView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SearchUIAppIconCardSectionView"), CFSTR("folderLabelView"), "@", 0);
}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  -[SearchUIAppIconCardSectionViewAccessibility _accessibilityFindSubviewDescendant:](self, "_accessibilityFindSubviewDescendant:", &__block_literal_global_1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[SearchUIAppIconCardSectionViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("folderLabelView"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "_accessibilityViewIsVisible"))
    {
      v5 = (void *)MEMORY[0x24BDD17C8];
      accessibilityLocalizedString(CFSTR("app.located.in"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "accessibilityLabel");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "localizedStringWithFormat:", v6, v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      __UIAXStringForVariables();
      v9 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend(v3, "accessibilityLabel");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)SearchUIAppIconCardSectionViewAccessibility;
    -[SearchUIAppIconCardSectionViewAccessibility accessibilityLabel](&v11, sel_accessibilityLabel);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v9;
}

uint64_t __65__SearchUIAppIconCardSectionViewAccessibility_accessibilityLabel__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  NSClassFromString(CFSTR("SBIconView"));
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

@end
