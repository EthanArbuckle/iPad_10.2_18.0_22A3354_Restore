@implementation BuddyUITableViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UITableView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:", CFSTR("SetupChoiceController"));
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SetupChoiceController"), CFSTR("_primaryChoiceButton"), "UIButton");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SetupChoiceController"), CFSTR("_secondaryChoiceButton"), "UIButton");

}

- (BOOL)isAccessibilityElement
{
  void *v3;
  char v4;
  BOOL v5;
  void *v6;
  objc_super v8;

  -[BuddyUITableViewAccessibility accessibilityIdentifier](self, "accessibilityIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("BuddyMagnifyView"));

  if ((v4 & 1) != 0)
    return 0;
  -[BuddyUITableViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("delegate"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  NSClassFromString(CFSTR("BuddyTableViewController"));
  if ((objc_opt_isKindOfClass() & 1) != 0
    || (NSClassFromString(CFSTR("CDPTableViewController")), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v5 = 0;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)BuddyUITableViewAccessibility;
    v5 = -[BuddyUITableViewAccessibility isAccessibilityElement](&v8, sel_isAccessibilityElement);
  }

  return v5;
}

- (id)_axSortedAccessibleSubviews
{
  void *v2;
  void *v3;

  -[BuddyUITableViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_accessibleSubviews"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sortedArrayUsingSelector:", sel_accessibilityCompareGeometry_);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_axChoiceController
{
  void *v3;

  if (_axChoiceController_onceToken != -1)
    dispatch_once(&_axChoiceController_onceToken, &__block_literal_global_0);
  -[BuddyUITableViewAccessibility delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    v3 = 0;
  }
  return v3;
}

Class __52__BuddyUITableViewAccessibility__axChoiceController__block_invoke()
{
  Class result;

  result = NSClassFromString(CFSTR("SetupChoiceController"));
  _axChoiceController_SetupChoiceControllerClass = (uint64_t)result;
  return result;
}

- (id)_axPrimaryChoiceButton
{
  void *v2;
  void *v3;

  -[BuddyUITableViewAccessibility _axChoiceController](self, "_axChoiceController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safeValueForKey:", CFSTR("_primaryChoiceButton"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_axSecondaryChoiceButton
{
  void *v2;
  void *v3;

  -[BuddyUITableViewAccessibility _axChoiceController](self, "_axChoiceController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safeValueForKey:", CFSTR("_secondaryChoiceButton"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (int64_t)accessibilityElementCount
{
  void *v3;
  int v4;
  void *v5;
  int64_t v6;
  int64_t result;
  char *v8;
  void *v9;
  void *v10;
  objc_super v11;

  -[BuddyUITableViewAccessibility accessibilityIdentifier](self, "accessibilityIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("BuddyMagnifyView"));

  if (v4)
  {
    -[BuddyUITableViewAccessibility _axSortedAccessibleSubviews](self, "_axSortedAccessibleSubviews");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "count");

    return v6;
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)BuddyUITableViewAccessibility;
    v8 = -[BuddyUITableViewAccessibility accessibilityElementCount](&v11, sel_accessibilityElementCount);
    result = 0x7FFFFFFFFFFFFFFFLL;
    if (v8 != (char *)0x7FFFFFFFFFFFFFFFLL)
    {
      -[BuddyUITableViewAccessibility _axPrimaryChoiceButton](self, "_axPrimaryChoiceButton");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9)
        ++v8;
      -[BuddyUITableViewAccessibility _axSecondaryChoiceButton](self, "_axSecondaryChoiceButton");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (v10)
        return (int64_t)(v8 + 1);
      else
        return (int64_t)v8;
    }
  }
  return result;
}

- (id)_accessibilityScannerGroupElements
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  char v6;
  void *v7;
  objc_super v9;

  -[BuddyUITableViewAccessibility _axPrimaryChoiceButton](self, "_axPrimaryChoiceButton");
  v3 = objc_claimAutoreleasedReturnValue();
  -[BuddyUITableViewAccessibility _axSecondaryChoiceButton](self, "_axSecondaryChoiceButton");
  v4 = objc_claimAutoreleasedReturnValue();
  if (v3 | v4
    || (-[BuddyUITableViewAccessibility accessibilityIdentifier](self, "accessibilityIdentifier"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("BuddyMagnifyView")),
        v5,
        (v6 & 1) != 0))
  {
    v7 = 0;
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)BuddyUITableViewAccessibility;
    -[BuddyUITableViewAccessibility _accessibilityScannerGroupElements](&v9, sel__accessibilityScannerGroupElements);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

- (id)accessibilityElementAtIndex:(int64_t)a3
{
  void *v5;
  int v6;
  void *v7;
  void *v8;
  uint64_t v10;
  uint64_t v11;
  int64_t v12;
  int64_t v13;
  id v14;
  id v15;
  objc_super v16;

  -[BuddyUITableViewAccessibility accessibilityIdentifier](self, "accessibilityIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("BuddyMagnifyView"));

  if (v6)
  {
    -[BuddyUITableViewAccessibility _axSortedAccessibleSubviews](self, "_axSortedAccessibleSubviews");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectAtIndex:", a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    return v8;
  }
  -[BuddyUITableViewAccessibility _axPrimaryChoiceButton](self, "_axPrimaryChoiceButton");
  v10 = objc_claimAutoreleasedReturnValue();
  -[BuddyUITableViewAccessibility _axSecondaryChoiceButton](self, "_axSecondaryChoiceButton");
  v11 = objc_claimAutoreleasedReturnValue();
  if (v10 | v11)
  {
    v12 = -[BuddyUITableViewAccessibility accessibilityElementCount](self, "accessibilityElementCount");
    if (v12 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v13 = v12 - 1;
      if (v10 && v11)
      {
        if (v13 != a3)
        {
          v13 = v12 - 2;
          goto LABEL_10;
        }
        goto LABEL_14;
      }
      if (v10)
      {
LABEL_10:
        if (v13 == a3)
        {
          v14 = (id)v10;
          goto LABEL_16;
        }
        goto LABEL_15;
      }
      if (v11 && v13 == a3)
      {
LABEL_14:
        v14 = (id)v11;
        goto LABEL_16;
      }
    }
  }
LABEL_15:
  v16.receiver = self;
  v16.super_class = (Class)BuddyUITableViewAccessibility;
  -[BuddyUITableViewAccessibility accessibilityElementAtIndex:](&v16, sel_accessibilityElementAtIndex_, a3);
  v14 = (id)objc_claimAutoreleasedReturnValue();
LABEL_16:
  v15 = v14;

  return v15;
}

- (int64_t)indexOfAccessibilityElement:(id)a3
{
  id v4;
  void *v5;
  int v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  int64_t v10;
  objc_super v12;

  v4 = a3;
  -[BuddyUITableViewAccessibility accessibilityIdentifier](self, "accessibilityIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("BuddyMagnifyView"));

  if (!v6)
  {
    -[BuddyUITableViewAccessibility _axPrimaryChoiceButton](self, "_axPrimaryChoiceButton");
    v7 = objc_claimAutoreleasedReturnValue();
    -[BuddyUITableViewAccessibility _axSecondaryChoiceButton](self, "_axSecondaryChoiceButton");
    v9 = objc_claimAutoreleasedReturnValue();
    if (!(v7 | v9))
      goto LABEL_5;
    v10 = -[BuddyUITableViewAccessibility accessibilityElementCount](self, "accessibilityElementCount");
    if (v10 == 0x7FFFFFFFFFFFFFFFLL)
      goto LABEL_5;
    if (v7 && v9)
    {
      if ((id)v9 != v4)
      {
        if ((id)v7 == v4)
        {
          v8 = (id)(v10 - 2);
          goto LABEL_6;
        }
LABEL_5:
        v12.receiver = self;
        v12.super_class = (Class)BuddyUITableViewAccessibility;
        v8 = -[BuddyUITableViewAccessibility indexOfAccessibilityElement:](&v12, sel_indexOfAccessibilityElement_, v4);
LABEL_6:

        goto LABEL_7;
      }
    }
    else if (v7)
    {
      if ((id)v7 != v4)
        goto LABEL_5;
    }
    else if (!v9 || (id)v9 != v4)
    {
      goto LABEL_5;
    }
    v8 = (id)(v10 - 1);
    goto LABEL_6;
  }
  -[BuddyUITableViewAccessibility _axSortedAccessibleSubviews](self, "_axSortedAccessibleSubviews");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (id)objc_msgSend((id)v7, "indexOfObject:", v4);
LABEL_7:

  return (int64_t)v8;
}

- (id)_accessibilitySupplementaryHeaderViews
{
  void *v3;
  char v4;
  objc_super v6;

  -[BuddyUITableViewAccessibility accessibilityIdentifier](self, "accessibilityIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("BuddyMagnifyView"));

  if ((v4 & 1) != 0)
    return 0;
  v6.receiver = self;
  v6.super_class = (Class)BuddyUITableViewAccessibility;
  -[BuddyUITableViewAccessibility _accessibilitySupplementaryHeaderViews](&v6, sel__accessibilitySupplementaryHeaderViews);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (CGRect)accessibilityFrame
{
  void *v3;
  int v4;
  void *v5;
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
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  objc_super v22;
  CGRect result;

  -[BuddyUITableViewAccessibility accessibilityIdentifier](self, "accessibilityIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("BuddyTableView"));

  if (v4)
  {
    -[BuddyUITableViewAccessibility bounds](self, "bounds");
    -[BuddyUITableViewAccessibility delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v5, "tableView:heightForHeaderInSection:", self, 0, 0.0);
    UIAccessibilityFrameForBounds();
    v7 = v6;
    v9 = v8;
    v11 = v10;
    v13 = v12;

  }
  else
  {
    v22.receiver = self;
    v22.super_class = (Class)BuddyUITableViewAccessibility;
    -[BuddyUITableViewAccessibility accessibilityFrame](&v22, sel_accessibilityFrame);
    v7 = v14;
    v9 = v15;
    v11 = v16;
    v13 = v17;
  }
  v18 = v7;
  v19 = v9;
  v20 = v11;
  v21 = v13;
  result.size.height = v21;
  result.size.width = v20;
  result.origin.y = v19;
  result.origin.x = v18;
  return result;
}

@end
