@implementation BrowserControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("BrowserController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("BrowserController"), CFSTR("_rootViewController"), "BrowserRootViewController");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("BrowserController"), CFSTR("tabDocumentDidCompleteCheckForAppBanner:"), "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("TabDocument"), CFSTR("appBanner"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("BrowserController"), CFSTR("browserViewController:didCreateUnifiedBar:"), "v", "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("BrowserController"), CFSTR("setShowingReader:animated:"), "v", "B", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("BrowserController"), CFSTR("isShowingReader"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("BrowserController"), CFSTR("tabController"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("BrowserController"), CFSTR("_initSubviews"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("BrowserController"), CFSTR("_tabController"), "TabController");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("BrowserController"), CFSTR("scrollViewDidScrollToTop:"), "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("BrowserController"), CFSTR("scrollViewShouldScrollToTop:"), "B", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("TabController"), CFSTR("activeTabDocument"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("TabDocument"), CFSTR("frontWebView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("BrowserController"), CFSTR("updateInsetsForBackgroundWebView:"), "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("BrowserController"), CFSTR("isPrivateBrowsingEnabled"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("BrowserController"), CFSTR("_scrollView"), "UIScrollView");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("BrowserRootViewController"), CFSTR("documentAndTopBarsContainerView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("TabController"), CFSTR("_tabCollectionViewManager"), "TabCollectionViewManager");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("BrowserController"), CFSTR("webView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("BrowserController"), CFSTR("rootViewController"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("BrowserRootViewController"), CFSTR("navigationBar"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("BrowserRootViewController"), CFSTR("unifiedBar"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SFBarRegistration"), CFSTR("_bookmarksItem"), "UIBarButtonItem");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("BrowserController"), CFSTR("_barManager"), "_SFBarManager");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("_SFBarManager"), CFSTR("_barToRegistrationMap"), "NSMapTable");

}

- (void)browserViewController:(id)a3 didCreateUnifiedBar:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)BrowserControllerAccessibility;
  -[BrowserControllerAccessibility browserViewController:didCreateUnifiedBar:](&v5, sel_browserViewController_didCreateUnifiedBar_, a3, a4);
  -[BrowserControllerAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

- (id)accessibilityActiveTabDocument
{
  void *v2;
  void *v3;
  void *v4;

  -[BrowserControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("tabController"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilitySafeClass();
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "safeValueForKey:", CFSTR("activeTabDocument"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_accessibilitySpeakThisViews
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[BrowserControllerAccessibility accessibilityCurrentWebView](self, "accessibilityCurrentWebView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    objc_msgSend(v3, "addObject:", v4);

  return v3;
}

- (id)accessibilityCurrentWebView
{
  void *v2;
  void *v3;
  void *v4;

  -[BrowserControllerAccessibility accessibilityActiveTabDocument](self, "accessibilityActiveTabDocument");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilitySafeClass();
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "safeValueForKey:", CFSTR("frontWebView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)scrollViewShouldScrollToTop:(id)a3
{
  id v4;
  _BOOL4 v5;
  objc_super v7;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)BrowserControllerAccessibility;
  v5 = -[BrowserControllerAccessibility scrollViewShouldScrollToTop:](&v8, sel_scrollViewShouldScrollToTop_, v4);
  if (!UIAccessibilityIsVoiceOverRunning())
  {
    if (!UIAccessibilityIsSwitchControlRunning() || v5)
      goto LABEL_6;
LABEL_5:
    v7.receiver = self;
    v7.super_class = (Class)BrowserControllerAccessibility;
    LOBYTE(v5) = -[BrowserControllerAccessibility scrollViewShouldScrollToTop:](&v7, sel_scrollViewShouldScrollToTop_, v4);
    goto LABEL_6;
  }
  if (!v5)
    goto LABEL_5;
  LOBYTE(v5) = 1;
LABEL_6:

  return v5;
}

- (void)scrollViewDidScrollToTop:(id)a3
{
  id v4;
  id v5;
  objc_super v6;

  v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)BrowserControllerAccessibility;
  -[BrowserControllerAccessibility scrollViewDidScrollToTop:](&v6, sel_scrollViewDidScrollToTop_, v4);
  v5 = v4;
  AXPerformBlockOnMainThreadAfterDelay();

}

void __59__BrowserControllerAccessibility_scrollViewDidScrollToTop___block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "_accessibilityScrollStatus");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  UIAccessibilityPostNotification(*MEMORY[0x24BDF71E8], v1);

}

- (void)setShowingReader:(BOOL)a3 animated:(BOOL)a4
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)BrowserControllerAccessibility;
  -[BrowserControllerAccessibility setShowingReader:animated:](&v4, sel_setShowingReader_animated_, a3, a4);
  UIAccessibilityPostNotification(*MEMORY[0x24BDF7328], 0);
}

- (void)_axUpdateVisibleContentInset
{
  void *v3;
  void *v4;

  objc_opt_class();
  -[BrowserControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_scrollView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[BrowserControllerAccessibility _axUpdateVisibleContentInsetForScrollView:](self, "_axUpdateVisibleContentInsetForScrollView:", v4);
}

- (void)_axUpdateVisibleContentInsetForScrollView:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  void *v21;
  void *v22;
  void *v23;
  double MaxY;
  CGRect v25;
  CGRect v26;

  v4 = a3;
  objc_msgSend(v4, "contentInset");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  objc_opt_class();
  -[BrowserControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("webView"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "bounds");
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v20 = v19;
  objc_opt_class();
  -[BrowserControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("rootViewController"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "safeValueForKey:", CFSTR("navigationBar"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v23, "bounds");
  objc_msgSend(v12, "convertRect:fromView:", v23);
  MaxY = CGRectGetMaxY(v25);
  v26.origin.x = v14;
  v26.origin.y = v16;
  v26.size.width = v18;
  v26.size.height = v20;
  objc_msgSend(v4, "_accessibilitySetVisibleContentInset:", fmax(MaxY - CGRectGetMinY(v26), 0.0), v6, v8, v10);

}

- (void)updateInsetsForBackgroundWebView:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)BrowserControllerAccessibility;
  v4 = a3;
  -[BrowserControllerAccessibility updateInsetsForBackgroundWebView:](&v6, sel_updateInsetsForBackgroundWebView_, v4);
  objc_msgSend(v4, "scrollView", v6.receiver, v6.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[BrowserControllerAccessibility _axUpdateVisibleContentInsetForScrollView:](self, "_axUpdateVisibleContentInsetForScrollView:", v5);
}

- (void)_initSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BrowserControllerAccessibility;
  -[BrowserControllerAccessibility _initSubviews](&v3, sel__initSubviews);
  -[BrowserControllerAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

- (void)tabDocumentDidCompleteCheckForAppBanner:(id)a3
{
  id v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)BrowserControllerAccessibility;
  v3 = a3;
  -[BrowserControllerAccessibility tabDocumentDidCompleteCheckForAppBanner:](&v5, sel_tabDocumentDidCompleteCheckForAppBanner_, v3);
  objc_msgSend(v3, "safeUIViewForKey:", CFSTR("appBanner"), v5.receiver, v5.super_class);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "_accessibilitySetSortPriority:", 51);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  char v19;
  objc_super v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v20.receiver = self;
  v20.super_class = (Class)BrowserControllerAccessibility;
  -[BrowserControllerAccessibility _accessibilityLoadAccessibilityInformation](&v20, sel__accessibilityLoadAccessibilityInformation);
  -[BrowserControllerAccessibility _axUpdateVisibleContentInset](self, "_axUpdateVisibleContentInset");
  -[BrowserControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_rootViewController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_accessibilityLoadAccessibilityInformation");
  objc_msgSend(v3, "safeValueForKey:", CFSTR("documentAndTopBarsContainerView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "accessibilitySetIdentification:", CFSTR("PageView"));

  v19 = 0;
  objc_opt_class();
  -[BrowserControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_barManager"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "safeValueForKey:", CFSTR("_barToRegistrationMap"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  objc_msgSend(v7, "objectEnumerator", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v21, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v16 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * i), "_accessibilityLoadAccessibilityInformation");
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v21, 16);
    }
    while (v10);
  }

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addObserver:selector:name:object:", self, sel__accessibilityKeyboardDidHide_, *MEMORY[0x24BDF79F8], 0);

  objc_msgSend(v3, "safeValueForKey:", CFSTR("unifiedBar"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "_accessibilitySetSortPriority:", 50);

}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x24BDF79F8], 0);

  v4.receiver = self;
  v4.super_class = (Class)BrowserControllerAccessibility;
  -[BrowserControllerAccessibility dealloc](&v4, sel_dealloc);
}

@end
