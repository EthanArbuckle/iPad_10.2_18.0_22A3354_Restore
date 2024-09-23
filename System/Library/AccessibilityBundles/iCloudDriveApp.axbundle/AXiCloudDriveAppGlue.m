@implementation AXiCloudDriveAppGlue

+ (id)accessibilityBundles
{
  return 0;
}

+ (void)accessibilityInitializeBundle
{
  void *v2;
  AXiCloudDriveAppGlue *v3;
  void *v4;

  if (!_Failover)
  {
    objc_msgSend(MEMORY[0x24BE00758], "sharedInstance");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "performValidations:withPreValidationHandler:postValidationHandler:safeCategoryInstallationHandler:", &__block_literal_global, &__block_literal_global_178, 0, &__block_literal_global_184);

    v3 = objc_alloc_init(AXiCloudDriveAppGlue);
    v4 = (void *)_Failover;
    _Failover = (uint64_t)v3;

  }
}

uint64_t __53__AXiCloudDriveAppGlue_accessibilityInitializeBundle__block_invoke()
{
  return 1;
}

uint64_t __53__AXiCloudDriveAppGlue_accessibilityInitializeBundle__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "setValidationTargetName:", CFSTR("iCloudDriveApp AX Bundle"));
  objc_msgSend(v2, "setOverrideProcessName:", CFSTR("iCloudDriveApp"));

  return AXPerformValidationChecks();
}

void __53__AXiCloudDriveAppGlue_accessibilityInitializeBundle__block_invoke_3(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("NavControllerAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("FileInfoCellAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("ThumbnailImageViewAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("PreviewDetailsViewControllerAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("FileInfoStackViewAccessibility"), 1);

}

@end
