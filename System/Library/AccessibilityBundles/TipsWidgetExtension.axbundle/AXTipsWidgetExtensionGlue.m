@implementation AXTipsWidgetExtensionGlue

+ (void)accessibilityInitializeBundle
{
  void *v2;
  uint64_t v3;
  void *v4;

  if (!_Failover)
  {
    objc_msgSend(MEMORY[0x24BDFE4F8], "sharedInstance");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "performValidations:withPreValidationHandler:postValidationHandler:safeCategoryInstallationHandler:", &__block_literal_global, &__block_literal_global_178, 0, &__block_literal_global_184);

    v3 = objc_msgSend(objc_allocWithZone((Class)AXTipsWidgetExtensionGlue), "init");
    v4 = (void *)_Failover;
    _Failover = v3;

  }
}

uint64_t __58__AXTipsWidgetExtensionGlue_accessibilityInitializeBundle__block_invoke()
{
  return 1;
}

uint64_t __58__AXTipsWidgetExtensionGlue_accessibilityInitializeBundle__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "setValidationTargetName:", CFSTR("TipsWidgetExtension AX Bundle"));
  objc_msgSend(v2, "setOverrideProcessName:", CFSTR("TipsWidgetExtension"));

  return AXPerformValidationChecks();
}

void __58__AXTipsWidgetExtensionGlue_accessibilityInitializeBundle__block_invoke_3(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("TPSWidgetTipViewAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("TipsWidgetExtensionUIViewAccessibility"), 1);

}

@end
