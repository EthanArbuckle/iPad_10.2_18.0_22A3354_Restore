@implementation AXSiriKitRuntimeGlue

+ (void)initialize
{
  void *v2;
  uint64_t v3;
  void *v4;

  if (!_Failover)
  {
    objc_msgSend(MEMORY[0x24BDFE4F8], "sharedInstance");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "performValidations:withPreValidationHandler:postValidationHandler:safeCategoryInstallationHandler:", &__block_literal_global, &__block_literal_global_176, 0, &__block_literal_global_182);

    v3 = objc_msgSend(objc_allocWithZone((Class)AXSiriKitRuntimeGlue), "init");
    v4 = (void *)_Failover;
    _Failover = v3;

  }
}

uint64_t __34__AXSiriKitRuntimeGlue_initialize__block_invoke()
{
  return 1;
}

uint64_t __34__AXSiriKitRuntimeGlue_initialize__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "setValidationTargetName:", CFSTR("SiriKitRuntime AX"));
  objc_msgSend(v2, "setOverrideProcessName:", CFSTR("SiriKitRuntime"));
  objc_msgSend(v2, "setDebugBuild:", 0);

  return AXPerformValidationChecks();
}

uint64_t __34__AXSiriKitRuntimeGlue_initialize__block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("SharedFlowPluginServiceAccessibility"), 1);
}

@end
