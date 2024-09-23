@implementation AXAVFoundationGlue

+ (void)accessibilityInitializeBundle
{
  void *v2;
  uint64_t v3;
  void *v4;

  if (!_Failover)
  {
    objc_msgSend(MEMORY[0x24BDFE4F8], "sharedInstance");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "performValidations:withPreValidationHandler:postValidationHandler:safeCategoryInstallationHandler:", &__block_literal_global, &__block_literal_global_176, 0, &__block_literal_global_182);

    v3 = objc_msgSend(objc_allocWithZone((Class)AXAVFoundationGlue), "init");
    v4 = (void *)_Failover;
    _Failover = v3;

  }
}

uint64_t __51__AXAVFoundationGlue_accessibilityInitializeBundle__block_invoke()
{
  return 1;
}

uint64_t __51__AXAVFoundationGlue_accessibilityInitializeBundle__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "setValidationTargetName:", CFSTR("AVFoundation AX"));
  objc_msgSend(v2, "setOverrideProcessName:", CFSTR("AVFoundation"));
  objc_msgSend(v2, "setDebugBuild:", 0);

  return AXPerformValidationChecks();
}

void __51__AXAVFoundationGlue_accessibilityInitializeBundle__block_invoke_3(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  char v4;
  id v5;

  v5 = a2;
  objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hasPrefix:", *MEMORY[0x24BDFE428]);

  if ((v4 & 1) == 0)
    objc_msgSend(v5, "installSafeCategory:canInteractWithTargetClass:", CFSTR("AVPlayerAccessibility"), 1);

}

@end
