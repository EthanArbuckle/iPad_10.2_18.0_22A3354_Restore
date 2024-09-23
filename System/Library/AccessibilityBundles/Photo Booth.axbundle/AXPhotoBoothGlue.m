@implementation AXPhotoBoothGlue

+ (void)accessibilityInitializeBundle
{
  void *v2;
  uint64_t v3;
  void *v4;

  if (!_Failover)
  {
    objc_msgSend(MEMORY[0x24BE00758], "sharedInstance");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "performValidations:withPreValidationHandler:postValidationHandler:safeCategoryInstallationHandler:", &__block_literal_global, &__block_literal_global_232, 0, &__block_literal_global_238);

    v3 = objc_msgSend(objc_allocWithZone((Class)AXPhotoBoothGlue), "init");
    v4 = (void *)_Failover;
    _Failover = v3;

  }
}

uint64_t __49__AXPhotoBoothGlue_accessibilityInitializeBundle__block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PBShelfTile"), CFSTR("isSelected"), "B", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PBEffectsController"), CFSTR("takePicture:"), "v", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AVCaptureDeviceInput"), CFSTR("device"), "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AVCaptureDevice"), CFSTR("position"), "q", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PBFilter"), CFSTR("localizedName"), "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceVariable:withType:", CFSTR("PBEffectsController"), CFSTR("_cameraController"), "CUCaptureController");
  objc_msgSend(v2, "validateClass:hasInstanceVariable:withType:", CFSTR("PhotoBoothApplication"), CFSTR("_photoBoothController"), "PBController");
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CUCaptureController"), CFSTR("_captureEngine"), "@", 0);
  objc_msgSend(v2, "validateClass:", CFSTR("PBController"));
  objc_msgSend(v2, "validateClass:hasInstanceVariable:withType:", CFSTR("PBController"), CFSTR("_effectsController"), "PBEffectsController");
  objc_msgSend(v2, "validateClass:hasInstanceVariable:withType:", CFSTR("PBEffectsController"), CFSTR("_effectsView"), "PBEffectsView");
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PBEffectsView"), CFSTR("currentEffect"), "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PBEffectsController"), CFSTR("_currentDevicePosition"), "q", 0);

  return 1;
}

uint64_t __49__AXPhotoBoothGlue_accessibilityInitializeBundle__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "setValidationTargetName:", CFSTR("PBControllerAccessibility.m"));
  objc_msgSend(v2, "setOverrideProcessName:", CFSTR("Photobooth"));
  objc_msgSend(v2, "setDebugBuild:", 0);

  return AXPerformValidationChecks();
}

void __49__AXPhotoBoothGlue_accessibilityInitializeBundle__block_invoke_3(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("PBControllerAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("PBShelfTileAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("PBEffectsViewAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("PBContainerViewAccessibility"), 1);

}

@end
