@implementation SUUIOnboardingCircleViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SUUIOnboardingCircleView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("SUUIOnboardingCircleView"), CFSTR("UIView"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SUUIOnboardingCircleView"), CFSTR("titleLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PKPhysicsBody"), CFSTR("applyForce:"), "v", "{CGPoint=dd}", 0);
  objc_msgSend(v3, "validateClass:", CFSTR("SUUIPhysicalCirclesView"));

}

- (id)accessibilityPath
{
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  void *v6;
  double MidX;
  double MidY;
  CGRect v10;
  CGRect v11;
  CGRect v12;

  -[SUUIOnboardingCircleViewAccessibility accessibilityFrame](self, "accessibilityFrame");
  x = v10.origin.x;
  y = v10.origin.y;
  width = v10.size.width;
  height = v10.size.height;
  v6 = (void *)MEMORY[0x24BDF6870];
  MidX = CGRectGetMidX(v10);
  v11.origin.x = x;
  v11.origin.y = y;
  v11.size.width = width;
  v11.size.height = height;
  MidY = CGRectGetMidY(v11);
  v12.origin.x = x;
  v12.origin.y = y;
  v12.size.width = width;
  v12.size.height = height;
  return (id)objc_msgSend(v6, "bezierPathWithArcCenter:radius:startAngle:endAngle:clockwise:", 1, MidX, MidY, CGRectGetWidth(v12) * 0.5, 0.0, 6.28318531);
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x24BDF73B0];
}

- (BOOL)_accessibilityScrollToVisible
{
  void *v3;
  void *v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  BOOL v13;
  void *v14;
  _QWORD v16[8];
  char v17;
  CGRect v18;
  CGRect v19;

  v17 = 0;
  -[SUUIOnboardingCircleViewAccessibility superview](self, "superview");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilitySafeClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[SUUIOnboardingCircleViewAccessibility frame](self, "frame");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  objc_msgSend(v4, "bounds");
  v19.origin.x = v6;
  v19.origin.y = v8;
  v19.size.width = v10;
  v19.size.height = v12;
  v13 = CGRectContainsRect(v18, v19);
  if (!v13)
  {
    objc_msgSend(v4, "safeValueForKey:", CFSTR("_accessibilityCircleBodies"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __70__SUUIOnboardingCircleViewAccessibility__accessibilityScrollToVisible__block_invoke;
    v16[3] = &__block_descriptor_64_e15_v32__0_8Q16_B24l;
    *(CGFloat *)&v16[4] = v6;
    *(CGFloat *)&v16[5] = v8;
    *(CGFloat *)&v16[6] = v10;
    *(CGFloat *)&v16[7] = v12;
    objc_msgSend(v14, "enumerateObjectsUsingBlock:", v16);

  }
  return !v13;
}

void __70__SUUIOnboardingCircleViewAccessibility__accessibilityScrollToVisible__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  id v3;

  v3 = a2;
  v2 = v3;
  AXPerformSafeBlock();

}

uint64_t __70__SUUIOnboardingCircleViewAccessibility__accessibilityScrollToVisible__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "applyForce:", dbl_2327F45B0[*(double *)(a1 + 40) < 0.0], *(double *)(MEMORY[0x24BDBEFB0] + 8));
}

- (id)accessibilityLabel
{
  void *v2;
  void *v3;

  -[SUUIOnboardingCircleViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("titleLabel"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessibilityLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)accessibilityCustomActions
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = objc_alloc(MEMORY[0x24BDF6788]);
  accessibilityLocalizedString(CFSTR("remove.circle.action"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithName:target:selector:", v4, self, sel__accessibilityRemoveCircle);

  objc_msgSend(v5, "setSortPriority:", *MEMORY[0x24BEBAD58]);
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObject:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)accessibilityValue
{
  void *v3;
  void *v4;

  -[SUUIOnboardingCircleViewAccessibility _accessibilityPhysicalCirclesViewSuperview](self, "_accessibilityPhysicalCirclesViewSuperview");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_accessibilityValueForCircle:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)_accessibilityOverridesInvalidFrames
{
  return 1;
}

- (BOOL)accessibilityActivate
{
  -[SUUIOnboardingCircleViewAccessibility _accessibilityActivateCircle](self, "_accessibilityActivateCircle");
  return 1;
}

- (id)accessibilityHint
{
  return accessibilityLocalizedString(CFSTR("circle.hint"));
}

- (double)_accessibilityDelayBeforeUpdatingOnActivation
{
  return 0.5;
}

- (BOOL)_accessibilityRemoveCircle
{
  void *v3;

  -[SUUIOnboardingCircleViewAccessibility _accessibilityPhysicalCirclesViewSuperview](self, "_accessibilityPhysicalCirclesViewSuperview");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_accessibilityDeleteCircle:", self);

  return 1;
}

- (void)_accessibilityActivateCircle
{
  id v3;

  -[SUUIOnboardingCircleViewAccessibility _accessibilityPhysicalCirclesViewSuperview](self, "_accessibilityPhysicalCirclesViewSuperview");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_accessibilityActivateCircle:", self);

}

- (id)_accessibilityPhysicalCirclesViewSuperview
{
  void *v2;
  void *v3;
  void *v4;

  objc_opt_class();
  __UIAccessibilityCastAsClass();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "superview");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilitySafeClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end
