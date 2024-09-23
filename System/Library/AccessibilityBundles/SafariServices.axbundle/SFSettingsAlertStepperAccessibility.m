@implementation SFSettingsAlertStepperAccessibility

id __82___SFSettingsAlertStepperAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "safeStringForKey:", CFSTR("_text"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

uint64_t __62___SFSettingsAlertStepperAccessibility_accessibilityIncrement__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_incrementTapped:", 0);
}

uint64_t __62___SFSettingsAlertStepperAccessibility_accessibilityDecrement__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_decrementTapped:", 0);
}

@end
