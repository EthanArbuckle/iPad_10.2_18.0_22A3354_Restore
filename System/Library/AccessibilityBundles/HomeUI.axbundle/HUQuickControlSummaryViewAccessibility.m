@implementation HUQuickControlSummaryViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("HUQuickControlSummaryView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HUQuickControlSummaryView"), CFSTR("primaryLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HUQuickControlSummaryView"), CFSTR("secondaryLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HUQuickControlSummaryView"), CFSTR("iconView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HUQuickControlSummaryView"), CFSTR("setPrimaryText:"), "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HUQuickControlSummaryView"), CFSTR("setSecondaryText:"), "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HUIconView"), CFSTR("iconDescriptor"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HUQuickControlSummaryView"), CFSTR("primaryText"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HUQuickControlSummaryView"), CFSTR("secondaryText"), "@", 0);

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  id v10;
  void *v11;

  -[HUQuickControlSummaryViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("iconView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "accessibilityLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[HUQuickControlSummaryViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("primaryLabel"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "accessibilityLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "lowercaseString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "lowercaseString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "isEqualToString:", v8);

  if (v9)
  {
    v10 = v4;
  }
  else
  {
    __UIAXStringForVariables();
    v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  v11 = v10;

  return v11;
}

- (id)accessibilityValue
{
  void *v2;
  void *v3;

  -[HUQuickControlSummaryViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("secondaryLabel"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessibilityLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (unint64_t)accessibilityTraits
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HUQuickControlSummaryViewAccessibility;
  return *MEMORY[0x24BDF73C0] | -[HUQuickControlSummaryViewAccessibility accessibilityTraits](&v3, sel_accessibilityTraits);
}

- (void)setPrimaryText:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)HUQuickControlSummaryViewAccessibility;
  -[HUQuickControlSummaryViewAccessibility setPrimaryText:](&v9, sel_setPrimaryText_, a3);
  v4 = (void *)MEMORY[0x24BDD17C8];
  -[HUQuickControlSummaryViewAccessibility safeValueForKeyPath:](self, "safeValueForKeyPath:", CFSTR("iconView.iconDescriptor.identifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUQuickControlSummaryViewAccessibility safeValueForKeyPath:](self, "safeValueForKeyPath:", CFSTR("primaryText"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUQuickControlSummaryViewAccessibility safeValueForKeyPath:](self, "safeValueForKeyPath:", CFSTR("secondaryText"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@, %@, %@"), v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUQuickControlSummaryViewAccessibility setAccessibilityIdentifier:](self, "setAccessibilityIdentifier:", v8);

}

- (void)setSecondaryText:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)HUQuickControlSummaryViewAccessibility;
  -[HUQuickControlSummaryViewAccessibility setSecondaryText:](&v9, sel_setSecondaryText_, a3);
  v4 = (void *)MEMORY[0x24BDD17C8];
  -[HUQuickControlSummaryViewAccessibility safeValueForKeyPath:](self, "safeValueForKeyPath:", CFSTR("iconView.iconDescriptor.identifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUQuickControlSummaryViewAccessibility safeValueForKeyPath:](self, "safeValueForKeyPath:", CFSTR("primaryText"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUQuickControlSummaryViewAccessibility safeValueForKeyPath:](self, "safeValueForKeyPath:", CFSTR("secondaryText"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@, %@, %@"), v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUQuickControlSummaryViewAccessibility setAccessibilityIdentifier:](self, "setAccessibilityIdentifier:", v8);

}

@end
