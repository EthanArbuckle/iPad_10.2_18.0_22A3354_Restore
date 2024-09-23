@implementation RKEntityInteractionAccessibilityWrapperAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("RealityFoundation.RKEntityInteractionAccessibilityWrapper");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("RealityFoundation.RKEntityInteractionAccessibilityWrapper"), CFSTR("didFire"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("RealityFoundation.RKEntityInteractionAccessibilityWrapper"), CFSTR("accessibilityDescription"), "@", 0);

}

- (void)didFire
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)RKEntityInteractionAccessibilityWrapperAccessibility;
  -[RKEntityInteractionAccessibilityWrapperAccessibility didFire](&v4, sel_didFire);
  -[RKEntityInteractionAccessibilityWrapperAccessibility safeStringForKey:](self, "safeStringForKey:", CFSTR("accessibilityDescription"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_accessibilityEnumerateDelayedDescriptionsWithBlock:", &__block_literal_global_0);

}

void __63__RKEntityInteractionAccessibilityWrapperAccessibility_didFire__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  id v3;

  v3 = a2;
  v2 = v3;
  AXPerformBlockOnMainThreadAfterDelay();

}

uint64_t __63__RKEntityInteractionAccessibilityWrapperAccessibility_didFire__block_invoke_2()
{
  UIAccessibilitySpeakOrQueueIfNeeded();
  return AXPerformBlockOnMainThreadAfterDelay();
}

void __63__RKEntityInteractionAccessibilityWrapperAccessibility_didFire__block_invoke_3()
{
  UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], 0);
}

@end
