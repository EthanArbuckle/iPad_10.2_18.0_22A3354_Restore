@implementation SKSceneAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SKScene");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SKScene"), CFSTR("view"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SKScene"), CFSTR("didMoveToView:"), "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SKScene"), CFSTR("didChangeSize:"), "v", "{CGSize=dd}", 0);

}

- (CGRect)accessibilityFrame
{
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  void *v6;
  UIView *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  objc_super v29;
  CGRect v30;
  CGRect v31;
  CGRect v32;
  CGRect result;

  v29.receiver = self;
  v29.super_class = (Class)SKSceneAccessibility;
  -[SKSceneAccessibility accessibilityFrame](&v29, sel_accessibilityFrame);
  x = v30.origin.x;
  y = v30.origin.y;
  width = v30.size.width;
  height = v30.size.height;
  if (CGRectIsEmpty(v30))
  {
    objc_opt_class();
    __UIAccessibilityCastAsClass();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "view");
    v7 = (UIView *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "frame");
    v9 = v8;
    v11 = v10;
    objc_msgSend(v6, "anchorPoint");
    v13 = v12 * v9;
    v15 = v14 * v11;
    v16 = 0.0 - v12 * v9;
    v17 = 0.0 - v14 * v11;
    v18 = v9 - v13;
    v19 = v11 - v15;
    objc_msgSend(v6, "convertPointToView:", v16, v17);
    v21 = v20;
    v23 = v22;
    objc_msgSend(v6, "convertPointToView:", v18, v19);
    v31.size.width = vabdd_f64(v24, v21);
    v31.size.height = vabdd_f64(v23, v31.origin.y);
    v31.origin.x = v21;
    v32 = UIAccessibilityConvertFrameToScreenCoordinates(v31, v7);
    x = v32.origin.x;
    y = v32.origin.y;
    width = v32.size.width;
    height = v32.size.height;

  }
  v25 = x;
  v26 = y;
  v27 = width;
  v28 = height;
  result.size.height = v28;
  result.size.width = v27;
  result.origin.y = v26;
  result.origin.x = v25;
  return result;
}

- (id)accessibilityContainer
{
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SKSceneAccessibility;
  -[SKSceneAccessibility accessibilityContainer](&v5, sel_accessibilityContainer);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    -[SKSceneAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("view"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (void)didMoveToView:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SKSceneAccessibility;
  -[SKSceneAccessibility didMoveToView:](&v3, sel_didMoveToView_, a3);
  UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], 0);
}

- (void)didChangeSize:(CGSize)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SKSceneAccessibility;
  -[SKSceneAccessibility didChangeSize:](&v3, sel_didChangeSize_, a3.width, a3.height);
  UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], 0);
}

- (void)willMoveFromView:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SKSceneAccessibility;
  -[SKSceneAccessibility willMoveFromView:](&v3, sel_willMoveFromView_, a3);
  UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], 0);
}

@end
