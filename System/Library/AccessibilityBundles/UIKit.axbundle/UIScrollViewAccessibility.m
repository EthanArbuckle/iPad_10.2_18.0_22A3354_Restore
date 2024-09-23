@implementation UIScrollViewAccessibility

- (void)_accessibilitySetNavigationControllerInset:(UIEdgeInsets)a3
{
  id v4;

  v4 = (id)objc_msgSend(MEMORY[0x24BDD1968], "valueWithUIEdgeInsets:", a3.top, a3.left, a3.bottom, a3.right);
  objc_setAssociatedObject(self, &_NavigationControllerInsetStorage, v4, (void *)0x301);

}

- (void)_didEndDirectManipulationWithScrubbingDirection:(int64_t)a3
{
  uint64_t v3;
  objc_super v4;
  int64_t v5;
  SEL v6;
  UIScrollViewAccessibility *v7;

  v7 = self;
  v6 = a2;
  v5 = a3;
  v4.receiver = self;
  v4.super_class = (Class)UIScrollViewAccessibility;
  -[UIScrollViewAccessibility _didEndDirectManipulationWithScrubbingDirection:](&v4, sel__didEndDirectManipulationWithScrubbingDirection_, a3);
  if (v5 == 2 || v5 == 1)
  {
    if (v5 == 2)
      v3 = 2;
    else
      v3 = 1;
    -[UIScrollViewAccessibility _axAnnounceScrubForDirection:](v7, v3);
  }
}

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UIScrollView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)_axVerticalScrollBar
{
  return objc_getAssociatedObject(self, &__UIScrollViewAccessibility___axVerticalScrollBar);
}

- (void)_axSetVerticalScrollBar:(id)a3
{
  id location[3];

  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  __UIAccessibilitySetAssociatedObject();
  objc_storeStrong(location, 0);
}

- (id)_axHorizontalScrollBar
{
  return objc_getAssociatedObject(self, &__UIScrollViewAccessibility___axHorizontalScrollBar);
}

- (void)_axSetHorizontalScrollBar:(id)a3
{
  id location[3];

  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  __UIAccessibilitySetAssociatedObject();
  objc_storeStrong(location, 0);
}

- (BOOL)_axAlwaysScrollsContentIntoView
{
  return __UIAccessibilityGetAssociatedBool() & 1;
}

- (void)_axSetAlwaysScrollsContentIntoView:(BOOL)a3
{
  __UIAccessibilitySetAssociatedBool();
}

- (id)_axOverrideShowsVerticalScrollBars
{
  return objc_getAssociatedObject(self, &__UIScrollViewAccessibility___axOverrideShowsVerticalScrollBars);
}

- (void)_axSetOverrideShowsVerticalScrollBars:(id)a3
{
  id location[3];

  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  __UIAccessibilitySetAssociatedObject();
  objc_storeStrong(location, 0);
}

- (id)_axOverrideShowsHorizontallScrollBars
{
  return objc_getAssociatedObject(self, &__UIScrollViewAccessibility___axOverrideShowsHorizontallScrollBars);
}

- (void)_axSetOverrideShowsHorizontallScrollBars:(id)a3
{
  id location[3];

  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  __UIAccessibilitySetAssociatedObject();
  objc_storeStrong(location, 0);
}

- (id)_axLastEdgeBoundaries
{
  return objc_getAssociatedObject(self, &__UIScrollViewAccessibility___axLastEdgeBoundaries);
}

- (void)_axSetLastEdgeBoundaries:(id)a3
{
  id location[3];

  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  __UIAccessibilitySetAssociatedObject();
  objc_storeStrong(location, 0);
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  const char *v3;
  const __CFString *v4;
  const char *v5;
  const __CFString *v6;
  const char *v7;
  const char *v8;
  const char *v9;
  const __CFString *v10;
  const char *v11;
  id v12;
  id *v13;
  id location[3];

  location[2] = a1;
  location[1] = (id)a2;
  v13 = location;
  v12 = 0;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v10 = CFSTR("UIScrollView");
  v4 = CFSTR("_staticScrollBar");
  objc_msgSend(location[0], "validateClass:hasInstanceVariable:withType:");
  v3 = "UIView<_UIScrollViewScrollIndicator>";
  objc_msgSend(location[0], "validateClass:hasInstanceVariable:withType:", CFSTR("UIScrollView"), CFSTR("_verticalScrollIndicator"));
  objc_msgSend(location[0], "validateClass:hasInstanceVariable:withType:", CFSTR("UIScrollView"), CFSTR("_horizontalScrollIndicator"), "UIView<_UIScrollViewScrollIndicator>");
  v6 = CFSTR("UIView");
  objc_msgSend(location[0], "validateClass:isKindOfClass:", CFSTR("_UIScrollViewScrollIndicator"));
  objc_msgSend(location[0], "validateClass:isKindOfClass:", CFSTR("UIScrollView"), CFSTR("UIView"));
  v5 = "@";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIScrollView"), CFSTR("_staticScrollBar"), 0);
  v9 = "v";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v10, CFSTR("setDelegate:"), v5, 0);
  v8 = "{CGPoint=dd}";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v10, CFSTR("_setContentOffset: duration: animationCurve:"), v9, "{CGPoint=dd}", "d", "i", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v10, CFSTR("_notifyDidScroll"), v9, 0);
  v7 = "B";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v10, CFSTR("_forwardsToParentScroller"), 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v6, CFSTR("_defaultFocusRegionFrame"), "{CGRect={CGPoint=dd}{CGSize=dd}}", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v10, CFSTR("_scrollViewDidEndDeceleratingForDelegate"), v9, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v10, CFSTR("_animatedTargetOffset"), v8, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v10, CFSTR("_minimumContentOffset"), v8, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v10, CFSTR("_maximumContentOffset"), v8, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v10, CFSTR("_adjustScrollerIndicators:alwaysShowingThem:"), v9, v7, v7, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v10, CFSTR("_hideScrollIndicators"), v9, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v10, CFSTR("_newScrollOffsetForScrubReturningAnimated:"), v8, "^B", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v10, CFSTR("_didEndDirectManipulationWithScrubbingDirection:"), v9, "q", 0);
  v11 = "{UIEdgeInsets=dddd}";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v10, CFSTR("_effectiveVerticalScrollIndicatorInsets"), 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v10, CFSTR("_effectiveHorizontalScrollIndicatorInsets"), v11, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIPopoverPresentationController"), CFSTR("_additionalSafeAreaInsets"), v11, 0);
  objc_storeStrong(v13, v12);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  objc_super v2;
  SEL v3;
  UIScrollViewAccessibility *v4;

  v4 = self;
  v3 = a2;
  v2.receiver = self;
  v2.super_class = (Class)UIScrollViewAccessibility;
  -[UIScrollViewAccessibility _accessibilityLoadAccessibilityInformation](&v2, sel__accessibilityLoadAccessibilityInformation);
  -[UIScrollViewAccessibility _axAnnotateScrollBars](v4);
}

- (void)_axAnnotateScrollBars
{
  id v1;
  id v2;
  void *v3;

  v3 = a1;
  if (a1)
  {
    v2 = -[UIScrollViewAccessibility _axVerticalScrollIndicator](v3);
    -[_UIScrollViewScrollIndicatorAccessibility setAccessibilityScrollDirection:]((uint64_t)v2);
    -[_UIScrollViewScrollIndicatorAccessibility setAccessibilityScrollIndicatorDelegate:]((uint64_t)v2, v3);
    v1 = -[UIScrollViewAccessibility _axHorizontalScrollIndicator](v3);
    -[_UIScrollViewScrollIndicatorAccessibility setAccessibilityScrollDirection:]((uint64_t)v1);
    -[_UIScrollViewScrollIndicatorAccessibility setAccessibilityScrollIndicatorDelegate:]((uint64_t)v1, v3);
    objc_storeStrong(&v1, 0);
    objc_storeStrong(&v2, 0);
  }
}

- (BOOL)_axShowsVerticalScrollBar
{
  id v2;
  BOOL v4;
  BOOL v5;
  id v6;
  BOOL v7;
  BOOL v9;

  v2 = -[UIScrollViewAccessibility _axOverrideShowsVerticalScrollBars](self, "_axOverrideShowsVerticalScrollBars");
  v7 = v2 == 0;

  if (v7)
  {
    v5 = 0;
    if ((-[UIScrollViewAccessibility showsVerticalScrollIndicator](self, "showsVerticalScrollIndicator") & 1) != 0)
    {
      v4 = 1;
      if (!-[UIScrollViewAccessibility _axBaseScrollUpPageSupported](self))
        return -[UIScrollViewAccessibility _axBaseScrollDownPageSupported](self);
      return v4;
    }
    return v5;
  }
  else
  {
    v6 = -[UIScrollViewAccessibility _axOverrideShowsVerticalScrollBars](self, "_axOverrideShowsVerticalScrollBars");
    v9 = objc_msgSend(v6, "BOOLValue") & 1;

  }
  return v9;
}

- (BOOL)_axBaseScrollUpPageSupported
{
  id v1;
  double v2;
  double v3;
  BOOL v5;
  double v6;
  double v7;

  if (a1)
  {
    v1 = -[UIScrollViewAccessibility _accessibilityFindRefreshControl](a1);
    v5 = v1 == 0;

    if (v5)
    {
      objc_msgSend(a1, "contentOffset");
      v7 = v2;
      v6 = 0.0;
      if ((objc_msgSend(a1, "_accessibilityUseContentInset") & 1) != 0)
      {
        objc_msgSend(a1, "_accessibilityContentInset");
        v6 = 0.0 - v3;
      }
      return v7 > v6;
    }
    else
    {
      return 1;
    }
  }
  else
  {
    return 0;
  }
}

- (BOOL)_axBaseScrollDownPageSupported
{
  void *v1;
  double v2;
  double v3;
  double v4;
  double v5;
  double v7;
  double v8;
  double v9;
  id location[2];
  double v11;
  id v12;
  BOOL v13;

  v12 = a1;
  if (a1)
  {
    objc_msgSend(v12, "_accessibilityContentSize");
    location[1] = v1;
    v11 = v2;
    location[0] = v12;
    objc_msgSend(location[0], "contentOffset");
    v9 = v3;
    objc_msgSend(location[0], "visibleBounds");
    v8 = v4;
    v7 = v11;
    if ((objc_msgSend(v12, "_accessibilityUseContentInset") & 1) != 0)
    {
      objc_msgSend(v12, "_accessibilityContentInset");
      v7 = v11 + v5;
    }
    v13 = v9 + v8 < v7;
    objc_storeStrong(location, 0);
  }
  else
  {
    return 0;
  }
  return v13;
}

- (BOOL)_axShowsHorizontalScrollBar
{
  id v2;
  BOOL v4;
  BOOL v5;
  id v6;
  BOOL v7;
  BOOL v9;

  v2 = -[UIScrollViewAccessibility _axOverrideShowsHorizontallScrollBars](self, "_axOverrideShowsHorizontallScrollBars");
  v7 = v2 == 0;

  if (v7)
  {
    v5 = 0;
    if ((-[UIScrollViewAccessibility showsHorizontalScrollIndicator](self, "showsHorizontalScrollIndicator") & 1) != 0)
    {
      v4 = 1;
      if (!-[UIScrollViewAccessibility _axBaseScrollLeftPageSupported](self))
        return -[UIScrollViewAccessibility _axBaseScrollRightPageSupported](self);
      return v4;
    }
    return v5;
  }
  else
  {
    v6 = -[UIScrollViewAccessibility _axOverrideShowsHorizontallScrollBars](self, "_axOverrideShowsHorizontallScrollBars");
    v9 = objc_msgSend(v6, "BOOLValue") & 1;

  }
  return v9;
}

- (BOOL)_axBaseScrollLeftPageSupported
{
  double v1;

  if (a1)
  {
    objc_msgSend(a1, "contentOffset");
    return v1 < -[UIScrollViewAccessibility _axMaximumContentOffset](a1);
  }
  else
  {
    return 0;
  }
}

- (BOOL)_axBaseScrollRightPageSupported
{
  double v1;

  if (a1)
  {
    objc_msgSend(a1, "contentOffset");
    return v1 > -[UIScrollViewAccessibility _axMinimumContentOffset](a1);
  }
  else
  {
    return 0;
  }
}

- (id)_accessibilityVerticalScrollBarElement
{
  id v2;
  id v4;
  BOOL v5;
  uint64_t v6;
  int v7;
  int v8;
  double (*v9)(uint64_t);
  void *v10;
  id v11;
  id location;
  id v13[2];
  UIScrollViewAccessibility *v14;
  id v15;

  v14 = self;
  v13[1] = (id)a2;
  v2 = -[UIScrollViewAccessibility _axVerticalScrollBar](self, "_axVerticalScrollBar");
  v5 = v2 == 0;

  if (v5)
  {
    if (-[UIScrollViewAccessibility _axShowsVerticalScrollBar](v14, "_axShowsVerticalScrollBar"))
    {
      v13[0] = -[UIScrollBarIndicatorAccessibilityElement initWithAccessibilityContainer:]([UIScrollBarIndicatorAccessibilityElement alloc], "initWithAccessibilityContainer:", v14);
      -[UIScrollBarIndicatorAccessibilityElement setOrientation:]((uint64_t)v13[0], 1);
      objc_initWeak(&location, v14);
      v4 = v13[0];
      v6 = MEMORY[0x24BDAC760];
      v7 = -1073741824;
      v8 = 0;
      v9 = __67__UIScrollViewAccessibility__accessibilityVerticalScrollBarElement__block_invoke;
      v10 = &unk_24FF3DD28;
      objc_copyWeak(&v11, &location);
      objc_msgSend(v4, "_setAccessibilityFrameBlock:", &v6);
      -[UIScrollViewAccessibility _axSetVerticalScrollBar:](v14, "_axSetVerticalScrollBar:", v13[0]);
      v15 = v13[0];
      objc_destroyWeak(&v11);
      objc_destroyWeak(&location);
      objc_storeStrong(v13, 0);
    }
    else
    {
      v15 = 0;
    }
  }
  else
  {
    v15 = -[UIScrollViewAccessibility _axVerticalScrollBar](v14, "_axVerticalScrollBar");
  }
  return v15;
}

double __67__UIScrollViewAccessibility__accessibilityVerticalScrollBarElement__block_invoke(uint64_t a1)
{
  double v1;
  id v3;
  id WeakRetained;
  double v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = (id)objc_msgSend(WeakRetained, "safeUIViewForKey:", CFSTR("_verticalScrollIndicator"));
  objc_msgSend(v3, "accessibilityFrame");
  v5 = v1;

  return v5;
}

- (id)_accessibilityHorizontalScrollBarElement
{
  id v2;
  id v4;
  BOOL v5;
  uint64_t v6;
  int v7;
  int v8;
  double (*v9)(uint64_t);
  void *v10;
  id v11;
  id location;
  id v13[2];
  UIScrollViewAccessibility *v14;
  id v15;

  v14 = self;
  v13[1] = (id)a2;
  v2 = -[UIScrollViewAccessibility _axHorizontalScrollBar](self, "_axHorizontalScrollBar");
  v5 = v2 == 0;

  if (v5)
  {
    if (-[UIScrollViewAccessibility _axShowsHorizontalScrollBar](v14, "_axShowsHorizontalScrollBar"))
    {
      v13[0] = -[UIScrollBarIndicatorAccessibilityElement initWithAccessibilityContainer:]([UIScrollBarIndicatorAccessibilityElement alloc], "initWithAccessibilityContainer:", v14);
      -[UIScrollBarIndicatorAccessibilityElement setOrientation:]((uint64_t)v13[0], 2);
      objc_initWeak(&location, v14);
      v4 = v13[0];
      v6 = MEMORY[0x24BDAC760];
      v7 = -1073741824;
      v8 = 0;
      v9 = __69__UIScrollViewAccessibility__accessibilityHorizontalScrollBarElement__block_invoke;
      v10 = &unk_24FF3DD28;
      objc_copyWeak(&v11, &location);
      objc_msgSend(v4, "_setAccessibilityFrameBlock:", &v6);
      -[UIScrollViewAccessibility _axSetHorizontalScrollBar:](v14, "_axSetHorizontalScrollBar:", v13[0]);
      v15 = v13[0];
      objc_destroyWeak(&v11);
      objc_destroyWeak(&location);
      objc_storeStrong(v13, 0);
    }
    else
    {
      v15 = 0;
    }
  }
  else
  {
    v15 = -[UIScrollViewAccessibility _axHorizontalScrollBar](v14, "_axHorizontalScrollBar");
  }
  return v15;
}

double __69__UIScrollViewAccessibility__accessibilityHorizontalScrollBarElement__block_invoke(uint64_t a1)
{
  double v1;
  id v3;
  id WeakRetained;
  double v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = (id)objc_msgSend(WeakRetained, "safeUIViewForKey:", CFSTR("_horizontalScrollIndicator"));
  objc_msgSend(v3, "accessibilityFrame");
  v5 = v1;

  return v5;
}

- (double)_accessibilityZoomScale
{
  double result;

  -[UIScrollViewAccessibility zoomScale](self, "zoomScale", a2, self);
  return result;
}

- (void)_accessibilityScrollToTopWithAnnouncement:(id)obj touchLocation:(double)a4 originalHandler:(double)a5
{
  id v5;
  objc_super v6;
  uint64_t v7;
  int v8;
  int v9;
  void (*v10)(uint64_t, char);
  void *v11;
  id v12;
  id v13;
  char v14;
  int v15;
  id location;
  char v17;
  id v18;
  double v19;
  double v20;

  v19 = a4;
  v20 = a5;
  v18 = a1;
  v17 = a2 & 1;
  location = 0;
  objc_storeStrong(&location, obj);
  if (v18)
  {
    v5 = v18;
    v7 = MEMORY[0x24BDAC760];
    v8 = -1073741824;
    v9 = 0;
    v10 = __101__UIScrollViewAccessibility__accessibilityScrollToTopWithAnnouncement_touchLocation_originalHandler___block_invoke;
    v11 = &unk_24FF3F1B0;
    v14 = v17 & 1;
    v12 = v18;
    v13 = location;
    v6.receiver = v5;
    v6.super_class = (Class)UIScrollViewAccessibility;
    objc_msgSendSuper2(&v6, sel__scrollToTopFromTouchAtScreenLocation_resultHandler_, &v7, v19, v20);
    objc_storeStrong(&v13, 0);
    objc_storeStrong(&v12, 0);
    v15 = 0;
  }
  else
  {
    v15 = 1;
  }
  objc_storeStrong(&location, 0);
}

void __101__UIScrollViewAccessibility__accessibilityScrollToTopWithAnnouncement_touchLocation_originalHandler___block_invoke(uint64_t a1, char a2)
{
  id v2;
  id v3;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9[2];
  char v10;
  uint64_t v11;

  v11 = a1;
  v10 = a2 & 1;
  v9[1] = (id)a1;
  if ((*(_BYTE *)(a1 + 48) & 1) != 0)
  {
    v9[0] = (id)objc_msgSend(*(id *)(a1 + 32), "safeValueForKey:", CFSTR("delegate"));
    v8 = 0;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v2 = (id)objc_msgSend(*(id *)(a1 + 32), "safeValueForKey:", CFSTR("dataSource"));
      v3 = v8;
      v8 = v2;

    }
    v5 = *(id *)(a1 + 32);
    v6 = v9[0];
    v7 = v8;
    AXPerformBlockOnMainThreadAfterDelay();
    objc_storeStrong(&v7, 0);
    objc_storeStrong(&v6, 0);
    objc_storeStrong(&v5, 0);
    objc_storeStrong(&v8, 0);
    objc_storeStrong(v9, 0);
  }
  if (*(_QWORD *)(a1 + 40))
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __101__UIScrollViewAccessibility__accessibilityScrollToTopWithAnnouncement_touchLocation_originalHandler___block_invoke_2(uint64_t a1)
{
  -[UIScrollViewAccessibility _accessibilityAnnounceDelayedStatus](*(void **)(a1 + 32));
}

- (void)_accessibilityAnnounceDelayedStatus
{
  UIAccessibilityNotifications notification;
  id v2;

  if (a1)
  {
    notification = *MEMORY[0x24BDF71E8];
    v2 = (id)objc_msgSend(a1, "_accessibilityScrollStatus");
    UIAccessibilityPostNotification(notification, v2);

  }
}

- (void)_scrollToTopFromTouchAtScreenLocation:(CGPoint)a3 resultHandler:(id)a4
{
  objc_super v4;
  id location[2];
  UIScrollViewAccessibility *v6;
  CGPoint v7;

  v7 = a3;
  v6 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a4);
  if (UIAccessibilityIsVoiceOverRunning())
  {
    -[UIScrollViewAccessibility _accessibilityScrollToTopWithAnnouncement:touchLocation:originalHandler:](v6, 1, location[0], v7.x, v7.y);
  }
  else
  {
    v4.receiver = v6;
    v4.super_class = (Class)UIScrollViewAccessibility;
    -[UIScrollViewAccessibility _scrollToTopFromTouchAtScreenLocation:resultHandler:](&v4, sel__scrollToTopFromTouchAtScreenLocation_resultHandler_, location[0], v7.x, v7.y);
  }
  objc_storeStrong(location, 0);
}

- (BOOL)_accessibilityScrollingEnabled
{
  id v3;
  id location[2];
  UIScrollViewAccessibility *v5;
  char v6;

  v5 = self;
  location[1] = (id)a2;
  location[0] = (id)-[UIScrollViewAccessibility _accessibilityUserDefinedScrollingEnabled](self, "_accessibilityUserDefinedScrollingEnabled");
  if (location[0])
  {
    v6 = objc_msgSend(location[0], "BOOLValue") & 1;
  }
  else
  {
    v3 = (id)-[UIScrollViewAccessibility safeValueForKey:](v5, "safeValueForKey:", CFSTR("isScrollEnabled"));
    v6 = objc_msgSend(v3, "BOOLValue") & 1;

  }
  objc_storeStrong(location, 0);
  return v6 & 1;
}

