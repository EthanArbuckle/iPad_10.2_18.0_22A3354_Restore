@implementation AXSearchFoundationGlue

+ (id)accessibilityBundles
{
  return 0;
}

+ (void)accessibilityInitializeBundle
{
  void *v2;
  AXSearchFoundationGlue *v3;
  void *v4;

  if (!_Failover_0)
  {
    objc_msgSend(MEMORY[0x24BE00758], "sharedInstance");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "performValidations:withPreValidationHandler:postValidationHandler:safeCategoryInstallationHandler:", &__block_literal_global_0, &__block_literal_global_176, 0, &__block_literal_global_182);

    v3 = objc_alloc_init(AXSearchFoundationGlue);
    v4 = (void *)_Failover_0;
    _Failover_0 = (uint64_t)v3;

  }
}

uint64_t __55__AXSearchFoundationGlue_accessibilityInitializeBundle__block_invoke()
{
  return 1;
}

uint64_t __55__AXSearchFoundationGlue_accessibilityInitializeBundle__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "setValidationTargetName:", CFSTR("SearchFoundation Framework AX bundle"));
  objc_msgSend(v2, "setOverrideProcessName:", CFSTR("SearchFoundation Framework"));

  return AXPerformValidationChecks();
}

void __55__AXSearchFoundationGlue_accessibilityInitializeBundle__block_invoke_3(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("SFSearchResultAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("SFTextAccessibility"), 1);

}

@end
