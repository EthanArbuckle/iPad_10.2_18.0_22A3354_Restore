@implementation PHMobilePhoneRemoteViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PHMobilePhoneRemoteViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("PHMobilePhoneRemoteViewController"), CFSTR("PHPhoneRemoteViewController"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PHPhoneRemoteViewController"), CFSTR("viewDidAppear:"), "v", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PHPhoneRemoteViewController"), CFSTR("viewWillDisappear:"), "v", "B", 0);

}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PHMobilePhoneRemoteViewControllerAccessibility;
  -[PHMobilePhoneRemoteViewControllerAccessibility viewDidAppear:](&v3, sel_viewDidAppear_, a3);
  AXPerformBlockOnMainThreadAfterDelay();
}

void __64__PHMobilePhoneRemoteViewControllerAccessibility_viewDidAppear___block_invoke(uint64_t a1)
{
  UIAccessibilityNotifications v1;
  void *v2;
  UIAccessibilityNotifications v3;
  id v4;

  v1 = *MEMORY[0x24BDF7328];
  objc_msgSend(*(id *)(a1 + 32), "safeValueForKey:", CFSTR("view"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  UIAccessibilityPostNotification(v1, v2);

  v3 = *MEMORY[0x24BDF71E8];
  accessibilityLocalizedString(CFSTR("add.call.hint"));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  UIAccessibilityPostNotification(v3, v4);

}

- (void)viewWillDisappear:(BOOL)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PHMobilePhoneRemoteViewControllerAccessibility;
  -[PHMobilePhoneRemoteViewControllerAccessibility viewWillDisappear:](&v3, sel_viewWillDisappear_, a3);
  AXPerformBlockOnMainThreadAfterDelay();
}

void __68__PHMobilePhoneRemoteViewControllerAccessibility_viewWillDisappear___block_invoke()
{
  UIAccessibilityPostNotification(*MEMORY[0x24BDF7328], 0);
}

@end
