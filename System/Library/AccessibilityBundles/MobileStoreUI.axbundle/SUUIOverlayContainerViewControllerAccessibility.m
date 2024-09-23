@implementation SUUIOverlayContainerViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SUUIOverlayContainerViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SUUIOverlayContainerViewController"), CFSTR("dismissWithFlipTransition: completionBlock:"), "v", "@", "@?", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SUUIOverlayContainerViewController"), CFSTR("dismissWithFadeTransitionCompletionBlock:"), "v", "@?", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SUUIOverlayContainerViewController"), CFSTR("showViewController: withFlipTransition: completionBlock:"), "v", "@", "@", "@?", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SUUIOverlayContainerViewController"), CFSTR("showViewController: withCompletionBlock:"), "v", "@", "@?", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SUUIOverlayContainerViewController"), CFSTR("showViewControllers:"), "v", "@", 0);

}

- (BOOL)accessibilityPerformEscape
{
  AXPerformSafeBlock();
  return 1;
}

void __77__SUUIOverlayContainerViewControllerAccessibility_accessibilityPerformEscape__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "safeValueForKey:", CFSTR("view"));
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    _AXAssert();
  objc_msgSend(v1, "sendActionsForControlEvents:", 64);
  UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], 0);

}

- (id)backstopControl
{
  void *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SUUIOverlayContainerViewControllerAccessibility;
  -[SUUIOverlayContainerViewControllerAccessibility backstopControl](&v4, sel_backstopControl);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAccessibilityViewIsModal:", 1);
  objc_msgSend(v2, "setAccessibilityIdentifier:", CFSTR("OverlayCaptureView"));
  return v2;
}

- (void)dismissWithFlipTransition:(id)a3 completionBlock:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  objc_super v10;
  _QWORD v11[4];
  id v12;

  v6 = a4;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __93__SUUIOverlayContainerViewControllerAccessibility_dismissWithFlipTransition_completionBlock___block_invoke;
  v11[3] = &unk_2502A69B8;
  v12 = v6;
  v7 = v6;
  v8 = a3;
  v9 = (void *)MEMORY[0x234916500](v11);
  v10.receiver = self;
  v10.super_class = (Class)SUUIOverlayContainerViewControllerAccessibility;
  -[SUUIOverlayContainerViewControllerAccessibility dismissWithFlipTransition:completionBlock:](&v10, sel_dismissWithFlipTransition_completionBlock_, v8, v9);

}

void __93__SUUIOverlayContainerViewControllerAccessibility_dismissWithFlipTransition_completionBlock___block_invoke(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1 + 32);
  if (v1)
    (*(void (**)(void))(v1 + 16))();
  UIAccessibilityPostNotification(*MEMORY[0x24BDF7328], 0);
}

- (void)dismissWithFadeTransitionCompletionBlock:(id)a3
{
  id v4;
  id v5;
  void *v6;
  objc_super v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __92__SUUIOverlayContainerViewControllerAccessibility_dismissWithFadeTransitionCompletionBlock___block_invoke;
  v8[3] = &unk_2502A69B8;
  v9 = v4;
  v5 = v4;
  v6 = (void *)MEMORY[0x234916500](v8);
  v7.receiver = self;
  v7.super_class = (Class)SUUIOverlayContainerViewControllerAccessibility;
  -[SUUIOverlayContainerViewControllerAccessibility dismissWithFadeTransitionCompletionBlock:](&v7, sel_dismissWithFadeTransitionCompletionBlock_, v6);

}

void __92__SUUIOverlayContainerViewControllerAccessibility_dismissWithFadeTransitionCompletionBlock___block_invoke(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1 + 32);
  if (v1)
    (*(void (**)(void))(v1 + 16))();
  UIAccessibilityPostNotification(*MEMORY[0x24BDF7328], 0);
}

- (void)showViewController:(id)a3 withCompletionBlock:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  objc_super v10;
  _QWORD v11[4];
  id v12;

  v6 = a4;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __90__SUUIOverlayContainerViewControllerAccessibility_showViewController_withCompletionBlock___block_invoke;
  v11[3] = &unk_2502A69B8;
  v12 = v6;
  v7 = v6;
  v8 = a3;
  v9 = (void *)MEMORY[0x234916500](v11);
  v10.receiver = self;
  v10.super_class = (Class)SUUIOverlayContainerViewControllerAccessibility;
  -[SUUIOverlayContainerViewControllerAccessibility showViewController:withCompletionBlock:](&v10, sel_showViewController_withCompletionBlock_, v8, v9);

}

void __90__SUUIOverlayContainerViewControllerAccessibility_showViewController_withCompletionBlock___block_invoke(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1 + 32);
  if (v1)
    (*(void (**)(void))(v1 + 16))();
  UIAccessibilityPostNotification(*MEMORY[0x24BDF7328], 0);
}

- (void)showViewController:(id)a3 withFlipTransition:(id)a4 completionBlock:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  objc_super v13;
  _QWORD v14[4];
  id v15;

  v8 = a5;
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __105__SUUIOverlayContainerViewControllerAccessibility_showViewController_withFlipTransition_completionBlock___block_invoke;
  v14[3] = &unk_2502A69B8;
  v15 = v8;
  v9 = v8;
  v10 = a4;
  v11 = a3;
  v12 = (void *)MEMORY[0x234916500](v14);
  v13.receiver = self;
  v13.super_class = (Class)SUUIOverlayContainerViewControllerAccessibility;
  -[SUUIOverlayContainerViewControllerAccessibility showViewController:withFlipTransition:completionBlock:](&v13, sel_showViewController_withFlipTransition_completionBlock_, v11, v10, v12);

}

void __105__SUUIOverlayContainerViewControllerAccessibility_showViewController_withFlipTransition_completionBlock___block_invoke(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1 + 32);
  if (v1)
    (*(void (**)(void))(v1 + 16))();
  UIAccessibilityPostNotification(*MEMORY[0x24BDF7328], 0);
}

- (void)showViewControllers:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SUUIOverlayContainerViewControllerAccessibility;
  -[SUUIOverlayContainerViewControllerAccessibility showViewControllers:](&v3, sel_showViewControllers_, a3);
  UIAccessibilityPostNotification(*MEMORY[0x24BDF7328], 0);
}

@end
