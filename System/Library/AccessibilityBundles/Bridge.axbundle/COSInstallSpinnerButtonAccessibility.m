@implementation COSInstallSpinnerButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("COSInstallSpinnerButton");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("COSInstallSpinnerButton"), CFSTR("_progressIndicator"), "SKUICircleProgressIndicator");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("COSInstallSpinnerButton"), CFSTR("_showingSpinner"), "B");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("COSInstallSpinnerButton"), CFSTR("showProgressAnimation"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("COSInstallSpinnerButton"), CFSTR("stopSpinnerView"), "v", 0);

}

- (unint64_t)accessibilityTraits
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)COSInstallSpinnerButtonAccessibility;
  return *MEMORY[0x24BDF7430] | -[COSInstallSpinnerButtonAccessibility accessibilityTraits](&v3, sel_accessibilityTraits);
}

- (id)accessibilityValue
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;
  char v8;

  if (-[COSInstallSpinnerButtonAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("_showingSpinner")))
  {
    v8 = 0;
    objc_opt_class();
    -[COSInstallSpinnerButtonAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_progressIndicator"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAccessibilityCastAsClass();
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "progress");
    AXFormatFloatWithPercentage();
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)COSInstallSpinnerButtonAccessibility;
    -[COSInstallSpinnerButtonAccessibility accessibilityValue](&v7, sel_accessibilityValue);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (void)showProgressAnimation
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)COSInstallSpinnerButtonAccessibility;
  -[COSInstallSpinnerButtonAccessibility showProgressAnimation](&v2, sel_showProgressAnimation);
  AXPerformBlockOnMainThreadAfterDelay();
}

void __61__COSInstallSpinnerButtonAccessibility_showProgressAnimation__block_invoke(uint64_t a1)
{
  UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], *(id *)(a1 + 32));
}

- (void)stopSpinnerView
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)COSInstallSpinnerButtonAccessibility;
  -[COSInstallSpinnerButtonAccessibility stopSpinnerView](&v2, sel_stopSpinnerView);
  UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], 0);
}

- (id)accessibilityLabel
{
  void *v3;
  objc_super v5;

  if (-[COSInstallSpinnerButtonAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("_showingSpinner")))
  {
    accessibilityLocalizedString(CFSTR("downloading.spinner.button.label"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)COSInstallSpinnerButtonAccessibility;
    -[COSInstallSpinnerButtonAccessibility accessibilityLabel](&v5, sel_accessibilityLabel);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

@end
