@implementation UIPreviewPresentationControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UIPreviewPresentationController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id obj;
  id *v4;
  id location[3];

  location[2] = a1;
  location[1] = (id)a2;
  v4 = location;
  obj = 0;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIPreviewPresentationController"), CFSTR("_handleDismissGestureRecognizer:"), "v", "@", 0);
  objc_storeStrong(v4, obj);
}

- (BOOL)accessibilityPerformEscape
{
  uint64_t v3;
  int v4;
  int v5;
  uint64_t (*v6)(uint64_t);
  void *v7;
  id v8[3];

  v8[2] = self;
  v8[1] = (id)a2;
  v3 = MEMORY[0x24BDAC760];
  v4 = -1073741824;
  v5 = 0;
  v6 = __74__UIPreviewPresentationControllerAccessibility_accessibilityPerformEscape__block_invoke;
  v7 = &unk_24FF3DA40;
  v8[0] = self;
  AXPerformSafeBlock();
  objc_storeStrong(v8, 0);
  return 1;
}

uint64_t __74__UIPreviewPresentationControllerAccessibility_accessibilityPerformEscape__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleDismissGestureRecognizer:", 0, a1, a1);
}

void __68___UIPreviewPresentationControllerAccessibility__axShowMoreActions___block_invoke(uint64_t a1)
{
  UIAccessibilityNotifications notification;
  id v2;

  notification = *MEMORY[0x24BDF72C8];
  v2 = (id)objc_msgSend(*(id *)(a1 + 32), "safeValueForKey:", CFSTR("previewActionSheet"));
  UIAccessibilityPostNotification(notification, v2);

}

uint64_t __72___UIPreviewPresentationControllerAccessibility__axPerformLeadingAction__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)(a1 + 48);
  v2 = *(_QWORD *)(a1 + 32);
  v4 = (id)objc_msgSend(*(id *)(a1 + 40), "safeValueForKey:", CFSTR("presentedViewController"));
  (*(void (**)(uint64_t, uint64_t))(v3 + 16))(v3, v2);

  return objc_msgSend(*(id *)(a1 + 40), "_dismissPresentation");
}

uint64_t __73___UIPreviewPresentationControllerAccessibility__axPerformTrailingAction__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)(a1 + 48);
  v2 = *(_QWORD *)(a1 + 32);
  v4 = (id)objc_msgSend(*(id *)(a1 + 40), "safeValueForKey:", CFSTR("presentedViewController"));
  (*(void (**)(uint64_t, uint64_t))(v3 + 16))(v3, v2);

  return objc_msgSend(*(id *)(a1 + 40), "_dismissPresentation");
}

uint64_t __82___UIPreviewPresentationControllerAccessibility__accessibilityDismissPresentation__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_dismissPresentation", a1, a1);
}

void __93___UIPreviewPresentationControllerAccessibility__presentSubActionSheetForPreviewActionGroup___block_invoke(uint64_t a1)
{
  UIAccessibilityNotifications notification;
  id v2;

  notification = *MEMORY[0x24BDF72C8];
  v2 = (id)objc_msgSend(*(id *)(a1 + 32), "safeValueForKey:", CFSTR("previewActionSheet"));
  UIAccessibilityPostNotification(notification, v2);

}

@end
