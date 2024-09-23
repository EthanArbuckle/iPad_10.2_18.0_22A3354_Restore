@implementation MailTrackingProtectionOnboardingViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("MailTrackingProtectionOnboardingViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MailTrackingProtectionOnboardingViewController"), CFSTR("_configureCell:viewModel:"), "v", "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MailTrackingProtectionOnboardingViewController"), CFSTR("collectionView"), "@", 0);

}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  objc_super v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v14.receiver = self;
  v14.super_class = (Class)MailTrackingProtectionOnboardingViewControllerAccessibility;
  -[MailTrackingProtectionOnboardingViewControllerAccessibility _accessibilityLoadAccessibilityInformation](&v14, sel__accessibilityLoadAccessibilityInformation);
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  objc_opt_class();
  -[MailTrackingProtectionOnboardingViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("collectionView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "visibleCells");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * i), "_setAccessibilityAdditionalTraitsBlock:", &__block_literal_global_0);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v15, 16);
    }
    while (v7);
  }

}

uint64_t __105__MailTrackingProtectionOnboardingViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke()
{
  return *MEMORY[0x24BDF73B0];
}

- (void)_configureCell:(id)a3 viewModel:(id)a4
{
  id v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MailTrackingProtectionOnboardingViewControllerAccessibility;
  v5 = a3;
  -[MailTrackingProtectionOnboardingViewControllerAccessibility _configureCell:viewModel:](&v6, sel__configureCell_viewModel_, v5, a4);
  objc_msgSend(v5, "_setAccessibilityAdditionalTraitsBlock:", &__block_literal_global_191, v6.receiver, v6.super_class);

}

uint64_t __88__MailTrackingProtectionOnboardingViewControllerAccessibility__configureCell_viewModel___block_invoke()
{
  return *MEMORY[0x24BDF73B0];
}

@end
