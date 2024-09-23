@implementation AXPhotoLibraryServicesGlue

+ (void)accessibilityInitializeBundle
{
  id v2;

  objc_msgSend(MEMORY[0x24BE00758], "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "performValidations:withPreValidationHandler:postValidationHandler:safeCategoryInstallationHandler:", &__block_literal_global, &__block_literal_global_202, 0, &__block_literal_global_208);

}

uint64_t __59__AXPhotoLibraryServicesGlue_accessibilityInitializeBundle__block_invoke()
{
  return 1;
}

uint64_t __59__AXPhotoLibraryServicesGlue_accessibilityInitializeBundle__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "setValidationTargetName:", CFSTR("PhotoLibraryServices AX Bundle"));
  objc_msgSend(v2, "setOverrideProcessName:", CFSTR("PhotoLibraryServices Framework"));
  objc_msgSend(v2, "setDebugBuild:", 0);

  return AXPerformValidationChecks();
}

uint64_t __59__AXPhotoLibraryServicesGlue_accessibilityInitializeBundle__block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("PLManagedAssetAccessibility"), 1);
}

@end
