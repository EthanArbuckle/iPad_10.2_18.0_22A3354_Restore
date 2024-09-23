@implementation SFScreenTimeOverlayViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SFScreenTimeOverlayViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("SFScreenTimeOverlayViewController"), CFSTR("UIViewController"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SFScreenTimeOverlayViewController"), CFSTR("showBlockingViewControllerForURL:withPolicy:animated:"), "@", "q", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SFScreenTimeOverlayViewController"), CFSTR("hideBlockingViewControllerWithCompletionHandler:"), "v", "@?", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SFScreenTimeOverlayViewController"), CFSTR("_blockingViewController"), "STBlockingViewController");

}

- (void)_accessibilityLoadAccessibilityInformation
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SFScreenTimeOverlayViewControllerAccessibility;
  -[SFScreenTimeOverlayViewControllerAccessibility _accessibilityLoadAccessibilityInformation](&v3, sel__accessibilityLoadAccessibilityInformation);
  -[SFScreenTimeOverlayViewControllerAccessibility _axHideWebView:](self, "_axHideWebView:", -[SFScreenTimeOverlayViewControllerAccessibility _axShouldHideWebView](self, "_axShouldHideWebView"));
}

- (BOOL)_axShouldHideWebView
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_opt_class();
  -[SFScreenTimeOverlayViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_blockingViewController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "window");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = v6 != 0;

  return (char)v3;
}

- (void)_axHideWebView:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  char v17;
  _BYTE v18[128];
  uint64_t v19;

  v3 = a3;
  v19 = *MEMORY[0x24BDAC8D0];
  v17 = 0;
  objc_opt_class();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  objc_msgSend(v5, "superview", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "subviews");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v14 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        if (objc_msgSend(v12, "_accessibilityHasDescendantOfType:", MEMORY[0x23491571C](CFSTR("WKWebView")))&& objc_msgSend(v12, "accessibilityElementsHidden") != v3)
        {
          objc_msgSend(v12, "setAccessibilityElementsHidden:", v3);
          AXPerformBlockOnMainThreadAfterDelay();
        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
    }
    while (v9);
  }

}

void __65__SFScreenTimeOverlayViewControllerAccessibility__axHideWebView___block_invoke()
{
  UIAccessibilityPostNotification(*MEMORY[0x24BDF7328], 0);
}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SFScreenTimeOverlayViewControllerAccessibility;
  -[SFScreenTimeOverlayViewControllerAccessibility viewDidAppear:](&v4, sel_viewDidAppear_, a3);
  -[SFScreenTimeOverlayViewControllerAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

- (void)viewWillDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SFScreenTimeOverlayViewControllerAccessibility;
  -[SFScreenTimeOverlayViewControllerAccessibility viewWillDisappear:](&v4, sel_viewWillDisappear_, a3);
  -[SFScreenTimeOverlayViewControllerAccessibility _axHideWebView:](self, "_axHideWebView:", 0);
}

- (id)showBlockingViewControllerForURL:(id)a3 withPolicy:(int64_t)a4 animated:(BOOL)a5
{
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SFScreenTimeOverlayViewControllerAccessibility;
  -[SFScreenTimeOverlayViewControllerAccessibility showBlockingViewControllerForURL:withPolicy:animated:](&v8, sel_showBlockingViewControllerForURL_withPolicy_animated_, a3, a4, a5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFScreenTimeOverlayViewControllerAccessibility _axHideWebView:](self, "_axHideWebView:", 1);
  return v6;
}

- (void)hideBlockingViewControllerWithCompletionHandler:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SFScreenTimeOverlayViewControllerAccessibility;
  -[SFScreenTimeOverlayViewControllerAccessibility hideBlockingViewControllerWithCompletionHandler:](&v4, sel_hideBlockingViewControllerWithCompletionHandler_, a3);
  -[SFScreenTimeOverlayViewControllerAccessibility _axHideWebView:](self, "_axHideWebView:", 0);
}

@end
