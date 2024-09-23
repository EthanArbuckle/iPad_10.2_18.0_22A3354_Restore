@implementation PURedeyeToolControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PURedeyeToolController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PURedeyeToolController"), CFSTR("centerToolbarView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PURedeyeToolController"), CFSTR("_animateInstructionAppearance"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PURedeyeToolController"), CFSTR("_animateFailureAppearance"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PURedeyeToolController"), CFSTR("didBecomeActiveTool"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("PURedeyeToolController"), CFSTR("_instructionLabel"), "CEKBadgeTextView");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("PURedeyeToolController"), CFSTR("_failureLabel"), "CEKBadgeTextView");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PURedeyeToolController"), CFSTR("_showChangeIndicatorAtPoint:isFailure:"), "v", "{CGPoint=dd}", "B", 0);

}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PURedeyeToolControllerAccessibility;
  -[PURedeyeToolControllerAccessibility _accessibilityLoadAccessibilityInformation](&v4, sel__accessibilityLoadAccessibilityInformation);
  -[PURedeyeToolControllerAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("centerToolbarView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_setAccessibilityTraitsBlock:", &__block_literal_global_13);

}

uint64_t __81__PURedeyeToolControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke()
{
  return *MEMORY[0x24BDF73C0];
}

- (id)centerToolbarView
{
  void *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PURedeyeToolControllerAccessibility;
  -[PURedeyeToolControllerAccessibility centerToolbarView](&v4, sel_centerToolbarView);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_setAccessibilityTraitsBlock:", &__block_literal_global_221);
  return v2;
}

uint64_t __56__PURedeyeToolControllerAccessibility_centerToolbarView__block_invoke()
{
  return *MEMORY[0x24BDF73C0];
}

- (void)_animateInstructionAppearance
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PURedeyeToolControllerAccessibility;
  -[PURedeyeToolControllerAccessibility _animateInstructionAppearance](&v4, sel__animateInstructionAppearance);
  -[PURedeyeToolControllerAccessibility _accessibilityStringForLabelKeyValues:](self, "_accessibilityStringForLabelKeyValues:", CFSTR("_instructionLabel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  UIAccessibilitySpeak();

}

- (void)_animateFailureAppearance
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PURedeyeToolControllerAccessibility;
  -[PURedeyeToolControllerAccessibility _animateFailureAppearance](&v4, sel__animateFailureAppearance);
  -[PURedeyeToolControllerAccessibility _accessibilityStringForLabelKeyValues:](self, "_accessibilityStringForLabelKeyValues:", CFSTR("_failureLabel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  UIAccessibilitySpeak();

}

- (void)didBecomeActiveTool
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PURedeyeToolControllerAccessibility;
  -[PURedeyeToolControllerAccessibility didBecomeActiveTool](&v4, sel_didBecomeActiveTool);
  -[PURedeyeToolControllerAccessibility _accessibilityStringForLabelKeyValues:](self, "_accessibilityStringForLabelKeyValues:", CFSTR("_instructionLabel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  UIAccessibilitySpeak();

}

- (void)_showChangeIndicatorAtPoint:(CGPoint)a3 isFailure:(BOOL)a4
{
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PURedeyeToolControllerAccessibility;
  -[PURedeyeToolControllerAccessibility _showChangeIndicatorAtPoint:isFailure:](&v6, sel__showChangeIndicatorAtPoint_isFailure_, a3.x, a3.y);
  if (!a4)
  {
    accessibilityPULocalizedString(CFSTR("red.eye.corrected"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    UIAccessibilitySpeak();

  }
}

@end