- (BOOL)_accessibilityIsScrollAncestor
{
  id v2;
  id v4;
  BOOL v5;
  BOOL v7;

  v2 = (id)-[UIScrollViewAccessibility isAccessibilityUserDefinedScrollAncestor](self, "isAccessibilityUserDefinedScrollAncestor");
  v5 = v2 == 0;

  if (v5)
    return -[UIScrollViewAccessibility _accessibilityScrollingEnabled](self, "_accessibilityScrollingEnabled");
  v4 = (id)-[UIScrollViewAccessibility isAccessibilityUserDefinedScrollAncestor](self, "isAccessibilityUserDefinedScrollAncestor");
  v7 = objc_msgSend(v4, "BOOLValue") & 1;

  return v7;
}

- (CGRect)_accessibilityScrollViewVisibleFrame
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  -[UIScrollViewAccessibility visibleBounds](self, "visibleBounds", 0, 0, 0, 0, a2);
  UIAccessibilityFrameForBounds();
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (id)_accessibilityFirstOpaqueElement
{
  int v3;
  uint64_t v4;
  int v5;
  int v6;
  BOOL (*v7)(uint64_t);
  void *v8;
  UIView *v9;
  id location[2];
  UIView *v11;
  id v12;

  v11 = (UIView *)self;
  location[1] = (id)a2;
  location[0] = (id)objc_msgSend(MEMORY[0x24BEBADC8], "defaultVoiceOverOptions");
  v4 = MEMORY[0x24BDAC760];
  v5 = -1073741824;
  v6 = 0;
  v7 = __61__UIScrollViewAccessibility__accessibilityFirstOpaqueElement__block_invoke;
  v8 = &unk_24FF3E0C0;
  v9 = v11;
  if (v7((uint64_t)&v4))
  {
    v12 = -[UIScrollViewAccessibility _accessibilityFirstLastOpaqueElement:options:](v11, 1, location[0]);
    v3 = 1;
  }
  else
  {
    v3 = 0;
  }
  objc_storeStrong((id *)&v9, 0);
  if (!v3)
    v12 = (id)-[UIView _accessibilityFirstOpaqueElementWithOptions:](v11, "_accessibilityFirstOpaqueElementWithOptions:", location[0]);
  objc_storeStrong(location, 0);
  return v12;
}

BOOL __61__UIScrollViewAccessibility__accessibilityFirstOpaqueElement__block_invoke(uint64_t a1)
{
  objc_class *v1;
  objc_class *v2;
  NSString *v4;
  NSObject *log;
  os_log_type_t type;
  NSString *v7;
  NSString *v8;
  NSString *v9;
  NSString *v10;
  char v11;
  id v12;
  IMP Implementation;
  Method InstanceMethod;
  uint64_t v15;
  uint64_t v16;
  id location;
  dispatch_once_t *v18;
  uint8_t v19[24];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v16 = a1;
  v15 = a1;
  v18 = (dispatch_once_t *)&kUIScrollViewScrollVerticalStorageKey_block_invoke_onceToken;
  location = 0;
  objc_storeStrong(&location, &__block_literal_global_30);
  if (*v18 != -1)
    dispatch_once(v18, location);
  objc_storeStrong(&location, 0);
  v1 = (objc_class *)objc_opt_class();
  InstanceMethod = class_getInstanceMethod(v1, sel__accessibilityFirstOpaqueElement);
  Implementation = 0;
  if (InstanceMethod)
  {
    Implementation = method_getImplementation(InstanceMethod);
  }
  else
  {
    v12 = (id)AXLogCommon();
    v11 = 17;
    if (os_log_type_enabled((os_log_t)v12, OS_LOG_TYPE_FAULT))
    {
      log = v12;
      type = v11;
      v8 = NSStringFromSelector(sel__accessibilityFirstOpaqueElement);
      v4 = v8;
      v10 = v4;
      v2 = (objc_class *)objc_opt_class();
      v7 = NSStringFromClass(v2);
      v9 = v7;
      __os_log_helper_16_2_2_8_64_8_64((uint64_t)v19, (uint64_t)v4, (uint64_t)v9);
      _os_log_fault_impl(&dword_230C4A000, log, type, "Attempted to check for nonexistent method: %@ on class: %@", v19, 0x16u);

      objc_storeStrong((id *)&v9, 0);
      objc_storeStrong((id *)&v10, 0);
    }
    objc_storeStrong(&v12, 0);
  }
  return Implementation != (IMP)kUIScrollViewScrollVerticalStorageKey_block_invoke_BaseImplementation;
}

void __61__UIScrollViewAccessibility__accessibilityFirstOpaqueElement__block_invoke_2(uint64_t a1)
{
  objc_class *v1;
  objc_class *v2;
  NSString *v3;
  NSObject *log;
  os_log_type_t type;
  NSString *v6;
  NSString *v7;
  NSString *v8;
  NSString *v9;
  char v10;
  id v11;
  Method InstanceMethod;
  uint64_t v13;
  uint64_t v14;
  uint8_t v15[24];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v14 = a1;
  v13 = a1;
  v1 = (objc_class *)objc_opt_class();
  InstanceMethod = class_getInstanceMethod(v1, sel__accessibilityFirstOpaqueElement);
  if (InstanceMethod)
  {
    kUIScrollViewScrollVerticalStorageKey_block_invoke_BaseImplementation = (uint64_t)method_getImplementation(InstanceMethod);
  }
  else
  {
    v11 = (id)AXLogCommon();
    v10 = 17;
    if (os_log_type_enabled((os_log_t)v11, OS_LOG_TYPE_FAULT))
    {
      log = v11;
      type = v10;
      v7 = NSStringFromSelector(sel__accessibilityFirstOpaqueElement);
      v3 = v7;
      v9 = v3;
      v2 = (objc_class *)objc_opt_class();
      v6 = NSStringFromClass(v2);
      v8 = v6;
      __os_log_helper_16_2_2_8_64_8_64((uint64_t)v15, (uint64_t)v3, (uint64_t)v8);
      _os_log_fault_impl(&dword_230C4A000, log, type, "Attempted to check for nonexistent method: %@ on class: %@", v15, 0x16u);

      objc_storeStrong((id *)&v8, 0);
      objc_storeStrong((id *)&v9, 0);
    }
    objc_storeStrong(&v11, 0);
  }
}

- (id)_accessibilityFirstLastOpaqueElement:(id)obj options:
{
  uint64_t v3;
  id v4;
  id v5;
  CGFloat v6;
  CGFloat v7;
  CGFloat v8;
  CGFloat v9;
  double v10;
  double v11;
  double v12;
  double v14;
  double v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  id obja;
  uint64_t v21;
  id v22;
  char v23;
  CGRect r2;
  double height;
  _QWORD __b[8];
  id v27;
  CGRect rect;
  CGRect v29;
  id v30;
  char v31;
  int v32;
  id location;
  char v34;
  UIView *v35;
  id v36;
  _BYTE v37[128];
  uint64_t v38;
  CGRect v39;
  CGRect v40;

  v38 = *MEMORY[0x24BDAC8D0];
  v35 = a1;
  v34 = a2 & 1;
  location = 0;
  objc_storeStrong(&location, obj);
  if (v35)
  {
    v31 = 0;
    v23 = 1;
    if ((-[UIView _accessibilityOpaqueElementScrollsContentIntoView](v35, "_accessibilityOpaqueElementScrollsContentIntoView") & 1) == 0)v23 = -[UIView _axAlwaysScrollsContentIntoView](v35, "_axAlwaysScrollsContentIntoView");
    v31 = v23 & 1;
    if ((-[UIView _accessibilityShouldPreventOpaqueScrolling](v35, "_accessibilityShouldPreventOpaqueScrolling") & 1) == 0
      && (v31 & 1) != 0)
    {
      if ((v34 & 1) != 0)
        v3 = 1;
      else
        v3 = 2;
      -[UIView _accessibilityScrollOpaqueElementIntoView:previousScroller:](v35, "_accessibilityScrollOpaqueElementIntoView:previousScroller:", v3, 0);
    }
    v30 = (id)-[UIView _accessibilitySortedElementsWithinWithOptions:](v35, "_accessibilitySortedElementsWithinWithOptions:", location);
    if ((v34 & 1) == 0)
    {
      v22 = (id)objc_msgSend(v30, "reverseObjectEnumerator");
      v4 = (id)objc_msgSend(v22, "allObjects");
      v5 = v30;
      v30 = v4;

    }
    -[UIView visibleBounds](v35, "visibleBounds");
    rect = v39;
    v29 = UIAccessibilityConvertFrameToScreenCoordinates(v39, v35);
    memset(__b, 0, sizeof(__b));
    obja = v30;
    v21 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", __b, v37, 16);
    if (v21)
    {
      v17 = *(_QWORD *)__b[2];
      v18 = 0;
      v19 = v21;
      while (1)
      {
        v16 = v18;
        if (*(_QWORD *)__b[2] != v17)
          objc_enumerationMutation(obja);
        v27 = *(id *)(__b[1] + 8 * v18);
        NSClassFromString(CFSTR("_UIScrollViewScrollIndicator"));
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          objc_msgSend(v27, "accessibilityFrame");
          r2.origin.x = v6;
          r2.origin.y = v7;
          r2.size.width = v8;
          r2.size.height = v9;
          v40 = CGRectIntersection(v29, r2);
          height = v40.size.height;
          if ((objc_msgSend(v27, "_accessibilityIsNotFirstElement") & 1) == 0)
          {
            objc_msgSend(v27, "accessibilityFrame");
            v15 = v10;
            -[UIView _accessibilityVisibleItemDenominator](v35, "_accessibilityVisibleItemDenominator");
            if (height > v15 / v11)
              break;
            v14 = v29.size.height;
            -[UIView _accessibilityVisibleItemDenominator](v35, "_accessibilityVisibleItemDenominator");
            if (height > v14 / v12)
              break;
          }
        }
        ++v18;
        if (v16 + 1 >= v19)
        {
          v18 = 0;
          v19 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", __b, v37, 16);
          if (!v19)
            goto LABEL_24;
        }
      }
      v36 = v27;
      v32 = 1;
    }
    else
    {
LABEL_24:
      v32 = 0;
    }

    if (!v32)
    {
      v36 = 0;
      v32 = 1;
    }
    objc_storeStrong(&v30, 0);
  }
  else
  {
    v36 = 0;
    v32 = 1;
  }
  objc_storeStrong(&location, 0);
  return v36;
}

- (id)_accessibilityFirstOpaqueElementWithOptions:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  int v6;
  int v7;
  BOOL (*v8)(uint64_t);
  void *v9;
  UIView *v10;
  BOOL v11;
  uint64_t v12;
  int v13;
  int v14;
  BOOL (*v15)(uint64_t);
  void *v16;
  UIView *v17;
  BOOL v18;
  id location[2];
  UIView *v20;
  id v21;

  v20 = (UIView *)self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v18 = 0;
  v4 = MEMORY[0x24BDAC760];
  v12 = MEMORY[0x24BDAC760];
  v13 = -1073741824;
  v14 = 0;
  v15 = __73__UIScrollViewAccessibility__accessibilityFirstOpaqueElementWithOptions___block_invoke;
  v16 = &unk_24FF3E0C0;
  v17 = v20;
  v18 = v15((uint64_t)&v12);
  v11 = 0;
  v5 = v4;
  v6 = -1073741824;
  v7 = 0;
  v8 = __73__UIScrollViewAccessibility__accessibilityFirstOpaqueElementWithOptions___block_invoke_287;
  v9 = &unk_24FF3E0C0;
  v10 = v20;
  v11 = v8((uint64_t)&v5);
  if (!v18 || v11)
    v21 = -[UIScrollViewAccessibility _accessibilityFirstLastOpaqueElement:options:](v20, 1, location[0]);
  else
    v21 = (id)-[UIView _accessibilityFirstOpaqueElement](v20, "_accessibilityFirstOpaqueElement");
  objc_storeStrong((id *)&v10, 0);
  objc_storeStrong((id *)&v17, 0);
  objc_storeStrong(location, 0);
  return v21;
}

BOOL __73__UIScrollViewAccessibility__accessibilityFirstOpaqueElementWithOptions___block_invoke(uint64_t a1)
{
  objc_class *v1;
  objc_class *v2;
  NSString *v4;
  NSObject *log;
  os_log_type_t type;
  NSString *v7;
  NSString *v8;
  NSString *v9;
  NSString *v10;
  char v11;
  id v12;
  IMP Implementation;
  Method InstanceMethod;
  uint64_t v15;
  uint64_t v16;
  id location;
  dispatch_once_t *v18;
  uint8_t v19[24];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v16 = a1;
  v15 = a1;
  v18 = (dispatch_once_t *)&kUIScrollViewScrollVerticalStorageKey_block_invoke_2_onceToken;
  location = 0;
  objc_storeStrong(&location, &__block_literal_global_286_0);
  if (*v18 != -1)
    dispatch_once(v18, location);
  objc_storeStrong(&location, 0);
  v1 = (objc_class *)objc_opt_class();
  InstanceMethod = class_getInstanceMethod(v1, sel__accessibilityFirstOpaqueElement);
  Implementation = 0;
  if (InstanceMethod)
  {
    Implementation = method_getImplementation(InstanceMethod);
  }
  else
  {
    v12 = (id)AXLogCommon();
    v11 = 17;
    if (os_log_type_enabled((os_log_t)v12, OS_LOG_TYPE_FAULT))
    {
      log = v12;
      type = v11;
      v8 = NSStringFromSelector(sel__accessibilityFirstOpaqueElement);
      v4 = v8;
      v10 = v4;
      v2 = (objc_class *)objc_opt_class();
      v7 = NSStringFromClass(v2);
      v9 = v7;
      __os_log_helper_16_2_2_8_64_8_64((uint64_t)v19, (uint64_t)v4, (uint64_t)v9);
      _os_log_fault_impl(&dword_230C4A000, log, type, "Attempted to check for nonexistent method: %@ on class: %@", v19, 0x16u);

      objc_storeStrong((id *)&v9, 0);
      objc_storeStrong((id *)&v10, 0);
    }
    objc_storeStrong(&v12, 0);
  }
  return Implementation != (IMP)kUIScrollViewScrollVerticalStorageKey_block_invoke_2_BaseImplementation;
}

void __73__UIScrollViewAccessibility__accessibilityFirstOpaqueElementWithOptions___block_invoke_2(uint64_t a1)
{
  objc_class *v1;
  objc_class *v2;
  NSString *v3;
  NSObject *log;
  os_log_type_t type;
  NSString *v6;
  NSString *v7;
  NSString *v8;
  NSString *v9;
  char v10;
  id v11;
  Method InstanceMethod;
  uint64_t v13;
  uint64_t v14;
  uint8_t v15[24];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v14 = a1;
  v13 = a1;
  v1 = (objc_class *)objc_opt_class();
  InstanceMethod = class_getInstanceMethod(v1, sel__accessibilityFirstOpaqueElement);
  if (InstanceMethod)
  {
    kUIScrollViewScrollVerticalStorageKey_block_invoke_2_BaseImplementation = (uint64_t)method_getImplementation(InstanceMethod);
  }
  else
  {
    v11 = (id)AXLogCommon();
    v10 = 17;
    if (os_log_type_enabled((os_log_t)v11, OS_LOG_TYPE_FAULT))
    {
      log = v11;
      type = v10;
      v7 = NSStringFromSelector(sel__accessibilityFirstOpaqueElement);
      v3 = v7;
      v9 = v3;
      v2 = (objc_class *)objc_opt_class();
      v6 = NSStringFromClass(v2);
      v8 = v6;
      __os_log_helper_16_2_2_8_64_8_64((uint64_t)v15, (uint64_t)v3, (uint64_t)v8);
      _os_log_fault_impl(&dword_230C4A000, log, type, "Attempted to check for nonexistent method: %@ on class: %@", v15, 0x16u);

      objc_storeStrong((id *)&v8, 0);
      objc_storeStrong((id *)&v9, 0);
    }
    objc_storeStrong(&v11, 0);
  }
}

BOOL __73__UIScrollViewAccessibility__accessibilityFirstOpaqueElementWithOptions___block_invoke_287(uint64_t a1)
{
  objc_class *v1;
  objc_class *v2;
  NSString *v4;
  NSObject *log;
  os_log_type_t type;
  NSString *v7;
  NSString *v8;
  NSString *v9;
  NSString *v10;
  char v11;
  id v12;
  IMP Implementation;
  Method InstanceMethod;
  uint64_t v15;
  uint64_t v16;
  id location;
  dispatch_once_t *v18;
  uint8_t v19[24];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v16 = a1;
  v15 = a1;
  v18 = (dispatch_once_t *)&kUIScrollViewScrollVerticalStorageKey_block_invoke_3_onceToken;
  location = 0;
  objc_storeStrong(&location, &__block_literal_global_289);
  if (*v18 != -1)
    dispatch_once(v18, location);
  objc_storeStrong(&location, 0);
  v1 = (objc_class *)objc_opt_class();
  InstanceMethod = class_getInstanceMethod(v1, sel__accessibilityFirstOpaqueElementWithOptions_);
  Implementation = 0;
  if (InstanceMethod)
  {
    Implementation = method_getImplementation(InstanceMethod);
  }
  else
  {
    v12 = (id)AXLogCommon();
    v11 = 17;
    if (os_log_type_enabled((os_log_t)v12, OS_LOG_TYPE_FAULT))
    {
      log = v12;
      type = v11;
      v8 = NSStringFromSelector(sel__accessibilityFirstOpaqueElementWithOptions_);
      v4 = v8;
      v10 = v4;
      v2 = (objc_class *)objc_opt_class();
      v7 = NSStringFromClass(v2);
      v9 = v7;
      __os_log_helper_16_2_2_8_64_8_64((uint64_t)v19, (uint64_t)v4, (uint64_t)v9);
      _os_log_fault_impl(&dword_230C4A000, log, type, "Attempted to check for nonexistent method: %@ on class: %@", v19, 0x16u);

      objc_storeStrong((id *)&v9, 0);
      objc_storeStrong((id *)&v10, 0);
    }
    objc_storeStrong(&v12, 0);
  }
  return Implementation != (IMP)kUIScrollViewScrollVerticalStorageKey_block_invoke_3_BaseImplementation;
}

void __73__UIScrollViewAccessibility__accessibilityFirstOpaqueElementWithOptions___block_invoke_2_288(uint64_t a1)
{
  objc_class *v1;
  objc_class *v2;
  NSString *v3;
  NSObject *log;
  os_log_type_t type;
  NSString *v6;
  NSString *v7;
  NSString *v8;
  NSString *v9;
  char v10;
  id v11;
  Method InstanceMethod;
  uint64_t v13;
  uint64_t v14;
  uint8_t v15[24];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v14 = a1;
  v13 = a1;
  v1 = (objc_class *)objc_opt_class();
  InstanceMethod = class_getInstanceMethod(v1, sel__accessibilityFirstOpaqueElementWithOptions_);
  if (InstanceMethod)
  {
    kUIScrollViewScrollVerticalStorageKey_block_invoke_3_BaseImplementation = (uint64_t)method_getImplementation(InstanceMethod);
  }
  else
  {
    v11 = (id)AXLogCommon();
    v10 = 17;
    if (os_log_type_enabled((os_log_t)v11, OS_LOG_TYPE_FAULT))
    {
      log = v11;
      type = v10;
      v7 = NSStringFromSelector(sel__accessibilityFirstOpaqueElementWithOptions_);
      v3 = v7;
      v9 = v3;
      v2 = (objc_class *)objc_opt_class();
      v6 = NSStringFromClass(v2);
      v8 = v6;
      __os_log_helper_16_2_2_8_64_8_64((uint64_t)v15, (uint64_t)v3, (uint64_t)v8);
      _os_log_fault_impl(&dword_230C4A000, log, type, "Attempted to check for nonexistent method: %@ on class: %@", v15, 0x16u);

      objc_storeStrong((id *)&v8, 0);
      objc_storeStrong((id *)&v9, 0);
    }
    objc_storeStrong(&v11, 0);
  }
}

- (id)_accessibilityLastOpaqueElement
{
  int v3;
  uint64_t v4;
  int v5;
  int v6;
  BOOL (*v7)(uint64_t);
  void *v8;
  UIView *v9;
  id location[2];
  UIView *v11;
  id v12;

  v11 = (UIView *)self;
  location[1] = (id)a2;
  location[0] = (id)objc_msgSend(MEMORY[0x24BEBADC8], "defaultVoiceOverOptions");
  v4 = MEMORY[0x24BDAC760];
  v5 = -1073741824;
  v6 = 0;
  v7 = __60__UIScrollViewAccessibility__accessibilityLastOpaqueElement__block_invoke;
  v8 = &unk_24FF3E0C0;
  v9 = v11;
  if (v7((uint64_t)&v4))
  {
    v12 = -[UIScrollViewAccessibility _accessibilityFirstLastOpaqueElement:options:](v11, 0, location[0]);
    v3 = 1;
  }
  else
  {
    v3 = 0;
  }
  objc_storeStrong((id *)&v9, 0);
  if (!v3)
    v12 = (id)-[UIView _accessibilityLastOpaqueElementWithOptions:](v11, "_accessibilityLastOpaqueElementWithOptions:", location[0]);
  objc_storeStrong(location, 0);
  return v12;
}

