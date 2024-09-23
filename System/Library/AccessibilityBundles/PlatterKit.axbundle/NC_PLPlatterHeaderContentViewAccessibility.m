@implementation NC_PLPlatterHeaderContentViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PLPlatterHeaderContentView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)_axAggregateTitleDateElement
{
  JUMPOUT(0x2349199ACLL);
}

- (void)_axSetAggregateTitleDateElement:(id)a3
{
  __UIAccessibilitySetAssociatedObject();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("PLPlatterHeaderContentView"), CFSTR("_dateLabel"), "UILabel<BSUIDateLabel>");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("PLPlatterHeaderContentView"), CFSTR("_iconButtons"), "NSArray");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("PLPlatterHeaderContentView"), CFSTR("_utilityButton"), "UIButton");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PLPlatterHeaderContentView"), CFSTR("_titleLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PLPlatterHeaderContentView"), CFSTR("setDate:"), "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PLPlatterHeaderContentView"), CFSTR("setTitle:"), "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PLPlatterHeaderContentView"), CFSTR("_configureUtilityButton"), "v", 0);

}

- (BOOL)isAccessibilityElement
{
  return 0;
}

- (id)_accessibilityTitleLabel
{
  void *v2;
  void *v3;

  -[NC_PLPlatterHeaderContentViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_titleLabel"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessibilityLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)accessibilityElements
{
  void *v3;
  AXAggregateHeaderView *v4;
  void *v5;
  void *v6;
  void *v7;
  AXAggregateHeaderView *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;

  -[NC_PLPlatterHeaderContentViewAccessibility _axAggregateTitleDateElement](self, "_axAggregateTitleDateElement");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v4 = [AXAggregateHeaderView alloc];
    -[NC_PLPlatterHeaderContentViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_iconButtons"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[NC_PLPlatterHeaderContentViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_dateLabel"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NC_PLPlatterHeaderContentViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_titleLabel"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[AXAggregateHeaderView initWithAccessibilityContainer:iconButtons:dateLabel:titleLabel:](v4, "initWithAccessibilityContainer:iconButtons:dateLabel:titleLabel:", self, v5, v6, v7);

    -[NC_PLPlatterHeaderContentViewAccessibility _axSetAggregateTitleDateElement:](self, "_axSetAggregateTitleDateElement:", v8);
  }
  -[NC_PLPlatterHeaderContentViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_utilityButton"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilitySafeClass();
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v10, "_accessibilityViewIsVisible")
    || (objc_msgSend(v10, "allTargets"),
        v11 = (void *)objc_claimAutoreleasedReturnValue(),
        v12 = objc_msgSend(v11, "count"),
        v11,
        !v12))
  {

    v10 = 0;
  }
  v13 = (void *)MEMORY[0x24BDBCE30];
  -[NC_PLPlatterHeaderContentViewAccessibility _axAggregateTitleDateElement](self, "_axAggregateTitleDateElement");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "axArrayByIgnoringNilElementsWithCount:", 2, v14, v10);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (void)_configureUtilityButton
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NC_PLPlatterHeaderContentViewAccessibility;
  -[NC_PLPlatterHeaderContentViewAccessibility _configureUtilityButton](&v3, sel__configureUtilityButton);
  -[NC_PLPlatterHeaderContentViewAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
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
  v8.super_class = (Class)NC_PLPlatterHeaderContentViewAccessibility;
  -[NC_PLPlatterHeaderContentViewAccessibility _accessibilityLoadAccessibilityInformation](&v8, sel__accessibilityLoadAccessibilityInformation);
  LOBYTE(location) = 0;
  -[NC_PLPlatterHeaderContentViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_utilityButton"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilitySafeClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_initWeak(&location, v4);
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __88__NC_PLPlatterHeaderContentViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke;
  v5[3] = &unk_2502FB980;
  objc_copyWeak(&v6, &location);
  objc_msgSend(v4, "_setAccessibilityLabelBlock:", v5);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);

}

- (void)setDate:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)NC_PLPlatterHeaderContentViewAccessibility;
  -[NC_PLPlatterHeaderContentViewAccessibility setDate:](&v4, sel_setDate_, a3);
  -[NC_PLPlatterHeaderContentViewAccessibility _axSetAggregateTitleDateElement:](self, "_axSetAggregateTitleDateElement:", 0);
}

- (void)setTitle:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)NC_PLPlatterHeaderContentViewAccessibility;
  -[NC_PLPlatterHeaderContentViewAccessibility setTitle:](&v4, sel_setTitle_, a3);
  -[NC_PLPlatterHeaderContentViewAccessibility _axSetAggregateTitleDateElement:](self, "_axSetAggregateTitleDateElement:", 0);
}

@end
