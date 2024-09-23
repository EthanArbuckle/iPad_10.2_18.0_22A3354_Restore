@implementation SBInCallPresentationSessionAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SBInCallPresentationSession");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBInCallPresentationSession"), CFSTR("_setNonModalPresentationActive:"), "v", "B", 0);
}

- (void)_setNonModalPresentationActive:(BOOL)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SBInCallPresentationSessionAccessibility;
  -[SBInCallPresentationSessionAccessibility _setNonModalPresentationActive:](&v3, sel__setNonModalPresentationActive_, a3);
  AXPerformBlockOnMainThreadAfterDelay();
}

void __75__SBInCallPresentationSessionAccessibility__setNonModalPresentationActive___block_invoke()
{
  id v0;

  objc_msgSend(MEMORY[0x24BE006F0], "server");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "didPotentiallyDismissNonExclusiveSystemUI");

}

@end
