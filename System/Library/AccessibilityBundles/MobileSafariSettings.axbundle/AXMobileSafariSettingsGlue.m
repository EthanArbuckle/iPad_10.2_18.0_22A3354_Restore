@implementation AXMobileSafariSettingsGlue

+ (void)accessibilityInitializeBundle
{
  if (accessibilityInitializeBundle_onceToken != -1)
    dispatch_once(&accessibilityInitializeBundle_onceToken, &__block_literal_global);
}

void __59__AXMobileSafariSettingsGlue_accessibilityInitializeBundle__block_invoke()
{
  id v0;

  objc_msgSend(MEMORY[0x24BE00758], "sharedInstance");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "performValidations:withPreValidationHandler:postValidationHandler:safeCategoryInstallationHandler:", &__block_literal_global_177, &__block_literal_global_178, 0, &__block_literal_global_182);

}

uint64_t __59__AXMobileSafariSettingsGlue_accessibilityInitializeBundle__block_invoke_2()
{
  return 1;
}

uint64_t __59__AXMobileSafariSettingsGlue_accessibilityInitializeBundle__block_invoke_3(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "setValidationTargetName:", CFSTR("MobileSafariSettings"));
  objc_msgSend(v2, "setOverrideProcessName:", CFSTR("MobileSafariSettings"));
  objc_msgSend(v2, "setDebugBuild:", 0);

  return AXPerformValidationChecks();
}

void __59__AXMobileSafariSettingsGlue_accessibilityInitializeBundle__block_invoke_4(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("ColorPickerButtonAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("IconSettingsButtonAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("SymbolCollectionViewCellAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("ProfileIconButtonAccessibility"), 1);

}

@end
