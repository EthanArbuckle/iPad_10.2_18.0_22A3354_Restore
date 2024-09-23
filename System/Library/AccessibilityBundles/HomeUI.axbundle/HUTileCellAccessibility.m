@implementation HUTileCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("HUTileCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("HUTileCell"), CFSTR("UICollectionViewCell"));
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("HomeUI.TileCellContentView"), CFSTR("UIView"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HomeUI.TileCellContentView"), CFSTR("standardLabels"), "@", 0);

}

- (unint64_t)accessibilityTraits
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HUTileCellAccessibility;
  return *MEMORY[0x24BDF73B0] | -[HUTileCellAccessibility accessibilityTraits](&v3, sel_accessibilityTraits);
}

- (id)accessibilityLabel
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_opt_class();
  __UIAccessibilityCastAsClass();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeArrayForKey:", CFSTR("standardLabels"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "ax_filteredArrayUsingBlock:", &__block_literal_global_0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  AXLabelForElements();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

uint64_t __45__HUTileCellAccessibility_accessibilityLabel__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_accessibilityViewIsVisible");
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)automationElements
{
  void *v2;
  void *v3;
  void *v4;

  objc_opt_class();
  __UIAccessibilityCastAsClass();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "subviews");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end
