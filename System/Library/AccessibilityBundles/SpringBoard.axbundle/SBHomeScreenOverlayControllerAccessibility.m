@implementation SBHomeScreenOverlayControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SBHomeScreenOverlayController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBHomeScreenOverlayController"), CFSTR("overlayViewController"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBHomeScreenOverlayController"), CFSTR("presentationProgress"), "d", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBHomeScreenOverlayController"), CFSTR("setPresentationProgress:fromLeading:interactive:animated:completionHandler:"), "v", "d", "B", "B", "B", "@?", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBHomeScreenOverlayController"), CFSTR("dismissAnimated:completionHandler:"), "v", "B", "@?", 0);

}

- (void)setPresentationProgress:(double)a3 fromLeading:(BOOL)a4 interactive:(BOOL)a5 animated:(BOOL)a6 completionHandler:(id)a7
{
  _BOOL8 v7;
  _BOOL8 v8;
  _BOOL8 v9;
  id v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  objc_super v19;

  v7 = a6;
  v8 = a5;
  v9 = a4;
  v12 = a7;
  -[SBHomeScreenOverlayControllerAccessibility safeCGFloatForKey:](self, "safeCGFloatForKey:", CFSTR("presentationProgress"));
  v14 = v13;
  v19.receiver = self;
  v19.super_class = (Class)SBHomeScreenOverlayControllerAccessibility;
  -[SBHomeScreenOverlayControllerAccessibility setPresentationProgress:fromLeading:interactive:animated:completionHandler:](&v19, sel_setPresentationProgress_fromLeading_interactive_animated_completionHandler_, v9, v8, v7, v12, a3);
  if (v14 != a3)
    UIAccessibilityPostNotification(*MEMORY[0x24BDF7328], 0);
  -[SBHomeScreenOverlayControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("window"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setAccessibilityViewIsModal:", 1);

  objc_opt_class();
  -[SBHomeScreenOverlayControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("overlayViewController"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v17, "view");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setAccessibilityViewIsModal:", 1);

}

- (BOOL)accessibilityPerformEscape
{
  AXPerformSafeBlock();
  return 1;
}

uint64_t __72__SBHomeScreenOverlayControllerAccessibility_accessibilityPerformEscape__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "dismissAnimated:completionHandler:", 1, 0);
}

@end
