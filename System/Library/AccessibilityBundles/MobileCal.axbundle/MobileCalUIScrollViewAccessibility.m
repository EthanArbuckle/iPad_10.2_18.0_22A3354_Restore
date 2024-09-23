@implementation MobileCalUIScrollViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UIScrollView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:", CFSTR("InfiniteScrollViewController"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("InfiniteScrollViewController"), CFSTR("firstViewOnScreen"), "@", 0);

}

- (UIEdgeInsets)_accessibilityVisibleContentInset
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  double MaxY;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  objc_super v23;
  CGRect v24;
  CGRect v25;
  UIEdgeInsets result;

  v23.receiver = self;
  v23.super_class = (Class)MobileCalUIScrollViewAccessibility;
  -[MobileCalUIScrollViewAccessibility _accessibilityVisibleContentInset](&v23, sel__accessibilityVisibleContentInset);
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[MobileCalUIScrollViewAccessibility accessibilityIdentifier](self, "accessibilityIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "isEqualToString:", CFSTR("_AXWeekViewScrollViewIdentifier"));

  if (v12)
  {
    -[MobileCalUIScrollViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("superview"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    NSClassFromString(CFSTR("WeekView"));
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v22 = v13;
      _AXAssert();
    }
    objc_msgSend(v13, "safeValueForKey:", CFSTR("_allDayView"), v22);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "safeValueForKey:", CFSTR("frame"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "CGRectValue");
    MaxY = CGRectGetMaxY(v24);
    -[MobileCalUIScrollViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("frame"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "CGRectValue");
    v4 = MaxY - CGRectGetMinY(v25);

    v10 = 0.0;
    v8 = 0.0;
    v6 = 0.0;
  }
  v18 = v4;
  v19 = v6;
  v20 = v8;
  v21 = v10;
  result.right = v21;
  result.bottom = v20;
  result.left = v19;
  result.top = v18;
  return result;
}

- (BOOL)_accessibilityDrawsFocusRingWhenChildrenFocused
{
  int v3;
  void *v4;
  char v5;

  v3 = -[MobileCalUIScrollViewAccessibility _accessibilityIsFKARunningForFocusItem](self, "_accessibilityIsFKARunningForFocusItem");
  if (v3)
  {
    -[MobileCalUIScrollViewAccessibility accessibilityIdentification](self, "accessibilityIdentification");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("_AXWeekScrollViewIdentifier"));

    LOBYTE(v3) = v5;
  }
  return v3;
}

- (BOOL)_accessibilityShouldIncludeArrowKeyCommandsForDirectionalFocusMovement
{
  return 1;
}

- (id)_accessibilityFirstContainedElementForTechnology:(id)a3 honoringGroups:(BOOL)a4 shouldAlwaysScroll:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL8 v6;
  id v8;
  void *v9;
  char isKindOfClass;
  void *v11;
  void *v12;
  objc_super v14;

  v5 = a5;
  v6 = a4;
  v8 = a3;
  -[MobileCalUIScrollViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("delegate"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  NSClassFromString(CFSTR("InfiniteScrollViewController"));
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    -[MobileCalUIScrollViewAccessibility safeValueForKeyPath:](self, "safeValueForKeyPath:", CFSTR("delegate.firstViewOnScreen"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "_accessibilityFirstContainedElementForTechnology:honoringGroups:shouldAlwaysScroll:", v8, v6, v5);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)MobileCalUIScrollViewAccessibility;
    -[MobileCalUIScrollViewAccessibility _accessibilityFirstContainedElementForTechnology:honoringGroups:shouldAlwaysScroll:](&v14, sel__accessibilityFirstContainedElementForTechnology_honoringGroups_shouldAlwaysScroll_, v8, v6, v5);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v12;
}

@end
