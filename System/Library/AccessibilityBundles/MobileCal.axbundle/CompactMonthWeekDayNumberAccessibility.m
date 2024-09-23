@implementation CompactMonthWeekDayNumberAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CompactMonthWeekDayNumber");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:", CFSTR("CompactWidthMonthViewController"));
  objc_msgSend(v3, "validateClass:", CFSTR("CompactMonthWeekView"));
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("CompactMonthWeekView"), CFSTR("_today"), "CompactMonthWeekDayNumber");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("CompactWidthMonthViewController"), CFSTR("_model"), "CUIKCalendarModel");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CompactMonthWeekDayNumber"), CFSTR("calendarDate"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CompactMonthWeekDayNumber"), CFSTR("attachedTodayCircle"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CompactMonthWeekTodayCircle"), CFSTR("drawCircle"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CompactMonthWeekDayNumber"), CFSTR("frame"), "{CGRect={CGPoint=dd}{CGSize=dd}}", 0);

}

- (BOOL)isAccessibilityElement
{
  void *v2;
  BOOL v3;

  -[CompactMonthWeekDayNumberAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("calendarDate"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (CGRect)accessibilityFrame
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  CGRect v14;

  -[CompactMonthWeekDayNumberAccessibility accessibilityContainer](self, "accessibilityContainer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CompactMonthWeekDayNumberAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("layer"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "safeValueForKey:", CFSTR("frame"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "CGRectValue");
  UIAccessibilityFrameForBounds();
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;

  v14.origin.x = v7;
  v14.origin.y = v9;
  v14.size.width = v11;
  v14.size.height = v13;
  return CGRectInset(v14, -10.0, -10.0);
}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  CompactMonthWeekDayNumberAccessibility *v7;
  void *v8;
  uint64_t v9;

  -[CompactMonthWeekDayNumberAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("calendarDate"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeValueForKey:", CFSTR("date"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  _AXGetStringsForDate(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[CompactMonthWeekDayNumberAccessibility accessibilityContainer](self, "accessibilityContainer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "safeValueForKey:", CFSTR("_today"));
  v7 = (CompactMonthWeekDayNumberAccessibility *)objc_claimAutoreleasedReturnValue();

  if (v7 == self)
  {
    accessibilityLocalizedString(CFSTR("today.indicator"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAXStringForVariables();
    v9 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v9;
  }
  return v5;
}

- (id)accessibilityUserInputLabels
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_opt_class();
  -[CompactMonthWeekDayNumberAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("calendarDate"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "day");
  AXFormatInteger();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x2349148F4]();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)accessibilityHint
{
  return accessibilityLocalizedString(CFSTR("month.day.hint"));
}

- (unint64_t)accessibilityTraits
{
  unint64_t v2;
  void *v3;
  void *v4;

  v2 = *MEMORY[0x24BDF73B0];
  -[CompactMonthWeekDayNumberAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("attachedTodayCircle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3 && objc_msgSend(v3, "safeBoolForKey:", CFSTR("drawCircle")))
    v2 |= *MEMORY[0x24BDF7400];

  return v2;
}

- (id)_axCalendarModel
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[CompactMonthWeekDayNumberAccessibility _accessibilityAncestorIsKindOf:](self, "_accessibilityAncestorIsKindOf:", NSClassFromString(CFSTR("CompactMonthWeekView")));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_opt_class();
    __UIAccessibilityCastAsSafeCategory();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_accessibilityMonthViewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      objc_msgSend(v4, "safeValueForKey:", CFSTR("_model"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = 0;
    }

  }
  else
  {
    _AXAssert();
    v5 = 0;
  }

  return v5;
}

- (id)_axEventStore
{
  void *v2;
  void *v3;

  -[CompactMonthWeekDayNumberAccessibility _axCalendarModel](self, "_axCalendarModel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safeValueForKey:", CFSTR("eventStore"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_axStringForNumberOfEvents:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;

  v4 = (void *)MEMORY[0x24BDD17C8];
  accessibilityLocalizedString(CFSTR("event.count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringWithFormat:", v5, a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)accessibilityValue
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
  void *v14;
  void *v15;
  void *v16;
  void *v18;

  -[CompactMonthWeekDayNumberAccessibility _axEventStore](self, "_axEventStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CompactMonthWeekDayNumberAccessibility _axCalendarModel](self, "_axCalendarModel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "safeValueForKey:", CFSTR("selectedCalendars"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[CompactMonthWeekDayNumberAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("calendarDate"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_msgSend(v6, "components");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setHour:", 0);
    objc_msgSend(v7, "setMinute:", 0);
    objc_msgSend(v7, "setSecond:", 0);
    v8 = (void *)MEMORY[0x24BE13FF0];
    objc_msgSend(v3, "timeZone");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "calendarDateWithDateComponents:timeZone:", v7, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "calendarDateByAddingDays:", 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "date");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "date");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "allObjects");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "predicateForEventsWithStartDate:endDate:calendars:", v11, v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "eventsMatchingPredicate:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[CompactMonthWeekDayNumberAccessibility _axStringForNumberOfEvents:](self, "_axStringForNumberOfEvents:", objc_msgSend(v15, "count"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (id)accessibilityCustomContent
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
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  void *v41;
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  accessibilityLocalizedString(CFSTR("event.calendars.none"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CompactMonthWeekDayNumberAccessibility _axEventStore](self, "_axEventStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CompactMonthWeekDayNumberAccessibility _axCalendarModel](self, "_axCalendarModel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "safeValueForKey:", CFSTR("selectedCalendars"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)objc_opt_new();
  -[CompactMonthWeekDayNumberAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("calendarDate"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v8, "components");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setHour:", 0);
      objc_msgSend(v9, "setMinute:", 0);
      objc_msgSend(v9, "setSecond:", 0);
      v10 = (void *)MEMORY[0x24BE13FF0];
      objc_msgSend(v4, "timeZone");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = v9;
      objc_msgSend(v10, "calendarDateWithDateComponents:timeZone:", v9, v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v12, "calendarDateByAddingDays:", 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = v12;
      objc_msgSend(v12, "date");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = v13;
      objc_msgSend(v13, "date");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = v6;
      objc_msgSend(v6, "allObjects");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "predicateForEventsWithStartDate:endDate:calendars:", v14, v15, v16);
      v17 = objc_claimAutoreleasedReturnValue();

      v32 = (void *)v17;
      objc_msgSend(v4, "eventsMatchingPredicate:", v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = 0u;
      v38 = 0u;
      v39 = 0u;
      v40 = 0u;
      v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
      if (v19)
      {
        v20 = v19;
        v21 = *(_QWORD *)v38;
        do
        {
          v22 = 0;
          do
          {
            if (*(_QWORD *)v38 != v21)
              objc_enumerationMutation(v18);
            objc_msgSend(*(id *)(*((_QWORD *)&v37 + 1) + 8 * v22), "calendar");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "title");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "addObject:", v24);

            ++v22;
          }
          while (v20 != v22);
          v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
        }
        while (v20);
      }
      objc_msgSend(v7, "allObjects");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "componentsJoinedByString:", CFSTR(", "));
      v26 = objc_claimAutoreleasedReturnValue();

      v3 = (void *)v26;
      v6 = v36;
    }
  }
  v27 = (void *)MEMORY[0x24BDB3D68];
  accessibilityLocalizedString(CFSTR("event.calendars"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "customContentWithLabel:value:", v28, v3);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = v29;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v41, 1);
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  return v30;
}

- (BOOL)_accessibilityIsSpeakThisElement
{
  void *v2;
  void *v3;
  char v4;

  -[CompactMonthWeekDayNumberAccessibility accessibilityValue](self, "accessibilityValue");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  accessibilityLocalizedString(CFSTR("event.count.none"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "isEqualToString:", v3) ^ 1;

  return v4;
}

- (BOOL)_axAreChildrenFocused
{
  return __UIAccessibilityGetAssociatedBool();
}

- (void)_axSetAreChildrenFocused:(BOOL)a3
{
  __UIAccessibilitySetAssociatedBool();
}

- (NSArray)preferredFocusEnvironments
{
  return (NSArray *)MEMORY[0x24BDBD1A8];
}

- (UIFocusEnvironment)parentFocusEnvironment
{
  return (UIFocusEnvironment *)-[CompactMonthWeekDayNumberAccessibility _accessibilityFindAncestor:startWithSelf:](self, "_accessibilityFindAncestor:startWithSelf:", &__block_literal_global_2, 0);
}

uint64_t __84__CompactMonthWeekDayNumberAccessibility_UIFocusConformance__parentFocusEnvironment__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "conformsToProtocol:", &unk_255FDA2F8);
}

- (NSString)focusGroupIdentifier
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CompactMonthWeekDayNumberAccessibility;
  -[CompactMonthWeekDayNumberAccessibility focusGroupIdentifier](&v9, sel_focusGroupIdentifier);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3
    || (-[CompactMonthWeekDayNumberAccessibility _accessibilityParentView](self, "_accessibilityParentView"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "safeValueForKey:", CFSTR("_containingScrollView")),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v5,
        v4,
        v5))
  {
    v6 = v3;
  }
  else
  {
    -[CompactMonthWeekDayNumberAccessibility _accessibilityDefaultFocusGroupIdentifier](self, "_accessibilityDefaultFocusGroupIdentifier");
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;

  return (NSString *)v7;
}

- (void)setNeedsFocusUpdate
{
  id v3;

  objc_msgSend(MEMORY[0x24BDF6A68], "focusSystemForEnvironment:", self);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "requestFocusUpdateToEnvironment:", self);
  -[CompactMonthWeekDayNumberAccessibility _updateFocusLayerFrame](self, "_updateFocusLayerFrame");

}

- (void)updateFocusIfNeeded
{
  id v3;

  objc_msgSend(MEMORY[0x24BDF6A68], "focusSystemForEnvironment:", self);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "updateFocusIfNeeded");
  -[CompactMonthWeekDayNumberAccessibility _updateFocusLayerFrame](self, "_updateFocusLayerFrame");

}

- (BOOL)shouldUpdateFocusInContext:(id)a3
{
  return 1;
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  CompactMonthWeekDayNumberAccessibility *v10;

  v6 = a3;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __111__CompactMonthWeekDayNumberAccessibility_UIFocusConformance__didUpdateFocusInContext_withAnimationCoordinator___block_invoke;
  v8[3] = &unk_25027D398;
  v9 = v6;
  v10 = self;
  v7 = v6;
  objc_msgSend(a4, "addCoordinatedAnimations:completion:", v8, 0);

}

uint64_t __111__CompactMonthWeekDayNumberAccessibility_UIFocusConformance__didUpdateFocusInContext_withAnimationCoordinator___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  int v5;

  objc_msgSend(*(id *)(a1 + 32), "nextFocusedItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2 == *(void **)(a1 + 40))
  {
    objc_msgSend(v2, "_accessibilityParentView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "_accessibilityIsFKARunningForFocusItem");

    if (v5)
      return objc_msgSend(MEMORY[0x24BDF6A60], "moveRingToFocusItem:", *(_QWORD *)(a1 + 40));
  }
  else
  {

  }
  return objc_msgSend(MEMORY[0x24BDF6A60], "removeRingFromFocusItem:", *(_QWORD *)(a1 + 40));
}

- (void)_destroyFocusLayer
{
  objc_msgSend(MEMORY[0x24BDF6A60], "removeRingFromFocusItem:", self);
}

- (void)_updateFocusLayerFrame
{
  objc_msgSend(MEMORY[0x24BDF6A60], "updateRingForFocusItem:", self);
}

- (BOOL)canBecomeFocused
{
  int v3;

  v3 = -[CompactMonthWeekDayNumberAccessibility isAccessibilityElement](self, "isAccessibilityElement");
  if (v3)
    LOBYTE(v3) = -[CompactMonthWeekDayNumberAccessibility accessibilityRespondsToUserInteraction](self, "accessibilityRespondsToUserInteraction");
  return v3;
}

- (id)_preferredFocusRegionCoordinateSpace
{
  void *v2;
  void *v3;
  void *v4;

  -[CompactMonthWeekDayNumberAccessibility _accessibilityParentView](self, "_accessibilityParentView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_screen");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "coordinateSpace");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)focusItemsInRect:(CGRect)a3
{
  void *v4;
  void *v5;
  void *v6;
  unint64_t v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v12[5];

  -[CompactMonthWeekDayNumberAccessibility accessibilityElements](self, "accessibilityElements", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __79__CompactMonthWeekDayNumberAccessibility_UIFocusConformance__focusItemsInRect___block_invoke;
    v12[3] = &unk_25027D470;
    v12[4] = self;
    objc_msgSend(MEMORY[0x24BDD1758], "predicateWithBlock:", v12);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "filteredArrayUsingPredicate:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else if (-[CompactMonthWeekDayNumberAccessibility accessibilityElementCount](self, "accessibilityElementCount") == 0x7FFFFFFFFFFFFFFFLL)
  {
    v6 = 0;
  }
  else
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", -[CompactMonthWeekDayNumberAccessibility accessibilityElementCount](self, "accessibilityElementCount"));
    if (-[CompactMonthWeekDayNumberAccessibility accessibilityElementCount](self, "accessibilityElementCount"))
    {
      v7 = 0;
      do
      {
        -[CompactMonthWeekDayNumberAccessibility accessibilityElementAtIndex:](self, "accessibilityElementAtIndex:", v7);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v8, "conformsToProtocol:", &unk_255FDA648))
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0
            || -[CompactMonthWeekDayNumberAccessibility _accessibilityFKAShouldIncludeViewsAsElements](self, "_accessibilityFKAShouldIncludeViewsAsElements"))
          {
            objc_msgSend(v6, "axSafelyAddObject:", v8);
          }
        }

        ++v7;
      }
      while (v7 < -[CompactMonthWeekDayNumberAccessibility accessibilityElementCount](self, "accessibilityElementCount"));
    }
  }
  if (v6)
    v9 = v6;
  else
    v9 = (void *)MEMORY[0x24BDBD1A8];
  v10 = v9;

  return v10;
}

