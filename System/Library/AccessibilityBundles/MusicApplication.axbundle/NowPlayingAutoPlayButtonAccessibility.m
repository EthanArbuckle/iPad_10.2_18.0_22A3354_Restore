@implementation NowPlayingAutoPlayButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("MusicApplication.NowPlayingAutoPlayButton");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:isKindOfClass:", CFSTR("MusicApplication.NowPlayingAutoPlayButton"), CFSTR("UIButton"));
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  return accessibilityMusicLocalizedString(CFSTR("autoplay.button"));
}

- (unint64_t)accessibilityTraits
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NowPlayingAutoPlayButtonAccessibility;
  return (*MEMORY[0x24BDF73B0] | -[NowPlayingAutoPlayButtonAccessibility accessibilityTraits](&v3, sel_accessibilityTraits)) & ~*MEMORY[0x24BDF7400];
}

- (id)accessibilityValue
{
  __CFString *v2;

  if (-[NowPlayingAutoPlayButtonAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("isSelected")))v2 = CFSTR("autoplay.on");
  else
    v2 = CFSTR("autoplay.off");
  accessibilityMusicLocalizedString(v2);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
