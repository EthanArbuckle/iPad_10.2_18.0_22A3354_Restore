@implementation NowPlayingContentViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("NowPlayingUI.NowPlayingContentView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:", CFSTR("AVPlayerViewController"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AVPlayerViewController"), CFSTR("isReadyForDisplay"), "B", 0);

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
  void *v3;

  -[NowPlayingContentViewAccessibility _accessibilityFindSubviewDescendant:](self, "_accessibilityFindSubviewDescendant:", &__block_literal_global_2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_accessibilityViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v2) = objc_msgSend(v3, "safeBoolForKey:", CFSTR("isReadyForDisplay"));
  return (char)v2;
}

uint64_t __48__NowPlayingContentViewAccessibility__axIsVideo__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  char isKindOfClass;

  objc_msgSend(a2, "_accessibilityViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x234919BBC](CFSTR("AVPlayerViewController"));
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (id)accessibilityLabel
{
  __CFString *v2;

  if (-[NowPlayingContentViewAccessibility _axIsVideo](self, "_axIsVideo"))
    v2 = CFSTR("video.artwork");
  else
    v2 = CFSTR("album.artwork");
  accessibilityLocalizedString(v2);
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
