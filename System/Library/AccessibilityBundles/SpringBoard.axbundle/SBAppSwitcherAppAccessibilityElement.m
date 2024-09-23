@implementation SBAppSwitcherAppAccessibilityElement

- (BOOL)accessibilityActivate
{
  void *v3;
  void *v4;

  objc_opt_class();
  -[SBAppSwitcherAppAccessibilityElement itemContainer](self, "itemContainer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsSafeCategory();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    objc_msgSend(v4, "_axHandlePageViewTap:", 0);

  return v4 != 0;
}

- (BOOL)isAccessibilityElement
{
  void *v3;
  char v4;
  void *v5;
  char v6;

  -[SBAppSwitcherAppAccessibilityElement delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) == 0)
    return 0;
  -[SBAppSwitcherAppAccessibilityElement delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "appElementIsAccessibilityElement:", self);

  return v6;
}

- (BOOL)_accessibilityRetainsCustomRotorActionSetting
{
  void *v2;
  char v3;

  -[SBAppSwitcherAppAccessibilityElement itemContainer](self, "itemContainer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "_accessibilityRetainsCustomRotorActionSetting");

  return v3;
}

- (id)_accessibilityBundleIdentifier
{
  void *v2;
  void *v3;

  -[SBAppSwitcherAppAccessibilityElement itemContainer](self, "itemContainer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_accessibilityBundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)_accessibilityIsInAppSwitcher
{
  void *v3;
  void *v4;
  char v5;

  objc_opt_class();
  -[SBAppSwitcherAppAccessibilityElement itemContainer](self, "itemContainer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsSafeCategory();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v4, "_accessibilityIsInAppSwitcher");
  return v5;
}

- (id)_accessibilityCustomActionGroupIdentifier
{
  void *v2;
  objc_class *v3;
  void *v4;

  -[SBAppSwitcherAppAccessibilityElement itemContainer](self, "itemContainer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (CGRect)accessibilityFrame
{
  void *v3;
  void *v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGRect result;

  -[SBAppSwitcherAppAccessibilityElement itemContainer](self, "itemContainer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[SBAppSwitcherAppAccessibilityElement itemContainer](self, "itemContainer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "accessibilityFrame");
    v6 = v5;
    v8 = v7;
    v10 = v9;
    v12 = v11;

  }
  else
  {
    v10 = 10.0;
    *(double *)&v6 = -100.0;
    *(double *)&v8 = -100.0;
    v12 = 10.0;
  }
  v13 = *(double *)&v6;
  v14 = *(double *)&v8;
  v15 = v10;
  v16 = v12;
  result.size.height = v16;
  result.size.width = v15;
  result.origin.y = v14;
  result.origin.x = v13;
  return result;
}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  void *v5;

  -[SBAppSwitcherAppAccessibilityElement itemContainer](self, "itemContainer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[SBAppSwitcherAppAccessibilityElement itemContainer](self, "itemContainer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "accessibilityLabel");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (id)accessibilityIdentifier
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;

  -[SBAppSwitcherAppAccessibilityElement itemContainer](self, "itemContainer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "accessibilityIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[SBAppSwitcherAppAccessibilityElement itemContainer](self, "itemContainer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v3) = objc_msgSend(v5, "_accessibilityHasMultipleWindows");

  if ((_DWORD)v3)
  {
    objc_msgSend(v4, "stringByAppendingString:", CFSTR(":has-multiple-windows"));
    v6 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v6;
  }
  return v4;
}

- (id)accessibilityHint
{
  void *v2;
  void *v3;

  -[SBAppSwitcherAppAccessibilityElement itemContainer](self, "itemContainer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessibilityHint");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)_accessibilityIsVisibleByCompleteHitTest
{
  void *v3;
  objc_super v5;

  -[SBAppSwitcherAppAccessibilityElement itemContainer](self, "itemContainer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return 0;
  v5.receiver = self;
  v5.super_class = (Class)SBAppSwitcherAppAccessibilityElement;
  return -[SBAppSwitcherAppAccessibilityElement _accessibilityIsVisibleByCompleteHitTest](&v5, sel__accessibilityIsVisibleByCompleteHitTest);
}

- (id)accessibilityPath
{
  void *v2;
  void *v3;

  -[SBAppSwitcherAppAccessibilityElement itemContainer](self, "itemContainer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessibilityPath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)accessibilityValue
{
  void *v3;
  void *v4;
  void *v5;
  char v6;
  uint64_t v7;
  void *v9;

  -[SBAppSwitcherAppAccessibilityElement itemContainer](self, "itemContainer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "accessibilityValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[SBAppSwitcherAppAccessibilityElement _axIsAppActive](self, "_axIsAppActive"))
  {
    -[SBAppSwitcherAppAccessibilityElement itemContainer](self, "itemContainer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "_accessibilityIsShelfItemContainer");

    if ((v6 & 1) == 0)
    {
      accessibilityLocalizedString(CFSTR("app.running.status"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      __UIAXStringForVariables();
      v7 = objc_claimAutoreleasedReturnValue();

      v4 = (void *)v7;
    }
  }
  return v4;
}

- (id)accessibilityCustomActions
{
  void *v2;
  void *v3;

  -[SBAppSwitcherAppAccessibilityElement itemContainer](self, "itemContainer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessibilityCustomActions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (unint64_t)accessibilityTraits
{
  void *v2;
  unint64_t v3;

  -[SBAppSwitcherAppAccessibilityElement itemContainer](self, "itemContainer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "accessibilityTraits");

  return v3;
}

- (BOOL)accessibilityScroll:(int64_t)a3
{
  void *v5;
  void *v6;
  char v7;
  void *v9;
  char v10;
  objc_super v11;

  -[SBAppSwitcherAppAccessibilityElement itemContainer](self, "itemContainer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[SBAppSwitcherAppAccessibilityElement itemContainer](self, "itemContainer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "accessibilityScroll:", a3);

    if ((v7 & 1) != 0)
    {
      return 1;
    }
    else
    {
      -[SBAppSwitcherAppAccessibilityElement accessibilityContainer](self, "accessibilityContainer");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "accessibilityScroll:", a3);

      return v10;
    }
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)SBAppSwitcherAppAccessibilityElement;
    return -[SBAppSwitcherAppAccessibilityElement accessibilityScroll:](&v11, sel_accessibilityScroll_, a3);
  }
}

- (id)_accessibilityScrollStatus
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  -[SBAppSwitcherAppAccessibilityElement itemContainer](self, "itemContainer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[SBAppSwitcherAppAccessibilityElement itemContainer](self, "itemContainer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_accessibilityScrollStatus");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    return v5;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)SBAppSwitcherAppAccessibilityElement;
    -[SBAppSwitcherAppAccessibilityElement _accessibilityScrollStatus](&v7, sel__accessibilityScrollStatus);
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

- (BOOL)_accessibilityScrollToVisible
{
  void *v3;
  void *v4;
  char v5;
  BOOL v6;

  -[SBAppSwitcherAppAccessibilityElement itemContainer](self, "itemContainer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[SBAppSwitcherAppAccessibilityElement itemContainer](self, "itemContainer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "_accessibilityScrollToVisible");
  }
  else
  {
    -[SBAppSwitcherAppAccessibilityElement contentView](self, "contentView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "_axScrollToAppElement:", self);
  }
  v6 = v5;

  return v6;
}

- (BOOL)_accessibilityCanPerformAction:(int)a3
{
  uint64_t v3;
  void *v4;

  v3 = *(_QWORD *)&a3;
  -[SBAppSwitcherAppAccessibilityElement itemContainer](self, "itemContainer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = objc_msgSend(v4, "_accessibilityCanPerformAction:", v3);

  return v3;
}

- (id)_accessibilityPreferredScrollActions
{
  void *v2;
  void *v3;

  -[SBAppSwitcherAppAccessibilityElement itemContainer](self, "itemContainer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_accessibilityPreferredScrollActions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_accessibilityScrollAncestor
{
  void *v2;
  void *v3;

  -[SBAppSwitcherAppAccessibilityElement itemContainer](self, "itemContainer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_accessibilityScrollAncestor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)_accessibilityUpdatesSwitchMenu
{
  return 1;
}

- (BOOL)_axIsAppActive
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  void *v11;
  int v12;
  char v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  -[SBAppSwitcherAppAccessibilityElement appLayout](self, "appLayout");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_axBundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BE38070], "sharedInstanceIfExists");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allProcesses");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = v5;
  v7 = (id)objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v16;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v10, "bundleIdentifier", (_QWORD)v15);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "isEqualToString:", v3);

        if (v12)
        {
          v7 = v10;
          goto LABEL_11;
        }
      }
      v7 = (id)objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v7)
        continue;
      break;
    }
  }
LABEL_11:

  v13 = objc_msgSend(v7, "isRunning");
  return v13;
}

- (BOOL)canBecomeFocused
{
  return 0;
}

- (BOOL)_accessibilityIsDescendantOfElement:(id)a3
{
  id v4;
  void *v5;
  char v6;
  BOOL v7;
  objc_super v9;

  v4 = a3;
  NSClassFromString(CFSTR("SBAppSwitcherPageView"));
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (-[SBAppSwitcherAppAccessibilityElement itemContainer](self, "itemContainer"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v4, "_accessibilityIsDescendantOfElement:", v5),
        v5,
        (v6 & 1) != 0))
  {
    v7 = 1;
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)SBAppSwitcherAppAccessibilityElement;
    v7 = -[SBAppSwitcherAppAccessibilityElement _accessibilityIsDescendantOfElement:](&v9, sel__accessibilityIsDescendantOfElement_, v4);
  }

  return v7;
}

- (BOOL)_accessibilitySetNativeFocus
{
  void *v2;
  void *v3;
  char v4;

  -[SBAppSwitcherAppAccessibilityElement itemContainer](self, "itemContainer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safeValueForKey:", CFSTR("_pageView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "_accessibilitySetNativeFocus");

  return v4;
}

- (BOOL)isControlCenter
{
  return self->_isControlCenter;
}

- (SBAppLayoutAccessibility)appLayout
{
  return self->_appLayout;
}

- (void)setAppLayout:(id)a3
{
  objc_storeStrong((id *)&self->_appLayout, a3);
}

- (SBFluidSwitcherItemContainerAccessibility)itemContainer
{
  return (SBFluidSwitcherItemContainerAccessibility *)objc_loadWeakRetained((id *)&self->_itemContainer);
}

- (void)setItemContainer:(id)a3
{
  objc_storeWeak((id *)&self->_itemContainer, a3);
}

- (SBFluidSwitcherContentViewAccessibility)contentView
{
  return (SBFluidSwitcherContentViewAccessibility *)objc_loadWeakRetained((id *)&self->_contentView);
}

- (void)setContentView:(id)a3
{
  objc_storeWeak((id *)&self->_contentView, a3);
}

- (SBAppSwticherAppAccessibilityElementDelegate)delegate
{
  return (SBAppSwticherAppAccessibilityElementDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_contentView);
  objc_destroyWeak((id *)&self->_itemContainer);
  objc_storeStrong((id *)&self->_appLayout, 0);
}

@end
