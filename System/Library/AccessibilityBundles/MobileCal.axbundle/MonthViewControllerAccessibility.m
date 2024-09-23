@implementation MonthViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("MonthViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("MonthViewController"), CFSTR("InfiniteScrollViewController"));
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("MonthViewController"), CFSTR("UIViewController"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("InfiniteScrollViewController"), CFSTR("scrollView"), "@", 0);
  objc_msgSend(v3, "validateProtocol:hasMethod:isInstanceMethod:isRequired:", CFSTR("InfiniteScrollViewSubview"), CFSTR("calendarDate"), 1, 1);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("InfiniteScrollViewController"), CFSTR("_views"), "NSMutableArray");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MonthViewController"), CFSTR("eventGestureController:setUpAtPoint:withOccurrence:forceNewEvent:"), "@", "@", "{CGPoint=dd}", "@", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MonthViewController"), CFSTR("_updateDraggingOffsetTimesForPoint:"), "v", "{CGPoint=dd}", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MonthViewController"), CFSTR("eventGestureController: commitToPoint:"), "v", "@", "{CGPoint=dd}", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("MonthViewController"), CFSTR("_draggedOccurrence"), "EKEvent");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("MonthViewController"), CFSTR("_draggingExistingEvent"), "B");

}

- (id)_axTopWeekViewWithTopPoint:(CGPoint)a3
{
  double y;
  double x;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *i;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  char v21;
  _BYTE v22[128];
  uint64_t v23;
  CGRect v24;

  y = a3.y;
  x = a3.x;
  v23 = *MEMORY[0x24BDAC8D0];
  v21 = 0;
  objc_opt_class();
  -[MonthViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("scrollView"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[MonthViewControllerAccessibility view](self, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "convertPoint:fromView:", v8, x, y);
  v10 = v9;

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  -[MonthViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_views"), 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (id)objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
  if (v12)
  {
    v13 = *(_QWORD *)v18;
    while (2)
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(_QWORD *)v18 != v13)
          objc_enumerationMutation(v11);
        v15 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v15, "frame");
        if (v10 < CGRectGetMidY(v24))
        {
          v12 = v15;
          goto LABEL_11;
        }
      }
      v12 = (id)objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
      if (v12)
        continue;
      break;
    }
  }
LABEL_11:

  return v12;
}

- (id)accessibilityScrollStatusForScrollView:(id)a3
{
  double v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(a3, "contentInset");
  -[MonthViewControllerAccessibility _axTopWeekViewWithTopPoint:](self, "_axTopWeekViewWithTopPoint:", 0.0, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "safeValueForKey:", CFSTR("calendarDate"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "date");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  AXDateStringForFormat();
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)_axAnnotateView
{
  void *v2;
  void *v3;

  objc_opt_class();
  __UIAccessibilityCastAsClass();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "accessibilitySetIdentification:", CFSTR("_AXMonthViewIdentifier"));

}

- (void)_accessibilityLoadAccessibilityInformation
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MonthViewControllerAccessibility;
  -[MonthViewControllerAccessibility _accessibilityLoadAccessibilityInformation](&v3, sel__accessibilityLoadAccessibilityInformation);
  -[MonthViewControllerAccessibility _axAnnotateView](self, "_axAnnotateView");
}

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MonthViewControllerAccessibility;
  -[MonthViewControllerAccessibility viewDidLoad](&v3, sel_viewDidLoad);
  -[MonthViewControllerAccessibility _axAnnotateView](self, "_axAnnotateView");
}

