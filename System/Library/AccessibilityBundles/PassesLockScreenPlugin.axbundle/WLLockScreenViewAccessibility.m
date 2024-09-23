@implementation WLLockScreenViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("WLLockScreenView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("WLLockScreenCardsViewController"), CFSTR("dismissAnimated:"), "v", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("WLLockScreenView"), CFSTR("delegate"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("WLLockScreenView"), CFSTR("didAppear"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("WLLockScreenView"), CFSTR("willDisappear"), "v", 0);

}

- (BOOL)accessibilityPerformEscape
{
  char v2;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  char v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2020000000;
  v7 = 0;
  AXPerformSafeBlock();
  v2 = *((_BYTE *)v5 + 24);
  _Block_object_dispose(&v4, 8);
  return v2;
}

void __59__WLLockScreenViewAccessibility_accessibilityPerformEscape__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  objc_msgSend(*(id *)(a1 + 32), "safeValueForKey:", CFSTR("delegate"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilitySafeClass();
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "dismissAnimated:", 1);
  AXPerformBlockOnMainThreadAfterDelay();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;

}

void __59__WLLockScreenViewAccessibility_accessibilityPerformEscape__block_invoke_2()
{
  UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], 0);
}

- (BOOL)accessibilityViewIsModal
{
  return 1;
}

- (void)didAppear
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)WLLockScreenViewAccessibility;
  -[WLLockScreenViewAccessibility didAppear](&v2, sel_didAppear);
  UIAccessibilityPostNotification(*MEMORY[0x24BDF7328], 0);
}

- (void)willDisappear
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)WLLockScreenViewAccessibility;
  -[WLLockScreenViewAccessibility willDisappear](&v2, sel_willDisappear);
  UIAccessibilityPostNotification(*MEMORY[0x24BDF7328], 0);
}

@end
