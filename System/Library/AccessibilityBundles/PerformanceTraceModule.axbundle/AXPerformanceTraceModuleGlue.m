@implementation AXPerformanceTraceModuleGlue

+ (id)accessibilityBundles
{
  return 0;
}

+ (void)accessibilityInitializeBundle
{
  if (accessibilityInitializeBundle_onceToken != -1)
    dispatch_once(&accessibilityInitializeBundle_onceToken, &__block_literal_global);
}

void __61__AXPerformanceTraceModuleGlue_accessibilityInitializeBundle__block_invoke()
{
  id v0;

  objc_msgSend(MEMORY[0x24BDFE4F8], "sharedInstance");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "performValidations:withPreValidationHandler:postValidationHandler:safeCategoryInstallationHandler:", &__block_literal_global_177, &__block_literal_global_178, 0, &__block_literal_global_182);

}

uint64_t __61__AXPerformanceTraceModuleGlue_accessibilityInitializeBundle__block_invoke_2()
{
  return 1;
}

uint64_t __61__AXPerformanceTraceModuleGlue_accessibilityInitializeBundle__block_invoke_3(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "setValidationTargetName:", CFSTR("PerformanceTrace Module (ControlCenter)"));
  objc_msgSend(v2, "setOverrideProcessName:", CFSTR("PerformanceTrace Module (ControlCenter)"));
  objc_msgSend(v2, "setDebugBuild:", 0);

  return AXPerformValidationChecks();
}

void __61__AXPerformanceTraceModuleGlue_accessibilityInitializeBundle__block_invoke_4(uint64_t a1, void *a2)
{
  id v2;

  objc_msgSend(a2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("CCUIPerformanceTraceModuleViewControllerAccessibility"), 1);
  objc_msgSend(MEMORY[0x24BEBADE8], "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsLoadAccessibilityInformation");

}

@end
