@implementation SBFolderScrollAccessoryViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SBFolderScrollAccessoryView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasProperty:withType:", CFSTR("SBFolderScrollAccessoryView"), CFSTR("pageControl"), "@");
  objc_msgSend(v3, "validateClass:hasProperty:withType:", CFSTR("SBFolderScrollAccessoryView"), CFSTR("auxiliaryView"), "@");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SBIconListPageControl"), CFSTR("_delegate"), "<SBIconListPageControlDelegate>");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBFolderView"), CFSTR("isEditing"), "B", 0);

}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  char v5;
  void *v6;
  objc_super v8;

  if (-[SBFolderScrollAccessoryViewAccessibility _axIsSearchPillHidden](self, "_axIsSearchPillHidden")
    || (-[SBFolderScrollAccessoryViewAccessibility _axPageControl](self, "_axPageControl"),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v3, "safeValueForKey:", CFSTR("delegate")),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v5 = objc_msgSend(v4, "safeBoolForKey:", CFSTR("isEditing")),
        v4,
        v3,
        (v5 & 1) != 0))
  {
    v8.receiver = self;
    v8.super_class = (Class)SBFolderScrollAccessoryViewAccessibility;
    -[SBFolderScrollAccessoryViewAccessibility accessibilityLabel](&v8, sel_accessibilityLabel);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    accessibilityLocalizedString(CFSTR("home.search.pill.view.label"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v6;
}

- (id)accessibilityIdentifier
{
  void *v4;
  void *v5;
  objc_super v6;

  if (-[SBFolderScrollAccessoryViewAccessibility _axIsSearchPillHidden](self, "_axIsSearchPillHidden"))
  {
    v6.receiver = self;
    v6.super_class = (Class)SBFolderScrollAccessoryViewAccessibility;
    -[SBFolderScrollAccessoryViewAccessibility accessibilityIdentifier](&v6, sel_accessibilityIdentifier);
    return (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[SBFolderScrollAccessoryViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("auxiliaryView"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "accessibilityIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    return v5;
  }
}

- (id)accessibilityHint
{
  void *v3;
  void *v4;
  char v5;
  void *v6;
  void *v7;

  if (-[SBFolderScrollAccessoryViewAccessibility _axIsSearchPillHidden](self, "_axIsSearchPillHidden")
    || (-[SBFolderScrollAccessoryViewAccessibility _axPageControl](self, "_axPageControl"),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v3, "safeValueForKey:", CFSTR("delegate")),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v5 = objc_msgSend(v4, "safeBoolForKey:", CFSTR("isEditing")),
        v4,
        v3,
        (v5 & 1) != 0))
  {
    -[SBFolderScrollAccessoryViewAccessibility _axPageControl](self, "_axPageControl");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "accessibilityHint");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    accessibilityLocalizedString(CFSTR("home.search.pill.view.hint"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v7;
}

- (BOOL)_accessibilityHitTestReverseOrder
{
  return !-[SBFolderScrollAccessoryViewAccessibility _axIsSearchPillHidden](self, "_axIsSearchPillHidden");
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (CGRect)accessibilityFrame
{
  void *v3;
  double v4;
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
  CGRect result;

  if (-[SBFolderScrollAccessoryViewAccessibility _axIsSearchPillHidden](self, "_axIsSearchPillHidden"))
    -[SBFolderScrollAccessoryViewAccessibility _axPageControl](self, "_axPageControl");
  else
    -[SBFolderScrollAccessoryViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("auxiliaryView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "accessibilityFrame");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  v12 = v5;
  v13 = v7;
  v14 = v9;
  v15 = v11;
  result.size.height = v15;
  result.size.width = v14;
  result.origin.y = v13;
  result.origin.x = v12;
  return result;
}

- (BOOL)accessibilityScroll:(int64_t)a3
{
  void *v4;

  -[SBFolderScrollAccessoryViewAccessibility _axPageControl](self, "_axPageControl");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a3) = objc_msgSend(v4, "accessibilityScroll:", a3);

  return a3;
}

- (void)accessibilityIncrement
{
  id v2;

  -[SBFolderScrollAccessoryViewAccessibility _axPageControl](self, "_axPageControl");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessibilityIncrement");

}

- (void)accessibilityDecrement
{
  id v2;

  -[SBFolderScrollAccessoryViewAccessibility _axPageControl](self, "_axPageControl");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessibilityDecrement");

}

- (id)accessibilityValue
{
  void *v2;
  void *v3;

  -[SBFolderScrollAccessoryViewAccessibility _axPageControl](self, "_axPageControl");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessibilityValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x24BDF73A0];
}

- (BOOL)_accessibilityShouldIncludeArrowKeyCommandsForDirectionalFocusMovement
{
  return 1;
}

- (BOOL)_axIsSearchPillHidden
{
  void *v2;
  void *v3;
  char v4;

  -[SBFolderScrollAccessoryViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("auxiliaryView"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "isHidden");
  else
    v4 = 1;

  return v4;
}

- (id)_axPageControl
{
  return (id)-[SBFolderScrollAccessoryViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("pageControl"));
}

@end
