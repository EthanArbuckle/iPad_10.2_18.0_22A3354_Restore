@implementation AXNearbyGlue

+ (void)accessibilityInitializeBundle
{
  if (accessibilityInitializeBundle_onceToken_0 != -1)
    dispatch_once(&accessibilityInitializeBundle_onceToken_0, &__block_literal_global_0);
}

void __45__AXNearbyGlue_accessibilityInitializeBundle__block_invoke()
{
  id v0;

  objc_msgSend(MEMORY[0x24BE00758], "sharedInstance");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "performValidations:withPreValidationHandler:postValidationHandler:safeCategoryInstallationHandler:", &__block_literal_global_177, &__block_literal_global_178, 0, &__block_literal_global_184);

}

uint64_t __45__AXNearbyGlue_accessibilityInitializeBundle__block_invoke_2()
{
  return 1;
}

uint64_t __45__AXNearbyGlue_accessibilityInitializeBundle__block_invoke_3(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "setOverrideProcessName:", CFSTR("Nearby"));
  objc_msgSend(v2, "setValidationTargetName:", CFSTR("Nearby Accessibility Bundle"));

  return AXPerformValidationChecks();
}

uint64_t __45__AXNearbyGlue_accessibilityInitializeBundle__block_invoke_4(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("NUIContainerStackViewAccessibility"), 1);
}

@end
