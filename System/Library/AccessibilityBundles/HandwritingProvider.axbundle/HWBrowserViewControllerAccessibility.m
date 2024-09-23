@implementation HWBrowserViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("HWBrowserViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (double)_axLastContentOffsetX
{
  double result;

  __UIAccessibilityGetAssociatedCGFloat();
  return result;
}

- (void)_axSetLastContentOffsetX:(double)a3
{
  __UIAccessibilitySetAssociatedCGFloat();
}

- (BOOL)_axShouldAnnounceScroll
{
  return __UIAccessibilityGetAssociatedBool();
}

- (void)_axSetShouldAnnounceScroll:(BOOL)a3
{
  __UIAccessibilitySetAssociatedBool();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("HWBrowserViewController"), CFSTR("UIViewController"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HWBrowserViewController"), CFSTR("canvasView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HWBrowserViewController"), CFSTR("currentHandwritingItem"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HWBrowserViewController"), CFSTR("handwritingScrollView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HWBrowserViewController"), CFSTR("_clear:"), "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HWBrowserViewController"), CFSTR("_undo:"), "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HWBrowserViewController"), CFSTR("_scrollPageToLeft:"), "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HWBrowserViewController"), CFSTR("_scrollPageToRight:"), "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HWBrowserViewController"), CFSTR("_inkViewTouchesEndedNotification:"), "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HWBrowserViewController"), CFSTR("scrollViewDidScroll:"), "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HWBrowserViewController"), CFSTR("scrollViewDidEndScrollingAnimation:"), "v", "@", 0);

}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HWBrowserViewControllerAccessibility;
  -[HWBrowserViewControllerAccessibility _accessibilityLoadAccessibilityInformation](&v5, sel__accessibilityLoadAccessibilityInformation);
  -[HWBrowserViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("view"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAccessibilityViewIsModal:", AXDeviceIsPhoneIdiom());
  -[HWBrowserViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("handwritingScrollView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_accessibilitySetVisibleContentInset:", *MEMORY[0x24BDF7718], *(double *)(MEMORY[0x24BDF7718] + 8), *(double *)(MEMORY[0x24BDF7718] + 16), *(double *)(MEMORY[0x24BDF7718] + 24));

}

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HWBrowserViewControllerAccessibility;
  -[HWBrowserViewControllerAccessibility viewDidLoad](&v3, sel_viewDidLoad);
  -[HWBrowserViewControllerAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

- (void)setCurrentHandwritingItem:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)HWBrowserViewControllerAccessibility;
  -[HWBrowserViewControllerAccessibility setCurrentHandwritingItem:](&v4, sel_setCurrentHandwritingItem_, a3);
  -[HWBrowserViewControllerAccessibility _axUpdateAndFocusCanvas](self, "_axUpdateAndFocusCanvas");
  -[HWBrowserViewControllerAccessibility _axSetShouldAnnounceScroll:](self, "_axSetShouldAnnounceScroll:", 0);
}

- (void)_clear:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)HWBrowserViewControllerAccessibility;
  -[HWBrowserViewControllerAccessibility _clear:](&v4, sel__clear_, a3);
  -[HWBrowserViewControllerAccessibility _axUpdateAndFocusCanvas](self, "_axUpdateAndFocusCanvas");
}

- (void)_undo:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)HWBrowserViewControllerAccessibility;
  -[HWBrowserViewControllerAccessibility _undo:](&v4, sel__undo_, a3);
  -[HWBrowserViewControllerAccessibility _axSetShouldAnnounceScroll:](self, "_axSetShouldAnnounceScroll:", 0);
}

- (void)_scrollPageToLeft:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v7;
  char v8;

  v4 = a3;
  v8 = 0;
  objc_opt_class();
  -[HWBrowserViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("handwritingScrollView"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "contentOffset");
  -[HWBrowserViewControllerAccessibility _axSetLastContentOffsetX:](self, "_axSetLastContentOffsetX:");
  v7.receiver = self;
  v7.super_class = (Class)HWBrowserViewControllerAccessibility;
  -[HWBrowserViewControllerAccessibility _scrollPageToLeft:](&v7, sel__scrollPageToLeft_, v4);

}

- (void)_scrollPageToRight:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v7;
  char v8;

  v4 = a3;
  v8 = 0;
  objc_opt_class();
  -[HWBrowserViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("handwritingScrollView"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "contentOffset");
  -[HWBrowserViewControllerAccessibility _axSetLastContentOffsetX:](self, "_axSetLastContentOffsetX:");
  v7.receiver = self;
  v7.super_class = (Class)HWBrowserViewControllerAccessibility;
  -[HWBrowserViewControllerAccessibility _scrollPageToRight:](&v7, sel__scrollPageToRight_, v4);

}

- (void)scrollViewDidScroll:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)HWBrowserViewControllerAccessibility;
  -[HWBrowserViewControllerAccessibility scrollViewDidScroll:](&v4, sel_scrollViewDidScroll_, a3);
  -[HWBrowserViewControllerAccessibility _axAnnounceHandwritingViewScroll](self, "_axAnnounceHandwritingViewScroll");
}

- (void)scrollViewDidEndScrollingAnimation:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)HWBrowserViewControllerAccessibility;
  -[HWBrowserViewControllerAccessibility scrollViewDidEndScrollingAnimation:](&v4, sel_scrollViewDidEndScrollingAnimation_, a3);
  -[HWBrowserViewControllerAccessibility _axSetShouldAnnounceScroll:](self, "_axSetShouldAnnounceScroll:", 1);
}

- (void)_inkViewTouchesEndedNotification:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)HWBrowserViewControllerAccessibility;
  -[HWBrowserViewControllerAccessibility _inkViewTouchesEndedNotification:](&v4, sel__inkViewTouchesEndedNotification_, a3);
  -[HWBrowserViewControllerAccessibility _axUpdateAndFocusCanvas](self, "_axUpdateAndFocusCanvas");
}

- (void)_axUpdateAndFocusCanvas
{
  id v2;

  -[HWBrowserViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("canvasView"));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], v2);

}

- (void)_axAnnounceHandwritingViewScroll
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  __CFString *v9;
  void *v10;

  objc_opt_class();
  -[HWBrowserViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("handwritingScrollView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "contentOffset");
  v6 = v5;
  -[HWBrowserViewControllerAccessibility _axLastContentOffsetX](self, "_axLastContentOffsetX");
  if (v6 != v7)
  {
    v8 = v7;
    if (-[HWBrowserViewControllerAccessibility _axShouldAnnounceScroll](self, "_axShouldAnnounceScroll"))
    {
      if (v6 >= v8)
        v9 = CFSTR("scrolled.right");
      else
        v9 = CFSTR("scrolled.left");
      accessibilityLocalizedString(v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      UIAccessibilitySpeak();

      UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], 0);
    }
  }

}

@end
