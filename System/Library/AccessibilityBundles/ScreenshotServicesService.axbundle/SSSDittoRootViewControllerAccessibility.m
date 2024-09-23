@implementation SSSDittoRootViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SSSDittoRootViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SSSDittoRootViewController"), CFSTR("state"), "Q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SSSDittoRootViewController"), CFSTR("dittoDismissTimerFired:"), "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SSSDittoRootViewController"), CFSTR("containerViewControllerDidEndDismissAnimation:"), "v", "@", 0);

}

- (void)dittoDismissTimerFired:(id)a3
{
  id v4;
  id v5;
  void (**v6)(_QWORD);
  void (**v7)(_QWORD);
  _QWORD v8[4];
  id v9;
  SSSDittoRootViewControllerAccessibility *v10;

  v4 = a3;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __66__SSSDittoRootViewControllerAccessibility_dittoDismissTimerFired___block_invoke;
  v8[3] = &unk_25033B6C0;
  v5 = v4;
  v9 = v5;
  v10 = self;
  v6 = (void (**)(_QWORD))MEMORY[0x23491CB64](v8);
  if (_AXSAssistiveTouchScannerEnabled())
  {
    v7 = v6;
    AXPerformBlockOnMainThreadAfterDelay();

  }
  else
  {
    v6[2](v6);
  }

}

id __66__SSSDittoRootViewControllerAccessibility_dittoDismissTimerFired___block_invoke(uint64_t a1)
{
  uint64_t v1;
  objc_super v3;

  v1 = *(_QWORD *)(a1 + 32);
  v3.receiver = *(id *)(a1 + 40);
  v3.super_class = (Class)SSSDittoRootViewControllerAccessibility;
  return objc_msgSendSuper2(&v3, sel_dittoDismissTimerFired_, v1);
}

uint64_t __66__SSSDittoRootViewControllerAccessibility_dittoDismissTimerFired___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "safeIntegerForKey:", CFSTR("state"));
  if (!result)
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  return result;
}

- (void)containerViewControllerDidEndDismissAnimation:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SSSDittoRootViewControllerAccessibility;
  -[SSSDittoRootViewControllerAccessibility containerViewControllerDidEndDismissAnimation:](&v3, sel_containerViewControllerDidEndDismissAnimation_, a3);
  UIAccessibilityPostNotification(*MEMORY[0x24BDF7328], 0);
}

@end
