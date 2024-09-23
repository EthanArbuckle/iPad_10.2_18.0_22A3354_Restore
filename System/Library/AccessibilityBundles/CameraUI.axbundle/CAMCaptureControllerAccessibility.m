@implementation CAMCaptureControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CUCaptureController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CUCaptureController"), CFSTR("_captureEngine"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("CAMCaptureEngine"), CFSTR("__captureSession"), "AVCaptureSession");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AVCaptureSession"), CFSTR("isRunning"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CUCaptureController"), CFSTR("initWithCaptureConfiguration: zoomFactor: outputToExternalStorage: engineOptions: locationController: motionController: burstController: protectionController: powerController: irisVideoController: remoteShutterController:"), "@", "@", "d", "B", "q", "@", "@", "@", "@", "@", "@", "@", 0);

}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CAMCaptureControllerAccessibility;
  -[CAMCaptureControllerAccessibility _accessibilityLoadAccessibilityInformation](&v7, sel__accessibilityLoadAccessibilityInformation);
  -[CAMCaptureControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_captureEngine"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilitySafeClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = (void *)*MEMORY[0x24BDF74F8];
  objc_msgSend(v4, "safeValueForKey:", CFSTR("__captureSession"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_accessibilitySetCameraIrisOpen:", objc_msgSend(v6, "safeBoolForKey:", CFSTR("isRunning")));

  objc_msgSend(v4, "_accessibilityLoadAccessibilityInformation");
}

- (CAMCaptureControllerAccessibility)initWithCaptureConfiguration:(id)a3 zoomFactor:(double)a4 outputToExternalStorage:(BOOL)a5 engineOptions:(int64_t)a6 locationController:(id)a7 motionController:(id)a8 burstController:(id)a9 protectionController:(id)a10 powerController:(id)a11 irisVideoController:(id)a12 remoteShutterController:(id)a13
{
  CAMCaptureControllerAccessibility *v13;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)CAMCaptureControllerAccessibility;
  v13 = -[CAMCaptureControllerAccessibility initWithCaptureConfiguration:zoomFactor:outputToExternalStorage:engineOptions:locationController:motionController:burstController:protectionController:powerController:irisVideoController:remoteShutterController:](&v15, sel_initWithCaptureConfiguration_zoomFactor_outputToExternalStorage_engineOptions_locationController_motionController_burstController_protectionController_powerController_irisVideoController_remoteShutterController_, a3, a5, a6, a7, a8, a9, a4, a10, a11, a12, a13);
  -[CAMCaptureControllerAccessibility _accessibilityLoadAccessibilityInformation](v13, "_accessibilityLoadAccessibilityInformation");

  return v13;
}

@end
