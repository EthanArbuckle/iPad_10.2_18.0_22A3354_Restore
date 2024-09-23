@implementation AXFrontBoardGlue

+ (id)accessibilityBundles
{
  return 0;
}

+ (void)accessibilityInitializeBundle
{
  void *v2;
  uint64_t v3;
  void *v4;

  if (!_Failover)
  {
    objc_msgSend(MEMORY[0x24BDFE4F8], "sharedInstance");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "performValidations:withPreValidationHandler:postValidationHandler:safeCategoryInstallationHandler:", &__block_literal_global, &__block_literal_global_176, 0, &__block_literal_global_180);

    v3 = objc_msgSend(objc_allocWithZone((Class)AXFrontBoardGlue), "init");
    v4 = (void *)_Failover;
    _Failover = v3;

  }
}

uint64_t __49__AXFrontBoardGlue_accessibilityInitializeBundle__block_invoke()
{
  return 1;
}

uint64_t __49__AXFrontBoardGlue_accessibilityInitializeBundle__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "setValidationTargetName:", CFSTR("FrontBoard AX"));
  objc_msgSend(v2, "setOverrideProcessName:", CFSTR("FrontBoard AX"));
  objc_msgSend(v2, "setDebugBuild:", 0);

  return AXPerformValidationChecks();
}

void __49__AXFrontBoardGlue_accessibilityInitializeBundle__block_invoke_3(uint64_t a1, void *a2)
{
  id v2;

  objc_msgSend(a2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("FBApplicationProcessAccessibility"), 1);
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:", *MEMORY[0x24BDFE630], 0);

}

@end
