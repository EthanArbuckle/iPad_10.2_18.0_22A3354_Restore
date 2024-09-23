@implementation UIPanelBorderViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UIPanelBorderView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)_axSplitViewControllerImplementation
{
  if (a1)
    return (id)__UIAccessibilityGetAssociatedNonRetainedObject();
  else
    return 0;
}

- (uint64_t)_axIsPrimaryBorder
{
  char v2;

  if (a1)
    v2 = __UIAccessibilityGetAssociatedBool() & 1;
  else
    v2 = 0;
  return v2 & 1;
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  const __CFString *v3;
  const char *v4;
  const __CFString *v5;
  const char *v6;
  const __CFString *v7;
  const char *v8;
  id v9;
  id *v10;
  id location[3];

  location[2] = a1;
  location[1] = (id)a2;
  v10 = location;
  v9 = 0;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_msgSend(location[0], "validateClass:isKindOfClass:", CFSTR("UIPanelBorderView"), CFSTR("UIView"));
  v7 = CFSTR("UISplitViewControllerPanelImpl");
  v3 = CFSTR("_svc");
  v4 = "UISplitViewController";
  objc_msgSend(location[0], "validateClass:hasInstanceVariable:withType:");
  objc_msgSend(location[0], "validateClass:hasInstanceVariable:withType:", CFSTR("UISplitViewControllerClassicImpl"), CFSTR("_svc"), "UISplitViewController");
  v5 = CFSTR("primaryColumnWidth");
  v8 = "d";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UISplitViewControllerPanelImpl"), 0);
  v6 = "v";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v7, CFSTR("setPreferredPrimaryColumnWidthFraction:"), v8, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v7, CFSTR("minimumPrimaryColumnWidth"), v8, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v7, v5, v8, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v7, CFSTR("maximumPrimaryColumnWidth"), v8, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v7, CFSTR("supplementaryColumnWidth"), v8, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v7, CFSTR("setPreferredSupplementaryColumnWidthFraction:"), v6, v8, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v7, CFSTR("minimumSupplementaryColumnWidth"), v8, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v7, CFSTR("maximumSupplementaryColumnWidth"), v8, 0);
  objc_storeStrong(v10, v9);
}

- (BOOL)isAccessibilityElement
{
  return 0;
}

- (id)_accessibilityUIViewAccessibilityFrame
{
  double v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;

  -[UIPanelBorderViewAccessibility accessibilityFrame](self, "accessibilityFrame");
  *(_QWORD *)&v13 = v3;
  *((_QWORD *)&v13 + 1) = v4;
  *(double *)&v14 = v2;
  *((_QWORD *)&v14 + 1) = v5;
  if (v2 < 1.0 && v2 > 0.0)
  {
    CGRectMake();
    *(_QWORD *)&v11 = v6;
    *((_QWORD *)&v11 + 1) = v7;
    *(_QWORD *)&v12 = v8;
    *((_QWORD *)&v12 + 1) = v9;
    v13 = v11;
    v14 = v12;
  }
  return (id)objc_msgSend(MEMORY[0x24BDD1968], "valueWithCGRect:", v13, v14);
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x24BDF73A0] | *MEMORY[0x24BDFEFC0];
}

- (id)_accessibilityRoleDescription
{
  return accessibilityLocalizedString(CFSTR("splitter.role.description"));
}

- (id)accessibilityValue
{
  -[UIPanelBorderViewAccessibility _accessibilityNumberValue](self, "_accessibilityNumberValue", a2, self);
  return (id)AXFormatFloatWithPercentage();
}

- (void)setAccessibilityValue:(id)a3
{
  float v3;
  UIPanelBorderViewAccessibility *v4;
  id location[2];
  UIPanelBorderViewAccessibility *v6;

  v6 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v4 = v6;
  objc_msgSend(location[0], "floatValue");
  -[UIPanelBorderViewAccessibility _accessibilitySetBorderFloatValue:](v4, v3);
  objc_storeStrong(location, 0);
}

- (void)_accessibilitySetBorderFloatValue:(void *)a1
{
  double v2;
  double v3;
  double v4;
  id v5[2];
  double v6;
  double v7;
  id v8;

  v8 = a1;
  v7 = a2;
  if (a1)
  {
    objc_msgSend(v8, "_accessibilityMinValue");
    v4 = v2;
    objc_msgSend(v8, "_accessibilityMaxValue");
    v6 = CGFloatMinMax(v7, v4, v3) / 100.0;
    v5[0] = v8;
    v5[1] = *(id *)&v6;
    AXPerformSafeBlock();
    objc_storeStrong(v5, 0);
  }
}

- (void)_accessibilitySetValue:(id)a3
{
  float v3;
  UIPanelBorderViewAccessibility *v4;
  id location[2];
  UIPanelBorderViewAccessibility *v6;

  v6 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v4 = v6;
  objc_msgSend(location[0], "floatValue");
  -[UIPanelBorderViewAccessibility _accessibilitySetBorderFloatValue:](v4, v3);
  objc_storeStrong(location, 0);
}

- (double)_accessibilityNumberValue
{
  double v2;
  double v4;

  v4 = -[UIPanelBorderViewAccessibility _accessibilityColumnWidth]((uint64_t)self);
  v2 = -[UIPanelBorderViewAccessibility _accessibilitySplitViewControllerWidth]((uint64_t)self);
  return CGFloatMinMax(v4 / v2, 0.0, 1.0) * 100.0;
}

