@implementation EKDayOccurrenceViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("EKDayOccurrenceView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (NSValue)_axRealFrameInSuperview
{
  JUMPOUT(0x23490DF50);
}

- (void)_axSetRealFrameInSuperview:(id)a3
{
  __UIAccessibilitySetAssociatedObject();
}

- (id)_axDropPointDescriptorsProvider
{
  JUMPOUT(0x23490DF50);
}

- (void)_axSetDropPointDescriptorsProvider:(id)a3
{
  __UIAccessibilitySetAssociatedObject();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:", CFSTR("EKLayoutContainerView"));
  objc_msgSend(v3, "validateClass:", CFSTR("EKDayViewController"));
  objc_msgSend(v3, "validateClass:", CFSTR("EKDayGridView"));
  objc_msgSend(v3, "validateClass:", CFSTR("EKDayView"));
  objc_msgSend(v3, "validateClass:", CFSTR("EKEvent"));
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("EKDayOccurrenceView"), CFSTR("UIView"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("EKLayoutContainerView"), CFSTR("delegate"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("EKDayOccurrenceView"), CFSTR("arrayOfResizeHandles"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("EKDayOccurrenceView"), CFSTR("occurrence"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("EKDayOccurrenceView"), CFSTR("isAllDay"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("EKDayOccurrenceView"), CFSTR("prepareForReuse"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("EKDayOccurrenceView"), CFSTR("isCancelled"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("EKDayOccurrenceView"), CFSTR("isBirthday"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("EKDayOccurrenceView"), CFSTR("isTentative"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("EKDayOccurrenceView"), CFSTR("isDeclined"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("EKDayOccurrenceView"), CFSTR("needsReply"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("EKDayOccurrenceView"), CFSTR("isSelectedCopyView"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("EKDayOccurrenceView"), CFSTR("setDrawsResizeHandles:"), "v", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("EKDayOccurrenceView"), CFSTR("occurrence"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("EKDayViewController"), CFSTR("currentDayView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("EKDayViewController"), CFSTR("_eventGestureController"), "EKEventGestureController");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("EKEventGestureController"), CFSTR("_draggingView"), "EKDayOccurrenceView");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("EKEvent"), CFSTR("title"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("EKEvent"), CFSTR("virtualConference"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("EKVirtualConference"), CFSTR("joinMethods"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("EKCalendarItem"), CFSTR("location"), "@", 0);
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("EKEvent"), CFSTR("EKCalendarItem"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIView"), CFSTR("canBecomeFocused"), "B", 0);

}

- (BOOL)_axIsInPreview
{
  void *v2;
  char v3;

  -[EKDayOccurrenceViewAccessibility _accessibilityAncestorIsKindOf:](self, "_accessibilityAncestorIsKindOf:", NSClassFromString(CFSTR("EKDayGridView")));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "accessibilityIsPreviewGridView");

  return v3;
}

- (BOOL)isAccessibilityElement
{
  void *v3;
  void *v4;
  char v5;
  CGRect v7;

  -[EKDayOccurrenceViewAccessibility isAccessibilityUserDefinedElement](self, "isAccessibilityUserDefinedElement");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[EKDayOccurrenceViewAccessibility isAccessibilityUserDefinedElement](self, "isAccessibilityUserDefinedElement");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "BOOLValue");

    return v5;
  }
  else if ((-[EKDayOccurrenceViewAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("isSelectedCopyView")) & 1) != 0)
  {
    return 0;
  }
  else if (-[EKDayOccurrenceViewAccessibility _axIsInPreview](self, "_axIsInPreview"))
  {
    -[EKDayOccurrenceViewAccessibility accessibilityFrameForScrolling](self, "accessibilityFrameForScrolling");
    return !CGRectIsNull(v7);
  }
  else
  {
    return 1;
  }
}

- (CGRect)accessibilityFrameForScrolling
{
  void *v3;
  uint64_t v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  void *v14;
  void *v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  CGFloat v19;
  double v20;
  double v21;
  double v22;
  double v23;
  objc_super v24;
  CGRect v25;
  CGRect v26;
  CGRect result;
  CGRect v28;

  -[EKDayOccurrenceViewAccessibility _axRealFrameInSuperview](self, "_axRealFrameInSuperview");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKDayOccurrenceViewAccessibility superview](self, "superview");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (v3 && v4)
  {
    objc_msgSend(v3, "CGRectValue");
    UIAccessibilityFrameForBounds();
  }
  else
  {
    v24.receiver = self;
    v24.super_class = (Class)EKDayOccurrenceViewAccessibility;
    -[EKDayOccurrenceViewAccessibility accessibilityFrameForScrolling](&v24, sel_accessibilityFrameForScrolling);
  }
  x = v6;
  y = v7;
  width = v8;
  height = v9;
  -[EKDayOccurrenceViewAccessibility _accessibilityAncestorIsKindOf:](self, "_accessibilityAncestorIsKindOf:", NSClassFromString(CFSTR("EKDayGridView")));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v14, "accessibilityIsPreviewGridView"))
  {
    objc_msgSend(v14, "_accessibilityViewAncestorIsKindOf:", objc_opt_class());
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "accessibilityFrame");
    v28.origin.x = v16;
    v28.origin.y = v17;
    v28.size.width = v18;
    v28.size.height = v19;
    v25.origin.x = x;
    v25.origin.y = y;
    v25.size.width = width;
    v25.size.height = height;
    v26 = CGRectIntersection(v25, v28);
    x = v26.origin.x;
    y = v26.origin.y;
    width = v26.size.width;
    height = v26.size.height;

  }
  v20 = x;
  v21 = y;
  v22 = width;
  v23 = height;
  result.size.height = v23;
  result.size.width = v22;
  result.origin.y = v21;
  result.origin.x = v20;
  return result;
}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  double v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  const __CFString *v48;
  const __CFString *v49;
  const __CFString *v50;
  const __CFString *v51;
  const __CFString *v52;
  const __CFString *v53;
  const __CFString *v54;
  const __CFString *v55;
  const __CFString *v56;
  uint64_t v57;
  id v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;

  objc_opt_class();
  -[EKDayOccurrenceViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("occurrence"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "safeStringForKey:", CFSTR("title"));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (-[EKDayOccurrenceViewAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("isCancelled")))
  {
    accessibilityLocalizedString(CFSTR("AX_IS_CANCELED"));
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = CFSTR("__AXStringForVariablesSentinel");
    __UIAXStringForVariables();
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  if (-[EKDayOccurrenceViewAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("isTentative"), v37, v48))
  {
    accessibilityLocalizedString(CFSTR("event.tentative"));
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = CFSTR("__AXStringForVariablesSentinel");
    __UIAXStringForVariables();
    v7 = objc_claimAutoreleasedReturnValue();

    v6 = (void *)v7;
  }
  if (-[EKDayOccurrenceViewAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("isDeclined"), v38, v49))
  {
    accessibilityLocalizedString(CFSTR("event.declined"));
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = CFSTR("__AXStringForVariablesSentinel");
    __UIAXStringForVariables();
    v8 = objc_claimAutoreleasedReturnValue();

    v6 = (void *)v8;
  }
  if (-[EKDayOccurrenceViewAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("needsReply"), v39, v50))
  {
    accessibilityLocalizedString(CFSTR("event.needsreply"));
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = CFSTR("__AXStringForVariablesSentinel");
    __UIAXStringForVariables();
    v9 = objc_claimAutoreleasedReturnValue();

    v6 = (void *)v9;
  }
  objc_msgSend(v4, "virtualConference", v40, v51);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "safeArrayForKey:", CFSTR("joinMethods"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "firstObject");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "URL");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "absoluteString");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "lowercaseString");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v15, "containsString:", CFSTR("facetime.apple.com")))
  {
    accessibilityLocalizedString(CFSTR("application.name.facetime"));
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = CFSTR("__AXStringForVariablesSentinel");
    __UIAXStringForVariables();
    v16 = objc_claimAutoreleasedReturnValue();

    v6 = (void *)v16;
  }
  objc_msgSend(v4, "safeStringForKey:", CFSTR("location"), v41, v52);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(v4, "_accessibilityDurationString");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    v61 = v17;
    __UIAXStringForVariables();
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "travelTime", v17, v60, CFSTR("__AXStringForVariablesSentinel"));
    if (v19 > 0.0)
    {
      MEMORY[0x23490DDF4](objc_msgSend(v4, "travelTime"));
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v54 = CFSTR("__AXStringForVariablesSentinel");
      __UIAXStringForVariables();
      v20 = objc_claimAutoreleasedReturnValue();

      v18 = (void *)v20;
    }
    if (objc_msgSend(v4, "isOrWasPartOfRecurringSeries", v43, v54))
    {
      accessibilityLocalizedString(CFSTR("event.repeats"));
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v55 = CFSTR("__AXStringForVariablesSentinel");
      __UIAXStringForVariables();
      v21 = objc_claimAutoreleasedReturnValue();

      v18 = (void *)v21;
    }
    v62 = v12;
    if (objc_msgSend(v4, "hasAttachment", v44, v55))
    {
      accessibilityLocalizedString(CFSTR("event.has.attachments"));
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      v56 = CFSTR("__AXStringForVariablesSentinel");
      __UIAXStringForVariables();
      v22 = objc_claimAutoreleasedReturnValue();

      v18 = (void *)v22;
    }
    objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar", v45, v56);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "startDate");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (v24)
    {
      objc_msgSend(v23, "components:fromDate:", 62, v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "endDate");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      if (v26)
      {
        v58 = v5;
        objc_msgSend(v23, "components:fromDate:", 62, v26);
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDBCE60], "date");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "components:fromDate:", 62, v27);
        v28 = (void *)objc_claimAutoreleasedReturnValue();

        v29 = objc_msgSend(v25, "year");
        if (v29 == objc_msgSend(v28, "year"))
        {
          v30 = objc_msgSend(v25, "month");
          if (v30 == objc_msgSend(v28, "month"))
          {
            v31 = objc_msgSend(v25, "day");
            if (v31 == objc_msgSend(v28, "day"))
            {
              v32 = objc_msgSend(v25, "hour");
              if (v32 >= objc_msgSend(v28, "hour"))
              {
                v33 = objc_msgSend(v59, "hour");
                if (v33 <= objc_msgSend(v28, "hour"))
                {
                  accessibilityLocalizedString(CFSTR("in.progress"));
                  v42 = (void *)objc_claimAutoreleasedReturnValue();
                  v53 = CFSTR("__AXStringForVariablesSentinel");
                  __UIAXStringForVariables();
                  v57 = objc_claimAutoreleasedReturnValue();

                  v18 = (void *)v57;
                }
              }
            }
          }
        }

        v5 = v58;
      }
      else
      {
        v42 = v4;
        _AXAssert();
      }

    }
    else
    {
      v42 = v4;
      _AXAssert();
    }

    v6 = v18;
    v17 = v61;
    v12 = v62;
  }
  if (-[EKDayOccurrenceViewAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("isBirthday"), v42, v53))
  {
    accessibilityLocalizedString(CFSTR("event.birthday"));
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAXStringForVariables();
    v34 = objc_claimAutoreleasedReturnValue();

    v6 = (void *)v34;
  }
  if (v4)
  {
    accessibilityCalendarTitleForEventIfNecessary(v4);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAXStringForVariables();
    v35 = objc_claimAutoreleasedReturnValue();

    v6 = (void *)v35;
  }

  return v6;
}

