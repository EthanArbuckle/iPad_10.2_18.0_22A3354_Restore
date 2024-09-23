@implementation UIViewCompassAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UIView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("CompassPageViewController"), CFSTR("_altitudeLabel"), "UILabel");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("CompassPageViewController"), CFSTR("_placeLabel"), "UILabel");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("CompassPageViewController"), CFSTR("_degreesSymbolLabel"), "UILabel");

}

- (BOOL)isAccessibilityElement
{
  void *v3;
  void *v4;
  char v5;
  objc_super v7;

  -[UIViewCompassAccessibility accessibilityIdentifier](self, "accessibilityIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("compassPageView")))
  {

    return 1;
  }
  -[UIViewCompassAccessibility accessibilityIdentifier](self, "accessibilityIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("levelPageView"));

  if ((v5 & 1) != 0)
    return 1;
  v7.receiver = self;
  v7.super_class = (Class)UIViewCompassAccessibility;
  return -[UIViewCompassAccessibility isAccessibilityElement](&v7, sel_isAccessibilityElement);
}

- (id)_accessibilitySupplementaryFooterViews
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  objc_super v14;

  -[UIViewCompassAccessibility accessibilityIdentifier](self, "accessibilityIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("compassPageView"));

  if (v4)
  {
    axCompassPageViewController();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "safeValueForKey:", CFSTR("_coordinatesLabel"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    accessibilityLocalizedString(CFSTR("coordinates.hint"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setAccessibilityHint:", v7);

    objc_msgSend(v5, "safeValueForKey:", CFSTR("_altitudeLabel"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8 && objc_msgSend(v8, "_accessibilityViewIsVisible"))
      objc_msgSend(v9, "setIsAccessibilityElement:", 1);
    objc_msgSend(v5, "safeValueForKey:", CFSTR("_placeLabel"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v10)
    {
      if (objc_msgSend(v10, "_accessibilityViewIsVisible"))
        objc_msgSend(v11, "setIsAccessibilityElement:", 1);
    }
    objc_msgSend(MEMORY[0x24BDBCE30], "axArrayByIgnoringNilElementsWithCount:", 3, v6, v11, v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    return v12;
  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)UIViewCompassAccessibility;
    -[UIViewCompassAccessibility _accessibilitySupplementaryFooterViews](&v14, sel__accessibilitySupplementaryFooterViews);
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

- (id)_accessibilityHitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  id v14;
  objc_super v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  y = a3.y;
  x = a3.x;
  v22 = *MEMORY[0x24BDAC8D0];
  v7 = a4;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  -[UIViewCompassAccessibility _accessibilitySupplementaryFooterViews](self, "_accessibilitySupplementaryFooterViews");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v18;
    while (2)
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v18 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        -[UIViewCompassAccessibility convertPoint:toView:](self, "convertPoint:toView:", v13, x, y);
        if ((objc_msgSend(v13, "pointInside:withEvent:", v7) & 1) != 0)
        {
          v14 = v13;

          goto LABEL_11;
        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (v10)
        continue;
      break;
    }
  }

  v16.receiver = self;
  v16.super_class = (Class)UIViewCompassAccessibility;
  -[UIViewCompassAccessibility _accessibilityHitTest:withEvent:](&v16, sel__accessibilityHitTest_withEvent_, v7, x, y);
  v14 = (id)objc_claimAutoreleasedReturnValue();
LABEL_11:

  return v14;
}

- (id)accessibilityLabel
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  objc_super v17;

  -[UIViewCompassAccessibility accessibilityIdentifier](self, "accessibilityIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("compassPageView"));

  if (v4)
  {
    axCompassPageViewController();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "safeValueForKey:", CFSTR("_degreesLabel"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "accessibilityLabel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "safeValueForKey:", CFSTR("_degreesSymbolLabel"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "accessibilityLabel");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "safeValueForKey:", CFSTR("_directionLabel"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "accessibilityLabel");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "stringByAppendingString:", v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAXStringForVariables();
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[UIViewCompassAccessibility accessibilityIdentifier](self, "accessibilityIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "isEqualToString:", CFSTR("levelPageView"));

    if (!v15)
    {
      v17.receiver = self;
      v17.super_class = (Class)UIViewCompassAccessibility;
      -[UIViewCompassAccessibility accessibilityLabel](&v17, sel_accessibilityLabel);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      return v13;
    }
    axLevelPageViewController();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "safeValueForKey:", CFSTR("_degreesLabel"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "accessibilityLabel");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v13;
}

- (id)_accessibilityScrollStatus
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  -[UIViewCompassAccessibility accessibilityIdentifier](self, "accessibilityIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("compassPageView"));

  if (v4)
  {
    axCompassPageViewController();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "safeValueForKey:", CFSTR("_coordinatesLabel"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "accessibilityLabel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    -[UIViewCompassAccessibility accessibilityLabel](self, "accessibilityLabel");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAXStringForVariables();
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    return v9;
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)UIViewCompassAccessibility;
    -[UIViewCompassAccessibility _accessibilityScrollStatus](&v11, sel__accessibilityScrollStatus);
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

- (id)accessibilityHint
{
  void *v3;
  int v4;
  void *v5;
  objc_super v7;

  -[UIViewCompassAccessibility accessibilityIdentifier](self, "accessibilityIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("compassPageView"));

  if (v4)
  {
    accessibilityLocalizedString(CFSTR("compass.usage.hint"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)UIViewCompassAccessibility;
    -[UIViewCompassAccessibility accessibilityHint](&v7, sel_accessibilityHint);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (BOOL)accessibilityScroll:(int64_t)a3
{
  void *v4;
  void *v5;
  UIAccessibilityNotifications v7;
  void *v8;
  objc_super v9;

  if ((unint64_t)(a3 - 1) > 1)
  {
    v9.receiver = self;
    v9.super_class = (Class)UIViewCompassAccessibility;
    return -[UIViewCompassAccessibility accessibilityScroll:](&v9, sel_accessibilityScroll_, a3);
  }
  else
  {
    axCompassController();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "safeValueForKey:", CFSTR("_pageControl"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (a3 == 1)
    {
      objc_msgSend(v5, "accessibilityDecrement");
    }
    else if (a3 == 2)
    {
      objc_msgSend(v5, "accessibilityIncrement");
    }
    v7 = *MEMORY[0x24BDF71E8];
    objc_msgSend(v5, "accessibilityValue");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    UIAccessibilityPostNotification(v7, v8);

    return 1;
  }
}

@end
