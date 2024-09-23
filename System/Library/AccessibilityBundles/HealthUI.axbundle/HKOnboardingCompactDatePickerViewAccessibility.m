@implementation HKOnboardingCompactDatePickerViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("HKOnboardingCompactDatePickerView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("HKOnboardingCompactDatePickerView"), CFSTR("_initialTextLabel"), "UILabel");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HKOnboardingCompactDatePickerView"), CFSTR("_setUpInitialLabel:"), "v", "@", 0);

}

- (void)_setUpInitialLabel:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _QWORD v7[4];
  id v8;
  id location;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)HKOnboardingCompactDatePickerViewAccessibility;
  -[HKOnboardingCompactDatePickerViewAccessibility _setUpInitialLabel:](&v10, sel__setUpInitialLabel_, v4);
  LOBYTE(location) = 0;
  objc_opt_class();
  -[HKOnboardingCompactDatePickerViewAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("_initialTextLabel"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_initWeak(&location, v6);
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __69__HKOnboardingCompactDatePickerViewAccessibility__setUpInitialLabel___block_invoke;
  v7[3] = &unk_25022AC68;
  objc_copyWeak(&v8, &location);
  objc_msgSend(v6, "_setAccessibilityFrameBlock:", v7);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);

}

double __69__HKOnboardingCompactDatePickerViewAccessibility__setUpInitialLabel___block_invoke(uint64_t a1)
{
  id *v1;
  id v2;
  double v3;
  double v4;
  id WeakRetained;
  double v6;
  id v7;
  id v8;
  double v9;
  double v10;

  v1 = (id *)(a1 + 32);
  v2 = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(v2, "bounds");
  v4 = v3;
  WeakRetained = objc_loadWeakRetained(v1);
  objc_msgSend(WeakRetained, "bounds");
  objc_msgSend(v2, "sizeThatFits:", v4, v6);

  v7 = objc_loadWeakRetained(v1);
  objc_msgSend(v7, "bounds");

  v8 = objc_loadWeakRetained(v1);
  UIAccessibilityFrameForBounds();
  v10 = v9;

  return v10;
}

- (void)_accessibilityLoadAccessibilityInformation
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)HKOnboardingCompactDatePickerViewAccessibility;
  -[HKOnboardingCompactDatePickerViewAccessibility _accessibilityLoadAccessibilityInformation](&v2, sel__accessibilityLoadAccessibilityInformation);
}

@end
