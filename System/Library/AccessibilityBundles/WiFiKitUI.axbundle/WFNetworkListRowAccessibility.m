@implementation WFNetworkListRowAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("WFNetworkListRow");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("WFNetworkListRow"), CFSTR("config"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("WFNetworkRowConfig"), CFSTR("network"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("WFNetworkRowConfig"), CFSTR("connectionState"), "q", 0);
  objc_msgSend(v3, "validateProtocol:hasRequiredInstanceMethod:", CFSTR("WFNetworkListRecord"), CFSTR("title"));
  objc_msgSend(v3, "validateProtocol:hasRequiredInstanceMethod:", CFSTR("WFNetworkListRecord"), CFSTR("subtitle"));
  objc_msgSend(v3, "validateProtocol:hasRequiredInstanceMethod:", CFSTR("WFNetworkListRecord"), CFSTR("isSecure"));
  objc_msgSend(v3, "validateProtocol:hasRequiredInstanceMethod:", CFSTR("WFNetworkListRecord"), CFSTR("isInstantHotspot"));
  objc_msgSend(v3, "validateProtocol:hasRequiredInstanceMethod:", CFSTR("WFNetworkListRecord"), CFSTR("signalBars"));

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  unint64_t v3;
  int64_t v4;
  uint64_t v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)WFNetworkListRowAccessibility;
  v3 = -[WFNetworkListRowAccessibility accessibilityTraits](&v7, sel_accessibilityTraits);
  v4 = -[WFNetworkListRowAccessibility _axNetworkState](self, "_axNetworkState");
  v5 = *MEMORY[0x24BDF7400];
  if (v4 != 2)
    v5 = 0;
  return v5 | v3;
}

- (id)_axNetwork
{
  return (id)-[WFNetworkListRowAccessibility safeValueForKeyPath:](self, "safeValueForKeyPath:", CFSTR("config.network"));
}

- (int64_t)_axNetworkState
{
  void *v2;
  int64_t v3;

  -[WFNetworkListRowAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("config"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "safeIntegerForKey:", CFSTR("connectionState"));

  return v3;
}

- (id)accessibilityLabel
{
  int64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  int v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  __CFString *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v24;

  v3 = -[WFNetworkListRowAccessibility _axNetworkState](self, "_axNetworkState");
  -[WFNetworkListRowAccessibility _axNetwork](self, "_axNetwork");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "safeValueForKey:", CFSTR("title"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[WFNetworkListRowAccessibility _axNetwork](self, "_axNetwork");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "safeValueForKey:", CFSTR("subtitle"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[WFNetworkListRowAccessibility _axNetwork](self, "_axNetwork");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "safeBoolForKey:", CFSTR("isSecure"));

  -[WFNetworkListRowAccessibility _axNetwork](self, "_axNetwork");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "safeBoolForKey:", CFSTR("isInstantHotspot"));

  -[WFNetworkListRowAccessibility _axNetwork](self, "_axNetwork");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "safeUnsignedIntegerForKey:", CFSTR("signalBars"));

  v14 = (void *)MEMORY[0x24BDD17C8];
  accessibilityLocalizedString(CFSTR("wifi.strength"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v13);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "stringWithFormat:", v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
    v18 = CFSTR("is.secure");
  else
    v18 = CFSTR("not.secure");
  accessibilityLocalizedString(v18);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAXStringForVariables();
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3 == 1)
  {
    accessibilityLocalizedString(CFSTR("connecting"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v11)
    {
LABEL_6:
      v21 = 0;
      goto LABEL_9;
    }
  }
  else
  {
    v20 = 0;
    if (!v11)
      goto LABEL_6;
  }
  accessibilityLocalizedString(CFSTR("personal.hotspot"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_9:
  __UIAXStringForVariables();
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  if (v3 == 1)

  return v22;
}

@end
