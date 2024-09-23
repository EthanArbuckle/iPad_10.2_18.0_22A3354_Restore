@implementation InCallBannerHostViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("ConversationKit.InCallBannerHostViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("ConversationKit.InCallBannerHostViewController"), CFSTR("UIViewController"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("ConversationKit.InCallBannerHostViewController"), CFSTR("menuPresented"), "B", 0);

}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  _QWORD v4[4];
  id v5;
  objc_super v6;
  id location;

  objc_initWeak(&location, self);
  v6.receiver = self;
  v6.super_class = (Class)InCallBannerHostViewControllerAccessibility;
  -[InCallBannerHostViewControllerAccessibility _accessibilityLoadAccessibilityInformation](&v6, sel__accessibilityLoadAccessibilityInformation);
  -[InCallBannerHostViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("view"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __89__InCallBannerHostViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke;
  v4[3] = &unk_2501E5B80;
  objc_copyWeak(&v5, &location);
  objc_msgSend(v3, "_setAccessibilityViewIsModalBlock:", v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

uint64_t __89__InCallBannerHostViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1)
{
  id WeakRetained;
  uint64_t v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = objc_msgSend(WeakRetained, "safeBoolForKey:", CFSTR("menuPresented"));

  return v2;
}

@end
