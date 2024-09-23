@implementation CompactMonthWeekViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CompactMonthWeekView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("CompactMonthWeekView"), CFSTR("_monthNameLabel"), "UILabel");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("CompactMonthWeekView"), CFSTR("_days"), "NSArray");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("CompactMonthWeekView"), CFSTR("_startCalendarDate"), "EKCalendarDate");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("InfiniteScrollViewController"), CFSTR("_model"), "CUIKCalendarModel");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("CompactMonthWeekView"), CFSTR("_weekNumberLabel"), "UILabel");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("CompactMonthWeekView"), CFSTR("_containsFirstDayOfMonth"), "B");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("CompactMonthWeekView"), CFSTR("_compressedVerticalMode"), "B");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("CompactWidthMonthViewController"), CFSTR("_dividedListMode"), "B");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("CompactMonthWeekView"), CFSTR("_showWeekNumber"), "B");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("CompactMonthWeekView"), CFSTR("_containsToday"), "B");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CompactMonthWeekView"), CFSTR("setCalendarDate:"), "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CompactMonthWeekView"), CFSTR("_initializeMonthNameLabel"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CompactMonthWeekView"), CFSTR("_initializeDays"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CompactMonthWeekView"), CFSTR("_reloadMonthNameLabel"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CompactMonthWeekView"), CFSTR("setCompressedVerticalMode:"), "v", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CUIKCalendarModel"), CFSTR("selectedDate"), "@", 0);

}

- (void)_accessibilityLoadAccessibilityInformation
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CompactMonthWeekViewAccessibility;
  -[CompactMonthWeekViewAccessibility _accessibilityLoadAccessibilityInformation](&v3, sel__accessibilityLoadAccessibilityInformation);
  -[CompactMonthWeekViewAccessibility _axAnnotateMonthHeader](self, "_axAnnotateMonthHeader");
  -[CompactMonthWeekViewAccessibility _axAnnotateDayNumbers](self, "_axAnnotateDayNumbers");
}

