@implementation LargeMonthWeekViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("LargeMonthWeekView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:", CFSTR("_CalendarEventsRow"));
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("EKEvent"), CFSTR("EKCalendarItem"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("_CalendarEventsRow"), CFSTR("occurrenceBlocks"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("EKCalendar"), CFSTR("source"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("EKCalendar"), CFSTR("type"), "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("EKCalendarItem"), CFSTR("calendar"), "@", 0);
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("EKEvent"), CFSTR("EKObject"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("EKObject"), CFSTR("eventStore"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("EKEventStore"), CFSTR("calendarsForEntityType:"), "@", "Q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("EKSource"), CFSTR("isFacebookSource"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("LargeMonthWeekView"), CFSTR("_rebuildDayNumberLabels"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("LargeMonthWeekView"), CFSTR("reloadData"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("LargeMonthWeekView"), CFSTR("dayIndexForToday"), "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("LargeMonthWeekView"), CFSTR("_dayNumberLabels"), "NSArray");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("LargeMonthWeekView"), CFSTR("_startDate"), "EKCalendarDate");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("LargeMonthWeekView"), CFSTR("_endDate"), "EKCalendarDate");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("LargeMonthWeekView"), CFSTR("_firstOfMonthLabel"), "UILabel");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("LargeMonthWeekView"), CFSTR("_showingFirstDayOfMonthLabel"), "B");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("LargeMonthWeekView"), CFSTR("_firstDayIndex"), "q");

}

- (void)_axUpdateDayNumberLabels
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  const __CFString *v19;
  uint64_t v20;
  void *v21;
  id v22;

  -[LargeMonthWeekViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_startDate"));
  v22 = (id)objc_claimAutoreleasedReturnValue();
  -[LargeMonthWeekViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_dayNumberLabels"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[LargeMonthWeekViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_endDate"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v21, "differenceInDays:", v22) + 1;
  -[LargeMonthWeekViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_firstDayIndex"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "integerValue");

  if (objc_msgSend(v3, "count") - v6 < (unint64_t)v4)
  {
    v18 = v6;
    v20 = v4;
    v16 = objc_msgSend(v3, "count");
    _AXAssert();
  }
  if (objc_msgSend(v3, "count", v16, v18, v20) - v6 < (unint64_t)v4)
    v4 = objc_msgSend(v3, "count") - v6;
  if (v4 >= 1)
  {
    v7 = 0;
    do
    {
      objc_msgSend(v22, "calendarDateByAddingDays:", v7 >> 32);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "date");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      _AXGetStringsForDate(v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      -[LargeMonthWeekViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("dayIndexForToday"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "integerValue");

      if (v6 == v12)
      {
        accessibilityLocalizedString(CFSTR("today.indicator"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = v10;
        v19 = CFSTR("__AXStringForVariablesSentinel");
        __UIAXStringForVariables();
        v14 = objc_claimAutoreleasedReturnValue();

        v10 = (void *)v14;
      }
      objc_msgSend(v3, "objectAtIndex:", v6, v17, v19);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setAccessibilityLabel:", v10);

      ++v6;
      v7 += 0x100000000;
      --v4;
    }
    while (v4);
  }

}

- (id)_axMonthHeader
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[LargeMonthWeekViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_firstOfMonthLabel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[LargeMonthWeekViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_startDate"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  _AXGetYearlessStringForDay();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAccessibilityLabel:", v6);

  return v3;
}

- (void)_accessibilityLoadAccessibilityInformation
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)LargeMonthWeekViewAccessibility;
  -[LargeMonthWeekViewAccessibility _accessibilityLoadAccessibilityInformation](&v3, sel__accessibilityLoadAccessibilityInformation);
  -[LargeMonthWeekViewAccessibility _axUpdateDayNumberLabels](self, "_axUpdateDayNumberLabels");
  -[LargeMonthWeekViewAccessibility _axUpdateMonthAXLabel](self, "_axUpdateMonthAXLabel");
}

- (void)_axUpdateMonthAXLabel
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;

  -[LargeMonthWeekViewAccessibility _axMonthHeader](self, "_axMonthHeader");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[LargeMonthWeekViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_startDate"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeValueForKey:", CFSTR("date"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x2349148C4]();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAccessibilityLabel:", v5);

  v6 = objc_msgSend(v7, "accessibilityTraits");
  objc_msgSend(v7, "setAccessibilityTraits:", *MEMORY[0x24BDF73C0] | v6);

}

- (void)_rebuildDayNumberLabels
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)LargeMonthWeekViewAccessibility;
  -[LargeMonthWeekViewAccessibility _rebuildDayNumberLabels](&v3, sel__rebuildDayNumberLabels);
  -[LargeMonthWeekViewAccessibility _axUpdateDayNumberLabels](self, "_axUpdateDayNumberLabels");
}

- (void)_updateMonthLabel
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)LargeMonthWeekViewAccessibility;
  -[LargeMonthWeekViewAccessibility _updateMonthLabel](&v3, sel__updateMonthLabel);
  -[LargeMonthWeekViewAccessibility _axUpdateMonthAXLabel](self, "_axUpdateMonthAXLabel");
}

- (void)reloadData
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)LargeMonthWeekViewAccessibility;
  -[LargeMonthWeekViewAccessibility reloadData](&v3, sel_reloadData);
  -[LargeMonthWeekViewAccessibility _accessibilityRemoveValueForKey:](self, "_accessibilityRemoveValueForKey:", *MEMORY[0x24BEBB308]);
}

- (BOOL)_accessibilityHitTestShouldFallbackToNearestChild
{
  return 1;
}

- (id)_accessibilityHitTest:(CGPoint)a3 withEvent:(id)a4
{
  void *v4;
  id v5;
  objc_super v7;
  CGRect v8;

  v7.receiver = self;
  v7.super_class = (Class)LargeMonthWeekViewAccessibility;
  -[LargeMonthWeekViewAccessibility _accessibilityHitTest:withEvent:](&v7, sel__accessibilityHitTest_withEvent_, a4, a3.x, a3.y);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_accessibilityVisibleFrame");
  if (CGRectIsEmpty(v8))
    v5 = 0;
  else
    v5 = v4;

  return v5;
}

@end
