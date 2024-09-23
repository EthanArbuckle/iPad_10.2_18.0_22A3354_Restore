@implementation _WGWidgetListScrollViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("_WGWidgetListScrollView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:", CFSTR("WGWidgetWrapperView"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("WGMajorListViewController"), CFSTR("headerView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("WGMajorListViewController"), CFSTR("footerView"), "@", 0);

}

- (int64_t)accessibilityContainerType
{
  return 4;
}

- (BOOL)shouldGroupAccessibilityChildren
{
  return 1;
}

- (BOOL)accessibilityScrollToVisibleWithChild:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  BOOL v7;
  objc_super v9;

  v4 = a3;
  objc_msgSend(v4, "_accessibilityAncestorIsKindOf:", MEMORY[0x2349254B8](CFSTR("WGWidgetWrapperView")));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5)
    v5 = v4;
  objc_msgSend(v5, "accessibilityFrameForScrolling");
  if (v6)
    -[_WGWidgetListScrollViewAccessibility _axAdjustedFrameForFrame:](self, "_axAdjustedFrameForFrame:");
  v9.receiver = self;
  v9.super_class = (Class)_WGWidgetListScrollViewAccessibility;
  v7 = -[_WGWidgetListScrollViewAccessibility _accessibilityScrollToFrame:forView:](&v9, sel__accessibilityScrollToFrame_forView_, 0);
  UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], (id)*MEMORY[0x24BDFEF20]);

  return v7;
}

- (BOOL)_accessibilityScrollToFrame:(CGRect)a3 forView:(id)a4
{
  _WGWidgetListScrollViewAccessibility *v4;
  objc_super v6;

  v4 = self;
  -[_WGWidgetListScrollViewAccessibility _axAdjustedFrameForFrame:](self, "_axAdjustedFrameForFrame:", a4, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v6.receiver = v4;
  v6.super_class = (Class)_WGWidgetListScrollViewAccessibility;
  LOBYTE(v4) = -[_WGWidgetListScrollViewAccessibility _accessibilityScrollToFrame:forView:](&v6, sel__accessibilityScrollToFrame_forView_, 0);
  UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], (id)*MEMORY[0x24BDFEF20]);
  return (char)v4;
}

- (CGRect)_axAdjustedFrameForFrame:(CGRect)a3
{
  double height;
  CGFloat width;
  double y;
  CGFloat x;
  void *v7;
  void *v8;
  void *v9;
  CGFloat v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGRect v17;
  CGRect v18;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[_WGWidgetListScrollViewAccessibility _accessibilityFindAncestor:startWithSelf:](self, "_accessibilityFindAncestor:startWithSelf:", &__block_literal_global_0, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_accessibilityViewController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "safeValueForKey:", CFSTR("headerView"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "accessibilityFrame");
  v10 = CGRectGetHeight(v17) + 50.0;

  objc_msgSend(v8, "safeValueForKey:", CFSTR("footerView"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "accessibilityFrame");
  v12 = CGRectGetHeight(v18);

  v13 = x;
  v14 = y - v10;
  v15 = width;
  v16 = height + v10 + v12;
  result.size.height = v16;
  result.size.width = v15;
  result.origin.y = v14;
  result.origin.x = v13;
  return result;
}

- (BOOL)accessibilityScroll:(int64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  objc_super v6;
  uint64_t v7;
  uint64_t v8;

  if (a3 == 3)
    return -[_WGWidgetListScrollViewAccessibility accessibilityScrollUpPage](self, "accessibilityScrollUpPage");
  v7 = v3;
  v8 = v4;
  v6.receiver = self;
  v6.super_class = (Class)_WGWidgetListScrollViewAccessibility;
  return -[_WGWidgetListScrollViewAccessibility accessibilityScroll:](&v6, sel_accessibilityScroll_);
}

- (id)focusGroupIdentifier
{
  void *v3;
  objc_super v5;

  if (-[_WGWidgetListScrollViewAccessibility _accessibilityIsFKARunningForFocusItem](self, "_accessibilityIsFKARunningForFocusItem"))
  {
    -[_WGWidgetListScrollViewAccessibility _accessibilityDefaultFocusGroupIdentifier](self, "_accessibilityDefaultFocusGroupIdentifier");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)_WGWidgetListScrollViewAccessibility;
    -[_WGWidgetListScrollViewAccessibility focusGroupIdentifier](&v5, sel_focusGroupIdentifier);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

@end
