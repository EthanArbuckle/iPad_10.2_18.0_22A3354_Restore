@implementation WeekViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("WeekView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:", CFSTR("WeekAllDayView"));
  objc_msgSend(v3, "validateClass:", CFSTR("EKDayViewContent"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("WeekView"), CFSTR("initWithFrame:sizeClass:targetWindow:rightClickDelegate:"), "@", "{CGRect={CGPoint=dd}{CGSize=dd}}", "q", "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("EKDayViewContent"), CFSTR("grid"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("WeekView"), CFSTR("_scrollView"), "UIScrollView");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("WeekView"), CFSTR("_allDayView"), "WeekAllDayView");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("WeekView"), CFSTR("_content"), "EKDayViewContent");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("WeekView"), CFSTR("_daysToDisplay"), "q");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("EKDayViewContent"), CFSTR("occurrenceViews"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("WeekAllDayView"), CFSTR("occurrenceViews"), "@", 0);

}

- (void)_axAnnotateScrollView
{
  id v2;

  -[WeekViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_scrollView"));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAccessibilityIdentifier:", CFSTR("_AXWeekViewScrollViewIdentifier"));

}

- (WeekViewAccessibility)initWithFrame:(CGRect)a3 sizeClass:(int64_t)a4 targetWindow:(id)a5 rightClickDelegate:(id)a6
{
  WeekViewAccessibility *v6;
  WeekViewAccessibility *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)WeekViewAccessibility;
  v6 = -[WeekViewAccessibility initWithFrame:sizeClass:targetWindow:rightClickDelegate:](&v9, sel_initWithFrame_sizeClass_targetWindow_rightClickDelegate_, a4, a5, a6, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v7 = v6;
  if (v6)
    -[WeekViewAccessibility _axAnnotateScrollView](v6, "_axAnnotateScrollView");
  return v7;
}

- (void)_accessibilityLoadAccessibilityInformation
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)WeekViewAccessibility;
  -[WeekViewAccessibility _accessibilityLoadAccessibilityInformation](&v3, sel__accessibilityLoadAccessibilityInformation);
  -[WeekViewAccessibility _axAnnotateScrollView](self, "_axAnnotateScrollView");
}

- (id)accessibilityElements
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t i;
  void *v13;
  void *v14;

  if ((_UIAccessibilityFullKeyboardAccessEnabled() & 1) == 0)
  {
    -[WeekViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_daysToDisplay"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "integerValue");

    -[WeekViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_allDayView"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "accessibilityElements");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = objc_msgSend(v7, "count");
    if (v8 != v5)
      _AXAssert();
    -[WeekViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_content"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "safeValueForKey:", CFSTR("grid"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "accessibilityElements");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      if (objc_msgSend(v11, "count") == v5)
      {
        if (v8 == v5)
        {
          objc_msgSend(MEMORY[0x24BDBCEB8], "array");
          v3 = (void *)objc_claimAutoreleasedReturnValue();
          if (v5)
          {
            for (i = 0; i != v5; ++i)
            {
              objc_msgSend(v7, "objectAtIndex:", i);
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v13, "setAccessibilityContainer:", self);
              objc_msgSend(v3, "addObject:", v13);
              objc_msgSend(v11, "objectAtIndex:", i);
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v14, "setAccessibilityContainer:", self);
              objc_msgSend(v3, "addObject:", v14);

            }
          }
          goto LABEL_14;
        }
      }
      else
      {
        _AXAssert();
      }
    }
    v3 = 0;
LABEL_14:

    return v3;
  }
  v3 = 0;
  return v3;
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
  -[WeekViewAccessibility _accessibilityValueForKey:](self, "_accessibilityValueForKey:", CFSTR("AXCustomRotor"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    objc_initWeak(&location, self);
    v4 = objc_alloc(MEMORY[0x24BDF6790]);
    accessibilityLocalizedString(CFSTR("rotor.events"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = MEMORY[0x24BDAC760];
    v9 = 3221225472;
    v10 = __50__WeekViewAccessibility_accessibilityCustomRotors__block_invoke;
    v11 = &unk_25027D670;
    objc_copyWeak(&v12, &location);
    v3 = (void *)objc_msgSend(v4, "initWithName:itemSearchBlock:", v5, &v8);

    -[WeekViewAccessibility _accessibilitySetRetainedValue:forKey:](self, "_accessibilitySetRetainedValue:forKey:", v3, CFSTR("AXCustomRotor"), v8, v9, v10, v11);
    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
  v14[0] = v3;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v14, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

id __50__WeekViewAccessibility_accessibilityCustomRotors__block_invoke(uint64_t a1, void *a2)
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
  objc_msgSend(WeakRetained, "safeValueForKey:", CFSTR("_content"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "safeValueForKey:", CFSTR("occurrenceViews"));
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  v8 = (void *)MEMORY[0x24BDBD1A8];
  if (v6)
    v8 = (void *)v6;
  v9 = v8;

  v10 = objc_loadWeakRetained(v2);
  objc_msgSend(v10, "safeValueForKey:", CFSTR("_allDayView"));
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
