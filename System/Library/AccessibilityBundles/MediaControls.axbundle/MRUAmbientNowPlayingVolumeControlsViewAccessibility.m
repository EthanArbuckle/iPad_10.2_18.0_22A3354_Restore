@implementation MRUAmbientNowPlayingVolumeControlsViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("MRUAmbientNowPlayingVolumeControlsView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("MRUAmbientNowPlayingVolumeControlsView"), CFSTR("_volumeController"), "MRUVolumeController");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MRUVolumeController"), CFSTR("volumeValue"), "f", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MRUVolumeController"), CFSTR("setVolumeValue:"), "v", "f", 0);

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  return accessibilityLocalizedString(CFSTR("volume.slider.label"));
}

- (id)accessibilityValue
{
  void *v2;
  void *v3;

  -[MRUAmbientNowPlayingVolumeControlsViewAccessibility volumeController](self, "volumeController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safeFloatForKey:", CFSTR("volumeValue"));
  AXFormatFloatWithPercentage();
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x24BDF73A0];
}

- (void)accessibilityIncrement
{
  -[MRUAmbientNowPlayingVolumeControlsViewAccessibility _accessibilityIncreaseVolume:](self, "_accessibilityIncreaseVolume:", 1);
}

- (void)accessibilityDecrement
{
  -[MRUAmbientNowPlayingVolumeControlsViewAccessibility _accessibilityIncreaseVolume:](self, "_accessibilityIncreaseVolume:", 0);
}

- (void)_accessibilityIncreaseVolume:(BOOL)a3
{
  void *v3;

  -[MRUAmbientNowPlayingVolumeControlsViewAccessibility volumeController](self, "volumeController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeFloatForKey:", CFSTR("volumeValue"));

  AXPerformSafeBlock();
}

void __84__MRUAmbientNowPlayingVolumeControlsViewAccessibility__accessibilityIncreaseVolume___block_invoke(uint64_t a1)
{
  double v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "volumeController");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  LODWORD(v2) = *(_DWORD *)(a1 + 40);
  objc_msgSend(v3, "setVolumeValue:", v2);

}

- (id)volumeController
{
  return (id)-[MRUAmbientNowPlayingVolumeControlsViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_volumeController"));
}

@end
