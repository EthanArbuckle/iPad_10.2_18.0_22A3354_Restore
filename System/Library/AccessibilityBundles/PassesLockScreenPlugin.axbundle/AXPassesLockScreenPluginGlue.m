@implementation AXPassesLockScreenPluginGlue

+ (void)accessibilityInitializeBundle
{
  id v2;

  objc_msgSend(MEMORY[0x24BE00758], "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "performValidations:withPreValidationHandler:postValidationHandler:safeCategoryInstallationHandler:", &__block_literal_global, &__block_literal_global_181, 0, &__block_literal_global_187);

}

uint64_t __61__AXPassesLockScreenPluginGlue_accessibilityInitializeBundle__block_invoke(uint64_t a1, void *a2)
{
  objc_msgSend(a2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("WLLockScreenView"), CFSTR("delegate"), "@", 0);
  return 1;
}

uint64_t __61__AXPassesLockScreenPluginGlue_accessibilityInitializeBundle__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "setValidationTargetName:", CFSTR("PassKit Lockscreen plugin"));
  objc_msgSend(v2, "setOverrideProcessName:", CFSTR("PassKit LockScreen plugin"));

  return AXPerformValidationChecks();
}

uint64_t __61__AXPassesLockScreenPluginGlue_accessibilityInitializeBundle__block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("WLLockScreenViewAccessibility"), 1);
}

@end
