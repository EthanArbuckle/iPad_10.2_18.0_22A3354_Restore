@implementation FMInitialCardControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("FindMy.FMInitialCardController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIViewController"), CFSTR("presentCard:completion:"), "v", "@", "@?", 0);
}

- (void)presentCard:(id)a3 completion:(id)a4
{
  id v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)FMInitialCardControllerAccessibility;
  v5 = a3;
  -[FMInitialCardControllerAccessibility presentCard:completion:](&v6, sel_presentCard_completion_, v5, a4);
  UIAccessibilityPostNotification(*MEMORY[0x24BDF7328], v5);

}

@end
