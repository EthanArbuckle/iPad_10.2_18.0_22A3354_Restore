@implementation SiriSettingsGlue

+ (void)accessibilityInitializeBundle
{
  if (accessibilityInitializeBundle_onceToken_0 != -1)
    dispatch_once(&accessibilityInitializeBundle_onceToken_0, &__block_literal_global_0);
}

void __49__SiriSettingsGlue_accessibilityInitializeBundle__block_invoke()
{
  void *v0;
  id v1;

  objc_msgSend(MEMORY[0x24BE00758], "sharedInstance");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "performValidations:withPreValidationHandler:postValidationHandler:safeCategoryInstallationHandler:", &__block_literal_global_177_0, &__block_literal_global_198, 0, &__block_literal_global_204);

  objc_msgSend(MEMORY[0x24BE00758], "sharedInstance");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "installSafeCategories:afterDelay:validationTargetName:overrideProcessName:", &__block_literal_global_207, CFSTR("Siri Settings AX Bundle"), CFSTR("Siri View Service"), 0.1);

}

uint64_t __49__SiriSettingsGlue_accessibilityInitializeBundle__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "validateClass:hasInstanceVariable:withType:", CFSTR("ACSettingsSliderUIController"), CFSTR("_setting"), "ACSettingsSliderSetting");
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("ACSettingsBasicSetting"), CFSTR("name"), "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("ACSettingsSwitchView"), CFSTR("title"), "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("ACSettingsSwitchView"), CFSTR("switchControl"), "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("ACSettingsSliderView"), CFSTR("slider"), "@", 0);

  return 1;
}

uint64_t __49__SiriSettingsGlue_accessibilityInitializeBundle__block_invoke_3(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "setValidationTargetName:", CFSTR("Siri Settings AX Bundle"));
  objc_msgSend(v2, "setOverrideProcessName:", CFSTR("Siri Settings"));

  return AXPerformValidationChecks();
}

uint64_t __49__SiriSettingsGlue_accessibilityInitializeBundle__block_invoke_4(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("ACSettingsSliderViewAccessibility"), 1);
}

uint64_t __49__SiriSettingsGlue_accessibilityInitializeBundle__block_invoke_5(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("ACSettingsSwitchViewAccessibility"), 1);
}

@end
