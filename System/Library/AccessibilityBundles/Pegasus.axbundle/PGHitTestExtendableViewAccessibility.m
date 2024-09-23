@implementation PGHitTestExtendableViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PGHitTestExtendableView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)_accessibilityHitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  objc_super v18;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  v18.receiver = self;
  v18.super_class = (Class)PGHitTestExtendableViewAccessibility;
  -[PGHitTestExtendableViewAccessibility _accessibilityHitTest:withEvent:](&v18, sel__accessibilityHitTest_withEvent_, v7, x, y);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
    goto LABEL_5;
  objc_opt_class();
  __UIAccessibilityCastAsClass();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGHitTestExtendableViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("hitTestExtenderView"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilitySafeClass();
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "safeUIViewForKey:", CFSTR("_tab"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "convertPoint:toView:", v12, x, y);
  if (!objc_msgSend(v12, "pointInside:withEvent:", v7))
  {

LABEL_5:
    v16 = v8;
    goto LABEL_6;
  }
  -[PGHitTestExtendableViewAccessibility _accessibilityViewController](self, "_accessibilityViewController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilitySafeClass();
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "safeValueForKey:", CFSTR("_stashView"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "convertPoint:toView:", v15, x, y);
  objc_msgSend(v15, "_accessibilityHitTest:withEvent:", v7);
  v16 = (id)objc_claimAutoreleasedReturnValue();

LABEL_6:
  return v16;
}

@end
