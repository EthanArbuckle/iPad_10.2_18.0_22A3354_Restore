@implementation WFTextFieldCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("WFTextFieldCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("WFTextFieldCell"), CFSTR("label"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("WFTextFieldCell"), CFSTR("textField"), "@", 0);

}

- (void)awakeFromNib
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)WFTextFieldCellAccessibility;
  -[WFTextFieldCellAccessibility awakeFromNib](&v3, sel_awakeFromNib);
  -[WFTextFieldCellAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  _QWORD v5[4];
  id v6;
  id location;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)WFTextFieldCellAccessibility;
  -[WFTextFieldCellAccessibility _accessibilityLoadAccessibilityInformation](&v8, sel__accessibilityLoadAccessibilityInformation);
  -[WFTextFieldCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("label"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setIsAccessibilityElement:", 0);

  objc_initWeak(&location, self);
  -[WFTextFieldCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("textField"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __74__WFTextFieldCellAccessibility__accessibilityLoadAccessibilityInformation__block_invoke;
  v5[3] = &unk_2503E6A80;
  objc_copyWeak(&v6, &location);
  objc_msgSend(v4, "_setAccessibilityLabelBlock:", v5);

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

id __74__WFTextFieldCellAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "label");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessibilityLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
