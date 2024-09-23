@implementation ConversationHUDControlsViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("ConversationKit.ConversationHUDControlsView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("ConversationKit.BannerPresentationManager"), CFSTR("dismissPresentedBannerForReason:animated:"), "v", "@", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("ConversationKit.BannerPresentationManager"), CFSTR("presentedBanner"), "@", 0);

}

- (BOOL)accessibilityElementsHidden
{
  void *v2;
  BOOL IsEmpty;
  CGRect v5;

  objc_opt_class();
  __UIAccessibilityCastAsClass();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_accessibilityVisibleFrame");
  IsEmpty = CGRectIsEmpty(v5);

  return IsEmpty;
}

- (BOOL)accessibilityPerformEscape
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  BOOL v6;
  id v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  char v12;

  objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "safeValueForKey:", CFSTR("bannerPresentationManager"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "safeValueForKey:", CFSTR("presentedBanner"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v9 = 0;
    v10 = &v9;
    v11 = 0x2020000000;
    v12 = 0;
    v8 = v4;
    AXPerformSafeBlock();
    v6 = *((_BYTE *)v10 + 24) != 0;

    _Block_object_dispose(&v9, 8);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

void __70__ConversationHUDControlsViewAccessibility_accessibilityPerformEscape__block_invoke(uint64_t a1)
{
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "dismissPresentedBannerForReason:animated:", CFSTR("Accessibility escape performed"), 1);
    UIAccessibilityPostNotification(*MEMORY[0x24BDF7328], 0);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  }
}

@end