- (id)scrollView
{
  void *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MonthViewControllerAccessibility;
  -[MonthViewControllerAccessibility scrollView](&v5, sel_scrollView);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAccessibilityContainerType:", 4);
  accessibilityLocalizedString(CFSTR("months.container"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAccessibilityLabel:", v3);

  return v2;
}

- (id)eventGestureController:(id)a3 setUpAtPoint:(CGPoint)a4 withOccurrence:(id)a5 forceNewEvent:(BOOL)a6
{
  _BOOL8 v6;
  double y;
  double x;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  objc_super v22;

  v6 = a6;
  y = a4.y;
  x = a4.x;
  v11 = a3;
  v12 = a5;
  v22.receiver = self;
  v22.super_class = (Class)MonthViewControllerAccessibility;
  -[MonthViewControllerAccessibility eventGestureController:setUpAtPoint:withOccurrence:forceNewEvent:](&v22, sel_eventGestureController_setUpAtPoint_withOccurrence_forceNewEvent_, v11, v12, v6, x, y);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (UIAccessibilityIsVoiceOverRunning()
    && (-[MonthViewControllerAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("_draggingExistingEvent")) & 1) == 0)
  {
    _AXAssert();
  }
  objc_opt_class();
  -[MonthViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_draggedOccurrence"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15 && objc_msgSend(v15, "isEditable"))
  {
    v16 = (void *)MEMORY[0x24BDD17C8];
    accessibilityLocalizedString(CFSTR("began.time.adjust"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "startDate");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    AXDateStringForFormat();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "stringWithFormat:", v17, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    UIAccessibilitySpeak();
  }

  return v13;
}

- (BOOL)_axIsCommittingTimeAdjustment
{
  return __UIAccessibilityGetAssociatedBool();
}

- (void)_axSetIsCommittingTimeAdjustment:(BOOL)a3
{
  __UIAccessibilitySetAssociatedBool();
}

- (void)_updateDraggingOffsetTimesForPoint:(CGPoint)a3
{
  double y;
  double x;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  objc_super v17;
  char v18;

  y = a3.y;
  x = a3.x;
  v18 = 0;
  objc_opt_class();
  -[MonthViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_draggedStartDate"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v17.receiver = self;
  v17.super_class = (Class)MonthViewControllerAccessibility;
  -[MonthViewControllerAccessibility _updateDraggingOffsetTimesForPoint:](&v17, sel__updateDraggingOffsetTimesForPoint_, x, y);
  v18 = 0;
  objc_opt_class();
  -[MonthViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_draggingEvent"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
    goto LABEL_14;
  if (v9 && objc_msgSend(v9, "isEditable"))
  {
    v18 = 0;
    objc_opt_class();
    -[MonthViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_draggedStartDate"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAccessibilityCastAsClass();
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v18)
    {
      if (-[MonthViewControllerAccessibility _axIsCommittingTimeAdjustment](self, "_axIsCommittingTimeAdjustment"))
      {
        v12 = (void *)MEMORY[0x24BDD17C8];
        accessibilityLocalizedString(CFSTR("ended.time.adjust"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "date");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        AXDateStringForFormat();
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "stringWithFormat:", v13, v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        if ((objc_msgSend(v7, "isEqual:", v11) & 1) != 0)
        {
LABEL_12:

          goto LABEL_13;
        }
        objc_msgSend(v11, "date");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        AXDateStringForFormat();
        v16 = (void *)objc_claimAutoreleasedReturnValue();
      }

      if (v16)
      {
        UIAccessibilitySpeak();

      }
      goto LABEL_12;
    }
LABEL_14:
    abort();
  }
LABEL_13:

}

- (void)eventGestureController:(id)a3 commitToPoint:(CGPoint)a4
{
  double y;
  double x;
  id v7;
  objc_super v8;

  y = a4.y;
  x = a4.x;
  v7 = a3;
  -[MonthViewControllerAccessibility _axSetIsCommittingTimeAdjustment:](self, "_axSetIsCommittingTimeAdjustment:", 1);
  v8.receiver = self;
  v8.super_class = (Class)MonthViewControllerAccessibility;
  -[MonthViewControllerAccessibility eventGestureController:commitToPoint:](&v8, sel_eventGestureController_commitToPoint_, v7, x, y);

  -[MonthViewControllerAccessibility _axSetIsCommittingTimeAdjustment:](self, "_axSetIsCommittingTimeAdjustment:", 0);
}

@end