BOOL __60__UIScrollViewAccessibility__accessibilityLastOpaqueElement__block_invoke(uint64_t a1)
{
  objc_class *v1;
  objc_class *v2;
  NSString *v4;
  NSObject *log;
  os_log_type_t type;
  NSString *v7;
  NSString *v8;
  NSString *v9;
  NSString *v10;
  char v11;
  id v12;
  IMP Implementation;
  Method InstanceMethod;
  uint64_t v15;
  uint64_t v16;
  id location;
  dispatch_once_t *v18;
  uint8_t v19[24];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v16 = a1;
  v15 = a1;
  v18 = (dispatch_once_t *)&kUIScrollViewScrollVerticalStorageKey_block_invoke_4_onceToken;
  location = 0;
  objc_storeStrong(&location, &__block_literal_global_292);
  if (*v18 != -1)
    dispatch_once(v18, location);
  objc_storeStrong(&location, 0);
  v1 = (objc_class *)objc_opt_class();
  InstanceMethod = class_getInstanceMethod(v1, sel__accessibilityLastOpaqueElement);
  Implementation = 0;
  if (InstanceMethod)
  {
    Implementation = method_getImplementation(InstanceMethod);
  }
  else
  {
    v12 = (id)AXLogCommon();
    v11 = 17;
    if (os_log_type_enabled((os_log_t)v12, OS_LOG_TYPE_FAULT))
    {
      log = v12;
      type = v11;
      v8 = NSStringFromSelector(sel__accessibilityLastOpaqueElement);
      v4 = v8;
      v10 = v4;
      v2 = (objc_class *)objc_opt_class();
      v7 = NSStringFromClass(v2);
      v9 = v7;
      __os_log_helper_16_2_2_8_64_8_64((uint64_t)v19, (uint64_t)v4, (uint64_t)v9);
      _os_log_fault_impl(&dword_230C4A000, log, type, "Attempted to check for nonexistent method: %@ on class: %@", v19, 0x16u);

      objc_storeStrong((id *)&v9, 0);
      objc_storeStrong((id *)&v10, 0);
    }
    objc_storeStrong(&v12, 0);
  }
  return Implementation != (IMP)kUIScrollViewScrollVerticalStorageKey_block_invoke_4_BaseImplementation;
}

void __60__UIScrollViewAccessibility__accessibilityLastOpaqueElement__block_invoke_2(uint64_t a1)
{
  objc_class *v1;
  objc_class *v2;
  NSString *v3;
  NSObject *log;
  os_log_type_t type;
  NSString *v6;
  NSString *v7;
  NSString *v8;
  NSString *v9;
  char v10;
  id v11;
  Method InstanceMethod;
  uint64_t v13;
  uint64_t v14;
  uint8_t v15[24];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v14 = a1;
  v13 = a1;
  v1 = (objc_class *)objc_opt_class();
  InstanceMethod = class_getInstanceMethod(v1, sel__accessibilityLastOpaqueElement);
  if (InstanceMethod)
  {
    kUIScrollViewScrollVerticalStorageKey_block_invoke_4_BaseImplementation = (uint64_t)method_getImplementation(InstanceMethod);
  }
  else
  {
    v11 = (id)AXLogCommon();
    v10 = 17;
    if (os_log_type_enabled((os_log_t)v11, OS_LOG_TYPE_FAULT))
    {
      log = v11;
      type = v10;
      v7 = NSStringFromSelector(sel__accessibilityLastOpaqueElement);
      v3 = v7;
      v9 = v3;
      v2 = (objc_class *)objc_opt_class();
      v6 = NSStringFromClass(v2);
      v8 = v6;
      __os_log_helper_16_2_2_8_64_8_64((uint64_t)v15, (uint64_t)v3, (uint64_t)v8);
      _os_log_fault_impl(&dword_230C4A000, log, type, "Attempted to check for nonexistent method: %@ on class: %@", v15, 0x16u);

      objc_storeStrong((id *)&v8, 0);
      objc_storeStrong((id *)&v9, 0);
    }
    objc_storeStrong(&v11, 0);
  }
}

- (id)_accessibilityLastOpaqueElementWithOptions:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  int v6;
  int v7;
  BOOL (*v8)(uint64_t);
  void *v9;
  UIView *v10;
  BOOL v11;
  uint64_t v12;
  int v13;
  int v14;
  BOOL (*v15)(uint64_t);
  void *v16;
  UIView *v17;
  BOOL v18;
  id location[2];
  UIView *v20;
  id v21;

  v20 = (UIView *)self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v18 = 0;
  v4 = MEMORY[0x24BDAC760];
  v12 = MEMORY[0x24BDAC760];
  v13 = -1073741824;
  v14 = 0;
  v15 = __72__UIScrollViewAccessibility__accessibilityLastOpaqueElementWithOptions___block_invoke;
  v16 = &unk_24FF3E0C0;
  v17 = v20;
  v18 = v15((uint64_t)&v12);
  v11 = 0;
  v5 = v4;
  v6 = -1073741824;
  v7 = 0;
  v8 = __72__UIScrollViewAccessibility__accessibilityLastOpaqueElementWithOptions___block_invoke_296;
  v9 = &unk_24FF3E0C0;
  v10 = v20;
  v11 = v8((uint64_t)&v5);
  if (!v18 || v11)
    v21 = -[UIScrollViewAccessibility _accessibilityFirstLastOpaqueElement:options:](v20, 0, location[0]);
  else
    v21 = (id)-[UIView _accessibilityLastOpaqueElement](v20, "_accessibilityLastOpaqueElement");
  objc_storeStrong((id *)&v10, 0);
  objc_storeStrong((id *)&v17, 0);
  objc_storeStrong(location, 0);
  return v21;
}

BOOL __72__UIScrollViewAccessibility__accessibilityLastOpaqueElementWithOptions___block_invoke(uint64_t a1)
{
  objc_class *v1;
  objc_class *v2;
  NSString *v4;
  NSObject *log;
  os_log_type_t type;
  NSString *v7;
  NSString *v8;
  NSString *v9;
  NSString *v10;
  char v11;
  id v12;
  IMP Implementation;
  Method InstanceMethod;
  uint64_t v15;
  uint64_t v16;
  id location;
  dispatch_once_t *v18;
  uint8_t v19[24];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v16 = a1;
  v15 = a1;
  v18 = (dispatch_once_t *)&kUIScrollViewScrollVerticalStorageKey_block_invoke_5_onceToken;
  location = 0;
  objc_storeStrong(&location, &__block_literal_global_295);
  if (*v18 != -1)
    dispatch_once(v18, location);
  objc_storeStrong(&location, 0);
  v1 = (objc_class *)objc_opt_class();
  InstanceMethod = class_getInstanceMethod(v1, sel__accessibilityLastOpaqueElement);
  Implementation = 0;
  if (InstanceMethod)
  {
    Implementation = method_getImplementation(InstanceMethod);
  }
  else
  {
    v12 = (id)AXLogCommon();
    v11 = 17;
    if (os_log_type_enabled((os_log_t)v12, OS_LOG_TYPE_FAULT))
    {
      log = v12;
      type = v11;
      v8 = NSStringFromSelector(sel__accessibilityLastOpaqueElement);
      v4 = v8;
      v10 = v4;
      v2 = (objc_class *)objc_opt_class();
      v7 = NSStringFromClass(v2);
      v9 = v7;
      __os_log_helper_16_2_2_8_64_8_64((uint64_t)v19, (uint64_t)v4, (uint64_t)v9);
      _os_log_fault_impl(&dword_230C4A000, log, type, "Attempted to check for nonexistent method: %@ on class: %@", v19, 0x16u);

      objc_storeStrong((id *)&v9, 0);
      objc_storeStrong((id *)&v10, 0);
    }
    objc_storeStrong(&v12, 0);
  }
  return Implementation != (IMP)kUIScrollViewScrollVerticalStorageKey_block_invoke_5_BaseImplementation;
}

void __72__UIScrollViewAccessibility__accessibilityLastOpaqueElementWithOptions___block_invoke_2(uint64_t a1)
{
  objc_class *v1;
  objc_class *v2;
  NSString *v3;
  NSObject *log;
  os_log_type_t type;
  NSString *v6;
  NSString *v7;
  NSString *v8;
  NSString *v9;
  char v10;
  id v11;
  Method InstanceMethod;
  uint64_t v13;
  uint64_t v14;
  uint8_t v15[24];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v14 = a1;
  v13 = a1;
  v1 = (objc_class *)objc_opt_class();
  InstanceMethod = class_getInstanceMethod(v1, sel__accessibilityLastOpaqueElement);
  if (InstanceMethod)
  {
    kUIScrollViewScrollVerticalStorageKey_block_invoke_5_BaseImplementation = (uint64_t)method_getImplementation(InstanceMethod);
  }
  else
  {
    v11 = (id)AXLogCommon();
    v10 = 17;
    if (os_log_type_enabled((os_log_t)v11, OS_LOG_TYPE_FAULT))
    {
      log = v11;
      type = v10;
      v7 = NSStringFromSelector(sel__accessibilityLastOpaqueElement);
      v3 = v7;
      v9 = v3;
      v2 = (objc_class *)objc_opt_class();
      v6 = NSStringFromClass(v2);
      v8 = v6;
      __os_log_helper_16_2_2_8_64_8_64((uint64_t)v15, (uint64_t)v3, (uint64_t)v8);
      _os_log_fault_impl(&dword_230C4A000, log, type, "Attempted to check for nonexistent method: %@ on class: %@", v15, 0x16u);

      objc_storeStrong((id *)&v8, 0);
      objc_storeStrong((id *)&v9, 0);
    }
    objc_storeStrong(&v11, 0);
  }
}

BOOL __72__UIScrollViewAccessibility__accessibilityLastOpaqueElementWithOptions___block_invoke_296(uint64_t a1)
{
  objc_class *v1;
  objc_class *v2;
  NSString *v4;
  NSObject *log;
  os_log_type_t type;
  NSString *v7;
  NSString *v8;
  NSString *v9;
  NSString *v10;
  char v11;
  id v12;
  IMP Implementation;
  Method InstanceMethod;
  uint64_t v15;
  uint64_t v16;
  id location;
  dispatch_once_t *v18;
  uint8_t v19[24];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v16 = a1;
  v15 = a1;
  v18 = (dispatch_once_t *)&kUIScrollViewScrollVerticalStorageKey_block_invoke_6_onceToken;
  location = 0;
  objc_storeStrong(&location, &__block_literal_global_298);
  if (*v18 != -1)
    dispatch_once(v18, location);
  objc_storeStrong(&location, 0);
  v1 = (objc_class *)objc_opt_class();
  InstanceMethod = class_getInstanceMethod(v1, sel__accessibilityLastOpaqueElementWithOptions_);
  Implementation = 0;
  if (InstanceMethod)
  {
    Implementation = method_getImplementation(InstanceMethod);
  }
  else
  {
    v12 = (id)AXLogCommon();
    v11 = 17;
    if (os_log_type_enabled((os_log_t)v12, OS_LOG_TYPE_FAULT))
    {
      log = v12;
      type = v11;
      v8 = NSStringFromSelector(sel__accessibilityLastOpaqueElementWithOptions_);
      v4 = v8;
      v10 = v4;
      v2 = (objc_class *)objc_opt_class();
      v7 = NSStringFromClass(v2);
      v9 = v7;
      __os_log_helper_16_2_2_8_64_8_64((uint64_t)v19, (uint64_t)v4, (uint64_t)v9);
      _os_log_fault_impl(&dword_230C4A000, log, type, "Attempted to check for nonexistent method: %@ on class: %@", v19, 0x16u);

      objc_storeStrong((id *)&v9, 0);
      objc_storeStrong((id *)&v10, 0);
    }
    objc_storeStrong(&v12, 0);
  }
  return Implementation != (IMP)kUIScrollViewScrollVerticalStorageKey_block_invoke_6_BaseImplementation;
}

void __72__UIScrollViewAccessibility__accessibilityLastOpaqueElementWithOptions___block_invoke_2_297(uint64_t a1)
{
  objc_class *v1;
  objc_class *v2;
  NSString *v3;
  NSObject *log;
  os_log_type_t type;
  NSString *v6;
  NSString *v7;
  NSString *v8;
  NSString *v9;
  char v10;
  id v11;
  Method InstanceMethod;
  uint64_t v13;
  uint64_t v14;
  uint8_t v15[24];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v14 = a1;
  v13 = a1;
  v1 = (objc_class *)objc_opt_class();
  InstanceMethod = class_getInstanceMethod(v1, sel__accessibilityLastOpaqueElementWithOptions_);
  if (InstanceMethod)
  {
    kUIScrollViewScrollVerticalStorageKey_block_invoke_6_BaseImplementation = (uint64_t)method_getImplementation(InstanceMethod);
  }
  else
  {
    v11 = (id)AXLogCommon();
    v10 = 17;
    if (os_log_type_enabled((os_log_t)v11, OS_LOG_TYPE_FAULT))
    {
      log = v11;
      type = v10;
      v7 = NSStringFromSelector(sel__accessibilityLastOpaqueElementWithOptions_);
      v3 = v7;
      v9 = v3;
      v2 = (objc_class *)objc_opt_class();
      v6 = NSStringFromClass(v2);
      v8 = v6;
      __os_log_helper_16_2_2_8_64_8_64((uint64_t)v15, (uint64_t)v3, (uint64_t)v8);
      _os_log_fault_impl(&dword_230C4A000, log, type, "Attempted to check for nonexistent method: %@ on class: %@", v15, 0x16u);

      objc_storeStrong((id *)&v8, 0);
      objc_storeStrong((id *)&v9, 0);
    }
    objc_storeStrong(&v11, 0);
  }
}

- (id)_accessibilityFocusAbsoluteFirstLastOpaqueElement:(BOOL)a3 technology:(id)a4 honorsGroups:(BOOL)a5 shouldAlwaysScroll:(BOOL)a6
{
  id v9;
  objc_super v10;
  id v11;
  BOOL v12;
  BOOL v13;
  id location;
  BOOL v15;
  SEL v16;
  UIScrollViewAccessibility *v17;

  v17 = self;
  v16 = a2;
  v15 = a3;
  location = 0;
  objc_storeStrong(&location, a4);
  v13 = a5;
  v12 = a6;
  -[UIScrollViewAccessibility _axSetAlwaysScrollsContentIntoView:](v17, "_axSetAlwaysScrollsContentIntoView:", a6);
  v10.receiver = v17;
  v10.super_class = (Class)UIScrollViewAccessibility;
  v11 = -[UIScrollViewAccessibility _accessibilityFocusAbsoluteFirstLastOpaqueElement:technology:honorsGroups:shouldAlwaysScroll:](&v10, sel__accessibilityFocusAbsoluteFirstLastOpaqueElement_technology_honorsGroups_shouldAlwaysScroll_, v15, location, a5, a6);
  -[UIScrollViewAccessibility _axSetAlwaysScrollsContentIntoView:](v17, "_axSetAlwaysScrollsContentIntoView:", 0);
  v9 = v11;
  objc_storeStrong(&v11, 0);
  objc_storeStrong(&location, 0);
  return v9;
}

- (BOOL)_accessibilityIncludeRoleInGroupNavigationOnly
{
  return 1;
}

- (id)_accessibilityRoleDescription
{
  return accessibilityLocalizedString(CFSTR("group.role"));
}

- (CGPoint)_accessibilityContentOffset
{
  double v2;
  double v3;
  CGPoint result;

  -[UIScrollViewAccessibility contentOffset](self, "contentOffset", a2, self);
  result.y = v3;
  result.x = v2;
  return result;
}

- (uint64_t)_axScrollViewPagingEnabled
{
  id v1;
  id v3;
  BOOL v4;
  char v6;

  if (a1)
  {
    v1 = (id)objc_msgSend(a1, "_accessibilityPagingEnabled");
    v4 = v1 == 0;

    if (v4)
    {
      v6 = objc_msgSend(a1, "isPagingEnabled") & 1;
    }
    else
    {
      v3 = (id)objc_msgSend(a1, "_accessibilityPagingEnabled");
      v6 = objc_msgSend(v3, "BOOLValue") & 1;

    }
  }
  else
  {
    v6 = 0;
  }
  return v6 & 1;
}

- (BOOL)_axShouldScrollToAlignWithPage
{
  return -[UIScrollViewAccessibility _axScrollViewPagingEnabled](self) & 1;
}

- (BOOL)_accessibilityScrollToFrame:(CGRect)a3 forView:(id)a4
{
  CGFloat v4;
  CGFloat v5;
  CGFloat v6;
  CGFloat v7;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  CGFloat v19;
  CGFloat v20;
  CGFloat v21;
  CGFloat v22;
  CGFloat v23;
  CGFloat v24;
  CGFloat v25;
  double v26;
  double v27;
  CGFloat v28;
  BOOL v29;
  NSString *v31;
  NSObject *v32;
  os_log_type_t v33;
  NSString *v34;
  NSString *v35;
  UIScrollViewAccessibility *v36;
  NSString *v37;
  NSObject *v38;
  os_log_type_t v39;
  NSString *v40;
  NSString *v41;
  double v42;
  double v43;
  double v44;
  double Height;
  double v46;
  double v47;
  double v48;
  double Width;
  NSObject *v50;
  os_log_type_t v51;
  NSObject *v52;
  os_log_type_t v53;
  NSString *v54;
  double v55;
  double MaxY;
  BOOL v57;
  double v58;
  double MaxX;
  double v60;
  double MinY;
  double v62;
  char v63;
  double MinX;
  NSObject *v65;
  os_log_type_t v66;
  NSString *v67;
  NSObject *v68;
  os_log_type_t v69;
  NSString *v70;
  NSObject *v71;
  os_log_type_t v72;
  NSString *v73;
  id v74;
  NSObject *log;
  os_log_type_t v76;
  NSString *v77;
  NSString *v78;
  NSString *v79;
  NSString *v80;
  os_log_type_t v81;
  os_log_t v82;
  int v83;
  NSString *v84;
  NSString *v85;
  os_log_type_t v86;
  os_log_t v87;
  uint8_t v88[7];
  os_log_type_t v89;
  os_log_t v90;
  CGPoint v91;
  CGPoint point;
  CGRect rect1;
  NSString *v94;
  os_log_type_t v95;
  os_log_t v96;
  CGRect v97;
  CGPoint origin;
  NSString *v99;
  os_log_type_t v100;
  os_log_t v101;
  UIEdgeInsets insets;
  char v103;
  NSString *v104;
  os_log_type_t v105;
  os_log_t v106;
  CGRect v107;
  uint8_t v108[7];
  os_log_type_t v109;
  os_log_t v110;
  NSString *v111;
  NSString *v112;
  os_log_type_t type;
  os_log_t oslog;
  CGRect rect;
  id location[2];
  UIScrollViewAccessibility *v117;
  CGRect v118;
  char v119;
  uint8_t v120[32];
  uint8_t v121[32];
  uint8_t v122[32];
  uint8_t v123[16];
  uint8_t v124[32];
  uint8_t v125[40];
  uint64_t v126;
  CGRect v127;

  v126 = *MEMORY[0x24BDAC8D0];
  v118 = a3;
  v117 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a4);
  -[UIScrollViewAccessibility visibleBounds](v117, "visibleBounds");
  rect.origin.x = v4;
  rect.origin.y = v5;
  rect.size.width = v6;
  rect.size.height = v7;
  oslog = (os_log_t)(id)AXLogScrollToVisible();
  type = OS_LOG_TYPE_DEBUG;
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
  {
    log = oslog;
    v76 = type;
    v78 = NSStringFromCGRect(v118);
    v73 = v78;
    v112 = v73;
    v74 = location[0];
    v77 = NSStringFromCGRect(rect);
    v111 = v77;
    __os_log_helper_16_2_3_8_66_8_66_8_66((uint64_t)v125, (uint64_t)v73, (uint64_t)v74, (uint64_t)v111);
    _os_log_debug_impl(&dword_230C4A000, log, v76, "Original frame %{public}@, view %{public}@, scroller bounds %{public}@", v125, 0x20u);

    objc_storeStrong((id *)&v111, 0);
    objc_storeStrong((id *)&v112, 0);
  }
  objc_storeStrong((id *)&oslog, 0);
  if (location[0] == v117)
  {
    v110 = (os_log_t)(id)AXLogScrollToVisible();
    v109 = OS_LOG_TYPE_DEBUG;
    if (os_log_type_enabled(v110, OS_LOG_TYPE_DEBUG))
    {
      v71 = v110;
      v72 = v109;
      __os_log_helper_16_0_0(v108);
      _os_log_debug_impl(&dword_230C4A000, v71, v72, "Trying to scroll view within itself.  Doing nothing.", v108, 2u);
    }
    objc_storeStrong((id *)&v110, 0);
  }
  else
  {
    UIAccessibilityFrameToBounds();
    v107.origin.x = v8;
    v107.origin.y = v9;
    v107.size.width = v10;
    v107.size.height = v11;
    v118 = v107;
  }
  v106 = (os_log_t)(id)AXLogScrollToVisible();
  v105 = OS_LOG_TYPE_DEBUG;
  if (os_log_type_enabled(v106, OS_LOG_TYPE_DEBUG))
  {
    v68 = v106;
    v69 = v105;
    v70 = NSStringFromCGRect(v118);
    v104 = v70;
    __os_log_helper_16_2_2_8_66_8_66((uint64_t)v124, (uint64_t)v104, (uint64_t)v117);
    _os_log_debug_impl(&dword_230C4A000, v68, v69, "Will scroll to frame %{public}@ in bounds for %{public}@", v124, 0x16u);

    objc_storeStrong((id *)&v104, 0);
  }
  objc_storeStrong((id *)&v106, 0);
  v103 = 0;
  -[UIScrollViewAccessibility _accessibilityVisibleContentInset](v117, "_accessibilityVisibleContentInset");
  insets.top = v12;
  insets.left = v13;
  insets.bottom = v14;
  insets.right = v15;
  v101 = (os_log_t)(id)AXLogScrollToVisible();
  v100 = OS_LOG_TYPE_DEBUG;
  if (os_log_type_enabled(v101, OS_LOG_TYPE_DEBUG))
  {
    v65 = v101;
    v66 = v100;
    v67 = NSStringFromUIEdgeInsets(insets);
    v99 = v67;
    __os_log_helper_16_2_1_8_66((uint64_t)v123, (uint64_t)v99);
    _os_log_debug_impl(&dword_230C4A000, v65, v66, "Visible content inset is %{public}@", v123, 0xCu);

    objc_storeStrong((id *)&v99, 0);
  }
  objc_storeStrong((id *)&v101, 0);
  insets.top = CGFloatMin_0(0.0, -insets.top);
  insets.left = CGFloatMin_0(0.0, -insets.left);
  insets.bottom = CGFloatMin_0(0.0, -insets.bottom);
  insets.right = CGFloatMin_0(0.0, -insets.right);
  origin = v118.origin;
  v97.origin.x = UIEdgeInsetsInsetRect_0(v118.origin.x, v118.origin.y, v118.size.width, v118.size.height, insets.top, insets.left);
  v97.origin.y = v16;
  v97.size.width = v17;
  v97.size.height = v18;
  v118 = v97;
  MinX = CGRectGetMinX(v97);
  if (MinX >= CGRectGetMinX(rect)
    || (v62 = CGRectGetMinX(v118), v19 = CGRectGetMinX(rect), v63 = 1, AXCGFAbs_0(v62 - v19) < 0.001))
  {
    MinY = CGRectGetMinY(v118);
    if (MinY >= CGRectGetMinY(rect)
      || (v60 = CGRectGetMinY(v118), v20 = CGRectGetMinY(rect), v63 = 1, AXCGFAbs_0(v60 - v20) < 0.001))
    {
      MaxX = CGRectGetMaxX(v118);
      if (MaxX <= CGRectGetMaxX(rect)
        || (v58 = CGRectGetMaxX(v118), v21 = CGRectGetMaxX(rect), v63 = 1, AXCGFAbs_0(v58 - v21) < 0.001))
      {
        MaxY = CGRectGetMaxY(v118);
        v57 = 0;
        if (MaxY > CGRectGetMaxY(rect))
        {
          v55 = CGRectGetMaxY(v118);
          v22 = CGRectGetMaxY(rect);
          v57 = AXCGFAbs_0(v55 - v22) >= 0.001;
        }
        v63 = v57;
      }
    }
  }
  v103 = v63;
  v96 = (os_log_t)(id)AXLogScrollToVisible();
  v95 = OS_LOG_TYPE_DEBUG;
  if (os_log_type_enabled(v96, OS_LOG_TYPE_DEBUG))
  {
    v52 = v96;
    v53 = v95;
    v54 = NSStringFromCGRect(v118);
    v94 = v54;
    __os_log_helper_16_2_2_8_66_4_0((uint64_t)v122, (uint64_t)v94, v103 & 1);
    _os_log_debug_impl(&dword_230C4A000, v52, v53, "After insetting, frame is %{public}@.  Should scroll: %i", v122, 0x12u);

    objc_storeStrong((id *)&v94, 0);
  }
  objc_storeStrong((id *)&v96, 0);
  if ((v103 & 1) == 0)
    goto LABEL_45;
  -[UIScrollViewAccessibility bounds](v117, "bounds");
  rect1 = v127;
  if (CGRectContainsRect(v127, v118))
  {
    v82 = (os_log_t)(id)AXLogScrollToVisible();
    v81 = OS_LOG_TYPE_DEBUG;
    if (os_log_type_enabled(v82, OS_LOG_TYPE_DEBUG))
    {
      v32 = v82;
      v33 = v81;
      v35 = NSStringFromCGRect(rect1);
      v31 = v35;
      v80 = v31;
      v34 = NSStringFromCGRect(v118);
      v79 = v34;
      __os_log_helper_16_2_2_8_66_8_66((uint64_t)v120, (uint64_t)v31, (uint64_t)v79);
      _os_log_debug_impl(&dword_230C4A000, v32, v33, "Real bounds %{public}@ already contained frame %{public}@, so doing nothing.", v120, 0x16u);

      objc_storeStrong((id *)&v79, 0);
      objc_storeStrong((id *)&v80, 0);
    }
    objc_storeStrong((id *)&v82, 0);
LABEL_45:
    v119 = 0;
    v83 = 1;
    goto LABEL_46;
  }
  -[UIScrollViewAccessibility contentOffset](v117, "contentOffset");
  point.x = v23;
  point.y = v24;
  if (-[UIScrollViewAccessibility _axShouldScrollToAlignWithPage](v117, "_axShouldScrollToAlignWithPage"))
  {
    v91.x = -[UIScrollViewAccessibility _axPageAlignedContentOffsetForPoint:forValidation:](v117, 0, origin.x, origin.y);
    v91.y = v25;
    point = v91;
    v90 = (os_log_t)(id)AXLogScrollToVisible();
    v89 = OS_LOG_TYPE_DEBUG;
    if (os_log_type_enabled(v90, OS_LOG_TYPE_DEBUG))
    {
      v50 = v90;
      v51 = v89;
      __os_log_helper_16_0_0(v88);
      _os_log_debug_impl(&dword_230C4A000, v50, v51, "Aligning content offset for page.", v88, 2u);
    }
    objc_storeStrong((id *)&v90, 0);
    goto LABEL_39;
  }
  Width = UIRectGetWidth(v118.origin.x, v118.origin.y, v118.size.width);
  if (Width > UIRectGetWidth(rect1.origin.x, rect1.origin.y, rect1.size.width))
    goto LABEL_33;
  v48 = UIRectGetMaxX(v118.origin.x, v118.origin.y, v118.size.width);
  if (v48 >= UIRectGetMaxX(rect1.origin.x, rect1.origin.y, rect1.size.width))
  {
    v47 = UIRectGetMaxX(v118.origin.x, v118.origin.y, v118.size.width);
    point.x = v47 - UIRectGetWidth(rect1.origin.x, rect1.origin.y, rect1.size.width);
    goto LABEL_34;
  }
  UIRectGetMinX();
  v46 = v26;
  UIRectGetMinX();
  if (v46 < v27)
  {
LABEL_33:
    UIRectGetMinX();
    point.x = v28;
  }
