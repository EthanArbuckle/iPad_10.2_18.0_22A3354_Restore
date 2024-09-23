@implementation SearchUIDetailedRowCardSectionViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SearchUIDetailedRowCardSectionView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SearchUIDetailedView"), CFSTR("detailsView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SearchUIDetailedView"), CFSTR("innerContainer"), "@", 0);
  objc_msgSend(v3, "validateClass:", CFSTR("TLKAuxilliaryTextView"));
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("SearchUIDetailedRowCardSectionView"), CFSTR("SearchUICardSectionView"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SearchUICardSectionView"), CFSTR("contentView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SearchUIDetailedRowCardSectionView"), CFSTR("updateWithRowModel:"), "v", "@", 0);
  objc_msgSend(v3, "validateClass:", CFSTR("SearchUIButtonItemView"));

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)_accessibilitySupplementaryFooterViews
{
  return (id)-[SearchUIDetailedRowCardSectionViewAccessibility _accessibilityFindSubviewDescendantsPassingTest:](self, "_accessibilityFindSubviewDescendantsPassingTest:", &__block_literal_global_10);
}

uint64_t __89__SearchUIDetailedRowCardSectionViewAccessibility__accessibilitySupplementaryFooterViews__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;
  void *v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  void *v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  double x;
  double y;
  double width;
  double height;
  void *v22;
  CGFloat v23;
  CGFloat v24;
  CGFloat v25;
  CGFloat v26;
  void *v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  uint64_t v34;
  CGAffineTransform v36;
  CGAffineTransform v37;
  CGRect v38;
  CGRect v39;
  CGRect v40;
  CGRect v41;
  CGRect v42;
  CGRect v43;

  v2 = a2;
  NSClassFromString(CFSTR("SearchUIButtonItemView"));
  if ((objc_opt_isKindOfClass() & 1) != 0
    || (NSClassFromString(CFSTR("CNActionView")), (objc_opt_isKindOfClass() & 1) != 0)
    || (NSClassFromString(CFSTR("TLKStoreButton")), (objc_opt_isKindOfClass() & 1) != 0))
  {
    isKindOfClass = 1;
  }
  else
  {
    NSClassFromString(CFSTR("ASCOfferButton"));
    isKindOfClass = objc_opt_isKindOfClass();
  }
  NSClassFromString(CFSTR("ASCOfferButton"));
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v2, "safeValueForKey:", CFSTR("titleLabel"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "accessibilityFrame");
    v6 = v5;
    v8 = v7;
    v10 = v9;
    v12 = v11;
    objc_msgSend(v2, "safeValueForKey:", CFSTR("imageView"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "accessibilityFrame");
    v42.origin.x = v14;
    v42.origin.y = v15;
    v42.size.width = v16;
    v42.size.height = v17;
    v38.origin.x = v6;
    v38.origin.y = v8;
    v38.size.width = v10;
    v38.size.height = v12;
    v39 = CGRectUnion(v38, v42);
    x = v39.origin.x;
    y = v39.origin.y;
    width = v39.size.width;
    height = v39.size.height;

    objc_msgSend(v2, "safeValueForKey:", CFSTR("subtitleLabel"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v22, "_accessibilityViewIsVisible"))
    {
      objc_msgSend(v22, "accessibilityFrame");
      v43.origin.x = v23;
      v43.origin.y = v24;
      v43.size.width = v25;
      v43.size.height = v26;
      v40.origin.x = x;
      v40.origin.y = y;
      v40.size.width = width;
      v40.size.height = height;
      v41 = CGRectUnion(v40, v43);
      x = v41.origin.x;
      y = v41.origin.y;
      width = v41.size.width;
      height = v41.size.height;
      objc_msgSend(MEMORY[0x24BDF6870], "bezierPathWithRoundedRect:cornerRadius:");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "bounds");
      AX_CGRectGetCenter();
      v29 = v28;
      v31 = v30;
      CGAffineTransformMakeScale(&v37, 1.3, 1.3);
      objc_msgSend(v27, "applyTransform:", &v37);
      objc_msgSend(v27, "bounds");
      AX_CGRectGetCenter();
      CGAffineTransformMakeTranslation(&v36, v29 - v32, v31 - v33);
      objc_msgSend(v27, "applyTransform:", &v36);
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDF6870], "bezierPathWithRoundedRect:cornerRadius:", x, y, width, height, 10.0);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v2, "setAccessibilityPath:", v27);

    objc_msgSend(v2, "setAccessibilityFrame:", x, y, width, height);
  }
  if ((isKindOfClass & 1) != 0 && objc_msgSend(v2, "isAccessibilityElement"))
    v34 = objc_msgSend(v2, "_accessibilityViewIsVisible");
  else
    v34 = 0;

  return v34;
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
  void *v10;
  void *v11;
  void *v13;

  -[SearchUIDetailedRowCardSectionViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("contentView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeValueForKey:", CFSTR("innerContainer"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_accessibilityFindSubviewDescendantsPassingTest:", &__block_literal_global_212);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[SearchUIDetailedRowCardSectionViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("contentView"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "safeUIViewForKey:", CFSTR("detailsView"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[SearchUIDetailedRowCardSectionViewAccessibility _accessibilityValueForKey:](self, "_accessibilityValueForKey:", *MEMORY[0x24BDBD298]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "accessibilityLabel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "accessibilityValue");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x23491CD7C](v5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAXStringForVariables();
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

uint64_t __69__SearchUIDetailedRowCardSectionViewAccessibility_accessibilityLabel__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  NSClassFromString(CFSTR("TLKAuxilliaryTextView"));
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (id)accessibilityValue
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  objc_super v8;

  -[SearchUIDetailedRowCardSectionViewAccessibility _axGetToggleSwitch](self, "_axGetToggleSwitch");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "accessibilityValue");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)SearchUIDetailedRowCardSectionViewAccessibility;
    -[SearchUIDetailedRowCardSectionViewAccessibility accessibilityValue](&v8, sel_accessibilityValue);
    v5 = objc_claimAutoreleasedReturnValue();
  }
  v6 = (void *)v5;

  return v6;
}

