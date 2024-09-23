@implementation NowPlayingContentViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("MusicApplication.NowPlayingContentView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MusicApplication.NowPlayingContentView"), CFSTR("accessibilityPlayerVideoLayer"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AVPlayerLayer"), CFSTR("isReadyForDisplay"), "B", 0);

}

- (BOOL)isAccessibilityElement
{
  void *v2;
  char v3;

  -[NowPlayingContentViewAccessibility accessibilityIdentifier](self, "accessibilityIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("MiniPlayerArtworkNotVisible"));

  return v3 ^ 1;
}

- (BOOL)_axIsVideo
{
  void *v2;
  char v3;

  -[NowPlayingContentViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("accessibilityPlayerVideoLayer"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "safeBoolForKey:", CFSTR("isReadyForDisplay"));

  return v3;
}

- (id)accessibilityLabel
{
  __CFString *v2;

  if (-[NowPlayingContentViewAccessibility _axIsVideo](self, "_axIsVideo"))
    v2 = CFSTR("video.artwork");
  else
    v2 = CFSTR("album.artwork");
  accessibilityMusicLocalizedString(v2);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (unint64_t)accessibilityTraits
{
  unint64_t v3;
  _BOOL4 v4;
  uint64_t v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)NowPlayingContentViewAccessibility;
  v3 = -[NowPlayingContentViewAccessibility accessibilityTraits](&v7, sel_accessibilityTraits);
  v4 = -[NowPlayingContentViewAccessibility _axIsVideo](self, "_axIsVideo");
  v5 = *MEMORY[0x24BDF73C8];
  if (v4)
    v5 = 0;
  return v5 | v3;
}

@end
