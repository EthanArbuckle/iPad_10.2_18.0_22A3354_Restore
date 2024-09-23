@implementation CKTranscriptActionButtonCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CKTranscriptActionButtonCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKTranscriptActionButtonCell"), CFSTR("cellView"), "@", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  id (*v8)(uint64_t);
  void *v9;
  id v10;
  id location;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)CKTranscriptActionButtonCellAccessibility;
  -[CKTranscriptActionButtonCellAccessibility _accessibilityLoadAccessibilityInformation](&v12, sel__accessibilityLoadAccessibilityInformation);
  LOBYTE(location) = 0;
  objc_opt_class();
  -[CKTranscriptActionButtonCellAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("cellView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setAccessibilityTraits:", *MEMORY[0x24BDF73B0]);
  objc_initWeak(&location, v4);
  v6 = MEMORY[0x24BDAC760];
  v7 = 3221225472;
  v8 = __87__CKTranscriptActionButtonCellAccessibility__accessibilityLoadAccessibilityInformation__block_invoke;
  v9 = &unk_2501B1D30;
  objc_copyWeak(&v10, &location);
  objc_msgSend(v4, "_setAccessibilityValueBlock:", &v6);
  accessibilityLocalizedString(CFSTR("grid.view.button"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAccessibilityLabel:", v5, v6, v7, v8, v9);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);

}

id __87__CKTranscriptActionButtonCellAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "titleLabel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "text");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
