@implementation SeymourUI_ModalityBrickItemCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SeymourUI.ModalityBrickItemCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasSwiftField:withSwiftType:", CFSTR("SeymourUI.ModalityBrickItemCell"), CFSTR("titleLabel"), "UILabel");
  objc_msgSend(v3, "validateClass:hasSwiftField:withSwiftType:", CFSTR("SeymourUI.ModalityBrickItemCell"), CFSTR("iconView"), "ActivityTypeIconView");
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("SeymourUI.ActivityTypeIconView"), CFSTR("UIView"));

}

- (id)accessibilityLabel
{
  void *v2;
  void *v3;

  -[SeymourUI_ModalityBrickItemCellAccessibility safeSwiftValueForKey:](self, "safeSwiftValueForKey:", CFSTR("titleLabel"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessibilityLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SeymourUI_ModalityBrickItemCellAccessibility;
  return *MEMORY[0x24BDF73B0] | -[SeymourUI_ModalityBrickItemCellAccessibility accessibilityTraits](&v3, sel_accessibilityTraits);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  _QWORD v12[4];
  id v13;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)SeymourUI_ModalityBrickItemCellAccessibility;
  -[SeymourUI_ModalityBrickItemCellAccessibility _accessibilityLoadAccessibilityInformation](&v14, sel__accessibilityLoadAccessibilityInformation);
  -[SeymourUI_ModalityBrickItemCellAccessibility safeSwiftValueForKey:](self, "safeSwiftValueForKey:", CFSTR("titleLabel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SeymourUI_ModalityBrickItemCellAccessibility safeSwiftValueForKey:](self, "safeSwiftValueForKey:", CFSTR("iconView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SeymourUI_ModalityBrickItemCellAccessibility safeSwiftValueForKey:](self, "safeSwiftValueForKey:", CFSTR("titleLabel"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "accessibilityLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = MEMORY[0x24BDAC760];
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __90__SeymourUI_ModalityBrickItemCellAccessibility__accessibilityLoadAccessibilityInformation__block_invoke;
  v12[3] = &unk_2503482F8;
  v8 = v6;
  v13 = v8;
  objc_msgSend(v3, "_setAccessibilityIdentifierBlock:", v12);
  v10[0] = v7;
  v10[1] = 3221225472;
  v10[2] = __90__SeymourUI_ModalityBrickItemCellAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_2;
  v10[3] = &unk_2503482F8;
  v11 = v8;
  v9 = v8;
  objc_msgSend(v4, "_setAccessibilityIdentifierBlock:", v10);

}

@end
