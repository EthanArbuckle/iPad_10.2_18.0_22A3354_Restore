@implementation BrowserToolbarAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("BrowserToolbar");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("BrowserToolbar"), CFSTR("_barRegistration"), "<_SFBarRegistrationToken>");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SFBarRegistration"), CFSTR("_shareItem"), "UIBarButtonItem");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SFBarRegistration"), CFSTR("_tabExposeItem"), "UIBarButtonItem");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("BrowserToolbar"), CFSTR("initWithPlacement:hideBackground:"), "@", "q", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("BrowserToolbar"), CFSTR("setItems:animated:"), "v", "@", "B", 0);

}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
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
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)BrowserToolbarAccessibility;
  -[BrowserToolbarAccessibility _accessibilityLoadAccessibilityInformation](&v15, sel__accessibilityLoadAccessibilityInformation);
  -[BrowserToolbarAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_barRegistration"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeValueForKey:", CFSTR("_shareItem"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  accessibilityLocalizedString(CFSTR("actions.button"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAccessibilityLabel:", v5);

  -[BrowserToolbarAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_barRegistration"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "safeValueForKey:", CFSTR("_tabExposeItem"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  accessibilityLocalizedString(CFSTR("buttonbar.tabs.text"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAccessibilityLabel:", v8);

  -[BrowserToolbarAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_barRegistration"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "safeValueForKey:", CFSTR("_tabExposeItem"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  accessibilityLocalizedString(CFSTR("buttonbar.tabs.hint"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setAccessibilityHint:", v11);

  -[BrowserToolbarAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_barRegistration"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "safeValueForKey:", CFSTR("_newTabItem"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  accessibilityLocalizedString(CFSTR("new.tab.button"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setAccessibilityLabel:", v14);

}

- (BrowserToolbarAccessibility)initWithPlacement:(int64_t)a3 hideBackground:(BOOL)a4
{
  BrowserToolbarAccessibility *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)BrowserToolbarAccessibility;
  v4 = -[BrowserToolbarAccessibility initWithPlacement:hideBackground:](&v6, sel_initWithPlacement_hideBackground_, a3, a4);
  -[BrowserToolbarAccessibility _accessibilityLoadAccessibilityInformation](v4, "_accessibilityLoadAccessibilityInformation");
  return v4;
}

- (BOOL)accessibilityElementsHidden
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
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  void *v20;
  CGFloat v21;
  CGFloat v22;
  CGFloat v23;
  CGFloat v24;
  BOOL v25;
  CGRect v27;
  CGRect v28;
  CGRect v29;

  -[BrowserToolbarAccessibility bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[BrowserToolbarAccessibility window](self, "window");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[BrowserToolbarAccessibility convertRect:toView:](self, "convertRect:toView:", v11, v4, v6, v8, v10);
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v19 = v18;
  -[BrowserToolbarAccessibility window](self, "window");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "bounds");
  v29.origin.x = v21;
  v29.origin.y = v22;
  v29.size.width = v23;
  v29.size.height = v24;
  v27.origin.x = v13;
  v27.origin.y = v15;
  v27.size.width = v17;
  v27.size.height = v19;
  v28 = CGRectIntersection(v27, v29);
  v25 = v28.size.height <= 0.0 || v28.size.width <= 0.0;

  return v25;
}

- (void)setItems:(id)a3 animated:(BOOL)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)BrowserToolbarAccessibility;
  -[BrowserToolbarAccessibility setItems:animated:](&v5, sel_setItems_animated_, a3, a4);
  -[BrowserToolbarAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

- (int64_t)accessibilityContainerType
{
  return 4;
}

@end
