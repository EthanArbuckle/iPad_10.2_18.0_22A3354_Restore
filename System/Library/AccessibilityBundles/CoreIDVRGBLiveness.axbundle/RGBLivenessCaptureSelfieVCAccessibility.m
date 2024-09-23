@implementation RGBLivenessCaptureSelfieVCAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CoreIDVRGBLiveness.RGBLivenessCaptureSelfieVC");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CoreIDVRGBLiveness.RGBLivenessCaptureSelfieVC"), CFSTR("viewWillAppear:"), "v", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CoreIDVRGBLiveness.RGBLivenessCaptureSelfieVC"), CFSTR("presentCoachingSuccess:"), "v", "@?", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CoreIDVRGBLiveness.RGBLivenessCaptureSelfieVC"), CFSTR("showAXOptions"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CoreIDVRGBLiveness.RGBLivenessCaptureSelfieVC"), CFSTR("presentSkipGestureAlert"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CoreIDVRGBLiveness.RGBLivenessCaptureSelfieVC"), CFSTR("restartSelfieCapture"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CoreIDVRGBLiveness.RGBLivenessCaptureSelfieVC"), CFSTR("performClosuresAwaitingImageQualityVerification"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CoreIDVRGBLiveness.RGBLivenessCaptureSelfieVC"), CFSTR("captureSelfieView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CoreIDVRGBLiveness.CaptureSelfieView"), CFSTR("coachingPrompt"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CoreIDVRGBLiveness.CaptureSelfieView"), CFSTR("nagPrompt"), "@", 0);

}

- (void)_axHandleCoachingAnnouncement
{
  void *v2;
  id v3;
  id v4;
  void *v5;
  void *v6;

  -[RGBLivenessCaptureSelfieVCAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("captureSelfieView"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safeUIViewForKey:", CFSTR("_coachingPrompt"));
  v5 = v2;
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v6;
  v4 = v2;
  AXPerformSafeBlock();

}

uint64_t __72__RGBLivenessCaptureSelfieVCAccessibility__axHandleCoachingAnnouncement__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_axHandleAnnouncementMachine:polite:moveToView:", *(_QWORD *)(a1 + 40), 1, 1);
}

- (void)performClosuresAwaitingImageQualityVerification
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)RGBLivenessCaptureSelfieVCAccessibility;
  -[RGBLivenessCaptureSelfieVCAccessibility performClosuresAwaitingImageQualityVerification](&v2, sel_performClosuresAwaitingImageQualityVerification);
  AXPerformSafeBlock();
}

void __90__RGBLivenessCaptureSelfieVCAccessibility_performClosuresAwaitingImageQualityVerification__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "safeValueForKey:", CFSTR("captureSelfieView"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "safeUIViewForKey:", CFSTR("nagPrompt"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_axHandleAnnouncementMachine:polite:moveToView:", v2, 1, 0);

}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RGBLivenessCaptureSelfieVCAccessibility;
  -[RGBLivenessCaptureSelfieVCAccessibility viewWillAppear:](&v3, sel_viewWillAppear_, a3);
  UIAccessibilityPostNotification(*MEMORY[0x24BDF7328], 0);
}

- (void)showAXOptions
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)RGBLivenessCaptureSelfieVCAccessibility;
  -[RGBLivenessCaptureSelfieVCAccessibility showAXOptions](&v2, sel_showAXOptions);
  UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], 0);
}

- (void)restartSelfieCapture
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)RGBLivenessCaptureSelfieVCAccessibility;
  -[RGBLivenessCaptureSelfieVCAccessibility restartSelfieCapture](&v2, sel_restartSelfieCapture);
  UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], 0);
}

- (void)presentSkipGestureAlert
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RGBLivenessCaptureSelfieVCAccessibility;
  -[RGBLivenessCaptureSelfieVCAccessibility presentSkipGestureAlert](&v3, sel_presentSkipGestureAlert);
  -[RGBLivenessCaptureSelfieVCAccessibility _axHandleCoachingAnnouncement](self, "_axHandleCoachingAnnouncement");
}

- (void)presentCoachingSuccess:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RGBLivenessCaptureSelfieVCAccessibility;
  -[RGBLivenessCaptureSelfieVCAccessibility presentCoachingSuccess:](&v3, sel_presentCoachingSuccess_, a3);
  AXPerformSafeBlock();
  UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], 0);
}

void __66__RGBLivenessCaptureSelfieVCAccessibility_presentCoachingSuccess___block_invoke(uint64_t a1)
{
  id v1;
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "safeValueForKey:", CFSTR("captureSelfieView"));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  v1 = (id)objc_msgSend(v2, "safeValueForKey:", CFSTR("_axHandleNonInterruptableCoachingAnnouncement"));

}

@end
