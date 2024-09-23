@implementation AXWebCoreGlue

+ (void)accessibilityInitializeBundle
{
  if (accessibilityInitializeBundle_onceToken != -1)
    dispatch_once(&accessibilityInitializeBundle_onceToken, &__block_literal_global);
}

void __46__AXWebCoreGlue_accessibilityInitializeBundle__block_invoke()
{
  id v0;

  _AXUIInstallBaseCategories();
  objc_msgSend(MEMORY[0x24BDFE4F8], "sharedInstance");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "performValidations:withPreValidationHandler:postValidationHandler:safeCategoryInstallationHandler:", &__block_literal_global_177, &__block_literal_global_178, 0, &__block_literal_global_184);

}

uint64_t __46__AXWebCoreGlue_accessibilityInitializeBundle__block_invoke_2()
{
  return 1;
}

uint64_t __46__AXWebCoreGlue_accessibilityInitializeBundle__block_invoke_3(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "setValidationTargetName:", CFSTR("WebCore AX Bundle"));
  objc_msgSend(v2, "setOverrideProcessName:", CFSTR("WebCore"));
  objc_msgSend(v2, "setDebugBuild:", 0);

  return AXPerformValidationChecks();
}

void __46__AXWebCoreGlue_accessibilityInitializeBundle__block_invoke_4(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("UIKitWebAccessibilityObjectWrapper"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("UIKitAccessibilityTextMarker"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("WAKScrollViewAccessibility"), 1);

}

@end
