@implementation SFContactAutoFillTableViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SFContactAutoFillTableViewCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SFContactAutoFillTableViewCell"), CFSTR("checked"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SFContactAutoFillTableViewCell"), CFSTR("checkmarkButtonTapped:"), "v", "@", 0);

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (void)_accessibilityLoadAccessibilityInformation
{
  id v3;
  _QWORD v4[4];
  id v5[2];
  id location;
  objc_super v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SFContactAutoFillTableViewCellAccessibility;
  -[SFContactAutoFillTableViewCellAccessibility _accessibilityLoadAccessibilityInformation](&v8, sel__accessibilityLoadAccessibilityInformation);
  v7.receiver = self;
  v7.super_class = (Class)SFContactAutoFillTableViewCellAccessibility;
  v3 = -[SFContactAutoFillTableViewCellAccessibility accessibilityTraits](&v7, sel_accessibilityTraits);
  objc_initWeak(&location, self);
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __89__SFContactAutoFillTableViewCellAccessibility__accessibilityLoadAccessibilityInformation__block_invoke;
  v4[3] = &unk_25032D5F0;
  v5[1] = v3;
  objc_copyWeak(v5, &location);
  -[SFContactAutoFillTableViewCellAccessibility _setAccessibilityTraitsBlock:](self, "_setAccessibilityTraitsBlock:", v4);
  objc_destroyWeak(v5);
  objc_destroyWeak(&location);
}

uint64_t __89__SFContactAutoFillTableViewCellAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1)
{
  uint64_t v1;
  id WeakRetained;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v1 = *(_QWORD *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = objc_msgSend(WeakRetained, "safeBoolForKey:", CFSTR("checked"));
  v4 = *MEMORY[0x24BDF7400];
  if (!v3)
    v4 = 0;
  v5 = v4 | v1;

  return v5;
}

- (BOOL)accessibilityActivate
{
  AXPerformSafeBlock();
  return 1;
}

uint64_t __68__SFContactAutoFillTableViewCellAccessibility_accessibilityActivate__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "checkmarkButtonTapped:", 0);
}

@end
