@implementation YearMonthAnimatorAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("YearMonthAnimator");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("YearMonthAnimator"), CFSTR("animateTransition:"), "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("YearMonthAnimator"), CFSTR("transitionDuration:"), "d", "@", 0);

}

- (void)animateTransition:(id)a3
{
  id v4;
  _QWORD v5[4];
  objc_super v6;

  v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)YearMonthAnimatorAccessibility;
  -[YearMonthAnimatorAccessibility animateTransition:](&v6, sel_animateTransition_, v4);
  v5[0] = 0;
  v5[1] = v5;
  v5[2] = 0x2020000000;
  v5[3] = 0;
  AXPerformSafeBlock();
  _Block_object_dispose(v5, 8);
  AXPerformBlockOnMainThreadAfterDelay();

}

uint64_t __52__YearMonthAnimatorAccessibility_animateTransition___block_invoke(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;

  result = objc_msgSend(*(id *)(a1 + 32), "transitionDuration:", 0);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v3;
  return result;
}

void __52__YearMonthAnimatorAccessibility_animateTransition___block_invoke_2()
{
  UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], (id)*MEMORY[0x24BDFEEB0]);
}

@end
