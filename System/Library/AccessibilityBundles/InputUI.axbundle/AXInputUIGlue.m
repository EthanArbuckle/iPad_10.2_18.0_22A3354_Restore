@implementation AXInputUIGlue

+ (void)accessibilityInitializeBundle
{
  void *v2;
  uint64_t v3;
  void *v4;

  if (!_Failover)
  {
    objc_msgSend(MEMORY[0x24BE00758], "sharedInstance");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "performValidations:withPreValidationHandler:postValidationHandler:safeCategoryInstallationHandler:", &__block_literal_global, &__block_literal_global_195, 0, &__block_literal_global_201);

    v3 = objc_msgSend(objc_allocWithZone((Class)AXInputUIGlue), "init");
    v4 = (void *)_Failover;
    _Failover = v3;

  }
}

uint64_t __46__AXInputUIGlue_accessibilityInitializeBundle__block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("IUIInputSourceViewController"), CFSTR("textInputSource"), "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("IUIRTIInputSource"), CFSTR("sourceSession"), "@", 0);
  objc_msgSend(v2, "validateClass:isKindOfClass:", CFSTR("RTIInputSystemSourceSession"), CFSTR("RTIInputSystemSession"));
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("RTIInputSystemSession"), CFSTR("documentTraits"), "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("RTIDocumentTraits"), CFSTR("bundleId"), "@", 0);

  return 1;
}

uint64_t __46__AXInputUIGlue_accessibilityInitializeBundle__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "setValidationTargetName:", CFSTR("InputUI AX"));
  objc_msgSend(v2, "setOverrideProcessName:", CFSTR("InputUI"));
  objc_msgSend(v2, "setDebugBuild:", 0);

  return AXPerformValidationChecks();
}

uint64_t __46__AXInputUIGlue_accessibilityInitializeBundle__block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("InputUIWindowAccessibility"), 1);
}

@end
