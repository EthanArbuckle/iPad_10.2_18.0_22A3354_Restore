@implementation AXVictoriaSettings

+ (id)accessibilityBundles
{
  return 0;
}

+ (void)accessibilityInitializeBundle
{
  uint64_t v2;
  void *v3;
  id v4;

  if (!_Failover)
  {
    v2 = objc_msgSend(objc_allocWithZone((Class)AXVictoriaSettings), "init");
    v3 = (void *)_Failover;
    _Failover = v2;

    objc_msgSend(MEMORY[0x24BE00758], "sharedInstance");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "performValidations:withPreValidationHandler:postValidationHandler:safeCategoryInstallationHandler:", &__block_literal_global, &__block_literal_global_190, &__block_literal_global_194, &__block_literal_global_196);

  }
}

uint64_t __51__AXVictoriaSettings_accessibilityInitializeBundle__block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "validateClass:isKindOfClass:", CFSTR("NikeSettingsController"), CFSTR("UIViewController"));
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("NikeSettingsController"), CFSTR("showPowerSongPicker:"), "v", "@", 0);

  return 1;
}

uint64_t __51__AXVictoriaSettings_accessibilityInitializeBundle__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "setOverrideProcessName:", CFSTR("Nike+Settings"));
  objc_msgSend(v2, "setValidationTargetName:", CFSTR("Nike+Settings"));
  objc_msgSend(v2, "setDebugBuild:", 0);

  return AXPerformValidationChecks();
}

void __51__AXVictoriaSettings_accessibilityInitializeBundle__block_invoke_4(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("NikeSettingsControllerAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("NikeSettingsWeightControllerAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("NikeUITableViewAccessibility"), 1);

}

@end
