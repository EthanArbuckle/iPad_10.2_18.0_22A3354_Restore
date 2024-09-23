@implementation WFNetworkListCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("WFNetworkListCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateProtocol:hasRequiredInstanceMethod:", CFSTR("WFNetworkCell"), CFSTR("title"));
  objc_msgSend(v3, "validateProtocol:hasRequiredInstanceMethod:", CFSTR("WFNetworkCell"), CFSTR("subtitle"));
  objc_msgSend(v3, "validateProtocol:hasRequiredInstanceMethod:", CFSTR("WFNetworkCell"), CFSTR("secure"));
  objc_msgSend(v3, "validateProtocol:hasRequiredInstanceMethod:", CFSTR("WFNetworkCell"), CFSTR("bars"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("WFNetworkListCell"), CFSTR("personalHotspot"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("WFAssociationStateView"), CFSTR("state"), "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("WFNetworkListCell"), CFSTR("associationStateView"), "@", 0);

}

- (unint64_t)accessibilityTraits
{
  unint64_t v3;
  int64_t v4;
  uint64_t v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)WFNetworkListCellAccessibility;
  v3 = -[WFNetworkListCellAccessibility accessibilityTraits](&v7, sel_accessibilityTraits);
  v4 = -[WFNetworkListCellAccessibility _axNetworkState](self, "_axNetworkState");
  v5 = *MEMORY[0x24BDF7400];
  if (v4 != 2)
    v5 = 0;
  return v5 | v3;
}

- (int64_t)_axNetworkState
{
  void *v2;
  int64_t v3;

  -[WFNetworkListCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("associationStateView"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "safeIntegerForKey:", CFSTR("state"));

  return v3;
}

- (id)accessibilityLabel
{
  int64_t v3;
  void *v4;
  void *v5;
  int v6;
  int v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  __CFString *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v19;

  v3 = -[WFNetworkListCellAccessibility _axNetworkState](self, "_axNetworkState");
  -[WFNetworkListCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("title"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFNetworkListCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("subtitle"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[WFNetworkListCellAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("secure"));
  v7 = -[WFNetworkListCellAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("personalHotspot"));
  v8 = -[WFNetworkListCellAccessibility safeUnsignedIntegerForKey:](self, "safeUnsignedIntegerForKey:", CFSTR("bars"));
  v9 = (void *)MEMORY[0x24BDD17C8];
  accessibilityLocalizedString(CFSTR("wifi.strength"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringWithFormat:", v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    v13 = CFSTR("is.secure");
  else
    v13 = CFSTR("not.secure");
  accessibilityLocalizedString(v13);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAXStringForVariables();
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3 == 1)
  {
    accessibilityLocalizedString(CFSTR("connecting"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v7)
    {
LABEL_6:
      v16 = 0;
      goto LABEL_9;
    }
  }
  else
  {
    v15 = 0;
    if (!v7)
      goto LABEL_6;
  }
  accessibilityLocalizedString(CFSTR("personal.hotspot"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_9:
  __UIAXStringForVariables();
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  if (v3 == 1)

  return v17;
}

@end
