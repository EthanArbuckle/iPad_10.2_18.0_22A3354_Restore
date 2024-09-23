@implementation VolumeSliderAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("Music.VolumeSlider");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("Music.VolumeSlider"), CFSTR("accessibilityUpdateWithVolume:"), "v", "f", 0);
  objc_msgSend(v3, "validateClass:hasSwiftField:withSwiftType:", CFSTR("Music.VolumeSlider"), CFSTR("volumeController"), "MPVolumeController");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MPVolumeController"), CFSTR("volumeValue"), "f", 0);

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  return accessibilityMusicLocalizedString(CFSTR("volume.level.label"));
}

- (id)accessibilityValue
{
  void *v2;
  void *v3;

  -[VolumeSliderAccessibility safeSwiftValueForKey:](self, "safeSwiftValueForKey:", CFSTR("volumeController"));
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
  -[VolumeSliderAccessibility _accessibilityIncreaseVolume:](self, "_accessibilityIncreaseVolume:", 1);
}

- (void)accessibilityDecrement
{
  -[VolumeSliderAccessibility _accessibilityIncreaseVolume:](self, "_accessibilityIncreaseVolume:", 0);
}

- (void)_accessibilityIncreaseVolume:(BOOL)a3
{
  void *v3;

  -[VolumeSliderAccessibility safeSwiftValueForKey:](self, "safeSwiftValueForKey:", CFSTR("volumeController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeFloatForKey:", CFSTR("volumeValue"));
  AXPerformSafeBlock();

}

uint64_t __58__VolumeSliderAccessibility__accessibilityIncreaseVolume___block_invoke(uint64_t a1, double a2)
{
  LODWORD(a2) = *(_DWORD *)(a1 + 40);
  return objc_msgSend(*(id *)(a1 + 32), "accessibilityUpdateWithVolume:", a2);
}

- (BOOL)canBecomeFocused
{
  unsigned __int8 v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)VolumeSliderAccessibility;
  v3 = -[VolumeSliderAccessibility canBecomeFocused](&v5, sel_canBecomeFocused);
  return -[VolumeSliderAccessibility _accessibilityIsFKARunningForFocusItem](self, "_accessibilityIsFKARunningForFocusItem") | v3;
}

@end
