@implementation BrowserRootViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("BrowserRootViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("BrowserRootViewController"), CFSTR("_sidebarButtonEmbeddedInSidebar"), "UIButton");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("BrowserRootViewController"), CFSTR("_sidebarTrailingButton"), "UIButton");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("BrowserRootViewController"), CFSTR("_sidebarContentDimmingView"), "SidebarContentDimmingView");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("BrowserRootViewController"), CFSTR("sidebarDimmingViewDismiss:"), "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("BrowserRootViewController"), CFSTR("setShowingSidebar:completion:"), "v", "B", "@?", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("BrowserRootViewController"), CFSTR("bottomToolbar"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("_SFToolbar"), CFSTR("_barRegistration"), "<_SFBarRegistrationToken>");
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("BrowserToolbar"), CFSTR("_SFToolbar"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("BrowserRootViewController"), CFSTR("browserController"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("BrowserRootViewController"), CFSTR("capsuleViewController"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CapsuleNavigationBarViewController"), CFSTR("capsuleCollectionView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SFCapsuleCollectionView"), CFSTR("setSelectedItemState:animated:"), "v", "q", "B", 0);

}

- (void)setShowingSidebar:(BOOL)a3 completion:(id)a4
{
  _BOOL4 v4;
  void *v6;
  void *v7;
  void *v8;
  __CFString *v9;
  void *v10;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)BrowserRootViewControllerAccessibility;
  -[BrowserRootViewControllerAccessibility setShowingSidebar:completion:](&v11, sel_setShowingSidebar_completion_, a3, a4);
  -[BrowserRootViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("bottomToolbar"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "safeValueForKey:", CFSTR("_barRegistration"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "safeValueForKey:", CFSTR("_bookmarksItem"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    v9 = CFSTR("hide.bookmarks");
  else
    v9 = CFSTR("buttonbar.show.bookmarks.text");
  accessibilityLocalizedString(v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setAccessibilityLabel:", v10);

}

- (void)_setUpFloatingSidebarButton
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BrowserRootViewControllerAccessibility;
  -[BrowserRootViewControllerAccessibility _setUpFloatingSidebarButton](&v3, sel__setUpFloatingSidebarButton);
  -[BrowserRootViewControllerAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)BrowserRootViewControllerAccessibility;
  -[BrowserRootViewControllerAccessibility _accessibilityLoadAccessibilityInformation](&v7, sel__accessibilityLoadAccessibilityInformation);
  -[BrowserRootViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_sidebarButtonEmbeddedInSidebar"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  accessibilityLocalizedString(CFSTR("hide.sidebar.button"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAccessibilityLabel:", v4);

  -[BrowserRootViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_sidebarTrailingButton"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  accessibilityLocalizedString(CFSTR("tab.group.button"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAccessibilityLabel:", v6);

}

- (BOOL)accessibilityPerformEscape
{
  void *v2;
  int v3;

  -[BrowserRootViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_sidebarContentDimmingView"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "_accessibilityViewIsVisible");

  if (v3)
    AXPerformSafeBlock();
  return v3;
}

uint64_t __68__BrowserRootViewControllerAccessibility_accessibilityPerformEscape__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "sidebarDimmingViewDismiss:", 0);
}

- (void)sidebarDimmingViewDismiss:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BrowserRootViewControllerAccessibility;
  -[BrowserRootViewControllerAccessibility sidebarDimmingViewDismiss:](&v3, sel_sidebarDimmingViewDismiss_, a3);
  UIAccessibilityPostNotification(*MEMORY[0x24BDF7328], 0);
}

- (id)_accessibilitySpeakThisViews
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  objc_super v8;

  -[BrowserRootViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("browserController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_accessibilitySpeakThisViews");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = v4;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)BrowserRootViewControllerAccessibility;
    -[BrowserRootViewControllerAccessibility _accessibilitySpeakThisViews](&v8, sel__accessibilitySpeakThisViews);
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return v6;
}

- (BOOL)accessibilityScroll:(int64_t)a3
{
  objc_super v6;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t);
  void *v10;
  BrowserRootViewControllerAccessibility *v11;

  if (a3 == 3)
  {
    v7 = MEMORY[0x24BDAC760];
    v8 = 3221225472;
    v9 = __62__BrowserRootViewControllerAccessibility_accessibilityScroll___block_invoke;
    v10 = &unk_25029F0D0;
    v11 = self;
    AXPerformSafeBlock();
  }
  v6.receiver = self;
  v6.super_class = (Class)BrowserRootViewControllerAccessibility;
  return -[BrowserRootViewControllerAccessibility accessibilityScroll:](&v6, sel_accessibilityScroll_, a3);
}

void __62__BrowserRootViewControllerAccessibility_accessibilityScroll___block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "safeValueForKeyPath:", CFSTR("capsuleViewController.capsuleCollectionView"));
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setSelectedItemState:animated:", 0, 0);

}

@end
