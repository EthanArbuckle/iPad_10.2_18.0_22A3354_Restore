@implementation AXAudioConferenceControlCenterModuleGlue

+ (id)accessibilityBundles
{
  return 0;
}

+ (void)accessibilityInitializeBundle
{
  if (accessibilityInitializeBundle_onceToken != -1)
    dispatch_once(&accessibilityInitializeBundle_onceToken, &__block_literal_global);
}

void __73__AXAudioConferenceControlCenterModuleGlue_accessibilityInitializeBundle__block_invoke()
{
  id v0;

  objc_msgSend(MEMORY[0x24BDFE4F8], "sharedInstance");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "performValidations:withPreValidationHandler:postValidationHandler:safeCategoryInstallationHandler:", &__block_literal_global_177, &__block_literal_global_178, 0, &__block_literal_global_182);

}

uint64_t __73__AXAudioConferenceControlCenterModuleGlue_accessibilityInitializeBundle__block_invoke_2()
{
  return 1;
}

uint64_t __73__AXAudioConferenceControlCenterModuleGlue_accessibilityInitializeBundle__block_invoke_3(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "setValidationTargetName:", CFSTR("AudioConferenceControlCenter Module (ControlCenter)"));
  objc_msgSend(v2, "setOverrideProcessName:", CFSTR("AudioConferenceControlCenter Module (ControlCenter)"));
  objc_msgSend(v2, "setDebugBuild:", 0);

  return AXPerformValidationChecks();
}

void __73__AXAudioConferenceControlCenterModuleGlue_accessibilityInitializeBundle__block_invoke_4(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  id v4;

  v2 = (void *)MEMORY[0x24BEBADE8];
  v4 = a2;
  objc_msgSend(v2, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setNeedsLoadAccessibilityInformation");

  objc_msgSend(v4, "installSafeCategory:canInteractWithTargetClass:", CFSTR("AudioConferenceControlCenterModuleEffectControlAccessibility"), 1);
  objc_msgSend(v4, "installSafeCategory:canInteractWithTargetClass:", CFSTR("AudioSettingsViewAccessibility"), 1);

}

@end
