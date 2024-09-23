@implementation HUGridActionSetCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("HUGridActionSetCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HUGridActionSetCell"), CFSTR("titleAndDescriptionView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HUGridActionSetTitleAndDescriptionView"), CFSTR("titleLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HUGridActionSetTitleAndDescriptionView"), CFSTR("descriptionLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HUGridActionSetCell"), CFSTR("iconView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HUIconView"), CFSTR("displayStyle"), "Q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HUIconView"), CFSTR("iconDescriptor"), "@", 0);
  objc_msgSend(v3, "validateProtocol:hasRequiredInstanceMethod:", CFSTR("HFIconDescriptor"), CFSTR("identifier"));
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("HUGridActionSetCell"), CFSTR("HIGridCell"));
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("HUGridActionSetPlaceholderCell"), CFSTR("HUGridActionSetCell"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HUGridCellAccessibility"), CFSTR("_axIsActiveGridCell"), "B", 0);

}

- (id)accessibilityLabel
{
  void *v2;
  void *v3;
  void *v4;
  void *v6;

  -[HUGridActionSetCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("titleAndDescriptionView"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safeValueForKey:", CFSTR("titleLabel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safeValueForKey:", CFSTR("descriptionLabel"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  __AXStringForVariables();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)accessibilityIdentifier
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  -[HUGridActionSetCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("iconView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "safeIntegerForKey:", CFSTR("displayStyle"));

  v5 = (void *)MEMORY[0x24BDD17C8];
  -[HUGridActionSetCellAccessibility safeValueForKeyPath:](self, "safeValueForKeyPath:", CFSTR("titleAndDescriptionView.titleLabel.text"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUGridActionSetCellAccessibility safeValueForKeyPath:](self, "safeValueForKeyPath:", CFSTR("iconView.iconDescriptor.identifier"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%@, %@, %ld"), v6, v7, v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (BOOL)_axIsActiveGridCell
{
  MEMORY[0x234911848](CFSTR("HUGridActionSetPlaceholderCell"), a2);
  return (objc_opt_isKindOfClass() & 1) == 0;
}

@end
