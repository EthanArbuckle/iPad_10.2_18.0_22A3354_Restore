@implementation UIDropShadowViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UIDropShadowView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id obj;
  id *v4;
  id location[3];

  location[2] = a1;
  location[1] = (id)a2;
  v4 = location;
  obj = 0;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIDropShadowView"), CFSTR("_delegate"), "@", 0);
  objc_storeStrong(v4, obj);
}

- (BOOL)accessibilityScrollToVisibleWithChild:(id)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGFloat v7;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  id v12;
  int v13;
  CGRect v14;
  id v15;
  id v16;
  id v17;
  char v18;
  id v19;
  id v20;
  id location[2];
  UIDropShadowViewAccessibility *v22;
  char v23;
  CGRect v24;

  v22 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v20 = -[UIDropShadowViewAccessibility _axSheetPresentationController](v22, "_axSheetPresentationController");
  if (!v20)
    goto LABEL_6;
  v18 = 0;
  objc_opt_class();
  v17 = (id)__UIAccessibilityCastAsClass();
  v16 = v17;
  objc_storeStrong(&v17, 0);
  v19 = v16;
  v15 = (id)objc_msgSend(location[0], "_accessibilityParentView");
  v12 = v19;
  objc_msgSend(v15, "bounds");
  objc_msgSend(v12, "convertRect:fromView:", v15, v3, v4, v5, v6);
  v14.origin.x = v7;
  v14.origin.y = v8;
  v14.size.width = v9;
  v14.size.height = v10;
  objc_msgSend(v19, "bounds");
  CGRectIntersection(v24, v14);
  if ((AX_CGRectAlmostEqualToRect() & 1) != 0)
  {
    v13 = 0;
  }
  else
  {
    v23 = objc_msgSend(v20, "_accessibilityExpandSheet", 1.0) & 1;
    v13 = 1;
  }
  objc_storeStrong(&v15, 0);
  objc_storeStrong(&v19, 0);
  if (!v13)
LABEL_6:
    v23 = 0;
  objc_storeStrong(&v20, 0);
  objc_storeStrong(location, 0);
  return v23 & 1;
}

- (BOOL)_accessibilityIsScrollAncestor
{
  objc_class *v2;
  NSString *v4;
  int v5;
  id v6[3];

  v6[2] = self;
  v6[1] = (id)a2;
  v6[0] = -[UIDropShadowViewAccessibility _axSheetPresentationController](self, "_axSheetPresentationController");
  v2 = (objc_class *)objc_opt_class();
  v4 = NSStringFromClass(v2);
  v5 = !-[NSString isEqualToString:](v4, "isEqualToString:", CFSTR("_UIRootPresentationController"));

  objc_storeStrong(v6, 0);
  return v5 & 1;
}

- (BOOL)accessibilityScrollUpPageSupported
{
  int v3;
  id v4;
  char v5;
  id v6;
  char v7;
  id v8;

  v4 = -[UIDropShadowViewAccessibility _axSheetPresentationController](self, "_axSheetPresentationController");
  v7 = 0;
  v5 = 0;
  if ((objc_msgSend(v4, "_accessibilityIsInverted") & 1) != 0)
  {
    v8 = -[UIDropShadowViewAccessibility _axSheetPresentationController](self, "_axSheetPresentationController");
    v7 = 1;
    v3 = objc_msgSend(v8, "_accessibilityCanExpandSheet") & 1;
  }
  else
  {
    v6 = -[UIDropShadowViewAccessibility _axSheetPresentationController](self, "_axSheetPresentationController");
    v5 = 1;
    v3 = objc_msgSend(v6, "_accessibilityCanCollapseSheet") & 1;
  }
  if ((v5 & 1) != 0)

  if ((v7 & 1) != 0)
  return v3 != 0;
}

- (BOOL)accessibilityScrollUpPage
{
  int v3;
  id v4;
  char v5;
  id v6;
  char v7;
  id v8;

  v4 = -[UIDropShadowViewAccessibility _axSheetPresentationController](self, "_axSheetPresentationController");
  v7 = 0;
  v5 = 0;
  if ((objc_msgSend(v4, "_accessibilityIsInverted") & 1) != 0)
  {
    v8 = -[UIDropShadowViewAccessibility _axSheetPresentationController](self, "_axSheetPresentationController");
    v7 = 1;
    v3 = objc_msgSend(v8, "_accessibilityExpandSheet") & 1;
  }
  else
  {
    v6 = -[UIDropShadowViewAccessibility _axSheetPresentationController](self, "_axSheetPresentationController");
    v5 = 1;
    v3 = objc_msgSend(v6, "_accessibilityCollapseSheet") & 1;
  }
  if ((v5 & 1) != 0)

  if ((v7 & 1) != 0)
  return v3 != 0;
}

- (BOOL)accessibilityScrollDownPageSupported
{
  int v3;
  id v4;
  char v5;
  id v6;
  char v7;
  id v8;

  v4 = -[UIDropShadowViewAccessibility _axSheetPresentationController](self, "_axSheetPresentationController");
  v7 = 0;
  v5 = 0;
  if ((objc_msgSend(v4, "_accessibilityIsInverted") & 1) != 0)
  {
    v8 = -[UIDropShadowViewAccessibility _axSheetPresentationController](self, "_axSheetPresentationController");
    v7 = 1;
    v3 = objc_msgSend(v8, "_accessibilityCanCollapseSheet") & 1;
  }
  else
  {
    v6 = -[UIDropShadowViewAccessibility _axSheetPresentationController](self, "_axSheetPresentationController");
    v5 = 1;
    v3 = objc_msgSend(v6, "_accessibilityCanExpandSheet") & 1;
  }
  if ((v5 & 1) != 0)

  if ((v7 & 1) != 0)
  return v3 != 0;
}

- (BOOL)accessibilityScrollDownPage
{
  int v3;
  id v4;
  char v5;
  id v6;
  char v7;
  id v8;

  v4 = -[UIDropShadowViewAccessibility _axSheetPresentationController](self, "_axSheetPresentationController");
  v7 = 0;
  v5 = 0;
  if ((objc_msgSend(v4, "_accessibilityIsInverted") & 1) != 0)
  {
    v8 = -[UIDropShadowViewAccessibility _axSheetPresentationController](self, "_axSheetPresentationController");
    v7 = 1;
    v3 = objc_msgSend(v8, "_accessibilityCollapseSheet") & 1;
  }
  else
  {
    v6 = -[UIDropShadowViewAccessibility _axSheetPresentationController](self, "_axSheetPresentationController");
    v5 = 1;
    v3 = objc_msgSend(v6, "_accessibilityExpandSheet") & 1;
  }
  if ((v5 & 1) != 0)

  if ((v7 & 1) != 0)
  return v3 != 0;
}

- (id)_axSheetPresentationController
{
  id v3;
  id v4;
  char v5;
  id v6[3];
  id v7;

  v6[2] = self;
  v6[1] = (id)a2;
  v6[0] = (id)-[UIDropShadowViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_delegate"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = 0;
    objc_opt_class();
    v4 = (id)__UIAccessibilityCastAsSafeCategory();
    v3 = v4;
    objc_storeStrong(&v4, 0);
    v7 = v3;
  }
  else
  {
    v7 = 0;
  }
  objc_storeStrong(v6, 0);
  return v7;
}

@end
