@implementation NowPlayingRepeatButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("Music.NowPlayingRepeatButton");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("Music.NowPlayingRepeatButton"), CFSTR("accessibilityRepeatType"), "q", 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  return accessibilityMusicLocalizedString(CFSTR("repeat.button"));
}

- (unint64_t)accessibilityTraits
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NowPlayingRepeatButtonAccessibility;
  return (*MEMORY[0x24BDF73B0] | -[NowPlayingRepeatButtonAccessibility accessibilityTraits](&v3, sel_accessibilityTraits)) & ~*MEMORY[0x24BDF7400];
}

- (id)accessibilityValue
{
  unint64_t v2;
  void *v3;

  v2 = -[NowPlayingRepeatButtonAccessibility safeIntegerForKey:](self, "safeIntegerForKey:", CFSTR("accessibilityRepeatType"));
  if (v2 > 2)
  {
    v3 = 0;
  }
  else
  {
    accessibilityMusicLocalizedString(off_2502C2900[v2]);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

@end
