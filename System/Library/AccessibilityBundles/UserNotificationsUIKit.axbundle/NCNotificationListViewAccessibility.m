@implementation NCNotificationListViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("NCNotificationListView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:", CFSTR("NCNotificationListView"));
  objc_msgSend(v3, "validateClass:", CFSTR("NCDigestSummaryPlatterView"));
  objc_msgSend(v3, "validateClass:", CFSTR("NCNotificationSummaryPlatterView"));
  objc_msgSend(v3, "validateClass:", CFSTR("NCNotificationListSectionRevealHintView"));
  objc_msgSend(v3, "validateClass:", CFSTR("_UIScrollViewScrollIndicator"));
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("NCNotificationListView"), CFSTR("UIView"));
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("NCNotificationListView"), CFSTR("UIScrollView"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("NCNotificationListView"), CFSTR("isGrouped"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIScrollView"), CFSTR("_minimumContentOffset"), "{CGPoint=dd}", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("NCNotificationListView"), CFSTR("_recycleViewIfNecessary:withDataSource:"), "v", "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("NCNotificationListView"), CFSTR("headerView"), "@", 0);

}

- (UIEdgeInsets)_accessibilityVisibleContentInset
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  objc_super v17;
  char v18;
  UIEdgeInsets result;

  v18 = 0;
  objc_opt_class();
  __UIAccessibilityCastAsClass();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "superview");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x2349233D4](CFSTR("NCNotificationListView"));
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v17.receiver = self;
    v17.super_class = (Class)NCNotificationListViewAccessibility;
    -[NCNotificationListViewAccessibility _accessibilityVisibleContentInset](&v17, sel__accessibilityVisibleContentInset);
    v6 = v5;
    v8 = v7;
    v10 = v9;
    v12 = v11;
  }
  else
  {
    v6 = *MEMORY[0x24BDF7718];
    v8 = *(double *)(MEMORY[0x24BDF7718] + 8);
    v10 = *(double *)(MEMORY[0x24BDF7718] + 16);
    v12 = *(double *)(MEMORY[0x24BDF7718] + 24);
  }

  v13 = v6;
  v14 = v8;
  v15 = v10;
  v16 = v12;
  result.right = v16;
  result.bottom = v15;
  result.left = v14;
  result.top = v13;
  return result;
}

- (unint64_t)accessibilityTraits
{
  void *v3;
  unint64_t v4;

  if (!-[NCNotificationListViewAccessibility _axShouldForwardToListCell](self, "_axShouldForwardToListCell"))
    return *MEMORY[0x24BDF73E0];
  -[NCNotificationListViewAccessibility _accessibilityListCell](self, "_accessibilityListCell");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "accessibilityTraits");

  return v4;
}

- (id)accessibilityPath
{
  void *v3;
  void *v4;

  if (-[NCNotificationListViewAccessibility _axShouldForwardToListCell](self, "_axShouldForwardToListCell"))
  {
    -[NCNotificationListViewAccessibility _accessibilityListCell](self, "_accessibilityListCell");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "accessibilityPath");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;

  if (-[NCNotificationListViewAccessibility _axShouldForwardToListCell](self, "_axShouldForwardToListCell"))
  {
    -[NCNotificationListViewAccessibility _accessibilityListCell](self, "_accessibilityListCell");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "accessibilityLabel");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (CGPoint)accessibilityActivationPoint
{
  void *v3;
  char isKindOfClass;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  objc_super v12;
  CGPoint result;

  if (-[NCNotificationListViewAccessibility _axShouldForwardToListCell](self, "_axShouldForwardToListCell")
    && (-[NCNotificationListViewAccessibility _accessibilityListCell](self, "_accessibilityListCell"),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        MEMORY[0x2349233D4](CFSTR("NCDigestSummaryPlatterView")),
        isKindOfClass = objc_opt_isKindOfClass(),
        v3,
        (isKindOfClass & 1) != 0))
  {
    -[NCNotificationListViewAccessibility _accessibilityListCell](self, "_accessibilityListCell");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "accessibilityActivationPoint");
    v7 = v6;
    v9 = v8;

    v10 = v7;
    v11 = v9;
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)NCNotificationListViewAccessibility;
    -[NCNotificationListViewAccessibility accessibilityActivationPoint](&v12, sel_accessibilityActivationPoint);
  }
  result.y = v11;
  result.x = v10;
  return result;
}

