@implementation ReviewSummaryViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("Arcade.ReviewSummaryView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:isKindOfClass:", CFSTR("AppStoreKit.DynamicTypeLabel"), CFSTR("UILabel"));
}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  _QWORD v4[4];
  id v5;
  id location;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)ReviewSummaryViewAccessibility;
  -[ReviewSummaryViewAccessibility _accessibilityLoadAccessibilityInformation](&v7, sel__accessibilityLoadAccessibilityInformation);
  -[ReviewSummaryViewAccessibility safeSwiftValueForKey:](self, "safeSwiftValueForKey:", CFSTR("subtitleLabel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, v3);
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __76__ReviewSummaryViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke;
  v4[3] = &unk_25016E928;
  objc_copyWeak(&v5, &location);
  objc_msgSend(v3, "setAccessibilityLabelBlock:", v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);

}

id __76__ReviewSummaryViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "safeValueForKey:", CFSTR("attributedText"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(v2, "string");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

@end
