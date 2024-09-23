@implementation AXWirelessModemSettingsGlue

+ (void)accessibilityInitializeBundle
{
  if (accessibilityInitializeBundle_onceToken != -1)
    dispatch_once(&accessibilityInitializeBundle_onceToken, &__block_literal_global);
}

void __60__AXWirelessModemSettingsGlue_accessibilityInitializeBundle__block_invoke()
{
  id v0;

  objc_msgSend(MEMORY[0x24BE00758], "sharedInstance");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "performValidations:withPreValidationHandler:postValidationHandler:safeCategoryInstallationHandler:", &__block_literal_global_184, &__block_literal_global_185, &__block_literal_global_189, &__block_literal_global_191);

}

uint64_t __60__AXWirelessModemSettingsGlue_accessibilityInitializeBundle__block_invoke_2()
{
  return 1;
}

uint64_t __60__AXWirelessModemSettingsGlue_accessibilityInitializeBundle__block_invoke_3(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "setValidationTargetName:", CFSTR("WirelessModem settings"));
  objc_msgSend(v2, "setOverrideProcessName:", CFSTR("WirelessModem settings"));
  objc_msgSend(v2, "setDebugBuild:", 0);

  return AXPerformValidationChecks();
}

uint64_t __60__AXWirelessModemSettingsGlue_accessibilityInitializeBundle__block_invoke_5(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("SetupViewAccessibility"), 1);
}

@end
