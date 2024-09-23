@implementation HUClipScrubberViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("HUClipScrubberView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HUClipScrubberView"), CFSTR("isPlayingMedia"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HUClipScrubberView"), CFSTR("playPauseButton"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HUClipScrubberView"), CFSTR("rightActionButton"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HUClipScrubberView"), CFSTR("clipCollectionView"), "@", 0);

}

- (BOOL)isAccessibilityElement
{
  return 0;
}

- (id)accessibilityElements
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDBCE30];
  -[HUClipScrubberViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("playPauseButton"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUClipScrubberViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("rightActionButton"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUClipScrubberViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("clipCollectionView"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "axArrayByIgnoringNilElementsWithCount:", 3, v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  _QWORD v4[4];
  id v5;
  id location;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)HUClipScrubberViewAccessibility;
  -[HUClipScrubberViewAccessibility _accessibilityLoadAccessibilityInformation](&v7, sel__accessibilityLoadAccessibilityInformation);
  objc_initWeak(&location, self);
  -[HUClipScrubberViewAccessibility _axPlayPauseButton](self, "_axPlayPauseButton");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __77__HUClipScrubberViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke;
  v4[3] = &unk_250234568;
  objc_copyWeak(&v5, &location);
  objc_msgSend(v3, "_setAccessibilityLabelBlock:", v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

id __77__HUClipScrubberViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1)
{
  id WeakRetained;
  __CFString *v2;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (objc_msgSend(WeakRetained, "safeBoolForKey:", CFSTR("isPlayingMedia")))
    v2 = CFSTR("camera.clip.pause.button");
  else
    v2 = CFSTR("camera.clip.play.button");
  accessibilityHomeUILocalizedString(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_axPlayPauseButton
{
  return (id)-[HUClipScrubberViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("playPauseButton"));
}

- (HUClipScrubberViewAccessibility)initWithFrame:(CGRect)a3
{
  HUClipScrubberViewAccessibility *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HUClipScrubberViewAccessibility;
  v3 = -[HUClipScrubberViewAccessibility initWithFrame:](&v5, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  -[HUClipScrubberViewAccessibility _accessibilityLoadAccessibilityInformation](v3, "_accessibilityLoadAccessibilityInformation");
  return v3;
}

@end