- (double)_accessibilityColumnWidth
{
  __CFString *v1;
  double v2;
  id v4;
  __CFString *v5;
  uint64_t v6;
  double v7;

  v6 = a1;
  if (!a1)
    return 0.0;
  if ((-[UIPanelBorderViewAccessibility _axIsPrimaryBorder](v6) & 1) != 0)
    v1 = CFSTR("primaryColumnWidth");
  else
    v1 = CFSTR("supplementaryColumnWidth");
  v5 = v1;
  v4 = -[UIPanelBorderViewAccessibility _axSplitViewControllerImplementation](v6);
  objc_msgSend(v4, "safeCGFloatForKey:", v5);
  v7 = v2;

  objc_storeStrong((id *)&v5, 0);
  return v7;
}

- (double)_accessibilitySplitViewControllerWidth
{
  double v1;
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  char v8;
  id v9;
  uint64_t v10;
  double v11;

  v10 = a1;
  if (!a1)
    return 0.0;
  v8 = 0;
  objc_opt_class();
  v5 = -[UIPanelBorderViewAccessibility _axSplitViewControllerImplementation](v10);
  v4 = (id)objc_msgSend(v5, "safeValueForKey:", CFSTR("_svc"));
  v7 = (id)__UIAccessibilityCastAsClass();

  v6 = v7;
  objc_storeStrong(&v7, 0);
  v9 = v6;
  v3 = (id)objc_msgSend(v6, "view");
  objc_msgSend(v3, "bounds");
  v11 = v1;

  objc_storeStrong(&v9, 0);
  return v11;
}

- (double)_accessibilityMinValue
{
  double v2;
  double v4;

  v4 = -[UIPanelBorderViewAccessibility _accessibilityMinimumColumnWidth]((uint64_t)self);
  v2 = -[UIPanelBorderViewAccessibility _accessibilitySplitViewControllerWidth]((uint64_t)self);
  return CGFloatMax(v4 / v2, 0.0) * 100.0;
}

- (double)_accessibilityMinimumColumnWidth
{
  __CFString *v1;
  double v2;
  id v4;
  double v5;
  double v6;
  id location;
  uint64_t v8;
  double v9;

  v8 = a1;
  if (!a1)
    return 0.0;
  if ((-[UIPanelBorderViewAccessibility _axIsPrimaryBorder](v8) & 1) != 0)
    v1 = CFSTR("minimumPrimaryColumnWidth");
  else
    v1 = CFSTR("minimumSupplementaryColumnWidth");
  location = v1;
  v4 = -[UIPanelBorderViewAccessibility _axSplitViewControllerImplementation](v8);
  objc_msgSend(v4, "safeCGFloatForKey:", location);
  v5 = v2;

  v6 = v5;
  if (v5 == *MEMORY[0x24BDF7DA8])
    v6 = 0.01 * -[UIPanelBorderViewAccessibility _accessibilitySplitViewControllerWidth](v8);
  v9 = v6;
  objc_storeStrong(&location, 0);
  return v9;
}

- (double)_accessibilityMaxValue
{
  double v2;
  double v4;

  v4 = -[UIPanelBorderViewAccessibility _accessibilityMaximumColumnWidth]((uint64_t)self);
  v2 = -[UIPanelBorderViewAccessibility _accessibilitySplitViewControllerWidth]((uint64_t)self);
  return CGFloatMin(v4 / v2, 1.0) * 100.0;
}

- (double)_accessibilityMaximumColumnWidth
{
  __CFString *v1;
  double v2;
  id v4;
  double v5;
  double v6;
  id location;
  uint64_t v8;
  double v9;

  v8 = a1;
  if (!a1)
    return 0.0;
  if ((-[UIPanelBorderViewAccessibility _axIsPrimaryBorder](v8) & 1) != 0)
    v1 = CFSTR("maximumPrimaryColumnWidth");
  else
    v1 = CFSTR("maximumSupplementaryColumnWidth");
  location = v1;
  v4 = -[UIPanelBorderViewAccessibility _axSplitViewControllerImplementation](v8);
  objc_msgSend(v4, "safeCGFloatForKey:", location);
  v5 = v2;

  v6 = v5;
  if (v5 == *MEMORY[0x24BDF7DA8])
    v6 = 0.4 * -[UIPanelBorderViewAccessibility _accessibilitySplitViewControllerWidth](v8);
  v9 = v6;
  objc_storeStrong(&location, 0);
  return v9;
}

- (int64_t)_accessibilityOrientation
{
  return 1;
}

- (void)accessibilityIncrement
{
  double v2;

  -[UIPanelBorderViewAccessibility _accessibilityNumberValue](self, "_accessibilityNumberValue");
  -[UIPanelBorderViewAccessibility _accessibilitySetBorderFloatValue:](self, v2 + 5.0);
}

- (void)accessibilityDecrement
{
  double v2;

  -[UIPanelBorderViewAccessibility _accessibilityNumberValue](self, "_accessibilityNumberValue");
  -[UIPanelBorderViewAccessibility _accessibilitySetBorderFloatValue:](self, v2 - 5.0);
}

void __68__UIPanelBorderViewAccessibility__accessibilitySetBorderFloatValue___block_invoke(uint64_t a1)
{
  id v1;
  id v2;

  if ((-[UIPanelBorderViewAccessibility _axIsPrimaryBorder](*(_QWORD *)(a1 + 32)) & 1) != 0)
  {
    v2 = -[UIPanelBorderViewAccessibility _axSplitViewControllerImplementation](*(_QWORD *)(a1 + 32));
    objc_msgSend(v2, "setPreferredPrimaryColumnWidthFraction:", *(double *)(a1 + 40));

  }
  else
  {
    v1 = -[UIPanelBorderViewAccessibility _axSplitViewControllerImplementation](*(_QWORD *)(a1 + 32));
    objc_msgSend(v1, "setPreferredSupplementaryColumnWidthFraction:", *(double *)(a1 + 40));

  }
}

@end