- (id)_axMonthHeader
{
  return (id)-[CompactMonthWeekViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_monthNameLabel"));
}

- (id)_axDate
{
  void *v2;
  void *v3;

  -[CompactMonthWeekViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_startCalendarDate"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safeValueForKey:", CFSTR("date"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)_axShowsMonthHeader
{
  int v3;

  v3 = -[CompactMonthWeekViewAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("_containsFirstDayOfMonth"));
  if (v3)
    LOBYTE(v3) = -[CompactMonthWeekViewAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("_compressedVerticalMode")) ^ 1;
  return v3;
}

- (BOOL)_axShowsWeekNumber
{
  return -[CompactMonthWeekViewAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("_showWeekNumber"));
}

- (BOOL)_axContainsToday
{
  return -[CompactMonthWeekViewAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("_containsToday"));
}

- (id)_axWeekNumber
{
  return (id)-[CompactMonthWeekViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_weekNumberLabel"));
}

- (void)_axAnnotateMonthHeader
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;

  if (-[CompactMonthWeekViewAccessibility _axShowsMonthHeader](self, "_axShowsMonthHeader"))
  {
    -[CompactMonthWeekViewAccessibility _axMonthHeader](self, "_axMonthHeader");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[CompactMonthWeekViewAccessibility _axDate](self, "_axDate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    MEMORY[0x2349148C4]();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setAccessibilityLabel:", v5);

    v6 = (void *)MEMORY[0x24BDBCE30];
    objc_opt_class();
    -[CompactMonthWeekViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_startCalendarDate"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAccessibilityCastAsClass();
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    MEMORY[0x2349148B8](objc_msgSend(v8, "month"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    -[CompactMonthWeekViewAccessibility _axMonthHeader](self, "_axMonthHeader");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAccessibilityCastAsClass();
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "text");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "axArrayByIgnoringNilElementsWithCount:", 2, v9, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setAccessibilityUserInputLabels:", v13);

    v14 = objc_msgSend(v3, "accessibilityTraits");
    objc_msgSend(v3, "setAccessibilityTraits:", *MEMORY[0x24BDF73C0] | v14);
    objc_msgSend(v3, "_accessibilitySetIsSpeakThisElement:", 0);

  }
}

- (void)_axAnnotateDayNumbers
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  -[CompactMonthWeekViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_days"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v7++), "setAccessibilityContainer:", self);
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

}

- (void)_axInvalidateChildren
{
  -[CompactMonthWeekViewAccessibility _accessibilityRemoveValueForKey:](self, "_accessibilityRemoveValueForKey:", *MEMORY[0x24BEBB308]);
}

- (id)accessibilityElements
{
  _QWORD *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _BOOL4 v10;
  void *v11;
  __CFString *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  char v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v3 = (_QWORD *)MEMORY[0x24BEBB308];
  -[CompactMonthWeekViewAccessibility _accessibilityValueForKey:](self, "_accessibilityValueForKey:", *MEMORY[0x24BEBB308]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    -[CompactMonthWeekViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_days"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v5, "count") + 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CompactMonthWeekViewAccessibility _accessibilitySetRetainedValue:forKey:](self, "_accessibilitySetRetainedValue:forKey:", v6, *v3);
    if (-[CompactMonthWeekViewAccessibility _axShowsMonthHeader](self, "_axShowsMonthHeader"))
    {
      -[CompactMonthWeekViewAccessibility _axMonthHeader](self, "_axMonthHeader");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "addObject:", v7);

    }
    if (-[CompactMonthWeekViewAccessibility _axShowsWeekNumber](self, "_axShowsWeekNumber"))
    {
      v27 = 0;
      -[CompactMonthWeekViewAccessibility _axWeekNumber](self, "_axWeekNumber");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      __UIAccessibilitySafeClass();
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      v10 = -[CompactMonthWeekViewAccessibility _axContainsToday](self, "_axContainsToday");
      v11 = (void *)MEMORY[0x24BDD17C8];
      if (v10)
        v12 = CFSTR("currentweek.number");
      else
        v12 = CFSTR("week.number");
      accessibilityLocalizedString(v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "text");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "stringWithFormat:", v13, v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v9, "setAccessibilityLabel:", v15);
      objc_msgSend(v6, "axSafelyAddObject:", v9);

    }
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    v16 = v5;
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v24;
      do
      {
        for (i = 0; i != v18; ++i)
        {
          if (*(_QWORD *)v24 != v19)
            objc_enumerationMutation(v16);
          v21 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
          if (objc_msgSend(v21, "isAccessibilityElement"))
            objc_msgSend(v6, "addObject:", v21);
        }
        v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
      }
      while (v18);
    }

  }
  return v4;
}

- (BOOL)_accessibilityHitTestShouldFallbackToNearestChild
{
  return 1;
}

- (BOOL)accessibilityElementsHidden
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  unsigned __int8 v8;
  objc_super v10;

  -[CompactMonthWeekViewAccessibility _accessibilityMonthViewController](self, "_accessibilityMonthViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "safeBoolForKey:", CFSTR("_dividedListMode")))
  {
    objc_msgSend(v3, "safeValueForKey:", CFSTR("_model"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "safeValueForKey:", CFSTR("selectedDate"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[CompactMonthWeekViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_startCalendarDate"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v5, "month");
      v8 = v7 != objc_msgSend(v6, "month");

    }
    else
    {
      _AXAssert();
      v8 = 0;
    }

  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)CompactMonthWeekViewAccessibility;
    v8 = -[CompactMonthWeekViewAccessibility accessibilityElementsHidden](&v10, sel_accessibilityElementsHidden);
  }

  return v8;
}

- (void)dealloc
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  objc_super v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[CompactMonthWeekViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_days"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v7++), "setAccessibilityContainer:", 0);
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

  v8.receiver = self;
  v8.super_class = (Class)CompactMonthWeekViewAccessibility;
  -[CompactMonthWeekViewAccessibility dealloc](&v8, sel_dealloc);
}

- (void)_initializeMonthNameLabel
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CompactMonthWeekViewAccessibility;
  -[CompactMonthWeekViewAccessibility _initializeMonthNameLabel](&v3, sel__initializeMonthNameLabel);
  -[CompactMonthWeekViewAccessibility _axAnnotateMonthHeader](self, "_axAnnotateMonthHeader");
  -[CompactMonthWeekViewAccessibility _axInvalidateChildren](self, "_axInvalidateChildren");
}

- (void)_initializeDays
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CompactMonthWeekViewAccessibility;
  -[CompactMonthWeekViewAccessibility _initializeDays](&v3, sel__initializeDays);
  -[CompactMonthWeekViewAccessibility _axInvalidateChildren](self, "_axInvalidateChildren");
  -[CompactMonthWeekViewAccessibility _axAnnotateDayNumbers](self, "_axAnnotateDayNumbers");
}

- (void)_reloadMonthNameLabel
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CompactMonthWeekViewAccessibility;
  -[CompactMonthWeekViewAccessibility _reloadMonthNameLabel](&v3, sel__reloadMonthNameLabel);
  -[CompactMonthWeekViewAccessibility _axAnnotateMonthHeader](self, "_axAnnotateMonthHeader");
}

- (void)setCalendarDate:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CompactMonthWeekViewAccessibility;
  -[CompactMonthWeekViewAccessibility setCalendarDate:](&v4, sel_setCalendarDate_, a3);
  -[CompactMonthWeekViewAccessibility _axAnnotateMonthHeader](self, "_axAnnotateMonthHeader");
  -[CompactMonthWeekViewAccessibility _axInvalidateChildren](self, "_axInvalidateChildren");
}

- (void)setCompressedVerticalMode:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CompactMonthWeekViewAccessibility;
  -[CompactMonthWeekViewAccessibility setCompressedVerticalMode:](&v4, sel_setCompressedVerticalMode_, a3);
  -[CompactMonthWeekViewAccessibility _axInvalidateChildren](self, "_axInvalidateChildren");
}

- (id)_accessibilityMonthViewController
{
  CompactMonthWeekViewAccessibility *v2;
  void *v3;
  uint64_t v4;

  v2 = self;
  if (v2)
  {
    while (1)
    {
      -[CompactMonthWeekViewAccessibility _accessibilityViewController](v2, "_accessibilityViewController");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      if (v3)
      {
        NSClassFromString(CFSTR("CompactWidthMonthViewController"));
        if ((objc_opt_isKindOfClass() & 1) != 0)
          break;
      }
      -[CompactMonthWeekViewAccessibility accessibilityContainer](v2, "accessibilityContainer");
      v4 = objc_claimAutoreleasedReturnValue();

      v2 = (CompactMonthWeekViewAccessibility *)v4;
      if (!v4)
        goto LABEL_5;
    }
  }
  else
  {
LABEL_5:
    v3 = 0;
  }

  return v3;
}

@end
