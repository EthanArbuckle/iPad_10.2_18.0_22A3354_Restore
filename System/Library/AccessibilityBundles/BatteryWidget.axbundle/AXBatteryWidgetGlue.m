@implementation AXBatteryWidgetGlue

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
    objc_msgSend(MEMORY[0x24BE00758], "sharedInstance");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "performValidations:withPreValidationHandler:postValidationHandler:safeCategoryInstallationHandler:", &__block_literal_global, &__block_literal_global_176, 0, &__block_literal_global_180);

    v3 = objc_msgSend(objc_allocWithZone((Class)AXBatteryWidgetGlue), "init");
    v4 = (void *)_Failover;
    _Failover = v3;

  }
}

uint64_t __52__AXBatteryWidgetGlue_accessibilityInitializeBundle__block_invoke()
{
  return 1;
}

uint64_t __52__AXBatteryWidgetGlue_accessibilityInitializeBundle__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "setValidationTargetName:", CFSTR("BatteryWidget"));
  objc_msgSend(v2, "setOverrideProcessName:", CFSTR("BatteryWidget"));

  return AXPerformValidationChecks();
}

void __52__AXBatteryWidgetGlue_accessibilityInitializeBundle__block_invoke_3(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("BCBatteryWidgetRowViewAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("BCBatteryWidgetViewControllerAccessibility"), 1);

}

@end
