@implementation HighlightCalendarDayViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("HealthVisualization.HighlightCalendarDayView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HealthVisualization.HighlightCalendarDayView"), CFSTR("axDate"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HealthVisualization.HighlightCalendarDayView"), CFSTR("axProjectionKind"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HealthVisualization.HighlightCalendarDayView"), CFSTR("axProbability"), "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HealthVisualization.HighlightCalendarDayView"), CFSTR("axCircleState"), "q", 0);

}

- (BOOL)isAccessibilityElement
{
  return -[HighlightCalendarDayViewAccessibility safeIntegerForKey:](self, "safeIntegerForKey:", CFSTR("axCircleState")) != 0;
}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  void *v5;

  objc_opt_class();
  -[HighlightCalendarDayViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("axDate"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  _AXGetStringForDay(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)accessibilityValue
{
  uint64_t v3;
  void *v4;
  void *v5;

  v3 = -[HighlightCalendarDayViewAccessibility safeIntegerForKey:](self, "safeIntegerForKey:", CFSTR("axProbability"));
  -[HighlightCalendarDayViewAccessibility safeStringForKey:](self, "safeStringForKey:", CFSTR("axProjectionKind"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HighlightCalendarDayViewAccessibility _axProjectionValues:projectionKind:](self, "_axProjectionValues:projectionKind:", v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_axProjectionValues:(int64_t)a3 projectionKind:(id)a4
{
  id v6;
  uint64_t v7;
  __CFString *v8;
  uint64_t v9;
  void *v10;

  v6 = a4;
  v7 = -[HighlightCalendarDayViewAccessibility safeIntegerForKey:](self, "safeIntegerForKey:", CFSTR("axCircleState"));
  if (v6)
  {
    if (a3 == 2)
    {
      if ((objc_msgSend(v6, "isEqualToString:", CFSTR("menstruation")) & 1) != 0)
        v8 = CFSTR("predicted.period");
      else
        v8 = CFSTR("predicted.fertile");
      goto LABEL_14;
    }
    if (a3 == 1 && objc_msgSend(v6, "isEqualToString:", CFSTR("menstruation")))
    {
      v8 = CFSTR("possible.period");
LABEL_14:
      accessibilityLocalizedString(v8);
      v9 = objc_claimAutoreleasedReturnValue();
      goto LABEL_15;
    }
  }
  else
  {
    if (v7 == 1)
    {
      v8 = CFSTR("data.logged");
      goto LABEL_14;
    }
    if (v7 == 3)
    {
      UIAXStringForAllChildren();
      v9 = objc_claimAutoreleasedReturnValue();
LABEL_15:
      v10 = (void *)v9;
      goto LABEL_16;
    }
  }
  v10 = 0;
LABEL_16:

  return v10;
}

@end
