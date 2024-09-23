@implementation EKDayViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("EKDayViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("EKDayViewController"), CFSTR("_horizontalScrollingView"), "UIScrollView");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("EKDayViewController"), CFSTR("_previousDayWithGutter"), "EKDayViewWithGutters");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("EKDayViewController"), CFSTR("_nextDayWithGutter"), "EKDayViewWithGutters");
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("EKDayViewWithGutters"), CFSTR("UIView"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("EKDayViewController"), CFSTR("_relayoutDaysDuringScrolling"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("EKDayViewController"), CFSTR("_currentDay"), "EKDayView");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("EKDayViewController"), CFSTR("_scrollViewDidEndDecelerating:"), "v", "@", 0);

}

- (id)_axDayString
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[EKDayViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_currentDay"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safeValueForKey:", CFSTR("_displayDate"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[objc_class currentCalendar](NSClassFromString(CFSTR("NSCalendar")), "currentCalendar");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dateFromComponents:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    _AXGetYearlessStringForDay(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)accessibilityScroll:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  BOOL v12;
  objc_super v14;

  -[EKDayViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_horizontalScrollingView"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKDayViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_previousDayWithGutter"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKDayViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_nextDayWithGutter"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (a3 == 2)
  {
    objc_msgSend(v7, "superview");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = v8;
    if (!v11)
LABEL_6:
      objc_msgSend(v5, "addSubview:", v10);
LABEL_7:
    objc_msgSend(v5, "_accessibilitySetBoolValue:forKey:", 1, CFSTR("_AXEKDayViewControllerShouldFakePageDecelerationTarget"));
    goto LABEL_8;
  }
  if (a3 == 1)
  {
    objc_msgSend(v6, "superview");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = v6;
    if (!v9)
      goto LABEL_6;
    goto LABEL_7;
  }
LABEL_8:
  v14.receiver = self;
  v14.super_class = (Class)EKDayViewControllerAccessibility;
  v12 = -[EKDayViewControllerAccessibility accessibilityScroll:](&v14, sel_accessibilityScroll_, a3);

  return v12;
}

- (void)_scrollViewDidEndDecelerating:(id)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)EKDayViewControllerAccessibility;
  -[EKDayViewControllerAccessibility _scrollViewDidEndDecelerating:](&v5, sel__scrollViewDidEndDecelerating_, a3);
  -[EKDayViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_horizontalScrollingView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_accessibilityRemoveValueForKey:", CFSTR("_AXEKDayViewControllerShouldFakePageDecelerationTarget"));

}

- (void)_relayoutDaysDuringScrolling
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  objc_super v7;

  -[EKDayViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_currentDay"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7.receiver = self;
  v7.super_class = (Class)EKDayViewControllerAccessibility;
  -[EKDayViewControllerAccessibility _relayoutDaysDuringScrolling](&v7, sel__relayoutDaysDuringScrolling);
  -[EKDayViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_currentDay"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x23490DEFC](*MEMORY[0x24BDF72E0]);
  if (v3 != v4)
  {
    -[EKDayViewControllerAccessibility _axDayString](self, "_axDayString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v6;
    AXPerformBlockOnMainThreadAfterDelay();

  }
}

uint64_t __64__EKDayViewControllerAccessibility__relayoutDaysDuringScrolling__block_invoke(uint64_t a1)
{
  UIAccessibilityPostNotification(*MEMORY[0x24BDF71E8], *(id *)(a1 + 32));
  return AXPerformBlockOnMainThreadAfterDelay();
}

void __64__EKDayViewControllerAccessibility__relayoutDaysDuringScrolling__block_invoke_2()
{
  UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], 0);
}

- (id)accessibilityScrollStatusForScrollView:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[EKDayViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_currentDay"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeValueForKey:", CFSTR("_displayDate"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "dateFromComponents:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    _AXGetYearlessStringForDay(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

@end
