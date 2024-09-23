@implementation AXWeatherGlue

+ (void)accessibilityInitializeBundle
{
  if (accessibilityInitializeBundle_onceToken != -1)
    dispatch_once(&accessibilityInitializeBundle_onceToken, &__block_literal_global_0);
}

void __46__AXWeatherGlue_accessibilityInitializeBundle__block_invoke()
{
  id v0;

  objc_msgSend(MEMORY[0x24BDFE4F8], "sharedInstance");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "performValidations:withPreValidationHandler:postValidationHandler:safeCategoryInstallationHandler:", &__block_literal_global_177, &__block_literal_global_182, 0, &__block_literal_global_188);

}

uint64_t __46__AXWeatherGlue_accessibilityInitializeBundle__block_invoke_2(uint64_t a1, void *a2)
{
  objc_msgSend(a2, "validateClass:isKindOfClass:", CFSTR("MKMapView"), CFSTR("UIView"));
  return 1;
}

uint64_t __46__AXWeatherGlue_accessibilityInitializeBundle__block_invoke_3(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "setOverrideProcessName:", CFSTR("Weather App"));
  objc_msgSend(v2, "setValidationTargetName:", CFSTR("Weather Accessibility Bundle"));

  return AXPerformValidationChecks();
}

uint64_t __46__AXWeatherGlue_accessibilityInitializeBundle__block_invoke_4(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("MKMapViewAccessibility__Weather__MapKit"), 1);
}

@end
