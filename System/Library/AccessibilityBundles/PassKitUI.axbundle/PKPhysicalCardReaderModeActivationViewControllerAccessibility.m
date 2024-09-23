@implementation PKPhysicalCardReaderModeActivationViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PKPhysicalCardReaderModeActivationViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("PKPhysicalCardReaderModeActivationViewController"), CFSTR("PKExplanationViewController"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PKExplanationViewController"), CFSTR("explanationView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PKPhysicalCardReaderModeActivationViewController"), CFSTR("viewDidLoad"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PKExplanationView"), CFSTR("bodyTextView"), "@", 0);

}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  id location;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PKPhysicalCardReaderModeActivationViewControllerAccessibility;
  -[PKPhysicalCardReaderModeActivationViewControllerAccessibility _accessibilityLoadAccessibilityInformation](&v9, sel__accessibilityLoadAccessibilityInformation);
  LOBYTE(location) = 0;
  objc_opt_class();
  -[PKPhysicalCardReaderModeActivationViewControllerAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("explanationView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeValueForKey:", CFSTR("bodyTextView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_initWeak(&location, v5);
  objc_msgSend(v5, "setIsAccessibilityElement:", 1);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __107__PKPhysicalCardReaderModeActivationViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke;
  v6[3] = &unk_2502E3938;
  objc_copyWeak(&v7, &location);
  objc_msgSend(v5, "_setAccessibilityValueBlock:", v6);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);

}

id __107__PKPhysicalCardReaderModeActivationViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  if (AXRequestingClient() == 3)
  {
    accessibilityLocalizedString(CFSTR("voiceover.physical.card.instructions"));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    objc_msgSend(WeakRetained, "text");
    v2 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v2;
}

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PKPhysicalCardReaderModeActivationViewControllerAccessibility;
  -[PKPhysicalCardReaderModeActivationViewControllerAccessibility viewDidLoad](&v3, sel_viewDidLoad);
  -[PKPhysicalCardReaderModeActivationViewControllerAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

@end
