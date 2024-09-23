@implementation SBActivityAmbientViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SBActivityAmbientViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBActivityAmbientViewController"), CFSTR("fullOverlayViewController"), "@", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  _QWORD v4[5];
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SBActivityAmbientViewControllerAccessibility;
  -[SBActivityAmbientViewControllerAccessibility _accessibilityLoadAccessibilityInformation](&v5, sel__accessibilityLoadAccessibilityInformation);
  -[SBActivityAmbientViewControllerAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("view"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __90__SBActivityAmbientViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke;
  v4[3] = &unk_250368220;
  v4[4] = self;
  objc_msgSend(v3, "setAccessibilityViewIsModalBlock:", v4);

}

BOOL __90__SBActivityAmbientViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1)
{
  void *v1;
  _BOOL8 v2;

  objc_msgSend(*(id *)(a1 + 32), "safeValueForKey:", CFSTR("fullOverlayViewController"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1 != 0;

  return v2;
}

@end
