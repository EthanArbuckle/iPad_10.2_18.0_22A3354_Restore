@implementation EffectsControlsViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("ConversationKit.EffectsControlsViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("ConversationKit.EffectsControlsViewController"), CFSTR("effectsButtonIsVisible"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("ConversationKit.EffectsControlsViewController"), CFSTR("effectsButton"), "@", 0);

}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  _QWORD v4[4];
  id v5;
  id location;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)EffectsControlsViewControllerAccessibility;
  -[EffectsControlsViewControllerAccessibility _accessibilityLoadAccessibilityInformation](&v7, sel__accessibilityLoadAccessibilityInformation);
  -[EffectsControlsViewControllerAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("effectsButton"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __88__EffectsControlsViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke;
  v4[3] = &unk_2501E5B80;
  objc_copyWeak(&v5, &location);
  objc_msgSend(v3, "_setIsAccessibilityElementBlock:", v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);

}

uint64_t __88__EffectsControlsViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1)
{
  id WeakRetained;
  uint64_t v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = objc_msgSend(WeakRetained, "safeBoolForKey:", CFSTR("effectsButtonIsVisible"));

  return v2;
}

@end
