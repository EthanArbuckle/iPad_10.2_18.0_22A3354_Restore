@implementation WFCompactPlatterPresentationControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("WFCompactPlatterPresentationController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("WFCompactPlatterPresentationController"), CFSTR("_containerView"), "UIView");
  objc_msgSend(v3, "validateClass:", CFSTR("WFCompactPlatterView"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("WFCompactPlatterView"), CFSTR("primaryLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("WFCompactPlatterPresentationController"), CFSTR("presentationTransitionDidEnd:"), "v", "B", 0);

}

- (void)presentationTransitionDidEnd:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  objc_super v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t);
  void *v13;
  id v14;

  v3 = a3;
  -[WFCompactPlatterPresentationControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("containerView"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_accessibilityFindSubviewDescendant:", &__block_literal_global_0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "safeValueForKey:", CFSTR("primaryLabel"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x24BDAC760];
  v11 = 3221225472;
  v12 = __84__WFCompactPlatterPresentationControllerAccessibility_presentationTransitionDidEnd___block_invoke_2;
  v13 = &unk_2503EA450;
  v14 = v7;
  v8 = v7;
  AXPerformBlockOnMainThreadAfterDelay();
  v9.receiver = self;
  v9.super_class = (Class)WFCompactPlatterPresentationControllerAccessibility;
  -[WFCompactPlatterPresentationControllerAccessibility presentationTransitionDidEnd:](&v9, sel_presentationTransitionDidEnd_, v3);

}

uint64_t __84__WFCompactPlatterPresentationControllerAccessibility_presentationTransitionDidEnd___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  NSClassFromString(CFSTR("WFCompactPlatterView"));
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

void __84__WFCompactPlatterPresentationControllerAccessibility_presentationTransitionDidEnd___block_invoke_2(uint64_t a1)
{
  UIAccessibilityPostNotification(*MEMORY[0x24BEBB030], *(id *)(a1 + 32));
}

@end
