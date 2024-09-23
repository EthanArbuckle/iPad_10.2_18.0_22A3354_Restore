@implementation HUIconButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("HUIconButton");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HUIconButton"), CFSTR("iconDescriptor"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HUNameAndIconEditorCell"), CFSTR("delegate"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HUNameItemModuleController"), CFSTR("supportsCustomIconEditing"), "B", 0);

}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v9;

  objc_opt_class();
  -[HUIconButtonAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("iconDescriptor"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeValueForKey:", CFSTR("identifier"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  accessibilityHomeLocalizedString(CFSTR("icon.button.label"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  accessibilityLabelForIconIdentifier((uint64_t)v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  AXCFormattedString();
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)accessibilityIdentifier
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BDD17C8];
  -[HUIconButtonAccessibility safeValueForKeyPath:](self, "safeValueForKeyPath:", CFSTR("iconDescriptor.identifier"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("IconButton: %@"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HUIconButtonAccessibility;
  return *MEMORY[0x24BDF73B0] | -[HUIconButtonAccessibility accessibilityTraits](&v3, sel_accessibilityTraits) | *MEMORY[0x24BDF73C8];
}

@end
