@implementation FUFlightViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("FUFlightView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("FUFlightView"), CFSTR("mapView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("FUFlightView"), CFSTR("errorView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("FUFlightView"), CFSTR("loadingView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("FUFlightStep"), CFSTR("time"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("FUFlightView"), CFSTR("_planeTracker"), "FUPlaneTrackerAnnotationView");

}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)FUFlightViewAccessibility;
  -[FUFlightViewAccessibility _accessibilityLoadAccessibilityInformation](&v7, sel__accessibilityLoadAccessibilityInformation);
  objc_opt_class();
  -[FUFlightViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_planeTracker"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "_accessibilityLoadAccessibilityInformation");
  -[FUFlightViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("mapView"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  accessibilityLocalizedString(CFSTR("flight.tracking.map"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAccessibilityLabel:", v6);

  objc_msgSend(v5, "setAccessibilityContainerType:", 4);
}

- (id)_accessibilityGetScrollView
{
  void *v3;
  FUFlightViewAccessibility *v4;
  FUFlightViewAccessibility *v5;
  uint64_t v6;

  objc_opt_class();
  -[FUFlightViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("labelAirlineName"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (FUFlightViewAccessibility *)objc_claimAutoreleasedReturnValue();

  if (!v4)
    goto LABEL_10;
  v5 = 0;
  do
  {
    if (v4 == self || v5)
      break;
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0 ? v4 : 0;
    -[FUFlightViewAccessibility superview](v4, "superview");
    v6 = objc_claimAutoreleasedReturnValue();

    v4 = (FUFlightViewAccessibility *)v6;
  }
  while (v6);
  if (!v5)
  {
LABEL_10:
    _AXLogWithFacility();
    v5 = 0;
  }

  return v5;
}

- (BOOL)accessibilityScrollToVisibleWithChild:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  BOOL v17;

  v4 = a3;
  -[FUFlightViewAccessibility _accessibilityValueForKey:](self, "_accessibilityValueForKey:", *MEMORY[0x24BEBB308]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsObject:", v4);

  if (v6)
  {
    -[FUFlightViewAccessibility _accessibilityGetScrollView](self, "_accessibilityGetScrollView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_accessibilityWindow");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "accessibilityFrame");
    objc_msgSend(v8, "convertRect:fromWindow:", 0);
    v10 = v9;
    v12 = v11;
    v14 = v13;
    v16 = v15;

    objc_msgSend(v7, "convertRect:fromView:", 0, v10, v12, v14, v16);
    objc_msgSend(v7, "scrollRectToVisible:animated:", 0);
    v17 = v7 != 0;

  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (id)accessibilityElements
{
  void *v3;
  int v4;
  void *v5;
  void **v6;
  void *v7;
  int v8;
  void *v9;
  void *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x24BDAC8D0];
  -[FUFlightViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("errorView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "_accessibilityViewIsVisible");

  if (v4)
  {
    -[FUFlightViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("errorView"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = v5;
    v6 = (void **)v12;
LABEL_5:
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    return v9;
  }
  -[FUFlightViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("loadingView"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "_accessibilityViewIsVisible");

  if (v8)
  {
    -[FUFlightViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("loadingView"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v5;
    v6 = &v11;
    goto LABEL_5;
  }
  return 0;
}

@end
