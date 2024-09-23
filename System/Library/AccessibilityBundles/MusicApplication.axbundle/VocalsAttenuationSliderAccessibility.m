@implementation VocalsAttenuationSliderAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("MusicVocalsAttenuationSlider");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("MusicVocalsAttenuationSlider"), CFSTR("MusicCoreUI.VerticalToggleSlider"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MusicCoreUI.VerticalToggleSlider"), CFSTR("accessibilityToggleIsOn"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MusicVocalsAttenuationSlider"), CFSTR("accessibilitySliderCurrentPercentageValue"), "f", 0);

}

- (id)accessibilityValue
{
  char v3;

  v3 = -[VocalsAttenuationSliderAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("accessibilityToggleIsOn"));
  -[VocalsAttenuationSliderAccessibility safeFloatForKey:](self, "safeFloatForKey:", CFSTR("accessibilitySliderCurrentPercentageValue"));
  if ((v3 & 1) != 0)
    AXFormatFloatWithPercentage();
  else
    accessibilityMusicLocalizedString(CFSTR("vertical.toggle.slider.off"));
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)accessibilityLabel
{
  return accessibilityMusicLocalizedString(CFSTR("vocal.volume.toggle"));
}

@end