LABEL_34:
  Height = UIRectGetHeight(v118.origin.x, v118.origin.y, v118.size.width, v118.size.height);
  if (Height > UIRectGetHeight(rect1.origin.x, rect1.origin.y, rect1.size.width, rect1.size.height))
    goto LABEL_38;
  v44 = UIRectGetMaxY(v118.origin.x, v118.origin.y, v118.size.width, v118.size.height);
  if (v44 < UIRectGetMaxY(rect1.origin.x, rect1.origin.y, rect1.size.width, rect1.size.height))
  {
    v42 = UIRectGetMinY(v118.origin.x, v118.origin.y);
    if (v42 >= UIRectGetMinY(rect1.origin.x, rect1.origin.y))
      goto LABEL_39;
LABEL_38:
    point.y = UIRectGetMinY(v118.origin.x, v118.origin.y);
    goto LABEL_39;
  }
  v43 = UIRectGetMaxY(v118.origin.x, v118.origin.y, v118.size.width, v118.size.height);
  point.y = v43 - UIRectGetHeight(rect1.origin.x, rect1.origin.y, rect1.size.width, rect1.size.height);
LABEL_39:
  v87 = (os_log_t)(id)AXLogScrollToVisible();
  v86 = OS_LOG_TYPE_DEBUG;
  if (os_log_type_enabled(v87, OS_LOG_TYPE_DEBUG))
  {
    v38 = v87;
    v39 = v86;
    v41 = NSStringFromCGPoint(point);
    v37 = v41;
    v85 = v37;
    v40 = NSStringFromCGRect(rect1);
    v84 = v40;
    __os_log_helper_16_2_2_8_66_8_66((uint64_t)v121, (uint64_t)v37, (uint64_t)v84);
    _os_log_debug_impl(&dword_230C4A000, v38, v39, "Computed content offset: %{public}@.  Bounds: %{public}@", v121, 0x16u);

    objc_storeStrong((id *)&v84, 0);
    objc_storeStrong((id *)&v85, 0);
  }
  objc_storeStrong((id *)&v87, 0);
  v36 = v117;
  v29 = -[UIScrollViewAccessibility _accessibilityShouldAnimateScrollToVisible](v117, "_accessibilityShouldAnimateScrollToVisible");
  -[UIScrollViewAccessibility accessibilityApplyScrollContent:sendScrollStatus:animated:](v36, "accessibilityApplyScrollContent:sendScrollStatus:animated:", 0, v29, point);
  v119 = 1;
  v83 = 1;
LABEL_46:
  objc_storeStrong(location, 0);
  return v119 & 1;
}

- (double)_axPageAlignedContentOffsetForPoint:(double)a3 forValidation:(double)a4
{
  double v4;
  double v5;
  uint64_t v6;
  double v7;
  double v8;
  double v9;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  __int128 v19;
  id location;
  double v21;
  double v22;
  char v23;
  void *v24;
  double v25;
  double v26;
  __int128 v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;

  v25 = a3;
  v26 = a4;
  v24 = a1;
  v23 = a2 & 1;
  if (a1)
  {
    v21 = -[UIScrollViewAccessibility _axPageSize](v24);
    v22 = v4;
    location = v24;
    objc_msgSend(location, "_pagingOrigin");
    *(double *)&v19 = v5;
    *((_QWORD *)&v19 + 1) = v6;
    v27 = v19;
    v7 = 0.00001;
    if ((v23 & 1) == 0)
      v7 = 0.02;
    v18 = (v25 - v5) / v21;
    v17 = (v26 - *((double *)&v19 + 1)) / v22;
    v31 = v18;
    if (ceil(v18) - v18 >= v7)
    {
      v33 = (v25 - v5) / v21;
      v12 = floor(v18);
    }
    else
    {
      v30 = (v25 - v5) / v21;
      v12 = ceil(v18);
    }
    *(double *)&v27 = *(double *)&v27 + v12 * v21;
    v29 = (v26 - *((double *)&v19 + 1)) / v22;
    if (ceil(v17) - v17 >= v7)
    {
      v32 = (v26 - *((double *)&v19 + 1)) / v22;
      v11 = floor(v17);
    }
    else
    {
      v28 = (v26 - *((double *)&v19 + 1)) / v22;
      v11 = ceil(v17);
    }
    *((double *)&v27 + 1) = *((double *)&v27 + 1) + v11 * v22;
    v15 = -[UIScrollViewAccessibility _axMinimumContentOffset](v24);
    v16 = v8;
    v13 = -[UIScrollViewAccessibility _axMaximumContentOffset](v24);
    v14 = v9;
    *(_QWORD *)&v27 = CGFloatMinMax_0(*(double *)&v27, v15, v13);
    *((_QWORD *)&v27 + 1) = CGFloatMinMax_0(*((double *)&v27 + 1), v16, v14);
    objc_storeStrong(&location, 0);
  }
  else
  {
    v27 = 0uLL;
  }
  return *(double *)&v27;
}

- (int64_t)accessibilityContainerType
{
  id location[3];
  int64_t v4;

  location[2] = self;
  location[1] = (id)a2;
  location[0] = (id)-[UIScrollViewAccessibility storedAccessibilityContainerType](self, "storedAccessibilityContainerType");
  if (location[0])
    v4 = objc_msgSend(location[0], "integerValue");
  else
    v4 = 12;
  objc_storeStrong(location, 0);
  return v4;
}

- (BOOL)_accessibilityShouldAnimateScrollToVisible
{
  return 0;
}

- (unint64_t)_accessibilityAutomationType
{
  return 46;
}

- (BOOL)_accessibilityShouldAnimateScroll
{
  id v2;
  BOOL v3;

  if (a1)
  {
    v2 = (id)objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication");
    v3 = objc_msgSend(v2, "applicationState") != 2;

    return v3;
  }
  else
  {
    return 0;
  }
}

- (double)_accessibilityScrollWidthDistance
{
  double v2;
  double v3;
  double v4;
  double v6;

  -[UIScrollViewAccessibility visibleBounds](self, "visibleBounds");
  v6 = v2;
  -[UIScrollViewAccessibility _accessibilityVisibleContentInset](self, "_accessibilityVisibleContentInset");
  return v6 - v3 - v4;
}

- (double)_accessibilityScrollHeightDistance
{
  double v2;
  double v3;
  double v4;
  double v6;

  -[UIScrollViewAccessibility visibleBounds](self, "visibleBounds");
  v6 = v2;
  -[UIScrollViewAccessibility _accessibilityVisibleContentInset](self, "_accessibilityVisibleContentInset");
  return v6 - v3 - v4;
}

- (BOOL)_accessibilityScrollStatusPrefersVertical
{
  return 1;
}

- (void)_accessibilityCurrentPage:(uint64_t *)a3 totalPages:(int)a4 type:
{
  int v4;
  id v5;
  int v6;
  int v7;

  if (a1)
  {
    v7 = 1;
    v5 = (id)objc_msgSend(a1, "_accessibilityValueForKey:", CFSTR("kUIScrollViewScrollVerticalStorageKey"));
    v6 = objc_msgSend(v5, "intValue");

    if (v6)
      v7 = v6;
    if (v7 == 3 || a4 == 3)
    {
      if (a4 == 2 || a4 == 1)
      {
        v7 = a4;
      }
      else
      {
        if ((objc_msgSend(a1, "_accessibilityScrollStatusPrefersVertical") & 1) != 0)
          v4 = 1;
        else
          v4 = 2;
        v7 = v4;
      }
    }
    -[UIScrollViewAccessibility _accessibilityCurrentPage:totalPages:forVerticalDirection:](a1, a2, a3, v7 == 1);
  }
}

- (void)_accessibilityCurrentPage:(uint64_t *)a3 totalPages:(char)a4 forVerticalDirection:
{
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
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  float v17;
  float v18;
  float v19;
  float v20;
  double v21;
  double v22;
  CGRect v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  uint64_t v32;
  unint64_t v33;
  char v34;

  v34 = a4 & 1;
  if (a1)
  {
    objc_msgSend(a1, "visibleBounds");
    v28 = v4;
    v29 = v5;
    v30 = v6;
    v31 = v7;
    objc_msgSend(a1, "_accessibilityScrollHeightDistance");
    v27 = v8;
    objc_msgSend(a1, "_accessibilityScrollWidthDistance");
    v26 = v9;
    objc_msgSend(a1, "_accessibilityContentSize");
    v24 = v10;
    v25 = v11;
    objc_msgSend(a1, "_accessibilityVisibleContentInset");
    v23.origin.x = UIEdgeInsetsInsetRect_0(v28, v29, v30, v31, v12, v13);
    v23.origin.y = v14;
    v23.size.width = v15;
    v23.size.height = v16;
    if ((v34 & 1) == 0 || v25 == v27)
    {
      if (v24 > v26)
      {
        v19 = v24 / v26;
        v32 = vcvtps_s32_f32(v19);
        v21 = CGRectGetMidX(v23) / v24;
        if (v21 > 1.0)
          v21 = 1.0;
        v20 = v21 * (double)v32;
        v33 = vcvtms_s32_f32(v20) + 1;
      }
      else
      {
        v32 = 1;
        v33 = 1;
      }
    }
    else if (v25 > v27)
    {
      v17 = v25 / v27;
      v32 = vcvtps_s32_f32(v17);
      v22 = CGRectGetMidY(v23) / v25;
      if (v22 > 1.0)
        v22 = 1.0;
      v18 = v22 * (double)v32;
      v33 = vcvtms_s32_f32(v18) + 1;
    }
    else
    {
      v32 = 1;
      v33 = 1;
    }
    if (a3)
      *a3 = v32;
    if (a2)
      *a2 = v33;
  }
}

- (BOOL)_accessibilityUseContentInset
{
  return 1;
}

- (double)_axMinimumContentOffset
{
  double v1;

  if (!a1)
    return 0.0;
  objc_msgSend(a1, "safeCGPointForKey:", CFSTR("_minimumContentOffset"));
  return v1;
}

- (double)_axMaximumContentOffset
{
  double v1;

  if (!a1)
    return 0.0;
  objc_msgSend(a1, "safeCGPointForKey:", CFSTR("_maximumContentOffset"));
  return v1;
}

- (BOOL)accessibilityScrollLeftPageSupported
{
  return (-[UIScrollViewAccessibility _accessibilityHasActionBlockForKey:](self, "_accessibilityHasActionBlockForKey:", 2009) & 1) != 0|| -[UIScrollViewAccessibility _axBaseScrollLeftPageSupported](self);
}

- (BOOL)accessibilityScrollRightPageSupported
{
  return (-[UIScrollViewAccessibility _accessibilityHasActionBlockForKey:](self, "_accessibilityHasActionBlockForKey:", 2008) & 1) != 0|| -[UIScrollViewAccessibility _axBaseScrollRightPageSupported](self);
}

- (BOOL)accessibilityScrollUpPageSupported
{
  return (-[UIScrollViewAccessibility _accessibilityHasActionBlockForKey:](self, "_accessibilityHasActionBlockForKey:", 2007) & 1) != 0|| -[UIScrollViewAccessibility _axBaseScrollUpPageSupported](self);
}

- (id)_accessibilityFindRefreshControl
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  id obj;
  uint64_t v7;
  _QWORD __b[8];
  id v9;
  id v10;
  id location;
  id v12;
  id v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v12 = a1;
  if (a1)
  {
    location = (id)objc_msgSend(v12, "safeValueForKey:", CFSTR("_refreshControl"));
    if (!location)
    {
      v10 = (id)objc_msgSend(v12, "safeValueForKey:", CFSTR("subviews"));
      memset(__b, 0, sizeof(__b));
      obj = v10;
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v14, 16);
      if (v7)
      {
        v3 = *(_QWORD *)__b[2];
        v4 = 0;
        v5 = v7;
        while (1)
        {
          v2 = v4;
          if (*(_QWORD *)__b[2] != v3)
            objc_enumerationMutation(obj);
          v9 = *(id *)(__b[1] + 8 * v4);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            break;
          ++v4;
          if (v2 + 1 >= v5)
          {
            v4 = 0;
            v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v14, 16);
            if (!v5)
              goto LABEL_12;
          }
        }
        objc_storeStrong(&location, v9);
      }
LABEL_12:

      objc_storeStrong(&v10, 0);
    }
    v13 = location;
    objc_storeStrong(&location, 0);
  }
  else
  {
    v13 = 0;
  }
  return v13;
}

- (BOOL)accessibilityScrollDownPageSupported
{
  return (-[UIScrollViewAccessibility _accessibilityHasActionBlockForKey:](self, "_accessibilityHasActionBlockForKey:", 2006) & 1) != 0|| -[UIScrollViewAccessibility _axBaseScrollDownPageSupported](self);
}

- (id)_accessibilityScrollStatusFormatString
{
  return accessibilityLocalizedString(CFSTR("scroll.page.summary"));
}

- (void)_scrollViewDidEndDeceleratingForDelegate
{
  objc_super v2;
  SEL v3;
  UIScrollViewAccessibility *v4;

  v4 = self;
  v3 = a2;
  v2.receiver = self;
  v2.super_class = (Class)UIScrollViewAccessibility;
  -[UIScrollViewAccessibility _scrollViewDidEndDeceleratingForDelegate](&v2, sel__scrollViewDidEndDeceleratingForDelegate);
  UIAccessibilityPostNotification(*MEMORY[0x24BEBB0A8], 0);
}

- (void)_notifyDidScroll
{
  id v2;
  UIScrollViewAccessibility *v3;
  id v4;
  id v5;
  BOOL v6;
  BOOL v7;
  char v8;
  id v9;
  uint64_t v10;
  id location;
  char v12;
  BOOL v13;
  objc_super v14;
  SEL v15;
  UIScrollViewAccessibility *v16;

  v16 = self;
  v15 = a2;
  v14.receiver = self;
  v14.super_class = (Class)UIScrollViewAccessibility;
  -[UIScrollViewAccessibility _notifyDidScroll](&v14, sel__notifyDidScroll);
  v13 = 0;
  v7 = 0;
  if (_AXSSpeakThisEnabled())
  {
    v7 = 0;
    if (_AXSQuickSpeakHighlightTextEnabled())
      v7 = _AXSSpeakThisHighlightVisible() != 0;
  }
  v13 = v7;
  v12 = 0;
  if (UIAccessibilityIsVoiceOverRunning()
    || _AXSAuditInspectionModeEnabled()
    || _AXSAssistiveTouchEnabled()
    || v13)
  {
    UIAccessibilityPostNotification(*MEMORY[0x24BEBB1C8], 0);
  }
  location = v16;
  if ((objc_msgSend(location, "isFirstResponder") & 1) != 0)
  {
    v10 = -[UIScrollViewAccessibility _accessibilityBoundaryEdges](v16, "_accessibilityBoundaryEdges");
    v5 = -[UIScrollViewAccessibility _axLastEdgeBoundaries](v16, "_axLastEdgeBoundaries");
    v8 = 0;
    v6 = 1;
    if (v5)
    {
      v9 = -[UIScrollViewAccessibility _axLastEdgeBoundaries](v16, "_axLastEdgeBoundaries");
      v8 = 1;
      v6 = v10 != objc_msgSend(v9, "unsignedIntegerValue");
    }
    if ((v8 & 1) != 0)

    if (v6)
    {
      v3 = v16;
      v4 = (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v10);
      -[UIScrollViewAccessibility _axSetLastEdgeBoundaries:](v3, "_axSetLastEdgeBoundaries:");

      if (v10)
      {
        v2 = (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v10);
        UIAccessibilityPostNotification(0x434u, v2);

      }
    }
  }
  objc_storeStrong(&location, 0);
}

- (unint64_t)_accessibilityBoundaryEdges
{
  double v2;
  double v3;
  double v4;
  double v5;
  unint64_t v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;

  -[UIScrollViewAccessibility contentOffset](self, "contentOffset");
  v11 = v2;
  v12 = v3;
  v9 = -[UIScrollViewAccessibility _axMinimumContentOffset](self);
  v10 = v4;
  v8 = -[UIScrollViewAccessibility _axMaximumContentOffset](self);
  v7 = v12 <= v10;
  if (v12 >= v5)
    v7 |= 4uLL;
  if (v11 <= v9)
    v7 |= 2uLL;
  if (v11 >= v8)
    v7 |= 8uLL;
  return v7;
}

- (id)_accessibilityRetrieveDelegate
{
  return (id)-[UIScrollViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("delegate"), a2, self);
}

- (id)_accessibilityDelegateScrollStatus
{
  int v3;
  id location;
  id v5;
  id v6[2];
  UIScrollViewAccessibility *v7;
  id v8;

  v7 = self;
  v6[1] = (id)a2;
  v6[0] = -[UIScrollViewAccessibility _accessibilityRetrieveDelegate](self, "_accessibilityRetrieveDelegate");
  v5 = v7;
  if ((objc_opt_respondsToSelector() & 1) == 0
    || ((location = (id)objc_msgSend(v6[0], "accessibilityAttributedScrollStatusForScrollView:", v5)) == 0? (v3 = 0): (v8 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDFEA60]), "initWithCFAttributedString:", location), v3 = 1), objc_storeStrong(&location, 0), !v3))
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v8 = (id)objc_msgSend(v6[0], "accessibilityScrollStatusForScrollView:", v5);
    else
      v8 = 0;
  }
  objc_storeStrong(&v5, 0);
  objc_storeStrong(v6, 0);
  return v8;
}

