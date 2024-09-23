@implementation TabBarItemViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("TabBarItemView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("TabBarItemView"), CFSTR("_titleText"), "NSString");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("TabBarItemView"), CFSTR("_titleLabel"), "UILabel");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("TabBarItemView"), CFSTR("closeButton"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("TabBarItemView"), CFSTR("setTitleText:"), "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("TabBarItemView"), CFSTR("setActive:"), "v", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("TabBarItemView"), CFSTR("setPinned:"), "v", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("TabBarItemView"), CFSTR("isActive"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("TabBarItemView"), CFSTR("isPinned"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("TabBarItemView"), CFSTR("_isPinnedAndNarrow"), "B", 0);

}

- (void)_accessibilityLoadAccessibilityInformation
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TabBarItemViewAccessibility;
  -[TabBarItemViewAccessibility _accessibilityLoadAccessibilityInformation](&v3, sel__accessibilityLoadAccessibilityInformation);
  -[TabBarItemViewAccessibility _accessibilityUpdateAXInfo](self, "_accessibilityUpdateAXInfo");
}

- (BOOL)isAccessibilityElement
{
  return -[TabBarItemViewAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("_isPinnedAndNarrow"));
}

- (id)accessibilityLabel
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v7;

  -[TabBarItemViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_titleText"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  accessibilityLocalizedString(CFSTR("tab.view"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  AXCFormattedString();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  accessibilityLocalizedString(CFSTR("tab.pinned"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  __AXStringForVariables();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)_accessibilityUpdateAXInfo
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
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  uint64_t v18;
  uint64_t v19;
  id v20;

  -[TabBarItemViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_titleText"));
  v20 = (id)objc_claimAutoreleasedReturnValue();
  -[TabBarItemViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_titleLabel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[TabBarItemViewAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("isPinned"));
  v5 = (void *)MEMORY[0x24BDD17C8];
  accessibilityLocalizedString(CFSTR("tab.view"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", v6, v20);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    accessibilityLocalizedString(CFSTR("tab.pinned"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    __AXStringForVariables();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setAccessibilityLabel:", v9, v8, CFSTR("__AXStringForVariablesSentinel"));

  }
  else
  {
    objc_msgSend(v3, "setAccessibilityLabel:", v7);
  }

  accessibilityLocalizedString(CFSTR("tab.hint"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAccessibilityHint:", v10);

  -[TabBarItemViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("closeButton"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[TabBarItemViewAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("isPinned")))
  {
    v12 = v11;
    v13 = 0;
  }
  else
  {
    v12 = v11;
    v13 = 1;
  }
  objc_msgSend(v12, "setIsAccessibilityElement:", v13);
  v14 = (void *)MEMORY[0x24BDD17C8];
  accessibilityLocalizedString(CFSTR("close.tab"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "stringWithFormat:", v15, v20);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setAccessibilityLabel:", v16);

  v17 = -[TabBarItemViewAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("isActive"));
  v18 = objc_msgSend(v3, "accessibilityTraits");
  if (v17)
    v19 = *MEMORY[0x24BDF7400] | v18;
  else
    v19 = v18 & ~*MEMORY[0x24BDF7400];
  objc_msgSend(v3, "setAccessibilityTraits:", v19);
  objc_msgSend(v3, "setAccessibilityRespondsToUserInteraction:", 1);

}

- (id)_accessibilityHitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v7;
  void *v8;
  void *v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  id v14;
  void *v15;
  objc_super v17;
  CGPoint v18;
  CGRect v19;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  -[TabBarItemViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_titleLabel"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[TabBarItemViewAccessibility _accessibilityParentView](self, "_accessibilityParentView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  UIAccessibilityPointForPoint();
  v11 = v10;
  v13 = v12;

  objc_msgSend(v8, "accessibilityFrame");
  v18.x = v11;
  v18.y = v13;
  if (CGRectContainsPoint(v19, v18))
  {
    v14 = v8;
  }
  else
  {
    v17.receiver = self;
    v17.super_class = (Class)TabBarItemViewAccessibility;
    -[TabBarItemViewAccessibility _accessibilityHitTest:withEvent:](&v17, sel__accessibilityHitTest_withEvent_, v7, x, y);
    v14 = (id)objc_claimAutoreleasedReturnValue();
  }
  v15 = v14;

  return v15;
}

- (id)accessibilityIdentifier
{
  return CFSTR("TabBarItemView");
}

- (BOOL)_accessibilityIsSpeakThisElement
{
  return 0;
}

- (void)setFrame:(CGRect)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)TabBarItemViewAccessibility;
  -[TabBarItemViewAccessibility setFrame:](&v7, sel_setFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  -[TabBarItemViewAccessibility bounds](self, "bounds");
  -[TabBarItemViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_titleLabel"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[TabBarItemViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("closeButton"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "accessibilityTraits");
  if ((*MEMORY[0x24BDF7400] & v6) != 0)
    objc_msgSend(v5, "bounds");
  UIAccessibilityFrameForBounds();
  objc_msgSend(v4, "setAccessibilityFrame:");

}

- (void)setTitleText:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)TabBarItemViewAccessibility;
  -[TabBarItemViewAccessibility setTitleText:](&v4, sel_setTitleText_, a3);
  -[TabBarItemViewAccessibility _accessibilityUpdateAXInfo](self, "_accessibilityUpdateAXInfo");
}

- (void)setActive:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)TabBarItemViewAccessibility;
  -[TabBarItemViewAccessibility setActive:](&v4, sel_setActive_, a3);
  -[TabBarItemViewAccessibility _accessibilityUpdateAXInfo](self, "_accessibilityUpdateAXInfo");
}

- (void)setPinned:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)TabBarItemViewAccessibility;
  -[TabBarItemViewAccessibility setPinned:](&v4, sel_setPinned_, a3);
  -[TabBarItemViewAccessibility _accessibilityUpdateAXInfo](self, "_accessibilityUpdateAXInfo");
}

@end