uint64_t __79__CompactMonthWeekDayNumberAccessibility_UIFocusConformance__focusItemsInRect___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;

  v3 = a2;
  if (objc_msgSend(v3, "conformsToProtocol:", &unk_255FDA648))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v4 = objc_msgSend(*(id *)(a1 + 32), "_accessibilityFKAShouldIncludeViewsAsElements");
    else
      v4 = 1;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)_prefersFocusContainment
{
  if (-[CompactMonthWeekDayNumberAccessibility conformsToProtocol:](self, "conformsToProtocol:", &unk_255FDFF68)
    || (-[CompactMonthWeekDayNumberAccessibility _accessibilityIsTouchContainer](self, "_accessibilityIsTouchContainer") & 1) != 0)
  {
    return 1;
  }
  else
  {
    return -[CompactMonthWeekDayNumberAccessibility shouldGroupAccessibilityChildren](self, "shouldGroupAccessibilityChildren");
  }
}

- (BOOL)conformsToProtocol:(id)a3
{
  objc_super v7;

  if (&unk_255FDA648 == a3 || &unk_255FDA2F8 == a3 || &unk_255FDA7A8 == a3 || &unk_255FDAC98 == a3)
    return 1;
  v7.receiver = self;
  v7.super_class = (Class)CompactMonthWeekDayNumberAccessibility;
  return -[CompactMonthWeekDayNumberAccessibility conformsToProtocol:](&v7, sel_conformsToProtocol_);
}

@end
