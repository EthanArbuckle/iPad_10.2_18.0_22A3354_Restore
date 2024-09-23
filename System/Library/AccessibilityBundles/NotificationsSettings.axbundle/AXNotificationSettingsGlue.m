@implementation AXNotificationSettingsGlue

+ (void)accessibilityInitializeBundle
{
  id v2;

  objc_msgSend(MEMORY[0x24BE00758], "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "performValidations:withPreValidationHandler:postValidationHandler:safeCategoryInstallationHandler:", &__block_literal_global, &__block_literal_global_182, 0, &__block_literal_global_188);

}

uint64_t __59__AXNotificationSettingsGlue_accessibilityInitializeBundle__block_invoke()
{
  return 1;
}

uint64_t __59__AXNotificationSettingsGlue_accessibilityInitializeBundle__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "setValidationTargetName:", CFSTR("NotificationSettings AX Bundle"));
  objc_msgSend(v2, "setOverrideProcessName:", CFSTR("NotificationSettings"));
  objc_msgSend(v2, "setDebugBuild:", 0);

  return AXPerformValidationChecks();
}

void __59__AXNotificationSettingsGlue_accessibilityInitializeBundle__block_invoke_3(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("NotificationCellAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("AlertDeliveryLocationViewAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("AlertDeliveryTypeCellAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("NCNotificationListDisplayStyleSelectionViewAccessibility"), 1);

}

@end