- (id)accessibilityUserInputLabels
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_opt_class();
  -[EKDayOccurrenceViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("occurrence"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "safeStringForKey:", CFSTR("title"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x23490DE60]();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_accessibilitySupplementaryFooterViews
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x24BDAC8D0];
  -[EKDayOccurrenceViewAccessibility _axDraggingView](self, "_axDraggingView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safeValueForKey:", CFSTR("_endResizeHandle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v3, "_accessibilityViewIsVisible"))
  {
    v6[0] = v3;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)_accessibilitySupplementaryHeaderViews
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x24BDAC8D0];
  -[EKDayOccurrenceViewAccessibility _axDraggingView](self, "_axDraggingView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safeValueForKey:", CFSTR("_startResizeHandle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v3, "_accessibilityViewIsVisible"))
  {
    v6[0] = v3;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)setDrawsResizeHandles:(BOOL)a3
{
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)EKDayOccurrenceViewAccessibility;
  -[EKDayOccurrenceViewAccessibility setDrawsResizeHandles:](&v6, sel_setDrawsResizeHandles_, a3);
  -[EKDayOccurrenceViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_startResizeHandle"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAccessibilityIdentifier:", CFSTR("StartHandle"));
  objc_msgSend(v4, "setAccessibilityContainer:", self);
  -[EKDayOccurrenceViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_endResizeHandle"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAccessibilityContainer:", self);
  objc_msgSend(v5, "setAccessibilityIdentifier:", CFSTR("EndHandle"));
  UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], 0);

}

- (id)_axDraggingView
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
  char v13;
  void *v15;
  void *v16;

  -[EKDayOccurrenceViewAccessibility _accessibilityAncestorIsKindOf:](self, "_accessibilityAncestorIsKindOf:", NSClassFromString(CFSTR("EKLayoutContainerView")));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "safeValueForKey:", CFSTR("delegate"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    NSClassFromString(CFSTR("EKDayViewController"));
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v5, "safeValueForKey:", CFSTR("_eventGestureController"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_12;
    }
    goto LABEL_9;
  }
  -[EKDayOccurrenceViewAccessibility _accessibilityAncestorIsKindOf:](self, "_accessibilityAncestorIsKindOf:", NSClassFromString(CFSTR("WeekGroupView")));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v7;
  if (!v7)
  {
LABEL_9:
    v6 = 0;
    goto LABEL_12;
  }
  objc_msgSend(v7, "superview");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v15 = v5;
    v16 = v8;
    _AXAssert();
  }
  objc_msgSend(v8, "safeValueForKey:", CFSTR("delegate"), v15, v16);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  NSClassFromString(CFSTR("WeekViewController"));
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v9, "safeValueForKey:", CFSTR("_eventGestureController"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

LABEL_12:
  objc_msgSend(v6, "safeValueForKey:", CFSTR("_draggingView"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKDayOccurrenceViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("occurrence"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "safeValueForKey:", CFSTR("occurrence"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v11, "isEqual:", v12);

  if ((v13 & 1) == 0)
  {

    v10 = 0;
  }

  return v10;
}

- (id)accessibilityCustomRotors
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v9;
  uint64_t v10;
  id (*v11)(id *, void *);
  void *v12;
  id v13;
  id location;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x24BDAC8D0];
  -[EKDayOccurrenceViewAccessibility _axDraggingView](self, "_axDraggingView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return 0;
  -[EKDayOccurrenceViewAccessibility _accessibilityValueForKey:](self, "_accessibilityValueForKey:", CFSTR("AXCustomRotor"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    objc_initWeak(&location, self);
    v5 = objc_alloc(MEMORY[0x24BDF6790]);
    accessibilityLocalizedString(CFSTR("handles"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = MEMORY[0x24BDAC760];
    v10 = 3221225472;
    v11 = __61__EKDayOccurrenceViewAccessibility_accessibilityCustomRotors__block_invoke;
    v12 = &unk_2501FCCD0;
    objc_copyWeak(&v13, &location);
    v4 = (void *)objc_msgSend(v5, "initWithName:itemSearchBlock:", v6, &v9);

    -[EKDayOccurrenceViewAccessibility _accessibilitySetRetainedValue:forKey:](self, "_accessibilitySetRetainedValue:forKey:", v4, CFSTR("AXCustomRotor"), v9, v10, v11, v12);
    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }
  v15[0] = v4;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v15, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

id __61__EKDayOccurrenceViewAccessibility_accessibilityCustomRotors__block_invoke(id *a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;

  v3 = a2;
  a1 += 4;
  WeakRetained = objc_loadWeakRetained(a1);
  objc_msgSend(WeakRetained, "_axDraggingView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "safeValueForKey:", CFSTR("arrayOfResizeHandles"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilitySafeClass();
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_loadWeakRetained(a1);
  objc_msgSend(v8, "_accessibilityCustomRotorResultHelper:array:", v3, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (unint64_t)accessibilityTraits
{
  unint64_t v3;
  _BOOL4 v4;
  uint64_t v5;
  unint64_t v6;
  void *v7;
  void *v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  CGFloat v19;
  CGFloat v20;
  objc_super v22;
  CGRect v23;
  CGRect v24;

  v22.receiver = self;
  v22.super_class = (Class)EKDayOccurrenceViewAccessibility;
  v3 = -[EKDayOccurrenceViewAccessibility accessibilityTraits](&v22, sel_accessibilityTraits);
  v4 = -[EKDayOccurrenceViewAccessibility _axIsInPreview](self, "_axIsInPreview");
  v5 = *MEMORY[0x24BDF73B0];
  if (v4)
    v5 = 0;
  v6 = v5 | v3;
  -[EKDayOccurrenceViewAccessibility _axWidgetContainerView](self, "_axWidgetContainerView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "accessibilityFrame");
    v10 = v9;
    v12 = v11;
    v14 = v13;
    v16 = v15;
    -[EKDayOccurrenceViewAccessibility accessibilityFrame](self, "accessibilityFrame");
    v24.origin.x = v17;
    v24.origin.y = v18;
    v24.size.width = v19;
    v24.size.height = v20;
    v23.origin.x = v10;
    v23.origin.y = v12;
    v23.size.width = v14;
    v23.size.height = v16;
    if (!CGRectIntersectsRect(v23, v24))
      v6 |= *MEMORY[0x24BEBB178];
  }

  return v6;
}

- (id)_axWidgetContainerView
{
  return (id)-[EKDayOccurrenceViewAccessibility _accessibilityViewAncestorIsKindOf:](self, "_accessibilityViewAncestorIsKindOf:", NSClassFromString(CFSTR("_NCWidgetViewControllerView")));
}

- (BOOL)_accessibilityIsInWidget
{
  void *v2;
  BOOL v3;

  -[EKDayOccurrenceViewAccessibility _axWidgetContainerView](self, "_axWidgetContainerView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (id)accessibilityHint
{
  void *v3;
  void *v4;
  __CFString *v6;

  if (-[EKDayOccurrenceViewAccessibility _accessibilityIsInWidget](self, "_accessibilityIsInWidget")
    || -[EKDayOccurrenceViewAccessibility _axIsInPreview](self, "_axIsInPreview")
    || (-[EKDayOccurrenceViewAccessibility _axDraggingView](self, "_axDraggingView"),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        v3,
        v3))
  {
    v4 = 0;
  }
  else
  {
    if (-[EKDayOccurrenceViewAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("isAllDay")))
      v6 = CFSTR("occurrence.gestures.hint.all.day");
    else
      v6 = CFSTR("occurrence.gestures.hint");
    accessibilityLocalizedString(v6);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (void)prepareForReuse
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)EKDayOccurrenceViewAccessibility;
  -[EKDayOccurrenceViewAccessibility prepareForReuse](&v3, sel_prepareForReuse);
  -[EKDayOccurrenceViewAccessibility _axSetRealFrameInSuperview:](self, "_axSetRealFrameInSuperview:", 0);
}

- (BOOL)_accessibilityIsSpeakThisElement
{
  return !-[EKDayOccurrenceViewAccessibility _axIsInPreview](self, "_axIsInPreview");
}

- (id)accessibilityDragSourceDescriptors
{
  void *v3;
  void *v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  objc_super v18;
  char v19;
  _QWORD v20[2];
  CGRect v21;
  CGRect v22;

  v20[1] = *MEMORY[0x24BDAC8D0];
  v19 = 0;
  objc_opt_class();
  __UIAccessibilityCastAsClass();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_accessibilityDragAndDropTargetViewForDrop:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(v3, "bounds");
    objc_msgSend(v4, "convertRect:fromView:", v3);
    v6 = v5;
    v8 = v7;
    v10 = v9;
    v12 = v11;
    v13 = objc_alloc(MEMORY[0x24BDF67B0]);
    accessibilityLocalizedString(CFSTR("drag.whole.event"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v21.origin.x = v6;
    v21.origin.y = v8;
    v21.size.width = v10;
    v21.size.height = v12;
    CGRectGetMidX(v21);
    v22.origin.x = v6;
    v22.origin.y = v8;
    v22.size.width = v10;
    v22.size.height = v12;
    CGRectGetMidY(v22);
    CalRoundPointToScreenScale();
    v15 = (void *)objc_msgSend(v13, "initWithName:point:inView:", v14, v4);

    v20[0] = v15;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v20, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v18.receiver = self;
    v18.super_class = (Class)EKDayOccurrenceViewAccessibility;
    -[EKDayOccurrenceViewAccessibility accessibilityDragSourceDescriptors](&v18, sel_accessibilityDragSourceDescriptors);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v16;
}

- (id)accessibilityDropPointDescriptors
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  objc_super v8;

  -[EKDayOccurrenceViewAccessibility _axDropPointDescriptorsProvider](self, "_axDropPointDescriptorsProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "accessibilityDropPointDescriptors");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v4, "count"))
  {
    v5 = v4;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)EKDayOccurrenceViewAccessibility;
    -[EKDayOccurrenceViewAccessibility accessibilityDropPointDescriptors](&v8, sel_accessibilityDropPointDescriptors);
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return v6;
}

- (BOOL)canBecomeFocused
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  if (-[EKDayOccurrenceViewAccessibility _accessibilityIsFKARunningForFocusItem](self, "_accessibilityIsFKARunningForFocusItem"))
  {
    -[EKDayOccurrenceViewAccessibility _accessibilityFindAncestor:startWithSelf:](self, "_accessibilityFindAncestor:startWithSelf:", &__block_literal_global_2, 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_accessibilityViewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      objc_msgSend(v4, "safeValueForKey:", CFSTR("currentDayView"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[EKDayOccurrenceViewAccessibility _accessibilityAncestorIsKindOf:](self, "_accessibilityAncestorIsKindOf:", NSClassFromString(CFSTR("EKDayView")));
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      if (v5 != v6)
        return 0;
    }
  }
  v8.receiver = self;
  v8.super_class = (Class)EKDayOccurrenceViewAccessibility;
  return -[EKDayOccurrenceViewAccessibility canBecomeFocused](&v8, sel_canBecomeFocused);
}

uint64_t __52__EKDayOccurrenceViewAccessibility_canBecomeFocused__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  char isKindOfClass;

  objc_msgSend(a2, "_accessibilityViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  NSClassFromString(CFSTR("EKDayViewController"));
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

@end