- (BOOL)accessibilityActivate
{
  void *v3;
  void *v4;
  void *v5;
  char isKindOfClass;
  void *v7;
  void *v8;
  id v9;
  objc_super v11;

  if (-[NCNotificationListViewAccessibility _axShouldForwardToListCell](self, "_axShouldForwardToListCell"))
  {
    -[NCNotificationListViewAccessibility _accessibilityListCell](self, "_accessibilityListCell");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[NCNotificationListViewAccessibility _accessibilityListCell](self, "_accessibilityListCell");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    MEMORY[0x2349233D4](CFSTR("NCDigestSummaryPlatterView"));
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {

    }
    else
    {
      -[NCNotificationListViewAccessibility _accessibilityListCell](self, "_accessibilityListCell");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      MEMORY[0x2349233D4](CFSTR("NCNotificationSummaryPlatterView"));
      isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) == 0)
      {
LABEL_8:
        UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], v3);

        goto LABEL_9;
      }
    }
    -[NCNotificationListViewAccessibility safeDictionaryForKey:](self, "safeDictionaryForKey:", CFSTR("visibleViews"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKey:", &unk_2503C41A8);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      v9 = v8;

      v3 = v9;
    }

    goto LABEL_8;
  }
LABEL_9:
  v11.receiver = self;
  v11.super_class = (Class)NCNotificationListViewAccessibility;
  return -[NCNotificationListViewAccessibility accessibilityActivate](&v11, sel_accessibilityActivate);
}

