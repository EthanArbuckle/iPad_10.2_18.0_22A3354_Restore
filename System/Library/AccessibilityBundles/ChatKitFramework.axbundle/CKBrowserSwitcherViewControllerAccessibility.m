@implementation CKBrowserSwitcherViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CKBrowserSwitcherViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)_axIsScrollingByDragGesture
{
  return __UIAccessibilityGetAssociatedBool();
}

- (void)_axSetIsScrollingByDragGesture:(BOOL)a3
{
  __UIAccessibilitySetAssociatedBool();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("CKBrowserSwitcherViewController"), CFSTR("UIViewController"));
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("CKBrowserSwitcherViewController"), CFSTR("_currentViewController"), "UIViewController<CKBrowserViewControllerProtocol>");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKBrowserSwitcherViewController"), CFSTR("setCurrentViewController:"), "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKBrowserSwitcherViewController"), CFSTR("browserTransitionCoordinatorWillCollapseOrDismiss:withReason:"), "v", "@", "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKBrowserSwitcherViewController"), CFSTR("browserTransitionCoordinatorWillTransitionOrPresentToFullscreen:withReason:"), "v", "@", "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("CKBrowserSwitcherViewController"), CFSTR("_currentVisiblePlugin"), "IMBalloonPlugin");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("IMBalloonPlugin"), CFSTR("browserDisplayName"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKBrowserSwitcherViewController"), CFSTR("grabberView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("CKAppGrabberView"), CFSTR("_closeButton"), "UIButton");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKBrowserSwitcherViewController"), CFSTR("appGrabberViewCloseButtonTapped:"), "v", "@", 0);

}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CKBrowserSwitcherViewControllerAccessibility;
  -[CKBrowserSwitcherViewControllerAccessibility _accessibilityLoadAccessibilityInformation](&v5, sel__accessibilityLoadAccessibilityInformation);
  objc_opt_class();
  -[CKBrowserSwitcherViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("collectionView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "_accessibilitySetBoolValue:forKey:", 1, CFSTR("shouldBypassCollectionViewAX"));
  objc_msgSend(v4, "_accessibilitySetOpaqueElementScrollsContentIntoView:", 0);

}

- (void)loadView
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CKBrowserSwitcherViewControllerAccessibility;
  -[CKBrowserSwitcherViewControllerAccessibility loadView](&v3, sel_loadView);
  -[CKBrowserSwitcherViewControllerAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

- (void)setCurrentViewController:(id)a3
{
  id v4;
  id v5;
  UIAccessibilityNotifications v6;
  void *v7;
  objc_super v8;

  v4 = a3;
  -[CKBrowserSwitcherViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_currentViewController"));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v8.receiver = self;
  v8.super_class = (Class)CKBrowserSwitcherViewControllerAccessibility;
  -[CKBrowserSwitcherViewControllerAccessibility setCurrentViewController:](&v8, sel_setCurrentViewController_, v4);
  if (v5 != v4
    && -[CKBrowserSwitcherViewControllerAccessibility _axIsScrollingByDragGesture](self, "_axIsScrollingByDragGesture"))
  {
    v6 = *MEMORY[0x24BDF72C8];
    objc_msgSend(v4, "safeValueForKey:", CFSTR("view"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    UIAccessibilityPostNotification(v6, v7);

    -[CKBrowserSwitcherViewControllerAccessibility _axSetIsScrollingByDragGesture:](self, "_axSetIsScrollingByDragGesture:", 0);
  }

}

- (void)scrollViewWillBeginDragging:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CKBrowserSwitcherViewControllerAccessibility;
  -[CKBrowserSwitcherViewControllerAccessibility scrollViewWillBeginDragging:](&v4, sel_scrollViewWillBeginDragging_, a3);
  -[CKBrowserSwitcherViewControllerAccessibility _axSetIsScrollingByDragGesture:](self, "_axSetIsScrollingByDragGesture:", 1);
}

- (BOOL)accessibilityPerformEscape
{
  void *v3;
  void *v4;
  char v5;
  objc_super v7;

  -[CKBrowserSwitcherViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("grabberView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeValueForKey:", CFSTR("_closeButton"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "_accessibilityViewIsVisible"))
  {
    v5 = objc_opt_respondsToSelector();

    if ((v5 & 1) != 0)
    {
      -[CKBrowserSwitcherViewControllerAccessibility appGrabberViewCloseButtonTapped:](self, "appGrabberViewCloseButtonTapped:", 0);
      UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], 0);
      return 1;
    }
  }
  else
  {

  }
  v7.receiver = self;
  v7.super_class = (Class)CKBrowserSwitcherViewControllerAccessibility;
  return -[CKBrowserSwitcherViewControllerAccessibility accessibilityPerformEscape](&v7, sel_accessibilityPerformEscape);
}

- (void)browserTransitionCoordinatorWillTransitionOrPresentToFullscreen:(id)a3 withReason:(int64_t)a4
{
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CKBrowserSwitcherViewControllerAccessibility;
  -[CKBrowserSwitcherViewControllerAccessibility browserTransitionCoordinatorWillTransitionOrPresentToFullscreen:withReason:](&v6, sel_browserTransitionCoordinatorWillTransitionOrPresentToFullscreen_withReason_, a3, a4);
  -[CKBrowserSwitcherViewControllerAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("grabberView"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_accessibilitySetBoolValue:forKey:", 1, CFSTR("_axBrowserIsExpanded"));

}

- (void)browserTransitionCoordinatorWillCollapseOrDismiss:(id)a3 withReason:(int64_t)a4
{
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CKBrowserSwitcherViewControllerAccessibility;
  -[CKBrowserSwitcherViewControllerAccessibility browserTransitionCoordinatorWillCollapseOrDismiss:withReason:](&v6, sel_browserTransitionCoordinatorWillCollapseOrDismiss_withReason_, a3, a4);
  -[CKBrowserSwitcherViewControllerAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("grabberView"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_accessibilitySetBoolValue:forKey:", 0, CFSTR("_axBrowserIsExpanded"));

}

- (id)accessibilityScrollStatusForScrollView:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v4 = a3;
  objc_msgSend(v4, "_accessibilityPageIndex");
  objc_msgSend(v4, "_accessibilityPageCount");
  v5 = (void *)MEMORY[0x24BDD17C8];
  accessibilityLocalizedString(CFSTR("browser.page.format"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  AXFormatInteger();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  AXFormatInteger();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringWithFormat:", v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[CKBrowserSwitcherViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_currentVisiblePlugin"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  objc_msgSend(v10, "safeValueForKey:", CFSTR("browserDisplayName"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  __UIAXStringForVariables();
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

@end
