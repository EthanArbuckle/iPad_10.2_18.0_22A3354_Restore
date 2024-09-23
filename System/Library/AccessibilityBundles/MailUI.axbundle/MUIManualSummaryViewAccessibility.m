@implementation MUIManualSummaryViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("MUIManualSummaryView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasSwiftField:withSwiftType:", CFSTR("MUIManualSummaryView"), CFSTR("button"), "UIButton");
  objc_msgSend(v3, "validateClass:hasSwiftField:withSwiftType:", CFSTR("MUIManualSummaryView"), CFSTR("viewModel"), "Optional<Model>");
  objc_msgSend(v3, "validateClass:hasSwiftField:withSwiftType:", CFSTR("MUIManualSummaryView"), CFSTR("showSummaryButtonTitle"), "String");
  objc_msgSend(v3, "validateClass:hasSwiftField:withSwiftType:", CFSTR("MUIManualSummaryView"), CFSTR("titleLabel"), "UILabel");

}

- (void)_accessibilityLoadAccessibilityInformation
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MUIManualSummaryViewAccessibility;
  -[MUIManualSummaryViewAccessibility _accessibilityLoadAccessibilityInformation](&v3, sel__accessibilityLoadAccessibilityInformation);
  -[MUIManualSummaryViewAccessibility _axSummaryButtonLabel](self, "_axSummaryButtonLabel");
  -[MUIManualSummaryViewAccessibility _axSummaryHeaderTrait](self, "_axSummaryHeaderTrait");
}

- (void)_axSummaryHeaderTrait
{
  void *v3;
  _QWORD v4[4];
  id v5;
  id location;

  -[MUIManualSummaryViewAccessibility safeSwiftValueForKey:](self, "safeSwiftValueForKey:", CFSTR("titleLabel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __58__MUIManualSummaryViewAccessibility__axSummaryHeaderTrait__block_invoke;
  v4[3] = &unk_25024F6E8;
  objc_copyWeak(&v5, &location);
  objc_msgSend(v3, "setAccessibilityTraitsBlock:", v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);

}

uint64_t __58__MUIManualSummaryViewAccessibility__axSummaryHeaderTrait__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;
  void *v4;
  int v5;
  uint64_t *v6;
  uint64_t v7;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "safeSwiftValueForKey:", CFSTR("viewModel"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safeSwiftValueForKey:", CFSTR("state"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeSwiftEnumCase");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("initial"));
  v6 = (uint64_t *)MEMORY[0x24BDF73C0];
  if (!v5)
    v6 = (uint64_t *)MEMORY[0x24BDF7410];
  v7 = *v6;

  return v7;
}

- (BOOL)isAccessibilityElement
{
  void *v2;
  void *v3;
  void *v4;

  -[MUIManualSummaryViewAccessibility safeSwiftValueForKey:](self, "safeSwiftValueForKey:", CFSTR("viewModel"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safeSwiftValueForKey:", CFSTR("state"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeSwiftEnumCase");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v2) = objc_msgSend(v4, "isEqualToString:", CFSTR("initial"));
  return (char)v2;
}

- (id)accessibilityLabel
{
  void *v2;
  void *v3;

  -[MUIManualSummaryViewAccessibility safeSwiftValueForKey:](self, "safeSwiftValueForKey:", CFSTR("button"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessibilityLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)accessibilityValue
{
  void *v2;
  void *v3;

  -[MUIManualSummaryViewAccessibility safeSwiftValueForKey:](self, "safeSwiftValueForKey:", CFSTR("titleLabel"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessibilityLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x24BDF73B0];
}

- (CGPoint)accessibilityActivationPoint
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGPoint result;

  -[MUIManualSummaryViewAccessibility safeSwiftValueForKey:](self, "safeSwiftValueForKey:", CFSTR("button"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessibilityActivationPoint");
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.y = v8;
  result.x = v7;
  return result;
}

- (void)_axSummaryButtonLabel
{
  void *v3;
  _QWORD v4[4];
  id v5;
  id location;

  -[MUIManualSummaryViewAccessibility safeSwiftValueForKey:](self, "safeSwiftValueForKey:", CFSTR("button"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __58__MUIManualSummaryViewAccessibility__axSummaryButtonLabel__block_invoke;
  v4[3] = &unk_25024F710;
  objc_copyWeak(&v5, &location);
  objc_msgSend(v3, "setAccessibilityLabelBlock:", v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);

}

id __58__MUIManualSummaryViewAccessibility__axSummaryButtonLabel__block_invoke(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  __CFString *v8;

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "safeSwiftValueForKey:", CFSTR("viewModel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeSwiftValueForKey:", CFSTR("state"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "safeSwiftEnumCase");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "isEqualToString:", CFSTR("initial")))
  {
    v6 = objc_loadWeakRetained(v1);
    objc_msgSend(v6, "safeSwiftValueForKey:", CFSTR("showSummaryButtonTitle"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    if (objc_msgSend(v5, "isEqualToString:", CFSTR("loading")))
      v8 = CFSTR("summary.state.loading");
    else
      v8 = CFSTR("summary.state.complete");
    accessibilityLocalizedString(v8);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

@end
