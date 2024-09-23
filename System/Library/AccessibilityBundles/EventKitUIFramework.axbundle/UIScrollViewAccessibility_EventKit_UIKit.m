@implementation UIScrollViewAccessibility_EventKit_UIKit

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UIScrollView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)accessibilityIsDayGridScroller
{
  return __UIAccessibilityGetAssociatedBool();
}

- (void)setAccessibilityIsDayGridScroller:(BOOL)a3
{
  __UIAccessibilitySetAssociatedBool();
}

- (BOOL)accessibilityIsPreviewDayGridScroller
{
  return __UIAccessibilityGetAssociatedBool();
}

- (void)setAccessibilityIsPreviewDayGridScroller:(BOOL)a3
{
  __UIAccessibilitySetAssociatedBool();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:", CFSTR("EKDayGridView"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("EKDayGridView"), CFSTR("hourHeight"), "d", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("EKDayGridView"), CFSTR("topPadding"), "d", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIScrollView"), CFSTR("_pageDecelerationTarget"), "{CGPoint=dd}", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIScrollView"), CFSTR("_stopScrollDecelerationNotify:"), "v", "B", 0);

}

- (id)_accessibilityScrollStatus
{
  void *v3;
  int v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  void *v22;
  double v23;
  double v24;
  void *v25;
  double v26;
  double v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  objc_super v38;
  CGRect v39;

  if (-[UIScrollViewAccessibility_EventKit_UIKit accessibilityIsDayGridScroller](self, "accessibilityIsDayGridScroller")|| (-[UIScrollViewAccessibility_EventKit_UIKit accessibilityIdentifier](self, "accessibilityIdentifier"), v3 = (void *)objc_claimAutoreleasedReturnValue(), v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("_AXWeekViewScrollViewIdentifier")), v3, v4))
  {
    -[UIScrollViewAccessibility_EventKit_UIKit _accessibilityDescendantOfType:](self, "_accessibilityDescendantOfType:", NSClassFromString(CFSTR("EKDayGridView")));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIScrollViewAccessibility_EventKit_UIKit bounds](self, "bounds");
    v7 = v6;
    v9 = v8;
    v11 = v10;
    v13 = v12;
    -[UIScrollViewAccessibility_EventKit_UIKit _accessibilityVisibleContentInset](self, "_accessibilityVisibleContentInset");
    v15 = v7 + v14;
    v17 = v9 + v16;
    v19 = v11 - (v14 + v18);
    v21 = v13 - (v16 + v20);
    objc_msgSend(v5, "safeValueForKey:", CFSTR("hourHeight"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "doubleValue");
    v24 = v23;

    objc_msgSend(v5, "safeValueForKey:", CFSTR("topPadding"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "doubleValue");
    v27 = v26;

    v28 = objc_alloc_init(MEMORY[0x24BDBCE68]);
    objc_msgSend(v28, "setYear:", 2013);
    objc_msgSend(v28, "setMonth:", 6);
    objc_msgSend(v28, "setDay:", 30);
    objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setHour:", llround((v17 - v27) / v24));
    objc_msgSend(v29, "dateFromComponents:", v28);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v39.origin.x = v15;
    v39.origin.y = v17;
    v39.size.width = v19;
    v39.size.height = v21;
    objc_msgSend(v28, "setHour:", llround((CGRectGetMaxY(v39) - v27) / v24));
    objc_msgSend(v29, "dateFromComponents:", v28);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = (void *)MEMORY[0x24BDD17C8];
    accessibilityLocalizedString(CFSTR("day.grid.scroll.status"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    AXDateStringForFormat();
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    AXDateStringForFormat();
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "stringWithFormat:", v33, v34, v35);
    v36 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v38.receiver = self;
    v38.super_class = (Class)UIScrollViewAccessibility_EventKit_UIKit;
    -[UIScrollViewAccessibility_EventKit_UIKit _accessibilityScrollStatus](&v38, sel__accessibilityScrollStatus);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v36;
}

- (BOOL)_accessibilityScrollingEnabled
{
  objc_super v4;

  if (-[UIScrollViewAccessibility_EventKit_UIKit accessibilityIsPreviewDayGridScroller](self, "accessibilityIsPreviewDayGridScroller"))
  {
    if (!AXDoesRequestingClientDeserveAutomation()
      && !-[UIScrollViewAccessibility_EventKit_UIKit accessibilityIsDayGridScroller](self, "accessibilityIsDayGridScroller"))
    {
      _AXAssert();
    }
    return 0;
  }
  else
  {
    v4.receiver = self;
    v4.super_class = (Class)UIScrollViewAccessibility_EventKit_UIKit;
    return -[UIScrollViewAccessibility_EventKit_UIKit _accessibilityScrollingEnabled](&v4, sel__accessibilityScrollingEnabled);
  }
}

- (CGPoint)_pageDecelerationTarget
{
  double Width;
  double v4;
  objc_super v5;
  CGPoint result;
  CGRect v7;

  if (-[UIScrollViewAccessibility_EventKit_UIKit _accessibilityBoolValueForKey:](self, "_accessibilityBoolValueForKey:", CFSTR("_AXEKDayViewControllerShouldFakePageDecelerationTarget")))
  {
    -[UIScrollViewAccessibility_EventKit_UIKit bounds](self, "bounds");
    Width = CGRectGetWidth(v7);
    v4 = 0.0;
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)UIScrollViewAccessibility_EventKit_UIKit;
    -[UIScrollViewAccessibility_EventKit_UIKit _pageDecelerationTarget](&v5, sel__pageDecelerationTarget);
  }
  result.y = v4;
  result.x = Width;
  return result;
}

@end
