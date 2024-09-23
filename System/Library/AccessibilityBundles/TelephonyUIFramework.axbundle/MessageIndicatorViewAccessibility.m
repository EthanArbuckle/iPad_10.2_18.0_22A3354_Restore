@implementation MessageIndicatorViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("TelephonyUI.MessageIndicatorView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasSwiftField:withSwiftType:", CFSTR("TelephonyUI.MessageIndicatorView"), CFSTR("recordImageView"), "UIImageView");
  objc_msgSend(v3, "validateClass:hasSwiftField:withSwiftType:", CFSTR("TelephonyUI.MessageIndicatorView"), CFSTR("viewModel"), "TPMessageIndicatorViewModel");
  objc_msgSend(v3, "validateClass:hasProperty:withType:", CFSTR("TPMessageIndicatorViewModel"), CFSTR("isSensitive"), "B");
  objc_msgSend(v3, "validateClass:hasProperty:withType:", CFSTR("TPMessageIndicatorViewModel"), CFSTR("isRead"), "B");

}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;
  _QWORD v7[4];
  id v8;
  id location;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)MessageIndicatorViewAccessibility;
  -[MessageIndicatorViewAccessibility _accessibilityLoadAccessibilityInformation](&v10, sel__accessibilityLoadAccessibilityInformation);
  -[MessageIndicatorViewAccessibility safeSwiftValueForKey:](self, "safeSwiftValueForKey:", CFSTR("recordImageView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  v4 = MEMORY[0x24BDAC760];
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __79__MessageIndicatorViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke;
  v7[3] = &unk_2503B0A10;
  objc_copyWeak(&v8, &location);
  objc_msgSend(v3, "setAccessibilityIdentifierBlock:", v7);
  v5[0] = v4;
  v5[1] = 3221225472;
  v5[2] = __79__MessageIndicatorViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_2;
  v5[3] = &unk_2503B0A10;
  objc_copyWeak(&v6, &location);
  objc_msgSend(v3, "setAccessibilityLabelBlock:", v5);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);

}

const __CFString *__79__MessageIndicatorViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  const __CFString *v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "safeSwiftValueForKey:", CFSTR("viewModel"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v2, "safeBoolForKey:", CFSTR("isSensitive")) & 1) != 0)
  {
    v3 = CFSTR("TelephonyUI.MessageIndicatorView.sensitive");
  }
  else if (objc_msgSend(v2, "safeBoolForKey:", CFSTR("isRead")))
  {
    v3 = CFSTR("TelephonyUI.MessageIndicatorView.play");
  }
  else
  {
    v3 = CFSTR("TelephonyUI.MessageIndicatorView.unread");
  }

  return v3;
}

id __79__MessageIndicatorViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  __CFString *v3;
  void *v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "safeSwiftValueForKey:", CFSTR("viewModel"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v2, "safeBoolForKey:", CFSTR("isSensitive")) & 1) != 0)
  {
    v3 = CFSTR("indicator.sensitive");
LABEL_6:
    accessibilityLocalizedString(v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  if ((objc_msgSend(v2, "safeBoolForKey:", CFSTR("isRead")) & 1) == 0)
  {
    v3 = CFSTR("indicator.unread");
    goto LABEL_6;
  }
  v4 = 0;
LABEL_7:

  return v4;
}

@end
