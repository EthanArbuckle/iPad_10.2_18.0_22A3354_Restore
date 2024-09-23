@implementation SFStartPageCustomizationCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SFStartPageCustomizationCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceVariable:withType:", CFSTR("SFStartPageCustomizationCell"), CFSTR("_switch"), "UISwitch");
}

- (unint64_t)accessibilityTraits
{
  unint64_t v3;
  void *v4;
  unint64_t v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SFStartPageCustomizationCellAccessibility;
  v3 = -[SFStartPageCustomizationCellAccessibility accessibilityTraits](&v7, sel_accessibilityTraits);
  -[SFStartPageCustomizationCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_switch"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "accessibilityTraits") | v3;

  return v5;
}

- (CGPoint)accessibilityActivationPoint
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGPoint result;

  -[SFStartPageCustomizationCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_switch"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessibilityActivationPoint");
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.y = v8;
  result.x = v7;
  return result;
}

- (id)accessibilityValue
{
  void *v2;
  void *v3;

  -[SFStartPageCustomizationCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_switch"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessibilityValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_accessibilitySupplementaryFooterViews
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;
  objc_super v10;

  -[SFStartPageCustomizationCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_switch"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v10.receiver = self;
  v10.super_class = (Class)SFStartPageCustomizationCellAccessibility;
  -[SFStartPageCustomizationCellAccessibility _accessibilitySupplementaryFooterViews](&v10, sel__accessibilitySupplementaryFooterViews);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __83__SFStartPageCustomizationCellAccessibility__accessibilitySupplementaryFooterViews__block_invoke;
  v8[3] = &unk_250296B40;
  v9 = v3;
  v5 = v3;
  objc_msgSend(v4, "ax_filteredArrayUsingBlock:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

BOOL __83__SFStartPageCustomizationCellAccessibility__accessibilitySupplementaryFooterViews__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  _BOOL8 v7;
  _QWORD v9[4];
  id v10;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __83__SFStartPageCustomizationCellAccessibility__accessibilitySupplementaryFooterViews__block_invoke_2;
  v9[3] = &unk_250296B18;
  v10 = v3;
  v5 = v3;
  objc_msgSend(v4, "_accessibilityFindAncestor:startWithSelf:", v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6 == 0;

  return v7;
}

BOOL __83__SFStartPageCustomizationCellAccessibility__accessibilitySupplementaryFooterViews__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return *(_QWORD *)(a1 + 32) == a2;
}

@end