- (id)accessibilityHint
{
  void *v2;

  if (-[NCNotificationListViewAccessibility _axShouldForwardToListCell](self, "_axShouldForwardToListCell"))
  {
    accessibilityLocalizedString(CFSTR("notification.cell.collapsed.hint"));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (id)accessibilityCustomActions
{
  void *v3;
  void *v4;

  if (-[NCNotificationListViewAccessibility _axShouldForwardToListCell](self, "_axShouldForwardToListCell"))
  {
    -[NCNotificationListViewAccessibility _accessibilityListCell](self, "_accessibilityListCell");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "accessibilityCustomActions");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (int64_t)accessibilityContainerType
{
  return 0;
}

- (id)_accessibilityHitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v7;
  void *v8;
  NCNotificationListViewAccessibility *v9;
  id v10;
  void *v11;
  objc_super v13;
  CGPoint v14;
  CGRect v15;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  -[NCNotificationListViewAccessibility _accessibilityRevealHintView](self, "_accessibilityRevealHintView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "_accessibilityIsHintTitleVisible")
    && (objc_msgSend(v8, "accessibilityContainer"),
        v9 = (NCNotificationListViewAccessibility *)objc_claimAutoreleasedReturnValue(),
        v9,
        v9 == self)
    && (objc_msgSend(v8, "bounds"), v14.x = x, v14.y = y, CGRectContainsPoint(v15, v14)))
  {
    v10 = v8;
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)NCNotificationListViewAccessibility;
    -[NCNotificationListViewAccessibility _accessibilityHitTest:withEvent:](&v13, sel__accessibilityHitTest_withEvent_, v7, x, y);
    v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  v11 = v10;

  return v11;
}

- (id)_accessibilitySubviews
{
  void *v3;
  void *v4;
  void *v5;
  NCNotificationListViewAccessibility *v6;
  objc_super v8;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8.receiver = self;
  v8.super_class = (Class)NCNotificationListViewAccessibility;
  -[NCNotificationListViewAccessibility _accessibilitySubviews](&v8, sel__accessibilitySubviews);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "axSafelyAddObjectsFromArray:", v4);

  -[NCNotificationListViewAccessibility _accessibilityRevealHintView](self, "_accessibilityRevealHintView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "_accessibilityIsHintTitleVisible"))
  {
    objc_msgSend(v5, "accessibilityContainer");
    v6 = (NCNotificationListViewAccessibility *)objc_claimAutoreleasedReturnValue();

    if (v6 != self)
      objc_msgSend(v3, "axSafelyAddObject:", v5);
  }

  return v3;
}

- (id)accessibilityIdentifier
{
  void *v3;
  void *v4;

  if (-[NCNotificationListViewAccessibility _axShouldForwardToListCell](self, "_axShouldForwardToListCell"))
  {
    -[NCNotificationListViewAccessibility _accessibilityListCell](self, "_accessibilityListCell");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "accessibilityIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (id)automationElements
{
  void *v3;
  void *v4;
  objc_super v6;

  if (-[NCNotificationListViewAccessibility _axShouldForwardToListCell](self, "_axShouldForwardToListCell"))
  {
    -[NCNotificationListViewAccessibility _accessibilityListCell](self, "_accessibilityListCell");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "automationElements");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    return v4;
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)NCNotificationListViewAccessibility;
    -[NCNotificationListViewAccessibility automationElements](&v6, sel_automationElements);
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

- (id)_accessibilitySupplementaryFooterViews
{
  void *v3;
  void *v4;
  objc_super v6;

  if (-[NCNotificationListViewAccessibility _axShouldForwardToListCell](self, "_axShouldForwardToListCell"))
  {
    -[NCNotificationListViewAccessibility _accessibilityListCell](self, "_accessibilityListCell");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_accessibilitySupplementaryFooterViews");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    return v4;
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)NCNotificationListViewAccessibility;
    -[NCNotificationListViewAccessibility _accessibilitySupplementaryFooterViews](&v6, sel__accessibilitySupplementaryFooterViews);
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

- (BOOL)accessibilityScrollToVisibleWithChild:(id)a3
{
  id v4;
  char v5;
  void *v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  NSObject *v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  double v22;
  CGFloat v23;
  NSObject *v24;
  double v25;
  double v26;
  double v27;
  CGFloat v28;
  double v29;
  CGFloat v30;
  double v31;
  CGFloat v32;
  double v33;
  CGFloat v34;
  NSObject *v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  uint64_t v44;
  void *v45;
  void *v47;
  void *v48;
  void *v49;
  int v50;
  void *v51;
  uint64_t v52;
  CGRect v53;
  CGRect v54;
  CGRect v55;
  CGRect v56;
  CGRect v57;

  v52 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  MEMORY[0x2349233D4](CFSTR("_UIScrollViewScrollIndicator"));
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = 1;
  }
  else
  {
    LOBYTE(v50) = 0;
    objc_opt_class();
    __UIAccessibilityCastAsClass();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "adjustedContentInset");
    objc_msgSend(v4, "accessibilityFrame");
    UIAccessibilityFrameToBounds();
    v8 = v7;
    v10 = v9;
    v12 = v11;
    v14 = v13;
    AXLogScrollToVisible();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      v55.origin.x = v8;
      v55.origin.y = v10;
      v55.size.width = v12;
      v55.size.height = v14;
      NSStringFromCGRect(v55);
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      v50 = 138412290;
      v51 = v47;
      _os_log_debug_impl(&dword_232B20000, v15, OS_LOG_TYPE_DEBUG, "Scrolling within notifications. Original: %@", (uint8_t *)&v50, 0xCu);

    }
    UIRectInset();
    v17 = v16;
    v19 = v18;
    v21 = v20;
    v23 = v22;
    AXLogScrollToVisible();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
    {
      v56.origin.x = v17;
      v56.origin.y = v19;
      v56.size.width = v21;
      v56.size.height = v23;
      NSStringFromCGRect(v56);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      v50 = 138412290;
      v51 = v48;
      _os_log_debug_impl(&dword_232B20000, v24, OS_LOG_TYPE_DEBUG, "Expanded: %@", (uint8_t *)&v50, 0xCu);

    }
    -[NCNotificationListViewAccessibility safeCGPointForKey:](self, "safeCGPointForKey:", CFSTR("_minimumContentOffset"));
    v26 = v25;
    v53.origin.x = v17;
    v53.origin.y = v19;
    v53.size.width = v21;
    v53.size.height = v23;
    if (CGRectGetMinY(v53) < v26)
    {
      v54.origin.x = v17;
      v54.origin.y = v19;
      v54.size.width = v21;
      v54.size.height = v23;
      CGRectGetMinY(v54);
      UIRectInset();
      v28 = v27;
      v30 = v29;
      v32 = v31;
      v34 = v33;
      AXLogScrollToVisible();
      v35 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
      {
        v57.origin.x = v28;
        v57.origin.y = v30;
        v57.size.width = v32;
        v57.size.height = v34;
        NSStringFromCGRect(v57);
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        v50 = 138412290;
        v51 = v49;
        _os_log_debug_impl(&dword_232B20000, v35, OS_LOG_TYPE_DEBUG, "Clipped on top: %@", (uint8_t *)&v50, 0xCu);

      }
    }
    UIAccessibilityFrameForBounds();
    v37 = v36;
    v39 = v38;
    v41 = v40;
    v43 = v42;
    LOBYTE(v50) = 0;
    objc_opt_class();
    __UIAccessibilityCastAsClass();
    v44 = objc_claimAutoreleasedReturnValue();
    if ((_BYTE)v50)
      abort();
    v45 = (void *)v44;
    v5 = -[NCNotificationListViewAccessibility _accessibilityScrollToFrame:forView:](self, "_accessibilityScrollToFrame:forView:", v44, v37, v39, v41, v43);

  }
  return v5;
}

- (id)_accessibilityRevealHintView
{
  void *v2;
  void *v3;

  -[NCNotificationListViewAccessibility _accessibilityFindSubviewDescendant:](self, "_accessibilityFindSubviewDescendant:", &__block_literal_global_6);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  __UIAccessibilityCastAsSafeCategory();
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t __67__NCNotificationListViewAccessibility__accessibilityRevealHintView__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  MEMORY[0x2349233D4](CFSTR("NCNotificationListSectionRevealHintView"));
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (BOOL)_axShouldForwardToListCell
{
  void *v3;
  BOOL v4;

  -[NCNotificationListViewAccessibility _accessibilityListCell](self, "_accessibilityListCell");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3
    && -[NCNotificationListViewAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("isGrouped"))
    && -[NCNotificationListViewAccessibility _axHasMultipleViews](self, "_axHasMultipleViews");

  return v4;
}

- (id)_accessibilityListCell
{
  void *v2;
  void *v3;
  id v4;

  -[NCNotificationListViewAccessibility safeDictionaryForKey:](self, "safeDictionaryForKey:", CFSTR("visibleViews"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", &unk_2503C41C0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  MEMORY[0x2349233D4](CFSTR("NCNotificationListCell"));
  if ((objc_opt_isKindOfClass() & 1) != 0
    || (MEMORY[0x2349233D4](CFSTR("NCDigestSummaryPlatterView")), (objc_opt_isKindOfClass() & 1) != 0)
    || (MEMORY[0x2349233D4](CFSTR("NCNotificationSummaryPlatterView")), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v4 = v3;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)_axHasMultipleViews
{
  void *v2;
  BOOL v3;

  -[NCNotificationListViewAccessibility safeDictionaryForKey:](self, "safeDictionaryForKey:", CFSTR("visibleViews"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (unint64_t)objc_msgSend(v2, "count") > 1;

  return v3;
}

- (void)_recycleViewIfNecessary:(id)a3 withDataSource:(id)a4
{
  id v6;
  UIAccessibilityNotifications v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)NCNotificationListViewAccessibility;
  v6 = a3;
  -[NCNotificationListViewAccessibility _recycleViewIfNecessary:withDataSource:](&v9, sel__recycleViewIfNecessary_withDataSource_, v6, a4);
  MEMORY[0x2349233D4](CFSTR("NCNotificationSummaryPlatterView"));
  LOBYTE(a4) = objc_opt_isKindOfClass();

  if ((a4 & 1) != 0)
  {
    v7 = *MEMORY[0x24BDF72C8];
    -[NCNotificationListViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("headerView"), v9.receiver, v9.super_class);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    UIAccessibilityPostNotification(v7, v8);

  }
}

@end
