@implementation AXBluetoothSettingsGlue

+ (id)accessibilityBundles
{
  return (id)objc_msgSend(MEMORY[0x24BDBCE30], "array");
}

+ (void)accessibilityInitializeBundle
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  _QWORD v6[4];
  __CFString *v7;
  __CFString *v8;

  if (!_Failover)
  {
    objc_msgSend(MEMORY[0x24BE00758], "sharedInstance");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __56__AXBluetoothSettingsGlue_accessibilityInitializeBundle__block_invoke_2;
    v6[3] = &unk_250196280;
    v7 = CFSTR("BluetoothSettings");
    v8 = CFSTR("BluetoothSettings");
    objc_msgSend(v2, "performValidations:withPreValidationHandler:postValidationHandler:safeCategoryInstallationHandler:", &__block_literal_global, v6, 0, &__block_literal_global_187);

    v3 = objc_msgSend(objc_allocWithZone((Class)AXBluetoothSettingsGlue), "init");
    v4 = (void *)_Failover;
    _Failover = v3;

    objc_msgSend(MEMORY[0x24BE00758], "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "installSafeCategories:afterDelay:validationTargetName:overrideProcessName:", &__block_literal_global_193, CFSTR("BluetoothSettings"), CFSTR("BluetoothSettings"), 0.0);

  }
}

uint64_t __56__AXBluetoothSettingsGlue_accessibilityInitializeBundle__block_invoke()
{
  return 1;
}

uint64_t __56__AXBluetoothSettingsGlue_accessibilityInitializeBundle__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "setValidationTargetName:", v3);
  objc_msgSend(v4, "setOverrideProcessName:", *(_QWORD *)(a1 + 40));

  return AXPerformValidationChecks();
}

void __56__AXBluetoothSettingsGlue_accessibilityInitializeBundle__block_invoke_3(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("BTSDevicesControllerAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("BTSSPPairingRequestAccessibility"), 1);

}

void __56__AXBluetoothSettingsGlue_accessibilityInitializeBundle__block_invoke_4(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("BTTableCellAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("BTTableSharingCellAccessibility"), 1);

}

@end
