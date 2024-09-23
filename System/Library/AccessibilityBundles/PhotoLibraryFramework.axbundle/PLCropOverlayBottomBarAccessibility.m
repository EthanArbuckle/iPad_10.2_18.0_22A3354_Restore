@implementation PLCropOverlayBottomBarAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PLCropOverlayBottomBar");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PLCropOverlayPreviewBottomBar"), CFSTR("playbackButton"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PLCropOverlayBottomBar"), CFSTR("_updateStyle"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PLCropOverlayBottomBar"), CFSTR("isPlayingVideo"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PLCropOverlayBottomBar"), CFSTR("setStyle: animated:"), "v", "q", "B", 0);

}

- (void)_axUpdatePlayPauseButtonWithImage
{
  void *v3;
  __CFString *v4;
  void *v5;
  id v6;

  -[PLCropOverlayBottomBarAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_previewBottomBar"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeValueForKey:", CFSTR("playbackButton"));
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (-[PLCropOverlayBottomBarAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("isPlayingVideo")))v4 = CFSTR("pause.button");
  else
    v4 = CFSTR("play.button");
  accessibilityLocalizedString(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAccessibilityLabel:", v5);

}

- (void)_updatePreviewBottomBarForPlaybackState
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PLCropOverlayBottomBarAccessibility;
  -[PLCropOverlayBottomBarAccessibility _updatePreviewBottomBarForPlaybackState](&v3, sel__updatePreviewBottomBarForPlaybackState);
  -[PLCropOverlayBottomBarAccessibility _axUpdatePlayPauseButtonWithImage](self, "_axUpdatePlayPauseButtonWithImage");
}

- (void)_accessibilityLoadAccessibilityInformation
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PLCropOverlayBottomBarAccessibility;
  -[PLCropOverlayBottomBarAccessibility _accessibilityLoadAccessibilityInformation](&v3, sel__accessibilityLoadAccessibilityInformation);
  -[PLCropOverlayBottomBarAccessibility _axUpdatePlayPauseButtonWithImage](self, "_axUpdatePlayPauseButtonWithImage");
}

- (void)_updateStyle
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)PLCropOverlayBottomBarAccessibility;
  -[PLCropOverlayBottomBarAccessibility _updateStyle](&v2, sel__updateStyle);
  UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], 0);
}

@end
