@implementation MusicArtworkComponentImageViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("MusicArtworkComponentImageView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  return accessibilityMusicLocalizedString(CFSTR("album.artwork"));
}

@end