- (double)_axAllowedPagingOverlap
{
  id v1;
  double v2;
  id v4;
  BOOL v5;
  double v7;

  if (!a1)
    return 0.0;
  v1 = (id)objc_msgSend(a1, "_accessibilityAllowedPagingOverlap");
  v5 = v1 == 0;

  if (v5)
    return 0.0;
  v4 = (id)objc_msgSend(a1, "_accessibilityAllowedPagingOverlap");
  objc_msgSend(v4, "doubleValue");
  v7 = v2;

  return v7;
}

- (id)_accessibilityElementsFilteredByPagingScrollView:(void *)a1
{
  id v2;
  CGFloat v3;
  CGFloat v4;
  CGFloat v5;
  CGFloat v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  id obj;
  uint64_t v26;
  id v27;
  BOOL v28;
  CGRect rect2;
  double height;
  CGRect r2;
  _QWORD __b[8];
  id v33;
  CGRect v34;
  char v35;
  id v36;
  int v37;
  id location;
  void *v39;
  id v40;
  _BYTE v41[128];
  uint64_t v42;
  CGRect v43;

  v42 = *MEMORY[0x24BDAC8D0];
  v39 = a1;
  location = 0;
  objc_storeStrong(&location, a2);
  if (v39)
  {
    v36 = (id)objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(location, "count"));
    if ((-[UIScrollViewAccessibility _axScrollViewPagingEnabled](v39) & 1) == 0
      || (objc_msgSend(v39, "_accessibilityScrollAcrossPageBoundaries") & 1) != 0)
    {
      v40 = 0;
      v37 = 1;
    }
    else
    {
      v35 = 0;
      v2 = (id)objc_msgSend(v39, "_accessibilityPagingEnabled");
      v28 = v2 == 0;

      if (!v28)
      {
        v27 = (id)objc_msgSend(v39, "_accessibilityPagingEnabled");
        v35 = objc_msgSend(v27, "BOOLValue") & 1;

      }
      objc_msgSend(v39, "visibleBounds");
      v34.origin.x = v3;
      v34.origin.y = v4;
      v34.size.width = v5;
      v34.size.height = v6;
      memset(__b, 0, sizeof(__b));
      obj = location;
      v26 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v41, 16);
      if (v26)
      {
        v22 = *(_QWORD *)__b[2];
        v23 = 0;
        v24 = v26;
        while (1)
        {
          v21 = v23;
          if (*(_QWORD *)__b[2] != v22)
            objc_enumerationMutation(obj);
          v33 = *(id *)(__b[1] + 8 * v23);
          v20 = v33;
          objc_msgSend(v33, "bounds");
          objc_msgSend(v20, "convertRect:toView:", v39, v7, v8, v9, v10);
          r2.origin.x = v11;
          r2.origin.y = v12;
          r2.size.width = v13;
          r2.size.height = v14;
          if ((v35 & 1) != 0)
          {
            v43 = CGRectIntersection(v34, r2);
            height = v43.size.height;
            if (v43.size.width >= -[UIScrollViewAccessibility _axAllowedPagingOverlap](v39)
              && height >= -[UIScrollViewAccessibility _axAllowedPagingOverlap](v39))
            {
              objc_msgSend(v36, "addObject:", v33, height);
            }
          }
          else
          {
            objc_msgSend(v33, "frame");
            rect2.origin.x = v15;
            rect2.origin.y = v16;
            rect2.size.width = v17;
            rect2.size.height = v18;
            if (CGRectIntersectsRect(v34, rect2))
              objc_msgSend(v36, "addObject:", v33);
          }
          ++v23;
          if (v21 + 1 >= v24)
          {
            v23 = 0;
            v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v41, 16);
            if (!v24)
              break;
          }
        }
      }

      v40 = v36;
      v37 = 1;
    }
    objc_storeStrong(&v36, 0);
  }
  else
  {
    v40 = 0;
    v37 = 1;
  }
  objc_storeStrong(&location, 0);
  return v40;
}

- (id)_accessibilitySubviews
{
  id v2;
  id v3;
  id v5;
  id v7;
  objc_super v8;
  id v9[2];
  UIScrollViewAccessibility *v10;

  v10 = self;
  v9[1] = (id)a2;
  v7 = (id)-[UIScrollViewAccessibility subviews](self, "subviews");
  v9[0] = -[UIScrollViewAccessibility _accessibilityElementsFilteredByPagingScrollView:](self, v7);

  if (!v9[0])
  {
    v8.receiver = v10;
    v8.super_class = (Class)UIScrollViewAccessibility;
    v2 = -[UIScrollViewAccessibility _accessibilitySubviews](&v8, sel__accessibilitySubviews);
    v3 = v9[0];
    v9[0] = v2;

  }
  v5 = v9[0];
  objc_storeStrong(v9, 0);
  return v5;
}

- (int64_t)_accessibilityPageCount
{
  unint64_t v3;
  uint64_t v4[3];

  v4[2] = (uint64_t)self;
  v4[1] = (uint64_t)a2;
  v4[0] = 0;
  v3 = 0;
  -[UIScrollViewAccessibility _accessibilityCurrentPage:totalPages:type:](self, &v3, v4, 3);
  return v4[0];
}

- (int64_t)_accessibilityPageIndex
{
  int64_t v3;
  uint64_t v4[3];

  v4[2] = (uint64_t)self;
  v4[1] = (uint64_t)a2;
  v4[0] = 0;
  v3 = 0;
  -[UIScrollViewAccessibility _accessibilityCurrentPage:totalPages:type:](self, (unint64_t *)&v3, v4, 3);
  return v3;
}

- (void)_accessibilitySetScrollStatus:(id)a3
{
  id location[2];
  UIScrollViewAccessibility *v4;

  v4 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  -[UIScrollViewAccessibility _accessibilitySetValue:forKey:storageMode:](v4, "_accessibilitySetValue:forKey:storageMode:", location[0], CFSTR("accessibilityScrollStatus"), 0);
  objc_storeStrong(location, 0);
}

- (id)_accessibilityScrollStatus
{
  id v2;
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v9;
  id v10;
  unsigned int v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  unint64_t v16;
  uint64_t v17;
  id v18[2];
  UIScrollViewAccessibility *v19;

  v19 = self;
  v18[1] = (id)a2;
  v18[0] = (id)-[UIScrollViewAccessibility _accessibilityValueForKey:](self, "_accessibilityValueForKey:", CFSTR("accessibilityScrollStatus"));
  if (!objc_msgSend(v18[0], "length"))
  {
    v2 = -[UIScrollViewAccessibility _accessibilityDelegateScrollStatus](v19, "_accessibilityDelegateScrollStatus");
    v3 = v18[0];
    v18[0] = v2;

  }
  if (!objc_msgSend(v18[0], "length"))
  {
    v17 = 0;
    v16 = 0;
    v10 = (id)-[UIScrollViewAccessibility _accessibilityValueForKey:](v19, "_accessibilityValueForKey:");
    v11 = objc_msgSend(v10, "intValue");

    -[UIScrollViewAccessibility _accessibilitySetIntegerValue:forKey:](v19, "_accessibilitySetIntegerValue:forKey:", 3, CFSTR("kUIScrollViewScrollVerticalStorageKey"));
    -[UIScrollViewAccessibility _accessibilityCurrentPage:totalPages:type:](v19, &v16, &v17, v11);
    v12 = (void *)MEMORY[0x24BDD17C8];
    v15 = -[UIScrollViewAccessibility _accessibilityScrollStatusFormatString](v19, "_accessibilityScrollStatusFormatString");
    v14 = (id)AXFormatInteger();
    v13 = (id)AXFormatInteger();
    v4 = (id)objc_msgSend(v12, "stringWithFormat:", v15, v14, v13);
    v5 = v18[0];
    v18[0] = v4;

    if ((-[UIScrollViewAccessibility _axScrollViewPagingEnabled](v19) & 1) != 0 && v11 == 2)
    {
      v6 = (id)objc_msgSend(MEMORY[0x24BDFEA60], "axAttributedStringWithString:", v18[0]);
      v7 = v18[0];
      v18[0] = v6;

      objc_msgSend(v18[0], "setAttribute:forKey:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BDFEF18]);
    }
    -[UIScrollViewAccessibility _accessibilitySetIntegerValue:forKey:](v19, "_accessibilitySetIntegerValue:forKey:", v11, CFSTR("kUIScrollViewScrollVerticalStorageKey"));
  }
  v9 = v18[0];
  objc_storeStrong(v18, 0);
  return v9;
}

- (void)_accessibilitySendScrollStatus
{
  id argument[3];

  argument[2] = self;
  argument[1] = (id)a2;
  argument[0] = -[UIScrollViewAccessibility _accessibilityScrollStatus](self, "_accessibilityScrollStatus");
  UIAccessibilityPostNotification(*MEMORY[0x24BDF72E0], argument[0]);
  objc_storeStrong(argument, 0);
}

- (void)_accessibilityZoomAtPoint:(CGPoint)a3 zoomIn:(BOOL)a4
{
  double v4;
  double v5;
  double v6;
  UIScrollViewAccessibility *v7;
  void *v8;
  UIAccessibilityNotifications notification;
  id v10;
  id v11;
  id v12;
  double v13;
  double v14;
  UIScrollViewAccessibility *v15;
  BOOL v16;
  SEL v17;
  UIScrollViewAccessibility *v18;
  CGPoint v19;

  v19 = a3;
  v18 = self;
  v17 = a2;
  v16 = a4;
  v15 = self;
  -[UIScrollViewAccessibility maximumZoomScale](v15, "maximumZoomScale");
  v13 = v4;
  -[UIScrollViewAccessibility minimumZoomScale](v15, "minimumZoomScale");
  v14 = (v13 - v5) / 10.0;
  if (!v16)
    v14 = -v14;
  v7 = v15;
  -[UIScrollViewAccessibility zoomScale](v15, "zoomScale");
  -[UIScrollViewAccessibility setZoomScale:](v7, "setZoomScale:", v6 + v14);
  -[UIScrollViewAccessibility zoomScale](v15, "zoomScale");
  -[UIScrollViewAccessibility minimumZoomScale](v15, "minimumZoomScale");
  notification = *MEMORY[0x24BDF71E8];
  v8 = (void *)MEMORY[0x24BDD17C8];
  v12 = accessibilityLocalizedString(CFSTR("zoom.level"));
  v11 = (id)AXFormatInteger();
  v10 = (id)objc_msgSend(v8, "stringWithFormat:", v12, v11);
  UIAccessibilityPostNotification(notification, v10);

  objc_storeStrong((id *)&v15, 0);
}

- (BOOL)accessibilityZoomInAtPoint:(CGPoint)a3
{
  -[UIScrollViewAccessibility _accessibilityZoomAtPoint:zoomIn:](self, "_accessibilityZoomAtPoint:zoomIn:", 1, a3.x, a3.y);
  return 1;
}

- (BOOL)accessibilityZoomOutAtPoint:(CGPoint)a3
{
  -[UIScrollViewAccessibility _accessibilityZoomAtPoint:zoomIn:](self, "_accessibilityZoomAtPoint:zoomIn:", 0, a3.x, a3.y);
  return 1;
}

- (double)_accessibilityScrollAnimationDurationDelay
{
  return 0.0;
}

- (uint64_t)_accessibilityCanHandleContentPullDown
{
  id v2;
  id v3;
  char v4;

  if (a1)
  {
    if ((_accessibilityCanHandleContentPullDown__kAXCanHandleContentPullDownInitialized & 1) == 0)
    {
      v3 = (id)objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
      v2 = (id)objc_msgSend(v3, "bundleIdentifier");
      _accessibilityCanHandleContentPullDown__kAXCanHandleContentPullDown = (objc_msgSend(v2, "hasPrefix:", CFSTR("com.apple.")) ^ 1) & 1;

      _accessibilityCanHandleContentPullDown__kAXCanHandleContentPullDownInitialized = 1;
    }
    v4 = _accessibilityCanHandleContentPullDown__kAXCanHandleContentPullDown & 1;
  }
  else
  {
    v4 = 0;
  }
  return v4 & 1;
}

- (void)_axManipulateWithRefreshControl:(void *)a1
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  UIAccessibilityNotifications notification;
  id v9;
  id v10;
  id v11;
  id v12;
  char v13;
  id v14;
  id v15;
  id v16[5];
  int v17;
  id location;
  id v19;

  v19 = a1;
  location = 0;
  objc_storeStrong(&location, a2);
  if (v19)
  {
    objc_msgSend(location, "beginRefreshing");
    objc_msgSend(location, "sendActionsForControlEvents:", 4096);
    v10 = v19;
    objc_msgSend(v19, "contentOffset");
    v16[1] = v2;
    v16[2] = v3;
    v11 = (id)objc_msgSend(location, "safeValueForKey:", CFSTR("_refreshControlHeight"));
    objc_msgSend(v11, "floatValue");
    CGPointMake_5();
    v16[3] = v4;
    v16[4] = v5;
    objc_msgSend(v10, "setContentOffset:animated:", 1, *(double *)&v4, *(double *)&v5);

    v16[0] = (id)objc_msgSend(location, "_accessibilityAXAttributedLabel");
    v15 = (id)objc_msgSend(location, "_accessibilityAXAttributedHint");
    if (!v16[0])
    {
      v9 = (id)objc_msgSend(location, "attributedTitle");
      v16[0] = (id)objc_msgSend(v9, "string");

    }
    v6 = (id)__UIAXStringForVariables();
    v7 = v16[0];
    v16[0] = v6;

    notification = *MEMORY[0x24BDF71E8];
    v13 = 0;
    if (objc_msgSend(v16[0], "length", v15, CFSTR("__AXStringForVariablesSentinel")))
    {
      UIAccessibilityPostNotification(notification, v16[0]);
    }
    else
    {
      v14 = accessibilityLocalizedString(CFSTR("refreshing.content"));
      v13 = 1;
      UIAccessibilityPostNotification(notification, v14);
    }
    if ((v13 & 1) != 0)

    v12 = location;
    AXPerformBlockOnMainThreadAfterDelay();
    objc_storeStrong(&v12, 0);
    objc_storeStrong(&v15, 0);
    objc_storeStrong(v16, 0);
    v17 = 0;
  }
  else
  {
    v17 = 1;
  }
  objc_storeStrong(&location, 0);
}

uint64_t __61__UIScrollViewAccessibility__axManipulateWithRefreshControl___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "endRefreshing", a1, a1);
}

- (BOOL)_accessibilityContentOffsetForScrollDirection:(int)a3 newContentOffset:(CGPoint *)a4 distanceMultiplier:(double)a5
{
  double v5;
  double v6;
  CGFloat v7;
  CGFloat v8;
  double v9;
  double v10;
  BOOL v12;
  CGPoint v13;
  double v14;

  -[UIScrollViewAccessibility visibleBounds](self, "visibleBounds");
  v14 = v5;
  -[UIScrollViewAccessibility _accessibilityScrollHeightDistance](self, "_accessibilityScrollHeightDistance");
  -[UIScrollViewAccessibility _accessibilityScrollWidthDistance](self, "_accessibilityScrollWidthDistance");
  if (a3 <= 3uLL)
    __asm { BR              X8 }
  -[UIScrollViewAccessibility _accessibilityContentSize](self, "_accessibilityContentSize");
  if (v6 == v14)
    return 0;
  if (-[UIScrollViewAccessibility _accessibilityUseContentInset](self, "_accessibilityUseContentInset"))
    -[UIScrollViewAccessibility _accessibilityContentInset](self, "_accessibilityContentInset");
  CGPointMake_5();
  v13.x = v7;
  v13.y = v8;
  *a4 = v13;
  -[UIScrollViewAccessibility contentOffset](self, "contentOffset");
  v12 = 0;
  if (AXCGFAbs_0(v9 - a4->x) < 0.001)
  {
    -[UIScrollViewAccessibility contentOffset](self, "contentOffset");
    v12 = AXCGFAbs_0(v10 - a4->y) < 0.001;
  }
  return !v12;
}

__n128 __111__UIScrollViewAccessibility__accessibilityContentOffsetForScrollDirection_newContentOffset_distanceMultiplier___block_invoke(uint64_t a1)
{
  unint64_t v1;
  unint64_t v2;
  __n128 result;
  __n128 v5;

  objc_msgSend(*(id *)(a1 + 32), "_animatedTargetOffset");
  v5.n128_u64[0] = v1;
  v5.n128_u64[1] = v2;
  result = v5;
  *(__n128 *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 32) = v5;
  return result;
}

- (BOOL)_accessibilityScrollPageInDirection:(int)a3
{
  void *v3;
  id v4;
  uint64_t v5;
  BOOL ShouldAnimate;
  UIScrollViewAccessibility *v8;
  id v9;
  BOOL v10;
  __int128 v11;
  BOOL v12;
  int v13;
  id v14;
  uint64_t v15;
  id v16;
  id v17;
  unsigned int v18;
  unsigned int v19;
  SEL v20;
  UIScrollViewAccessibility *v21;
  char v22;

  v21 = self;
  v20 = a2;
  v19 = a3;
  v18 = 0;
  if (a3 <= 3uLL)
    __asm { BR              X8 }
  if ((-[UIScrollViewAccessibility _accessibilityHasActionBlockForKey:](v21, "_accessibilityHasActionBlockForKey:", v18) & 1) == 0)goto LABEL_8;
  v17 = 0;
  v16 = 0;
  v15 = 0;
  v14 = 0;
  -[UIScrollViewAccessibility _accessibilityActionBlock:andValue:forKey:](v21, "_accessibilityActionBlock:andValue:forKey:", &v15, &v14, v18);
  v3 = (void *)MEMORY[0x2348C3D88](v15);
  v4 = v17;
  v17 = v3;

  objc_storeStrong(&v16, v14);
  if (v17)
  {
    v22 = (*((uint64_t (**)(id, id))v17 + 2))(v17, v16) & 1;
    v13 = 1;
  }
  else
  {
    v13 = 0;
  }
  objc_storeStrong(&v16, 0);
  objc_storeStrong(&v17, 0);
  if (!v13)
  {
LABEL_8:
    v12 = 0;
    v10 = 1;
    if (v19)
      v10 = v19 == 1;
    v12 = v10;
    v8 = v21;
    if (v10)
      v5 = 1;
    else
      v5 = 2;
    v9 = (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v5);
    -[UIScrollViewAccessibility _accessibilitySetRetainedValue:forKey:](v8, "_accessibilitySetRetainedValue:forKey:");

    if (-[UIScrollViewAccessibility _accessibilityScrollingEnabled](v21, "_accessibilityScrollingEnabled"))
    {
      v11 = 0uLL;
      v11 = *MEMORY[0x24BDBEFB0];
      if (-[UIScrollViewAccessibility _accessibilityContentOffsetForScrollDirection:newContentOffset:distanceMultiplier:](v21, "_accessibilityContentOffsetForScrollDirection:newContentOffset:distanceMultiplier:", v19, &v11, 1.0))
      {
        ShouldAnimate = -[UIScrollViewAccessibility _accessibilityShouldAnimateScroll]((uint64_t)v21);
        -[UIScrollViewAccessibility accessibilityApplyScrollContent:sendScrollStatus:animated:](v21, "accessibilityApplyScrollContent:sendScrollStatus:animated:", 1, ShouldAnimate, v11);
        v22 = 1;
      }
      else
      {
        v22 = 0;
      }
    }
    else
    {
      v22 = 0;
    }
  }
  return v22 & 1;
}

- (double)_axPageSize
{
  double v1;
  double v2;
  double v3;
  double v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v8;
  double v9;
  double v10;
  id v11;
  id v12;
  __int128 v13;

  v12 = a1;
  if (a1)
  {
    v11 = v12;
    objc_msgSend(v11, "_interpageSpacing");
    v9 = v1;
    v10 = v2;
    v13 = 0uLL;
    objc_msgSend(v11, "bounds");
    *(double *)&v13 = v3 + v9;
    *((double *)&v13 + 1) = v4 + v10;
    UISizeRoundToViewScale();
    *(_QWORD *)&v8 = v5;
    *((_QWORD *)&v8 + 1) = v6;
    v13 = v8;
    objc_storeStrong(&v11, 0);
  }
  else
  {
    v13 = 0uLL;
  }
  return *(double *)&v13;
}

- (CGFloat)accessibilityValidateScrollContentOffset:(CGFloat)a3
{
  uint64_t v3;
  NSObject *v4;
  NSObject *v5;
  CGFloat v6;
  double v7;
  double v8;
  NSObject *log;
  os_log_type_t v11;
  NSString *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  NSString *v17;
  os_log_type_t type;
  os_log_t oslog[3];
  CGPoint v20;
  double v21;
  uint64_t v22;
  void *v23;
  CGPoint v24;
  CGPoint v25;
  uint8_t v26[24];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v24.x = a2;
  v24.y = a3;
  v23 = a1;
  if (a1)
  {
    if ((objc_msgSend(v23, "_axShouldScrollToAlignWithPage") & 1) != 0)
    {
      v21 = -[UIScrollViewAccessibility _axPageSize](v23);
      v22 = v3;
      CGPointMake_5();
      oslog[1] = v4;
      oslog[2] = v5;
      v20.x = -[UIScrollViewAccessibility _axPageAlignedContentOffsetForPoint:forValidation:](v23, 1, *(double *)&v4, *(double *)&v5);
      v20.y = v6;
      v24 = v20;
      oslog[0] = (os_log_t)(id)AXLogScrollToVisible();
      type = OS_LOG_TYPE_DEBUG;
      if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_DEBUG))
      {
        log = oslog[0];
        v11 = type;
        v12 = NSStringFromCGPoint(v24);
        v17 = v12;
        __os_log_helper_16_2_1_8_64((uint64_t)v26, (uint64_t)v17);
        _os_log_debug_impl(&dword_230C4A000, log, v11, "Validated: %@", v26, 0xCu);

        objc_storeStrong((id *)&v17, 0);
      }
      objc_storeStrong((id *)oslog, 0);
    }
    else
    {
      v15 = -[UIScrollViewAccessibility _axMinimumContentOffset](v23);
      v16 = v7;
      v13 = -[UIScrollViewAccessibility _axMaximumContentOffset](v23);
      v14 = v8;
      v24.x = CGFloatMinMax_0(v24.x, v15, v13);
      v24.y = CGFloatMinMax_0(v24.y, v16, v14);
    }
    v25 = v24;
  }
  else
  {
    v25 = (CGPoint)0;
  }
  return v25.x;
}

