@implementation HFCameraPlaybackEngineAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("HFCameraPlaybackEngine");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HFCameraPlaybackEngine"), CFSTR("updatePlaybackPositionToDate:usingClip:"), "v", "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HFCameraPlaybackEngine"), CFSTR("clipPlayerDidPlayToEndTime:"), "v", "@", 0);

}

- (void)updatePlaybackPositionToDate:(id)a3 usingClip:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HFCameraPlaybackEngineAccessibility;
  -[HFCameraPlaybackEngineAccessibility updatePlaybackPositionToDate:usingClip:](&v5, sel_updatePlaybackPositionToDate_usingClip_, a3, a4);
  if (UIAccessibilityIsVoiceOverRunning())
    -[HFCameraPlaybackEngineAccessibility pause](self, "pause");
}

- (void)clipPlayerDidPlayToEndTime:(id)a3
{
  UIAccessibilityNotifications v4;
  id v5;
  void *v6;
  void *v7;
  objc_super v8;

  v4 = *MEMORY[0x24BDF71E8];
  v5 = a3;
  accessibilityHomeUILocalizedString(CFSTR("camera.streaming.live.yes"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  AXAttributedStringForBetterPronuciation();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  UIAccessibilityPostNotification(v4, v7);

  v8.receiver = self;
  v8.super_class = (Class)HFCameraPlaybackEngineAccessibility;
  -[HFCameraPlaybackEngineAccessibility clipPlayerDidPlayToEndTime:](&v8, sel_clipPlayerDidPlayToEndTime_, v5);

}

@end
