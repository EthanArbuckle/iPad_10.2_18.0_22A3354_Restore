@implementation GKBubbleFlowAnimatorAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("GKBubbleFlowAnimator");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("GKBubbleFlowAnimator"), CFSTR("_finishTransitionWithInfo:"), "v", "@", 0);
}

- (void)_finishTransitionWithInfo:(id)a3
{
  id v3;
  int v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)GKBubbleFlowAnimatorAccessibility;
  v3 = a3;
  -[GKBubbleFlowAnimatorAccessibility _finishTransitionWithInfo:](&v5, sel__finishTransitionWithInfo_, v3);
  v4 = objc_msgSend(v3, "safeBoolForKey:", CFSTR("animated"), v5.receiver, v5.super_class);

  if (v4)
    AXPerformBlockOnMainThreadAfterDelay();
}

void __63__GKBubbleFlowAnimatorAccessibility__finishTransitionWithInfo___block_invoke()
{
  UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], 0);
}

@end
