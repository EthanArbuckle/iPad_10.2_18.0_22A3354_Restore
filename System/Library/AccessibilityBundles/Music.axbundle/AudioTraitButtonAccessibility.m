@implementation AudioTraitButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("Music.AudioTraitButton");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateSwiftEnum:", CFSTR("Music.AudioTrait"));
  objc_msgSend(v3, "validateClass:hasSwiftField:withSwiftType:", CFSTR("MusicNowPlayingControlsViewController"), CFSTR("_playingItemAudioTrait"), "Optional<AudioTrait>");

}

- (BOOL)isAccessibilityElement
{
  void *v2;
  void *v3;
  BOOL v4;

  -[AudioTraitButtonAccessibility _accessibilityLabelHelper](self, "_accessibilityLabelHelper");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "length") != 0;
  else
    v4 = 0;

  return v4;
}

- (unint64_t)accessibilityTraits
{
  int v2;
  unint64_t *v3;

  v2 = -[AudioTraitButtonAccessibility isUserInteractionEnabled](self, "isUserInteractionEnabled");
  v3 = (unint64_t *)MEMORY[0x24BDF73B0];
  if (!v2)
    v3 = (unint64_t *)MEMORY[0x24BDF73E0];
  return *v3;
}

- (id)_accessibilityLabelHelper
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  __CFString *v8;
  uint64_t v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)AudioTraitButtonAccessibility;
  -[AudioTraitButtonAccessibility accessibilityLabel](&v11, sel_accessibilityLabel);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v3, "length"))
  {
    -[AudioTraitButtonAccessibility _accessibilityFindViewAncestor:startWithSelf:](self, "_accessibilityFindViewAncestor:startWithSelf:", &__block_literal_global_8, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_accessibilityViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "safeSwiftValueForKey:", CFSTR("_playingItemAudioTrait"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "safeSwiftEnumCase");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v7, "isEqualToString:", CFSTR("dolbyAtmos")) & 1) != 0)
    {
      v8 = CFSTR("dolby.atmos");
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("dolbyAudio")) & 1) != 0)
    {
      v8 = CFSTR("dolby.audio");
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("highResolutionLossless")) & 1) != 0)
    {
      v8 = CFSTR("high.resolution.lossless");
    }
    else
    {
      v8 = CFSTR("lossless");
      if ((objc_msgSend(v7, "isEqualToString:", CFSTR("lossless")) & 1) == 0)
      {
        if (!objc_msgSend(v7, "isEqualToString:", CFSTR("appleDigitalMaster")))
        {
LABEL_12:

          return v3;
        }
        v8 = CFSTR("apple.digital.master");
      }
    }
    accessibilityOasisMusicLocalizedString(v8);
    v9 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v9;
    goto LABEL_12;
  }
  return v3;
}

uint64_t __58__AudioTraitButtonAccessibility__accessibilityLabelHelper__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  char isKindOfClass;

  objc_msgSend(a2, "_accessibilityViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x234917228](CFSTR("MusicNowPlayingControlsViewController"));
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

@end
