@implementation NowPlayingShuffleButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("MusicApplication.NowPlayingShuffleButton");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MusicApplication.NowPlayingShuffleButton"), CFSTR("accessibilityShuffleType"), "q", 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  return accessibilityMusicLocalizedString(CFSTR("shuffle.button"));
}

- (unint64_t)accessibilityTraits
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NowPlayingShuffleButtonAccessibility;
  return (*MEMORY[0x24BDF73B0] | -[NowPlayingShuffleButtonAccessibility accessibilityTraits](&v3, sel_accessibilityTraits)) & ~*MEMORY[0x24BDF7400];
}

- (id)accessibilityValue
{
  unint64_t v2;
  void *v3;

  v2 = -[NowPlayingShuffleButtonAccessibility safeIntegerForKey:](self, "safeIntegerForKey:", CFSTR("accessibilityShuffleType"));
  if (v2 > 2)
  {
    v3 = 0;
  }
  else
  {
    accessibilityMusicLocalizedString(off_2502C9508[v2]);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

@end
