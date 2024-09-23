@implementation PhotosAXGlue

+ (void)accessibilityInitializeBundle
{
  id v2;

  objc_msgSend(MEMORY[0x24BE00758], "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "performValidations:withPreValidationHandler:postValidationHandler:safeCategoryInstallationHandler:", &__block_literal_global, &__block_literal_global_205, 0, &__block_literal_global_211);

}

uint64_t __45__PhotosAXGlue_accessibilityInitializeBundle__block_invoke()
{
  return 1;
}

uint64_t __45__PhotosAXGlue_accessibilityInitializeBundle__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "setValidationTargetName:", CFSTR("Photos framework AX Bundle"));
  objc_msgSend(v2, "setOverrideProcessName:", CFSTR("Photos Framework"));
  objc_msgSend(v2, "setDebugBuild:", 0);

  return AXPerformValidationChecks();
}

uint64_t __45__PhotosAXGlue_accessibilityInitializeBundle__block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("PHAssetAccessibility"), 1);
}

@end
