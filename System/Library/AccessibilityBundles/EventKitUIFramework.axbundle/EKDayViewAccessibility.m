@implementation EKDayViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("EKDayView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("EKDayView"), CFSTR("_scroller"), "UIScrollView");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("EKDayView"), CFSTR("_allDayView"), "EKDayAllDayView");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("EKDayView"), CFSTR("_dayContent"), "EKDayViewContent");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("EKDayView"), CFSTR("initWithFrame:sizeClass:orientation:displayDate:backgroundColor:opaque:scrollbarShowsInside:isMiniPreviewInEventDetail:rightClickDelegate:"), "@", "{CGRect={CGPoint=dd}{CGSize=dd}}", "q", "q", "@", "@", "B", "B", "B", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("EKDayViewContent"), CFSTR("occurrenceViews"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("EKDayAllDayView"), CFSTR("occurrenceViews"), "@", 0);

}

- (id)accessibilityScrollView
{
  return *(id *)-[EKDayViewAccessibility safeIvarForKey:](self, "safeIvarForKey:", CFSTR("_scroller"));
}

- (void)_axAnnotateScroller
{
  void *v3;
  void *v4;

  objc_opt_class();
  -[EKDayViewAccessibility accessibilityScrollView](self, "accessibilityScrollView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsSafeCategory();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setAccessibilityIsDayGridScroller:", 1);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)EKDayViewAccessibility;
  -[EKDayViewAccessibility _accessibilityLoadAccessibilityInformation](&v3, sel__accessibilityLoadAccessibilityInformation);
  -[EKDayViewAccessibility _axAnnotateScroller](self, "_axAnnotateScroller");
}

- (EKDayViewAccessibility)initWithFrame:(CGRect)a3 sizeClass:(int64_t)a4 orientation:(int64_t)a5 displayDate:(id)a6 backgroundColor:(id)a7 opaque:(BOOL)a8 scrollbarShowsInside:(BOOL)a9 isMiniPreviewInEventDetail:(BOOL)a10 rightClickDelegate:(id)a11
{
  EKDayViewAccessibility *v11;
  EKDayViewAccessibility *v12;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)EKDayViewAccessibility;
  v11 = -[EKDayViewAccessibility initWithFrame:sizeClass:orientation:displayDate:backgroundColor:opaque:scrollbarShowsInside:isMiniPreviewInEventDetail:rightClickDelegate:](&v15, sel_initWithFrame_sizeClass_orientation_displayDate_backgroundColor_opaque_scrollbarShowsInside_isMiniPreviewInEventDetail_rightClickDelegate_, a4, a5, a6, a7, a8, a9, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, a10, a11);
  v12 = v11;
  if (v11)
    -[EKDayViewAccessibility _axAnnotateScroller](v11, "_axAnnotateScroller");
  return v12;
}

- (id)accessibilityCustomRotors
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v8;
  uint64_t v9;
  id (*v10)(uint64_t, void *);
  void *v11;
  id v12;
  id location;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x24BDAC8D0];
  -[EKDayViewAccessibility _accessibilityValueForKey:](self, "_accessibilityValueForKey:", CFSTR("AXCustomRotor"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    objc_initWeak(&location, self);
    v4 = objc_alloc(MEMORY[0x24BDF6790]);
    accessibilityLocalizedString(CFSTR("rotor.events"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = MEMORY[0x24BDAC760];
    v9 = 3221225472;
    v10 = __51__EKDayViewAccessibility_accessibilityCustomRotors__block_invoke;
    v11 = &unk_2501FCCD0;
    objc_copyWeak(&v12, &location);
    v3 = (void *)objc_msgSend(v4, "initWithName:itemSearchBlock:", v5, &v8);

    -[EKDayViewAccessibility _accessibilitySetRetainedValue:forKey:](self, "_accessibilitySetRetainedValue:forKey:", v3, CFSTR("AXCustomRotor"), v8, v9, v10, v11);
    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
  v14[0] = v3;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v14, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

id __51__EKDayViewAccessibility_accessibilityCustomRotors__block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "safeValueForKey:", CFSTR("_allDayView"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "safeValueForKey:", CFSTR("occurrenceViews"));
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  v8 = (void *)MEMORY[0x24BDBD1A8];
  if (v6)
    v8 = (void *)v6;
  v9 = v8;

  v10 = objc_loadWeakRetained(v2);
  objc_msgSend(v10, "safeValueForKey:", CFSTR("_dayContent"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "safeValueForKey:", CFSTR("occurrenceViews"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "arrayByAddingObjectsFromArray:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = objc_loadWeakRetained(v2);
  objc_msgSend(v14, "_accessibilityCustomRotorResultHelper:array:", v3, v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

@end
