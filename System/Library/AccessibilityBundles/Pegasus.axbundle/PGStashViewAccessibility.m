@implementation PGStashViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PGStashView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("PGBackdropView"), CFSTR("UIView"));
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("PGStashView"), CFSTR("UIView"));
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("PGStashView"), CFSTR("_backdropView"), "PGBackdropView");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PGStashView"), CFSTR("initWithFrame:"), "@", "{CGRect={CGPoint=dd}{CGSize=dd}}", 0);

}

- (PGStashViewAccessibility)initWithFrame:(CGRect)a3
{
  PGStashViewAccessibility *v3;
  PGStashViewAccessibility *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PGStashViewAccessibility;
  v3 = -[PGStashViewAccessibility initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[PGStashViewAccessibility _axMarkupBackdropView](v3, "_axMarkupBackdropView");

  return v4;
}

- (void)_accessibilityLoadAccessibilityInformation
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PGStashViewAccessibility;
  -[PGStashViewAccessibility _accessibilityLoadAccessibilityInformation](&v3, sel__accessibilityLoadAccessibilityInformation);
  -[PGStashViewAccessibility _axMarkupBackdropView](self, "_axMarkupBackdropView");
}

- (void)_axMarkupBackdropView
{
  void *v2;
  void *v3;
  id v4;

  -[PGStashViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_backdropView"));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  accessibilityLocalizedString(CFSTR("pip.stash.view"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAccessibilityLabel:", v2);

  accessibilityLocalizedString(CFSTR("pip.stash.stashed"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAccessibilityValue:", v3);

  objc_msgSend(v4, "setAccessibilityTraits:", *MEMORY[0x24BDF73B0]);
  objc_msgSend(v4, "setIsAccessibilityElement:", 1);

}

- (BOOL)_accessibilityUseAccessibilityFrameForHittest
{
  return 1;
}

- (CGRect)accessibilityFrame
{
  void *v3;
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v20;
  double v21;
  double v22;
  double v23;
  objc_super v24;
  CGRect v25;
  CGRect v26;
  CGRect result;
  CGRect v28;

  -[PGStashViewAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("_backdropView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v24.receiver = self;
  v24.super_class = (Class)PGStashViewAccessibility;
  -[PGStashViewAccessibility accessibilityFrame](&v24, sel_accessibilityFrame);
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  objc_msgSend(v3, "accessibilityFrame");
  v28.origin.x = v12;
  v28.origin.y = v13;
  v28.size.width = v14;
  v28.size.height = v15;
  v25.origin.x = v5;
  v25.origin.y = v7;
  v25.size.width = v9;
  v25.size.height = v11;
  v26 = CGRectUnion(v25, v28);
  x = v26.origin.x;
  y = v26.origin.y;
  width = v26.size.width;
  height = v26.size.height;

  v20 = x;
  v21 = y;
  v22 = width;
  v23 = height;
  result.size.height = v23;
  result.size.width = v22;
  result.origin.y = v21;
  result.origin.x = v20;
  return result;
}

@end