- (void)accessibilityApplyScrollContent:(CGPoint)a3 sendScrollStatus:(BOOL)a4 animated:(BOOL)a5
{
  double v5;
  BOOL v6;

  v6 = a4;
  v5 = 0.0;
  if (a5)
  {
    if (UIAccessibilityIsSwitchControlRunning())
    {
      -[UIScrollViewAccessibility accessibilityApplyScrollContent:sendScrollStatus:animateWithDuration:animationCurve:](self, v6, 1, a3.x, a3.y, 1.0);
      return;
    }
    v5 = 0.15;
  }
  -[UIScrollViewAccessibility accessibilityApplyScrollContent:sendScrollStatus:animateWithDuration:animationCurve:](self, v6, 0, a3.x, a3.y, v5);
}

- (void)accessibilityApplyScrollContent:(int)a3 sendScrollStatus:(CGFloat)a4 animateWithDuration:(CGFloat)a5 animationCurve:(double)a6
{
  CGFloat v6;
  double v7;
  double v8;
  int v9;
  NSObject *log;
  os_log_type_t type;
  NSString *v12;
  id v13;
  id v14;
  char v15;
  char v16;
  id v17[2];
  int v18;
  int v19;
  uint64_t (*v20)(uint64_t);
  void *v21;
  id v22;
  CGPoint v23;
  double v24;
  int v25;
  char v26;
  id v27;
  id v28;
  char v29;
  id v30;
  double v31;
  double v32;
  double v33;
  double v34;
  CGPoint v35;
  id v36;
  double v37;
  double v38;
  CGPoint v39;
  NSString *v40;
  char v41;
  id v42;
  BOOL v43;
  int v44;
  double v45;
  char v46;
  void *v47;
  CGPoint v48;
  uint8_t v49[24];
  uint64_t v50;

  v50 = *MEMORY[0x24BDAC8D0];
  v48.x = a4;
  v48.y = a5;
  v47 = a1;
  v46 = a2 & 1;
  v45 = a6;
  v44 = a3;
  if (a1)
  {
    v43 = v45 > 0.0;
    v42 = (id)AXLogScrollToVisible();
    v41 = 2;
    if (os_log_type_enabled((os_log_t)v42, OS_LOG_TYPE_DEBUG))
    {
      log = v42;
      type = v41;
      v9 = v43;
      v12 = NSStringFromCGPoint(v48);
      v40 = v12;
      __os_log_helper_16_2_2_4_0_8_64((uint64_t)v49, v9, (uint64_t)v40);
      _os_log_debug_impl(&dword_230C4A000, log, type, "Scrolling content animated: %i, to: %@", v49, 0x12u);

      objc_storeStrong((id *)&v40, 0);
    }
    objc_storeStrong(&v42, 0);
    v39.x = -[UIScrollViewAccessibility accessibilityValidateScrollContentOffset:](v47, v48.x, v48.y);
    v39.y = v6;
    v48 = v39;
    objc_msgSend(v47, "contentOffset");
    v37 = v7;
    v38 = v8;
    if (!__CGPointEqualToPoint_1(v7, v8, v48.x, v48.y))
    {
      v36 = (id)objc_msgSend(v47, "safeValueForKey:", CFSTR("delegate"));
      if ((objc_opt_respondsToSelector() & 1) != 0)
        objc_msgSend(v36, "scrollViewWillBeginDragging:", v47);
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        v35 = v48;
        objc_msgSend(v36, "scrollViewWillEndDragging:withVelocity:targetContentOffset:", v47, &v48, *MEMORY[0x24BDBEFB0], *(double *)(MEMORY[0x24BDBEFB0] + 8));
        if (AXCGFAbs_0(v37 - v48.x) >= 0.001 || AXCGFAbs_0(v38 - v48.y) >= 0.001)
        {
          if (AXCGFAbs_0(v35.x - v48.x) >= 0.001 || AXCGFAbs_0(v35.y - v48.y) >= 0.001)
          {
            if ((v34 = v35.x - v37, v33 = v35.y - v38, v32 = v48.x - v37, v31 = v48.y - v38, v35.x - v37 > 0.0)
              && v32 < 0.0
              || v34 < 0.0 && v32 > 0.0
              || v33 > 0.0 && v31 < 0.0
              || v33 < 0.0 && v31 > 0.0)
            {
              v48 = v35;
            }
          }
        }
        else
        {
          v48 = v35;
        }
      }
      v29 = 0;
      objc_opt_class();
      v28 = (id)__UIAccessibilityCastAsClass();
      v27 = v28;
      objc_storeStrong(&v28, 0);
      v30 = v27;
      v26 = objc_msgSend(v27, "_contentOffsetRoundingEnabled") & 1;
      objc_msgSend(v30, "_setContentOffsetRoundingEnabled:", 0);
      v17[1] = (id)MEMORY[0x24BDAC760];
      v18 = -1073741824;
      v19 = 0;
      v20 = __113__UIScrollViewAccessibility_accessibilityApplyScrollContent_sendScrollStatus_animateWithDuration_animationCurve___block_invoke;
      v21 = &unk_24FF3F258;
      v22 = v47;
      v23 = v48;
      v24 = v45;
      v25 = v44;
      AXPerformSafeBlock();
      v17[0] = (id)objc_msgSend(v47, "safeValueForKey:", CFSTR("_animation"));
      if (v43 && !v17[0])
        v43 = 0;
      if (v43)
      {
        objc_msgSend(v47, "_accessibilitySetBoolValue:forKey:", v46 & 1, CFSTR("_accessibilityScrollViewSendScrollStatus"));
        objc_msgSend(v47, "_accessibilitySetBoolValue:forKey:", 1, CFSTR("_accessibilityScrollViewAnimationEndedShouldHandleDelegateCallbacks"));
        objc_msgSend(v30, "_setContentOffsetRoundingEnabled:", v26 & 1);
      }
      else
      {
        v13 = v47;
        v15 = v46 & 1;
        v14 = v30;
        v16 = v26 & 1;
        AXPerformBlockOnMainThreadAfterDelay();
        objc_storeStrong(&v14, 0);
        objc_storeStrong(&v13, 0);
      }
      objc_storeStrong(v17, 0);
      objc_storeStrong(&v22, 0);
      objc_storeStrong(&v30, 0);
      objc_storeStrong(&v36, 0);
    }
  }
}

- (void)accessibilityApplyScrollContent:(CGPoint)a3 sendScrollStatus:(BOOL)a4 animateWithDuration:(double)a5
{
  -[UIScrollViewAccessibility accessibilityApplyScrollContent:sendScrollStatus:animateWithDuration:animationCurve:](self, a4, 0, a3.x, a3.y, a5);
}

- (void)accessibilityApplyScrollContentOverride:(CGPoint)a3 sendScrollStatus:(BOOL)a4 animateWithDuration:(double)a5 animationCurve:(int)a6
{
  -[UIScrollViewAccessibility accessibilityApplyScrollContent:sendScrollStatus:animateWithDuration:animationCurve:](self, a4, a6, a3.x, a3.y, a5);
}

uint64_t __113__UIScrollViewAccessibility_accessibilityApplyScrollContent_sendScrollStatus_animateWithDuration_animationCurve___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setContentOffset:duration:animationCurve:", *(unsigned int *)(a1 + 64), *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), a1, a1);
}

void __113__UIScrollViewAccessibility_accessibilityApplyScrollContent_sendScrollStatus_animateWithDuration_animationCurve___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  id v4;
  id v5;
  char v6;
  char v7;
  uint64_t v8;
  int v9;
  int v10;
  uint64_t (*v11)(uint64_t);
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  id v16[3];

  v16[2] = (id)a1;
  v16[1] = (id)a1;
  v16[0] = (id)objc_msgSend(*(id *)(a1 + 32), "safeValueForKey:", CFSTR("delegate"));
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v14 = 0;
    v15 = 0;
    objc_msgSend(*(id *)(a1 + 32), "contentOffset");
    v14 = v1;
    v15 = v2;
    objc_msgSend(v16[0], "scrollViewWillEndDragging:withVelocity:targetContentOffset:", *(_QWORD *)(a1 + 32), &v14, *MEMORY[0x24BDBEFB0], *(double *)(MEMORY[0x24BDBEFB0] + 8));
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v16[0], "scrollViewDidEndDragging:willDecelerate:", *(_QWORD *)(a1 + 32), 0);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v16[0], "scrollViewWillBeginDecelerating:", *(_QWORD *)(a1 + 32));
  v8 = MEMORY[0x24BDAC760];
  v9 = -1073741824;
  v10 = 0;
  v11 = __113__UIScrollViewAccessibility_accessibilityApplyScrollContent_sendScrollStatus_animateWithDuration_animationCurve___block_invoke_3;
  v12 = &unk_24FF3DA40;
  v13 = *(id *)(a1 + 32);
  AXPerformSafeBlock();
  objc_msgSend(*(id *)(a1 + 32), "_accessibilityScrollAnimationDurationDelay");
  v6 = *(_BYTE *)(a1 + 48) & 1;
  v4 = *(id *)(a1 + 32);
  v5 = *(id *)(a1 + 40);
  v7 = *(_BYTE *)(a1 + 49) & 1;
  AXPerformBlockOnMainThreadAfterDelay();
  objc_storeStrong(&v5, 0);
  objc_storeStrong(&v4, 0);
  objc_storeStrong(&v13, 0);
  objc_storeStrong(v16, 0);
}

uint64_t __113__UIScrollViewAccessibility_accessibilityApplyScrollContent_sendScrollStatus_animateWithDuration_animationCurve___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_scrollViewDidEndDeceleratingForDelegate", a1, a1);
}

uint64_t __113__UIScrollViewAccessibility_accessibilityApplyScrollContent_sendScrollStatus_animateWithDuration_animationCurve___block_invoke_4(uint64_t result)
{
  uint64_t v1;

  v1 = result;
  if ((*(_BYTE *)(result + 48) & 1) != 0)
  {
    objc_msgSend(*(id *)(result + 32), "_accessibilitySendScrollStatus");
    return objc_msgSend(*(id *)(v1 + 40), "_setContentOffsetRoundingEnabled:", *(_BYTE *)(v1 + 49) & 1);
  }
  return result;
}

- (void)_scrollViewAnimationEnded:(id)a3 finished:(BOOL)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  objc_super v9;
  uint64_t v10;
  int v11;
  int v12;
  void (*v13)(uint64_t, char);
  void *v14;
  UIScrollViewAccessibility *v15;
  char v16;
  uint64_t v17;
  int v18;
  int v19;
  id (*v20)(uint64_t);
  void *v21;
  id v22[2];
  int v23;
  int v24;
  uint64_t (*v25)(uint64_t);
  void *v26;
  UIScrollViewAccessibility *v27;
  uint64_t v28;
  uint64_t v29;
  id v30;
  char v31;
  char v32;
  BOOL v33;
  id location[2];
  UIScrollViewAccessibility *v35;

  v35 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v33 = a4;
  v32 = -[UIScrollViewAccessibility _accessibilityBoolValueForKey:](v35, "_accessibilityBoolValueForKey:", CFSTR("_accessibilityScrollViewAnimationEndedShouldHandleDelegateCallbacks")) & 1;
  if ((v32 & 1) != 0)
  {
    v31 = -[UIScrollViewAccessibility _accessibilityBoolValueForKey:](v35, "_accessibilityBoolValueForKey:") & 1;
    -[UIScrollViewAccessibility _accessibilitySetBoolValue:forKey:](v35, "_accessibilitySetBoolValue:forKey:", 0, CFSTR("_accessibilityScrollViewSendScrollStatus"));
    -[UIScrollViewAccessibility _accessibilitySetBoolValue:forKey:](v35, "_accessibilitySetBoolValue:forKey:", 0, CFSTR("_accessibilityScrollViewAnimationEndedShouldHandleDelegateCallbacks"));
    v30 = (id)-[UIScrollViewAccessibility safeValueForKey:](v35, "safeValueForKey:", CFSTR("delegate"));
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v28 = 0;
      v29 = 0;
      -[UIScrollViewAccessibility contentOffset](v35, "contentOffset");
      v28 = v4;
      v29 = v5;
      objc_msgSend(v30, "scrollViewWillEndDragging:withVelocity:targetContentOffset:", v35, &v28, *MEMORY[0x24BDBEFB0], *(double *)(MEMORY[0x24BDBEFB0] + 8));
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v30, "scrollViewDidEndDragging:willDecelerate:", v35, 1);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v30, "scrollViewWillBeginDecelerating:", v35);
    v6 = MEMORY[0x24BDAC760];
    v22[1] = (id)MEMORY[0x24BDAC760];
    v23 = -1073741824;
    v24 = 0;
    v25 = __64__UIScrollViewAccessibility__scrollViewAnimationEnded_finished___block_invoke;
    v26 = &unk_24FF3DA40;
    v27 = v35;
    AXPerformSafeBlock();
    v7 = (void *)MEMORY[0x24BDF6F90];
    v17 = v6;
    v18 = -1073741824;
    v19 = 0;
    v20 = __64__UIScrollViewAccessibility__scrollViewAnimationEnded_finished___block_invoke_2;
    v21 = &unk_24FF3DA40;
    v22[0] = v35;
    v10 = v6;
    v11 = -1073741824;
    v12 = 0;
    v13 = __64__UIScrollViewAccessibility__scrollViewAnimationEnded_finished___block_invoke_3;
    v14 = &unk_24FF3F2A8;
    v16 = v31 & 1;
    v15 = v35;
    objc_msgSend(v7, "animateWithDuration:animations:completion:", &v17, &v10, 0.15);
    objc_storeStrong((id *)&v15, 0);
    objc_storeStrong(v22, 0);
    objc_storeStrong((id *)&v27, 0);
    objc_storeStrong(&v30, 0);
  }
  else
  {
    v9.receiver = v35;
    v9.super_class = (Class)UIScrollViewAccessibility;
    -[UIScrollViewAccessibility _scrollViewAnimationEnded:finished:](&v9, sel__scrollViewAnimationEnded_finished_, location[0], v33);
  }
  objc_storeStrong(location, 0);
}

uint64_t __64__UIScrollViewAccessibility__scrollViewAnimationEnded_finished___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_scrollViewDidEndDeceleratingForDelegate", a1, a1);
}

id __64__UIScrollViewAccessibility__scrollViewAnimationEnded_finished___block_invoke_2(uint64_t a1)
{
  return (id)objc_msgSend(*(id *)(a1 + 32), "safeValueForKey:", CFSTR("_adjustContentOffsetIfNecessary"), a1, a1);
}

void __64__UIScrollViewAccessibility__scrollViewAnimationEnded_finished___block_invoke_3(uint64_t a1, char a2)
{
  id v3[2];
  char v4;
  uint64_t v5;

  v5 = a1;
  v4 = a2 & 1;
  v3[1] = (id)a1;
  if ((*(_BYTE *)(a1 + 40) & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "_accessibilityScrollAnimationDurationDelay");
    v3[0] = *(id *)(a1 + 32);
    AXPerformBlockOnMainThreadAfterDelay();
    objc_storeStrong(v3, 0);
  }
}

uint64_t __64__UIScrollViewAccessibility__scrollViewAnimationEnded_finished___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_accessibilitySendScrollStatus", a1, a1);
}

- (CGPoint)_accessibilityVisibleScrollArea:(BOOL)a3
{
  double v3;
  double v4;
  CGPoint result;

  -[UIScrollViewAccessibility visibleBounds](self, "visibleBounds");
  -[UIScrollViewAccessibility _accessibilityContentSize](self, "_accessibilityContentSize");
  CGPointMake_5();
  result.y = v4;
  result.x = v3;
  return result;
}

- (BOOL)accessibilityScrollUpPage
{
  return -[UIScrollViewAccessibility _accessibilityScrollPageInDirection:](self, "_accessibilityScrollPageInDirection:", 0, a2, self);
}

- (BOOL)accessibilityScrollDownPage
{
  return -[UIScrollViewAccessibility _accessibilityScrollPageInDirection:](self, "_accessibilityScrollPageInDirection:", 1, a2, self);
}

- (BOOL)accessibilityScrollLeftPage
{
  return -[UIScrollViewAccessibility _accessibilityScrollPageInDirection:](self, "_accessibilityScrollPageInDirection:", 2, a2, self);
}

- (BOOL)accessibilityScrollRightPage
{
  return -[UIScrollViewAccessibility _accessibilityScrollPageInDirection:](self, "_accessibilityScrollPageInDirection:", 3, a2, self);
}

- (BOOL)_accessibilityIsGroupedParent
{
  id v3;
  BOOL v4;

  v3 = (id)-[UIScrollViewAccessibility accessibilityLabel](self, "accessibilityLabel");
  v4 = objc_msgSend(v3, "length") == 0;

  return !v4;
}

- (CGRect)accessibilityFrame
{
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  objc_super v10;
  int v11;
  id location[2];
  UIScrollViewAccessibility *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  CGRect result;

  v13 = self;
  location[1] = (id)a2;
  location[0] = (id)-[UIScrollViewAccessibility accessibilityUserDefinedFrame](self, "accessibilityUserDefinedFrame");
  if (location[0])
  {
    objc_msgSend(location[0], "rectValue");
  }
  else
  {
    v10.receiver = v13;
    v10.super_class = (Class)UIScrollViewAccessibility;
    -[UIScrollViewAccessibility accessibilityFrame](&v10, sel_accessibilityFrame);
  }
  v14 = v2;
  v15 = v3;
  v16 = v4;
  v17 = v5;
  v11 = 1;
  objc_storeStrong(location, 0);
  v6 = v14;
  v7 = v15;
  v8 = v16;
  v9 = v17;
  result.size.height = v9;
  result.size.width = v8;
  result.origin.y = v7;
  result.origin.x = v6;
  return result;
}

- (CGRect)_accessibilityContentFrame
{
  double v2;
  double v3;
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

  -[UIScrollViewAccessibility bounds](self, "bounds");
  v12 = v2;
  v13 = v3;
  v14 = v4;
  v15 = v5;
  -[UIScrollViewAccessibility _accessibilityVisibleContentInset](self, "_accessibilityVisibleContentInset");
  UIEdgeInsetsInsetRect_0(v12, v13, v14, v15, v6, v7);
  UIAccessibilityFrameForBounds();
  result.size.height = v11;
  result.size.width = v10;
  result.origin.y = v9;
  result.origin.x = v8;
  return result;
}

- (UIEdgeInsets)_accessibilityContentInset
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  double v10;
  double v11;
  double v12;
  double v13;
  id v14[3];
  __int128 v15;
  __int128 v16;
  UIEdgeInsets result;

  v14[2] = self;
  v14[1] = (id)a2;
  v14[0] = self;
  v15 = 0u;
  v16 = 0u;
  objc_msgSend(v14[0], "adjustedContentInset");
  *(_QWORD *)&v15 = v2;
  *((_QWORD *)&v15 + 1) = v3;
  *(_QWORD *)&v16 = v4;
  *((_QWORD *)&v16 + 1) = v5;
  UIRoundToViewScale();
  *(_QWORD *)&v15 = v6;
  UIRoundToViewScale();
  *((_QWORD *)&v15 + 1) = v7;
  UIRoundToViewScale();
  *(_QWORD *)&v16 = v8;
  UIRoundToViewScale();
  *((_QWORD *)&v16 + 1) = v9;
  objc_storeStrong(v14, 0);
  v11 = *((double *)&v15 + 1);
  v10 = *(double *)&v15;
  v13 = *((double *)&v16 + 1);
  v12 = *(double *)&v16;
  result.right = v13;
  result.bottom = v12;
  result.left = v11;
  result.top = v10;
  return result;
}

- (BOOL)_accessibilityShouldUseFallbackForVisibleContentInset
{
  id v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  BOOL v12;
  id v13;
  BOOL v14;
  double v15;
  double v16;
  double v17;
  double v18;
  BOOL v20;

  v2 = -[UIScrollViewAccessibility _accessibilityStoredShouldUseFallbackForVisibleContentInset](self, "_accessibilityStoredShouldUseFallbackForVisibleContentInset");
  v14 = v2 == 0;

  if (v14)
  {
    -[UIScrollViewAccessibility _accessibilityContentInset](self, "_accessibilityContentInset");
    v17 = v3;
    v18 = v4;
    -[UIScrollViewAccessibility bounds](self, "bounds");
    v15 = v5;
    v16 = v6;
    UIEdgeInsetsInsetRect_0(v7, v8, v5, v6, v17, v18);
    v12 = 1;
    if (v9 > 0.0)
    {
      v12 = 1;
      if (v10 > 0.0)
      {
        v12 = 1;
        if (v9 <= v15)
          return v10 > v16;
      }
    }
    return v12;
  }
  else
  {
    v13 = -[UIScrollViewAccessibility _accessibilityStoredShouldUseFallbackForVisibleContentInset](self, "_accessibilityStoredShouldUseFallbackForVisibleContentInset");
    v20 = objc_msgSend(v13, "BOOLValue") & 1;

  }
  return v20;
}

- (id)_accessibilityStoredShouldUseFallbackForVisibleContentInset
{
  return objc_getAssociatedObject(self, &__UIScrollViewAccessibility___accessibilityStoredShouldUseFallbackForVisibleContentInset);
}

- (void)_accessibilitySetStoredShouldUseFallbackForVisibleContentInset:(uint64_t)a1
{
  id location;
  uint64_t v3;

  v3 = a1;
  location = 0;
  objc_storeStrong(&location, a2);
  if (v3)
    __UIAccessibilitySetAssociatedObject();
  objc_storeStrong(&location, 0);
}

