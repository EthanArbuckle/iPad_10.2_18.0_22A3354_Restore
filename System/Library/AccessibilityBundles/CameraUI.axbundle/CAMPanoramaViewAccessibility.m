@implementation CAMPanoramaViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CAMPanoramaView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CAMPanoramaView"), CFSTR("_instructionLabel"), "@", 0);
}

- (id)_accessibilityHitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v7;
  void *v8;
  id v9;
  void *v10;
  objc_super v12;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  -[CAMPanoramaViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_instructionLabel"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMPanoramaViewAccessibility convertPoint:toView:](self, "convertPoint:toView:", v8, x, y);
  if (objc_msgSend(v8, "pointInside:withEvent:", v7))
  {
    v9 = v8;
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)CAMPanoramaViewAccessibility;
    -[CAMPanoramaViewAccessibility _accessibilityHitTest:withEvent:](&v12, sel__accessibilityHitTest_withEvent_, v7, x, y);
    v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  v10 = v9;

  return v10;
}

@end