- (CGPoint)accessibilityActivationPoint
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  objc_super v11;
  CGPoint result;

  -[SearchUIDetailedRowCardSectionViewAccessibility _axGetToggleSwitch](self, "_axGetToggleSwitch");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "accessibilityActivationPoint");
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)SearchUIDetailedRowCardSectionViewAccessibility;
    -[SearchUIDetailedRowCardSectionViewAccessibility accessibilityActivationPoint](&v11, sel_accessibilityActivationPoint);
  }
  v7 = v5;
  v8 = v6;

  v9 = v7;
  v10 = v8;
  result.y = v10;
  result.x = v9;
  return result;
}

- (unint64_t)accessibilityTraits
{
  void *v3;
  objc_super v5;

  -[SearchUIDetailedRowCardSectionViewAccessibility _axGetToggleSwitch](self, "_axGetToggleSwitch");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    return *MEMORY[0x24BDF7428];
  v5.receiver = self;
  v5.super_class = (Class)SearchUIDetailedRowCardSectionViewAccessibility;
  return -[SearchUIDetailedRowCardSectionViewAccessibility accessibilityTraits](&v5, sel_accessibilityTraits);
}

- (id)automationCustomProperties
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  const __CFString *v6;
  uint64_t v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  _QWORD v12[2];
  _QWORD v13[3];

  v13[2] = *MEMORY[0x24BDAC8D0];
  -[SearchUIDetailedRowCardSectionViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("contentView"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safeUIViewForKey:", CFSTR("detailsView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v12[0] = CFSTR("Title");
  objc_msgSend(v3, "accessibilityLabel");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (v4)
    v6 = (const __CFString *)v4;
  else
    v6 = &stru_25033E6B0;
  v12[1] = CFSTR("Subtitle");
  v13[0] = v6;
  objc_msgSend(v3, "accessibilityValue");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (v7)
    v9 = (const __CFString *)v7;
  else
    v9 = &stru_25033E6B0;
  v13[1] = v9;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v13, v12, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)_axGetToggleSwitch
{
  void *v2;
  void *v3;

  -[SearchUIDetailedRowCardSectionViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("contentView"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_accessibilityFindSubviewDescendant:", &__block_literal_global_228);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t __69__SearchUIDetailedRowCardSectionViewAccessibility__axGetToggleSwitch__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;

  v2 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = objc_msgSend(v2, "_accessibilityViewIsVisible");
  else
    v3 = 0;

  return v3;
}

@end
