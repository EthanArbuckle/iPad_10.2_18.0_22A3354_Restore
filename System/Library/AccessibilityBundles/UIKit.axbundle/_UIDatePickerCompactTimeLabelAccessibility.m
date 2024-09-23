@implementation _UIDatePickerCompactTimeLabelAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("_UIDatePickerCompactTimeLabel");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  const __CFString *v3;
  id obj;
  id *v5;
  id location[3];

  location[2] = a1;
  location[1] = (id)a2;
  v5 = location;
  obj = 0;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = CFSTR("_UIDatePickerIOSCompactView");
  objc_msgSend(location[0], "validateClass:");
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("_UIDatePickerCompactTimeLabel"), CFSTR("label"), "@", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceVariable:withType:", v3, CFSTR("_presentation"), "_UIDatePickerOverlayPresentation");
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("_UIDatePickerOverlayPresentation"), CFSTR("activeMode"), "q", 0);
  objc_storeStrong(v5, obj);
}

- (id)accessibilityElements
{
  return 0;
}

- (id)accessibilityLabel
{
  id v3;
  id v4;

  v3 = (id)-[_UIDatePickerCompactTimeLabelAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("label"));
  v4 = (id)objc_msgSend(v3, "accessibilityLabel");

  return v4;
}

- (int64_t)_accessibilityExpandedStatus
{
  id v3;
  BOOL v4;
  id location[3];
  int64_t v6;

  location[2] = self;
  location[1] = (id)a2;
  location[0] = (id)-[_UIDatePickerCompactTimeLabelAccessibility _accessibilityViewAncestorIsKindOf:](self, "_accessibilityViewAncestorIsKindOf:", NSClassFromString(CFSTR("_UIDatePickerIOSCompactView")));
  v3 = (id)objc_msgSend(location[0], "safeValueForKey:", CFSTR("_presentation"));
  v4 = objc_msgSend(v3, "safeIntegerForKey:", CFSTR("activeMode")) != 1;

  if (v4)
    v6 = 2;
  else
    v6 = 1;
  objc_storeStrong(location, 0);
  return v6;
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x24BDF73B0];
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (CGPoint)accessibilityActivationPoint
{
  double v2;
  double v3;
  double v4;
  double v5;
  id v6;
  id v7;
  char v8;
  id v9[3];
  double v10;
  double v11;
  CGPoint result;
  CGRect v13;

  v9[2] = self;
  v9[1] = (id)a2;
  v8 = 0;
  objc_opt_class();
  v7 = (id)__UIAccessibilityCastAsClass();
  v6 = v7;
  objc_storeStrong(&v7, 0);
  v9[0] = v6;
  objc_msgSend(v6, "bounds");
  UIAccessibilityConvertFrameToScreenCoordinates(v13, (UIView *)v9[0]);
  AX_CGRectGetCenter();
  v10 = v2;
  v11 = v3;
  objc_storeStrong(v9, 0);
  v4 = v10;
  v5 = v11;
  result.y = v5;
  result.x = v4;
  return result;
}

@end
