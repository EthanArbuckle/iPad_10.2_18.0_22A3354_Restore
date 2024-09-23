@implementation CKSendMenuViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CKSendMenuViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKSendMenuViewController"), CFSTR("sendMenuViewControllerDelegate"), "@", 0);
  objc_msgSend(v3, "validateProtocol:hasRequiredInstanceMethod:", CFSTR("CKSendMenuViewControllerDelegate"), CFSTR("sendMenuViewControllerRequestDismiss:"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKSendMenuViewController"), CFSTR("loadMoreAppsSection"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKSendMenuViewController"), CFSTR("calculatePercentVisibleForSection:"), "d", "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKSendMenuViewController"), CFSTR("shouldEnablePagingForScrollView:"), "B", "@", 0);

}

- (BOOL)accessibilityPerformEscape
{
  id v2;
  void *v4;

  -[CKSendMenuViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("sendMenuViewControllerDelegate"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v4;
  AXPerformSafeBlock();

  return 1;
}

uint64_t __67__CKSendMenuViewControllerAccessibility_accessibilityPerformEscape__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "sendMenuViewControllerRequestDismiss:", *(_QWORD *)(a1 + 40));
}

- (void)loadMoreAppsSection
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)CKSendMenuViewControllerAccessibility;
  -[CKSendMenuViewControllerAccessibility loadMoreAppsSection](&v2, sel_loadMoreAppsSection);
  UIAccessibilityPostNotification(*MEMORY[0x24BDF7328], 0);
}

- (double)calculatePercentVisibleForSection:(int64_t)a3
{
  double v5;
  double v6;
  objc_super v8;

  v5 = 1.0;
  if (!UIAccessibilityIsVoiceOverRunning())
  {
    v8.receiver = self;
    v8.super_class = (Class)CKSendMenuViewControllerAccessibility;
    -[CKSendMenuViewControllerAccessibility calculatePercentVisibleForSection:](&v8, sel_calculatePercentVisibleForSection_, a3);
    return v6;
  }
  return v5;
}

- (BOOL)shouldEnablePagingForScrollView:(id)a3
{
  id v4;
  BOOL v5;
  objc_super v7;

  v4 = a3;
  if (UIAccessibilityIsVoiceOverRunning())
  {
    v5 = 0;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)CKSendMenuViewControllerAccessibility;
    v5 = -[CKSendMenuViewControllerAccessibility shouldEnablePagingForScrollView:](&v7, sel_shouldEnablePagingForScrollView_, v4);
  }

  return v5;
}

@end
