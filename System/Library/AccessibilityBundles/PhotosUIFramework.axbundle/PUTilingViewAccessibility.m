@implementation PUTilingViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PUTilingView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PUOneUpBarsController"), CFSTR("browsingSession"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PUBrowsingSession"), CFSTR("viewModel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PUBrowsingViewModel"), CFSTR("isChromeVisible"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PUOneUpViewController"), CFSTR("_barsController"), "@", 0);
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("PUTilingView"), CFSTR("UIScrollView"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PUTilingView"), CFSTR("layout"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PUTilingLayout"), CFSTR("preferredScrollInfo"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PUTilingScrollInfo"), CFSTR("interpageSpacing"), "{CGSize=dd}", 0);
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("PUScrubberView"), CFSTR("UIView"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIView"), CFSTR("canBecomeFocused"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIView"), CFSTR("_isEligibleForFocusInteraction"), "B", 0);

}

- (BOOL)accessibilityPerformEscape
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  char v6;
  char v7;
  id v9;

  -[PUTilingViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("delegate"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safeValueForKey:", CFSTR("_barsController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "safeValueForKey:", CFSTR("browsingSession"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "safeValueForKey:", CFSTR("viewModel"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "safeBoolForKey:", CFSTR("isChromeVisible"));
  if (v3)
    v7 = v6;
  else
    v7 = 1;
  if ((v7 & 1) == 0)
  {
    v9 = v3;
    AXPerformSafeBlock();
    UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], 0);

  }
  return v7 ^ 1;
}

uint64_t __55__PUTilingViewAccessibility_accessibilityPerformEscape__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleTapGestureRecognizer:", 0);
}

- (double)_accessibilityScrollWidthDistance
{
  double v3;
  double v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)PUTilingViewAccessibility;
  -[PUTilingViewAccessibility _accessibilityScrollWidthDistance](&v12, sel__accessibilityScrollWidthDistance);
  v4 = v3;
  -[PUTilingViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("layout"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "safeValueForKey:", CFSTR("preferredScrollInfo"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  objc_msgSend(v6, "safeValueForKey:", CFSTR("interpageSpacing"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "CGSizeValue");
  v10 = v4 + v9;

  return v10;
}

- (id)_accessibilityScrollStatus
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[PUTilingViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("delegate"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safeValueForKey:", CFSTR("browsingSession"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  accessibilityPULocalizedString(CFSTR("photo.scrubber.photo"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  AXScrollStatusForBrowsingSession(v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (CGSize)_accessibilityContentSize
{
  void *v2;
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double MaxX;
  double v12;
  double MaxY;
  double v14;
  double v15;
  CGSize result;
  CGRect v17;
  CGRect v18;
  CGRect v19;
  CGRect v20;

  -[PUTilingViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("layout"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safeCGRectForKey:", CFSTR("contentBounds"));
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;

  v17.origin.x = v4;
  v17.origin.y = v6;
  v17.size.width = v8;
  v17.size.height = v10;
  MaxX = CGRectGetMaxX(v17);
  v18.origin.x = v4;
  v18.origin.y = v6;
  v18.size.width = v8;
  v18.size.height = v10;
  v12 = MaxX - CGRectGetMinX(v18);
  v19.origin.x = v4;
  v19.origin.y = v6;
  v19.size.width = v8;
  v19.size.height = v10;
  MaxY = CGRectGetMaxY(v19);
  v20.origin.x = v4;
  v20.origin.y = v6;
  v20.size.width = v8;
  v20.size.height = v10;
  v14 = MaxY - CGRectGetMinY(v20);
  v15 = v12;
  result.height = v14;
  result.width = v15;
  return result;
}

- (BOOL)canBecomeFocused
{
  unsigned __int8 v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PUTilingViewAccessibility;
  v3 = -[PUTilingViewAccessibility canBecomeFocused](&v5, sel_canBecomeFocused);
  return -[PUTilingViewAccessibility _accessibilityIsFKARunningForFocusItem](self, "_accessibilityIsFKARunningForFocusItem") | v3;
}

- (BOOL)_isEligibleForFocusInteraction
{
  void *v3;
  BOOL v4;
  objc_super v6;

  if (-[PUTilingViewAccessibility _accessibilityIsFKARunningForFocusItem](self, "_accessibilityIsFKARunningForFocusItem"))
  {
    -[PUTilingViewAccessibility _accessibilityAncestorIsKindOf:](self, "_accessibilityAncestorIsKindOf:", NSClassFromString(CFSTR("PUScrubberView")));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3 == 0;

  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)PUTilingViewAccessibility;
    return -[PUTilingViewAccessibility _isEligibleForFocusInteraction](&v6, sel__isEligibleForFocusInteraction);
  }
  return v4;
}

@end
