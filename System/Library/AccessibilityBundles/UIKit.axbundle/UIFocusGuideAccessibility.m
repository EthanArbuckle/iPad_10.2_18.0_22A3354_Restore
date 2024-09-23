@implementation UIFocusGuideAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UIFocusGuide");
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
  double v10;
  double v11;
  double v12;
  double v13;
  id v14;
  id v15;
  id v16;
  char v17;
  id v18[3];
  double v19;
  double v20;
  double v21;
  double v22;
  CGRect result;

  v18[2] = self;
  v18[1] = (id)a2;
  v17 = 0;
  objc_opt_class();
  v16 = (id)__UIAccessibilityCastAsClass();
  v15 = v16;
  objc_storeStrong(&v16, 0);
  v18[0] = v15;
  v14 = (id)objc_msgSend(v15, "owningView");
  objc_msgSend(v18[0], "layoutFrame");
  objc_msgSend(v14, "convertRect:toView:", 0, v2, v3, v4, v5);
  v19 = v6;
  v20 = v7;
  v21 = v8;
  v22 = v9;

  objc_storeStrong(v18, 0);
  v10 = v19;
  v11 = v20;
  v12 = v21;
  v13 = v22;
  result.size.height = v13;
  result.size.width = v12;
  result.origin.y = v11;
  result.origin.x = v10;
  return result;
}

@end
