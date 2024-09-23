@implementation _PGPictureInPictureContainerViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("_PGPictureInPictureContainerView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("_PGPictureInPictureContainerView"), CFSTR("UIView"));
  objc_msgSend(v3, "validateClass:", CFSTR("PGHitTestExtendableView"));

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
  void *v16;
  void *v17;
  id v18;
  objc_super v20;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  v20.receiver = self;
  v20.super_class = (Class)_PGPictureInPictureContainerViewAccessibility;
  -[_PGPictureInPictureContainerViewAccessibility _accessibilityHitTest:withEvent:](&v20, sel__accessibilityHitTest_withEvent_, v7, x, y);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
    goto LABEL_8;
  objc_opt_class();
  __UIAccessibilityCastAsClass();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "superview");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x234919164](CFSTR("PGHitTestExtendableView"));
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v9, "superview");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = 0;
  }

  objc_msgSend(v11, "safeValueForKey:", CFSTR("hitTestExtenderView"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilitySafeClass();
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "safeUIViewForKey:", CFSTR("_tab"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "convertPoint:toView:", v14, x, y);
  if (!objc_msgSend(v14, "pointInside:withEvent:", v7))
  {

LABEL_8:
    v18 = v8;
    goto LABEL_9;
  }
  objc_msgSend(v11, "_accessibilityViewController");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilitySafeClass();
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "safeValueForKey:", CFSTR("_stashView"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "convertPoint:toView:", v17, x, y);
  objc_msgSend(v17, "_accessibilityHitTest:withEvent:", v7);
  v18 = (id)objc_claimAutoreleasedReturnValue();

LABEL_9:
  return v18;
}

@end
