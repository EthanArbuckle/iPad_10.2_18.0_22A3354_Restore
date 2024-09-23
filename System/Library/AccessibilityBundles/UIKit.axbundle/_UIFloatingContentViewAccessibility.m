@implementation _UIFloatingContentViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("_UIFloatingContentView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id location[3];

  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_storeStrong(location, 0);
}

- (CGRect)accessibilityFrame
{
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  id v10;
  id v11;
  id v12;
  char v13;
  id v14[2];
  _UIFloatingContentViewAccessibility *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  CGRect result;

  v15 = self;
  v14[1] = (id)a2;
  v13 = 0;
  objc_opt_class();
  v12 = (id)__UIAccessibilityCastAsClass();
  v11 = v12;
  objc_storeStrong(&v12, 0);
  v14[0] = v11;
  v10 = (id)-[_UIFloatingContentViewAccessibility safeValueForKey:](v15, "safeValueForKey:", CFSTR("scaleFactor"));
  objc_msgSend(v10, "floatValue");

  objc_msgSend(v14[0], "bounds");
  UIAccessibilityFrameForBounds();
  v16 = v2;
  v17 = v3;
  v18 = v4;
  v19 = v5;
  objc_storeStrong(v14, 0);
  v6 = v16;
  v7 = v17;
  v8 = v18;
  v9 = v19;
  result.size.height = v9;
  result.size.width = v8;
  result.origin.y = v7;
  result.origin.x = v6;
  return result;
}

@end