- (void)_accessibilitySetShouldUseFallbackForVisibleContentInset:(BOOL)a3
{
  id v4;

  v4 = (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", a3);
  -[UIScrollViewAccessibility _accessibilitySetStoredShouldUseFallbackForVisibleContentInset:]((uint64_t)self, v4);

}

- (id)_accessibilityStoredVisibleContentInset
{
  return objc_getAssociatedObject(self, &__UIScrollViewAccessibility___accessibilityStoredVisibleContentInset);
}

- (void)_accessibilitySetStoredVisibleContentInset:(uint64_t)a1
{
  id location;
  uint64_t v3;

  v3 = a1;
  location = 0;
  objc_storeStrong(&location, a2);
  if (v3)
    __UIAccessibilitySetAssociatedObject();
  objc_storeStrong(&location, 0);
}

- (UIEdgeInsets)_accessibilityVisibleContentInset
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  double v18;
  CGFloat v19;
  CGFloat v20;
  CGFloat v21;
  CGFloat v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double rect_24;
  CGRect r2;
  __int128 v30;
  __int128 v31;
  CGRect v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  id location[2];
  UIScrollViewAccessibility *v38;
  __int128 v39;
  __int128 v40;
  CGRect v41;
  UIEdgeInsets result;

  v38 = self;
  location[1] = (id)a2;
  v39 = 0u;
  v40 = 0u;
  v39 = *MEMORY[0x24BDF7718];
  v40 = *(_OWORD *)(MEMORY[0x24BDF7718] + 16);
  location[0] = -[UIScrollViewAccessibility _accessibilityStoredVisibleContentInset](self, "_accessibilityStoredVisibleContentInset");
  if (location[0])
  {
    objc_msgSend(location[0], "UIEdgeInsetsValue");
    *(_QWORD *)&v35 = v2;
    *((_QWORD *)&v35 + 1) = v3;
    *(_QWORD *)&v36 = v4;
    *((_QWORD *)&v36 + 1) = v5;
    v39 = v35;
    v40 = v36;
  }
  else
  {
    -[UIScrollViewAccessibility _accessibilityContentInset](v38, "_accessibilityContentInset");
    *(_QWORD *)&v33 = v6;
    *((_QWORD *)&v33 + 1) = v7;
    *(_QWORD *)&v34 = v8;
    *((_QWORD *)&v34 + 1) = v9;
    v39 = v33;
    v40 = v34;
    -[UIScrollViewAccessibility bounds](v38, "bounds");
    v32.origin.x = v10;
    v32.origin.y = v11;
    v32.size.width = v12;
    v32.size.height = v13;
    if (-[UIScrollViewAccessibility _accessibilityShouldUseFallbackForVisibleContentInset](v38, "_accessibilityShouldUseFallbackForVisibleContentInset"))
    {
      -[UIScrollViewAccessibility _accessibilityNavigationControllerInset](v38, "_accessibilityNavigationControllerInset");
      *(_QWORD *)&v30 = v14;
      *((_QWORD *)&v30 + 1) = v15;
      *(_QWORD *)&v31 = v16;
      *((_QWORD *)&v31 + 1) = v17;
      v39 = v30;
      v40 = v31;
      -[UIScrollViewAccessibility _accessibilityContentInset](v38, "_accessibilityContentInset");
      if (v18 > *(double *)&v31
        && (objc_msgSend((id)*MEMORY[0x24BDF74F8], "_accessibilitySoftwareKeyboardCoversElement:", v38, v18) & 1) != 0)
      {
        objc_msgSend((id)*MEMORY[0x24BDF74F8], "_accessibilitySoftwareKeyboardAccessibilityFrame");
        UIAccessibilityFrameToBounds();
        r2.origin.x = v19;
        r2.origin.y = v20;
        r2.size.width = v21;
        r2.size.height = v22;
        v41 = CGRectIntersection(v32, r2);
        rect_24 = v41.size.height;
        if (!CGRectIsNull(v41))
        {
          if (rect_24 >= *(double *)&v40)
            v27 = rect_24;
          else
            v27 = *(double *)&v40;
          *(double *)&v40 = v27;
        }
      }
    }
  }
  objc_storeStrong(location, 0);
  v24 = *((double *)&v39 + 1);
  v23 = *(double *)&v39;
  v26 = *((double *)&v40 + 1);
  v25 = *(double *)&v40;
  result.right = v26;
  result.bottom = v25;
  result.left = v24;
  result.top = v23;
  return result;
}

- (void)_accessibilitySetVisibleContentInset:(UIEdgeInsets)a3
{
  id v4;

  v4 = (id)objc_msgSend(MEMORY[0x24BDD1968], "valueWithUIEdgeInsets:", a3.top, a3.left, a3.bottom, a3.right);
  -[UIScrollViewAccessibility _accessibilitySetStoredVisibleContentInset:]((uint64_t)self, v4);

}

- (UIEdgeInsets)_accessibilityNavigationControllerInset
{
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  id v10;
  double v11;
  double v12;
  double v13;
  double v14;
  UIEdgeInsets result;

  v10 = objc_getAssociatedObject(self, &_NavigationControllerInsetStorage);
  objc_msgSend(v10, "UIEdgeInsetsValue");
  v11 = v2;
  v12 = v3;
  v13 = v4;
  v14 = v5;

  v6 = v11;
  v7 = v12;
  v8 = v13;
  v9 = v14;
  result.right = v9;
  result.bottom = v8;
  result.left = v7;
  result.top = v6;
  return result;
}

- (id)_accessibilityUIViewAccessibilityFrame
{
  double v2;
  double v3;
  double v4;
  double v5;
  void *v7;
  objc_super v8;
  double v9;
  double v10;
  double v11;
  double v12;
  SEL v13;
  UIScrollViewAccessibility *v14;

  v14 = self;
  v13 = a2;
  v7 = (void *)MEMORY[0x24BDD1968];
  v8.receiver = self;
  v8.super_class = (Class)UIScrollViewAccessibility;
  -[UIScrollViewAccessibility accessibilityFrame](&v8, sel_accessibilityFrame);
  v9 = v2;
  v10 = v3;
  v11 = v4;
  v12 = v5;
  return (id)objc_msgSend(v7, "valueWithCGRect:", v2, v3, v4, v5);
}

- (id)_staticScrollBar
{
  id v3;
  objc_super v4;
  id v5[3];

  v5[2] = self;
  v5[1] = (id)a2;
  v4.receiver = self;
  v4.super_class = (Class)UIScrollViewAccessibility;
  v5[0] = -[UIScrollViewAccessibility _staticScrollBar](&v4, sel__staticScrollBar);
  objc_msgSend(v5[0], "_accessibilityLoadAccessibilityInformation");
  v3 = v5[0];
  objc_storeStrong(v5, 0);
  return v3;
}

- (BOOL)_accessibilityIsScannerGroup
{
  return 1;
}

- (id)automationElements
{
  id v2;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  char v13;
  id v14;
  objc_super v15;
  id v16[2];
  UIScrollViewAccessibility *v17;

  v17 = self;
  v16[1] = (id)a2;
  v15.receiver = self;
  v15.super_class = (Class)UIScrollViewAccessibility;
  v11 = -[UIScrollViewAccessibility automationElements](&v15, sel_automationElements);
  v12 = (void *)objc_msgSend(v11, "mutableCopy");
  v13 = 0;
  if (v12)
  {
    v2 = v12;
  }
  else
  {
    v14 = (id)objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v13 = 1;
    v2 = v14;
  }
  v16[0] = v2;
  if ((v13 & 1) != 0)

  v4 = v16[0];
  v5 = (id)-[UIScrollViewAccessibility safeValueForKey:](v17, "safeValueForKey:", CFSTR("_staticScrollBar"));
  objc_msgSend(v4, "axSafelyAddObject:");

  v6 = v16[0];
  v7 = (id)-[UIScrollViewAccessibility safeValueForKey:](v17, "safeValueForKey:", CFSTR("_verticalScrollIndicator"));
  objc_msgSend(v6, "axSafelyAddObject:");

  v8 = v16[0];
  v9 = (id)-[UIScrollViewAccessibility safeValueForKey:](v17, "safeValueForKey:", CFSTR("_horizontalScrollIndicator"));
  objc_msgSend(v8, "axSafelyAddObject:");

  v10 = v16[0];
  objc_storeStrong(v16, 0);
  return v10;
}

- (id)accessibilityPath
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGFloat v6;
  CGFloat v7;
  CGFloat v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  CGFloat v18;
  CGFloat v19;
  CGFloat v20;
  double v21;
  double v22;
  double v23;
  void *v25;
  uint64_t v26;
  id v27;
  id v28;
  double v29;
  id v30;
  double Height;
  BOOL v32;
  double v33;
  double v34;
  double v35;
  double v36;
  id v37;
  id v38;
  id v39;
  CGRect v40;
  CGPoint v41;
  CGSize v42;
  CGRect rect2;
  id v44;
  char v45;
  id v46;
  CGRect v47;
  BOOL v48;
  double v49;
  uint64_t v50;
  CGRect v51;
  id v52;
  id v53;
  CGRect v54;
  double v55;
  double v56;
  double v57;
  double v58;
  CGRect rect;
  CGRect rect1;
  double v61;
  uint64_t v62;
  int v63;
  int v64;
  __n128 (*v65)(uint64_t);
  void *v66;
  id v67[2];
  uint64_t v68;
  uint64_t *v69;
  int v70;
  int v71;
  void *v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  BOOL v77;
  id v78;
  id v79;
  char v80;
  id v81[2];
  UIScrollViewAccessibility *v82;
  CGRect v83;
  CGRect v84;

  v82 = self;
  v81[1] = (id)a2;
  v80 = 0;
  objc_opt_class();
  v39 = (id)-[UIScrollViewAccessibility _accessibilityFindAncestor:startWithSelf:](v82, "_accessibilityFindAncestor:startWithSelf:", &__block_literal_global_372, 1);
  v38 = (id)objc_msgSend(v39, "_accessibilityViewController");
  v37 = (id)objc_msgSend(v38, "safeValueForKey:", CFSTR("popoverPresentationController"));
  v79 = (id)__UIAccessibilityCastAsClass();

  v78 = v79;
  objc_storeStrong(&v79, 0);
  v81[0] = v78;
  v77 = v78 != 0;
  v75 = 0u;
  v76 = 0u;
  if (v78)
  {
    v68 = 0;
    v69 = &v68;
    v70 = 0x10000000;
    v71 = 64;
    v72 = &unk_230DEFD8E;
    v73 = 0u;
    v74 = 0u;
    v62 = MEMORY[0x24BDAC760];
    v63 = -1073741824;
    v64 = 0;
    v65 = __46__UIScrollViewAccessibility_accessibilityPath__block_invoke_2;
    v66 = &unk_24FF3DE88;
    v67[1] = &v68;
    v67[0] = v81[0];
    AXPerformSafeBlock();
    v75 = *((_OWORD *)v69 + 2);
    v76 = *((_OWORD *)v69 + 3);
    objc_storeStrong(v67, 0);
    _Block_object_dispose(&v68, 8);
  }
  else
  {
    v75 = *MEMORY[0x24BDF7718];
    v76 = *(_OWORD *)(MEMORY[0x24BDF7718] + 16);
  }
  v61 = 44.0;
  -[UIScrollViewAccessibility accessibilityFrame](v82, "accessibilityFrame");
  rect = v83;
  rect1 = CGRectIntegral(v83);
  -[UIScrollViewAccessibility safeAreaInsets](v82, "safeAreaInsets");
  v55 = v2;
  v56 = v3;
  v57 = v4;
  v58 = v5;
  if (v2 <= 44.0)
    v36 = *(double *)&v75;
  else
    v36 = v55;
  v55 = v36;
  if (v56 <= v61)
    v35 = *((double *)&v75 + 1);
  else
    v35 = v56;
  v56 = v35;
  if (v58 <= v61)
    v34 = *((double *)&v76 + 1);
  else
    v34 = v58;
  v58 = v34;
  if (v57 <= v61)
    v33 = *(double *)&v76;
  else
    v33 = v57;
  v57 = v33;
  v54.origin.x = UIEdgeInsetsInsetRect_0(rect1.origin.x, rect1.origin.y, rect1.size.width, rect1.size.height, v55, v56);
  v54.origin.y = v6;
  v54.size.width = v7;
  v54.size.height = v8;
  rect1 = v54;
  v53 = (id)MEMORY[0x2348C3D88](&__block_literal_global_377);
  v52 = (id)-[UIScrollViewAccessibility _accessibilityWindow](v82, "_accessibilityWindow");
  objc_msgSend(v52, "accessibilityFrame");
  v51.origin.x = v9;
  v51.origin.y = v10;
  v51.size.width = v11;
  v51.size.height = v12;
  v50 = 0;
  v50 = (*((uint64_t (**)(double, double, double, double, double, double, double, double))v53 + 2))(v54.origin.x, v54.origin.y, v54.size.width, v54.size.height, v9, v10, v11, v12);
  v49 = 0.0;
  if ((*((uint64_t (**)(double, double, double, double, double, double, double, double))v53 + 2))(v54.origin.x, v54.origin.y, v54.size.width, v54.size.height, v51.origin.x, v51.origin.y, v51.size.width, v51.size.height))
  {
    v30 = (id)objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
    objc_msgSend(v30, "bounds");
    v47 = v84;
    Height = CGRectGetHeight(v84);
    v32 = Height != CGRectGetHeight(v51);

    v48 = v32;
    v45 = 0;
    if (v32)
    {
      v29 = 10.0;
    }
    else
    {
      v46 = (id)-[UIScrollViewAccessibility traitCollection](v82, "traitCollection");
      v45 = 1;
      objc_msgSend(v46, "displayCornerRadius");
      v29 = v13;
    }
    v49 = v29;
    if ((v45 & 1) != 0)

  }
  else
  {
    v44 = (id)-[UIScrollViewAccessibility _accessibilityFindViewAncestor:startWithSelf:](v82, "_accessibilityFindViewAncestor:startWithSelf:", &__block_literal_global_380, 0);
    if (v44)
    {
      objc_msgSend(v44, "accessibilityFrame");
      rect2.origin.x = v14;
      rect2.origin.y = v15;
      rect2.size.width = v16;
      rect2.size.height = v17;
      if (v77)
      {
        v41.x = UIEdgeInsetsInsetRect_0(v14, v15, v16, v17, *(double *)&v75, *((double *)&v75 + 1));
        v41.y = v18;
        v42.width = v19;
        v42.height = v20;
        rect2.origin = v41;
        rect2.size = v42;
      }
      v40 = CGRectIntegral(rect2);
      if (CGRectContainsRect(rect1, v40))
        rect1 = v40;
      v50 = (*((uint64_t (**)(double, double, double, double, double, double, double, double))v53 + 2))(rect1.origin.x, rect1.origin.y, rect1.size.width, rect1.size.height, v40.origin.x, v40.origin.y, v40.size.width, v40.size.height);
      v28 = (id)objc_msgSend(v44, "layer");
      objc_msgSend(v28, "cornerRadius");
      v49 = v21;

    }
    objc_storeStrong(&v44, 0);
  }
  v25 = (void *)MEMORY[0x24BDF6870];
  v26 = v50;
  CGSizeMake_1();
  v27 = (id)objc_msgSend(v25, "bezierPathWithRoundedRect:byRoundingCorners:cornerRadii:", v26, rect1.origin.x, rect1.origin.y, rect1.size.width, rect1.size.height, v22, v23);
  objc_storeStrong(&v52, 0);
  objc_storeStrong(&v53, 0);
  objc_storeStrong(v81, 0);
  return v27;
}

BOOL __46__UIScrollViewAccessibility_accessibilityPath__block_invoke(void *a1, void *a2)
{
  id v2;
  BOOL v4;
  id location[2];

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v2 = (id)objc_msgSend(location[0], "_accessibilityViewController");
  v4 = v2 != 0;

  objc_storeStrong(location, 0);
  return v4;
}

__n128 __46__UIScrollViewAccessibility_accessibilityPath__block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  __n128 result;
  __int128 v8;
  __n128 v9;

  objc_msgSend(*(id *)(a1 + 32), "_additionalSafeAreaInsets");
  *(_QWORD *)&v8 = v1;
  *((_QWORD *)&v8 + 1) = v2;
  v9.n128_u64[0] = v3;
  v9.n128_u64[1] = v4;
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  *(_OWORD *)(v5 + 32) = v8;
  result = v9;
  *(__n128 *)(v5 + 48) = v9;
  return result;
}

uint64_t __46__UIScrollViewAccessibility_accessibilityPath__block_invoke_3(double a1, double a2, double a3, double a4, double a5, double a6, double a7, double a8)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  double v12;
  double v13;
  BOOL v14;
  double MaxY;
  double v16;
  BOOL v17;
  double v18;
  double MaxX;
  BOOL v20;
  double MinY;
  double MinX;
  BOOL v23;
  unint64_t v24;
  uint64_t v25;
  _BYTE v26[32];
  _BYTE v27[32];

  *(double *)v27 = a1;
  *(double *)&v27[8] = a2;
  *(double *)&v27[16] = a3;
  *(double *)&v27[24] = a4;
  *(double *)v26 = a5;
  *(double *)&v26[8] = a6;
  *(double *)&v26[16] = a7;
  *(double *)&v26[24] = a8;
  MinX = CGRectGetMinX(*(CGRect *)&a1);
  v23 = 0;
  if (MinX == CGRectGetMinX(*(CGRect *)v26))
  {
    MinY = CGRectGetMinY(*(CGRect *)v27);
    v23 = MinY == CGRectGetMinY(*(CGRect *)v26);
  }
  MaxX = CGRectGetMaxX(*(CGRect *)v27);
  v20 = 0;
  if (MaxX == CGRectGetMaxX(*(CGRect *)v26))
  {
    v18 = CGRectGetMinY(*(CGRect *)v27);
    v20 = v18 == CGRectGetMinY(*(CGRect *)v26);
  }
  v8 = 0;
  if (v20)
    v8 = 2;
  v24 = v23 | (unint64_t)v8;
  v16 = CGRectGetMinX(*(CGRect *)v27);
  v17 = 0;
  if (v16 == CGRectGetMinX(*(CGRect *)v26))
  {
    MaxY = CGRectGetMaxY(*(CGRect *)v27);
    v17 = MaxY == CGRectGetMaxY(*(CGRect *)v26);
  }
  v9 = 0;
  if (v17)
    v9 = 4;
  v25 = v24 | v9;
  v13 = CGRectGetMaxX(*(CGRect *)v27);
  v14 = 0;
  if (v13 == CGRectGetMaxX(*(CGRect *)v26))
  {
    v12 = CGRectGetMaxY(*(CGRect *)v27);
    v14 = v12 == CGRectGetMaxY(*(CGRect *)v26);
  }
  v10 = 0;
  if (v14)
    v10 = 8;
  return v25 | v10;
}

BOOL __46__UIScrollViewAccessibility_accessibilityPath__block_invoke_4(void *a1, void *a2)
{
  double v2;
  id v4;
  BOOL v5;
  id location[2];

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v4 = (id)objc_msgSend(location[0], "layer");
  objc_msgSend(v4, "cornerRadius");
  v5 = v2 > 0.0;

  objc_storeStrong(location, 0);
  return v5;
}

- (CGRect)_defaultFocusRegionFrame
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  double v6;
  double v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  double v11;
  double v12;
  double v13;
  double v14;
  __int128 v15;
  __int128 v16;
  objc_super v17;
  SEL v18;
  UIScrollViewAccessibility *v19;
  __int128 v20;
  __int128 v21;
  CGRect result;

  v19 = self;
  v18 = a2;
  v20 = 0u;
  v21 = 0u;
  v17.receiver = self;
  v17.super_class = (Class)UIScrollViewAccessibility;
  -[UIScrollViewAccessibility _defaultFocusRegionFrame](&v17, sel__defaultFocusRegionFrame);
  *(_QWORD *)&v20 = v2;
  *((_QWORD *)&v20 + 1) = v3;
  *(_QWORD *)&v21 = v4;
  *((_QWORD *)&v21 + 1) = v5;
  if ((-[UIScrollViewAccessibility _accessibilityIsFKARunningForFocusItem](v19, "_accessibilityIsFKARunningForFocusItem") & 1) != 0)
  {
    -[UIScrollViewAccessibility safeAreaInsets](v19, "safeAreaInsets");
    *(_QWORD *)&v15 = UIEdgeInsetsInsetRect_0(*(double *)&v20, *((double *)&v20 + 1), *(double *)&v21, *((double *)&v21 + 1), v6, v7);
    *((_QWORD *)&v15 + 1) = v8;
    *(_QWORD *)&v16 = v9;
    *((_QWORD *)&v16 + 1) = v10;
    v20 = v15;
    v21 = v16;
  }
  v12 = *((double *)&v20 + 1);
  v11 = *(double *)&v20;
  v14 = *((double *)&v21 + 1);
  v13 = *(double *)&v21;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (BOOL)_accessibilityDrawsFocusRingWhenChildrenFocused
{
  return (AXProcessIsSpringBoard() ^ 1) & 1;
}

- (BOOL)_accessibilityRemembersLastFocusedChild
{
  id v2;
  BOOL v4;

  v2 = (id)-[UIScrollViewAccessibility focusGroupIdentifier](self, "focusGroupIdentifier");
  v4 = v2 != 0;

  return v4;
}

