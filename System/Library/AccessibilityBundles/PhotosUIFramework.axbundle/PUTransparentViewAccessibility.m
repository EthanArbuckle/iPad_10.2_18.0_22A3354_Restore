@implementation PUTransparentViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PUTransparentView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v7;
  uint64_t v8;
  void *v9;
  objc_super v11;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  if (UIAccessibilityIsVoiceOverRunning())
  {
    -[PUTransparentViewAccessibility _accessibilityDescendantOfType:](self, "_accessibilityDescendantOfType:", NSClassFromString(CFSTR("PLHighFidelityVideoOverlayButton")));
    v8 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)PUTransparentViewAccessibility;
    -[PUTransparentViewAccessibility hitTest:withEvent:](&v11, sel_hitTest_withEvent_, v7, x, y);
    v8 = objc_claimAutoreleasedReturnValue();
  }
  v9 = (void *)v8;

  return v9;
}

@end
