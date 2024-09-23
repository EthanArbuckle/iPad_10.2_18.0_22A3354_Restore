@implementation AXScreenshotServicesServiceGlue

+ (id)accessibilityBundles
{
  return 0;
}

+ (void)accessibilityInitializeBundle
{
  if (accessibilityInitializeBundle_onceToken != -1)
    dispatch_once(&accessibilityInitializeBundle_onceToken, &__block_literal_global);
}

void __64__AXScreenshotServicesServiceGlue_accessibilityInitializeBundle__block_invoke()
{
  void *v0;
  id v1;

  objc_msgSend(MEMORY[0x24BE00758], "sharedInstance");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "performValidations:withPreValidationHandler:postValidationHandler:safeCategoryInstallationHandler:", &__block_literal_global_177, &__block_literal_global_178, 0, &__block_literal_global_184);

  objc_msgSend(MEMORY[0x24BE005D8], "sharedInstance");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "addHandler:forBundleID:", &__block_literal_global_202, CFSTR("com.apple.AnnotationKit.axbundle"));

}

uint64_t __64__AXScreenshotServicesServiceGlue_accessibilityInitializeBundle__block_invoke_2()
{
  return 1;
}

uint64_t __64__AXScreenshotServicesServiceGlue_accessibilityInitializeBundle__block_invoke_3(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "setValidationTargetName:", CFSTR("ScreenshotServicesService AX Bundle"));
  objc_msgSend(v2, "setOverrideProcessName:", CFSTR("Screenshot"));

  return AXPerformValidationChecks();
}

void __64__AXScreenshotServicesServiceGlue_accessibilityInitializeBundle__block_invoke_4(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("SSSScreenshotsViewAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("SSSScreenshotsViewControllerAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("_SSSScreenshotAnnotationControllerAKOverlayContainerViewAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("SSSCropOverlayGrabberViewAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("SSSCropOverlayCornerViewAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("SSSScreenshotViewAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("SSS_UIWindowAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("SSSDittoRootViewControllerAccessibility"), 1);

}

void __64__AXScreenshotServicesServiceGlue_accessibilityInitializeBundle__block_invoke_5()
{
  id v0;

  objc_msgSend(MEMORY[0x24BE00758], "sharedInstance");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "performValidations:withPreValidationHandler:postValidationHandler:", &__block_literal_global_203, &__block_literal_global_211, 0);

}

uint64_t __64__AXScreenshotServicesServiceGlue_accessibilityInitializeBundle__block_invoke_6(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "validateClass:", CFSTR("AKOverlayView"));
  objc_msgSend(v2, "validateClass:", CFSTR("AKOverlayViewAccessibility"));
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AKOverlayViewAccessibility"), CFSTR("_accessibilityCreateOverlayViewElement"), "@", 0);

  return 1;
}

uint64_t __64__AXScreenshotServicesServiceGlue_accessibilityInitializeBundle__block_invoke_7(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "setValidationTargetName:", CFSTR("AnnotationKit"));
  objc_msgSend(v2, "setOverrideProcessName:", CFSTR("AnnotationKit"));
  objc_msgSend(v2, "setDebugBuild:", 0);

  return AXPerformValidationChecks();
}

@end
