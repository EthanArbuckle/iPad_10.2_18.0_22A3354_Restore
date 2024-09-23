@implementation SBFloatingDockControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SBFloatingDockController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBFloatingDockController"), CFSTR("isFloatingDockFullyPresented"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBFloatingDockController"), CFSTR("presentFloatingDockIfDismissedAnimated:completionHandler:"), "v", "B", "@?", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBFloatingDockController"), CFSTR("dismissFloatingDockIfPresentedAnimated:completionHandler:"), "v", "B", "@?", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBFloatingDockController"), CFSTR("isFloatingDockFullyPresented"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBFloatingDockController"), CFSTR("isPresentingFolder"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBFloatingDockController"), CFSTR("_allowGestureRecognizers"), "B", 0);

}

- (void)presentFloatingDockIfDismissedAnimated:(BOOL)a3 completionHandler:(id)a4
{
  _BOOL8 v4;
  id v6;
  char v7;
  id v8;
  void *v9;
  objc_super v10;
  _QWORD v11[5];
  id v12;
  char v13;

  v4 = a3;
  v6 = a4;
  v7 = -[SBFloatingDockControllerAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("isFloatingDockFullyPresented"));
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __98__SBFloatingDockControllerAccessibility_presentFloatingDockIfDismissedAnimated_completionHandler___block_invoke;
  v11[3] = &unk_250367EB8;
  v13 = v7;
  v11[4] = self;
  v12 = v6;
  v8 = v6;
  v9 = (void *)MEMORY[0x23491FAEC](v11);
  UIAccessibilityPostNotification(*MEMORY[0x24BDF71E8], (id)*MEMORY[0x24BDFEDE0]);
  v10.receiver = self;
  v10.super_class = (Class)SBFloatingDockControllerAccessibility;
  -[SBFloatingDockControllerAccessibility presentFloatingDockIfDismissedAnimated:completionHandler:](&v10, sel_presentFloatingDockIfDismissedAnimated_completionHandler_, v4, v9);

}

void __98__SBFloatingDockControllerAccessibility_presentFloatingDockIfDismissedAnimated_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = *(_QWORD *)(a1 + 40);
  if (v2)
    (*(void (**)(void))(v2 + 16))();
  if (!*(_BYTE *)(a1 + 48))
  {
    if (objc_msgSend(*(id *)(a1 + 32), "safeBoolForKey:", CFSTR("isFloatingDockFullyPresented")))
    {
      objc_opt_class();
      objc_msgSend(*(id *)(a1 + 32), "safeValueForKey:", CFSTR("_viewController"));
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      __UIAccessibilityCastAsClass();
      v4 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v4, "view");
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], v5);
    }
  }
}

- (void)dismissFloatingDockIfPresentedAnimated:(BOOL)a3 completionHandler:(id)a4
{
  _BOOL8 v4;
  id v6;
  char v7;
  id v8;
  void *v9;
  void *v10;
  objc_super v11;
  _QWORD v12[5];
  id v13;
  char v14;

  v4 = a3;
  v6 = a4;
  v7 = -[SBFloatingDockControllerAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("isFloatingDockFullyPresented"));
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __98__SBFloatingDockControllerAccessibility_dismissFloatingDockIfPresentedAnimated_completionHandler___block_invoke;
  v12[3] = &unk_250367EB8;
  v14 = v7;
  v12[4] = self;
  v13 = v6;
  v8 = v6;
  v9 = (void *)MEMORY[0x23491FAEC](v12);
  UIAccessibilityPostNotification(*MEMORY[0x24BDF71E8], (id)*MEMORY[0x24BDFEDD8]);
  v11.receiver = self;
  v11.super_class = (Class)SBFloatingDockControllerAccessibility;
  -[SBFloatingDockControllerAccessibility dismissFloatingDockIfPresentedAnimated:completionHandler:](&v11, sel_dismissFloatingDockIfPresentedAnimated_completionHandler_, v4, v9);
  objc_msgSend(MEMORY[0x24BE006F0], "server");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "didPotentiallyDismissNonExclusiveSystemUI");

}

void __98__SBFloatingDockControllerAccessibility_dismissFloatingDockIfPresentedAnimated_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 40);
  if (v2)
    (*(void (**)(void))(v2 + 16))();
  if (*(_BYTE *)(a1 + 48))
  {
    if ((objc_msgSend(*(id *)(a1 + 32), "safeBoolForKey:", CFSTR("isFloatingDockFullyPresented")) & 1) == 0)
      UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], 0);
  }
}

@end
