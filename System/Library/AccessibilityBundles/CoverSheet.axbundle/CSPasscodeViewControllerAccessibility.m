@implementation CSPasscodeViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CSPasscodeViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CSPasscodeViewController"), CFSTR("performCustomTransitionToVisible:withAnimationSettings:completion:"), "v", "B", "@", "@?", 0);
}

- (void)performCustomTransitionToVisible:(BOOL)a3 withAnimationSettings:(id)a4 completion:(id)a5
{
  _BOOL8 v6;
  id v8;
  objc_super v9;
  _QWORD v10[4];
  id v11;

  v6 = a3;
  v10[1] = 3221225472;
  v10[2] = __107__CSPasscodeViewControllerAccessibility_performCustomTransitionToVisible_withAnimationSettings_completion___block_invoke;
  v10[3] = &unk_2501EDF48;
  v11 = a5;
  v9.receiver = self;
  v9.super_class = (Class)CSPasscodeViewControllerAccessibility;
  v10[0] = MEMORY[0x24BDAC760];
  v8 = v11;
  -[CSPasscodeViewControllerAccessibility performCustomTransitionToVisible:withAnimationSettings:completion:](&v9, sel_performCustomTransitionToVisible_withAnimationSettings_completion_, v6, a4, v10);

}

void __107__CSPasscodeViewControllerAccessibility_performCustomTransitionToVisible_withAnimationSettings_completion___block_invoke(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1 + 32);
  if (v1)
    (*(void (**)(void))(v1 + 16))();
  UIAccessibilityPostNotification(*MEMORY[0x24BDF7328], 0);
}

@end
