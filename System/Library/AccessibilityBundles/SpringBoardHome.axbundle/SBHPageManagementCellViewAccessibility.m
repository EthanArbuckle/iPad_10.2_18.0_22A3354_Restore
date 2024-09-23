@implementation SBHPageManagementCellViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SBHPageManagementCellView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBHPageManagementCellView"), CFSTR("toggleButton"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBHPageManagementCellView"), CFSTR("listView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBHPageManagementCellView"), CFSTR("iconListHiddenDidChange:"), "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBHPageManagementCellViewController"), CFSTR("delegate"), "@", 0);
  objc_msgSend(v3, "validateClass:", CFSTR("SBRootFolderView"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBFolderView"), CFSTR("folder"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBIconListView"), CFSTR("model"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBRootFolder"), CFSTR("indexOfList:"), "Q", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBRootFolderView"), CFSTR("exitPageManagementUIWithCompletionHandler:"), "v", "@?", 0);
  objc_msgSend(v3, "validateClass:", CFSTR("SBIconView"));
  objc_msgSend(v3, "validateProtocol:hasRequiredInstanceMethod:", CFSTR("SBHPageManagementCellViewControllerDelegate"), CFSTR("pageManagementCellViewControllerDidReceiveTap:"));

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDD17C8];
  accessibilityLocalizedString(CFSTR("page.management.home.page"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", -[SBHPageManagementCellViewAccessibility _accessibilityPageIndex](self, "_accessibilityPageIndex"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringWithFormat:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)accessibilityValue
{
  if (-[SBHPageManagementCellViewAccessibility _accessibilityIsSelected](self, "_accessibilityIsSelected"))
    return accessibilityLocalizedString(CFSTR("page.management.home.page.visible"));
  else
    return accessibilityLocalizedString(CFSTR("page.management.home.page.hidden"));
}

- (id)accessibilityHint
{
  __CFString *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  if (-[SBHPageManagementCellViewAccessibility _accessibilityToggleButtonEnabled](self, "_accessibilityToggleButtonEnabled"))
  {
    if (-[SBHPageManagementCellViewAccessibility _accessibilityIsSelected](self, "_accessibilityIsSelected"))
      v3 = CFSTR("page.management.home.page.hint.hide");
    else
      v3 = CFSTR("page.management.home.page.hint.show");
    accessibilityLocalizedString(v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = (void *)MEMORY[0x24BDD17C8];
    accessibilityLocalizedString(CFSTR("page.management.home.page.hint.jump"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", -[SBHPageManagementCellViewAccessibility _accessibilityPageIndex](self, "_accessibilityPageIndex"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localizedStringWithFormat:", v6, v7);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v4;
}

- (id)accessibilityCustomActions
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x24BDAC8D0];
  if (!-[SBHPageManagementCellViewAccessibility _accessibilityIsSelected](self, "_accessibilityIsSelected"))
    return 0;
  v3 = (void *)MEMORY[0x24BDD17C8];
  accessibilityLocalizedString(CFSTR("page.management.home.page.jump.action"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", -[SBHPageManagementCellViewAccessibility _accessibilityPageIndex](self, "_accessibilityPageIndex"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringWithFormat:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6788]), "initWithName:target:selector:", v6, self, sel__axHandleJumpToPage);
  v10[0] = v7;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v10, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (CGPoint)accessibilityActivationPoint
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  objc_super v10;
  CGPoint result;

  if (-[SBHPageManagementCellViewAccessibility _accessibilityToggleButtonEnabled](self, "_accessibilityToggleButtonEnabled"))
  {
    -[SBHPageManagementCellViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("toggleButton"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "accessibilityActivationPoint");
    v5 = v4;
    v7 = v6;

    v8 = v5;
    v9 = v7;
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)SBHPageManagementCellViewAccessibility;
    -[SBHPageManagementCellViewAccessibility accessibilityActivationPoint](&v10, sel_accessibilityActivationPoint);
  }
  result.y = v9;
  result.x = v8;
  return result;
}

- (BOOL)accessibilityPerformEscape
{
  id v2;
  void *v4;

  -[SBHPageManagementCellViewAccessibility _accessibilityAncestorIsKindOf:](self, "_accessibilityAncestorIsKindOf:", NSClassFromString(CFSTR("SBRootFolderView")));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v4;
  AXPerformSafeBlock();

  return 1;
}

uint64_t __68__SBHPageManagementCellViewAccessibility_accessibilityPerformEscape__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "exitPageManagementUIWithCompletionHandler:", 0);
}

- (void)iconListHiddenDidChange:(id)a3
{
  __CFString *v4;
  void *v5;
  UIAccessibilityNotifications v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)SBHPageManagementCellViewAccessibility;
  -[SBHPageManagementCellViewAccessibility iconListHiddenDidChange:](&v10, sel_iconListHiddenDidChange_, a3);
  if (-[SBHPageManagementCellViewAccessibility _accessibilityIsSelected](self, "_accessibilityIsSelected"))
    v4 = CFSTR("page.management.home.page.changed.visible");
  else
    v4 = CFSTR("page.management.home.page.changed.hidden");
  accessibilityLocalizedString(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *MEMORY[0x24BDF71E8];
  v7 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", -[SBHPageManagementCellViewAccessibility _accessibilityPageIndex](self, "_accessibilityPageIndex"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringWithFormat:", v5, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  UIAccessibilityPostNotification(v6, v9);

}

- (BOOL)_accessibilityIsSelected
{
  void *v2;
  void *v3;
  char v4;

  -[SBHPageManagementCellViewAccessibility _accessibilityToggleButton](self, "_accessibilityToggleButton");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "isSelected");
  else
    v4 = 1;

  return v4;
}

- (BOOL)_accessibilityToggleButtonEnabled
{
  void *v2;
  char v3;

  -[SBHPageManagementCellViewAccessibility _accessibilityToggleButton](self, "_accessibilityToggleButton");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEnabled");

  return v3;
}

- (id)_accessibilityToggleButton
{
  void *v3;
  void *v4;

  objc_opt_class();
  -[SBHPageManagementCellViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("toggleButton"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)_axHandleJumpToPage
{
  AXPerformSafeBlock();
  return 1;
}

void __61__SBHPageManagementCellViewAccessibility__axHandleJumpToPage__block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_accessibilityViewController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safeValueForKey:", CFSTR("delegate"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "pageManagementCellViewControllerDidReceiveTap:", v2);

}

- (id)accessibilityDragSourceDescriptors
{
  void *v2;
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  id v9;
  void *v10;
  void *v11;

  -[SBHPageManagementCellViewAccessibility _accessibilityFindAncestor:startWithSelf:](self, "_accessibilityFindAncestor:startWithSelf:", &__block_literal_global_8, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  UIRectGetCenter();
  objc_msgSend(v4, "convertPoint:toView:", v2);
  v6 = v5;
  v8 = v7;
  v9 = objc_alloc(MEMORY[0x24BDF67B0]);
  accessibilityLocalizedString(CFSTR("drag.page"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v9, "initWithName:point:inView:", v10, v2, v6, v8);
  objc_msgSend(v3, "axSafelyAddObject:", v11);

  return v3;
}

uint64_t __76__SBHPageManagementCellViewAccessibility_accessibilityDragSourceDescriptors__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  NSClassFromString(CFSTR("SBIconView"));
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (id)accessibilityDropPointDescriptors
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;

  -[SBHPageManagementCellViewAccessibility _accessibilityFindAncestor:startWithSelf:](self, "_accessibilityFindAncestor:startWithSelf:", &__block_literal_global_253, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  __UIAccessibilityCastAsClass();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bounds");
  UIRectGetCenter();
  objc_msgSend(v5, "convertPoint:toView:", v3);
  v7 = v6;
  v9 = v8 + -0.5;
  v10 = (void *)MEMORY[0x24BDD17C8];
  accessibilityLocalizedString(CFSTR("drop.before.page"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBHPageManagementCellViewAccessibility accessibilityLabel](self, "accessibilityLabel");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringWithFormat:", v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF67B0]), "initWithName:point:inView:", v13, v3, v9, v7);
  objc_msgSend(v4, "axSafelyAddObject:", v14);

  objc_msgSend(v5, "bounds");
  UIRectGetCenter();
  objc_msgSend(v5, "convertPoint:toView:", v3);
  v16 = v15;
  v18 = v17 + 0.5;
  v19 = (void *)MEMORY[0x24BDD17C8];
  accessibilityLocalizedString(CFSTR("drop.after.page"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBHPageManagementCellViewAccessibility accessibilityLabel](self, "accessibilityLabel");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "stringWithFormat:", v20, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF67B0]), "initWithName:point:inView:", v22, v3, v18, v16);
  objc_msgSend(v4, "axSafelyAddObject:", v23);

  return v4;
}

uint64_t __75__SBHPageManagementCellViewAccessibility_accessibilityDropPointDescriptors__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  NSClassFromString(CFSTR("SBIconView"));
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (int64_t)_accessibilityPageIndex
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;

  -[SBHPageManagementCellViewAccessibility _accessibilityAncestorIsKindOf:](self, "_accessibilityAncestorIsKindOf:", NSClassFromString(CFSTR("SBRootFolderView")));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeValueForKey:", CFSTR("folder"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBHPageManagementCellViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("listView"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "safeValueForKey:", CFSTR("model"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "indexOfList:", v6);

  return v7 + 1;
}

@end