- (id)_axVerticalScrollIndicator
{
  id v2;
  id v3;
  id v4;
  char v5;
  id v6;
  id v7;

  v6 = a1;
  if (a1)
  {
    v5 = 0;
    objc_opt_class();
    v2 = (id)objc_msgSend(v6, "safeValueForKey:", CFSTR("_verticalScrollIndicator"));
    v4 = (id)__UIAccessibilityCastAsSafeCategory();

    v3 = v4;
    objc_storeStrong(&v4, 0);
    v7 = v3;
  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (id)_axHorizontalScrollIndicator
{
  id v2;
  id v3;
  id v4;
  char v5;
  id v6;
  id v7;

  v6 = a1;
  if (a1)
  {
    v5 = 0;
    objc_opt_class();
    v2 = (id)objc_msgSend(v6, "safeValueForKey:", CFSTR("_horizontalScrollIndicator"));
    v4 = (id)__UIAccessibilityCastAsSafeCategory();

    v3 = v4;
    objc_storeStrong(&v4, 0);
    v7 = v3;
  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (void)_adjustScrollerIndicators:(BOOL)a3 alwaysShowingThem:(BOOL)a4
{
  objc_super v4;
  BOOL v5;
  BOOL v6;
  SEL v7;
  UIScrollViewAccessibility *v8;

  v8 = self;
  v7 = a2;
  v6 = a3;
  v5 = a4;
  v4.receiver = self;
  v4.super_class = (Class)UIScrollViewAccessibility;
  -[UIScrollViewAccessibility _adjustScrollerIndicators:alwaysShowingThem:](&v4, sel__adjustScrollerIndicators_alwaysShowingThem_, a3, a4);
  -[UIScrollViewAccessibility _axAnnotateScrollBars](v8);
}

- (void)_hideScrollIndicators
{
  id v2;
  char v3;
  id v4;
  char v5;
  objc_super v6;
  SEL v7;
  UIScrollViewAccessibility *v8;

  v8 = self;
  v7 = a2;
  v4 = -[UIScrollViewAccessibility _axVerticalScrollIndicator](self);
  v5 = -[_UIScrollViewScrollIndicatorAccessibility accessibilityScrollIndicatorIsFocused]((uint64_t)v4);

  if ((v5 & 1) == 0)
  {
    v2 = -[UIScrollViewAccessibility _axHorizontalScrollIndicator](v8);
    v3 = -[_UIScrollViewScrollIndicatorAccessibility accessibilityScrollIndicatorIsFocused]((uint64_t)v2);

    if ((v3 & 1) == 0)
    {
      v6.receiver = v8;
      v6.super_class = (Class)UIScrollViewAccessibility;
      -[UIScrollViewAccessibility _hideScrollIndicators](&v6, sel__hideScrollIndicators);
    }
  }
}

- (BOOL)_accessibilityIsSortPriorityContainer
{
  return 1;
}

- (BOOL)accessibilityShouldEnableScrollIndicator:(id)a3
{
  uint64_t v3;
  uint64_t v5;
  os_log_t oslog;
  char v7;
  int v8;
  id location[2];
  UIScrollViewAccessibility *v10;
  char v11;
  uint8_t v12[24];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v10 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if ((MEMORY[0x2348C3818]() & 1) != 0)
  {
    if ((UIAccessibilityIsWidgetExtension() & 1) != 0)
    {
      v11 = 0;
      v8 = 1;
    }
    else
    {
      v7 = 0;
      v5 = -[_UIScrollViewScrollIndicatorAccessibility accessibilityScrollDirection]((uint64_t)location[0]);
      if (v5 == 1)
      {
        v7 = -[UIScrollViewAccessibility _axShowsVerticalScrollBar](v10, "_axShowsVerticalScrollBar");
      }
      else if (v5 == 2)
      {
        v7 = -[UIScrollViewAccessibility _axShowsHorizontalScrollBar](v10, "_axShowsHorizontalScrollBar");
      }
      else
      {
        oslog = (os_log_t)(id)AXLogAppAccessibility();
        if (os_log_type_enabled(oslog, OS_LOG_TYPE_FAULT))
        {
          v3 = -[_UIScrollViewScrollIndicatorAccessibility accessibilityScrollDirection]((uint64_t)location[0]);
          __os_log_helper_16_0_1_8_0((uint64_t)v12, v3);
          _os_log_fault_impl(&dword_230C4A000, oslog, OS_LOG_TYPE_FAULT, "Unexpected direction for indicator: %ld", v12, 0xCu);
        }
        objc_storeStrong((id *)&oslog, 0);
      }
      if ((v7 & 1) != 0)
        v7 = -[UIScrollViewAccessibility accessibilityNumberOfPagesForScrollIndicator:](v10, "accessibilityNumberOfPagesForScrollIndicator:", location[0]) >= 5;
      v11 = v7 & 1;
      v8 = 1;
    }
  }
  else
  {
    v11 = 0;
    v8 = 1;
  }
  objc_storeStrong(location, 0);
  return v11 & 1;
}

- (void)accessibilityScrollIndicator:(id)a3 didBecomeFocused:(BOOL)a4
{
  UIScrollViewAccessibility *v5;
  id v6;
  BOOL v7;
  id location[2];
  UIScrollViewAccessibility *v9;

  v9 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v7 = a4;
  v6 = v9;
  if (a4)
  {
    objc_msgSend(v6, "flashScrollIndicators");
  }
  else
  {
    v5 = v9;
    AXPerformSafeBlock();
    objc_storeStrong((id *)&v5, 0);
  }
  objc_storeStrong(&v6, 0);
  objc_storeStrong(location, 0);
}

uint64_t __75__UIScrollViewAccessibility_accessibilityScrollIndicator_didBecomeFocused___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_hideScrollIndicators", a1, a1);
}

- (void)accessibilityScrollIndicator:(id)a3 addProgress:(double)a4
{
  uint64_t v4;
  double v5;
  UIScrollViewAccessibility *v7;
  double v8;
  id location[2];
  UIScrollViewAccessibility *v10;

  v10 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v7 = v10;
  v4 = -[_UIScrollViewScrollIndicatorAccessibility accessibilityScrollDirection]((uint64_t)location[0]);
  v8 = -[UIScrollViewAccessibility _axContentOffsetForAddedProgress:inDirection:](v7, v4, a4);
  -[UIScrollViewAccessibility setContentOffset:](v10, "setContentOffset:", v8, v5);
  objc_storeStrong(location, 0);
}

- (double)_axContentOffsetForAddedProgress:(double)a3 inDirection:
{
  uint64_t v3;
  uint64_t v4;
  double v5;
  double v6;
  double v7;
  uint64_t v8;
  uint64_t v9;
  double v10;
  id v12;
  BOOL v13;
  os_log_t oslog;
  double v15;
  double v16;
  uint64_t v17;
  double v18;
  double v19;
  uint64_t v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  __int128 v29;
  id location;
  uint64_t v31;
  double v32;
  void *v33;
  __int128 v34;
  uint8_t v35[24];
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v33 = a1;
  v32 = a3;
  v31 = a2;
  if (a1)
  {
    location = v33;
    objc_msgSend(location, "contentOffset");
    *(_QWORD *)&v29 = v3;
    *((_QWORD *)&v29 + 1) = v4;
    v34 = v29;
    if (v31 == 1)
    {
      v26 = -[UIScrollViewAccessibility _axMinimumContentOffset](v33);
      v27 = v5;
      v28 = v5;
      v23 = -[UIScrollViewAccessibility _axMaximumContentOffset](v33);
      v24 = v6;
      v25 = v6;
      if (v28 < v6)
      {
        v7 = CGFloatMin_0(*((double *)&v29 + 1) + v32 * (v25 - v28), v25);
        v22 = CGFloatMax_0(v7, v28);
        *((double *)&v34 + 1) = v22;
      }
    }
    else if (v31 == 2)
    {
      v12 = (id)objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication");
      v13 = objc_msgSend(v12, "userInterfaceLayoutDirection") != 1;

      if (!v13)
        v32 = v32 * -1.0;
      v19 = -[UIScrollViewAccessibility _axMinimumContentOffset](v33);
      v20 = v8;
      v21 = v19;
      v16 = -[UIScrollViewAccessibility _axMaximumContentOffset](v33);
      v17 = v9;
      v18 = v16;
      if (v19 < v16)
      {
        v10 = CGFloatMin_0(*(double *)&v29 + v32 * (v18 - v21), v18);
        v15 = CGFloatMax_0(v10, v21);
        *(double *)&v34 = v15;
      }
    }
    else
    {
      oslog = (os_log_t)(id)AXLogAppAccessibility();
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_FAULT))
      {
        __os_log_helper_16_0_1_8_0((uint64_t)v35, v31);
        _os_log_fault_impl(&dword_230C4A000, oslog, OS_LOG_TYPE_FAULT, "Unexpected direction for indicator: %ld", v35, 0xCu);
      }
      objc_storeStrong((id *)&oslog, 0);
    }
    objc_storeStrong(&location, 0);
  }
  else
  {
    v34 = 0uLL;
  }
  return *(double *)&v34;
}

- (int64_t)accessibilityNumberOfPagesForScrollIndicator:(id)a3
{
  uint64_t v3;
  int64_t v5;
  uint64_t v6;
  os_log_t oslog;
  uint64_t v8;
  id location[2];
  UIScrollViewAccessibility *v10;
  uint8_t v11[24];
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v10 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v8 = 0;
  v6 = -[_UIScrollViewScrollIndicatorAccessibility accessibilityScrollDirection]((uint64_t)location[0]);
  if (v6 == 1)
  {
    -[UIScrollViewAccessibility _accessibilityCurrentPage:totalPages:forVerticalDirection:](v10, 0, &v8, 1);
  }
  else if (v6 == 2)
  {
    -[UIScrollViewAccessibility _accessibilityCurrentPage:totalPages:forVerticalDirection:](v10, 0, &v8, 0);
  }
  else
  {
    oslog = (os_log_t)(id)AXLogAppAccessibility();
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_FAULT))
    {
      v3 = -[_UIScrollViewScrollIndicatorAccessibility accessibilityScrollDirection]((uint64_t)location[0]);
      __os_log_helper_16_0_1_8_0((uint64_t)v11, v3);
      _os_log_fault_impl(&dword_230C4A000, oslog, OS_LOG_TYPE_FAULT, "Unexpected direction for indicator: %ld", v11, 0xCu);
    }
    objc_storeStrong((id *)&oslog, 0);
  }
  v5 = v8;
  objc_storeStrong(location, 0);
  return v5;
}

- (double)accessibilityProgressForScrollIndicator:(id)a3
{
  uint64_t v3;
  UIScrollViewAccessibility *v5;
  double v6;
  id location[2];
  UIScrollViewAccessibility *v8;

  v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v5 = v8;
  v3 = -[_UIScrollViewScrollIndicatorAccessibility accessibilityScrollDirection]((uint64_t)location[0]);
  v6 = -[UIScrollViewAccessibility _axProgressForDirection:](v5, v3);
  objc_storeStrong(location, 0);
  return v6;
}

- (double)_axProgressForDirection:(void *)a1
{
  double v2;
  double v3;
  double v4;
  double v5;
  uint64_t v6;
  uint64_t v7;
  id v9;
  os_log_t oslog;
  double v11;
  uint64_t v12;
  double v13;
  uint64_t v14;
  double v15;
  double v16;
  double v17;
  double v18;
  BOOL v19;
  double v20;
  double v21;
  id location;
  double v23;
  double v24;
  double v25;
  double v26;
  uint64_t v27;
  void *v28;
  double v29;
  uint8_t v30[24];
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v28 = a1;
  v27 = a2;
  if (!a1)
    return 0.0;
  v26 = 0.0;
  v25 = 0.0;
  v24 = 0.0;
  v23 = 0.0;
  location = v28;
  objc_msgSend(location, "contentOffset");
  v20 = v2;
  v21 = v3;
  v19 = 0;
  if (v27 == 1)
  {
    v17 = -[UIScrollViewAccessibility _axMinimumContentOffset](v28);
    v18 = v4;
    v25 = v4;
    v15 = -[UIScrollViewAccessibility _axMaximumContentOffset](v28);
    v16 = v5;
    v24 = v5;
    v23 = v21;
  }
  else if (v27 == 2)
  {
    v13 = -[UIScrollViewAccessibility _axMinimumContentOffset](v28);
    v14 = v6;
    v25 = v13;
    v11 = -[UIScrollViewAccessibility _axMaximumContentOffset](v28);
    v12 = v7;
    v24 = v11;
    v23 = v20;
    v9 = (id)objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication");
    v19 = objc_msgSend(v9, "userInterfaceLayoutDirection") == 1;

  }
  else
  {
    oslog = (os_log_t)(id)AXLogAppAccessibility();
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_FAULT))
    {
      __os_log_helper_16_0_1_8_0((uint64_t)v30, v27);
      _os_log_fault_impl(&dword_230C4A000, oslog, OS_LOG_TYPE_FAULT, "Unexpected direction for indicator: %ld", v30, 0xCu);
    }
    objc_storeStrong((id *)&oslog, 0);
  }
  if (v25 < v24)
  {
    if (v23 > v25)
    {
      if (v23 >= v24 || v24 == 0.0)
        v26 = 1.0;
      else
        v26 = (v23 - v25) / (v24 - v25);
    }
    else
    {
      v26 = 0.0;
    }
  }
  if (v19)
    v26 = 1.0 - v26;
  v29 = v26;
  objc_storeStrong(&location, 0);
  return v29;
}

- (CGRect)accessibilityFrameForScrollIndicator:(id)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGFloat v7;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGFloat v15;
  uint64_t v16;
  CGFloat v17;
  double v18;
  double v19;
  double v20;
  double v21;
  uint64_t v22;
  CGFloat v23;
  uint64_t v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  uint64_t v33;
  double v34;
  double v35;
  id v36[2];
  uint64_t v37;
  uint64_t *v38;
  int v39;
  int v40;
  void *v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  double v46;
  double v47;
  double v48;
  double v49;
  __int128 v50;
  __int128 v51;
  double v52;
  CGRect recta;
  double v54;
  uint64_t v55;
  int v56;
  int v57;
  __n128 (*v58)(uint64_t);
  void *v59;
  id v60[2];
  uint64_t v61;
  uint64_t *v62;
  int v63;
  int v64;
  void *v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  double v70;
  double v71;
  double v72;
  double v73;
  __int128 v74;
  __int128 v75;
  double v76;
  double v77;
  double v78;
  double v79;
  double v80;
  double v81;
  CGRect v82;
  id v83;
  id v84;
  char v85;
  id v86;
  id v87;
  id location[2];
  UIScrollViewAccessibility *v89;
  double v90;
  double v91;
  double v92;
  double v93;
  CGRect v94;
  CGRect v95;
  CGRect result;

  v89 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v87 = v89;
  v85 = 0;
  objc_opt_class();
  v84 = (id)__UIAccessibilityCastAsClass();
  v83 = v84;
  objc_storeStrong(&v84, 0);
  v86 = v83;
  objc_msgSend(v83, "bounds");
  v78 = v3;
  v79 = v4;
  v80 = v5;
  v81 = v6;
  objc_msgSend(v83, "convertRect:toView:", v87, v3, v4, v5, v6);
  v82.origin.x = v7;
  v82.origin.y = v8;
  v82.size.width = v9;
  v82.size.height = v10;
  v77 = 30.0;
  v76 = 0.5;
  v33 = -[_UIScrollViewScrollIndicatorAccessibility accessibilityScrollDirection]((uint64_t)location[0]);
  if (v33 == 1)
  {
    v74 = 0u;
    v75 = 0u;
    objc_msgSend(v87, "bounds");
    v70 = v11;
    v71 = v12;
    v72 = v13;
    v73 = v14;
    v61 = 0;
    v62 = &v61;
    v63 = 0x10000000;
    v64 = 64;
    v65 = &unk_230DEFD8E;
    v66 = 0u;
    v67 = 0u;
    v55 = MEMORY[0x24BDAC760];
    v56 = -1073741824;
    v57 = 0;
    v58 = __66__UIScrollViewAccessibility_accessibilityFrameForScrollIndicator___block_invoke;
    v59 = &unk_24FF3DE88;
    v60[1] = &v61;
    v60[0] = v87;
    AXPerformSafeBlock();
    v68 = *((_OWORD *)v62 + 2);
    v69 = *((_OWORD *)v62 + 3);
    objc_storeStrong(v60, 0);
    _Block_object_dispose(&v61, 8);
    *(_QWORD *)&v74 = UIEdgeInsetsInsetRect_0(v70, v71, v72, v73, *(double *)&v68, *((double *)&v68 + 1));
    *((CGFloat *)&v74 + 1) = v15;
    *(_QWORD *)&v75 = v16;
    *((CGFloat *)&v75 + 1) = v17;
    v82.origin.y = v15;
    v82.size.height = v17;
    objc_msgSend(v87, "bounds");
    recta = v94;
    v54 = 0.5 * CGRectGetWidth(v94);
    v52 = CGFloatMin_0(30.0, v54);
    v82.origin.x = CGRectGetMaxX(v82) - v52;
    v82.size.width = v52;
  }
  else if (v33 == 2)
  {
    v50 = 0u;
    v51 = 0u;
    objc_msgSend(v87, "bounds");
    v46 = v18;
    v47 = v19;
    v48 = v20;
    v49 = v21;
    v37 = 0;
    v38 = &v37;
    v39 = 0x10000000;
    v40 = 64;
    v41 = &unk_230DEFD8E;
    v42 = 0u;
    v43 = 0u;
    v36[1] = &v37;
    v36[0] = v87;
    AXPerformSafeBlock();
    v44 = *((_OWORD *)v38 + 2);
    v45 = *((_OWORD *)v38 + 3);
    objc_storeStrong(v36, 0);
    _Block_object_dispose(&v37, 8);
    *(_QWORD *)&v50 = UIEdgeInsetsInsetRect_0(v46, v47, v48, v49, *(double *)&v44, *((double *)&v44 + 1));
    *((_QWORD *)&v50 + 1) = v22;
    *(CGFloat *)&v51 = v23;
    *((_QWORD *)&v51 + 1) = v24;
    *(_QWORD *)&v82.origin.x = v50;
    v82.size.width = v23;
    objc_msgSend(v87, "bounds");
    v35 = 0.5 * CGRectGetHeight(v95);
    v34 = CGFloatMin_0(30.0, v35);
    v82.origin.y = CGRectGetMaxY(v82) - v34;
    v82.size.height = v34;
  }
  UIAccessibilityFrameForBounds();
  v90 = v25;
  v91 = v26;
  v92 = v27;
  v93 = v28;
  objc_storeStrong(&v86, 0);
  objc_storeStrong(&v87, 0);
  objc_storeStrong(location, 0);
  v29 = v90;
  v30 = v91;
  v31 = v92;
  v32 = v93;
  result.size.height = v32;
  result.size.width = v31;
  result.origin.y = v30;
  result.origin.x = v29;
  return result;
}

__n128 __66__UIScrollViewAccessibility_accessibilityFrameForScrollIndicator___block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  __n128 result;
  __int128 v8;
  __n128 v9;

  objc_msgSend(*(id *)(a1 + 32), "_effectiveVerticalScrollIndicatorInsets");
  *(_QWORD *)&v8 = v1;
  *((_QWORD *)&v8 + 1) = v2;
  v9.n128_u64[0] = v3;
  v9.n128_u64[1] = v4;
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  *(_OWORD *)(v5 + 32) = v8;
  result = v9;
  *(__n128 *)(v5 + 48) = v9;
  return result;
}

__n128 __66__UIScrollViewAccessibility_accessibilityFrameForScrollIndicator___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  __n128 result;
  __int128 v8;
  __n128 v9;

  objc_msgSend(*(id *)(a1 + 32), "_effectiveHorizontalScrollIndicatorInsets");
  *(_QWORD *)&v8 = v1;
  *((_QWORD *)&v8 + 1) = v2;
  v9.n128_u64[0] = v3;
  v9.n128_u64[1] = v4;
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  *(_OWORD *)(v5 + 32) = v8;
  result = v9;
  *(__n128 *)(v5 + 48) = v9;
  return result;
}

- (id)_axLastScrubAnnouncementDate
{
  return objc_getAssociatedObject(self, &__UIScrollViewAccessibility___axLastScrubAnnouncementDate);
}

- (void)_axSetLastScrubAnnouncementDate:(id)a3
{
  id location[3];

  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  __UIAccessibilitySetAssociatedObject();
  objc_storeStrong(location, 0);
}

- (void)_axAnnounceScrubForDirection:(void *)a1
{
  UIAccessibilityNotifications notification;
  id v3;

  if (a1)
  {
    notification = *MEMORY[0x24BDF71E8];
    -[UIScrollViewAccessibility _axProgressForDirection:](a1, a2);
    v3 = (id)AXFormatFloatWithPercentage();
    UIAccessibilityPostNotification(notification, v3);

  }
}

- (CGPoint)_newScrollOffsetForScrubReturningAnimated:(BOOL *)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  uint64_t v10;
  double v11;
  id location;
  id v13;
  objc_super v14;
  BOOL *v15;
  SEL v16;
  UIScrollViewAccessibility *v17;
  double v18;
  double v19;
  CGPoint result;

  v17 = self;
  v16 = a2;
  v15 = a3;
  v18 = 0.0;
  v19 = 0.0;
  v14.receiver = self;
  v14.super_class = (Class)UIScrollViewAccessibility;
  -[UIScrollViewAccessibility _newScrollOffsetForScrubReturningAnimated:](&v14, sel__newScrollOffsetForScrubReturningAnimated_, a3);
  v18 = v3;
  v19 = v4;
  v13 = (id)objc_msgSend(MEMORY[0x24BDBCE60], "date");
  location = -[UIScrollViewAccessibility _axLastScrubAnnouncementDate](v17, "_axLastScrubAnnouncementDate");
  -[UIScrollViewAccessibility contentOffset](v17, "contentOffset");
  v11 = v6;
  v7 = v18;
  if (v18 == v11)
  {
    v7 = v19;
    v10 = v19 != v5;
  }
  else
  {
    v10 = 2;
  }
  if (v10)
  {
    if (!location || (objc_msgSend(v13, "timeIntervalSinceDate:", location, v7), v7 > 1.0))
    {
      -[UIScrollViewAccessibility _axSetLastScrubAnnouncementDate:](v17, "_axSetLastScrubAnnouncementDate:", v13, v7);
      -[UIScrollViewAccessibility _axAnnounceScrubForDirection:](v17, v10);
    }
  }
  objc_storeStrong(&location, 0);
  objc_storeStrong(&v13, 0);
  v8 = v18;
  v9 = v19;
  result.y = v9;
  result.x = v8;
  return result;
}

@end
