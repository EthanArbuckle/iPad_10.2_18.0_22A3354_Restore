@implementation AXFocusUIModuleGlue

+ (void)accessibilityInitializeBundle
{
  void *v2;
  uint64_t v3;
  void *v4;

  if (!_Failover)
  {
    objc_msgSend(MEMORY[0x24BE00758], "sharedInstance");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "performValidations:withPreValidationHandler:postValidationHandler:safeCategoryInstallationHandler:", &__block_literal_global, &__block_literal_global_176, 0, &__block_literal_global_182);

    v3 = objc_msgSend(objc_allocWithZone((Class)AXFocusUIModuleGlue), "init");
    v4 = (void *)_Failover;
    _Failover = v3;

  }
}

uint64_t __52__AXFocusUIModuleGlue_accessibilityInitializeBundle__block_invoke()
{
  return 1;
}

uint64_t __52__AXFocusUIModuleGlue_accessibilityInitializeBundle__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "setValidationTargetName:", CFSTR("FocusUIModule AX"));
  objc_msgSend(v2, "setOverrideProcessName:", CFSTR("FocusUIModule"));
  objc_msgSend(v2, "setDebugBuild:", 0);

  return AXPerformValidationChecks();
}

void __52__AXFocusUIModuleGlue_accessibilityInitializeBundle__block_invoke_3(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("FCCCControlCenterModuleAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("FCCCModuleViewControllerAccessibility"), 1);

}

@end
