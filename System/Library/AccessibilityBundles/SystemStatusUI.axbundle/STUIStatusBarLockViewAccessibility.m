@implementation STUIStatusBarLockViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("STUIStatusBarLockView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("STUIStatusBarLockView"), CFSTR("animateUnlockWithCompletionBlock:"), "v", "@?", 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  return accessibilityLocalizedString(CFSTR("status.icon.lock"));
}

- (unint64_t)accessibilityTraits
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)STUIStatusBarLockViewAccessibility;
  return *MEMORY[0x24BEBB180] | -[STUIStatusBarLockViewAccessibility accessibilityTraits](&v3, sel_accessibilityTraits) | *MEMORY[0x24BEBB0F8];
}

- (void)animateUnlockWithCompletionBlock:(id)a3
{
  id v4;
  objc_super v5;
  _QWORD v6[4];
  id v7;

  v6[1] = 3221225472;
  v6[2] = __71__STUIStatusBarLockViewAccessibility_animateUnlockWithCompletionBlock___block_invoke;
  v6[3] = &unk_25039DA80;
  v7 = a3;
  v5.receiver = self;
  v5.super_class = (Class)STUIStatusBarLockViewAccessibility;
  v6[0] = MEMORY[0x24BDAC760];
  v4 = v7;
  -[STUIStatusBarLockViewAccessibility animateUnlockWithCompletionBlock:](&v5, sel_animateUnlockWithCompletionBlock_, v6);

}

void __71__STUIStatusBarLockViewAccessibility_animateUnlockWithCompletionBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  int v2;
  uint64_t v3;

  v2 = a2;
  v3 = *(_QWORD *)(a1 + 32);
  if (v3)
    (*(void (**)(uint64_t, uint64_t))(v3 + 16))(v3, a2);
  if (v2)
    UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], 0);
}

@end
