@implementation UIPreviewInteractionControllerAccessibility

void __112___UIPreviewInteractionControllerAccessibility__preparePreviewViewControllerPresentationFromPreviewInteraction___block_invoke(id *a1)
{
  id v1;
  id v2;
  uint64_t v3;
  id v4;
  id v5;
  id v7;
  id v8;
  id v9;
  id v10;
  char v11;
  id v12[3];

  v12[2] = a1;
  v12[1] = a1;
  v11 = 0;
  objc_opt_class();
  v7 = (id)objc_msgSend(a1[4], "safeValueForKey:", CFSTR("currentPresentationController"));
  v10 = (id)__UIAccessibilityCastAsClass();

  v9 = v10;
  objc_storeStrong(&v10, 0);
  v12[0] = v9;
  v8 = (id)objc_msgSend(v9, "safeUIViewForKey:", CFSTR("contentPlatterView"));
  objc_msgSend(v8, "setIsAccessibilityElement:", 1);
  v1 = v8;
  v2 = (id)UIKitAccessibilityLocalizedString();
  objc_msgSend(v1, "setAccessibilityLabel:");

  objc_msgSend(v8, "setAccessibilityIdentifier:", CFSTR("PreviewContainerElement"));
  v3 = (uint64_t)a1[4];
  v5 = (id)objc_msgSend(v12[0], "presentedViewController");
  v4 = -[_UIPreviewInteractionControllerAccessibility _accessibilityCustomActionsFromPresentedViewController:](v3, v5);
  objc_msgSend(v8, "setAccessibilityCustomActions:");

  objc_storeStrong(&v8, 0);
  objc_storeStrong(v12, 0);
}

uint64_t __72___UIPreviewInteractionControllerAccessibility__axPerformPreviewAction___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  return objc_msgSend(*(id *)(a1 + 48), "_accessibilityDismissPresentation");
}

void __77___UIPreviewInteractionControllerAccessibility__accessibilityShowMoreActions__block_invoke(id *a1)
{
  id argument;
  id v2[3];

  v2[2] = a1;
  v2[1] = a1;
  v2[0] = (id)objc_msgSend(a1[4], "safeValueForKey:", CFSTR("previewActionsController"));
  argument = (id)objc_msgSend(v2[0], "safeValueForKey:", CFSTR("previewActionsView"));
  UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], argument);
  objc_storeStrong(&argument, 0);
  objc_storeStrong(v2, 0);
}

uint64_t __81___UIPreviewInteractionControllerAccessibility__accessibilityDismissPresentation__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_dismissPreviewViewControllerIfNeeded", a1, a1);
}

@end
